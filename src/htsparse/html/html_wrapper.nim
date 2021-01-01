
import
  hparse / htreesitter / htreesitter, sequtils, strutils

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
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: HtmlNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: HtmlNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: HtmlNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
