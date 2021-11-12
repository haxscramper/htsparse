import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  AgdaNodeKind* = enum
    agdaAbstract                   ## abstract
    agdaAtom                       ## atom
    agdaAttribute                  ## attribute
    agdaAttributes                 ## attributes
    agdaBid                        ## bid
    agdaCatchallPragma             ## catchall_pragma
    agdaData                       ## data
    agdaDataName                   ## data_name
    agdaDataSignature              ## data_signature
    agdaDo                         ## do
    agdaDoWhere                    ## do_where
    agdaExpr                       ## expr
    agdaFieldAssignment            ## field_assignment
    agdaFields                     ## fields
    agdaForall                     ## forall
    agdaFunction                   ## function
    agdaFunctionName               ## function_name
    agdaGeneralize                 ## generalize
    agdaHoleName                   ## hole_name
    agdaHoleNames                  ## hole_names
    agdaImportDirective            ## import_directive
    agdaInfix                      ## infix
    agdaInstance                   ## instance
    agdaInteger                    ## integer
    agdaLambda                     ## lambda
    agdaLambdaClause               ## lambda_clause
    agdaLambdaClauseAbsurd         ## lambda_clause_absurd
    agdaLet                        ## let
    agdaLhs                        ## lhs
    agdaLiteral                    ## literal
    agdaMacro                      ## macro
    agdaModule                     ## module
    agdaModuleApplication          ## module_application
    agdaModuleAssignment           ## module_assignment
    agdaModuleMacro                ## module_macro
    agdaModuleName                 ## module_name
    agdaMutual                     ## mutual
    agdaOpen                       ## open
    agdaPattern                    ## pattern
    agdaPostulate                  ## postulate
    agdaPrimitive                  ## primitive
    agdaPrivate                    ## private
    agdaQid                        ## qid
    agdaRecord                     ## record
    agdaRecordAssignments          ## record_assignments
    agdaRecordConstructor          ## record_constructor
    agdaRecordConstructorInstance  ## record_constructor_instance
    agdaRecordDeclarationsBlock    ## record_declarations_block
    agdaRecordEta                  ## record_eta
    agdaRecordInduction            ## record_induction
    agdaRecordName                 ## record_name
    agdaRecordSignature            ## record_signature
    agdaRenaming                   ## renaming
    agdaRewriteEquations           ## rewrite_equations
    agdaRhs                        ## rhs
    agdaSignature                  ## signature
    agdaSourceFile                 ## source_file
    agdaStmt                       ## stmt
    agdaSyntax                     ## syntax
    agdaTypeSignature              ## type_signature
    agdaTypedBinding               ## typed_binding
    agdaUnquoteDecl                ## unquote_decl
    agdaUntypedBinding             ## untyped_binding
    agdaWhere                      ## where
    agdaWithExpressions            ## with_expressions
    agdaHashMinusRCurlyTok         ## #-}
    agdaLParTok                    ## (
    agdaLParPipeTok                ## (|
    agdaRParTok                    ## )
    agdaMinusTok                   ## -
    agdaDotTok                     ## .
    agdaDoubleDotTok               ## ..
    agdaColonTok                   ## :
    agdaSemicolonTok               ## ;
    agdaEqualTok                   ## =
    agdaAtTok                      ## @
    agdaCATCHALLTok                ## CATCHALL
    agdaPropTok                    ## Prop
    agdaPropN                      ## PropN
    agdaSetTok                     ## Set
    agdaSetN                       ## SetN
    agdaUnderscoreTok              ## _
    agdaAbstractTok                ## abstract
    agdaBidTok                     ## bid
    agdaCodataTok                  ## codata
    agdaCoinductiveTok             ## coinductive
    agdaComment                    ## comment
    agdaConstructorTok             ## constructor
    agdaDataTok                    ## data
    agdaDataNameTok                ## data_name
    agdaDoTok                      ## do
    agdaEtaMinusequalityTok        ## eta-equality
    agdaFieldTok                   ## field
    agdaFieldName                  ## field_name
    agdaHidingTok                  ## hiding
    agdaId                         ## id
    agdaImportTok                  ## import
    agdaInTok                      ## in
    agdaInductiveTok               ## inductive
    agdaInfixTok                   ## infix
    agdaInfixlTok                  ## infixl
    agdaInfixrTok                  ## infixr
    agdaInstanceTok                ## instance
    agdaLetTok                     ## let
    agdaMacroTok                   ## macro
    agdaModuleTok                  ## module
    agdaMutualTok                  ## mutual
    agdaNoMinusetaMinusequalityTok ## no-eta-equality
    agdaOpenTok                    ## open
    agdaOverlapTok                 ## overlap
    agdaPatternTok                 ## pattern
    agdaPostulateTok               ## postulate
    agdaPragma                     ## pragma
    agdaPrimitiveTok               ## primitive
    agdaPrivateTok                 ## private
    agdaPublicTok                  ## public
    agdaQidTok                     ## qid
    agdaQuoteTok                   ## quote
    agdaQuoteContextTok            ## quoteContext
    agdaQuoteGoalTok               ## quoteGoal
    agdaQuoteTermTok               ## quoteTerm
    agdaRecordTok                  ## record
    agdaRenamingTok                ## renaming
    agdaRewriteTok                 ## rewrite
    agdaSyntaxTok                  ## syntax
    agdaTacticTok                  ## tactic
    agdaToTok                      ## to
    agdaUnquoteTok                 ## unquote
    agdaUnquoteDeclTok             ## unquoteDecl
    agdaUnquoteDefTok              ## unquoteDef
    agdaUsingTok                   ## using
    agdaVariableTok                ## variable
    agdaWhereTok                   ## where
    agdaWithTok                    ## with
    agdaLCurlyTok                  ## {
    agdaLCurlyMinusHashTok         ## {-#
    agdaDoubleLCurlyTok            ## {{
    agdaPipeTok                    ## |
    agdaPipeRParTok                ## |)
    agdaRCurlyTok                  ## }
    agdaDoubleRCurlyTok            ## }}
    agda⦃Tok                     ## ⦃
    agda⦄Tok                     ## ⦄
    agda⦇Tok                     ## ⦇
    agda⦈Tok                     ## ⦈
    agdaSyntaxError                ## Tree-sitter parser syntax error


type
  AgdaExternalTok* = enum
    agdaExtern_newline ## _newline
    agdaExtern_indent  ## _indent
    agdaExtern_dedent  ## _dedent


type
  TsAgdaNode* = distinct TSNode


type
  AgdaParser* = distinct PtsParser


proc tsNodeType*(node: TsAgdaNode): string



proc kind*(node: TsAgdaNode): AgdaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "abstract":                    agdaAbstract
      of "atom":                        agdaAtom
      of "attribute":                   agdaAttribute
      of "attributes":                  agdaAttributes
      of "bid":                         agdaBid
      of "catchall_pragma":             agdaCatchallPragma
      of "data":                        agdaData
      of "data_name":                   agdaDataName
      of "data_signature":              agdaDataSignature
      of "do":                          agdaDo
      of "do_where":                    agdaDoWhere
      of "expr":                        agdaExpr
      of "field_assignment":            agdaFieldAssignment
      of "fields":                      agdaFields
      of "forall":                      agdaForall
      of "function":                    agdaFunction
      of "function_name":               agdaFunctionName
      of "generalize":                  agdaGeneralize
      of "hole_name":                   agdaHoleName
      of "hole_names":                  agdaHoleNames
      of "import_directive":            agdaImportDirective
      of "infix":                       agdaInfix
      of "instance":                    agdaInstance
      of "integer":                     agdaInteger
      of "lambda":                      agdaLambda
      of "lambda_clause":               agdaLambdaClause
      of "lambda_clause_absurd":        agdaLambdaClauseAbsurd
      of "let":                         agdaLet
      of "lhs":                         agdaLhs
      of "literal":                     agdaLiteral
      of "macro":                       agdaMacro
      of "module":                      agdaModule
      of "module_application":          agdaModuleApplication
      of "module_assignment":           agdaModuleAssignment
      of "module_macro":                agdaModuleMacro
      of "module_name":                 agdaModuleName
      of "mutual":                      agdaMutual
      of "open":                        agdaOpen
      of "pattern":                     agdaPattern
      of "postulate":                   agdaPostulate
      of "primitive":                   agdaPrimitive
      of "private":                     agdaPrivate
      of "qid":                         agdaQid
      of "record":                      agdaRecord
      of "record_assignments":          agdaRecordAssignments
      of "record_constructor":          agdaRecordConstructor
      of "record_constructor_instance": agdaRecordConstructorInstance
      of "record_declarations_block":   agdaRecordDeclarationsBlock
      of "record_eta":                  agdaRecordEta
      of "record_induction":            agdaRecordInduction
      of "record_name":                 agdaRecordName
      of "record_signature":            agdaRecordSignature
      of "renaming":                    agdaRenaming
      of "rewrite_equations":           agdaRewriteEquations
      of "rhs":                         agdaRhs
      of "signature":                   agdaSignature
      of "source_file":                 agdaSourceFile
      of "stmt":                        agdaStmt
      of "syntax":                      agdaSyntax
      of "type_signature":              agdaTypeSignature
      of "typed_binding":               agdaTypedBinding
      of "unquote_decl":                agdaUnquoteDecl
      of "untyped_binding":             agdaUntypedBinding
      of "where":                       agdaWhere
      of "with_expressions":            agdaWithExpressions
      of "#-}":                         agdaHashMinusRCurlyTok
      of "(":                           agdaLParTok
      of "(|":                          agdaLParPipeTok
      of ")":                           agdaRParTok
      of "-":                           agdaMinusTok
      of ".":                           agdaDotTok
      of "..":                          agdaDoubleDotTok
      of ":":                           agdaColonTok
      of ";":                           agdaSemicolonTok
      of "=":                           agdaEqualTok
      of "@":                           agdaAtTok
      of "CATCHALL":                    agdaCATCHALLTok
      of "Prop":                        agdaPropTok
      of "PropN":                       agdaPropN
      of "Set":                         agdaSetTok
      of "SetN":                        agdaSetN
      of "_":                           agdaUnderscoreTok
      of "codata":                      agdaCodataTok
      of "coinductive":                 agdaCoinductiveTok
      of "comment":                     agdaComment
      of "constructor":                 agdaConstructorTok
      of "eta-equality":                agdaEtaMinusequalityTok
      of "field":                       agdaFieldTok
      of "field_name":                  agdaFieldName
      of "hiding":                      agdaHidingTok
      of "id":                          agdaId
      of "import":                      agdaImportTok
      of "in":                          agdaInTok
      of "inductive":                   agdaInductiveTok
      of "infixl":                      agdaInfixlTok
      of "infixr":                      agdaInfixrTok
      of "no-eta-equality":             agdaNoMinusetaMinusequalityTok
      of "overlap":                     agdaOverlapTok
      of "pragma":                      agdaPragma
      of "public":                      agdaPublicTok
      of "quote":                       agdaQuoteTok
      of "quoteContext":                agdaQuoteContextTok
      of "quoteGoal":                   agdaQuoteGoalTok
      of "quoteTerm":                   agdaQuoteTermTok
      of "rewrite":                     agdaRewriteTok
      of "tactic":                      agdaTacticTok
      of "to":                          agdaToTok
      of "unquote":                     agdaUnquoteTok
      of "unquoteDecl":                 agdaUnquoteDeclTok
      of "unquoteDef":                  agdaUnquoteDefTok
      of "using":                       agdaUsingTok
      of "variable":                    agdaVariableTok
      of "with":                        agdaWithTok
      of "{":                           agdaLCurlyTok
      of "{-#":                         agdaLCurlyMinusHashTok
      of "{{":                          agdaDoubleLCurlyTok
      of "|":                           agdaPipeTok
      of "|)":                          agdaPipeRParTok
      of "}":                           agdaRCurlyTok
      of "}}":                          agdaDoubleRCurlyTok
      of "\xE2\xA6\x83":                agda⦃Tok
      of "\xE2\xA6\x84":                agda⦄Tok
      of "\xE2\xA6\x87":                agda⦇Tok
      of "\xE2\xA6\x88":                agda⦈Tok
      of "ERROR":                       agdaSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsAgdaNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsAgdaNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsAgdaNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_agda(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsAgdaNode): string =
  $ts_node_type(TSNode(node))

proc newTsAgdaParser*(): AgdaParser =
  result = AgdaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_agda())

proc parseString*(parser: AgdaParser, str: string): TsAgdaNode =
  TsAgdaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsAgdaString*(str: string): TsAgdaNode =
  let parser = newTsAgdaParser()
  return parseString(parser, str)

func `$`*(node: TsAgdaNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsAgdaNode,
    idx:  int,
    kind: AgdaNodeKind | set[AgdaNodeKind]
  ): TsAgdaNode =
  assert 0 <= idx and idx < node.len
  result = TsAgdaNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  AgdaNode* = HtsNode[TsAgdaNode, AgdaNodeKind]

proc treeReprTsAgda*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsAgdaNode, AgdaNodeKind](parseTsAgdaString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsAgdaNode,
    str:  ptr string
  ): HtsNode[TsAgdaNode, AgdaNodeKind] =
  toHtsNode[TsAgdaNode, AgdaNodeKind](node, str)

proc toHtsTree*(node: TsAgdaNode, str: ptr string): AgdaNode =
  toHtsNode[TsAgdaNode, AgdaNodeKind](node, str)

proc parseAgdaString*(str: ptr string, unnamed: bool = false): AgdaNode =
  let parser = newTsAgdaParser()
  return toHtsTree[TsAgdaNode, AgdaNodeKind](parseString(parser, str[]), str)

proc parseAgdaString*(str: string, unnamed: bool = false): AgdaNode =
  let parser = newTsAgdaParser()
  return toHtsTree[TsAgdaNode, AgdaNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


