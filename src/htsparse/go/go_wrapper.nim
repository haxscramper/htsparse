import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  GoNodeKind* = enum
    goHidExpression                ## _expression
    goHidSimpleStatement           ## _simple_statement
    goHidSimpleType                ## _simple_type
    goHidStatement                 ## _statement
    goHidType                      ## _type
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
    goSpecialArgumentList          ## special_argument_list
    goFieldNameList                ## field_name_list
    goHidFieldIdentifier           ## _field_identifier
    goHidStringLiteral             ## _string_literal
    goEmptyLabeledStatement        ## empty_labeled_statement
    goHidTypeSwitchHeader          ## _type_switch_header
    goHidTypeIdentifier            ## _type_identifier
    goHidStatementList             ## _statement_list
    goHidDeclaration               ## _declaration
    goHidTopLevelDeclaration       ## _top_level_declaration
    goHidPackageIdentifier         ## _package_identifier
    goSyntaxError                  ## Tree-sitter parser syntax error

proc strRepr*(kind: GoNodeKind): string =
  case kind:
    of goHidExpression:                "_expression"
    of goHidSimpleStatement:           "_simple_statement"
    of goHidSimpleType:                "_simple_type"
    of goHidStatement:                 "_statement"
    of goHidType:                      "_type"
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
    of goSpecialArgumentList:          "special_argument_list"
    of goFieldNameList:                "field_name_list"
    of goHidFieldIdentifier:           "_field_identifier"
    of goHidStringLiteral:             "_string_literal"
    of goEmptyLabeledStatement:        "empty_labeled_statement"
    of goHidTypeSwitchHeader:          "_type_switch_header"
    of goHidTypeIdentifier:            "_type_identifier"
    of goHidStatementList:             "_statement_list"
    of goHidDeclaration:               "_declaration"
    of goHidTopLevelDeclaration:       "_top_level_declaration"
    of goHidPackageIdentifier:         "_package_identifier"
    of goSyntaxError:                  "ERROR"

type
  TsGoNode* = distinct TSNode

type
  GoParser* = distinct PtsParser

const goAllowedSubnodes*: array[GoNodeKind, set[GoNodeKind]] = block:
                                                                 var tmp: array[GoNodeKind, set[GoNodeKind]]
                                                                 tmp[goArgumentList] = {goHidExpression, goHidType, goVariadicArgument}
                                                                 tmp[goBlock] = {goHidStatement}
                                                                 tmp[goBreakStatement] = {goLabelName}
                                                                 tmp[goCommunicationCase] = {goHidStatement}
                                                                 tmp[goConstDeclaration] = {goConstSpec}
                                                                 tmp[goContinueStatement] = {goLabelName}
                                                                 tmp[goDecStatement] = {goHidExpression}
                                                                 tmp[goDefaultCase] = {goHidStatement}
                                                                 tmp[goDeferStatement] = {goHidExpression}
                                                                 tmp[goElement] = {goHidExpression, goLiteralValue}
                                                                 tmp[goExpressionCase] = {goHidStatement}
                                                                 tmp[goExpressionList] = {goHidExpression}
                                                                 tmp[goExpressionSwitchStatement] = {goDefaultCase, goExpressionCase}
                                                                 tmp[goFieldDeclarationList] = {goFieldDeclaration}
                                                                 tmp[goForStatement] = {goHidExpression, goForClause, goRangeClause}
                                                                 tmp[goGoStatement] = {goHidExpression}
                                                                 tmp[goGotoStatement] = {goLabelName}
                                                                 tmp[goImportDeclaration] = {goImportSpec, goImportSpecList}
                                                                 tmp[goImportSpecList] = {goImportSpec}
                                                                 tmp[goIncStatement] = {goHidExpression}
                                                                 tmp[goInterfaceType] = {goMethodSpecList}
                                                                 tmp[goInterpretedStringLiteral] = {goEscapeSequence}
                                                                 tmp[goKeyedElement] = {goHidExpression, goFieldIdentifier, goLiteralValue}
                                                                 tmp[goLabeledStatement] = {goHidStatement}
                                                                 tmp[goLiteralValue] = {goElement, goKeyedElement}
                                                                 tmp[goMethodSpecList] = {goMethodSpec, goQualifiedType, goTypeIdentifier}
                                                                 tmp[goPackageClause] = {goPackageIdentifier}
                                                                 tmp[goParameterList] = {goParameterDeclaration, goVariadicParameterDeclaration}
                                                                 tmp[goParenthesizedExpression] = {goHidExpression}
                                                                 tmp[goParenthesizedType] = {goHidType}
                                                                 tmp[goPointerType] = {goHidType}
                                                                 tmp[goReturnStatement] = {goExpressionList}
                                                                 tmp[goSelectStatement] = {goCommunicationCase, goDefaultCase}
                                                                 tmp[goSourceFile] = {goHidStatement, goFunctionDeclaration, goImportDeclaration, goMethodDeclaration, goPackageClause}
                                                                 tmp[goStructType] = {goFieldDeclarationList}
                                                                 tmp[goTypeCase] = {goHidStatement}
                                                                 tmp[goTypeDeclaration] = {goTypeAlias, goTypeSpec}
                                                                 tmp[goTypeSwitchStatement] = {goDefaultCase, goTypeCase}
                                                                 tmp[goVarDeclaration] = {goVarSpec}
                                                                 tmp[goVariadicArgument] = {goHidExpression}
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
const goHiddenKinds*: set[GoNodeKind] = {
                                          goSpecialArgumentList,
                                          goFieldNameList,
                                          goHidSimpleType,
                                          goHidType,
                                          goHidExpression,
                                          goHidFieldIdentifier,
                                          goHidStringLiteral,
                                          goEmptyLabeledStatement,
                                          goHidTypeSwitchHeader,
                                          goHidSimpleStatement,
                                          goHidTypeIdentifier,
                                          goHidStatementList,
                                          goHidStatement,
                                          goHidDeclaration,
                                          goHidTopLevelDeclaration,
                                          goHidPackageIdentifier
                                        }
proc tsNodeType*(node: TsGoNode): string


proc kind*(node: TsGoNode): GoNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":                    goHidExpression
      of "_simple_statement":              goHidSimpleStatement
      of "_simple_type":                   goHidSimpleType
      of "_statement":                     goHidStatement
      of "_type":                          goHidType
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


import
  hmisc / wrappers/treesitter_core
let goGrammar*: array[GoNodeKind, HtsRule[GoNodeKind]] = block:
                                                           var rules: array[GoNodeKind, HtsRule[GoNodeKind]]
                                                           type
                                                             K = GoNodeKind


                                                           rules[goImaginaryLiteral] = tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsChoice[K](tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("b"), tsString[K]("B")), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[01]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[01]"))))), tsChoice[K](tsString[K]("0"), tsSeq[K](tsRegex[K]("[1-9]"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]()))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsChoice[K](tsString[K]("o"), tsString[K]("O")), tsBlank[K]()), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-7]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-7]"))))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("x"), tsString[K]("X")), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))))), tsChoice[K](tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsString[K]("."), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))))), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]()))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("x"), tsString[K]("X")), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))), tsString[K]("."), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]"))))), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))))), tsSeq[K](tsChoice[K](tsString[K]("p"), tsString[K]("P")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))))))), tsString[K]("i"))
                                                           rules[goDecStatement] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("--"))
                                                           rules[goChannelType] = tsChoice[K](tsSeq[K](tsString[K]("chan"), tsSymbol[K](goHidType)), tsSeq[K](tsString[K]("chan"), tsString[K]("<-"), tsSymbol[K](goHidType)), tsSeq[K](tsString[K]("<-"), tsString[K]("chan"), tsSymbol[K](goHidType)))
                                                           rules[goConstSpec] = tsSeq[K](tsSeq[K](tsSymbol[K](goIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goIdentifier)))), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goHidType), tsBlank[K]()), tsString[K]("="), tsSymbol[K](goExpressionList)), tsBlank[K]()))
                                                           rules[goForClause] = tsSeq[K](tsChoice[K](tsSymbol[K](goHidSimpleStatement), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSymbol[K](goHidExpression), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSymbol[K](goHidSimpleStatement), tsBlank[K]()))
                                                           rules[goImportSpec] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](goDot), tsSymbol[K](goBlankIdentifier), tsSymbol[K](goHidPackageIdentifier)), tsBlank[K]()), tsSymbol[K](goHidStringLiteral))
                                                           rules[goStructType] = tsSeq[K](tsString[K]("struct"), tsSymbol[K](goFieldDeclarationList))
                                                           rules[goReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](goExpressionList), tsBlank[K]()))
                                                           rules[goExpressionSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsChoice[K](tsSeq[K](tsSymbol[K](goHidSimpleStatement), tsString[K](";")), tsBlank[K]()), tsChoice[K](tsSymbol[K](goHidExpression), tsBlank[K]()), tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](goExpressionCase), tsSymbol[K](goDefaultCase))), tsString[K]("}"))
                                                           rules[goGotoStatement] = tsSeq[K](tsString[K]("goto"), tsSymbol[K](goIdentifier))
                                                           rules[goFuncLiteral] = tsSeq[K](tsString[K]("func"), tsSymbol[K](goParameterList), tsChoice[K](tsChoice[K](tsSymbol[K](goParameterList), tsSymbol[K](goHidSimpleType)), tsBlank[K]()), tsSymbol[K](goBlock))
                                                           rules[goFalse] = tsString[K]("false")
                                                           rules[goMapType] = tsSeq[K](tsString[K]("map"), tsString[K]("["), tsSymbol[K](goHidType), tsString[K]("]"), tsSymbol[K](goHidType))
                                                           rules[goHidExpression] = tsChoice[K](tsSymbol[K](goUnaryExpression), tsSymbol[K](goBinaryExpression), tsSymbol[K](goSelectorExpression), tsSymbol[K](goIndexExpression), tsSymbol[K](goSliceExpression), tsSymbol[K](goCallExpression), tsSymbol[K](goTypeAssertionExpression), tsSymbol[K](goTypeConversionExpression), tsSymbol[K](goIdentifier), tsChoice[K](tsString[K]("new"), tsString[K]("make")), tsSymbol[K](goCompositeLiteral), tsSymbol[K](goFuncLiteral), tsSymbol[K](goHidStringLiteral), tsSymbol[K](goIntLiteral), tsSymbol[K](goFloatLiteral), tsSymbol[K](goImaginaryLiteral), tsSymbol[K](goRuneLiteral), tsSymbol[K](goNil), tsSymbol[K](goTrue), tsSymbol[K](goFalse), tsSymbol[K](goParenthesizedExpression))
                                                           rules[goForStatement] = tsSeq[K](tsString[K]("for"), tsChoice[K](tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goForClause), tsSymbol[K](goRangeClause)), tsBlank[K]()), tsSymbol[K](goBlock))
                                                           rules[goHidFieldIdentifier] = tsSymbol[K](goIdentifier)
                                                           rules[goImportSpecList] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSeq[K](tsSymbol[K](goImportSpec), tsChoice[K](tsString[K]("\x0A"), tsString[K](";")))), tsString[K](")"))
                                                           rules[goTypeSpec] = tsSeq[K](tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goHidType))
                                                           rules[goParenthesizedType] = tsSeq[K](tsString[K]("("), tsSymbol[K](goHidType), tsString[K](")"))
                                                           rules[goBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](goHidStatementList), tsBlank[K]()), tsString[K]("}"))
                                                           rules[goVariadicParameterDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](goIdentifier), tsBlank[K]()), tsString[K]("..."), tsSymbol[K](goHidType))
                                                           rules[goHidTypeSwitchHeader] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](goHidSimpleStatement), tsString[K](";")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](goExpressionList), tsString[K](":=")), tsBlank[K]()), tsSymbol[K](goHidExpression), tsString[K]("."), tsString[K]("("), tsString[K]("type"), tsString[K](")"))
                                                           rules[goFallthroughStatement] = tsString[K]("fallthrough")
                                                           rules[goFunctionType] = tsSeq[K](tsString[K]("func"), tsSymbol[K](goParameterList), tsChoice[K](tsChoice[K](tsSymbol[K](goParameterList), tsSymbol[K](goHidSimpleType)), tsBlank[K]()))
                                                           rules[goVarDeclaration] = tsSeq[K](tsString[K]("var"), tsChoice[K](tsSymbol[K](goVarSpec), tsSeq[K](tsString[K]("("), tsRepeat[K](tsSeq[K](tsSymbol[K](goVarSpec), tsChoice[K](tsString[K]("\x0A"), tsString[K](";")))), tsString[K](")"))))
                                                           rules[goUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("!"), tsString[K]("^"), tsString[K]("*"), tsString[K]("&"), tsString[K]("<-")), tsSymbol[K](goHidExpression))
                                                           rules[goSourceFile] = tsRepeat[K](tsChoice[K](tsSeq[K](tsSymbol[K](goHidStatement), tsChoice[K](tsString[K]("\x0A"), tsString[K](";"))), tsSeq[K](tsSymbol[K](goHidTopLevelDeclaration), tsChoice[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsBlank[K]()))))
                                                           rules[goKeyedElement] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](goHidExpression), tsString[K](":")), tsSeq[K](tsSymbol[K](goLiteralValue), tsString[K](":")), tsSeq[K](tsSymbol[K](goHidFieldIdentifier), tsString[K](":"))), tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goLiteralValue)))
                                                           rules[goArrayType] = tsSeq[K](tsString[K]("["), tsSymbol[K](goHidExpression), tsString[K]("]"), tsSymbol[K](goHidType))
                                                           rules[goHidTypeIdentifier] = tsSymbol[K](goIdentifier)
                                                           rules[goNil] = tsString[K]("nil")
                                                           rules[goHidStatementList] = tsChoice[K](tsSeq[K](tsSymbol[K](goHidStatement), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsSymbol[K](goHidStatement))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsChoice[K](tsSymbol[K](goEmptyLabeledStatement), tsBlank[K]())), tsBlank[K]())), tsSymbol[K](goEmptyLabeledStatement))
                                                           rules[goMethodDeclaration] = tsSeq[K](tsString[K]("func"), tsSymbol[K](goParameterList), tsSymbol[K](goHidFieldIdentifier), tsSymbol[K](goParameterList), tsChoice[K](tsChoice[K](tsSymbol[K](goParameterList), tsSymbol[K](goHidSimpleType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](goBlock), tsBlank[K]()))
                                                           rules[goDefaultCase] = tsSeq[K](tsString[K]("default"), tsString[K](":"), tsChoice[K](tsSymbol[K](goHidStatementList), tsBlank[K]()))
                                                           rules[goComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                           rules[goHidStatement] = tsChoice[K](tsSymbol[K](goHidDeclaration), tsSymbol[K](goHidSimpleStatement), tsSymbol[K](goReturnStatement), tsSymbol[K](goGoStatement), tsSymbol[K](goDeferStatement), tsSymbol[K](goIfStatement), tsSymbol[K](goForStatement), tsSymbol[K](goExpressionSwitchStatement), tsSymbol[K](goTypeSwitchStatement), tsSymbol[K](goSelectStatement), tsSymbol[K](goLabeledStatement), tsSymbol[K](goFallthroughStatement), tsSymbol[K](goBreakStatement), tsSymbol[K](goContinueStatement), tsSymbol[K](goGotoStatement), tsSymbol[K](goBlock), tsSymbol[K](goEmptyStatement))
                                                           rules[goSendStatement] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("<-"), tsSymbol[K](goHidExpression))
                                                           rules[goTypeCase] = tsSeq[K](tsString[K]("case"), tsSeq[K](tsSymbol[K](goHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goHidType)))), tsString[K](":"), tsChoice[K](tsSymbol[K](goHidStatementList), tsBlank[K]()))
                                                           rules[goIdentifier] = tsSeq[K](tsChoice[K](tsRegex[K]("\\p{L}"), tsString[K]("_")), tsRepeat[K](tsChoice[K](tsChoice[K](tsRegex[K]("\\p{L}"), tsString[K]("_")), tsRegex[K]("[0-9]"))))
                                                           rules[goSelectStatement] = tsSeq[K](tsString[K]("select"), tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](goCommunicationCase), tsSymbol[K](goDefaultCase))), tsString[K]("}"))
                                                           rules[goTypeSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](goHidTypeSwitchHeader), tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](goTypeCase), tsSymbol[K](goDefaultCase))), tsString[K]("}"))
                                                           rules[goMethodSpecList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goQualifiedType), tsSymbol[K](goMethodSpec)), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsChoice[K](tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goQualifiedType), tsSymbol[K](goMethodSpec)))), tsChoice[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                           rules[goPointerType] = tsSeq[K](tsString[K]("*"), tsSymbol[K](goHidType))
                                                           rules[goFieldDeclaration] = tsSeq[K](tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](goHidFieldIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goHidFieldIdentifier)))), tsSymbol[K](goHidType)), tsSeq[K](tsChoice[K](tsString[K]("*"), tsBlank[K]()), tsChoice[K](tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goQualifiedType)))), tsChoice[K](tsSymbol[K](goHidStringLiteral), tsBlank[K]()))
                                                           rules[goParameterList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goParameterDeclaration), tsSymbol[K](goVariadicParameterDeclaration)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](goParameterDeclaration), tsSymbol[K](goVariadicParameterDeclaration))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                           rules[goHidDeclaration] = tsChoice[K](tsSymbol[K](goConstDeclaration), tsSymbol[K](goTypeDeclaration), tsSymbol[K](goVarDeclaration))
                                                           rules[goIntLiteral] = tsChoice[K](tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("b"), tsString[K]("B")), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[01]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[01]"))))), tsChoice[K](tsString[K]("0"), tsSeq[K](tsRegex[K]("[1-9]"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]()))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsChoice[K](tsString[K]("o"), tsString[K]("O")), tsBlank[K]()), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-7]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-7]"))))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("x"), tsString[K]("X")), tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]"))))))
                                                           rules[goTrue] = tsString[K]("true")
                                                           rules[goFieldDeclarationList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](goFieldDeclaration), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsSymbol[K](goFieldDeclaration))), tsChoice[K](tsChoice[K](tsString[K]("\x0A"), tsString[K](";")), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                           rules[goParameterDeclaration] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](goIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goIdentifier)))), tsBlank[K]()), tsSymbol[K](goHidType))
                                                           rules[goLabeledStatement] = tsSeq[K](tsSymbol[K](goIdentifier), tsString[K](":"), tsSymbol[K](goHidStatement))
                                                           rules[goParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](goHidExpression), tsString[K](")"))
                                                           rules[goHidPackageIdentifier] = tsSymbol[K](goIdentifier)
                                                           rules[goSpecialArgumentList] = tsSeq[K](tsString[K]("("), tsSymbol[K](goHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goHidExpression))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                           rules[goQualifiedType] = tsSeq[K](tsSymbol[K](goHidPackageIdentifier), tsString[K]("."), tsSymbol[K](goHidTypeIdentifier))
                                                           rules[goGoStatement] = tsSeq[K](tsString[K]("go"), tsSymbol[K](goHidExpression))
                                                           rules[goVarSpec] = tsSeq[K](tsSeq[K](tsSymbol[K](goIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goIdentifier)))), tsChoice[K](tsSeq[K](tsSymbol[K](goHidType), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](goExpressionList)), tsBlank[K]())), tsSeq[K](tsString[K]("="), tsSymbol[K](goExpressionList))))
                                                           rules[goFieldNameList] = tsSeq[K](tsSymbol[K](goHidFieldIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goHidFieldIdentifier))))
                                                           rules[goCommunicationCase] = tsSeq[K](tsString[K]("case"), tsChoice[K](tsSymbol[K](goSendStatement), tsSymbol[K](goReceiveStatement)), tsString[K](":"), tsChoice[K](tsSymbol[K](goHidStatementList), tsBlank[K]()))
                                                           rules[goFunctionDeclaration] = tsSeq[K](tsString[K]("func"), tsSymbol[K](goIdentifier), tsSymbol[K](goParameterList), tsChoice[K](tsChoice[K](tsSymbol[K](goParameterList), tsSymbol[K](goHidSimpleType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](goBlock), tsBlank[K]()))
                                                           rules[goHidSimpleType] = tsChoice[K](tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goQualifiedType), tsSymbol[K](goPointerType), tsSymbol[K](goStructType), tsSymbol[K](goInterfaceType), tsSymbol[K](goArrayType), tsSymbol[K](goSliceType), tsSymbol[K](goMapType), tsSymbol[K](goChannelType), tsSymbol[K](goFunctionType))
                                                           rules[goReceiveStatement] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](goExpressionList), tsChoice[K](tsString[K]("="), tsString[K](":="))), tsBlank[K]()), tsSymbol[K](goHidExpression))
                                                           rules[goIndexExpression] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("["), tsSymbol[K](goHidExpression), tsString[K]("]"))
                                                           rules[goSliceExpression] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("["), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goHidExpression), tsBlank[K]()), tsString[K](":"), tsChoice[K](tsSymbol[K](goHidExpression), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSymbol[K](goHidExpression), tsBlank[K]()), tsString[K](":"), tsSymbol[K](goHidExpression), tsString[K](":"), tsSymbol[K](goHidExpression))), tsString[K]("]"))
                                                           rules[goHidType] = tsChoice[K](tsSymbol[K](goHidSimpleType), tsSymbol[K](goParenthesizedType))
                                                           rules[goMethodSpec] = tsSeq[K](tsSymbol[K](goHidFieldIdentifier), tsSymbol[K](goParameterList), tsChoice[K](tsChoice[K](tsSymbol[K](goParameterList), tsSymbol[K](goHidSimpleType)), tsBlank[K]()))
                                                           rules[goIncStatement] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("++"))
                                                           rules[goCallExpression] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("new"), tsString[K]("make")), tsSymbol[K](goSpecialArgumentList)), tsSeq[K](tsSymbol[K](goHidExpression), tsSymbol[K](goArgumentList)))
                                                           rules[goBlankIdentifier] = tsString[K]("_")
                                                           rules[goSliceType] = tsSeq[K](tsString[K]("["), tsString[K]("]"), tsSymbol[K](goHidType))
                                                           rules[goTypeDeclaration] = tsSeq[K](tsString[K]("type"), tsChoice[K](tsSymbol[K](goTypeSpec), tsSymbol[K](goTypeAlias), tsSeq[K](tsString[K]("("), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](goTypeSpec), tsSymbol[K](goTypeAlias)), tsChoice[K](tsString[K]("\x0A"), tsString[K](";")))), tsString[K](")"))))
                                                           rules[goBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](goHidExpression), tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("<<"), tsString[K](">>"), tsString[K]("&"), tsString[K]("&^")), tsSymbol[K](goHidExpression)), tsSeq[K](tsSymbol[K](goHidExpression), tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("|"), tsString[K]("^")), tsSymbol[K](goHidExpression)), tsSeq[K](tsSymbol[K](goHidExpression), tsChoice[K](tsString[K]("=="), tsString[K]("!="), tsString[K]("<"), tsString[K]("<="), tsString[K](">"), tsString[K](">=")), tsSymbol[K](goHidExpression)), tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("&&"), tsSymbol[K](goHidExpression)), tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("||"), tsSymbol[K](goHidExpression)))
                                                           rules[goShortVarDeclaration] = tsSeq[K](tsSymbol[K](goExpressionList), tsString[K](":="), tsSymbol[K](goExpressionList))
                                                           rules[goEmptyLabeledStatement] = tsSeq[K](tsSymbol[K](goIdentifier), tsString[K](":"))
                                                           rules[goHidStringLiteral] = tsChoice[K](tsSymbol[K](goRawStringLiteral), tsSymbol[K](goInterpretedStringLiteral))
                                                           rules[goConstDeclaration] = tsSeq[K](tsString[K]("const"), tsChoice[K](tsSymbol[K](goConstSpec), tsSeq[K](tsString[K]("("), tsRepeat[K](tsSeq[K](tsSymbol[K](goConstSpec), tsChoice[K](tsString[K]("\x0A"), tsString[K](";")))), tsString[K](")"))))
                                                           rules[goBreakStatement] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](goIdentifier), tsBlank[K]()))
                                                           rules[goImplicitLengthArrayType] = tsSeq[K](tsString[K]("["), tsString[K]("..."), tsString[K]("]"), tsSymbol[K](goHidType))
                                                           rules[goRangeClause] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](goExpressionList), tsChoice[K](tsString[K]("="), tsString[K](":="))), tsBlank[K]()), tsString[K]("range"), tsSymbol[K](goHidExpression))
                                                           rules[goTypeAssertionExpression] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("."), tsString[K]("("), tsSymbol[K](goHidType), tsString[K](")"))
                                                           rules[goInterpretedStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"\\n\\\\]+"), tsSymbol[K](goEscapeSequence))), tsString[K]("\""))
                                                           rules[goSelectorExpression] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("."), tsSymbol[K](goHidFieldIdentifier))
                                                           rules[goVariadicArgument] = tsSeq[K](tsSymbol[K](goHidExpression), tsString[K]("..."))
                                                           rules[goArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goVariadicArgument)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goVariadicArgument)))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                           rules[goHidSimpleStatement] = tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goSendStatement), tsSymbol[K](goIncStatement), tsSymbol[K](goDecStatement), tsSymbol[K](goAssignmentStatement), tsSymbol[K](goShortVarDeclaration))
                                                           rules[goExpressionList] = tsSeq[K](tsSymbol[K](goHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](goHidExpression))))
                                                           rules[goContinueStatement] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](goIdentifier), tsBlank[K]()))
                                                           rules[goIfStatement] = tsSeq[K](tsString[K]("if"), tsChoice[K](tsSeq[K](tsSymbol[K](goHidSimpleStatement), tsString[K](";")), tsBlank[K]()), tsSymbol[K](goHidExpression), tsSymbol[K](goBlock), tsChoice[K](tsSeq[K](tsString[K]("else"), tsChoice[K](tsSymbol[K](goBlock), tsSymbol[K](goIfStatement))), tsBlank[K]()))
                                                           rules[goEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xuU]"), tsRegex[K]("\\d{2,3}"), tsRegex[K]("x[0-9a-fA-F]{2,}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("U[0-9a-fA-F]{8}")))
                                                           rules[goFloatLiteral] = tsChoice[K](tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsString[K]("."), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))))), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]"))))), tsBlank[K]()))), tsSeq[K](tsString[K]("0"), tsChoice[K](tsString[K]("x"), tsString[K]("X")), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))), tsString[K]("."), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]"))))), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9a-fA-F]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9a-fA-F]")))))), tsSeq[K](tsChoice[K](tsString[K]("p"), tsString[K]("P")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]"), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("[0-9]")))))))
                                                           rules[goRawStringLiteral] = tsSeq[K](tsString[K]("`"), tsRepeat[K](tsRegex[K]("[^`]")), tsString[K]("`"))
                                                           rules[goDeferStatement] = tsSeq[K](tsString[K]("defer"), tsSymbol[K](goHidExpression))
                                                           rules[goPackageClause] = tsSeq[K](tsString[K]("package"), tsSymbol[K](goHidPackageIdentifier))
                                                           rules[goAssignmentStatement] = tsSeq[K](tsSymbol[K](goExpressionList), tsChoice[K](tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("<<="), tsString[K](">>="), tsString[K]("&="), tsString[K]("&^="), tsString[K]("+="), tsString[K]("-="), tsString[K]("|="), tsString[K]("^="), tsString[K]("=")), tsSymbol[K](goExpressionList))
                                                           rules[goExpressionCase] = tsSeq[K](tsString[K]("case"), tsSymbol[K](goExpressionList), tsString[K](":"), tsChoice[K](tsSymbol[K](goHidStatementList), tsBlank[K]()))
                                                           rules[goImportDeclaration] = tsSeq[K](tsString[K]("import"), tsChoice[K](tsSymbol[K](goImportSpec), tsSymbol[K](goImportSpecList)))
                                                           rules[goRuneLiteral] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsRegex[K]("[^\'\\\\]"), tsSeq[K](tsString[K]("\\"), tsChoice[K](tsSeq[K](tsString[K]("x"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]")), tsSeq[K](tsRegex[K]("[0-7]"), tsRegex[K]("[0-7]"), tsRegex[K]("[0-7]")), tsSeq[K](tsString[K]("u"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]")), tsSeq[K](tsString[K]("U"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[0-9a-fA-F]")), tsSeq[K](tsChoice[K](tsString[K]("a"), tsString[K]("b"), tsString[K]("f"), tsString[K]("n"), tsString[K]("r"), tsString[K]("t"), tsString[K]("v"), tsString[K]("\\"), tsString[K]("\'"), tsString[K]("\"")))))), tsString[K]("\'"))
                                                           rules[goDot] = tsString[K](".")
                                                           rules[goEmptyStatement] = tsString[K](";")
                                                           rules[goTypeConversionExpression] = tsSeq[K](tsSymbol[K](goHidType), tsString[K]("("), tsSymbol[K](goHidExpression), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                           rules[goElement] = tsChoice[K](tsSymbol[K](goHidExpression), tsSymbol[K](goLiteralValue))
                                                           rules[goInterfaceType] = tsSeq[K](tsString[K]("interface"), tsSymbol[K](goMethodSpecList))
                                                           rules[goHidTopLevelDeclaration] = tsChoice[K](tsSymbol[K](goPackageClause), tsSymbol[K](goFunctionDeclaration), tsSymbol[K](goMethodDeclaration), tsSymbol[K](goImportDeclaration))
                                                           rules[goCompositeLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](goMapType), tsSymbol[K](goSliceType), tsSymbol[K](goArrayType), tsSymbol[K](goImplicitLengthArrayType), tsSymbol[K](goStructType), tsSymbol[K](goHidTypeIdentifier), tsSymbol[K](goQualifiedType)), tsSymbol[K](goLiteralValue))
                                                           rules[goLiteralValue] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](goElement), tsSymbol[K](goKeyedElement)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](goElement), tsSymbol[K](goKeyedElement)))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                           rules[goTypeAlias] = tsSeq[K](tsSymbol[K](goHidTypeIdentifier), tsString[K]("="), tsSymbol[K](goHidType))
                                                           rules

