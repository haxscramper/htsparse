import
  hmisc / wrappers/treesitter_core
export treesitter_core
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
    clojureHidGap              ## _gap
    clojureHidBareMapLit       ## _bare_map_lit
    clojureHidBareVecLit       ## _bare_vec_lit
    clojureHidWs               ## _ws
    clojureHidBareListLit      ## _bare_list_lit
    clojureHidForm             ## _form
    clojureHidBareSetLit       ## _bare_set_lit
    clojureHidMetadataLit      ## _metadata_lit
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
    of clojureHidGap:              "_gap"
    of clojureHidBareMapLit:       "_bare_map_lit"
    of clojureHidBareVecLit:       "_bare_vec_lit"
    of clojureHidWs:               "_ws"
    of clojureHidBareListLit:      "_bare_list_lit"
    of clojureHidForm:             "_form"
    of clojureHidBareSetLit:       "_bare_set_lit"
    of clojureHidMetadataLit:      "_metadata_lit"
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
const clojureHiddenKinds*: set[ClojureNodeKind] = {
                                                    clojureHidGap,
                                                    clojureHidBareMapLit,
                                                    clojureHidBareVecLit,
                                                    clojureHidWs,
                                                    clojureHidBareListLit,
                                                    clojureHidForm,
                                                    clojureHidBareSetLit,
                                                    clojureHidMetadataLit
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


proc treeRepr*(node: TsClojureNode, str: string): string =
  var res = addr result
  proc aux(node: TsClojureNode, level: int) =
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


import
  hmisc / wrappers/treesitter_core
let clojureGrammar*: array[ClojureNodeKind, HtsRule[ClojureNodeKind]] = block:
                                                                          var rules: array[ClojureNodeKind, HtsRule[ClojureNodeKind]]
                                                                          type
                                                                            K = ClojureNodeKind


                                                                          rules[clojureSetLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsSymbol[K](clojureHidBareSetLit))
                                                                          rules[clojureHidGap] = tsChoice[K](tsSymbol[K](clojureHidWs), tsSymbol[K](clojureComment), tsSymbol[K](clojureDisExpr))
                                                                          rules[clojureDisExpr] = tsSeq[K](tsString[K]("#_"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureHidForm] = tsChoice[K](tsSymbol[K](clojureNumLit), tsSymbol[K](clojureKwdLit), tsSymbol[K](clojureStrLit), tsSymbol[K](clojureCharLit), tsSymbol[K](clojureNilLit), tsSymbol[K](clojureBoolLit), tsSymbol[K](clojureSymLit), tsSymbol[K](clojureListLit), tsSymbol[K](clojureMapLit), tsSymbol[K](clojureVecLit), tsSymbol[K](clojureSetLit), tsSymbol[K](clojureAnonFnLit), tsSymbol[K](clojureRegexLit), tsSymbol[K](clojureReadCondLit), tsSymbol[K](clojureSplicingReadCondLit), tsSymbol[K](clojureNsMapLit), tsSymbol[K](clojureVarQuotingLit), tsSymbol[K](clojureSymValLit), tsSymbol[K](clojureEvalingLit), tsSymbol[K](clojureTaggedOrCtorLit), tsSymbol[K](clojureDerefingLit), tsSymbol[K](clojureQuotingLit), tsSymbol[K](clojureSynQuotingLit), tsSymbol[K](clojureUnquoteSplicingLit), tsSymbol[K](clojureUnquotingLit))
                                                                          rules[clojureHidBareSetLit] = tsSeq[K](tsString[K]("#"), tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](clojureHidForm), tsSymbol[K](clojureHidGap))), tsString[K]("}"))
                                                                          rules[clojureReadCondLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#?"), tsRepeat[K](tsSymbol[K](clojureHidWs)), tsSymbol[K](clojureHidBareListLit))
                                                                          rules[clojureListLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsSymbol[K](clojureHidBareListLit))
                                                                          rules[clojureNsMapLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#"), tsChoice[K](tsSymbol[K](clojureAutoResMark), tsSymbol[K](clojureKwdLit)), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidBareMapLit))
                                                                          rules[clojureHidBareMapLit] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](clojureHidForm), tsSymbol[K](clojureHidGap))), tsString[K]("}"))
                                                                          rules[clojureBoolLit] = tsChoice[K](tsString[K]("false"), tsString[K]("true"))
                                                                          rules[clojureMapLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsSymbol[K](clojureHidBareMapLit))
                                                                          rules[clojureNilLit] = tsString[K]("nil")
                                                                          rules[clojureComment] = tsRegex[K]("(;|#!).*\\n?")
                                                                          rules[clojureCharLit] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsSeq[K](tsString[K]("o"), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRegex[K]("[0-9]"), tsRegex[K]("[0-9]")), tsSeq[K](tsRegex[K]("[0-9]"), tsRegex[K]("[0-9]")), tsSeq[K](tsRegex[K]("[0-9]")))), tsChoice[K](tsString[K]("backspace"), tsString[K]("formfeed"), tsString[K]("newline"), tsString[K]("return"), tsString[K]("space"), tsString[K]("tab")), tsSeq[K](tsString[K]("u"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]")), tsRegex[K](".|\\n")))
                                                                          rules[clojureHidMetadataLit] = tsSeq[K](tsChoice[K](tsSymbol[K](clojureMetaLit), tsSymbol[K](clojureOldMetaLit)), tsChoice[K](tsRepeat[K](tsSymbol[K](clojureHidGap)), tsBlank[K]()))
                                                                          rules[clojureMetaLit] = tsSeq[K](tsString[K]("^"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsChoice[K](tsSymbol[K](clojureReadCondLit), tsSymbol[K](clojureMapLit), tsSymbol[K](clojureStrLit), tsSymbol[K](clojureKwdLit), tsSymbol[K](clojureSymLit)))
                                                                          rules[clojureSymLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsSeq[K](tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:#\'0-9\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:#\'0-9\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"), tsRegex[K]("[:#\'0-9]")))))
                                                                          rules[clojureHidBareVecLit] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsChoice[K](tsSymbol[K](clojureHidForm), tsSymbol[K](clojureHidGap))), tsString[K]("]"))
                                                                          rules[clojureAutoResMark] = tsString[K]("::")
                                                                          rules[clojureVarQuotingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#\'"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureUnquoteSplicingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("~@"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureVecLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsSymbol[K](clojureHidBareVecLit))
                                                                          rules[clojureHidWs] = tsRepeat1[K](tsRegex[K]("[\\f\\n\\r\\t, \\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"))
                                                                          rules[clojureTaggedOrCtorLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureSymLit), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureAnonFnLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#"), tsSymbol[K](clojureHidBareListLit))
                                                                          rules[clojureSplicingReadCondLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#?@"), tsRepeat[K](tsSymbol[K](clojureHidWs)), tsSymbol[K](clojureHidBareListLit))
                                                                          rules[clojureRegexLit] = tsSeq[K](tsString[K]("#"), tsSeq[K](tsString[K]("\""), tsRepeat[K](tsRegex[K]("[^\"\\\\]")), tsRepeat[K](tsSeq[K](tsString[K]("\\"), tsRegex[K]("."), tsRepeat[K](tsRegex[K]("[^\"\\\\]")))), tsString[K]("\"")))
                                                                          rules[clojureHidBareListLit] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsChoice[K](tsSymbol[K](clojureHidForm), tsSymbol[K](clojureHidGap))), tsString[K](")"))
                                                                          rules[clojureStrLit] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsRegex[K]("[^\"\\\\]")), tsRepeat[K](tsSeq[K](tsString[K]("\\"), tsRegex[K]("."), tsRepeat[K](tsRegex[K]("[^\"\\\\]")))), tsString[K]("\""))
                                                                          rules[clojureSource] = tsRepeat[K](tsChoice[K](tsSymbol[K](clojureHidForm), tsSymbol[K](clojureHidGap)))
                                                                          rules[clojureSymValLit] = tsSeq[K](tsString[K]("##"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureSymLit))
                                                                          rules[clojureQuotingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("\'"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureEvalingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("#="), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsChoice[K](tsSymbol[K](clojureListLit), tsSymbol[K](clojureReadCondLit), tsSymbol[K](clojureSymLit)))
                                                                          rules[clojureDerefingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("@"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureUnquotingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("~"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureNumLit] = tsSeq[K](tsChoice[K](tsRegex[K]("[+-]"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("0"), tsRegex[K]("[xX]"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsChoice[K](tsString[K]("N"), tsBlank[K]())), tsSeq[K](tsString[K]("0"), tsRepeat1[K](tsRegex[K]("[0-7]")), tsChoice[K](tsString[K]("N"), tsBlank[K]())), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRegex[K]("[rR]"), tsRepeat1[K](tsRegex[K]("[0-9a-zA-Z]"))), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsString[K]("/"), tsRepeat1[K](tsRegex[K]("[0-9]"))), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsChoice[K](tsSeq[K](tsString[K]("."), tsRepeat[K](tsRegex[K]("[0-9]"))), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsRegex[K]("[+-]"), tsBlank[K]()), tsRepeat1[K](tsRegex[K]("[0-9]"))), tsBlank[K]()), tsChoice[K](tsString[K]("M"), tsBlank[K]())), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsChoice[K](tsRegex[K]("[MN]"), tsBlank[K]()))))
                                                                          rules[clojureOldMetaLit] = tsSeq[K](tsString[K]("#^"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsChoice[K](tsSymbol[K](clojureReadCondLit), tsSymbol[K](clojureMapLit), tsSymbol[K](clojureStrLit), tsSymbol[K](clojureKwdLit), tsSymbol[K](clojureSymLit)))
                                                                          rules[clojureSynQuotingLit] = tsSeq[K](tsRepeat[K](tsSymbol[K](clojureHidMetadataLit)), tsString[K]("`"), tsRepeat[K](tsSymbol[K](clojureHidGap)), tsSymbol[K](clojureHidForm))
                                                                          rules[clojureKwdLit] = tsChoice[K](tsSeq[K](tsString[K](":"), tsChoice[K](tsString[K]("/"), tsSeq[K](tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:/\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"), tsRepeat[K](tsChoice[K](tsRegex[K]("[:\'/]"), tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:/\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]")))))), tsSeq[K](tsString[K]("::"), tsSeq[K](tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:/\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"), tsRepeat[K](tsChoice[K](tsRegex[K]("[:\'/]"), tsRegex[K]("[^\\f\\n\\r\\t ()\\[\\]{}\"@~^;`\\\\,:/\\u000B\\u001C\\u001D\\u001E\\u001F\\u2028\\u2029\\u1680\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2008\\u2009\\u200a\\u205f\\u3000]"))))))
                                                                          rules

