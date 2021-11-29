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
    htmlHidEndTagName          ## _end_tag_name
    htmlHidNode                ## _node
    htmlHidDoctype             ## _doctype
    htmlHidScriptStartTagName  ## _script_start_tag_name
    htmlHidStyleStartTagName   ## _style_start_tag_name
    htmlHidImplicitEndTag      ## _implicit_end_tag
    htmlStyleStartTag          ## style_start_tag
    htmlScriptStartTag         ## script_start_tag
    htmlHidStartTagName        ## _start_tag_name
    htmlSyntaxError            ## Tree-sitter parser syntax error

proc strRepr*(kind: HtmlNodeKind): string =
  case kind:
    of htmlAttribute:              "attribute"
    of htmlDoctype:                "doctype"
    of htmlElement:                "element"
    of htmlEndTag:                 "end_tag"
    of htmlErroneousEndTag:        "erroneous_end_tag"
    of htmlFragment:               "fragment"
    of htmlQuotedAttributeValue:   "quoted_attribute_value"
    of htmlScriptElement:          "script_element"
    of htmlSelfClosingTag:         "self_closing_tag"
    of htmlStartTag:               "start_tag"
    of htmlStyleElement:           "style_element"
    of htmlQuoteTok:               "\""
    of htmlApostropheTok:          "\'"
    of htmlSlashGreaterThanTok:    "/>"
    of htmlLessThanTok:            "<"
    of htmlLessThanExclamationTok: "<!"
    of htmlLessThanSlashTok:       "</"
    of htmlEqualTok:               "="
    of htmlGreaterThanTok:         ">"
    of htmlAttributeName:          "attribute_name"
    of htmlAttributeValue:         "attribute_value"
    of htmlComment:                "comment"
    of htmlDoctypeTok:             "doctype"
    of htmlErroneousEndTagName:    "erroneous_end_tag_name"
    of htmlRawText:                "raw_text"
    of htmlTagName:                "tag_name"
    of htmlText:                   "text"
    of htmlHidEndTagName:          "_end_tag_name"
    of htmlHidNode:                "_node"
    of htmlHidDoctype:             "_doctype"
    of htmlHidScriptStartTagName:  "_script_start_tag_name"
    of htmlHidStyleStartTagName:   "_style_start_tag_name"
    of htmlHidImplicitEndTag:      "_implicit_end_tag"
    of htmlStyleStartTag:          "style_start_tag"
    of htmlScriptStartTag:         "script_start_tag"
    of htmlHidStartTagName:        "_start_tag_name"
    of htmlSyntaxError:            "ERROR"

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

const htmlAllowedSubnodes*: array[HtmlNodeKind, set[HtmlNodeKind]] = block:
                                                                       var tmp: array[HtmlNodeKind, set[HtmlNodeKind]]
                                                                       tmp[htmlAttribute] = {htmlAttributeName, htmlAttributeValue, htmlQuotedAttributeValue}
                                                                       tmp[htmlElement] = {
                                                                                            htmlDoctype,
                                                                                            htmlElement,
                                                                                            htmlEndTag,
                                                                                            htmlErroneousEndTag,
                                                                                            htmlScriptElement,
                                                                                            htmlSelfClosingTag,
                                                                                            htmlStartTag,
                                                                                            htmlStyleElement,
                                                                                            htmlText
                                                                                          }
                                                                       tmp[htmlEndTag] = {htmlTagName}
                                                                       tmp[htmlErroneousEndTag] = {htmlErroneousEndTagName}
                                                                       tmp[htmlFragment] = {htmlDoctype, htmlElement, htmlErroneousEndTag, htmlScriptElement, htmlStyleElement, htmlText}
                                                                       tmp[htmlQuotedAttributeValue] = {htmlAttributeValue}
                                                                       tmp[htmlScriptElement] = {htmlEndTag, htmlRawText, htmlStartTag}
                                                                       tmp[htmlSelfClosingTag] = {htmlAttribute, htmlTagName}
                                                                       tmp[htmlStartTag] = {htmlAttribute, htmlTagName}
                                                                       tmp[htmlStyleElement] = {htmlEndTag, htmlRawText, htmlStartTag}
                                                                       tmp
const htmlTokenKinds*: set[HtmlNodeKind] = {
                                             htmlQuoteTok,
                                             htmlApostropheTok,
                                             htmlSlashGreaterThanTok,
                                             htmlLessThanTok,
                                             htmlLessThanExclamationTok,
                                             htmlLessThanSlashTok,
                                             htmlEqualTok,
                                             htmlGreaterThanTok,
                                             htmlDoctypeTok
                                           }
const htmlHiddenKinds*: set[HtmlNodeKind] = {
                                              htmlHidEndTagName,
                                              htmlHidNode,
                                              htmlHidDoctype,
                                              htmlHidScriptStartTagName,
                                              htmlHidStyleStartTagName,
                                              htmlHidImplicitEndTag,
                                              htmlStyleStartTag,
                                              htmlScriptStartTag,
                                              htmlHidStartTagName
                                            }
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


import
  hmisc / wrappers/treesitter_core
let htmlGrammar*: array[HtmlNodeKind, HtsRule[HtmlNodeKind]] = block:
                                                                 var rules: array[HtmlNodeKind, HtsRule[HtmlNodeKind]]
                                                                 type
                                                                   K = HtmlNodeKind


                                                                 rules[htmlHidDoctype] = tsRegex[K]("[Dd][Oo][Cc][Tt][Yy][Pp][Ee]")
                                                                 rules[htmlEndTag] = tsSeq[K](tsString[K]("</"), tsSymbol[K](htmlHidEndTagName), tsString[K](">"))
                                                                 rules[htmlQuotedAttributeValue] = tsChoice[K](tsSeq[K](tsString[K]("\'"), tsChoice[K](tsRegex[K]("[^\']+"), tsBlank[K]()), tsString[K]("\'")), tsSeq[K](tsString[K]("\""), tsChoice[K](tsRegex[K]("[^\"]+"), tsBlank[K]()), tsString[K]("\"")))
                                                                 rules[htmlStyleElement] = tsSeq[K](tsSymbol[K](htmlStyleStartTag), tsChoice[K](tsSymbol[K](htmlRawText), tsBlank[K]()), tsSymbol[K](htmlEndTag))
                                                                 rules[htmlAttribute] = tsSeq[K](tsSymbol[K](htmlAttributeName), tsChoice[K](tsSeq[K](tsString[K]("="), tsChoice[K](tsSymbol[K](htmlAttributeValue), tsSymbol[K](htmlQuotedAttributeValue))), tsBlank[K]()))
                                                                 rules[htmlScriptElement] = tsSeq[K](tsSymbol[K](htmlScriptStartTag), tsChoice[K](tsSymbol[K](htmlRawText), tsBlank[K]()), tsSymbol[K](htmlEndTag))
                                                                 rules[htmlDoctype] = tsSeq[K](tsString[K]("<!"), tsSymbol[K](htmlHidDoctype), tsRegex[K]("[^>]+"), tsString[K](">"))
                                                                 rules[htmlFragment] = tsRepeat[K](tsSymbol[K](htmlHidNode))
                                                                 rules[htmlStyleStartTag] = tsSeq[K](tsString[K]("<"), tsSymbol[K](htmlHidStyleStartTagName), tsRepeat[K](tsSymbol[K](htmlAttribute)), tsString[K](">"))
                                                                 rules[htmlSelfClosingTag] = tsSeq[K](tsString[K]("<"), tsSymbol[K](htmlHidStartTagName), tsRepeat[K](tsSymbol[K](htmlAttribute)), tsString[K]("/>"))
                                                                 rules[htmlErroneousEndTag] = tsSeq[K](tsString[K]("</"), tsSymbol[K](htmlErroneousEndTagName), tsString[K](">"))
                                                                 rules[htmlText] = tsRegex[K]("[^<>\\s]([^<>]*[^<>\\s])?")
                                                                 rules[htmlElement] = tsChoice[K](tsSeq[K](tsSymbol[K](htmlStartTag), tsRepeat[K](tsSymbol[K](htmlHidNode)), tsChoice[K](tsSymbol[K](htmlEndTag), tsSymbol[K](htmlHidImplicitEndTag))), tsSymbol[K](htmlSelfClosingTag))
                                                                 rules[htmlAttributeValue] = tsRegex[K]("[^<>\"\'=\\s]+")
                                                                 rules[htmlHidNode] = tsChoice[K](tsSymbol[K](htmlDoctype), tsSymbol[K](htmlText), tsSymbol[K](htmlElement), tsSymbol[K](htmlScriptElement), tsSymbol[K](htmlStyleElement), tsSymbol[K](htmlErroneousEndTag))
                                                                 rules[htmlStartTag] = tsSeq[K](tsString[K]("<"), tsSymbol[K](htmlHidStartTagName), tsRepeat[K](tsSymbol[K](htmlAttribute)), tsString[K](">"))
                                                                 rules[htmlScriptStartTag] = tsSeq[K](tsString[K]("<"), tsSymbol[K](htmlHidScriptStartTagName), tsRepeat[K](tsSymbol[K](htmlAttribute)), tsString[K](">"))
                                                                 rules[htmlAttributeName] = tsRegex[K]("[^<>\"\'/=\\s]+")
                                                                 rules

