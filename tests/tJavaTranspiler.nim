import
  htsparse/java/java,
  hmisc/other/oswrap,
  hmisc/algo/[namegen, htemplates, hseq_mapping],
  hmisc/wrappers/treesitter,
  hmisc/hdebug_misc,
  hnimast

import
  std/[sequtils, strutils, options, sugar,
       strformat, tables, sets]

proc `=~`(
  node: PNode,
  check: tuple[kind: TNodeKind, strVals: seq[string]]): bool =

  node.kind == check.kind and node.getStrVal() in check.strVals

proc `=~`(node: PNode, kind: TNodeKind): bool =
  node.kind == kind

proc `=~`[R](nodes: seq[PNode], kinds: array[R, TNodeKind]): bool =
  for (node, kind) in zip(nodes, kinds):
    if node.kind != kind:
      return false

  return true



proc convTypeName(name: string): string =
  case name:
    of "ArrayList", "List", "LinkedList", "Collection": "seq"
    of "Integer": "int"
    of "String": "string"
    of "Map": "Table"
    of "Set": "HashSet"
    of "Object": "ref object"
    else: name

proc convIdentName(name: string): string =
  if name.isReservedNimWord():
    "j" & name

  else:
    name

proc convertProcName(name: string): string =
  case name:
    of "&&": "and"
    of "||": "or"
    of "!": "not"
    else: name

proc toNType(node: JavaNode, str: string): PNtype =
  case node.kind:
    of javaIdentifier, javaTypeIdentifier, javaSuper:
      result = newPType(convTypeName($node))

    of javaGenericType:
      result = newPType(convTypeName($node[0]))
      for arg in node[1]:
        result.add toNType(arg, str)

    of javaPrimitiveTypes:
      result = newPType(
        case node.kind:
          of javaIntegralType: "int"
          of javaFloatingPointType: "float"
          of javaVoidType: "void"
          of javaBooleanType: "bool"
          else:
            raise newUnexpectedKindError(node)
      )

    of javaArrayType:
      let
        size = $node["dimensions"]
        element: PNType = toNType(node["element"], str)


      if size == "[]":
        result = newPType("seq", [element])

      elif size == "[][]":
        result = newPType("seq", [newPType("seq", [element])])

      elif size == "[][][]":
        result = newPType(
          "seq", [newPType(
            "seq", [newPType(
              "seq", [
                element])])])

      else:
        raise newImplementError(size)

    of javaWildcard:
      result = newPType("`?`")

    of javaScopedTypeIdentifier:
      result = toNType(node[1], str)

    else:
      raise newImplementKindError(node, node.treeRepr(str, pathIndexed = true))

proc procBody(node: JavaNode): JavaNode =
  if node[4].kind == javaThrows:
    node[5]

  else:
    node[4]

proc conv(
    node: JavaNode, str: string,
    parent: Option[PNType] = none(PNType)
  ): PNode =

  template conv(expr: JavaNode, idx: int): untyped = conv(expr[idx], str)
  template conv(expr: JavaNode): untyped = conv(expr, str)
  template `~`(expr: JavaNode): untyped = conv(expr, str)

  case node.kind:
    of javaComment, javaPackageDeclaration, javaImportDeclaration:
      result = newEmptyPNode()

    of javaEnumDeclaration,
       javaWildcard,
       javaAnnotationTypeDeclaration,
       javaStaticInitializer
         :
      result = newEmptyPNode()

    of javaIdentifier, javaThis:
      result = newPident(convIdentName($node))

    of javaFalse:
      result = newPIdent("false")

    of javaTrue:
      result = newPIdent("true")

    of javaPrimitiveTypes, javaTypeIdentifier, javaSuper:
      result = toNType(node, str).toNNode()

    of javaProgram, javaBlock, javaConstructorBody:
      result = newPStmtList()
      for sub in items(node):
        result.add conv(sub, str)

    of javaClassDeclaration, javaInterfaceDeclaration:
      var
        res = newPObjectDecl($node["name"])
        tmp = newPStmtList()

      for entry in node["body"]:
        case entry.kind:
          of javaFieldDeclaration:
            res.addField newObjectField(
              $entry["declarator"][0],
              toNType(entry["type"], str),
              value = if entry.has(2) and entry[2].has(1):
                        some conv(entry[2][1], str)

                      else:
                        none(PNode)
            )

          of javaConstantDeclaration:
            discard

          else:
            tmp.add conv(entry, str, some res.name)

      res.isRef = true
      result = newPStmtList()
      result.add toNNode(res, standalone = true)
      result.add tmp

    of javaMethodDeclaration:
      if node[0].kind == javaModifiers and "abstract" in $node[0]:
        result = newPStmtList()

      else:
        var decl = newPProcDecl(
          name = $node["name"],
          impl = tern(
            node.has(4),
            node.procBody().conv(str).fixEmptyStmt(),
            newEmptyPNode().fixEmptyStmt()
          ),
          returnType = some node["type"].toNType(str))

        if parent.isSome():
          decl.addArgument("this", parent.get())

        if node.has("parameters"):
          for it in node["parameters"]:
            decl.addArgument convIdentName($it[1]), it[0].toNType(str)

        result = decl.toNNode()

    of javaConstructorDeclaration:
      assert parent.isSome()
      if node["parameters"].findIt(
        it.kind == javaSpreadParameter) != -1:
        result = newEmptyPNode()

      else:
        var decl = newPProcDecl(
          name = "new" & $node["name"],
          args = node["parameters"].mapIt(($it[1], it["type"].toNType(str))),
          impl = node["body"].conv(str).fixEmptyStmt(),
          returnType = parent
        )

        result = decl.toNNode()


    of javaLocalVariableDeclaration:
      let vartype = toNType(node[0], str)
      result = newPStmtList()
      for decl in node[1 ..^ 1]:
        assertKind(decl, javaVariableDeclarator)
        result.add newVar(
          $decl[0, javaIdentifier], vartype,
          if decl.has(1): ~decl[1] else: newEmptyPNode())


    of javaObjectCreationExpression:
      case node[0].kind:
        of javaIdentifier, javaTypeIdentifier:
          result = newPCall("new" & convTypeName($node[0]))

        of javaGenericType:
          let
            args = node[0][1, {javaTypeArguments}].mapIt(conv(it, str))
            init = newPident(
              "new" & convTypeName($node[
                0, {javaGenericType}][
                  0, {javaTypeIdentifier}]).
                    capitalizeAscii())

          if args.len == 0:
            result = newXCall(init)

          else:
            result = newXCall newBracketExpr(init, args)

        of javaScopedTypeIdentifier:
          result = newPCall("new" & node[0].mapIt(conv(it, str)).join(""))

        else:
          raise newImplementError(node.treeRepr(str))

      for arg in node[1]:
        result.add ~arg



    of javaDecimalFloatingPointLiteral:
      result = parseFloat(str[node][0 .. ^2]).newPLit()

    of javaDecimalIntegerLiteral:
      result = parseInt($node).newPLit()

    of javaCharacterLiteral:
      result = newPLit():
        case str[node]:
          of r"'\n'": '\n'
          else: str[node][1]

    of javaNullLiteral:
      result = newPIdent("nil")

    of javaStringLiteral:
      result = newPLit(str[node])

    of javaExpressionStatement:
      assert node.len == 1
      result = ~node[0]

    of javaMethodInvocation,
       javaExplicitConstructorInvocation:
      if node.has("object"):
        let name = str[node["name"]]

        const renameTable = toTable {
          "indexOf": "find",
          "size": "len",
          "addAll": "add",
          "containsKey": "contains"
        }

        const importDrop = toHashSet [
          "Integer",
          "Arrays",
          "Math",
          "TreeUtils"
        ]

        let log = "NO_LABEL" in str[node]

        var convert = true
        case name:
          of "get": result = newPCall("[]", ~node[0])
          of "put":
            result = newPCall("[]=", ~node[0], ~node[2][0], ~node[2][1])
            convert = false

          of "equals":
            result = newPCall("==", ~node[0], ~node[2][0])
            convert = false

          elif name in renameTable:
            result = newXCall(newDot(~node[0], renameTable[name]))

          elif node[0].kind in { javaIdentifier } and
               str[node[0]] in importDrop:
            result = newXCall(~node[1])

          else:
            result = newXCall(newDot(~node[0], ~node[1]))


        if convert:
          for arg in node[2]:
            result.add ~arg

      else:
        result = newPCall(str[node[0]])
        for arg in node[1]:
          result.add ~arg

    of javaThrowStatement:
      result = newRaise(~node[0])

    of javaEnhancedForStatement:
      result = nnkForStmt.newPTree(~node[1], ~node[2], ~node[3])

    of javaForStatement:
      let update =
        if node.has("update"):
          ~node["update"]
        else:
          newEmptyPNode()

      result = newBlock(
        ~node["init"],
        newWhile(~node["condition"], ~node["body"], update))

    of javaWhileStatement:
      result = newWhile(newPar ~node["condition"], ~node["body"])

    of javaParenthesizedExpression:
      assert node.len() == 1
      if node[0].kind == javaAssignmentExpression:
        let
          asgn = node[0]
          name = str[asgn[0, {javaIdentifier}]]

        result = newPar newPar newBlock(
          newVar(name, newEmptyPNode(), ~asgn[1]),
          newPIdent(name))

      else:
        result = node.conv(0)

    of javaAssignmentExpression:
      result = newPCall($node{1}, ~node[0], ~node[1])

    of javaInstanceofExpression:
      result = newPcall("of", ~node[0], ~node[1])

    of javaFieldAccess:
      if node[1].kind in {javaIdentifier}:
        let field = str[node[1]]
        case field:
          of "length": result = newDot(~node[0], "len")

          else:
            result = newDot(~node[0], ~node[1])

      else:
        result = newDot(~node[0], ~node[1])

    of javaArrayAccess:
      result = newPCall("[]", ~node[0], ~node[1])

    of javaBinaryExpression:
      result = newPCall(
        str[node{1}].convertProcName(),
        ~node{0},
        ~node{2})

    of javaUnaryExpression:
      result = newPCall(
        str[node{0}].convertProcName(), ~node{1})

    of javaReturnStatement:
      result = newReturn(
        if node.has(0): ~node[0] else: newEmptyPNode())


    of javaArrayCreationExpression:
      case str[node["dimensions"]]:
        of "[]":
          result = nnkBracket.newTree():
            collect(newSeq):
              for sub in node[2]:
                conv(sub, str)

        else:
          result = newPCall(
            "newSeqWith",
            ~node[1][0],
            newPCall("default", ~node[0]))

    of javaCastExpression:
      result = nnkCast.newPTree(~node[0], ~node[1])

    of javaArrayInitializer:
      result = nnkBracket.newPTree()
      for sub in node:
        result.add conv(sub, str)

    of javaTernaryExpression:
      result = newPCall("tern", ~node[0], ~node[1], ~node[2])
      # result = newPar newPar newIfStmt()

    of javaClassLiteral:
      result = toNType(node[0], str).toNNode()

    of javaUpdateExpression:
      let (opIdx, exprIdx, post) =
        if node{0}.kind in {javaDoublePlusTok, javaDoubleMinusTok}:
          (0, 1, false)

        else:
          (1, 0, true)

      result = newPCall(
        case str[node{opIdx}]:
          of "++": (if post: "postInc" else: "preInc")
          of "--": (if post: "postDec" else: "preDec")
          else: raise newUnexpectedKindError(
            str[node{opIdx}] & node.treeRepr(str, unnamed = true)),
        conv(node{exprIdx}, str))

    of javaIfStatement:
      result = newIfPStmt()
      case node.len:
        of 3:
          result.addBranch(newPar ~node[0], ~node[1])
          result.addBranch(~node[2])

        of 2:
          result.addBranch(newPar ~node[0], ~node[1])

        else:
          raise newImplementError(
            str[node] & "\n" & node.treeRepr(str, indexed = true))


    of javaCatchFormalParameter:
      result = newPCall(
        "as", conv(node[0, {javaCatchType}][0], str), ~node[1])

    of javaTryStatement:
      result = newTry(conv(node[0], str))
      for branch in node[1 .. ^1]:
        case branch.len:
          of 2:
            result.addBranch(
              conv(branch[0], str),
              conv(branch[1], str))

          else:
            raise newImplementError(branch.treeRepr(str))



    of javaSwitchExpression:
      result = newCase(conv(node[0], str))
      for label in node[1]:
        var sub: seq[PNode]
        for stmt in label[1 .. ^1]:
          sub.add conv(stmt, str)

        if label[0].len == 0:
          result.addBranch(sub)

        else:
          result.addBranch(
            conv(label[0, {javaSwitchLabel}][0], str),
            sub)

    of javaLambdaExpression:
      var decl = newPProcDecl(
        "", impl = conv(node[1], str), kind = pkLambda)

      if node[0].kind == javaIdentifier:
        decl.addArgument str[node[0]], newPType("auto")

      else:
        for arg in node[0]:
          decl.addArgument str[arg], newPType("auto")

      result = decl.toNNode()


    of javaBreakStatement:
      result = newPBreak()

    of javaMethodReference:
      result = newPIdent(str[node])

    else:
      echo node.treeRepr()
      raise newImplementKindError(
        node, "\n" & str[node], node.treeRepr(
          str, pathIndexed = true, maxDepth = 5,
          unnamed = false))




startHax()

for file in walkDir(cwd(), AbsFile, exts = @["java"], recurse = true):
  if file.name in [
    "Diff",
    "CompleteBottomUpMatcher",
    "Tree", "TreeContext",
    "AbstractBottomUpMatcher",
    "MappingStore",
    "EditScript",
    "SimplifiedChawatheScriptGenerator",
    "EditScriptGeneration",
    "InsertDeleteChawatheScriptGenerator",
    "ChawatheScriptGenerator",

    "Move", "Delete", "Update", "Addition", "Insert",
    "TreeInsert", "TreeAddition", "TreeDelete", "TreeAction", "Action",
    "TreeMetrics",
    "LcsMatcher",
    "FakeTree",
    "RtedMatcher",
    "RtedAlgorithm",
    "InfoTree",
    "LabelDictionary",
    "GreedyBottomUpMatcher",
    "CompleteBottomUpMatcher",
    "ZsMatcher",
    "SimilarityMetrics",
    "TreeMetricComputer",
    "TreeVisitor",
    "AbstractSubtreeMatcher",
    "CliqueSubtreeMatcher",
    "GreedySubtreeMatcher",
    "HungarianSubtreeMatcher",
    "MultiMappingStore",
    "PriorityTreeQueue",
    "DefaultPriorityTreeQueue",
    "CliqueSubtreeMatcher",
    "MappingComparators",
    "HungarianAlgorithm",
    "CompositeMatchers"
  ]:
    echo file

    var str = file.readFile()
    let code = parseJavaString(addr str).conv(str).`$`
    getAppTempFile("outcode.nim").writeFile(
      &"# {file}\n" & code)

    mkDir getAppTempDir() / "gen"
    writeFile(getAppTempDir() / "gen" /. file.name &. "nim", code)

    try:
      discard code.parsePnodeStr(doRaise = true)

    except NimParseError:
      discard
