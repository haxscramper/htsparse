
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  Embedded_templateNodeKind* = enum
    embedded_templateCommentDirective, ## comment_directive
    embedded_templateDirective, ## directive
    embedded_templateOutputDirective, ## output_directive
    embedded_templateTemplate, ## template
    embedded_templatePercentGreaterThanTok, ## %>
    embedded_templateMinusPercentGreaterThanTok, ## -%>
    embedded_templateLessThanPercentTok, ## <%
    embedded_templateLessThanPercentHashTok, ## <%#
    embedded_templateLessThanPercentMinusTok, ## <%-
    embedded_templateLessThanPercentEqualTok, ## <%=
    embedded_templateLessThanPercentUnderscoreTok, ## <%_
    embedded_templateUnderscorePercentGreaterThanTok, ## _%>
    embedded_templateCode,  ## code
    embedded_templateComment, ## comment
    embedded_templateContent, ## content
    embedded_templateSyntaxError ## Tree-sitter parser syntax error
type
  Embedded_templateExternalTok* = enum
    embedded_templateExternCode, ## code
    embedded_templateExternContent ## content
type
  Embedded_templateNode* = distinct TSNode
type
  Embedded_templateParser* = distinct PtsParser
proc tsNodeType*(node: Embedded_templateNode): string
proc kind*(node: Embedded_templateNode): Embedded_templateNodeKind {.
    noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "comment_directive":
      embedded_templateCommentDirective
    of "directive":
      embedded_templateDirective
    of "output_directive":
      embedded_templateOutputDirective
    of "template":
      embedded_templateTemplate
    of "%>":
      embedded_templatePercentGreaterThanTok
    of "-%>":
      embedded_templateMinusPercentGreaterThanTok
    of "<%":
      embedded_templateLessThanPercentTok
    of "<%#":
      embedded_templateLessThanPercentHashTok
    of "<%-":
      embedded_templateLessThanPercentMinusTok
    of "<%=":
      embedded_templateLessThanPercentEqualTok
    of "<%_":
      embedded_templateLessThanPercentUnderscoreTok
    of "_%>":
      embedded_templateUnderscorePercentGreaterThanTok
    of "code":
      embedded_templateCode
    of "comment":
      embedded_templateComment
    of "content":
      embedded_templateContent
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
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: Embedded_templateNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: Embedded_templateNode; instr: string;
               withUnnamed: bool = false): string =
  proc aux(node: Embedded_templateNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[17 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
