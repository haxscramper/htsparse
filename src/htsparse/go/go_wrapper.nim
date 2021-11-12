import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  GoNodeKind* = enum
    goExpression                   ## _expression
    goSimpleStatement              ## _simple_statement
    goSimpleType                   ## _simple_type
    goStatement                    ## _statement
    goType                         ## _type
    goArgumentList                 ## argument_list
    goArrayType                    ## array_type
    goAssignmentStatement          ## assignment_statement
    goBinaryExpression             ## binary_expression
    goBlock                        ## block
    goBreakStatement               ## break_statement
    goCallExpression               ## call_expression
    goChannelType                  ## channel_type
    goCommunicationCase            ## communication_case
    goCompositeLiteral             ## composite_literal
    goConstDeclaration             ## const_declaration
    goConstSpec                    ## const_spec
    goContinueStatement            ## continue_statement
    goDecStatement                 ## dec_statement
    goDefaultCase                  ## default_case
    goDeferStatement               ## defer_statement
    goDot                          ## dot
    goElement                      ## element
    goEmptyStatement               ## empty_statement
    goExpressionCase               ## expression_case
    goExpressionList               ## expression_list
    goExpressionSwitchStatement    ## expression_switch_statement
    goFallthroughStatement         ## fallthrough_statement
    goFieldDeclaration             ## field_declaration
    goFieldDeclarationList         ## field_declaration_list
    goForClause                    ## for_clause
    goForStatement                 ## for_statement
    goFuncLiteral                  ## func_literal
    goFunctionDeclaration          ## function_declaration
    goFunctionType                 ## function_type
    goGoStatement                  ## go_statement
    goGotoStatement                ## goto_statement
    goIfStatement                  ## if_statement
    goImplicitLengthArrayType      ## implicit_length_array_type
    goImportDeclaration            ## import_declaration
    goImportSpec                   ## import_spec
    goImportSpecList               ## import_spec_list
    goIncStatement                 ## inc_statement
    goIndexExpression              ## index_expression
    goInterfaceType                ## interface_type
    goInterpretedStringLiteral     ## interpreted_string_literal
    goKeyedElement                 ## keyed_element
    goLabeledStatement             ## labeled_statement
    goLiteralValue                 ## literal_value
    goMapType                      ## map_type
    goMethodDeclaration            ## method_declaration
    goMethodSpec                   ## method_spec
    goMethodSpecList               ## method_spec_list
    goPackageClause                ## package_clause
    goParameterDeclaration         ## parameter_declaration
    goParameterList                ## parameter_list
    goParenthesizedExpression      ## parenthesized_expression
    goParenthesizedType            ## parenthesized_type
    goPointerType                  ## pointer_type
    goQualifiedType                ## qualified_type
    goRangeClause                  ## range_clause
    goReceiveStatement             ## receive_statement
    goReturnStatement              ## return_statement
    goSelectStatement              ## select_statement
    goSelectorExpression           ## selector_expression
    goSendStatement                ## send_statement
    goShortVarDeclaration          ## short_var_declaration
    goSliceExpression              ## slice_expression
    goSliceType                    ## slice_type
    goSourceFile                   ## source_file
    goStructType                   ## struct_type
    goTypeAlias                    ## type_alias
    goTypeAssertionExpression      ## type_assertion_expression
    goTypeCase                     ## type_case
    goTypeConversionExpression     ## type_conversion_expression
    goTypeDeclaration              ## type_declaration
    goTypeSpec                     ## type_spec
    goTypeSwitchStatement          ## type_switch_statement
    goUnaryExpression              ## unary_expression
    goVarDeclaration               ## var_declaration
    goVarSpec                      ## var_spec
    goVariadicArgument             ## variadic_argument
    goVariadicParameterDeclaration ## variadic_parameter_declaration
    goNewlineTok                   ##
                                   ##
    goExclamationTok               ## !
    goExclamationEqualTok          ## !=
    goQuoteTok                     ## "
    goPercentTok                   ## %
    goPercentEqualTok              ## %=
    goAmpersandTok                 ## &
    goDoubleAmpersandTok           ## &&
    goAmpersandEqualTok            ## &=
    goAmpersandAccentTok           ## &^
    goAmpersandAccentEqualTok      ## &^=
    goLParTok                      ## (
    goRParTok                      ## )
    goAsteriskTok                  ## *
    goAsteriskEqualTok             ## *=
    goPlusTok                      ## +
    goDoublePlusTok                ## ++
    goPlusEqualTok                 ## +=
    goCommaTok                     ## ,
    goMinusTok                     ## -
    goDoubleMinusTok               ## --
    goMinusEqualTok                ## -=
    goDotTok                       ## .
    goTripleDotTok                 ## ...
    goSlashTok                     ## /
    goSlashEqualTok                ## /=
    goColonTok                     ## :
    goColonEqualTok                ## :=
    goSemicolonTok                 ## ;
    goLessThanTok                  ## <
    goLessThanMinusTok             ## <-
    goDoubleLessThanTok            ## <<
    goDoubleLessThanEqualTok       ## <<=
    goLessThanEqualTok             ## <=
    goEqualTok                     ## =
    goDoubleEqualTok               ## ==
    goGreaterThanTok               ## >
    goGreaterThanEqualTok          ## >=
    goDoubleGreaterThanTok         ## >>
    goDoubleGreaterThanEqualTok    ## >>=
    goLBrackTok                    ## [
    goRBrackTok                    ## ]
    goAccentTok                    ## ^
    goAccentEqualTok               ## ^=
    goBlankIdentifier              ## blank_identifier
    goBreakTok                     ## break
    goCaseTok                      ## case
    goChanTok                      ## chan
    goComment                      ## comment
    goConstTok                     ## const
    goContinueTok                  ## continue
    goDefaultTok                   ## default
    goDeferTok                     ## defer
    goElseTok                      ## else
    goEscapeSequence               ## escape_sequence
    goFallthroughTok               ## fallthrough
    goFalse                        ## false
    goFieldIdentifier              ## field_identifier
    goFloatLiteral                 ## float_literal
    goForTok                       ## for
    goFuncTok                      ## func
    goGoTok                        ## go
    goGotoTok                      ## goto
    goIdentifier                   ## identifier
    goIfTok                        ## if
    goImaginaryLiteral             ## imaginary_literal
    goImportTok                    ## import
    goIntLiteral                   ## int_literal
    goInterfaceTok                 ## interface
    goLabelName                    ## label_name
    goMapTok                       ## map
    goNil                          ## nil
    goPackageTok                   ## package
    goPackageIdentifier            ## package_identifier
    goRangeTok                     ## range
    goRawStringLiteral             ## raw_string_literal
    goReturnTok                    ## return
    goRuneLiteral                  ## rune_literal
    goSelectTok                    ## select
    goStructTok                    ## struct
    goSwitchTok                    ## switch
    goTrue                         ## true
    goTypeTok                      ## type
    goTypeIdentifier               ## type_identifier
    goVarTok                       ## var
    goLCurlyTok                    ## {
    goPipeTok                      ## |
    goPipeEqualTok                 ## |=
    goDoublePipeTok                ## ||
    goRCurlyTok                    ## }
    goSyntaxError                  ## Tree-sitter parser syntax error


type
  TsGoNode* = distinct TSNode


type
  GoParser* = distinct PtsParser


proc tsNodeType*(node: TsGoNode): string



proc kind*(node: TsGoNode): GoNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":                    goExpression
      of "_simple_statement":              goSimpleStatement
      of "_simple_type":                   goSimpleType
      of "_statement":                     goStatement
      of "_type":                          goType
      of "argument_list":                  goArgumentList
      of "array_type":                     goArrayType
      of "assignment_statement":           goAssignmentStatement
      of "binary_expression":              goBinaryExpression
      of "block":                          goBlock
      of "break_statement":                goBreakStatement
      of "call_expression":                goCallExpression
      of "channel_type":                   goChannelType
      of "communication_case":             goCommunicationCase
      of "composite_literal":              goCompositeLiteral
      of "const_declaration":              goConstDeclaration
      of "const_spec":                     goConstSpec
      of "continue_statement":             goContinueStatement
      of "dec_statement":                  goDecStatement
      of "default_case":                   goDefaultCase
      of "defer_statement":                goDeferStatement
      of "dot":                            goDot
      of "element":                        goElement
      of "empty_statement":                goEmptyStatement
      of "expression_case":                goExpressionCase
      of "expression_list":                goExpressionList
      of "expression_switch_statement":    goExpressionSwitchStatement
      of "fallthrough_statement":          goFallthroughStatement
      of "field_declaration":              goFieldDeclaration
      of "field_declaration_list":         goFieldDeclarationList
      of "for_clause":                     goForClause
      of "for_statement":                  goForStatement
      of "func_literal":                   goFuncLiteral
      of "function_declaration":           goFunctionDeclaration
      of "function_type":                  goFunctionType
      of "go_statement":                   goGoStatement
      of "goto_statement":                 goGotoStatement
      of "if_statement":                   goIfStatement
      of "implicit_length_array_type":     goImplicitLengthArrayType
      of "import_declaration":             goImportDeclaration
      of "import_spec":                    goImportSpec
      of "import_spec_list":               goImportSpecList
      of "inc_statement":                  goIncStatement
      of "index_expression":               goIndexExpression
      of "interface_type":                 goInterfaceType
      of "interpreted_string_literal":     goInterpretedStringLiteral
      of "keyed_element":                  goKeyedElement
      of "labeled_statement":              goLabeledStatement
      of "literal_value":                  goLiteralValue
      of "map_type":                       goMapType
      of "method_declaration":             goMethodDeclaration
      of "method_spec":                    goMethodSpec
      of "method_spec_list":               goMethodSpecList
      of "package_clause":                 goPackageClause
      of "parameter_declaration":          goParameterDeclaration
      of "parameter_list":                 goParameterList
      of "parenthesized_expression":       goParenthesizedExpression
      of "parenthesized_type":             goParenthesizedType
      of "pointer_type":                   goPointerType
      of "qualified_type":                 goQualifiedType
      of "range_clause":                   goRangeClause
      of "receive_statement":              goReceiveStatement
      of "return_statement":               goReturnStatement
      of "select_statement":               goSelectStatement
      of "selector_expression":            goSelectorExpression
      of "send_statement":                 goSendStatement
      of "short_var_declaration":          goShortVarDeclaration
      of "slice_expression":               goSliceExpression
      of "slice_type":                     goSliceType
      of "source_file":                    goSourceFile
      of "struct_type":                    goStructType
      of "type_alias":                     goTypeAlias
      of "type_assertion_expression":      goTypeAssertionExpression
      of "type_case":                      goTypeCase
      of "type_conversion_expression":     goTypeConversionExpression
      of "type_declaration":               goTypeDeclaration
      of "type_spec":                      goTypeSpec
      of "type_switch_statement":          goTypeSwitchStatement
      of "unary_expression":               goUnaryExpression
      of "var_declaration":                goVarDeclaration
      of "var_spec":                       goVarSpec
      of "variadic_argument":              goVariadicArgument
      of "variadic_parameter_declaration": goVariadicParameterDeclaration
      of "\x0A":                           goNewlineTok
      of "!":                              goExclamationTok
      of "!=":                             goExclamationEqualTok
      of "\"":                             goQuoteTok
      of "%":                              goPercentTok
      of "%=":                             goPercentEqualTok
      of "&":                              goAmpersandTok
      of "&&":                             goDoubleAmpersandTok
      of "&=":                             goAmpersandEqualTok
      of "&^":                             goAmpersandAccentTok
      of "&^=":                            goAmpersandAccentEqualTok
      of "(":                              goLParTok
      of ")":                              goRParTok
      of "*":                              goAsteriskTok
      of "*=":                             goAsteriskEqualTok
      of "+":                              goPlusTok
      of "++":                             goDoublePlusTok
      of "+=":                             goPlusEqualTok
      of ",":                              goCommaTok
      of "-":                              goMinusTok
      of "--":                             goDoubleMinusTok
      of "-=":                             goMinusEqualTok
      of ".":                              goDotTok
      of "...":                            goTripleDotTok
      of "/":                              goSlashTok
      of "/=":                             goSlashEqualTok
      of ":":                              goColonTok
      of ":=":                             goColonEqualTok
      of ";":                              goSemicolonTok
      of "<":                              goLessThanTok
      of "<-":                             goLessThanMinusTok
      of "<<":                             goDoubleLessThanTok
      of "<<=":                            goDoubleLessThanEqualTok
      of "<=":                             goLessThanEqualTok
      of "=":                              goEqualTok
      of "==":                             goDoubleEqualTok
      of ">":                              goGreaterThanTok
      of ">=":                             goGreaterThanEqualTok
      of ">>":                             goDoubleGreaterThanTok
      of ">>=":                            goDoubleGreaterThanEqualTok
      of "[":                              goLBrackTok
      of "]":                              goRBrackTok
      of "^":                              goAccentTok
      of "^=":                             goAccentEqualTok
      of "blank_identifier":               goBlankIdentifier
      of "break":                          goBreakTok
      of "case":                           goCaseTok
      of "chan":                           goChanTok
      of "comment":                        goComment
      of "const":                          goConstTok
      of "continue":                       goContinueTok
      of "default":                        goDefaultTok
      of "defer":                          goDeferTok
      of "else":                           goElseTok
      of "escape_sequence":                goEscapeSequence
      of "fallthrough":                    goFallthroughTok
      of "false":                          goFalse
      of "field_identifier":               goFieldIdentifier
      of "float_literal":                  goFloatLiteral
      of "for":                            goForTok
      of "func":                           goFuncTok
      of "go":                             goGoTok
      of "goto":                           goGotoTok
      of "identifier":                     goIdentifier
      of "if":                             goIfTok
      of "imaginary_literal":              goImaginaryLiteral
      of "import":                         goImportTok
      of "int_literal":                    goIntLiteral
      of "interface":                      goInterfaceTok
      of "label_name":                     goLabelName
      of "map":                            goMapTok
      of "nil":                            goNil
      of "package":                        goPackageTok
      of "package_identifier":             goPackageIdentifier
      of "range":                          goRangeTok
      of "raw_string_literal":             goRawStringLiteral
      of "return":                         goReturnTok
      of "rune_literal":                   goRuneLiteral
      of "select":                         goSelectTok
      of "struct":                         goStructTok
      of "switch":                         goSwitchTok
      of "true":                           goTrue
      of "type":                           goTypeTok
      of "type_identifier":                goTypeIdentifier
      of "var":                            goVarTok
      of "{":                              goLCurlyTok
      of "|":                              goPipeTok
      of "|=":                             goPipeEqualTok
      of "||":                             goDoublePipeTok
      of "}":                              goRCurlyTok
      of "ERROR":                          goSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsGoNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsGoNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsGoNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_go(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsGoNode): string =
  $ts_node_type(TSNode(node))

proc newTsGoParser*(): GoParser =
  result = GoParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_go())

proc parseString*(parser: GoParser, str: string): TsGoNode =
  TsGoNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsGoString*(str: string): TsGoNode =
  let parser = newTsGoParser()
  return parseString(parser, str)

func `$`*(node: TsGoNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsGoNode,
    idx:  int,
    kind: GoNodeKind | set[GoNodeKind]
  ): TsGoNode =
  assert 0 <= idx and idx < node.len
  result = TsGoNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  GoNode* = HtsNode[TsGoNode, GoNodeKind]

proc treeReprTsGo*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsGoNode, GoNodeKind](parseTsGoString(str), str, 2, unnamed = unnamed)

proc toHtsNode*(
    node: TsGoNode,
    str:  ptr string
  ): HtsNode[TsGoNode, GoNodeKind] =
  toHtsNode[TsGoNode, GoNodeKind](node, str)

proc toHtsTree*(node: TsGoNode, str: ptr string): GoNode =
  toHtsNode[TsGoNode, GoNodeKind](node, str)

proc parseGoString*(str: ptr string, unnamed: bool = false): GoNode =
  let parser = newTsGoParser()
  return toHtsTree[TsGoNode, GoNodeKind](parseString(parser, str[]), str)

proc parseGoString*(str: string, unnamed: bool = false): GoNode =
  let parser = newTsGoParser()
  return toHtsTree[TsGoNode, GoNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


