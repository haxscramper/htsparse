
import
  hmisc / wrappers / treesitter

import
  strutils

type
  HtmlNodeKind* = enum
    htmlAttribute,          ## attribute
    htmlDoctype,            ## doctype
    htmlElement,            ## element
    htmlEndTag,             ## end_tag
    htmlErroneousEndTag,    ## erroneous_end_tag
    htmlFragment,           ## fragment
    htmlQuotedAttributeValue, ## quoted_attribute_value
    htmlScriptElement,      ## script_element
    htmlSelfClosingTag,     ## self_closing_tag
    htmlStartTag,           ## start_tag
    htmlStyleElement,       ## style_element
    htmlQuoteTok,           ## "
    htmlApostropheTok,      ## '
    htmlSlashGreaterThanTok, ## />
    htmlLessThanTok,        ## <
    htmlLessThanExclamationTok, ## <!
    htmlLessThanSlashTok,   ## </
    htmlEqualTok,           ## =
    htmlGreaterThanTok,     ## >
    htmlAttributeName,      ## attribute_name
    htmlAttributeValue,     ## attribute_value
    htmlComment,            ## comment
    htmlDoctypeTok,         ## doctype
    htmlErroneousEndTagName, ## erroneous_end_tag_name
    htmlRawText,            ## raw_text
    htmlTagName,            ## tag_name
    htmlText,               ## text
    htmlSyntaxError          ## Tree-sitter parser syntax error
type
  HtmlExternalTok* = enum
    htmlExtern_start_tag_name, ## _start_tag_name
    htmlExtern_script_start_tag_name, ## _script_start_tag_name
    htmlExtern_style_start_tag_name, ## _style_start_tag_name
    htmlExtern_end_tag_name, ## _end_tag_name
    htmlExternErroneous_end_tag_name, ## erroneous_end_tag_name
    htmlExtern_implicit_end_tag, ## _implicit_end_tag
    htmlExternRaw_text,     ## raw_text
    htmlExternComment        ## comment
type
  HtmlNode* = distinct TSNode
type
  HtmlParser* = distinct PtsParser
proc tsNodeType*(node: HtmlNode): string
proc kind*(node: HtmlNode): HtmlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "attribute":
      htmlAttribute
    of "doctype":
      htmlDoctype
    of "element":
      htmlElement
    of "end_tag":
      htmlEndTag
    of "erroneous_end_tag":
      htmlErroneousEndTag
    of "fragment":
      htmlFragment
    of "quoted_attribute_value":
      htmlQuotedAttributeValue
    of "script_element":
      htmlScriptElement
    of "self_closing_tag":
      htmlSelfClosingTag
    of "start_tag":
      htmlStartTag
    of "style_element":
      htmlStyleElement
    of "\"":
      htmlQuoteTok
    of "\'":
      htmlApostropheTok
    of "/>":
      htmlSlashGreaterThanTok
    of "<":
      htmlLessThanTok
    of "<!":
      htmlLessThanExclamationTok
    of "</":
      htmlLessThanSlashTok
    of "=":
      htmlEqualTok
    of ">":
      htmlGreaterThanTok
    of "attribute_name":
      htmlAttributeName
    of "attribute_value":
      htmlAttributeValue
    of "comment":
      htmlComment
    of "erroneous_end_tag_name":
      htmlErroneousEndTagName
    of "raw_text":
      htmlRawText
    of "tag_name":
      htmlTagName
    of "text":
      htmlText
    of "ERROR":
      htmlSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_html(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: HtmlNode): string =
  $ts_node_type(TSNode(node))

proc newHtmlParser*(): HtmlParser =
  result = HtmlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_html())

proc parseString*(parser: HtmlParser; str: string): HtmlNode =
  HtmlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseHtmlString*(str: string): HtmlNode =
  let parser = newHtmlParser()
  return parseString(parser, str)

func `[]`*(node: HtmlNode; idx: int; withUnnamed: bool = false): HtmlNode =
  if withUnnamed:
    HtmlNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    HtmlNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: HtmlNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: HtmlNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: HtmlNode; withUnnamed: bool = false): HtmlNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                       ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

iterator pairs*(node: HtmlNode; withUnnamed: bool = false): (int, HtmlNode) =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                              ## nodes.
  for i in 0 ..< node.len(withUnnamed):
    yield (i, node[i, withUnnamed])

func slice*(node: HtmlNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func `[]`*(s: string; node: HtmlNode): string =
  s[node.slice()]

func nodeString*(node: HtmlNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: HtmlNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: HtmlNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: HtmlNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: HtmlNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: HtmlNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: HtmlNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: HtmlNode): HtmlNode =
  HtmlNode(ts_node_parent(TSNode(node)))

func child*(node: HtmlNode; a2: int): HtmlNode =
  HtmlNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: HtmlNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: HtmlNode; a2: int): HtmlNode =
  HtmlNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: HtmlNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: HtmlNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: HtmlNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: HtmlNode): int =
  node.startPoint().row.int

func endLine*(node: HtmlNode): int =
  node.endPoint().row.int

func startColumn*(node: HtmlNode): int =
  node.startPoint().column.int

func endColumn*(node: HtmlNode): int =
  node.endPoint().column.int

func childByFieldName*(self: HtmlNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
