
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  NixNodeKind* = enum
    nixApp,                 ## app
    nixAssert,              ## assert
    nixAttrpath,            ## attrpath
    nixAttrs,               ## attrs
    nixAttrset,             ## attrset
    nixBinary,              ## binary
    nixBind,                ## bind
    nixExpression,          ## expression
    nixFormal,              ## formal
    nixFormals,             ## formals
    nixFunction,            ## function
    nixIf,                  ## if
    nixIndentedString,      ## indented_string
    nixInherit,             ## inherit
    nixInterpolation,       ## interpolation
    nixLet,                 ## let
    nixLetAttrset,          ## let_attrset
    nixList,                ## list
    nixParenthesized,       ## parenthesized
    nixRecAttrset,          ## rec_attrset
    nixSelect,              ## select
    nixString,              ## string
    nixUnary,               ## unary
    nixWith,                ## with
    nixExclamationTok,      ## !
    nixExclamationEqualTok, ## !=
    nixQuoteTok,            ## "
    nixDollarLCurlyTok,     ## ${
    nixDoubleAmpersandTok,  ## &&
    nixDoubleApostropheTok, ## ''
    nixLParTok,             ## (
    nixRParTok,             ## )
    nixAsteriskTok,         ## *
    nixPlusTok,             ## +
    nixDoublePlusTok,       ## ++
    nixCommaTok,            ## ,
    nixMinusTok,            ## -
    nixMinusGreaterThanTok, ## ->
    nixDotTok,              ## .
    nixSlashTok,            ## /
    nixDoubleSlashTok,      ## //
    nixColonTok,            ## :
    nixSemicolonTok,        ## ;
    nixLessThanTok,         ## <
    nixLessThanEqualTok,    ## <=
    nixEqualTok,            ## =
    nixDoubleEqualTok,      ## ==
    nixGreaterThanTok,      ## >
    nixGreaterThanEqualTok, ## >=
    nixQuestionTok,         ## ?
    nixAtTok,               ## @
    nixLBrackTok,           ## [
    nixRBrackTok,           ## ]
    nixAssertTok,           ## assert
    nixComment,             ## comment
    nixEllipses,            ## ellipses
    nixElseTok,             ## else
    nixEscapeSequence,      ## escape_sequence
    nixFloat,               ## float
    nixHpath,               ## hpath
    nixIdentifier,          ## identifier
    nixIfTok,               ## if
    nixInTok,               ## in
    nixInheritTok,          ## inherit
    nixInteger,             ## integer
    nixLetTok,              ## let
    nixOrTok,               ## or
    nixPath,                ## path
    nixRecTok,              ## rec
    nixSpath,               ## spath
    nixThenTok,             ## then
    nixUri,                 ## uri
    nixWithTok,             ## with
    nixLCurlyTok,           ## {
    nixDoublePipeTok,       ## ||
    nixRCurlyTok,           ## }
    nixComment2,            ## comment
    nixSyntaxError           ## Tree-sitter parser syntax error
type
  NixExternalTok* = enum
    nixExtern_str_content,  ## _str_content
    nixExtern_ind_str_content, ## _ind_str_content
    nixExternEscape_sequence, ## escape_sequence
    nixExternInd_escape_sequence ## ind_escape_sequence
type
  NixNode* = distinct TSNode
type
  NixParser* = distinct PtsParser
proc tsNodeType*(node: NixNode): string
proc kind*(node: NixNode): NixNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "app":
      nixApp
    of "assert":
      nixAssert
    of "attrpath":
      nixAttrpath
    of "attrs":
      nixAttrs
    of "attrset":
      nixAttrset
    of "binary":
      nixBinary
    of "bind":
      nixBind
    of "expression":
      nixExpression
    of "formal":
      nixFormal
    of "formals":
      nixFormals
    of "function":
      nixFunction
    of "if":
      nixIf
    of "indented_string":
      nixIndentedString
    of "inherit":
      nixInherit
    of "interpolation":
      nixInterpolation
    of "let":
      nixLet
    of "let_attrset":
      nixLetAttrset
    of "list":
      nixList
    of "parenthesized":
      nixParenthesized
    of "rec_attrset":
      nixRecAttrset
    of "select":
      nixSelect
    of "string":
      nixString
    of "unary":
      nixUnary
    of "with":
      nixWith
    of "!":
      nixExclamationTok
    of "!=":
      nixExclamationEqualTok
    of "\"":
      nixQuoteTok
    of "${":
      nixDollarLCurlyTok
    of "&&":
      nixDoubleAmpersandTok
    of "\'\'":
      nixDoubleApostropheTok
    of "(":
      nixLParTok
    of ")":
      nixRParTok
    of "*":
      nixAsteriskTok
    of "+":
      nixPlusTok
    of "++":
      nixDoublePlusTok
    of ",":
      nixCommaTok
    of "-":
      nixMinusTok
    of "->":
      nixMinusGreaterThanTok
    of ".":
      nixDotTok
    of "/":
      nixSlashTok
    of "//":
      nixDoubleSlashTok
    of ":":
      nixColonTok
    of ";":
      nixSemicolonTok
    of "<":
      nixLessThanTok
    of "<=":
      nixLessThanEqualTok
    of "=":
      nixEqualTok
    of "==":
      nixDoubleEqualTok
    of ">":
      nixGreaterThanTok
    of ">=":
      nixGreaterThanEqualTok
    of "?":
      nixQuestionTok
    of "@":
      nixAtTok
    of "[":
      nixLBrackTok
    of "]":
      nixRBrackTok
    of "comment":
      nixComment2
    of "ellipses":
      nixEllipses
    of "else":
      nixElseTok
    of "escape_sequence":
      nixEscapeSequence
    of "float":
      nixFloat
    of "hpath":
      nixHpath
    of "identifier":
      nixIdentifier
    of "in":
      nixInTok
    of "integer":
      nixInteger
    of "or":
      nixOrTok
    of "path":
      nixPath
    of "rec":
      nixRecTok
    of "spath":
      nixSpath
    of "then":
      nixThenTok
    of "uri":
      nixUri
    of "{":
      nixLCurlyTok
    of "||":
      nixDoublePipeTok
    of "}":
      nixRCurlyTok
    of "ERROR":
      nixSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_nix(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: NixNode): string =
  $ts_node_type(TSNode(node))

proc newNixParser*(): NixParser =
  result = NixParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_nix())

proc parseString*(parser: NixParser; str: string): NixNode =
  NixNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseNixString*(str: string): NixNode =
  let parser = newNixParser()
  return parseString(parser, str)

func `[]`*(node: NixNode; idx: int; withUnnamed: bool = false): NixNode =
  if withUnnamed:
    NixNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    NixNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: NixNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: NixNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: NixNode; withUnnamed: bool = false): NixNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: NixNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: NixNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: NixNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
