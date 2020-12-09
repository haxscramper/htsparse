
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  LuaNodeKind* = enum
    luaArguments,           ## arguments
    luaBinaryOperation,     ## binary_operation
    luaConditionExpression, ## condition_expression
    luaDoStatement,         ## do_statement
    luaElse,                ## else
    luaElseif,              ## elseif
    luaExpression,          ## expression
    luaField,               ## field
    luaFieldExpression,     ## field_expression
    luaForInStatement,      ## for_in_statement
    luaForStatement,        ## for_statement
    luaFunction,            ## function
    luaFunctionCall,        ## function_call
    luaFunctionDefinition,  ## function_definition
    luaFunctionName,        ## function_name
    luaFunctionNameField,   ## function_name_field
    luaGlobalVariable,      ## global_variable
    luaGotoStatement,       ## goto_statement
    luaIfStatement,         ## if_statement
    luaLabelStatement,      ## label_statement
    luaLocalFunction,       ## local_function
    luaLocalVariableDeclaration, ## local_variable_declaration
    luaLoopExpression,      ## loop_expression
    luaParameters,          ## parameters
    luaProgram,             ## program
    luaRepeatStatement,     ## repeat_statement
    luaReturnStatement,     ## return_statement
    luaTable,               ## table
    luaUnaryOperation,      ## unary_operation
    luaVariableDeclaration, ## variable_declaration
    luaVariableDeclarator,  ## variable_declarator
    luaWhileStatement,      ## while_statement
    luaSingleHashTok,       ## #
    luaSinglePercentTok,    ## %
    luaSingleAmpersandTok,  ## &
    luaSingleLParTok,       ## (
    luaSingleRParTok,       ## )
    luaSingleAsteriskTok,   ## *
    luaSinglePlusTok,       ## +
    luaSingleCommaTok,      ## ,
    luaSingleMinusTok,      ## -
    luaSingleDotTok,        ## .
    luaDoubleDotTok,        ## ..
    luaSingleSlashTok,      ## /
    luaDoubleSlashTok,      ## //
    luaSingleColonTok,      ## :
    luaDoubleColonTok,      ## ::
    luaSingleSemicolonTok,  ## ;
    luaSingleLessThanTok,   ## <
    luaDoubleLessThanTok,   ## <<
    luaSingleLessThanSingleEqualTok, ## <=
    luaSingleEqualTok,      ## =
    luaDoubleEqualTok,      ## ==
    luaSingleGreaterThanTok, ## >
    luaSingleGreaterThanSingleEqualTok, ## >=
    luaDoubleGreaterThanTok, ## >>
    luaSingleLBrackTok,     ## [
    luaSingleRBrackTok,     ## ]
    luaSingleAccentTok,     ## ^
    luaGTok,                ## _G
    luaVERSIONTok,          ## _VERSION
    luaAndTok,              ## and
    luaBreakStatement,      ## break_statement
    luaComment,             ## comment
    luaDoTok,               ## do
    luaElseTok,             ## else
    luaElseifTok,           ## elseif
    luaEndTok,              ## end
    luaFalse,               ## false
    luaForTok,              ## for
    luaFunctionTok,         ## function
    luaGotoTok,             ## goto
    luaIdentifier,          ## identifier
    luaIfTok,               ## if
    luaInTok,               ## in
    luaLocalTok,            ## local
    luaMethod,              ## method
    luaNext,                ## next
    luaNil,                 ## nil
    luaNotTok,              ## not
    luaNumber,              ## number
    luaOrTok,               ## or
    luaPropertyIdentifier,  ## property_identifier
    luaRepeatTok,           ## repeat
    luaReturnTok,           ## return
    luaSelf,                ## self
    luaSpread,              ## spread
    luaString,              ## string
    luaThenTok,             ## then
    luaTrue,                ## true
    luaUntilTok,            ## until
    luaWhileTok,            ## while
    luaSingleLCurlyTok,     ## {
    luaSinglePipeTok,       ## |
    luaSingleRCurlyTok,     ## }
    luaSingleTildeTok,      ## ~
    luaSingleTildeSingleEqualTok, ## ~=
    luaSyntaxError           ## Tree-sitter parser syntax error
type
  LuaExternalTok* = enum
    luaExternComment,       ## comment
    luaExternString          ## string
type
  LuaNode* = distinct TSNode
type
  LuaParser* = distinct PtsParser
proc tsNodeType*(node: LuaNode): string
proc kind*(node: LuaNode): LuaNodeKind =
  case node.tsNodeType
  of "arguments":
    luaArguments
  of "binary_operation":
    luaBinaryOperation
  of "condition_expression":
    luaConditionExpression
  of "do_statement":
    luaDoStatement
  of "else":
    luaElse
  of "elseif":
    luaElseif
  of "expression":
    luaExpression
  of "field":
    luaField
  of "field_expression":
    luaFieldExpression
  of "for_in_statement":
    luaForInStatement
  of "for_statement":
    luaForStatement
  of "function":
    luaFunction
  of "function_call":
    luaFunctionCall
  of "function_definition":
    luaFunctionDefinition
  of "function_name":
    luaFunctionName
  of "function_name_field":
    luaFunctionNameField
  of "global_variable":
    luaGlobalVariable
  of "goto_statement":
    luaGotoStatement
  of "if_statement":
    luaIfStatement
  of "label_statement":
    luaLabelStatement
  of "local_function":
    luaLocalFunction
  of "local_variable_declaration":
    luaLocalVariableDeclaration
  of "loop_expression":
    luaLoopExpression
  of "parameters":
    luaParameters
  of "program":
    luaProgram
  of "repeat_statement":
    luaRepeatStatement
  of "return_statement":
    luaReturnStatement
  of "table":
    luaTable
  of "unary_operation":
    luaUnaryOperation
  of "variable_declaration":
    luaVariableDeclaration
  of "variable_declarator":
    luaVariableDeclarator
  of "while_statement":
    luaWhileStatement
  of "#":
    luaSingleHashTok
  of "%":
    luaSinglePercentTok
  of "&":
    luaSingleAmpersandTok
  of "(":
    luaSingleLParTok
  of ")":
    luaSingleRParTok
  of "*":
    luaSingleAsteriskTok
  of "+":
    luaSinglePlusTok
  of ",":
    luaSingleCommaTok
  of "-":
    luaSingleMinusTok
  of ".":
    luaSingleDotTok
  of "..":
    luaDoubleDotTok
  of "/":
    luaSingleSlashTok
  of "//":
    luaDoubleSlashTok
  of ":":
    luaSingleColonTok
  of "::":
    luaDoubleColonTok
  of ";":
    luaSingleSemicolonTok
  of "<":
    luaSingleLessThanTok
  of "<<":
    luaDoubleLessThanTok
  of "<=":
    luaSingleLessThanSingleEqualTok
  of "=":
    luaSingleEqualTok
  of "==":
    luaDoubleEqualTok
  of ">":
    luaSingleGreaterThanTok
  of ">=":
    luaSingleGreaterThanSingleEqualTok
  of ">>":
    luaDoubleGreaterThanTok
  of "[":
    luaSingleLBrackTok
  of "]":
    luaSingleRBrackTok
  of "^":
    luaSingleAccentTok
  of "_G":
    luaGTok
  of "_VERSION":
    luaVERSIONTok
  of "and":
    luaAndTok
  of "break_statement":
    luaBreakStatement
  of "comment":
    luaComment
  of "do":
    luaDoTok
  of "end":
    luaEndTok
  of "false":
    luaFalse
  of "for":
    luaForTok
  of "goto":
    luaGotoTok
  of "identifier":
    luaIdentifier
  of "if":
    luaIfTok
  of "in":
    luaInTok
  of "local":
    luaLocalTok
  of "method":
    luaMethod
  of "next":
    luaNext
  of "nil":
    luaNil
  of "not":
    luaNotTok
  of "number":
    luaNumber
  of "or":
    luaOrTok
  of "property_identifier":
    luaPropertyIdentifier
  of "repeat":
    luaRepeatTok
  of "return":
    luaReturnTok
  of "self":
    luaSelf
  of "spread":
    luaSpread
  of "string":
    luaString
  of "then":
    luaThenTok
  of "true":
    luaTrue
  of "until":
    luaUntilTok
  of "while":
    luaWhileTok
  of "{":
    luaSingleLCurlyTok
  of "|":
    luaSinglePipeTok
  of "}":
    luaSingleRCurlyTok
  of "~":
    luaSingleTildeTok
  of "~=":
    luaSingleTildeSingleEqualTok
  of "ERROR":
    luaSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_lua(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: LuaNode): string =
  $ts_node_type(TSNode(node))

proc newLuaParser*(): LuaParser =
  result = LuaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_lua())

proc parseString*(parser: LuaParser; str: string): LuaNode =
  LuaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: LuaNode; idx: int; withUnnamed: bool = false): LuaNode =
  if withUnnamed:
    LuaNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    LuaNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: LuaNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: LuaNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: LuaNode; withUnnamed: bool = false): LuaNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: LuaNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: LuaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: LuaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
