
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
    luaHashTok,             ## #
    luaPercentTok,          ## %
    luaAmpersandTok,        ## &
    luaLParTok,             ## (
    luaRParTok,             ## )
    luaAsteriskTok,         ## *
    luaPlusTok,             ## +
    luaCommaTok,            ## ,
    luaMinusTok,            ## -
    luaDotTok,              ## .
    luaDoubleDotTok,        ## ..
    luaSlashTok,            ## /
    luaDoubleSlashTok,      ## //
    luaColonTok,            ## :
    luaDoubleColonTok,      ## ::
    luaSemicolonTok,        ## ;
    luaLessThanTok,         ## <
    luaDoubleLessThanTok,   ## <<
    luaLessThanEqualTok,    ## <=
    luaEqualTok,            ## =
    luaDoubleEqualTok,      ## ==
    luaGreaterThanTok,      ## >
    luaGreaterThanEqualTok, ## >=
    luaDoubleGreaterThanTok, ## >>
    luaLBrackTok,           ## [
    luaRBrackTok,           ## ]
    luaAccentTok,           ## ^
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
    luaLCurlyTok,           ## {
    luaPipeTok,             ## |
    luaRCurlyTok,           ## }
    luaTildeTok,            ## ~
    luaTildeEqualTok,       ## ~=
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
proc kind*(node: LuaNode): LuaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
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
      luaHashTok
    of "%":
      luaPercentTok
    of "&":
      luaAmpersandTok
    of "(":
      luaLParTok
    of ")":
      luaRParTok
    of "*":
      luaAsteriskTok
    of "+":
      luaPlusTok
    of ",":
      luaCommaTok
    of "-":
      luaMinusTok
    of ".":
      luaDotTok
    of "..":
      luaDoubleDotTok
    of "/":
      luaSlashTok
    of "//":
      luaDoubleSlashTok
    of ":":
      luaColonTok
    of "::":
      luaDoubleColonTok
    of ";":
      luaSemicolonTok
    of "<":
      luaLessThanTok
    of "<<":
      luaDoubleLessThanTok
    of "<=":
      luaLessThanEqualTok
    of "=":
      luaEqualTok
    of "==":
      luaDoubleEqualTok
    of ">":
      luaGreaterThanTok
    of ">=":
      luaGreaterThanEqualTok
    of ">>":
      luaDoubleGreaterThanTok
    of "[":
      luaLBrackTok
    of "]":
      luaRBrackTok
    of "^":
      luaAccentTok
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
      luaLCurlyTok
    of "|":
      luaPipeTok
    of "}":
      luaRCurlyTok
    of "~":
      luaTildeTok
    of "~=":
      luaTildeEqualTok
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

proc parseLuaString*(str: string): LuaNode =
  let parser = newLuaParser()
  return parseString(parser, str)

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
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: LuaNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: LuaNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: LuaNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: LuaNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: LuaNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: LuaNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: LuaNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: LuaNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: LuaNode): LuaNode =
  LuaNode(ts_node_parent(TSNode(node)))

func child*(node: LuaNode; a2: int): LuaNode =
  LuaNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: LuaNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: LuaNode; a2: int): LuaNode =
  LuaNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: LuaNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: LuaNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: LuaNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: LuaNode): int =
  node.startPoint().row.int

func endLine*(node: LuaNode): int =
  node.endPoint().row.int

func startColumn*(node: LuaNode): int =
  node.startPoint().column.int

func endColumn*(node: LuaNode): int =
  node.endPoint().column.int

func childByFieldName*(self: LuaNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)

proc treeRepr*(mainNode: LuaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: LuaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
