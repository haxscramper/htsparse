
import
  hmisc / wrappers / treesitter

import
  strutils

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
proc kind*(node: EnoNode): EnoNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
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

proc parseEnoString*(str: string): EnoNode =
  let parser = newEnoParser()
  return parseString(parser, str)

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
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                     ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

iterator pairs*(node: EnoNode; withUnnamed: bool = false): (int, EnoNode) =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                            ## nodes.
  for i in 0 ..< node.len(withUnnamed):
    yield (i, node[i, withUnnamed])

func slice*(node: EnoNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func `[]`*(s: string; node: EnoNode): string =
  s[node.slice()]

func nodeString*(node: EnoNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: EnoNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: EnoNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: EnoNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: EnoNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: EnoNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: EnoNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: EnoNode): EnoNode =
  EnoNode(ts_node_parent(TSNode(node)))

func child*(node: EnoNode; a2: int): EnoNode =
  EnoNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: EnoNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: EnoNode; a2: int): EnoNode =
  EnoNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: EnoNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: EnoNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: EnoNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: EnoNode): int =
  node.startPoint().row.int

func endLine*(node: EnoNode): int =
  node.endPoint().row.int

func startColumn*(node: EnoNode): int =
  node.startPoint().column.int

func endColumn*(node: EnoNode): int =
  node.endPoint().column.int

func childByFieldName*(self: EnoNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
