import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  PythonNodeKind* = enum
    pythonCompoundStatement         ## _compound_statement
    pythonSimpleStatement           ## _simple_statement
    pythonExpression                ## expression
    pythonParameter                 ## parameter
    pythonPattern                   ## pattern
    pythonPrimaryExpression         ## primary_expression
    pythonAliasedImport             ## aliased_import
    pythonArgumentList              ## argument_list
    pythonAssertStatement           ## assert_statement
    pythonAssignment                ## assignment
    pythonAttribute                 ## attribute
    pythonAugmentedAssignment       ## augmented_assignment
    pythonAwait                     ## await
    pythonBinaryOperator            ## binary_operator
    pythonBlock                     ## block
    pythonBooleanOperator           ## boolean_operator
    pythonBreakStatement            ## break_statement
    pythonCall                      ## call
    pythonChevron                   ## chevron
    pythonClassDefinition           ## class_definition
    pythonComparisonOperator        ## comparison_operator
    pythonConcatenatedString        ## concatenated_string
    pythonConditionalExpression     ## conditional_expression
    pythonContinueStatement         ## continue_statement
    pythonDecoratedDefinition       ## decorated_definition
    pythonDecorator                 ## decorator
    pythonDefaultParameter          ## default_parameter
    pythonDeleteStatement           ## delete_statement
    pythonDictionary                ## dictionary
    pythonDictionaryComprehension   ## dictionary_comprehension
    pythonDictionarySplat           ## dictionary_splat
    pythonDictionarySplatPattern    ## dictionary_splat_pattern
    pythonDottedName                ## dotted_name
    pythonElifClause                ## elif_clause
    pythonElseClause                ## else_clause
    pythonExceptClause              ## except_clause
    pythonExecStatement             ## exec_statement
    pythonExpressionList            ## expression_list
    pythonExpressionStatement       ## expression_statement
    pythonFinallyClause             ## finally_clause
    pythonForInClause               ## for_in_clause
    pythonForStatement              ## for_statement
    pythonFormatExpression          ## format_expression
    pythonFormatSpecifier           ## format_specifier
    pythonFunctionDefinition        ## function_definition
    pythonFutureImportStatement     ## future_import_statement
    pythonGeneratorExpression       ## generator_expression
    pythonGlobalStatement           ## global_statement
    pythonIfClause                  ## if_clause
    pythonIfStatement               ## if_statement
    pythonImportFromStatement       ## import_from_statement
    pythonImportPrefix              ## import_prefix
    pythonImportStatement           ## import_statement
    pythonInterpolation             ## interpolation
    pythonKeywordArgument           ## keyword_argument
    pythonLambda                    ## lambda
    pythonLambdaParameters          ## lambda_parameters
    pythonList                      ## list
    pythonListComprehension         ## list_comprehension
    pythonListPattern               ## list_pattern
    pythonListSplat                 ## list_splat
    pythonListSplatPattern          ## list_splat_pattern
    pythonModule                    ## module
    pythonNamedExpression           ## named_expression
    pythonNonlocalStatement         ## nonlocal_statement
    pythonNotOperator               ## not_operator
    pythonPair                      ## pair
    pythonParameters                ## parameters
    pythonParenthesizedExpression   ## parenthesized_expression
    pythonParenthesizedListSplat    ## parenthesized_list_splat
    pythonPassStatement             ## pass_statement
    pythonPatternList               ## pattern_list
    pythonPrintStatement            ## print_statement
    pythonRaiseStatement            ## raise_statement
    pythonRelativeImport            ## relative_import
    pythonReturnStatement           ## return_statement
    pythonSet                       ## set
    pythonSetComprehension          ## set_comprehension
    pythonSlice                     ## slice
    pythonString                    ## string
    pythonSubscript                 ## subscript
    pythonTryStatement              ## try_statement
    pythonTuple                     ## tuple
    pythonTuplePattern              ## tuple_pattern
    pythonType                      ## type
    pythonTypedDefaultParameter     ## typed_default_parameter
    pythonTypedParameter            ## typed_parameter
    pythonUnaryOperator             ## unary_operator
    pythonWhileStatement            ## while_statement
    pythonWildcardImport            ## wildcard_import
    pythonWithClause                ## with_clause
    pythonWithItem                  ## with_item
    pythonWithStatement             ## with_statement
    pythonYield                     ## yield
    pythonExclamationEqualTok       ## !=
    pythonQuoteTok                  ## "
    pythonPercentTok                ## %
    pythonPercentEqualTok           ## %=
    pythonAmpersandTok              ## &
    pythonAmpersandEqualTok         ## &=
    pythonLParTok                   ## (
    pythonRParTok                   ## )
    pythonAsteriskTok               ## *
    pythonDoubleAsteriskTok         ## **
    pythonDoubleAsteriskEqualTok    ## **=
    pythonAsteriskEqualTok          ## *=
    pythonPlusTok                   ## +
    pythonPlusEqualTok              ## +=
    pythonCommaTok                  ## ,
    pythonMinusTok                  ## -
    pythonMinusEqualTok             ## -=
    pythonMinusGreaterThanTok       ## ->
    pythonDotTok                    ## .
    pythonSlashTok                  ## /
    pythonDoubleSlashTok            ## //
    pythonDoubleSlashEqualTok       ## //=
    pythonSlashEqualTok             ## /=
    pythonColonTok                  ## :
    pythonColonEqualTok             ## :=
    pythonSemicolonTok              ## ;
    pythonLessThanTok               ## <
    pythonDoubleLessThanTok         ## <<
    pythonDoubleLessThanEqualTok    ## <<=
    pythonLessThanEqualTok          ## <=
    pythonLessThanGreaterThanTok    ## <>
    pythonEqualTok                  ## =
    pythonDoubleEqualTok            ## ==
    pythonGreaterThanTok            ## >
    pythonGreaterThanEqualTok       ## >=
    pythonDoubleGreaterThanTok      ## >>
    pythonDoubleGreaterThanEqualTok ## >>=
    pythonAtTok                     ## @
    pythonAtEqualTok                ## @=
    pythonLBrackTok                 ## [
    pythonRBrackTok                 ## ]
    pythonAccentTok                 ## ^
    pythonAccentEqualTok            ## ^=
    pythonFutureTok                 ## __future__
    pythonAndTok                    ## and
    pythonAsTok                     ## as
    pythonAssertTok                 ## assert
    pythonAsyncTok                  ## async
    pythonAwaitTok                  ## await
    pythonBreakTok                  ## break
    pythonClassTok                  ## class
    pythonComment                   ## comment
    pythonContinueTok               ## continue
    pythonDefTok                    ## def
    pythonDelTok                    ## del
    pythonElifTok                   ## elif
    pythonEllipsis                  ## ellipsis
    pythonElseTok                   ## else
    pythonEscapeSequence            ## escape_sequence
    pythonExceptTok                 ## except
    pythonExecTok                   ## exec
    pythonFalse                     ## false
    pythonFinallyTok                ## finally
    pythonFloat                     ## float
    pythonForTok                    ## for
    pythonFromTok                   ## from
    pythonGlobalTok                 ## global
    pythonIdentifier                ## identifier
    pythonIfTok                     ## if
    pythonImportTok                 ## import
    pythonInTok                     ## in
    pythonInteger                   ## integer
    pythonIsTok                     ## is
    pythonLambdaTok                 ## lambda
    pythonNone                      ## none
    pythonNonlocalTok               ## nonlocal
    pythonNotTok                    ## not
    pythonOrTok                     ## or
    pythonPassTok                   ## pass
    pythonPrintTok                  ## print
    pythonRaiseTok                  ## raise
    pythonReturnTok                 ## return
    pythonTrue                      ## true
    pythonTryTok                    ## try
    pythonTypeConversion            ## type_conversion
    pythonWhileTok                  ## while
    pythonWithTok                   ## with
    pythonYieldTok                  ## yield
    pythonLCurlyTok                 ## {
    pythonDoubleLCurlyTok           ## {{
    pythonPipeTok                   ## |
    pythonPipeEqualTok              ## |=
    pythonRCurlyTok                 ## }
    pythonDoubleRCurlyTok           ## }}
    pythonTildeTok                  ## ~
    pythonSyntaxError               ## Tree-sitter parser syntax error


proc strRepr*(kind: PythonNodeKind): string =
  case kind:
    of pythonCompoundStatement:         "_compound_statement"
    of pythonSimpleStatement:           "_simple_statement"
    of pythonExpression:                "expression"
    of pythonParameter:                 "parameter"
    of pythonPattern:                   "pattern"
    of pythonPrimaryExpression:         "primary_expression"
    of pythonAliasedImport:             "aliased_import"
    of pythonArgumentList:              "argument_list"
    of pythonAssertStatement:           "assert_statement"
    of pythonAssignment:                "assignment"
    of pythonAttribute:                 "attribute"
    of pythonAugmentedAssignment:       "augmented_assignment"
    of pythonAwait:                     "await"
    of pythonBinaryOperator:            "binary_operator"
    of pythonBlock:                     "block"
    of pythonBooleanOperator:           "boolean_operator"
    of pythonBreakStatement:            "break_statement"
    of pythonCall:                      "call"
    of pythonChevron:                   "chevron"
    of pythonClassDefinition:           "class_definition"
    of pythonComparisonOperator:        "comparison_operator"
    of pythonConcatenatedString:        "concatenated_string"
    of pythonConditionalExpression:     "conditional_expression"
    of pythonContinueStatement:         "continue_statement"
    of pythonDecoratedDefinition:       "decorated_definition"
    of pythonDecorator:                 "decorator"
    of pythonDefaultParameter:          "default_parameter"
    of pythonDeleteStatement:           "delete_statement"
    of pythonDictionary:                "dictionary"
    of pythonDictionaryComprehension:   "dictionary_comprehension"
    of pythonDictionarySplat:           "dictionary_splat"
    of pythonDictionarySplatPattern:    "dictionary_splat_pattern"
    of pythonDottedName:                "dotted_name"
    of pythonElifClause:                "elif_clause"
    of pythonElseClause:                "else_clause"
    of pythonExceptClause:              "except_clause"
    of pythonExecStatement:             "exec_statement"
    of pythonExpressionList:            "expression_list"
    of pythonExpressionStatement:       "expression_statement"
    of pythonFinallyClause:             "finally_clause"
    of pythonForInClause:               "for_in_clause"
    of pythonForStatement:              "for_statement"
    of pythonFormatExpression:          "format_expression"
    of pythonFormatSpecifier:           "format_specifier"
    of pythonFunctionDefinition:        "function_definition"
    of pythonFutureImportStatement:     "future_import_statement"
    of pythonGeneratorExpression:       "generator_expression"
    of pythonGlobalStatement:           "global_statement"
    of pythonIfClause:                  "if_clause"
    of pythonIfStatement:               "if_statement"
    of pythonImportFromStatement:       "import_from_statement"
    of pythonImportPrefix:              "import_prefix"
    of pythonImportStatement:           "import_statement"
    of pythonInterpolation:             "interpolation"
    of pythonKeywordArgument:           "keyword_argument"
    of pythonLambda:                    "lambda"
    of pythonLambdaParameters:          "lambda_parameters"
    of pythonList:                      "list"
    of pythonListComprehension:         "list_comprehension"
    of pythonListPattern:               "list_pattern"
    of pythonListSplat:                 "list_splat"
    of pythonListSplatPattern:          "list_splat_pattern"
    of pythonModule:                    "module"
    of pythonNamedExpression:           "named_expression"
    of pythonNonlocalStatement:         "nonlocal_statement"
    of pythonNotOperator:               "not_operator"
    of pythonPair:                      "pair"
    of pythonParameters:                "parameters"
    of pythonParenthesizedExpression:   "parenthesized_expression"
    of pythonParenthesizedListSplat:    "parenthesized_list_splat"
    of pythonPassStatement:             "pass_statement"
    of pythonPatternList:               "pattern_list"
    of pythonPrintStatement:            "print_statement"
    of pythonRaiseStatement:            "raise_statement"
    of pythonRelativeImport:            "relative_import"
    of pythonReturnStatement:           "return_statement"
    of pythonSet:                       "set"
    of pythonSetComprehension:          "set_comprehension"
    of pythonSlice:                     "slice"
    of pythonString:                    "string"
    of pythonSubscript:                 "subscript"
    of pythonTryStatement:              "try_statement"
    of pythonTuple:                     "tuple"
    of pythonTuplePattern:              "tuple_pattern"
    of pythonType:                      "type"
    of pythonTypedDefaultParameter:     "typed_default_parameter"
    of pythonTypedParameter:            "typed_parameter"
    of pythonUnaryOperator:             "unary_operator"
    of pythonWhileStatement:            "while_statement"
    of pythonWildcardImport:            "wildcard_import"
    of pythonWithClause:                "with_clause"
    of pythonWithItem:                  "with_item"
    of pythonWithStatement:             "with_statement"
    of pythonYield:                     "yield"
    of pythonExclamationEqualTok:       "!="
    of pythonQuoteTok:                  "\""
    of pythonPercentTok:                "%"
    of pythonPercentEqualTok:           "%="
    of pythonAmpersandTok:              "&"
    of pythonAmpersandEqualTok:         "&="
    of pythonLParTok:                   "("
    of pythonRParTok:                   ")"
    of pythonAsteriskTok:               "*"
    of pythonDoubleAsteriskTok:         "**"
    of pythonDoubleAsteriskEqualTok:    "**="
    of pythonAsteriskEqualTok:          "*="
    of pythonPlusTok:                   "+"
    of pythonPlusEqualTok:              "+="
    of pythonCommaTok:                  ","
    of pythonMinusTok:                  "-"
    of pythonMinusEqualTok:             "-="
    of pythonMinusGreaterThanTok:       "->"
    of pythonDotTok:                    "."
    of pythonSlashTok:                  "/"
    of pythonDoubleSlashTok:            "//"
    of pythonDoubleSlashEqualTok:       "//="
    of pythonSlashEqualTok:             "/="
    of pythonColonTok:                  ":"
    of pythonColonEqualTok:             ":="
    of pythonSemicolonTok:              ";"
    of pythonLessThanTok:               "<"
    of pythonDoubleLessThanTok:         "<<"
    of pythonDoubleLessThanEqualTok:    "<<="
    of pythonLessThanEqualTok:          "<="
    of pythonLessThanGreaterThanTok:    "<>"
    of pythonEqualTok:                  "="
    of pythonDoubleEqualTok:            "=="
    of pythonGreaterThanTok:            ">"
    of pythonGreaterThanEqualTok:       ">="
    of pythonDoubleGreaterThanTok:      ">>"
    of pythonDoubleGreaterThanEqualTok: ">>="
    of pythonAtTok:                     "@"
    of pythonAtEqualTok:                "@="
    of pythonLBrackTok:                 "["
    of pythonRBrackTok:                 "]"
    of pythonAccentTok:                 "^"
    of pythonAccentEqualTok:            "^="
    of pythonFutureTok:                 "__future__"
    of pythonAndTok:                    "and"
    of pythonAsTok:                     "as"
    of pythonAssertTok:                 "assert"
    of pythonAsyncTok:                  "async"
    of pythonAwaitTok:                  "await"
    of pythonBreakTok:                  "break"
    of pythonClassTok:                  "class"
    of pythonComment:                   "comment"
    of pythonContinueTok:               "continue"
    of pythonDefTok:                    "def"
    of pythonDelTok:                    "del"
    of pythonElifTok:                   "elif"
    of pythonEllipsis:                  "ellipsis"
    of pythonElseTok:                   "else"
    of pythonEscapeSequence:            "escape_sequence"
    of pythonExceptTok:                 "except"
    of pythonExecTok:                   "exec"
    of pythonFalse:                     "false"
    of pythonFinallyTok:                "finally"
    of pythonFloat:                     "float"
    of pythonForTok:                    "for"
    of pythonFromTok:                   "from"
    of pythonGlobalTok:                 "global"
    of pythonIdentifier:                "identifier"
    of pythonIfTok:                     "if"
    of pythonImportTok:                 "import"
    of pythonInTok:                     "in"
    of pythonInteger:                   "integer"
    of pythonIsTok:                     "is"
    of pythonLambdaTok:                 "lambda"
    of pythonNone:                      "none"
    of pythonNonlocalTok:               "nonlocal"
    of pythonNotTok:                    "not"
    of pythonOrTok:                     "or"
    of pythonPassTok:                   "pass"
    of pythonPrintTok:                  "print"
    of pythonRaiseTok:                  "raise"
    of pythonReturnTok:                 "return"
    of pythonTrue:                      "true"
    of pythonTryTok:                    "try"
    of pythonTypeConversion:            "type_conversion"
    of pythonWhileTok:                  "while"
    of pythonWithTok:                   "with"
    of pythonYieldTok:                  "yield"
    of pythonLCurlyTok:                 "{"
    of pythonDoubleLCurlyTok:           "{{"
    of pythonPipeTok:                   "|"
    of pythonPipeEqualTok:              "|="
    of pythonRCurlyTok:                 "}"
    of pythonDoubleRCurlyTok:           "}}"
    of pythonTildeTok:                  "~"
    of pythonSyntaxError:               "ERROR"


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
                                                                             tmp[pythonBlock] = {pythonCompoundStatement, pythonSimpleStatement}
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
                                                                             tmp[pythonModule] = {pythonCompoundStatement, pythonSimpleStatement}
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
                                                 pythonFutureTok,
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

proc tsNodeType*(node: TsPythonNode): string



proc kind*(node: TsPythonNode): PythonNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_compound_statement":      pythonCompoundStatement
      of "_simple_statement":        pythonSimpleStatement
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
      of "__future__":               pythonFutureTok
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


func `[]`*(
    node: TsPythonNode,
    idx:  int,
    kind: PythonNodeKind | set[PythonNodeKind]
  ): TsPythonNode =
  assert 0 <= idx and idx < node.len
  result = TsPythonNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  PythonNode* = HtsNode[TsPythonNode, PythonNodeKind]


proc treeReprTsPython*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsPythonNode, PythonNodeKind](parseTsPythonString(str), str, 6, unnamed = unnamed)

proc toHtsNode*(
    node: TsPythonNode,
    str:  ptr string
  ): HtsNode[TsPythonNode, PythonNodeKind] =
  toHtsNode[TsPythonNode, PythonNodeKind](node, str)

proc toHtsTree*(node: TsPythonNode, str: ptr string): PythonNode =
  toHtsNode[TsPythonNode, PythonNodeKind](node, str)

proc parsePythonString*(str: ptr string, unnamed: bool = false): PythonNode =
  let parser = newTsPythonParser()
  return toHtsTree[TsPythonNode, PythonNodeKind](parseString(parser, str[]), str)

proc parsePythonString*(str: string, unnamed: bool = false): PythonNode =
  let parser = newTsPythonParser()
  return toHtsTree[TsPythonNode, PythonNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


