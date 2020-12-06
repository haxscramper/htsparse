
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  TomlNodeKind* = enum
    tomlArray,              ## array
    tomlDocument,           ## document
    tomlDottedKey,          ## dotted_key
    tomlFloat,              ## float
    tomlInlineTable,        ## inline_table
    tomlInteger,            ## integer
    tomlPair,               ## pair
    tomlQuotedKey,          ## quoted_key
    tomlString,             ## string
    tomlTable,              ## table
    tomlTableArrayElement,  ## table_array_element
    tomlSingleQuoteTok,     ## "
    tomlTripleQuoteTok,     ## """
    tomlSingleApostropheTok, ## '
    tomlTripleApostropheTok, ## '''
    tomlSingleCommaTok,     ## ,
    tomlSingleDotTok,       ## .
    tomlSingleEqualTok,     ## =
    tomlSingleLBrackTok,    ## [
    tomlDoubleLBrackTok,    ## [[
    tomlSingleRBrackTok,    ## ]
    tomlDoubleRBrackTok,    ## ]]
    tomlBareKey,            ## bare_key
    tomlBoolean,            ## boolean
    tomlComment,            ## comment
    tomlEscapeSequence,     ## escape_sequence
    tomlLocalDate,          ## local_date
    tomlLocalDateTime,      ## local_date_time
    tomlLocalTime,          ## local_time
    tomlOffsetDateTime,     ## offset_date_time
    tomlSingleLCurlyTok,    ## {
    tomlSingleRCurlyTok,    ## }
    tomlSyntaxError          ## Tree-sitter parser syntax error
type
  TomlExternalTok* = enum
    tomlExtern_line_ending_or_eof, ## _line_ending_or_eof
    tomlExtern_multiline_basic_string_content, ## _multiline_basic_string_content
    tomlExtern_multiline_basic_string_end, ## _multiline_basic_string_end
    tomlExtern_multiline_literal_string_content, ## _multiline_literal_string_content
    tomlExtern_multiline_literal_string_end ## _multiline_literal_string_end
type
  TomlNode* = distinct TSNode
type
  TomlParser* = distinct PtsParser
proc tsNodeType*(node: TomlNode): string
proc kind*(node: TomlNode): TomlNodeKind =
  case node.tsNodeType
  of "array":
    tomlArray
  of "document":
    tomlDocument
  of "dotted_key":
    tomlDottedKey
  of "float":
    tomlFloat
  of "inline_table":
    tomlInlineTable
  of "integer":
    tomlInteger
  of "pair":
    tomlPair
  of "quoted_key":
    tomlQuotedKey
  of "string":
    tomlString
  of "table":
    tomlTable
  of "table_array_element":
    tomlTableArrayElement
  of "\"":
    tomlSingleQuoteTok
  of "\"\"\"":
    tomlTripleQuoteTok
  of "\'":
    tomlSingleApostropheTok
  of "\'\'\'":
    tomlTripleApostropheTok
  of ",":
    tomlSingleCommaTok
  of ".":
    tomlSingleDotTok
  of "=":
    tomlSingleEqualTok
  of "[":
    tomlSingleLBrackTok
  of "[[":
    tomlDoubleLBrackTok
  of "]":
    tomlSingleRBrackTok
  of "]]":
    tomlDoubleRBrackTok
  of "bare_key":
    tomlBareKey
  of "boolean":
    tomlBoolean
  of "comment":
    tomlComment
  of "escape_sequence":
    tomlEscapeSequence
  of "local_date":
    tomlLocalDate
  of "local_date_time":
    tomlLocalDateTime
  of "local_time":
    tomlLocalTime
  of "offset_date_time":
    tomlOffsetDateTime
  of "{":
    tomlSingleLCurlyTok
  of "}":
    tomlSingleRCurlyTok
  of "ERROR":
    tomlSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_toml(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: TomlNode): string =
  $ts_node_type(TSNode(node))

proc newTomlParser*(): TomlParser =
  result = TomlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_toml())

proc parseString*(parser: TomlParser; str: string): TomlNode =
  TomlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: TomlNode; idx: int; withUnnamed: bool = false): TomlNode =
  if withUnnamed:
    TomlNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    TomlNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: TomlNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: TomlNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: TomlNode; withUnnamed: bool = false): TomlNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: TomlNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: TomlNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: TomlNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
