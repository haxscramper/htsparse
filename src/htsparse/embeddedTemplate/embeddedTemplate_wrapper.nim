import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  EmbeddedTemplateNodeKind* = enum
    embeddedTemplateCode                               ## code
    embeddedTemplateComment                            ## comment
    embeddedTemplateCommentDirective                   ## comment_directive
    embeddedTemplateContent                            ## content
    embeddedTemplateDirective                          ## directive
    embeddedTemplateGraphqlDirective                   ## graphql_directive
    embeddedTemplateOutputDirective                    ## output_directive
    embeddedTemplateTemplate                           ## template
    embeddedTemplateDoublePercentGreaterThanTok        ## %%>
    embeddedTemplatePercentGreaterThanTok              ## %>
    embeddedTemplateMinusPercentGreaterThanTok         ## -%>
    embeddedTemplateLessThanPercentTok                 ## <%
    embeddedTemplateLessThanPercentHashTok             ## <%#
    embeddedTemplateLessThanDoublePercentTok           ## <%%
    embeddedTemplateLessThanPercentMinusTok            ## <%-
    embeddedTemplateLessThanPercentEqualTok            ## <%=
    embeddedTemplateLessThanPercentUnderscoreTok       ## <%_
    embeddedTemplateLessThanPercentgraphqlTok          ## <%graphql
    embeddedTemplateEqualPercentGreaterThanTok         ## =%>
    embeddedTemplateHidUnderscorePercentGreaterThanTok ## _%>
    embeddedTemplateSyntaxError                        ## Tree-sitter parser syntax error

proc strRepr*(kind: EmbeddedTemplateNodeKind): string =
  case kind:
    of embeddedTemplateCode:                               "code"
    of embeddedTemplateComment:                            "comment"
    of embeddedTemplateCommentDirective:                   "comment_directive"
    of embeddedTemplateContent:                            "content"
    of embeddedTemplateDirective:                          "directive"
    of embeddedTemplateGraphqlDirective:                   "graphql_directive"
    of embeddedTemplateOutputDirective:                    "output_directive"
    of embeddedTemplateTemplate:                           "template"
    of embeddedTemplateDoublePercentGreaterThanTok:        "%%>"
    of embeddedTemplatePercentGreaterThanTok:              "%>"
    of embeddedTemplateMinusPercentGreaterThanTok:         "-%>"
    of embeddedTemplateLessThanPercentTok:                 "<%"
    of embeddedTemplateLessThanPercentHashTok:             "<%#"
    of embeddedTemplateLessThanDoublePercentTok:           "<%%"
    of embeddedTemplateLessThanPercentMinusTok:            "<%-"
    of embeddedTemplateLessThanPercentEqualTok:            "<%="
    of embeddedTemplateLessThanPercentUnderscoreTok:       "<%_"
    of embeddedTemplateLessThanPercentgraphqlTok:          "<%graphql"
    of embeddedTemplateEqualPercentGreaterThanTok:         "=%>"
    of embeddedTemplateHidUnderscorePercentGreaterThanTok: "_%>"
    of embeddedTemplateSyntaxError:                        "ERROR"

type
  TsEmbeddedTemplateNode* = distinct TSNode

type
  EmbeddedTemplateParser* = distinct PtsParser

const embeddedTemplateAllowedSubnodes*: array[EmbeddedTemplateNodeKind, set[EmbeddedTemplateNodeKind]] = block:
                                                                                                           var tmp: array[EmbeddedTemplateNodeKind, set[EmbeddedTemplateNodeKind]]
                                                                                                           tmp[embeddedTemplateCommentDirective] = {embeddedTemplateComment}
                                                                                                           tmp[embeddedTemplateDirective] = {embeddedTemplateCode}
                                                                                                           tmp[embeddedTemplateGraphqlDirective] = {embeddedTemplateCode}
                                                                                                           tmp[embeddedTemplateOutputDirective] = {embeddedTemplateCode}
                                                                                                           tmp[embeddedTemplateTemplate] = {embeddedTemplateCommentDirective, embeddedTemplateContent, embeddedTemplateDirective, embeddedTemplateGraphqlDirective, embeddedTemplateOutputDirective}
                                                                                                           tmp
const embeddedTemplateTokenKinds*: set[EmbeddedTemplateNodeKind] = {
                                                                     embeddedTemplateDoublePercentGreaterThanTok,
                                                                     embeddedTemplatePercentGreaterThanTok,
                                                                     embeddedTemplateMinusPercentGreaterThanTok,
                                                                     embeddedTemplateLessThanPercentTok,
                                                                     embeddedTemplateLessThanPercentHashTok,
                                                                     embeddedTemplateLessThanDoublePercentTok,
                                                                     embeddedTemplateLessThanPercentMinusTok,
                                                                     embeddedTemplateLessThanPercentEqualTok,
                                                                     embeddedTemplateLessThanPercentUnderscoreTok,
                                                                     embeddedTemplateLessThanPercentgraphqlTok,
                                                                     embeddedTemplateEqualPercentGreaterThanTok,
                                                                     embeddedTemplateHidUnderscorePercentGreaterThanTok
                                                                   }
const embeddedTemplateHiddenKinds*: set[EmbeddedTemplateNodeKind] = {}
proc tsNodeType*(node: TsEmbeddedTemplateNode): string


proc kind*(
    node: TsEmbeddedTemplateNode
  ): EmbeddedTemplateNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "code":              embeddedTemplateCode
      of "comment":           embeddedTemplateComment
      of "comment_directive": embeddedTemplateCommentDirective
      of "content":           embeddedTemplateContent
      of "directive":         embeddedTemplateDirective
      of "graphql_directive": embeddedTemplateGraphqlDirective
      of "output_directive":  embeddedTemplateOutputDirective
      of "template":          embeddedTemplateTemplate
      of "%%>":               embeddedTemplateDoublePercentGreaterThanTok
      of "%>":                embeddedTemplatePercentGreaterThanTok
      of "-%>":               embeddedTemplateMinusPercentGreaterThanTok
      of "<%":                embeddedTemplateLessThanPercentTok
      of "<%#":               embeddedTemplateLessThanPercentHashTok
      of "<%%":               embeddedTemplateLessThanDoublePercentTok
      of "<%-":               embeddedTemplateLessThanPercentMinusTok
      of "<%=":               embeddedTemplateLessThanPercentEqualTok
      of "<%_":               embeddedTemplateLessThanPercentUnderscoreTok
      of "<%graphql":         embeddedTemplateLessThanPercentgraphqlTok
      of "=%>":               embeddedTemplateEqualPercentGreaterThanTok
      of "_%>":               embeddedTemplateHidUnderscorePercentGreaterThanTok
      of "ERROR":             embeddedTemplateSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsEmbeddedTemplateNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsEmbeddedTemplateNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(
    node:    TsEmbeddedTemplateNode,
    idx:     int,
    unnamed: bool = false
  ): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_embedded_template(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsEmbeddedTemplateNode): string =
  $ts_node_type(TSNode(node))

proc newTsEmbeddedTemplateParser*(): EmbeddedTemplateParser =
  result = EmbeddedTemplateParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_embedded_template())

proc parseString*(
    parser: EmbeddedTemplateParser,
    str:    string
  ): TsEmbeddedTemplateNode =
  TsEmbeddedTemplateNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsEmbeddedTemplateString*(str: string): TsEmbeddedTemplateNode =
  let parser = newTsEmbeddedTemplateParser()
  return parseString(parser, str)

func `$`*(node: TsEmbeddedTemplateNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsEmbeddedTemplateNode,
    idx:  int,
    kind: EmbeddedTemplateNodeKind | set[EmbeddedTemplateNodeKind]
  ): TsEmbeddedTemplateNode =
  assert 0 <= idx and idx < node.len
  result = TsEmbeddedTemplateNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  EmbeddedTemplateNode* = HtsNode[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind]


proc treeReprTsEmbeddedTemplate*(
    str:     string,
    unnamed: bool = false
  ): ColoredText =
  treeRepr[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind](parseTsEmbeddedTemplateString(str), str, 16, unnamed = unnamed)

proc toHtsNode*(
    node: TsEmbeddedTemplateNode,
    str:  ptr string
  ): HtsNode[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind] =
  toHtsNode[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind](node, str)

proc toHtsTree*(
    node: TsEmbeddedTemplateNode,
    str:  ptr string
  ): EmbeddedTemplateNode =
  toHtsNode[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind](node, str)

proc parseEmbeddedTemplateString*(
    str:     ptr string,
    unnamed: bool = false
  ): EmbeddedTemplateNode =
  let parser = newTsEmbeddedTemplateParser()
  return toHtsTree[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind](parseString(parser, str[]), str)

proc parseEmbeddedTemplateString*(
    str:     string,
    unnamed: bool = false
  ): EmbeddedTemplateNode =
  let parser = newTsEmbeddedTemplateParser()
  return toHtsTree[TsEmbeddedTemplateNode, EmbeddedTemplateNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let embeddedTemplateGrammar*: array[EmbeddedTemplateNodeKind, HtsRule[EmbeddedTemplateNodeKind]] = block:
                                                                                                     var rules: array[EmbeddedTemplateNodeKind, HtsRule[EmbeddedTemplateNodeKind]]
                                                                                                     type
                                                                                                       K = EmbeddedTemplateNodeKind


                                                                                                     rules[embeddedTemplateCode] = tsRepeat1[K](tsChoice[K](tsRegex[K]("[^%=_-]+|[%=_-]"), tsString[K]("%%>")))
                                                                                                     rules[embeddedTemplateOutputDirective] = tsSeq[K](tsChoice[K](tsString[K]("<%="), tsString[K]("<%-")), tsSymbol[K](embeddedTemplateCode), tsChoice[K](tsString[K]("%>"), tsString[K]("-%>"), tsString[K]("=%>")))
                                                                                                     rules[embeddedTemplateCommentDirective] = tsSeq[K](tsString[K]("<%#"), tsSymbol[K](embeddedTemplateCode), tsString[K]("%>"))
                                                                                                     rules[embeddedTemplateContent] = tsRepeat1[K](tsChoice[K](tsRegex[K]("[^<]+|<"), tsString[K]("<%%")))
                                                                                                     rules[embeddedTemplateDirective] = tsSeq[K](tsChoice[K](tsString[K]("<%"), tsString[K]("<%_")), tsSymbol[K](embeddedTemplateCode), tsChoice[K](tsString[K]("%>"), tsString[K]("-%>"), tsString[K]("_%>")))
                                                                                                     rules[embeddedTemplateGraphqlDirective] = tsSeq[K](tsString[K]("<%graphql"), tsSymbol[K](embeddedTemplateCode), tsString[K]("%>"))
                                                                                                     rules[embeddedTemplateTemplate] = tsRepeat[K](tsChoice[K](tsSymbol[K](embeddedTemplateDirective), tsSymbol[K](embeddedTemplateOutputDirective), tsSymbol[K](embeddedTemplateCommentDirective), tsSymbol[K](embeddedTemplateGraphqlDirective), tsSymbol[K](embeddedTemplateContent)))
                                                                                                     rules

