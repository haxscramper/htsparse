import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  NixNodeKind* = enum
    nixExpression          ## _expression
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
    nixSyntaxError         ## Tree-sitter parser syntax error


proc strRepr*(kind: NixNodeKind): string =
  case kind:
    of nixExpression:          "_expression"
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

proc tsNodeType*(node: TsNixNode): string



proc kind*(node: TsNixNode): NixNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":          nixExpression
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


func `[]`*(
    node: TsNixNode,
    idx:  int,
    kind: NixNodeKind | set[NixNodeKind]
  ): TsNixNode =
  assert 0 <= idx and idx < node.len
  result = TsNixNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  NixNode* = HtsNode[TsNixNode, NixNodeKind]


proc treeReprTsNix*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsNixNode, NixNodeKind](parseTsNixString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsNixNode,
    str:  ptr string
  ): HtsNode[TsNixNode, NixNodeKind] =
  toHtsNode[TsNixNode, NixNodeKind](node, str)

proc toHtsTree*(node: TsNixNode, str: ptr string): NixNode =
  toHtsNode[TsNixNode, NixNodeKind](node, str)

proc parseNixString*(str: ptr string, unnamed: bool = false): NixNode =
  let parser = newTsNixParser()
  return toHtsTree[TsNixNode, NixNodeKind](parseString(parser, str[]), str)

proc parseNixString*(str: string, unnamed: bool = false): NixNode =
  let parser = newTsNixParser()
  return toHtsTree[TsNixNode, NixNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


