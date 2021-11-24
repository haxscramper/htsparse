import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  LuaNodeKind* = enum
    luaArguments                ## arguments
    luaBinaryOperation          ## binary_operation
    luaConditionExpression      ## condition_expression
    luaDoStatement              ## do_statement
    luaElse                     ## else
    luaElseif                   ## elseif
    luaExpression               ## expression
    luaField                    ## field
    luaFieldExpression          ## field_expression
    luaForInStatement           ## for_in_statement
    luaForStatement             ## for_statement
    luaFunction                 ## function
    luaFunctionCall             ## function_call
    luaFunctionDefinition       ## function_definition
    luaFunctionName             ## function_name
    luaFunctionNameField        ## function_name_field
    luaGlobalVariable           ## global_variable
    luaGotoStatement            ## goto_statement
    luaIfStatement              ## if_statement
    luaLabelStatement           ## label_statement
    luaLocalFunction            ## local_function
    luaLocalVariableDeclaration ## local_variable_declaration
    luaLoopExpression           ## loop_expression
    luaParameters               ## parameters
    luaProgram                  ## program
    luaRepeatStatement          ## repeat_statement
    luaReturnStatement          ## return_statement
    luaTable                    ## table
    luaUnaryOperation           ## unary_operation
    luaVariableDeclaration      ## variable_declaration
    luaVariableDeclarator       ## variable_declarator
    luaWhileStatement           ## while_statement
    luaHashTok                  ## #
    luaPercentTok               ## %
    luaAmpersandTok             ## &
    luaLParTok                  ## (
    luaRParTok                  ## )
    luaAsteriskTok              ## *
    luaPlusTok                  ## +
    luaCommaTok                 ## ,
    luaMinusTok                 ## -
    luaDotTok                   ## .
    luaDoubleDotTok             ## ..
    luaSlashTok                 ## /
    luaDoubleSlashTok           ## //
    luaColonTok                 ## :
    luaDoubleColonTok           ## ::
    luaSemicolonTok             ## ;
    luaLessThanTok              ## <
    luaDoubleLessThanTok        ## <<
    luaLessThanEqualTok         ## <=
    luaEqualTok                 ## =
    luaDoubleEqualTok           ## ==
    luaGreaterThanTok           ## >
    luaGreaterThanEqualTok      ## >=
    luaDoubleGreaterThanTok     ## >>
    luaLBrackTok                ## [
    luaRBrackTok                ## ]
    luaAccentTok                ## ^
    luaUsGTok                   ## _G
    luaUsVERSIONTok             ## _VERSION
    luaAndTok                   ## and
    luaBreakStatement           ## break_statement
    luaComment                  ## comment
    luaDoTok                    ## do
    luaElseTok                  ## else
    luaElseifTok                ## elseif
    luaEndTok                   ## end
    luaFalse                    ## false
    luaForTok                   ## for
    luaFunctionTok              ## function
    luaGotoTok                  ## goto
    luaIdentifier               ## identifier
    luaIfTok                    ## if
    luaInTok                    ## in
    luaLocalTok                 ## local
    luaMethod                   ## method
    luaNext                     ## next
    luaNil                      ## nil
    luaNotTok                   ## not
    luaNumber                   ## number
    luaOrTok                    ## or
    luaPropertyIdentifier       ## property_identifier
    luaRepeatTok                ## repeat
    luaReturnTok                ## return
    luaSelf                     ## self
    luaSpread                   ## spread
    luaString                   ## string
    luaThenTok                  ## then
    luaTrue                     ## true
    luaUntilTok                 ## until
    luaWhileTok                 ## while
    luaLCurlyTok                ## {
    luaPipeTok                  ## |
    luaRCurlyTok                ## }
    luaTildeTok                 ## ~
    luaTildeEqualTok            ## ~=
    luaSyntaxError              ## Tree-sitter parser syntax error


proc strRepr*(kind: LuaNodeKind): string =
  case kind:
    of luaArguments:                "arguments"
    of luaBinaryOperation:          "binary_operation"
    of luaConditionExpression:      "condition_expression"
    of luaDoStatement:              "do_statement"
    of luaElse:                     "else"
    of luaElseif:                   "elseif"
    of luaExpression:               "expression"
    of luaField:                    "field"
    of luaFieldExpression:          "field_expression"
    of luaForInStatement:           "for_in_statement"
    of luaForStatement:             "for_statement"
    of luaFunction:                 "function"
    of luaFunctionCall:             "function_call"
    of luaFunctionDefinition:       "function_definition"
    of luaFunctionName:             "function_name"
    of luaFunctionNameField:        "function_name_field"
    of luaGlobalVariable:           "global_variable"
    of luaGotoStatement:            "goto_statement"
    of luaIfStatement:              "if_statement"
    of luaLabelStatement:           "label_statement"
    of luaLocalFunction:            "local_function"
    of luaLocalVariableDeclaration: "local_variable_declaration"
    of luaLoopExpression:           "loop_expression"
    of luaParameters:               "parameters"
    of luaProgram:                  "program"
    of luaRepeatStatement:          "repeat_statement"
    of luaReturnStatement:          "return_statement"
    of luaTable:                    "table"
    of luaUnaryOperation:           "unary_operation"
    of luaVariableDeclaration:      "variable_declaration"
    of luaVariableDeclarator:       "variable_declarator"
    of luaWhileStatement:           "while_statement"
    of luaHashTok:                  "#"
    of luaPercentTok:               "%"
    of luaAmpersandTok:             "&"
    of luaLParTok:                  "("
    of luaRParTok:                  ")"
    of luaAsteriskTok:              "*"
    of luaPlusTok:                  "+"
    of luaCommaTok:                 ","
    of luaMinusTok:                 "-"
    of luaDotTok:                   "."
    of luaDoubleDotTok:             ".."
    of luaSlashTok:                 "/"
    of luaDoubleSlashTok:           "//"
    of luaColonTok:                 ":"
    of luaDoubleColonTok:           "::"
    of luaSemicolonTok:             ";"
    of luaLessThanTok:              "<"
    of luaDoubleLessThanTok:        "<<"
    of luaLessThanEqualTok:         "<="
    of luaEqualTok:                 "="
    of luaDoubleEqualTok:           "=="
    of luaGreaterThanTok:           ">"
    of luaGreaterThanEqualTok:      ">="
    of luaDoubleGreaterThanTok:     ">>"
    of luaLBrackTok:                "["
    of luaRBrackTok:                "]"
    of luaAccentTok:                "^"
    of luaUsGTok:                   "_G"
    of luaUsVERSIONTok:             "_VERSION"
    of luaAndTok:                   "and"
    of luaBreakStatement:           "break_statement"
    of luaComment:                  "comment"
    of luaDoTok:                    "do"
    of luaElseTok:                  "else"
    of luaElseifTok:                "elseif"
    of luaEndTok:                   "end"
    of luaFalse:                    "false"
    of luaForTok:                   "for"
    of luaFunctionTok:              "function"
    of luaGotoTok:                  "goto"
    of luaIdentifier:               "identifier"
    of luaIfTok:                    "if"
    of luaInTok:                    "in"
    of luaLocalTok:                 "local"
    of luaMethod:                   "method"
    of luaNext:                     "next"
    of luaNil:                      "nil"
    of luaNotTok:                   "not"
    of luaNumber:                   "number"
    of luaOrTok:                    "or"
    of luaPropertyIdentifier:       "property_identifier"
    of luaRepeatTok:                "repeat"
    of luaReturnTok:                "return"
    of luaSelf:                     "self"
    of luaSpread:                   "spread"
    of luaString:                   "string"
    of luaThenTok:                  "then"
    of luaTrue:                     "true"
    of luaUntilTok:                 "until"
    of luaWhileTok:                 "while"
    of luaLCurlyTok:                "{"
    of luaPipeTok:                  "|"
    of luaRCurlyTok:                "}"
    of luaTildeTok:                 "~"
    of luaTildeEqualTok:            "~="
    of luaSyntaxError:              "ERROR"


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
                                           luaUsGTok,
                                           luaUsVERSIONTok,
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
      of "_G":                         luaUsGTok
      of "_VERSION":                   luaUsVERSIONTok
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


proc treeRepr*(node: TsLuaNode, str: string): string =
  var res = addr result
  proc aux(node: TsLuaNode, level: int) =
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


