import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  DartNodeKind* = enum
    dartDeclaration                            ## _declaration
    dartLiteral                                ## _literal
    dartStatement                              ## _statement
    dartAdditiveExpression                     ## additive_expression
    dartAdditiveOperator                       ## additive_operator
    dartAnnotation                             ## annotation
    dartArgument                               ## argument
    dartArgumentPart                           ## argument_part
    dartArguments                              ## arguments
    dartAsOperator                             ## as_operator
    dartAssertStatement                        ## assert_statement
    dartAssertion                              ## assertion
    dartAssignableExpression                   ## assignable_expression
    dartAssignmentExpression                   ## assignment_expression
    dartAssignmentExpressionWithoutCascade     ## assignment_expression_without_cascade
    dartAwaitExpression                        ## await_expression
    dartBinaryOperator                         ## binary_operator
    dartBitwiseAndExpression                   ## bitwise_and_expression
    dartBitwiseOperator                        ## bitwise_operator
    dartBitwiseOrExpression                    ## bitwise_or_expression
    dartBitwiseXorExpression                   ## bitwise_xor_expression
    dartBlock                                  ## block
    dartBreakStatement                         ## break_statement
    dartCascadeSection                         ## cascade_section
    dartCascadeSelector                        ## cascade_selector
    dartCatchClause                            ## catch_clause
    dartClassBody                              ## class_body
    dartClassDefinition                        ## class_definition
    dartCombinator                             ## combinator
    dartConditionalAssignableSelector          ## conditional_assignable_selector
    dartConditionalExpression                  ## conditional_expression
    dartConfigurableUri                        ## configurable_uri
    dartConfigurationUri                       ## configuration_uri
    dartConstObjectExpression                  ## const_object_expression
    dartConstantConstructorSignature           ## constant_constructor_signature
    dartConstructorInvocation                  ## constructor_invocation
    dartConstructorParam                       ## constructor_param
    dartConstructorSignature                   ## constructor_signature
    dartContinueStatement                      ## continue_statement
    dartDimensions                             ## dimensions
    dartDoStatement                            ## do_statement
    dartDottedIdentifierList                   ## dotted_identifier_list
    dartEnumBody                               ## enum_body
    dartEnumConstant                           ## enum_constant
    dartEnumDeclaration                        ## enum_declaration
    dartEqualityExpression                     ## equality_expression
    dartEscapeSequence                         ## escape_sequence
    dartExplicitConstructorInvocation          ## explicit_constructor_invocation
    dartExpressionStatement                    ## expression_statement
    dartExtensionBody                          ## extension_body
    dartExtensionDeclaration                   ## extension_declaration
    dartFactoryConstructorSignature            ## factory_constructor_signature
    dartFalse                                  ## false
    dartFieldInitializer                       ## field_initializer
    dartFinallyClause                          ## finally_clause
    dartForElement                             ## for_element
    dartForStatement                           ## for_statement
    dartFormalParameter                        ## formal_parameter
    dartFormalParameterList                    ## formal_parameter_list
    dartFunctionBody                           ## function_body
    dartFunctionExpression                     ## function_expression
    dartFunctionExpressionBody                 ## function_expression_body
    dartFunctionSignature                      ## function_signature
    dartFunctionType                           ## function_type
    dartGetterSignature                        ## getter_signature
    dartIdentifier                             ## identifier
    dartIfElement                              ## if_element
    dartIfNullExpression                       ## if_null_expression
    dartIfStatement                            ## if_statement
    dartImportOrExport                         ## import_or_export
    dartImportSpecification                    ## import_specification
    dartInferredType                           ## inferred_type
    dartInitializedIdentifier                  ## initialized_identifier
    dartInitializedIdentifierList              ## initialized_identifier_list
    dartInitializedVariableDefinition          ## initialized_variable_definition
    dartInitializerListEntry                   ## initializer_list_entry
    dartInitializers                           ## initializers
    dartInterfaces                             ## interfaces
    dartIsOperator                             ## is_operator
    dartLabel                                  ## label
    dartLabeledStatement                       ## labeled_statement
    dartLambdaExpression                       ## lambda_expression
    dartLibraryExport                          ## library_export
    dartLibraryImport                          ## library_import
    dartLibraryName                            ## library_name
    dartListLiteral                            ## list_literal
    dartLocalVariableDeclaration               ## local_variable_declaration
    dartLogicalAndExpression                   ## logical_and_expression
    dartLogicalOrExpression                    ## logical_or_expression
    dartMarkerAnnotation                       ## marker_annotation
    dartMethodSignature                        ## method_signature
    dartMixinApplication                       ## mixin_application
    dartMixinApplicationClass                  ## mixin_application_class
    dartMixinDeclaration                       ## mixin_declaration
    dartMixins                                 ## mixins
    dartModuleName                             ## module_name
    dartMultiplicativeExpression               ## multiplicative_expression
    dartMultiplicativeOperator                 ## multiplicative_operator
    dartNamedArgument                          ## named_argument
    dartNamedParameterTypes                    ## named_parameter_types
    dartNegationOperator                       ## negation_operator
    dartNewExpression                          ## new_expression
    dartNormalParameterType                    ## normal_parameter_type
    dartNullLiteral                            ## null_literal
    dartOperatorSignature                      ## operator_signature
    dartOptionalFormalParameters               ## optional_formal_parameters
    dartOptionalParameterTypes                 ## optional_parameter_types
    dartOptionalPositionalParameterTypes       ## optional_positional_parameter_types
    dartPair                                   ## pair
    dartParameterTypeList                      ## parameter_type_list
    dartParenthesizedExpression                ## parenthesized_expression
    dartPartDirective                          ## part_directive
    dartPartOfDirective                        ## part_of_directive
    dartPostfixExpression                      ## postfix_expression
    dartPostfixOperator                        ## postfix_operator
    dartPrefixOperator                         ## prefix_operator
    dartProgram                                ## program
    dartQualified                              ## qualified
    dartRedirectingFactoryConstructorSignature ## redirecting_factory_constructor_signature
    dartRedirection                            ## redirection
    dartRelationalExpression                   ## relational_expression
    dartRelationalOperator                     ## relational_operator
    dartReturnStatement                        ## return_statement
    dartScopedIdentifier                       ## scoped_identifier
    dartScriptTag                              ## script_tag
    dartSelector                               ## selector
    dartSetOrMapLiteral                        ## set_or_map_literal
    dartSetterSignature                        ## setter_signature
    dartShiftExpression                        ## shift_expression
    dartShiftOperator                          ## shift_operator
    dartSpreadElement                          ## spread_element
    dartStaticFinalDeclaration                 ## static_final_declaration
    dartStaticFinalDeclarationList             ## static_final_declaration_list
    dartStringLiteral                          ## string_literal
    dartSuper                                  ## super
    dartSuperclass                             ## superclass
    dartSwitchBlock                            ## switch_block
    dartSwitchLabel                            ## switch_label
    dartSwitchStatement                        ## switch_statement
    dartSymbolLiteral                          ## symbol_literal
    dartTemplateSubstitution                   ## template_substitution
    dartThis                                   ## this
    dartThrowExpression                        ## throw_expression
    dartThrowExpressionWithoutCascade          ## throw_expression_without_cascade
    dartThrows                                 ## throws
    dartTildeOperator                          ## tilde_operator
    dartTrue                                   ## true
    dartTryStatement                           ## try_statement
    dartTypeAlias                              ## type_alias
    dartTypeArguments                          ## type_arguments
    dartTypeBound                              ## type_bound
    dartTypeCast                               ## type_cast
    dartTypeCastExpression                     ## type_cast_expression
    dartTypeParameter                          ## type_parameter
    dartTypeParameters                         ## type_parameters
    dartTypeTest                               ## type_test
    dartTypeTestExpression                     ## type_test_expression
    dartTypedIdentifier                        ## typed_identifier
    dartUnaryExpression                        ## unary_expression
    dartUnconditionalAssignableSelector        ## unconditional_assignable_selector
    dartUri                                    ## uri
    dartUriTest                                ## uri_test
    dartWhileStatement                         ## while_statement
    dartYieldEachStatement                     ## yield_each_statement
    dartYieldStatement                         ## yield_statement
    dartNewlineTok                             ##
                                               ##
    dartQuoteTok                               ## "
    dartTripleQuoteTok                         ## """
    dartHashTok                                ## #
    dartHashExclamationTok                     ## #!
    dartDollarTok                              ## $
    dartPercentTok                             ## %
    dartAmpersandTok                           ## &
    dartDoubleAmpersandTok                     ## &&
    dartApostropheTok                          ## '
    dartTripleApostropheTok                    ## '''
    dartLParTok                                ## (
    dartRParTok                                ## )
    dartAsteriskTok                            ## *
    dartCommaTok                               ## ,
    dartDotTok                                 ## .
    dartDoubleDotTok                           ## ..
    dartTripleDotTok                           ## ...
    dartSlashTok                               ## /
    dartColonTok                               ## :
    dartSemicolonTok                           ## ;
    dartLessThanTok                            ## <
    dartDoubleLessThanTok                      ## <<
    dartLessThanEqualTok                       ## <=
    dartEqualTok                               ## =
    dartDoubleEqualTok                         ## ==
    dartEqualGreaterThanTok                    ## =>
    dartGreaterThanTok                         ## >
    dartGreaterThanEqualTok                    ## >=
    dartDoubleGreaterThanTok                   ## >>
    dartTripleGreaterThanTok                   ## >>>
    dartQuestionTok                            ## ?
    dartQuestionDotTok                         ## ?.
    dartDoubleQuestionTok                      ## ??
    dartAtTok                                  ## @
    dartFunctionTok                            ## Function
    dartLBrackTok                              ## [
    dartLBrackRBrackTok                        ## []
    dartLBrackRBrackEqualTok                   ## []=
    dartRBrackTok                              ## ]
    dartAccentTok                              ## ^
    dartAbstractTok                            ## abstract
    dartAsTok                                  ## as
    dartAsyncTok                               ## async
    dartAsyncAsteriskTok                       ## async*
    dartAwaitTok                               ## await
    dartBoolTok                                ## bool
    dartCaseBuiltin                            ## case_builtin
    dartCatchTok                               ## catch
    dartClassTok                               ## class
    dartComment                                ## comment
    dartConstBuiltin                           ## const_builtin
    dartContinueTok                            ## continue
    dartCovariantTok                           ## covariant
    dartDecimalFloatingPointLiteral            ## decimal_floating_point_literal
    dartDecimalIntegerLiteral                  ## decimal_integer_literal
    dartDefaultTok                             ## default
    dartDeferredTok                            ## deferred
    dartDoTok                                  ## do
    dartDocumentationComment                   ## documentation_comment
    dartDynamicTok                             ## dynamic
    dartElseTok                                ## else
    dartEnumTok                                ## enum
    dartEqualityOperator                       ## equality_operator
    dartExportTok                              ## export
    dartExtendsTok                             ## extends
    dartExtensionTok                           ## extension
    dartExternalTok                            ## external
    dartFactoryTok                             ## factory
    dartFalseTok                               ## false
    dartFinalBuiltin                           ## final_builtin
    dartFinallyTok                             ## finally
    dartForTok                                 ## for
    dartGetTok                                 ## get
    dartHexIntegerLiteral                      ## hex_integer_literal
    dartHideTok                                ## hide
    dartIdentifierDollarEscaped                ## identifier_dollar_escaped
    dartIfTok                                  ## if
    dartImplementsTok                          ## implements
    dartImportTok                              ## import
    dartInTok                                  ## in
    dartIncrementOperator                      ## increment_operator
    dartInterfaceTok                           ## interface
    dartIsTok                                  ## is
    dartLateTok                                ## late
    dartLibraryTok                             ## library
    dartMinusOperator                          ## minus_operator
    dartMixinTok                               ## mixin
    dartNativeTok                              ## native
    dartNewTok                                 ## new
    dartNullTok                                ## null
    dartOfTok                                  ## of
    dartOnTok                                  ## on
    dartOperatorTok                            ## operator
    dartPartTok                                ## part
    dartRQuoteTok                              ## r"
    dartRTripleQuoteTok                        ## r"""
    dartRApostropheTok                         ## r'
    dartRTripleApostropheTok                   ## r'''
    dartRequiredTok                            ## required
    dartReturnTok                              ## return
    dartSetTok                                 ## set
    dartShowTok                                ## show
    dartStaticTok                              ## static
    dartSuperTok                               ## super
    dartSwitchTok                              ## switch
    dartSyncAsteriskTok                        ## sync*
    dartThisTok                                ## this
    dartThrowTok                               ## throw
    dartThrowsTok                              ## throws
    dartTransitiveTok                          ## transitive
    dartTrueTok                                ## true
    dartTryTok                                 ## try
    dartTypeIdentifier                         ## type_identifier
    dartTypedefTok                             ## typedef
    dartVarTok                                 ## var
    dartVoidType                               ## void_type
    dartWhileTok                               ## while
    dartWithTok                                ## with
    dartYieldTok                               ## yield
    dartLCurlyTok                              ## {
    dartPipeTok                                ## |
    dartDoublePipeTok                          ## ||
    dartRCurlyTok                              ## }
    dartTildeTok                               ## ~
    dartTildeSlashTok                          ## ~/
    dartSyntaxError                            ## Tree-sitter parser syntax error


proc strRepr*(kind: DartNodeKind): string =
  case kind:
    of dartDeclaration:                            "_declaration"
    of dartLiteral:                                "_literal"
    of dartStatement:                              "_statement"
    of dartAdditiveExpression:                     "additive_expression"
    of dartAdditiveOperator:                       "additive_operator"
    of dartAnnotation:                             "annotation"
    of dartArgument:                               "argument"
    of dartArgumentPart:                           "argument_part"
    of dartArguments:                              "arguments"
    of dartAsOperator:                             "as_operator"
    of dartAssertStatement:                        "assert_statement"
    of dartAssertion:                              "assertion"
    of dartAssignableExpression:                   "assignable_expression"
    of dartAssignmentExpression:                   "assignment_expression"
    of dartAssignmentExpressionWithoutCascade:     "assignment_expression_without_cascade"
    of dartAwaitExpression:                        "await_expression"
    of dartBinaryOperator:                         "binary_operator"
    of dartBitwiseAndExpression:                   "bitwise_and_expression"
    of dartBitwiseOperator:                        "bitwise_operator"
    of dartBitwiseOrExpression:                    "bitwise_or_expression"
    of dartBitwiseXorExpression:                   "bitwise_xor_expression"
    of dartBlock:                                  "block"
    of dartBreakStatement:                         "break_statement"
    of dartCascadeSection:                         "cascade_section"
    of dartCascadeSelector:                        "cascade_selector"
    of dartCatchClause:                            "catch_clause"
    of dartClassBody:                              "class_body"
    of dartClassDefinition:                        "class_definition"
    of dartCombinator:                             "combinator"
    of dartConditionalAssignableSelector:          "conditional_assignable_selector"
    of dartConditionalExpression:                  "conditional_expression"
    of dartConfigurableUri:                        "configurable_uri"
    of dartConfigurationUri:                       "configuration_uri"
    of dartConstObjectExpression:                  "const_object_expression"
    of dartConstantConstructorSignature:           "constant_constructor_signature"
    of dartConstructorInvocation:                  "constructor_invocation"
    of dartConstructorParam:                       "constructor_param"
    of dartConstructorSignature:                   "constructor_signature"
    of dartContinueStatement:                      "continue_statement"
    of dartDimensions:                             "dimensions"
    of dartDoStatement:                            "do_statement"
    of dartDottedIdentifierList:                   "dotted_identifier_list"
    of dartEnumBody:                               "enum_body"
    of dartEnumConstant:                           "enum_constant"
    of dartEnumDeclaration:                        "enum_declaration"
    of dartEqualityExpression:                     "equality_expression"
    of dartEscapeSequence:                         "escape_sequence"
    of dartExplicitConstructorInvocation:          "explicit_constructor_invocation"
    of dartExpressionStatement:                    "expression_statement"
    of dartExtensionBody:                          "extension_body"
    of dartExtensionDeclaration:                   "extension_declaration"
    of dartFactoryConstructorSignature:            "factory_constructor_signature"
    of dartFalse:                                  "false"
    of dartFieldInitializer:                       "field_initializer"
    of dartFinallyClause:                          "finally_clause"
    of dartForElement:                             "for_element"
    of dartForStatement:                           "for_statement"
    of dartFormalParameter:                        "formal_parameter"
    of dartFormalParameterList:                    "formal_parameter_list"
    of dartFunctionBody:                           "function_body"
    of dartFunctionExpression:                     "function_expression"
    of dartFunctionExpressionBody:                 "function_expression_body"
    of dartFunctionSignature:                      "function_signature"
    of dartFunctionType:                           "function_type"
    of dartGetterSignature:                        "getter_signature"
    of dartIdentifier:                             "identifier"
    of dartIfElement:                              "if_element"
    of dartIfNullExpression:                       "if_null_expression"
    of dartIfStatement:                            "if_statement"
    of dartImportOrExport:                         "import_or_export"
    of dartImportSpecification:                    "import_specification"
    of dartInferredType:                           "inferred_type"
    of dartInitializedIdentifier:                  "initialized_identifier"
    of dartInitializedIdentifierList:              "initialized_identifier_list"
    of dartInitializedVariableDefinition:          "initialized_variable_definition"
    of dartInitializerListEntry:                   "initializer_list_entry"
    of dartInitializers:                           "initializers"
    of dartInterfaces:                             "interfaces"
    of dartIsOperator:                             "is_operator"
    of dartLabel:                                  "label"
    of dartLabeledStatement:                       "labeled_statement"
    of dartLambdaExpression:                       "lambda_expression"
    of dartLibraryExport:                          "library_export"
    of dartLibraryImport:                          "library_import"
    of dartLibraryName:                            "library_name"
    of dartListLiteral:                            "list_literal"
    of dartLocalVariableDeclaration:               "local_variable_declaration"
    of dartLogicalAndExpression:                   "logical_and_expression"
    of dartLogicalOrExpression:                    "logical_or_expression"
    of dartMarkerAnnotation:                       "marker_annotation"
    of dartMethodSignature:                        "method_signature"
    of dartMixinApplication:                       "mixin_application"
    of dartMixinApplicationClass:                  "mixin_application_class"
    of dartMixinDeclaration:                       "mixin_declaration"
    of dartMixins:                                 "mixins"
    of dartModuleName:                             "module_name"
    of dartMultiplicativeExpression:               "multiplicative_expression"
    of dartMultiplicativeOperator:                 "multiplicative_operator"
    of dartNamedArgument:                          "named_argument"
    of dartNamedParameterTypes:                    "named_parameter_types"
    of dartNegationOperator:                       "negation_operator"
    of dartNewExpression:                          "new_expression"
    of dartNormalParameterType:                    "normal_parameter_type"
    of dartNullLiteral:                            "null_literal"
    of dartOperatorSignature:                      "operator_signature"
    of dartOptionalFormalParameters:               "optional_formal_parameters"
    of dartOptionalParameterTypes:                 "optional_parameter_types"
    of dartOptionalPositionalParameterTypes:       "optional_positional_parameter_types"
    of dartPair:                                   "pair"
    of dartParameterTypeList:                      "parameter_type_list"
    of dartParenthesizedExpression:                "parenthesized_expression"
    of dartPartDirective:                          "part_directive"
    of dartPartOfDirective:                        "part_of_directive"
    of dartPostfixExpression:                      "postfix_expression"
    of dartPostfixOperator:                        "postfix_operator"
    of dartPrefixOperator:                         "prefix_operator"
    of dartProgram:                                "program"
    of dartQualified:                              "qualified"
    of dartRedirectingFactoryConstructorSignature: "redirecting_factory_constructor_signature"
    of dartRedirection:                            "redirection"
    of dartRelationalExpression:                   "relational_expression"
    of dartRelationalOperator:                     "relational_operator"
    of dartReturnStatement:                        "return_statement"
    of dartScopedIdentifier:                       "scoped_identifier"
    of dartScriptTag:                              "script_tag"
    of dartSelector:                               "selector"
    of dartSetOrMapLiteral:                        "set_or_map_literal"
    of dartSetterSignature:                        "setter_signature"
    of dartShiftExpression:                        "shift_expression"
    of dartShiftOperator:                          "shift_operator"
    of dartSpreadElement:                          "spread_element"
    of dartStaticFinalDeclaration:                 "static_final_declaration"
    of dartStaticFinalDeclarationList:             "static_final_declaration_list"
    of dartStringLiteral:                          "string_literal"
    of dartSuper:                                  "super"
    of dartSuperclass:                             "superclass"
    of dartSwitchBlock:                            "switch_block"
    of dartSwitchLabel:                            "switch_label"
    of dartSwitchStatement:                        "switch_statement"
    of dartSymbolLiteral:                          "symbol_literal"
    of dartTemplateSubstitution:                   "template_substitution"
    of dartThis:                                   "this"
    of dartThrowExpression:                        "throw_expression"
    of dartThrowExpressionWithoutCascade:          "throw_expression_without_cascade"
    of dartThrows:                                 "throws"
    of dartTildeOperator:                          "tilde_operator"
    of dartTrue:                                   "true"
    of dartTryStatement:                           "try_statement"
    of dartTypeAlias:                              "type_alias"
    of dartTypeArguments:                          "type_arguments"
    of dartTypeBound:                              "type_bound"
    of dartTypeCast:                               "type_cast"
    of dartTypeCastExpression:                     "type_cast_expression"
    of dartTypeParameter:                          "type_parameter"
    of dartTypeParameters:                         "type_parameters"
    of dartTypeTest:                               "type_test"
    of dartTypeTestExpression:                     "type_test_expression"
    of dartTypedIdentifier:                        "typed_identifier"
    of dartUnaryExpression:                        "unary_expression"
    of dartUnconditionalAssignableSelector:        "unconditional_assignable_selector"
    of dartUri:                                    "uri"
    of dartUriTest:                                "uri_test"
    of dartWhileStatement:                         "while_statement"
    of dartYieldEachStatement:                     "yield_each_statement"
    of dartYieldStatement:                         "yield_statement"
    of dartNewlineTok:                             "\x0A"
    of dartQuoteTok:                               "\""
    of dartTripleQuoteTok:                         "\"\"\""
    of dartHashTok:                                "#"
    of dartHashExclamationTok:                     "#!"
    of dartDollarTok:                              "$"
    of dartPercentTok:                             "%"
    of dartAmpersandTok:                           "&"
    of dartDoubleAmpersandTok:                     "&&"
    of dartApostropheTok:                          "\'"
    of dartTripleApostropheTok:                    "\'\'\'"
    of dartLParTok:                                "("
    of dartRParTok:                                ")"
    of dartAsteriskTok:                            "*"
    of dartCommaTok:                               ","
    of dartDotTok:                                 "."
    of dartDoubleDotTok:                           ".."
    of dartTripleDotTok:                           "..."
    of dartSlashTok:                               "/"
    of dartColonTok:                               ":"
    of dartSemicolonTok:                           ";"
    of dartLessThanTok:                            "<"
    of dartDoubleLessThanTok:                      "<<"
    of dartLessThanEqualTok:                       "<="
    of dartEqualTok:                               "="
    of dartDoubleEqualTok:                         "=="
    of dartEqualGreaterThanTok:                    "=>"
    of dartGreaterThanTok:                         ">"
    of dartGreaterThanEqualTok:                    ">="
    of dartDoubleGreaterThanTok:                   ">>"
    of dartTripleGreaterThanTok:                   ">>>"
    of dartQuestionTok:                            "?"
    of dartQuestionDotTok:                         "?."
    of dartDoubleQuestionTok:                      "??"
    of dartAtTok:                                  "@"
    of dartFunctionTok:                            "Function"
    of dartLBrackTok:                              "["
    of dartLBrackRBrackTok:                        "[]"
    of dartLBrackRBrackEqualTok:                   "[]="
    of dartRBrackTok:                              "]"
    of dartAccentTok:                              "^"
    of dartAbstractTok:                            "abstract"
    of dartAsTok:                                  "as"
    of dartAsyncTok:                               "async"
    of dartAsyncAsteriskTok:                       "async*"
    of dartAwaitTok:                               "await"
    of dartBoolTok:                                "bool"
    of dartCaseBuiltin:                            "case_builtin"
    of dartCatchTok:                               "catch"
    of dartClassTok:                               "class"
    of dartComment:                                "comment"
    of dartConstBuiltin:                           "const_builtin"
    of dartContinueTok:                            "continue"
    of dartCovariantTok:                           "covariant"
    of dartDecimalFloatingPointLiteral:            "decimal_floating_point_literal"
    of dartDecimalIntegerLiteral:                  "decimal_integer_literal"
    of dartDefaultTok:                             "default"
    of dartDeferredTok:                            "deferred"
    of dartDoTok:                                  "do"
    of dartDocumentationComment:                   "documentation_comment"
    of dartDynamicTok:                             "dynamic"
    of dartElseTok:                                "else"
    of dartEnumTok:                                "enum"
    of dartEqualityOperator:                       "equality_operator"
    of dartExportTok:                              "export"
    of dartExtendsTok:                             "extends"
    of dartExtensionTok:                           "extension"
    of dartExternalTok:                            "external"
    of dartFactoryTok:                             "factory"
    of dartFalseTok:                               "false"
    of dartFinalBuiltin:                           "final_builtin"
    of dartFinallyTok:                             "finally"
    of dartForTok:                                 "for"
    of dartGetTok:                                 "get"
    of dartHexIntegerLiteral:                      "hex_integer_literal"
    of dartHideTok:                                "hide"
    of dartIdentifierDollarEscaped:                "identifier_dollar_escaped"
    of dartIfTok:                                  "if"
    of dartImplementsTok:                          "implements"
    of dartImportTok:                              "import"
    of dartInTok:                                  "in"
    of dartIncrementOperator:                      "increment_operator"
    of dartInterfaceTok:                           "interface"
    of dartIsTok:                                  "is"
    of dartLateTok:                                "late"
    of dartLibraryTok:                             "library"
    of dartMinusOperator:                          "minus_operator"
    of dartMixinTok:                               "mixin"
    of dartNativeTok:                              "native"
    of dartNewTok:                                 "new"
    of dartNullTok:                                "null"
    of dartOfTok:                                  "of"
    of dartOnTok:                                  "on"
    of dartOperatorTok:                            "operator"
    of dartPartTok:                                "part"
    of dartRQuoteTok:                              "r\""
    of dartRTripleQuoteTok:                        "r\"\"\""
    of dartRApostropheTok:                         "r\'"
    of dartRTripleApostropheTok:                   "r\'\'\'"
    of dartRequiredTok:                            "required"
    of dartReturnTok:                              "return"
    of dartSetTok:                                 "set"
    of dartShowTok:                                "show"
    of dartStaticTok:                              "static"
    of dartSuperTok:                               "super"
    of dartSwitchTok:                              "switch"
    of dartSyncAsteriskTok:                        "sync*"
    of dartThisTok:                                "this"
    of dartThrowTok:                               "throw"
    of dartThrowsTok:                              "throws"
    of dartTransitiveTok:                          "transitive"
    of dartTrueTok:                                "true"
    of dartTryTok:                                 "try"
    of dartTypeIdentifier:                         "type_identifier"
    of dartTypedefTok:                             "typedef"
    of dartVarTok:                                 "var"
    of dartVoidType:                               "void_type"
    of dartWhileTok:                               "while"
    of dartWithTok:                                "with"
    of dartYieldTok:                               "yield"
    of dartLCurlyTok:                              "{"
    of dartPipeTok:                                "|"
    of dartDoublePipeTok:                          "||"
    of dartRCurlyTok:                              "}"
    of dartTildeTok:                               "~"
    of dartTildeSlashTok:                          "~/"
    of dartSyntaxError:                            "ERROR"


type
  DartExternalTok* = enum
    dartExtern_automatic_semicolon          ## _automatic_semicolon
    dartExtern_template_chars_double        ## _template_chars_double
    dartExtern_template_chars_single        ## _template_chars_single
    dartExtern_template_chars_double_single ## _template_chars_double_single
    dartExtern_template_chars_single_single ## _template_chars_single_single
    dartExtern_template_chars_raw_slash     ## _template_chars_raw_slash


type
  TsDartNode* = distinct TSNode


type
  DartParser* = distinct PtsParser


const dartAllowedSubnodes*: array[DartNodeKind, set[DartNodeKind]] = block:
                                                                       var tmp: array[DartNodeKind, set[DartNodeKind]]
                                                                       tmp[dartAdditiveExpression] = {
                                                                                                       dartLiteral,
                                                                                                       dartAdditiveExpression,
                                                                                                       dartAdditiveOperator,
                                                                                                       dartAssignmentExpression,
                                                                                                       dartBitwiseAndExpression,
                                                                                                       dartBitwiseOrExpression,
                                                                                                       dartBitwiseXorExpression,
                                                                                                       dartCascadeSection,
                                                                                                       dartConditionalExpression,
                                                                                                       dartConstObjectExpression,
                                                                                                       dartEqualityExpression,
                                                                                                       dartFunctionExpression,
                                                                                                       dartIdentifier,
                                                                                                       dartIfNullExpression,
                                                                                                       dartLogicalAndExpression,
                                                                                                       dartLogicalOrExpression,
                                                                                                       dartMultiplicativeExpression,
                                                                                                       dartNewExpression,
                                                                                                       dartPostfixExpression,
                                                                                                       dartRelationalExpression,
                                                                                                       dartSelector,
                                                                                                       dartShiftExpression,
                                                                                                       dartSuper,
                                                                                                       dartThis,
                                                                                                       dartThrowExpression,
                                                                                                       dartTypeCastExpression,
                                                                                                       dartTypeTestExpression,
                                                                                                       dartUnaryExpression,
                                                                                                       dartUnconditionalAssignableSelector
                                                                                                     }
                                                                       tmp[dartArgument] = {
                                                                                             dartLiteral,
                                                                                             dartAdditiveExpression,
                                                                                             dartAssignmentExpression,
                                                                                             dartBitwiseAndExpression,
                                                                                             dartBitwiseOrExpression,
                                                                                             dartBitwiseXorExpression,
                                                                                             dartCascadeSection,
                                                                                             dartConditionalExpression,
                                                                                             dartConstObjectExpression,
                                                                                             dartEqualityExpression,
                                                                                             dartFunctionExpression,
                                                                                             dartIdentifier,
                                                                                             dartIfNullExpression,
                                                                                             dartLogicalAndExpression,
                                                                                             dartLogicalOrExpression,
                                                                                             dartMultiplicativeExpression,
                                                                                             dartNewExpression,
                                                                                             dartPostfixExpression,
                                                                                             dartRelationalExpression,
                                                                                             dartSelector,
                                                                                             dartShiftExpression,
                                                                                             dartSuper,
                                                                                             dartThis,
                                                                                             dartThrowExpression,
                                                                                             dartTypeCastExpression,
                                                                                             dartTypeTestExpression,
                                                                                             dartUnaryExpression,
                                                                                             dartUnconditionalAssignableSelector
                                                                                           }
                                                                       tmp[dartArgumentPart] = {dartArguments, dartTypeArguments}
                                                                       tmp[dartArguments] = {dartArgument, dartNamedArgument}
                                                                       tmp[dartAssertStatement] = {dartAssertion}
                                                                       tmp[dartAssertion] = {
                                                                                              dartLiteral,
                                                                                              dartAdditiveExpression,
                                                                                              dartAssignmentExpression,
                                                                                              dartBitwiseAndExpression,
                                                                                              dartBitwiseOrExpression,
                                                                                              dartBitwiseXorExpression,
                                                                                              dartCascadeSection,
                                                                                              dartConditionalExpression,
                                                                                              dartConstObjectExpression,
                                                                                              dartEqualityExpression,
                                                                                              dartFunctionExpression,
                                                                                              dartIdentifier,
                                                                                              dartIfNullExpression,
                                                                                              dartLogicalAndExpression,
                                                                                              dartLogicalOrExpression,
                                                                                              dartMultiplicativeExpression,
                                                                                              dartNewExpression,
                                                                                              dartPostfixExpression,
                                                                                              dartRelationalExpression,
                                                                                              dartSelector,
                                                                                              dartShiftExpression,
                                                                                              dartSuper,
                                                                                              dartThis,
                                                                                              dartThrowExpression,
                                                                                              dartTypeCastExpression,
                                                                                              dartTypeTestExpression,
                                                                                              dartUnaryExpression,
                                                                                              dartUnconditionalAssignableSelector
                                                                                            }
                                                                       tmp[dartAssignableExpression] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalAssignableSelector,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartConstructorInvocation,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartAwaitExpression] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartBinaryOperator] = {dartAdditiveOperator, dartBitwiseOperator, dartMultiplicativeOperator, dartRelationalOperator, dartShiftOperator}
                                                                       tmp[dartBitwiseAndExpression] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartBitwiseOrExpression] = {
                                                                                                        dartLiteral,
                                                                                                        dartAdditiveExpression,
                                                                                                        dartAssignmentExpression,
                                                                                                        dartBitwiseAndExpression,
                                                                                                        dartBitwiseOrExpression,
                                                                                                        dartBitwiseXorExpression,
                                                                                                        dartCascadeSection,
                                                                                                        dartConditionalExpression,
                                                                                                        dartConstObjectExpression,
                                                                                                        dartEqualityExpression,
                                                                                                        dartFunctionExpression,
                                                                                                        dartIdentifier,
                                                                                                        dartIfNullExpression,
                                                                                                        dartLogicalAndExpression,
                                                                                                        dartLogicalOrExpression,
                                                                                                        dartMultiplicativeExpression,
                                                                                                        dartNewExpression,
                                                                                                        dartPostfixExpression,
                                                                                                        dartRelationalExpression,
                                                                                                        dartSelector,
                                                                                                        dartShiftExpression,
                                                                                                        dartSuper,
                                                                                                        dartThis,
                                                                                                        dartThrowExpression,
                                                                                                        dartTypeCastExpression,
                                                                                                        dartTypeTestExpression,
                                                                                                        dartUnaryExpression,
                                                                                                        dartUnconditionalAssignableSelector
                                                                                                      }
                                                                       tmp[dartBitwiseXorExpression] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartBlock] = {dartStatement}
                                                                       tmp[dartBreakStatement] = {dartIdentifier}
                                                                       tmp[dartCascadeSection] = {
                                                                                                   dartLiteral,
                                                                                                   dartAdditiveExpression,
                                                                                                   dartArgumentPart,
                                                                                                   dartAssignmentExpression,
                                                                                                   dartAssignmentExpressionWithoutCascade,
                                                                                                   dartBitwiseAndExpression,
                                                                                                   dartBitwiseOrExpression,
                                                                                                   dartBitwiseXorExpression,
                                                                                                   dartCascadeSection,
                                                                                                   dartCascadeSelector,
                                                                                                   dartConditionalAssignableSelector,
                                                                                                   dartConditionalExpression,
                                                                                                   dartConstObjectExpression,
                                                                                                   dartEqualityExpression,
                                                                                                   dartFunctionExpression,
                                                                                                   dartIdentifier,
                                                                                                   dartIfNullExpression,
                                                                                                   dartLogicalAndExpression,
                                                                                                   dartLogicalOrExpression,
                                                                                                   dartMultiplicativeExpression,
                                                                                                   dartNewExpression,
                                                                                                   dartPostfixExpression,
                                                                                                   dartRelationalExpression,
                                                                                                   dartSelector,
                                                                                                   dartShiftExpression,
                                                                                                   dartSuper,
                                                                                                   dartThis,
                                                                                                   dartThrowExpression,
                                                                                                   dartThrowExpressionWithoutCascade,
                                                                                                   dartTypeCastExpression,
                                                                                                   dartTypeTestExpression,
                                                                                                   dartUnaryExpression,
                                                                                                   dartUnconditionalAssignableSelector
                                                                                                 }
                                                                       tmp[dartCascadeSelector] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartCatchClause] = {dartIdentifier}
                                                                       tmp[dartClassBody] = {dartAnnotation, dartDeclaration, dartFunctionBody, dartMarkerAnnotation, dartMethodSignature}
                                                                       tmp[dartClassDefinition] = {dartAnnotation, dartMarkerAnnotation, dartMixinApplicationClass}
                                                                       tmp[dartCombinator] = {dartIdentifier}
                                                                       tmp[dartConditionalAssignableSelector] = {dartIdentifier}
                                                                       tmp[dartConditionalExpression] = {
                                                                                                          dartLiteral,
                                                                                                          dartAdditiveExpression,
                                                                                                          dartAssignmentExpression,
                                                                                                          dartBitwiseAndExpression,
                                                                                                          dartBitwiseOrExpression,
                                                                                                          dartBitwiseXorExpression,
                                                                                                          dartCascadeSection,
                                                                                                          dartConditionalExpression,
                                                                                                          dartConstObjectExpression,
                                                                                                          dartEqualityExpression,
                                                                                                          dartFunctionExpression,
                                                                                                          dartIdentifier,
                                                                                                          dartIfNullExpression,
                                                                                                          dartLogicalAndExpression,
                                                                                                          dartLogicalOrExpression,
                                                                                                          dartMultiplicativeExpression,
                                                                                                          dartNewExpression,
                                                                                                          dartPostfixExpression,
                                                                                                          dartRelationalExpression,
                                                                                                          dartSelector,
                                                                                                          dartShiftExpression,
                                                                                                          dartSuper,
                                                                                                          dartThis,
                                                                                                          dartThrowExpression,
                                                                                                          dartTypeCastExpression,
                                                                                                          dartTypeTestExpression,
                                                                                                          dartUnaryExpression,
                                                                                                          dartUnconditionalAssignableSelector
                                                                                                        }
                                                                       tmp[dartConfigurableUri] = {dartConfigurationUri, dartUri}
                                                                       tmp[dartConfigurationUri] = {dartUri, dartUriTest}
                                                                       tmp[dartConstObjectExpression] = {dartArguments, dartConstBuiltin, dartFunctionType, dartIdentifier, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartConstantConstructorSignature] = {dartConstBuiltin, dartFormalParameterList, dartQualified}
                                                                       tmp[dartConstructorInvocation] = {dartArguments, dartIdentifier, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartConstructorParam] = {
                                                                                                     dartConstBuiltin,
                                                                                                     dartFinalBuiltin,
                                                                                                     dartFormalParameterList,
                                                                                                     dartFunctionType,
                                                                                                     dartIdentifier,
                                                                                                     dartInferredType,
                                                                                                     dartThis,
                                                                                                     dartTypeArguments,
                                                                                                     dartTypeIdentifier,
                                                                                                     dartTypeParameters,
                                                                                                     dartVoidType
                                                                                                   }
                                                                       tmp[dartContinueStatement] = {dartIdentifier}
                                                                       tmp[dartDeclaration] = {
                                                                                                dartConstBuiltin,
                                                                                                dartConstantConstructorSignature,
                                                                                                dartConstructorSignature,
                                                                                                dartFactoryConstructorSignature,
                                                                                                dartFinalBuiltin,
                                                                                                dartFunctionSignature,
                                                                                                dartFunctionType,
                                                                                                dartGetterSignature,
                                                                                                dartInferredType,
                                                                                                dartInitializedIdentifierList,
                                                                                                dartInitializers,
                                                                                                dartOperatorSignature,
                                                                                                dartRedirectingFactoryConstructorSignature,
                                                                                                dartRedirection,
                                                                                                dartSetterSignature,
                                                                                                dartStaticFinalDeclarationList,
                                                                                                dartStringLiteral,
                                                                                                dartTypeArguments,
                                                                                                dartTypeIdentifier,
                                                                                                dartVoidType
                                                                                              }
                                                                       tmp[dartDimensions] = {dartAnnotation, dartMarkerAnnotation}
                                                                       tmp[dartDottedIdentifierList] = {dartIdentifier}
                                                                       tmp[dartEnumBody] = {dartEnumConstant}
                                                                       tmp[dartEnumConstant] = {dartAnnotation, dartMarkerAnnotation}
                                                                       tmp[dartEqualityExpression] = {
                                                                                                       dartLiteral,
                                                                                                       dartAdditiveExpression,
                                                                                                       dartAssignmentExpression,
                                                                                                       dartBitwiseAndExpression,
                                                                                                       dartBitwiseOrExpression,
                                                                                                       dartBitwiseXorExpression,
                                                                                                       dartCascadeSection,
                                                                                                       dartConditionalExpression,
                                                                                                       dartConstObjectExpression,
                                                                                                       dartEqualityExpression,
                                                                                                       dartEqualityOperator,
                                                                                                       dartFunctionExpression,
                                                                                                       dartIdentifier,
                                                                                                       dartIfNullExpression,
                                                                                                       dartLogicalAndExpression,
                                                                                                       dartLogicalOrExpression,
                                                                                                       dartMultiplicativeExpression,
                                                                                                       dartNewExpression,
                                                                                                       dartPostfixExpression,
                                                                                                       dartRelationalExpression,
                                                                                                       dartSelector,
                                                                                                       dartShiftExpression,
                                                                                                       dartSuper,
                                                                                                       dartThis,
                                                                                                       dartThrowExpression,
                                                                                                       dartTypeCastExpression,
                                                                                                       dartTypeTestExpression,
                                                                                                       dartUnaryExpression,
                                                                                                       dartUnconditionalAssignableSelector
                                                                                                     }
                                                                       tmp[dartExpressionStatement] = {
                                                                                                        dartLiteral,
                                                                                                        dartAdditiveExpression,
                                                                                                        dartAssignmentExpression,
                                                                                                        dartBitwiseAndExpression,
                                                                                                        dartBitwiseOrExpression,
                                                                                                        dartBitwiseXorExpression,
                                                                                                        dartCascadeSection,
                                                                                                        dartConditionalExpression,
                                                                                                        dartConstObjectExpression,
                                                                                                        dartEqualityExpression,
                                                                                                        dartFunctionExpression,
                                                                                                        dartIdentifier,
                                                                                                        dartIfNullExpression,
                                                                                                        dartLogicalAndExpression,
                                                                                                        dartLogicalOrExpression,
                                                                                                        dartMultiplicativeExpression,
                                                                                                        dartNewExpression,
                                                                                                        dartPostfixExpression,
                                                                                                        dartRelationalExpression,
                                                                                                        dartSelector,
                                                                                                        dartShiftExpression,
                                                                                                        dartSuper,
                                                                                                        dartThis,
                                                                                                        dartThrowExpression,
                                                                                                        dartTypeCastExpression,
                                                                                                        dartTypeTestExpression,
                                                                                                        dartUnaryExpression,
                                                                                                        dartUnconditionalAssignableSelector
                                                                                                      }
                                                                       tmp[dartExtensionBody] = {dartAnnotation, dartDeclaration, dartFunctionBody, dartMarkerAnnotation, dartMethodSignature}
                                                                       tmp[dartFactoryConstructorSignature] = {dartFormalParameterList, dartIdentifier}
                                                                       tmp[dartFieldInitializer] = {
                                                                                                     dartLiteral,
                                                                                                     dartAdditiveExpression,
                                                                                                     dartAssignmentExpression,
                                                                                                     dartBitwiseAndExpression,
                                                                                                     dartBitwiseOrExpression,
                                                                                                     dartBitwiseXorExpression,
                                                                                                     dartCascadeSection,
                                                                                                     dartConditionalExpression,
                                                                                                     dartConstObjectExpression,
                                                                                                     dartEqualityExpression,
                                                                                                     dartFunctionExpression,
                                                                                                     dartIdentifier,
                                                                                                     dartIfNullExpression,
                                                                                                     dartLogicalAndExpression,
                                                                                                     dartLogicalOrExpression,
                                                                                                     dartMultiplicativeExpression,
                                                                                                     dartNewExpression,
                                                                                                     dartPostfixExpression,
                                                                                                     dartRelationalExpression,
                                                                                                     dartSelector,
                                                                                                     dartShiftExpression,
                                                                                                     dartSuper,
                                                                                                     dartThis,
                                                                                                     dartThrowExpression,
                                                                                                     dartTypeCastExpression,
                                                                                                     dartTypeTestExpression,
                                                                                                     dartUnaryExpression,
                                                                                                     dartUnconditionalAssignableSelector
                                                                                                   }
                                                                       tmp[dartFinallyClause] = {dartBlock}
                                                                       tmp[dartForElement] = {
                                                                                               dartAnnotation,
                                                                                               dartConstBuiltin,
                                                                                               dartFinalBuiltin,
                                                                                               dartFunctionType,
                                                                                               dartIdentifier,
                                                                                               dartInferredType,
                                                                                               dartMarkerAnnotation,
                                                                                               dartTypeArguments,
                                                                                               dartTypeIdentifier,
                                                                                               dartVoidType
                                                                                             }
                                                                       tmp[dartForStatement] = {
                                                                                                 dartAnnotation,
                                                                                                 dartConstBuiltin,
                                                                                                 dartFinalBuiltin,
                                                                                                 dartFunctionType,
                                                                                                 dartIdentifier,
                                                                                                 dartInferredType,
                                                                                                 dartMarkerAnnotation,
                                                                                                 dartTypeArguments,
                                                                                                 dartTypeIdentifier,
                                                                                                 dartVoidType
                                                                                               }
                                                                       tmp[dartFormalParameter] = {
                                                                                                    dartAnnotation,
                                                                                                    dartConstBuiltin,
                                                                                                    dartConstructorParam,
                                                                                                    dartFinalBuiltin,
                                                                                                    dartFormalParameterList,
                                                                                                    dartFunctionType,
                                                                                                    dartIdentifier,
                                                                                                    dartInferredType,
                                                                                                    dartMarkerAnnotation,
                                                                                                    dartTypeArguments,
                                                                                                    dartTypeIdentifier,
                                                                                                    dartTypeParameters,
                                                                                                    dartVoidType
                                                                                                  }
                                                                       tmp[dartFormalParameterList] = {dartFormalParameter, dartOptionalFormalParameters}
                                                                       tmp[dartFunctionBody] = {
                                                                                                 dartLiteral,
                                                                                                 dartAdditiveExpression,
                                                                                                 dartAssignmentExpression,
                                                                                                 dartBitwiseAndExpression,
                                                                                                 dartBitwiseOrExpression,
                                                                                                 dartBitwiseXorExpression,
                                                                                                 dartBlock,
                                                                                                 dartCascadeSection,
                                                                                                 dartConditionalExpression,
                                                                                                 dartConstObjectExpression,
                                                                                                 dartEqualityExpression,
                                                                                                 dartFunctionExpression,
                                                                                                 dartIdentifier,
                                                                                                 dartIfNullExpression,
                                                                                                 dartLogicalAndExpression,
                                                                                                 dartLogicalOrExpression,
                                                                                                 dartMultiplicativeExpression,
                                                                                                 dartNewExpression,
                                                                                                 dartPostfixExpression,
                                                                                                 dartRelationalExpression,
                                                                                                 dartSelector,
                                                                                                 dartShiftExpression,
                                                                                                 dartSuper,
                                                                                                 dartThis,
                                                                                                 dartThrowExpression,
                                                                                                 dartTypeCastExpression,
                                                                                                 dartTypeTestExpression,
                                                                                                 dartUnaryExpression,
                                                                                                 dartUnconditionalAssignableSelector
                                                                                               }
                                                                       tmp[dartFunctionExpressionBody] = {
                                                                                                           dartLiteral,
                                                                                                           dartAdditiveExpression,
                                                                                                           dartAssignmentExpression,
                                                                                                           dartBitwiseAndExpression,
                                                                                                           dartBitwiseOrExpression,
                                                                                                           dartBitwiseXorExpression,
                                                                                                           dartBlock,
                                                                                                           dartCascadeSection,
                                                                                                           dartConditionalExpression,
                                                                                                           dartConstObjectExpression,
                                                                                                           dartEqualityExpression,
                                                                                                           dartFunctionExpression,
                                                                                                           dartIdentifier,
                                                                                                           dartIfNullExpression,
                                                                                                           dartLogicalAndExpression,
                                                                                                           dartLogicalOrExpression,
                                                                                                           dartMultiplicativeExpression,
                                                                                                           dartNewExpression,
                                                                                                           dartPostfixExpression,
                                                                                                           dartRelationalExpression,
                                                                                                           dartSelector,
                                                                                                           dartShiftExpression,
                                                                                                           dartSuper,
                                                                                                           dartThis,
                                                                                                           dartThrowExpression,
                                                                                                           dartTypeCastExpression,
                                                                                                           dartTypeTestExpression,
                                                                                                           dartUnaryExpression,
                                                                                                           dartUnconditionalAssignableSelector
                                                                                                         }
                                                                       tmp[dartFunctionSignature] = {
                                                                                                      dartFormalParameterList,
                                                                                                      dartFunctionType,
                                                                                                      dartStringLiteral,
                                                                                                      dartTypeArguments,
                                                                                                      dartTypeIdentifier,
                                                                                                      dartTypeParameters,
                                                                                                      dartVoidType
                                                                                                    }
                                                                       tmp[dartFunctionType] = {dartParameterTypeList, dartTypeArguments, dartTypeIdentifier, dartTypeParameters, dartVoidType}
                                                                       tmp[dartGetterSignature] = {dartFunctionType, dartStringLiteral, dartTypeArguments, dartTypeIdentifier, dartVoidType}
                                                                       tmp[dartImportOrExport] = {dartLibraryExport, dartLibraryImport}
                                                                       tmp[dartImportSpecification] = {dartCombinator, dartConfigurableUri, dartIdentifier, dartUri}
                                                                       tmp[dartInitializedIdentifier] = {
                                                                                                          dartLiteral,
                                                                                                          dartAdditiveExpression,
                                                                                                          dartAssignmentExpression,
                                                                                                          dartBitwiseAndExpression,
                                                                                                          dartBitwiseOrExpression,
                                                                                                          dartBitwiseXorExpression,
                                                                                                          dartCascadeSection,
                                                                                                          dartConditionalExpression,
                                                                                                          dartConstObjectExpression,
                                                                                                          dartEqualityExpression,
                                                                                                          dartFunctionExpression,
                                                                                                          dartIdentifier,
                                                                                                          dartIfNullExpression,
                                                                                                          dartLogicalAndExpression,
                                                                                                          dartLogicalOrExpression,
                                                                                                          dartMultiplicativeExpression,
                                                                                                          dartNewExpression,
                                                                                                          dartPostfixExpression,
                                                                                                          dartRelationalExpression,
                                                                                                          dartSelector,
                                                                                                          dartShiftExpression,
                                                                                                          dartSuper,
                                                                                                          dartThis,
                                                                                                          dartThrowExpression,
                                                                                                          dartTypeCastExpression,
                                                                                                          dartTypeTestExpression,
                                                                                                          dartUnaryExpression,
                                                                                                          dartUnconditionalAssignableSelector
                                                                                                        }
                                                                       tmp[dartInitializedIdentifierList] = {dartInitializedIdentifier}
                                                                       tmp[dartInitializedVariableDefinition] = {
                                                                                                                  dartAnnotation,
                                                                                                                  dartConstBuiltin,
                                                                                                                  dartFinalBuiltin,
                                                                                                                  dartFunctionType,
                                                                                                                  dartInferredType,
                                                                                                                  dartInitializedIdentifier,
                                                                                                                  dartMarkerAnnotation,
                                                                                                                  dartTypeArguments,
                                                                                                                  dartTypeIdentifier,
                                                                                                                  dartVoidType
                                                                                                                }
                                                                       tmp[dartInitializerListEntry] = {dartArguments, dartAssertion, dartFieldInitializer, dartQualified}
                                                                       tmp[dartInitializers] = {dartInitializerListEntry}
                                                                       tmp[dartInterfaces] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartLabel] = {dartIdentifier}
                                                                       tmp[dartLabeledStatement] = {dartStatement, dartIdentifier}
                                                                       tmp[dartLibraryExport] = {dartAnnotation, dartCombinator, dartConfigurableUri, dartMarkerAnnotation}
                                                                       tmp[dartLibraryImport] = {dartAnnotation, dartImportSpecification, dartMarkerAnnotation}
                                                                       tmp[dartLibraryName] = {dartAnnotation, dartDottedIdentifierList, dartMarkerAnnotation}
                                                                       tmp[dartListLiteral] = {
                                                                                                dartLiteral,
                                                                                                dartAdditiveExpression,
                                                                                                dartAssignmentExpression,
                                                                                                dartBitwiseAndExpression,
                                                                                                dartBitwiseOrExpression,
                                                                                                dartBitwiseXorExpression,
                                                                                                dartCascadeSection,
                                                                                                dartConditionalExpression,
                                                                                                dartConstBuiltin,
                                                                                                dartConstObjectExpression,
                                                                                                dartEqualityExpression,
                                                                                                dartForElement,
                                                                                                dartFunctionExpression,
                                                                                                dartIdentifier,
                                                                                                dartIfElement,
                                                                                                dartIfNullExpression,
                                                                                                dartLogicalAndExpression,
                                                                                                dartLogicalOrExpression,
                                                                                                dartMultiplicativeExpression,
                                                                                                dartNewExpression,
                                                                                                dartPair,
                                                                                                dartPostfixExpression,
                                                                                                dartRelationalExpression,
                                                                                                dartSelector,
                                                                                                dartShiftExpression,
                                                                                                dartSpreadElement,
                                                                                                dartSuper,
                                                                                                dartThis,
                                                                                                dartThrowExpression,
                                                                                                dartTypeArguments,
                                                                                                dartTypeCastExpression,
                                                                                                dartTypeTestExpression,
                                                                                                dartUnaryExpression,
                                                                                                dartUnconditionalAssignableSelector
                                                                                              }
                                                                       tmp[dartLocalVariableDeclaration] = {dartInitializedVariableDefinition}
                                                                       tmp[dartLogicalAndExpression] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartLogicalOrExpression] = {
                                                                                                        dartLiteral,
                                                                                                        dartAdditiveExpression,
                                                                                                        dartAssignmentExpression,
                                                                                                        dartBitwiseAndExpression,
                                                                                                        dartBitwiseOrExpression,
                                                                                                        dartBitwiseXorExpression,
                                                                                                        dartCascadeSection,
                                                                                                        dartConditionalExpression,
                                                                                                        dartConstObjectExpression,
                                                                                                        dartEqualityExpression,
                                                                                                        dartFunctionExpression,
                                                                                                        dartIdentifier,
                                                                                                        dartIfNullExpression,
                                                                                                        dartLogicalAndExpression,
                                                                                                        dartLogicalOrExpression,
                                                                                                        dartMultiplicativeExpression,
                                                                                                        dartNewExpression,
                                                                                                        dartPostfixExpression,
                                                                                                        dartRelationalExpression,
                                                                                                        dartSelector,
                                                                                                        dartShiftExpression,
                                                                                                        dartSuper,
                                                                                                        dartThis,
                                                                                                        dartThrowExpression,
                                                                                                        dartTypeCastExpression,
                                                                                                        dartTypeTestExpression,
                                                                                                        dartUnaryExpression,
                                                                                                        dartUnconditionalAssignableSelector
                                                                                                      }
                                                                       tmp[dartMethodSignature] = {
                                                                                                    dartConstructorSignature,
                                                                                                    dartFactoryConstructorSignature,
                                                                                                    dartFunctionSignature,
                                                                                                    dartGetterSignature,
                                                                                                    dartInitializers,
                                                                                                    dartOperatorSignature,
                                                                                                    dartSetterSignature
                                                                                                  }
                                                                       tmp[dartMixinApplication] = {dartFunctionType, dartInterfaces, dartMixins, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartMixinApplicationClass] = {dartIdentifier, dartMixinApplication, dartTypeParameters}
                                                                       tmp[dartMixinDeclaration] = {
                                                                                                     dartClassBody,
                                                                                                     dartFunctionType,
                                                                                                     dartIdentifier,
                                                                                                     dartInterfaces,
                                                                                                     dartTypeArguments,
                                                                                                     dartTypeIdentifier,
                                                                                                     dartTypeParameters
                                                                                                   }
                                                                       tmp[dartMixins] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartModuleName] = {dartIdentifier, dartModuleName}
                                                                       tmp[dartMultiplicativeExpression] = {
                                                                                                             dartLiteral,
                                                                                                             dartAdditiveExpression,
                                                                                                             dartAssignmentExpression,
                                                                                                             dartBitwiseAndExpression,
                                                                                                             dartBitwiseOrExpression,
                                                                                                             dartBitwiseXorExpression,
                                                                                                             dartCascadeSection,
                                                                                                             dartConditionalExpression,
                                                                                                             dartConstObjectExpression,
                                                                                                             dartEqualityExpression,
                                                                                                             dartFunctionExpression,
                                                                                                             dartIdentifier,
                                                                                                             dartIfNullExpression,
                                                                                                             dartLogicalAndExpression,
                                                                                                             dartLogicalOrExpression,
                                                                                                             dartMultiplicativeExpression,
                                                                                                             dartMultiplicativeOperator,
                                                                                                             dartNewExpression,
                                                                                                             dartPostfixExpression,
                                                                                                             dartRelationalExpression,
                                                                                                             dartSelector,
                                                                                                             dartShiftExpression,
                                                                                                             dartSuper,
                                                                                                             dartThis,
                                                                                                             dartThrowExpression,
                                                                                                             dartTypeCastExpression,
                                                                                                             dartTypeTestExpression,
                                                                                                             dartUnaryExpression,
                                                                                                             dartUnconditionalAssignableSelector
                                                                                                           }
                                                                       tmp[dartNamedArgument] = {
                                                                                                  dartLiteral,
                                                                                                  dartAdditiveExpression,
                                                                                                  dartAssignmentExpression,
                                                                                                  dartBitwiseAndExpression,
                                                                                                  dartBitwiseOrExpression,
                                                                                                  dartBitwiseXorExpression,
                                                                                                  dartCascadeSection,
                                                                                                  dartConditionalExpression,
                                                                                                  dartConstObjectExpression,
                                                                                                  dartEqualityExpression,
                                                                                                  dartFunctionExpression,
                                                                                                  dartIdentifier,
                                                                                                  dartIfNullExpression,
                                                                                                  dartLabel,
                                                                                                  dartLogicalAndExpression,
                                                                                                  dartLogicalOrExpression,
                                                                                                  dartMultiplicativeExpression,
                                                                                                  dartNewExpression,
                                                                                                  dartPostfixExpression,
                                                                                                  dartRelationalExpression,
                                                                                                  dartSelector,
                                                                                                  dartShiftExpression,
                                                                                                  dartSuper,
                                                                                                  dartThis,
                                                                                                  dartThrowExpression,
                                                                                                  dartTypeCastExpression,
                                                                                                  dartTypeTestExpression,
                                                                                                  dartUnaryExpression,
                                                                                                  dartUnconditionalAssignableSelector
                                                                                                }
                                                                       tmp[dartNamedParameterTypes] = {dartTypedIdentifier}
                                                                       tmp[dartNewExpression] = {dartArguments, dartFunctionType, dartIdentifier, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartNormalParameterType] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier, dartTypedIdentifier, dartVoidType}
                                                                       tmp[dartOperatorSignature] = {
                                                                                                      dartBinaryOperator,
                                                                                                      dartFormalParameterList,
                                                                                                      dartFunctionType,
                                                                                                      dartStringLiteral,
                                                                                                      dartTypeArguments,
                                                                                                      dartTypeIdentifier,
                                                                                                      dartVoidType
                                                                                                    }
                                                                       tmp[dartOptionalFormalParameters] = {
                                                                                                             dartLiteral,
                                                                                                             dartAdditiveExpression,
                                                                                                             dartAssignmentExpression,
                                                                                                             dartBitwiseAndExpression,
                                                                                                             dartBitwiseOrExpression,
                                                                                                             dartBitwiseXorExpression,
                                                                                                             dartCascadeSection,
                                                                                                             dartConditionalExpression,
                                                                                                             dartConstObjectExpression,
                                                                                                             dartEqualityExpression,
                                                                                                             dartFormalParameter,
                                                                                                             dartFunctionExpression,
                                                                                                             dartIdentifier,
                                                                                                             dartIfNullExpression,
                                                                                                             dartLogicalAndExpression,
                                                                                                             dartLogicalOrExpression,
                                                                                                             dartMultiplicativeExpression,
                                                                                                             dartNewExpression,
                                                                                                             dartPostfixExpression,
                                                                                                             dartRelationalExpression,
                                                                                                             dartSelector,
                                                                                                             dartShiftExpression,
                                                                                                             dartSuper,
                                                                                                             dartThis,
                                                                                                             dartThrowExpression,
                                                                                                             dartTypeCastExpression,
                                                                                                             dartTypeTestExpression,
                                                                                                             dartUnaryExpression,
                                                                                                             dartUnconditionalAssignableSelector
                                                                                                           }
                                                                       tmp[dartOptionalParameterTypes] = {dartNamedParameterTypes, dartOptionalPositionalParameterTypes}
                                                                       tmp[dartOptionalPositionalParameterTypes] = {dartNormalParameterType}
                                                                       tmp[dartParameterTypeList] = {dartNormalParameterType, dartOptionalParameterTypes}
                                                                       tmp[dartParenthesizedExpression] = {
                                                                                                            dartLiteral,
                                                                                                            dartAdditiveExpression,
                                                                                                            dartAssignmentExpression,
                                                                                                            dartBitwiseAndExpression,
                                                                                                            dartBitwiseOrExpression,
                                                                                                            dartBitwiseXorExpression,
                                                                                                            dartCascadeSection,
                                                                                                            dartConditionalExpression,
                                                                                                            dartConstObjectExpression,
                                                                                                            dartEqualityExpression,
                                                                                                            dartFunctionExpression,
                                                                                                            dartIdentifier,
                                                                                                            dartIfNullExpression,
                                                                                                            dartLogicalAndExpression,
                                                                                                            dartLogicalOrExpression,
                                                                                                            dartMultiplicativeExpression,
                                                                                                            dartNewExpression,
                                                                                                            dartPostfixExpression,
                                                                                                            dartRelationalExpression,
                                                                                                            dartSelector,
                                                                                                            dartShiftExpression,
                                                                                                            dartSuper,
                                                                                                            dartThis,
                                                                                                            dartThrowExpression,
                                                                                                            dartTypeCastExpression,
                                                                                                            dartTypeTestExpression,
                                                                                                            dartUnaryExpression,
                                                                                                            dartUnconditionalAssignableSelector
                                                                                                          }
                                                                       tmp[dartPartDirective] = {dartAnnotation, dartMarkerAnnotation, dartUri}
                                                                       tmp[dartPartOfDirective] = {dartAnnotation, dartDottedIdentifierList, dartMarkerAnnotation, dartUri}
                                                                       tmp[dartPostfixExpression] = {dartAssignableExpression, dartConstructorInvocation, dartPostfixOperator, dartSelector}
                                                                       tmp[dartPostfixOperator] = {dartIncrementOperator}
                                                                       tmp[dartPrefixOperator] = {dartMinusOperator, dartNegationOperator, dartTildeOperator}
                                                                       tmp[dartProgram] = {
                                                                                            dartStatement,
                                                                                            dartAnnotation,
                                                                                            dartClassDefinition,
                                                                                            dartConstBuiltin,
                                                                                            dartEnumDeclaration,
                                                                                            dartExtensionDeclaration,
                                                                                            dartFinalBuiltin,
                                                                                            dartFunctionBody,
                                                                                            dartFunctionSignature,
                                                                                            dartFunctionType,
                                                                                            dartGetterSignature,
                                                                                            dartImportOrExport,
                                                                                            dartInferredType,
                                                                                            dartInitializedIdentifierList,
                                                                                            dartLibraryName,
                                                                                            dartMarkerAnnotation,
                                                                                            dartMixinDeclaration,
                                                                                            dartPartDirective,
                                                                                            dartPartOfDirective,
                                                                                            dartScriptTag,
                                                                                            dartSetterSignature,
                                                                                            dartStaticFinalDeclarationList,
                                                                                            dartTypeAlias,
                                                                                            dartTypeArguments,
                                                                                            dartTypeIdentifier,
                                                                                            dartVoidType
                                                                                          }
                                                                       tmp[dartQualified] = {dartIdentifier}
                                                                       tmp[dartRedirectingFactoryConstructorSignature] = {dartConstBuiltin, dartFormalParameterList, dartFunctionType, dartIdentifier, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartRedirection] = {dartArguments, dartIdentifier, dartThis}
                                                                       tmp[dartRelationalExpression] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartRelationalOperator,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartReturnStatement] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartSelector] = {dartArgumentPart, dartConditionalAssignableSelector, dartUnconditionalAssignableSelector}
                                                                       tmp[dartSetOrMapLiteral] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstBuiltin,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartForElement,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfElement,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPair,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSpreadElement,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeArguments,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartSetterSignature] = {
                                                                                                    dartFormalParameterList,
                                                                                                    dartFunctionType,
                                                                                                    dartStringLiteral,
                                                                                                    dartTypeArguments,
                                                                                                    dartTypeIdentifier,
                                                                                                    dartTypeParameters,
                                                                                                    dartVoidType
                                                                                                  }
                                                                       tmp[dartShiftExpression] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartShiftOperator,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartSpreadElement] = {
                                                                                                  dartLiteral,
                                                                                                  dartAdditiveExpression,
                                                                                                  dartAssignmentExpression,
                                                                                                  dartBitwiseAndExpression,
                                                                                                  dartBitwiseOrExpression,
                                                                                                  dartBitwiseXorExpression,
                                                                                                  dartCascadeSection,
                                                                                                  dartConditionalExpression,
                                                                                                  dartConstObjectExpression,
                                                                                                  dartEqualityExpression,
                                                                                                  dartFunctionExpression,
                                                                                                  dartIdentifier,
                                                                                                  dartIfNullExpression,
                                                                                                  dartLogicalAndExpression,
                                                                                                  dartLogicalOrExpression,
                                                                                                  dartMultiplicativeExpression,
                                                                                                  dartNewExpression,
                                                                                                  dartPostfixExpression,
                                                                                                  dartRelationalExpression,
                                                                                                  dartSelector,
                                                                                                  dartShiftExpression,
                                                                                                  dartSuper,
                                                                                                  dartThis,
                                                                                                  dartThrowExpression,
                                                                                                  dartTypeCastExpression,
                                                                                                  dartTypeTestExpression,
                                                                                                  dartUnaryExpression,
                                                                                                  dartUnconditionalAssignableSelector
                                                                                                }
                                                                       tmp[dartStaticFinalDeclaration] = {
                                                                                                           dartLiteral,
                                                                                                           dartAdditiveExpression,
                                                                                                           dartAssignmentExpression,
                                                                                                           dartBitwiseAndExpression,
                                                                                                           dartBitwiseOrExpression,
                                                                                                           dartBitwiseXorExpression,
                                                                                                           dartCascadeSection,
                                                                                                           dartConditionalExpression,
                                                                                                           dartConstObjectExpression,
                                                                                                           dartEqualityExpression,
                                                                                                           dartFunctionExpression,
                                                                                                           dartIdentifier,
                                                                                                           dartIfNullExpression,
                                                                                                           dartLogicalAndExpression,
                                                                                                           dartLogicalOrExpression,
                                                                                                           dartMultiplicativeExpression,
                                                                                                           dartNewExpression,
                                                                                                           dartPostfixExpression,
                                                                                                           dartRelationalExpression,
                                                                                                           dartSelector,
                                                                                                           dartShiftExpression,
                                                                                                           dartSuper,
                                                                                                           dartThis,
                                                                                                           dartThrowExpression,
                                                                                                           dartTypeCastExpression,
                                                                                                           dartTypeTestExpression,
                                                                                                           dartUnaryExpression,
                                                                                                           dartUnconditionalAssignableSelector
                                                                                                         }
                                                                       tmp[dartStaticFinalDeclarationList] = {dartStaticFinalDeclaration}
                                                                       tmp[dartStringLiteral] = {dartEscapeSequence, dartTemplateSubstitution}
                                                                       tmp[dartSuperclass] = {dartFunctionType, dartMixins, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartSwitchBlock] = {dartStatement, dartSwitchLabel}
                                                                       tmp[dartSwitchLabel] = {
                                                                                                dartLiteral,
                                                                                                dartAdditiveExpression,
                                                                                                dartAssignmentExpression,
                                                                                                dartBitwiseAndExpression,
                                                                                                dartBitwiseOrExpression,
                                                                                                dartBitwiseXorExpression,
                                                                                                dartCascadeSection,
                                                                                                dartCaseBuiltin,
                                                                                                dartConditionalExpression,
                                                                                                dartConstObjectExpression,
                                                                                                dartEqualityExpression,
                                                                                                dartFunctionExpression,
                                                                                                dartIdentifier,
                                                                                                dartIfNullExpression,
                                                                                                dartLogicalAndExpression,
                                                                                                dartLogicalOrExpression,
                                                                                                dartMultiplicativeExpression,
                                                                                                dartNewExpression,
                                                                                                dartPostfixExpression,
                                                                                                dartRelationalExpression,
                                                                                                dartSelector,
                                                                                                dartShiftExpression,
                                                                                                dartSuper,
                                                                                                dartThis,
                                                                                                dartThrowExpression,
                                                                                                dartTypeCastExpression,
                                                                                                dartTypeTestExpression,
                                                                                                dartUnaryExpression,
                                                                                                dartUnconditionalAssignableSelector
                                                                                              }
                                                                       tmp[dartSymbolLiteral] = {dartIdentifier}
                                                                       tmp[dartTemplateSubstitution] = {
                                                                                                         dartLiteral,
                                                                                                         dartAdditiveExpression,
                                                                                                         dartAssignmentExpression,
                                                                                                         dartBitwiseAndExpression,
                                                                                                         dartBitwiseOrExpression,
                                                                                                         dartBitwiseXorExpression,
                                                                                                         dartCascadeSection,
                                                                                                         dartConditionalExpression,
                                                                                                         dartConstObjectExpression,
                                                                                                         dartEqualityExpression,
                                                                                                         dartFunctionExpression,
                                                                                                         dartIdentifier,
                                                                                                         dartIdentifierDollarEscaped,
                                                                                                         dartIfNullExpression,
                                                                                                         dartLogicalAndExpression,
                                                                                                         dartLogicalOrExpression,
                                                                                                         dartMultiplicativeExpression,
                                                                                                         dartNewExpression,
                                                                                                         dartPostfixExpression,
                                                                                                         dartRelationalExpression,
                                                                                                         dartSelector,
                                                                                                         dartShiftExpression,
                                                                                                         dartSuper,
                                                                                                         dartThis,
                                                                                                         dartThrowExpression,
                                                                                                         dartTypeCastExpression,
                                                                                                         dartTypeTestExpression,
                                                                                                         dartUnaryExpression,
                                                                                                         dartUnconditionalAssignableSelector
                                                                                                       }
                                                                       tmp[dartThrowExpression] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartThrowExpressionWithoutCascade] = {
                                                                                                                  dartLiteral,
                                                                                                                  dartAdditiveExpression,
                                                                                                                  dartAssignmentExpression,
                                                                                                                  dartAssignmentExpressionWithoutCascade,
                                                                                                                  dartBitwiseAndExpression,
                                                                                                                  dartBitwiseOrExpression,
                                                                                                                  dartBitwiseXorExpression,
                                                                                                                  dartCascadeSection,
                                                                                                                  dartConditionalExpression,
                                                                                                                  dartConstObjectExpression,
                                                                                                                  dartEqualityExpression,
                                                                                                                  dartFunctionExpression,
                                                                                                                  dartIdentifier,
                                                                                                                  dartIfNullExpression,
                                                                                                                  dartLogicalAndExpression,
                                                                                                                  dartLogicalOrExpression,
                                                                                                                  dartMultiplicativeExpression,
                                                                                                                  dartNewExpression,
                                                                                                                  dartPostfixExpression,
                                                                                                                  dartRelationalExpression,
                                                                                                                  dartSelector,
                                                                                                                  dartShiftExpression,
                                                                                                                  dartSuper,
                                                                                                                  dartThis,
                                                                                                                  dartThrowExpression,
                                                                                                                  dartThrowExpressionWithoutCascade,
                                                                                                                  dartTypeCastExpression,
                                                                                                                  dartTypeTestExpression,
                                                                                                                  dartUnaryExpression,
                                                                                                                  dartUnconditionalAssignableSelector
                                                                                                                }
                                                                       tmp[dartThrows] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier, dartVoidType}
                                                                       tmp[dartTryStatement] = {dartBlock, dartCatchClause, dartFinallyClause, dartFunctionType, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartTypeAlias] = {dartFormalParameterList, dartFunctionType, dartTypeArguments, dartTypeIdentifier, dartTypeParameters, dartVoidType}
                                                                       tmp[dartTypeArguments] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier, dartVoidType}
                                                                       tmp[dartTypeBound] = {dartFunctionType, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartTypeCast] = {dartAsOperator, dartFunctionType, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartTypeCastExpression] = {
                                                                                                       dartLiteral,
                                                                                                       dartAdditiveExpression,
                                                                                                       dartAssignmentExpression,
                                                                                                       dartBitwiseAndExpression,
                                                                                                       dartBitwiseOrExpression,
                                                                                                       dartBitwiseXorExpression,
                                                                                                       dartCascadeSection,
                                                                                                       dartConditionalExpression,
                                                                                                       dartConstObjectExpression,
                                                                                                       dartEqualityExpression,
                                                                                                       dartFunctionExpression,
                                                                                                       dartIdentifier,
                                                                                                       dartIfNullExpression,
                                                                                                       dartLogicalAndExpression,
                                                                                                       dartLogicalOrExpression,
                                                                                                       dartMultiplicativeExpression,
                                                                                                       dartNewExpression,
                                                                                                       dartPostfixExpression,
                                                                                                       dartRelationalExpression,
                                                                                                       dartSelector,
                                                                                                       dartShiftExpression,
                                                                                                       dartSuper,
                                                                                                       dartThis,
                                                                                                       dartThrowExpression,
                                                                                                       dartTypeCast,
                                                                                                       dartTypeCastExpression,
                                                                                                       dartTypeTestExpression,
                                                                                                       dartUnaryExpression,
                                                                                                       dartUnconditionalAssignableSelector
                                                                                                     }
                                                                       tmp[dartTypeParameter] = {dartAnnotation, dartMarkerAnnotation, dartTypeBound, dartTypeIdentifier}
                                                                       tmp[dartTypeParameters] = {dartTypeParameter}
                                                                       tmp[dartTypeTest] = {dartFunctionType, dartIsOperator, dartTypeArguments, dartTypeIdentifier}
                                                                       tmp[dartTypeTestExpression] = {
                                                                                                       dartLiteral,
                                                                                                       dartAdditiveExpression,
                                                                                                       dartAssignmentExpression,
                                                                                                       dartBitwiseAndExpression,
                                                                                                       dartBitwiseOrExpression,
                                                                                                       dartBitwiseXorExpression,
                                                                                                       dartCascadeSection,
                                                                                                       dartConditionalExpression,
                                                                                                       dartConstObjectExpression,
                                                                                                       dartEqualityExpression,
                                                                                                       dartFunctionExpression,
                                                                                                       dartIdentifier,
                                                                                                       dartIfNullExpression,
                                                                                                       dartLogicalAndExpression,
                                                                                                       dartLogicalOrExpression,
                                                                                                       dartMultiplicativeExpression,
                                                                                                       dartNewExpression,
                                                                                                       dartPostfixExpression,
                                                                                                       dartRelationalExpression,
                                                                                                       dartSelector,
                                                                                                       dartShiftExpression,
                                                                                                       dartSuper,
                                                                                                       dartThis,
                                                                                                       dartThrowExpression,
                                                                                                       dartTypeCastExpression,
                                                                                                       dartTypeTest,
                                                                                                       dartTypeTestExpression,
                                                                                                       dartUnaryExpression,
                                                                                                       dartUnconditionalAssignableSelector
                                                                                                     }
                                                                       tmp[dartTypedIdentifier] = {
                                                                                                    dartAnnotation,
                                                                                                    dartFunctionType,
                                                                                                    dartIdentifier,
                                                                                                    dartMarkerAnnotation,
                                                                                                    dartTypeArguments,
                                                                                                    dartTypeIdentifier,
                                                                                                    dartVoidType
                                                                                                  }
                                                                       tmp[dartUnaryExpression] = {
                                                                                                    dartLiteral,
                                                                                                    dartAdditiveExpression,
                                                                                                    dartAssignableExpression,
                                                                                                    dartAssignmentExpression,
                                                                                                    dartAwaitExpression,
                                                                                                    dartBitwiseAndExpression,
                                                                                                    dartBitwiseOrExpression,
                                                                                                    dartBitwiseXorExpression,
                                                                                                    dartCascadeSection,
                                                                                                    dartConditionalExpression,
                                                                                                    dartConstObjectExpression,
                                                                                                    dartEqualityExpression,
                                                                                                    dartFunctionExpression,
                                                                                                    dartIdentifier,
                                                                                                    dartIfNullExpression,
                                                                                                    dartIncrementOperator,
                                                                                                    dartLogicalAndExpression,
                                                                                                    dartLogicalOrExpression,
                                                                                                    dartMinusOperator,
                                                                                                    dartMultiplicativeExpression,
                                                                                                    dartNewExpression,
                                                                                                    dartPostfixExpression,
                                                                                                    dartPrefixOperator,
                                                                                                    dartRelationalExpression,
                                                                                                    dartSelector,
                                                                                                    dartShiftExpression,
                                                                                                    dartSuper,
                                                                                                    dartThis,
                                                                                                    dartThrowExpression,
                                                                                                    dartTildeOperator,
                                                                                                    dartTypeCastExpression,
                                                                                                    dartTypeTestExpression,
                                                                                                    dartUnaryExpression,
                                                                                                    dartUnconditionalAssignableSelector
                                                                                                  }
                                                                       tmp[dartUnconditionalAssignableSelector] = {
                                                                                                                    dartLiteral,
                                                                                                                    dartAdditiveExpression,
                                                                                                                    dartAssignmentExpression,
                                                                                                                    dartBitwiseAndExpression,
                                                                                                                    dartBitwiseOrExpression,
                                                                                                                    dartBitwiseXorExpression,
                                                                                                                    dartCascadeSection,
                                                                                                                    dartConditionalExpression,
                                                                                                                    dartConstObjectExpression,
                                                                                                                    dartEqualityExpression,
                                                                                                                    dartFunctionExpression,
                                                                                                                    dartIdentifier,
                                                                                                                    dartIfNullExpression,
                                                                                                                    dartLogicalAndExpression,
                                                                                                                    dartLogicalOrExpression,
                                                                                                                    dartMultiplicativeExpression,
                                                                                                                    dartNewExpression,
                                                                                                                    dartPostfixExpression,
                                                                                                                    dartRelationalExpression,
                                                                                                                    dartSelector,
                                                                                                                    dartShiftExpression,
                                                                                                                    dartSuper,
                                                                                                                    dartThis,
                                                                                                                    dartThrowExpression,
                                                                                                                    dartTypeCastExpression,
                                                                                                                    dartTypeTestExpression,
                                                                                                                    dartUnaryExpression,
                                                                                                                    dartUnconditionalAssignableSelector
                                                                                                                  }
                                                                       tmp[dartUri] = {dartStringLiteral}
                                                                       tmp[dartUriTest] = {dartDottedIdentifierList, dartStringLiteral}
                                                                       tmp[dartYieldEachStatement] = {
                                                                                                       dartLiteral,
                                                                                                       dartAdditiveExpression,
                                                                                                       dartAssignmentExpression,
                                                                                                       dartBitwiseAndExpression,
                                                                                                       dartBitwiseOrExpression,
                                                                                                       dartBitwiseXorExpression,
                                                                                                       dartCascadeSection,
                                                                                                       dartConditionalExpression,
                                                                                                       dartConstObjectExpression,
                                                                                                       dartEqualityExpression,
                                                                                                       dartFunctionExpression,
                                                                                                       dartIdentifier,
                                                                                                       dartIfNullExpression,
                                                                                                       dartLogicalAndExpression,
                                                                                                       dartLogicalOrExpression,
                                                                                                       dartMultiplicativeExpression,
                                                                                                       dartNewExpression,
                                                                                                       dartPostfixExpression,
                                                                                                       dartRelationalExpression,
                                                                                                       dartSelector,
                                                                                                       dartShiftExpression,
                                                                                                       dartSuper,
                                                                                                       dartThis,
                                                                                                       dartThrowExpression,
                                                                                                       dartTypeCastExpression,
                                                                                                       dartTypeTestExpression,
                                                                                                       dartUnaryExpression,
                                                                                                       dartUnconditionalAssignableSelector
                                                                                                     }
                                                                       tmp[dartYieldStatement] = {
                                                                                                   dartLiteral,
                                                                                                   dartAdditiveExpression,
                                                                                                   dartAssignmentExpression,
                                                                                                   dartBitwiseAndExpression,
                                                                                                   dartBitwiseOrExpression,
                                                                                                   dartBitwiseXorExpression,
                                                                                                   dartCascadeSection,
                                                                                                   dartConditionalExpression,
                                                                                                   dartConstObjectExpression,
                                                                                                   dartEqualityExpression,
                                                                                                   dartFunctionExpression,
                                                                                                   dartIdentifier,
                                                                                                   dartIfNullExpression,
                                                                                                   dartLogicalAndExpression,
                                                                                                   dartLogicalOrExpression,
                                                                                                   dartMultiplicativeExpression,
                                                                                                   dartNewExpression,
                                                                                                   dartPostfixExpression,
                                                                                                   dartRelationalExpression,
                                                                                                   dartSelector,
                                                                                                   dartShiftExpression,
                                                                                                   dartSuper,
                                                                                                   dartThis,
                                                                                                   dartThrowExpression,
                                                                                                   dartTypeCastExpression,
                                                                                                   dartTypeTestExpression,
                                                                                                   dartUnaryExpression,
                                                                                                   dartUnconditionalAssignableSelector
                                                                                                 }
                                                                       tmp
const dartTokenKinds*: set[DartNodeKind] = {
                                             dartNewlineTok,
                                             dartQuoteTok,
                                             dartTripleQuoteTok,
                                             dartHashTok,
                                             dartHashExclamationTok,
                                             dartDollarTok,
                                             dartPercentTok,
                                             dartAmpersandTok,
                                             dartDoubleAmpersandTok,
                                             dartApostropheTok,
                                             dartTripleApostropheTok,
                                             dartLParTok,
                                             dartRParTok,
                                             dartAsteriskTok,
                                             dartCommaTok,
                                             dartDotTok,
                                             dartDoubleDotTok,
                                             dartTripleDotTok,
                                             dartSlashTok,
                                             dartColonTok,
                                             dartSemicolonTok,
                                             dartLessThanTok,
                                             dartDoubleLessThanTok,
                                             dartLessThanEqualTok,
                                             dartEqualTok,
                                             dartDoubleEqualTok,
                                             dartEqualGreaterThanTok,
                                             dartGreaterThanTok,
                                             dartGreaterThanEqualTok,
                                             dartDoubleGreaterThanTok,
                                             dartTripleGreaterThanTok,
                                             dartQuestionTok,
                                             dartQuestionDotTok,
                                             dartDoubleQuestionTok,
                                             dartAtTok,
                                             dartFunctionTok,
                                             dartLBrackTok,
                                             dartLBrackRBrackTok,
                                             dartLBrackRBrackEqualTok,
                                             dartRBrackTok,
                                             dartAccentTok,
                                             dartAbstractTok,
                                             dartAsTok,
                                             dartAsyncTok,
                                             dartAsyncAsteriskTok,
                                             dartAwaitTok,
                                             dartBoolTok,
                                             dartCatchTok,
                                             dartClassTok,
                                             dartContinueTok,
                                             dartCovariantTok,
                                             dartDefaultTok,
                                             dartDeferredTok,
                                             dartDoTok,
                                             dartDynamicTok,
                                             dartElseTok,
                                             dartEnumTok,
                                             dartExportTok,
                                             dartExtendsTok,
                                             dartExtensionTok,
                                             dartExternalTok,
                                             dartFactoryTok,
                                             dartFalseTok,
                                             dartFinallyTok,
                                             dartForTok,
                                             dartGetTok,
                                             dartHideTok,
                                             dartIfTok,
                                             dartImplementsTok,
                                             dartImportTok,
                                             dartInTok,
                                             dartInterfaceTok,
                                             dartIsTok,
                                             dartLateTok,
                                             dartLibraryTok,
                                             dartMixinTok,
                                             dartNativeTok,
                                             dartNewTok,
                                             dartNullTok,
                                             dartOfTok,
                                             dartOnTok,
                                             dartOperatorTok,
                                             dartPartTok,
                                             dartRQuoteTok,
                                             dartRTripleQuoteTok,
                                             dartRApostropheTok,
                                             dartRTripleApostropheTok,
                                             dartRequiredTok,
                                             dartReturnTok,
                                             dartSetTok,
                                             dartShowTok,
                                             dartStaticTok,
                                             dartSuperTok,
                                             dartSwitchTok,
                                             dartSyncAsteriskTok,
                                             dartThisTok,
                                             dartThrowTok,
                                             dartThrowsTok,
                                             dartTransitiveTok,
                                             dartTrueTok,
                                             dartTryTok,
                                             dartTypedefTok,
                                             dartVarTok,
                                             dartWhileTok,
                                             dartWithTok,
                                             dartYieldTok,
                                             dartLCurlyTok,
                                             dartPipeTok,
                                             dartDoublePipeTok,
                                             dartRCurlyTok,
                                             dartTildeTok,
                                             dartTildeSlashTok
                                           }

proc tsNodeType*(node: TsDartNode): string



proc kind*(node: TsDartNode): DartNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration":                              dartDeclaration
      of "_literal":                                  dartLiteral
      of "_statement":                                dartStatement
      of "additive_expression":                       dartAdditiveExpression
      of "additive_operator":                         dartAdditiveOperator
      of "annotation":                                dartAnnotation
      of "argument":                                  dartArgument
      of "argument_part":                             dartArgumentPart
      of "arguments":                                 dartArguments
      of "as_operator":                               dartAsOperator
      of "assert_statement":                          dartAssertStatement
      of "assertion":                                 dartAssertion
      of "assignable_expression":                     dartAssignableExpression
      of "assignment_expression":                     dartAssignmentExpression
      of "assignment_expression_without_cascade":     dartAssignmentExpressionWithoutCascade
      of "await_expression":                          dartAwaitExpression
      of "binary_operator":                           dartBinaryOperator
      of "bitwise_and_expression":                    dartBitwiseAndExpression
      of "bitwise_operator":                          dartBitwiseOperator
      of "bitwise_or_expression":                     dartBitwiseOrExpression
      of "bitwise_xor_expression":                    dartBitwiseXorExpression
      of "block":                                     dartBlock
      of "break_statement":                           dartBreakStatement
      of "cascade_section":                           dartCascadeSection
      of "cascade_selector":                          dartCascadeSelector
      of "catch_clause":                              dartCatchClause
      of "class_body":                                dartClassBody
      of "class_definition":                          dartClassDefinition
      of "combinator":                                dartCombinator
      of "conditional_assignable_selector":           dartConditionalAssignableSelector
      of "conditional_expression":                    dartConditionalExpression
      of "configurable_uri":                          dartConfigurableUri
      of "configuration_uri":                         dartConfigurationUri
      of "const_object_expression":                   dartConstObjectExpression
      of "constant_constructor_signature":            dartConstantConstructorSignature
      of "constructor_invocation":                    dartConstructorInvocation
      of "constructor_param":                         dartConstructorParam
      of "constructor_signature":                     dartConstructorSignature
      of "continue_statement":                        dartContinueStatement
      of "declaration":                               dartDeclaration
      of "dimensions":                                dartDimensions
      of "do_statement":                              dartDoStatement
      of "dotted_identifier_list":                    dartDottedIdentifierList
      of "enum_body":                                 dartEnumBody
      of "enum_constant":                             dartEnumConstant
      of "enum_declaration":                          dartEnumDeclaration
      of "equality_expression":                       dartEqualityExpression
      of "escape_sequence":                           dartEscapeSequence
      of "explicit_constructor_invocation":           dartExplicitConstructorInvocation
      of "expression_statement":                      dartExpressionStatement
      of "extension_body":                            dartExtensionBody
      of "extension_declaration":                     dartExtensionDeclaration
      of "factory_constructor_signature":             dartFactoryConstructorSignature
      of "false":                                     dartFalse
      of "field_initializer":                         dartFieldInitializer
      of "finally_clause":                            dartFinallyClause
      of "for_element":                               dartForElement
      of "for_statement":                             dartForStatement
      of "formal_parameter":                          dartFormalParameter
      of "formal_parameter_list":                     dartFormalParameterList
      of "function_body":                             dartFunctionBody
      of "function_expression":                       dartFunctionExpression
      of "function_expression_body":                  dartFunctionExpressionBody
      of "function_signature":                        dartFunctionSignature
      of "function_type":                             dartFunctionType
      of "getter_signature":                          dartGetterSignature
      of "identifier":                                dartIdentifier
      of "if_element":                                dartIfElement
      of "if_null_expression":                        dartIfNullExpression
      of "if_statement":                              dartIfStatement
      of "import_or_export":                          dartImportOrExport
      of "import_specification":                      dartImportSpecification
      of "inferred_type":                             dartInferredType
      of "initialized_identifier":                    dartInitializedIdentifier
      of "initialized_identifier_list":               dartInitializedIdentifierList
      of "initialized_variable_definition":           dartInitializedVariableDefinition
      of "initializer_list_entry":                    dartInitializerListEntry
      of "initializers":                              dartInitializers
      of "interfaces":                                dartInterfaces
      of "is_operator":                               dartIsOperator
      of "label":                                     dartLabel
      of "labeled_statement":                         dartLabeledStatement
      of "lambda_expression":                         dartLambdaExpression
      of "library_export":                            dartLibraryExport
      of "library_import":                            dartLibraryImport
      of "library_name":                              dartLibraryName
      of "list_literal":                              dartListLiteral
      of "local_variable_declaration":                dartLocalVariableDeclaration
      of "logical_and_expression":                    dartLogicalAndExpression
      of "logical_or_expression":                     dartLogicalOrExpression
      of "marker_annotation":                         dartMarkerAnnotation
      of "method_signature":                          dartMethodSignature
      of "mixin_application":                         dartMixinApplication
      of "mixin_application_class":                   dartMixinApplicationClass
      of "mixin_declaration":                         dartMixinDeclaration
      of "mixins":                                    dartMixins
      of "module_name":                               dartModuleName
      of "multiplicative_expression":                 dartMultiplicativeExpression
      of "multiplicative_operator":                   dartMultiplicativeOperator
      of "named_argument":                            dartNamedArgument
      of "named_parameter_types":                     dartNamedParameterTypes
      of "negation_operator":                         dartNegationOperator
      of "new_expression":                            dartNewExpression
      of "normal_parameter_type":                     dartNormalParameterType
      of "null_literal":                              dartNullLiteral
      of "operator_signature":                        dartOperatorSignature
      of "optional_formal_parameters":                dartOptionalFormalParameters
      of "optional_parameter_types":                  dartOptionalParameterTypes
      of "optional_positional_parameter_types":       dartOptionalPositionalParameterTypes
      of "pair":                                      dartPair
      of "parameter_type_list":                       dartParameterTypeList
      of "parenthesized_expression":                  dartParenthesizedExpression
      of "part_directive":                            dartPartDirective
      of "part_of_directive":                         dartPartOfDirective
      of "postfix_expression":                        dartPostfixExpression
      of "postfix_operator":                          dartPostfixOperator
      of "prefix_operator":                           dartPrefixOperator
      of "program":                                   dartProgram
      of "qualified":                                 dartQualified
      of "redirecting_factory_constructor_signature": dartRedirectingFactoryConstructorSignature
      of "redirection":                               dartRedirection
      of "relational_expression":                     dartRelationalExpression
      of "relational_operator":                       dartRelationalOperator
      of "return_statement":                          dartReturnStatement
      of "scoped_identifier":                         dartScopedIdentifier
      of "script_tag":                                dartScriptTag
      of "selector":                                  dartSelector
      of "set_or_map_literal":                        dartSetOrMapLiteral
      of "setter_signature":                          dartSetterSignature
      of "shift_expression":                          dartShiftExpression
      of "shift_operator":                            dartShiftOperator
      of "spread_element":                            dartSpreadElement
      of "static_final_declaration":                  dartStaticFinalDeclaration
      of "static_final_declaration_list":             dartStaticFinalDeclarationList
      of "string_literal":                            dartStringLiteral
      of "super":                                     dartSuper
      of "superclass":                                dartSuperclass
      of "switch_block":                              dartSwitchBlock
      of "switch_label":                              dartSwitchLabel
      of "switch_statement":                          dartSwitchStatement
      of "symbol_literal":                            dartSymbolLiteral
      of "template_substitution":                     dartTemplateSubstitution
      of "this":                                      dartThis
      of "throw_expression":                          dartThrowExpression
      of "throw_expression_without_cascade":          dartThrowExpressionWithoutCascade
      of "throws":                                    dartThrows
      of "tilde_operator":                            dartTildeOperator
      of "true":                                      dartTrue
      of "try_statement":                             dartTryStatement
      of "type_alias":                                dartTypeAlias
      of "type_arguments":                            dartTypeArguments
      of "type_bound":                                dartTypeBound
      of "type_cast":                                 dartTypeCast
      of "type_cast_expression":                      dartTypeCastExpression
      of "type_parameter":                            dartTypeParameter
      of "type_parameters":                           dartTypeParameters
      of "type_test":                                 dartTypeTest
      of "type_test_expression":                      dartTypeTestExpression
      of "typed_identifier":                          dartTypedIdentifier
      of "unary_expression":                          dartUnaryExpression
      of "unconditional_assignable_selector":         dartUnconditionalAssignableSelector
      of "uri":                                       dartUri
      of "uri_test":                                  dartUriTest
      of "while_statement":                           dartWhileStatement
      of "yield_each_statement":                      dartYieldEachStatement
      of "yield_statement":                           dartYieldStatement
      of "\x0A":                                      dartNewlineTok
      of "\"":                                        dartQuoteTok
      of "\"\"\"":                                    dartTripleQuoteTok
      of "#":                                         dartHashTok
      of "#!":                                        dartHashExclamationTok
      of "$":                                         dartDollarTok
      of "%":                                         dartPercentTok
      of "&":                                         dartAmpersandTok
      of "&&":                                        dartDoubleAmpersandTok
      of "\'":                                        dartApostropheTok
      of "\'\'\'":                                    dartTripleApostropheTok
      of "(":                                         dartLParTok
      of ")":                                         dartRParTok
      of "*":                                         dartAsteriskTok
      of ",":                                         dartCommaTok
      of ".":                                         dartDotTok
      of "..":                                        dartDoubleDotTok
      of "...":                                       dartTripleDotTok
      of "/":                                         dartSlashTok
      of ":":                                         dartColonTok
      of ";":                                         dartSemicolonTok
      of "<":                                         dartLessThanTok
      of "<<":                                        dartDoubleLessThanTok
      of "<=":                                        dartLessThanEqualTok
      of "=":                                         dartEqualTok
      of "==":                                        dartDoubleEqualTok
      of "=>":                                        dartEqualGreaterThanTok
      of ">":                                         dartGreaterThanTok
      of ">=":                                        dartGreaterThanEqualTok
      of ">>":                                        dartDoubleGreaterThanTok
      of ">>>":                                       dartTripleGreaterThanTok
      of "?":                                         dartQuestionTok
      of "?.":                                        dartQuestionDotTok
      of "??":                                        dartDoubleQuestionTok
      of "@":                                         dartAtTok
      of "Function":                                  dartFunctionTok
      of "[":                                         dartLBrackTok
      of "[]":                                        dartLBrackRBrackTok
      of "[]=":                                       dartLBrackRBrackEqualTok
      of "]":                                         dartRBrackTok
      of "^":                                         dartAccentTok
      of "abstract":                                  dartAbstractTok
      of "as":                                        dartAsTok
      of "async":                                     dartAsyncTok
      of "async*":                                    dartAsyncAsteriskTok
      of "await":                                     dartAwaitTok
      of "bool":                                      dartBoolTok
      of "case_builtin":                              dartCaseBuiltin
      of "catch":                                     dartCatchTok
      of "class":                                     dartClassTok
      of "comment":                                   dartComment
      of "const_builtin":                             dartConstBuiltin
      of "continue":                                  dartContinueTok
      of "covariant":                                 dartCovariantTok
      of "decimal_floating_point_literal":            dartDecimalFloatingPointLiteral
      of "decimal_integer_literal":                   dartDecimalIntegerLiteral
      of "default":                                   dartDefaultTok
      of "deferred":                                  dartDeferredTok
      of "do":                                        dartDoTok
      of "documentation_comment":                     dartDocumentationComment
      of "dynamic":                                   dartDynamicTok
      of "else":                                      dartElseTok
      of "enum":                                      dartEnumTok
      of "equality_operator":                         dartEqualityOperator
      of "export":                                    dartExportTok
      of "extends":                                   dartExtendsTok
      of "extension":                                 dartExtensionTok
      of "external":                                  dartExternalTok
      of "factory":                                   dartFactoryTok
      of "final_builtin":                             dartFinalBuiltin
      of "finally":                                   dartFinallyTok
      of "for":                                       dartForTok
      of "get":                                       dartGetTok
      of "hex_integer_literal":                       dartHexIntegerLiteral
      of "hide":                                      dartHideTok
      of "identifier_dollar_escaped":                 dartIdentifierDollarEscaped
      of "if":                                        dartIfTok
      of "implements":                                dartImplementsTok
      of "import":                                    dartImportTok
      of "in":                                        dartInTok
      of "increment_operator":                        dartIncrementOperator
      of "interface":                                 dartInterfaceTok
      of "is":                                        dartIsTok
      of "late":                                      dartLateTok
      of "library":                                   dartLibraryTok
      of "minus_operator":                            dartMinusOperator
      of "mixin":                                     dartMixinTok
      of "native":                                    dartNativeTok
      of "new":                                       dartNewTok
      of "null":                                      dartNullTok
      of "of":                                        dartOfTok
      of "on":                                        dartOnTok
      of "operator":                                  dartOperatorTok
      of "part":                                      dartPartTok
      of "r\"":                                       dartRQuoteTok
      of "r\"\"\"":                                   dartRTripleQuoteTok
      of "r\'":                                       dartRApostropheTok
      of "r\'\'\'":                                   dartRTripleApostropheTok
      of "required":                                  dartRequiredTok
      of "return":                                    dartReturnTok
      of "set":                                       dartSetTok
      of "show":                                      dartShowTok
      of "static":                                    dartStaticTok
      of "switch":                                    dartSwitchTok
      of "sync*":                                     dartSyncAsteriskTok
      of "throw":                                     dartThrowTok
      of "transitive":                                dartTransitiveTok
      of "try":                                       dartTryTok
      of "type_identifier":                           dartTypeIdentifier
      of "typedef":                                   dartTypedefTok
      of "var":                                       dartVarTok
      of "void_type":                                 dartVoidType
      of "while":                                     dartWhileTok
      of "with":                                      dartWithTok
      of "yield":                                     dartYieldTok
      of "{":                                         dartLCurlyTok
      of "|":                                         dartPipeTok
      of "||":                                        dartDoublePipeTok
      of "}":                                         dartRCurlyTok
      of "~":                                         dartTildeTok
      of "~/":                                        dartTildeSlashTok
      of "ERROR":                                     dartSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsDartNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsDartNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsDartNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_dart(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsDartNode): string =
  $ts_node_type(TSNode(node))

proc newTsDartParser*(): DartParser =
  result = DartParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_dart())

proc parseString*(parser: DartParser, str: string): TsDartNode =
  TsDartNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsDartString*(str: string): TsDartNode =
  let parser = newTsDartParser()
  return parseString(parser, str)

func `$`*(node: TsDartNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsDartNode,
    idx:  int,
    kind: DartNodeKind | set[DartNodeKind]
  ): TsDartNode =
  assert 0 <= idx and idx < node.len
  result = TsDartNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  DartNode* = HtsNode[TsDartNode, DartNodeKind]


proc treeReprTsDart*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsDartNode, DartNodeKind](parseTsDartString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsDartNode,
    str:  ptr string
  ): HtsNode[TsDartNode, DartNodeKind] =
  toHtsNode[TsDartNode, DartNodeKind](node, str)

proc toHtsTree*(node: TsDartNode, str: ptr string): DartNode =
  toHtsNode[TsDartNode, DartNodeKind](node, str)

proc parseDartString*(str: ptr string, unnamed: bool = false): DartNode =
  let parser = newTsDartParser()
  return toHtsTree[TsDartNode, DartNodeKind](parseString(parser, str[]), str)

proc parseDartString*(str: string, unnamed: bool = false): DartNode =
  let parser = newTsDartParser()
  return toHtsTree[TsDartNode, DartNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


