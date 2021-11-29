import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  NixNodeKind* = enum
    nixHidExpression       ## _expression
    nixApp                 ## app
    nixAssert              ## assert
    nixAttrpath            ## attrpath
    nixAttrsInherited      ## attrs_inherited
    nixAttrsInheritedFrom  ## attrs_inherited_from
    nixAttrset             ## attrset
    nixBinary              ## binary
    nixBind                ## bind
    nixFormal              ## formal
    nixFormals             ## formals
    nixFunction            ## function
    nixIf                  ## if
    nixIndentedString      ## indented_string
    nixInherit             ## inherit
    nixInheritFrom         ## inherit_from
    nixInterpolation       ## interpolation
    nixLet                 ## let
    nixLetAttrset          ## let_attrset
    nixList                ## list
    nixParenthesized       ## parenthesized
    nixRecAttrset          ## rec_attrset
    nixSelect              ## select
    nixSourceExpression    ## source_expression
    nixString              ## string
    nixUnary               ## unary
    nixWith                ## with
    nixExclamationTok      ## !
    nixExclamationEqualTok ## !=
    nixQuoteTok            ## "
    nixDollarLCurlyTok     ## ${
    nixDoubleAmpersandTok  ## &&
    nixDoubleApostropheTok ## ''
    nixLParTok             ## (
    nixRParTok             ## )
    nixAsteriskTok         ## *
    nixPlusTok             ## +
    nixDoublePlusTok       ## ++
    nixCommaTok            ## ,
    nixMinusTok            ## -
    nixMinusGreaterThanTok ## ->
    nixDotTok              ## .
    nixSlashTok            ## /
    nixDoubleSlashTok      ## //
    nixColonTok            ## :
    nixSemicolonTok        ## ;
    nixLessThanTok         ## <
    nixLessThanEqualTok    ## <=
    nixEqualTok            ## =
    nixDoubleEqualTok      ## ==
    nixGreaterThanTok      ## >
    nixGreaterThanEqualTok ## >=
    nixQuestionTok         ## ?
    nixAtTok               ## @
    nixLBrackTok           ## [
    nixRBrackTok           ## ]
    nixAssertTok           ## assert
    nixAttrIdentifier      ## attr_identifier
    nixComment             ## comment
    nixEllipses            ## ellipses
    nixElseTok             ## else
    nixEscapeSequence      ## escape_sequence
    nixFloat               ## float
    nixHpath               ## hpath
    nixIdentifier          ## identifier
    nixIfTok               ## if
    nixInTok               ## in
    nixInheritTok          ## inherit
    nixInteger             ## integer
    nixLetTok              ## let
    nixOrTok               ## or
    nixPath                ## path
    nixRecTok              ## rec
    nixSpath               ## spath
    nixThenTok             ## then
    nixUri                 ## uri
    nixWithTok             ## with
    nixLCurlyTok           ## {
    nixDoublePipeTok       ## ||
    nixRCurlyTok           ## }
    nixHidExprFunction     ## _expr_function
    nixHidExprIf           ## _expr_if
    nixHidExprSimple       ## _expr_simple
    nixHidBinds            ## _binds
    nixHidExprApp          ## _expr_app
    nixHidStrContent       ## _str_content
    nixHidExprOp           ## _expr_op
    nixIndEscapeSequence   ## ind_escape_sequence
    nixHidExprSelect       ## _expr_select
    nixHidStringParts      ## _string_parts
    nixHidIndStringParts   ## _ind_string_parts
    nixHidIndStrContent    ## _ind_str_content
    nixSyntaxError         ## Tree-sitter parser syntax error

proc strRepr*(kind: NixNodeKind): string =
  case kind:
    of nixHidExpression:       "_expression"
    of nixApp:                 "app"
    of nixAssert:              "assert"
    of nixAttrpath:            "attrpath"
    of nixAttrsInherited:      "attrs_inherited"
    of nixAttrsInheritedFrom:  "attrs_inherited_from"
    of nixAttrset:             "attrset"
    of nixBinary:              "binary"
    of nixBind:                "bind"
    of nixFormal:              "formal"
    of nixFormals:             "formals"
    of nixFunction:            "function"
    of nixIf:                  "if"
    of nixIndentedString:      "indented_string"
    of nixInherit:             "inherit"
    of nixInheritFrom:         "inherit_from"
    of nixInterpolation:       "interpolation"
    of nixLet:                 "let"
    of nixLetAttrset:          "let_attrset"
    of nixList:                "list"
    of nixParenthesized:       "parenthesized"
    of nixRecAttrset:          "rec_attrset"
    of nixSelect:              "select"
    of nixSourceExpression:    "source_expression"
    of nixString:              "string"
    of nixUnary:               "unary"
    of nixWith:                "with"
    of nixExclamationTok:      "!"
    of nixExclamationEqualTok: "!="
    of nixQuoteTok:            "\""
    of nixDollarLCurlyTok:     "${"
    of nixDoubleAmpersandTok:  "&&"
    of nixDoubleApostropheTok: "\'\'"
    of nixLParTok:             "("
    of nixRParTok:             ")"
    of nixAsteriskTok:         "*"
    of nixPlusTok:             "+"
    of nixDoublePlusTok:       "++"
    of nixCommaTok:            ","
    of nixMinusTok:            "-"
    of nixMinusGreaterThanTok: "->"
    of nixDotTok:              "."
    of nixSlashTok:            "/"
    of nixDoubleSlashTok:      "//"
    of nixColonTok:            ":"
    of nixSemicolonTok:        ";"
    of nixLessThanTok:         "<"
    of nixLessThanEqualTok:    "<="
    of nixEqualTok:            "="
    of nixDoubleEqualTok:      "=="
    of nixGreaterThanTok:      ">"
    of nixGreaterThanEqualTok: ">="
    of nixQuestionTok:         "?"
    of nixAtTok:               "@"
    of nixLBrackTok:           "["
    of nixRBrackTok:           "]"
    of nixAssertTok:           "assert"
    of nixAttrIdentifier:      "attr_identifier"
    of nixComment:             "comment"
    of nixEllipses:            "ellipses"
    of nixElseTok:             "else"
    of nixEscapeSequence:      "escape_sequence"
    of nixFloat:               "float"
    of nixHpath:               "hpath"
    of nixIdentifier:          "identifier"
    of nixIfTok:               "if"
    of nixInTok:               "in"
    of nixInheritTok:          "inherit"
    of nixInteger:             "integer"
    of nixLetTok:              "let"
    of nixOrTok:               "or"
    of nixPath:                "path"
    of nixRecTok:              "rec"
    of nixSpath:               "spath"
    of nixThenTok:             "then"
    of nixUri:                 "uri"
    of nixWithTok:             "with"
    of nixLCurlyTok:           "{"
    of nixDoublePipeTok:       "||"
    of nixRCurlyTok:           "}"
    of nixHidExprFunction:     "_expr_function"
    of nixHidExprIf:           "_expr_if"
    of nixHidExprSimple:       "_expr_simple"
    of nixHidBinds:            "_binds"
    of nixHidExprApp:          "_expr_app"
    of nixHidStrContent:       "_str_content"
    of nixHidExprOp:           "_expr_op"
    of nixIndEscapeSequence:   "ind_escape_sequence"
    of nixHidExprSelect:       "_expr_select"
    of nixHidStringParts:      "_string_parts"
    of nixHidIndStringParts:   "_ind_string_parts"
    of nixHidIndStrContent:    "_ind_str_content"
    of nixSyntaxError:         "ERROR"

type
  NixExternalTok* = enum
    nixExtern_str_content        ## _str_content
    nixExtern_ind_str_content    ## _ind_str_content
    nixExternEscape_sequence     ## escape_sequence
    nixExternInd_escape_sequence ## ind_escape_sequence

type
  TsNixNode* = distinct TSNode

type
  NixParser* = distinct PtsParser

const nixAllowedSubnodes*: array[NixNodeKind, set[NixNodeKind]] = block:
                                                                    var tmp: array[NixNodeKind, set[NixNodeKind]]
                                                                    tmp[nixIndentedString] = {nixEscapeSequence, nixInterpolation}
                                                                    tmp[nixString] = {nixEscapeSequence, nixInterpolation}
                                                                    tmp
const nixTokenKinds*: set[NixNodeKind] = {
                                           nixExclamationTok,
                                           nixExclamationEqualTok,
                                           nixQuoteTok,
                                           nixDollarLCurlyTok,
                                           nixDoubleAmpersandTok,
                                           nixDoubleApostropheTok,
                                           nixLParTok,
                                           nixRParTok,
                                           nixAsteriskTok,
                                           nixPlusTok,
                                           nixDoublePlusTok,
                                           nixCommaTok,
                                           nixMinusTok,
                                           nixMinusGreaterThanTok,
                                           nixDotTok,
                                           nixSlashTok,
                                           nixDoubleSlashTok,
                                           nixColonTok,
                                           nixSemicolonTok,
                                           nixLessThanTok,
                                           nixLessThanEqualTok,
                                           nixEqualTok,
                                           nixDoubleEqualTok,
                                           nixGreaterThanTok,
                                           nixGreaterThanEqualTok,
                                           nixQuestionTok,
                                           nixAtTok,
                                           nixLBrackTok,
                                           nixRBrackTok,
                                           nixAssertTok,
                                           nixElseTok,
                                           nixIfTok,
                                           nixInTok,
                                           nixInheritTok,
                                           nixLetTok,
                                           nixOrTok,
                                           nixRecTok,
                                           nixThenTok,
                                           nixWithTok,
                                           nixLCurlyTok,
                                           nixDoublePipeTok,
                                           nixRCurlyTok
                                         }
const nixHiddenKinds*: set[NixNodeKind] = {
                                            nixHidExprFunction,
                                            nixHidExprIf,
                                            nixHidExpression,
                                            nixHidExprSimple,
                                            nixHidBinds,
                                            nixHidExprApp,
                                            nixHidStrContent,
                                            nixHidExprOp,
                                            nixIndEscapeSequence,
                                            nixHidExprSelect,
                                            nixHidStringParts,
                                            nixHidIndStringParts,
                                            nixHidIndStrContent
                                          }
proc tsNodeType*(node: TsNixNode): string


proc kind*(node: TsNixNode): NixNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":          nixHidExpression
      of "app":                  nixApp
      of "assert":               nixAssert
      of "attrpath":             nixAttrpath
      of "attrs_inherited":      nixAttrsInherited
      of "attrs_inherited_from": nixAttrsInheritedFrom
      of "attrset":              nixAttrset
      of "binary":               nixBinary
      of "bind":                 nixBind
      of "formal":               nixFormal
      of "formals":              nixFormals
      of "function":             nixFunction
      of "if":                   nixIf
      of "indented_string":      nixIndentedString
      of "inherit":              nixInherit
      of "inherit_from":         nixInheritFrom
      of "interpolation":        nixInterpolation
      of "let":                  nixLet
      of "let_attrset":          nixLetAttrset
      of "list":                 nixList
      of "parenthesized":        nixParenthesized
      of "rec_attrset":          nixRecAttrset
      of "select":               nixSelect
      of "source_expression":    nixSourceExpression
      of "string":               nixString
      of "unary":                nixUnary
      of "with":                 nixWith
      of "!":                    nixExclamationTok
      of "!=":                   nixExclamationEqualTok
      of "\"":                   nixQuoteTok
      of "${":                   nixDollarLCurlyTok
      of "&&":                   nixDoubleAmpersandTok
      of "\'\'":                 nixDoubleApostropheTok
      of "(":                    nixLParTok
      of ")":                    nixRParTok
      of "*":                    nixAsteriskTok
      of "+":                    nixPlusTok
      of "++":                   nixDoublePlusTok
      of ",":                    nixCommaTok
      of "-":                    nixMinusTok
      of "->":                   nixMinusGreaterThanTok
      of ".":                    nixDotTok
      of "/":                    nixSlashTok
      of "//":                   nixDoubleSlashTok
      of ":":                    nixColonTok
      of ";":                    nixSemicolonTok
      of "<":                    nixLessThanTok
      of "<=":                   nixLessThanEqualTok
      of "=":                    nixEqualTok
      of "==":                   nixDoubleEqualTok
      of ">":                    nixGreaterThanTok
      of ">=":                   nixGreaterThanEqualTok
      of "?":                    nixQuestionTok
      of "@":                    nixAtTok
      of "[":                    nixLBrackTok
      of "]":                    nixRBrackTok
      of "attr_identifier":      nixAttrIdentifier
      of "comment":              nixComment
      of "ellipses":             nixEllipses
      of "else":                 nixElseTok
      of "escape_sequence":      nixEscapeSequence
      of "float":                nixFloat
      of "hpath":                nixHpath
      of "identifier":           nixIdentifier
      of "in":                   nixInTok
      of "integer":              nixInteger
      of "or":                   nixOrTok
      of "path":                 nixPath
      of "rec":                  nixRecTok
      of "spath":                nixSpath
      of "then":                 nixThenTok
      of "uri":                  nixUri
      of "{":                    nixLCurlyTok
      of "||":                   nixDoublePipeTok
      of "}":                    nixRCurlyTok
      of "ERROR":                nixSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsNixNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsNixNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsNixNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_nix(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsNixNode): string =
  $ts_node_type(TSNode(node))

proc newTsNixParser*(): NixParser =
  result = NixParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_nix())

proc parseString*(parser: NixParser, str: string): TsNixNode =
  TsNixNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsNixString*(str: string): TsNixNode =
  let parser = newTsNixParser()
  return parseString(parser, str)

func `$`*(node: TsNixNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsNixNode, str: string): string =
  var res = addr result
  proc aux(node: TsNixNode, level: int) =
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
let nixGrammar*: array[NixNodeKind, HtsRule[NixNodeKind]] = block:
                                                              var rules: array[NixNodeKind, HtsRule[NixNodeKind]]
                                                              type
                                                                K = NixNodeKind


                                                              rules[nixPath] = tsRegex[K]("[a-zA-Z0-9\\._\\-\\+]*(\\/[a-zA-Z0-9\\._\\-\\+]+)+\\/?")
                                                              rules[nixInterpolation] = tsSeq[K](tsString[K]("${"), tsSymbol[K](nixHidExpression), tsString[K]("}"))
                                                              rules[nixHidExprFunction] = tsChoice[K](tsSymbol[K](nixFunction), tsSymbol[K](nixAssert), tsSymbol[K](nixWith), tsSymbol[K](nixLet), tsSymbol[K](nixHidExprIf))
                                                              rules[nixHidExprIf] = tsChoice[K](tsSymbol[K](nixIf), tsSymbol[K](nixHidExprOp))
                                                              rules[nixParenthesized] = tsSeq[K](tsString[K]("("), tsSymbol[K](nixHidExpression), tsString[K](")"))
                                                              rules[nixBinary] = tsChoice[K](tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("=="), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("!="), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("<"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("<="), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K](">"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K](">="), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("&&"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("||"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("?"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("+"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("-"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("*"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("/"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("->"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("//"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsSymbol[K](nixHidExprOp), tsString[K]("++"), tsSymbol[K](nixHidExprOp)))
                                                              rules[nixInheritFrom] = tsSeq[K](tsString[K]("inherit"), tsString[K]("("), tsSymbol[K](nixHidExpression), tsString[K](")"), tsSymbol[K](nixAttrsInheritedFrom), tsString[K](";"))
                                                              rules[nixSpath] = tsRegex[K]("<[a-zA-Z0-9\\._\\-\\+]+(\\/[a-zA-Z0-9\\._\\-\\+]+)*>")
                                                              rules[nixAttrsInheritedFrom] = tsRepeat1[K](tsChoice[K](tsSymbol[K](nixIdentifier), tsSymbol[K](nixString), tsSymbol[K](nixInterpolation)))
                                                              rules[nixApp] = tsSeq[K](tsSymbol[K](nixHidExprApp), tsSymbol[K](nixHidExprSelect))
                                                              rules[nixHidExpression] = tsSymbol[K](nixHidExprFunction)
                                                              rules[nixIf] = tsSeq[K](tsString[K]("if"), tsSymbol[K](nixHidExpression), tsString[K]("then"), tsSymbol[K](nixHidExpression), tsString[K]("else"), tsSymbol[K](nixHidExpression))
                                                              rules[nixInherit] = tsSeq[K](tsString[K]("inherit"), tsSymbol[K](nixAttrsInherited), tsString[K](";"))
                                                              rules[nixHidExprSimple] = tsChoice[K](tsSymbol[K](nixIdentifier), tsSymbol[K](nixInteger), tsSymbol[K](nixFloat), tsSymbol[K](nixString), tsSymbol[K](nixIndentedString), tsSymbol[K](nixPath), tsSymbol[K](nixHpath), tsSymbol[K](nixSpath), tsSymbol[K](nixUri), tsSymbol[K](nixParenthesized), tsSymbol[K](nixAttrset), tsSymbol[K](nixLetAttrset), tsSymbol[K](nixRecAttrset), tsSymbol[K](nixList))
                                                              rules[nixBind] = tsSeq[K](tsSymbol[K](nixAttrpath), tsString[K]("="), tsSymbol[K](nixHidExpression), tsString[K](";"))
                                                              rules[nixString] = tsSeq[K](tsString[K]("\""), tsChoice[K](tsSymbol[K](nixHidStringParts), tsBlank[K]()), tsString[K]("\""))
                                                              rules[nixSourceExpression] = tsSymbol[K](nixHidExpression)
                                                              rules[nixHidBinds] = tsRepeat1[K](tsChoice[K](tsSymbol[K](nixBind), tsSymbol[K](nixInherit), tsSymbol[K](nixInheritFrom)))
                                                              rules[nixSelect] = tsChoice[K](tsSeq[K](tsSymbol[K](nixHidExprSimple), tsString[K]("."), tsSymbol[K](nixAttrpath)), tsSeq[K](tsSymbol[K](nixHidExprSimple), tsString[K]("."), tsSymbol[K](nixAttrpath), tsString[K]("or"), tsSymbol[K](nixHidExprSelect)))
                                                              rules[nixLet] = tsSeq[K](tsString[K]("let"), tsChoice[K](tsSymbol[K](nixHidBinds), tsBlank[K]()), tsString[K]("in"), tsSymbol[K](nixHidExprFunction))
                                                              rules[nixHidExprApp] = tsChoice[K](tsSymbol[K](nixApp), tsSymbol[K](nixHidExprSelect))
                                                              rules[nixHpath] = tsRegex[K]("\\~(\\/[a-zA-Z0-9\\._\\-\\+]+)+\\/?")
                                                              rules[nixUri] = tsRegex[K]("[a-zA-Z][a-zA-Z0-9\\+\\-\\.]*:[a-zA-Z0-9%\\/\\?:@\\&=\\+\\$,\\-_\\.\\!\\~\\*\\\']+")
                                                              rules[nixHidExprOp] = tsChoice[K](tsSymbol[K](nixUnary), tsSymbol[K](nixBinary), tsSymbol[K](nixHidExprApp))
                                                              rules[nixAttrpath] = tsSeq[K](tsChoice[K](tsSymbol[K](nixIdentifier), tsSymbol[K](nixString), tsSymbol[K](nixInterpolation)), tsRepeat[K](tsSeq[K](tsString[K]("."), tsChoice[K](tsSymbol[K](nixIdentifier), tsSymbol[K](nixString), tsSymbol[K](nixInterpolation)))))
                                                              rules[nixRecAttrset] = tsSeq[K](tsString[K]("rec"), tsString[K]("{"), tsChoice[K](tsSymbol[K](nixHidBinds), tsBlank[K]()), tsString[K]("}"))
                                                              rules[nixComment] = tsChoice[K](tsSeq[K](tsString[K]("#"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^*]"), tsRegex[K]("\\*[^/]"))), tsString[K]("*/")))
                                                              rules[nixLetAttrset] = tsSeq[K](tsString[K]("let"), tsString[K]("{"), tsChoice[K](tsSymbol[K](nixHidBinds), tsBlank[K]()), tsString[K]("}"))
                                                              rules[nixUnary] = tsChoice[K](tsSeq[K](tsString[K]("!"), tsSymbol[K](nixHidExprOp)), tsSeq[K](tsString[K]("-"), tsSymbol[K](nixHidExprOp)))
                                                              rules[nixIdentifier] = tsRegex[K]("[a-zA-Z_][a-zA-Z0-9_\\\'\\-]*")
                                                              rules[nixAssert] = tsSeq[K](tsString[K]("assert"), tsSymbol[K](nixHidExpression), tsString[K](";"), tsSymbol[K](nixHidExprFunction))
                                                              rules[nixHidExprSelect] = tsChoice[K](tsSymbol[K](nixSelect), tsSymbol[K](nixHidExprSimple))
                                                              rules[nixHidStringParts] = tsRepeat1[K](tsChoice[K](tsSymbol[K](nixHidStrContent), tsSymbol[K](nixInterpolation), tsSymbol[K](nixEscapeSequence)))
                                                              rules[nixFormal] = tsSeq[K](tsSymbol[K](nixIdentifier), tsChoice[K](tsSeq[K](tsString[K]("?"), tsSymbol[K](nixHidExpression)), tsBlank[K]()))
                                                              rules[nixEllipses] = tsString[K]("...")
                                                              rules[nixAttrset] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](nixHidBinds), tsBlank[K]()), tsString[K]("}"))
                                                              rules[nixIndentedString] = tsSeq[K](tsString[K]("\'\'"), tsChoice[K](tsSymbol[K](nixHidIndStringParts), tsBlank[K]()), tsString[K]("\'\'"))
                                                              rules[nixFormals] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsString[K]("}")), tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](nixFormal), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](nixFormal)))), tsString[K]("}")), tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](nixFormal), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](nixFormal)))), tsString[K](","), tsSymbol[K](nixEllipses), tsString[K]("}")), tsSeq[K](tsString[K]("{"), tsSymbol[K](nixEllipses), tsString[K]("}")))
                                                              rules[nixInteger] = tsRegex[K]("[0-9]+")
                                                              rules[nixFloat] = tsRegex[K]("(([1-9][0-9]*\\.[0-9]*)|(0?\\.[0-9]+))([Ee][+-]?[0-9]+)?")
                                                              rules[nixWith] = tsSeq[K](tsString[K]("with"), tsSymbol[K](nixHidExpression), tsString[K](";"), tsSymbol[K](nixHidExprFunction))
                                                              rules[nixHidIndStringParts] = tsRepeat1[K](tsChoice[K](tsSymbol[K](nixHidIndStrContent), tsSymbol[K](nixInterpolation), tsSymbol[K](nixIndEscapeSequence)))
                                                              rules[nixList] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](nixHidExprSelect)), tsString[K]("]"))
                                                              rules[nixFunction] = tsChoice[K](tsSeq[K](tsSymbol[K](nixIdentifier), tsString[K](":"), tsSymbol[K](nixHidExprFunction)), tsSeq[K](tsSymbol[K](nixFormals), tsString[K](":"), tsSymbol[K](nixHidExprFunction)), tsSeq[K](tsSymbol[K](nixFormals), tsString[K]("@"), tsSymbol[K](nixIdentifier), tsString[K](":"), tsSymbol[K](nixHidExprFunction)), tsSeq[K](tsSymbol[K](nixIdentifier), tsString[K]("@"), tsSymbol[K](nixFormals), tsString[K](":"), tsSymbol[K](nixHidExprFunction)))
                                                              rules[nixAttrsInherited] = tsRepeat1[K](tsChoice[K](tsSymbol[K](nixIdentifier), tsSymbol[K](nixString), tsSymbol[K](nixInterpolation)))
                                                              rules

