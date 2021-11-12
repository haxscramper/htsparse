import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  CssNodeKind* = enum
    cssAdjacentSiblingSelector ## adjacent_sibling_selector
    cssArguments               ## arguments
    cssAtRule                  ## at_rule
    cssAttributeSelector       ## attribute_selector
    cssBinaryExpression        ## binary_expression
    cssBinaryQuery             ## binary_query
    cssBlock                   ## block
    cssCallExpression          ## call_expression
    cssCharsetStatement        ## charset_statement
    cssChildSelector           ## child_selector
    cssClassSelector           ## class_selector
    cssColorValue              ## color_value
    cssDeclaration             ## declaration
    cssDescendantSelector      ## descendant_selector
    cssFeatureQuery            ## feature_query
    cssFloatValue              ## float_value
    cssIdSelector              ## id_selector
    cssImportStatement         ## import_statement
    cssIntegerValue            ## integer_value
    cssKeyframeBlock           ## keyframe_block
    cssKeyframeBlockList       ## keyframe_block_list
    cssKeyframesStatement      ## keyframes_statement
    cssMediaStatement          ## media_statement
    cssNamespaceStatement      ## namespace_statement
    cssParenthesizedQuery      ## parenthesized_query
    cssParenthesizedValue      ## parenthesized_value
    cssPseudoClassSelector     ## pseudo_class_selector
    cssPseudoElementSelector   ## pseudo_element_selector
    cssRuleSet                 ## rule_set
    cssSelectorQuery           ## selector_query
    cssSelectors               ## selectors
    cssSiblingSelector         ## sibling_selector
    cssStylesheet              ## stylesheet
    cssSupportsStatement       ## supports_statement
    cssUnaryQuery              ## unary_query
    cssUniversalSelector       ## universal_selector
    cssHashTok                 ## #
    cssDollarEqualTok          ## $=
    cssLParTok                 ## (
    cssRParTok                 ## )
    cssAsteriskTok             ## *
    cssAsteriskEqualTok        ## *=
    cssPlusTok                 ## +
    cssCommaTok                ## ,
    cssMinusTok                ## -
    cssDotTok                  ## .
    cssSlashTok                ## /
    cssColonTok                ## :
    cssDoubleColonTok          ## ::
    cssSemicolonTok            ## ;
    cssEqualTok                ## =
    cssGreaterThanTok          ## >
    cssAtcharsetTok            ## @charset
    cssAtimportTok             ## @import
    cssAtkeyframesTok          ## @keyframes
    cssAtmediaTok              ## @media
    cssAtnamespaceTok          ## @namespace
    cssAtsuportsTok            ## @supports
    cssLBrackTok               ## [
    cssRBrackTok               ## ]
    cssAccentEqualTok          ## ^=
    cssAndTok                  ## and
    cssAtKeyword               ## at_keyword
    cssAttributeName           ## attribute_name
    cssClassName               ## class_name
    cssComment                 ## comment
    cssFeatureName             ## feature_name
    cssFrom                    ## from
    cssFunctionName            ## function_name
    cssIdName                  ## id_name
    cssImportant               ## important
    cssKeyframesName           ## keyframes_name
    cssKeywordQuery            ## keyword_query
    cssNamespaceName           ## namespace_name
    cssNestingSelector         ## nesting_selector
    cssNotTok                  ## not
    cssOnlyTok                 ## only
    cssOrTok                   ## or
    cssPlainValue              ## plain_value
    cssPropertyName            ## property_name
    cssSelectorTok             ## selector
    cssStringValue             ## string_value
    cssTagName                 ## tag_name
    cssTo                      ## to
    cssUnit                    ## unit
    cssLCurlyTok               ## {
    cssPipeEqualTok            ## |=
    cssRCurlyTok               ## }
    cssTildeTok                ## ~
    cssTildeEqualTok           ## ~=
    cssSyntaxError             ## Tree-sitter parser syntax error


type
  CssExternalTok* = enum
    cssExtern_descendant_operator ## _descendant_operator


type
  TsCssNode* = distinct TSNode


type
  CssParser* = distinct PtsParser


proc tsNodeType*(node: TsCssNode): string



proc kind*(node: TsCssNode): CssNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "adjacent_sibling_selector": cssAdjacentSiblingSelector
      of "arguments":                 cssArguments
      of "at_rule":                   cssAtRule
      of "attribute_selector":        cssAttributeSelector
      of "binary_expression":         cssBinaryExpression
      of "binary_query":              cssBinaryQuery
      of "block":                     cssBlock
      of "call_expression":           cssCallExpression
      of "charset_statement":         cssCharsetStatement
      of "child_selector":            cssChildSelector
      of "class_selector":            cssClassSelector
      of "color_value":               cssColorValue
      of "declaration":               cssDeclaration
      of "descendant_selector":       cssDescendantSelector
      of "feature_query":             cssFeatureQuery
      of "float_value":               cssFloatValue
      of "id_selector":               cssIdSelector
      of "import_statement":          cssImportStatement
      of "integer_value":             cssIntegerValue
      of "keyframe_block":            cssKeyframeBlock
      of "keyframe_block_list":       cssKeyframeBlockList
      of "keyframes_statement":       cssKeyframesStatement
      of "media_statement":           cssMediaStatement
      of "namespace_statement":       cssNamespaceStatement
      of "parenthesized_query":       cssParenthesizedQuery
      of "parenthesized_value":       cssParenthesizedValue
      of "pseudo_class_selector":     cssPseudoClassSelector
      of "pseudo_element_selector":   cssPseudoElementSelector
      of "rule_set":                  cssRuleSet
      of "selector_query":            cssSelectorQuery
      of "selectors":                 cssSelectors
      of "sibling_selector":          cssSiblingSelector
      of "stylesheet":                cssStylesheet
      of "supports_statement":        cssSupportsStatement
      of "unary_query":               cssUnaryQuery
      of "universal_selector":        cssUniversalSelector
      of "#":                         cssHashTok
      of "$=":                        cssDollarEqualTok
      of "(":                         cssLParTok
      of ")":                         cssRParTok
      of "*":                         cssAsteriskTok
      of "*=":                        cssAsteriskEqualTok
      of "+":                         cssPlusTok
      of ",":                         cssCommaTok
      of "-":                         cssMinusTok
      of ".":                         cssDotTok
      of "/":                         cssSlashTok
      of ":":                         cssColonTok
      of "::":                        cssDoubleColonTok
      of ";":                         cssSemicolonTok
      of "=":                         cssEqualTok
      of ">":                         cssGreaterThanTok
      of "@charset":                  cssAtcharsetTok
      of "@import":                   cssAtimportTok
      of "@keyframes":                cssAtkeyframesTok
      of "@media":                    cssAtmediaTok
      of "@namespace":                cssAtnamespaceTok
      of "@supports":                 cssAtsuportsTok
      of "[":                         cssLBrackTok
      of "]":                         cssRBrackTok
      of "^=":                        cssAccentEqualTok
      of "and":                       cssAndTok
      of "at_keyword":                cssAtKeyword
      of "attribute_name":            cssAttributeName
      of "class_name":                cssClassName
      of "comment":                   cssComment
      of "feature_name":              cssFeatureName
      of "from":                      cssFrom
      of "function_name":             cssFunctionName
      of "id_name":                   cssIdName
      of "important":                 cssImportant
      of "keyframes_name":            cssKeyframesName
      of "keyword_query":             cssKeywordQuery
      of "namespace_name":            cssNamespaceName
      of "nesting_selector":          cssNestingSelector
      of "not":                       cssNotTok
      of "only":                      cssOnlyTok
      of "or":                        cssOrTok
      of "plain_value":               cssPlainValue
      of "property_name":             cssPropertyName
      of "selector":                  cssSelectorTok
      of "string_value":              cssStringValue
      of "tag_name":                  cssTagName
      of "to":                        cssTo
      of "unit":                      cssUnit
      of "{":                         cssLCurlyTok
      of "|=":                        cssPipeEqualTok
      of "}":                         cssRCurlyTok
      of "~":                         cssTildeTok
      of "~=":                        cssTildeEqualTok
      of "ERROR":                     cssSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsCssNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsCssNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsCssNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_css(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsCssNode): string =
  $ts_node_type(TSNode(node))

proc newTsCssParser*(): CssParser =
  result = CssParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_css())

proc parseString*(parser: CssParser, str: string): TsCssNode =
  TsCssNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsCssString*(str: string): TsCssNode =
  let parser = newTsCssParser()
  return parseString(parser, str)

func `$`*(node: TsCssNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsCssNode,
    idx:  int,
    kind: CssNodeKind | set[CssNodeKind]
  ): TsCssNode =
  assert 0 <= idx and idx < node.len
  result = TsCssNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  CssNode* = HtsNode[TsCssNode, CssNodeKind]

proc treeReprTsCss*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsCssNode, CssNodeKind](parseTsCssString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsCssNode,
    str:  ptr string
  ): HtsNode[TsCssNode, CssNodeKind] =
  toHtsNode[TsCssNode, CssNodeKind](node, str)

proc toHtsTree*(node: TsCssNode, str: ptr string): CssNode =
  toHtsNode[TsCssNode, CssNodeKind](node, str)

proc parseCssString*(str: ptr string, unnamed: bool = false): CssNode =
  let parser = newTsCssParser()
  return toHtsTree[TsCssNode, CssNodeKind](parseString(parser, str[]), str)

proc parseCssString*(str: string, unnamed: bool = false): CssNode =
  let parser = newTsCssParser()
  return toHtsTree[TsCssNode, CssNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


