
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  EnoNodeKind* = enum
    enoComment,             ## comment
    enoContinuation,        ## continuation
    enoDocument,            ## document
    enoElement,             ## element
    enoEmpty,               ## empty
    enoEntry,               ## entry
    enoField,               ## field
    enoFieldset,            ## fieldset
    enoItem,                ## item
    enoList,                ## list
    enoSection,             ## section
    enoValue,               ## value
    enoCommentOperator,     ## commentOperator
    enoCopyOperator,        ## copyOperator
    enoDeepCopyOperator,    ## deepCopyOperator
    enoDirectContinuationOperator, ## directContinuationOperator
    enoElementOperator,     ## elementOperator
    enoEntryOperator,       ## entryOperator
    enoEscapeOperator,      ## escapeOperator
    enoItemOperator,        ## itemOperator
    enoKey,                 ## key
    enoMultilineFieldOperator, ## multilineFieldOperator
    enoSectionOperator,     ## sectionOperator
    enoSpacedContinuationOperator, ## spacedContinuationOperator
    enoTemplate,            ## template
    enoSyntaxError           ## Tree-sitter parser syntax error
type
  EnoExternalTok* = enum
    enoExtern_endOfLine,    ## _endOfLine
    enoExtern_multilineFieldEnd, ## _multilineFieldEnd
    enoExtern_multilineFieldLine, ## _multilineFieldLine
    enoExtern_sectionAscend, ## _sectionAscend
    enoExtern_sectionDescend, ## _sectionDescend
    enoExternEscapedKey,    ## escapedKey
    enoExternEscapeOperator, ## escapeOperator
    enoExternMultilineFieldKey, ## multilineFieldKey
    enoExternMultilineFieldOperator ## multilineFieldOperator
type
  EnoNode* = distinct TSNode
type
  EnoParser* = distinct PtsParser
proc tsNodeType*(node: EnoNode): string
proc kind*(node: EnoNode): EnoNodeKind =
  case node.tsNodeType
  of "comment":
    enoComment
  of "continuation":
    enoContinuation
  of "document":
    enoDocument
  of "element":
    enoElement
  of "empty":
    enoEmpty
  of "entry":
    enoEntry
  of "field":
    enoField
  of "fieldset":
    enoFieldset
  of "item":
    enoItem
  of "list":
    enoList
  of "section":
    enoSection
  of "value":
    enoValue
  of "commentOperator":
    enoCommentOperator
  of "copyOperator":
    enoCopyOperator
  of "deepCopyOperator":
    enoDeepCopyOperator
  of "directContinuationOperator":
    enoDirectContinuationOperator
  of "elementOperator":
    enoElementOperator
  of "entryOperator":
    enoEntryOperator
  of "escapeOperator":
    enoEscapeOperator
  of "itemOperator":
    enoItemOperator
  of "key":
    enoKey
  of "multilineFieldOperator":
    enoMultilineFieldOperator
  of "sectionOperator":
    enoSectionOperator
  of "spacedContinuationOperator":
    enoSpacedContinuationOperator
  of "template":
    enoTemplate
  of "ERROR":
    enoSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_eno(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: EnoNode): string =
  $ts_node_type(TSNode(node))

proc newEnoParser*(): EnoParser =
  result = EnoParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_eno())

proc parseString*(parser: EnoParser; str: string): EnoNode =
  EnoNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: EnoNode; idx: int; withUnnamed: bool = false): EnoNode =
  if withUnnamed:
    EnoNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    EnoNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: EnoNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: EnoNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: EnoNode; withUnnamed: bool = false): EnoNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: EnoNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: EnoNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: EnoNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
