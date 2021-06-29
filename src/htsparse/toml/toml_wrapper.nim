
import
  hmisc / wrappers / treesitter

import
  strutils

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
    tomlQuoteTok,           ## "
    tomlTripleQuoteTok,     ## """
    tomlApostropheTok,      ## '
    tomlTripleApostropheTok, ## '''
    tomlCommaTok,           ## ,
    tomlDotTok,             ## .
    tomlEqualTok,           ## =
    tomlLBrackTok,          ## [
    tomlDoubleLBrackTok,    ## [[
    tomlRBrackTok,          ## ]
    tomlDoubleRBrackTok,    ## ]]
    tomlBareKey,            ## bare_key
    tomlBoolean,            ## boolean
    tomlComment,            ## comment
    tomlEscapeSequence,     ## escape_sequence
    tomlLocalDate,          ## local_date
    tomlLocalDateTime,      ## local_date_time
    tomlLocalTime,          ## local_time
    tomlOffsetDateTime,     ## offset_date_time
    tomlLCurlyTok,          ## {
    tomlRCurlyTok,          ## }
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
proc kind*(node: TomlNode): TomlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
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
      tomlQuoteTok
    of "\"\"\"":
      tomlTripleQuoteTok
    of "\'":
      tomlApostropheTok
    of "\'\'\'":
      tomlTripleApostropheTok
    of ",":
      tomlCommaTok
    of ".":
      tomlDotTok
    of "=":
      tomlEqualTok
    of "[":
      tomlLBrackTok
    of "[[":
      tomlDoubleLBrackTok
    of "]":
      tomlRBrackTok
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
      tomlLCurlyTok
    of "}":
      tomlRCurlyTok
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

proc parseTomlString*(str: string): TomlNode =
  let parser = newTomlParser()
  return parseString(parser, str)

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
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                       ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: TomlNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: TomlNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: TomlNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: TomlNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: TomlNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: TomlNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: TomlNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: TomlNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: TomlNode): TomlNode =
  TomlNode(ts_node_parent(TSNode(node)))

func child*(node: TomlNode; a2: int): TomlNode =
  TomlNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: TomlNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: TomlNode; a2: int): TomlNode =
  TomlNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: TomlNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: TomlNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: TomlNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: TomlNode): int =
  node.startPoint().row.int

func endLine*(node: TomlNode): int =
  node.endPoint().row.int

func startColumn*(node: TomlNode): int =
  node.startPoint().column.int

func endColumn*(node: TomlNode): int =
  node.endPoint().column.int

func childByFieldName*(self: TomlNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
