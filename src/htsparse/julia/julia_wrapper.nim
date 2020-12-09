
import
  hparse / htreesitter / htreesitter, sequtils, strutils

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
    juliaSingleNewlineTok,  ## 
                             ## 
    juliaSingleExclamationTok, ## !
    juliaSingleQuoteTok,    ## "
    juliaSingleDollarTok,   ## $
    juliaDoubleAmpersandTok, ## &&
    juliaSingleApostropheTok, ## '
    juliaSingleLParTok,     ## (
    juliaSingleRParTok,     ## )
    juliaSinglePlusTok,     ## +
    juliaSingleCommaTok,    ## ,
    juliaSingleMinusTok,    ## -
    juliaSingleMinusSingleGreaterThanTok, ## ->
    juliaSingleDotTok,      ## .
    juliaSingleDotSingleApostropheTok, ## .'
    juliaTripleDotTok,      ## ...
    juliaSingleColonTok,    ## :
    juliaDoubleColonTok,    ## ::
    juliaSingleSemicolonTok, ## ;
    juliaSingleLessThanSingleColonTok, ## <:
    juliaSingleLessThanSinglePipeTok, ## <|
    juliaSingleEqualTok,    ## =
    juliaSingleEqualSingleGreaterThanTok, ## =>
    juliaSingleGreaterThanSingleColonTok, ## >:
    juliaSingleQuestionTok, ## ?
    juliaSingleAtTok,       ## @
    juliaSingleLBrackTok,   ## [
    juliaSingleRBrackTok,   ## ]
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
    juliaQuoteTok,          ## quote
    juliaReturnTok,         ## return
    juliaStructTok,         ## struct
    juliaTripleString,      ## triple_string
    juliaTryTok,            ## try
    juliaTypeTok,           ## type
    juliaUsingTok,          ## using
    juliaWhileTok,          ## while
    juliaSingleLCurlyTok,   ## {
    juliaSinglePipeSingleGreaterThanTok, ## |>
    juliaDoublePipeTok,     ## ||
    juliaSingleRCurlyTok,   ## }
    juliaSingleTildeTok,    ## ~
    juliaSingleÂSingle¬Tok, ## Â¬
    juliaSingleâDoubleˆTok, ## âˆˆ
    juliaSingleâSingleˆSinglešTok, ## âˆš
    juliaSingleâSingleˆSingle›Tok, ## âˆ›
    juliaSingleâSingleˆSingleœTok, ## âˆœ
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
proc kind*(node: JuliaNode): JuliaNodeKind =
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
    juliaSingleNewlineTok
  of "!":
    juliaSingleExclamationTok
  of "\"":
    juliaSingleQuoteTok
  of "$":
    juliaSingleDollarTok
  of "&&":
    juliaDoubleAmpersandTok
  of "\'":
    juliaSingleApostropheTok
  of "(":
    juliaSingleLParTok
  of ")":
    juliaSingleRParTok
  of "+":
    juliaSinglePlusTok
  of ",":
    juliaSingleCommaTok
  of "-":
    juliaSingleMinusTok
  of "->":
    juliaSingleMinusSingleGreaterThanTok
  of ".":
    juliaSingleDotTok
  of ".\'":
    juliaSingleDotSingleApostropheTok
  of "...":
    juliaTripleDotTok
  of ":":
    juliaSingleColonTok
  of "::":
    juliaDoubleColonTok
  of ";":
    juliaSingleSemicolonTok
  of "<:":
    juliaSingleLessThanSingleColonTok
  of "<|":
    juliaSingleLessThanSinglePipeTok
  of "=":
    juliaSingleEqualTok
  of "=>":
    juliaSingleEqualSingleGreaterThanTok
  of ">:":
    juliaSingleGreaterThanSingleColonTok
  of "?":
    juliaSingleQuestionTok
  of "@":
    juliaSingleAtTok
  of "[":
    juliaSingleLBrackTok
  of "]":
    juliaSingleRBrackTok
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
    juliaSingleLCurlyTok
  of "|>":
    juliaSinglePipeSingleGreaterThanTok
  of "||":
    juliaDoublePipeTok
  of "}":
    juliaSingleRCurlyTok
  of "~":
    juliaSingleTildeTok
  of "Â¬":
    juliaSingleÂSingle¬Tok
  of "âˆˆ":
    juliaSingleâDoubleˆTok
  of "âˆš":
    juliaSingleâSingleˆSinglešTok
  of "âˆ›":
    juliaSingleâSingleˆSingle›Tok
  of "âˆœ":
    juliaSingleâSingleˆSingleœTok
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
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: JuliaNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: JuliaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: JuliaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[5 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
