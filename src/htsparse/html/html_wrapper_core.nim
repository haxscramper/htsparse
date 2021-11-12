import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  HtmlNodeKind* = enum
    htmlAttribute              ## attribute
    htmlDoctype                ## doctype
    htmlElement                ## element
    htmlEndTag                 ## end_tag
    htmlErroneousEndTag        ## erroneous_end_tag
    htmlFragment               ## fragment
    htmlQuotedAttributeValue   ## quoted_attribute_value
    htmlScriptElement          ## script_element
    htmlSelfClosingTag         ## self_closing_tag
    htmlStartTag               ## start_tag
    htmlStyleElement           ## style_element
    htmlQuoteTok               ## "
    htmlApostropheTok          ## '
    htmlSlashGreaterThanTok    ## />
    htmlLessThanTok            ## <
    htmlLessThanExclamationTok ## <!
    htmlLessThanSlashTok       ## </
    htmlEqualTok               ## =
    htmlGreaterThanTok         ## >
    htmlAttributeName          ## attribute_name
    htmlAttributeValue         ## attribute_value
    htmlComment                ## comment
    htmlDoctypeTok             ## doctype
    htmlErroneousEndTagName    ## erroneous_end_tag_name
    htmlRawText                ## raw_text
    htmlTagName                ## tag_name
    htmlText                   ## text
    htmlSyntaxError            ## Tree-sitter parser syntax error


type
  HtmlExternalTok* = enum
    htmlExtern_start_tag_name        ## _start_tag_name
    htmlExtern_script_start_tag_name ## _script_start_tag_name
    htmlExtern_style_start_tag_name  ## _style_start_tag_name
    htmlExtern_end_tag_name          ## _end_tag_name
    htmlExternErroneous_end_tag_name ## erroneous_end_tag_name
    htmlExtern_implicit_end_tag      ## _implicit_end_tag
    htmlExternRaw_text               ## raw_text
    htmlExternComment                ## comment


type
  TsHtmlNode* = distinct TSNode


type
  HtmlParser* = distinct PtsParser


proc tsNodeType*(node: TsHtmlNode): string



proc kind*(node: TsHtmlNode): HtmlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "attribute":              htmlAttribute
      of "doctype":                htmlDoctype
      of "element":                htmlElement
      of "end_tag":                htmlEndTag
      of "erroneous_end_tag":      htmlErroneousEndTag
      of "fragment":               htmlFragment
      of "quoted_attribute_value": htmlQuotedAttributeValue
      of "script_element":         htmlScriptElement
      of "self_closing_tag":       htmlSelfClosingTag
      of "start_tag":              htmlStartTag
      of "style_element":          htmlStyleElement
      of "\"":                     htmlQuoteTok
      of "\'":                     htmlApostropheTok
      of "/>":                     htmlSlashGreaterThanTok
      of "<":                      htmlLessThanTok
      of "<!":                     htmlLessThanExclamationTok
      of "</":                     htmlLessThanSlashTok
      of "=":                      htmlEqualTok
      of ">":                      htmlGreaterThanTok
      of "attribute_name":         htmlAttributeName
      of "attribute_value":        htmlAttributeValue
      of "comment":                htmlComment
      of "erroneous_end_tag_name": htmlErroneousEndTagName
      of "raw_text":               htmlRawText
      of "tag_name":               htmlTagName
      of "text":                   htmlText
      of "ERROR":                  htmlSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsHtmlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsHtmlNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsHtmlNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_html(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsHtmlNode): string =
  $ts_node_type(TSNode(node))

proc newTsHtmlParser*(): HtmlParser =
  result = HtmlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_html())

proc parseString*(parser: HtmlParser, str: string): TsHtmlNode =
  TsHtmlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsHtmlString*(str: string): TsHtmlNode =
  let parser = newTsHtmlParser()
  return parseString(parser, str)

func `$`*(node: TsHtmlNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsHtmlNode, str: string): string =
  var res = addr result
  proc aux(node: TsHtmlNode, level: int) =
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


