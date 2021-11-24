import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  Embedded_templateNodeKind* = enum
    embedded_templateCode                              ## code
    embedded_templateComment                           ## comment
    embedded_templateCommentDirective                  ## comment_directive
    embedded_templateContent                           ## content
    embedded_templateDirective                         ## directive
    embedded_templateGraphqlDirective                  ## graphql_directive
    embedded_templateOutputDirective                   ## output_directive
    embedded_templateTemplate                          ## template
    embedded_templateDoublePercentGreaterThanTok       ## %%>
    embedded_templatePercentGreaterThanTok             ## %>
    embedded_templateMinusPercentGreaterThanTok        ## -%>
    embedded_templateLessThanPercentTok                ## <%
    embedded_templateLessThanPercentHashTok            ## <%#
    embedded_templateLessThanDoublePercentTok          ## <%%
    embedded_templateLessThanPercentMinusTok           ## <%-
    embedded_templateLessThanPercentEqualTok           ## <%=
    embedded_templateLessThanPercentUnderscoreTok      ## <%_
    embedded_templateLessThanPercentgraphqlTok         ## <%graphql
    embedded_templateEqualPercentGreaterThanTok        ## =%>
    embedded_templateUsUnderscorePercentGreaterThanTok ## _%>
    embedded_templateSyntaxError                       ## Tree-sitter parser syntax error


proc strRepr*(kind: Embedded_templateNodeKind): string =
  case kind:
    of embedded_templateCode:                              "code"
    of embedded_templateComment:                           "comment"
    of embedded_templateCommentDirective:                  "comment_directive"
    of embedded_templateContent:                           "content"
    of embedded_templateDirective:                         "directive"
    of embedded_templateGraphqlDirective:                  "graphql_directive"
    of embedded_templateOutputDirective:                   "output_directive"
    of embedded_templateTemplate:                          "template"
    of embedded_templateDoublePercentGreaterThanTok:       "%%>"
    of embedded_templatePercentGreaterThanTok:             "%>"
    of embedded_templateMinusPercentGreaterThanTok:        "-%>"
    of embedded_templateLessThanPercentTok:                "<%"
    of embedded_templateLessThanPercentHashTok:            "<%#"
    of embedded_templateLessThanDoublePercentTok:          "<%%"
    of embedded_templateLessThanPercentMinusTok:           "<%-"
    of embedded_templateLessThanPercentEqualTok:           "<%="
    of embedded_templateLessThanPercentUnderscoreTok:      "<%_"
    of embedded_templateLessThanPercentgraphqlTok:         "<%graphql"
    of embedded_templateEqualPercentGreaterThanTok:        "=%>"
    of embedded_templateUsUnderscorePercentGreaterThanTok: "_%>"
    of embedded_templateSyntaxError:                       "ERROR"


type
  TsEmbedded_templateNode* = distinct TSNode


type
  Embedded_templateParser* = distinct PtsParser


const embedded_templateAllowedSubnodes*: array[Embedded_templateNodeKind, set[Embedded_templateNodeKind]] = block:
                                                                                                              var tmp: array[Embedded_templateNodeKind, set[Embedded_templateNodeKind]]
                                                                                                              tmp[embedded_templateCommentDirective] = {embedded_templateComment}
                                                                                                              tmp[embedded_templateDirective] = {embedded_templateCode}
                                                                                                              tmp[embedded_templateGraphqlDirective] = {embedded_templateCode}
                                                                                                              tmp[embedded_templateOutputDirective] = {embedded_templateCode}
                                                                                                              tmp[embedded_templateTemplate] = {embedded_templateCommentDirective, embedded_templateContent, embedded_templateDirective, embedded_templateGraphqlDirective, embedded_templateOutputDirective}
                                                                                                              tmp
const embedded_templateTokenKinds*: set[Embedded_templateNodeKind] = {
                                                                       embedded_templateDoublePercentGreaterThanTok,
                                                                       embedded_templatePercentGreaterThanTok,
                                                                       embedded_templateMinusPercentGreaterThanTok,
                                                                       embedded_templateLessThanPercentTok,
                                                                       embedded_templateLessThanPercentHashTok,
                                                                       embedded_templateLessThanDoublePercentTok,
                                                                       embedded_templateLessThanPercentMinusTok,
                                                                       embedded_templateLessThanPercentEqualTok,
                                                                       embedded_templateLessThanPercentUnderscoreTok,
                                                                       embedded_templateLessThanPercentgraphqlTok,
                                                                       embedded_templateEqualPercentGreaterThanTok,
                                                                       embedded_templateUsUnderscorePercentGreaterThanTok
                                                                     }

proc tsNodeType*(node: TsEmbedded_templateNode): string



proc kind*(
    node: TsEmbedded_templateNode
  ): Embedded_templateNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "code":              embedded_templateCode
      of "comment":           embedded_templateComment
      of "comment_directive": embedded_templateCommentDirective
      of "content":           embedded_templateContent
      of "directive":         embedded_templateDirective
      of "graphql_directive": embedded_templateGraphqlDirective
      of "output_directive":  embedded_templateOutputDirective
      of "template":          embedded_templateTemplate
      of "%%>":               embedded_templateDoublePercentGreaterThanTok
      of "%>":                embedded_templatePercentGreaterThanTok
      of "-%>":               embedded_templateMinusPercentGreaterThanTok
      of "<%":                embedded_templateLessThanPercentTok
      of "<%#":               embedded_templateLessThanPercentHashTok
      of "<%%":               embedded_templateLessThanDoublePercentTok
      of "<%-":               embedded_templateLessThanPercentMinusTok
      of "<%=":               embedded_templateLessThanPercentEqualTok
      of "<%_":               embedded_templateLessThanPercentUnderscoreTok
      of "<%graphql":         embedded_templateLessThanPercentgraphqlTok
      of "=%>":               embedded_templateEqualPercentGreaterThanTok
      of "_%>":               embedded_templateUsUnderscorePercentGreaterThanTok
      of "ERROR":             embedded_templateSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsEmbedded_templateNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsEmbedded_templateNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(
    node:    TsEmbedded_templateNode,
    idx:     int,
    unnamed: bool = false
  ): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_embedded_template(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsEmbedded_templateNode): string =
  $ts_node_type(TSNode(node))

proc newTsEmbedded_templateParser*(): Embedded_templateParser =
  result = Embedded_templateParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_embedded_template())

proc parseString*(
    parser: Embedded_templateParser,
    str:    string
  ): TsEmbedded_templateNode =
  TsEmbedded_templateNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsEmbedded_templateString*(str: string): TsEmbedded_templateNode =
  let parser = newTsEmbedded_templateParser()
  return parseString(parser, str)

func `$`*(node: TsEmbedded_templateNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsEmbedded_templateNode, str: string): string =
  var res = addr result
  proc aux(node: TsEmbedded_templateNode, level: int) =
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


