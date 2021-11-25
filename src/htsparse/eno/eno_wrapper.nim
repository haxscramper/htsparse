import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  EnoNodeKind* = enum
    enoComment                         ## comment
    enoContinuation                    ## continuation
    enoDocument                        ## document
    enoElement                         ## element
    enoEmpty                           ## empty
    enoEntry                           ## entry
    enoField                           ## field
    enoFieldset                        ## fieldset
    enoItem                            ## item
    enoList                            ## list
    enoSection                         ## section
    enoValue                           ## value
    enoCommentOperator                 ## commentOperator
    enoCopyOperator                    ## copyOperator
    enoDeepCopyOperator                ## deepCopyOperator
    enoDirectContinuationOperator      ## directContinuationOperator
    enoElementOperator                 ## elementOperator
    enoEntryOperator                   ## entryOperator
    enoEscapeOperator                  ## escapeOperator
    enoItemOperator                    ## itemOperator
    enoKey                             ## key
    enoMultilineFieldOperator          ## multilineFieldOperator
    enoSectionOperator                 ## sectionOperator
    enoSpacedContinuationOperator      ## spacedContinuationOperator
    enoTemplate                        ## template
    enoHidSectionDescend               ## _sectionDescend
    enoMultilineFieldKey               ## multilineFieldKey
    enoHidElementOrFieldsetOrList      ## _elementOrFieldsetOrList
    enoMultilineFieldValue             ## multilineFieldValue
    enoHidEscapedOrUnescapedKey        ## _escapedOrUnescapedKey
    enoToken                           ## token
    enoHidEscapedOrUnescapedSectionKey ## _escapedOrUnescapedSectionKey
    enoSectionKey                      ## sectionKey
    enoHidEmptyLine                    ## _emptyLine
    enoHidMultilineFieldLine           ## _multilineFieldLine
    enoMultilineField                  ## multilineField
    enoHidSectionAscend                ## _sectionAscend
    enoEscapedKey                      ## escapedKey
    enoHidInstruction                  ## _instruction
    enoHidCommentOrEmpty               ## _commentOrEmpty
    enoHidEndOfLine                    ## _endOfLine
    enoHidMultilineFieldEnd            ## _multilineFieldEnd
    enoSyntaxError                     ## Tree-sitter parser syntax error

proc strRepr*(kind: EnoNodeKind): string =
  case kind:
    of enoComment:                         "comment"
    of enoContinuation:                    "continuation"
    of enoDocument:                        "document"
    of enoElement:                         "element"
    of enoEmpty:                           "empty"
    of enoEntry:                           "entry"
    of enoField:                           "field"
    of enoFieldset:                        "fieldset"
    of enoItem:                            "item"
    of enoList:                            "list"
    of enoSection:                         "section"
    of enoValue:                           "value"
    of enoCommentOperator:                 "commentOperator"
    of enoCopyOperator:                    "copyOperator"
    of enoDeepCopyOperator:                "deepCopyOperator"
    of enoDirectContinuationOperator:      "directContinuationOperator"
    of enoElementOperator:                 "elementOperator"
    of enoEntryOperator:                   "entryOperator"
    of enoEscapeOperator:                  "escapeOperator"
    of enoItemOperator:                    "itemOperator"
    of enoKey:                             "key"
    of enoMultilineFieldOperator:          "multilineFieldOperator"
    of enoSectionOperator:                 "sectionOperator"
    of enoSpacedContinuationOperator:      "spacedContinuationOperator"
    of enoTemplate:                        "template"
    of enoHidSectionDescend:               "_sectionDescend"
    of enoMultilineFieldKey:               "multilineFieldKey"
    of enoHidElementOrFieldsetOrList:      "_elementOrFieldsetOrList"
    of enoMultilineFieldValue:             "multilineFieldValue"
    of enoHidEscapedOrUnescapedKey:        "_escapedOrUnescapedKey"
    of enoToken:                           "token"
    of enoHidEscapedOrUnescapedSectionKey: "_escapedOrUnescapedSectionKey"
    of enoSectionKey:                      "sectionKey"
    of enoHidEmptyLine:                    "_emptyLine"
    of enoHidMultilineFieldLine:           "_multilineFieldLine"
    of enoMultilineField:                  "multilineField"
    of enoHidSectionAscend:                "_sectionAscend"
    of enoEscapedKey:                      "escapedKey"
    of enoHidInstruction:                  "_instruction"
    of enoHidCommentOrEmpty:               "_commentOrEmpty"
    of enoHidEndOfLine:                    "_endOfLine"
    of enoHidMultilineFieldEnd:            "_multilineFieldEnd"
    of enoSyntaxError:                     "ERROR"

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
const enoHiddenKinds*: set[EnoNodeKind] = {
                                            enoHidSectionDescend,
                                            enoMultilineFieldKey,
                                            enoHidElementOrFieldsetOrList,
                                            enoMultilineFieldValue,
                                            enoHidEscapedOrUnescapedKey,
                                            enoToken,
                                            enoHidEscapedOrUnescapedSectionKey,
                                            enoSectionKey,
                                            enoHidEmptyLine,
                                            enoHidMultilineFieldLine,
                                            enoMultilineField,
                                            enoHidSectionAscend,
                                            enoEscapedKey,
                                            enoHidInstruction,
                                            enoHidCommentOrEmpty,
                                            enoHidEndOfLine,
                                            enoHidMultilineFieldEnd
                                          }
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


import
  htsparse/describe_grammar
let enoGrammar = block:
                   var rules: array[EnoNodeKind, HtsRule[EnoNodeKind]]
                   type
                     K = EnoNodeKind


                   rules[enoHidEscapedOrUnescapedSectionKey] = tsChoice[K](tsSymbol[K](enoSectionKey), tsSeq[K](tsSymbol[K](enoEscapeOperator), tsSymbol[K](enoEscapedKey), tsSymbol[K](enoEscapeOperator)))
                   rules[enoToken] = tsRegex[K]("\\S|\\S[^\\n]*\\S")
                   rules[enoCopyOperator] = tsString[K]("<")
                   rules[enoKey] = tsRegex[K]("[^`>:=<\\-#|\\\\\\s]|[^`>:=<\\-#|\\\\\\s][^:=<\\n]*[^:=<\\s]")
                   rules[enoEntry] = tsSeq[K](tsSymbol[K](enoHidEscapedOrUnescapedKey), tsSymbol[K](enoEntryOperator), tsChoice[K](tsSymbol[K](enoToken), tsBlank[K]()), tsSymbol[K](enoHidEndOfLine), tsRepeat[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoContinuation))))
                   rules[enoSpacedContinuationOperator] = tsString[K]("\\")
                   rules[enoComment] = tsRepeat1[K](tsSeq[K](tsSymbol[K](enoCommentOperator), tsChoice[K](tsSymbol[K](enoToken), tsBlank[K]()), tsSymbol[K](enoHidEndOfLine)))
                   rules[enoField] = tsChoice[K](tsSeq[K](tsSymbol[K](enoHidEscapedOrUnescapedKey), tsSymbol[K](enoElementOperator), tsSymbol[K](enoToken), tsSymbol[K](enoHidEndOfLine), tsRepeat[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoContinuation)))), tsSeq[K](tsSymbol[K](enoHidEscapedOrUnescapedKey), tsSymbol[K](enoElementOperator), tsSymbol[K](enoHidEndOfLine), tsRepeat1[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoContinuation)))))
                   rules[enoSection] = tsSeq[K](tsSymbol[K](enoHidSectionDescend), tsSymbol[K](enoSectionOperator), tsSymbol[K](enoHidEscapedOrUnescapedSectionKey), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](enoCopyOperator), tsSymbol[K](enoDeepCopyOperator)), tsSymbol[K](enoToken)), tsBlank[K]()), tsSymbol[K](enoHidEndOfLine), tsRepeat[K](tsSymbol[K](enoHidInstruction)), tsSymbol[K](enoHidSectionAscend))
                   rules[enoDocument] = tsRepeat[K](tsSymbol[K](enoHidInstruction))
                   rules[enoHidEmptyLine] = tsRegex[K]("[ \\t\\uFEFF\\u2060\\u200B]*\\n")
                   rules[enoSectionKey] = tsRegex[K]("[^`<\\s]|[^`<\\s][^<\\n]*[^<\\s]")
                   rules[enoCommentOperator] = tsString[K](">")
                   rules[enoDeepCopyOperator] = tsString[K]("<<")
                   rules[enoHidElementOrFieldsetOrList] = tsSeq[K](tsSymbol[K](enoHidEscapedOrUnescapedKey), tsChoice[K](tsSymbol[K](enoElementOperator), tsSeq[K](tsSymbol[K](enoCopyOperator), tsSymbol[K](enoToken))), tsSymbol[K](enoHidEndOfLine))
                   rules[enoElementOperator] = tsString[K](":")
                   rules[enoMultilineField] = tsSeq[K](tsSymbol[K](enoMultilineFieldOperator), tsSymbol[K](enoMultilineFieldKey), tsSymbol[K](enoHidEndOfLine), tsChoice[K](tsSymbol[K](enoMultilineFieldValue), tsBlank[K]()), tsSymbol[K](enoHidMultilineFieldEnd), tsSymbol[K](enoMultilineFieldOperator), tsSymbol[K](enoMultilineFieldKey), tsSymbol[K](enoHidEndOfLine))
                   rules[enoDirectContinuationOperator] = tsString[K]("|")
                   rules[enoFieldset] = tsSeq[K](tsSymbol[K](enoHidElementOrFieldsetOrList), tsRepeat1[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoEntry))))
                   rules[enoMultilineFieldValue] = tsRepeat1[K](tsSeq[K](tsSymbol[K](enoHidMultilineFieldLine), tsSymbol[K](enoHidEndOfLine)))
                   rules[enoElement] = tsSymbol[K](enoHidElementOrFieldsetOrList)
                   rules[enoEntryOperator] = tsString[K]("=")
                   rules[enoSectionOperator] = tsRegex[K]("#+")
                   rules[enoHidInstruction] = tsChoice[K](tsSymbol[K](enoHidCommentOrEmpty), tsSymbol[K](enoElement), tsSymbol[K](enoEmpty), tsSymbol[K](enoField), tsSymbol[K](enoFieldset), tsSymbol[K](enoList), tsSymbol[K](enoMultilineField), tsSymbol[K](enoSection))
                   rules[enoHidEscapedOrUnescapedKey] = tsChoice[K](tsSymbol[K](enoKey), tsSeq[K](tsSymbol[K](enoEscapeOperator), tsSymbol[K](enoEscapedKey), tsSymbol[K](enoEscapeOperator)))
                   rules[enoEmpty] = tsSeq[K](tsSymbol[K](enoHidEscapedOrUnescapedKey), tsSymbol[K](enoHidEndOfLine))
                   rules[enoHidCommentOrEmpty] = tsChoice[K](tsSymbol[K](enoComment), tsSymbol[K](enoHidEmptyLine))
                   rules[enoList] = tsSeq[K](tsSymbol[K](enoHidElementOrFieldsetOrList), tsRepeat1[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoItem))))
                   rules[enoContinuation] = tsSeq[K](tsChoice[K](tsSymbol[K](enoDirectContinuationOperator), tsSymbol[K](enoSpacedContinuationOperator)), tsSymbol[K](enoToken), tsSymbol[K](enoHidEndOfLine))
                   rules[enoItem] = tsSeq[K](tsSymbol[K](enoItemOperator), tsChoice[K](tsSymbol[K](enoToken), tsBlank[K]()), tsSymbol[K](enoHidEndOfLine), tsRepeat[K](tsSeq[K](tsRepeat[K](tsSymbol[K](enoHidCommentOrEmpty)), tsSymbol[K](enoContinuation))))
                   rules[enoItemOperator] = tsString[K]("-")
                   rules

