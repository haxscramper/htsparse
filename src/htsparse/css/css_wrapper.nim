
import
  hmisc / wrappers / treesitter

import
  strutils

type
  CssNodeKind* = enum
    cssAdjacentSiblingSelector, ## adjacent_sibling_selector
    cssArguments,           ## arguments
    cssAtRule,              ## at_rule
    cssAttributeSelector,   ## attribute_selector
    cssBinaryExpression,    ## binary_expression
    cssBinaryQuery,         ## binary_query
    cssBlock,               ## block
    cssCallExpression,      ## call_expression
    cssCharsetStatement,    ## charset_statement
    cssChildSelector,       ## child_selector
    cssClassSelector,       ## class_selector
    cssColorValue,          ## color_value
    cssDeclaration,         ## declaration
    cssDescendantSelector,  ## descendant_selector
    cssFeatureQuery,        ## feature_query
    cssFloatValue,          ## float_value
    cssIdSelector,          ## id_selector
    cssImportStatement,     ## import_statement
    cssIntegerValue,        ## integer_value
    cssKeyframeBlock,       ## keyframe_block
    cssKeyframeBlockList,   ## keyframe_block_list
    cssKeyframesStatement,  ## keyframes_statement
    cssMediaStatement,      ## media_statement
    cssNamespaceStatement,  ## namespace_statement
    cssParenthesizedQuery,  ## parenthesized_query
    cssParenthesizedValue,  ## parenthesized_value
    cssPseudoClassSelector, ## pseudo_class_selector
    cssPseudoElementSelector, ## pseudo_element_selector
    cssRuleSet,             ## rule_set
    cssSelectorQuery,       ## selector_query
    cssSelectors,           ## selectors
    cssSiblingSelector,     ## sibling_selector
    cssStylesheet,          ## stylesheet
    cssSupportsStatement,   ## supports_statement
    cssUnaryQuery,          ## unary_query
    cssUniversalSelector,   ## universal_selector
    cssHashTok,             ## #
    cssDollarEqualTok,      ## $=
    cssLParTok,             ## (
    cssRParTok,             ## )
    cssAsteriskTok,         ## *
    cssAsteriskEqualTok,    ## *=
    cssPlusTok,             ## +
    cssCommaTok,            ## ,
    cssMinusTok,            ## -
    cssDotTok,              ## .
    cssSlashTok,            ## /
    cssColonTok,            ## :
    cssDoubleColonTok,      ## ::
    cssSemicolonTok,        ## ;
    cssEqualTok,            ## =
    cssGreaterThanTok,      ## >
    cssAtcharsetTok,        ## @charset
    cssAtimportTok,         ## @import
    cssAtkeyframesTok,      ## @keyframes
    cssAtmediaTok,          ## @media
    cssAtnamespaceTok,      ## @namespace
    cssAtsuportsTok,        ## @supports
    cssLBrackTok,           ## [
    cssRBrackTok,           ## ]
    cssAccentEqualTok,      ## ^=
    cssAndTok,              ## and
    cssAtKeyword,           ## at_keyword
    cssAttributeName,       ## attribute_name
    cssClassName,           ## class_name
    cssComment,             ## comment
    cssFeatureName,         ## feature_name
    cssFrom,                ## from
    cssFunctionName,        ## function_name
    cssIdName,              ## id_name
    cssImportant,           ## important
    cssKeyframesName,       ## keyframes_name
    cssKeywordQuery,        ## keyword_query
    cssNamespaceName,       ## namespace_name
    cssNestingSelector,     ## nesting_selector
    cssNotTok,              ## not
    cssOnlyTok,             ## only
    cssOrTok,               ## or
    cssPlainValue,          ## plain_value
    cssPropertyName,        ## property_name
    cssSelectorTok,         ## selector
    cssStringValue,         ## string_value
    cssTagName,             ## tag_name
    cssTo,                  ## to
    cssUnit,                ## unit
    cssLCurlyTok,           ## {
    cssPipeEqualTok,        ## |=
    cssRCurlyTok,           ## }
    cssTildeTok,            ## ~
    cssTildeEqualTok,       ## ~=
    cssSyntaxError           ## Tree-sitter parser syntax error
type
  CssExternalTok* = enum
    cssExtern_descendant_operator ## _descendant_operator
type
  CssNode* = distinct TSNode
type
  CssParser* = distinct PtsParser
proc tsNodeType*(node: CssNode): string
proc kind*(node: CssNode): CssNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "adjacent_sibling_selector":
      cssAdjacentSiblingSelector
    of "arguments":
      cssArguments
    of "at_rule":
      cssAtRule
    of "attribute_selector":
      cssAttributeSelector
    of "binary_expression":
      cssBinaryExpression
    of "binary_query":
      cssBinaryQuery
    of "block":
      cssBlock
    of "call_expression":
      cssCallExpression
    of "charset_statement":
      cssCharsetStatement
    of "child_selector":
      cssChildSelector
    of "class_selector":
      cssClassSelector
    of "color_value":
      cssColorValue
    of "declaration":
      cssDeclaration
    of "descendant_selector":
      cssDescendantSelector
    of "feature_query":
      cssFeatureQuery
    of "float_value":
      cssFloatValue
    of "id_selector":
      cssIdSelector
    of "import_statement":
      cssImportStatement
    of "integer_value":
      cssIntegerValue
    of "keyframe_block":
      cssKeyframeBlock
    of "keyframe_block_list":
      cssKeyframeBlockList
    of "keyframes_statement":
      cssKeyframesStatement
    of "media_statement":
      cssMediaStatement
    of "namespace_statement":
      cssNamespaceStatement
    of "parenthesized_query":
      cssParenthesizedQuery
    of "parenthesized_value":
      cssParenthesizedValue
    of "pseudo_class_selector":
      cssPseudoClassSelector
    of "pseudo_element_selector":
      cssPseudoElementSelector
    of "rule_set":
      cssRuleSet
    of "selector_query":
      cssSelectorQuery
    of "selectors":
      cssSelectors
    of "sibling_selector":
      cssSiblingSelector
    of "stylesheet":
      cssStylesheet
    of "supports_statement":
      cssSupportsStatement
    of "unary_query":
      cssUnaryQuery
    of "universal_selector":
      cssUniversalSelector
    of "#":
      cssHashTok
    of "$=":
      cssDollarEqualTok
    of "(":
      cssLParTok
    of ")":
      cssRParTok
    of "*":
      cssAsteriskTok
    of "*=":
      cssAsteriskEqualTok
    of "+":
      cssPlusTok
    of ",":
      cssCommaTok
    of "-":
      cssMinusTok
    of ".":
      cssDotTok
    of "/":
      cssSlashTok
    of ":":
      cssColonTok
    of "::":
      cssDoubleColonTok
    of ";":
      cssSemicolonTok
    of "=":
      cssEqualTok
    of ">":
      cssGreaterThanTok
    of "@charset":
      cssAtcharsetTok
    of "@import":
      cssAtimportTok
    of "@keyframes":
      cssAtkeyframesTok
    of "@media":
      cssAtmediaTok
    of "@namespace":
      cssAtnamespaceTok
    of "@supports":
      cssAtsuportsTok
    of "[":
      cssLBrackTok
    of "]":
      cssRBrackTok
    of "^=":
      cssAccentEqualTok
    of "and":
      cssAndTok
    of "at_keyword":
      cssAtKeyword
    of "attribute_name":
      cssAttributeName
    of "class_name":
      cssClassName
    of "comment":
      cssComment
    of "feature_name":
      cssFeatureName
    of "from":
      cssFrom
    of "function_name":
      cssFunctionName
    of "id_name":
      cssIdName
    of "important":
      cssImportant
    of "keyframes_name":
      cssKeyframesName
    of "keyword_query":
      cssKeywordQuery
    of "namespace_name":
      cssNamespaceName
    of "nesting_selector":
      cssNestingSelector
    of "not":
      cssNotTok
    of "only":
      cssOnlyTok
    of "or":
      cssOrTok
    of "plain_value":
      cssPlainValue
    of "property_name":
      cssPropertyName
    of "selector":
      cssSelectorTok
    of "string_value":
      cssStringValue
    of "tag_name":
      cssTagName
    of "to":
      cssTo
    of "unit":
      cssUnit
    of "{":
      cssLCurlyTok
    of "|=":
      cssPipeEqualTok
    of "}":
      cssRCurlyTok
    of "~":
      cssTildeTok
    of "~=":
      cssTildeEqualTok
    of "ERROR":
      cssSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_css(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: CssNode): string =
  $ts_node_type(TSNode(node))

proc newCssParser*(): CssParser =
  result = CssParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_css())

proc parseString*(parser: CssParser; str: string): CssNode =
  CssNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseCssString*(str: string): CssNode =
  let parser = newCssParser()
  return parseString(parser, str)

func `[]`*(node: CssNode; idx: int; withUnnamed: bool = false): CssNode =
  if withUnnamed:
    CssNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    CssNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: CssNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: CssNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: CssNode; withUnnamed: bool = false): CssNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                     ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: CssNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: CssNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: CssNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: CssNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: CssNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: CssNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: CssNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: CssNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: CssNode): CssNode =
  CssNode(ts_node_parent(TSNode(node)))

func child*(node: CssNode; a2: int): CssNode =
  CssNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: CssNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: CssNode; a2: int): CssNode =
  CssNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: CssNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: CssNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: CssNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: CssNode): int =
  node.startPoint().row.int

func endLine*(node: CssNode): int =
  node.endPoint().row.int

func startColumn*(node: CssNode): int =
  node.startPoint().column.int

func endColumn*(node: CssNode): int =
  node.endPoint().column.int

func childByFieldName*(self: CssNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
