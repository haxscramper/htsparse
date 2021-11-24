import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  RubyNodeKind* = enum
    rubyUsArg                       ## _arg
    rubyUsExpression                ## _expression
    rubyUsLhs                       ## _lhs
    rubyUsMethodName                ## _method_name
    rubyUsPatternConstant           ## _pattern_constant
    rubyUsPatternExpr               ## _pattern_expr
    rubyUsPatternExprBasic          ## _pattern_expr_basic
    rubyUsPatternPrimitive          ## _pattern_primitive
    rubyUsPatternTopExprBody        ## _pattern_top_expr_body
    rubyUsPrimary                   ## _primary
    rubyUsSimpleNumeric             ## _simple_numeric
    rubyUsStatement                 ## _statement
    rubyUsVariable                  ## _variable
    rubyAlias                       ## alias
    rubyAlternativePattern          ## alternative_pattern
    rubyArgumentList                ## argument_list
    rubyArray                       ## array
    rubyArrayPattern                ## array_pattern
    rubyAsPattern                   ## as_pattern
    rubyAssignment                  ## assignment
    rubyBareString                  ## bare_string
    rubyBareSymbol                  ## bare_symbol
    rubyBegin                       ## begin
    rubyBeginBlock                  ## begin_block
    rubyBinary                      ## binary
    rubyBlock                       ## block
    rubyBlockArgument               ## block_argument
    rubyBlockParameter              ## block_parameter
    rubyBlockParameters             ## block_parameters
    rubyBreak                       ## break
    rubyCall                        ## call
    rubyCase                        ## case
    rubyCaseMatch                   ## case_match
    rubyChainedString               ## chained_string
    rubyClass                       ## class
    rubyConditional                 ## conditional
    rubyDelimitedSymbol             ## delimited_symbol
    rubyDestructuredLeftAssignment  ## destructured_left_assignment
    rubyDestructuredParameter       ## destructured_parameter
    rubyDo                          ## do
    rubyDoBlock                     ## do_block
    rubyElementReference            ## element_reference
    rubyElse                        ## else
    rubyElsif                       ## elsif
    rubyEmptyStatement              ## empty_statement
    rubyEndBlock                    ## end_block
    rubyEnsure                      ## ensure
    rubyExceptionVariable           ## exception_variable
    rubyExceptions                  ## exceptions
    rubyFindPattern                 ## find_pattern
    rubyFor                         ## for
    rubyForwardArgument             ## forward_argument
    rubyForwardParameter            ## forward_parameter
    rubyHash                        ## hash
    rubyHashPattern                 ## hash_pattern
    rubyHashSplatArgument           ## hash_splat_argument
    rubyHashSplatNil                ## hash_splat_nil
    rubyHashSplatParameter          ## hash_splat_parameter
    rubyHeredocBody                 ## heredoc_body
    rubyIf                          ## if
    rubyIfGuard                     ## if_guard
    rubyIfModifier                  ## if_modifier
    rubyIn                          ## in
    rubyInClause                    ## in_clause
    rubyInterpolation               ## interpolation
    rubyKeywordParameter            ## keyword_parameter
    rubyKeywordPattern              ## keyword_pattern
    rubyLambda                      ## lambda
    rubyLambdaParameters            ## lambda_parameters
    rubyLeftAssignmentList          ## left_assignment_list
    rubyMethod                      ## method
    rubyMethodParameters            ## method_parameters
    rubyModule                      ## module
    rubyNext                        ## next
    rubyOperator                    ## operator
    rubyOperatorAssignment          ## operator_assignment
    rubyOptionalParameter           ## optional_parameter
    rubyPair                        ## pair
    rubyParenthesizedStatements     ## parenthesized_statements
    rubyPattern                     ## pattern
    rubyProgram                     ## program
    rubyRange                       ## range
    rubyRational                    ## rational
    rubyRedo                        ## redo
    rubyRegex                       ## regex
    rubyRescue                      ## rescue
    rubyRescueModifier              ## rescue_modifier
    rubyRestAssignment              ## rest_assignment
    rubyRetry                       ## retry
    rubyReturn                      ## return
    rubyRightAssignmentList         ## right_assignment_list
    rubyScopeResolution             ## scope_resolution
    rubySetter                      ## setter
    rubySingletonClass              ## singleton_class
    rubySingletonMethod             ## singleton_method
    rubySplatArgument               ## splat_argument
    rubySplatParameter              ## splat_parameter
    rubyString                      ## string
    rubyStringArray                 ## string_array
    rubySubshell                    ## subshell
    rubySuperclass                  ## superclass
    rubySymbolArray                 ## symbol_array
    rubyThen                        ## then
    rubyUnary                       ## unary
    rubyUndef                       ## undef
    rubyUnless                      ## unless
    rubyUnlessGuard                 ## unless_guard
    rubyUnlessModifier              ## unless_modifier
    rubyUntil                       ## until
    rubyUntilModifier               ## until_modifier
    rubyVariableReferencePattern    ## variable_reference_pattern
    rubyWhen                        ## when
    rubyWhile                       ## while
    rubyWhileModifier               ## while_modifier
    rubyYield                       ## yield
    rubyExclamationTok              ## !
    rubyExclamationEqualTok         ## !=
    rubyExclamationTildeTok         ## !~
    rubyQuoteTok                    ## "
    rubyHashLCurlyTok               ## #{
    rubyPercentTok                  ## %
    rubyPercentEqualTok             ## %=
    rubyPercentiLParTok             ## %i(
    rubyPercentwLParTok             ## %w(
    rubyAmpersandTok                ## &
    rubyDoubleAmpersandTok          ## &&
    rubyDoubleAmpersandEqualTok     ## &&=
    rubyAmpersandDotTok             ## &.
    rubyAmpersandEqualTok           ## &=
    rubyLParTok                     ## (
    rubyRParTok                     ## )
    rubyAsteriskTok                 ## *
    rubyDoubleAsteriskTok           ## **
    rubyDoubleAsteriskEqualTok      ## **=
    rubyAsteriskEqualTok            ## *=
    rubyPlusTok                     ## +
    rubyPlusEqualTok                ## +=
    rubyPlusAtTok                   ## +@
    rubyCommaTok                    ## ,
    rubyMinusTok                    ## -
    rubyMinusEqualTok               ## -=
    rubyMinusGreaterThanTok         ## ->
    rubyMinusAtTok                  ## -@
    rubyDotTok                      ## .
    rubyDoubleDotTok                ## ..
    rubyTripleDotTok                ## ...
    rubySlashTok                    ## /
    rubySlashEqualTok               ## /=
    rubyColonTok                    ## :
    rubyColonQuoteTok               ## :"
    rubyDoubleColonTok              ## ::
    rubySemicolonTok                ## ;
    rubyLessThanTok                 ## <
    rubyDoubleLessThanTok           ## <<
    rubyDoubleLessThanEqualTok      ## <<=
    rubyLessThanEqualTok            ## <=
    rubyLessThanEqualGreaterThanTok ## <=>
    rubyEqualTok                    ## =
    rubyDoubleEqualTok              ## ==
    rubyTripleEqualTok              ## ===
    rubyEqualGreaterThanTok         ## =>
    rubyEqualTildeTok               ## =~
    rubyGreaterThanTok              ## >
    rubyGreaterThanEqualTok         ## >=
    rubyDoubleGreaterThanTok        ## >>
    rubyDoubleGreaterThanEqualTok   ## >>=
    rubyQuestionTok                 ## ?
    rubyBEGINTok                    ## BEGIN
    rubyENDTok                      ## END
    rubyLBrackTok                   ## [
    rubyLBrackRBrackTok             ## []
    rubyLBrackRBrackEqualTok        ## []=
    rubyRBrackTok                   ## ]
    rubyAccentTok                   ## ^
    rubyAccentEqualTok              ## ^=
    rubyUsUsENDTok                  ## __END__
    rubyBacktickTok                 ## `
    rubyAliasTok                    ## alias
    rubyAndTok                      ## and
    rubyBeginTok1                   ## begin
    rubyBreakTok                    ## break
    rubyCaseTok                     ## case
    rubyCharacter                   ## character
    rubyClassTok                    ## class
    rubyClassVariable               ## class_variable
    rubyComment                     ## comment
    rubyComplex                     ## complex
    rubyConstant                    ## constant
    rubyDefTok                      ## def
    rubyDefinedQuestionTok          ## defined?
    rubyDoTok                       ## do
    rubyElseTok                     ## else
    rubyElsifTok                    ## elsif
    rubyEncoding                    ## encoding
    rubyEndTok1                     ## end
    rubyEnsureTok                   ## ensure
    rubyEscapeSequence              ## escape_sequence
    rubyFalse                       ## false
    rubyFile                        ## file
    rubyFloat                       ## float
    rubyForTok                      ## for
    rubyGlobalVariable              ## global_variable
    rubyHashKeySymbol               ## hash_key_symbol
    rubyHeredocBeginning            ## heredoc_beginning
    rubyHeredocContent              ## heredoc_content
    rubyHeredocEnd                  ## heredoc_end
    rubyIdentifier                  ## identifier
    rubyIfTok                       ## if
    rubyInTok                       ## in
    rubyInstanceVariable            ## instance_variable
    rubyInteger                     ## integer
    rubyLine                        ## line
    rubyModuleTok                   ## module
    rubyNextTok                     ## next
    rubyNilTok                      ## nil
    rubyNil                         ## nil
    rubyNotTok                      ## not
    rubyOrTok                       ## or
    rubyRTok                        ## r
    rubyRedoTok                     ## redo
    rubyRescueTok                   ## rescue
    rubyRetryTok                    ## retry
    rubyReturnTok                   ## return
    rubySelf                        ## self
    rubySimpleSymbol                ## simple_symbol
    rubyStringContent               ## string_content
    rubySuper                       ## super
    rubyThenTok                     ## then
    rubyTrue                        ## true
    rubyUndefTok                    ## undef
    rubyUninterpreted               ## uninterpreted
    rubyUnlessTok                   ## unless
    rubyUntilTok                    ## until
    rubyWhenTok                     ## when
    rubyWhileTok                    ## while
    rubyYieldTok                    ## yield
    rubyLCurlyTok                   ## {
    rubyPipeTok                     ## |
    rubyPipeEqualTok                ## |=
    rubyDoublePipeTok               ## ||
    rubyDoublePipeEqualTok          ## ||=
    rubyRCurlyTok                   ## }
    rubyTildeTok                    ## ~
    rubySyntaxError                 ## Tree-sitter parser syntax error


proc strRepr*(kind: RubyNodeKind): string =
  case kind:
    of rubyUsArg:                       "_arg"
    of rubyUsExpression:                "_expression"
    of rubyUsLhs:                       "_lhs"
    of rubyUsMethodName:                "_method_name"
    of rubyUsPatternConstant:           "_pattern_constant"
    of rubyUsPatternExpr:               "_pattern_expr"
    of rubyUsPatternExprBasic:          "_pattern_expr_basic"
    of rubyUsPatternPrimitive:          "_pattern_primitive"
    of rubyUsPatternTopExprBody:        "_pattern_top_expr_body"
    of rubyUsPrimary:                   "_primary"
    of rubyUsSimpleNumeric:             "_simple_numeric"
    of rubyUsStatement:                 "_statement"
    of rubyUsVariable:                  "_variable"
    of rubyAlias:                       "alias"
    of rubyAlternativePattern:          "alternative_pattern"
    of rubyArgumentList:                "argument_list"
    of rubyArray:                       "array"
    of rubyArrayPattern:                "array_pattern"
    of rubyAsPattern:                   "as_pattern"
    of rubyAssignment:                  "assignment"
    of rubyBareString:                  "bare_string"
    of rubyBareSymbol:                  "bare_symbol"
    of rubyBegin:                       "begin"
    of rubyBeginBlock:                  "begin_block"
    of rubyBinary:                      "binary"
    of rubyBlock:                       "block"
    of rubyBlockArgument:               "block_argument"
    of rubyBlockParameter:              "block_parameter"
    of rubyBlockParameters:             "block_parameters"
    of rubyBreak:                       "break"
    of rubyCall:                        "call"
    of rubyCase:                        "case"
    of rubyCaseMatch:                   "case_match"
    of rubyChainedString:               "chained_string"
    of rubyClass:                       "class"
    of rubyConditional:                 "conditional"
    of rubyDelimitedSymbol:             "delimited_symbol"
    of rubyDestructuredLeftAssignment:  "destructured_left_assignment"
    of rubyDestructuredParameter:       "destructured_parameter"
    of rubyDo:                          "do"
    of rubyDoBlock:                     "do_block"
    of rubyElementReference:            "element_reference"
    of rubyElse:                        "else"
    of rubyElsif:                       "elsif"
    of rubyEmptyStatement:              "empty_statement"
    of rubyEndBlock:                    "end_block"
    of rubyEnsure:                      "ensure"
    of rubyExceptionVariable:           "exception_variable"
    of rubyExceptions:                  "exceptions"
    of rubyFindPattern:                 "find_pattern"
    of rubyFor:                         "for"
    of rubyForwardArgument:             "forward_argument"
    of rubyForwardParameter:            "forward_parameter"
    of rubyHash:                        "hash"
    of rubyHashPattern:                 "hash_pattern"
    of rubyHashSplatArgument:           "hash_splat_argument"
    of rubyHashSplatNil:                "hash_splat_nil"
    of rubyHashSplatParameter:          "hash_splat_parameter"
    of rubyHeredocBody:                 "heredoc_body"
    of rubyIf:                          "if"
    of rubyIfGuard:                     "if_guard"
    of rubyIfModifier:                  "if_modifier"
    of rubyIn:                          "in"
    of rubyInClause:                    "in_clause"
    of rubyInterpolation:               "interpolation"
    of rubyKeywordParameter:            "keyword_parameter"
    of rubyKeywordPattern:              "keyword_pattern"
    of rubyLambda:                      "lambda"
    of rubyLambdaParameters:            "lambda_parameters"
    of rubyLeftAssignmentList:          "left_assignment_list"
    of rubyMethod:                      "method"
    of rubyMethodParameters:            "method_parameters"
    of rubyModule:                      "module"
    of rubyNext:                        "next"
    of rubyOperator:                    "operator"
    of rubyOperatorAssignment:          "operator_assignment"
    of rubyOptionalParameter:           "optional_parameter"
    of rubyPair:                        "pair"
    of rubyParenthesizedStatements:     "parenthesized_statements"
    of rubyPattern:                     "pattern"
    of rubyProgram:                     "program"
    of rubyRange:                       "range"
    of rubyRational:                    "rational"
    of rubyRedo:                        "redo"
    of rubyRegex:                       "regex"
    of rubyRescue:                      "rescue"
    of rubyRescueModifier:              "rescue_modifier"
    of rubyRestAssignment:              "rest_assignment"
    of rubyRetry:                       "retry"
    of rubyReturn:                      "return"
    of rubyRightAssignmentList:         "right_assignment_list"
    of rubyScopeResolution:             "scope_resolution"
    of rubySetter:                      "setter"
    of rubySingletonClass:              "singleton_class"
    of rubySingletonMethod:             "singleton_method"
    of rubySplatArgument:               "splat_argument"
    of rubySplatParameter:              "splat_parameter"
    of rubyString:                      "string"
    of rubyStringArray:                 "string_array"
    of rubySubshell:                    "subshell"
    of rubySuperclass:                  "superclass"
    of rubySymbolArray:                 "symbol_array"
    of rubyThen:                        "then"
    of rubyUnary:                       "unary"
    of rubyUndef:                       "undef"
    of rubyUnless:                      "unless"
    of rubyUnlessGuard:                 "unless_guard"
    of rubyUnlessModifier:              "unless_modifier"
    of rubyUntil:                       "until"
    of rubyUntilModifier:               "until_modifier"
    of rubyVariableReferencePattern:    "variable_reference_pattern"
    of rubyWhen:                        "when"
    of rubyWhile:                       "while"
    of rubyWhileModifier:               "while_modifier"
    of rubyYield:                       "yield"
    of rubyExclamationTok:              "!"
    of rubyExclamationEqualTok:         "!="
    of rubyExclamationTildeTok:         "!~"
    of rubyQuoteTok:                    "\""
    of rubyHashLCurlyTok:               "#{"
    of rubyPercentTok:                  "%"
    of rubyPercentEqualTok:             "%="
    of rubyPercentiLParTok:             "%i("
    of rubyPercentwLParTok:             "%w("
    of rubyAmpersandTok:                "&"
    of rubyDoubleAmpersandTok:          "&&"
    of rubyDoubleAmpersandEqualTok:     "&&="
    of rubyAmpersandDotTok:             "&."
    of rubyAmpersandEqualTok:           "&="
    of rubyLParTok:                     "("
    of rubyRParTok:                     ")"
    of rubyAsteriskTok:                 "*"
    of rubyDoubleAsteriskTok:           "**"
    of rubyDoubleAsteriskEqualTok:      "**="
    of rubyAsteriskEqualTok:            "*="
    of rubyPlusTok:                     "+"
    of rubyPlusEqualTok:                "+="
    of rubyPlusAtTok:                   "+@"
    of rubyCommaTok:                    ","
    of rubyMinusTok:                    "-"
    of rubyMinusEqualTok:               "-="
    of rubyMinusGreaterThanTok:         "->"
    of rubyMinusAtTok:                  "-@"
    of rubyDotTok:                      "."
    of rubyDoubleDotTok:                ".."
    of rubyTripleDotTok:                "..."
    of rubySlashTok:                    "/"
    of rubySlashEqualTok:               "/="
    of rubyColonTok:                    ":"
    of rubyColonQuoteTok:               ":\""
    of rubyDoubleColonTok:              "::"
    of rubySemicolonTok:                ";"
    of rubyLessThanTok:                 "<"
    of rubyDoubleLessThanTok:           "<<"
    of rubyDoubleLessThanEqualTok:      "<<="
    of rubyLessThanEqualTok:            "<="
    of rubyLessThanEqualGreaterThanTok: "<=>"
    of rubyEqualTok:                    "="
    of rubyDoubleEqualTok:              "=="
    of rubyTripleEqualTok:              "==="
    of rubyEqualGreaterThanTok:         "=>"
    of rubyEqualTildeTok:               "=~"
    of rubyGreaterThanTok:              ">"
    of rubyGreaterThanEqualTok:         ">="
    of rubyDoubleGreaterThanTok:        ">>"
    of rubyDoubleGreaterThanEqualTok:   ">>="
    of rubyQuestionTok:                 "?"
    of rubyBEGINTok:                    "BEGIN"
    of rubyENDTok:                      "END"
    of rubyLBrackTok:                   "["
    of rubyLBrackRBrackTok:             "[]"
    of rubyLBrackRBrackEqualTok:        "[]="
    of rubyRBrackTok:                   "]"
    of rubyAccentTok:                   "^"
    of rubyAccentEqualTok:              "^="
    of rubyUsUsENDTok:                  "__END__"
    of rubyBacktickTok:                 "`"
    of rubyAliasTok:                    "alias"
    of rubyAndTok:                      "and"
    of rubyBeginTok1:                   "begin"
    of rubyBreakTok:                    "break"
    of rubyCaseTok:                     "case"
    of rubyCharacter:                   "character"
    of rubyClassTok:                    "class"
    of rubyClassVariable:               "class_variable"
    of rubyComment:                     "comment"
    of rubyComplex:                     "complex"
    of rubyConstant:                    "constant"
    of rubyDefTok:                      "def"
    of rubyDefinedQuestionTok:          "defined?"
    of rubyDoTok:                       "do"
    of rubyElseTok:                     "else"
    of rubyElsifTok:                    "elsif"
    of rubyEncoding:                    "encoding"
    of rubyEndTok1:                     "end"
    of rubyEnsureTok:                   "ensure"
    of rubyEscapeSequence:              "escape_sequence"
    of rubyFalse:                       "false"
    of rubyFile:                        "file"
    of rubyFloat:                       "float"
    of rubyForTok:                      "for"
    of rubyGlobalVariable:              "global_variable"
    of rubyHashKeySymbol:               "hash_key_symbol"
    of rubyHeredocBeginning:            "heredoc_beginning"
    of rubyHeredocContent:              "heredoc_content"
    of rubyHeredocEnd:                  "heredoc_end"
    of rubyIdentifier:                  "identifier"
    of rubyIfTok:                       "if"
    of rubyInTok:                       "in"
    of rubyInstanceVariable:            "instance_variable"
    of rubyInteger:                     "integer"
    of rubyLine:                        "line"
    of rubyModuleTok:                   "module"
    of rubyNextTok:                     "next"
    of rubyNilTok:                      "nil"
    of rubyNil:                         "nil"
    of rubyNotTok:                      "not"
    of rubyOrTok:                       "or"
    of rubyRTok:                        "r"
    of rubyRedoTok:                     "redo"
    of rubyRescueTok:                   "rescue"
    of rubyRetryTok:                    "retry"
    of rubyReturnTok:                   "return"
    of rubySelf:                        "self"
    of rubySimpleSymbol:                "simple_symbol"
    of rubyStringContent:               "string_content"
    of rubySuper:                       "super"
    of rubyThenTok:                     "then"
    of rubyTrue:                        "true"
    of rubyUndefTok:                    "undef"
    of rubyUninterpreted:               "uninterpreted"
    of rubyUnlessTok:                   "unless"
    of rubyUntilTok:                    "until"
    of rubyWhenTok:                     "when"
    of rubyWhileTok:                    "while"
    of rubyYieldTok:                    "yield"
    of rubyLCurlyTok:                   "{"
    of rubyPipeTok:                     "|"
    of rubyPipeEqualTok:                "|="
    of rubyDoublePipeTok:               "||"
    of rubyDoublePipeEqualTok:          "||="
    of rubyRCurlyTok:                   "}"
    of rubyTildeTok:                    "~"
    of rubySyntaxError:                 "ERROR"


type
  RubyExternalTok* = enum
    rubyExtern_line_break                             ## _line_break
    rubyExternSimple_symbol                           ## simple_symbol
    rubyExtern_string_start                           ## _string_start
    rubyExtern_symbol_start                           ## _symbol_start
    rubyExtern_subshell_start                         ## _subshell_start
    rubyExtern_regex_start                            ## _regex_start
    rubyExtern_string_array_start                     ## _string_array_start
    rubyExtern_symbol_array_start                     ## _symbol_array_start
    rubyExtern_heredoc_body_start                     ## _heredoc_body_start
    rubyExternString_content                          ## string_content
    rubyExternHeredoc_content                         ## heredoc_content
    rubyExtern_string_end                             ## _string_end
    rubyExternHeredoc_end                             ## heredoc_end
    rubyExternHeredoc_beginning                       ## heredoc_beginning
    rubyExtern_block_ampersand                        ## _block_ampersand
    rubyExtern_splat_star                             ## _splat_star
    rubyExtern_unary_minus                            ## _unary_minus
    rubyExtern_binary_minus                           ## _binary_minus
    rubyExtern_binary_star                            ## _binary_star
    rubyExtern_singleton_class_left_angle_left_langle ## _singleton_class_left_angle_left_langle
    rubyExternHash_key_symbol                         ## hash_key_symbol
    rubyExtern_hash_splat_star_star                   ## _hash_splat_star_star
    rubyExtern_binary_star_star                       ## _binary_star_star
    rubyExtern_element_reference_bracket              ## _element_reference_bracket


type
  TsRubyNode* = distinct TSNode


type
  RubyParser* = distinct PtsParser


const rubyAllowedSubnodes*: array[RubyNodeKind, set[RubyNodeKind]] = block:
                                                                       var tmp: array[RubyNodeKind, set[RubyNodeKind]]
                                                                       tmp[rubyArgumentList] = {rubyUsExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyArray] = {rubyUsExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyArrayPattern] = {rubyUsPatternExpr, rubySplatParameter}
                                                                       tmp[rubyBareString] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyBareSymbol] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyBegin] = {rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyBeginBlock] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyBlock] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyBlockArgument] = {rubyUsArg}
                                                                       tmp[rubyBlockParameters] = {
                                                                                                    rubyBlockParameter,
                                                                                                    rubyDestructuredParameter,
                                                                                                    rubyForwardParameter,
                                                                                                    rubyHashSplatNil,
                                                                                                    rubyHashSplatParameter,
                                                                                                    rubyIdentifier,
                                                                                                    rubyKeywordParameter,
                                                                                                    rubyOptionalParameter,
                                                                                                    rubySplatParameter
                                                                                                  }
                                                                       tmp[rubyBreak] = {rubyArgumentList}
                                                                       tmp[rubyCase] = {rubyElse, rubyWhen}
                                                                       tmp[rubyChainedString] = {rubyString}
                                                                       tmp[rubyClass] = {rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyDelimitedSymbol] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyDestructuredLeftAssignment] = {rubyUsLhs, rubyDestructuredLeftAssignment, rubyRestAssignment}
                                                                       tmp[rubyDestructuredParameter] = {
                                                                                                          rubyBlockParameter,
                                                                                                          rubyDestructuredParameter,
                                                                                                          rubyForwardParameter,
                                                                                                          rubyHashSplatNil,
                                                                                                          rubyHashSplatParameter,
                                                                                                          rubyIdentifier,
                                                                                                          rubyKeywordParameter,
                                                                                                          rubyOptionalParameter,
                                                                                                          rubySplatParameter
                                                                                                        }
                                                                       tmp[rubyDo] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyDoBlock] = {rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyElementReference] = {rubyUsExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyElse] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyEndBlock] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyEnsure] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyExceptionVariable] = {rubyUsLhs}
                                                                       tmp[rubyExceptions] = {rubyUsArg, rubySplatArgument}
                                                                       tmp[rubyFindPattern] = {rubyUsPatternExpr, rubySplatParameter}
                                                                       tmp[rubyHash] = {rubyHashSplatArgument, rubyPair}
                                                                       tmp[rubyHashPattern] = {rubyHashSplatNil, rubyHashSplatParameter, rubyKeywordPattern}
                                                                       tmp[rubyHashSplatArgument] = {rubyUsArg}
                                                                       tmp[rubyHeredocBody] = {rubyEscapeSequence, rubyHeredocContent, rubyHeredocEnd, rubyInterpolation}
                                                                       tmp[rubyIn] = {rubyUsArg}
                                                                       tmp[rubyInterpolation] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyLambdaParameters] = {
                                                                                                     rubyBlockParameter,
                                                                                                     rubyDestructuredParameter,
                                                                                                     rubyForwardParameter,
                                                                                                     rubyHashSplatNil,
                                                                                                     rubyHashSplatParameter,
                                                                                                     rubyIdentifier,
                                                                                                     rubyKeywordParameter,
                                                                                                     rubyOptionalParameter,
                                                                                                     rubySplatParameter
                                                                                                   }
                                                                       tmp[rubyLeftAssignmentList] = {rubyUsLhs, rubyDestructuredLeftAssignment, rubyRestAssignment}
                                                                       tmp[rubyMethod] = {rubyUsArg, rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyMethodParameters] = {
                                                                                                     rubyBlockParameter,
                                                                                                     rubyDestructuredParameter,
                                                                                                     rubyForwardParameter,
                                                                                                     rubyHashSplatNil,
                                                                                                     rubyHashSplatParameter,
                                                                                                     rubyIdentifier,
                                                                                                     rubyKeywordParameter,
                                                                                                     rubyOptionalParameter,
                                                                                                     rubySplatParameter
                                                                                                   }
                                                                       tmp[rubyModule] = {rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyNext] = {rubyArgumentList}
                                                                       tmp[rubyParenthesizedStatements] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyPattern] = {rubyUsArg, rubySplatArgument}
                                                                       tmp[rubyProgram] = {rubyUsStatement, rubyEmptyStatement, rubyUninterpreted}
                                                                       tmp[rubyRational] = {rubyFloat, rubyInteger}
                                                                       tmp[rubyRedo] = {rubyArgumentList}
                                                                       tmp[rubyRegex] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyRestAssignment] = {rubyUsLhs}
                                                                       tmp[rubyRetry] = {rubyArgumentList}
                                                                       tmp[rubyReturn] = {rubyArgumentList}
                                                                       tmp[rubyRightAssignmentList] = {rubyUsArg, rubySplatArgument}
                                                                       tmp[rubySingletonClass] = {rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubySingletonMethod] = {rubyUsArg, rubyUsStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubySplatArgument] = {rubyUsArg}
                                                                       tmp[rubyString] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyStringArray] = {rubyBareString}
                                                                       tmp[rubySubshell] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubySuperclass] = {rubyUsExpression}
                                                                       tmp[rubySymbolArray] = {rubyBareSymbol}
                                                                       tmp[rubyThen] = {rubyUsStatement, rubyEmptyStatement}
                                                                       tmp[rubyUndef] = {rubyUsMethodName}
                                                                       tmp[rubyYield] = {rubyArgumentList}
                                                                       tmp
const rubyTokenKinds*: set[RubyNodeKind] = {
                                             rubyExclamationTok,
                                             rubyExclamationEqualTok,
                                             rubyExclamationTildeTok,
                                             rubyQuoteTok,
                                             rubyHashLCurlyTok,
                                             rubyPercentTok,
                                             rubyPercentEqualTok,
                                             rubyPercentiLParTok,
                                             rubyPercentwLParTok,
                                             rubyAmpersandTok,
                                             rubyDoubleAmpersandTok,
                                             rubyDoubleAmpersandEqualTok,
                                             rubyAmpersandDotTok,
                                             rubyAmpersandEqualTok,
                                             rubyLParTok,
                                             rubyRParTok,
                                             rubyAsteriskTok,
                                             rubyDoubleAsteriskTok,
                                             rubyDoubleAsteriskEqualTok,
                                             rubyAsteriskEqualTok,
                                             rubyPlusTok,
                                             rubyPlusEqualTok,
                                             rubyPlusAtTok,
                                             rubyCommaTok,
                                             rubyMinusTok,
                                             rubyMinusEqualTok,
                                             rubyMinusGreaterThanTok,
                                             rubyMinusAtTok,
                                             rubyDotTok,
                                             rubyDoubleDotTok,
                                             rubyTripleDotTok,
                                             rubySlashTok,
                                             rubySlashEqualTok,
                                             rubyColonTok,
                                             rubyColonQuoteTok,
                                             rubyDoubleColonTok,
                                             rubySemicolonTok,
                                             rubyLessThanTok,
                                             rubyDoubleLessThanTok,
                                             rubyDoubleLessThanEqualTok,
                                             rubyLessThanEqualTok,
                                             rubyLessThanEqualGreaterThanTok,
                                             rubyEqualTok,
                                             rubyDoubleEqualTok,
                                             rubyTripleEqualTok,
                                             rubyEqualGreaterThanTok,
                                             rubyEqualTildeTok,
                                             rubyGreaterThanTok,
                                             rubyGreaterThanEqualTok,
                                             rubyDoubleGreaterThanTok,
                                             rubyDoubleGreaterThanEqualTok,
                                             rubyQuestionTok,
                                             rubyBEGINTok,
                                             rubyENDTok,
                                             rubyLBrackTok,
                                             rubyLBrackRBrackTok,
                                             rubyLBrackRBrackEqualTok,
                                             rubyRBrackTok,
                                             rubyAccentTok,
                                             rubyAccentEqualTok,
                                             rubyUsUsENDTok,
                                             rubyBacktickTok,
                                             rubyAliasTok,
                                             rubyAndTok,
                                             rubyBeginTok1,
                                             rubyBreakTok,
                                             rubyCaseTok,
                                             rubyClassTok,
                                             rubyDefTok,
                                             rubyDefinedQuestionTok,
                                             rubyDoTok,
                                             rubyElseTok,
                                             rubyElsifTok,
                                             rubyEndTok1,
                                             rubyEnsureTok,
                                             rubyForTok,
                                             rubyIfTok,
                                             rubyInTok,
                                             rubyModuleTok,
                                             rubyNextTok,
                                             rubyNilTok,
                                             rubyNotTok,
                                             rubyOrTok,
                                             rubyRTok,
                                             rubyRedoTok,
                                             rubyRescueTok,
                                             rubyRetryTok,
                                             rubyReturnTok,
                                             rubyThenTok,
                                             rubyUndefTok,
                                             rubyUnlessTok,
                                             rubyUntilTok,
                                             rubyWhenTok,
                                             rubyWhileTok,
                                             rubyYieldTok,
                                             rubyLCurlyTok,
                                             rubyPipeTok,
                                             rubyPipeEqualTok,
                                             rubyDoublePipeTok,
                                             rubyDoublePipeEqualTok,
                                             rubyRCurlyTok,
                                             rubyTildeTok
                                           }

proc tsNodeType*(node: TsRubyNode): string



proc kind*(node: TsRubyNode): RubyNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_arg":                         rubyUsArg
      of "_expression":                  rubyUsExpression
      of "_lhs":                         rubyUsLhs
      of "_method_name":                 rubyUsMethodName
      of "_pattern_constant":            rubyUsPatternConstant
      of "_pattern_expr":                rubyUsPatternExpr
      of "_pattern_expr_basic":          rubyUsPatternExprBasic
      of "_pattern_primitive":           rubyUsPatternPrimitive
      of "_pattern_top_expr_body":       rubyUsPatternTopExprBody
      of "_primary":                     rubyUsPrimary
      of "_simple_numeric":              rubyUsSimpleNumeric
      of "_statement":                   rubyUsStatement
      of "_variable":                    rubyUsVariable
      of "alias":                        rubyAlias
      of "alternative_pattern":          rubyAlternativePattern
      of "argument_list":                rubyArgumentList
      of "array":                        rubyArray
      of "array_pattern":                rubyArrayPattern
      of "as_pattern":                   rubyAsPattern
      of "assignment":                   rubyAssignment
      of "bare_string":                  rubyBareString
      of "bare_symbol":                  rubyBareSymbol
      of "begin":                        rubyBegin
      of "begin_block":                  rubyBeginBlock
      of "binary":                       rubyBinary
      of "block":                        rubyBlock
      of "block_argument":               rubyBlockArgument
      of "block_parameter":              rubyBlockParameter
      of "block_parameters":             rubyBlockParameters
      of "break":                        rubyBreak
      of "call":                         rubyCall
      of "case":                         rubyCase
      of "case_match":                   rubyCaseMatch
      of "chained_string":               rubyChainedString
      of "class":                        rubyClass
      of "conditional":                  rubyConditional
      of "delimited_symbol":             rubyDelimitedSymbol
      of "destructured_left_assignment": rubyDestructuredLeftAssignment
      of "destructured_parameter":       rubyDestructuredParameter
      of "do":                           rubyDo
      of "do_block":                     rubyDoBlock
      of "element_reference":            rubyElementReference
      of "else":                         rubyElse
      of "elsif":                        rubyElsif
      of "empty_statement":              rubyEmptyStatement
      of "end_block":                    rubyEndBlock
      of "ensure":                       rubyEnsure
      of "exception_variable":           rubyExceptionVariable
      of "exceptions":                   rubyExceptions
      of "find_pattern":                 rubyFindPattern
      of "for":                          rubyFor
      of "forward_argument":             rubyForwardArgument
      of "forward_parameter":            rubyForwardParameter
      of "hash":                         rubyHash
      of "hash_pattern":                 rubyHashPattern
      of "hash_splat_argument":          rubyHashSplatArgument
      of "hash_splat_nil":               rubyHashSplatNil
      of "hash_splat_parameter":         rubyHashSplatParameter
      of "heredoc_body":                 rubyHeredocBody
      of "if":                           rubyIf
      of "if_guard":                     rubyIfGuard
      of "if_modifier":                  rubyIfModifier
      of "in":                           rubyIn
      of "in_clause":                    rubyInClause
      of "interpolation":                rubyInterpolation
      of "keyword_parameter":            rubyKeywordParameter
      of "keyword_pattern":              rubyKeywordPattern
      of "lambda":                       rubyLambda
      of "lambda_parameters":            rubyLambdaParameters
      of "left_assignment_list":         rubyLeftAssignmentList
      of "method":                       rubyMethod
      of "method_parameters":            rubyMethodParameters
      of "module":                       rubyModule
      of "next":                         rubyNext
      of "operator":                     rubyOperator
      of "operator_assignment":          rubyOperatorAssignment
      of "optional_parameter":           rubyOptionalParameter
      of "pair":                         rubyPair
      of "parenthesized_statements":     rubyParenthesizedStatements
      of "pattern":                      rubyPattern
      of "program":                      rubyProgram
      of "range":                        rubyRange
      of "rational":                     rubyRational
      of "redo":                         rubyRedo
      of "regex":                        rubyRegex
      of "rescue":                       rubyRescue
      of "rescue_modifier":              rubyRescueModifier
      of "rest_assignment":              rubyRestAssignment
      of "retry":                        rubyRetry
      of "return":                       rubyReturn
      of "right_assignment_list":        rubyRightAssignmentList
      of "scope_resolution":             rubyScopeResolution
      of "setter":                       rubySetter
      of "singleton_class":              rubySingletonClass
      of "singleton_method":             rubySingletonMethod
      of "splat_argument":               rubySplatArgument
      of "splat_parameter":              rubySplatParameter
      of "string":                       rubyString
      of "string_array":                 rubyStringArray
      of "subshell":                     rubySubshell
      of "superclass":                   rubySuperclass
      of "symbol_array":                 rubySymbolArray
      of "then":                         rubyThen
      of "unary":                        rubyUnary
      of "undef":                        rubyUndef
      of "unless":                       rubyUnless
      of "unless_guard":                 rubyUnlessGuard
      of "unless_modifier":              rubyUnlessModifier
      of "until":                        rubyUntil
      of "until_modifier":               rubyUntilModifier
      of "variable_reference_pattern":   rubyVariableReferencePattern
      of "when":                         rubyWhen
      of "while":                        rubyWhile
      of "while_modifier":               rubyWhileModifier
      of "yield":                        rubyYield
      of "!":                            rubyExclamationTok
      of "!=":                           rubyExclamationEqualTok
      of "!~":                           rubyExclamationTildeTok
      of "\"":                           rubyQuoteTok
      of "#{":                           rubyHashLCurlyTok
      of "%":                            rubyPercentTok
      of "%=":                           rubyPercentEqualTok
      of "%i(":                          rubyPercentiLParTok
      of "%w(":                          rubyPercentwLParTok
      of "&":                            rubyAmpersandTok
      of "&&":                           rubyDoubleAmpersandTok
      of "&&=":                          rubyDoubleAmpersandEqualTok
      of "&.":                           rubyAmpersandDotTok
      of "&=":                           rubyAmpersandEqualTok
      of "(":                            rubyLParTok
      of ")":                            rubyRParTok
      of "*":                            rubyAsteriskTok
      of "**":                           rubyDoubleAsteriskTok
      of "**=":                          rubyDoubleAsteriskEqualTok
      of "*=":                           rubyAsteriskEqualTok
      of "+":                            rubyPlusTok
      of "+=":                           rubyPlusEqualTok
      of "+@":                           rubyPlusAtTok
      of ",":                            rubyCommaTok
      of "-":                            rubyMinusTok
      of "-=":                           rubyMinusEqualTok
      of "->":                           rubyMinusGreaterThanTok
      of "-@":                           rubyMinusAtTok
      of ".":                            rubyDotTok
      of "..":                           rubyDoubleDotTok
      of "...":                          rubyTripleDotTok
      of "/":                            rubySlashTok
      of "/=":                           rubySlashEqualTok
      of ":":                            rubyColonTok
      of ":\"":                          rubyColonQuoteTok
      of "::":                           rubyDoubleColonTok
      of ";":                            rubySemicolonTok
      of "<":                            rubyLessThanTok
      of "<<":                           rubyDoubleLessThanTok
      of "<<=":                          rubyDoubleLessThanEqualTok
      of "<=":                           rubyLessThanEqualTok
      of "<=>":                          rubyLessThanEqualGreaterThanTok
      of "=":                            rubyEqualTok
      of "==":                           rubyDoubleEqualTok
      of "===":                          rubyTripleEqualTok
      of "=>":                           rubyEqualGreaterThanTok
      of "=~":                           rubyEqualTildeTok
      of ">":                            rubyGreaterThanTok
      of ">=":                           rubyGreaterThanEqualTok
      of ">>":                           rubyDoubleGreaterThanTok
      of ">>=":                          rubyDoubleGreaterThanEqualTok
      of "?":                            rubyQuestionTok
      of "BEGIN":                        rubyBEGINTok
      of "END":                          rubyENDTok
      of "[":                            rubyLBrackTok
      of "[]":                           rubyLBrackRBrackTok
      of "[]=":                          rubyLBrackRBrackEqualTok
      of "]":                            rubyRBrackTok
      of "^":                            rubyAccentTok
      of "^=":                           rubyAccentEqualTok
      of "__END__":                      rubyUsUsENDTok
      of "`":                            rubyBacktickTok
      of "and":                          rubyAndTok
      of "character":                    rubyCharacter
      of "class_variable":               rubyClassVariable
      of "comment":                      rubyComment
      of "complex":                      rubyComplex
      of "constant":                     rubyConstant
      of "def":                          rubyDefTok
      of "defined?":                     rubyDefinedQuestionTok
      of "encoding":                     rubyEncoding
      of "end":                          rubyEndTok1
      of "escape_sequence":              rubyEscapeSequence
      of "false":                        rubyFalse
      of "file":                         rubyFile
      of "float":                        rubyFloat
      of "global_variable":              rubyGlobalVariable
      of "hash_key_symbol":              rubyHashKeySymbol
      of "heredoc_beginning":            rubyHeredocBeginning
      of "heredoc_content":              rubyHeredocContent
      of "heredoc_end":                  rubyHeredocEnd
      of "identifier":                   rubyIdentifier
      of "instance_variable":            rubyInstanceVariable
      of "integer":                      rubyInteger
      of "line":                         rubyLine
      of "nil":                          rubyNilTok
      of "not":                          rubyNotTok
      of "or":                           rubyOrTok
      of "r":                            rubyRTok
      of "self":                         rubySelf
      of "simple_symbol":                rubySimpleSymbol
      of "string_content":               rubyStringContent
      of "super":                        rubySuper
      of "true":                         rubyTrue
      of "uninterpreted":                rubyUninterpreted
      of "{":                            rubyLCurlyTok
      of "|":                            rubyPipeTok
      of "|=":                           rubyPipeEqualTok
      of "||":                           rubyDoublePipeTok
      of "||=":                          rubyDoublePipeEqualTok
      of "}":                            rubyRCurlyTok
      of "~":                            rubyTildeTok
      of "ERROR":                        rubySyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsRubyNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsRubyNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsRubyNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_ruby(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsRubyNode): string =
  $ts_node_type(TSNode(node))

proc newTsRubyParser*(): RubyParser =
  result = RubyParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_ruby())

proc parseString*(parser: RubyParser, str: string): TsRubyNode =
  TsRubyNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsRubyString*(str: string): TsRubyNode =
  let parser = newTsRubyParser()
  return parseString(parser, str)

func `$`*(node: TsRubyNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsRubyNode,
    idx:  int,
    kind: RubyNodeKind | set[RubyNodeKind]
  ): TsRubyNode =
  assert 0 <= idx and idx < node.len
  result = TsRubyNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  RubyNode* = HtsNode[TsRubyNode, RubyNodeKind]


proc treeReprTsRuby*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsRubyNode, RubyNodeKind](parseTsRubyString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsRubyNode,
    str:  ptr string
  ): HtsNode[TsRubyNode, RubyNodeKind] =
  toHtsNode[TsRubyNode, RubyNodeKind](node, str)

proc toHtsTree*(node: TsRubyNode, str: ptr string): RubyNode =
  toHtsNode[TsRubyNode, RubyNodeKind](node, str)

proc parseRubyString*(str: ptr string, unnamed: bool = false): RubyNode =
  let parser = newTsRubyParser()
  return toHtsTree[TsRubyNode, RubyNodeKind](parseString(parser, str[]), str)

proc parseRubyString*(str: string, unnamed: bool = false): RubyNode =
  let parser = newTsRubyParser()
  return toHtsTree[TsRubyNode, RubyNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


