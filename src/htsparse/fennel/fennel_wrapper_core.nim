import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  FennelNodeKind* = enum
    fennelAssignment                 ## assignment
    fennelBinding                    ## binding
    fennelBoolean                    ## boolean
    fennelEach                       ## each
    fennelEachClause                 ## each_clause
    fennelFn                         ## fn
    fennelFor                        ## for
    fennelForClause                  ## for_clause
    fennelGlobal                     ## global
    fennelGuardPattern               ## guard_pattern
    fennelHashfn                     ## hashfn
    fennelLambda                     ## lambda
    fennelLet                        ## let
    fennelLetClause                  ## let_clause
    fennelList                       ## list
    fennelLocal                      ## local
    fennelMatch                      ## match
    fennelMultiSymbol                ## multi_symbol
    fennelMultiSymbolMethod          ## multi_symbol_method
    fennelMultiValueAssignment       ## multi_value_assignment
    fennelMultiValueBinding          ## multi_value_binding
    fennelMultiValuePattern          ## multi_value_pattern
    fennelParameters                 ## parameters
    fennelProgram                    ## program
    fennelQuote                      ## quote
    fennelQuotedList                 ## quoted_list
    fennelQuotedSequentialTable      ## quoted_sequential_table
    fennelQuotedTable                ## quoted_table
    fennelSequentialTable            ## sequential_table
    fennelSequentialTableAssignment  ## sequential_table_assignment
    fennelSequentialTableBinding     ## sequential_table_binding
    fennelSequentialTablePattern     ## sequential_table_pattern
    fennelSet                        ## set
    fennelString                     ## string
    fennelTable                      ## table
    fennelTableAssignment            ## table_assignment
    fennelTableBinding               ## table_binding
    fennelTablePattern               ## table_pattern
    fennelUnquote                    ## unquote
    fennelVar                        ## var
    fennelWherePattern               ## where_pattern
    fennelQuoteTok                   ## "
    fennelHashTok                    ## #
    fennelAmpersandTok               ## &
    fennelAmpersandasTok             ## &as
    fennelApostropheTok              ## '
    fennelLParTok                    ## (
    fennelRParTok                    ## )
    fennelCommaTok                   ## ,
    fennelDotTok                     ## .
    fennelColonTok                   ## :
    fennelColonuntilTok              ## :until
    fennelQuestionTok                ## ?
    fennelLBrackTok                  ## [
    fennelRBrackTok                  ## ]
    fennelBacktickTok                ## `
    fennelComment                    ## comment
    fennelEachTok                    ## each
    fennelEscapeSequence             ## escape_sequence
    fennelFalseTok                   ## false
    fennelFnTok                      ## fn
    fennelForTok                     ## for
    fennelGlobalTok                  ## global
    fennelHashfnTok                  ## hashfn
    fennelLambdaTok                  ## lambda
    fennelLetTok                     ## let
    fennelLocalTok                   ## local
    fennelMatchTok                   ## match
    fennelNil                        ## nil
    fennelNumber                     ## number
    fennelOrTok                      ## or
    fennelSetTok                     ## set
    fennelSymbol                     ## symbol
    fennelTrueTok                    ## true
    fennelVarTok                     ## var
    fennelVararg                     ## vararg
    fennelWhereTok                   ## where
    fennelLCurlyTok                  ## {
    fennelRCurlyTok                  ## }
    fennelλTok                      ## λ
    fennelHidLiteral                 ## _literal
    fennelHidNonMultiValueAssignment ## _non_multi_value_assignment
    fennelHidAssignment              ## _assignment
    fennelHidSpecialForm             ## _special_form
    fennelHidQuotedSexp              ## _quoted_sexp
    fennelHidSexp                    ## _sexp
    fennelHidPattern                 ## _pattern
    fennelHidNonMultiValuePattern    ## _non_multi_value_pattern
    fennelHidFunctionBody            ## _function_body
    fennelHidBinding                 ## _binding
    fennelSymbolImmediate            ## symbol_immediate
    fennelHidNonMultiValueBinding    ## _non_multi_value_binding
    fennelHidSimplePattern           ## _simple_pattern
    fennelSyntaxError                ## Tree-sitter parser syntax error

proc strRepr*(kind: FennelNodeKind): string =
  case kind:
    of fennelAssignment:                 "assignment"
    of fennelBinding:                    "binding"
    of fennelBoolean:                    "boolean"
    of fennelEach:                       "each"
    of fennelEachClause:                 "each_clause"
    of fennelFn:                         "fn"
    of fennelFor:                        "for"
    of fennelForClause:                  "for_clause"
    of fennelGlobal:                     "global"
    of fennelGuardPattern:               "guard_pattern"
    of fennelHashfn:                     "hashfn"
    of fennelLambda:                     "lambda"
    of fennelLet:                        "let"
    of fennelLetClause:                  "let_clause"
    of fennelList:                       "list"
    of fennelLocal:                      "local"
    of fennelMatch:                      "match"
    of fennelMultiSymbol:                "multi_symbol"
    of fennelMultiSymbolMethod:          "multi_symbol_method"
    of fennelMultiValueAssignment:       "multi_value_assignment"
    of fennelMultiValueBinding:          "multi_value_binding"
    of fennelMultiValuePattern:          "multi_value_pattern"
    of fennelParameters:                 "parameters"
    of fennelProgram:                    "program"
    of fennelQuote:                      "quote"
    of fennelQuotedList:                 "quoted_list"
    of fennelQuotedSequentialTable:      "quoted_sequential_table"
    of fennelQuotedTable:                "quoted_table"
    of fennelSequentialTable:            "sequential_table"
    of fennelSequentialTableAssignment:  "sequential_table_assignment"
    of fennelSequentialTableBinding:     "sequential_table_binding"
    of fennelSequentialTablePattern:     "sequential_table_pattern"
    of fennelSet:                        "set"
    of fennelString:                     "string"
    of fennelTable:                      "table"
    of fennelTableAssignment:            "table_assignment"
    of fennelTableBinding:               "table_binding"
    of fennelTablePattern:               "table_pattern"
    of fennelUnquote:                    "unquote"
    of fennelVar:                        "var"
    of fennelWherePattern:               "where_pattern"
    of fennelQuoteTok:                   "\""
    of fennelHashTok:                    "#"
    of fennelAmpersandTok:               "&"
    of fennelAmpersandasTok:             "&as"
    of fennelApostropheTok:              "\'"
    of fennelLParTok:                    "("
    of fennelRParTok:                    ")"
    of fennelCommaTok:                   ","
    of fennelDotTok:                     "."
    of fennelColonTok:                   ":"
    of fennelColonuntilTok:              ":until"
    of fennelQuestionTok:                "?"
    of fennelLBrackTok:                  "["
    of fennelRBrackTok:                  "]"
    of fennelBacktickTok:                "`"
    of fennelComment:                    "comment"
    of fennelEachTok:                    "each"
    of fennelEscapeSequence:             "escape_sequence"
    of fennelFalseTok:                   "false"
    of fennelFnTok:                      "fn"
    of fennelForTok:                     "for"
    of fennelGlobalTok:                  "global"
    of fennelHashfnTok:                  "hashfn"
    of fennelLambdaTok:                  "lambda"
    of fennelLetTok:                     "let"
    of fennelLocalTok:                   "local"
    of fennelMatchTok:                   "match"
    of fennelNil:                        "nil"
    of fennelNumber:                     "number"
    of fennelOrTok:                      "or"
    of fennelSetTok:                     "set"
    of fennelSymbol:                     "symbol"
    of fennelTrueTok:                    "true"
    of fennelVarTok:                     "var"
    of fennelVararg:                     "vararg"
    of fennelWhereTok:                   "where"
    of fennelLCurlyTok:                  "{"
    of fennelRCurlyTok:                  "}"
    of fennelλTok:                       "\xCE\xBB"
    of fennelHidLiteral:                 "_literal"
    of fennelHidNonMultiValueAssignment: "_non_multi_value_assignment"
    of fennelHidAssignment:              "_assignment"
    of fennelHidSpecialForm:             "_special_form"
    of fennelHidQuotedSexp:              "_quoted_sexp"
    of fennelHidSexp:                    "_sexp"
    of fennelHidPattern:                 "_pattern"
    of fennelHidNonMultiValuePattern:    "_non_multi_value_pattern"
    of fennelHidFunctionBody:            "_function_body"
    of fennelHidBinding:                 "_binding"
    of fennelSymbolImmediate:            "symbol_immediate"
    of fennelHidNonMultiValueBinding:    "_non_multi_value_binding"
    of fennelHidSimplePattern:           "_simple_pattern"
    of fennelSyntaxError:                "ERROR"

type
  TsFennelNode* = distinct TSNode

type
  FennelParser* = distinct PtsParser

const fennelAllowedSubnodes*: array[FennelNodeKind, set[FennelNodeKind]] = block:
                                                                             var tmp: array[FennelNodeKind, set[FennelNodeKind]]
                                                                             tmp[fennelAssignment] = {fennelMultiSymbol, fennelSymbol}
                                                                             tmp[fennelBinding] = {fennelSymbol}
                                                                             tmp[fennelEach] = {
                                                                                                 fennelBoolean,
                                                                                                 fennelEach,
                                                                                                 fennelEachClause,
                                                                                                 fennelFn,
                                                                                                 fennelFor,
                                                                                                 fennelGlobal,
                                                                                                 fennelHashfn,
                                                                                                 fennelLambda,
                                                                                                 fennelLet,
                                                                                                 fennelList,
                                                                                                 fennelLocal,
                                                                                                 fennelMatch,
                                                                                                 fennelMultiSymbol,
                                                                                                 fennelNil,
                                                                                                 fennelNumber,
                                                                                                 fennelQuote,
                                                                                                 fennelSequentialTable,
                                                                                                 fennelSet,
                                                                                                 fennelString,
                                                                                                 fennelSymbol,
                                                                                                 fennelTable,
                                                                                                 fennelVar,
                                                                                                 fennelVararg
                                                                                               }
                                                                             tmp[fennelEachClause] = {fennelBinding, fennelMultiValueBinding, fennelSequentialTableBinding, fennelTableBinding}
                                                                             tmp[fennelFn] = {
                                                                                               fennelBoolean,
                                                                                               fennelEach,
                                                                                               fennelFn,
                                                                                               fennelFor,
                                                                                               fennelGlobal,
                                                                                               fennelHashfn,
                                                                                               fennelLambda,
                                                                                               fennelLet,
                                                                                               fennelList,
                                                                                               fennelLocal,
                                                                                               fennelMatch,
                                                                                               fennelMultiSymbol,
                                                                                               fennelNil,
                                                                                               fennelNumber,
                                                                                               fennelParameters,
                                                                                               fennelQuote,
                                                                                               fennelSequentialTable,
                                                                                               fennelSet,
                                                                                               fennelString,
                                                                                               fennelSymbol,
                                                                                               fennelTable,
                                                                                               fennelVar,
                                                                                               fennelVararg
                                                                                             }
                                                                             tmp[fennelFor] = {
                                                                                                fennelBoolean,
                                                                                                fennelEach,
                                                                                                fennelFn,
                                                                                                fennelFor,
                                                                                                fennelForClause,
                                                                                                fennelGlobal,
                                                                                                fennelHashfn,
                                                                                                fennelLambda,
                                                                                                fennelLet,
                                                                                                fennelList,
                                                                                                fennelLocal,
                                                                                                fennelMatch,
                                                                                                fennelMultiSymbol,
                                                                                                fennelNil,
                                                                                                fennelNumber,
                                                                                                fennelQuote,
                                                                                                fennelSequentialTable,
                                                                                                fennelSet,
                                                                                                fennelString,
                                                                                                fennelSymbol,
                                                                                                fennelTable,
                                                                                                fennelVar,
                                                                                                fennelVararg
                                                                                              }
                                                                             tmp[fennelForClause] = {
                                                                                                      fennelBoolean,
                                                                                                      fennelEach,
                                                                                                      fennelFn,
                                                                                                      fennelFor,
                                                                                                      fennelGlobal,
                                                                                                      fennelHashfn,
                                                                                                      fennelLambda,
                                                                                                      fennelLet,
                                                                                                      fennelList,
                                                                                                      fennelLocal,
                                                                                                      fennelMatch,
                                                                                                      fennelMultiSymbol,
                                                                                                      fennelNil,
                                                                                                      fennelNumber,
                                                                                                      fennelQuote,
                                                                                                      fennelSequentialTable,
                                                                                                      fennelSet,
                                                                                                      fennelString,
                                                                                                      fennelSymbol,
                                                                                                      fennelTable,
                                                                                                      fennelVar,
                                                                                                      fennelVararg
                                                                                                    }
                                                                             tmp[fennelGlobal] = {
                                                                                                   fennelBinding,
                                                                                                   fennelBoolean,
                                                                                                   fennelEach,
                                                                                                   fennelFn,
                                                                                                   fennelFor,
                                                                                                   fennelGlobal,
                                                                                                   fennelHashfn,
                                                                                                   fennelLambda,
                                                                                                   fennelLet,
                                                                                                   fennelList,
                                                                                                   fennelLocal,
                                                                                                   fennelMatch,
                                                                                                   fennelMultiSymbol,
                                                                                                   fennelMultiValueBinding,
                                                                                                   fennelNil,
                                                                                                   fennelNumber,
                                                                                                   fennelQuote,
                                                                                                   fennelSequentialTable,
                                                                                                   fennelSequentialTableBinding,
                                                                                                   fennelSet,
                                                                                                   fennelString,
                                                                                                   fennelSymbol,
                                                                                                   fennelTable,
                                                                                                   fennelTableBinding,
                                                                                                   fennelVar,
                                                                                                   fennelVararg
                                                                                                 }
                                                                             tmp[fennelGuardPattern] = {
                                                                                                         fennelBoolean,
                                                                                                         fennelMultiSymbol,
                                                                                                         fennelMultiValuePattern,
                                                                                                         fennelNil,
                                                                                                         fennelNumber,
                                                                                                         fennelSequentialTablePattern,
                                                                                                         fennelString,
                                                                                                         fennelSymbol,
                                                                                                         fennelTablePattern,
                                                                                                         fennelVararg
                                                                                                       }
                                                                             tmp[fennelHashfn] = {
                                                                                                   fennelBoolean,
                                                                                                   fennelEach,
                                                                                                   fennelFn,
                                                                                                   fennelFor,
                                                                                                   fennelGlobal,
                                                                                                   fennelHashfn,
                                                                                                   fennelLambda,
                                                                                                   fennelLet,
                                                                                                   fennelList,
                                                                                                   fennelLocal,
                                                                                                   fennelMatch,
                                                                                                   fennelMultiSymbol,
                                                                                                   fennelNil,
                                                                                                   fennelNumber,
                                                                                                   fennelQuote,
                                                                                                   fennelSequentialTable,
                                                                                                   fennelSet,
                                                                                                   fennelString,
                                                                                                   fennelSymbol,
                                                                                                   fennelTable,
                                                                                                   fennelVar,
                                                                                                   fennelVararg
                                                                                                 }
                                                                             tmp[fennelLambda] = {
                                                                                                   fennelBoolean,
                                                                                                   fennelEach,
                                                                                                   fennelFn,
                                                                                                   fennelFor,
                                                                                                   fennelGlobal,
                                                                                                   fennelHashfn,
                                                                                                   fennelLambda,
                                                                                                   fennelLet,
                                                                                                   fennelList,
                                                                                                   fennelLocal,
                                                                                                   fennelMatch,
                                                                                                   fennelMultiSymbol,
                                                                                                   fennelNil,
                                                                                                   fennelNumber,
                                                                                                   fennelParameters,
                                                                                                   fennelQuote,
                                                                                                   fennelSequentialTable,
                                                                                                   fennelSet,
                                                                                                   fennelString,
                                                                                                   fennelSymbol,
                                                                                                   fennelTable,
                                                                                                   fennelVar,
                                                                                                   fennelVararg
                                                                                                 }
                                                                             tmp[fennelLet] = {
                                                                                                fennelBoolean,
                                                                                                fennelEach,
                                                                                                fennelFn,
                                                                                                fennelFor,
                                                                                                fennelGlobal,
                                                                                                fennelHashfn,
                                                                                                fennelLambda,
                                                                                                fennelLet,
                                                                                                fennelLetClause,
                                                                                                fennelList,
                                                                                                fennelLocal,
                                                                                                fennelMatch,
                                                                                                fennelMultiSymbol,
                                                                                                fennelNil,
                                                                                                fennelNumber,
                                                                                                fennelQuote,
                                                                                                fennelSequentialTable,
                                                                                                fennelSet,
                                                                                                fennelString,
                                                                                                fennelSymbol,
                                                                                                fennelTable,
                                                                                                fennelVar,
                                                                                                fennelVararg
                                                                                              }
                                                                             tmp[fennelLetClause] = {
                                                                                                      fennelBinding,
                                                                                                      fennelBoolean,
                                                                                                      fennelEach,
                                                                                                      fennelFn,
                                                                                                      fennelFor,
                                                                                                      fennelGlobal,
                                                                                                      fennelHashfn,
                                                                                                      fennelLambda,
                                                                                                      fennelLet,
                                                                                                      fennelList,
                                                                                                      fennelLocal,
                                                                                                      fennelMatch,
                                                                                                      fennelMultiSymbol,
                                                                                                      fennelMultiValueBinding,
                                                                                                      fennelNil,
                                                                                                      fennelNumber,
                                                                                                      fennelQuote,
                                                                                                      fennelSequentialTable,
                                                                                                      fennelSequentialTableBinding,
                                                                                                      fennelSet,
                                                                                                      fennelString,
                                                                                                      fennelSymbol,
                                                                                                      fennelTable,
                                                                                                      fennelTableBinding,
                                                                                                      fennelVar,
                                                                                                      fennelVararg
                                                                                                    }
                                                                             tmp[fennelList] = {
                                                                                                 fennelBoolean,
                                                                                                 fennelEach,
                                                                                                 fennelFn,
                                                                                                 fennelFor,
                                                                                                 fennelGlobal,
                                                                                                 fennelHashfn,
                                                                                                 fennelLambda,
                                                                                                 fennelLet,
                                                                                                 fennelList,
                                                                                                 fennelLocal,
                                                                                                 fennelMatch,
                                                                                                 fennelMultiSymbol,
                                                                                                 fennelMultiSymbolMethod,
                                                                                                 fennelNil,
                                                                                                 fennelNumber,
                                                                                                 fennelQuote,
                                                                                                 fennelSequentialTable,
                                                                                                 fennelSet,
                                                                                                 fennelString,
                                                                                                 fennelSymbol,
                                                                                                 fennelTable,
                                                                                                 fennelVar,
                                                                                                 fennelVararg
                                                                                               }
                                                                             tmp[fennelLocal] = {
                                                                                                  fennelBinding,
                                                                                                  fennelBoolean,
                                                                                                  fennelEach,
                                                                                                  fennelFn,
                                                                                                  fennelFor,
                                                                                                  fennelGlobal,
                                                                                                  fennelHashfn,
                                                                                                  fennelLambda,
                                                                                                  fennelLet,
                                                                                                  fennelList,
                                                                                                  fennelLocal,
                                                                                                  fennelMatch,
                                                                                                  fennelMultiSymbol,
                                                                                                  fennelMultiValueBinding,
                                                                                                  fennelNil,
                                                                                                  fennelNumber,
                                                                                                  fennelQuote,
                                                                                                  fennelSequentialTable,
                                                                                                  fennelSequentialTableBinding,
                                                                                                  fennelSet,
                                                                                                  fennelString,
                                                                                                  fennelSymbol,
                                                                                                  fennelTable,
                                                                                                  fennelTableBinding,
                                                                                                  fennelVar,
                                                                                                  fennelVararg
                                                                                                }
                                                                             tmp[fennelMatch] = {
                                                                                                  fennelBoolean,
                                                                                                  fennelEach,
                                                                                                  fennelFn,
                                                                                                  fennelFor,
                                                                                                  fennelGlobal,
                                                                                                  fennelGuardPattern,
                                                                                                  fennelHashfn,
                                                                                                  fennelLambda,
                                                                                                  fennelLet,
                                                                                                  fennelList,
                                                                                                  fennelLocal,
                                                                                                  fennelMatch,
                                                                                                  fennelMultiSymbol,
                                                                                                  fennelMultiValuePattern,
                                                                                                  fennelNil,
                                                                                                  fennelNumber,
                                                                                                  fennelQuote,
                                                                                                  fennelSequentialTable,
                                                                                                  fennelSequentialTablePattern,
                                                                                                  fennelSet,
                                                                                                  fennelString,
                                                                                                  fennelSymbol,
                                                                                                  fennelTable,
                                                                                                  fennelTablePattern,
                                                                                                  fennelVar,
                                                                                                  fennelVararg,
                                                                                                  fennelWherePattern
                                                                                                }
                                                                             tmp[fennelMultiSymbol] = {fennelSymbol}
                                                                             tmp[fennelMultiSymbolMethod] = {fennelMultiSymbol, fennelSymbol}
                                                                             tmp[fennelMultiValueAssignment] = {fennelAssignment, fennelSequentialTableAssignment, fennelTableAssignment}
                                                                             tmp[fennelMultiValueBinding] = {fennelBinding, fennelSequentialTableBinding, fennelTableBinding}
                                                                             tmp[fennelMultiValuePattern] = {
                                                                                                              fennelBoolean,
                                                                                                              fennelMultiSymbol,
                                                                                                              fennelNil,
                                                                                                              fennelNumber,
                                                                                                              fennelSequentialTablePattern,
                                                                                                              fennelString,
                                                                                                              fennelSymbol,
                                                                                                              fennelTablePattern,
                                                                                                              fennelVararg
                                                                                                            }
                                                                             tmp[fennelParameters] = {fennelBinding, fennelMultiValueBinding, fennelSequentialTableBinding, fennelTableBinding, fennelVararg}
                                                                             tmp[fennelProgram] = {
                                                                                                    fennelBoolean,
                                                                                                    fennelEach,
                                                                                                    fennelFn,
                                                                                                    fennelFor,
                                                                                                    fennelGlobal,
                                                                                                    fennelHashfn,
                                                                                                    fennelLambda,
                                                                                                    fennelLet,
                                                                                                    fennelList,
                                                                                                    fennelLocal,
                                                                                                    fennelMatch,
                                                                                                    fennelMultiSymbol,
                                                                                                    fennelNil,
                                                                                                    fennelNumber,
                                                                                                    fennelQuote,
                                                                                                    fennelSequentialTable,
                                                                                                    fennelSet,
                                                                                                    fennelString,
                                                                                                    fennelSymbol,
                                                                                                    fennelTable,
                                                                                                    fennelVar,
                                                                                                    fennelVararg
                                                                                                  }
                                                                             tmp[fennelQuote] = {
                                                                                                  fennelBoolean,
                                                                                                  fennelMultiSymbol,
                                                                                                  fennelMultiSymbolMethod,
                                                                                                  fennelNil,
                                                                                                  fennelNumber,
                                                                                                  fennelQuotedList,
                                                                                                  fennelQuotedSequentialTable,
                                                                                                  fennelQuotedTable,
                                                                                                  fennelString,
                                                                                                  fennelSymbol,
                                                                                                  fennelUnquote,
                                                                                                  fennelVararg
                                                                                                }
                                                                             tmp[fennelQuotedList] = {
                                                                                                       fennelBoolean,
                                                                                                       fennelMultiSymbol,
                                                                                                       fennelMultiSymbolMethod,
                                                                                                       fennelNil,
                                                                                                       fennelNumber,
                                                                                                       fennelQuotedList,
                                                                                                       fennelQuotedSequentialTable,
                                                                                                       fennelQuotedTable,
                                                                                                       fennelString,
                                                                                                       fennelSymbol,
                                                                                                       fennelUnquote,
                                                                                                       fennelVararg
                                                                                                     }
                                                                             tmp[fennelQuotedSequentialTable] = {
                                                                                                                  fennelBoolean,
                                                                                                                  fennelMultiSymbol,
                                                                                                                  fennelMultiSymbolMethod,
                                                                                                                  fennelNil,
                                                                                                                  fennelNumber,
                                                                                                                  fennelQuotedList,
                                                                                                                  fennelQuotedSequentialTable,
                                                                                                                  fennelQuotedTable,
                                                                                                                  fennelString,
                                                                                                                  fennelSymbol,
                                                                                                                  fennelUnquote,
                                                                                                                  fennelVararg
                                                                                                                }
                                                                             tmp[fennelQuotedTable] = {
                                                                                                        fennelBoolean,
                                                                                                        fennelMultiSymbol,
                                                                                                        fennelMultiSymbolMethod,
                                                                                                        fennelNil,
                                                                                                        fennelNumber,
                                                                                                        fennelQuotedList,
                                                                                                        fennelQuotedSequentialTable,
                                                                                                        fennelQuotedTable,
                                                                                                        fennelString,
                                                                                                        fennelSymbol,
                                                                                                        fennelUnquote,
                                                                                                        fennelVararg
                                                                                                      }
                                                                             tmp[fennelSequentialTable] = {
                                                                                                            fennelBoolean,
                                                                                                            fennelEach,
                                                                                                            fennelFn,
                                                                                                            fennelFor,
                                                                                                            fennelGlobal,
                                                                                                            fennelHashfn,
                                                                                                            fennelLambda,
                                                                                                            fennelLet,
                                                                                                            fennelList,
                                                                                                            fennelLocal,
                                                                                                            fennelMatch,
                                                                                                            fennelMultiSymbol,
                                                                                                            fennelNil,
                                                                                                            fennelNumber,
                                                                                                            fennelQuote,
                                                                                                            fennelSequentialTable,
                                                                                                            fennelSet,
                                                                                                            fennelString,
                                                                                                            fennelSymbol,
                                                                                                            fennelTable,
                                                                                                            fennelVar,
                                                                                                            fennelVararg
                                                                                                          }
                                                                             tmp[fennelSequentialTableAssignment] = {fennelAssignment, fennelSequentialTableAssignment, fennelTableAssignment}
                                                                             tmp[fennelSequentialTableBinding] = {fennelBinding, fennelSequentialTableBinding, fennelTableBinding}
                                                                             tmp[fennelSequentialTablePattern] = {
                                                                                                                   fennelBoolean,
                                                                                                                   fennelMultiSymbol,
                                                                                                                   fennelNil,
                                                                                                                   fennelNumber,
                                                                                                                   fennelSequentialTablePattern,
                                                                                                                   fennelString,
                                                                                                                   fennelSymbol,
                                                                                                                   fennelTablePattern,
                                                                                                                   fennelVararg
                                                                                                                 }
                                                                             tmp[fennelSet] = {
                                                                                                fennelAssignment,
                                                                                                fennelBoolean,
                                                                                                fennelEach,
                                                                                                fennelFn,
                                                                                                fennelFor,
                                                                                                fennelGlobal,
                                                                                                fennelHashfn,
                                                                                                fennelLambda,
                                                                                                fennelLet,
                                                                                                fennelList,
                                                                                                fennelLocal,
                                                                                                fennelMatch,
                                                                                                fennelMultiSymbol,
                                                                                                fennelMultiValueAssignment,
                                                                                                fennelNil,
                                                                                                fennelNumber,
                                                                                                fennelQuote,
                                                                                                fennelSequentialTable,
                                                                                                fennelSequentialTableAssignment,
                                                                                                fennelSet,
                                                                                                fennelString,
                                                                                                fennelSymbol,
                                                                                                fennelTable,
                                                                                                fennelTableAssignment,
                                                                                                fennelVar,
                                                                                                fennelVararg
                                                                                              }
                                                                             tmp[fennelString] = {fennelEscapeSequence}
                                                                             tmp[fennelTable] = {
                                                                                                  fennelBoolean,
                                                                                                  fennelEach,
                                                                                                  fennelFn,
                                                                                                  fennelFor,
                                                                                                  fennelGlobal,
                                                                                                  fennelHashfn,
                                                                                                  fennelLambda,
                                                                                                  fennelLet,
                                                                                                  fennelList,
                                                                                                  fennelLocal,
                                                                                                  fennelMatch,
                                                                                                  fennelMultiSymbol,
                                                                                                  fennelNil,
                                                                                                  fennelNumber,
                                                                                                  fennelQuote,
                                                                                                  fennelSequentialTable,
                                                                                                  fennelSet,
                                                                                                  fennelString,
                                                                                                  fennelSymbol,
                                                                                                  fennelTable,
                                                                                                  fennelVar,
                                                                                                  fennelVararg
                                                                                                }
                                                                             tmp[fennelTableAssignment] = {
                                                                                                            fennelAssignment,
                                                                                                            fennelBoolean,
                                                                                                            fennelEach,
                                                                                                            fennelFn,
                                                                                                            fennelFor,
                                                                                                            fennelGlobal,
                                                                                                            fennelHashfn,
                                                                                                            fennelLambda,
                                                                                                            fennelLet,
                                                                                                            fennelList,
                                                                                                            fennelLocal,
                                                                                                            fennelMatch,
                                                                                                            fennelMultiSymbol,
                                                                                                            fennelNil,
                                                                                                            fennelNumber,
                                                                                                            fennelQuote,
                                                                                                            fennelSequentialTable,
                                                                                                            fennelSequentialTableAssignment,
                                                                                                            fennelSet,
                                                                                                            fennelString,
                                                                                                            fennelSymbol,
                                                                                                            fennelTable,
                                                                                                            fennelTableAssignment,
                                                                                                            fennelVar,
                                                                                                            fennelVararg
                                                                                                          }
                                                                             tmp[fennelTableBinding] = {
                                                                                                         fennelBinding,
                                                                                                         fennelBoolean,
                                                                                                         fennelEach,
                                                                                                         fennelFn,
                                                                                                         fennelFor,
                                                                                                         fennelGlobal,
                                                                                                         fennelHashfn,
                                                                                                         fennelLambda,
                                                                                                         fennelLet,
                                                                                                         fennelList,
                                                                                                         fennelLocal,
                                                                                                         fennelMatch,
                                                                                                         fennelMultiSymbol,
                                                                                                         fennelNil,
                                                                                                         fennelNumber,
                                                                                                         fennelQuote,
                                                                                                         fennelSequentialTable,
                                                                                                         fennelSequentialTableBinding,
                                                                                                         fennelSet,
                                                                                                         fennelString,
                                                                                                         fennelSymbol,
                                                                                                         fennelTable,
                                                                                                         fennelTableBinding,
                                                                                                         fennelVar,
                                                                                                         fennelVararg
                                                                                                       }
                                                                             tmp[fennelTablePattern] = {
                                                                                                         fennelBoolean,
                                                                                                         fennelEach,
                                                                                                         fennelFn,
                                                                                                         fennelFor,
                                                                                                         fennelGlobal,
                                                                                                         fennelHashfn,
                                                                                                         fennelLambda,
                                                                                                         fennelLet,
                                                                                                         fennelList,
                                                                                                         fennelLocal,
                                                                                                         fennelMatch,
                                                                                                         fennelMultiSymbol,
                                                                                                         fennelMultiValuePattern,
                                                                                                         fennelNil,
                                                                                                         fennelNumber,
                                                                                                         fennelQuote,
                                                                                                         fennelSequentialTable,
                                                                                                         fennelSequentialTablePattern,
                                                                                                         fennelSet,
                                                                                                         fennelString,
                                                                                                         fennelSymbol,
                                                                                                         fennelTable,
                                                                                                         fennelTablePattern,
                                                                                                         fennelVar,
                                                                                                         fennelVararg
                                                                                                       }
                                                                             tmp[fennelUnquote] = {
                                                                                                    fennelBoolean,
                                                                                                    fennelEach,
                                                                                                    fennelFn,
                                                                                                    fennelFor,
                                                                                                    fennelGlobal,
                                                                                                    fennelHashfn,
                                                                                                    fennelLambda,
                                                                                                    fennelLet,
                                                                                                    fennelList,
                                                                                                    fennelLocal,
                                                                                                    fennelMatch,
                                                                                                    fennelMultiSymbol,
                                                                                                    fennelNil,
                                                                                                    fennelNumber,
                                                                                                    fennelQuote,
                                                                                                    fennelSequentialTable,
                                                                                                    fennelSet,
                                                                                                    fennelString,
                                                                                                    fennelSymbol,
                                                                                                    fennelTable,
                                                                                                    fennelVar,
                                                                                                    fennelVararg
                                                                                                  }
                                                                             tmp[fennelVar] = {
                                                                                                fennelBinding,
                                                                                                fennelBoolean,
                                                                                                fennelEach,
                                                                                                fennelFn,
                                                                                                fennelFor,
                                                                                                fennelGlobal,
                                                                                                fennelHashfn,
                                                                                                fennelLambda,
                                                                                                fennelLet,
                                                                                                fennelList,
                                                                                                fennelLocal,
                                                                                                fennelMatch,
                                                                                                fennelMultiSymbol,
                                                                                                fennelMultiValueBinding,
                                                                                                fennelNil,
                                                                                                fennelNumber,
                                                                                                fennelQuote,
                                                                                                fennelSequentialTable,
                                                                                                fennelSequentialTableBinding,
                                                                                                fennelSet,
                                                                                                fennelString,
                                                                                                fennelSymbol,
                                                                                                fennelTable,
                                                                                                fennelTableBinding,
                                                                                                fennelVar,
                                                                                                fennelVararg
                                                                                              }
                                                                             tmp[fennelWherePattern] = {
                                                                                                         fennelBoolean,
                                                                                                         fennelMultiSymbol,
                                                                                                         fennelMultiValuePattern,
                                                                                                         fennelNil,
                                                                                                         fennelNumber,
                                                                                                         fennelSequentialTablePattern,
                                                                                                         fennelString,
                                                                                                         fennelSymbol,
                                                                                                         fennelTablePattern,
                                                                                                         fennelVararg
                                                                                                       }
                                                                             tmp
const fennelTokenKinds*: set[FennelNodeKind] = {
                                                 fennelQuoteTok,
                                                 fennelHashTok,
                                                 fennelAmpersandTok,
                                                 fennelAmpersandasTok,
                                                 fennelApostropheTok,
                                                 fennelLParTok,
                                                 fennelRParTok,
                                                 fennelCommaTok,
                                                 fennelDotTok,
                                                 fennelColonTok,
                                                 fennelColonuntilTok,
                                                 fennelQuestionTok,
                                                 fennelLBrackTok,
                                                 fennelRBrackTok,
                                                 fennelBacktickTok,
                                                 fennelEachTok,
                                                 fennelFalseTok,
                                                 fennelFnTok,
                                                 fennelForTok,
                                                 fennelGlobalTok,
                                                 fennelHashfnTok,
                                                 fennelLambdaTok,
                                                 fennelLetTok,
                                                 fennelLocalTok,
                                                 fennelMatchTok,
                                                 fennelOrTok,
                                                 fennelQuoteTok,
                                                 fennelSetTok,
                                                 fennelTrueTok,
                                                 fennelVarTok,
                                                 fennelWhereTok,
                                                 fennelLCurlyTok,
                                                 fennelRCurlyTok,
                                                 fennelλTok
                                               }
const fennelHiddenKinds*: set[FennelNodeKind] = {
                                                  fennelHidLiteral,
                                                  fennelHidNonMultiValueAssignment,
                                                  fennelHidAssignment,
                                                  fennelHidSpecialForm,
                                                  fennelHidQuotedSexp,
                                                  fennelHidSexp,
                                                  fennelHidPattern,
                                                  fennelHidNonMultiValuePattern,
                                                  fennelHidFunctionBody,
                                                  fennelHidBinding,
                                                  fennelSymbolImmediate,
                                                  fennelHidNonMultiValueBinding,
                                                  fennelHidSimplePattern
                                                }
proc tsNodeType*(node: TsFennelNode): string


proc kind*(node: TsFennelNode): FennelNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "assignment":                  fennelAssignment
      of "binding":                     fennelBinding
      of "boolean":                     fennelBoolean
      of "each":                        fennelEach
      of "each_clause":                 fennelEachClause
      of "fn":                          fennelFn
      of "for":                         fennelFor
      of "for_clause":                  fennelForClause
      of "global":                      fennelGlobal
      of "guard_pattern":               fennelGuardPattern
      of "hashfn":                      fennelHashfn
      of "lambda":                      fennelLambda
      of "let":                         fennelLet
      of "let_clause":                  fennelLetClause
      of "list":                        fennelList
      of "local":                       fennelLocal
      of "match":                       fennelMatch
      of "multi_symbol":                fennelMultiSymbol
      of "multi_symbol_method":         fennelMultiSymbolMethod
      of "multi_value_assignment":      fennelMultiValueAssignment
      of "multi_value_binding":         fennelMultiValueBinding
      of "multi_value_pattern":         fennelMultiValuePattern
      of "parameters":                  fennelParameters
      of "program":                     fennelProgram
      of "quote":                       fennelQuote
      of "quoted_list":                 fennelQuotedList
      of "quoted_sequential_table":     fennelQuotedSequentialTable
      of "quoted_table":                fennelQuotedTable
      of "sequential_table":            fennelSequentialTable
      of "sequential_table_assignment": fennelSequentialTableAssignment
      of "sequential_table_binding":    fennelSequentialTableBinding
      of "sequential_table_pattern":    fennelSequentialTablePattern
      of "set":                         fennelSet
      of "string":                      fennelString
      of "table":                       fennelTable
      of "table_assignment":            fennelTableAssignment
      of "table_binding":               fennelTableBinding
      of "table_pattern":               fennelTablePattern
      of "unquote":                     fennelUnquote
      of "var":                         fennelVar
      of "where_pattern":               fennelWherePattern
      of "\"":                          fennelQuoteTok
      of "#":                           fennelHashTok
      of "&":                           fennelAmpersandTok
      of "&as":                         fennelAmpersandasTok
      of "\'":                          fennelApostropheTok
      of "(":                           fennelLParTok
      of ")":                           fennelRParTok
      of ",":                           fennelCommaTok
      of ".":                           fennelDotTok
      of ":":                           fennelColonTok
      of ":until":                      fennelColonuntilTok
      of "?":                           fennelQuestionTok
      of "[":                           fennelLBrackTok
      of "]":                           fennelRBrackTok
      of "`":                           fennelBacktickTok
      of "comment":                     fennelComment
      of "escape_sequence":             fennelEscapeSequence
      of "false":                       fennelFalseTok
      of "nil":                         fennelNil
      of "number":                      fennelNumber
      of "or":                          fennelOrTok
      of "symbol":                      fennelSymbol
      of "true":                        fennelTrueTok
      of "vararg":                      fennelVararg
      of "where":                       fennelWhereTok
      of "{":                           fennelLCurlyTok
      of "}":                           fennelRCurlyTok
      of "\xCE\xBB":                    fennelλTok
      of "ERROR":                       fennelSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsFennelNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsFennelNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsFennelNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_fennel(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsFennelNode): string =
  $ts_node_type(TSNode(node))

proc newTsFennelParser*(): FennelParser =
  result = FennelParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_fennel())

proc parseString*(parser: FennelParser, str: string): TsFennelNode =
  TsFennelNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsFennelString*(str: string): TsFennelNode =
  let parser = newTsFennelParser()
  return parseString(parser, str)

func `$`*(node: TsFennelNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsFennelNode, str: string): string =
  var res = addr result
  proc aux(node: TsFennelNode, level: int) =
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
let fennelGrammar*: array[FennelNodeKind, HtsRule[FennelNodeKind]] = block:
                                                                       var rules: array[FennelNodeKind, HtsRule[FennelNodeKind]]
                                                                       type
                                                                         K = FennelNodeKind


                                                                       rules[fennelQuotedSequentialTable] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidQuotedSexp)), tsString[K]("]"))
                                                                       rules[fennelFn] = tsSeq[K](tsString[K]("("), tsString[K]("fn"), tsSymbol[K](fennelHidFunctionBody), tsString[K](")"))
                                                                       rules[fennelHidLiteral] = tsChoice[K](tsSymbol[K](fennelString), tsSymbol[K](fennelNumber), tsSymbol[K](fennelBoolean), tsSymbol[K](fennelVararg), tsSymbol[K](fennelNil))
                                                                       rules[fennelForClause] = tsSeq[K](tsString[K]("["), tsSymbol[K](fennelSymbol), tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelHidSexp), tsChoice[K](tsSymbol[K](fennelHidSexp), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[fennelSymbol] = tsChoice[K](tsString[K](":"), tsSeq[K](tsString[K]("."), tsRegex[K]("[^(){}\\[\\]\"\'~;,@`\\s]*")), tsRegex[K]("[^#(){}\\[\\]\"\'~;,@`.:\\s][^(){}\\[\\]\"\'~;,@`.:\\s]*"))
                                                                       rules[fennelVar] = tsSeq[K](tsString[K]("("), tsString[K]("var"), tsSymbol[K](fennelHidBinding), tsSymbol[K](fennelHidSexp), tsString[K](")"))
                                                                       rules[fennelHidNonMultiValueAssignment] = tsChoice[K](tsSymbol[K](fennelAssignment), tsSymbol[K](fennelSequentialTableAssignment), tsSymbol[K](fennelTableAssignment))
                                                                       rules[fennelLocal] = tsSeq[K](tsString[K]("("), tsString[K]("local"), tsSymbol[K](fennelHidBinding), tsSymbol[K](fennelHidSexp), tsString[K](")"))
                                                                       rules[fennelHidAssignment] = tsChoice[K](tsSymbol[K](fennelMultiValueAssignment), tsSymbol[K](fennelHidNonMultiValueAssignment))
                                                                       rules[fennelWherePattern] = tsSeq[K](tsString[K]("("), tsString[K]("where"), tsChoice[K](tsSymbol[K](fennelHidSimplePattern), tsSeq[K](tsString[K]("("), tsString[K]("or"), tsRepeat[K](tsSymbol[K](fennelHidSimplePattern)), tsString[K](")"))), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelUnquote] = tsSeq[K](tsString[K](","), tsSymbol[K](fennelHidSexp))
                                                                       rules[fennelMultiSymbol] = tsSeq[K](tsSymbol[K](fennelSymbol), tsRepeat1[K](tsSeq[K](tsString[K]("."), tsSymbol[K](fennelSymbolImmediate))))
                                                                       rules[fennelMultiSymbolMethod] = tsSeq[K](tsChoice[K](tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol)), tsString[K](":"), tsSymbol[K](fennelSymbolImmediate))
                                                                       rules[fennelString] = tsChoice[K](tsRegex[K](":[^(){}\\[\\]\"\'~;,@`\\s]+"), tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"\\\\]+"), tsSymbol[K](fennelEscapeSequence))), tsString[K]("\"")))
                                                                       rules[fennelHidSpecialForm] = tsChoice[K](tsSymbol[K](fennelFn), tsSymbol[K](fennelLambda), tsSymbol[K](fennelHashfn), tsSymbol[K](fennelMatch), tsSymbol[K](fennelLet), tsSymbol[K](fennelGlobal), tsSymbol[K](fennelLocal), tsSymbol[K](fennelVar), tsSymbol[K](fennelSet), tsSymbol[K](fennelEach), tsSymbol[K](fennelFor), tsSymbol[K](fennelQuote))
                                                                       rules[fennelBoolean] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                       rules[fennelHidQuotedSexp] = tsChoice[K](tsSymbol[K](fennelUnquote), tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol), tsSymbol[K](fennelMultiSymbolMethod), tsSymbol[K](fennelQuotedList), tsSymbol[K](fennelQuotedSequentialTable), tsSymbol[K](fennelQuotedTable), tsSymbol[K](fennelHidLiteral))
                                                                       rules[fennelHashfn] = tsChoice[K](tsSeq[K](tsString[K]("("), tsString[K]("hashfn"), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")")), tsSeq[K](tsString[K]("#"), tsSymbol[K](fennelHidSexp)))
                                                                       rules[fennelFor] = tsSeq[K](tsString[K]("("), tsString[K]("for"), tsSymbol[K](fennelForClause), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelLet] = tsSeq[K](tsString[K]("("), tsString[K]("let"), tsSymbol[K](fennelLetClause), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelVararg] = tsString[K]("...")
                                                                       rules[fennelEach] = tsSeq[K](tsString[K]("("), tsString[K]("each"), tsSymbol[K](fennelEachClause), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu\\d]"), tsRegex[K]("\\d{1,3}"), tsRegex[K]("x[\\da-fA-F]{2}"), tsRegex[K]("u{[\\da-fA-F]+}")))
                                                                       rules[fennelBinding] = tsSymbol[K](fennelSymbol)
                                                                       rules[fennelGuardPattern] = tsSeq[K](tsString[K]("("), tsSymbol[K](fennelHidSimplePattern), tsString[K]("?"), tsRepeat1[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelMultiValueBinding] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValueBinding)), tsString[K](")"))
                                                                       rules[fennelHidSexp] = tsChoice[K](tsSymbol[K](fennelHidSpecialForm), tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol), tsSymbol[K](fennelList), tsSymbol[K](fennelSequentialTable), tsSymbol[K](fennelTable), tsSymbol[K](fennelHidLiteral))
                                                                       rules[fennelComment] = tsSeq[K](tsString[K](";"), tsRegex[K](".*"))
                                                                       rules[fennelNil] = tsString[K]("nil")
                                                                       rules[fennelEachClause] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidBinding)), tsSymbol[K](fennelHidSexp), tsChoice[K](tsSeq[K](tsString[K](":until"), tsSymbol[K](fennelHidSexp)), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[fennelTableBinding] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](fennelBinding)), tsSeq[K](tsString[K]("&as"), tsSymbol[K](fennelBinding)), tsSeq[K](tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelHidNonMultiValueBinding)))), tsString[K]("}"))
                                                                       rules[fennelSequentialTablePattern] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValuePattern)), tsString[K]("]"))
                                                                       rules[fennelTablePattern] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](fennelHidSimplePattern)), tsSeq[K](tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelHidNonMultiValuePattern)))), tsString[K]("}"))
                                                                       rules[fennelQuotedTable] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](fennelHidQuotedSexp)), tsString[K]("}"))
                                                                       rules[fennelParameters] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsChoice[K](tsSymbol[K](fennelHidBinding), tsSymbol[K](fennelVararg))), tsString[K]("]"))
                                                                       rules[fennelNumber] = tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsChoice[K](tsRegex[K]("\\d[_\\d]*"), tsSeq[K](tsString[K]("."), tsRegex[K]("\\d[_\\d]*")), tsSeq[K](tsRegex[K]("\\d[_\\d]*"), tsString[K]("."), tsChoice[K](tsRegex[K]("\\d[_\\d]*"), tsBlank[K]()))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("\\d[_\\d]*")), tsBlank[K]())), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsChoice[K](tsRegex[K]("[a-fA-F\\d][_a-fA-F\\d]*"), tsSeq[K](tsString[K]("."), tsRegex[K]("[a-fA-F\\d][_a-fA-F\\d]*")), tsSeq[K](tsRegex[K]("[a-fA-F\\d][_a-fA-F\\d]*"), tsString[K]("."), tsChoice[K](tsRegex[K]("[a-fA-F\\d][_a-fA-F\\d]*"), tsBlank[K]()))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("p"), tsString[K]("P")), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("[a-fA-F\\d][_a-fA-F\\d]*")), tsBlank[K]())))
                                                                       rules[fennelMatch] = tsSeq[K](tsString[K]("("), tsString[K]("match"), tsSymbol[K](fennelHidSexp), tsRepeat[K](tsSeq[K](tsSymbol[K](fennelHidPattern), tsSymbol[K](fennelHidSexp))), tsString[K](")"))
                                                                       rules[fennelQuotedList] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](fennelHidQuotedSexp)), tsString[K](")"))
                                                                       rules[fennelAssignment] = tsChoice[K](tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol))
                                                                       rules[fennelHidPattern] = tsChoice[K](tsSymbol[K](fennelHidSimplePattern), tsSymbol[K](fennelWherePattern), tsSymbol[K](fennelGuardPattern))
                                                                       rules[fennelQuote] = tsChoice[K](tsSeq[K](tsString[K]("("), tsString[K]("quote"), tsSymbol[K](fennelHidQuotedSexp), tsString[K](")")), tsSeq[K](tsChoice[K](tsString[K]("\'"), tsString[K]("`")), tsSymbol[K](fennelHidQuotedSexp)))
                                                                       rules[fennelTable] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsString[K](":"), tsChoice[K](tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol))), tsSeq[K](tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelHidSexp)))), tsString[K]("}"))
                                                                       rules[fennelMultiValuePattern] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValuePattern)), tsString[K](")"))
                                                                       rules[fennelHidNonMultiValuePattern] = tsChoice[K](tsSymbol[K](fennelHidLiteral), tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol), tsSymbol[K](fennelSequentialTablePattern), tsSymbol[K](fennelTablePattern))
                                                                       rules[fennelHidFunctionBody] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](fennelSymbol), tsSymbol[K](fennelMultiSymbol)), tsBlank[K]()), tsSymbol[K](fennelParameters), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](fennelString), tsBlank[K]()), tsRepeat1[K](tsSymbol[K](fennelHidSexp))), tsBlank[K]()))
                                                                       rules[fennelSequentialTable] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K]("]"))
                                                                       rules[fennelSet] = tsSeq[K](tsString[K]("("), tsString[K]("set"), tsSymbol[K](fennelHidAssignment), tsSymbol[K](fennelHidSexp), tsString[K](")"))
                                                                       rules[fennelLambda] = tsSeq[K](tsString[K]("("), tsChoice[K](tsString[K]("lambda"), tsString[K]("\xCE\xBB")), tsSymbol[K](fennelHidFunctionBody), tsString[K](")"))
                                                                       rules[fennelSequentialTableAssignment] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValueAssignment)), tsString[K]("]"))
                                                                       rules[fennelProgram] = tsRepeat[K](tsSymbol[K](fennelHidSexp))
                                                                       rules[fennelHidBinding] = tsChoice[K](tsSymbol[K](fennelMultiValueBinding), tsSymbol[K](fennelHidNonMultiValueBinding))
                                                                       rules[fennelSequentialTableBinding] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValueBinding)), tsChoice[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](fennelBinding)), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[fennelSymbolImmediate] = tsChoice[K](tsString[K](":"), tsSeq[K](tsString[K]("."), tsRegex[K]("[^(){}\\[\\]\"\'~;,@`\\s]*")), tsRegex[K]("[^#(){}\\[\\]\"\'~;,@`.:\\s][^(){}\\[\\]\"\'~;,@`.:\\s]*"))
                                                                       rules[fennelTableAssignment] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](fennelAssignment)), tsSeq[K](tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelHidNonMultiValueAssignment)))), tsString[K]("}"))
                                                                       rules[fennelGlobal] = tsSeq[K](tsString[K]("("), tsString[K]("global"), tsSymbol[K](fennelHidBinding), tsSymbol[K](fennelHidSexp), tsString[K](")"))
                                                                       rules[fennelHidNonMultiValueBinding] = tsChoice[K](tsSymbol[K](fennelBinding), tsSymbol[K](fennelSequentialTableBinding), tsSymbol[K](fennelTableBinding))
                                                                       rules[fennelList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](fennelHidSexp), tsSymbol[K](fennelMultiSymbolMethod)), tsRepeat[K](tsSymbol[K](fennelHidSexp)), tsString[K](")"))
                                                                       rules[fennelHidSimplePattern] = tsChoice[K](tsSymbol[K](fennelMultiValuePattern), tsSymbol[K](fennelHidNonMultiValuePattern))
                                                                       rules[fennelLetClause] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSeq[K](tsSymbol[K](fennelHidBinding), tsSymbol[K](fennelHidSexp))), tsString[K]("]"))
                                                                       rules[fennelMultiValueAssignment] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](fennelHidNonMultiValueAssignment)), tsString[K](")"))
                                                                       rules

