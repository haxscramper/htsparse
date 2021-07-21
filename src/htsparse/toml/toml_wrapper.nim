
import
  hmisc / wrappers / treesitter

import
  hmisc / base_errors

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
  TsTomlNode* = distinct TSNode
type
  TomlParser* = distinct PtsParser
proc tsNodeType*(node: TsTomlNode): string
proc kind*(node: TsTomlNode): TomlNodeKind {.noSideEffect.} =
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

type
  TomlNode* = HtsNode[TsTomlNode, TomlNodeKind]
func isNil*(node: TsTomlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsTomlNode; unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

func has*(node: TsTomlNode; idx: int; unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_toml(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: TsTomlNode): string =
  $ts_node_type(TSNode(node))

proc newTsTomlParser*(): TomlParser =
  result = TomlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_toml())

proc parseString*(parser: TomlParser; str: string): TsTomlNode =
  TsTomlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseTsTomlString*(str: string): TsTomlNode =
  let parser = newTsTomlParser()
  return parseString(parser, str)

func `$`*(node: TsTomlNode): string =
  if isNil(node):
    "<nil tree>"
  else:
    $node.kind

func `[]`*(node: TsTomlNode; idx: int; kind: TomlNodeKind | set[TomlNodeKind]): TsTomlNode =
  assert 0 <= idx and idx < node.len
  result = TsTomlNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind,
             "Child node at index " & $idx & " for node kind " & $node.kind)

proc treeReprTsToml*(str: string; unnamed: bool = false): string =
  treeRepr[TsTomlNode, TomlNodeKind](parseTsTomlString(str), str, 4,
                                     unnamed = unnamed)

proc toHtsNode*(node: TsTomlNode; str: ptr string): HtsNode[TsTomlNode,
    TomlNodeKind] =
  toHtsNode[TsTomlNode, TomlNodeKind](node, str)

proc toHtsTree*(node: TsTomlNode; str: ptr string): TomlNode =
  toHtsNode[TsTomlNode, TomlNodeKind](node, str)

proc parseTomlString*(str: ptr string; unnamed: bool = false): TomlNode =
  let parser = newTsTomlParser()
  return toHtsTree[TsTomlNode, TomlNodeKind](parseString(parser, str[]), str)

proc parseTomlString*(str: string; unnamed: bool = false): TomlNode =
  let parser = newTsTomlParser()
  return toHtsTree[TsTomlNode, TomlNodeKind](parseString(parser, str),
      unsafeAddr str, storePtr = false)
