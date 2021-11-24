import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  ClojureNodeKind* = enum
    clojureAnonFnLit           ## anon_fn_lit
    clojureDerefingLit         ## derefing_lit
    clojureDisExpr             ## dis_expr
    clojureEvalingLit          ## evaling_lit
    clojureListLit             ## list_lit
    clojureMapLit              ## map_lit
    clojureMetaLit             ## meta_lit
    clojureNsMapLit            ## ns_map_lit
    clojureOldMetaLit          ## old_meta_lit
    clojureQuotingLit          ## quoting_lit
    clojureReadCondLit         ## read_cond_lit
    clojureRegexLit            ## regex_lit
    clojureSetLit              ## set_lit
    clojureSource              ## source
    clojureSplicingReadCondLit ## splicing_read_cond_lit
    clojureStrLit              ## str_lit
    clojureSymLit              ## sym_lit
    clojureSymValLit           ## sym_val_lit
    clojureSynQuotingLit       ## syn_quoting_lit
    clojureTaggedOrCtorLit     ## tagged_or_ctor_lit
    clojureUnquoteSplicingLit  ## unquote_splicing_lit
    clojureUnquotingLit        ## unquoting_lit
    clojureVarQuotingLit       ## var_quoting_lit
    clojureVecLit              ## vec_lit
    clojureHashTok             ## #
    clojureDoubleHashTok       ## ##
    clojureHashApostropheTok   ## #'
    clojureHashEqualTok        ## #=
    clojureHashQuestionTok     ## #?
    clojureHashQuestionAtTok   ## #?@
    clojureHashAccentTok       ## #^
    clojureHashUnderscoreTok   ## #_
    clojureApostropheTok       ## '
    clojureLParTok             ## (
    clojureRParTok             ## )
    clojureAtTok               ## @
    clojureLBrackTok           ## [
    clojureRBrackTok           ## ]
    clojureAccentTok           ## ^
    clojureBacktickTok         ## `
    clojureAutoResMark         ## auto_res_mark
    clojureBoolLit             ## bool_lit
    clojureCharLit             ## char_lit
    clojureComment             ## comment
    clojureKwdLit              ## kwd_lit
    clojureNilLit              ## nil_lit
    clojureNumLit              ## num_lit
    clojureLCurlyTok           ## {
    clojureRCurlyTok           ## }
    clojureTildeTok            ## ~
    clojureTildeAtTok          ## ~@
    clojureSyntaxError         ## Tree-sitter parser syntax error


proc strRepr*(kind: ClojureNodeKind): string =
  case kind:
    of clojureAnonFnLit:           "anon_fn_lit"
    of clojureDerefingLit:         "derefing_lit"
    of clojureDisExpr:             "dis_expr"
    of clojureEvalingLit:          "evaling_lit"
    of clojureListLit:             "list_lit"
    of clojureMapLit:              "map_lit"
    of clojureMetaLit:             "meta_lit"
    of clojureNsMapLit:            "ns_map_lit"
    of clojureOldMetaLit:          "old_meta_lit"
    of clojureQuotingLit:          "quoting_lit"
    of clojureReadCondLit:         "read_cond_lit"
    of clojureRegexLit:            "regex_lit"
    of clojureSetLit:              "set_lit"
    of clojureSource:              "source"
    of clojureSplicingReadCondLit: "splicing_read_cond_lit"
    of clojureStrLit:              "str_lit"
    of clojureSymLit:              "sym_lit"
    of clojureSymValLit:           "sym_val_lit"
    of clojureSynQuotingLit:       "syn_quoting_lit"
    of clojureTaggedOrCtorLit:     "tagged_or_ctor_lit"
    of clojureUnquoteSplicingLit:  "unquote_splicing_lit"
    of clojureUnquotingLit:        "unquoting_lit"
    of clojureVarQuotingLit:       "var_quoting_lit"
    of clojureVecLit:              "vec_lit"
    of clojureHashTok:             "#"
    of clojureDoubleHashTok:       "##"
    of clojureHashApostropheTok:   "#\'"
    of clojureHashEqualTok:        "#="
    of clojureHashQuestionTok:     "#?"
    of clojureHashQuestionAtTok:   "#?@"
    of clojureHashAccentTok:       "#^"
    of clojureHashUnderscoreTok:   "#_"
    of clojureApostropheTok:       "\'"
    of clojureLParTok:             "("
    of clojureRParTok:             ")"
    of clojureAtTok:               "@"
    of clojureLBrackTok:           "["
    of clojureRBrackTok:           "]"
    of clojureAccentTok:           "^"
    of clojureBacktickTok:         "`"
    of clojureAutoResMark:         "auto_res_mark"
    of clojureBoolLit:             "bool_lit"
    of clojureCharLit:             "char_lit"
    of clojureComment:             "comment"
    of clojureKwdLit:              "kwd_lit"
    of clojureNilLit:              "nil_lit"
    of clojureNumLit:              "num_lit"
    of clojureLCurlyTok:           "{"
    of clojureRCurlyTok:           "}"
    of clojureTildeTok:            "~"
    of clojureTildeAtTok:          "~@"
    of clojureSyntaxError:         "ERROR"


type
  TsClojureNode* = distinct TSNode


type
  ClojureParser* = distinct PtsParser


const clojureAllowedSubnodes*: array[ClojureNodeKind, set[ClojureNodeKind]] = block:
                                                                                var tmp: array[ClojureNodeKind, set[ClojureNodeKind]]
                                                                                tmp[clojureAnonFnLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureDerefingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureDisExpr] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureEvalingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureListLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureMapLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureMetaLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureNsMapLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureOldMetaLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureQuotingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureReadCondLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureSetLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureSource] = {
                                                                                                       clojureAnonFnLit,
                                                                                                       clojureBoolLit,
                                                                                                       clojureCharLit,
                                                                                                       clojureComment,
                                                                                                       clojureDerefingLit,
                                                                                                       clojureDisExpr,
                                                                                                       clojureEvalingLit,
                                                                                                       clojureKwdLit,
                                                                                                       clojureListLit,
                                                                                                       clojureMapLit,
                                                                                                       clojureNilLit,
                                                                                                       clojureNsMapLit,
                                                                                                       clojureNumLit,
                                                                                                       clojureQuotingLit,
                                                                                                       clojureReadCondLit,
                                                                                                       clojureRegexLit,
                                                                                                       clojureSetLit,
                                                                                                       clojureSplicingReadCondLit,
                                                                                                       clojureStrLit,
                                                                                                       clojureSymLit,
                                                                                                       clojureSymValLit,
                                                                                                       clojureSynQuotingLit,
                                                                                                       clojureTaggedOrCtorLit,
                                                                                                       clojureUnquoteSplicingLit,
                                                                                                       clojureUnquotingLit,
                                                                                                       clojureVarQuotingLit,
                                                                                                       clojureVecLit
                                                                                                     }
                                                                                tmp[clojureSplicingReadCondLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureSymLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureSymValLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureSynQuotingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureTaggedOrCtorLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureUnquoteSplicingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureUnquotingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureVarQuotingLit] = {clojureComment, clojureDisExpr}
                                                                                tmp[clojureVecLit] = {clojureComment, clojureDisExpr}
                                                                                tmp
const clojureTokenKinds*: set[ClojureNodeKind] = {
                                                   clojureHashTok,
                                                   clojureDoubleHashTok,
                                                   clojureHashApostropheTok,
                                                   clojureHashEqualTok,
                                                   clojureHashQuestionTok,
                                                   clojureHashQuestionAtTok,
                                                   clojureHashAccentTok,
                                                   clojureHashUnderscoreTok,
                                                   clojureApostropheTok,
                                                   clojureLParTok,
                                                   clojureRParTok,
                                                   clojureAtTok,
                                                   clojureLBrackTok,
                                                   clojureRBrackTok,
                                                   clojureAccentTok,
                                                   clojureBacktickTok,
                                                   clojureLCurlyTok,
                                                   clojureRCurlyTok,
                                                   clojureTildeTok,
                                                   clojureTildeAtTok
                                                 }

proc tsNodeType*(node: TsClojureNode): string



proc kind*(node: TsClojureNode): ClojureNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "anon_fn_lit":            clojureAnonFnLit
      of "derefing_lit":           clojureDerefingLit
      of "dis_expr":               clojureDisExpr
      of "evaling_lit":            clojureEvalingLit
      of "list_lit":               clojureListLit
      of "map_lit":                clojureMapLit
      of "meta_lit":               clojureMetaLit
      of "ns_map_lit":             clojureNsMapLit
      of "old_meta_lit":           clojureOldMetaLit
      of "quoting_lit":            clojureQuotingLit
      of "read_cond_lit":          clojureReadCondLit
      of "regex_lit":              clojureRegexLit
      of "set_lit":                clojureSetLit
      of "source":                 clojureSource
      of "splicing_read_cond_lit": clojureSplicingReadCondLit
      of "str_lit":                clojureStrLit
      of "sym_lit":                clojureSymLit
      of "sym_val_lit":            clojureSymValLit
      of "syn_quoting_lit":        clojureSynQuotingLit
      of "tagged_or_ctor_lit":     clojureTaggedOrCtorLit
      of "unquote_splicing_lit":   clojureUnquoteSplicingLit
      of "unquoting_lit":          clojureUnquotingLit
      of "var_quoting_lit":        clojureVarQuotingLit
      of "vec_lit":                clojureVecLit
      of "#":                      clojureHashTok
      of "##":                     clojureDoubleHashTok
      of "#\'":                    clojureHashApostropheTok
      of "#=":                     clojureHashEqualTok
      of "#?":                     clojureHashQuestionTok
      of "#?@":                    clojureHashQuestionAtTok
      of "#^":                     clojureHashAccentTok
      of "#_":                     clojureHashUnderscoreTok
      of "\'":                     clojureApostropheTok
      of "(":                      clojureLParTok
      of ")":                      clojureRParTok
      of "@":                      clojureAtTok
      of "[":                      clojureLBrackTok
      of "]":                      clojureRBrackTok
      of "^":                      clojureAccentTok
      of "`":                      clojureBacktickTok
      of "auto_res_mark":          clojureAutoResMark
      of "bool_lit":               clojureBoolLit
      of "char_lit":               clojureCharLit
      of "comment":                clojureComment
      of "kwd_lit":                clojureKwdLit
      of "nil_lit":                clojureNilLit
      of "num_lit":                clojureNumLit
      of "{":                      clojureLCurlyTok
      of "}":                      clojureRCurlyTok
      of "~":                      clojureTildeTok
      of "~@":                     clojureTildeAtTok
      of "ERROR":                  clojureSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsClojureNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsClojureNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsClojureNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_clojure(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsClojureNode): string =
  $ts_node_type(TSNode(node))

proc newTsClojureParser*(): ClojureParser =
  result = ClojureParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_clojure())

proc parseString*(parser: ClojureParser, str: string): TsClojureNode =
  TsClojureNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsClojureString*(str: string): TsClojureNode =
  let parser = newTsClojureParser()
  return parseString(parser, str)

func `$`*(node: TsClojureNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsClojureNode,
    idx:  int,
    kind: ClojureNodeKind | set[ClojureNodeKind]
  ): TsClojureNode =
  assert 0 <= idx and idx < node.len
  result = TsClojureNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  ClojureNode* = HtsNode[TsClojureNode, ClojureNodeKind]


proc treeReprTsClojure*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsClojureNode, ClojureNodeKind](parseTsClojureString(str), str, 7, unnamed = unnamed)

proc toHtsNode*(
    node: TsClojureNode,
    str:  ptr string
  ): HtsNode[TsClojureNode, ClojureNodeKind] =
  toHtsNode[TsClojureNode, ClojureNodeKind](node, str)

proc toHtsTree*(node: TsClojureNode, str: ptr string): ClojureNode =
  toHtsNode[TsClojureNode, ClojureNodeKind](node, str)

proc parseClojureString*(str: ptr string, unnamed: bool = false): ClojureNode =
  let parser = newTsClojureParser()
  return toHtsTree[TsClojureNode, ClojureNodeKind](parseString(parser, str[]), str)

proc parseClojureString*(str: string, unnamed: bool = false): ClojureNode =
  let parser = newTsClojureParser()
  return toHtsTree[TsClojureNode, ClojureNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


