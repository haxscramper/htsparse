import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  PythonNodeKind* = enum
    pythonHidCompoundStatement           ## _compound_statement
    pythonHidSimpleStatement             ## _simple_statement
    pythonExpression                     ## expression
    pythonParameter                      ## parameter
    pythonPattern                        ## pattern
    pythonPrimaryExpression              ## primary_expression
    pythonAliasedImport                  ## aliased_import
    pythonArgumentList                   ## argument_list
    pythonAssertStatement                ## assert_statement
    pythonAssignment                     ## assignment
    pythonAttribute                      ## attribute
    pythonAugmentedAssignment            ## augmented_assignment
    pythonAwait                          ## await
    pythonBinaryOperator                 ## binary_operator
    pythonBlock                          ## block
    pythonBooleanOperator                ## boolean_operator
    pythonBreakStatement                 ## break_statement
    pythonCall                           ## call
    pythonChevron                        ## chevron
    pythonClassDefinition                ## class_definition
    pythonComparisonOperator             ## comparison_operator
    pythonConcatenatedString             ## concatenated_string
    pythonConditionalExpression          ## conditional_expression
    pythonContinueStatement              ## continue_statement
    pythonDecoratedDefinition            ## decorated_definition
    pythonDecorator                      ## decorator
    pythonDefaultParameter               ## default_parameter
    pythonDeleteStatement                ## delete_statement
    pythonDictionary                     ## dictionary
    pythonDictionaryComprehension        ## dictionary_comprehension
    pythonDictionarySplat                ## dictionary_splat
    pythonDictionarySplatPattern         ## dictionary_splat_pattern
    pythonDottedName                     ## dotted_name
    pythonElifClause                     ## elif_clause
    pythonElseClause                     ## else_clause
    pythonExceptClause                   ## except_clause
    pythonExecStatement                  ## exec_statement
    pythonExpressionList                 ## expression_list
    pythonExpressionStatement            ## expression_statement
    pythonFinallyClause                  ## finally_clause
    pythonForInClause                    ## for_in_clause
    pythonForStatement                   ## for_statement
    pythonFormatExpression               ## format_expression
    pythonFormatSpecifier                ## format_specifier
    pythonFunctionDefinition             ## function_definition
    pythonFutureImportStatement          ## future_import_statement
    pythonGeneratorExpression            ## generator_expression
    pythonGlobalStatement                ## global_statement
    pythonIfClause                       ## if_clause
    pythonIfStatement                    ## if_statement
    pythonImportFromStatement            ## import_from_statement
    pythonImportPrefix                   ## import_prefix
    pythonImportStatement                ## import_statement
    pythonInterpolation                  ## interpolation
    pythonKeywordArgument                ## keyword_argument
    pythonLambda                         ## lambda
    pythonLambdaParameters               ## lambda_parameters
    pythonList                           ## list
    pythonListComprehension              ## list_comprehension
    pythonListPattern                    ## list_pattern
    pythonListSplat                      ## list_splat
    pythonListSplatPattern               ## list_splat_pattern
    pythonModule                         ## module
    pythonNamedExpression                ## named_expression
    pythonNonlocalStatement              ## nonlocal_statement
    pythonNotOperator                    ## not_operator
    pythonPair                           ## pair
    pythonParameters                     ## parameters
    pythonParenthesizedExpression        ## parenthesized_expression
    pythonParenthesizedListSplat         ## parenthesized_list_splat
    pythonPassStatement                  ## pass_statement
    pythonPatternList                    ## pattern_list
    pythonPrintStatement                 ## print_statement
    pythonRaiseStatement                 ## raise_statement
    pythonRelativeImport                 ## relative_import
    pythonReturnStatement                ## return_statement
    pythonSet                            ## set
    pythonSetComprehension               ## set_comprehension
    pythonSlice                          ## slice
    pythonString                         ## string
    pythonSubscript                      ## subscript
    pythonTryStatement                   ## try_statement
    pythonTuple                          ## tuple
    pythonTuplePattern                   ## tuple_pattern
    pythonType                           ## type
    pythonTypedDefaultParameter          ## typed_default_parameter
    pythonTypedParameter                 ## typed_parameter
    pythonUnaryOperator                  ## unary_operator
    pythonWhileStatement                 ## while_statement
    pythonWildcardImport                 ## wildcard_import
    pythonWithClause                     ## with_clause
    pythonWithItem                       ## with_item
    pythonWithStatement                  ## with_statement
    pythonYield                          ## yield
    pythonExclamationEqualTok            ## !=
    pythonQuoteTok                       ## "
    pythonPercentTok                     ## %
    pythonPercentEqualTok                ## %=
    pythonAmpersandTok                   ## &
    pythonAmpersandEqualTok              ## &=
    pythonLParTok                        ## (
    pythonRParTok                        ## )
    pythonAsteriskTok                    ## *
    pythonDoubleAsteriskTok              ## **
    pythonDoubleAsteriskEqualTok         ## **=
    pythonAsteriskEqualTok               ## *=
    pythonPlusTok                        ## +
    pythonPlusEqualTok                   ## +=
    pythonCommaTok                       ## ,
    pythonMinusTok                       ## -
    pythonMinusEqualTok                  ## -=
    pythonMinusGreaterThanTok            ## ->
    pythonDotTok                         ## .
    pythonSlashTok                       ## /
    pythonDoubleSlashTok                 ## //
    pythonDoubleSlashEqualTok            ## //=
    pythonSlashEqualTok                  ## /=
    pythonColonTok                       ## :
    pythonColonEqualTok                  ## :=
    pythonSemicolonTok                   ## ;
    pythonLessThanTok                    ## <
    pythonDoubleLessThanTok              ## <<
    pythonDoubleLessThanEqualTok         ## <<=
    pythonLessThanEqualTok               ## <=
    pythonLessThanGreaterThanTok         ## <>
    pythonEqualTok                       ## =
    pythonDoubleEqualTok                 ## ==
    pythonGreaterThanTok                 ## >
    pythonGreaterThanEqualTok            ## >=
    pythonDoubleGreaterThanTok           ## >>
    pythonDoubleGreaterThanEqualTok      ## >>=
    pythonAtTok                          ## @
    pythonAtEqualTok                     ## @=
    pythonLBrackTok                      ## [
    pythonRBrackTok                      ## ]
    pythonAccentTok                      ## ^
    pythonAccentEqualTok                 ## ^=
    pythonHidFutureTok                   ## __future__
    pythonAndTok                         ## and
    pythonAsTok                          ## as
    pythonAssertTok                      ## assert
    pythonAsyncTok                       ## async
    pythonAwaitTok                       ## await
    pythonBreakTok                       ## break
    pythonClassTok                       ## class
    pythonComment                        ## comment
    pythonContinueTok                    ## continue
    pythonDefTok                         ## def
    pythonDelTok                         ## del
    pythonElifTok                        ## elif
    pythonEllipsis                       ## ellipsis
    pythonElseTok                        ## else
    pythonEscapeSequence                 ## escape_sequence
    pythonExceptTok                      ## except
    pythonExecTok                        ## exec
    pythonFalse                          ## false
    pythonFinallyTok                     ## finally
    pythonFloat                          ## float
    pythonForTok                         ## for
    pythonFromTok                        ## from
    pythonGlobalTok                      ## global
    pythonIdentifier                     ## identifier
    pythonIfTok                          ## if
    pythonImportTok                      ## import
    pythonInTok                          ## in
    pythonInteger                        ## integer
    pythonIsTok                          ## is
    pythonLambdaTok                      ## lambda
    pythonNone                           ## none
    pythonNonlocalTok                    ## nonlocal
    pythonNotTok                         ## not
    pythonOrTok                          ## or
    pythonPassTok                        ## pass
    pythonPrintTok                       ## print
    pythonRaiseTok                       ## raise
    pythonReturnTok                      ## return
    pythonTrue                           ## true
    pythonTryTok                         ## try
    pythonTypeConversion                 ## type_conversion
    pythonWhileTok                       ## while
    pythonWithTok                        ## with
    pythonYieldTok                       ## yield
    pythonLCurlyTok                      ## {
    pythonDoubleLCurlyTok                ## {{
    pythonPipeTok                        ## |
    pythonPipeEqualTok                   ## |=
    pythonRCurlyTok                      ## }
    pythonDoubleRCurlyTok                ## }}
    pythonTildeTok                       ## ~
    pythonHidNewline                     ## _newline
    pythonHidImportList                  ## _import_list
    pythonHidParameters                  ## _parameters
    pythonHidExpressions                 ## _expressions
    pythonHidNotEscapeSequence           ## _not_escape_sequence
    pythonHidSuite                       ## _suite
    pythonHidIndent                      ## _indent
    pythonHidDedent                      ## _dedent
    pythonHidStringStart                 ## _string_start
    pythonHidCollectionElements          ## _collection_elements
    pythonHidPatterns                    ## _patterns
    pythonHidLeftHandSide                ## _left_hand_side
    pythonHidStringContent               ## _string_content
    pythonHidStringEnd                   ## _string_end
    pythonKeywordIdentifier              ## keyword_identifier
    pythonHidSimpleStatements            ## _simple_statements
    pythonHidStatement                   ## _statement
    pythonLambdaWithinForInClause        ## lambda_within_for_in_clause
    pythonHidComprehensionClauses        ## _comprehension_clauses
    pythonHidEscapeInterpolation         ## _escape_interpolation
    pythonHidExpressionWithinForInClause ## _expression_within_for_in_clause
    pythonHidRightHandSide               ## _right_hand_side
    pythonSyntaxError                    ## Tree-sitter parser syntax error

proc strRepr*(kind: PythonNodeKind): string =
  case kind:
    of pythonHidCompoundStatement:           "_compound_statement"
    of pythonHidSimpleStatement:             "_simple_statement"
    of pythonExpression:                     "expression"
    of pythonParameter:                      "parameter"
    of pythonPattern:                        "pattern"
    of pythonPrimaryExpression:              "primary_expression"
    of pythonAliasedImport:                  "aliased_import"
    of pythonArgumentList:                   "argument_list"
    of pythonAssertStatement:                "assert_statement"
    of pythonAssignment:                     "assignment"
    of pythonAttribute:                      "attribute"
    of pythonAugmentedAssignment:            "augmented_assignment"
    of pythonAwait:                          "await"
    of pythonBinaryOperator:                 "binary_operator"
    of pythonBlock:                          "block"
    of pythonBooleanOperator:                "boolean_operator"
    of pythonBreakStatement:                 "break_statement"
    of pythonCall:                           "call"
    of pythonChevron:                        "chevron"
    of pythonClassDefinition:                "class_definition"
    of pythonComparisonOperator:             "comparison_operator"
    of pythonConcatenatedString:             "concatenated_string"
    of pythonConditionalExpression:          "conditional_expression"
    of pythonContinueStatement:              "continue_statement"
    of pythonDecoratedDefinition:            "decorated_definition"
    of pythonDecorator:                      "decorator"
    of pythonDefaultParameter:               "default_parameter"
    of pythonDeleteStatement:                "delete_statement"
    of pythonDictionary:                     "dictionary"
    of pythonDictionaryComprehension:        "dictionary_comprehension"
    of pythonDictionarySplat:                "dictionary_splat"
    of pythonDictionarySplatPattern:         "dictionary_splat_pattern"
    of pythonDottedName:                     "dotted_name"
    of pythonElifClause:                     "elif_clause"
    of pythonElseClause:                     "else_clause"
    of pythonExceptClause:                   "except_clause"
    of pythonExecStatement:                  "exec_statement"
    of pythonExpressionList:                 "expression_list"
    of pythonExpressionStatement:            "expression_statement"
    of pythonFinallyClause:                  "finally_clause"
    of pythonForInClause:                    "for_in_clause"
    of pythonForStatement:                   "for_statement"
    of pythonFormatExpression:               "format_expression"
    of pythonFormatSpecifier:                "format_specifier"
    of pythonFunctionDefinition:             "function_definition"
    of pythonFutureImportStatement:          "future_import_statement"
    of pythonGeneratorExpression:            "generator_expression"
    of pythonGlobalStatement:                "global_statement"
    of pythonIfClause:                       "if_clause"
    of pythonIfStatement:                    "if_statement"
    of pythonImportFromStatement:            "import_from_statement"
    of pythonImportPrefix:                   "import_prefix"
    of pythonImportStatement:                "import_statement"
    of pythonInterpolation:                  "interpolation"
    of pythonKeywordArgument:                "keyword_argument"
    of pythonLambda:                         "lambda"
    of pythonLambdaParameters:               "lambda_parameters"
    of pythonList:                           "list"
    of pythonListComprehension:              "list_comprehension"
    of pythonListPattern:                    "list_pattern"
    of pythonListSplat:                      "list_splat"
    of pythonListSplatPattern:               "list_splat_pattern"
    of pythonModule:                         "module"
    of pythonNamedExpression:                "named_expression"
    of pythonNonlocalStatement:              "nonlocal_statement"
    of pythonNotOperator:                    "not_operator"
    of pythonPair:                           "pair"
    of pythonParameters:                     "parameters"
    of pythonParenthesizedExpression:        "parenthesized_expression"
    of pythonParenthesizedListSplat:         "parenthesized_list_splat"
    of pythonPassStatement:                  "pass_statement"
    of pythonPatternList:                    "pattern_list"
    of pythonPrintStatement:                 "print_statement"
    of pythonRaiseStatement:                 "raise_statement"
    of pythonRelativeImport:                 "relative_import"
    of pythonReturnStatement:                "return_statement"
    of pythonSet:                            "set"
    of pythonSetComprehension:               "set_comprehension"
    of pythonSlice:                          "slice"
    of pythonString:                         "string"
    of pythonSubscript:                      "subscript"
    of pythonTryStatement:                   "try_statement"
    of pythonTuple:                          "tuple"
    of pythonTuplePattern:                   "tuple_pattern"
    of pythonType:                           "type"
    of pythonTypedDefaultParameter:          "typed_default_parameter"
    of pythonTypedParameter:                 "typed_parameter"
    of pythonUnaryOperator:                  "unary_operator"
    of pythonWhileStatement:                 "while_statement"
    of pythonWildcardImport:                 "wildcard_import"
    of pythonWithClause:                     "with_clause"
    of pythonWithItem:                       "with_item"
    of pythonWithStatement:                  "with_statement"
    of pythonYield:                          "yield"
    of pythonExclamationEqualTok:            "!="
    of pythonQuoteTok:                       "\""
    of pythonPercentTok:                     "%"
    of pythonPercentEqualTok:                "%="
    of pythonAmpersandTok:                   "&"
    of pythonAmpersandEqualTok:              "&="
    of pythonLParTok:                        "("
    of pythonRParTok:                        ")"
    of pythonAsteriskTok:                    "*"
    of pythonDoubleAsteriskTok:              "**"
    of pythonDoubleAsteriskEqualTok:         "**="
    of pythonAsteriskEqualTok:               "*="
    of pythonPlusTok:                        "+"
    of pythonPlusEqualTok:                   "+="
    of pythonCommaTok:                       ","
    of pythonMinusTok:                       "-"
    of pythonMinusEqualTok:                  "-="
    of pythonMinusGreaterThanTok:            "->"
    of pythonDotTok:                         "."
    of pythonSlashTok:                       "/"
    of pythonDoubleSlashTok:                 "//"
    of pythonDoubleSlashEqualTok:            "//="
    of pythonSlashEqualTok:                  "/="
    of pythonColonTok:                       ":"
    of pythonColonEqualTok:                  ":="
    of pythonSemicolonTok:                   ";"
    of pythonLessThanTok:                    "<"
    of pythonDoubleLessThanTok:              "<<"
    of pythonDoubleLessThanEqualTok:         "<<="
    of pythonLessThanEqualTok:               "<="
    of pythonLessThanGreaterThanTok:         "<>"
    of pythonEqualTok:                       "="
    of pythonDoubleEqualTok:                 "=="
    of pythonGreaterThanTok:                 ">"
    of pythonGreaterThanEqualTok:            ">="
    of pythonDoubleGreaterThanTok:           ">>"
    of pythonDoubleGreaterThanEqualTok:      ">>="
    of pythonAtTok:                          "@"
    of pythonAtEqualTok:                     "@="
    of pythonLBrackTok:                      "["
    of pythonRBrackTok:                      "]"
    of pythonAccentTok:                      "^"
    of pythonAccentEqualTok:                 "^="
    of pythonHidFutureTok:                   "__future__"
    of pythonAndTok:                         "and"
    of pythonAsTok:                          "as"
    of pythonAssertTok:                      "assert"
    of pythonAsyncTok:                       "async"
    of pythonAwaitTok:                       "await"
    of pythonBreakTok:                       "break"
    of pythonClassTok:                       "class"
    of pythonComment:                        "comment"
    of pythonContinueTok:                    "continue"
    of pythonDefTok:                         "def"
    of pythonDelTok:                         "del"
    of pythonElifTok:                        "elif"
    of pythonEllipsis:                       "ellipsis"
    of pythonElseTok:                        "else"
    of pythonEscapeSequence:                 "escape_sequence"
    of pythonExceptTok:                      "except"
    of pythonExecTok:                        "exec"
    of pythonFalse:                          "false"
    of pythonFinallyTok:                     "finally"
    of pythonFloat:                          "float"
    of pythonForTok:                         "for"
    of pythonFromTok:                        "from"
    of pythonGlobalTok:                      "global"
    of pythonIdentifier:                     "identifier"
    of pythonIfTok:                          "if"
    of pythonImportTok:                      "import"
    of pythonInTok:                          "in"
    of pythonInteger:                        "integer"
    of pythonIsTok:                          "is"
    of pythonLambdaTok:                      "lambda"
    of pythonNone:                           "none"
    of pythonNonlocalTok:                    "nonlocal"
    of pythonNotTok:                         "not"
    of pythonOrTok:                          "or"
    of pythonPassTok:                        "pass"
    of pythonPrintTok:                       "print"
    of pythonRaiseTok:                       "raise"
    of pythonReturnTok:                      "return"
    of pythonTrue:                           "true"
    of pythonTryTok:                         "try"
    of pythonTypeConversion:                 "type_conversion"
    of pythonWhileTok:                       "while"
    of pythonWithTok:                        "with"
    of pythonYieldTok:                       "yield"
    of pythonLCurlyTok:                      "{"
    of pythonDoubleLCurlyTok:                "{{"
    of pythonPipeTok:                        "|"
    of pythonPipeEqualTok:                   "|="
    of pythonRCurlyTok:                      "}"
    of pythonDoubleRCurlyTok:                "}}"
    of pythonTildeTok:                       "~"
    of pythonHidNewline:                     "_newline"
    of pythonHidImportList:                  "_import_list"
    of pythonHidParameters:                  "_parameters"
    of pythonHidExpressions:                 "_expressions"
    of pythonHidNotEscapeSequence:           "_not_escape_sequence"
    of pythonHidSuite:                       "_suite"
    of pythonHidIndent:                      "_indent"
    of pythonHidDedent:                      "_dedent"
    of pythonHidStringStart:                 "_string_start"
    of pythonHidCollectionElements:          "_collection_elements"
    of pythonHidPatterns:                    "_patterns"
    of pythonHidLeftHandSide:                "_left_hand_side"
    of pythonHidStringContent:               "_string_content"
    of pythonHidStringEnd:                   "_string_end"
    of pythonKeywordIdentifier:              "keyword_identifier"
    of pythonHidSimpleStatements:            "_simple_statements"
    of pythonHidStatement:                   "_statement"
    of pythonLambdaWithinForInClause:        "lambda_within_for_in_clause"
    of pythonHidComprehensionClauses:        "_comprehension_clauses"
    of pythonHidEscapeInterpolation:         "_escape_interpolation"
    of pythonHidExpressionWithinForInClause: "_expression_within_for_in_clause"
    of pythonHidRightHandSide:               "_right_hand_side"
    of pythonSyntaxError:                    "ERROR"

type
  PythonExternalTok* = enum
    pythonExtern_newline        ## _newline
    pythonExtern_indent         ## _indent
    pythonExtern_dedent         ## _dedent
    pythonExtern_string_start   ## _string_start
    pythonExtern_string_content ## _string_content
    pythonExtern_string_end     ## _string_end

type
  TsPythonNode* = distinct TSNode

type
  PythonParser* = distinct PtsParser

const pythonAllowedSubnodes*: array[PythonNodeKind, set[PythonNodeKind]] = block:
                                                                             var tmp: array[PythonNodeKind, set[PythonNodeKind]]
                                                                             tmp[pythonArgumentList] = {pythonDictionarySplat, pythonExpression, pythonKeywordArgument, pythonListSplat, pythonParenthesizedExpression}
                                                                             tmp[pythonAssertStatement] = {pythonExpression}
                                                                             tmp[pythonAwait] = {pythonExpression}
                                                                             tmp[pythonBlock] = {pythonHidCompoundStatement, pythonHidSimpleStatement}
                                                                             tmp[pythonChevron] = {pythonExpression}
                                                                             tmp[pythonComparisonOperator] = {pythonPrimaryExpression}
                                                                             tmp[pythonConcatenatedString] = {pythonString}
                                                                             tmp[pythonConditionalExpression] = {pythonExpression}
                                                                             tmp[pythonDecoratedDefinition] = {pythonDecorator}
                                                                             tmp[pythonDecorator] = {pythonPrimaryExpression}
                                                                             tmp[pythonDeleteStatement] = {pythonExpression, pythonExpressionList}
                                                                             tmp[pythonDictionary] = {pythonDictionarySplat, pythonPair}
                                                                             tmp[pythonDictionaryComprehension] = {pythonForInClause, pythonIfClause}
                                                                             tmp[pythonDictionarySplat] = {pythonExpression}
                                                                             tmp[pythonDictionarySplatPattern] = {pythonAttribute, pythonIdentifier, pythonSubscript}
                                                                             tmp[pythonDottedName] = {pythonIdentifier}
                                                                             tmp[pythonExceptClause] = {pythonBlock, pythonExpression}
                                                                             tmp[pythonExecStatement] = {pythonExpression}
                                                                             tmp[pythonExpressionList] = {pythonExpression}
                                                                             tmp[pythonExpressionStatement] = {pythonAssignment, pythonAugmentedAssignment, pythonExpression, pythonYield}
                                                                             tmp[pythonFinallyClause] = {pythonBlock}
                                                                             tmp[pythonFormatExpression] = {pythonExpression}
                                                                             tmp[pythonFormatSpecifier] = {pythonFormatExpression}
                                                                             tmp[pythonGeneratorExpression] = {pythonForInClause, pythonIfClause}
                                                                             tmp[pythonGlobalStatement] = {pythonIdentifier}
                                                                             tmp[pythonIfClause] = {pythonExpression}
                                                                             tmp[pythonImportFromStatement] = {pythonWildcardImport}
                                                                             tmp[pythonInterpolation] = {pythonExpression, pythonFormatSpecifier, pythonTypeConversion}
                                                                             tmp[pythonLambdaParameters] = {pythonParameter}
                                                                             tmp[pythonList] = {pythonExpression, pythonListSplat, pythonParenthesizedListSplat, pythonYield}
                                                                             tmp[pythonListComprehension] = {pythonForInClause, pythonIfClause}
                                                                             tmp[pythonListPattern] = {pythonPattern}
                                                                             tmp[pythonListSplat] = {pythonExpression}
                                                                             tmp[pythonListSplatPattern] = {pythonAttribute, pythonIdentifier, pythonSubscript}
                                                                             tmp[pythonModule] = {pythonHidCompoundStatement, pythonHidSimpleStatement}
                                                                             tmp[pythonNonlocalStatement] = {pythonIdentifier}
                                                                             tmp[pythonParameters] = {pythonParameter}
                                                                             tmp[pythonParenthesizedExpression] = {pythonExpression, pythonListSplat, pythonParenthesizedExpression, pythonYield}
                                                                             tmp[pythonParenthesizedListSplat] = {pythonListSplat, pythonParenthesizedExpression}
                                                                             tmp[pythonPatternList] = {pythonPattern}
                                                                             tmp[pythonPrintStatement] = {pythonChevron}
                                                                             tmp[pythonRaiseStatement] = {pythonExpression, pythonExpressionList}
                                                                             tmp[pythonRelativeImport] = {pythonDottedName, pythonImportPrefix}
                                                                             tmp[pythonReturnStatement] = {pythonExpression, pythonExpressionList}
                                                                             tmp[pythonSet] = {pythonExpression, pythonListSplat, pythonParenthesizedListSplat, pythonYield}
                                                                             tmp[pythonSetComprehension] = {pythonForInClause, pythonIfClause}
                                                                             tmp[pythonSlice] = {pythonExpression}
                                                                             tmp[pythonString] = {pythonEscapeSequence, pythonInterpolation}
                                                                             tmp[pythonTryStatement] = {pythonElseClause, pythonExceptClause, pythonFinallyClause}
                                                                             tmp[pythonTuple] = {pythonExpression, pythonListSplat, pythonParenthesizedListSplat, pythonYield}
                                                                             tmp[pythonTuplePattern] = {pythonPattern}
                                                                             tmp[pythonType] = {pythonExpression}
                                                                             tmp[pythonTypedParameter] = {pythonDictionarySplatPattern, pythonIdentifier, pythonListSplatPattern}
                                                                             tmp[pythonWithClause] = {pythonWithItem}
                                                                             tmp[pythonWithStatement] = {pythonWithClause}
                                                                             tmp[pythonYield] = {pythonExpression, pythonExpressionList}
                                                                             tmp
const pythonTokenKinds*: set[PythonNodeKind] = {
                                                 pythonExclamationEqualTok,
                                                 pythonQuoteTok,
                                                 pythonPercentTok,
                                                 pythonPercentEqualTok,
                                                 pythonAmpersandTok,
                                                 pythonAmpersandEqualTok,
                                                 pythonLParTok,
                                                 pythonRParTok,
                                                 pythonAsteriskTok,
                                                 pythonDoubleAsteriskTok,
                                                 pythonDoubleAsteriskEqualTok,
                                                 pythonAsteriskEqualTok,
                                                 pythonPlusTok,
                                                 pythonPlusEqualTok,
                                                 pythonCommaTok,
                                                 pythonMinusTok,
                                                 pythonMinusEqualTok,
                                                 pythonMinusGreaterThanTok,
                                                 pythonDotTok,
                                                 pythonSlashTok,
                                                 pythonDoubleSlashTok,
                                                 pythonDoubleSlashEqualTok,
                                                 pythonSlashEqualTok,
                                                 pythonColonTok,
                                                 pythonColonEqualTok,
                                                 pythonSemicolonTok,
                                                 pythonLessThanTok,
                                                 pythonDoubleLessThanTok,
                                                 pythonDoubleLessThanEqualTok,
                                                 pythonLessThanEqualTok,
                                                 pythonLessThanGreaterThanTok,
                                                 pythonEqualTok,
                                                 pythonDoubleEqualTok,
                                                 pythonGreaterThanTok,
                                                 pythonGreaterThanEqualTok,
                                                 pythonDoubleGreaterThanTok,
                                                 pythonDoubleGreaterThanEqualTok,
                                                 pythonAtTok,
                                                 pythonAtEqualTok,
                                                 pythonLBrackTok,
                                                 pythonRBrackTok,
                                                 pythonAccentTok,
                                                 pythonAccentEqualTok,
                                                 pythonHidFutureTok,
                                                 pythonAndTok,
                                                 pythonAsTok,
                                                 pythonAssertTok,
                                                 pythonAsyncTok,
                                                 pythonAwaitTok,
                                                 pythonBreakTok,
                                                 pythonClassTok,
                                                 pythonContinueTok,
                                                 pythonDefTok,
                                                 pythonDelTok,
                                                 pythonElifTok,
                                                 pythonElseTok,
                                                 pythonExceptTok,
                                                 pythonExecTok,
                                                 pythonFinallyTok,
                                                 pythonForTok,
                                                 pythonFromTok,
                                                 pythonGlobalTok,
                                                 pythonIfTok,
                                                 pythonImportTok,
                                                 pythonInTok,
                                                 pythonIsTok,
                                                 pythonLambdaTok,
                                                 pythonNonlocalTok,
                                                 pythonNotTok,
                                                 pythonOrTok,
                                                 pythonPassTok,
                                                 pythonPrintTok,
                                                 pythonRaiseTok,
                                                 pythonReturnTok,
                                                 pythonTryTok,
                                                 pythonWhileTok,
                                                 pythonWithTok,
                                                 pythonYieldTok,
                                                 pythonLCurlyTok,
                                                 pythonDoubleLCurlyTok,
                                                 pythonPipeTok,
                                                 pythonPipeEqualTok,
                                                 pythonRCurlyTok,
                                                 pythonDoubleRCurlyTok,
                                                 pythonTildeTok
                                               }
const pythonHiddenKinds*: set[PythonNodeKind] = {
                                                  pythonHidNewline,
                                                  pythonHidImportList,
                                                  pythonHidParameters,
                                                  pythonHidExpressions,
                                                  pythonHidNotEscapeSequence,
                                                  pythonHidSuite,
                                                  pythonHidCompoundStatement,
                                                  pythonHidIndent,
                                                  pythonHidDedent,
                                                  pythonHidStringStart,
                                                  pythonHidCollectionElements,
                                                  pythonHidPatterns,
                                                  pythonHidSimpleStatement,
                                                  pythonHidLeftHandSide,
                                                  pythonHidStringContent,
                                                  pythonHidStringEnd,
                                                  pythonKeywordIdentifier,
                                                  pythonHidSimpleStatements,
                                                  pythonHidStatement,
                                                  pythonLambdaWithinForInClause,
                                                  pythonHidComprehensionClauses,
                                                  pythonHidEscapeInterpolation,
                                                  pythonHidExpressionWithinForInClause,
                                                  pythonHidRightHandSide
                                                }
proc tsNodeType*(node: TsPythonNode): string


proc kind*(node: TsPythonNode): PythonNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_compound_statement":      pythonHidCompoundStatement
      of "_simple_statement":        pythonHidSimpleStatement
      of "expression":               pythonExpression
      of "parameter":                pythonParameter
      of "pattern":                  pythonPattern
      of "primary_expression":       pythonPrimaryExpression
      of "aliased_import":           pythonAliasedImport
      of "argument_list":            pythonArgumentList
      of "assert_statement":         pythonAssertStatement
      of "assignment":               pythonAssignment
      of "attribute":                pythonAttribute
      of "augmented_assignment":     pythonAugmentedAssignment
      of "await":                    pythonAwait
      of "binary_operator":          pythonBinaryOperator
      of "block":                    pythonBlock
      of "boolean_operator":         pythonBooleanOperator
      of "break_statement":          pythonBreakStatement
      of "call":                     pythonCall
      of "chevron":                  pythonChevron
      of "class_definition":         pythonClassDefinition
      of "comparison_operator":      pythonComparisonOperator
      of "concatenated_string":      pythonConcatenatedString
      of "conditional_expression":   pythonConditionalExpression
      of "continue_statement":       pythonContinueStatement
      of "decorated_definition":     pythonDecoratedDefinition
      of "decorator":                pythonDecorator
      of "default_parameter":        pythonDefaultParameter
      of "delete_statement":         pythonDeleteStatement
      of "dictionary":               pythonDictionary
      of "dictionary_comprehension": pythonDictionaryComprehension
      of "dictionary_splat":         pythonDictionarySplat
      of "dictionary_splat_pattern": pythonDictionarySplatPattern
      of "dotted_name":              pythonDottedName
      of "elif_clause":              pythonElifClause
      of "else_clause":              pythonElseClause
      of "except_clause":            pythonExceptClause
      of "exec_statement":           pythonExecStatement
      of "expression_list":          pythonExpressionList
      of "expression_statement":     pythonExpressionStatement
      of "finally_clause":           pythonFinallyClause
      of "for_in_clause":            pythonForInClause
      of "for_statement":            pythonForStatement
      of "format_expression":        pythonFormatExpression
      of "format_specifier":         pythonFormatSpecifier
      of "function_definition":      pythonFunctionDefinition
      of "future_import_statement":  pythonFutureImportStatement
      of "generator_expression":     pythonGeneratorExpression
      of "global_statement":         pythonGlobalStatement
      of "if_clause":                pythonIfClause
      of "if_statement":             pythonIfStatement
      of "import_from_statement":    pythonImportFromStatement
      of "import_prefix":            pythonImportPrefix
      of "import_statement":         pythonImportStatement
      of "interpolation":            pythonInterpolation
      of "keyword_argument":         pythonKeywordArgument
      of "lambda":                   pythonLambda
      of "lambda_parameters":        pythonLambdaParameters
      of "list":                     pythonList
      of "list_comprehension":       pythonListComprehension
      of "list_pattern":             pythonListPattern
      of "list_splat":               pythonListSplat
      of "list_splat_pattern":       pythonListSplatPattern
      of "module":                   pythonModule
      of "named_expression":         pythonNamedExpression
      of "nonlocal_statement":       pythonNonlocalStatement
      of "not_operator":             pythonNotOperator
      of "pair":                     pythonPair
      of "parameters":               pythonParameters
      of "parenthesized_expression": pythonParenthesizedExpression
      of "parenthesized_list_splat": pythonParenthesizedListSplat
      of "pass_statement":           pythonPassStatement
      of "pattern_list":             pythonPatternList
      of "print_statement":          pythonPrintStatement
      of "raise_statement":          pythonRaiseStatement
      of "relative_import":          pythonRelativeImport
      of "return_statement":         pythonReturnStatement
      of "set":                      pythonSet
      of "set_comprehension":        pythonSetComprehension
      of "slice":                    pythonSlice
      of "string":                   pythonString
      of "subscript":                pythonSubscript
      of "try_statement":            pythonTryStatement
      of "tuple":                    pythonTuple
      of "tuple_pattern":            pythonTuplePattern
      of "type":                     pythonType
      of "typed_default_parameter":  pythonTypedDefaultParameter
      of "typed_parameter":          pythonTypedParameter
      of "unary_operator":           pythonUnaryOperator
      of "while_statement":          pythonWhileStatement
      of "wildcard_import":          pythonWildcardImport
      of "with_clause":              pythonWithClause
      of "with_item":                pythonWithItem
      of "with_statement":           pythonWithStatement
      of "yield":                    pythonYield
      of "!=":                       pythonExclamationEqualTok
      of "\"":                       pythonQuoteTok
      of "%":                        pythonPercentTok
      of "%=":                       pythonPercentEqualTok
      of "&":                        pythonAmpersandTok
      of "&=":                       pythonAmpersandEqualTok
      of "(":                        pythonLParTok
      of ")":                        pythonRParTok
      of "*":                        pythonAsteriskTok
      of "**":                       pythonDoubleAsteriskTok
      of "**=":                      pythonDoubleAsteriskEqualTok
      of "*=":                       pythonAsteriskEqualTok
      of "+":                        pythonPlusTok
      of "+=":                       pythonPlusEqualTok
      of ",":                        pythonCommaTok
      of "-":                        pythonMinusTok
      of "-=":                       pythonMinusEqualTok
      of "->":                       pythonMinusGreaterThanTok
      of ".":                        pythonDotTok
      of "/":                        pythonSlashTok
      of "//":                       pythonDoubleSlashTok
      of "//=":                      pythonDoubleSlashEqualTok
      of "/=":                       pythonSlashEqualTok
      of ":":                        pythonColonTok
      of ":=":                       pythonColonEqualTok
      of ";":                        pythonSemicolonTok
      of "<":                        pythonLessThanTok
      of "<<":                       pythonDoubleLessThanTok
      of "<<=":                      pythonDoubleLessThanEqualTok
      of "<=":                       pythonLessThanEqualTok
      of "<>":                       pythonLessThanGreaterThanTok
      of "=":                        pythonEqualTok
      of "==":                       pythonDoubleEqualTok
      of ">":                        pythonGreaterThanTok
      of ">=":                       pythonGreaterThanEqualTok
      of ">>":                       pythonDoubleGreaterThanTok
      of ">>=":                      pythonDoubleGreaterThanEqualTok
      of "@":                        pythonAtTok
      of "@=":                       pythonAtEqualTok
      of "[":                        pythonLBrackTok
      of "]":                        pythonRBrackTok
      of "^":                        pythonAccentTok
      of "^=":                       pythonAccentEqualTok
      of "__future__":               pythonHidFutureTok
      of "and":                      pythonAndTok
      of "as":                       pythonAsTok
      of "assert":                   pythonAssertTok
      of "async":                    pythonAsyncTok
      of "break":                    pythonBreakTok
      of "class":                    pythonClassTok
      of "comment":                  pythonComment
      of "continue":                 pythonContinueTok
      of "def":                      pythonDefTok
      of "del":                      pythonDelTok
      of "elif":                     pythonElifTok
      of "ellipsis":                 pythonEllipsis
      of "else":                     pythonElseTok
      of "escape_sequence":          pythonEscapeSequence
      of "except":                   pythonExceptTok
      of "exec":                     pythonExecTok
      of "false":                    pythonFalse
      of "finally":                  pythonFinallyTok
      of "float":                    pythonFloat
      of "for":                      pythonForTok
      of "from":                     pythonFromTok
      of "global":                   pythonGlobalTok
      of "identifier":               pythonIdentifier
      of "if":                       pythonIfTok
      of "import":                   pythonImportTok
      of "in":                       pythonInTok
      of "integer":                  pythonInteger
      of "is":                       pythonIsTok
      of "none":                     pythonNone
      of "nonlocal":                 pythonNonlocalTok
      of "not":                      pythonNotTok
      of "or":                       pythonOrTok
      of "pass":                     pythonPassTok
      of "print":                    pythonPrintTok
      of "raise":                    pythonRaiseTok
      of "return":                   pythonReturnTok
      of "true":                     pythonTrue
      of "try":                      pythonTryTok
      of "type_conversion":          pythonTypeConversion
      of "while":                    pythonWhileTok
      of "with":                     pythonWithTok
      of "{":                        pythonLCurlyTok
      of "{{":                       pythonDoubleLCurlyTok
      of "|":                        pythonPipeTok
      of "|=":                       pythonPipeEqualTok
      of "}":                        pythonRCurlyTok
      of "}}":                       pythonDoubleRCurlyTok
      of "~":                        pythonTildeTok
      of "ERROR":                    pythonSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsPythonNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsPythonNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsPythonNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_python(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsPythonNode): string =
  $ts_node_type(TSNode(node))

proc newTsPythonParser*(): PythonParser =
  result = PythonParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_python())

proc parseString*(parser: PythonParser, str: string): TsPythonNode =
  TsPythonNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsPythonString*(str: string): TsPythonNode =
  let parser = newTsPythonParser()
  return parseString(parser, str)

func `$`*(node: TsPythonNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsPythonNode, str: string): string =
  var res = addr result
  proc aux(node: TsPythonNode, level: int) =
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


import
  hmisc / wrappers/treesitter_core
let pythonGrammar*: array[PythonNodeKind, HtsRule[PythonNodeKind]] = block:
                                                                       var rules: array[PythonNodeKind, HtsRule[PythonNodeKind]]
                                                                       type
                                                                         K = PythonNodeKind


                                                                       rules[pythonNone] = tsString[K]("None")
                                                                       rules[pythonEllipsis] = tsString[K]("...")
                                                                       rules[pythonInterpolation] = tsSeq[K](tsString[K]("{"), tsSymbol[K](pythonExpression), tsChoice[K](tsSymbol[K](pythonTypeConversion), tsBlank[K]()), tsChoice[K](tsSymbol[K](pythonFormatSpecifier), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[pythonComparisonOperator] = tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsRepeat1[K](tsSeq[K](tsChoice[K](tsString[K]("<"), tsString[K]("<="), tsString[K]("=="), tsString[K]("!="), tsString[K](">="), tsString[K](">"), tsString[K]("<>"), tsString[K]("in"), tsSeq[K](tsString[K]("not"), tsString[K]("in")), tsString[K]("is"), tsSeq[K](tsString[K]("is"), tsString[K]("not"))), tsSymbol[K](pythonPrimaryExpression))))
                                                                       rules[pythonDictionarySplat] = tsSeq[K](tsString[K]("**"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonPatternList] = tsSeq[K](tsSymbol[K](pythonPattern), tsChoice[K](tsString[K](","), tsSeq[K](tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonPattern))), tsChoice[K](tsString[K](","), tsBlank[K]()))))
                                                                       rules[pythonPrimaryExpression] = tsChoice[K](tsSymbol[K](pythonBinaryOperator), tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonKeywordIdentifier), tsSymbol[K](pythonString), tsSymbol[K](pythonConcatenatedString), tsSymbol[K](pythonInteger), tsSymbol[K](pythonFloat), tsSymbol[K](pythonTrue), tsSymbol[K](pythonFalse), tsSymbol[K](pythonNone), tsSymbol[K](pythonUnaryOperator), tsSymbol[K](pythonAttribute), tsSymbol[K](pythonSubscript), tsSymbol[K](pythonCall), tsSymbol[K](pythonList), tsSymbol[K](pythonListComprehension), tsSymbol[K](pythonDictionary), tsSymbol[K](pythonDictionaryComprehension), tsSymbol[K](pythonSet), tsSymbol[K](pythonSetComprehension), tsSymbol[K](pythonTuple), tsSymbol[K](pythonParenthesizedExpression), tsSymbol[K](pythonGeneratorExpression), tsSymbol[K](pythonEllipsis))
                                                                       rules[pythonType] = tsSymbol[K](pythonExpression)
                                                                       rules[pythonPassStatement] = tsString[K]("pass")
                                                                       rules[pythonReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](pythonHidExpressions), tsBlank[K]()))
                                                                       rules[pythonWithStatement] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("with"), tsSymbol[K](pythonWithClause), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonFalse] = tsString[K]("False")
                                                                       rules[pythonHidNotEscapeSequence] = tsString[K]("\\")
                                                                       rules[pythonRelativeImport] = tsSeq[K](tsSymbol[K](pythonImportPrefix), tsChoice[K](tsSymbol[K](pythonDottedName), tsBlank[K]()))
                                                                       rules[pythonHidSuite] = tsChoice[K](tsSymbol[K](pythonHidSimpleStatements), tsSeq[K](tsSymbol[K](pythonHidIndent), tsSymbol[K](pythonBlock)), tsSymbol[K](pythonHidNewline))
                                                                       rules[pythonForStatement] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("for"), tsSymbol[K](pythonHidLeftHandSide), tsString[K]("in"), tsSymbol[K](pythonHidExpressions), tsString[K](":"), tsSymbol[K](pythonHidSuite), tsChoice[K](tsSymbol[K](pythonElseClause), tsBlank[K]()))
                                                                       rules[pythonWithClause] = tsChoice[K](tsSeq[K](tsSymbol[K](pythonWithItem), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonWithItem)))), tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](pythonWithItem), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonWithItem)))), tsString[K](")")))
                                                                       rules[pythonGlobalStatement] = tsSeq[K](tsString[K]("global"), tsSeq[K](tsSymbol[K](pythonIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonIdentifier)))))
                                                                       rules[pythonTypedParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonListSplatPattern), tsSymbol[K](pythonDictionarySplatPattern)), tsString[K](":"), tsSymbol[K](pythonType))
                                                                       rules[pythonTuplePattern] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](pythonHidPatterns), tsBlank[K]()), tsString[K](")"))
                                                                       rules[pythonForInClause] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("for"), tsSymbol[K](pythonHidLeftHandSide), tsString[K]("in"), tsSeq[K](tsSymbol[K](pythonHidExpressionWithinForInClause), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonHidExpressionWithinForInClause)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[pythonBlock] = tsSeq[K](tsRepeat[K](tsSymbol[K](pythonHidStatement)), tsSymbol[K](pythonHidDedent))
                                                                       rules[pythonPattern] = tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonKeywordIdentifier), tsSymbol[K](pythonSubscript), tsSymbol[K](pythonAttribute), tsSymbol[K](pythonListSplatPattern), tsSymbol[K](pythonTuplePattern), tsSymbol[K](pythonListPattern))
                                                                       rules[pythonNotOperator] = tsSeq[K](tsString[K]("not"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonHidPatterns] = tsSeq[K](tsSeq[K](tsSymbol[K](pythonPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonPattern)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[pythonPair] = tsSeq[K](tsSymbol[K](pythonExpression), tsString[K](":"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonComment] = tsSeq[K](tsString[K]("#"), tsRegex[K](".*"))
                                                                       rules[pythonImportStatement] = tsSeq[K](tsString[K]("import"), tsSymbol[K](pythonHidImportList))
                                                                       rules[pythonExpression] = tsChoice[K](tsSymbol[K](pythonComparisonOperator), tsSymbol[K](pythonNotOperator), tsSymbol[K](pythonBooleanOperator), tsSymbol[K](pythonAwait), tsSymbol[K](pythonLambda), tsSymbol[K](pythonPrimaryExpression), tsSymbol[K](pythonConditionalExpression), tsSymbol[K](pythonNamedExpression))
                                                                       rules[pythonElseClause] = tsSeq[K](tsString[K]("else"), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonImportFromStatement] = tsSeq[K](tsString[K]("from"), tsChoice[K](tsSymbol[K](pythonRelativeImport), tsSymbol[K](pythonDottedName)), tsString[K]("import"), tsChoice[K](tsSymbol[K](pythonWildcardImport), tsSymbol[K](pythonHidImportList), tsSeq[K](tsString[K]("("), tsSymbol[K](pythonHidImportList), tsString[K](")"))))
                                                                       rules[pythonDecoratedDefinition] = tsSeq[K](tsRepeat1[K](tsSymbol[K](pythonDecorator)), tsChoice[K](tsSymbol[K](pythonClassDefinition), tsSymbol[K](pythonFunctionDefinition)))
                                                                       rules[pythonHidStatement] = tsChoice[K](tsSymbol[K](pythonHidSimpleStatements), tsSymbol[K](pythonHidCompoundStatement))
                                                                       rules[pythonHidSimpleStatements] = tsSeq[K](tsSeq[K](tsSymbol[K](pythonHidSimpleStatement), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](pythonHidSimpleStatement)))), tsChoice[K](tsString[K](";"), tsBlank[K]()), tsSymbol[K](pythonHidNewline))
                                                                       rules[pythonLambdaWithinForInClause] = tsSeq[K](tsString[K]("lambda"), tsChoice[K](tsSymbol[K](pythonLambdaParameters), tsBlank[K]()), tsString[K](":"), tsSymbol[K](pythonHidExpressionWithinForInClause))
                                                                       rules[pythonIdentifier] = tsRegex[K]("[_\\p{XID_Start}][_\\p{XID_Continue}]*")
                                                                       rules[pythonAwait] = tsSeq[K](tsString[K]("await"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonNamedExpression] = tsSeq[K](tsSymbol[K](pythonIdentifier), tsString[K](":="), tsSymbol[K](pythonExpression))
                                                                       rules[pythonListSplat] = tsSeq[K](tsString[K]("*"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonParenthesizedListSplat] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](pythonParenthesizedListSplat), tsSymbol[K](pythonListSplat)), tsString[K](")"))
                                                                       rules[pythonDictionary] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](pythonPair), tsSymbol[K](pythonDictionarySplat)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](pythonPair), tsSymbol[K](pythonDictionarySplat))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[pythonInteger] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsRepeat1[K](tsRegex[K]("_?[A-Fa-f0-9]+")), tsChoice[K](tsRegex[K]("[Ll]"), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("0o"), tsString[K]("0O")), tsRepeat1[K](tsRegex[K]("_?[0-7]+")), tsChoice[K](tsRegex[K]("[Ll]"), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("0b"), tsString[K]("0B")), tsRepeat1[K](tsRegex[K]("_?[0-1]+")), tsChoice[K](tsRegex[K]("[Ll]"), tsBlank[K]())), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsChoice[K](tsChoice[K](tsRegex[K]("[Ll]"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[jJ]"), tsBlank[K]()))))
                                                                       rules[pythonExceptClause] = tsSeq[K](tsString[K]("except"), tsChoice[K](tsSeq[K](tsSymbol[K](pythonExpression), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("as"), tsString[K](",")), tsSymbol[K](pythonExpression)), tsBlank[K]())), tsBlank[K]()), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonCall] = tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsChoice[K](tsSymbol[K](pythonGeneratorExpression), tsSymbol[K](pythonArgumentList)))
                                                                       rules[pythonTypedDefaultParameter] = tsSeq[K](tsSymbol[K](pythonIdentifier), tsString[K](":"), tsSymbol[K](pythonType), tsString[K]("="), tsSymbol[K](pythonExpression))
                                                                       rules[pythonTrue] = tsString[K]("True")
                                                                       rules[pythonFinallyClause] = tsSeq[K](tsString[K]("finally"), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonDeleteStatement] = tsSeq[K](tsString[K]("del"), tsSymbol[K](pythonHidExpressions))
                                                                       rules[pythonClassDefinition] = tsSeq[K](tsString[K]("class"), tsSymbol[K](pythonIdentifier), tsChoice[K](tsSymbol[K](pythonArgumentList), tsBlank[K]()), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonBinaryOperator] = tsChoice[K](tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("+"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("-"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("*"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("@"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("/"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("%"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("//"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("**"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("|"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("&"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("^"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("<<"), tsSymbol[K](pythonPrimaryExpression)), tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K](">>"), tsSymbol[K](pythonPrimaryExpression)))
                                                                       rules[pythonParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonYield)), tsString[K](")"))
                                                                       rules[pythonGeneratorExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](pythonExpression), tsSymbol[K](pythonHidComprehensionClauses), tsString[K](")"))
                                                                       rules[pythonHidImportList] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](pythonDottedName), tsSymbol[K](pythonAliasedImport)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](pythonDottedName), tsSymbol[K](pythonAliasedImport))))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[pythonWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](pythonExpression), tsString[K](":"), tsSymbol[K](pythonHidSuite), tsChoice[K](tsSymbol[K](pythonElseClause), tsBlank[K]()))
                                                                       rules[pythonParameter] = tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonTypedParameter), tsSymbol[K](pythonDefaultParameter), tsSymbol[K](pythonTypedDefaultParameter), tsSymbol[K](pythonListSplatPattern), tsSymbol[K](pythonTuplePattern), tsString[K]("*"), tsSymbol[K](pythonDictionarySplatPattern))
                                                                       rules[pythonHidParameters] = tsSeq[K](tsSeq[K](tsSymbol[K](pythonParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonParameter)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[pythonPrintStatement] = tsChoice[K](tsSeq[K](tsString[K]("print"), tsSymbol[K](pythonChevron), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsSeq[K](tsString[K]("print"), tsSeq[K](tsSymbol[K](pythonExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression)))), tsChoice[K](tsString[K](","), tsBlank[K]())))
                                                                       rules[pythonDictionarySplatPattern] = tsSeq[K](tsString[K]("**"), tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonKeywordIdentifier), tsSymbol[K](pythonSubscript), tsSymbol[K](pythonAttribute)))
                                                                       rules[pythonYield] = tsSeq[K](tsString[K]("yield"), tsChoice[K](tsSeq[K](tsString[K]("from"), tsSymbol[K](pythonExpression)), tsChoice[K](tsSymbol[K](pythonHidExpressions), tsBlank[K]())))
                                                                       rules[pythonHidExpressions] = tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonExpressionList))
                                                                       rules[pythonWithItem] = tsSeq[K](tsSymbol[K](pythonExpression), tsChoice[K](tsSeq[K](tsString[K]("as"), tsSymbol[K](pythonPattern)), tsBlank[K]()))
                                                                       rules[pythonChevron] = tsSeq[K](tsString[K](">>"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonAssertStatement] = tsSeq[K](tsString[K]("assert"), tsSeq[K](tsSymbol[K](pythonExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression)))))
                                                                       rules[pythonHidCompoundStatement] = tsChoice[K](tsSymbol[K](pythonIfStatement), tsSymbol[K](pythonForStatement), tsSymbol[K](pythonWhileStatement), tsSymbol[K](pythonTryStatement), tsSymbol[K](pythonWithStatement), tsSymbol[K](pythonFunctionDefinition), tsSymbol[K](pythonClassDefinition), tsSymbol[K](pythonDecoratedDefinition))
                                                                       rules[pythonTryStatement] = tsSeq[K](tsString[K]("try"), tsString[K](":"), tsSymbol[K](pythonHidSuite), tsChoice[K](tsSeq[K](tsRepeat1[K](tsSymbol[K](pythonExceptClause)), tsChoice[K](tsSymbol[K](pythonElseClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](pythonFinallyClause), tsBlank[K]())), tsSymbol[K](pythonFinallyClause)))
                                                                       rules[pythonModule] = tsRepeat[K](tsSymbol[K](pythonHidStatement))
                                                                       rules[pythonElifClause] = tsSeq[K](tsString[K]("elif"), tsSymbol[K](pythonExpression), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonTuple] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](pythonHidCollectionElements), tsBlank[K]()), tsString[K](")"))
                                                                       rules[pythonConditionalExpression] = tsSeq[K](tsSymbol[K](pythonExpression), tsString[K]("if"), tsSymbol[K](pythonExpression), tsString[K]("else"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonAliasedImport] = tsSeq[K](tsSymbol[K](pythonDottedName), tsString[K]("as"), tsSymbol[K](pythonIdentifier))
                                                                       rules[pythonString] = tsSeq[K](tsSymbol[K](pythonHidStringStart), tsRepeat[K](tsChoice[K](tsSymbol[K](pythonInterpolation), tsSymbol[K](pythonHidEscapeInterpolation), tsSymbol[K](pythonEscapeSequence), tsSymbol[K](pythonHidNotEscapeSequence), tsSymbol[K](pythonHidStringContent))), tsSymbol[K](pythonHidStringEnd))
                                                                       rules[pythonFutureImportStatement] = tsSeq[K](tsString[K]("from"), tsString[K]("__future__"), tsString[K]("import"), tsChoice[K](tsSymbol[K](pythonHidImportList), tsSeq[K](tsString[K]("("), tsSymbol[K](pythonHidImportList), tsString[K](")"))))
                                                                       rules[pythonBreakStatement] = tsString[K]("break")
                                                                       rules[pythonAugmentedAssignment] = tsSeq[K](tsSymbol[K](pythonHidLeftHandSide), tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("@="), tsString[K]("//="), tsString[K]("%="), tsString[K]("**="), tsString[K](">>="), tsString[K]("<<="), tsString[K]("&="), tsString[K]("^="), tsString[K]("|=")), tsSymbol[K](pythonHidRightHandSide))
                                                                       rules[pythonDictionaryComprehension] = tsSeq[K](tsString[K]("{"), tsSymbol[K](pythonPair), tsSymbol[K](pythonHidComprehensionClauses), tsString[K]("}"))
                                                                       rules[pythonIfClause] = tsSeq[K](tsString[K]("if"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonSetComprehension] = tsSeq[K](tsString[K]("{"), tsSymbol[K](pythonExpression), tsSymbol[K](pythonHidComprehensionClauses), tsString[K]("}"))
                                                                       rules[pythonHidCollectionElements] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonYield), tsSymbol[K](pythonListSplat), tsSymbol[K](pythonParenthesizedListSplat)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonYield), tsSymbol[K](pythonListSplat), tsSymbol[K](pythonParenthesizedListSplat))))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[pythonArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonListSplat), tsSymbol[K](pythonDictionarySplat), tsSymbol[K](pythonParenthesizedListSplat), tsSymbol[K](pythonKeywordArgument)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonListSplat), tsSymbol[K](pythonDictionarySplat), tsSymbol[K](pythonParenthesizedListSplat), tsSymbol[K](pythonKeywordArgument))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                       rules[pythonEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("u[a-fA-F\\d]{4}"), tsRegex[K]("U[a-fA-F\\d]{8}"), tsRegex[K]("x[a-fA-F\\d]{2}"), tsRegex[K]("\\d{3}"), tsRegex[K]("\\r?\\n"), tsRegex[K]("[\'\"abfrntv\\\\]")))
                                                                       rules[pythonHidSimpleStatement] = tsChoice[K](tsSymbol[K](pythonFutureImportStatement), tsSymbol[K](pythonImportStatement), tsSymbol[K](pythonImportFromStatement), tsSymbol[K](pythonPrintStatement), tsSymbol[K](pythonAssertStatement), tsSymbol[K](pythonExpressionStatement), tsSymbol[K](pythonReturnStatement), tsSymbol[K](pythonDeleteStatement), tsSymbol[K](pythonRaiseStatement), tsSymbol[K](pythonPassStatement), tsSymbol[K](pythonBreakStatement), tsSymbol[K](pythonContinueStatement), tsSymbol[K](pythonGlobalStatement), tsSymbol[K](pythonNonlocalStatement), tsSymbol[K](pythonExecStatement))
                                                                       rules[pythonContinueStatement] = tsString[K]("continue")
                                                                       rules[pythonIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](pythonExpression), tsString[K](":"), tsSymbol[K](pythonHidSuite), tsRepeat[K](tsSymbol[K](pythonElifClause)), tsChoice[K](tsSymbol[K](pythonElseClause), tsBlank[K]()))
                                                                       rules[pythonFunctionDefinition] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("def"), tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonParameters), tsChoice[K](tsSeq[K](tsString[K]("->"), tsSymbol[K](pythonType)), tsBlank[K]()), tsString[K](":"), tsSymbol[K](pythonHidSuite))
                                                                       rules[pythonExpressionList] = tsSeq[K](tsSymbol[K](pythonExpression), tsChoice[K](tsString[K](","), tsSeq[K](tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression))), tsChoice[K](tsString[K](","), tsBlank[K]()))))
                                                                       rules[pythonListSplatPattern] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonKeywordIdentifier), tsSymbol[K](pythonSubscript), tsSymbol[K](pythonAttribute)))
                                                                       rules[pythonHidLeftHandSide] = tsChoice[K](tsSymbol[K](pythonPattern), tsSymbol[K](pythonPatternList))
                                                                       rules[pythonTypeConversion] = tsRegex[K]("![a-z]")
                                                                       rules[pythonAttribute] = tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("."), tsSymbol[K](pythonIdentifier))
                                                                       rules[pythonFormatSpecifier] = tsSeq[K](tsString[K](":"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^{}\\n]+"), tsSymbol[K](pythonFormatExpression))))
                                                                       rules[pythonBooleanOperator] = tsChoice[K](tsSeq[K](tsSymbol[K](pythonExpression), tsString[K]("and"), tsSymbol[K](pythonExpression)), tsSeq[K](tsSymbol[K](pythonExpression), tsString[K]("or"), tsSymbol[K](pythonExpression)))
                                                                       rules[pythonFormatExpression] = tsSeq[K](tsString[K]("{"), tsSymbol[K](pythonExpression), tsString[K]("}"))
                                                                       rules[pythonExecStatement] = tsSeq[K](tsString[K]("exec"), tsSymbol[K](pythonString), tsChoice[K](tsSeq[K](tsString[K]("in"), tsSeq[K](tsSymbol[K](pythonExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression))))), tsBlank[K]()))
                                                                       rules[pythonUnaryOperator] = tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("~")), tsSymbol[K](pythonPrimaryExpression))
                                                                       rules[pythonExpressionStatement] = tsChoice[K](tsSymbol[K](pythonExpression), tsSeq[K](tsSeq[K](tsSymbol[K](pythonExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonExpression)))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsSymbol[K](pythonAssignment), tsSymbol[K](pythonAugmentedAssignment), tsSymbol[K](pythonYield))
                                                                       rules[pythonParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](pythonHidParameters), tsBlank[K]()), tsString[K](")"))
                                                                       rules[pythonLambdaParameters] = tsSymbol[K](pythonHidParameters)
                                                                       rules[pythonHidComprehensionClauses] = tsSeq[K](tsSymbol[K](pythonForInClause), tsRepeat[K](tsChoice[K](tsSymbol[K](pythonForInClause), tsSymbol[K](pythonIfClause))))
                                                                       rules[pythonKeywordIdentifier] = tsChoice[K](tsString[K]("print"), tsString[K]("exec"), tsString[K]("async"), tsString[K]("await"))
                                                                       rules[pythonRaiseStatement] = tsSeq[K](tsString[K]("raise"), tsChoice[K](tsSymbol[K](pythonHidExpressions), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("from"), tsSymbol[K](pythonExpression)), tsBlank[K]()))
                                                                       rules[pythonAssignment] = tsSeq[K](tsSymbol[K](pythonHidLeftHandSide), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](pythonHidRightHandSide)), tsSeq[K](tsString[K](":"), tsSymbol[K](pythonType)), tsSeq[K](tsString[K](":"), tsSymbol[K](pythonType), tsString[K]("="), tsSymbol[K](pythonHidRightHandSide))))
                                                                       rules[pythonDecorator] = tsSeq[K](tsString[K]("@"), tsSymbol[K](pythonPrimaryExpression), tsSymbol[K](pythonHidNewline))
                                                                       rules[pythonListComprehension] = tsSeq[K](tsString[K]("["), tsSymbol[K](pythonExpression), tsSymbol[K](pythonHidComprehensionClauses), tsString[K]("]"))
                                                                       rules[pythonDottedName] = tsSeq[K](tsSymbol[K](pythonIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](pythonIdentifier))))
                                                                       rules[pythonLambda] = tsSeq[K](tsString[K]("lambda"), tsChoice[K](tsSymbol[K](pythonLambdaParameters), tsBlank[K]()), tsString[K](":"), tsSymbol[K](pythonExpression))
                                                                       rules[pythonSet] = tsSeq[K](tsString[K]("{"), tsSymbol[K](pythonHidCollectionElements), tsString[K]("}"))
                                                                       rules[pythonDefaultParameter] = tsSeq[K](tsSymbol[K](pythonIdentifier), tsString[K]("="), tsSymbol[K](pythonExpression))
                                                                       rules[pythonHidEscapeInterpolation] = tsChoice[K](tsString[K]("{{"), tsString[K]("}}"))
                                                                       rules[pythonFloat] = tsSeq[K](tsChoice[K](tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsString[K]("."), tsChoice[K](tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRegex[K]("[eE][\\+-]?"), tsRepeat1[K](tsRegex[K]("[0-9]+_?"))), tsBlank[K]())), tsSeq[K](tsChoice[K](tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsBlank[K]()), tsString[K]("."), tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsChoice[K](tsSeq[K](tsRegex[K]("[eE][\\+-]?"), tsRepeat1[K](tsRegex[K]("[0-9]+_?"))), tsBlank[K]())), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]+_?")), tsSeq[K](tsRegex[K]("[eE][\\+-]?"), tsRepeat1[K](tsRegex[K]("[0-9]+_?"))))), tsChoice[K](tsChoice[K](tsRegex[K]("[Ll]"), tsRegex[K]("[jJ]")), tsBlank[K]()))
                                                                       rules[pythonSubscript] = tsSeq[K](tsSymbol[K](pythonPrimaryExpression), tsString[K]("["), tsSeq[K](tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonSlice)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonSlice))))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[pythonListPattern] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](pythonHidPatterns), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[pythonWildcardImport] = tsString[K]("*")
                                                                       rules[pythonImportPrefix] = tsRepeat1[K](tsString[K]("."))
                                                                       rules[pythonHidExpressionWithinForInClause] = tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonLambdaWithinForInClause))
                                                                       rules[pythonHidRightHandSide] = tsChoice[K](tsSymbol[K](pythonExpression), tsSymbol[K](pythonExpressionList), tsSymbol[K](pythonAssignment), tsSymbol[K](pythonAugmentedAssignment), tsSymbol[K](pythonYield))
                                                                       rules[pythonKeywordArgument] = tsSeq[K](tsChoice[K](tsSymbol[K](pythonIdentifier), tsSymbol[K](pythonKeywordIdentifier)), tsString[K]("="), tsSymbol[K](pythonExpression))
                                                                       rules[pythonNonlocalStatement] = tsSeq[K](tsString[K]("nonlocal"), tsSeq[K](tsSymbol[K](pythonIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](pythonIdentifier)))))
                                                                       rules[pythonSlice] = tsSeq[K](tsChoice[K](tsSymbol[K](pythonExpression), tsBlank[K]()), tsString[K](":"), tsChoice[K](tsSymbol[K](pythonExpression), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsChoice[K](tsSymbol[K](pythonExpression), tsBlank[K]())), tsBlank[K]()))
                                                                       rules[pythonList] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](pythonHidCollectionElements), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[pythonConcatenatedString] = tsSeq[K](tsSymbol[K](pythonString), tsRepeat1[K](tsSymbol[K](pythonString)))
                                                                       rules

