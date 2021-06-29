
import
  hmisc / wrappers / treesitter

import
  strutils

type
  Embedded_templateNodeKind* = enum
    embedded_templateCode,  ## code
    embedded_templateComment, ## comment
    embedded_templateCommentDirective, ## comment_directive
    embedded_templateContent, ## content
    embedded_templateDirective, ## directive
    embedded_templateGraphqlDirective, ## graphql_directive
    embedded_templateOutputDirective, ## output_directive
    embedded_templateTemplate, ## template
    embedded_templateDoublePercentGreaterThanTok, ## %%>
    embedded_templatePercentGreaterThanTok, ## %>
    embedded_templateMinusPercentGreaterThanTok, ## -%>
    embedded_templateLessThanPercentTok, ## <%
    embedded_templateLessThanPercentHashTok, ## <%#
    embedded_templateLessThanDoublePercentTok, ## <%%
    embedded_templateLessThanPercentMinusTok, ## <%-
    embedded_templateLessThanPercentEqualTok, ## <%=
    embedded_templateLessThanPercentUnderscoreTok, ## <%_
    embedded_templateLessThanPercentgraphqlTok, ## <%graphql
    embedded_templateEqualPercentGreaterThanTok, ## =%>
    embedded_templateUnderscorePercentGreaterThanTok, ## _%>
    embedded_templateSyntaxError ## Tree-sitter parser syntax error
type
  Embedded_templateNode* = distinct TSNode
type
  Embedded_templateParser* = distinct PtsParser
proc tsNodeType*(node: Embedded_templateNode): string
proc kind*(node: Embedded_templateNode): Embedded_templateNodeKind {.
    noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "code":
      embedded_templateCode
    of "comment":
      embedded_templateComment
    of "comment_directive":
      embedded_templateCommentDirective
    of "content":
      embedded_templateContent
    of "directive":
      embedded_templateDirective
    of "graphql_directive":
      embedded_templateGraphqlDirective
    of "output_directive":
      embedded_templateOutputDirective
    of "template":
      embedded_templateTemplate
    of "%%>":
      embedded_templateDoublePercentGreaterThanTok
    of "%>":
      embedded_templatePercentGreaterThanTok
    of "-%>":
      embedded_templateMinusPercentGreaterThanTok
    of "<%":
      embedded_templateLessThanPercentTok
    of "<%#":
      embedded_templateLessThanPercentHashTok
    of "<%%":
      embedded_templateLessThanDoublePercentTok
    of "<%-":
      embedded_templateLessThanPercentMinusTok
    of "<%=":
      embedded_templateLessThanPercentEqualTok
    of "<%_":
      embedded_templateLessThanPercentUnderscoreTok
    of "<%graphql":
      embedded_templateLessThanPercentgraphqlTok
    of "=%>":
      embedded_templateEqualPercentGreaterThanTok
    of "_%>":
      embedded_templateUnderscorePercentGreaterThanTok
    of "ERROR":
      embedded_templateSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_embedded_template(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: Embedded_templateNode): string =
  $ts_node_type(TSNode(node))

proc newEmbedded_templateParser*(): Embedded_templateParser =
  result = Embedded_templateParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result),
                                 tree_sitter_embedded_template())

proc parseString*(parser: Embedded_templateParser; str: string): Embedded_templateNode =
  Embedded_templateNode(ts_tree_root_node(ts_parser_parse_string(
      PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseEmbedded_templateString*(str: string): Embedded_templateNode =
  let parser = newEmbedded_templateParser()
  return parseString(parser, str)

func `[]`*(node: Embedded_templateNode; idx: int; withUnnamed: bool = false): Embedded_templateNode =
  if withUnnamed:
    Embedded_templateNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    Embedded_templateNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: Embedded_templateNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: Embedded_templateNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: Embedded_templateNode; withUnnamed: bool = false): Embedded_templateNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                                                 ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: Embedded_templateNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: Embedded_templateNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: Embedded_templateNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: Embedded_templateNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: Embedded_templateNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: Embedded_templateNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: Embedded_templateNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: Embedded_templateNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: Embedded_templateNode): Embedded_templateNode =
  Embedded_templateNode(ts_node_parent(TSNode(node)))

func child*(node: Embedded_templateNode; a2: int): Embedded_templateNode =
  Embedded_templateNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: Embedded_templateNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: Embedded_templateNode; a2: int): Embedded_templateNode =
  Embedded_templateNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: Embedded_templateNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: Embedded_templateNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: Embedded_templateNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: Embedded_templateNode): int =
  node.startPoint().row.int

func endLine*(node: Embedded_templateNode): int =
  node.endPoint().row.int

func startColumn*(node: Embedded_templateNode): int =
  node.startPoint().column.int

func endColumn*(node: Embedded_templateNode): int =
  node.endPoint().column.int

func childByFieldName*(self: Embedded_templateNode; fieldName: string;
                       fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
