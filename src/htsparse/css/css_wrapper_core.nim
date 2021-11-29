import
  hmisc / wrappers/treesitter_core
export treesitter_core
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
    cssHidQuery                ## _query
    cssHidSelector             ## _selector
    cssHidValue                ## _value
    cssHidTopLevelItem         ## _top_level_item
    cssIdentifier              ## identifier
    cssHidBlockItem            ## _block_item
    cssHidDescendantOperator   ## _descendant_operator
    cssPseudoClassArguments    ## pseudo_class_arguments
    cssLastDeclaration         ## last_declaration
    cssSyntaxError             ## Tree-sitter parser syntax error

proc strRepr*(kind: CssNodeKind): string =
  case kind:
    of cssAdjacentSiblingSelector: "adjacent_sibling_selector"
    of cssArguments:               "arguments"
    of cssAtRule:                  "at_rule"
    of cssAttributeSelector:       "attribute_selector"
    of cssBinaryExpression:        "binary_expression"
    of cssBinaryQuery:             "binary_query"
    of cssBlock:                   "block"
    of cssCallExpression:          "call_expression"
    of cssCharsetStatement:        "charset_statement"
    of cssChildSelector:           "child_selector"
    of cssClassSelector:           "class_selector"
    of cssColorValue:              "color_value"
    of cssDeclaration:             "declaration"
    of cssDescendantSelector:      "descendant_selector"
    of cssFeatureQuery:            "feature_query"
    of cssFloatValue:              "float_value"
    of cssIdSelector:              "id_selector"
    of cssImportStatement:         "import_statement"
    of cssIntegerValue:            "integer_value"
    of cssKeyframeBlock:           "keyframe_block"
    of cssKeyframeBlockList:       "keyframe_block_list"
    of cssKeyframesStatement:      "keyframes_statement"
    of cssMediaStatement:          "media_statement"
    of cssNamespaceStatement:      "namespace_statement"
    of cssParenthesizedQuery:      "parenthesized_query"
    of cssParenthesizedValue:      "parenthesized_value"
    of cssPseudoClassSelector:     "pseudo_class_selector"
    of cssPseudoElementSelector:   "pseudo_element_selector"
    of cssRuleSet:                 "rule_set"
    of cssSelectorQuery:           "selector_query"
    of cssSelectors:               "selectors"
    of cssSiblingSelector:         "sibling_selector"
    of cssStylesheet:              "stylesheet"
    of cssSupportsStatement:       "supports_statement"
    of cssUnaryQuery:              "unary_query"
    of cssUniversalSelector:       "universal_selector"
    of cssHashTok:                 "#"
    of cssDollarEqualTok:          "$="
    of cssLParTok:                 "("
    of cssRParTok:                 ")"
    of cssAsteriskTok:             "*"
    of cssAsteriskEqualTok:        "*="
    of cssPlusTok:                 "+"
    of cssCommaTok:                ","
    of cssMinusTok:                "-"
    of cssDotTok:                  "."
    of cssSlashTok:                "/"
    of cssColonTok:                ":"
    of cssDoubleColonTok:          "::"
    of cssSemicolonTok:            ";"
    of cssEqualTok:                "="
    of cssGreaterThanTok:          ">"
    of cssAtcharsetTok:            "@charset"
    of cssAtimportTok:             "@import"
    of cssAtkeyframesTok:          "@keyframes"
    of cssAtmediaTok:              "@media"
    of cssAtnamespaceTok:          "@namespace"
    of cssAtsuportsTok:            "@supports"
    of cssLBrackTok:               "["
    of cssRBrackTok:               "]"
    of cssAccentEqualTok:          "^="
    of cssAndTok:                  "and"
    of cssAtKeyword:               "at_keyword"
    of cssAttributeName:           "attribute_name"
    of cssClassName:               "class_name"
    of cssComment:                 "comment"
    of cssFeatureName:             "feature_name"
    of cssFrom:                    "from"
    of cssFunctionName:            "function_name"
    of cssIdName:                  "id_name"
    of cssImportant:               "important"
    of cssKeyframesName:           "keyframes_name"
    of cssKeywordQuery:            "keyword_query"
    of cssNamespaceName:           "namespace_name"
    of cssNestingSelector:         "nesting_selector"
    of cssNotTok:                  "not"
    of cssOnlyTok:                 "only"
    of cssOrTok:                   "or"
    of cssPlainValue:              "plain_value"
    of cssPropertyName:            "property_name"
    of cssSelectorTok:             "selector"
    of cssStringValue:             "string_value"
    of cssTagName:                 "tag_name"
    of cssTo:                      "to"
    of cssUnit:                    "unit"
    of cssLCurlyTok:               "{"
    of cssPipeEqualTok:            "|="
    of cssRCurlyTok:               "}"
    of cssTildeTok:                "~"
    of cssTildeEqualTok:           "~="
    of cssHidQuery:                "_query"
    of cssHidSelector:             "_selector"
    of cssHidValue:                "_value"
    of cssHidTopLevelItem:         "_top_level_item"
    of cssIdentifier:              "identifier"
    of cssHidBlockItem:            "_block_item"
    of cssHidDescendantOperator:   "_descendant_operator"
    of cssPseudoClassArguments:    "pseudo_class_arguments"
    of cssLastDeclaration:         "last_declaration"
    of cssSyntaxError:             "ERROR"

type
  CssExternalTok* = enum
    cssExtern_descendant_operator ## _descendant_operator

type
  TsCssNode* = distinct TSNode

type
  CssParser* = distinct PtsParser

const cssAllowedSubnodes*: array[CssNodeKind, set[CssNodeKind]] = block:
                                                                    var tmp: array[CssNodeKind, set[CssNodeKind]]
                                                                    tmp[cssAdjacentSiblingSelector] = {
                                                                                                        cssAdjacentSiblingSelector,
                                                                                                        cssAttributeSelector,
                                                                                                        cssChildSelector,
                                                                                                        cssClassSelector,
                                                                                                        cssDescendantSelector,
                                                                                                        cssIdSelector,
                                                                                                        cssNestingSelector,
                                                                                                        cssPseudoClassSelector,
                                                                                                        cssPseudoElementSelector,
                                                                                                        cssSiblingSelector,
                                                                                                        cssStringValue,
                                                                                                        cssTagName,
                                                                                                        cssUniversalSelector
                                                                                                      }
                                                                    tmp[cssArguments] = {
                                                                                          cssAdjacentSiblingSelector,
                                                                                          cssAttributeSelector,
                                                                                          cssBinaryExpression,
                                                                                          cssCallExpression,
                                                                                          cssChildSelector,
                                                                                          cssClassSelector,
                                                                                          cssColorValue,
                                                                                          cssDescendantSelector,
                                                                                          cssFloatValue,
                                                                                          cssIdSelector,
                                                                                          cssIntegerValue,
                                                                                          cssNestingSelector,
                                                                                          cssParenthesizedValue,
                                                                                          cssPlainValue,
                                                                                          cssPseudoClassSelector,
                                                                                          cssPseudoElementSelector,
                                                                                          cssSiblingSelector,
                                                                                          cssStringValue,
                                                                                          cssTagName,
                                                                                          cssUniversalSelector
                                                                                        }
                                                                    tmp[cssAtRule] = {
                                                                                       cssAtKeyword,
                                                                                       cssBinaryQuery,
                                                                                       cssBlock,
                                                                                       cssFeatureQuery,
                                                                                       cssKeywordQuery,
                                                                                       cssParenthesizedQuery,
                                                                                       cssSelectorQuery,
                                                                                       cssUnaryQuery
                                                                                     }
                                                                    tmp[cssAttributeSelector] = {
                                                                                                  cssAdjacentSiblingSelector,
                                                                                                  cssAttributeName,
                                                                                                  cssAttributeSelector,
                                                                                                  cssBinaryExpression,
                                                                                                  cssCallExpression,
                                                                                                  cssChildSelector,
                                                                                                  cssClassSelector,
                                                                                                  cssColorValue,
                                                                                                  cssDescendantSelector,
                                                                                                  cssFloatValue,
                                                                                                  cssIdSelector,
                                                                                                  cssIntegerValue,
                                                                                                  cssNestingSelector,
                                                                                                  cssParenthesizedValue,
                                                                                                  cssPlainValue,
                                                                                                  cssPseudoClassSelector,
                                                                                                  cssPseudoElementSelector,
                                                                                                  cssSiblingSelector,
                                                                                                  cssStringValue,
                                                                                                  cssTagName,
                                                                                                  cssUniversalSelector
                                                                                                }
                                                                    tmp[cssBinaryExpression] = {
                                                                                                 cssBinaryExpression,
                                                                                                 cssCallExpression,
                                                                                                 cssColorValue,
                                                                                                 cssFloatValue,
                                                                                                 cssIntegerValue,
                                                                                                 cssParenthesizedValue,
                                                                                                 cssPlainValue,
                                                                                                 cssStringValue
                                                                                               }
                                                                    tmp[cssBinaryQuery] = {cssBinaryQuery, cssFeatureQuery, cssKeywordQuery, cssParenthesizedQuery, cssSelectorQuery, cssUnaryQuery}
                                                                    tmp[cssBlock] = {
                                                                                      cssAtRule,
                                                                                      cssCharsetStatement,
                                                                                      cssDeclaration,
                                                                                      cssImportStatement,
                                                                                      cssKeyframesStatement,
                                                                                      cssMediaStatement,
                                                                                      cssNamespaceStatement,
                                                                                      cssRuleSet,
                                                                                      cssSupportsStatement
                                                                                    }
                                                                    tmp[cssCallExpression] = {cssArguments, cssFunctionName}
                                                                    tmp[cssCharsetStatement] = {
                                                                                                 cssBinaryExpression,
                                                                                                 cssCallExpression,
                                                                                                 cssColorValue,
                                                                                                 cssFloatValue,
                                                                                                 cssIntegerValue,
                                                                                                 cssParenthesizedValue,
                                                                                                 cssPlainValue,
                                                                                                 cssStringValue
                                                                                               }
                                                                    tmp[cssChildSelector] = {
                                                                                              cssAdjacentSiblingSelector,
                                                                                              cssAttributeSelector,
                                                                                              cssChildSelector,
                                                                                              cssClassSelector,
                                                                                              cssDescendantSelector,
                                                                                              cssIdSelector,
                                                                                              cssNestingSelector,
                                                                                              cssPseudoClassSelector,
                                                                                              cssPseudoElementSelector,
                                                                                              cssSiblingSelector,
                                                                                              cssStringValue,
                                                                                              cssTagName,
                                                                                              cssUniversalSelector
                                                                                            }
                                                                    tmp[cssClassSelector] = {
                                                                                              cssAdjacentSiblingSelector,
                                                                                              cssAttributeSelector,
                                                                                              cssChildSelector,
                                                                                              cssClassName,
                                                                                              cssClassSelector,
                                                                                              cssDescendantSelector,
                                                                                              cssIdSelector,
                                                                                              cssNestingSelector,
                                                                                              cssPseudoClassSelector,
                                                                                              cssPseudoElementSelector,
                                                                                              cssSiblingSelector,
                                                                                              cssStringValue,
                                                                                              cssTagName,
                                                                                              cssUniversalSelector
                                                                                            }
                                                                    tmp[cssDeclaration] = {
                                                                                            cssBinaryExpression,
                                                                                            cssCallExpression,
                                                                                            cssColorValue,
                                                                                            cssFloatValue,
                                                                                            cssImportant,
                                                                                            cssIntegerValue,
                                                                                            cssParenthesizedValue,
                                                                                            cssPlainValue,
                                                                                            cssPropertyName,
                                                                                            cssStringValue
                                                                                          }
                                                                    tmp[cssDescendantSelector] = {
                                                                                                   cssAdjacentSiblingSelector,
                                                                                                   cssAttributeSelector,
                                                                                                   cssChildSelector,
                                                                                                   cssClassSelector,
                                                                                                   cssDescendantSelector,
                                                                                                   cssIdSelector,
                                                                                                   cssNestingSelector,
                                                                                                   cssPseudoClassSelector,
                                                                                                   cssPseudoElementSelector,
                                                                                                   cssSiblingSelector,
                                                                                                   cssStringValue,
                                                                                                   cssTagName,
                                                                                                   cssUniversalSelector
                                                                                                 }
                                                                    tmp[cssFeatureQuery] = {
                                                                                             cssBinaryExpression,
                                                                                             cssCallExpression,
                                                                                             cssColorValue,
                                                                                             cssFeatureName,
                                                                                             cssFloatValue,
                                                                                             cssIntegerValue,
                                                                                             cssParenthesizedValue,
                                                                                             cssPlainValue,
                                                                                             cssStringValue
                                                                                           }
                                                                    tmp[cssFloatValue] = {cssUnit}
                                                                    tmp[cssIdSelector] = {
                                                                                           cssAdjacentSiblingSelector,
                                                                                           cssAttributeSelector,
                                                                                           cssChildSelector,
                                                                                           cssClassSelector,
                                                                                           cssDescendantSelector,
                                                                                           cssIdName,
                                                                                           cssIdSelector,
                                                                                           cssNestingSelector,
                                                                                           cssPseudoClassSelector,
                                                                                           cssPseudoElementSelector,
                                                                                           cssSiblingSelector,
                                                                                           cssStringValue,
                                                                                           cssTagName,
                                                                                           cssUniversalSelector
                                                                                         }
                                                                    tmp[cssImportStatement] = {
                                                                                                cssBinaryExpression,
                                                                                                cssBinaryQuery,
                                                                                                cssCallExpression,
                                                                                                cssColorValue,
                                                                                                cssFeatureQuery,
                                                                                                cssFloatValue,
                                                                                                cssIntegerValue,
                                                                                                cssKeywordQuery,
                                                                                                cssParenthesizedQuery,
                                                                                                cssParenthesizedValue,
                                                                                                cssPlainValue,
                                                                                                cssSelectorQuery,
                                                                                                cssStringValue,
                                                                                                cssUnaryQuery
                                                                                              }
                                                                    tmp[cssIntegerValue] = {cssUnit}
                                                                    tmp[cssKeyframeBlock] = {cssBlock, cssFrom, cssIntegerValue, cssTo}
                                                                    tmp[cssKeyframeBlockList] = {cssKeyframeBlock}
                                                                    tmp[cssKeyframesStatement] = {cssAtKeyword, cssKeyframeBlockList, cssKeyframesName}
                                                                    tmp[cssMediaStatement] = {
                                                                                               cssBinaryQuery,
                                                                                               cssBlock,
                                                                                               cssFeatureQuery,
                                                                                               cssKeywordQuery,
                                                                                               cssParenthesizedQuery,
                                                                                               cssSelectorQuery,
                                                                                               cssUnaryQuery
                                                                                             }
                                                                    tmp[cssNamespaceStatement] = {cssCallExpression, cssNamespaceName, cssStringValue}
                                                                    tmp[cssParenthesizedQuery] = {cssBinaryQuery, cssFeatureQuery, cssKeywordQuery, cssParenthesizedQuery, cssSelectorQuery, cssUnaryQuery}
                                                                    tmp[cssParenthesizedValue] = {
                                                                                                   cssBinaryExpression,
                                                                                                   cssCallExpression,
                                                                                                   cssColorValue,
                                                                                                   cssFloatValue,
                                                                                                   cssIntegerValue,
                                                                                                   cssParenthesizedValue,
                                                                                                   cssPlainValue,
                                                                                                   cssStringValue
                                                                                                 }
                                                                    tmp[cssPseudoClassSelector] = {
                                                                                                    cssAdjacentSiblingSelector,
                                                                                                    cssArguments,
                                                                                                    cssAttributeSelector,
                                                                                                    cssChildSelector,
                                                                                                    cssClassName,
                                                                                                    cssClassSelector,
                                                                                                    cssDescendantSelector,
                                                                                                    cssIdSelector,
                                                                                                    cssNestingSelector,
                                                                                                    cssPseudoClassSelector,
                                                                                                    cssPseudoElementSelector,
                                                                                                    cssSiblingSelector,
                                                                                                    cssStringValue,
                                                                                                    cssTagName,
                                                                                                    cssUniversalSelector
                                                                                                  }
                                                                    tmp[cssPseudoElementSelector] = {
                                                                                                      cssAdjacentSiblingSelector,
                                                                                                      cssAttributeSelector,
                                                                                                      cssChildSelector,
                                                                                                      cssClassSelector,
                                                                                                      cssDescendantSelector,
                                                                                                      cssIdSelector,
                                                                                                      cssNestingSelector,
                                                                                                      cssPseudoClassSelector,
                                                                                                      cssPseudoElementSelector,
                                                                                                      cssSiblingSelector,
                                                                                                      cssStringValue,
                                                                                                      cssTagName,
                                                                                                      cssUniversalSelector
                                                                                                    }
                                                                    tmp[cssRuleSet] = {cssBlock, cssSelectors}
                                                                    tmp[cssSelectorQuery] = {
                                                                                              cssAdjacentSiblingSelector,
                                                                                              cssAttributeSelector,
                                                                                              cssChildSelector,
                                                                                              cssClassSelector,
                                                                                              cssDescendantSelector,
                                                                                              cssIdSelector,
                                                                                              cssNestingSelector,
                                                                                              cssPseudoClassSelector,
                                                                                              cssPseudoElementSelector,
                                                                                              cssSiblingSelector,
                                                                                              cssStringValue,
                                                                                              cssTagName,
                                                                                              cssUniversalSelector
                                                                                            }
                                                                    tmp[cssSelectors] = {
                                                                                          cssAdjacentSiblingSelector,
                                                                                          cssAttributeSelector,
                                                                                          cssChildSelector,
                                                                                          cssClassSelector,
                                                                                          cssDescendantSelector,
                                                                                          cssIdSelector,
                                                                                          cssNestingSelector,
                                                                                          cssPseudoClassSelector,
                                                                                          cssPseudoElementSelector,
                                                                                          cssSiblingSelector,
                                                                                          cssStringValue,
                                                                                          cssTagName,
                                                                                          cssUniversalSelector
                                                                                        }
                                                                    tmp[cssSiblingSelector] = {
                                                                                                cssAdjacentSiblingSelector,
                                                                                                cssAttributeSelector,
                                                                                                cssChildSelector,
                                                                                                cssClassSelector,
                                                                                                cssDescendantSelector,
                                                                                                cssIdSelector,
                                                                                                cssNestingSelector,
                                                                                                cssPseudoClassSelector,
                                                                                                cssPseudoElementSelector,
                                                                                                cssSiblingSelector,
                                                                                                cssStringValue,
                                                                                                cssTagName,
                                                                                                cssUniversalSelector
                                                                                              }
                                                                    tmp[cssStylesheet] = {
                                                                                           cssAtRule,
                                                                                           cssCharsetStatement,
                                                                                           cssDeclaration,
                                                                                           cssImportStatement,
                                                                                           cssKeyframesStatement,
                                                                                           cssMediaStatement,
                                                                                           cssNamespaceStatement,
                                                                                           cssRuleSet,
                                                                                           cssSupportsStatement
                                                                                         }
                                                                    tmp[cssSupportsStatement] = {
                                                                                                  cssBinaryQuery,
                                                                                                  cssBlock,
                                                                                                  cssFeatureQuery,
                                                                                                  cssKeywordQuery,
                                                                                                  cssParenthesizedQuery,
                                                                                                  cssSelectorQuery,
                                                                                                  cssUnaryQuery
                                                                                                }
                                                                    tmp[cssUnaryQuery] = {cssBinaryQuery, cssFeatureQuery, cssKeywordQuery, cssParenthesizedQuery, cssSelectorQuery, cssUnaryQuery}
                                                                    tmp
const cssTokenKinds*: set[CssNodeKind] = {
                                           cssHashTok,
                                           cssDollarEqualTok,
                                           cssLParTok,
                                           cssRParTok,
                                           cssAsteriskTok,
                                           cssAsteriskEqualTok,
                                           cssPlusTok,
                                           cssCommaTok,
                                           cssMinusTok,
                                           cssDotTok,
                                           cssSlashTok,
                                           cssColonTok,
                                           cssDoubleColonTok,
                                           cssSemicolonTok,
                                           cssEqualTok,
                                           cssGreaterThanTok,
                                           cssAtcharsetTok,
                                           cssAtimportTok,
                                           cssAtkeyframesTok,
                                           cssAtmediaTok,
                                           cssAtnamespaceTok,
                                           cssAtsuportsTok,
                                           cssLBrackTok,
                                           cssRBrackTok,
                                           cssAccentEqualTok,
                                           cssAndTok,
                                           cssNotTok,
                                           cssOnlyTok,
                                           cssOrTok,
                                           cssSelectorTok,
                                           cssLCurlyTok,
                                           cssPipeEqualTok,
                                           cssRCurlyTok,
                                           cssTildeTok,
                                           cssTildeEqualTok
                                         }
const cssHiddenKinds*: set[CssNodeKind] = {
                                            cssHidQuery,
                                            cssHidSelector,
                                            cssHidValue,
                                            cssHidTopLevelItem,
                                            cssIdentifier,
                                            cssHidBlockItem,
                                            cssHidDescendantOperator,
                                            cssPseudoClassArguments,
                                            cssLastDeclaration
                                          }
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


proc treeRepr*(node: TsCssNode, str: string): string =
  var res = addr result
  proc aux(node: TsCssNode, level: int) =
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
let cssGrammar*: array[CssNodeKind, HtsRule[CssNodeKind]] = block:
                                                              var rules: array[CssNodeKind, HtsRule[CssNodeKind]]
                                                              type
                                                                K = CssNodeKind


                                                              rules[cssParenthesizedValue] = tsSeq[K](tsString[K]("("), tsSymbol[K](cssHidValue), tsString[K](")"))
                                                              rules[cssHidQuery] = tsChoice[K](tsSymbol[K](cssIdentifier), tsSymbol[K](cssFeatureQuery), tsSymbol[K](cssBinaryQuery), tsSymbol[K](cssUnaryQuery), tsSymbol[K](cssSelectorQuery), tsSymbol[K](cssParenthesizedQuery))
                                                              rules[cssBinaryQuery] = tsSeq[K](tsSymbol[K](cssHidQuery), tsChoice[K](tsString[K]("and"), tsString[K]("or")), tsSymbol[K](cssHidQuery))
                                                              rules[cssImportant] = tsString[K]("!important")
                                                              rules[cssNestingSelector] = tsString[K]("&")
                                                              rules[cssMediaStatement] = tsSeq[K](tsString[K]("@media"), tsSeq[K](tsSymbol[K](cssHidQuery), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cssHidQuery)))), tsSymbol[K](cssBlock))
                                                              rules[cssSelectors] = tsSeq[K](tsSymbol[K](cssHidSelector), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cssHidSelector))))
                                                              rules[cssAdjacentSiblingSelector] = tsSeq[K](tsSymbol[K](cssHidSelector), tsString[K]("+"), tsSymbol[K](cssHidSelector))
                                                              rules[cssAtKeyword] = tsRegex[K]("@[a-zA-Z-_]+")
                                                              rules[cssUniversalSelector] = tsString[K]("*")
                                                              rules[cssFrom] = tsString[K]("from")
                                                              rules[cssUnit] = tsRegex[K]("[a-zA-Z%]+")
                                                              rules[cssColorValue] = tsSeq[K](tsString[K]("#"), tsRegex[K]("[0-9a-fA-F]{3,8}"))
                                                              rules[cssCallExpression] = tsSeq[K](tsSymbol[K](cssIdentifier), tsSymbol[K](cssArguments))
                                                              rules[cssRuleSet] = tsSeq[K](tsSymbol[K](cssSelectors), tsSymbol[K](cssBlock))
                                                              rules[cssFeatureQuery] = tsSeq[K](tsString[K]("("), tsSymbol[K](cssIdentifier), tsString[K](":"), tsRepeat1[K](tsSymbol[K](cssHidValue)), tsString[K](")"))
                                                              rules[cssAttributeSelector] = tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsBlank[K]()), tsString[K]("["), tsSymbol[K](cssIdentifier), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("="), tsString[K]("~="), tsString[K]("^="), tsString[K]("|="), tsString[K]("*="), tsString[K]("$=")), tsSymbol[K](cssHidValue)), tsBlank[K]()), tsString[K]("]"))
                                                              rules[cssUnaryQuery] = tsSeq[K](tsChoice[K](tsString[K]("not"), tsString[K]("only")), tsSymbol[K](cssHidQuery))
                                                              rules[cssFloatValue] = tsSeq[K](tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsRegex[K]("\\d*"), tsChoice[K](tsSeq[K](tsString[K]("."), tsRegex[K]("\\d+")), tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsString[K]("-"), tsBlank[K]()), tsRegex[K]("\\d+")), tsSeq[K](tsString[K]("."), tsRegex[K]("\\d+"), tsRegex[K]("[eE]"), tsChoice[K](tsString[K]("-"), tsBlank[K]()), tsRegex[K]("\\d+")))), tsChoice[K](tsSymbol[K](cssUnit), tsBlank[K]()))
                                                              rules[cssBinaryExpression] = tsSeq[K](tsSymbol[K](cssHidValue), tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("*"), tsString[K]("/")), tsSymbol[K](cssHidValue))
                                                              rules[cssHidSelector] = tsChoice[K](tsSymbol[K](cssUniversalSelector), tsSymbol[K](cssIdentifier), tsSymbol[K](cssClassSelector), tsSymbol[K](cssNestingSelector), tsSymbol[K](cssPseudoClassSelector), tsSymbol[K](cssPseudoElementSelector), tsSymbol[K](cssIdSelector), tsSymbol[K](cssAttributeSelector), tsSymbol[K](cssStringValue), tsSymbol[K](cssChildSelector), tsSymbol[K](cssDescendantSelector), tsSymbol[K](cssSiblingSelector), tsSymbol[K](cssAdjacentSiblingSelector))
                                                              rules[cssDeclaration] = tsSeq[K](tsSymbol[K](cssIdentifier), tsString[K](":"), tsSymbol[K](cssHidValue), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K](","), tsBlank[K]()), tsSymbol[K](cssHidValue))), tsChoice[K](tsSymbol[K](cssImportant), tsBlank[K]()), tsString[K](";"))
                                                              rules[cssBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cssHidBlockItem)), tsChoice[K](tsSymbol[K](cssLastDeclaration), tsBlank[K]()), tsString[K]("}"))
                                                              rules[cssHidValue] = tsChoice[K](tsSymbol[K](cssIdentifier), tsSymbol[K](cssPlainValue), tsSymbol[K](cssColorValue), tsSymbol[K](cssIntegerValue), tsSymbol[K](cssFloatValue), tsSymbol[K](cssStringValue), tsSymbol[K](cssBinaryExpression), tsSymbol[K](cssParenthesizedValue), tsSymbol[K](cssCallExpression))
                                                              rules[cssSelectorQuery] = tsSeq[K](tsString[K]("selector"), tsString[K]("("), tsSymbol[K](cssHidSelector), tsString[K](")"))
                                                              rules[cssHidTopLevelItem] = tsChoice[K](tsSymbol[K](cssDeclaration), tsSymbol[K](cssRuleSet), tsSymbol[K](cssImportStatement), tsSymbol[K](cssMediaStatement), tsSymbol[K](cssCharsetStatement), tsSymbol[K](cssNamespaceStatement), tsSymbol[K](cssKeyframesStatement), tsSymbol[K](cssSupportsStatement), tsSymbol[K](cssAtRule))
                                                              rules[cssPseudoClassSelector] = tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsBlank[K]()), tsString[K](":"), tsSymbol[K](cssIdentifier), tsChoice[K](tsSymbol[K](cssPseudoClassArguments), tsBlank[K]()))
                                                              rules[cssIdSelector] = tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsBlank[K]()), tsString[K]("#"), tsSymbol[K](cssIdentifier))
                                                              rules[cssAtRule] = tsSeq[K](tsSymbol[K](cssAtKeyword), tsChoice[K](tsSeq[K](tsSymbol[K](cssHidQuery), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cssHidQuery)))), tsBlank[K]()), tsChoice[K](tsString[K](";"), tsSymbol[K](cssBlock)))
                                                              rules[cssComment] = tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/"))
                                                              rules[cssImportStatement] = tsSeq[K](tsString[K]("@import"), tsSymbol[K](cssHidValue), tsChoice[K](tsSeq[K](tsSymbol[K](cssHidQuery), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cssHidQuery)))), tsBlank[K]()), tsString[K](";"))
                                                              rules[cssParenthesizedQuery] = tsSeq[K](tsString[K]("("), tsSymbol[K](cssHidQuery), tsString[K](")"))
                                                              rules[cssKeyframeBlockList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cssKeyframeBlock)), tsString[K]("}"))
                                                              rules[cssKeyframeBlock] = tsSeq[K](tsChoice[K](tsSymbol[K](cssFrom), tsSymbol[K](cssTo), tsSymbol[K](cssIntegerValue)), tsSymbol[K](cssBlock))
                                                              rules[cssDescendantSelector] = tsSeq[K](tsSymbol[K](cssHidSelector), tsSymbol[K](cssHidDescendantOperator), tsSymbol[K](cssHidSelector))
                                                              rules[cssClassSelector] = tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsBlank[K]()), tsString[K]("."), tsSymbol[K](cssIdentifier))
                                                              rules[cssIdentifier] = tsRegex[K]("[a-zA-Z-_][a-zA-Z0-9-_]*")
                                                              rules[cssArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsRepeat1[K](tsSymbol[K](cssHidValue)), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K](","), tsString[K](";")), tsRepeat1[K](tsSymbol[K](cssHidValue))))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cssTo] = tsString[K]("to")
                                                              rules[cssPseudoElementSelector] = tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](cssIdentifier))
                                                              rules[cssKeyframesStatement] = tsSeq[K](tsChoice[K](tsString[K]("@keyframes"), tsRegex[K]("@[-a-z]+keyframes")), tsSymbol[K](cssIdentifier), tsSymbol[K](cssKeyframeBlockList))
                                                              rules[cssCharsetStatement] = tsSeq[K](tsString[K]("@charset"), tsSymbol[K](cssHidValue), tsString[K](";"))
                                                              rules[cssNamespaceStatement] = tsSeq[K](tsString[K]("@namespace"), tsChoice[K](tsSymbol[K](cssIdentifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cssStringValue), tsSymbol[K](cssCallExpression)), tsString[K](";"))
                                                              rules[cssStylesheet] = tsRepeat[K](tsSymbol[K](cssHidTopLevelItem))
                                                              rules[cssHidBlockItem] = tsChoice[K](tsSymbol[K](cssDeclaration), tsSymbol[K](cssRuleSet), tsSymbol[K](cssImportStatement), tsSymbol[K](cssMediaStatement), tsSymbol[K](cssCharsetStatement), tsSymbol[K](cssNamespaceStatement), tsSymbol[K](cssKeyframesStatement), tsSymbol[K](cssSupportsStatement), tsSymbol[K](cssAtRule))
                                                              rules[cssSiblingSelector] = tsSeq[K](tsSymbol[K](cssHidSelector), tsString[K]("~"), tsSymbol[K](cssHidSelector))
                                                              rules[cssChildSelector] = tsSeq[K](tsSymbol[K](cssHidSelector), tsString[K](">"), tsSymbol[K](cssHidSelector))
                                                              rules[cssStringValue] = tsChoice[K](tsSeq[K](tsString[K]("\'"), tsRegex[K]("([^\'\\n]|\\\\(.|\\n))*"), tsString[K]("\'")), tsSeq[K](tsString[K]("\""), tsRegex[K]("([^\"\\n]|\\\\(.|\\n))*"), tsString[K]("\"")))
                                                              rules[cssPlainValue] = tsSeq[K](tsRepeat[K](tsChoice[K](tsRegex[K]("[-_]"), tsRegex[K]("\\/[^\\*\\s,;!{}()\\[\\]]"))), tsRegex[K]("[a-zA-Z]"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^/\\s,;!{}()\\[\\]]"), tsRegex[K]("\\/[^\\*\\s,;!{}()\\[\\]]"))))
                                                              rules[cssPseudoClassArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cssHidSelector), tsRepeat1[K](tsSymbol[K](cssHidValue))), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cssHidSelector), tsRepeat1[K](tsSymbol[K](cssHidValue)))))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cssSupportsStatement] = tsSeq[K](tsString[K]("@supports"), tsSymbol[K](cssHidQuery), tsSymbol[K](cssBlock))
                                                              rules[cssLastDeclaration] = tsSeq[K](tsSymbol[K](cssIdentifier), tsString[K](":"), tsSymbol[K](cssHidValue), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K](","), tsBlank[K]()), tsSymbol[K](cssHidValue))), tsChoice[K](tsSymbol[K](cssImportant), tsBlank[K]()))
                                                              rules[cssIntegerValue] = tsSeq[K](tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsRegex[K]("\\d+")), tsChoice[K](tsSymbol[K](cssUnit), tsBlank[K]()))
                                                              rules

