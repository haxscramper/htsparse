import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  EnoNodeKind* = enum
    enoComment                    ## comment
    enoContinuation               ## continuation
    enoDocument                   ## document
    enoElement                    ## element
    enoEmpty                      ## empty
    enoEntry                      ## entry
    enoField                      ## field
    enoFieldset                   ## fieldset
    enoItem                       ## item
    enoList                       ## list
    enoSection                    ## section
    enoValue                      ## value
    enoCommentOperator            ## commentOperator
    enoCopyOperator               ## copyOperator
    enoDeepCopyOperator           ## deepCopyOperator
    enoDirectContinuationOperator ## directContinuationOperator
    enoElementOperator            ## elementOperator
    enoEntryOperator              ## entryOperator
    enoEscapeOperator             ## escapeOperator
    enoItemOperator               ## itemOperator
    enoKey                        ## key
    enoMultilineFieldOperator     ## multilineFieldOperator
    enoSectionOperator            ## sectionOperator
    enoSpacedContinuationOperator ## spacedContinuationOperator
    enoTemplate                   ## template
    enoSyntaxError                ## Tree-sitter parser syntax error


proc strRepr*(kind: EnoNodeKind): string =
  case kind:
    of enoComment:                    "comment"
    of enoContinuation:               "continuation"
    of enoDocument:                   "document"
    of enoElement:                    "element"
    of enoEmpty:                      "empty"
    of enoEntry:                      "entry"
    of enoField:                      "field"
    of enoFieldset:                   "fieldset"
    of enoItem:                       "item"
    of enoList:                       "list"
    of enoSection:                    "section"
    of enoValue:                      "value"
    of enoCommentOperator:            "commentOperator"
    of enoCopyOperator:               "copyOperator"
    of enoDeepCopyOperator:           "deepCopyOperator"
    of enoDirectContinuationOperator: "directContinuationOperator"
    of enoElementOperator:            "elementOperator"
    of enoEntryOperator:              "entryOperator"
    of enoEscapeOperator:             "escapeOperator"
    of enoItemOperator:               "itemOperator"
    of enoKey:                        "key"
    of enoMultilineFieldOperator:     "multilineFieldOperator"
    of enoSectionOperator:            "sectionOperator"
    of enoSpacedContinuationOperator: "spacedContinuationOperator"
    of enoTemplate:                   "template"
    of enoSyntaxError:                "ERROR"


type
  EnoExternalTok* = enum
    enoExtern_endOfLine             ## _endOfLine
    enoExtern_multilineFieldEnd     ## _multilineFieldEnd
    enoExtern_multilineFieldLine    ## _multilineFieldLine
    enoExtern_sectionAscend         ## _sectionAscend
    enoExtern_sectionDescend        ## _sectionDescend
    enoExternEscapedKey             ## escapedKey
    enoExternEscapeOperator         ## escapeOperator
    enoExternMultilineFieldKey      ## multilineFieldKey
    enoExternMultilineFieldOperator ## multilineFieldOperator


type
  TsEnoNode* = distinct TSNode


type
  EnoParser* = distinct PtsParser


const enoAllowedSubnodes*: array[EnoNodeKind, set[EnoNodeKind]] = block:
                                                                    var tmp: array[EnoNodeKind, set[EnoNodeKind]]
                                                                    tmp[enoComment] = {enoComment, enoCommentOperator}
                                                                    tmp[enoContinuation] = {enoDirectContinuationOperator, enoSpacedContinuationOperator, enoValue}
                                                                    tmp[enoDocument] = {
                                                                                         enoComment,
                                                                                         enoElement,
                                                                                         enoEmpty,
                                                                                         enoField,
                                                                                         enoFieldset,
                                                                                         enoList,
                                                                                         enoSection
                                                                                       }
                                                                    tmp[enoElement] = {enoCopyOperator, enoElementOperator, enoEscapeOperator, enoKey, enoTemplate}
                                                                    tmp[enoEmpty] = {enoEscapeOperator, enoKey}
                                                                    tmp[enoEntry] = {enoComment, enoContinuation, enoEntryOperator, enoEscapeOperator, enoKey, enoValue}
                                                                    tmp[enoField] = {
                                                                                      enoComment,
                                                                                      enoContinuation,
                                                                                      enoElementOperator,
                                                                                      enoEscapeOperator,
                                                                                      enoKey,
                                                                                      enoMultilineFieldOperator,
                                                                                      enoValue
                                                                                    }
                                                                    tmp[enoFieldset] = {
                                                                                         enoComment,
                                                                                         enoCopyOperator,
                                                                                         enoElementOperator,
                                                                                         enoEntry,
                                                                                         enoEscapeOperator,
                                                                                         enoKey,
                                                                                         enoTemplate
                                                                                       }
                                                                    tmp[enoItem] = {enoComment, enoContinuation, enoItemOperator, enoValue}
                                                                    tmp[enoList] = {
                                                                                     enoComment,
                                                                                     enoCopyOperator,
                                                                                     enoElementOperator,
                                                                                     enoEscapeOperator,
                                                                                     enoItem,
                                                                                     enoKey,
                                                                                     enoTemplate
                                                                                   }
                                                                    tmp[enoSection] = {
                                                                                        enoComment,
                                                                                        enoCopyOperator,
                                                                                        enoDeepCopyOperator,
                                                                                        enoElement,
                                                                                        enoEmpty,
                                                                                        enoEscapeOperator,
                                                                                        enoField,
                                                                                        enoFieldset,
                                                                                        enoKey,
                                                                                        enoList,
                                                                                        enoSection,
                                                                                        enoSectionOperator,
                                                                                        enoTemplate
                                                                                      }
                                                                    tmp
const enoTokenKinds*: set[EnoNodeKind] = {}

proc tsNodeType*(node: TsEnoNode): string



proc kind*(node: TsEnoNode): EnoNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "comment":                    enoComment
      of "continuation":               enoContinuation
      of "document":                   enoDocument
      of "element":                    enoElement
      of "empty":                      enoEmpty
      of "entry":                      enoEntry
      of "field":                      enoField
      of "fieldset":                   enoFieldset
      of "item":                       enoItem
      of "list":                       enoList
      of "section":                    enoSection
      of "value":                      enoValue
      of "commentOperator":            enoCommentOperator
      of "copyOperator":               enoCopyOperator
      of "deepCopyOperator":           enoDeepCopyOperator
      of "directContinuationOperator": enoDirectContinuationOperator
      of "elementOperator":            enoElementOperator
      of "entryOperator":              enoEntryOperator
      of "escapeOperator":             enoEscapeOperator
      of "itemOperator":               enoItemOperator
      of "key":                        enoKey
      of "multilineFieldOperator":     enoMultilineFieldOperator
      of "sectionOperator":            enoSectionOperator
      of "spacedContinuationOperator": enoSpacedContinuationOperator
      of "template":                   enoTemplate
      of "ERROR":                      enoSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsEnoNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsEnoNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsEnoNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_eno(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsEnoNode): string =
  $ts_node_type(TSNode(node))

proc newTsEnoParser*(): EnoParser =
  result = EnoParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_eno())

proc parseString*(parser: EnoParser, str: string): TsEnoNode =
  TsEnoNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsEnoString*(str: string): TsEnoNode =
  let parser = newTsEnoParser()
  return parseString(parser, str)

func `$`*(node: TsEnoNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsEnoNode,
    idx:  int,
    kind: EnoNodeKind | set[EnoNodeKind]
  ): TsEnoNode =
  assert 0 <= idx and idx < node.len
  result = TsEnoNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  EnoNode* = HtsNode[TsEnoNode, EnoNodeKind]


proc treeReprTsEno*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsEnoNode, EnoNodeKind](parseTsEnoString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsEnoNode,
    str:  ptr string
  ): HtsNode[TsEnoNode, EnoNodeKind] =
  toHtsNode[TsEnoNode, EnoNodeKind](node, str)

proc toHtsTree*(node: TsEnoNode, str: ptr string): EnoNode =
  toHtsNode[TsEnoNode, EnoNodeKind](node, str)

proc parseEnoString*(str: ptr string, unnamed: bool = false): EnoNode =
  let parser = newTsEnoParser()
  return toHtsTree[TsEnoNode, EnoNodeKind](parseString(parser, str[]), str)

proc parseEnoString*(str: string, unnamed: bool = false): EnoNode =
  let parser = newTsEnoParser()
  return toHtsTree[TsEnoNode, EnoNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


