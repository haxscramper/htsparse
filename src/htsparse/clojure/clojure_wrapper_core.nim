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
    clojureSyntaxError         ## Tree-sitter parser syntax error


type
  TsClojureNode* = distinct TSNode


type
  ClojureParser* = distinct PtsParser


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


