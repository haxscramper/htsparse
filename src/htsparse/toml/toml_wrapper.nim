import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  TomlNodeKind* = enum
    tomlArray                            ## array
    tomlDocument                         ## document
    tomlDottedKey                        ## dotted_key
    tomlFloat                            ## float
    tomlInlineTable                      ## inline_table
    tomlInteger                          ## integer
    tomlPair                             ## pair
    tomlQuotedKey                        ## quoted_key
    tomlString                           ## string
    tomlTable                            ## table
    tomlTableArrayElement                ## table_array_element
    tomlQuoteTok                         ## "
    tomlTripleQuoteTok                   ## """
    tomlApostropheTok                    ## '
    tomlTripleApostropheTok              ## '''
    tomlCommaTok                         ## ,
    tomlDotTok                           ## .
    tomlEqualTok                         ## =
    tomlLBrackTok                        ## [
    tomlDoubleLBrackTok                  ## [[
    tomlRBrackTok                        ## ]
    tomlDoubleRBrackTok                  ## ]]
    tomlBareKey                          ## bare_key
    tomlBoolean                          ## boolean
    tomlComment                          ## comment
    tomlEscapeSequence                   ## escape_sequence
    tomlLocalDate                        ## local_date
    tomlLocalDateTime                    ## local_date_time
    tomlLocalTime                        ## local_time
    tomlOffsetDateTime                   ## offset_date_time
    tomlLCurlyTok                        ## {
    tomlRCurlyTok                        ## }
    tomlHidInlineValue                   ## _inline_value
    tomlHidEscapeLineEnding              ## _escape_line_ending
    tomlHidMultilineLiteralStringContent ## _multiline_literal_string_content
    tomlHidLiteralString                 ## _literal_string
    tomlHidMultilineLiteralString        ## _multiline_literal_string
    tomlHidKey                           ## _key
    tomlHidMultilineLiteralStringEnd     ## _multiline_literal_string_end
    tomlHidBasicString                   ## _basic_string
    tomlHidLineEndingOrEof               ## _line_ending_or_eof
    tomlHidInlinePair                    ## _inline_pair
    tomlHidMultilineBasicStringEnd       ## _multiline_basic_string_end
    tomlHidMultilineBasicStringContent   ## _multiline_basic_string_content
    tomlHidMultilineBasicString          ## _multiline_basic_string
    tomlSyntaxError                      ## Tree-sitter parser syntax error

proc strRepr*(kind: TomlNodeKind): string =
  case kind:
    of tomlArray:                            "array"
    of tomlDocument:                         "document"
    of tomlDottedKey:                        "dotted_key"
    of tomlFloat:                            "float"
    of tomlInlineTable:                      "inline_table"
    of tomlInteger:                          "integer"
    of tomlPair:                             "pair"
    of tomlQuotedKey:                        "quoted_key"
    of tomlString:                           "string"
    of tomlTable:                            "table"
    of tomlTableArrayElement:                "table_array_element"
    of tomlQuoteTok:                         "\""
    of tomlTripleQuoteTok:                   "\"\"\""
    of tomlApostropheTok:                    "\'"
    of tomlTripleApostropheTok:              "\'\'\'"
    of tomlCommaTok:                         ","
    of tomlDotTok:                           "."
    of tomlEqualTok:                         "="
    of tomlLBrackTok:                        "["
    of tomlDoubleLBrackTok:                  "[["
    of tomlRBrackTok:                        "]"
    of tomlDoubleRBrackTok:                  "]]"
    of tomlBareKey:                          "bare_key"
    of tomlBoolean:                          "boolean"
    of tomlComment:                          "comment"
    of tomlEscapeSequence:                   "escape_sequence"
    of tomlLocalDate:                        "local_date"
    of tomlLocalDateTime:                    "local_date_time"
    of tomlLocalTime:                        "local_time"
    of tomlOffsetDateTime:                   "offset_date_time"
    of tomlLCurlyTok:                        "{"
    of tomlRCurlyTok:                        "}"
    of tomlHidInlineValue:                   "_inline_value"
    of tomlHidEscapeLineEnding:              "_escape_line_ending"
    of tomlHidMultilineLiteralStringContent: "_multiline_literal_string_content"
    of tomlHidLiteralString:                 "_literal_string"
    of tomlHidMultilineLiteralString:        "_multiline_literal_string"
    of tomlHidKey:                           "_key"
    of tomlHidMultilineLiteralStringEnd:     "_multiline_literal_string_end"
    of tomlHidBasicString:                   "_basic_string"
    of tomlHidLineEndingOrEof:               "_line_ending_or_eof"
    of tomlHidInlinePair:                    "_inline_pair"
    of tomlHidMultilineBasicStringEnd:       "_multiline_basic_string_end"
    of tomlHidMultilineBasicStringContent:   "_multiline_basic_string_content"
    of tomlHidMultilineBasicString:          "_multiline_basic_string"
    of tomlSyntaxError:                      "ERROR"

type
  TomlExternalTok* = enum
    tomlExtern_line_ending_or_eof               ## _line_ending_or_eof
    tomlExtern_multiline_basic_string_content   ## _multiline_basic_string_content
    tomlExtern_multiline_basic_string_end       ## _multiline_basic_string_end
    tomlExtern_multiline_literal_string_content ## _multiline_literal_string_content
    tomlExtern_multiline_literal_string_end     ## _multiline_literal_string_end

type
  TsTomlNode* = distinct TSNode

type
  TomlParser* = distinct PtsParser

const tomlAllowedSubnodes*: array[TomlNodeKind, set[TomlNodeKind]] = block:
                                                                       var tmp: array[TomlNodeKind, set[TomlNodeKind]]
                                                                       tmp[tomlArray] = {
                                                                                          tomlArray,
                                                                                          tomlBoolean,
                                                                                          tomlFloat,
                                                                                          tomlInlineTable,
                                                                                          tomlInteger,
                                                                                          tomlLocalDate,
                                                                                          tomlLocalDateTime,
                                                                                          tomlLocalTime,
                                                                                          tomlOffsetDateTime,
                                                                                          tomlString
                                                                                        }
                                                                       tmp[tomlDocument] = {tomlPair, tomlTable, tomlTableArrayElement}
                                                                       tmp[tomlDottedKey] = {tomlBareKey, tomlDottedKey, tomlQuotedKey}
                                                                       tmp[tomlInlineTable] = {tomlPair}
                                                                       tmp[tomlPair] = {
                                                                                         tomlArray,
                                                                                         tomlBareKey,
                                                                                         tomlBoolean,
                                                                                         tomlDottedKey,
                                                                                         tomlFloat,
                                                                                         tomlInlineTable,
                                                                                         tomlInteger,
                                                                                         tomlLocalDate,
                                                                                         tomlLocalDateTime,
                                                                                         tomlLocalTime,
                                                                                         tomlOffsetDateTime,
                                                                                         tomlQuotedKey,
                                                                                         tomlString
                                                                                       }
                                                                       tmp[tomlQuotedKey] = {tomlEscapeSequence}
                                                                       tmp[tomlString] = {tomlEscapeSequence}
                                                                       tmp[tomlTable] = {tomlBareKey, tomlDottedKey, tomlPair, tomlQuotedKey}
                                                                       tmp[tomlTableArrayElement] = {tomlBareKey, tomlDottedKey, tomlPair, tomlQuotedKey}
                                                                       tmp
const tomlTokenKinds*: set[TomlNodeKind] = {
                                             tomlQuoteTok,
                                             tomlTripleQuoteTok,
                                             tomlApostropheTok,
                                             tomlTripleApostropheTok,
                                             tomlCommaTok,
                                             tomlDotTok,
                                             tomlEqualTok,
                                             tomlLBrackTok,
                                             tomlDoubleLBrackTok,
                                             tomlRBrackTok,
                                             tomlDoubleRBrackTok,
                                             tomlLCurlyTok,
                                             tomlRCurlyTok
                                           }
const tomlHiddenKinds*: set[TomlNodeKind] = {
                                              tomlHidInlineValue,
                                              tomlHidEscapeLineEnding,
                                              tomlHidMultilineLiteralStringContent,
                                              tomlHidLiteralString,
                                              tomlHidMultilineLiteralString,
                                              tomlHidKey,
                                              tomlHidMultilineLiteralStringEnd,
                                              tomlHidBasicString,
                                              tomlHidLineEndingOrEof,
                                              tomlHidInlinePair,
                                              tomlHidMultilineBasicStringEnd,
                                              tomlHidMultilineBasicStringContent,
                                              tomlHidMultilineBasicString
                                            }
proc tsNodeType*(node: TsTomlNode): string


proc kind*(node: TsTomlNode): TomlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "array":               tomlArray
      of "document":            tomlDocument
      of "dotted_key":          tomlDottedKey
      of "float":               tomlFloat
      of "inline_table":        tomlInlineTable
      of "integer":             tomlInteger
      of "pair":                tomlPair
      of "quoted_key":          tomlQuotedKey
      of "string":              tomlString
      of "table":               tomlTable
      of "table_array_element": tomlTableArrayElement
      of "\"":                  tomlQuoteTok
      of "\"\"\"":              tomlTripleQuoteTok
      of "\'":                  tomlApostropheTok
      of "\'\'\'":              tomlTripleApostropheTok
      of ",":                   tomlCommaTok
      of ".":                   tomlDotTok
      of "=":                   tomlEqualTok
      of "[":                   tomlLBrackTok
      of "[[":                  tomlDoubleLBrackTok
      of "]":                   tomlRBrackTok
      of "]]":                  tomlDoubleRBrackTok
      of "bare_key":            tomlBareKey
      of "boolean":             tomlBoolean
      of "comment":             tomlComment
      of "escape_sequence":     tomlEscapeSequence
      of "local_date":          tomlLocalDate
      of "local_date_time":     tomlLocalDateTime
      of "local_time":          tomlLocalTime
      of "offset_date_time":    tomlOffsetDateTime
      of "{":                   tomlLCurlyTok
      of "}":                   tomlRCurlyTok
      of "ERROR":               tomlSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsTomlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsTomlNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsTomlNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_toml(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsTomlNode): string =
  $ts_node_type(TSNode(node))

proc newTsTomlParser*(): TomlParser =
  result = TomlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_toml())

proc parseString*(parser: TomlParser, str: string): TsTomlNode =
  TsTomlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsTomlString*(str: string): TsTomlNode =
  let parser = newTsTomlParser()
  return parseString(parser, str)

func `$`*(node: TsTomlNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsTomlNode,
    idx:  int,
    kind: TomlNodeKind | set[TomlNodeKind]
  ): TsTomlNode =
  assert 0 <= idx and idx < node.len
  result = TsTomlNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  TomlNode* = HtsNode[TsTomlNode, TomlNodeKind]


proc treeReprTsToml*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsTomlNode, TomlNodeKind](parseTsTomlString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsTomlNode,
    str:  ptr string
  ): HtsNode[TsTomlNode, TomlNodeKind] =
  toHtsNode[TsTomlNode, TomlNodeKind](node, str)

proc toHtsTree*(node: TsTomlNode, str: ptr string): TomlNode =
  toHtsNode[TsTomlNode, TomlNodeKind](node, str)

proc parseTomlString*(str: ptr string, unnamed: bool = false): TomlNode =
  let parser = newTsTomlParser()
  return toHtsTree[TsTomlNode, TomlNodeKind](parseString(parser, str[]), str)

proc parseTomlString*(str: string, unnamed: bool = false): TomlNode =
  let parser = newTsTomlParser()
  return toHtsTree[TsTomlNode, TomlNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let tomlGrammar*: array[TomlNodeKind, HtsRule[TomlNodeKind]] = block:
                                                                 var rules: array[TomlNodeKind, HtsRule[TomlNodeKind]]
                                                                 type
                                                                   K = TomlNodeKind


                                                                 rules[tomlHidKey] = tsChoice[K](tsSymbol[K](tomlBareKey), tsSymbol[K](tomlQuotedKey))
                                                                 rules[tomlQuotedKey] = tsChoice[K](tsSymbol[K](tomlHidBasicString), tsSymbol[K](tomlHidLiteralString))
                                                                 rules[tomlPair] = tsSeq[K](tsSymbol[K](tomlHidInlinePair), tsSymbol[K](tomlHidLineEndingOrEof))
                                                                 rules[tomlDottedKey] = tsSeq[K](tsChoice[K](tsSymbol[K](tomlDottedKey), tsSymbol[K](tomlHidKey)), tsString[K]("."), tsSymbol[K](tomlHidKey))
                                                                 rules[tomlComment] = tsSeq[K](tsString[K]("#"), tsRepeat[K](tsRegex[K]("[^\\u0000-\\u0008\\u000a-\\u001f\\u007f]")))
                                                                 rules[tomlBareKey] = tsRegex[K]("[A-Za-z0-9_-]+")
                                                                 rules[tomlDocument] = tsSeq[K](tsRepeat[K](tsChoice[K](tsSymbol[K](tomlPair), tsRegex[K]("\\r?\\n"))), tsRepeat[K](tsChoice[K](tsSymbol[K](tomlTable), tsSymbol[K](tomlTableArrayElement))))
                                                                 rules[tomlLocalDate] = tsRegex[K]("([0-9]+)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])")
                                                                 rules[tomlHidInlineValue] = tsChoice[K](tsSymbol[K](tomlString), tsSymbol[K](tomlInteger), tsSymbol[K](tomlFloat), tsSymbol[K](tomlBoolean), tsSymbol[K](tomlOffsetDateTime), tsSymbol[K](tomlLocalDateTime), tsSymbol[K](tomlLocalDate), tsSymbol[K](tomlLocalTime), tsSymbol[K](tomlArray), tsSymbol[K](tomlInlineTable))
                                                                 rules[tomlLocalDateTime] = tsSeq[K](tsRegex[K]("([0-9]+)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])"), tsRegex[K]("[ tT]"), tsRegex[K]("([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9]|60)([.][0-9]+)?"))
                                                                 rules[tomlHidEscapeLineEnding] = tsSeq[K](tsRegex[K]("\\\\"), tsRegex[K]("\\r?\\n"))
                                                                 rules[tomlTable] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](tomlDottedKey), tsSymbol[K](tomlHidKey)), tsString[K]("]"), tsSymbol[K](tomlHidLineEndingOrEof), tsRepeat[K](tsChoice[K](tsSymbol[K](tomlPair), tsRegex[K]("\\r?\\n"))))
                                                                 rules[tomlOffsetDateTime] = tsSeq[K](tsRegex[K]("([0-9]+)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])"), tsRegex[K]("[ tT]"), tsRegex[K]("([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9]|60)([.][0-9]+)?"), tsRegex[K]("([zZ])|([+-]([01][0-9]|2[0-3]):[0-5][0-9])"))
                                                                 rules[tomlTableArrayElement] = tsSeq[K](tsString[K]("[["), tsChoice[K](tsSymbol[K](tomlDottedKey), tsSymbol[K](tomlHidKey)), tsString[K]("]]"), tsSymbol[K](tomlHidLineEndingOrEof), tsRepeat[K](tsChoice[K](tsSymbol[K](tomlPair), tsRegex[K]("\\r?\\n"))))
                                                                 rules[tomlLocalTime] = tsRegex[K]("([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9]|60)([.][0-9]+)?")
                                                                 rules[tomlHidBasicString] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRepeat1[K](tsRegex[K]("[^\\u0000-\\u0008\\u000a-\\u001f\\u0022\\u005c\\u007f]")), tsSymbol[K](tomlEscapeSequence))), tsString[K]("\""))
                                                                 rules[tomlHidLiteralString] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsRepeat1[K](tsRegex[K]("[^\\u0000-\\u0008\\u000a-\\u001f\\u0027\\u007f]")), tsBlank[K]()), tsString[K]("\'"))
                                                                 rules[tomlInteger] = tsChoice[K](tsRegex[K]("[+-]?(0|[1-9](_?[0-9])*)"), tsRegex[K]("0x[0-9a-fA-F](_?[0-9a-fA-F])*"), tsRegex[K]("0o[0-7](_?[0-7])*"), tsRegex[K]("0b[01](_?[01])*"))
                                                                 rules[tomlFloat] = tsChoice[K](tsSeq[K](tsRegex[K]("[+-]?(0|[1-9](_?[0-9])*)"), tsChoice[K](tsRegex[K]("[.][0-9](_?[0-9])*"), tsSeq[K](tsChoice[K](tsRegex[K]("[.][0-9](_?[0-9])*"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[eE]"), tsRegex[K]("[+-]?[0-9](_?[0-9])*"))))), tsRegex[K]("[+-]?(inf|nan)"))
                                                                 rules[tomlInlineTable] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](tomlHidInlinePair), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](tomlHidInlinePair)))), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[tomlString] = tsChoice[K](tsSymbol[K](tomlHidBasicString), tsSymbol[K](tomlHidMultilineBasicString), tsSymbol[K](tomlHidLiteralString), tsSymbol[K](tomlHidMultilineLiteralString))
                                                                 rules[tomlBoolean] = tsRegex[K]("true|false")
                                                                 rules[tomlArray] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsRegex[K]("\\r?\\n")), tsChoice[K](tsSeq[K](tsSymbol[K](tomlHidInlineValue), tsRepeat[K](tsRegex[K]("\\r?\\n")), tsRepeat[K](tsSeq[K](tsString[K](","), tsRepeat[K](tsRegex[K]("\\r?\\n")), tsSymbol[K](tomlHidInlineValue), tsRepeat[K](tsRegex[K]("\\r?\\n")))), tsChoice[K](tsSeq[K](tsString[K](","), tsRepeat[K](tsRegex[K]("\\r?\\n"))), tsBlank[K]())), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[tomlHidInlinePair] = tsSeq[K](tsChoice[K](tsSymbol[K](tomlDottedKey), tsSymbol[K](tomlHidKey)), tsString[K]("="), tsSymbol[K](tomlHidInlineValue))
                                                                 rules[tomlEscapeSequence] = tsRegex[K]("\\\\([btnfr\"\\\\]|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})")
                                                                 rules[tomlHidMultilineLiteralString] = tsSeq[K](tsString[K]("\'\'\'"), tsRepeat[K](tsChoice[K](tsRepeat1[K](tsRegex[K]("[^\\u0000-\\u0008\\u000a-\\u001f\\u0027\\u007f]")), tsSymbol[K](tomlHidMultilineLiteralStringContent), tsRegex[K]("\\r?\\n"))), tsSymbol[K](tomlHidMultilineLiteralStringEnd))
                                                                 rules[tomlHidMultilineBasicString] = tsSeq[K](tsString[K]("\"\"\""), tsRepeat[K](tsChoice[K](tsRepeat1[K](tsRegex[K]("[^\\u0000-\\u0008\\u000a-\\u001f\\u0022\\u005c\\u007f]")), tsSymbol[K](tomlHidMultilineBasicStringContent), tsRegex[K]("\\r?\\n"), tsSymbol[K](tomlEscapeSequence), tsSymbol[K](tomlHidEscapeLineEnding))), tsSymbol[K](tomlHidMultilineBasicStringEnd))
                                                                 rules

