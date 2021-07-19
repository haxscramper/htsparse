
import
  hmisc / wrappers / treesitter

import
  strutils

type
  JuliaNodeKind* = enum
    juliaDefinition,        ## _definition
    juliaExpression,        ## _expression
    juliaStatement,         ## _statement
    juliaAbstractDefinition, ## abstract_definition
    juliaArgumentList,      ## argument_list
    juliaArrayComprehensionExpression, ## array_comprehension_expression
    juliaArrayExpression,   ## array_expression
    juliaAssignmentExpression, ## assignment_expression
    juliaBareTupleExpression, ## bare_tuple_expression
    juliaBinaryExpression,  ## binary_expression
    juliaBroadcastCallExpression, ## broadcast_call_expression
    juliaCallExpression,    ## call_expression
    juliaCatchClause,       ## catch_clause
    juliaCoefficientExpression, ## coefficient_expression
    juliaCompoundExpression, ## compound_expression
    juliaConstStatement,    ## const_statement
    juliaConstrainedParameter, ## constrained_parameter
    juliaDoClause,          ## do_clause
    juliaElseClause,        ## else_clause
    juliaElseifClause,      ## elseif_clause
    juliaExportStatement,   ## export_statement
    juliaFieldExpression,   ## field_expression
    juliaFinallyClause,     ## finally_clause
    juliaForBinding,        ## for_binding
    juliaForClause,         ## for_clause
    juliaForStatement,      ## for_statement
    juliaFunctionDefinition, ## function_definition
    juliaFunctionExpression, ## function_expression
    juliaGeneratorExpression, ## generator_expression
    juliaIfClause,          ## if_clause
    juliaIfStatement,       ## if_statement
    juliaImportStatement,   ## import_statement
    juliaInterpolationExpression, ## interpolation_expression
    juliaKeywordParameters, ## keyword_parameters
    juliaLetStatement,      ## let_statement
    juliaMacroArgumentList, ## macro_argument_list
    juliaMacroDefinition,   ## macro_definition
    juliaMacroExpression,   ## macro_expression
    juliaMacroIdentifier,   ## macro_identifier
    juliaMatrixExpression,  ## matrix_expression
    juliaMatrixRow,         ## matrix_row
    juliaModuleDefinition,  ## module_definition
    juliaNamedArgument,     ## named_argument
    juliaNamedField,        ## named_field
    juliaOperator,          ## operator
    juliaOptionalParameter, ## optional_parameter
    juliaPairExpression,    ## pair_expression
    juliaParameterList,     ## parameter_list
    juliaParameterizedIdentifier, ## parameterized_identifier
    juliaParenthesizedExpression, ## parenthesized_expression
    juliaPrimitiveDefinition, ## primitive_definition
    juliaQuoteExpression,   ## quote_expression
    juliaQuoteStatement,    ## quote_statement
    juliaRangeExpression,   ## range_expression
    juliaReturnStatement,   ## return_statement
    juliaScopedIdentifier,  ## scoped_identifier
    juliaSelectedImport,    ## selected_import
    juliaSourceFile,        ## source_file
    juliaSpreadExpression,  ## spread_expression
    juliaSpreadParameter,   ## spread_parameter
    juliaString,            ## string
    juliaStructDefinition,  ## struct_definition
    juliaSubscriptExpression, ## subscript_expression
    juliaSubtypeClause,     ## subtype_clause
    juliaTernaryExpression, ## ternary_expression
    juliaTryStatement,      ## try_statement
    juliaTupleExpression,   ## tuple_expression
    juliaTypeArgumentList,  ## type_argument_list
    juliaTypeParameterList, ## type_parameter_list
    juliaTypedExpression,   ## typed_expression
    juliaTypedParameter,    ## typed_parameter
    juliaUnaryExpression,   ## unary_expression
    juliaVariableDeclaration, ## variable_declaration
    juliaWhileStatement,    ## while_statement
    juliaNewlineTok,        ## 
                             ## 
    juliaExclamationTok,    ## !
    juliaQuoteTok,          ## "
    juliaDollarTok,         ## $
    juliaDoubleAmpersandTok, ## &&
    juliaApostropheTok,     ## '
    juliaLParTok,           ## (
    juliaRParTok,           ## )
    juliaPlusTok,           ## +
    juliaCommaTok,          ## ,
    juliaMinusTok,          ## -
    juliaMinusGreaterThanTok, ## ->
    juliaDotTok,            ## .
    juliaDotApostropheTok,  ## .'
    juliaTripleDotTok,      ## ...
    juliaColonTok,          ## :
    juliaDoubleColonTok,    ## ::
    juliaSemicolonTok,      ## ;
    juliaLessThanColonTok,  ## <:
    juliaLessThanPipeTok,   ## <|
    juliaEqualTok,          ## =
    juliaEqualGreaterThanTok, ## =>
    juliaGreaterThanColonTok, ## >:
    juliaQuestionTok,       ## ?
    juliaAtTok,             ## @
    juliaLBrackTok,         ## [
    juliaRBrackTok,         ## ]
    juliaAbstractTok,       ## abstract
    juliaBeginTok,          ## begin
    juliaBlockComment,      ## block_comment
    juliaBreakStatement,    ## break_statement
    juliaCatchTok,          ## catch
    juliaCharacter,         ## character
    juliaCommandString,     ## command_string
    juliaComment,           ## comment
    juliaConstTok,          ## const
    juliaContinueStatement, ## continue_statement
    juliaDoTok,             ## do
    juliaElseTok,           ## else
    juliaElseifTok,         ## elseif
    juliaEndTok,            ## end
    juliaExportTok,         ## export
    juliaFinallyTok,        ## finally
    juliaForTok,            ## for
    juliaFunctionTok,       ## function
    juliaIdentifier,        ## identifier
    juliaIfTok,             ## if
    juliaImportTok,         ## import
    juliaInTok,             ## in
    juliaIsaTok,            ## isa
    juliaLetTok,            ## let
    juliaMacroTok,          ## macro
    juliaModuleTok,         ## module
    juliaMutableTok,        ## mutable
    juliaNumber,            ## number
    juliaPrimitiveTok,      ## primitive
    juliaReturnTok,         ## return
    juliaStructTok,         ## struct
    juliaTripleString,      ## triple_string
    juliaTryTok,            ## try
    juliaTypeTok,           ## type
    juliaUsingTok,          ## using
    juliaWhileTok,          ## while
    juliaLCurlyTok,         ## {
    juliaPipeGreaterThanTok, ## |>
    juliaDoublePipeTok,     ## ||
    juliaRCurlyTok,         ## }
    juliaTildeTok,          ## ~
    julia¬Tok,             ## ¬
    julia�Double�Tok,       ## ∈
    julia√Tok,            ## √
    julia∛Tok,            ## ∛
    julia∜Tok,            ## ∜
    juliaSyntaxError         ## Tree-sitter parser syntax error
type
  JuliaExternalTok* = enum
    juliaExternBlock_comment, ## block_comment
    juliaExternTriple_string, ## triple_string
    juliaExtern_immediate_paren ## _immediate_paren
type
  JuliaNode* = distinct TSNode
type
  JuliaParser* = distinct PtsParser
proc tsNodeType*(node: JuliaNode): string
proc kind*(node: JuliaNode): JuliaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_definition":
      juliaDefinition
    of "_expression":
      juliaExpression
    of "_statement":
      juliaStatement
    of "abstract_definition":
      juliaAbstractDefinition
    of "argument_list":
      juliaArgumentList
    of "array_comprehension_expression":
      juliaArrayComprehensionExpression
    of "array_expression":
      juliaArrayExpression
    of "assignment_expression":
      juliaAssignmentExpression
    of "bare_tuple_expression":
      juliaBareTupleExpression
    of "binary_expression":
      juliaBinaryExpression
    of "broadcast_call_expression":
      juliaBroadcastCallExpression
    of "call_expression":
      juliaCallExpression
    of "catch_clause":
      juliaCatchClause
    of "coefficient_expression":
      juliaCoefficientExpression
    of "compound_expression":
      juliaCompoundExpression
    of "const_statement":
      juliaConstStatement
    of "constrained_parameter":
      juliaConstrainedParameter
    of "do_clause":
      juliaDoClause
    of "else_clause":
      juliaElseClause
    of "elseif_clause":
      juliaElseifClause
    of "export_statement":
      juliaExportStatement
    of "field_expression":
      juliaFieldExpression
    of "finally_clause":
      juliaFinallyClause
    of "for_binding":
      juliaForBinding
    of "for_clause":
      juliaForClause
    of "for_statement":
      juliaForStatement
    of "function_definition":
      juliaFunctionDefinition
    of "function_expression":
      juliaFunctionExpression
    of "generator_expression":
      juliaGeneratorExpression
    of "if_clause":
      juliaIfClause
    of "if_statement":
      juliaIfStatement
    of "import_statement":
      juliaImportStatement
    of "interpolation_expression":
      juliaInterpolationExpression
    of "keyword_parameters":
      juliaKeywordParameters
    of "let_statement":
      juliaLetStatement
    of "macro_argument_list":
      juliaMacroArgumentList
    of "macro_definition":
      juliaMacroDefinition
    of "macro_expression":
      juliaMacroExpression
    of "macro_identifier":
      juliaMacroIdentifier
    of "matrix_expression":
      juliaMatrixExpression
    of "matrix_row":
      juliaMatrixRow
    of "module_definition":
      juliaModuleDefinition
    of "named_argument":
      juliaNamedArgument
    of "named_field":
      juliaNamedField
    of "operator":
      juliaOperator
    of "optional_parameter":
      juliaOptionalParameter
    of "pair_expression":
      juliaPairExpression
    of "parameter_list":
      juliaParameterList
    of "parameterized_identifier":
      juliaParameterizedIdentifier
    of "parenthesized_expression":
      juliaParenthesizedExpression
    of "primitive_definition":
      juliaPrimitiveDefinition
    of "quote_expression":
      juliaQuoteExpression
    of "quote_statement":
      juliaQuoteStatement
    of "range_expression":
      juliaRangeExpression
    of "return_statement":
      juliaReturnStatement
    of "scoped_identifier":
      juliaScopedIdentifier
    of "selected_import":
      juliaSelectedImport
    of "source_file":
      juliaSourceFile
    of "spread_expression":
      juliaSpreadExpression
    of "spread_parameter":
      juliaSpreadParameter
    of "string":
      juliaString
    of "struct_definition":
      juliaStructDefinition
    of "subscript_expression":
      juliaSubscriptExpression
    of "subtype_clause":
      juliaSubtypeClause
    of "ternary_expression":
      juliaTernaryExpression
    of "try_statement":
      juliaTryStatement
    of "tuple_expression":
      juliaTupleExpression
    of "type_argument_list":
      juliaTypeArgumentList
    of "type_parameter_list":
      juliaTypeParameterList
    of "typed_expression":
      juliaTypedExpression
    of "typed_parameter":
      juliaTypedParameter
    of "unary_expression":
      juliaUnaryExpression
    of "variable_declaration":
      juliaVariableDeclaration
    of "while_statement":
      juliaWhileStatement
    of "\n":
      juliaNewlineTok
    of "!":
      juliaExclamationTok
    of "\"":
      juliaQuoteTok
    of "$":
      juliaDollarTok
    of "&&":
      juliaDoubleAmpersandTok
    of "\'":
      juliaApostropheTok
    of "(":
      juliaLParTok
    of ")":
      juliaRParTok
    of "+":
      juliaPlusTok
    of ",":
      juliaCommaTok
    of "-":
      juliaMinusTok
    of "->":
      juliaMinusGreaterThanTok
    of ".":
      juliaDotTok
    of ".\'":
      juliaDotApostropheTok
    of "...":
      juliaTripleDotTok
    of ":":
      juliaColonTok
    of "::":
      juliaDoubleColonTok
    of ";":
      juliaSemicolonTok
    of "<:":
      juliaLessThanColonTok
    of "<|":
      juliaLessThanPipeTok
    of "=":
      juliaEqualTok
    of "=>":
      juliaEqualGreaterThanTok
    of ">:":
      juliaGreaterThanColonTok
    of "?":
      juliaQuestionTok
    of "@":
      juliaAtTok
    of "[":
      juliaLBrackTok
    of "]":
      juliaRBrackTok
    of "abstract":
      juliaAbstractTok
    of "begin":
      juliaBeginTok
    of "block_comment":
      juliaBlockComment
    of "break_statement":
      juliaBreakStatement
    of "catch":
      juliaCatchTok
    of "character":
      juliaCharacter
    of "command_string":
      juliaCommandString
    of "comment":
      juliaComment
    of "const":
      juliaConstTok
    of "continue_statement":
      juliaContinueStatement
    of "do":
      juliaDoTok
    of "else":
      juliaElseTok
    of "elseif":
      juliaElseifTok
    of "end":
      juliaEndTok
    of "export":
      juliaExportTok
    of "finally":
      juliaFinallyTok
    of "for":
      juliaForTok
    of "function":
      juliaFunctionTok
    of "identifier":
      juliaIdentifier
    of "if":
      juliaIfTok
    of "import":
      juliaImportTok
    of "in":
      juliaInTok
    of "isa":
      juliaIsaTok
    of "let":
      juliaLetTok
    of "macro":
      juliaMacroTok
    of "module":
      juliaModuleTok
    of "mutable":
      juliaMutableTok
    of "number":
      juliaNumber
    of "primitive":
      juliaPrimitiveTok
    of "quote":
      juliaQuoteTok
    of "return":
      juliaReturnTok
    of "struct":
      juliaStructTok
    of "triple_string":
      juliaTripleString
    of "try":
      juliaTryTok
    of "type":
      juliaTypeTok
    of "using":
      juliaUsingTok
    of "while":
      juliaWhileTok
    of "{":
      juliaLCurlyTok
    of "|>":
      juliaPipeGreaterThanTok
    of "||":
      juliaDoublePipeTok
    of "}":
      juliaRCurlyTok
    of "~":
      juliaTildeTok
    of "¬":
      julia¬Tok
    of "∈":
      julia�Double�Tok
    of "√":
      julia√Tok
    of "∛":
      julia∛Tok
    of "∜":
      julia∜Tok
    of "ERROR":
      juliaSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_julia(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: JuliaNode): string =
  $ts_node_type(TSNode(node))

proc newJuliaParser*(): JuliaParser =
  result = JuliaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_julia())

proc parseString*(parser: JuliaParser; str: string): JuliaNode =
  JuliaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseJuliaString*(str: string): JuliaNode =
  let parser = newJuliaParser()
  return parseString(parser, str)

func `[]`*(node: JuliaNode; idx: int; withUnnamed: bool = false): JuliaNode =
  if withUnnamed:
    JuliaNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    JuliaNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: JuliaNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: JuliaNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: JuliaNode; withUnnamed: bool = false): JuliaNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                         ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

iterator pairs*(node: JuliaNode; withUnnamed: bool = false): (int, JuliaNode) =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                                ## nodes.
  for i in 0 ..< node.len(withUnnamed):
    yield (i, node[i, withUnnamed])

func slice*(node: JuliaNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func `[]`*(s: string; node: JuliaNode): string =
  s[node.slice()]

func nodeString*(node: JuliaNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: JuliaNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: JuliaNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: JuliaNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: JuliaNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: JuliaNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: JuliaNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: JuliaNode): JuliaNode =
  JuliaNode(ts_node_parent(TSNode(node)))

func child*(node: JuliaNode; a2: int): JuliaNode =
  JuliaNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: JuliaNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: JuliaNode; a2: int): JuliaNode =
  JuliaNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: JuliaNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: JuliaNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: JuliaNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: JuliaNode): int =
  node.startPoint().row.int

func endLine*(node: JuliaNode): int =
  node.endPoint().row.int

func startColumn*(node: JuliaNode): int =
  node.startPoint().column.int

func endColumn*(node: JuliaNode): int =
  node.endPoint().column.int

func childByFieldName*(self: JuliaNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
