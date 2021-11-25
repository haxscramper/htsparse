import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  LuaNodeKind* = enum
    luaArguments                  ## arguments
    luaBinaryOperation            ## binary_operation
    luaConditionExpression        ## condition_expression
    luaDoStatement                ## do_statement
    luaElse                       ## else
    luaElseif                     ## elseif
    luaExpression                 ## expression
    luaField                      ## field
    luaFieldExpression            ## field_expression
    luaForInStatement             ## for_in_statement
    luaForStatement               ## for_statement
    luaFunction                   ## function
    luaFunctionCall               ## function_call
    luaFunctionDefinition         ## function_definition
    luaFunctionName               ## function_name
    luaFunctionNameField          ## function_name_field
    luaGlobalVariable             ## global_variable
    luaGotoStatement              ## goto_statement
    luaIfStatement                ## if_statement
    luaLabelStatement             ## label_statement
    luaLocalFunction              ## local_function
    luaLocalVariableDeclaration   ## local_variable_declaration
    luaLoopExpression             ## loop_expression
    luaParameters                 ## parameters
    luaProgram                    ## program
    luaRepeatStatement            ## repeat_statement
    luaReturnStatement            ## return_statement
    luaTable                      ## table
    luaUnaryOperation             ## unary_operation
    luaVariableDeclaration        ## variable_declaration
    luaVariableDeclarator         ## variable_declarator
    luaWhileStatement             ## while_statement
    luaHashTok                    ## #
    luaPercentTok                 ## %
    luaAmpersandTok               ## &
    luaLParTok                    ## (
    luaRParTok                    ## )
    luaAsteriskTok                ## *
    luaPlusTok                    ## +
    luaCommaTok                   ## ,
    luaMinusTok                   ## -
    luaDotTok                     ## .
    luaDoubleDotTok               ## ..
    luaSlashTok                   ## /
    luaDoubleSlashTok             ## //
    luaColonTok                   ## :
    luaDoubleColonTok             ## ::
    luaSemicolonTok               ## ;
    luaLessThanTok                ## <
    luaDoubleLessThanTok          ## <<
    luaLessThanEqualTok           ## <=
    luaEqualTok                   ## =
    luaDoubleEqualTok             ## ==
    luaGreaterThanTok             ## >
    luaGreaterThanEqualTok        ## >=
    luaDoubleGreaterThanTok       ## >>
    luaLBrackTok                  ## [
    luaRBrackTok                  ## ]
    luaAccentTok                  ## ^
    luaHidGTok                    ## _G
    luaHidVERSIONTok              ## _VERSION
    luaAndTok                     ## and
    luaBreakStatement             ## break_statement
    luaComment                    ## comment
    luaDoTok                      ## do
    luaElseTok                    ## else
    luaElseifTok                  ## elseif
    luaEndTok                     ## end
    luaFalse                      ## false
    luaForTok                     ## for
    luaFunctionTok                ## function
    luaGotoTok                    ## goto
    luaIdentifier                 ## identifier
    luaIfTok                      ## if
    luaInTok                      ## in
    luaLocalTok                   ## local
    luaMethod                     ## method
    luaNext                       ## next
    luaNil                        ## nil
    luaNotTok                     ## not
    luaNumber                     ## number
    luaOrTok                      ## or
    luaPropertyIdentifier         ## property_identifier
    luaRepeatTok                  ## repeat
    luaReturnTok                  ## return
    luaSelf                       ## self
    luaSpread                     ## spread
    luaString                     ## string
    luaThenTok                    ## then
    luaTrue                       ## true
    luaUntilTok                   ## until
    luaWhileTok                   ## while
    luaLCurlyTok                  ## {
    luaPipeTok                    ## |
    luaRCurlyTok                  ## }
    luaTildeTok                   ## ~
    luaTildeEqualTok              ## ~=
    luaHidFieldSep                ## _field_sep
    luaHidExpression              ## _expression
    luaLocalFunctionStatement     ## local_function_statement
    luaHidVariableDeclarator      ## _variable_declarator
    luaFunctionCallStatement      ## function_call_statement
    luaHidPrefix                  ## _prefix
    luaFunctionStatement          ## function_statement
    luaHidLoopExpression          ## _loop_expression
    luaHidStatement               ## _statement
    luaHidFieldSequence           ## _field_sequence
    luaHidFunctionBody            ## _function_body
    luaHidInLoopExpression        ## _in_loop_expression
    luaHidLocalVariableDeclarator ## _local_variable_declarator
    luaHidEmptyStatement          ## _empty_statement
    luaSyntaxError                ## Tree-sitter parser syntax error

proc strRepr*(kind: LuaNodeKind): string =
  case kind:
    of luaArguments:                  "arguments"
    of luaBinaryOperation:            "binary_operation"
    of luaConditionExpression:        "condition_expression"
    of luaDoStatement:                "do_statement"
    of luaElse:                       "else"
    of luaElseif:                     "elseif"
    of luaExpression:                 "expression"
    of luaField:                      "field"
    of luaFieldExpression:            "field_expression"
    of luaForInStatement:             "for_in_statement"
    of luaForStatement:               "for_statement"
    of luaFunction:                   "function"
    of luaFunctionCall:               "function_call"
    of luaFunctionDefinition:         "function_definition"
    of luaFunctionName:               "function_name"
    of luaFunctionNameField:          "function_name_field"
    of luaGlobalVariable:             "global_variable"
    of luaGotoStatement:              "goto_statement"
    of luaIfStatement:                "if_statement"
    of luaLabelStatement:             "label_statement"
    of luaLocalFunction:              "local_function"
    of luaLocalVariableDeclaration:   "local_variable_declaration"
    of luaLoopExpression:             "loop_expression"
    of luaParameters:                 "parameters"
    of luaProgram:                    "program"
    of luaRepeatStatement:            "repeat_statement"
    of luaReturnStatement:            "return_statement"
    of luaTable:                      "table"
    of luaUnaryOperation:             "unary_operation"
    of luaVariableDeclaration:        "variable_declaration"
    of luaVariableDeclarator:         "variable_declarator"
    of luaWhileStatement:             "while_statement"
    of luaHashTok:                    "#"
    of luaPercentTok:                 "%"
    of luaAmpersandTok:               "&"
    of luaLParTok:                    "("
    of luaRParTok:                    ")"
    of luaAsteriskTok:                "*"
    of luaPlusTok:                    "+"
    of luaCommaTok:                   ","
    of luaMinusTok:                   "-"
    of luaDotTok:                     "."
    of luaDoubleDotTok:               ".."
    of luaSlashTok:                   "/"
    of luaDoubleSlashTok:             "//"
    of luaColonTok:                   ":"
    of luaDoubleColonTok:             "::"
    of luaSemicolonTok:               ";"
    of luaLessThanTok:                "<"
    of luaDoubleLessThanTok:          "<<"
    of luaLessThanEqualTok:           "<="
    of luaEqualTok:                   "="
    of luaDoubleEqualTok:             "=="
    of luaGreaterThanTok:             ">"
    of luaGreaterThanEqualTok:        ">="
    of luaDoubleGreaterThanTok:       ">>"
    of luaLBrackTok:                  "["
    of luaRBrackTok:                  "]"
    of luaAccentTok:                  "^"
    of luaHidGTok:                    "_G"
    of luaHidVERSIONTok:              "_VERSION"
    of luaAndTok:                     "and"
    of luaBreakStatement:             "break_statement"
    of luaComment:                    "comment"
    of luaDoTok:                      "do"
    of luaElseTok:                    "else"
    of luaElseifTok:                  "elseif"
    of luaEndTok:                     "end"
    of luaFalse:                      "false"
    of luaForTok:                     "for"
    of luaFunctionTok:                "function"
    of luaGotoTok:                    "goto"
    of luaIdentifier:                 "identifier"
    of luaIfTok:                      "if"
    of luaInTok:                      "in"
    of luaLocalTok:                   "local"
    of luaMethod:                     "method"
    of luaNext:                       "next"
    of luaNil:                        "nil"
    of luaNotTok:                     "not"
    of luaNumber:                     "number"
    of luaOrTok:                      "or"
    of luaPropertyIdentifier:         "property_identifier"
    of luaRepeatTok:                  "repeat"
    of luaReturnTok:                  "return"
    of luaSelf:                       "self"
    of luaSpread:                     "spread"
    of luaString:                     "string"
    of luaThenTok:                    "then"
    of luaTrue:                       "true"
    of luaUntilTok:                   "until"
    of luaWhileTok:                   "while"
    of luaLCurlyTok:                  "{"
    of luaPipeTok:                    "|"
    of luaRCurlyTok:                  "}"
    of luaTildeTok:                   "~"
    of luaTildeEqualTok:              "~="
    of luaHidFieldSep:                "_field_sep"
    of luaHidExpression:              "_expression"
    of luaLocalFunctionStatement:     "local_function_statement"
    of luaHidVariableDeclarator:      "_variable_declarator"
    of luaFunctionCallStatement:      "function_call_statement"
    of luaHidPrefix:                  "_prefix"
    of luaFunctionStatement:          "function_statement"
    of luaHidLoopExpression:          "_loop_expression"
    of luaHidStatement:               "_statement"
    of luaHidFieldSequence:           "_field_sequence"
    of luaHidFunctionBody:            "_function_body"
    of luaHidInLoopExpression:        "_in_loop_expression"
    of luaHidLocalVariableDeclarator: "_local_variable_declarator"
    of luaHidEmptyStatement:          "_empty_statement"
    of luaSyntaxError:                "ERROR"

type
  LuaExternalTok* = enum
    luaExternComment ## comment
    luaExternString  ## string

type
  TsLuaNode* = distinct TSNode

type
  LuaParser* = distinct PtsParser

const luaAllowedSubnodes*: array[LuaNodeKind, set[LuaNodeKind]] = block:
                                                                    var tmp: array[LuaNodeKind, set[LuaNodeKind]]
                                                                    tmp[luaArguments] = {
                                                                                          luaBinaryOperation,
                                                                                          luaFalse,
                                                                                          luaFieldExpression,
                                                                                          luaFunctionCall,
                                                                                          luaFunctionDefinition,
                                                                                          luaGlobalVariable,
                                                                                          luaIdentifier,
                                                                                          luaNext,
                                                                                          luaNil,
                                                                                          luaNumber,
                                                                                          luaSelf,
                                                                                          luaSpread,
                                                                                          luaString,
                                                                                          luaTable,
                                                                                          luaTrue,
                                                                                          luaUnaryOperation
                                                                                        }
                                                                    tmp[luaBinaryOperation] = {
                                                                                                luaBinaryOperation,
                                                                                                luaFalse,
                                                                                                luaFieldExpression,
                                                                                                luaFunctionCall,
                                                                                                luaFunctionDefinition,
                                                                                                luaGlobalVariable,
                                                                                                luaIdentifier,
                                                                                                luaNext,
                                                                                                luaNil,
                                                                                                luaNumber,
                                                                                                luaSelf,
                                                                                                luaSpread,
                                                                                                luaString,
                                                                                                luaTable,
                                                                                                luaTrue,
                                                                                                luaUnaryOperation
                                                                                              }
                                                                    tmp[luaConditionExpression] = {
                                                                                                    luaBinaryOperation,
                                                                                                    luaFalse,
                                                                                                    luaFieldExpression,
                                                                                                    luaFunctionCall,
                                                                                                    luaFunctionDefinition,
                                                                                                    luaGlobalVariable,
                                                                                                    luaIdentifier,
                                                                                                    luaNext,
                                                                                                    luaNil,
                                                                                                    luaNumber,
                                                                                                    luaSelf,
                                                                                                    luaSpread,
                                                                                                    luaString,
                                                                                                    luaTable,
                                                                                                    luaTrue,
                                                                                                    luaUnaryOperation
                                                                                                  }
                                                                    tmp[luaDoStatement] = {
                                                                                            luaBreakStatement,
                                                                                            luaDoStatement,
                                                                                            luaExpression,
                                                                                            luaForInStatement,
                                                                                            luaForStatement,
                                                                                            luaFunction,
                                                                                            luaFunctionCall,
                                                                                            luaGotoStatement,
                                                                                            luaIfStatement,
                                                                                            luaLabelStatement,
                                                                                            luaLocalFunction,
                                                                                            luaLocalVariableDeclaration,
                                                                                            luaRepeatStatement,
                                                                                            luaReturnStatement,
                                                                                            luaVariableDeclaration,
                                                                                            luaWhileStatement
                                                                                          }
                                                                    tmp[luaElse] = {
                                                                                     luaBreakStatement,
                                                                                     luaDoStatement,
                                                                                     luaExpression,
                                                                                     luaForInStatement,
                                                                                     luaForStatement,
                                                                                     luaFunction,
                                                                                     luaFunctionCall,
                                                                                     luaGotoStatement,
                                                                                     luaIfStatement,
                                                                                     luaLabelStatement,
                                                                                     luaLocalFunction,
                                                                                     luaLocalVariableDeclaration,
                                                                                     luaRepeatStatement,
                                                                                     luaReturnStatement,
                                                                                     luaVariableDeclaration,
                                                                                     luaWhileStatement
                                                                                   }
                                                                    tmp[luaElseif] = {
                                                                                       luaBreakStatement,
                                                                                       luaConditionExpression,
                                                                                       luaDoStatement,
                                                                                       luaExpression,
                                                                                       luaForInStatement,
                                                                                       luaForStatement,
                                                                                       luaFunction,
                                                                                       luaFunctionCall,
                                                                                       luaGotoStatement,
                                                                                       luaIfStatement,
                                                                                       luaLabelStatement,
                                                                                       luaLocalFunction,
                                                                                       luaLocalVariableDeclaration,
                                                                                       luaRepeatStatement,
                                                                                       luaReturnStatement,
                                                                                       luaVariableDeclaration,
                                                                                       luaWhileStatement
                                                                                     }
                                                                    tmp[luaExpression] = {
                                                                                           luaBinaryOperation,
                                                                                           luaFalse,
                                                                                           luaFieldExpression,
                                                                                           luaFunctionCall,
                                                                                           luaFunctionDefinition,
                                                                                           luaGlobalVariable,
                                                                                           luaIdentifier,
                                                                                           luaNext,
                                                                                           luaNil,
                                                                                           luaNumber,
                                                                                           luaSelf,
                                                                                           luaSpread,
                                                                                           luaString,
                                                                                           luaTable,
                                                                                           luaTrue,
                                                                                           luaUnaryOperation
                                                                                         }
                                                                    tmp[luaField] = {
                                                                                      luaBinaryOperation,
                                                                                      luaFalse,
                                                                                      luaFieldExpression,
                                                                                      luaFunctionCall,
                                                                                      luaFunctionDefinition,
                                                                                      luaGlobalVariable,
                                                                                      luaIdentifier,
                                                                                      luaNext,
                                                                                      luaNil,
                                                                                      luaNumber,
                                                                                      luaSelf,
                                                                                      luaSpread,
                                                                                      luaString,
                                                                                      luaTable,
                                                                                      luaTrue,
                                                                                      luaUnaryOperation
                                                                                    }
                                                                    tmp[luaFieldExpression] = {
                                                                                                luaBinaryOperation,
                                                                                                luaFalse,
                                                                                                luaFieldExpression,
                                                                                                luaFunctionCall,
                                                                                                luaFunctionDefinition,
                                                                                                luaGlobalVariable,
                                                                                                luaIdentifier,
                                                                                                luaNext,
                                                                                                luaNil,
                                                                                                luaNumber,
                                                                                                luaPropertyIdentifier,
                                                                                                luaSelf,
                                                                                                luaSpread,
                                                                                                luaString,
                                                                                                luaTable,
                                                                                                luaTrue,
                                                                                                luaUnaryOperation
                                                                                              }
                                                                    tmp[luaForInStatement] = {
                                                                                               luaBreakStatement,
                                                                                               luaDoStatement,
                                                                                               luaExpression,
                                                                                               luaForInStatement,
                                                                                               luaForStatement,
                                                                                               luaFunction,
                                                                                               luaFunctionCall,
                                                                                               luaGotoStatement,
                                                                                               luaIfStatement,
                                                                                               luaLabelStatement,
                                                                                               luaLocalFunction,
                                                                                               luaLocalVariableDeclaration,
                                                                                               luaLoopExpression,
                                                                                               luaRepeatStatement,
                                                                                               luaReturnStatement,
                                                                                               luaVariableDeclaration,
                                                                                               luaWhileStatement
                                                                                             }
                                                                    tmp[luaForStatement] = {
                                                                                             luaBreakStatement,
                                                                                             luaDoStatement,
                                                                                             luaExpression,
                                                                                             luaForInStatement,
                                                                                             luaForStatement,
                                                                                             luaFunction,
                                                                                             luaFunctionCall,
                                                                                             luaGotoStatement,
                                                                                             luaIfStatement,
                                                                                             luaLabelStatement,
                                                                                             luaLocalFunction,
                                                                                             luaLocalVariableDeclaration,
                                                                                             luaLoopExpression,
                                                                                             luaRepeatStatement,
                                                                                             luaReturnStatement,
                                                                                             luaVariableDeclaration,
                                                                                             luaWhileStatement
                                                                                           }
                                                                    tmp[luaFunction] = {
                                                                                         luaBreakStatement,
                                                                                         luaDoStatement,
                                                                                         luaExpression,
                                                                                         luaForInStatement,
                                                                                         luaForStatement,
                                                                                         luaFunction,
                                                                                         luaFunctionCall,
                                                                                         luaFunctionName,
                                                                                         luaGotoStatement,
                                                                                         luaIfStatement,
                                                                                         luaLabelStatement,
                                                                                         luaLocalFunction,
                                                                                         luaLocalVariableDeclaration,
                                                                                         luaParameters,
                                                                                         luaRepeatStatement,
                                                                                         luaReturnStatement,
                                                                                         luaVariableDeclaration,
                                                                                         luaWhileStatement
                                                                                       }
                                                                    tmp[luaFunctionCall] = {
                                                                                             luaArguments,
                                                                                             luaBinaryOperation,
                                                                                             luaFalse,
                                                                                             luaFieldExpression,
                                                                                             luaFunctionCall,
                                                                                             luaFunctionDefinition,
                                                                                             luaGlobalVariable,
                                                                                             luaIdentifier,
                                                                                             luaMethod,
                                                                                             luaNext,
                                                                                             luaNil,
                                                                                             luaNumber,
                                                                                             luaSelf,
                                                                                             luaSpread,
                                                                                             luaString,
                                                                                             luaTable,
                                                                                             luaTrue,
                                                                                             luaUnaryOperation
                                                                                           }
                                                                    tmp[luaFunctionDefinition] = {
                                                                                                   luaBreakStatement,
                                                                                                   luaDoStatement,
                                                                                                   luaExpression,
                                                                                                   luaForInStatement,
                                                                                                   luaForStatement,
                                                                                                   luaFunction,
                                                                                                   luaFunctionCall,
                                                                                                   luaGotoStatement,
                                                                                                   luaIfStatement,
                                                                                                   luaLabelStatement,
                                                                                                   luaLocalFunction,
                                                                                                   luaLocalVariableDeclaration,
                                                                                                   luaParameters,
                                                                                                   luaRepeatStatement,
                                                                                                   luaReturnStatement,
                                                                                                   luaVariableDeclaration,
                                                                                                   luaWhileStatement
                                                                                                 }
                                                                    tmp[luaFunctionName] = {luaFunctionNameField, luaIdentifier, luaMethod}
                                                                    tmp[luaFunctionNameField] = {luaPropertyIdentifier}
                                                                    tmp[luaGotoStatement] = {luaIdentifier}
                                                                    tmp[luaIfStatement] = {
                                                                                            luaBreakStatement,
                                                                                            luaConditionExpression,
                                                                                            luaDoStatement,
                                                                                            luaElse,
                                                                                            luaElseif,
                                                                                            luaExpression,
                                                                                            luaForInStatement,
                                                                                            luaForStatement,
                                                                                            luaFunction,
                                                                                            luaFunctionCall,
                                                                                            luaGotoStatement,
                                                                                            luaIfStatement,
                                                                                            luaLabelStatement,
                                                                                            luaLocalFunction,
                                                                                            luaLocalVariableDeclaration,
                                                                                            luaRepeatStatement,
                                                                                            luaReturnStatement,
                                                                                            luaVariableDeclaration,
                                                                                            luaWhileStatement
                                                                                          }
                                                                    tmp[luaLabelStatement] = {luaIdentifier}
                                                                    tmp[luaLocalFunction] = {
                                                                                              luaBreakStatement,
                                                                                              luaDoStatement,
                                                                                              luaExpression,
                                                                                              luaForInStatement,
                                                                                              luaForStatement,
                                                                                              luaFunction,
                                                                                              luaFunctionCall,
                                                                                              luaGotoStatement,
                                                                                              luaIdentifier,
                                                                                              luaIfStatement,
                                                                                              luaLabelStatement,
                                                                                              luaLocalFunction,
                                                                                              luaLocalVariableDeclaration,
                                                                                              luaParameters,
                                                                                              luaRepeatStatement,
                                                                                              luaReturnStatement,
                                                                                              luaVariableDeclaration,
                                                                                              luaWhileStatement
                                                                                            }
                                                                    tmp[luaLocalVariableDeclaration] = {
                                                                                                         luaBinaryOperation,
                                                                                                         luaFalse,
                                                                                                         luaFieldExpression,
                                                                                                         luaFunctionCall,
                                                                                                         luaFunctionDefinition,
                                                                                                         luaGlobalVariable,
                                                                                                         luaIdentifier,
                                                                                                         luaNext,
                                                                                                         luaNil,
                                                                                                         luaNumber,
                                                                                                         luaSelf,
                                                                                                         luaSpread,
                                                                                                         luaString,
                                                                                                         luaTable,
                                                                                                         luaTrue,
                                                                                                         luaUnaryOperation,
                                                                                                         luaVariableDeclarator
                                                                                                       }
                                                                    tmp[luaLoopExpression] = {
                                                                                               luaBinaryOperation,
                                                                                               luaFalse,
                                                                                               luaFieldExpression,
                                                                                               luaFunctionCall,
                                                                                               luaFunctionDefinition,
                                                                                               luaGlobalVariable,
                                                                                               luaIdentifier,
                                                                                               luaNext,
                                                                                               luaNil,
                                                                                               luaNumber,
                                                                                               luaSelf,
                                                                                               luaSpread,
                                                                                               luaString,
                                                                                               luaTable,
                                                                                               luaTrue,
                                                                                               luaUnaryOperation
                                                                                             }
                                                                    tmp[luaParameters] = {luaIdentifier, luaSelf, luaSpread}
                                                                    tmp[luaProgram] = {
                                                                                        luaBreakStatement,
                                                                                        luaDoStatement,
                                                                                        luaExpression,
                                                                                        luaForInStatement,
                                                                                        luaForStatement,
                                                                                        luaFunction,
                                                                                        luaFunctionCall,
                                                                                        luaGotoStatement,
                                                                                        luaIfStatement,
                                                                                        luaLabelStatement,
                                                                                        luaLocalFunction,
                                                                                        luaLocalVariableDeclaration,
                                                                                        luaRepeatStatement,
                                                                                        luaReturnStatement,
                                                                                        luaVariableDeclaration,
                                                                                        luaWhileStatement
                                                                                      }
                                                                    tmp[luaRepeatStatement] = {
                                                                                                luaBreakStatement,
                                                                                                luaConditionExpression,
                                                                                                luaDoStatement,
                                                                                                luaExpression,
                                                                                                luaForInStatement,
                                                                                                luaForStatement,
                                                                                                luaFunction,
                                                                                                luaFunctionCall,
                                                                                                luaGotoStatement,
                                                                                                luaIfStatement,
                                                                                                luaLabelStatement,
                                                                                                luaLocalFunction,
                                                                                                luaLocalVariableDeclaration,
                                                                                                luaRepeatStatement,
                                                                                                luaReturnStatement,
                                                                                                luaVariableDeclaration,
                                                                                                luaWhileStatement
                                                                                              }
                                                                    tmp[luaReturnStatement] = {
                                                                                                luaBinaryOperation,
                                                                                                luaFalse,
                                                                                                luaFieldExpression,
                                                                                                luaFunctionCall,
                                                                                                luaFunctionDefinition,
                                                                                                luaGlobalVariable,
                                                                                                luaIdentifier,
                                                                                                luaNext,
                                                                                                luaNil,
                                                                                                luaNumber,
                                                                                                luaSelf,
                                                                                                luaSpread,
                                                                                                luaString,
                                                                                                luaTable,
                                                                                                luaTrue,
                                                                                                luaUnaryOperation
                                                                                              }
                                                                    tmp[luaTable] = {luaField}
                                                                    tmp[luaUnaryOperation] = {
                                                                                               luaBinaryOperation,
                                                                                               luaFalse,
                                                                                               luaFieldExpression,
                                                                                               luaFunctionCall,
                                                                                               luaFunctionDefinition,
                                                                                               luaGlobalVariable,
                                                                                               luaIdentifier,
                                                                                               luaNext,
                                                                                               luaNil,
                                                                                               luaNumber,
                                                                                               luaSelf,
                                                                                               luaSpread,
                                                                                               luaString,
                                                                                               luaTable,
                                                                                               luaTrue,
                                                                                               luaUnaryOperation
                                                                                             }
                                                                    tmp[luaVariableDeclaration] = {
                                                                                                    luaBinaryOperation,
                                                                                                    luaFalse,
                                                                                                    luaFieldExpression,
                                                                                                    luaFunctionCall,
                                                                                                    luaFunctionDefinition,
                                                                                                    luaGlobalVariable,
                                                                                                    luaIdentifier,
                                                                                                    luaNext,
                                                                                                    luaNil,
                                                                                                    luaNumber,
                                                                                                    luaSelf,
                                                                                                    luaSpread,
                                                                                                    luaString,
                                                                                                    luaTable,
                                                                                                    luaTrue,
                                                                                                    luaUnaryOperation,
                                                                                                    luaVariableDeclarator
                                                                                                  }
                                                                    tmp[luaVariableDeclarator] = {
                                                                                                   luaBinaryOperation,
                                                                                                   luaFalse,
                                                                                                   luaFieldExpression,
                                                                                                   luaFunctionCall,
                                                                                                   luaFunctionDefinition,
                                                                                                   luaGlobalVariable,
                                                                                                   luaIdentifier,
                                                                                                   luaNext,
                                                                                                   luaNil,
                                                                                                   luaNumber,
                                                                                                   luaSelf,
                                                                                                   luaSpread,
                                                                                                   luaString,
                                                                                                   luaTable,
                                                                                                   luaTrue,
                                                                                                   luaUnaryOperation
                                                                                                 }
                                                                    tmp[luaWhileStatement] = {
                                                                                               luaBreakStatement,
                                                                                               luaConditionExpression,
                                                                                               luaDoStatement,
                                                                                               luaExpression,
                                                                                               luaForInStatement,
                                                                                               luaForStatement,
                                                                                               luaFunction,
                                                                                               luaFunctionCall,
                                                                                               luaGotoStatement,
                                                                                               luaIfStatement,
                                                                                               luaLabelStatement,
                                                                                               luaLocalFunction,
                                                                                               luaLocalVariableDeclaration,
                                                                                               luaRepeatStatement,
                                                                                               luaReturnStatement,
                                                                                               luaVariableDeclaration,
                                                                                               luaWhileStatement
                                                                                             }
                                                                    tmp
const luaTokenKinds*: set[LuaNodeKind] = {
                                           luaHashTok,
                                           luaPercentTok,
                                           luaAmpersandTok,
                                           luaLParTok,
                                           luaRParTok,
                                           luaAsteriskTok,
                                           luaPlusTok,
                                           luaCommaTok,
                                           luaMinusTok,
                                           luaDotTok,
                                           luaDoubleDotTok,
                                           luaSlashTok,
                                           luaDoubleSlashTok,
                                           luaColonTok,
                                           luaDoubleColonTok,
                                           luaSemicolonTok,
                                           luaLessThanTok,
                                           luaDoubleLessThanTok,
                                           luaLessThanEqualTok,
                                           luaEqualTok,
                                           luaDoubleEqualTok,
                                           luaGreaterThanTok,
                                           luaGreaterThanEqualTok,
                                           luaDoubleGreaterThanTok,
                                           luaLBrackTok,
                                           luaRBrackTok,
                                           luaAccentTok,
                                           luaHidGTok,
                                           luaHidVERSIONTok,
                                           luaAndTok,
                                           luaDoTok,
                                           luaElseTok,
                                           luaElseifTok,
                                           luaEndTok,
                                           luaForTok,
                                           luaFunctionTok,
                                           luaGotoTok,
                                           luaIfTok,
                                           luaInTok,
                                           luaLocalTok,
                                           luaNotTok,
                                           luaOrTok,
                                           luaRepeatTok,
                                           luaReturnTok,
                                           luaThenTok,
                                           luaUntilTok,
                                           luaWhileTok,
                                           luaLCurlyTok,
                                           luaPipeTok,
                                           luaRCurlyTok,
                                           luaTildeTok,
                                           luaTildeEqualTok
                                         }
const luaHiddenKinds*: set[LuaNodeKind] = {
                                            luaHidFieldSep,
                                            luaHidExpression,
                                            luaLocalFunctionStatement,
                                            luaHidVariableDeclarator,
                                            luaFunctionCallStatement,
                                            luaHidPrefix,
                                            luaFunctionStatement,
                                            luaHidLoopExpression,
                                            luaHidStatement,
                                            luaHidFieldSequence,
                                            luaHidFunctionBody,
                                            luaHidInLoopExpression,
                                            luaHidLocalVariableDeclarator,
                                            luaHidEmptyStatement
                                          }
proc tsNodeType*(node: TsLuaNode): string


proc kind*(node: TsLuaNode): LuaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "arguments":                  luaArguments
      of "binary_operation":           luaBinaryOperation
      of "condition_expression":       luaConditionExpression
      of "do_statement":               luaDoStatement
      of "else":                       luaElse
      of "elseif":                     luaElseif
      of "expression":                 luaExpression
      of "field":                      luaField
      of "field_expression":           luaFieldExpression
      of "for_in_statement":           luaForInStatement
      of "for_statement":              luaForStatement
      of "function":                   luaFunction
      of "function_call":              luaFunctionCall
      of "function_definition":        luaFunctionDefinition
      of "function_name":              luaFunctionName
      of "function_name_field":        luaFunctionNameField
      of "global_variable":            luaGlobalVariable
      of "goto_statement":             luaGotoStatement
      of "if_statement":               luaIfStatement
      of "label_statement":            luaLabelStatement
      of "local_function":             luaLocalFunction
      of "local_variable_declaration": luaLocalVariableDeclaration
      of "loop_expression":            luaLoopExpression
      of "parameters":                 luaParameters
      of "program":                    luaProgram
      of "repeat_statement":           luaRepeatStatement
      of "return_statement":           luaReturnStatement
      of "table":                      luaTable
      of "unary_operation":            luaUnaryOperation
      of "variable_declaration":       luaVariableDeclaration
      of "variable_declarator":        luaVariableDeclarator
      of "while_statement":            luaWhileStatement
      of "#":                          luaHashTok
      of "%":                          luaPercentTok
      of "&":                          luaAmpersandTok
      of "(":                          luaLParTok
      of ")":                          luaRParTok
      of "*":                          luaAsteriskTok
      of "+":                          luaPlusTok
      of ",":                          luaCommaTok
      of "-":                          luaMinusTok
      of ".":                          luaDotTok
      of "..":                         luaDoubleDotTok
      of "/":                          luaSlashTok
      of "//":                         luaDoubleSlashTok
      of ":":                          luaColonTok
      of "::":                         luaDoubleColonTok
      of ";":                          luaSemicolonTok
      of "<":                          luaLessThanTok
      of "<<":                         luaDoubleLessThanTok
      of "<=":                         luaLessThanEqualTok
      of "=":                          luaEqualTok
      of "==":                         luaDoubleEqualTok
      of ">":                          luaGreaterThanTok
      of ">=":                         luaGreaterThanEqualTok
      of ">>":                         luaDoubleGreaterThanTok
      of "[":                          luaLBrackTok
      of "]":                          luaRBrackTok
      of "^":                          luaAccentTok
      of "_G":                         luaHidGTok
      of "_VERSION":                   luaHidVERSIONTok
      of "and":                        luaAndTok
      of "break_statement":            luaBreakStatement
      of "comment":                    luaComment
      of "do":                         luaDoTok
      of "end":                        luaEndTok
      of "false":                      luaFalse
      of "for":                        luaForTok
      of "goto":                       luaGotoTok
      of "identifier":                 luaIdentifier
      of "if":                         luaIfTok
      of "in":                         luaInTok
      of "local":                      luaLocalTok
      of "method":                     luaMethod
      of "next":                       luaNext
      of "nil":                        luaNil
      of "not":                        luaNotTok
      of "number":                     luaNumber
      of "or":                         luaOrTok
      of "property_identifier":        luaPropertyIdentifier
      of "repeat":                     luaRepeatTok
      of "return":                     luaReturnTok
      of "self":                       luaSelf
      of "spread":                     luaSpread
      of "string":                     luaString
      of "then":                       luaThenTok
      of "true":                       luaTrue
      of "until":                      luaUntilTok
      of "while":                      luaWhileTok
      of "{":                          luaLCurlyTok
      of "|":                          luaPipeTok
      of "}":                          luaRCurlyTok
      of "~":                          luaTildeTok
      of "~=":                         luaTildeEqualTok
      of "ERROR":                      luaSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsLuaNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsLuaNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsLuaNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_lua(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsLuaNode): string =
  $ts_node_type(TSNode(node))

proc newTsLuaParser*(): LuaParser =
  result = LuaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_lua())

proc parseString*(parser: LuaParser, str: string): TsLuaNode =
  TsLuaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsLuaString*(str: string): TsLuaNode =
  let parser = newTsLuaParser()
  return parseString(parser, str)

func `$`*(node: TsLuaNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsLuaNode,
    idx:  int,
    kind: LuaNodeKind | set[LuaNodeKind]
  ): TsLuaNode =
  assert 0 <= idx and idx < node.len
  result = TsLuaNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  LuaNode* = HtsNode[TsLuaNode, LuaNodeKind]


proc treeReprTsLua*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsLuaNode, LuaNodeKind](parseTsLuaString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsLuaNode,
    str:  ptr string
  ): HtsNode[TsLuaNode, LuaNodeKind] =
  toHtsNode[TsLuaNode, LuaNodeKind](node, str)

proc toHtsTree*(node: TsLuaNode, str: ptr string): LuaNode =
  toHtsNode[TsLuaNode, LuaNodeKind](node, str)

proc parseLuaString*(str: ptr string, unnamed: bool = false): LuaNode =
  let parser = newTsLuaParser()
  return toHtsTree[TsLuaNode, LuaNodeKind](parseString(parser, str[]), str)

proc parseLuaString*(str: string, unnamed: bool = false): LuaNode =
  let parser = newTsLuaParser()
  return toHtsTree[TsLuaNode, LuaNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  htsparse/describe_grammar
let luaGrammar = block:
                   var rules: array[LuaNodeKind, HtsRule[LuaNodeKind]]
                   type
                     K = LuaNodeKind


                   rules[luaLabelStatement] = tsSeq[K](tsString[K]("::"), tsSymbol[K](luaIdentifier), tsString[K]("::"))
                   rules[luaWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](luaHidExpression), tsString[K]("do"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("end"))
                   rules[luaHidFieldSep] = tsChoice[K](tsString[K](","), tsString[K](";"))
                   rules[luaUnaryOperation] = tsSeq[K](tsChoice[K](tsString[K]("not"), tsString[K]("#"), tsString[K]("-"), tsString[K]("~")), tsSymbol[K](luaHidExpression))
                   rules[luaForInStatement] = tsSeq[K](tsString[K]("for"), tsSymbol[K](luaHidInLoopExpression), tsString[K]("do"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("end"))
                   rules[luaReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSeq[K](tsSymbol[K](luaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression)))), tsBlank[K]()), tsChoice[K](tsSymbol[K](luaHidEmptyStatement), tsBlank[K]()))
                   rules[luaFalse] = tsString[K]("false")
                   rules[luaGotoStatement] = tsSeq[K](tsString[K]("goto"), tsSymbol[K](luaIdentifier))
                   rules[luaHidExpression] = tsChoice[K](tsSymbol[K](luaSpread), tsSymbol[K](luaHidPrefix), tsSymbol[K](luaNext), tsSymbol[K](luaFunctionDefinition), tsSymbol[K](luaTable), tsSymbol[K](luaBinaryOperation), tsSymbol[K](luaUnaryOperation), tsSymbol[K](luaString), tsSymbol[K](luaNumber), tsSymbol[K](luaNil), tsSymbol[K](luaTrue), tsSymbol[K](luaFalse), tsSymbol[K](luaIdentifier))
                   rules[luaForStatement] = tsSeq[K](tsString[K]("for"), tsSymbol[K](luaHidLoopExpression), tsString[K]("do"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("end"))
                   rules[luaLocalFunctionStatement] = tsSeq[K](tsString[K]("local"), tsString[K]("function"), tsSymbol[K](luaIdentifier), tsSymbol[K](luaHidFunctionBody))
                   rules[luaBreakStatement] = tsString[K]("break")
                   rules[luaHidVariableDeclarator] = tsChoice[K](tsSymbol[K](luaIdentifier), tsSeq[K](tsSymbol[K](luaHidPrefix), tsString[K]("["), tsSymbol[K](luaHidExpression), tsString[K]("]")), tsSymbol[K](luaFieldExpression))
                   rules[luaSelf] = tsString[K]("self")
                   rules[luaFunctionCallStatement] = tsChoice[K](tsSeq[K](tsSymbol[K](luaHidPrefix), tsSymbol[K](luaArguments)), tsSeq[K](tsSymbol[K](luaHidPrefix), tsString[K](":"), tsSymbol[K](luaIdentifier), tsSymbol[K](luaArguments)))
                   rules[luaRepeatStatement] = tsSeq[K](tsString[K]("repeat"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("until"), tsSymbol[K](luaHidExpression))
                   rules[luaElseif] = tsSeq[K](tsString[K]("elseif"), tsSymbol[K](luaHidExpression), tsString[K]("then"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()))
                   rules[luaIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](luaHidExpression), tsString[K]("then"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsRepeat[K](tsSymbol[K](luaElseif)), tsChoice[K](tsSymbol[K](luaElse), tsBlank[K]()), tsString[K]("end"))
                   rules[luaFunctionDefinition] = tsSeq[K](tsString[K]("function"), tsSymbol[K](luaHidFunctionBody))
                   rules[luaHidPrefix] = tsChoice[K](tsSymbol[K](luaSelf), tsSymbol[K](luaGlobalVariable), tsSymbol[K](luaHidVariableDeclarator), tsSymbol[K](luaFunctionCallStatement), tsSeq[K](tsString[K]("("), tsSymbol[K](luaHidExpression), tsString[K](")")))
                   rules[luaBinaryOperation] = tsChoice[K](tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("or"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("and"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("<"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("<="), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("=="), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("~="), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K](">="), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K](">"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("|"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("~"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("&"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("<<"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K](">>"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("+"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("-"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("*"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("/"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("//"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("%"), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K](".."), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaHidExpression), tsString[K]("^"), tsSymbol[K](luaHidExpression)))
                   rules[luaFieldExpression] = tsSeq[K](tsSymbol[K](luaHidPrefix), tsString[K]("."), tsSymbol[K](luaIdentifier))
                   rules[luaLocalVariableDeclaration] = tsSeq[K](tsString[K]("local"), tsSymbol[K](luaHidLocalVariableDeclarator), tsChoice[K](tsSeq[K](tsString[K]("="), tsSeq[K](tsSymbol[K](luaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression))))), tsBlank[K]()))
                   rules[luaField] = tsChoice[K](tsSeq[K](tsString[K]("["), tsSymbol[K](luaHidExpression), tsString[K]("]"), tsString[K]("="), tsSymbol[K](luaHidExpression)), tsSeq[K](tsSymbol[K](luaIdentifier), tsString[K]("="), tsSymbol[K](luaHidExpression)), tsSymbol[K](luaHidExpression))
                   rules[luaFunctionStatement] = tsSeq[K](tsString[K]("function"), tsSymbol[K](luaFunctionName), tsSymbol[K](luaHidFunctionBody))
                   rules[luaNil] = tsString[K]("nil")
                   rules[luaGlobalVariable] = tsChoice[K](tsString[K]("_G"), tsString[K]("_VERSION"))
                   rules[luaHidLoopExpression] = tsSeq[K](tsSymbol[K](luaIdentifier), tsString[K]("="), tsSymbol[K](luaHidExpression), tsString[K](","), tsSymbol[K](luaHidExpression), tsChoice[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression)), tsBlank[K]()))
                   rules[luaHidStatement] = tsChoice[K](tsSymbol[K](luaHidExpression), tsSymbol[K](luaVariableDeclaration), tsSymbol[K](luaLocalVariableDeclaration), tsSymbol[K](luaDoStatement), tsSymbol[K](luaIfStatement), tsSymbol[K](luaWhileStatement), tsSymbol[K](luaRepeatStatement), tsSymbol[K](luaForStatement), tsSymbol[K](luaForInStatement), tsSymbol[K](luaGotoStatement), tsSymbol[K](luaBreakStatement), tsSymbol[K](luaLabelStatement), tsSymbol[K](luaHidEmptyStatement), tsSymbol[K](luaFunctionStatement), tsSymbol[K](luaLocalFunctionStatement), tsSymbol[K](luaFunctionCallStatement))
                   rules[luaParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](luaSelf), tsSymbol[K](luaSpread), tsSymbol[K](luaIdentifier)), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaIdentifier))), tsChoice[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaSpread)), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                   rules[luaNumber] = tsChoice[K](tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("0"), tsSeq[K](tsChoice[K](tsString[K]("0"), tsBlank[K]()), tsRegex[K]("[1-9]"), tsChoice[K](tsRegex[K]("[0-9]+"), tsBlank[K]()))), tsString[K]("."), tsChoice[K](tsRegex[K]("[0-9]+"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("[0-9]+"))), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsRegex[K]("[0-9]+"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("[0-9]+"))), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("0"), tsSeq[K](tsChoice[K](tsString[K]("0"), tsBlank[K]()), tsRegex[K]("[1-9]"), tsChoice[K](tsRegex[K]("[0-9]+"), tsBlank[K]()))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("[0-9]+"))), tsBlank[K]()))), tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsRegex[K]("[a-fA-F0-9]+"), tsChoice[K](tsSeq[K](tsString[K]("."), tsRegex[K]("[a-fA-F0-9]+")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("p"), tsString[K]("P")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("[0-9]+"))), tsBlank[K]())))
                   rules[luaIdentifier] = tsRegex[K]("[a-zA-Z_][a-zA-Z0-9_]*")
                   rules[luaArguments] = tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](luaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression)))), tsBlank[K]()), tsString[K](")")), tsSymbol[K](luaTable), tsSymbol[K](luaString))
                   rules[luaSpread] = tsString[K]("...")
                   rules[luaHidFieldSequence] = tsSeq[K](tsSymbol[K](luaField), tsRepeat[K](tsSeq[K](tsSymbol[K](luaHidFieldSep), tsSymbol[K](luaField))), tsChoice[K](tsSymbol[K](luaHidFieldSep), tsBlank[K]()))
                   rules[luaTable] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](luaHidFieldSequence), tsBlank[K]()), tsString[K]("}"))
                   rules[luaHidFunctionBody] = tsSeq[K](tsSymbol[K](luaParameters), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("end"))
                   rules[luaNext] = tsString[K]("next")
                   rules[luaDoStatement] = tsSeq[K](tsString[K]("do"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()), tsString[K]("end"))
                   rules[luaProgram] = tsSeq[K](tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()))
                   rules[luaHidInLoopExpression] = tsSeq[K](tsSeq[K](tsSymbol[K](luaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaIdentifier)))), tsString[K]("in"), tsSeq[K](tsSymbol[K](luaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression)))))
                   rules[luaTrue] = tsString[K]("true")
                   rules[luaHidLocalVariableDeclarator] = tsSeq[K](tsSymbol[K](luaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaIdentifier))))
                   rules[luaElse] = tsSeq[K](tsString[K]("else"), tsRepeat[K](tsSymbol[K](luaHidStatement)), tsChoice[K](tsSymbol[K](luaReturnStatement), tsBlank[K]()))
                   rules[luaFunctionNameField] = tsSeq[K](tsSymbol[K](luaIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](luaIdentifier))))
                   rules[luaVariableDeclaration] = tsSeq[K](tsSeq[K](tsSymbol[K](luaHidVariableDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidVariableDeclarator)))), tsString[K]("="), tsSeq[K](tsSymbol[K](luaHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](luaHidExpression)))))
                   rules[luaFunctionName] = tsSeq[K](tsChoice[K](tsSymbol[K](luaIdentifier), tsSymbol[K](luaFunctionNameField)), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](luaIdentifier)), tsBlank[K]()))
                   rules[luaHidEmptyStatement] = tsString[K](";")
                   rules

