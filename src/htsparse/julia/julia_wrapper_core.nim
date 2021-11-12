import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  JuliaNodeKind* = enum
    juliaDefinition                   ## _definition
    juliaExpression                   ## _expression
    juliaStatement                    ## _statement
    juliaAbstractDefinition           ## abstract_definition
    juliaArgumentList                 ## argument_list
    juliaArrayComprehensionExpression ## array_comprehension_expression
    juliaArrayExpression              ## array_expression
    juliaAssignmentExpression         ## assignment_expression
    juliaBareTupleExpression          ## bare_tuple_expression
    juliaBinaryExpression             ## binary_expression
    juliaBroadcastCallExpression      ## broadcast_call_expression
    juliaCallExpression               ## call_expression
    juliaCatchClause                  ## catch_clause
    juliaCoefficientExpression        ## coefficient_expression
    juliaCompoundExpression           ## compound_expression
    juliaConstStatement               ## const_statement
    juliaConstrainedParameter         ## constrained_parameter
    juliaDoClause                     ## do_clause
    juliaElseClause                   ## else_clause
    juliaElseifClause                 ## elseif_clause
    juliaExportStatement              ## export_statement
    juliaFieldExpression              ## field_expression
    juliaFinallyClause                ## finally_clause
    juliaForBinding                   ## for_binding
    juliaForClause                    ## for_clause
    juliaForStatement                 ## for_statement
    juliaFunctionDefinition           ## function_definition
    juliaFunctionExpression           ## function_expression
    juliaGeneratorExpression          ## generator_expression
    juliaIfClause                     ## if_clause
    juliaIfStatement                  ## if_statement
    juliaImportStatement              ## import_statement
    juliaInterpolationExpression      ## interpolation_expression
    juliaKeywordParameters            ## keyword_parameters
    juliaLetStatement                 ## let_statement
    juliaMacroArgumentList            ## macro_argument_list
    juliaMacroDefinition              ## macro_definition
    juliaMacroExpression              ## macro_expression
    juliaMacroIdentifier              ## macro_identifier
    juliaMatrixExpression             ## matrix_expression
    juliaMatrixRow                    ## matrix_row
    juliaModuleDefinition             ## module_definition
    juliaNamedArgument                ## named_argument
    juliaNamedField                   ## named_field
    juliaOperator                     ## operator
    juliaOptionalParameter            ## optional_parameter
    juliaPairExpression               ## pair_expression
    juliaParameterList                ## parameter_list
    juliaParameterizedIdentifier      ## parameterized_identifier
    juliaParenthesizedExpression      ## parenthesized_expression
    juliaPrimitiveDefinition          ## primitive_definition
    juliaQuoteExpression              ## quote_expression
    juliaQuoteStatement               ## quote_statement
    juliaRangeExpression              ## range_expression
    juliaReturnStatement              ## return_statement
    juliaScopedIdentifier             ## scoped_identifier
    juliaSelectedImport               ## selected_import
    juliaSourceFile                   ## source_file
    juliaSpreadExpression             ## spread_expression
    juliaSpreadParameter              ## spread_parameter
    juliaString                       ## string
    juliaStructDefinition             ## struct_definition
    juliaSubscriptExpression          ## subscript_expression
    juliaSubtypeClause                ## subtype_clause
    juliaTernaryExpression            ## ternary_expression
    juliaTryStatement                 ## try_statement
    juliaTupleExpression              ## tuple_expression
    juliaTypeArgumentList             ## type_argument_list
    juliaTypeParameterList            ## type_parameter_list
    juliaTypedExpression              ## typed_expression
    juliaTypedParameter               ## typed_parameter
    juliaUnaryExpression              ## unary_expression
    juliaVariableDeclaration          ## variable_declaration
    juliaWhileStatement               ## while_statement
    juliaNewlineTok                   ##
                                      ##
    juliaExclamationTok               ## !
    juliaQuoteTok                     ## "
    juliaDollarTok                    ## $
    juliaDoubleAmpersandTok           ## &&
    juliaApostropheTok                ## '
    juliaLParTok                      ## (
    juliaRParTok                      ## )
    juliaPlusTok                      ## +
    juliaCommaTok                     ## ,
    juliaMinusTok                     ## -
    juliaMinusGreaterThanTok          ## ->
    juliaDotTok                       ## .
    juliaDotApostropheTok             ## .'
    juliaTripleDotTok                 ## ...
    juliaColonTok                     ## :
    juliaDoubleColonTok               ## ::
    juliaSemicolonTok                 ## ;
    juliaLessThanColonTok             ## <:
    juliaLessThanPipeTok              ## <|
    juliaEqualTok                     ## =
    juliaEqualGreaterThanTok          ## =>
    juliaGreaterThanColonTok          ## >:
    juliaQuestionTok                  ## ?
    juliaAtTok                        ## @
    juliaLBrackTok                    ## [
    juliaRBrackTok                    ## ]
    juliaAbstractTok                  ## abstract
    juliaBeginTok                     ## begin
    juliaBlockComment                 ## block_comment
    juliaBreakStatement               ## break_statement
    juliaCatchTok                     ## catch
    juliaCharacter                    ## character
    juliaCommandString                ## command_string
    juliaComment                      ## comment
    juliaConstTok                     ## const
    juliaContinueStatement            ## continue_statement
    juliaDoTok                        ## do
    juliaElseTok                      ## else
    juliaElseifTok                    ## elseif
    juliaEndTok                       ## end
    juliaExportTok                    ## export
    juliaFinallyTok                   ## finally
    juliaForTok                       ## for
    juliaFunctionTok                  ## function
    juliaIdentifier                   ## identifier
    juliaIfTok                        ## if
    juliaImportTok                    ## import
    juliaInTok                        ## in
    juliaIsaTok                       ## isa
    juliaLetTok                       ## let
    juliaMacroTok                     ## macro
    juliaModuleTok                    ## module
    juliaMutableTok                   ## mutable
    juliaNumber                       ## number
    juliaPrimitiveTok                 ## primitive
    juliaReturnTok                    ## return
    juliaStructTok                    ## struct
    juliaTripleString                 ## triple_string
    juliaTryTok                       ## try
    juliaTypeTok                      ## type
    juliaUsingTok                     ## using
    juliaWhileTok                     ## while
    juliaLCurlyTok                    ## {
    juliaPipeGreaterThanTok           ## |>
    juliaDoublePipeTok                ## ||
    juliaRCurlyTok                    ## }
    juliaTildeTok                     ## ~
    julia¬Tok                        ## ¬
    juliaℯubleTok                  ## ∈
    julia√Tok                       ## √
    julia∛Tok                       ## ∛
    julia∜Tok                       ## ∜
    juliaSyntaxError                  ## Tree-sitter parser syntax error


type
  JuliaExternalTok* = enum
    juliaExternBlock_comment    ## block_comment
    juliaExternTriple_string    ## triple_string
    juliaExtern_immediate_paren ## _immediate_paren


type
  TsJuliaNode* = distinct TSNode


type
  JuliaParser* = distinct PtsParser


proc tsNodeType*(node: TsJuliaNode): string



proc kind*(node: TsJuliaNode): JuliaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_definition":                    juliaDefinition
      of "_expression":                    juliaExpression
      of "_statement":                     juliaStatement
      of "abstract_definition":            juliaAbstractDefinition
      of "argument_list":                  juliaArgumentList
      of "array_comprehension_expression": juliaArrayComprehensionExpression
      of "array_expression":               juliaArrayExpression
      of "assignment_expression":          juliaAssignmentExpression
      of "bare_tuple_expression":          juliaBareTupleExpression
      of "binary_expression":              juliaBinaryExpression
      of "broadcast_call_expression":      juliaBroadcastCallExpression
      of "call_expression":                juliaCallExpression
      of "catch_clause":                   juliaCatchClause
      of "coefficient_expression":         juliaCoefficientExpression
      of "compound_expression":            juliaCompoundExpression
      of "const_statement":                juliaConstStatement
      of "constrained_parameter":          juliaConstrainedParameter
      of "do_clause":                      juliaDoClause
      of "else_clause":                    juliaElseClause
      of "elseif_clause":                  juliaElseifClause
      of "export_statement":               juliaExportStatement
      of "field_expression":               juliaFieldExpression
      of "finally_clause":                 juliaFinallyClause
      of "for_binding":                    juliaForBinding
      of "for_clause":                     juliaForClause
      of "for_statement":                  juliaForStatement
      of "function_definition":            juliaFunctionDefinition
      of "function_expression":            juliaFunctionExpression
      of "generator_expression":           juliaGeneratorExpression
      of "if_clause":                      juliaIfClause
      of "if_statement":                   juliaIfStatement
      of "import_statement":               juliaImportStatement
      of "interpolation_expression":       juliaInterpolationExpression
      of "keyword_parameters":             juliaKeywordParameters
      of "let_statement":                  juliaLetStatement
      of "macro_argument_list":            juliaMacroArgumentList
      of "macro_definition":               juliaMacroDefinition
      of "macro_expression":               juliaMacroExpression
      of "macro_identifier":               juliaMacroIdentifier
      of "matrix_expression":              juliaMatrixExpression
      of "matrix_row":                     juliaMatrixRow
      of "module_definition":              juliaModuleDefinition
      of "named_argument":                 juliaNamedArgument
      of "named_field":                    juliaNamedField
      of "operator":                       juliaOperator
      of "optional_parameter":             juliaOptionalParameter
      of "pair_expression":                juliaPairExpression
      of "parameter_list":                 juliaParameterList
      of "parameterized_identifier":       juliaParameterizedIdentifier
      of "parenthesized_expression":       juliaParenthesizedExpression
      of "primitive_definition":           juliaPrimitiveDefinition
      of "quote_expression":               juliaQuoteExpression
      of "quote_statement":                juliaQuoteStatement
      of "range_expression":               juliaRangeExpression
      of "return_statement":               juliaReturnStatement
      of "scoped_identifier":              juliaScopedIdentifier
      of "selected_import":                juliaSelectedImport
      of "source_file":                    juliaSourceFile
      of "spread_expression":              juliaSpreadExpression
      of "spread_parameter":               juliaSpreadParameter
      of "string":                         juliaString
      of "struct_definition":              juliaStructDefinition
      of "subscript_expression":           juliaSubscriptExpression
      of "subtype_clause":                 juliaSubtypeClause
      of "ternary_expression":             juliaTernaryExpression
      of "try_statement":                  juliaTryStatement
      of "tuple_expression":               juliaTupleExpression
      of "type_argument_list":             juliaTypeArgumentList
      of "type_parameter_list":            juliaTypeParameterList
      of "typed_expression":               juliaTypedExpression
      of "typed_parameter":                juliaTypedParameter
      of "unary_expression":               juliaUnaryExpression
      of "variable_declaration":           juliaVariableDeclaration
      of "while_statement":                juliaWhileStatement
      of "\x0A":                           juliaNewlineTok
      of "!":                              juliaExclamationTok
      of "\"":                             juliaQuoteTok
      of "$":                              juliaDollarTok
      of "&&":                             juliaDoubleAmpersandTok
      of "\'":                             juliaApostropheTok
      of "(":                              juliaLParTok
      of ")":                              juliaRParTok
      of "+":                              juliaPlusTok
      of ",":                              juliaCommaTok
      of "-":                              juliaMinusTok
      of "->":                             juliaMinusGreaterThanTok
      of ".":                              juliaDotTok
      of ".\'":                            juliaDotApostropheTok
      of "...":                            juliaTripleDotTok
      of ":":                              juliaColonTok
      of "::":                             juliaDoubleColonTok
      of ";":                              juliaSemicolonTok
      of "<:":                             juliaLessThanColonTok
      of "<|":                             juliaLessThanPipeTok
      of "=":                              juliaEqualTok
      of "=>":                             juliaEqualGreaterThanTok
      of ">:":                             juliaGreaterThanColonTok
      of "?":                              juliaQuestionTok
      of "@":                              juliaAtTok
      of "[":                              juliaLBrackTok
      of "]":                              juliaRBrackTok
      of "abstract":                       juliaAbstractTok
      of "begin":                          juliaBeginTok
      of "block_comment":                  juliaBlockComment
      of "break_statement":                juliaBreakStatement
      of "catch":                          juliaCatchTok
      of "character":                      juliaCharacter
      of "command_string":                 juliaCommandString
      of "comment":                        juliaComment
      of "const":                          juliaConstTok
      of "continue_statement":             juliaContinueStatement
      of "do":                             juliaDoTok
      of "else":                           juliaElseTok
      of "elseif":                         juliaElseifTok
      of "end":                            juliaEndTok
      of "export":                         juliaExportTok
      of "finally":                        juliaFinallyTok
      of "for":                            juliaForTok
      of "function":                       juliaFunctionTok
      of "identifier":                     juliaIdentifier
      of "if":                             juliaIfTok
      of "import":                         juliaImportTok
      of "in":                             juliaInTok
      of "isa":                            juliaIsaTok
      of "let":                            juliaLetTok
      of "macro":                          juliaMacroTok
      of "module":                         juliaModuleTok
      of "mutable":                        juliaMutableTok
      of "number":                         juliaNumber
      of "primitive":                      juliaPrimitiveTok
      of "quote":                          juliaQuoteTok
      of "return":                         juliaReturnTok
      of "struct":                         juliaStructTok
      of "triple_string":                  juliaTripleString
      of "try":                            juliaTryTok
      of "type":                           juliaTypeTok
      of "using":                          juliaUsingTok
      of "while":                          juliaWhileTok
      of "{":                              juliaLCurlyTok
      of "|>":                             juliaPipeGreaterThanTok
      of "||":                             juliaDoublePipeTok
      of "}":                              juliaRCurlyTok
      of "~":                              juliaTildeTok
      of "\xC2\xAC":                       julia¬Tok
      of "\xE2\x88\x88":                   juliaℯubleTok
      of "\xE2\x88\x9A":                   julia√Tok
      of "\xE2\x88\x9B":                   julia∛Tok
      of "\xE2\x88\x9C":                   julia∜Tok
      of "ERROR":                          juliaSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsJuliaNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsJuliaNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsJuliaNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_julia(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsJuliaNode): string =
  $ts_node_type(TSNode(node))

proc newTsJuliaParser*(): JuliaParser =
  result = JuliaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_julia())

proc parseString*(parser: JuliaParser, str: string): TsJuliaNode =
  TsJuliaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsJuliaString*(str: string): TsJuliaNode =
  let parser = newTsJuliaParser()
  return parseString(parser, str)

func `$`*(node: TsJuliaNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsJuliaNode, str: string): string =
  var res = addr result
  proc aux(node: TsJuliaNode, level: int) =
    for i in 0 ..< level:
      res[].add "  "
    res[].add $node.kind
    if len(node) == 0:
      res[].add " "
      res[].add str[node]

    else:
      for sub in items(node):
        res[].add "\x0A"
        aux(sub, level + 1)


  aux(node, 0)


