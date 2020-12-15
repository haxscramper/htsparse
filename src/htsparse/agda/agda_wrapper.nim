
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  AgdaNodeKind* = enum
    agdaAbstract,           ## abstract
    agdaAtom,               ## atom
    agdaAttribute,          ## attribute
    agdaAttributes,         ## attributes
    agdaBid,                ## bid
    agdaCatchallPragma,     ## catchall_pragma
    agdaData,               ## data
    agdaDataName,           ## data_name
    agdaDataSignature,      ## data_signature
    agdaDo,                 ## do
    agdaDoWhere,            ## do_where
    agdaExpr,               ## expr
    agdaFieldAssignment,    ## field_assignment
    agdaFields,             ## fields
    agdaForall,             ## forall
    agdaFunction,           ## function
    agdaFunctionName,       ## function_name
    agdaGeneralize,         ## generalize
    agdaHoleName,           ## hole_name
    agdaHoleNames,          ## hole_names
    agdaImportDirective,    ## import_directive
    agdaInfix,              ## infix
    agdaInstance,           ## instance
    agdaInteger,            ## integer
    agdaLambda,             ## lambda
    agdaLambdaClause,       ## lambda_clause
    agdaLambdaClauseAbsurd, ## lambda_clause_absurd
    agdaLet,                ## let
    agdaLhs,                ## lhs
    agdaLiteral,            ## literal
    agdaMacro,              ## macro
    agdaModule,             ## module
    agdaModuleApplication,  ## module_application
    agdaModuleAssignment,   ## module_assignment
    agdaModuleMacro,        ## module_macro
    agdaModuleName,         ## module_name
    agdaMutual,             ## mutual
    agdaOpen,               ## open
    agdaPattern,            ## pattern
    agdaPostulate,          ## postulate
    agdaPrimitive,          ## primitive
    agdaPrivate,            ## private
    agdaQid,                ## qid
    agdaRecord,             ## record
    agdaRecordAssignments,  ## record_assignments
    agdaRecordConstructor,  ## record_constructor
    agdaRecordConstructorInstance, ## record_constructor_instance
    agdaRecordDeclarationsBlock, ## record_declarations_block
    agdaRecordEta,          ## record_eta
    agdaRecordInduction,    ## record_induction
    agdaRecordName,         ## record_name
    agdaRecordSignature,    ## record_signature
    agdaRenaming,           ## renaming
    agdaRewriteEquations,   ## rewrite_equations
    agdaRhs,                ## rhs
    agdaSignature,          ## signature
    agdaSourceFile,         ## source_file
    agdaStmt,               ## stmt
    agdaSyntax,             ## syntax
    agdaTypeSignature,      ## type_signature
    agdaTypedBinding,       ## typed_binding
    agdaUnquoteDecl,        ## unquote_decl
    agdaUntypedBinding,     ## untyped_binding
    agdaWhere,              ## where
    agdaWithExpressions,    ## with_expressions
    agdaHashMinusRCurlyTok, ## #-}
    agdaLParTok,            ## (
    agdaLParPipeTok,        ## (|
    agdaRParTok,            ## )
    agdaMinusTok,           ## -
    agdaDotTok,             ## .
    agdaDoubleDotTok,       ## ..
    agdaColonTok,           ## :
    agdaSemicolonTok,       ## ;
    agdaEqualTok,           ## =
    agdaAtTok,              ## @
    agdaCATCHALLTok,        ## CATCHALL
    agdaPropTok,            ## Prop
    agdaPropN,              ## PropN
    agdaSetTok,             ## Set
    agdaSetN,               ## SetN
    agdaUnderscoreTok,      ## _
    agdaAbstractTok,        ## abstract
    agdaBidTok,             ## bid
    agdaCodataTok,          ## codata
    agdaCoinductiveTok,     ## coinductive
    agdaComment,            ## comment
    agdaConstructorTok,     ## constructor
    agdaDataTok,            ## data
    agdaDataNameTok,        ## data_name
    agdaDoTok,              ## do
    agdaEtaMinusequalityTok, ## eta-equality
    agdaFieldTok,           ## field
    agdaFieldName,          ## field_name
    agdaHidingTok,          ## hiding
    agdaId,                 ## id
    agdaImportTok,          ## import
    agdaInTok,              ## in
    agdaInductiveTok,       ## inductive
    agdaInfixTok,           ## infix
    agdaInfixlTok,          ## infixl
    agdaInfixrTok,          ## infixr
    agdaInstanceTok,        ## instance
    agdaLetTok,             ## let
    agdaMacroTok,           ## macro
    agdaModuleTok,          ## module
    agdaMutualTok,          ## mutual
    agdaNoMinusetaMinusequalityTok, ## no-eta-equality
    agdaOpenTok,            ## open
    agdaOverlapTok,         ## overlap
    agdaPatternTok,         ## pattern
    agdaPostulateTok,       ## postulate
    agdaPragma,             ## pragma
    agdaPrimitiveTok,       ## primitive
    agdaPrivateTok,         ## private
    agdaPublicTok,          ## public
    agdaQidTok,             ## qid
    agdaQuoteTok,           ## quote
    agdaQuoteContextTok,    ## quoteContext
    agdaQuoteGoalTok,       ## quoteGoal
    agdaQuoteTermTok,       ## quoteTerm
    agdaRecordTok,          ## record
    agdaRenamingTok,        ## renaming
    agdaRewriteTok,         ## rewrite
    agdaSyntaxTok,          ## syntax
    agdaTacticTok,          ## tactic
    agdaToTok,              ## to
    agdaUnquoteTok,         ## unquote
    agdaUnquoteDeclTok,     ## unquoteDecl
    agdaUnquoteDefTok,      ## unquoteDef
    agdaUsingTok,           ## using
    agdaVariableTok,        ## variable
    agdaWhereTok,           ## where
    agdaWithTok,            ## with
    agdaLCurlyTok,          ## {
    agdaLCurlyMinusHashTok, ## {-#
    agdaDoubleLCurlyTok,    ## {{
    agdaPipeTok,            ## |
    agdaPipeRParTok,        ## |)
    agdaRCurlyTok,          ## }
    agdaDoubleRCurlyTok,    ## }}
    agda⦃Tok,             ## ⦃
    agda⦄Tok,             ## ⦄
    agda⦇Tok,             ## ⦇
    agda⦈Tok,             ## ⦈
    agdaSyntaxError          ## Tree-sitter parser syntax error
type
  AgdaExternalTok* = enum
    agdaExtern_newline,     ## _newline
    agdaExtern_indent,      ## _indent
    agdaExtern_dedent        ## _dedent
type
  AgdaNode* = distinct TSNode
type
  AgdaParser* = distinct PtsParser
proc tsNodeType*(node: AgdaNode): string
proc kind*(node: AgdaNode): AgdaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "abstract":
      agdaAbstract
    of "atom":
      agdaAtom
    of "attribute":
      agdaAttribute
    of "attributes":
      agdaAttributes
    of "bid":
      agdaBid
    of "catchall_pragma":
      agdaCatchallPragma
    of "data":
      agdaData
    of "data_name":
      agdaDataName
    of "data_signature":
      agdaDataSignature
    of "do":
      agdaDo
    of "do_where":
      agdaDoWhere
    of "expr":
      agdaExpr
    of "field_assignment":
      agdaFieldAssignment
    of "fields":
      agdaFields
    of "forall":
      agdaForall
    of "function":
      agdaFunction
    of "function_name":
      agdaFunctionName
    of "generalize":
      agdaGeneralize
    of "hole_name":
      agdaHoleName
    of "hole_names":
      agdaHoleNames
    of "import_directive":
      agdaImportDirective
    of "infix":
      agdaInfix
    of "instance":
      agdaInstance
    of "integer":
      agdaInteger
    of "lambda":
      agdaLambda
    of "lambda_clause":
      agdaLambdaClause
    of "lambda_clause_absurd":
      agdaLambdaClauseAbsurd
    of "let":
      agdaLet
    of "lhs":
      agdaLhs
    of "literal":
      agdaLiteral
    of "macro":
      agdaMacro
    of "module":
      agdaModule
    of "module_application":
      agdaModuleApplication
    of "module_assignment":
      agdaModuleAssignment
    of "module_macro":
      agdaModuleMacro
    of "module_name":
      agdaModuleName
    of "mutual":
      agdaMutual
    of "open":
      agdaOpen
    of "pattern":
      agdaPattern
    of "postulate":
      agdaPostulate
    of "primitive":
      agdaPrimitive
    of "private":
      agdaPrivate
    of "qid":
      agdaQid
    of "record":
      agdaRecord
    of "record_assignments":
      agdaRecordAssignments
    of "record_constructor":
      agdaRecordConstructor
    of "record_constructor_instance":
      agdaRecordConstructorInstance
    of "record_declarations_block":
      agdaRecordDeclarationsBlock
    of "record_eta":
      agdaRecordEta
    of "record_induction":
      agdaRecordInduction
    of "record_name":
      agdaRecordName
    of "record_signature":
      agdaRecordSignature
    of "renaming":
      agdaRenaming
    of "rewrite_equations":
      agdaRewriteEquations
    of "rhs":
      agdaRhs
    of "signature":
      agdaSignature
    of "source_file":
      agdaSourceFile
    of "stmt":
      agdaStmt
    of "syntax":
      agdaSyntax
    of "type_signature":
      agdaTypeSignature
    of "typed_binding":
      agdaTypedBinding
    of "unquote_decl":
      agdaUnquoteDecl
    of "untyped_binding":
      agdaUntypedBinding
    of "where":
      agdaWhere
    of "with_expressions":
      agdaWithExpressions
    of "#-}":
      agdaHashMinusRCurlyTok
    of "(":
      agdaLParTok
    of "(|":
      agdaLParPipeTok
    of ")":
      agdaRParTok
    of "-":
      agdaMinusTok
    of ".":
      agdaDotTok
    of "..":
      agdaDoubleDotTok
    of ":":
      agdaColonTok
    of ";":
      agdaSemicolonTok
    of "=":
      agdaEqualTok
    of "@":
      agdaAtTok
    of "CATCHALL":
      agdaCATCHALLTok
    of "Prop":
      agdaPropTok
    of "PropN":
      agdaPropN
    of "Set":
      agdaSetTok
    of "SetN":
      agdaSetN
    of "_":
      agdaUnderscoreTok
    of "codata":
      agdaCodataTok
    of "coinductive":
      agdaCoinductiveTok
    of "comment":
      agdaComment
    of "constructor":
      agdaConstructorTok
    of "eta-equality":
      agdaEtaMinusequalityTok
    of "field":
      agdaFieldTok
    of "field_name":
      agdaFieldName
    of "hiding":
      agdaHidingTok
    of "id":
      agdaId
    of "import":
      agdaImportTok
    of "in":
      agdaInTok
    of "inductive":
      agdaInductiveTok
    of "infixl":
      agdaInfixlTok
    of "infixr":
      agdaInfixrTok
    of "no-eta-equality":
      agdaNoMinusetaMinusequalityTok
    of "overlap":
      agdaOverlapTok
    of "pragma":
      agdaPragma
    of "public":
      agdaPublicTok
    of "quote":
      agdaQuoteTok
    of "quoteContext":
      agdaQuoteContextTok
    of "quoteGoal":
      agdaQuoteGoalTok
    of "quoteTerm":
      agdaQuoteTermTok
    of "rewrite":
      agdaRewriteTok
    of "tactic":
      agdaTacticTok
    of "to":
      agdaToTok
    of "unquote":
      agdaUnquoteTok
    of "unquoteDecl":
      agdaUnquoteDeclTok
    of "unquoteDef":
      agdaUnquoteDefTok
    of "using":
      agdaUsingTok
    of "variable":
      agdaVariableTok
    of "with":
      agdaWithTok
    of "{":
      agdaLCurlyTok
    of "{-#":
      agdaLCurlyMinusHashTok
    of "{{":
      agdaDoubleLCurlyTok
    of "|":
      agdaPipeTok
    of "|)":
      agdaPipeRParTok
    of "}":
      agdaRCurlyTok
    of "}}":
      agdaDoubleRCurlyTok
    of "⦃":
      agda⦃Tok
    of "⦄":
      agda⦄Tok
    of "⦇":
      agda⦇Tok
    of "⦈":
      agda⦈Tok
    of "ERROR":
      agdaSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_agda(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: AgdaNode): string =
  $ts_node_type(TSNode(node))

proc newAgdaParser*(): AgdaParser =
  result = AgdaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_agda())

proc parseString*(parser: AgdaParser; str: string): AgdaNode =
  AgdaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseAgdaString*(str: string): AgdaNode =
  let parser = newAgdaParser()
  return parseString(parser, str)

func `[]`*(node: AgdaNode; idx: int; withUnnamed: bool = false): AgdaNode =
  if withUnnamed:
    AgdaNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    AgdaNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: AgdaNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: AgdaNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: AgdaNode; withUnnamed: bool = false): AgdaNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: AgdaNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: AgdaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: AgdaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
