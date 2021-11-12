import
  hmisc / wrappers/treesitter_core
export treesitter_core

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


proc treeRepr*(node: TsEnoNode, str: string): string =
  var res = addr result
  proc aux(node: TsEnoNode, level: int) =
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


