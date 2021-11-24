import
  hmisc / wrappers/treesitter_core
export treesitter_core

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


proc strRepr*(kind: GoNodeKind): string =
  case kind:
    of goExpression:                   "_expression"
    of goSimpleStatement:              "_simple_statement"
    of goSimpleType:                   "_simple_type"
    of goStatement:                    "_statement"
    of goType:                         "_type"
    of goArgumentList:                 "argument_list"
    of goArrayType:                    "array_type"
    of goAssignmentStatement:          "assignment_statement"
    of goBinaryExpression:             "binary_expression"
    of goBlock:                        "block"
    of goBreakStatement:               "break_statement"
    of goCallExpression:               "call_expression"
    of goChannelType:                  "channel_type"
    of goCommunicationCase:            "communication_case"
    of goCompositeLiteral:             "composite_literal"
    of goConstDeclaration:             "const_declaration"
    of goConstSpec:                    "const_spec"
    of goContinueStatement:            "continue_statement"
    of goDecStatement:                 "dec_statement"
    of goDefaultCase:                  "default_case"
    of goDeferStatement:               "defer_statement"
    of goDot:                          "dot"
    of goElement:                      "element"
    of goEmptyStatement:               "empty_statement"
    of goExpressionCase:               "expression_case"
    of goExpressionList:               "expression_list"
    of goExpressionSwitchStatement:    "expression_switch_statement"
    of goFallthroughStatement:         "fallthrough_statement"
    of goFieldDeclaration:             "field_declaration"
    of goFieldDeclarationList:         "field_declaration_list"
    of goForClause:                    "for_clause"
    of goForStatement:                 "for_statement"
    of goFuncLiteral:                  "func_literal"
    of goFunctionDeclaration:          "function_declaration"
    of goFunctionType:                 "function_type"
    of goGoStatement:                  "go_statement"
    of goGotoStatement:                "goto_statement"
    of goIfStatement:                  "if_statement"
    of goImplicitLengthArrayType:      "implicit_length_array_type"
    of goImportDeclaration:            "import_declaration"
    of goImportSpec:                   "import_spec"
    of goImportSpecList:               "import_spec_list"
    of goIncStatement:                 "inc_statement"
    of goIndexExpression:              "index_expression"
    of goInterfaceType:                "interface_type"
    of goInterpretedStringLiteral:     "interpreted_string_literal"
    of goKeyedElement:                 "keyed_element"
    of goLabeledStatement:             "labeled_statement"
    of goLiteralValue:                 "literal_value"
    of goMapType:                      "map_type"
    of goMethodDeclaration:            "method_declaration"
    of goMethodSpec:                   "method_spec"
    of goMethodSpecList:               "method_spec_list"
    of goPackageClause:                "package_clause"
    of goParameterDeclaration:         "parameter_declaration"
    of goParameterList:                "parameter_list"
    of goParenthesizedExpression:      "parenthesized_expression"
    of goParenthesizedType:            "parenthesized_type"
    of goPointerType:                  "pointer_type"
    of goQualifiedType:                "qualified_type"
    of goRangeClause:                  "range_clause"
    of goReceiveStatement:             "receive_statement"
    of goReturnStatement:              "return_statement"
    of goSelectStatement:              "select_statement"
    of goSelectorExpression:           "selector_expression"
    of goSendStatement:                "send_statement"
    of goShortVarDeclaration:          "short_var_declaration"
    of goSliceExpression:              "slice_expression"
    of goSliceType:                    "slice_type"
    of goSourceFile:                   "source_file"
    of goStructType:                   "struct_type"
    of goTypeAlias:                    "type_alias"
    of goTypeAssertionExpression:      "type_assertion_expression"
    of goTypeCase:                     "type_case"
    of goTypeConversionExpression:     "type_conversion_expression"
    of goTypeDeclaration:              "type_declaration"
    of goTypeSpec:                     "type_spec"
    of goTypeSwitchStatement:          "type_switch_statement"
    of goUnaryExpression:              "unary_expression"
    of goVarDeclaration:               "var_declaration"
    of goVarSpec:                      "var_spec"
    of goVariadicArgument:             "variadic_argument"
    of goVariadicParameterDeclaration: "variadic_parameter_declaration"
    of goNewlineTok:                   "\x0A"
    of goExclamationTok:               "!"
    of goExclamationEqualTok:          "!="
    of goQuoteTok:                     "\""
    of goPercentTok:                   "%"
    of goPercentEqualTok:              "%="
    of goAmpersandTok:                 "&"
    of goDoubleAmpersandTok:           "&&"
    of goAmpersandEqualTok:            "&="
    of goAmpersandAccentTok:           "&^"
    of goAmpersandAccentEqualTok:      "&^="
    of goLParTok:                      "("
    of goRParTok:                      ")"
    of goAsteriskTok:                  "*"
    of goAsteriskEqualTok:             "*="
    of goPlusTok:                      "+"
    of goDoublePlusTok:                "++"
    of goPlusEqualTok:                 "+="
    of goCommaTok:                     ","
    of goMinusTok:                     "-"
    of goDoubleMinusTok:               "--"
    of goMinusEqualTok:                "-="
    of goDotTok:                       "."
    of goTripleDotTok:                 "..."
    of goSlashTok:                     "/"
    of goSlashEqualTok:                "/="
    of goColonTok:                     ":"
    of goColonEqualTok:                ":="
    of goSemicolonTok:                 ";"
    of goLessThanTok:                  "<"
    of goLessThanMinusTok:             "<-"
    of goDoubleLessThanTok:            "<<"
    of goDoubleLessThanEqualTok:       "<<="
    of goLessThanEqualTok:             "<="
    of goEqualTok:                     "="
    of goDoubleEqualTok:               "=="
    of goGreaterThanTok:               ">"
    of goGreaterThanEqualTok:          ">="
    of goDoubleGreaterThanTok:         ">>"
    of goDoubleGreaterThanEqualTok:    ">>="
    of goLBrackTok:                    "["
    of goRBrackTok:                    "]"
    of goAccentTok:                    "^"
    of goAccentEqualTok:               "^="
    of goBlankIdentifier:              "blank_identifier"
    of goBreakTok:                     "break"
    of goCaseTok:                      "case"
    of goChanTok:                      "chan"
    of goComment:                      "comment"
    of goConstTok:                     "const"
    of goContinueTok:                  "continue"
    of goDefaultTok:                   "default"
    of goDeferTok:                     "defer"
    of goElseTok:                      "else"
    of goEscapeSequence:               "escape_sequence"
    of goFallthroughTok:               "fallthrough"
    of goFalse:                        "false"
    of goFieldIdentifier:              "field_identifier"
    of goFloatLiteral:                 "float_literal"
    of goForTok:                       "for"
    of goFuncTok:                      "func"
    of goGoTok:                        "go"
    of goGotoTok:                      "goto"
    of goIdentifier:                   "identifier"
    of goIfTok:                        "if"
    of goImaginaryLiteral:             "imaginary_literal"
    of goImportTok:                    "import"
    of goIntLiteral:                   "int_literal"
    of goInterfaceTok:                 "interface"
    of goLabelName:                    "label_name"
    of goMapTok:                       "map"
    of goNil:                          "nil"
    of goPackageTok:                   "package"
    of goPackageIdentifier:            "package_identifier"
    of goRangeTok:                     "range"
    of goRawStringLiteral:             "raw_string_literal"
    of goReturnTok:                    "return"
    of goRuneLiteral:                  "rune_literal"
    of goSelectTok:                    "select"
    of goStructTok:                    "struct"
    of goSwitchTok:                    "switch"
    of goTrue:                         "true"
    of goTypeTok:                      "type"
    of goTypeIdentifier:               "type_identifier"
    of goVarTok:                       "var"
    of goLCurlyTok:                    "{"
    of goPipeTok:                      "|"
    of goPipeEqualTok:                 "|="
    of goDoublePipeTok:                "||"
    of goRCurlyTok:                    "}"
    of goSyntaxError:                  "ERROR"


type
  TsGoNode* = distinct TSNode


type
  GoParser* = distinct PtsParser


const goAllowedSubnodes*: array[GoNodeKind, set[GoNodeKind]] = block:
                                                                 var tmp: array[GoNodeKind, set[GoNodeKind]]
                                                                 tmp[goArgumentList] = {goExpression, goType, goVariadicArgument}
                                                                 tmp[goBlock] = {goStatement}
                                                                 tmp[goBreakStatement] = {goLabelName}
                                                                 tmp[goCommunicationCase] = {goStatement}
                                                                 tmp[goConstDeclaration] = {goConstSpec}
                                                                 tmp[goContinueStatement] = {goLabelName}
                                                                 tmp[goDecStatement] = {goExpression}
                                                                 tmp[goDefaultCase] = {goStatement}
                                                                 tmp[goDeferStatement] = {goExpression}
                                                                 tmp[goElement] = {goExpression, goLiteralValue}
                                                                 tmp[goExpressionCase] = {goStatement}
                                                                 tmp[goExpressionList] = {goExpression}
                                                                 tmp[goExpressionSwitchStatement] = {goDefaultCase, goExpressionCase}
                                                                 tmp[goFieldDeclarationList] = {goFieldDeclaration}
                                                                 tmp[goForStatement] = {goExpression, goForClause, goRangeClause}
                                                                 tmp[goGoStatement] = {goExpression}
                                                                 tmp[goGotoStatement] = {goLabelName}
                                                                 tmp[goImportDeclaration] = {goImportSpec, goImportSpecList}
                                                                 tmp[goImportSpecList] = {goImportSpec}
                                                                 tmp[goIncStatement] = {goExpression}
                                                                 tmp[goInterfaceType] = {goMethodSpecList}
                                                                 tmp[goInterpretedStringLiteral] = {goEscapeSequence}
                                                                 tmp[goKeyedElement] = {goExpression, goFieldIdentifier, goLiteralValue}
                                                                 tmp[goLabeledStatement] = {goStatement}
                                                                 tmp[goLiteralValue] = {goElement, goKeyedElement}
                                                                 tmp[goMethodSpecList] = {goMethodSpec, goQualifiedType, goTypeIdentifier}
                                                                 tmp[goPackageClause] = {goPackageIdentifier}
                                                                 tmp[goParameterList] = {goParameterDeclaration, goVariadicParameterDeclaration}
                                                                 tmp[goParenthesizedExpression] = {goExpression}
                                                                 tmp[goParenthesizedType] = {goType}
                                                                 tmp[goPointerType] = {goType}
                                                                 tmp[goReturnStatement] = {goExpressionList}
                                                                 tmp[goSelectStatement] = {goCommunicationCase, goDefaultCase}
                                                                 tmp[goSourceFile] = {goStatement, goFunctionDeclaration, goImportDeclaration, goMethodDeclaration, goPackageClause}
                                                                 tmp[goStructType] = {goFieldDeclarationList}
                                                                 tmp[goTypeCase] = {goStatement}
                                                                 tmp[goTypeDeclaration] = {goTypeAlias, goTypeSpec}
                                                                 tmp[goTypeSwitchStatement] = {goDefaultCase, goTypeCase}
                                                                 tmp[goVarDeclaration] = {goVarSpec}
                                                                 tmp[goVariadicArgument] = {goExpression}
                                                                 tmp
const goTokenKinds*: set[GoNodeKind] = {
                                         goNewlineTok,
                                         goExclamationTok,
                                         goExclamationEqualTok,
                                         goQuoteTok,
                                         goPercentTok,
                                         goPercentEqualTok,
                                         goAmpersandTok,
                                         goDoubleAmpersandTok,
                                         goAmpersandEqualTok,
                                         goAmpersandAccentTok,
                                         goAmpersandAccentEqualTok,
                                         goLParTok,
                                         goRParTok,
                                         goAsteriskTok,
                                         goAsteriskEqualTok,
                                         goPlusTok,
                                         goDoublePlusTok,
                                         goPlusEqualTok,
                                         goCommaTok,
                                         goMinusTok,
                                         goDoubleMinusTok,
                                         goMinusEqualTok,
                                         goDotTok,
                                         goTripleDotTok,
                                         goSlashTok,
                                         goSlashEqualTok,
                                         goColonTok,
                                         goColonEqualTok,
                                         goSemicolonTok,
                                         goLessThanTok,
                                         goLessThanMinusTok,
                                         goDoubleLessThanTok,
                                         goDoubleLessThanEqualTok,
                                         goLessThanEqualTok,
                                         goEqualTok,
                                         goDoubleEqualTok,
                                         goGreaterThanTok,
                                         goGreaterThanEqualTok,
                                         goDoubleGreaterThanTok,
                                         goDoubleGreaterThanEqualTok,
                                         goLBrackTok,
                                         goRBrackTok,
                                         goAccentTok,
                                         goAccentEqualTok,
                                         goBreakTok,
                                         goCaseTok,
                                         goChanTok,
                                         goConstTok,
                                         goContinueTok,
                                         goDefaultTok,
                                         goDeferTok,
                                         goElseTok,
                                         goFallthroughTok,
                                         goForTok,
                                         goFuncTok,
                                         goGoTok,
                                         goGotoTok,
                                         goIfTok,
                                         goImportTok,
                                         goInterfaceTok,
                                         goMapTok,
                                         goPackageTok,
                                         goRangeTok,
                                         goReturnTok,
                                         goSelectTok,
                                         goStructTok,
                                         goSwitchTok,
                                         goTypeTok,
                                         goVarTok,
                                         goLCurlyTok,
                                         goPipeTok,
                                         goPipeEqualTok,
                                         goDoublePipeTok,
                                         goRCurlyTok
                                       }

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


proc treeRepr*(node: TsGoNode, str: string): string =
  var res = addr result
  proc aux(node: TsGoNode, level: int) =
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


