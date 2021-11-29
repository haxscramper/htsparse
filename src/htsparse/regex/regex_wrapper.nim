import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  RegexNodeKind* = enum
    regexAnonymousCapturingGroup        ## anonymous_capturing_group
    regexBackreferenceEscape            ## backreference_escape
    regexCharacterClass                 ## character_class
    regexCharacterClassEscape           ## character_class_escape
    regexClassRange                     ## class_range
    regexCountQuantifier                ## count_quantifier
    regexDisjunction                    ## disjunction
    regexLookaheadAssertion             ## lookahead_assertion
    regexNamedCapturingGroup            ## named_capturing_group
    regexNonCapturingGroup              ## non_capturing_group
    regexOneOrMore                      ## one_or_more
    regexOptional                       ## optional
    regexPattern                        ## pattern
    regexStartAssertion                 ## start_assertion
    regexTerm                           ## term
    regexUnicodePropertyValueExpression ## unicode_property_value_expression
    regexZeroOrMore                     ## zero_or_more
    regexExclamationTok                 ## !
    regexLParTok                        ## (
    regexLParQuestionTok                ## (?
    regexLParQuestionColonTok           ## (?:
    regexLParQuestionLessThanTok        ## (?<
    regexRParTok                        ## )
    regexAsteriskTok                    ## *
    regexPlusTok                        ## +
    regexCommaTok                       ## ,
    regexMinusTok                       ## -
    regexLessThanExclamationTok         ## <!
    regexLessThanEqualTok               ## <=
    regexEqualTok                       ## =
    regexGreaterThanTok                 ## >
    regexQuestionTok                    ## ?
    regexLBrackTok                      ## [
    regexBackslashkTok                  ## \k
    regexRBrackTok                      ## ]
    regexAccentTok                      ## ^
    regexAnyCharacter                   ## any_character
    regexBoundaryAssertion              ## boundary_assertion
    regexClassCharacter                 ## class_character
    regexControlEscape                  ## control_escape
    regexControlLetterEscape            ## control_letter_escape
    regexDecimalDigits                  ## decimal_digits
    regexDecimalEscape                  ## decimal_escape
    regexEndAssertion                   ## end_assertion
    regexGroupName                      ## group_name
    regexIdentityEscape                 ## identity_escape
    regexLazy                           ## lazy
    regexNonBoundaryAssertion           ## non_boundary_assertion
    regexPatternCharacter               ## pattern_character
    regexUnicodePropertyName            ## unicode_property_name
    regexUnicodePropertyValue           ## unicode_property_value
    regexLCurlyTok                      ## {
    regexPipeTok                        ## |
    regexRCurlyTok                      ## }
    regexUnicodeProperty                ## unicode_property
    regexHidCharacterEscape             ## _character_escape
    regexHidClassAtom                   ## _class_atom
    regexSyntaxError                    ## Tree-sitter parser syntax error

proc strRepr*(kind: RegexNodeKind): string =
  case kind:
    of regexAnonymousCapturingGroup:        "anonymous_capturing_group"
    of regexBackreferenceEscape:            "backreference_escape"
    of regexCharacterClass:                 "character_class"
    of regexCharacterClassEscape:           "character_class_escape"
    of regexClassRange:                     "class_range"
    of regexCountQuantifier:                "count_quantifier"
    of regexDisjunction:                    "disjunction"
    of regexLookaheadAssertion:             "lookahead_assertion"
    of regexNamedCapturingGroup:            "named_capturing_group"
    of regexNonCapturingGroup:              "non_capturing_group"
    of regexOneOrMore:                      "one_or_more"
    of regexOptional:                       "optional"
    of regexPattern:                        "pattern"
    of regexStartAssertion:                 "start_assertion"
    of regexTerm:                           "term"
    of regexUnicodePropertyValueExpression: "unicode_property_value_expression"
    of regexZeroOrMore:                     "zero_or_more"
    of regexExclamationTok:                 "!"
    of regexLParTok:                        "("
    of regexLParQuestionTok:                "(?"
    of regexLParQuestionColonTok:           "(?:"
    of regexLParQuestionLessThanTok:        "(?<"
    of regexRParTok:                        ")"
    of regexAsteriskTok:                    "*"
    of regexPlusTok:                        "+"
    of regexCommaTok:                       ","
    of regexMinusTok:                       "-"
    of regexLessThanExclamationTok:         "<!"
    of regexLessThanEqualTok:               "<="
    of regexEqualTok:                       "="
    of regexGreaterThanTok:                 ">"
    of regexQuestionTok:                    "?"
    of regexLBrackTok:                      "["
    of regexBackslashkTok:                  "\\k"
    of regexRBrackTok:                      "]"
    of regexAccentTok:                      "^"
    of regexAnyCharacter:                   "any_character"
    of regexBoundaryAssertion:              "boundary_assertion"
    of regexClassCharacter:                 "class_character"
    of regexControlEscape:                  "control_escape"
    of regexControlLetterEscape:            "control_letter_escape"
    of regexDecimalDigits:                  "decimal_digits"
    of regexDecimalEscape:                  "decimal_escape"
    of regexEndAssertion:                   "end_assertion"
    of regexGroupName:                      "group_name"
    of regexIdentityEscape:                 "identity_escape"
    of regexLazy:                           "lazy"
    of regexNonBoundaryAssertion:           "non_boundary_assertion"
    of regexPatternCharacter:               "pattern_character"
    of regexUnicodePropertyName:            "unicode_property_name"
    of regexUnicodePropertyValue:           "unicode_property_value"
    of regexLCurlyTok:                      "{"
    of regexPipeTok:                        "|"
    of regexRCurlyTok:                      "}"
    of regexUnicodeProperty:                "unicode_property"
    of regexHidCharacterEscape:             "_character_escape"
    of regexHidClassAtom:                   "_class_atom"
    of regexSyntaxError:                    "ERROR"

type
  TsRegexNode* = distinct TSNode

type
  RegexParser* = distinct PtsParser

const regexAllowedSubnodes*: array[RegexNodeKind, set[RegexNodeKind]] = block:
                                                                          var tmp: array[RegexNodeKind, set[RegexNodeKind]]
                                                                          tmp[regexAnonymousCapturingGroup] = {regexPattern}
                                                                          tmp[regexBackreferenceEscape] = {regexGroupName}
                                                                          tmp[regexCharacterClass] = {regexCharacterClassEscape, regexClassCharacter, regexClassRange, regexControlEscape, regexControlLetterEscape, regexIdentityEscape}
                                                                          tmp[regexCharacterClassEscape] = {regexUnicodePropertyValueExpression}
                                                                          tmp[regexClassRange] = {regexCharacterClassEscape, regexClassCharacter, regexControlEscape, regexControlLetterEscape, regexIdentityEscape}
                                                                          tmp[regexCountQuantifier] = {regexDecimalDigits, regexLazy}
                                                                          tmp[regexDisjunction] = {regexTerm}
                                                                          tmp[regexLookaheadAssertion] = {regexPattern}
                                                                          tmp[regexNamedCapturingGroup] = {regexGroupName, regexPattern}
                                                                          tmp[regexNonCapturingGroup] = {regexPattern}
                                                                          tmp[regexOneOrMore] = {regexLazy}
                                                                          tmp[regexOptional] = {regexLazy}
                                                                          tmp[regexPattern] = {regexDisjunction, regexTerm}
                                                                          tmp[regexTerm] = {
                                                                                             regexAnonymousCapturingGroup,
                                                                                             regexAnyCharacter,
                                                                                             regexBackreferenceEscape,
                                                                                             regexBoundaryAssertion,
                                                                                             regexCharacterClass,
                                                                                             regexCharacterClassEscape,
                                                                                             regexControlEscape,
                                                                                             regexControlLetterEscape,
                                                                                             regexCountQuantifier,
                                                                                             regexDecimalEscape,
                                                                                             regexEndAssertion,
                                                                                             regexIdentityEscape,
                                                                                             regexLookaheadAssertion,
                                                                                             regexNamedCapturingGroup,
                                                                                             regexNonBoundaryAssertion,
                                                                                             regexNonCapturingGroup,
                                                                                             regexOneOrMore,
                                                                                             regexOptional,
                                                                                             regexPatternCharacter,
                                                                                             regexStartAssertion,
                                                                                             regexZeroOrMore
                                                                                           }
                                                                          tmp[regexUnicodePropertyValueExpression] = {regexUnicodePropertyName, regexUnicodePropertyValue}
                                                                          tmp[regexZeroOrMore] = {regexLazy}
                                                                          tmp
const regexTokenKinds*: set[RegexNodeKind] = {
                                               regexExclamationTok,
                                               regexLParTok,
                                               regexLParQuestionTok,
                                               regexLParQuestionColonTok,
                                               regexLParQuestionLessThanTok,
                                               regexRParTok,
                                               regexAsteriskTok,
                                               regexPlusTok,
                                               regexCommaTok,
                                               regexMinusTok,
                                               regexLessThanExclamationTok,
                                               regexLessThanEqualTok,
                                               regexEqualTok,
                                               regexGreaterThanTok,
                                               regexQuestionTok,
                                               regexLBrackTok,
                                               regexBackslashkTok,
                                               regexRBrackTok,
                                               regexAccentTok,
                                               regexLCurlyTok,
                                               regexPipeTok,
                                               regexRCurlyTok
                                             }
const regexHiddenKinds*: set[RegexNodeKind] = {regexUnicodeProperty, regexHidCharacterEscape, regexHidClassAtom}
proc tsNodeType*(node: TsRegexNode): string


proc kind*(node: TsRegexNode): RegexNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "anonymous_capturing_group":         regexAnonymousCapturingGroup
      of "backreference_escape":              regexBackreferenceEscape
      of "character_class":                   regexCharacterClass
      of "character_class_escape":            regexCharacterClassEscape
      of "class_range":                       regexClassRange
      of "count_quantifier":                  regexCountQuantifier
      of "disjunction":                       regexDisjunction
      of "lookahead_assertion":               regexLookaheadAssertion
      of "named_capturing_group":             regexNamedCapturingGroup
      of "non_capturing_group":               regexNonCapturingGroup
      of "one_or_more":                       regexOneOrMore
      of "optional":                          regexOptional
      of "pattern":                           regexPattern
      of "start_assertion":                   regexStartAssertion
      of "term":                              regexTerm
      of "unicode_property_value_expression": regexUnicodePropertyValueExpression
      of "zero_or_more":                      regexZeroOrMore
      of "!":                                 regexExclamationTok
      of "(":                                 regexLParTok
      of "(?":                                regexLParQuestionTok
      of "(?:":                               regexLParQuestionColonTok
      of "(?<":                               regexLParQuestionLessThanTok
      of ")":                                 regexRParTok
      of "*":                                 regexAsteriskTok
      of "+":                                 regexPlusTok
      of ",":                                 regexCommaTok
      of "-":                                 regexMinusTok
      of "<!":                                regexLessThanExclamationTok
      of "<=":                                regexLessThanEqualTok
      of "=":                                 regexEqualTok
      of ">":                                 regexGreaterThanTok
      of "?":                                 regexQuestionTok
      of "[":                                 regexLBrackTok
      of "\\k":                               regexBackslashkTok
      of "]":                                 regexRBrackTok
      of "^":                                 regexAccentTok
      of "any_character":                     regexAnyCharacter
      of "boundary_assertion":                regexBoundaryAssertion
      of "class_character":                   regexClassCharacter
      of "control_escape":                    regexControlEscape
      of "control_letter_escape":             regexControlLetterEscape
      of "decimal_digits":                    regexDecimalDigits
      of "decimal_escape":                    regexDecimalEscape
      of "end_assertion":                     regexEndAssertion
      of "group_name":                        regexGroupName
      of "identity_escape":                   regexIdentityEscape
      of "lazy":                              regexLazy
      of "non_boundary_assertion":            regexNonBoundaryAssertion
      of "pattern_character":                 regexPatternCharacter
      of "unicode_property_name":             regexUnicodePropertyName
      of "unicode_property_value":            regexUnicodePropertyValue
      of "{":                                 regexLCurlyTok
      of "|":                                 regexPipeTok
      of "}":                                 regexRCurlyTok
      of "ERROR":                             regexSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsRegexNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsRegexNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsRegexNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_regex(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsRegexNode): string =
  $ts_node_type(TSNode(node))

proc newTsRegexParser*(): RegexParser =
  result = RegexParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_regex())

proc parseString*(parser: RegexParser, str: string): TsRegexNode =
  TsRegexNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsRegexString*(str: string): TsRegexNode =
  let parser = newTsRegexParser()
  return parseString(parser, str)

func `$`*(node: TsRegexNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsRegexNode,
    idx:  int,
    kind: RegexNodeKind | set[RegexNodeKind]
  ): TsRegexNode =
  assert 0 <= idx and idx < node.len
  result = TsRegexNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  RegexNode* = HtsNode[TsRegexNode, RegexNodeKind]


proc treeReprTsRegex*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsRegexNode, RegexNodeKind](parseTsRegexString(str), str, 5, unnamed = unnamed)

proc toHtsNode*(
    node: TsRegexNode,
    str:  ptr string
  ): HtsNode[TsRegexNode, RegexNodeKind] =
  toHtsNode[TsRegexNode, RegexNodeKind](node, str)

proc toHtsTree*(node: TsRegexNode, str: ptr string): RegexNode =
  toHtsNode[TsRegexNode, RegexNodeKind](node, str)

proc parseRegexString*(str: ptr string, unnamed: bool = false): RegexNode =
  let parser = newTsRegexParser()
  return toHtsTree[TsRegexNode, RegexNodeKind](parseString(parser, str[]), str)

proc parseRegexString*(str: string, unnamed: bool = false): RegexNode =
  let parser = newTsRegexParser()
  return toHtsTree[TsRegexNode, RegexNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let regexGrammar*: array[RegexNodeKind, HtsRule[RegexNodeKind]] = block:
                                                                    var rules: array[RegexNodeKind, HtsRule[RegexNodeKind]]
                                                                    type
                                                                      K = RegexNodeKind


                                                                    rules[regexBoundaryAssertion] = tsString[K]("\\b")
                                                                    rules[regexDecimalDigits] = tsRegex[K]("\\d+")
                                                                    rules[regexLookaheadAssertion] = tsSeq[K](tsString[K]("(?"), tsChoice[K](tsString[K]("="), tsString[K]("!"), tsString[K]("<="), tsString[K]("<!")), tsSymbol[K](regexPattern), tsString[K](")"))
                                                                    rules[regexClassRange] = tsSeq[K](tsSymbol[K](regexHidClassAtom), tsString[K]("-"), tsSymbol[K](regexHidClassAtom))
                                                                    rules[regexIdentityEscape] = tsSeq[K](tsString[K]("\\"), tsRegex[K]("[^kdDsSpPwWbfnrtv0-9]"))
                                                                    rules[regexNamedCapturingGroup] = tsSeq[K](tsString[K]("(?<"), tsSymbol[K](regexGroupName), tsString[K](">"), tsSymbol[K](regexPattern), tsString[K](")"))
                                                                    rules[regexCharacterClassEscape] = tsChoice[K](tsRegex[K]("\\\\[dDsSwW]"), tsSeq[K](tsRegex[K]("\\\\[pP]"), tsString[K]("{"), tsSymbol[K](regexUnicodePropertyValueExpression), tsString[K]("}")))
                                                                    rules[regexZeroOrMore] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsString[K]("?"), tsBlank[K]()))
                                                                    rules[regexDecimalEscape] = tsRegex[K]("\\\\[1-9][0-9]+")
                                                                    rules[regexUnicodeProperty] = tsRegex[K]("[a-zA-Z_0-9]+")
                                                                    rules[regexControlEscape] = tsRegex[K]("\\\\[bfnrtv0]")
                                                                    rules[regexGroupName] = tsRegex[K]("[A-Za-z0-9]+")
                                                                    rules[regexDisjunction] = tsSeq[K](tsChoice[K](tsSymbol[K](regexTerm), tsBlank[K]()), tsRepeat1[K](tsSeq[K](tsString[K]("|"), tsChoice[K](tsSymbol[K](regexTerm), tsBlank[K]()))))
                                                                    rules[regexAnyCharacter] = tsString[K](".")
                                                                    rules[regexCharacterClass] = tsSeq[K](tsString[K]("["), tsChoice[K](tsString[K]("^"), tsBlank[K]()), tsRepeat[K](tsChoice[K](tsSymbol[K](regexClassRange), tsSymbol[K](regexHidClassAtom))), tsString[K]("]"))
                                                                    rules[regexHidCharacterEscape] = tsChoice[K](tsSymbol[K](regexControlEscape), tsSymbol[K](regexControlLetterEscape), tsSymbol[K](regexIdentityEscape))
                                                                    rules[regexStartAssertion] = tsString[K]("^")
                                                                    rules[regexEndAssertion] = tsString[K]("$")
                                                                    rules[regexNonBoundaryAssertion] = tsString[K]("\\B")
                                                                    rules[regexPatternCharacter] = tsRegex[K]("[^\\^\\$\\\\\\.\\*\\+\\?\\(\\)\\[\\]\\{\\}\\|\\n]")
                                                                    rules[regexNonCapturingGroup] = tsSeq[K](tsString[K]("(?:"), tsSymbol[K](regexPattern), tsString[K](")"))
                                                                    rules[regexAnonymousCapturingGroup] = tsSeq[K](tsString[K]("("), tsSymbol[K](regexPattern), tsString[K](")"))
                                                                    rules[regexClassCharacter] = tsRegex[K]("[^\\\\\\]\\-]")
                                                                    rules[regexOneOrMore] = tsSeq[K](tsString[K]("+"), tsChoice[K](tsString[K]("?"), tsBlank[K]()))
                                                                    rules[regexTerm] = tsRepeat1[K](tsSeq[K](tsChoice[K](tsSymbol[K](regexStartAssertion), tsSymbol[K](regexEndAssertion), tsSymbol[K](regexBoundaryAssertion), tsSymbol[K](regexNonBoundaryAssertion), tsSymbol[K](regexLookaheadAssertion), tsSymbol[K](regexPatternCharacter), tsSymbol[K](regexCharacterClass), tsSymbol[K](regexAnyCharacter), tsSymbol[K](regexDecimalEscape), tsSymbol[K](regexCharacterClassEscape), tsSymbol[K](regexHidCharacterEscape), tsSymbol[K](regexBackreferenceEscape), tsSymbol[K](regexAnonymousCapturingGroup), tsSymbol[K](regexNamedCapturingGroup), tsSymbol[K](regexNonCapturingGroup)), tsChoice[K](tsChoice[K](tsSymbol[K](regexZeroOrMore), tsSymbol[K](regexOneOrMore), tsSymbol[K](regexOptional), tsSymbol[K](regexCountQuantifier)), tsBlank[K]())))
                                                                    rules[regexHidClassAtom] = tsChoice[K](tsString[K]("-"), tsSymbol[K](regexClassCharacter), tsString[K]("\\-"), tsSymbol[K](regexCharacterClassEscape), tsSymbol[K](regexHidCharacterEscape))
                                                                    rules[regexPattern] = tsChoice[K](tsSymbol[K](regexDisjunction), tsSymbol[K](regexTerm))
                                                                    rules[regexBackreferenceEscape] = tsSeq[K](tsString[K]("\\k"), tsSymbol[K](regexGroupName))
                                                                    rules[regexOptional] = tsSeq[K](tsString[K]("?"), tsChoice[K](tsString[K]("?"), tsBlank[K]()))
                                                                    rules[regexControlLetterEscape] = tsRegex[K]("\\\\c[a-zA-Z]")
                                                                    rules[regexCountQuantifier] = tsSeq[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](regexDecimalDigits), tsChoice[K](tsSeq[K](tsString[K](","), tsSymbol[K](regexDecimalDigits)), tsBlank[K]())), tsString[K]("}")), tsChoice[K](tsString[K]("?"), tsBlank[K]()))
                                                                    rules[regexUnicodePropertyValueExpression] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](regexUnicodeProperty), tsString[K]("=")), tsBlank[K]()), tsSymbol[K](regexUnicodeProperty))
                                                                    rules

