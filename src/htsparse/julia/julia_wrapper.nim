import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  JuliaNodeKind* = enum
    juliaHidDefinition                ## _definition
    juliaHidExpression                ## _expression
    juliaHidStatement                 ## _statement
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
    juliaHidPowerOperator             ## _power_operator
    juliaHidExpressionList            ## _expression_list
    juliaHidArrowOperator             ## _arrow_operator
    juliaHidPrimaryExpression         ## _primary_expression
    juliaHidAssignOperator            ## _assign_operator
    juliaHidPlusOperator              ## _plus_operator
    juliaHidTimesOperator             ## _times_operator
    juliaHidTerminator                ## _terminator
    juliaHidComprehensionClause       ## _comprehension_clause
    juliaHidImmediateParen            ## _immediate_paren
    juliaHidComparisonOperator        ## _comparison_operator
    juliaSyntaxError                  ## Tree-sitter parser syntax error

proc strRepr*(kind: JuliaNodeKind): string =
  case kind:
    of juliaHidDefinition:                "_definition"
    of juliaHidExpression:                "_expression"
    of juliaHidStatement:                 "_statement"
    of juliaAbstractDefinition:           "abstract_definition"
    of juliaArgumentList:                 "argument_list"
    of juliaArrayComprehensionExpression: "array_comprehension_expression"
    of juliaArrayExpression:              "array_expression"
    of juliaAssignmentExpression:         "assignment_expression"
    of juliaBareTupleExpression:          "bare_tuple_expression"
    of juliaBinaryExpression:             "binary_expression"
    of juliaBroadcastCallExpression:      "broadcast_call_expression"
    of juliaCallExpression:               "call_expression"
    of juliaCatchClause:                  "catch_clause"
    of juliaCoefficientExpression:        "coefficient_expression"
    of juliaCompoundExpression:           "compound_expression"
    of juliaConstStatement:               "const_statement"
    of juliaConstrainedParameter:         "constrained_parameter"
    of juliaDoClause:                     "do_clause"
    of juliaElseClause:                   "else_clause"
    of juliaElseifClause:                 "elseif_clause"
    of juliaExportStatement:              "export_statement"
    of juliaFieldExpression:              "field_expression"
    of juliaFinallyClause:                "finally_clause"
    of juliaForBinding:                   "for_binding"
    of juliaForClause:                    "for_clause"
    of juliaForStatement:                 "for_statement"
    of juliaFunctionDefinition:           "function_definition"
    of juliaFunctionExpression:           "function_expression"
    of juliaGeneratorExpression:          "generator_expression"
    of juliaIfClause:                     "if_clause"
    of juliaIfStatement:                  "if_statement"
    of juliaImportStatement:              "import_statement"
    of juliaInterpolationExpression:      "interpolation_expression"
    of juliaKeywordParameters:            "keyword_parameters"
    of juliaLetStatement:                 "let_statement"
    of juliaMacroArgumentList:            "macro_argument_list"
    of juliaMacroDefinition:              "macro_definition"
    of juliaMacroExpression:              "macro_expression"
    of juliaMacroIdentifier:              "macro_identifier"
    of juliaMatrixExpression:             "matrix_expression"
    of juliaMatrixRow:                    "matrix_row"
    of juliaModuleDefinition:             "module_definition"
    of juliaNamedArgument:                "named_argument"
    of juliaNamedField:                   "named_field"
    of juliaOperator:                     "operator"
    of juliaOptionalParameter:            "optional_parameter"
    of juliaPairExpression:               "pair_expression"
    of juliaParameterList:                "parameter_list"
    of juliaParameterizedIdentifier:      "parameterized_identifier"
    of juliaParenthesizedExpression:      "parenthesized_expression"
    of juliaPrimitiveDefinition:          "primitive_definition"
    of juliaQuoteExpression:              "quote_expression"
    of juliaQuoteStatement:               "quote_statement"
    of juliaRangeExpression:              "range_expression"
    of juliaReturnStatement:              "return_statement"
    of juliaScopedIdentifier:             "scoped_identifier"
    of juliaSelectedImport:               "selected_import"
    of juliaSourceFile:                   "source_file"
    of juliaSpreadExpression:             "spread_expression"
    of juliaSpreadParameter:              "spread_parameter"
    of juliaString:                       "string"
    of juliaStructDefinition:             "struct_definition"
    of juliaSubscriptExpression:          "subscript_expression"
    of juliaSubtypeClause:                "subtype_clause"
    of juliaTernaryExpression:            "ternary_expression"
    of juliaTryStatement:                 "try_statement"
    of juliaTupleExpression:              "tuple_expression"
    of juliaTypeArgumentList:             "type_argument_list"
    of juliaTypeParameterList:            "type_parameter_list"
    of juliaTypedExpression:              "typed_expression"
    of juliaTypedParameter:               "typed_parameter"
    of juliaUnaryExpression:              "unary_expression"
    of juliaVariableDeclaration:          "variable_declaration"
    of juliaWhileStatement:               "while_statement"
    of juliaNewlineTok:                   "\x0A"
    of juliaExclamationTok:               "!"
    of juliaQuoteTok:                     "\""
    of juliaDollarTok:                    "$"
    of juliaDoubleAmpersandTok:           "&&"
    of juliaApostropheTok:                "\'"
    of juliaLParTok:                      "("
    of juliaRParTok:                      ")"
    of juliaPlusTok:                      "+"
    of juliaCommaTok:                     ","
    of juliaMinusTok:                     "-"
    of juliaMinusGreaterThanTok:          "->"
    of juliaDotTok:                       "."
    of juliaDotApostropheTok:             ".\'"
    of juliaTripleDotTok:                 "..."
    of juliaColonTok:                     ":"
    of juliaDoubleColonTok:               "::"
    of juliaSemicolonTok:                 ";"
    of juliaLessThanColonTok:             "<:"
    of juliaLessThanPipeTok:              "<|"
    of juliaEqualTok:                     "="
    of juliaEqualGreaterThanTok:          "=>"
    of juliaGreaterThanColonTok:          ">:"
    of juliaQuestionTok:                  "?"
    of juliaAtTok:                        "@"
    of juliaLBrackTok:                    "["
    of juliaRBrackTok:                    "]"
    of juliaAbstractTok:                  "abstract"
    of juliaBeginTok:                     "begin"
    of juliaBlockComment:                 "block_comment"
    of juliaBreakStatement:               "break_statement"
    of juliaCatchTok:                     "catch"
    of juliaCharacter:                    "character"
    of juliaCommandString:                "command_string"
    of juliaComment:                      "comment"
    of juliaConstTok:                     "const"
    of juliaContinueStatement:            "continue_statement"
    of juliaDoTok:                        "do"
    of juliaElseTok:                      "else"
    of juliaElseifTok:                    "elseif"
    of juliaEndTok:                       "end"
    of juliaExportTok:                    "export"
    of juliaFinallyTok:                   "finally"
    of juliaForTok:                       "for"
    of juliaFunctionTok:                  "function"
    of juliaIdentifier:                   "identifier"
    of juliaIfTok:                        "if"
    of juliaImportTok:                    "import"
    of juliaInTok:                        "in"
    of juliaIsaTok:                       "isa"
    of juliaLetTok:                       "let"
    of juliaMacroTok:                     "macro"
    of juliaModuleTok:                    "module"
    of juliaMutableTok:                   "mutable"
    of juliaNumber:                       "number"
    of juliaPrimitiveTok:                 "primitive"
    of juliaReturnTok:                    "return"
    of juliaStructTok:                    "struct"
    of juliaTripleString:                 "triple_string"
    of juliaTryTok:                       "try"
    of juliaTypeTok:                      "type"
    of juliaUsingTok:                     "using"
    of juliaWhileTok:                     "while"
    of juliaLCurlyTok:                    "{"
    of juliaPipeGreaterThanTok:           "|>"
    of juliaDoublePipeTok:                "||"
    of juliaRCurlyTok:                    "}"
    of juliaTildeTok:                     "~"
    of julia¬Tok:                         "\xC2\xAC"
    of juliaℯubleTok:                    "\xE2\x88\x88"
    of julia√Tok:                         "\xE2\x88\x9A"
    of julia∛Tok:                         "\xE2\x88\x9B"
    of julia∜Tok:                         "\xE2\x88\x9C"
    of juliaHidPowerOperator:             "_power_operator"
    of juliaHidExpressionList:            "_expression_list"
    of juliaHidArrowOperator:             "_arrow_operator"
    of juliaHidPrimaryExpression:         "_primary_expression"
    of juliaHidAssignOperator:            "_assign_operator"
    of juliaHidPlusOperator:              "_plus_operator"
    of juliaHidTimesOperator:             "_times_operator"
    of juliaHidTerminator:                "_terminator"
    of juliaHidComprehensionClause:       "_comprehension_clause"
    of juliaHidImmediateParen:            "_immediate_paren"
    of juliaHidComparisonOperator:        "_comparison_operator"
    of juliaSyntaxError:                  "ERROR"

type
  JuliaExternalTok* = enum
    juliaExternBlock_comment    ## block_comment
    juliaExternTriple_string    ## triple_string
    juliaExtern_immediate_paren ## _immediate_paren

type
  TsJuliaNode* = distinct TSNode

type
  JuliaParser* = distinct PtsParser

const juliaAllowedSubnodes*: array[JuliaNodeKind, set[JuliaNodeKind]] = block:
                                                                          var tmp: array[JuliaNodeKind, set[JuliaNodeKind]]
                                                                          tmp[juliaAbstractDefinition] = {juliaSubtypeClause}
                                                                          tmp[juliaArgumentList] = {juliaHidExpression, juliaNamedArgument}
                                                                          tmp[juliaArrayComprehensionExpression] = {juliaHidExpression, juliaForClause, juliaIfClause}
                                                                          tmp[juliaArrayExpression] = {juliaHidExpression}
                                                                          tmp[juliaAssignmentExpression] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaBareTupleExpression] = {juliaHidExpression}
                                                                          tmp[juliaBinaryExpression] = {juliaHidExpression}
                                                                          tmp[juliaBroadcastCallExpression] = {
                                                                                                                juliaArgumentList,
                                                                                                                juliaArrayComprehensionExpression,
                                                                                                                juliaArrayExpression,
                                                                                                                juliaBroadcastCallExpression,
                                                                                                                juliaCallExpression,
                                                                                                                juliaCharacter,
                                                                                                                juliaCommandString,
                                                                                                                juliaDoClause,
                                                                                                                juliaFieldExpression,
                                                                                                                juliaGeneratorExpression,
                                                                                                                juliaIdentifier,
                                                                                                                juliaMatrixExpression,
                                                                                                                juliaOperator,
                                                                                                                juliaParameterizedIdentifier,
                                                                                                                juliaParenthesizedExpression,
                                                                                                                juliaString,
                                                                                                                juliaSubscriptExpression,
                                                                                                                juliaTripleString,
                                                                                                                juliaTupleExpression
                                                                                                              }
                                                                          tmp[juliaCallExpression] = {
                                                                                                       juliaArgumentList,
                                                                                                       juliaArrayComprehensionExpression,
                                                                                                       juliaArrayExpression,
                                                                                                       juliaBroadcastCallExpression,
                                                                                                       juliaCallExpression,
                                                                                                       juliaCharacter,
                                                                                                       juliaCommandString,
                                                                                                       juliaDoClause,
                                                                                                       juliaFieldExpression,
                                                                                                       juliaGeneratorExpression,
                                                                                                       juliaIdentifier,
                                                                                                       juliaMatrixExpression,
                                                                                                       juliaOperator,
                                                                                                       juliaParameterizedIdentifier,
                                                                                                       juliaParenthesizedExpression,
                                                                                                       juliaString,
                                                                                                       juliaSubscriptExpression,
                                                                                                       juliaTripleString,
                                                                                                       juliaTupleExpression
                                                                                                     }
                                                                          tmp[juliaCatchClause] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaCoefficientExpression] = {juliaIdentifier, juliaNumber, juliaParenthesizedExpression}
                                                                          tmp[juliaCompoundExpression] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaConstStatement] = {juliaVariableDeclaration}
                                                                          tmp[juliaDoClause] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaElseClause] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaElseifClause] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaExportStatement] = {juliaIdentifier}
                                                                          tmp[juliaFieldExpression] = {
                                                                                                        juliaArrayComprehensionExpression,
                                                                                                        juliaArrayExpression,
                                                                                                        juliaBroadcastCallExpression,
                                                                                                        juliaCallExpression,
                                                                                                        juliaCharacter,
                                                                                                        juliaCommandString,
                                                                                                        juliaFieldExpression,
                                                                                                        juliaIdentifier,
                                                                                                        juliaMatrixExpression,
                                                                                                        juliaOperator,
                                                                                                        juliaParameterizedIdentifier,
                                                                                                        juliaParenthesizedExpression,
                                                                                                        juliaString,
                                                                                                        juliaSubscriptExpression,
                                                                                                        juliaTripleString,
                                                                                                        juliaTupleExpression
                                                                                                      }
                                                                          tmp[juliaFinallyClause] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaForBinding] = {juliaHidExpression}
                                                                          tmp[juliaForClause] = {juliaForBinding}
                                                                          tmp[juliaForStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression, juliaForBinding}
                                                                          tmp[juliaFunctionDefinition] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaFunctionExpression] = {juliaHidExpression, juliaAssignmentExpression, juliaParameterList}
                                                                          tmp[juliaGeneratorExpression] = {juliaHidExpression, juliaForClause, juliaIfClause}
                                                                          tmp[juliaIfClause] = {juliaHidExpression}
                                                                          tmp[juliaIfStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaImportStatement] = {juliaIdentifier, juliaScopedIdentifier, juliaSelectedImport}
                                                                          tmp[juliaInterpolationExpression] = {juliaHidExpression}
                                                                          tmp[juliaKeywordParameters] = {juliaIdentifier, juliaOptionalParameter, juliaSpreadParameter, juliaTypedParameter}
                                                                          tmp[juliaLetStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression, juliaVariableDeclaration}
                                                                          tmp[juliaMacroArgumentList] = {juliaHidExpression}
                                                                          tmp[juliaMacroDefinition] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaMacroExpression] = {juliaArgumentList, juliaMacroArgumentList, juliaMacroIdentifier}
                                                                          tmp[juliaMacroIdentifier] = {juliaIdentifier, juliaOperator}
                                                                          tmp[juliaMatrixExpression] = {juliaMatrixRow}
                                                                          tmp[juliaMatrixRow] = {juliaHidExpression}
                                                                          tmp[juliaModuleDefinition] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaNamedArgument] = {juliaHidExpression}
                                                                          tmp[juliaNamedField] = {juliaHidExpression}
                                                                          tmp[juliaOptionalParameter] = {juliaHidExpression, juliaTypedParameter}
                                                                          tmp[juliaPairExpression] = {juliaHidExpression}
                                                                          tmp[juliaParameterList] = {juliaIdentifier, juliaKeywordParameters, juliaOptionalParameter, juliaSpreadParameter, juliaTypedParameter}
                                                                          tmp[juliaParameterizedIdentifier] = {juliaFieldExpression, juliaIdentifier, juliaTypeArgumentList}
                                                                          tmp[juliaParenthesizedExpression] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaPrimitiveDefinition] = {juliaNumber, juliaSubtypeClause}
                                                                          tmp[juliaQuoteExpression] = {juliaHidExpression}
                                                                          tmp[juliaQuoteStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaRangeExpression] = {juliaHidExpression}
                                                                          tmp[juliaReturnStatement] = {juliaHidExpression, juliaBareTupleExpression}
                                                                          tmp[juliaScopedIdentifier] = {juliaIdentifier, juliaScopedIdentifier}
                                                                          tmp[juliaSelectedImport] = {juliaIdentifier, juliaMacroIdentifier, juliaScopedIdentifier}
                                                                          tmp[juliaSourceFile] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp[juliaSpreadExpression] = {juliaHidExpression}
                                                                          tmp[juliaSpreadParameter] = {juliaIdentifier}
                                                                          tmp[juliaStructDefinition] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression, juliaSubtypeClause}
                                                                          tmp[juliaSubscriptExpression] = {juliaHidExpression}
                                                                          tmp[juliaSubtypeClause] = {juliaHidExpression}
                                                                          tmp[juliaTernaryExpression] = {juliaHidExpression}
                                                                          tmp[juliaTryStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression, juliaCatchClause, juliaFinallyClause}
                                                                          tmp[juliaTupleExpression] = {juliaHidExpression, juliaNamedField}
                                                                          tmp[juliaTypeArgumentList] = {juliaHidExpression}
                                                                          tmp[juliaTypeParameterList] = {juliaConstrainedParameter, juliaIdentifier}
                                                                          tmp[juliaTypedExpression] = {juliaHidExpression}
                                                                          tmp[juliaTypedParameter] = {juliaIdentifier, juliaParameterizedIdentifier}
                                                                          tmp[juliaUnaryExpression] = {juliaHidExpression}
                                                                          tmp[juliaVariableDeclaration] = {juliaHidExpression}
                                                                          tmp[juliaWhileStatement] = {juliaHidExpression, juliaAssignmentExpression, juliaBareTupleExpression}
                                                                          tmp
const juliaTokenKinds*: set[JuliaNodeKind] = {
                                               juliaNewlineTok,
                                               juliaExclamationTok,
                                               juliaQuoteTok,
                                               juliaDollarTok,
                                               juliaDoubleAmpersandTok,
                                               juliaApostropheTok,
                                               juliaLParTok,
                                               juliaRParTok,
                                               juliaPlusTok,
                                               juliaCommaTok,
                                               juliaMinusTok,
                                               juliaMinusGreaterThanTok,
                                               juliaDotTok,
                                               juliaDotApostropheTok,
                                               juliaTripleDotTok,
                                               juliaColonTok,
                                               juliaDoubleColonTok,
                                               juliaSemicolonTok,
                                               juliaLessThanColonTok,
                                               juliaLessThanPipeTok,
                                               juliaEqualTok,
                                               juliaEqualGreaterThanTok,
                                               juliaGreaterThanColonTok,
                                               juliaQuestionTok,
                                               juliaAtTok,
                                               juliaLBrackTok,
                                               juliaRBrackTok,
                                               juliaAbstractTok,
                                               juliaBeginTok,
                                               juliaCatchTok,
                                               juliaConstTok,
                                               juliaDoTok,
                                               juliaElseTok,
                                               juliaElseifTok,
                                               juliaEndTok,
                                               juliaExportTok,
                                               juliaFinallyTok,
                                               juliaForTok,
                                               juliaFunctionTok,
                                               juliaIfTok,
                                               juliaImportTok,
                                               juliaInTok,
                                               juliaIsaTok,
                                               juliaLetTok,
                                               juliaMacroTok,
                                               juliaModuleTok,
                                               juliaMutableTok,
                                               juliaPrimitiveTok,
                                               juliaQuoteTok,
                                               juliaReturnTok,
                                               juliaStructTok,
                                               juliaTryTok,
                                               juliaTypeTok,
                                               juliaUsingTok,
                                               juliaWhileTok,
                                               juliaLCurlyTok,
                                               juliaPipeGreaterThanTok,
                                               juliaDoublePipeTok,
                                               juliaRCurlyTok,
                                               juliaTildeTok,
                                               julia¬Tok,
                                               juliaℯubleTok,
                                               julia√Tok,
                                               julia∛Tok,
                                               julia∜Tok
                                             }
const juliaHiddenKinds*: set[JuliaNodeKind] = {
                                                juliaHidPowerOperator,
                                                juliaHidExpressionList,
                                                juliaHidArrowOperator,
                                                juliaHidExpression,
                                                juliaHidDefinition,
                                                juliaHidPrimaryExpression,
                                                juliaHidAssignOperator,
                                                juliaHidPlusOperator,
                                                juliaHidTimesOperator,
                                                juliaHidStatement,
                                                juliaHidTerminator,
                                                juliaHidComprehensionClause,
                                                juliaHidImmediateParen,
                                                juliaHidComparisonOperator
                                              }
proc tsNodeType*(node: TsJuliaNode): string


proc kind*(node: TsJuliaNode): JuliaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_definition":                    juliaHidDefinition
      of "_expression":                    juliaHidExpression
      of "_statement":                     juliaHidStatement
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


func `[]`*(
    node: TsJuliaNode,
    idx:  int,
    kind: JuliaNodeKind | set[JuliaNodeKind]
  ): TsJuliaNode =
  assert 0 <= idx and idx < node.len
  result = TsJuliaNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  JuliaNode* = HtsNode[TsJuliaNode, JuliaNodeKind]


proc treeReprTsJulia*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsJuliaNode, JuliaNodeKind](parseTsJuliaString(str), str, 5, unnamed = unnamed)

proc toHtsNode*(
    node: TsJuliaNode,
    str:  ptr string
  ): HtsNode[TsJuliaNode, JuliaNodeKind] =
  toHtsNode[TsJuliaNode, JuliaNodeKind](node, str)

proc toHtsTree*(node: TsJuliaNode, str: ptr string): JuliaNode =
  toHtsNode[TsJuliaNode, JuliaNodeKind](node, str)

proc parseJuliaString*(str: ptr string, unnamed: bool = false): JuliaNode =
  let parser = newTsJuliaParser()
  return toHtsTree[TsJuliaNode, JuliaNodeKind](parseString(parser, str[]), str)

proc parseJuliaString*(str: string, unnamed: bool = false): JuliaNode =
  let parser = newTsJuliaParser()
  return toHtsTree[TsJuliaNode, JuliaNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let juliaGrammar*: array[JuliaNodeKind, HtsRule[JuliaNodeKind]] = block:
                                                                    var rules: array[JuliaNodeKind, HtsRule[JuliaNodeKind]]
                                                                    type
                                                                      K = JuliaNodeKind


                                                                    rules[juliaBareTupleExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaHidExpression))))
                                                                    rules[juliaHidPowerOperator] = tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K]("^"), tsString[K]("\xE2\x86\x91"), tsString[K]("\xE2\x86\x93"), tsString[K]("\xE2\x87\xB5"), tsString[K]("\xE2\x9F\xB0"), tsString[K]("\xE2\x9F\xB1"), tsString[K]("\xE2\xA4\x88"), tsString[K]("\xE2\xA4\x89"), tsString[K]("\xE2\xA4\x8A"), tsString[K]("\xE2\xA4\x8B"), tsString[K]("\xE2\xA4\x92"), tsString[K]("\xE2\xA4\x93"), tsString[K]("\xE2\xA5\x89"), tsString[K]("\xE2\xA5\x8C"), tsString[K]("\xE2\xA5\x8D"), tsString[K]("\xE2\xA5\x8F"), tsString[K]("\xE2\xA5\x91"), tsString[K]("\xE2\xA5\x94"), tsString[K]("\xE2\xA5\x95"), tsString[K]("\xE2\xA5\x98"), tsString[K]("\xE2\xA5\x99"), tsString[K]("\xE2\xA5\x9C"), tsString[K]("\xE2\xA5\x9D"), tsString[K]("\xE2\xA5\xA0"), tsString[K]("\xE2\xA5\xA1"), tsString[K]("\xE2\xA5\xA3"), tsString[K]("\xE2\xA5\xA5"), tsString[K]("\xE2\xA5\xAE"), tsString[K]("\xE2\xA5\xAF"), tsString[K]("\xEF\xBF\xAA"), tsString[K]("\xEF\xBF\xAC")))
                                                                    rules[juliaHidExpressionList] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaAssignmentExpression), tsSymbol[K](juliaBareTupleExpression)), tsRepeat[K](tsSeq[K](tsSymbol[K](juliaHidTerminator), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaAssignmentExpression), tsSymbol[K](juliaBareTupleExpression))))), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()))
                                                                    rules[juliaCommandString] = tsSeq[K](tsString[K]("`"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^`\\\\\\n]"), tsRegex[K]("\\\\."))), tsString[K]("`"))
                                                                    rules[juliaForClause] = tsSeq[K](tsString[K]("for"), tsSeq[K](tsSymbol[K](juliaForBinding), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaForBinding)))))
                                                                    rules[juliaDoClause] = tsSeq[K](tsString[K]("do"), tsSymbol[K](juliaHidExpressionList), tsString[K]("end"))
                                                                    rules[juliaMacroArgumentList] = tsRepeat1[K](tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaBareTupleExpression)), tsBlank[K]()))
                                                                    rules[juliaHidExpression] = tsChoice[K](tsSymbol[K](juliaHidStatement), tsSymbol[K](juliaHidDefinition), tsSymbol[K](juliaTypedExpression), tsSymbol[K](juliaCompoundExpression), tsSymbol[K](juliaPairExpression), tsString[K](":"), tsSymbol[K](juliaMacroExpression), tsSymbol[K](juliaUnaryExpression), tsSymbol[K](juliaBinaryExpression), tsSymbol[K](juliaTernaryExpression), tsSymbol[K](juliaGeneratorExpression), tsSymbol[K](juliaFunctionExpression), tsSymbol[K](juliaCoefficientExpression), tsSymbol[K](juliaSpreadExpression), tsSymbol[K](juliaRangeExpression), tsSymbol[K](juliaQuoteExpression), tsSymbol[K](juliaInterpolationExpression), tsSymbol[K](juliaNumber), tsSymbol[K](juliaHidPrimaryExpression))
                                                                    rules[juliaHidDefinition] = tsChoice[K](tsSymbol[K](juliaAbstractDefinition), tsSymbol[K](juliaPrimitiveDefinition), tsSymbol[K](juliaStructDefinition), tsSymbol[K](juliaModuleDefinition), tsSymbol[K](juliaFunctionDefinition), tsSymbol[K](juliaMacroDefinition))
                                                                    rules[juliaForStatement] = tsSeq[K](tsString[K]("for"), tsSeq[K](tsSymbol[K](juliaForBinding), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaForBinding)))), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaTupleExpression] = tsSeq[K](tsString[K]("("), tsChoice[K](tsChoice[K](tsString[K](","), tsBlank[K]()), tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaNamedField)), tsString[K](",")), tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaNamedField)), tsRepeat1[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaNamedField)))), tsChoice[K](tsString[K](","), tsBlank[K]()))), tsString[K](")"))
                                                                    rules[juliaMatrixExpression] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](juliaMatrixRow), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](juliaMatrixRow)))), tsBlank[K]()), tsChoice[K](tsString[K](";"), tsBlank[K]()), tsString[K]("]"))
                                                                    rules[juliaTypedParameter] = tsSeq[K](tsSymbol[K](juliaIdentifier), tsString[K]("::"), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaParameterizedIdentifier)))
                                                                    rules[juliaCompoundExpression] = tsSeq[K](tsString[K]("begin"), tsSymbol[K](juliaHidExpressionList), tsString[K]("end"))
                                                                    rules[juliaHidPrimaryExpression] = tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaOperator), tsSymbol[K](juliaString), tsSymbol[K](juliaCommandString), tsSymbol[K](juliaCharacter), tsSymbol[K](juliaTripleString), tsSymbol[K](juliaArrayExpression), tsSymbol[K](juliaArrayComprehensionExpression), tsSymbol[K](juliaMatrixExpression), tsSymbol[K](juliaCallExpression), tsSymbol[K](juliaFieldExpression), tsSymbol[K](juliaParenthesizedExpression), tsSymbol[K](juliaSubscriptExpression), tsSymbol[K](juliaParameterizedIdentifier), tsSymbol[K](juliaTupleExpression), tsSymbol[K](juliaBroadcastCallExpression))
                                                                    rules[juliaExportStatement] = tsSeq[K](tsString[K]("export"), tsSeq[K](tsSymbol[K](juliaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaIdentifier)))))
                                                                    rules[juliaFunctionExpression] = tsChoice[K](tsSeq[K](tsString[K]("function"), tsSymbol[K](juliaParameterList), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaAssignmentExpression)), tsString[K]("end")), tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaParameterList)), tsString[K]("->"), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaAssignmentExpression))))
                                                                    rules[juliaParameterizedIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaFieldExpression)), tsSymbol[K](juliaTypeArgumentList))
                                                                    rules[juliaConstStatement] = tsSeq[K](tsString[K]("const"), tsSeq[K](tsSymbol[K](juliaVariableDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaVariableDeclaration)))))
                                                                    rules[juliaMatrixRow] = tsRepeat1[K](tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaScopedIdentifier] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaScopedIdentifier)), tsBlank[K]()), tsString[K]("."), tsSymbol[K](juliaIdentifier))
                                                                    rules[juliaTypeParameterList] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaConstrainedParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaConstrainedParameter))))), tsString[K]("}"))
                                                                    rules[juliaRangeExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K](":"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaUnaryExpression] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K](">:"), tsString[K]("+"), tsString[K]("-"), tsString[K]("!"), tsString[K]("~"), tsString[K]("\xC2\xAC"), tsString[K]("\xE2\x88\x9A"), tsString[K]("\xE2\x88\x9B"), tsString[K]("\xE2\x88\x9C")), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsChoice[K](tsString[K]("\'"), tsString[K](".\'"))))
                                                                    rules[juliaSourceFile] = tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]())
                                                                    rules[juliaFieldExpression] = tsSeq[K](tsSymbol[K](juliaHidPrimaryExpression), tsString[K]("."), tsSymbol[K](juliaIdentifier))
                                                                    rules[juliaComment] = tsSeq[K](tsString[K]("#"), tsRegex[K](".*"))
                                                                    rules[juliaImportStatement] = tsSeq[K](tsChoice[K](tsString[K]("using"), tsString[K]("import")), tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaScopedIdentifier), tsSymbol[K](juliaSelectedImport)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaScopedIdentifier), tsSymbol[K](juliaSelectedImport))))))
                                                                    rules[juliaSelectedImport] = tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaScopedIdentifier)), tsString[K](":"), tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaMacroIdentifier)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaMacroIdentifier))))))
                                                                    rules[juliaElseifClause] = tsSeq[K](tsString[K]("elseif"), tsSymbol[K](juliaHidExpression), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()))
                                                                    rules[juliaElseClause] = tsSeq[K](tsString[K]("else"), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()))
                                                                    rules[juliaLetStatement] = tsSeq[K](tsString[K]("let"), tsSeq[K](tsSymbol[K](juliaVariableDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaVariableDeclaration)))), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaArrayComprehensionExpression] = tsSeq[K](tsString[K]("["), tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaHidComprehensionClause), tsString[K]("]"))
                                                                    rules[juliaHidStatement] = tsChoice[K](tsSymbol[K](juliaIfStatement), tsSymbol[K](juliaTryStatement), tsSymbol[K](juliaForStatement), tsSymbol[K](juliaWhileStatement), tsSymbol[K](juliaLetStatement), tsSymbol[K](juliaConstStatement), tsSymbol[K](juliaQuoteStatement), tsSymbol[K](juliaBreakStatement), tsSymbol[K](juliaContinueStatement), tsSymbol[K](juliaReturnStatement), tsSymbol[K](juliaImportStatement), tsSymbol[K](juliaExportStatement))
                                                                    rules[juliaIdentifier] = tsRegex[K]("[_a-zA-Z\xCD\xB0-\xCF\xBF\xC4\x80-\xC5\xBF\xE2\x88\x87][^\"\'\\s\\.\\-\\[\\],;:(){}&|$\xE2\x86\x90\xE2\x86\x92\xE2\x86\x94\xE2\x86\x9A\xE2\x86\x9B\xE2\x86\x9E\xE2\x86\xA0\xE2\x86\xA2\xE2\x86\xA3\xE2\x86\xA6\xE2\x86\xA4\xE2\x86\xAE\xE2\x87\x8E\xE2\x87\x8D\xE2\x87\x8F\xE2\x87\x90\xE2\x87\x92\xE2\x87\x94\xE2\x87\xB4\xE2\x87\xB6\xE2\x87\xB7\xE2\x87\xB8\xE2\x87\xB9\xE2\x87\xBA\xE2\x87\xBB\xE2\x87\xBC\xE2\x87\xBD\xE2\x87\xBE\xE2\x87\xBF\xE2\x9F\xB5\xE2\x9F\xB6\xE2\x9F\xB7\xE2\x9F\xB9\xE2\x9F\xBA\xE2\x9F\xBB\xE2\x9F\xBC\xE2\x9F\xBD\xE2\x9F\xBE\xE2\x9F\xBF\xE2\xA4\x80\xE2\xA4\x81\xE2\xA4\x82\xE2\xA4\x83\xE2\xA4\x84\xE2\xA4\x85\xE2\xA4\x86\xE2\xA4\x87\xE2\xA4\x8C\xE2\xA4\x8D\xE2\xA4\x8E\xE2\xA4\x8F\xE2\xA4\x90\xE2\xA4\x91\xE2\xA4\x94\xE2\xA4\x95\xE2\xA4\x96\xE2\xA4\x97\xE2\xA4\x98\xE2\xA4\x9D\xE2\xA4\x9E\xE2\xA4\x9F\xE2\xA4\xA0\xE2\xA5\x84\xE2\xA5\x85\xE2\xA5\x86\xE2\xA5\x87\xE2\xA5\x88\xE2\xA5\x8A\xE2\xA5\x8B\xE2\xA5\x8E\xE2\xA5\x90\xE2\xA5\x92\xE2\xA5\x93\xE2\xA5\x96\xE2\xA5\x97\xE2\xA5\x9A\xE2\xA5\x9B\xE2\xA5\x9E\xE2\xA5\x9F\xE2\xA5\xA2\xE2\xA5\xA4\xE2\xA5\xA6\xE2\xA5\xA7\xE2\xA5\xA8\xE2\xA5\xA9\xE2\xA5\xAA\xE2\xA5\xAB\xE2\xA5\xAC\xE2\xA5\xAD\xE2\xA5\xB0\xE2\xA7\xB4\xE2\xAC\xB1\xE2\xAC\xB0\xE2\xAC\xB2\xE2\xAC\xB3\xE2\xAC\xB4\xE2\xAC\xB5\xE2\xAC\xB6\xE2\xAC\xB7\xE2\xAC\xB8\xE2\xAC\xB9\xE2\xAC\xBA\xE2\xAC\xBB\xE2\xAC\xBC\xE2\xAC\xBD\xE2\xAC\xBE\xE2\xAC\xBF\xE2\xAD\x80\xE2\xAD\x81\xE2\xAD\x82\xE2\xAD\x83\xE2\xAD\x84\xE2\xAD\x87\xE2\xAD\x88\xE2\xAD\x89\xE2\xAD\x8A\xE2\xAD\x8B\xE2\xAD\x8C\xEF\xBF\xA9\xEF\xBF\xAB\xE2\x87\x9C\xE2\x87\x9D\xE2\x86\x9C\xE2\x86\x9D\xE2\x86\xA9\xE2\x86\xAA\xE2\x86\xAB\xE2\x86\xAC\xE2\x86\xBC\xE2\x86\xBD\xE2\x87\x80\xE2\x87\x81\xE2\x87\x84\xE2\x87\x86\xE2\x87\x87\xE2\x87\x89\xE2\x87\x8B\xE2\x87\x8C\xE2\x87\x9A\xE2\x87\x9B\xE2\x87\xA0\xE2\x87\xA2=+==*=/=//=|=|^=\xC3\xB7=%=<<=>>=>>>=||=|&=\xE2\x8A\xBB=\xE2\x89\x94\xE2\xA9\xB4\xE2\x89\x95><>=\xE2\x89\xA5<=\xE2\x89\xA4=====\xE2\x89\xA1=\xE2\x89\xA0==\xE2\x89\xA2\xE2\x88\x88\xE2\x88\x89\xE2\x88\x8B\xE2\x88\x8C\xE2\x8A\x86\xE2\x8A\x88\xE2\x8A\x82\xE2\x8A\x84\xE2\x8A\x8A\xE2\x88\x9D\xE2\x88\x8A\xE2\x88\x8D\xE2\x88\xA5\xE2\x88\xA6\xE2\x88\xB7\xE2\x88\xBA\xE2\x88\xBB\xE2\x88\xBD\xE2\x88\xBE\xE2\x89\x81\xE2\x89\x83\xE2\x89\x82\xE2\x89\x84\xE2\x89\x85\xE2\x89\x86\xE2\x89\x87\xE2\x89\x88\xE2\x89\x89\xE2\x89\x8A\xE2\x89\x8B\xE2\x89\x8C\xE2\x89\x8D\xE2\x89\x8E\xE2\x89\x90\xE2\x89\x91\xE2\x89\x92\xE2\x89\x93\xE2\x89\x96\xE2\x89\x97\xE2\x89\x98\xE2\x89\x99\xE2\x89\x9A\xE2\x89\x9B\xE2\x89\x9C\xE2\x89\x9D\xE2\x89\x9E\xE2\x89\x9F\xE2\x89\xA3\xE2\x89\xA6\xE2\x89\xA7\xE2\x89\xA8\xE2\x89\xA9\xE2\x89\xAA\xE2\x89\xAB\xE2\x89\xAC\xE2\x89\xAD\xE2\x89\xAE\xE2\x89\xAF\xE2\x89\xB0\xE2\x89\xB1\xE2\x89\xB2\xE2\x89\xB3\xE2\x89\xB4\xE2\x89\xB5\xE2\x89\xB6\xE2\x89\xB7\xE2\x89\xB8\xE2\x89\xB9\xE2\x89\xBA\xE2\x89\xBB\xE2\x89\xBC\xE2\x89\xBD\xE2\x89\xBE\xE2\x89\xBF\xE2\x8A\x80\xE2\x8A\x81\xE2\x8A\x83\xE2\x8A\x85\xE2\x8A\x87\xE2\x8A\x89\xE2\x8A\x8B\xE2\x8A\x8F\xE2\x8A\x90\xE2\x8A\x91\xE2\x8A\x92\xE2\x8A\x9C\xE2\x8A\xA9\xE2\x8A\xAC\xE2\x8A\xAE\xE2\x8A\xB0\xE2\x8A\xB1\xE2\x8A\xB2\xE2\x8A\xB3\xE2\x8A\xB4\xE2\x8A\xB5\xE2\x8A\xB6\xE2\x8A\xB7\xE2\x8B\x8D\xE2\x8B\x90\xE2\x8B\x91\xE2\x8B\x95\xE2\x8B\x96\xE2\x8B\x97\xE2\x8B\x98\xE2\x8B\x99\xE2\x8B\x9A\xE2\x8B\x9B\xE2\x8B\x9C\xE2\x8B\x9D\xE2\x8B\x9E\xE2\x8B\x9F\xE2\x8B\xA0\xE2\x8B\xA1\xE2\x8B\xA2\xE2\x8B\xA3\xE2\x8B\xA4\xE2\x8B\xA5\xE2\x8B\xA6\xE2\x8B\xA7\xE2\x8B\xA8\xE2\x8B\xA9\xE2\x8B\xAA\xE2\x8B\xAB\xE2\x8B\xAC\xE2\x8B\xAD\xE2\x8B\xB2\xE2\x8B\xB3\xE2\x8B\xB4\xE2\x8B\xB5\xE2\x8B\xB6\xE2\x8B\xB7\xE2\x8B\xB8\xE2\x8B\xB9\xE2\x8B\xBA\xE2\x8B\xBB\xE2\x8B\xBC\xE2\x8B\xBD\xE2\x8B\xBE\xE2\x8B\xBF\xE2\x9F\x88\xE2\x9F\x89\xE2\x9F\x92\xE2\xA6\xB7\xE2\xA7\x80\xE2\xA7\x81\xE2\xA7\xA1\xE2\xA7\xA3\xE2\xA7\xA4\xE2\xA7\xA5\xE2\xA9\xA6\xE2\xA9\xA7\xE2\xA9\xAA\xE2\xA9\xAB\xE2\xA9\xAC\xE2\xA9\xAD\xE2\xA9\xAE\xE2\xA9\xAF\xE2\xA9\xB0\xE2\xA9\xB1\xE2\xA9\xB2\xE2\xA9\xB3\xE2\xA9\xB5\xE2\xA9\xB6\xE2\xA9\xB7\xE2\xA9\xB8\xE2\xA9\xB9\xE2\xA9\xBA\xE2\xA9\xBB\xE2\xA9\xBC\xE2\xA9\xBD\xE2\xA9\xBE\xE2\xA9\xBF\xE2\xAA\x80\xE2\xAA\x81\xE2\xAA\x82\xE2\xAA\x83\xE2\xAA\x84\xE2\xAA\x85\xE2\xAA\x86\xE2\xAA\x87\xE2\xAA\x88\xE2\xAA\x89\xE2\xAA\x8A\xE2\xAA\x8B\xE2\xAA\x8C\xE2\xAA\x8D\xE2\xAA\x8E\xE2\xAA\x8F\xE2\xAA\x90\xE2\xAA\x91\xE2\xAA\x92\xE2\xAA\x93\xE2\xAA\x94\xE2\xAA\x95\xE2\xAA\x96\xE2\xAA\x97\xE2\xAA\x98\xE2\xAA\x99\xE2\xAA\x9A\xE2\xAA\x9B\xE2\xAA\x9C\xE2\xAA\x9D\xE2\xAA\x9E\xE2\xAA\x9F\xE2\xAA\xA0\xE2\xAA\xA1\xE2\xAA\xA2\xE2\xAA\xA3\xE2\xAA\xA4\xE2\xAA\xA5\xE2\xAA\xA6\xE2\xAA\xA7\xE2\xAA\xA8\xE2\xAA\xA9\xE2\xAA\xAA\xE2\xAA\xAB\xE2\xAA\xAC\xE2\xAA\xAD\xE2\xAA\xAE\xE2\xAA\xAF\xE2\xAA\xB0\xE2\xAA\xB1\xE2\xAA\xB2\xE2\xAA\xB3\xE2\xAA\xB4\xE2\xAA\xB5\xE2\xAA\xB6\xE2\xAA\xB7\xE2\xAA\xB8\xE2\xAA\xB9\xE2\xAA\xBA\xE2\xAA\xBB\xE2\xAA\xBC\xE2\xAA\xBD\xE2\xAA\xBE\xE2\xAA\xBF\xE2\xAB\x80\xE2\xAB\x81\xE2\xAB\x82\xE2\xAB\x83\xE2\xAB\x84\xE2\xAB\x85\xE2\xAB\x86\xE2\xAB\x87\xE2\xAB\x88\xE2\xAB\x89\xE2\xAB\x8A\xE2\xAB\x8B\xE2\xAB\x8C\xE2\xAB\x8D\xE2\xAB\x8E\xE2\xAB\x8F\xE2\xAB\x90\xE2\xAB\x91\xE2\xAB\x92\xE2\xAB\x93\xE2\xAB\x94\xE2\xAB\x95\xE2\xAB\x96\xE2\xAB\x97\xE2\xAB\x98\xE2\xAB\x99\xE2\xAB\xB7\xE2\xAB\xB8\xE2\xAB\xB9\xE2\xAB\xBA\xE2\x8A\xA2\xE2\x8A\xA3\xE2\x9F\x82+|||\xE2\x8A\x95\xE2\x8A\x96\xE2\x8A\x9E\xE2\x8A\x9F|++|\xE2\x88\xAA\xE2\x88\xA8\xE2\x8A\x94\xC2\xB1\xE2\x88\x93\xE2\x88\x94\xE2\x88\xB8\xE2\x89\x82\xE2\x89\x8F\xE2\x8A\x8E\xE2\x8A\xBB\xE2\x8A\xBD\xE2\x8B\x8E\xE2\x8B\x93\xE2\xA7\xBA\xE2\xA7\xBB\xE2\xA8\x88\xE2\xA8\xA2\xE2\xA8\xA3\xE2\xA8\xA4\xE2\xA8\xA5\xE2\xA8\xA6\xE2\xA8\xA7\xE2\xA8\xA8\xE2\xA8\xA9\xE2\xA8\xAA\xE2\xA8\xAB\xE2\xA8\xAC\xE2\xA8\xAD\xE2\xA8\xAE\xE2\xA8\xB9\xE2\xA8\xBA\xE2\xA9\x81\xE2\xA9\x82\xE2\xA9\x85\xE2\xA9\x8A\xE2\xA9\x8C\xE2\xA9\x8F\xE2\xA9\x90\xE2\xA9\x92\xE2\xA9\x94\xE2\xA9\x96\xE2\xA9\x97\xE2\xA9\x9B\xE2\xA9\x9D\xE2\xA9\xA1\xE2\xA9\xA2\xE2\xA9\xA3^\xE2\x86\x91\xE2\x86\x93\xE2\x87\xB5\xE2\x9F\xB0\xE2\x9F\xB1\xE2\xA4\x88\xE2\xA4\x89\xE2\xA4\x8A\xE2\xA4\x8B\xE2\xA4\x92\xE2\xA4\x93\xE2\xA5\x89\xE2\xA5\x8C\xE2\xA5\x8D\xE2\xA5\x8F\xE2\xA5\x91\xE2\xA5\x94\xE2\xA5\x95\xE2\xA5\x98\xE2\xA5\x99\xE2\xA5\x9C\xE2\xA5\x9D\xE2\xA5\xA0\xE2\xA5\xA1\xE2\xA5\xA3\xE2\xA5\xA5\xE2\xA5\xAE\xE2\xA5\xAF\xEF\xBF\xAA\xEF\xBF\xAC*/\xC3\xB7%&\xE2\x8B\x85\xE2\x88\x98\xC3\x97\\\\\xE2\x88\xA9\xE2\x88\xA7\xE2\x8A\x97\xE2\x8A\x98\xE2\x8A\x99\xE2\x8A\x9A\xE2\x8A\x9B\xE2\x8A\xA0\xE2\x8A\xA1\xE2\x8A\x93\xE2\x88\x97\xE2\x88\x99\xE2\x88\xA4\xE2\x85\x8B\xE2\x89\x80\xE2\x8A\xBC\xE2\x8B\x84\xE2\x8B\x86\xE2\x8B\x87\xE2\x8B\x89\xE2\x8B\x8A\xE2\x8B\x8B\xE2\x8B\x8C\xE2\x8B\x8F\xE2\x8B\x92\xE2\x9F\x91\xE2\xA6\xB8\xE2\xA6\xBC\xE2\xA6\xBE\xE2\xA6\xBF\xE2\xA7\xB6\xE2\xA7\xB7\xE2\xA8\x87\xE2\xA8\xB0\xE2\xA8\xB1\xE2\xA8\xB2\xE2\xA8\xB3\xE2\xA8\xB4\xE2\xA8\xB5\xE2\xA8\xB6\xE2\xA8\xB7\xE2\xA8\xB8\xE2\xA8\xBB\xE2\xA8\xBC\xE2\xA8\xBD\xE2\xA9\x80\xE2\xA9\x83\xE2\xA9\x84\xE2\xA9\x8B\xE2\xA9\x8D\xE2\xA9\x8E\xE2\xA9\x91\xE2\xA9\x93\xE2\xA9\x95\xE2\xA9\x98\xE2\xA9\x9A\xE2\xA9\x9C\xE2\xA9\x9E\xE2\xA9\x9F\xE2\xA9\xA0\xE2\xAB\x9B\xE2\x8A\x8D\xE2\x96\xB7\xE2\xA8\x9D\xE2\x9F\x95\xE2\x9F\x96\xE2\x9F\x97]*")
                                                                    rules[juliaSubscriptExpression] = tsSeq[K](tsSymbol[K](juliaHidPrimaryExpression), tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](juliaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaHidExpression)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                    rules[juliaTernaryExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("?"), tsSymbol[K](juliaHidExpression), tsString[K](":"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaAbstractDefinition] = tsSeq[K](tsString[K]("abstract"), tsString[K]("type"), tsSymbol[K](juliaIdentifier), tsChoice[K](tsSymbol[K](juliaTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaSubtypeClause), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaHidComprehensionClause] = tsSeq[K](tsSymbol[K](juliaForClause), tsRepeat[K](tsChoice[K](tsSymbol[K](juliaForClause), tsSymbol[K](juliaIfClause))))
                                                                    rules[juliaSubtypeClause] = tsSeq[K](tsString[K]("<:"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaParameterList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaSpreadParameter), tsSymbol[K](juliaOptionalParameter), tsSymbol[K](juliaTypedParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaSpreadParameter), tsSymbol[K](juliaOptionalParameter), tsSymbol[K](juliaTypedParameter))))), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaKeywordParameters), tsBlank[K]()), tsString[K](")"))
                                                                    rules[juliaFinallyClause] = tsSeq[K](tsString[K]("finally"), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()))
                                                                    rules[juliaParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsSymbol[K](juliaSpreadExpression)), tsString[K](")"))
                                                                    rules[juliaGeneratorExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaHidComprehensionClause), tsString[K](")"))
                                                                    rules[juliaForBinding] = tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaTupleExpression)), tsChoice[K](tsString[K]("in"), tsString[K]("="), tsString[K]("\xE2\x88\x88")), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](juliaHidExpression), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaOptionalParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaTypedParameter)), tsString[K]("="), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaArrayExpression] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](juliaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaHidExpression)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                    rules[juliaHidArrowOperator] = tsChoice[K](tsString[K]("--"), tsString[K]("-->"), tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K]("\xE2\x86\x90"), tsString[K]("\xE2\x86\x92"), tsString[K]("\xE2\x86\x94"), tsString[K]("\xE2\x86\x9A"), tsString[K]("\xE2\x86\x9B"), tsString[K]("\xE2\x86\x9E"), tsString[K]("\xE2\x86\xA0"), tsString[K]("\xE2\x86\xA2"), tsString[K]("\xE2\x86\xA3"), tsString[K]("\xE2\x86\xA6"), tsString[K]("\xE2\x86\xA4"), tsString[K]("\xE2\x86\xAE"), tsString[K]("\xE2\x87\x8E"), tsString[K]("\xE2\x87\x8D"), tsString[K]("\xE2\x87\x8F"), tsString[K]("\xE2\x87\x90"), tsString[K]("\xE2\x87\x92"), tsString[K]("\xE2\x87\x94"), tsString[K]("\xE2\x87\xB4"), tsString[K]("\xE2\x87\xB6"), tsString[K]("\xE2\x87\xB7"), tsString[K]("\xE2\x87\xB8"), tsString[K]("\xE2\x87\xB9"), tsString[K]("\xE2\x87\xBA"), tsString[K]("\xE2\x87\xBB"), tsString[K]("\xE2\x87\xBC"), tsString[K]("\xE2\x87\xBD"), tsString[K]("\xE2\x87\xBE"), tsString[K]("\xE2\x87\xBF"), tsString[K]("\xE2\x9F\xB5"), tsString[K]("\xE2\x9F\xB6"), tsString[K]("\xE2\x9F\xB7"), tsString[K]("\xE2\x9F\xB9"), tsString[K]("\xE2\x9F\xBA"), tsString[K]("\xE2\x9F\xBB"), tsString[K]("\xE2\x9F\xBC"), tsString[K]("\xE2\x9F\xBD"), tsString[K]("\xE2\x9F\xBE"), tsString[K]("\xE2\x9F\xBF"), tsString[K]("\xE2\xA4\x80"), tsString[K]("\xE2\xA4\x81"), tsString[K]("\xE2\xA4\x82"), tsString[K]("\xE2\xA4\x83"), tsString[K]("\xE2\xA4\x84"), tsString[K]("\xE2\xA4\x85"), tsString[K]("\xE2\xA4\x86"), tsString[K]("\xE2\xA4\x87"), tsString[K]("\xE2\xA4\x8C"), tsString[K]("\xE2\xA4\x8D"), tsString[K]("\xE2\xA4\x8E"), tsString[K]("\xE2\xA4\x8F"), tsString[K]("\xE2\xA4\x90"), tsString[K]("\xE2\xA4\x91"), tsString[K]("\xE2\xA4\x94"), tsString[K]("\xE2\xA4\x95"), tsString[K]("\xE2\xA4\x96"), tsString[K]("\xE2\xA4\x97"), tsString[K]("\xE2\xA4\x98"), tsString[K]("\xE2\xA4\x9D"), tsString[K]("\xE2\xA4\x9E"), tsString[K]("\xE2\xA4\x9F"), tsString[K]("\xE2\xA4\xA0"), tsString[K]("\xE2\xA5\x84"), tsString[K]("\xE2\xA5\x85"), tsString[K]("\xE2\xA5\x86"), tsString[K]("\xE2\xA5\x87"), tsString[K]("\xE2\xA5\x88"), tsString[K]("\xE2\xA5\x8A"), tsString[K]("\xE2\xA5\x8B"), tsString[K]("\xE2\xA5\x8E"), tsString[K]("\xE2\xA5\x90"), tsString[K]("\xE2\xA5\x92"), tsString[K]("\xE2\xA5\x93"), tsString[K]("\xE2\xA5\x96"), tsString[K]("\xE2\xA5\x97"), tsString[K]("\xE2\xA5\x9A"), tsString[K]("\xE2\xA5\x9B"), tsString[K]("\xE2\xA5\x9E"), tsString[K]("\xE2\xA5\x9F"), tsString[K]("\xE2\xA5\xA2"), tsString[K]("\xE2\xA5\xA4"), tsString[K]("\xE2\xA5\xA6"), tsString[K]("\xE2\xA5\xA7"), tsString[K]("\xE2\xA5\xA8"), tsString[K]("\xE2\xA5\xA9"), tsString[K]("\xE2\xA5\xAA"), tsString[K]("\xE2\xA5\xAB"), tsString[K]("\xE2\xA5\xAC"), tsString[K]("\xE2\xA5\xAD"), tsString[K]("\xE2\xA5\xB0"), tsString[K]("\xE2\xA7\xB4"), tsString[K]("\xE2\xAC\xB1"), tsString[K]("\xE2\xAC\xB0"), tsString[K]("\xE2\xAC\xB2"), tsString[K]("\xE2\xAC\xB3"), tsString[K]("\xE2\xAC\xB4"), tsString[K]("\xE2\xAC\xB5"), tsString[K]("\xE2\xAC\xB6"), tsString[K]("\xE2\xAC\xB7"), tsString[K]("\xE2\xAC\xB8"), tsString[K]("\xE2\xAC\xB9"), tsString[K]("\xE2\xAC\xBA"), tsString[K]("\xE2\xAC\xBB"), tsString[K]("\xE2\xAC\xBC"), tsString[K]("\xE2\xAC\xBD"), tsString[K]("\xE2\xAC\xBE"), tsString[K]("\xE2\xAC\xBF"), tsString[K]("\xE2\xAD\x80"), tsString[K]("\xE2\xAD\x81"), tsString[K]("\xE2\xAD\x82"), tsString[K]("\xE2\xAD\x83"), tsString[K]("\xE2\xAD\x84"), tsString[K]("\xE2\xAD\x87"), tsString[K]("\xE2\xAD\x88"), tsString[K]("\xE2\xAD\x89"), tsString[K]("\xE2\xAD\x8A"), tsString[K]("\xE2\xAD\x8B"), tsString[K]("\xE2\xAD\x8C"), tsString[K]("\xEF\xBF\xA9"), tsString[K]("\xEF\xBF\xAB"), tsString[K]("\xE2\x87\x9C"), tsString[K]("\xE2\x87\x9D"), tsString[K]("\xE2\x86\x9C"), tsString[K]("\xE2\x86\x9D"), tsString[K]("\xE2\x86\xA9"), tsString[K]("\xE2\x86\xAA"), tsString[K]("\xE2\x86\xAB"), tsString[K]("\xE2\x86\xAC"), tsString[K]("\xE2\x86\xBC"), tsString[K]("\xE2\x86\xBD"), tsString[K]("\xE2\x87\x80"), tsString[K]("\xE2\x87\x81"), tsString[K]("\xE2\x87\x84"), tsString[K]("\xE2\x87\x86"), tsString[K]("\xE2\x87\x87"), tsString[K]("\xE2\x87\x89"), tsString[K]("\xE2\x87\x8B"), tsString[K]("\xE2\x87\x8C"), tsString[K]("\xE2\x87\x9A"), tsString[K]("\xE2\x87\x9B"), tsString[K]("\xE2\x87\xA0"), tsString[K]("\xE2\x87\xA2"))))
                                                                    rules[juliaTypedExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsChoice[K](tsString[K]("::"), tsString[K]("<:")), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaParameterizedIdentifier)))
                                                                    rules[juliaCallExpression] = tsSeq[K](tsSymbol[K](juliaHidPrimaryExpression), tsSymbol[K](juliaHidImmediateParen), tsChoice[K](tsSymbol[K](juliaArgumentList), tsSymbol[K](juliaGeneratorExpression)), tsChoice[K](tsSymbol[K](juliaDoClause), tsBlank[K]()))
                                                                    rules[juliaQuoteStatement] = tsSeq[K](tsString[K]("quote"), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaTryStatement] = tsSeq[K](tsString[K]("try"), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaCatchClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaFinallyClause), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaMacroIdentifier] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaOperator), tsString[K](".")))
                                                                    rules[juliaBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaHidPowerOperator), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaHidTimesOperator), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsChoice[K](tsString[K]("+"), tsSymbol[K](juliaHidPlusOperator)), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaHidArrowOperator), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("<|"), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("|>"), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsChoice[K](tsString[K]("in"), tsString[K]("isa"), tsSymbol[K](juliaHidComparisonOperator)), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("||"), tsSymbol[K](juliaHidExpression)), tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("&&"), tsSymbol[K](juliaHidExpression)))
                                                                    rules[juliaCharacter] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsRegex[K]("\\\\."), tsRegex[K]("[^\'\\\\]")), tsString[K]("\'"))
                                                                    rules[juliaString] = tsSeq[K](tsChoice[K](tsString[K]("\""), tsSeq[K](tsSymbol[K](juliaIdentifier), tsString[K]("\""))), tsChoice[K](tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\"\\\\\\n]"), tsRegex[K]("\\\\."))), tsBlank[K]()), tsString[K]("\""))
                                                                    rules[juliaStructDefinition] = tsSeq[K](tsChoice[K](tsString[K]("mutable"), tsBlank[K]()), tsString[K]("struct"), tsSymbol[K](juliaIdentifier), tsChoice[K](tsSymbol[K](juliaTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaSubtypeClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaHidAssignOperator] = tsChoice[K](tsString[K](":="), tsString[K]("~"), tsString[K]("$="), tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K]("="), tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("//="), tsString[K]("|=|"), tsString[K]("^="), tsString[K]("\xC3\xB7="), tsString[K]("%="), tsString[K]("<<="), tsString[K](">>="), tsString[K](">>>="), tsString[K]("||=|"), tsString[K]("&="), tsString[K]("\xE2\x8A\xBB="), tsString[K]("\xE2\x89\x94"), tsString[K]("\xE2\xA9\xB4"), tsString[K]("\xE2\x89\x95"))))
                                                                    rules[juliaPrimitiveDefinition] = tsSeq[K](tsString[K]("primitive"), tsString[K]("type"), tsSymbol[K](juliaIdentifier), tsChoice[K](tsSymbol[K](juliaTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaSubtypeClause), tsBlank[K]()), tsRegex[K]("[1-9][0-9]*"), tsString[K]("end"))
                                                                    rules[juliaBreakStatement] = tsString[K]("break")
                                                                    rules[juliaModuleDefinition] = tsSeq[K](tsString[K]("module"), tsSymbol[K](juliaIdentifier), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaTypeArgumentList] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaHidExpression))))), tsString[K]("}"))
                                                                    rules[juliaIfClause] = tsSeq[K](tsString[K]("if"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaInterpolationExpression] = tsSeq[K](tsString[K]("$"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaNamedField)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaNamedField))))), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](";"), tsSeq[K](tsSymbol[K](juliaNamedField), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](juliaNamedField))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                    rules[juliaSpreadExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("..."))
                                                                    rules[juliaIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](juliaHidExpression), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsRepeat[K](tsSymbol[K](juliaElseifClause)), tsChoice[K](tsSymbol[K](juliaElseClause), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaContinueStatement] = tsString[K]("continue")
                                                                    rules[juliaFunctionDefinition] = tsSeq[K](tsString[K]("function"), tsSymbol[K](juliaIdentifier), tsChoice[K](tsSymbol[K](juliaTypeParameterList), tsBlank[K]()), tsSymbol[K](juliaParameterList), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaPairExpression] = tsSeq[K](tsSymbol[K](juliaHidExpression), tsString[K]("=>"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaHidPlusOperator] = tsChoice[K](tsString[K]("$"), tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("|||"), tsString[K]("\xE2\x8A\x95"), tsString[K]("\xE2\x8A\x96"), tsString[K]("\xE2\x8A\x9E"), tsString[K]("\xE2\x8A\x9F"), tsString[K]("|++|"), tsString[K]("\xE2\x88\xAA"), tsString[K]("\xE2\x88\xA8"), tsString[K]("\xE2\x8A\x94"), tsString[K]("\xC2\xB1"), tsString[K]("\xE2\x88\x93"), tsString[K]("\xE2\x88\x94"), tsString[K]("\xE2\x88\xB8"), tsString[K]("\xE2\x89\x82"), tsString[K]("\xE2\x89\x8F"), tsString[K]("\xE2\x8A\x8E"), tsString[K]("\xE2\x8A\xBB"), tsString[K]("\xE2\x8A\xBD"), tsString[K]("\xE2\x8B\x8E"), tsString[K]("\xE2\x8B\x93"), tsString[K]("\xE2\xA7\xBA"), tsString[K]("\xE2\xA7\xBB"), tsString[K]("\xE2\xA8\x88"), tsString[K]("\xE2\xA8\xA2"), tsString[K]("\xE2\xA8\xA3"), tsString[K]("\xE2\xA8\xA4"), tsString[K]("\xE2\xA8\xA5"), tsString[K]("\xE2\xA8\xA6"), tsString[K]("\xE2\xA8\xA7"), tsString[K]("\xE2\xA8\xA8"), tsString[K]("\xE2\xA8\xA9"), tsString[K]("\xE2\xA8\xAA"), tsString[K]("\xE2\xA8\xAB"), tsString[K]("\xE2\xA8\xAC"), tsString[K]("\xE2\xA8\xAD"), tsString[K]("\xE2\xA8\xAE"), tsString[K]("\xE2\xA8\xB9"), tsString[K]("\xE2\xA8\xBA"), tsString[K]("\xE2\xA9\x81"), tsString[K]("\xE2\xA9\x82"), tsString[K]("\xE2\xA9\x85"), tsString[K]("\xE2\xA9\x8A"), tsString[K]("\xE2\xA9\x8C"), tsString[K]("\xE2\xA9\x8F"), tsString[K]("\xE2\xA9\x90"), tsString[K]("\xE2\xA9\x92"), tsString[K]("\xE2\xA9\x94"), tsString[K]("\xE2\xA9\x96"), tsString[K]("\xE2\xA9\x97"), tsString[K]("\xE2\xA9\x9B"), tsString[K]("\xE2\xA9\x9D"), tsString[K]("\xE2\xA9\xA1"), tsString[K]("\xE2\xA9\xA2"), tsString[K]("\xE2\xA9\xA3"))))
                                                                    rules[juliaHidTimesOperator] = tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("\xC3\xB7"), tsString[K]("%"), tsString[K]("&"), tsString[K]("\xE2\x8B\x85"), tsString[K]("\xE2\x88\x98"), tsString[K]("\xC3\x97"), tsString[K]("\\"), tsString[K]("\xE2\x88\xA9"), tsString[K]("\xE2\x88\xA7"), tsString[K]("\xE2\x8A\x97"), tsString[K]("\xE2\x8A\x98"), tsString[K]("\xE2\x8A\x99"), tsString[K]("\xE2\x8A\x9A"), tsString[K]("\xE2\x8A\x9B"), tsString[K]("\xE2\x8A\xA0"), tsString[K]("\xE2\x8A\xA1"), tsString[K]("\xE2\x8A\x93"), tsString[K]("\xE2\x88\x97"), tsString[K]("\xE2\x88\x99"), tsString[K]("\xE2\x88\xA4"), tsString[K]("\xE2\x85\x8B"), tsString[K]("\xE2\x89\x80"), tsString[K]("\xE2\x8A\xBC"), tsString[K]("\xE2\x8B\x84"), tsString[K]("\xE2\x8B\x86"), tsString[K]("\xE2\x8B\x87"), tsString[K]("\xE2\x8B\x89"), tsString[K]("\xE2\x8B\x8A"), tsString[K]("\xE2\x8B\x8B"), tsString[K]("\xE2\x8B\x8C"), tsString[K]("\xE2\x8B\x8F"), tsString[K]("\xE2\x8B\x92"), tsString[K]("\xE2\x9F\x91"), tsString[K]("\xE2\xA6\xB8"), tsString[K]("\xE2\xA6\xBC"), tsString[K]("\xE2\xA6\xBE"), tsString[K]("\xE2\xA6\xBF"), tsString[K]("\xE2\xA7\xB6"), tsString[K]("\xE2\xA7\xB7"), tsString[K]("\xE2\xA8\x87"), tsString[K]("\xE2\xA8\xB0"), tsString[K]("\xE2\xA8\xB1"), tsString[K]("\xE2\xA8\xB2"), tsString[K]("\xE2\xA8\xB3"), tsString[K]("\xE2\xA8\xB4"), tsString[K]("\xE2\xA8\xB5"), tsString[K]("\xE2\xA8\xB6"), tsString[K]("\xE2\xA8\xB7"), tsString[K]("\xE2\xA8\xB8"), tsString[K]("\xE2\xA8\xBB"), tsString[K]("\xE2\xA8\xBC"), tsString[K]("\xE2\xA8\xBD"), tsString[K]("\xE2\xA9\x80"), tsString[K]("\xE2\xA9\x83"), tsString[K]("\xE2\xA9\x84"), tsString[K]("\xE2\xA9\x8B"), tsString[K]("\xE2\xA9\x8D"), tsString[K]("\xE2\xA9\x8E"), tsString[K]("\xE2\xA9\x91"), tsString[K]("\xE2\xA9\x93"), tsString[K]("\xE2\xA9\x95"), tsString[K]("\xE2\xA9\x98"), tsString[K]("\xE2\xA9\x9A"), tsString[K]("\xE2\xA9\x9C"), tsString[K]("\xE2\xA9\x9E"), tsString[K]("\xE2\xA9\x9F"), tsString[K]("\xE2\xA9\xA0"), tsString[K]("\xE2\xAB\x9B"), tsString[K]("\xE2\x8A\x8D"), tsString[K]("\xE2\x96\xB7"), tsString[K]("\xE2\xA8\x9D"), tsString[K]("\xE2\x9F\x95"), tsString[K]("\xE2\x9F\x96"), tsString[K]("\xE2\x9F\x97")))
                                                                    rules[juliaBroadcastCallExpression] = tsSeq[K](tsSymbol[K](juliaHidPrimaryExpression), tsString[K]("."), tsSymbol[K](juliaHidImmediateParen), tsChoice[K](tsSymbol[K](juliaArgumentList), tsSymbol[K](juliaGeneratorExpression)), tsChoice[K](tsSymbol[K](juliaDoClause), tsBlank[K]()))
                                                                    rules[juliaCatchClause] = tsSeq[K](tsString[K]("catch"), tsChoice[K](tsSymbol[K](juliaIdentifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()))
                                                                    rules[juliaQuoteExpression] = tsSeq[K](tsString[K](":"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaNumber] = tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("0[xX]"), tsRegex[K]("[0-9a-fA-F][0-9a-fA-F_]*")), tsSeq[K](tsRegex[K]("[0-9][0-9_]*"), tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9][0-9_]*"), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsRegex[K]("[0-9][0-9_]*"))), tsChoice[K](tsRegex[K]("[eE][+-]?\\d+"), tsBlank[K]()))
                                                                    rules[juliaCoefficientExpression] = tsSeq[K](tsSymbol[K](juliaNumber), tsChoice[K](tsSymbol[K](juliaParenthesizedExpression), tsSymbol[K](juliaIdentifier)))
                                                                    rules[juliaMacroDefinition] = tsSeq[K](tsString[K]("macro"), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaOperator)), tsSymbol[K](juliaParameterList), tsChoice[K](tsSymbol[K](juliaHidExpressionList), tsBlank[K]()), tsString[K]("end"))
                                                                    rules[juliaNamedField] = tsSeq[K](tsSymbol[K](juliaIdentifier), tsString[K]("="), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaOperator] = tsChoice[K](tsString[K]("+"), tsSymbol[K](juliaHidPlusOperator), tsSymbol[K](juliaHidTimesOperator), tsSymbol[K](juliaHidPowerOperator))
                                                                    rules[juliaHidTerminator] = tsChoice[K](tsString[K]("\x0A"), tsString[K](";"))
                                                                    rules[juliaAssignmentExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaBareTupleExpression)), tsChoice[K](tsSymbol[K](juliaHidAssignOperator), tsString[K]("=")), tsChoice[K](tsSymbol[K](juliaHidExpression), tsSymbol[K](juliaAssignmentExpression), tsSymbol[K](juliaBareTupleExpression)))
                                                                    rules[juliaMacroExpression] = tsSeq[K](tsSymbol[K](juliaMacroIdentifier), tsChoice[K](tsChoice[K](tsSeq[K](tsSymbol[K](juliaHidImmediateParen), tsSymbol[K](juliaArgumentList)), tsSymbol[K](juliaMacroArgumentList)), tsBlank[K]()))
                                                                    rules[juliaConstrainedParameter] = tsSeq[K](tsSymbol[K](juliaIdentifier), tsString[K]("<:"), tsSymbol[K](juliaHidExpression))
                                                                    rules[juliaKeywordParameters] = tsSeq[K](tsString[K](";"), tsSeq[K](tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaSpreadParameter), tsSymbol[K](juliaOptionalParameter), tsSymbol[K](juliaTypedParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](juliaIdentifier), tsSymbol[K](juliaSpreadParameter), tsSymbol[K](juliaOptionalParameter), tsSymbol[K](juliaTypedParameter))))))
                                                                    rules[juliaSpreadParameter] = tsSeq[K](tsSymbol[K](juliaIdentifier), tsString[K]("..."))
                                                                    rules[juliaHidComparisonOperator] = tsChoice[K](tsString[K]("|<:|"), tsString[K]("|>:|"), tsSeq[K](tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsString[K](">"), tsString[K]("<"), tsString[K](">="), tsString[K]("\xE2\x89\xA5"), tsString[K]("<="), tsString[K]("\xE2\x89\xA4"), tsString[K]("=="), tsString[K]("==="), tsString[K]("\xE2\x89\xA1"), tsString[K]("!="), tsString[K]("\xE2\x89\xA0"), tsString[K]("!=="), tsString[K]("\xE2\x89\xA2"), tsString[K]("\xE2\x88\x88"), tsString[K]("\xE2\x88\x89"), tsString[K]("\xE2\x88\x8B"), tsString[K]("\xE2\x88\x8C"), tsString[K]("\xE2\x8A\x86"), tsString[K]("\xE2\x8A\x88"), tsString[K]("\xE2\x8A\x82"), tsString[K]("\xE2\x8A\x84"), tsString[K]("\xE2\x8A\x8A"), tsString[K]("\xE2\x88\x9D"), tsString[K]("\xE2\x88\x8A"), tsString[K]("\xE2\x88\x8D"), tsString[K]("\xE2\x88\xA5"), tsString[K]("\xE2\x88\xA6"), tsString[K]("\xE2\x88\xB7"), tsString[K]("\xE2\x88\xBA"), tsString[K]("\xE2\x88\xBB"), tsString[K]("\xE2\x88\xBD"), tsString[K]("\xE2\x88\xBE"), tsString[K]("\xE2\x89\x81"), tsString[K]("\xE2\x89\x83"), tsString[K]("\xE2\x89\x82"), tsString[K]("\xE2\x89\x84"), tsString[K]("\xE2\x89\x85"), tsString[K]("\xE2\x89\x86"), tsString[K]("\xE2\x89\x87"), tsString[K]("\xE2\x89\x88"), tsString[K]("\xE2\x89\x89"), tsString[K]("\xE2\x89\x8A"), tsString[K]("\xE2\x89\x8B"), tsString[K]("\xE2\x89\x8C"), tsString[K]("\xE2\x89\x8D"), tsString[K]("\xE2\x89\x8E"), tsString[K]("\xE2\x89\x90"), tsString[K]("\xE2\x89\x91"), tsString[K]("\xE2\x89\x92"), tsString[K]("\xE2\x89\x93"), tsString[K]("\xE2\x89\x96"), tsString[K]("\xE2\x89\x97"), tsString[K]("\xE2\x89\x98"), tsString[K]("\xE2\x89\x99"), tsString[K]("\xE2\x89\x9A"), tsString[K]("\xE2\x89\x9B"), tsString[K]("\xE2\x89\x9C"), tsString[K]("\xE2\x89\x9D"), tsString[K]("\xE2\x89\x9E"), tsString[K]("\xE2\x89\x9F"), tsString[K]("\xE2\x89\xA3"), tsString[K]("\xE2\x89\xA6"), tsString[K]("\xE2\x89\xA7"), tsString[K]("\xE2\x89\xA8"), tsString[K]("\xE2\x89\xA9"), tsString[K]("\xE2\x89\xAA"), tsString[K]("\xE2\x89\xAB"), tsString[K]("\xE2\x89\xAC"), tsString[K]("\xE2\x89\xAD"), tsString[K]("\xE2\x89\xAE"), tsString[K]("\xE2\x89\xAF"), tsString[K]("\xE2\x89\xB0"), tsString[K]("\xE2\x89\xB1"), tsString[K]("\xE2\x89\xB2"), tsString[K]("\xE2\x89\xB3"), tsString[K]("\xE2\x89\xB4"), tsString[K]("\xE2\x89\xB5"), tsString[K]("\xE2\x89\xB6"), tsString[K]("\xE2\x89\xB7"), tsString[K]("\xE2\x89\xB8"), tsString[K]("\xE2\x89\xB9"), tsString[K]("\xE2\x89\xBA"), tsString[K]("\xE2\x89\xBB"), tsString[K]("\xE2\x89\xBC"), tsString[K]("\xE2\x89\xBD"), tsString[K]("\xE2\x89\xBE"), tsString[K]("\xE2\x89\xBF"), tsString[K]("\xE2\x8A\x80"), tsString[K]("\xE2\x8A\x81"), tsString[K]("\xE2\x8A\x83"), tsString[K]("\xE2\x8A\x85"), tsString[K]("\xE2\x8A\x87"), tsString[K]("\xE2\x8A\x89"), tsString[K]("\xE2\x8A\x8B"), tsString[K]("\xE2\x8A\x8F"), tsString[K]("\xE2\x8A\x90"), tsString[K]("\xE2\x8A\x91"), tsString[K]("\xE2\x8A\x92"), tsString[K]("\xE2\x8A\x9C"), tsString[K]("\xE2\x8A\xA9"), tsString[K]("\xE2\x8A\xAC"), tsString[K]("\xE2\x8A\xAE"), tsString[K]("\xE2\x8A\xB0"), tsString[K]("\xE2\x8A\xB1"), tsString[K]("\xE2\x8A\xB2"), tsString[K]("\xE2\x8A\xB3"), tsString[K]("\xE2\x8A\xB4"), tsString[K]("\xE2\x8A\xB5"), tsString[K]("\xE2\x8A\xB6"), tsString[K]("\xE2\x8A\xB7"), tsString[K]("\xE2\x8B\x8D"), tsString[K]("\xE2\x8B\x90"), tsString[K]("\xE2\x8B\x91"), tsString[K]("\xE2\x8B\x95"), tsString[K]("\xE2\x8B\x96"), tsString[K]("\xE2\x8B\x97"), tsString[K]("\xE2\x8B\x98"), tsString[K]("\xE2\x8B\x99"), tsString[K]("\xE2\x8B\x9A"), tsString[K]("\xE2\x8B\x9B"), tsString[K]("\xE2\x8B\x9C"), tsString[K]("\xE2\x8B\x9D"), tsString[K]("\xE2\x8B\x9E"), tsString[K]("\xE2\x8B\x9F"), tsString[K]("\xE2\x8B\xA0"), tsString[K]("\xE2\x8B\xA1"), tsString[K]("\xE2\x8B\xA2"), tsString[K]("\xE2\x8B\xA3"), tsString[K]("\xE2\x8B\xA4"), tsString[K]("\xE2\x8B\xA5"), tsString[K]("\xE2\x8B\xA6"), tsString[K]("\xE2\x8B\xA7"), tsString[K]("\xE2\x8B\xA8"), tsString[K]("\xE2\x8B\xA9"), tsString[K]("\xE2\x8B\xAA"), tsString[K]("\xE2\x8B\xAB"), tsString[K]("\xE2\x8B\xAC"), tsString[K]("\xE2\x8B\xAD"), tsString[K]("\xE2\x8B\xB2"), tsString[K]("\xE2\x8B\xB3"), tsString[K]("\xE2\x8B\xB4"), tsString[K]("\xE2\x8B\xB5"), tsString[K]("\xE2\x8B\xB6"), tsString[K]("\xE2\x8B\xB7"), tsString[K]("\xE2\x8B\xB8"), tsString[K]("\xE2\x8B\xB9"), tsString[K]("\xE2\x8B\xBA"), tsString[K]("\xE2\x8B\xBB"), tsString[K]("\xE2\x8B\xBC"), tsString[K]("\xE2\x8B\xBD"), tsString[K]("\xE2\x8B\xBE"), tsString[K]("\xE2\x8B\xBF"), tsString[K]("\xE2\x9F\x88"), tsString[K]("\xE2\x9F\x89"), tsString[K]("\xE2\x9F\x92"), tsString[K]("\xE2\xA6\xB7"), tsString[K]("\xE2\xA7\x80"), tsString[K]("\xE2\xA7\x81"), tsString[K]("\xE2\xA7\xA1"), tsString[K]("\xE2\xA7\xA3"), tsString[K]("\xE2\xA7\xA4"), tsString[K]("\xE2\xA7\xA5"), tsString[K]("\xE2\xA9\xA6"), tsString[K]("\xE2\xA9\xA7"), tsString[K]("\xE2\xA9\xAA"), tsString[K]("\xE2\xA9\xAB"), tsString[K]("\xE2\xA9\xAC"), tsString[K]("\xE2\xA9\xAD"), tsString[K]("\xE2\xA9\xAE"), tsString[K]("\xE2\xA9\xAF"), tsString[K]("\xE2\xA9\xB0"), tsString[K]("\xE2\xA9\xB1"), tsString[K]("\xE2\xA9\xB2"), tsString[K]("\xE2\xA9\xB3"), tsString[K]("\xE2\xA9\xB5"), tsString[K]("\xE2\xA9\xB6"), tsString[K]("\xE2\xA9\xB7"), tsString[K]("\xE2\xA9\xB8"), tsString[K]("\xE2\xA9\xB9"), tsString[K]("\xE2\xA9\xBA"), tsString[K]("\xE2\xA9\xBB"), tsString[K]("\xE2\xA9\xBC"), tsString[K]("\xE2\xA9\xBD"), tsString[K]("\xE2\xA9\xBE"), tsString[K]("\xE2\xA9\xBF"), tsString[K]("\xE2\xAA\x80"), tsString[K]("\xE2\xAA\x81"), tsString[K]("\xE2\xAA\x82"), tsString[K]("\xE2\xAA\x83"), tsString[K]("\xE2\xAA\x84"), tsString[K]("\xE2\xAA\x85"), tsString[K]("\xE2\xAA\x86"), tsString[K]("\xE2\xAA\x87"), tsString[K]("\xE2\xAA\x88"), tsString[K]("\xE2\xAA\x89"), tsString[K]("\xE2\xAA\x8A"), tsString[K]("\xE2\xAA\x8B"), tsString[K]("\xE2\xAA\x8C"), tsString[K]("\xE2\xAA\x8D"), tsString[K]("\xE2\xAA\x8E"), tsString[K]("\xE2\xAA\x8F"), tsString[K]("\xE2\xAA\x90"), tsString[K]("\xE2\xAA\x91"), tsString[K]("\xE2\xAA\x92"), tsString[K]("\xE2\xAA\x93"), tsString[K]("\xE2\xAA\x94"), tsString[K]("\xE2\xAA\x95"), tsString[K]("\xE2\xAA\x96"), tsString[K]("\xE2\xAA\x97"), tsString[K]("\xE2\xAA\x98"), tsString[K]("\xE2\xAA\x99"), tsString[K]("\xE2\xAA\x9A"), tsString[K]("\xE2\xAA\x9B"), tsString[K]("\xE2\xAA\x9C"), tsString[K]("\xE2\xAA\x9D"), tsString[K]("\xE2\xAA\x9E"), tsString[K]("\xE2\xAA\x9F"), tsString[K]("\xE2\xAA\xA0"), tsString[K]("\xE2\xAA\xA1"), tsString[K]("\xE2\xAA\xA2"), tsString[K]("\xE2\xAA\xA3"), tsString[K]("\xE2\xAA\xA4"), tsString[K]("\xE2\xAA\xA5"), tsString[K]("\xE2\xAA\xA6"), tsString[K]("\xE2\xAA\xA7"), tsString[K]("\xE2\xAA\xA8"), tsString[K]("\xE2\xAA\xA9"), tsString[K]("\xE2\xAA\xAA"), tsString[K]("\xE2\xAA\xAB"), tsString[K]("\xE2\xAA\xAC"), tsString[K]("\xE2\xAA\xAD"), tsString[K]("\xE2\xAA\xAE"), tsString[K]("\xE2\xAA\xAF"), tsString[K]("\xE2\xAA\xB0"), tsString[K]("\xE2\xAA\xB1"), tsString[K]("\xE2\xAA\xB2"), tsString[K]("\xE2\xAA\xB3"), tsString[K]("\xE2\xAA\xB4"), tsString[K]("\xE2\xAA\xB5"), tsString[K]("\xE2\xAA\xB6"), tsString[K]("\xE2\xAA\xB7"), tsString[K]("\xE2\xAA\xB8"), tsString[K]("\xE2\xAA\xB9"), tsString[K]("\xE2\xAA\xBA"), tsString[K]("\xE2\xAA\xBB"), tsString[K]("\xE2\xAA\xBC"), tsString[K]("\xE2\xAA\xBD"), tsString[K]("\xE2\xAA\xBE"), tsString[K]("\xE2\xAA\xBF"), tsString[K]("\xE2\xAB\x80"), tsString[K]("\xE2\xAB\x81"), tsString[K]("\xE2\xAB\x82"), tsString[K]("\xE2\xAB\x83"), tsString[K]("\xE2\xAB\x84"), tsString[K]("\xE2\xAB\x85"), tsString[K]("\xE2\xAB\x86"), tsString[K]("\xE2\xAB\x87"), tsString[K]("\xE2\xAB\x88"), tsString[K]("\xE2\xAB\x89"), tsString[K]("\xE2\xAB\x8A"), tsString[K]("\xE2\xAB\x8B"), tsString[K]("\xE2\xAB\x8C"), tsString[K]("\xE2\xAB\x8D"), tsString[K]("\xE2\xAB\x8E"), tsString[K]("\xE2\xAB\x8F"), tsString[K]("\xE2\xAB\x90"), tsString[K]("\xE2\xAB\x91"), tsString[K]("\xE2\xAB\x92"), tsString[K]("\xE2\xAB\x93"), tsString[K]("\xE2\xAB\x94"), tsString[K]("\xE2\xAB\x95"), tsString[K]("\xE2\xAB\x96"), tsString[K]("\xE2\xAB\x97"), tsString[K]("\xE2\xAB\x98"), tsString[K]("\xE2\xAB\x99"), tsString[K]("\xE2\xAB\xB7"), tsString[K]("\xE2\xAB\xB8"), tsString[K]("\xE2\xAB\xB9"), tsString[K]("\xE2\xAB\xBA"), tsString[K]("\xE2\x8A\xA2"), tsString[K]("\xE2\x8A\xA3"), tsString[K]("\xE2\x9F\x82"))))
                                                                    rules[juliaVariableDeclaration] = tsSeq[K](tsSymbol[K](juliaIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](juliaHidExpression)), tsBlank[K]()))
                                                                    rules

