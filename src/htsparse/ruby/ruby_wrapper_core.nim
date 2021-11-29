import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  RubyNodeKind* = enum
    rubyHidArg                               ## _arg
    rubyHidExpression                        ## _expression
    rubyHidLhs                               ## _lhs
    rubyHidMethodName                        ## _method_name
    rubyHidPatternConstant                   ## _pattern_constant
    rubyHidPatternExpr                       ## _pattern_expr
    rubyHidPatternExprBasic                  ## _pattern_expr_basic
    rubyHidPatternPrimitive                  ## _pattern_primitive
    rubyHidPatternTopExprBody                ## _pattern_top_expr_body
    rubyHidPrimary                           ## _primary
    rubyHidSimpleNumeric                     ## _simple_numeric
    rubyHidStatement                         ## _statement
    rubyHidVariable                          ## _variable
    rubyAlias                                ## alias
    rubyAlternativePattern                   ## alternative_pattern
    rubyArgumentList                         ## argument_list
    rubyArray                                ## array
    rubyArrayPattern                         ## array_pattern
    rubyAsPattern                            ## as_pattern
    rubyAssignment                           ## assignment
    rubyBareString                           ## bare_string
    rubyBareSymbol                           ## bare_symbol
    rubyBegin                                ## begin
    rubyBeginBlock                           ## begin_block
    rubyBinary                               ## binary
    rubyBlock                                ## block
    rubyBlockArgument                        ## block_argument
    rubyBlockParameter                       ## block_parameter
    rubyBlockParameters                      ## block_parameters
    rubyBreak                                ## break
    rubyCall                                 ## call
    rubyCase                                 ## case
    rubyCaseMatch                            ## case_match
    rubyChainedString                        ## chained_string
    rubyClass                                ## class
    rubyConditional                          ## conditional
    rubyDelimitedSymbol                      ## delimited_symbol
    rubyDestructuredLeftAssignment           ## destructured_left_assignment
    rubyDestructuredParameter                ## destructured_parameter
    rubyDo                                   ## do
    rubyDoBlock                              ## do_block
    rubyElementReference                     ## element_reference
    rubyElse                                 ## else
    rubyElsif                                ## elsif
    rubyEmptyStatement                       ## empty_statement
    rubyEndBlock                             ## end_block
    rubyEnsure                               ## ensure
    rubyExceptionVariable                    ## exception_variable
    rubyExceptions                           ## exceptions
    rubyFindPattern                          ## find_pattern
    rubyFor                                  ## for
    rubyForwardArgument                      ## forward_argument
    rubyForwardParameter                     ## forward_parameter
    rubyHash                                 ## hash
    rubyHashPattern                          ## hash_pattern
    rubyHashSplatArgument                    ## hash_splat_argument
    rubyHashSplatNil                         ## hash_splat_nil
    rubyHashSplatParameter                   ## hash_splat_parameter
    rubyHeredocBody                          ## heredoc_body
    rubyIf                                   ## if
    rubyIfGuard                              ## if_guard
    rubyIfModifier                           ## if_modifier
    rubyIn                                   ## in
    rubyInClause                             ## in_clause
    rubyInterpolation                        ## interpolation
    rubyKeywordParameter                     ## keyword_parameter
    rubyKeywordPattern                       ## keyword_pattern
    rubyLambda                               ## lambda
    rubyLambdaParameters                     ## lambda_parameters
    rubyLeftAssignmentList                   ## left_assignment_list
    rubyMethod                               ## method
    rubyMethodParameters                     ## method_parameters
    rubyModule                               ## module
    rubyNext                                 ## next
    rubyOperator                             ## operator
    rubyOperatorAssignment                   ## operator_assignment
    rubyOptionalParameter                    ## optional_parameter
    rubyPair                                 ## pair
    rubyParenthesizedStatements              ## parenthesized_statements
    rubyPattern                              ## pattern
    rubyProgram                              ## program
    rubyRange                                ## range
    rubyRational                             ## rational
    rubyRedo                                 ## redo
    rubyRegex                                ## regex
    rubyRescue                               ## rescue
    rubyRescueModifier                       ## rescue_modifier
    rubyRestAssignment                       ## rest_assignment
    rubyRetry                                ## retry
    rubyReturn                               ## return
    rubyRightAssignmentList                  ## right_assignment_list
    rubyScopeResolution                      ## scope_resolution
    rubySetter                               ## setter
    rubySingletonClass                       ## singleton_class
    rubySingletonMethod                      ## singleton_method
    rubySplatArgument                        ## splat_argument
    rubySplatParameter                       ## splat_parameter
    rubyString                               ## string
    rubyStringArray                          ## string_array
    rubySubshell                             ## subshell
    rubySuperclass                           ## superclass
    rubySymbolArray                          ## symbol_array
    rubyThen                                 ## then
    rubyUnary                                ## unary
    rubyUndef                                ## undef
    rubyUnless                               ## unless
    rubyUnlessGuard                          ## unless_guard
    rubyUnlessModifier                       ## unless_modifier
    rubyUntil                                ## until
    rubyUntilModifier                        ## until_modifier
    rubyVariableReferencePattern             ## variable_reference_pattern
    rubyWhen                                 ## when
    rubyWhile                                ## while
    rubyWhileModifier                        ## while_modifier
    rubyYield                                ## yield
    rubyExclamationTok                       ## !
    rubyExclamationEqualTok                  ## !=
    rubyExclamationTildeTok                  ## !~
    rubyQuoteTok                             ## "
    rubyHashLCurlyTok                        ## #{
    rubyPercentTok                           ## %
    rubyPercentEqualTok                      ## %=
    rubyPercentiLParTok                      ## %i(
    rubyPercentwLParTok                      ## %w(
    rubyAmpersandTok                         ## &
    rubyDoubleAmpersandTok                   ## &&
    rubyDoubleAmpersandEqualTok              ## &&=
    rubyAmpersandDotTok                      ## &.
    rubyAmpersandEqualTok                    ## &=
    rubyLParTok                              ## (
    rubyRParTok                              ## )
    rubyAsteriskTok                          ## *
    rubyDoubleAsteriskTok                    ## **
    rubyDoubleAsteriskEqualTok               ## **=
    rubyAsteriskEqualTok                     ## *=
    rubyPlusTok                              ## +
    rubyPlusEqualTok                         ## +=
    rubyPlusAtTok                            ## +@
    rubyCommaTok                             ## ,
    rubyMinusTok                             ## -
    rubyMinusEqualTok                        ## -=
    rubyMinusGreaterThanTok                  ## ->
    rubyMinusAtTok                           ## -@
    rubyDotTok                               ## .
    rubyDoubleDotTok                         ## ..
    rubyTripleDotTok                         ## ...
    rubySlashTok                             ## /
    rubySlashEqualTok                        ## /=
    rubyColonTok                             ## :
    rubyColonQuoteTok                        ## :"
    rubyDoubleColonTok                       ## ::
    rubySemicolonTok                         ## ;
    rubyLessThanTok                          ## <
    rubyDoubleLessThanTok                    ## <<
    rubyDoubleLessThanEqualTok               ## <<=
    rubyLessThanEqualTok                     ## <=
    rubyLessThanEqualGreaterThanTok          ## <=>
    rubyEqualTok                             ## =
    rubyDoubleEqualTok                       ## ==
    rubyTripleEqualTok                       ## ===
    rubyEqualGreaterThanTok                  ## =>
    rubyEqualTildeTok                        ## =~
    rubyGreaterThanTok                       ## >
    rubyGreaterThanEqualTok                  ## >=
    rubyDoubleGreaterThanTok                 ## >>
    rubyDoubleGreaterThanEqualTok            ## >>=
    rubyQuestionTok                          ## ?
    rubyBEGINTok                             ## BEGIN
    rubyENDTok                               ## END
    rubyLBrackTok                            ## [
    rubyLBrackRBrackTok                      ## []
    rubyLBrackRBrackEqualTok                 ## []=
    rubyRBrackTok                            ## ]
    rubyAccentTok                            ## ^
    rubyAccentEqualTok                       ## ^=
    rubyHidENDTok                            ## __END__
    rubyBacktickTok                          ## `
    rubyAliasTok                             ## alias
    rubyAndTok                               ## and
    rubyBeginTok1                            ## begin
    rubyBreakTok                             ## break
    rubyCaseTok                              ## case
    rubyCharacter                            ## character
    rubyClassTok                             ## class
    rubyClassVariable                        ## class_variable
    rubyComment                              ## comment
    rubyComplex                              ## complex
    rubyConstant                             ## constant
    rubyDefTok                               ## def
    rubyDefinedQuestionTok                   ## defined?
    rubyDoTok                                ## do
    rubyElseTok                              ## else
    rubyElsifTok                             ## elsif
    rubyEncoding                             ## encoding
    rubyEndTok1                              ## end
    rubyEnsureTok                            ## ensure
    rubyEscapeSequence                       ## escape_sequence
    rubyFalse                                ## false
    rubyFile                                 ## file
    rubyFloat                                ## float
    rubyForTok                               ## for
    rubyGlobalVariable                       ## global_variable
    rubyHashKeySymbol                        ## hash_key_symbol
    rubyHeredocBeginning                     ## heredoc_beginning
    rubyHeredocContent                       ## heredoc_content
    rubyHeredocEnd                           ## heredoc_end
    rubyIdentifier                           ## identifier
    rubyIfTok                                ## if
    rubyInTok                                ## in
    rubyInstanceVariable                     ## instance_variable
    rubyInteger                              ## integer
    rubyLine                                 ## line
    rubyModuleTok                            ## module
    rubyNextTok                              ## next
    rubyNil                                  ## nil
    rubyNilTok                               ## nil
    rubyNotTok                               ## not
    rubyOrTok                                ## or
    rubyRTok                                 ## r
    rubyRedoTok                              ## redo
    rubyRescueTok                            ## rescue
    rubyRetryTok                             ## retry
    rubyReturnTok                            ## return
    rubySelf                                 ## self
    rubySimpleSymbol                         ## simple_symbol
    rubyStringContent                        ## string_content
    rubySuper                                ## super
    rubyThenTok                              ## then
    rubyTrue                                 ## true
    rubyUndefTok                             ## undef
    rubyUninterpreted                        ## uninterpreted
    rubyUnlessTok                            ## unless
    rubyUntilTok                             ## until
    rubyWhenTok                              ## when
    rubyWhileTok                             ## while
    rubyYieldTok                             ## yield
    rubyLCurlyTok                            ## {
    rubyPipeTok                              ## |
    rubyPipeEqualTok                         ## |=
    rubyDoublePipeTok                        ## ||
    rubyDoublePipeEqualTok                   ## ||=
    rubyRCurlyTok                            ## }
    rubyTildeTok                             ## ~
    rubyHidArgumentListWithTrailingComma     ## _argument_list_with_trailing_comma
    rubyHidArrayPatternBody                  ## _array_pattern_body
    rubyHidFormalParameter                   ## _formal_parameter
    rubyHidSingletonClassLeftAngleLeftLangle ## _singleton_class_left_angle_left_langle
    rubyHidRegexStart                        ## _regex_start
    rubyHidStringArrayStart                  ## _string_array_start
    rubyHidSymbolArrayStart                  ## _symbol_array_start
    rubyHidLiteral                           ## _literal
    rubyHidElementReferenceBracket           ## _element_reference_bracket
    rubyCommandAssignment                    ## command_assignment
    rubyHidPatternConstantResolution         ## _pattern_constant_resolution
    rubyCommandUnary                         ## command_unary
    rubyHidPatternLiteral                    ## _pattern_literal
    rubyCommandOperatorAssignment            ## command_operator_assignment
    rubyHidChainedCommandCall                ## _chained_command_call
    rubyCommandCall                          ## command_call
    rubyHidBinaryMinus                       ## _binary_minus
    rubyHidNumeric                           ## _numeric
    rubyHidStringStart                       ## _string_start
    rubyHidMlhs                              ## _mlhs
    rubyHidBlockAmpersand                    ## _block_ampersand
    rubyCommandCallWithBlock                 ## command_call_with_block
    rubyHidLineBreak                         ## _line_break
    rubyUnaryLiteral                         ## unary_literal
    rubyCommandBinary                        ## command_binary
    rubyHidHeredocBodyStart                  ## _heredoc_body_start
    rubyHidLiteralContents                   ## _literal_contents
    rubyHidBinaryStarStar                    ## _binary_star_star
    rubyBareParameters                       ## bare_parameters
    rubyHidGuard                             ## _guard
    rubyHidArrayPatternN                     ## _array_pattern_n
    rubyHidBinaryStar                        ## _binary_star
    rubyHidFindPatternBody                   ## _find_pattern_body
    rubyHidSplatStar                         ## _splat_star
    rubyHidPatternRange                      ## _pattern_range
    rubyHidStringEnd                         ## _string_end
    rubyHidStatements                        ## _statements
    rubyHidArgument                          ## _argument
    rubyParameters                           ## parameters
    rubyHidHashPatternAnyRest                ## _hash_pattern_any_rest
    rubyHidTerminator                        ## _terminator
    rubyYieldCommand                         ## yield_command
    rubyBreakCommand                         ## break_command
    rubyCommandArgumentList                  ## command_argument_list
    rubyHidSymbolStart                       ## _symbol_start
    rubyHidHashSplatStarStar                 ## _hash_splat_star_star
    rubyHidSimpleFormalParameter             ## _simple_formal_parameter
    rubyHidCall                              ## _call
    rubyHidPatternLambda                     ## _pattern_lambda
    rubyParenthesizedUnary                   ## parenthesized_unary
    rubyReturnCommand                        ## return_command
    rubyNextCommand                          ## next_command
    rubyRescueModifierArg                    ## rescue_modifier_arg
    rubyHidPatternExprAlt                    ## _pattern_expr_alt
    rubyHidUnaryMinus                        ## _unary_minus
    rubyHidSubshellStart                     ## _subshell_start
    rubyHidBodyExpr                          ## _body_expr
    rubyHidKeywordVariable                   ## _keyword_variable
    rubyHidPatternValue                      ## _pattern_value
    rubyHidMethodRest                        ## _method_rest
    rubyHidBodyStatement                     ## _body_statement
    rubyHidHashPatternBody                   ## _hash_pattern_body
    rubySyntaxError                          ## Tree-sitter parser syntax error

proc strRepr*(kind: RubyNodeKind): string =
  case kind:
    of rubyHidArg:                               "_arg"
    of rubyHidExpression:                        "_expression"
    of rubyHidLhs:                               "_lhs"
    of rubyHidMethodName:                        "_method_name"
    of rubyHidPatternConstant:                   "_pattern_constant"
    of rubyHidPatternExpr:                       "_pattern_expr"
    of rubyHidPatternExprBasic:                  "_pattern_expr_basic"
    of rubyHidPatternPrimitive:                  "_pattern_primitive"
    of rubyHidPatternTopExprBody:                "_pattern_top_expr_body"
    of rubyHidPrimary:                           "_primary"
    of rubyHidSimpleNumeric:                     "_simple_numeric"
    of rubyHidStatement:                         "_statement"
    of rubyHidVariable:                          "_variable"
    of rubyAlias:                                "alias"
    of rubyAlternativePattern:                   "alternative_pattern"
    of rubyArgumentList:                         "argument_list"
    of rubyArray:                                "array"
    of rubyArrayPattern:                         "array_pattern"
    of rubyAsPattern:                            "as_pattern"
    of rubyAssignment:                           "assignment"
    of rubyBareString:                           "bare_string"
    of rubyBareSymbol:                           "bare_symbol"
    of rubyBegin:                                "begin"
    of rubyBeginBlock:                           "begin_block"
    of rubyBinary:                               "binary"
    of rubyBlock:                                "block"
    of rubyBlockArgument:                        "block_argument"
    of rubyBlockParameter:                       "block_parameter"
    of rubyBlockParameters:                      "block_parameters"
    of rubyBreak:                                "break"
    of rubyCall:                                 "call"
    of rubyCase:                                 "case"
    of rubyCaseMatch:                            "case_match"
    of rubyChainedString:                        "chained_string"
    of rubyClass:                                "class"
    of rubyConditional:                          "conditional"
    of rubyDelimitedSymbol:                      "delimited_symbol"
    of rubyDestructuredLeftAssignment:           "destructured_left_assignment"
    of rubyDestructuredParameter:                "destructured_parameter"
    of rubyDo:                                   "do"
    of rubyDoBlock:                              "do_block"
    of rubyElementReference:                     "element_reference"
    of rubyElse:                                 "else"
    of rubyElsif:                                "elsif"
    of rubyEmptyStatement:                       "empty_statement"
    of rubyEndBlock:                             "end_block"
    of rubyEnsure:                               "ensure"
    of rubyExceptionVariable:                    "exception_variable"
    of rubyExceptions:                           "exceptions"
    of rubyFindPattern:                          "find_pattern"
    of rubyFor:                                  "for"
    of rubyForwardArgument:                      "forward_argument"
    of rubyForwardParameter:                     "forward_parameter"
    of rubyHash:                                 "hash"
    of rubyHashPattern:                          "hash_pattern"
    of rubyHashSplatArgument:                    "hash_splat_argument"
    of rubyHashSplatNil:                         "hash_splat_nil"
    of rubyHashSplatParameter:                   "hash_splat_parameter"
    of rubyHeredocBody:                          "heredoc_body"
    of rubyIf:                                   "if"
    of rubyIfGuard:                              "if_guard"
    of rubyIfModifier:                           "if_modifier"
    of rubyIn:                                   "in"
    of rubyInClause:                             "in_clause"
    of rubyInterpolation:                        "interpolation"
    of rubyKeywordParameter:                     "keyword_parameter"
    of rubyKeywordPattern:                       "keyword_pattern"
    of rubyLambda:                               "lambda"
    of rubyLambdaParameters:                     "lambda_parameters"
    of rubyLeftAssignmentList:                   "left_assignment_list"
    of rubyMethod:                               "method"
    of rubyMethodParameters:                     "method_parameters"
    of rubyModule:                               "module"
    of rubyNext:                                 "next"
    of rubyOperator:                             "operator"
    of rubyOperatorAssignment:                   "operator_assignment"
    of rubyOptionalParameter:                    "optional_parameter"
    of rubyPair:                                 "pair"
    of rubyParenthesizedStatements:              "parenthesized_statements"
    of rubyPattern:                              "pattern"
    of rubyProgram:                              "program"
    of rubyRange:                                "range"
    of rubyRational:                             "rational"
    of rubyRedo:                                 "redo"
    of rubyRegex:                                "regex"
    of rubyRescue:                               "rescue"
    of rubyRescueModifier:                       "rescue_modifier"
    of rubyRestAssignment:                       "rest_assignment"
    of rubyRetry:                                "retry"
    of rubyReturn:                               "return"
    of rubyRightAssignmentList:                  "right_assignment_list"
    of rubyScopeResolution:                      "scope_resolution"
    of rubySetter:                               "setter"
    of rubySingletonClass:                       "singleton_class"
    of rubySingletonMethod:                      "singleton_method"
    of rubySplatArgument:                        "splat_argument"
    of rubySplatParameter:                       "splat_parameter"
    of rubyString:                               "string"
    of rubyStringArray:                          "string_array"
    of rubySubshell:                             "subshell"
    of rubySuperclass:                           "superclass"
    of rubySymbolArray:                          "symbol_array"
    of rubyThen:                                 "then"
    of rubyUnary:                                "unary"
    of rubyUndef:                                "undef"
    of rubyUnless:                               "unless"
    of rubyUnlessGuard:                          "unless_guard"
    of rubyUnlessModifier:                       "unless_modifier"
    of rubyUntil:                                "until"
    of rubyUntilModifier:                        "until_modifier"
    of rubyVariableReferencePattern:             "variable_reference_pattern"
    of rubyWhen:                                 "when"
    of rubyWhile:                                "while"
    of rubyWhileModifier:                        "while_modifier"
    of rubyYield:                                "yield"
    of rubyExclamationTok:                       "!"
    of rubyExclamationEqualTok:                  "!="
    of rubyExclamationTildeTok:                  "!~"
    of rubyQuoteTok:                             "\""
    of rubyHashLCurlyTok:                        "#{"
    of rubyPercentTok:                           "%"
    of rubyPercentEqualTok:                      "%="
    of rubyPercentiLParTok:                      "%i("
    of rubyPercentwLParTok:                      "%w("
    of rubyAmpersandTok:                         "&"
    of rubyDoubleAmpersandTok:                   "&&"
    of rubyDoubleAmpersandEqualTok:              "&&="
    of rubyAmpersandDotTok:                      "&."
    of rubyAmpersandEqualTok:                    "&="
    of rubyLParTok:                              "("
    of rubyRParTok:                              ")"
    of rubyAsteriskTok:                          "*"
    of rubyDoubleAsteriskTok:                    "**"
    of rubyDoubleAsteriskEqualTok:               "**="
    of rubyAsteriskEqualTok:                     "*="
    of rubyPlusTok:                              "+"
    of rubyPlusEqualTok:                         "+="
    of rubyPlusAtTok:                            "+@"
    of rubyCommaTok:                             ","
    of rubyMinusTok:                             "-"
    of rubyMinusEqualTok:                        "-="
    of rubyMinusGreaterThanTok:                  "->"
    of rubyMinusAtTok:                           "-@"
    of rubyDotTok:                               "."
    of rubyDoubleDotTok:                         ".."
    of rubyTripleDotTok:                         "..."
    of rubySlashTok:                             "/"
    of rubySlashEqualTok:                        "/="
    of rubyColonTok:                             ":"
    of rubyColonQuoteTok:                        ":\""
    of rubyDoubleColonTok:                       "::"
    of rubySemicolonTok:                         ";"
    of rubyLessThanTok:                          "<"
    of rubyDoubleLessThanTok:                    "<<"
    of rubyDoubleLessThanEqualTok:               "<<="
    of rubyLessThanEqualTok:                     "<="
    of rubyLessThanEqualGreaterThanTok:          "<=>"
    of rubyEqualTok:                             "="
    of rubyDoubleEqualTok:                       "=="
    of rubyTripleEqualTok:                       "==="
    of rubyEqualGreaterThanTok:                  "=>"
    of rubyEqualTildeTok:                        "=~"
    of rubyGreaterThanTok:                       ">"
    of rubyGreaterThanEqualTok:                  ">="
    of rubyDoubleGreaterThanTok:                 ">>"
    of rubyDoubleGreaterThanEqualTok:            ">>="
    of rubyQuestionTok:                          "?"
    of rubyBEGINTok:                             "BEGIN"
    of rubyENDTok:                               "END"
    of rubyLBrackTok:                            "["
    of rubyLBrackRBrackTok:                      "[]"
    of rubyLBrackRBrackEqualTok:                 "[]="
    of rubyRBrackTok:                            "]"
    of rubyAccentTok:                            "^"
    of rubyAccentEqualTok:                       "^="
    of rubyHidENDTok:                            "__END__"
    of rubyBacktickTok:                          "`"
    of rubyAliasTok:                             "alias"
    of rubyAndTok:                               "and"
    of rubyBeginTok1:                            "begin"
    of rubyBreakTok:                             "break"
    of rubyCaseTok:                              "case"
    of rubyCharacter:                            "character"
    of rubyClassTok:                             "class"
    of rubyClassVariable:                        "class_variable"
    of rubyComment:                              "comment"
    of rubyComplex:                              "complex"
    of rubyConstant:                             "constant"
    of rubyDefTok:                               "def"
    of rubyDefinedQuestionTok:                   "defined?"
    of rubyDoTok:                                "do"
    of rubyElseTok:                              "else"
    of rubyElsifTok:                             "elsif"
    of rubyEncoding:                             "encoding"
    of rubyEndTok1:                              "end"
    of rubyEnsureTok:                            "ensure"
    of rubyEscapeSequence:                       "escape_sequence"
    of rubyFalse:                                "false"
    of rubyFile:                                 "file"
    of rubyFloat:                                "float"
    of rubyForTok:                               "for"
    of rubyGlobalVariable:                       "global_variable"
    of rubyHashKeySymbol:                        "hash_key_symbol"
    of rubyHeredocBeginning:                     "heredoc_beginning"
    of rubyHeredocContent:                       "heredoc_content"
    of rubyHeredocEnd:                           "heredoc_end"
    of rubyIdentifier:                           "identifier"
    of rubyIfTok:                                "if"
    of rubyInTok:                                "in"
    of rubyInstanceVariable:                     "instance_variable"
    of rubyInteger:                              "integer"
    of rubyLine:                                 "line"
    of rubyModuleTok:                            "module"
    of rubyNextTok:                              "next"
    of rubyNil:                                  "nil"
    of rubyNilTok:                               "nil"
    of rubyNotTok:                               "not"
    of rubyOrTok:                                "or"
    of rubyRTok:                                 "r"
    of rubyRedoTok:                              "redo"
    of rubyRescueTok:                            "rescue"
    of rubyRetryTok:                             "retry"
    of rubyReturnTok:                            "return"
    of rubySelf:                                 "self"
    of rubySimpleSymbol:                         "simple_symbol"
    of rubyStringContent:                        "string_content"
    of rubySuper:                                "super"
    of rubyThenTok:                              "then"
    of rubyTrue:                                 "true"
    of rubyUndefTok:                             "undef"
    of rubyUninterpreted:                        "uninterpreted"
    of rubyUnlessTok:                            "unless"
    of rubyUntilTok:                             "until"
    of rubyWhenTok:                              "when"
    of rubyWhileTok:                             "while"
    of rubyYieldTok:                             "yield"
    of rubyLCurlyTok:                            "{"
    of rubyPipeTok:                              "|"
    of rubyPipeEqualTok:                         "|="
    of rubyDoublePipeTok:                        "||"
    of rubyDoublePipeEqualTok:                   "||="
    of rubyRCurlyTok:                            "}"
    of rubyTildeTok:                             "~"
    of rubyHidArgumentListWithTrailingComma:     "_argument_list_with_trailing_comma"
    of rubyHidArrayPatternBody:                  "_array_pattern_body"
    of rubyHidFormalParameter:                   "_formal_parameter"
    of rubyHidSingletonClassLeftAngleLeftLangle: "_singleton_class_left_angle_left_langle"
    of rubyHidRegexStart:                        "_regex_start"
    of rubyHidStringArrayStart:                  "_string_array_start"
    of rubyHidSymbolArrayStart:                  "_symbol_array_start"
    of rubyHidLiteral:                           "_literal"
    of rubyHidElementReferenceBracket:           "_element_reference_bracket"
    of rubyCommandAssignment:                    "command_assignment"
    of rubyHidPatternConstantResolution:         "_pattern_constant_resolution"
    of rubyCommandUnary:                         "command_unary"
    of rubyHidPatternLiteral:                    "_pattern_literal"
    of rubyCommandOperatorAssignment:            "command_operator_assignment"
    of rubyHidChainedCommandCall:                "_chained_command_call"
    of rubyCommandCall:                          "command_call"
    of rubyHidBinaryMinus:                       "_binary_minus"
    of rubyHidNumeric:                           "_numeric"
    of rubyHidStringStart:                       "_string_start"
    of rubyHidMlhs:                              "_mlhs"
    of rubyHidBlockAmpersand:                    "_block_ampersand"
    of rubyCommandCallWithBlock:                 "command_call_with_block"
    of rubyHidLineBreak:                         "_line_break"
    of rubyUnaryLiteral:                         "unary_literal"
    of rubyCommandBinary:                        "command_binary"
    of rubyHidHeredocBodyStart:                  "_heredoc_body_start"
    of rubyHidLiteralContents:                   "_literal_contents"
    of rubyHidBinaryStarStar:                    "_binary_star_star"
    of rubyBareParameters:                       "bare_parameters"
    of rubyHidGuard:                             "_guard"
    of rubyHidArrayPatternN:                     "_array_pattern_n"
    of rubyHidBinaryStar:                        "_binary_star"
    of rubyHidFindPatternBody:                   "_find_pattern_body"
    of rubyHidSplatStar:                         "_splat_star"
    of rubyHidPatternRange:                      "_pattern_range"
    of rubyHidStringEnd:                         "_string_end"
    of rubyHidStatements:                        "_statements"
    of rubyHidArgument:                          "_argument"
    of rubyParameters:                           "parameters"
    of rubyHidHashPatternAnyRest:                "_hash_pattern_any_rest"
    of rubyHidTerminator:                        "_terminator"
    of rubyYieldCommand:                         "yield_command"
    of rubyBreakCommand:                         "break_command"
    of rubyCommandArgumentList:                  "command_argument_list"
    of rubyHidSymbolStart:                       "_symbol_start"
    of rubyHidHashSplatStarStar:                 "_hash_splat_star_star"
    of rubyHidSimpleFormalParameter:             "_simple_formal_parameter"
    of rubyHidCall:                              "_call"
    of rubyHidPatternLambda:                     "_pattern_lambda"
    of rubyParenthesizedUnary:                   "parenthesized_unary"
    of rubyReturnCommand:                        "return_command"
    of rubyNextCommand:                          "next_command"
    of rubyRescueModifierArg:                    "rescue_modifier_arg"
    of rubyHidPatternExprAlt:                    "_pattern_expr_alt"
    of rubyHidUnaryMinus:                        "_unary_minus"
    of rubyHidSubshellStart:                     "_subshell_start"
    of rubyHidBodyExpr:                          "_body_expr"
    of rubyHidKeywordVariable:                   "_keyword_variable"
    of rubyHidPatternValue:                      "_pattern_value"
    of rubyHidMethodRest:                        "_method_rest"
    of rubyHidBodyStatement:                     "_body_statement"
    of rubyHidHashPatternBody:                   "_hash_pattern_body"
    of rubySyntaxError:                          "ERROR"

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
                                                                       tmp[rubyArgumentList] = {rubyHidExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyArray] = {rubyHidExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyArrayPattern] = {rubyHidPatternExpr, rubySplatParameter}
                                                                       tmp[rubyBareString] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyBareSymbol] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyBegin] = {rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyBeginBlock] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyBlock] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyBlockArgument] = {rubyHidArg}
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
                                                                       tmp[rubyClass] = {rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyDelimitedSymbol] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyDestructuredLeftAssignment] = {rubyHidLhs, rubyDestructuredLeftAssignment, rubyRestAssignment}
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
                                                                       tmp[rubyDo] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyDoBlock] = {rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyElementReference] = {rubyHidExpression, rubyBlockArgument, rubyForwardArgument, rubyHashSplatArgument, rubyPair, rubySplatArgument}
                                                                       tmp[rubyElse] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyEndBlock] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyEnsure] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyExceptionVariable] = {rubyHidLhs}
                                                                       tmp[rubyExceptions] = {rubyHidArg, rubySplatArgument}
                                                                       tmp[rubyFindPattern] = {rubyHidPatternExpr, rubySplatParameter}
                                                                       tmp[rubyHash] = {rubyHashSplatArgument, rubyPair}
                                                                       tmp[rubyHashPattern] = {rubyHashSplatNil, rubyHashSplatParameter, rubyKeywordPattern}
                                                                       tmp[rubyHashSplatArgument] = {rubyHidArg}
                                                                       tmp[rubyHeredocBody] = {rubyEscapeSequence, rubyHeredocContent, rubyHeredocEnd, rubyInterpolation}
                                                                       tmp[rubyIn] = {rubyHidArg}
                                                                       tmp[rubyInterpolation] = {rubyHidStatement, rubyEmptyStatement}
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
                                                                       tmp[rubyLeftAssignmentList] = {rubyHidLhs, rubyDestructuredLeftAssignment, rubyRestAssignment}
                                                                       tmp[rubyMethod] = {rubyHidArg, rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
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
                                                                       tmp[rubyModule] = {rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubyNext] = {rubyArgumentList}
                                                                       tmp[rubyParenthesizedStatements] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyPattern] = {rubyHidArg, rubySplatArgument}
                                                                       tmp[rubyProgram] = {rubyHidStatement, rubyEmptyStatement, rubyUninterpreted}
                                                                       tmp[rubyRational] = {rubyFloat, rubyInteger}
                                                                       tmp[rubyRedo] = {rubyArgumentList}
                                                                       tmp[rubyRegex] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyRestAssignment] = {rubyHidLhs}
                                                                       tmp[rubyRetry] = {rubyArgumentList}
                                                                       tmp[rubyReturn] = {rubyArgumentList}
                                                                       tmp[rubyRightAssignmentList] = {rubyHidArg, rubySplatArgument}
                                                                       tmp[rubySingletonClass] = {rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubySingletonMethod] = {rubyHidArg, rubyHidStatement, rubyElse, rubyEmptyStatement, rubyEnsure, rubyRescue}
                                                                       tmp[rubySplatArgument] = {rubyHidArg}
                                                                       tmp[rubyString] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubyStringArray] = {rubyBareString}
                                                                       tmp[rubySubshell] = {rubyEscapeSequence, rubyInterpolation, rubyStringContent}
                                                                       tmp[rubySuperclass] = {rubyHidExpression}
                                                                       tmp[rubySymbolArray] = {rubyBareSymbol}
                                                                       tmp[rubyThen] = {rubyHidStatement, rubyEmptyStatement}
                                                                       tmp[rubyUndef] = {rubyHidMethodName}
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
                                             rubyHidENDTok,
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
const rubyHiddenKinds*: set[RubyNodeKind] = {
                                              rubyHidArgumentListWithTrailingComma,
                                              rubyHidArrayPatternBody,
                                              rubyHidFormalParameter,
                                              rubyHidSingletonClassLeftAngleLeftLangle,
                                              rubyHidRegexStart,
                                              rubyHidStringArrayStart,
                                              rubyHidSymbolArrayStart,
                                              rubyHidLiteral,
                                              rubyHidElementReferenceBracket,
                                              rubyCommandAssignment,
                                              rubyHidPatternConstantResolution,
                                              rubyCommandUnary,
                                              rubyHidPatternLiteral,
                                              rubyHidArg,
                                              rubyHidExpression,
                                              rubyCommandOperatorAssignment,
                                              rubyHidChainedCommandCall,
                                              rubyCommandCall,
                                              rubyHidBinaryMinus,
                                              rubyHidNumeric,
                                              rubyHidStringStart,
                                              rubyHidMlhs,
                                              rubyHidBlockAmpersand,
                                              rubyCommandCallWithBlock,
                                              rubyHidLineBreak,
                                              rubyUnaryLiteral,
                                              rubyCommandBinary,
                                              rubyHidHeredocBodyStart,
                                              rubyHidLiteralContents,
                                              rubyHidBinaryStarStar,
                                              rubyHidPatternConstant,
                                              rubyBareParameters,
                                              rubyHidGuard,
                                              rubyHidArrayPatternN,
                                              rubyHidBinaryStar,
                                              rubyHidFindPatternBody,
                                              rubyHidSplatStar,
                                              rubyHidLhs,
                                              rubyHidPatternRange,
                                              rubyHidStringEnd,
                                              rubyHidStatements,
                                              rubyHidPatternExpr,
                                              rubyHidArgument,
                                              rubyHidSimpleNumeric,
                                              rubyHidStatement,
                                              rubyParameters,
                                              rubyHidPatternExprBasic,
                                              rubyHidHashPatternAnyRest,
                                              rubyHidTerminator,
                                              rubyYieldCommand,
                                              rubyBreakCommand,
                                              rubyHidMethodName,
                                              rubyCommandArgumentList,
                                              rubyHidSymbolStart,
                                              rubyHidHashSplatStarStar,
                                              rubyHidSimpleFormalParameter,
                                              rubyHidCall,
                                              rubyHidPatternLambda,
                                              rubyHidVariable,
                                              rubyParenthesizedUnary,
                                              rubyReturnCommand,
                                              rubyNextCommand,
                                              rubyRescueModifierArg,
                                              rubyHidPatternExprAlt,
                                              rubyHidUnaryMinus,
                                              rubyHidPrimary,
                                              rubyHidSubshellStart,
                                              rubyHidBodyExpr,
                                              rubyHidKeywordVariable,
                                              rubyHidPatternTopExprBody,
                                              rubyHidPatternValue,
                                              rubyHidMethodRest,
                                              rubyHidBodyStatement,
                                              rubyHidPatternPrimitive,
                                              rubyHidHashPatternBody
                                            }
proc tsNodeType*(node: TsRubyNode): string


proc kind*(node: TsRubyNode): RubyNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_arg":                         rubyHidArg
      of "_expression":                  rubyHidExpression
      of "_lhs":                         rubyHidLhs
      of "_method_name":                 rubyHidMethodName
      of "_pattern_constant":            rubyHidPatternConstant
      of "_pattern_expr":                rubyHidPatternExpr
      of "_pattern_expr_basic":          rubyHidPatternExprBasic
      of "_pattern_primitive":           rubyHidPatternPrimitive
      of "_pattern_top_expr_body":       rubyHidPatternTopExprBody
      of "_primary":                     rubyHidPrimary
      of "_simple_numeric":              rubyHidSimpleNumeric
      of "_statement":                   rubyHidStatement
      of "_variable":                    rubyHidVariable
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
      of "__END__":                      rubyHidENDTok
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
      of "nil":                          rubyNil
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


proc treeRepr*(node: TsRubyNode, str: string): string =
  var res = addr result
  proc aux(node: TsRubyNode, level: int) =
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
let rubyGrammar*: array[RubyNodeKind, HtsRule[RubyNodeKind]] = block:
                                                                 var rules: array[RubyNodeKind, HtsRule[RubyNodeKind]]
                                                                 type
                                                                   K = RubyNodeKind


                                                                 rules[rubyDestructuredLeftAssignment] = tsSeq[K](tsString[K]("("), tsSymbol[K](rubyHidMlhs), tsString[K](")"))
                                                                 rules[rubyInterpolation] = tsSeq[K](tsString[K]("#{"), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rubyBinary] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("and"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("or"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("||"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("&&"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("<<"), tsString[K](">>")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("<"), tsString[K]("<="), tsString[K](">"), tsString[K](">=")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("&"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("^"), tsString[K]("|")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("+"), tsSymbol[K](rubyHidBinaryMinus)), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("/"), tsString[K]("%"), tsSymbol[K](rubyHidBinaryStar)), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K]("=="), tsString[K]("!="), tsString[K]("==="), tsString[K]("<=>"), tsString[K]("=~"), tsString[K]("!~")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubyHidBinaryStarStar), tsSymbol[K](rubyHidArg)))
                                                                 rules[rubyCommandUnary] = tsChoice[K](tsSeq[K](tsString[K]("defined?"), tsSymbol[K](rubyHidExpression)), tsSeq[K](tsString[K]("not"), tsSymbol[K](rubyHidExpression)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidUnaryMinus), tsString[K]("+")), tsSymbol[K](rubyHidExpression)), tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~")), tsSymbol[K](rubyHidExpression)))
                                                                 rules[rubyFalse] = tsChoice[K](tsString[K]("false"), tsString[K]("FALSE"))
                                                                 rules[rubyHidArg] = tsChoice[K](tsSymbol[K](rubyHidPrimary), tsSymbol[K](rubyAssignment), tsSymbol[K](rubyOperatorAssignment), tsSymbol[K](rubyConditional), tsSymbol[K](rubyRange), tsSymbol[K](rubyBinary), tsSymbol[K](rubyUnary))
                                                                 rules[rubyBeginBlock] = tsSeq[K](tsString[K]("BEGIN"), tsString[K]("{"), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rubyConditional] = tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("?"), tsSymbol[K](rubyHidArg), tsString[K](":"), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyCommandCall] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsSymbol[K](rubyHidChainedCommandCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSymbol[K](rubyCommandArgumentList))
                                                                 rules[rubyCommandBinary] = tsSeq[K](tsSymbol[K](rubyHidExpression), tsChoice[K](tsString[K]("or"), tsString[K]("and")), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyWhen] = tsSeq[K](tsString[K]("when"), tsSeq[K](tsSymbol[K](rubyPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyPattern)))), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)))
                                                                 rules[rubyHidGuard] = tsChoice[K](tsSymbol[K](rubyIfGuard), tsSymbol[K](rubyUnlessGuard))
                                                                 rules[rubySubshell] = tsSeq[K](tsSymbol[K](rubyHidSubshellStart), tsChoice[K](tsSymbol[K](rubyHidLiteralContents), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyHidLhs] = tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyTrue), tsSymbol[K](rubyFalse), tsSymbol[K](rubyNil), tsSymbol[K](rubyScopeResolution), tsSymbol[K](rubyElementReference), tsSymbol[K](rubyHidCall), tsSymbol[K](rubyCall))
                                                                 rules[rubyComment] = tsChoice[K](tsSeq[K](tsString[K]("#"), tsRegex[K](".*")), tsSeq[K](tsRegex[K]("=begin.*\\r?\\n"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^=]"), tsRegex[K]("=[^e]"), tsRegex[K]("=e[^n]"), tsRegex[K]("=en[^d]"))), tsRegex[K]("=end")))
                                                                 rules[rubyNil] = tsChoice[K](tsString[K]("nil"), tsString[K]("NIL"))
                                                                 rules[rubySetter] = tsSeq[K](tsSymbol[K](rubyIdentifier), tsString[K]("="))
                                                                 rules[rubyHidStatements] = tsChoice[K](tsSeq[K](tsRepeat1[K](tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidStatement), tsSymbol[K](rubyHidTerminator)), tsSymbol[K](rubyEmptyStatement))), tsChoice[K](tsSymbol[K](rubyHidStatement), tsBlank[K]())), tsSymbol[K](rubyHidStatement))
                                                                 rules[rubyHidPatternExpr] = tsChoice[K](tsSymbol[K](rubyAsPattern), tsSymbol[K](rubyHidPatternExprAlt))
                                                                 rules[rubyThen] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyHidStatements)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsString[K]("then"), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]())))
                                                                 rules[rubyRescueModifier] = tsSeq[K](tsSymbol[K](rubyHidStatement), tsString[K]("rescue"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyHidPatternExprBasic] = tsChoice[K](tsSymbol[K](rubyHidPatternValue), tsSymbol[K](rubyArrayPattern), tsSymbol[K](rubyFindPattern), tsSymbol[K](rubyHashPattern))
                                                                 rules[rubyInstanceVariable] = tsSeq[K](tsString[K]("@"), tsRegex[K]("[^\\x00-\\x1F\\s0-9:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]"), tsRegex[K]("[^\\x00-\\x1F\\s:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]*"))
                                                                 rules[rubyHidMethodName] = tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyConstant), tsSymbol[K](rubySetter), tsSymbol[K](rubySimpleSymbol), tsSymbol[K](rubyDelimitedSymbol), tsSymbol[K](rubyOperator), tsSymbol[K](rubyInstanceVariable), tsSymbol[K](rubyClassVariable), tsSymbol[K](rubyGlobalVariable))
                                                                 rules[rubyKeywordParameter] = tsSeq[K](tsSymbol[K](rubyIdentifier), tsString[K](":"), tsChoice[K](tsSymbol[K](rubyHidArg), tsBlank[K]()))
                                                                 rules[rubyInteger] = tsRegex[K]("0[bB][01](_?[01])*|0[oO]?[0-7](_?[0-7])*|(0[dD])?\\d(_?\\d)*|0[xX][0-9a-fA-F](_?[0-9a-fA-F])*")
                                                                 rules[rubyWhileModifier] = tsSeq[K](tsSymbol[K](rubyHidStatement), tsString[K]("while"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyIfGuard] = tsSeq[K](tsString[K]("if"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyHidPatternValue] = tsChoice[K](tsSymbol[K](rubyHidPatternPrimitive), tsSymbol[K](rubyHidPatternRange), tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyVariableReferencePattern), tsSymbol[K](rubyHidPatternConstant))
                                                                 rules[rubyHidMethodRest] = tsSeq[K](tsSymbol[K](rubyHidMethodName), tsChoice[K](tsSymbol[K](rubyHidBodyExpr), tsSeq[K](tsSymbol[K](rubyParameters), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsSymbol[K](rubyHidBodyStatement)), tsSymbol[K](rubyHidBodyExpr))), tsSeq[K](tsChoice[K](tsSymbol[K](rubyBareParameters), tsBlank[K]()), tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyHidBodyStatement))))
                                                                 rules[rubySingletonClass] = tsSeq[K](tsString[K]("class"), tsSymbol[K](rubyHidSingletonClassLeftAngleLeftLangle), tsSymbol[K](rubyHidArg), tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyHidBodyStatement))
                                                                 rules[rubyHidPatternPrimitive] = tsChoice[K](tsSymbol[K](rubyHidPatternLiteral), tsSymbol[K](rubyHidPatternLambda))
                                                                 rules[rubyHidHashPatternBody] = tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](rubyKeywordPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyKeywordPattern)))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsSeq[K](tsSeq[K](tsSymbol[K](rubyKeywordPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyKeywordPattern)))), tsString[K](","), tsSymbol[K](rubyHidHashPatternAnyRest)), tsSymbol[K](rubyHidHashPatternAnyRest))
                                                                 rules[rubyHidArgumentListWithTrailingComma] = tsSeq[K](tsSeq[K](tsSymbol[K](rubyHidArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidArgument)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                 rules[rubyRegex] = tsSeq[K](tsSymbol[K](rubyHidRegexStart), tsChoice[K](tsSymbol[K](rubyHidLiteralContents), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyReturn] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyBegin] = tsSeq[K](tsString[K]("begin"), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsSymbol[K](rubyHidBodyStatement))
                                                                 rules[rubyStringArray] = tsSeq[K](tsSymbol[K](rubyHidStringArrayStart), tsChoice[K](tsRegex[K]("\\s+"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidLiteralContents), tsRepeat[K](tsSeq[K](tsRegex[K]("\\s+"), tsSymbol[K](rubyHidLiteralContents)))), tsBlank[K]()), tsChoice[K](tsRegex[K]("\\s+"), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyHidPatternConstantResolution] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidPatternConstant), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](rubyConstant))
                                                                 rules[rubyYield] = tsSeq[K](tsString[K]("yield"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyHidPatternLiteral] = tsChoice[K](tsSymbol[K](rubyHidLiteral), tsSymbol[K](rubyString), tsSymbol[K](rubyRegex), tsSymbol[K](rubyStringArray), tsSymbol[K](rubySymbolArray), tsSymbol[K](rubyHidKeywordVariable))
                                                                 rules[rubyOperatorAssignment] = tsSeq[K](tsSymbol[K](rubyHidLhs), tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("**="), tsString[K]("/="), tsString[K]("||="), tsString[K]("|="), tsString[K]("&&="), tsString[K]("&="), tsString[K]("%="), tsString[K](">>="), tsString[K]("<<="), tsString[K]("^=")), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyMethod] = tsSeq[K](tsString[K]("def"), tsSymbol[K](rubyHidMethodRest))
                                                                 rules[rubyArrayPattern] = tsChoice[K](tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](rubyHidArrayPatternBody), tsBlank[K]()), tsString[K]("]")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("["), tsChoice[K](tsSymbol[K](rubyHidArrayPatternBody), tsBlank[K]()), tsString[K]("]")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("("), tsChoice[K](tsSymbol[K](rubyHidArrayPatternBody), tsBlank[K]()), tsString[K](")")))
                                                                 rules[rubyClass] = tsSeq[K](tsString[K]("class"), tsChoice[K](tsSymbol[K](rubyConstant), tsSymbol[K](rubyScopeResolution)), tsChoice[K](tsSymbol[K](rubySuperclass), tsBlank[K]()), tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyHidBodyStatement))
                                                                 rules[rubyModule] = tsSeq[K](tsString[K]("module"), tsChoice[K](tsSymbol[K](rubyConstant), tsSymbol[K](rubyScopeResolution)), tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyHidBodyStatement)), tsString[K]("end")))
                                                                 rules[rubyCharacter] = tsRegex[K]("\\?(\\\\\\S({[0-9A-Fa-f]*}|[0-9A-Fa-f]*|-\\S([MC]-\\S)?)?|\\S)")
                                                                 rules[rubyString] = tsSeq[K](tsSymbol[K](rubyHidStringStart), tsChoice[K](tsSymbol[K](rubyHidLiteralContents), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyFile] = tsString[K]("__FILE__")
                                                                 rules[rubyIfModifier] = tsSeq[K](tsSymbol[K](rubyHidStatement), tsString[K]("if"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubySuperclass] = tsSeq[K](tsString[K]("<"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyUnaryLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidUnaryMinus), tsString[K]("+")), tsSymbol[K](rubyHidSimpleNumeric))
                                                                 rules[rubyEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^ux0-7]"), tsRegex[K]("x[0-9a-fA-F]{1,2}"), tsRegex[K]("[0-7]{1,3}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F ]+}")))
                                                                 rules[rubyBlockParameter] = tsSeq[K](tsString[K]("&"), tsSymbol[K](rubyIdentifier))
                                                                 rules[rubySplatParameter] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsSymbol[K](rubyIdentifier), tsBlank[K]()))
                                                                 rules[rubyCase] = tsSeq[K](tsString[K]("case"), tsChoice[K](tsSymbol[K](rubyHidStatement), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsRepeat[K](tsSymbol[K](rubyWhen)), tsChoice[K](tsSymbol[K](rubyElse), tsBlank[K]()), tsString[K]("end"))
                                                                 rules[rubyElsif] = tsSeq[K](tsString[K]("elsif"), tsSymbol[K](rubyHidStatement), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)), tsChoice[K](tsChoice[K](tsSymbol[K](rubyElse), tsSymbol[K](rubyElsif)), tsBlank[K]()))
                                                                 rules[rubyHidArgument] = tsChoice[K](tsSymbol[K](rubyHidExpression), tsSymbol[K](rubySplatArgument), tsSymbol[K](rubyHashSplatArgument), tsSymbol[K](rubyForwardArgument), tsSymbol[K](rubyBlockArgument), tsSymbol[K](rubyPair))
                                                                 rules[rubyHidTerminator] = tsChoice[K](tsSymbol[K](rubyHidLineBreak), tsString[K](";"))
                                                                 rules[rubyOperator] = tsChoice[K](tsString[K](".."), tsString[K]("|"), tsString[K]("^"), tsString[K]("&"), tsString[K]("<=>"), tsString[K]("=="), tsString[K]("==="), tsString[K]("=~"), tsString[K](">"), tsString[K](">="), tsString[K]("<"), tsString[K]("<="), tsString[K]("+"), tsString[K]("-"), tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("!"), tsString[K]("!~"), tsString[K]("**"), tsString[K]("<<"), tsString[K](">>"), tsString[K]("~"), tsString[K]("+@"), tsString[K]("-@"), tsString[K]("[]"), tsString[K]("[]="), tsString[K]("`"))
                                                                 rules[rubyAssignment] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyLeftAssignmentList)), tsString[K]("="), tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument), tsSymbol[K](rubyRightAssignmentList))))
                                                                 rules[rubyHidSimpleFormalParameter] = tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubySplatParameter), tsSymbol[K](rubyHashSplatParameter), tsSymbol[K](rubyHashSplatNil), tsSymbol[K](rubyForwardParameter), tsSymbol[K](rubyBlockParameter), tsSymbol[K](rubyKeywordParameter), tsSymbol[K](rubyOptionalParameter))
                                                                 rules[rubyHidPatternLambda] = tsSymbol[K](rubyLambda)
                                                                 rules[rubyProgram] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("__END__"), tsSymbol[K](rubyHidLineBreak), tsSymbol[K](rubyUninterpreted)), tsBlank[K]()))
                                                                 rules[rubyExceptionVariable] = tsSeq[K](tsString[K]("=>"), tsSymbol[K](rubyHidLhs))
                                                                 rules[rubyParenthesizedUnary] = tsSeq[K](tsChoice[K](tsString[K]("defined?"), tsString[K]("not")), tsSymbol[K](rubyParenthesizedStatements))
                                                                 rules[rubyUnless] = tsSeq[K](tsString[K]("unless"), tsSymbol[K](rubyHidStatement), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)), tsChoice[K](tsChoice[K](tsSymbol[K](rubyElse), tsSymbol[K](rubyElsif)), tsBlank[K]()), tsString[K]("end"))
                                                                 rules[rubyComplex] = tsRegex[K]("(\\d+)?(\\+|-)?(\\d+)i")
                                                                 rules[rubyHidPatternTopExprBody] = tsChoice[K](tsSymbol[K](rubyHidPatternExpr), tsSymbol[K](rubyHidArrayPatternN), tsSymbol[K](rubyHidFindPatternBody), tsSymbol[K](rubyHidHashPatternBody))
                                                                 rules[rubyDelimitedSymbol] = tsSeq[K](tsSymbol[K](rubyHidSymbolStart), tsChoice[K](tsSymbol[K](rubyHidLiteralContents), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyRestAssignment] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsSymbol[K](rubyHidLhs), tsBlank[K]()))
                                                                 rules[rubyElse] = tsSeq[K](tsString[K]("else"), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()))
                                                                 rules[rubyHash] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyPair), tsSymbol[K](rubyHashSplatArgument)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rubyPair), tsSymbol[K](rubyHashSplatArgument))))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rubySingletonMethod] = tsSeq[K](tsString[K]("def"), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidVariable), tsSeq[K](tsString[K]("("), tsSymbol[K](rubyHidArg), tsString[K](")"))), tsChoice[K](tsString[K]("."), tsString[K]("::"))), tsSymbol[K](rubyHidMethodRest))
                                                                 rules[rubyExceptions] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument)))))
                                                                 rules[rubyAlias] = tsSeq[K](tsString[K]("alias"), tsSymbol[K](rubyHidMethodName), tsSymbol[K](rubyHidMethodName))
                                                                 rules[rubyCommandAssignment] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyLeftAssignmentList)), tsString[K]("="), tsSymbol[K](rubyHidExpression)))
                                                                 rules[rubyIn] = tsSeq[K](tsString[K]("in"), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyUninterpreted] = tsRegex[K]("(.|\\s)*")
                                                                 rules[rubyUntil] = tsSeq[K](tsString[K]("until"), tsSymbol[K](rubyHidStatement), tsSymbol[K](rubyDo))
                                                                 rules[rubyLeftAssignmentList] = tsSymbol[K](rubyHidMlhs)
                                                                 rules[rubyForwardArgument] = tsString[K]("...")
                                                                 rules[rubyRedo] = tsSeq[K](tsString[K]("redo"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyHidExpression] = tsChoice[K](tsSymbol[K](rubyCommandBinary), tsSymbol[K](rubyCommandUnary), tsSymbol[K](rubyCommandAssignment), tsSymbol[K](rubyCommandOperatorAssignment), tsSymbol[K](rubyCommandCall), tsSymbol[K](rubyCommandCallWithBlock), tsSymbol[K](rubyHidChainedCommandCall), tsSymbol[K](rubyReturnCommand), tsSymbol[K](rubyYieldCommand), tsSymbol[K](rubyBreakCommand), tsSymbol[K](rubyNextCommand), tsSymbol[K](rubyHidArg))
                                                                 rules[rubySymbolArray] = tsSeq[K](tsSymbol[K](rubyHidSymbolArrayStart), tsChoice[K](tsRegex[K]("\\s+"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidLiteralContents), tsRepeat[K](tsSeq[K](tsRegex[K]("\\s+"), tsSymbol[K](rubyHidLiteralContents)))), tsBlank[K]()), tsChoice[K](tsRegex[K]("\\s+"), tsBlank[K]()), tsSymbol[K](rubyHidStringEnd))
                                                                 rules[rubyBlockParameters] = tsSeq[K](tsString[K]("|"), tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidFormalParameter)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]())), tsChoice[K](tsSeq[K](tsString[K](";"), tsSeq[K](tsSymbol[K](rubyIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyIdentifier))))), tsBlank[K]()), tsString[K]("|"))
                                                                 rules[rubySplatArgument] = tsSeq[K](tsSymbol[K](rubyHidSplatStar), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyConstant] = tsSeq[K](tsRegex[K]("[A-Z]"), tsRegex[K]("[^\\x00-\\x1F\\s:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]*"), tsRegex[K]("(\\?|\\!)?"))
                                                                 rules[rubyBlockArgument] = tsSeq[K](tsSymbol[K](rubyHidBlockAmpersand), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyHidChainedCommandCall] = tsSeq[K](tsSymbol[K](rubyCommandCallWithBlock), tsChoice[K](tsString[K]("."), tsString[K]("&.")), tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyOperator), tsSymbol[K](rubyConstant), tsSymbol[K](rubyArgumentList)))
                                                                 rules[rubyHidNumeric] = tsChoice[K](tsSymbol[K](rubyHidSimpleNumeric), tsSymbol[K](rubyUnaryLiteral))
                                                                 rules[rubyBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](rubyBlockParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rubyPattern] = tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument))
                                                                 rules[rubyEncoding] = tsString[K]("__ENCODING__")
                                                                 rules[rubyAsPattern] = tsSeq[K](tsSymbol[K](rubyHidPatternExpr), tsString[K]("=>"), tsSymbol[K](rubyIdentifier))
                                                                 rules[rubyFor] = tsSeq[K](tsString[K]("for"), tsChoice[K](tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyLeftAssignmentList)), tsSymbol[K](rubyIn), tsSymbol[K](rubyDo))
                                                                 rules[rubyHidMlhs] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyRestAssignment), tsSymbol[K](rubyDestructuredLeftAssignment)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyRestAssignment), tsSymbol[K](rubyDestructuredLeftAssignment))))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                 rules[rubyCommandCallWithBlock] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSeq[K](tsSymbol[K](rubyCommandArgumentList), tsSymbol[K](rubyBlock))), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSeq[K](tsSymbol[K](rubyCommandArgumentList), tsSymbol[K](rubyDoBlock))))
                                                                 rules[rubyRational] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyInteger), tsSymbol[K](rubyFloat)), tsString[K]("r"))
                                                                 rules[rubyEnsure] = tsSeq[K](tsString[K]("ensure"), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()))
                                                                 rules[rubyBareParameters] = tsSeq[K](tsSymbol[K](rubyHidSimpleFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidFormalParameter))))
                                                                 rules[rubyHidPatternConstant] = tsChoice[K](tsSymbol[K](rubyConstant), tsSymbol[K](rubyHidPatternConstantResolution))
                                                                 rules[rubyRightAssignmentList] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubySplatArgument)))))
                                                                 rules[rubyHidLiteralContents] = tsRepeat1[K](tsChoice[K](tsSymbol[K](rubyStringContent), tsSymbol[K](rubyInterpolation), tsSymbol[K](rubyEscapeSequence)))
                                                                 rules[rubyPair] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("=>"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHashKeySymbol), tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyConstant), tsSymbol[K](rubyString)), tsString[K](":"), tsSymbol[K](rubyHidArg)))
                                                                 rules[rubyWhile] = tsSeq[K](tsString[K]("while"), tsSymbol[K](rubyHidStatement), tsSymbol[K](rubyDo))
                                                                 rules[rubyHidFindPatternBody] = tsSeq[K](tsSymbol[K](rubySplatParameter), tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidPatternExpr))), tsString[K](","), tsSymbol[K](rubySplatParameter))
                                                                 rules[rubyDoBlock] = tsSeq[K](tsString[K]("do"), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](rubyBlockParameters), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]())), tsBlank[K]()), tsSymbol[K](rubyHidBodyStatement))
                                                                 rules[rubyHidPatternRange] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidPatternPrimitive), tsChoice[K](tsString[K](".."), tsString[K]("...")), tsSymbol[K](rubyHidPatternPrimitive)), tsSeq[K](tsChoice[K](tsString[K](".."), tsString[K]("...")), tsSymbol[K](rubyHidPatternPrimitive)), tsSeq[K](tsSymbol[K](rubyHidPatternPrimitive), tsChoice[K](tsString[K](".."), tsString[K]("..."))))
                                                                 rules[rubyVariableReferencePattern] = tsSeq[K](tsString[K]("^"), tsSymbol[K](rubyIdentifier))
                                                                 rules[rubyGlobalVariable] = tsRegex[K]("\\$-?(([!@&`\'+~=/\\\\,;.<>*$?:\"])|([0-9]*)|([a-zA-Z_][a-zA-Z0-9_]*))")
                                                                 rules[rubyHidStatement] = tsChoice[K](tsSymbol[K](rubyUndef), tsSymbol[K](rubyAlias), tsSymbol[K](rubyIfModifier), tsSymbol[K](rubyUnlessModifier), tsSymbol[K](rubyWhileModifier), tsSymbol[K](rubyUntilModifier), tsSymbol[K](rubyRescueModifier), tsSymbol[K](rubyBeginBlock), tsSymbol[K](rubyEndBlock), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyHashPattern] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](rubyHidHashPatternBody), tsBlank[K]()), tsString[K]("}")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("["), tsSymbol[K](rubyHidHashPatternBody), tsString[K]("]")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("("), tsSymbol[K](rubyHidHashPatternBody), tsString[K](")")))
                                                                 rules[rubyUnary] = tsChoice[K](tsSeq[K](tsString[K]("defined?"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsString[K]("not"), tsSymbol[K](rubyHidArg)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidUnaryMinus), tsString[K]("+")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~")), tsSymbol[K](rubyHidArg)))
                                                                 rules[rubyHidHashPatternAnyRest] = tsChoice[K](tsSymbol[K](rubyHashSplatParameter), tsSymbol[K](rubyHashSplatNil))
                                                                 rules[rubyIdentifier] = tsSeq[K](tsRegex[K]("[^\\x00-\\x1F\\sA-Z0-9:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]"), tsRegex[K]("[^\\x00-\\x1F\\s:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]*"), tsRegex[K]("(\\?|\\!)?"))
                                                                 rules[rubyClassVariable] = tsSeq[K](tsString[K]("@@"), tsRegex[K]("[^\\x00-\\x1F\\s0-9:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]"), tsRegex[K]("[^\\x00-\\x1F\\s:;`\"\'@$#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}]*"))
                                                                 rules[rubyInClause] = tsSeq[K](tsString[K]("in"), tsSymbol[K](rubyHidPatternTopExprBody), tsChoice[K](tsSymbol[K](rubyHidGuard), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)))
                                                                 rules[rubyReturnCommand] = tsSeq[K](tsString[K]("return"), tsSymbol[K](rubyCommandArgumentList))
                                                                 rules[rubyNext] = tsSeq[K](tsString[K]("next"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyHidCall] = tsSeq[K](tsSymbol[K](rubyHidPrimary), tsChoice[K](tsString[K]("."), tsString[K]("&.")), tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyOperator), tsSymbol[K](rubyConstant), tsSymbol[K](rubyArgumentList)))
                                                                 rules[rubyHashSplatParameter] = tsSeq[K](tsString[K]("**"), tsChoice[K](tsSymbol[K](rubyIdentifier), tsBlank[K]()))
                                                                 rules[rubyCall] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSymbol[K](rubyArgumentList)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSeq[K](tsSymbol[K](rubyArgumentList), tsSymbol[K](rubyBlock))), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSeq[K](tsSymbol[K](rubyArgumentList), tsSymbol[K](rubyDoBlock))), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSymbol[K](rubyBlock)), tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidCall), tsChoice[K](tsSymbol[K](rubyHidVariable), tsSymbol[K](rubyScopeResolution))), tsSymbol[K](rubyDoBlock)))
                                                                 rules[rubyUnlessGuard] = tsSeq[K](tsString[K]("unless"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyElementReference] = tsSeq[K](tsSymbol[K](rubyHidPrimary), tsSymbol[K](rubyHidElementReferenceBracket), tsChoice[K](tsSymbol[K](rubyHidArgumentListWithTrailingComma), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[rubyHidPatternExprAlt] = tsChoice[K](tsSymbol[K](rubyAlternativePattern), tsSymbol[K](rubyHidPatternExprBasic))
                                                                 rules[rubyUndef] = tsSeq[K](tsString[K]("undef"), tsSeq[K](tsSymbol[K](rubyHidMethodName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidMethodName)))))
                                                                 rules[rubyTrue] = tsChoice[K](tsString[K]("true"), tsString[K]("TRUE"))
                                                                 rules[rubyScopeResolution] = tsSeq[K](tsChoice[K](tsString[K]("::"), tsSeq[K](tsSymbol[K](rubyHidPrimary), tsString[K]("::"))), tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyConstant)))
                                                                 rules[rubyHidFormalParameter] = tsChoice[K](tsSymbol[K](rubyHidSimpleFormalParameter), tsSymbol[K](rubyParameters))
                                                                 rules[rubyHidArrayPatternBody] = tsChoice[K](tsSymbol[K](rubyHidPatternExpr), tsSymbol[K](rubyHidArrayPatternN))
                                                                 rules[rubyHidBodyStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsRepeat[K](tsChoice[K](tsSymbol[K](rubyRescue), tsSymbol[K](rubyElse), tsSymbol[K](rubyEnsure))), tsString[K]("end"))
                                                                 rules[rubyHidLiteral] = tsChoice[K](tsSymbol[K](rubySimpleSymbol), tsSymbol[K](rubyDelimitedSymbol), tsSymbol[K](rubyHidNumeric))
                                                                 rules[rubyForwardParameter] = tsString[K]("...")
                                                                 rules[rubyHashSplatArgument] = tsSeq[K](tsSymbol[K](rubyHidHashSplatStarStar), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyOptionalParameter] = tsSeq[K](tsSymbol[K](rubyIdentifier), tsString[K]("="), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyRange] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K](".."), tsString[K]("...")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsChoice[K](tsString[K](".."), tsString[K]("...")), tsSymbol[K](rubyHidArg)), tsSeq[K](tsSymbol[K](rubyHidArg), tsChoice[K](tsString[K](".."), tsString[K]("..."))))
                                                                 rules[rubyIf] = tsSeq[K](tsString[K]("if"), tsSymbol[K](rubyHidStatement), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)), tsChoice[K](tsChoice[K](tsSymbol[K](rubyElse), tsSymbol[K](rubyElsif)), tsBlank[K]()), tsString[K]("end"))
                                                                 rules[rubyCommandOperatorAssignment] = tsSeq[K](tsSymbol[K](rubyHidLhs), tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("**="), tsString[K]("/="), tsString[K]("||="), tsString[K]("|="), tsString[K]("&&="), tsString[K]("&="), tsString[K]("%="), tsString[K](">>="), tsString[K]("<<="), tsString[K]("^=")), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyDo] = tsSeq[K](tsChoice[K](tsString[K]("do"), tsSymbol[K](rubyHidTerminator)), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K]("end"))
                                                                 rules[rubyRescue] = tsSeq[K](tsString[K]("rescue"), tsChoice[K](tsSymbol[K](rubyExceptions), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyExceptionVariable), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsSymbol[K](rubyThen)))
                                                                 rules[rubySelf] = tsString[K]("self")
                                                                 rules[rubyArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](rubyHidArgumentListWithTrailingComma), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rubyHidArrayPatternN] = tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidPatternExpr), tsString[K](",")), tsSeq[K](tsSymbol[K](rubyHidPatternExpr), tsString[K](","), tsChoice[K](tsSymbol[K](rubyHidPatternExpr), tsSymbol[K](rubyHidArrayPatternN))), tsSeq[K](tsSymbol[K](rubySplatParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidPatternExpr)))))
                                                                 rules[rubyChainedString] = tsSeq[K](tsSymbol[K](rubyString), tsRepeat1[K](tsSymbol[K](rubyString)))
                                                                 rules[rubyHeredocBody] = tsSeq[K](tsSymbol[K](rubyHidHeredocBodyStart), tsRepeat[K](tsChoice[K](tsSymbol[K](rubyHeredocContent), tsSymbol[K](rubyInterpolation), tsSymbol[K](rubyEscapeSequence))), tsSymbol[K](rubyHeredocEnd))
                                                                 rules[rubyHashSplatNil] = tsSeq[K](tsString[K]("**"), tsString[K]("nil"))
                                                                 rules[rubyAlternativePattern] = tsSeq[K](tsSymbol[K](rubyHidPatternExprBasic), tsRepeat1[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](rubyHidPatternExprBasic))))
                                                                 rules[rubyUntilModifier] = tsSeq[K](tsSymbol[K](rubyHidStatement), tsString[K]("until"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyFindPattern] = tsChoice[K](tsSeq[K](tsString[K]("["), tsSymbol[K](rubyHidFindPatternBody), tsString[K]("]")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("["), tsSymbol[K](rubyHidFindPatternBody), tsString[K]("]")), tsSeq[K](tsSymbol[K](rubyHidPatternConstant), tsString[K]("("), tsSymbol[K](rubyHidFindPatternBody), tsString[K](")")))
                                                                 rules[rubyEndBlock] = tsSeq[K](tsString[K]("END"), tsString[K]("{"), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rubyHidSimpleNumeric] = tsChoice[K](tsSymbol[K](rubyInteger), tsSymbol[K](rubyFloat), tsSymbol[K](rubyComplex), tsSymbol[K](rubyRational))
                                                                 rules[rubyParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](rubyHidFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidFormalParameter)))), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rubyYieldCommand] = tsSeq[K](tsString[K]("yield"), tsSymbol[K](rubyCommandArgumentList))
                                                                 rules[rubyBreakCommand] = tsSeq[K](tsString[K]("break"), tsSymbol[K](rubyCommandArgumentList))
                                                                 rules[rubyParenthesizedStatements] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](rubyHidStatements), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rubySuper] = tsString[K]("super")
                                                                 rules[rubyCommandArgumentList] = tsSeq[K](tsSymbol[K](rubyHidArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rubyHidArgument))))
                                                                 rules[rubyEmptyStatement] = tsString[K](";")
                                                                 rules[rubyBreak] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyRetry] = tsSeq[K](tsString[K]("retry"), tsChoice[K](tsSymbol[K](rubyArgumentList), tsBlank[K]()))
                                                                 rules[rubyFloat] = tsRegex[K]("\\d(_?\\d)*(\\.\\d)?(_?\\d)*([eE][\\+-]?\\d(_?\\d)*)?")
                                                                 rules[rubyKeywordPattern] = tsSeq[K](tsChoice[K](tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyConstant), tsSymbol[K](rubyString)), tsString[K](":"), tsChoice[K](tsSymbol[K](rubyHidPatternExpr), tsBlank[K]()))
                                                                 rules[rubyCaseMatch] = tsSeq[K](tsString[K]("case"), tsSymbol[K](rubyHidStatement), tsChoice[K](tsSymbol[K](rubyHidTerminator), tsBlank[K]()), tsRepeat1[K](tsSymbol[K](rubyInClause)), tsChoice[K](tsSymbol[K](rubyElse), tsBlank[K]()), tsString[K]("end"))
                                                                 rules[rubyHidVariable] = tsChoice[K](tsSymbol[K](rubySelf), tsSymbol[K](rubySuper), tsSymbol[K](rubyInstanceVariable), tsSymbol[K](rubyClassVariable), tsSymbol[K](rubyGlobalVariable), tsSymbol[K](rubyIdentifier), tsSymbol[K](rubyConstant))
                                                                 rules[rubyLambda] = tsSeq[K](tsString[K]("->"), tsChoice[K](tsChoice[K](tsSymbol[K](rubyParameters), tsSymbol[K](rubyBareParameters)), tsBlank[K]()), tsChoice[K](tsSymbol[K](rubyBlock), tsSymbol[K](rubyDoBlock)))
                                                                 rules[rubyNextCommand] = tsSeq[K](tsString[K]("next"), tsSymbol[K](rubyCommandArgumentList))
                                                                 rules[rubyUnlessModifier] = tsSeq[K](tsSymbol[K](rubyHidStatement), tsString[K]("unless"), tsSymbol[K](rubyHidExpression))
                                                                 rules[rubyRescueModifierArg] = tsSeq[K](tsSymbol[K](rubyHidArg), tsString[K]("rescue"), tsSymbol[K](rubyHidArg))
                                                                 rules[rubyHidBodyExpr] = tsSeq[K](tsString[K]("="), tsChoice[K](tsSymbol[K](rubyHidArg), tsSymbol[K](rubyRescueModifierArg)))
                                                                 rules[rubyArray] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](rubyHidArgumentListWithTrailingComma), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[rubyHidPrimary] = tsChoice[K](tsSymbol[K](rubyParenthesizedStatements), tsSymbol[K](rubyHidLhs), tsSymbol[K](rubyArray), tsSymbol[K](rubyStringArray), tsSymbol[K](rubySymbolArray), tsSymbol[K](rubyHash), tsSymbol[K](rubySubshell), tsSymbol[K](rubyHidLiteral), tsSymbol[K](rubyString), tsSymbol[K](rubyCharacter), tsSymbol[K](rubyChainedString), tsSymbol[K](rubyRegex), tsSymbol[K](rubyLambda), tsSymbol[K](rubyMethod), tsSymbol[K](rubySingletonMethod), tsSymbol[K](rubyClass), tsSymbol[K](rubySingletonClass), tsSymbol[K](rubyModule), tsSymbol[K](rubyBegin), tsSymbol[K](rubyWhile), tsSymbol[K](rubyUntil), tsSymbol[K](rubyIf), tsSymbol[K](rubyUnless), tsSymbol[K](rubyFor), tsSymbol[K](rubyCase), tsSymbol[K](rubyCaseMatch), tsSymbol[K](rubyReturn), tsSymbol[K](rubyYield), tsSymbol[K](rubyBreak), tsSymbol[K](rubyNext), tsSymbol[K](rubyRedo), tsSymbol[K](rubyRetry), tsSymbol[K](rubyParenthesizedUnary), tsSymbol[K](rubyHeredocBeginning))
                                                                 rules[rubyHidKeywordVariable] = tsChoice[K](tsSymbol[K](rubyNil), tsSymbol[K](rubySelf), tsSymbol[K](rubyTrue), tsSymbol[K](rubyFalse), tsSymbol[K](rubyLine), tsSymbol[K](rubyFile), tsSymbol[K](rubyEncoding))
                                                                 rules[rubyLine] = tsString[K]("__LINE__")
                                                                 rules

