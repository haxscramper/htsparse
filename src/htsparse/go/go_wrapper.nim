
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  GoNodeKind* = enum
    goExpression,           ## _expression
    goSimpleStatement,      ## _simple_statement
    goSimpleType,           ## _simple_type
    goStatement,            ## _statement
    goType,                 ## _type
    goArgumentList,         ## argument_list
    goArrayType,            ## array_type
    goAssignmentStatement,  ## assignment_statement
    goBinaryExpression,     ## binary_expression
    goBlock,                ## block
    goBreakStatement,       ## break_statement
    goCallExpression,       ## call_expression
    goChannelType,          ## channel_type
    goCommunicationCase,    ## communication_case
    goCompositeLiteral,     ## composite_literal
    goConstDeclaration,     ## const_declaration
    goConstSpec,            ## const_spec
    goContinueStatement,    ## continue_statement
    goDecStatement,         ## dec_statement
    goDefaultCase,          ## default_case
    goDeferStatement,       ## defer_statement
    goDot,                  ## dot
    goElement,              ## element
    goEmptyStatement,       ## empty_statement
    goExpressionCase,       ## expression_case
    goExpressionList,       ## expression_list
    goExpressionSwitchStatement, ## expression_switch_statement
    goFallthroughStatement, ## fallthrough_statement
    goFieldDeclaration,     ## field_declaration
    goFieldDeclarationList, ## field_declaration_list
    goForClause,            ## for_clause
    goForStatement,         ## for_statement
    goFuncLiteral,          ## func_literal
    goFunctionDeclaration,  ## function_declaration
    goFunctionType,         ## function_type
    goGoStatement,          ## go_statement
    goGotoStatement,        ## goto_statement
    goIfStatement,          ## if_statement
    goImplicitLengthArrayType, ## implicit_length_array_type
    goImportDeclaration,    ## import_declaration
    goImportSpec,           ## import_spec
    goImportSpecList,       ## import_spec_list
    goIncStatement,         ## inc_statement
    goIndexExpression,      ## index_expression
    goInterfaceType,        ## interface_type
    goInterpretedStringLiteral, ## interpreted_string_literal
    goKeyedElement,         ## keyed_element
    goLabeledStatement,     ## labeled_statement
    goLiteralValue,         ## literal_value
    goMapType,              ## map_type
    goMethodDeclaration,    ## method_declaration
    goMethodSpec,           ## method_spec
    goMethodSpecList,       ## method_spec_list
    goPackageClause,        ## package_clause
    goParameterDeclaration, ## parameter_declaration
    goParameterList,        ## parameter_list
    goParenthesizedExpression, ## parenthesized_expression
    goParenthesizedType,    ## parenthesized_type
    goPointerType,          ## pointer_type
    goQualifiedType,        ## qualified_type
    goRangeClause,          ## range_clause
    goReceiveStatement,     ## receive_statement
    goReturnStatement,      ## return_statement
    goSelectStatement,      ## select_statement
    goSelectorExpression,   ## selector_expression
    goSendStatement,        ## send_statement
    goShortVarDeclaration,  ## short_var_declaration
    goSliceExpression,      ## slice_expression
    goSliceType,            ## slice_type
    goSourceFile,           ## source_file
    goStructType,           ## struct_type
    goTypeAlias,            ## type_alias
    goTypeAssertionExpression, ## type_assertion_expression
    goTypeCase,             ## type_case
    goTypeConversionExpression, ## type_conversion_expression
    goTypeDeclaration,      ## type_declaration
    goTypeSpec,             ## type_spec
    goTypeSwitchStatement,  ## type_switch_statement
    goUnaryExpression,      ## unary_expression
    goVarDeclaration,       ## var_declaration
    goVarSpec,              ## var_spec
    goVariadicArgument,     ## variadic_argument
    goVariadicParameterDeclaration, ## variadic_parameter_declaration
    goSingleNewlineTok,     ## 
                             ## 
    goSingleExclamationTok, ## !
    goSingleExclamationSingleEqualTok, ## !=
    goSingleQuoteTok,       ## "
    goSinglePercentTok,     ## %
    goSinglePercentSingleEqualTok, ## %=
    goSingleAmpersandTok,   ## &
    goDoubleAmpersandTok,   ## &&
    goSingleAmpersandSingleEqualTok, ## &=
    goSingleAmpersandSingleAccentTok, ## &^
    goSingleAmpersandSingleAccentSingleEqualTok, ## &^=
    goSingleLParTok,        ## (
    goSingleRParTok,        ## )
    goSingleAsteriskTok,    ## *
    goSingleAsteriskSingleEqualTok, ## *=
    goSinglePlusTok,        ## +
    goDoublePlusTok,        ## ++
    goSinglePlusSingleEqualTok, ## +=
    goSingleCommaTok,       ## ,
    goSingleMinusTok,       ## -
    goDoubleMinusTok,       ## --
    goSingleMinusSingleEqualTok, ## -=
    goSingleDotTok,         ## .
    goTripleDotTok,         ## ...
    goSingleSlashTok,       ## /
    goSingleSlashSingleEqualTok, ## /=
    goSingleColonTok,       ## :
    goSingleColonSingleEqualTok, ## :=
    goSingleSemicolonTok,   ## ;
    goSingleLessThanTok,    ## <
    goSingleLessThanSingleMinusTok, ## <-
    goDoubleLessThanTok,    ## <<
    goDoubleLessThanSingleEqualTok, ## <<=
    goSingleLessThanSingleEqualTok, ## <=
    goSingleEqualTok,       ## =
    goDoubleEqualTok,       ## ==
    goSingleGreaterThanTok, ## >
    goSingleGreaterThanSingleEqualTok, ## >=
    goDoubleGreaterThanTok, ## >>
    goDoubleGreaterThanSingleEqualTok, ## >>=
    goSingleLBrackTok,      ## [
    goSingleRBrackTok,      ## ]
    goSingleAccentTok,      ## ^
    goSingleAccentSingleEqualTok, ## ^=
    goBlankIdentifier,      ## blank_identifier
    goBreakTok,             ## break
    goCaseTok,              ## case
    goChanTok,              ## chan
    goComment,              ## comment
    goConstTok,             ## const
    goContinueTok,          ## continue
    goDefaultTok,           ## default
    goDeferTok,             ## defer
    goElseTok,              ## else
    goEscapeSequence,       ## escape_sequence
    goFallthroughTok,       ## fallthrough
    goFalse,                ## false
    goFieldIdentifier,      ## field_identifier
    goFloatLiteral,         ## float_literal
    goForTok,               ## for
    goFuncTok,              ## func
    goGoTok,                ## go
    goGotoTok,              ## goto
    goIdentifier,           ## identifier
    goIfTok,                ## if
    goImaginaryLiteral,     ## imaginary_literal
    goImportTok,            ## import
    goIntLiteral,           ## int_literal
    goInterfaceTok,         ## interface
    goLabelName,            ## label_name
    goMapTok,               ## map
    goNil,                  ## nil
    goPackageTok,           ## package
    goPackageIdentifier,    ## package_identifier
    goRangeTok,             ## range
    goRawStringLiteral,     ## raw_string_literal
    goReturnTok,            ## return
    goRuneLiteral,          ## rune_literal
    goSelectTok,            ## select
    goStructTok,            ## struct
    goSwitchTok,            ## switch
    goTrue,                 ## true
    goTypeTok,              ## type
    goTypeIdentifier,       ## type_identifier
    goVarTok,               ## var
    goSingleLCurlyTok,      ## {
    goSinglePipeTok,        ## |
    goSinglePipeSingleEqualTok, ## |=
    goDoublePipeTok,        ## ||
    goSingleRCurlyTok,      ## }
    goSyntaxError            ## Tree-sitter parser syntax error
type
  GoNode* = distinct TSNode
type
  GoParser* = distinct PtsParser
proc tsNodeType*(node: GoNode): string
proc kind*(node: GoNode): GoNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_expression":
      goExpression
    of "_simple_statement":
      goSimpleStatement
    of "_simple_type":
      goSimpleType
    of "_statement":
      goStatement
    of "_type":
      goType
    of "argument_list":
      goArgumentList
    of "array_type":
      goArrayType
    of "assignment_statement":
      goAssignmentStatement
    of "binary_expression":
      goBinaryExpression
    of "block":
      goBlock
    of "break_statement":
      goBreakStatement
    of "call_expression":
      goCallExpression
    of "channel_type":
      goChannelType
    of "communication_case":
      goCommunicationCase
    of "composite_literal":
      goCompositeLiteral
    of "const_declaration":
      goConstDeclaration
    of "const_spec":
      goConstSpec
    of "continue_statement":
      goContinueStatement
    of "dec_statement":
      goDecStatement
    of "default_case":
      goDefaultCase
    of "defer_statement":
      goDeferStatement
    of "dot":
      goDot
    of "element":
      goElement
    of "empty_statement":
      goEmptyStatement
    of "expression_case":
      goExpressionCase
    of "expression_list":
      goExpressionList
    of "expression_switch_statement":
      goExpressionSwitchStatement
    of "fallthrough_statement":
      goFallthroughStatement
    of "field_declaration":
      goFieldDeclaration
    of "field_declaration_list":
      goFieldDeclarationList
    of "for_clause":
      goForClause
    of "for_statement":
      goForStatement
    of "func_literal":
      goFuncLiteral
    of "function_declaration":
      goFunctionDeclaration
    of "function_type":
      goFunctionType
    of "go_statement":
      goGoStatement
    of "goto_statement":
      goGotoStatement
    of "if_statement":
      goIfStatement
    of "implicit_length_array_type":
      goImplicitLengthArrayType
    of "import_declaration":
      goImportDeclaration
    of "import_spec":
      goImportSpec
    of "import_spec_list":
      goImportSpecList
    of "inc_statement":
      goIncStatement
    of "index_expression":
      goIndexExpression
    of "interface_type":
      goInterfaceType
    of "interpreted_string_literal":
      goInterpretedStringLiteral
    of "keyed_element":
      goKeyedElement
    of "labeled_statement":
      goLabeledStatement
    of "literal_value":
      goLiteralValue
    of "map_type":
      goMapType
    of "method_declaration":
      goMethodDeclaration
    of "method_spec":
      goMethodSpec
    of "method_spec_list":
      goMethodSpecList
    of "package_clause":
      goPackageClause
    of "parameter_declaration":
      goParameterDeclaration
    of "parameter_list":
      goParameterList
    of "parenthesized_expression":
      goParenthesizedExpression
    of "parenthesized_type":
      goParenthesizedType
    of "pointer_type":
      goPointerType
    of "qualified_type":
      goQualifiedType
    of "range_clause":
      goRangeClause
    of "receive_statement":
      goReceiveStatement
    of "return_statement":
      goReturnStatement
    of "select_statement":
      goSelectStatement
    of "selector_expression":
      goSelectorExpression
    of "send_statement":
      goSendStatement
    of "short_var_declaration":
      goShortVarDeclaration
    of "slice_expression":
      goSliceExpression
    of "slice_type":
      goSliceType
    of "source_file":
      goSourceFile
    of "struct_type":
      goStructType
    of "type_alias":
      goTypeAlias
    of "type_assertion_expression":
      goTypeAssertionExpression
    of "type_case":
      goTypeCase
    of "type_conversion_expression":
      goTypeConversionExpression
    of "type_declaration":
      goTypeDeclaration
    of "type_spec":
      goTypeSpec
    of "type_switch_statement":
      goTypeSwitchStatement
    of "unary_expression":
      goUnaryExpression
    of "var_declaration":
      goVarDeclaration
    of "var_spec":
      goVarSpec
    of "variadic_argument":
      goVariadicArgument
    of "variadic_parameter_declaration":
      goVariadicParameterDeclaration
    of "\n":
      goSingleNewlineTok
    of "!":
      goSingleExclamationTok
    of "!=":
      goSingleExclamationSingleEqualTok
    of "\"":
      goSingleQuoteTok
    of "%":
      goSinglePercentTok
    of "%=":
      goSinglePercentSingleEqualTok
    of "&":
      goSingleAmpersandTok
    of "&&":
      goDoubleAmpersandTok
    of "&=":
      goSingleAmpersandSingleEqualTok
    of "&^":
      goSingleAmpersandSingleAccentTok
    of "&^=":
      goSingleAmpersandSingleAccentSingleEqualTok
    of "(":
      goSingleLParTok
    of ")":
      goSingleRParTok
    of "*":
      goSingleAsteriskTok
    of "*=":
      goSingleAsteriskSingleEqualTok
    of "+":
      goSinglePlusTok
    of "++":
      goDoublePlusTok
    of "+=":
      goSinglePlusSingleEqualTok
    of ",":
      goSingleCommaTok
    of "-":
      goSingleMinusTok
    of "--":
      goDoubleMinusTok
    of "-=":
      goSingleMinusSingleEqualTok
    of ".":
      goSingleDotTok
    of "...":
      goTripleDotTok
    of "/":
      goSingleSlashTok
    of "/=":
      goSingleSlashSingleEqualTok
    of ":":
      goSingleColonTok
    of ":=":
      goSingleColonSingleEqualTok
    of ";":
      goSingleSemicolonTok
    of "<":
      goSingleLessThanTok
    of "<-":
      goSingleLessThanSingleMinusTok
    of "<<":
      goDoubleLessThanTok
    of "<<=":
      goDoubleLessThanSingleEqualTok
    of "<=":
      goSingleLessThanSingleEqualTok
    of "=":
      goSingleEqualTok
    of "==":
      goDoubleEqualTok
    of ">":
      goSingleGreaterThanTok
    of ">=":
      goSingleGreaterThanSingleEqualTok
    of ">>":
      goDoubleGreaterThanTok
    of ">>=":
      goDoubleGreaterThanSingleEqualTok
    of "[":
      goSingleLBrackTok
    of "]":
      goSingleRBrackTok
    of "^":
      goSingleAccentTok
    of "^=":
      goSingleAccentSingleEqualTok
    of "blank_identifier":
      goBlankIdentifier
    of "break":
      goBreakTok
    of "case":
      goCaseTok
    of "chan":
      goChanTok
    of "comment":
      goComment
    of "const":
      goConstTok
    of "continue":
      goContinueTok
    of "default":
      goDefaultTok
    of "defer":
      goDeferTok
    of "else":
      goElseTok
    of "escape_sequence":
      goEscapeSequence
    of "fallthrough":
      goFallthroughTok
    of "false":
      goFalse
    of "field_identifier":
      goFieldIdentifier
    of "float_literal":
      goFloatLiteral
    of "for":
      goForTok
    of "func":
      goFuncTok
    of "go":
      goGoTok
    of "goto":
      goGotoTok
    of "identifier":
      goIdentifier
    of "if":
      goIfTok
    of "imaginary_literal":
      goImaginaryLiteral
    of "import":
      goImportTok
    of "int_literal":
      goIntLiteral
    of "interface":
      goInterfaceTok
    of "label_name":
      goLabelName
    of "map":
      goMapTok
    of "nil":
      goNil
    of "package":
      goPackageTok
    of "package_identifier":
      goPackageIdentifier
    of "range":
      goRangeTok
    of "raw_string_literal":
      goRawStringLiteral
    of "return":
      goReturnTok
    of "rune_literal":
      goRuneLiteral
    of "select":
      goSelectTok
    of "struct":
      goStructTok
    of "switch":
      goSwitchTok
    of "true":
      goTrue
    of "type":
      goTypeTok
    of "type_identifier":
      goTypeIdentifier
    of "var":
      goVarTok
    of "{":
      goSingleLCurlyTok
    of "|":
      goSinglePipeTok
    of "|=":
      goSinglePipeSingleEqualTok
    of "||":
      goDoublePipeTok
    of "}":
      goSingleRCurlyTok
    of "ERROR":
      goSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_go(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: GoNode): string =
  $ts_node_type(TSNode(node))

proc newGoParser*(): GoParser =
  result = GoParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_go())

proc parseString*(parser: GoParser; str: string): GoNode =
  GoNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: GoNode; idx: int; withUnnamed: bool = false): GoNode =
  if withUnnamed:
    GoNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    GoNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: GoNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: GoNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: GoNode; withUnnamed: bool = false): GoNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: GoNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: GoNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: GoNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[2 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
