import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  DartNodeKind* = enum
    dartHidDeclaration                          ## _declaration
    dartHidLiteral                              ## _literal
    dartHidStatement                            ## _statement
    dartAdditiveExpression                      ## additive_expression
    dartAdditiveOperator                        ## additive_operator
    dartAnnotation                              ## annotation
    dartArgument                                ## argument
    dartArgumentPart                            ## argument_part
    dartArguments                               ## arguments
    dartAsOperator                              ## as_operator
    dartAssertStatement                         ## assert_statement
    dartAssertion                               ## assertion
    dartAssignableExpression                    ## assignable_expression
    dartAssignmentExpression                    ## assignment_expression
    dartAssignmentExpressionWithoutCascade      ## assignment_expression_without_cascade
    dartAwaitExpression                         ## await_expression
    dartBinaryOperator                          ## binary_operator
    dartBitwiseAndExpression                    ## bitwise_and_expression
    dartBitwiseOperator                         ## bitwise_operator
    dartBitwiseOrExpression                     ## bitwise_or_expression
    dartBitwiseXorExpression                    ## bitwise_xor_expression
    dartBlock                                   ## block
    dartBreakStatement                          ## break_statement
    dartCascadeSection                          ## cascade_section
    dartCascadeSelector                         ## cascade_selector
    dartCatchClause                             ## catch_clause
    dartClassBody                               ## class_body
    dartClassDefinition                         ## class_definition
    dartCombinator                              ## combinator
    dartConditionalAssignableSelector           ## conditional_assignable_selector
    dartConditionalExpression                   ## conditional_expression
    dartConfigurableUri                         ## configurable_uri
    dartConfigurationUri                        ## configuration_uri
    dartConstObjectExpression                   ## const_object_expression
    dartConstantConstructorSignature            ## constant_constructor_signature
    dartConstructorInvocation                   ## constructor_invocation
    dartConstructorParam                        ## constructor_param
    dartConstructorSignature                    ## constructor_signature
    dartContinueStatement                       ## continue_statement
    dartDeclaration                             ## declaration
    dartDimensions                              ## dimensions
    dartDoStatement                             ## do_statement
    dartDottedIdentifierList                    ## dotted_identifier_list
    dartEnumBody                                ## enum_body
    dartEnumConstant                            ## enum_constant
    dartEnumDeclaration                         ## enum_declaration
    dartEqualityExpression                      ## equality_expression
    dartEscapeSequence                          ## escape_sequence
    dartExplicitConstructorInvocation           ## explicit_constructor_invocation
    dartExpressionStatement                     ## expression_statement
    dartExtensionBody                           ## extension_body
    dartExtensionDeclaration                    ## extension_declaration
    dartFactoryConstructorSignature             ## factory_constructor_signature
    dartFalse                                   ## false
    dartFieldInitializer                        ## field_initializer
    dartFinallyClause                           ## finally_clause
    dartForElement                              ## for_element
    dartForStatement                            ## for_statement
    dartFormalParameter                         ## formal_parameter
    dartFormalParameterList                     ## formal_parameter_list
    dartFunctionBody                            ## function_body
    dartFunctionExpression                      ## function_expression
    dartFunctionExpressionBody                  ## function_expression_body
    dartFunctionSignature                       ## function_signature
    dartFunctionType                            ## function_type
    dartGetterSignature                         ## getter_signature
    dartIdentifier                              ## identifier
    dartIfElement                               ## if_element
    dartIfNullExpression                        ## if_null_expression
    dartIfStatement                             ## if_statement
    dartImportOrExport                          ## import_or_export
    dartImportSpecification                     ## import_specification
    dartInferredType                            ## inferred_type
    dartInitializedIdentifier                   ## initialized_identifier
    dartInitializedIdentifierList               ## initialized_identifier_list
    dartInitializedVariableDefinition           ## initialized_variable_definition
    dartInitializerListEntry                    ## initializer_list_entry
    dartInitializers                            ## initializers
    dartInterfaces                              ## interfaces
    dartIsOperator                              ## is_operator
    dartLabel                                   ## label
    dartLabeledStatement                        ## labeled_statement
    dartLambdaExpression                        ## lambda_expression
    dartLibraryExport                           ## library_export
    dartLibraryImport                           ## library_import
    dartLibraryName                             ## library_name
    dartListLiteral                             ## list_literal
    dartLocalVariableDeclaration                ## local_variable_declaration
    dartLogicalAndExpression                    ## logical_and_expression
    dartLogicalOrExpression                     ## logical_or_expression
    dartMarkerAnnotation                        ## marker_annotation
    dartMethodSignature                         ## method_signature
    dartMixinApplication                        ## mixin_application
    dartMixinApplicationClass                   ## mixin_application_class
    dartMixinDeclaration                        ## mixin_declaration
    dartMixins                                  ## mixins
    dartModuleName                              ## module_name
    dartMultiplicativeExpression                ## multiplicative_expression
    dartMultiplicativeOperator                  ## multiplicative_operator
    dartNamedArgument                           ## named_argument
    dartNamedParameterTypes                     ## named_parameter_types
    dartNegationOperator                        ## negation_operator
    dartNewExpression                           ## new_expression
    dartNormalParameterType                     ## normal_parameter_type
    dartNullLiteral                             ## null_literal
    dartOperatorSignature                       ## operator_signature
    dartOptionalFormalParameters                ## optional_formal_parameters
    dartOptionalParameterTypes                  ## optional_parameter_types
    dartOptionalPositionalParameterTypes        ## optional_positional_parameter_types
    dartPair                                    ## pair
    dartParameterTypeList                       ## parameter_type_list
    dartParenthesizedExpression                 ## parenthesized_expression
    dartPartDirective                           ## part_directive
    dartPartOfDirective                         ## part_of_directive
    dartPostfixExpression                       ## postfix_expression
    dartPostfixOperator                         ## postfix_operator
    dartPrefixOperator                          ## prefix_operator
    dartProgram                                 ## program
    dartQualified                               ## qualified
    dartRedirectingFactoryConstructorSignature  ## redirecting_factory_constructor_signature
    dartRedirection                             ## redirection
    dartRelationalExpression                    ## relational_expression
    dartRelationalOperator                      ## relational_operator
    dartReturnStatement                         ## return_statement
    dartScopedIdentifier                        ## scoped_identifier
    dartScriptTag                               ## script_tag
    dartSelector                                ## selector
    dartSetOrMapLiteral                         ## set_or_map_literal
    dartSetterSignature                         ## setter_signature
    dartShiftExpression                         ## shift_expression
    dartShiftOperator                           ## shift_operator
    dartSpreadElement                           ## spread_element
    dartStaticFinalDeclaration                  ## static_final_declaration
    dartStaticFinalDeclarationList              ## static_final_declaration_list
    dartStringLiteral                           ## string_literal
    dartSuper                                   ## super
    dartSuperclass                              ## superclass
    dartSwitchBlock                             ## switch_block
    dartSwitchLabel                             ## switch_label
    dartSwitchStatement                         ## switch_statement
    dartSymbolLiteral                           ## symbol_literal
    dartTemplateSubstitution                    ## template_substitution
    dartThis                                    ## this
    dartThrowExpression                         ## throw_expression
    dartThrowExpressionWithoutCascade           ## throw_expression_without_cascade
    dartThrows                                  ## throws
    dartTildeOperator                           ## tilde_operator
    dartTrue                                    ## true
    dartTryStatement                            ## try_statement
    dartTypeAlias                               ## type_alias
    dartTypeArguments                           ## type_arguments
    dartTypeBound                               ## type_bound
    dartTypeCast                                ## type_cast
    dartTypeCastExpression                      ## type_cast_expression
    dartTypeParameter                           ## type_parameter
    dartTypeParameters                          ## type_parameters
    dartTypeTest                                ## type_test
    dartTypeTestExpression                      ## type_test_expression
    dartTypedIdentifier                         ## typed_identifier
    dartUnaryExpression                         ## unary_expression
    dartUnconditionalAssignableSelector         ## unconditional_assignable_selector
    dartUri                                     ## uri
    dartUriTest                                 ## uri_test
    dartWhileStatement                          ## while_statement
    dartYieldEachStatement                      ## yield_each_statement
    dartYieldStatement                          ## yield_statement
    dartNewlineTok                              ##
                                                ##
    dartQuoteTok                                ## "
    dartTripleQuoteTok                          ## """
    dartHashTok                                 ## #
    dartHashExclamationTok                      ## #!
    dartDollarTok                               ## $
    dartPercentTok                              ## %
    dartAmpersandTok                            ## &
    dartDoubleAmpersandTok                      ## &&
    dartApostropheTok                           ## '
    dartTripleApostropheTok                     ## '''
    dartLParTok                                 ## (
    dartRParTok                                 ## )
    dartAsteriskTok                             ## *
    dartCommaTok                                ## ,
    dartDotTok                                  ## .
    dartDoubleDotTok                            ## ..
    dartTripleDotTok                            ## ...
    dartSlashTok                                ## /
    dartColonTok                                ## :
    dartSemicolonTok                            ## ;
    dartLessThanTok                             ## <
    dartDoubleLessThanTok                       ## <<
    dartLessThanEqualTok                        ## <=
    dartEqualTok                                ## =
    dartDoubleEqualTok                          ## ==
    dartEqualGreaterThanTok                     ## =>
    dartGreaterThanTok                          ## >
    dartGreaterThanEqualTok                     ## >=
    dartDoubleGreaterThanTok                    ## >>
    dartTripleGreaterThanTok                    ## >>>
    dartQuestionTok                             ## ?
    dartQuestionDotTok                          ## ?.
    dartDoubleQuestionTok                       ## ??
    dartAtTok                                   ## @
    dartFunctionTok                             ## Function
    dartLBrackTok                               ## [
    dartLBrackRBrackTok                         ## []
    dartLBrackRBrackEqualTok                    ## []=
    dartRBrackTok                               ## ]
    dartAccentTok                               ## ^
    dartAbstractTok                             ## abstract
    dartAsTok                                   ## as
    dartAsyncTok                                ## async
    dartAsyncAsteriskTok                        ## async*
    dartAwaitTok                                ## await
    dartBoolTok                                 ## bool
    dartCaseBuiltin                             ## case_builtin
    dartCatchTok                                ## catch
    dartClassTok                                ## class
    dartComment                                 ## comment
    dartConstBuiltin                            ## const_builtin
    dartContinueTok                             ## continue
    dartCovariantTok                            ## covariant
    dartDecimalFloatingPointLiteral             ## decimal_floating_point_literal
    dartDecimalIntegerLiteral                   ## decimal_integer_literal
    dartDefaultTok                              ## default
    dartDeferredTok                             ## deferred
    dartDoTok                                   ## do
    dartDocumentationComment                    ## documentation_comment
    dartDynamicTok                              ## dynamic
    dartElseTok                                 ## else
    dartEnumTok                                 ## enum
    dartEqualityOperator                        ## equality_operator
    dartExportTok                               ## export
    dartExtendsTok                              ## extends
    dartExtensionTok                            ## extension
    dartExternalTok                             ## external
    dartFactoryTok                              ## factory
    dartFalseTok                                ## false
    dartFinalBuiltin                            ## final_builtin
    dartFinallyTok                              ## finally
    dartForTok                                  ## for
    dartGetTok                                  ## get
    dartHexIntegerLiteral                       ## hex_integer_literal
    dartHideTok                                 ## hide
    dartIdentifierDollarEscaped                 ## identifier_dollar_escaped
    dartIfTok                                   ## if
    dartImplementsTok                           ## implements
    dartImportTok                               ## import
    dartInTok                                   ## in
    dartIncrementOperator                       ## increment_operator
    dartInterfaceTok                            ## interface
    dartIsTok                                   ## is
    dartLateTok                                 ## late
    dartLibraryTok                              ## library
    dartMinusOperator                           ## minus_operator
    dartMixinTok                                ## mixin
    dartNativeTok                               ## native
    dartNewTok                                  ## new
    dartNullTok                                 ## null
    dartOfTok                                   ## of
    dartOnTok                                   ## on
    dartOperatorTok                             ## operator
    dartPartTok                                 ## part
    dartRQuoteTok                               ## r"
    dartRTripleQuoteTok                         ## r"""
    dartRApostropheTok                          ## r'
    dartRTripleApostropheTok                    ## r'''
    dartRequiredTok                             ## required
    dartReturnTok                               ## return
    dartSetTok                                  ## set
    dartShowTok                                 ## show
    dartStaticTok                               ## static
    dartSuperTok                                ## super
    dartSwitchTok                               ## switch
    dartSyncAsteriskTok                         ## sync*
    dartThisTok                                 ## this
    dartThrowTok                                ## throw
    dartThrowsTok                               ## throws
    dartTransitiveTok                           ## transitive
    dartTrueTok                                 ## true
    dartTryTok                                  ## try
    dartTypeIdentifier                          ## type_identifier
    dartTypedefTok                              ## typedef
    dartVarTok                                  ## var
    dartVoidType                                ## void_type
    dartWhileTok                                ## while
    dartWithTok                                 ## with
    dartYieldTok                                ## yield
    dartLCurlyTok                               ## {
    dartPipeTok                                 ## |
    dartDoublePipeTok                           ## ||
    dartRCurlyTok                               ## }
    dartTildeTok                                ## ~
    dartTildeSlashTok                           ## ~/
    dartHidClassMemberDefinition                ## _class_member_definition
    dartHidAssignmentOperator                   ## _assignment_operator
    dartHidIdentifierList                       ## _identifier_list
    dartInferredParameters                      ## inferred_parameters
    dartHidBreakBuiltin                         ## _break_builtin
    dartHidFactory                              ## _factory
    dartAsterisk                                ## asterisk
    dartHidExternal                             ## _external
    dartHidWildcardBounds                       ## _wildcard_bounds
    dartPositionalParameters                    ## positional_parameters
    dartHidFunctionTypeTail                     ## _function_type_tail
    dartConstructorBody                         ## constructor_body
    dartHidFinalConstVarOrType                  ## _final_const_var_or_type
    dartHidImplements                           ## _implements
    dartHidExpression                           ## _expression
    dartHidExternalBuiltin                      ## _external_builtin
    dartHidStringLiteralDoubleQuotesMultiple    ## _string_literal_double_quotes_multiple
    dartHidFunctionTypeTails                    ## _function_type_tails
    dartHidAssignableSelector                   ## _assignable_selector
    dartHidFormalParameterPart                  ## _formal_parameter_part
    dartHidPart                                 ## _part
    dartHidTypeDotIdentifier                    ## _type_dot_identifier
    dartHidStaticOrCovariant                    ## _static_or_covariant
    dartHidDynamic                              ## _dynamic
    dartHidDefaultFormalParameter               ## _default_formal_parameter
    dartHidOperator                             ## _operator
    dartHidElement                              ## _element
    dartWildcard                                ## wildcard
    dartThrowStatement                          ## throw_statement
    dartHidMetadata                             ## _metadata
    dartHidRawStringLiteralDoubleQuotesMultiple ## _raw_string_literal_double_quotes_multiple
    dartHidCovariant                            ## _covariant
    dartHidUnaryExpression                      ## _unary_expression
    dartHidBitwiseOperator                      ## _bitwise_operator
    dartHidMixin                                ## _mixin
    dartFloatingPointType                       ## floating_point_type
    dartHidTryHead                              ## _try_head
    dartReceiverParameter                       ## receiver_parameter
    dartHidAdditiveOperator                     ## _additive_operator
    dartHidInterface                            ## _interface
    dartHidSubStringTest                        ## _sub_string_test
    dartHidOnPart                               ## _on_part
    dartHidTemplateCharsRawSlash                ## _template_chars_raw_slash
    dartHidCompoundAccess                       ## _compound_access
    dartHidStringLiteralDoubleQuotes            ## _string_literal_double_quotes
    dartHidExternalAndStatic                    ## _external_and_static
    dartHidTemplateCharsSingle                  ## _template_chars_single
    dartHidTripleQuoteEnd                       ## _triple_quote_end
    dartHidNamedFormalParameters                ## _named_formal_parameters
    dartHidForLoopParts                         ## _for_loop_parts
    dartHidTypeNotVoidNotFunction               ## _type_not_void_not_function
    dartHidLibrary                              ## _library
    dartCatchType                               ## catch_type
    dartHidIfNullExpression                     ## _if_null_expression
    dartHidTemplateCharsSingleSingle            ## _template_chars_single_single
    dartHidTypeName                             ## _type_name
    dartHidAs                                   ## _as
    dartHidCascadeAssignmentSection             ## _cascade_assignment_section
    dartHidTypedef                              ## _typedef
    dartHidRawStringLiteralDoubleQuotes         ## _raw_string_literal_double_quotes
    dartHidCascadeSubsection                    ## _cascade_subsection
    dartHidNormalFormalParameter                ## _normal_formal_parameter
    dartHidStringLiteralSingleQuotes            ## _string_literal_single_quotes
    dartHidDefaultNamedParameter                ## _default_named_parameter
    dartBooleanType                             ## boolean_type
    dartHidExport                               ## _export
    dartHidTypeNotVoid                          ## _type_not_void
    dartHidType                                 ## _type
    dartHidDeferred                             ## _deferred
    dartHidRawStringLiteralSingleQuotesMultiple ## _raw_string_literal_single_quotes_multiple
    dartHidRealExpression                       ## _real_expression
    dartHidFinalOrConst                         ## _final_or_const
    dartHidMethodDeclarator                     ## _method_declarator
    dartHidTripleDoubleQuoteEnd                 ## _triple_double_quote_end
    dartHidAssertBuiltin                        ## _assert_builtin
    dartHidExpressionWithoutCascade             ## _expression_without_cascade
    dartHidNormalFormalParameters               ## _normal_formal_parameters
    dartHidAmbiguousName                        ## _ambiguous_name
    dartHidStringInterp                         ## _string_interp
    dartHidDeclaredIdentifier                   ## _declared_identifier
    dartHidAssignableSelectorPart               ## _assignable_selector_part
    dartHidExclamationOperator                  ## _exclamation_operator
    dartHidGet                                  ## _get
    dartHidTypeNotFunction                      ## _type_not_function
    dartHidSemicolon                            ## _semicolon
    dartHidTemplateCharsDoubleSingle            ## _template_chars_double_single
    dartHidDotIdentifier                        ## _dot_identifier
    dartHidFunctionFormalParameter              ## _function_formal_parameter
    dartHidImport                               ## _import
    dartHidNullableType                         ## _nullable_type
    dartInterfaceTypeList                       ## interface_type_list
    dartHidTopLevelDefinition                   ## _top_level_definition
    dartHidAnnotation                           ## _annotation
    dartHidShiftOperator                        ## _shift_operator
    dartHidTemplateCharsDouble                  ## _template_chars_double
    dartHidArgumentList                         ## _argument_list
    dartHidSet                                  ## _set
    dartHidNative                               ## _native
    dartRequiresModifier                        ## requires_modifier
    dartHidStringLiteralSingleQuotesMultiple    ## _string_literal_single_quotes_multiple
    dartStaticInitializer                       ## static_initializer
    dartHidSimpleFormalParameter                ## _simple_formal_parameter
    dartHidOptionalPostionalFormalParameters    ## _optional_postional_formal_parameters
    dartHidLateBuiltin                          ## _late_builtin
    dartHidStatic                               ## _static
    dartSpreadParameter                         ## spread_parameter
    dartHidPrimary                              ## _primary
    dartHidTypeNotVoidList                      ## _type_not_void_list
    dartHidFunctionBuiltinIdentifier            ## _function_builtin_identifier
    dartHidStrictFormalParameterList            ## _strict_formal_parameter_list
    dartHidNewBuiltin                           ## _new_builtin
    dartHidMethodHeader                         ## _method_header
    dartHidRawStringLiteralSingleQuotes         ## _raw_string_literal_single_quotes
    dartHidAutomaticSemicolon                   ## _automatic_semicolon
    dartHidPostfixExpression                    ## _postfix_expression
    dartHidUnusedEscapeSequence                 ## _unused_escape_sequence
    dartVariableDeclaration                     ## variable_declaration
    dartHidMultiplicativeOperator               ## _multiplicative_operator
    dartSyntaxError                             ## Tree-sitter parser syntax error

proc strRepr*(kind: DartNodeKind): string =
  case kind:
    of dartHidDeclaration:                          "_declaration"
    of dartHidLiteral:                              "_literal"
    of dartHidStatement:                            "_statement"
    of dartAdditiveExpression:                      "additive_expression"
    of dartAdditiveOperator:                        "additive_operator"
    of dartAnnotation:                              "annotation"
    of dartArgument:                                "argument"
    of dartArgumentPart:                            "argument_part"
    of dartArguments:                               "arguments"
    of dartAsOperator:                              "as_operator"
    of dartAssertStatement:                         "assert_statement"
    of dartAssertion:                               "assertion"
    of dartAssignableExpression:                    "assignable_expression"
    of dartAssignmentExpression:                    "assignment_expression"
    of dartAssignmentExpressionWithoutCascade:      "assignment_expression_without_cascade"
    of dartAwaitExpression:                         "await_expression"
    of dartBinaryOperator:                          "binary_operator"
    of dartBitwiseAndExpression:                    "bitwise_and_expression"
    of dartBitwiseOperator:                         "bitwise_operator"
    of dartBitwiseOrExpression:                     "bitwise_or_expression"
    of dartBitwiseXorExpression:                    "bitwise_xor_expression"
    of dartBlock:                                   "block"
    of dartBreakStatement:                          "break_statement"
    of dartCascadeSection:                          "cascade_section"
    of dartCascadeSelector:                         "cascade_selector"
    of dartCatchClause:                             "catch_clause"
    of dartClassBody:                               "class_body"
    of dartClassDefinition:                         "class_definition"
    of dartCombinator:                              "combinator"
    of dartConditionalAssignableSelector:           "conditional_assignable_selector"
    of dartConditionalExpression:                   "conditional_expression"
    of dartConfigurableUri:                         "configurable_uri"
    of dartConfigurationUri:                        "configuration_uri"
    of dartConstObjectExpression:                   "const_object_expression"
    of dartConstantConstructorSignature:            "constant_constructor_signature"
    of dartConstructorInvocation:                   "constructor_invocation"
    of dartConstructorParam:                        "constructor_param"
    of dartConstructorSignature:                    "constructor_signature"
    of dartContinueStatement:                       "continue_statement"
    of dartDeclaration:                             "declaration"
    of dartDimensions:                              "dimensions"
    of dartDoStatement:                             "do_statement"
    of dartDottedIdentifierList:                    "dotted_identifier_list"
    of dartEnumBody:                                "enum_body"
    of dartEnumConstant:                            "enum_constant"
    of dartEnumDeclaration:                         "enum_declaration"
    of dartEqualityExpression:                      "equality_expression"
    of dartEscapeSequence:                          "escape_sequence"
    of dartExplicitConstructorInvocation:           "explicit_constructor_invocation"
    of dartExpressionStatement:                     "expression_statement"
    of dartExtensionBody:                           "extension_body"
    of dartExtensionDeclaration:                    "extension_declaration"
    of dartFactoryConstructorSignature:             "factory_constructor_signature"
    of dartFalse:                                   "false"
    of dartFieldInitializer:                        "field_initializer"
    of dartFinallyClause:                           "finally_clause"
    of dartForElement:                              "for_element"
    of dartForStatement:                            "for_statement"
    of dartFormalParameter:                         "formal_parameter"
    of dartFormalParameterList:                     "formal_parameter_list"
    of dartFunctionBody:                            "function_body"
    of dartFunctionExpression:                      "function_expression"
    of dartFunctionExpressionBody:                  "function_expression_body"
    of dartFunctionSignature:                       "function_signature"
    of dartFunctionType:                            "function_type"
    of dartGetterSignature:                         "getter_signature"
    of dartIdentifier:                              "identifier"
    of dartIfElement:                               "if_element"
    of dartIfNullExpression:                        "if_null_expression"
    of dartIfStatement:                             "if_statement"
    of dartImportOrExport:                          "import_or_export"
    of dartImportSpecification:                     "import_specification"
    of dartInferredType:                            "inferred_type"
    of dartInitializedIdentifier:                   "initialized_identifier"
    of dartInitializedIdentifierList:               "initialized_identifier_list"
    of dartInitializedVariableDefinition:           "initialized_variable_definition"
    of dartInitializerListEntry:                    "initializer_list_entry"
    of dartInitializers:                            "initializers"
    of dartInterfaces:                              "interfaces"
    of dartIsOperator:                              "is_operator"
    of dartLabel:                                   "label"
    of dartLabeledStatement:                        "labeled_statement"
    of dartLambdaExpression:                        "lambda_expression"
    of dartLibraryExport:                           "library_export"
    of dartLibraryImport:                           "library_import"
    of dartLibraryName:                             "library_name"
    of dartListLiteral:                             "list_literal"
    of dartLocalVariableDeclaration:                "local_variable_declaration"
    of dartLogicalAndExpression:                    "logical_and_expression"
    of dartLogicalOrExpression:                     "logical_or_expression"
    of dartMarkerAnnotation:                        "marker_annotation"
    of dartMethodSignature:                         "method_signature"
    of dartMixinApplication:                        "mixin_application"
    of dartMixinApplicationClass:                   "mixin_application_class"
    of dartMixinDeclaration:                        "mixin_declaration"
    of dartMixins:                                  "mixins"
    of dartModuleName:                              "module_name"
    of dartMultiplicativeExpression:                "multiplicative_expression"
    of dartMultiplicativeOperator:                  "multiplicative_operator"
    of dartNamedArgument:                           "named_argument"
    of dartNamedParameterTypes:                     "named_parameter_types"
    of dartNegationOperator:                        "negation_operator"
    of dartNewExpression:                           "new_expression"
    of dartNormalParameterType:                     "normal_parameter_type"
    of dartNullLiteral:                             "null_literal"
    of dartOperatorSignature:                       "operator_signature"
    of dartOptionalFormalParameters:                "optional_formal_parameters"
    of dartOptionalParameterTypes:                  "optional_parameter_types"
    of dartOptionalPositionalParameterTypes:        "optional_positional_parameter_types"
    of dartPair:                                    "pair"
    of dartParameterTypeList:                       "parameter_type_list"
    of dartParenthesizedExpression:                 "parenthesized_expression"
    of dartPartDirective:                           "part_directive"
    of dartPartOfDirective:                         "part_of_directive"
    of dartPostfixExpression:                       "postfix_expression"
    of dartPostfixOperator:                         "postfix_operator"
    of dartPrefixOperator:                          "prefix_operator"
    of dartProgram:                                 "program"
    of dartQualified:                               "qualified"
    of dartRedirectingFactoryConstructorSignature:  "redirecting_factory_constructor_signature"
    of dartRedirection:                             "redirection"
    of dartRelationalExpression:                    "relational_expression"
    of dartRelationalOperator:                      "relational_operator"
    of dartReturnStatement:                         "return_statement"
    of dartScopedIdentifier:                        "scoped_identifier"
    of dartScriptTag:                               "script_tag"
    of dartSelector:                                "selector"
    of dartSetOrMapLiteral:                         "set_or_map_literal"
    of dartSetterSignature:                         "setter_signature"
    of dartShiftExpression:                         "shift_expression"
    of dartShiftOperator:                           "shift_operator"
    of dartSpreadElement:                           "spread_element"
    of dartStaticFinalDeclaration:                  "static_final_declaration"
    of dartStaticFinalDeclarationList:              "static_final_declaration_list"
    of dartStringLiteral:                           "string_literal"
    of dartSuper:                                   "super"
    of dartSuperclass:                              "superclass"
    of dartSwitchBlock:                             "switch_block"
    of dartSwitchLabel:                             "switch_label"
    of dartSwitchStatement:                         "switch_statement"
    of dartSymbolLiteral:                           "symbol_literal"
    of dartTemplateSubstitution:                    "template_substitution"
    of dartThis:                                    "this"
    of dartThrowExpression:                         "throw_expression"
    of dartThrowExpressionWithoutCascade:           "throw_expression_without_cascade"
    of dartThrows:                                  "throws"
    of dartTildeOperator:                           "tilde_operator"
    of dartTrue:                                    "true"
    of dartTryStatement:                            "try_statement"
    of dartTypeAlias:                               "type_alias"
    of dartTypeArguments:                           "type_arguments"
    of dartTypeBound:                               "type_bound"
    of dartTypeCast:                                "type_cast"
    of dartTypeCastExpression:                      "type_cast_expression"
    of dartTypeParameter:                           "type_parameter"
    of dartTypeParameters:                          "type_parameters"
    of dartTypeTest:                                "type_test"
    of dartTypeTestExpression:                      "type_test_expression"
    of dartTypedIdentifier:                         "typed_identifier"
    of dartUnaryExpression:                         "unary_expression"
    of dartUnconditionalAssignableSelector:         "unconditional_assignable_selector"
    of dartUri:                                     "uri"
    of dartUriTest:                                 "uri_test"
    of dartWhileStatement:                          "while_statement"
    of dartYieldEachStatement:                      "yield_each_statement"
    of dartYieldStatement:                          "yield_statement"
    of dartNewlineTok:                              "\x0A"
    of dartQuoteTok:                                "\""
    of dartTripleQuoteTok:                          "\"\"\""
    of dartHashTok:                                 "#"
    of dartHashExclamationTok:                      "#!"
    of dartDollarTok:                               "$"
    of dartPercentTok:                              "%"
    of dartAmpersandTok:                            "&"
    of dartDoubleAmpersandTok:                      "&&"
    of dartApostropheTok:                           "\'"
    of dartTripleApostropheTok:                     "\'\'\'"
    of dartLParTok:                                 "("
    of dartRParTok:                                 ")"
    of dartAsteriskTok:                             "*"
    of dartCommaTok:                                ","
    of dartDotTok:                                  "."
    of dartDoubleDotTok:                            ".."
    of dartTripleDotTok:                            "..."
    of dartSlashTok:                                "/"
    of dartColonTok:                                ":"
    of dartSemicolonTok:                            ";"
    of dartLessThanTok:                             "<"
    of dartDoubleLessThanTok:                       "<<"
    of dartLessThanEqualTok:                        "<="
    of dartEqualTok:                                "="
    of dartDoubleEqualTok:                          "=="
    of dartEqualGreaterThanTok:                     "=>"
    of dartGreaterThanTok:                          ">"
    of dartGreaterThanEqualTok:                     ">="
    of dartDoubleGreaterThanTok:                    ">>"
    of dartTripleGreaterThanTok:                    ">>>"
    of dartQuestionTok:                             "?"
    of dartQuestionDotTok:                          "?."
    of dartDoubleQuestionTok:                       "??"
    of dartAtTok:                                   "@"
    of dartFunctionTok:                             "Function"
    of dartLBrackTok:                               "["
    of dartLBrackRBrackTok:                         "[]"
    of dartLBrackRBrackEqualTok:                    "[]="
    of dartRBrackTok:                               "]"
    of dartAccentTok:                               "^"
    of dartAbstractTok:                             "abstract"
    of dartAsTok:                                   "as"
    of dartAsyncTok:                                "async"
    of dartAsyncAsteriskTok:                        "async*"
    of dartAwaitTok:                                "await"
    of dartBoolTok:                                 "bool"
    of dartCaseBuiltin:                             "case_builtin"
    of dartCatchTok:                                "catch"
    of dartClassTok:                                "class"
    of dartComment:                                 "comment"
    of dartConstBuiltin:                            "const_builtin"
    of dartContinueTok:                             "continue"
    of dartCovariantTok:                            "covariant"
    of dartDecimalFloatingPointLiteral:             "decimal_floating_point_literal"
    of dartDecimalIntegerLiteral:                   "decimal_integer_literal"
    of dartDefaultTok:                              "default"
    of dartDeferredTok:                             "deferred"
    of dartDoTok:                                   "do"
    of dartDocumentationComment:                    "documentation_comment"
    of dartDynamicTok:                              "dynamic"
    of dartElseTok:                                 "else"
    of dartEnumTok:                                 "enum"
    of dartEqualityOperator:                        "equality_operator"
    of dartExportTok:                               "export"
    of dartExtendsTok:                              "extends"
    of dartExtensionTok:                            "extension"
    of dartExternalTok:                             "external"
    of dartFactoryTok:                              "factory"
    of dartFalseTok:                                "false"
    of dartFinalBuiltin:                            "final_builtin"
    of dartFinallyTok:                              "finally"
    of dartForTok:                                  "for"
    of dartGetTok:                                  "get"
    of dartHexIntegerLiteral:                       "hex_integer_literal"
    of dartHideTok:                                 "hide"
    of dartIdentifierDollarEscaped:                 "identifier_dollar_escaped"
    of dartIfTok:                                   "if"
    of dartImplementsTok:                           "implements"
    of dartImportTok:                               "import"
    of dartInTok:                                   "in"
    of dartIncrementOperator:                       "increment_operator"
    of dartInterfaceTok:                            "interface"
    of dartIsTok:                                   "is"
    of dartLateTok:                                 "late"
    of dartLibraryTok:                              "library"
    of dartMinusOperator:                           "minus_operator"
    of dartMixinTok:                                "mixin"
    of dartNativeTok:                               "native"
    of dartNewTok:                                  "new"
    of dartNullTok:                                 "null"
    of dartOfTok:                                   "of"
    of dartOnTok:                                   "on"
    of dartOperatorTok:                             "operator"
    of dartPartTok:                                 "part"
    of dartRQuoteTok:                               "r\""
    of dartRTripleQuoteTok:                         "r\"\"\""
    of dartRApostropheTok:                          "r\'"
    of dartRTripleApostropheTok:                    "r\'\'\'"
    of dartRequiredTok:                             "required"
    of dartReturnTok:                               "return"
    of dartSetTok:                                  "set"
    of dartShowTok:                                 "show"
    of dartStaticTok:                               "static"
    of dartSuperTok:                                "super"
    of dartSwitchTok:                               "switch"
    of dartSyncAsteriskTok:                         "sync*"
    of dartThisTok:                                 "this"
    of dartThrowTok:                                "throw"
    of dartThrowsTok:                               "throws"
    of dartTransitiveTok:                           "transitive"
    of dartTrueTok:                                 "true"
    of dartTryTok:                                  "try"
    of dartTypeIdentifier:                          "type_identifier"
    of dartTypedefTok:                              "typedef"
    of dartVarTok:                                  "var"
    of dartVoidType:                                "void_type"
    of dartWhileTok:                                "while"
    of dartWithTok:                                 "with"
    of dartYieldTok:                                "yield"
    of dartLCurlyTok:                               "{"
    of dartPipeTok:                                 "|"
    of dartDoublePipeTok:                           "||"
    of dartRCurlyTok:                               "}"
    of dartTildeTok:                                "~"
    of dartTildeSlashTok:                           "~/"
    of dartHidClassMemberDefinition:                "_class_member_definition"
    of dartHidAssignmentOperator:                   "_assignment_operator"
    of dartHidIdentifierList:                       "_identifier_list"
    of dartInferredParameters:                      "inferred_parameters"
    of dartHidBreakBuiltin:                         "_break_builtin"
    of dartHidFactory:                              "_factory"
    of dartAsterisk:                                "asterisk"
    of dartHidExternal:                             "_external"
    of dartHidWildcardBounds:                       "_wildcard_bounds"
    of dartPositionalParameters:                    "positional_parameters"
    of dartHidFunctionTypeTail:                     "_function_type_tail"
    of dartConstructorBody:                         "constructor_body"
    of dartHidFinalConstVarOrType:                  "_final_const_var_or_type"
    of dartHidImplements:                           "_implements"
    of dartHidExpression:                           "_expression"
    of dartHidExternalBuiltin:                      "_external_builtin"
    of dartHidStringLiteralDoubleQuotesMultiple:    "_string_literal_double_quotes_multiple"
    of dartHidFunctionTypeTails:                    "_function_type_tails"
    of dartHidAssignableSelector:                   "_assignable_selector"
    of dartHidFormalParameterPart:                  "_formal_parameter_part"
    of dartHidPart:                                 "_part"
    of dartHidTypeDotIdentifier:                    "_type_dot_identifier"
    of dartHidStaticOrCovariant:                    "_static_or_covariant"
    of dartHidDynamic:                              "_dynamic"
    of dartHidDefaultFormalParameter:               "_default_formal_parameter"
    of dartHidOperator:                             "_operator"
    of dartHidElement:                              "_element"
    of dartWildcard:                                "wildcard"
    of dartThrowStatement:                          "throw_statement"
    of dartHidMetadata:                             "_metadata"
    of dartHidRawStringLiteralDoubleQuotesMultiple: "_raw_string_literal_double_quotes_multiple"
    of dartHidCovariant:                            "_covariant"
    of dartHidUnaryExpression:                      "_unary_expression"
    of dartHidBitwiseOperator:                      "_bitwise_operator"
    of dartHidMixin:                                "_mixin"
    of dartFloatingPointType:                       "floating_point_type"
    of dartHidTryHead:                              "_try_head"
    of dartReceiverParameter:                       "receiver_parameter"
    of dartHidAdditiveOperator:                     "_additive_operator"
    of dartHidInterface:                            "_interface"
    of dartHidSubStringTest:                        "_sub_string_test"
    of dartHidOnPart:                               "_on_part"
    of dartHidTemplateCharsRawSlash:                "_template_chars_raw_slash"
    of dartHidCompoundAccess:                       "_compound_access"
    of dartHidStringLiteralDoubleQuotes:            "_string_literal_double_quotes"
    of dartHidExternalAndStatic:                    "_external_and_static"
    of dartHidTemplateCharsSingle:                  "_template_chars_single"
    of dartHidTripleQuoteEnd:                       "_triple_quote_end"
    of dartHidNamedFormalParameters:                "_named_formal_parameters"
    of dartHidForLoopParts:                         "_for_loop_parts"
    of dartHidTypeNotVoidNotFunction:               "_type_not_void_not_function"
    of dartHidLibrary:                              "_library"
    of dartCatchType:                               "catch_type"
    of dartHidIfNullExpression:                     "_if_null_expression"
    of dartHidTemplateCharsSingleSingle:            "_template_chars_single_single"
    of dartHidTypeName:                             "_type_name"
    of dartHidAs:                                   "_as"
    of dartHidCascadeAssignmentSection:             "_cascade_assignment_section"
    of dartHidTypedef:                              "_typedef"
    of dartHidRawStringLiteralDoubleQuotes:         "_raw_string_literal_double_quotes"
    of dartHidCascadeSubsection:                    "_cascade_subsection"
    of dartHidNormalFormalParameter:                "_normal_formal_parameter"
    of dartHidStringLiteralSingleQuotes:            "_string_literal_single_quotes"
    of dartHidDefaultNamedParameter:                "_default_named_parameter"
    of dartBooleanType:                             "boolean_type"
    of dartHidExport:                               "_export"
    of dartHidTypeNotVoid:                          "_type_not_void"
    of dartHidType:                                 "_type"
    of dartHidDeferred:                             "_deferred"
    of dartHidRawStringLiteralSingleQuotesMultiple: "_raw_string_literal_single_quotes_multiple"
    of dartHidRealExpression:                       "_real_expression"
    of dartHidFinalOrConst:                         "_final_or_const"
    of dartHidMethodDeclarator:                     "_method_declarator"
    of dartHidTripleDoubleQuoteEnd:                 "_triple_double_quote_end"
    of dartHidAssertBuiltin:                        "_assert_builtin"
    of dartHidExpressionWithoutCascade:             "_expression_without_cascade"
    of dartHidNormalFormalParameters:               "_normal_formal_parameters"
    of dartHidAmbiguousName:                        "_ambiguous_name"
    of dartHidStringInterp:                         "_string_interp"
    of dartHidDeclaredIdentifier:                   "_declared_identifier"
    of dartHidAssignableSelectorPart:               "_assignable_selector_part"
    of dartHidExclamationOperator:                  "_exclamation_operator"
    of dartHidGet:                                  "_get"
    of dartHidTypeNotFunction:                      "_type_not_function"
    of dartHidSemicolon:                            "_semicolon"
    of dartHidTemplateCharsDoubleSingle:            "_template_chars_double_single"
    of dartHidDotIdentifier:                        "_dot_identifier"
    of dartHidFunctionFormalParameter:              "_function_formal_parameter"
    of dartHidImport:                               "_import"
    of dartHidNullableType:                         "_nullable_type"
    of dartInterfaceTypeList:                       "interface_type_list"
    of dartHidTopLevelDefinition:                   "_top_level_definition"
    of dartHidAnnotation:                           "_annotation"
    of dartHidShiftOperator:                        "_shift_operator"
    of dartHidTemplateCharsDouble:                  "_template_chars_double"
    of dartHidArgumentList:                         "_argument_list"
    of dartHidSet:                                  "_set"
    of dartHidNative:                               "_native"
    of dartRequiresModifier:                        "requires_modifier"
    of dartHidStringLiteralSingleQuotesMultiple:    "_string_literal_single_quotes_multiple"
    of dartStaticInitializer:                       "static_initializer"
    of dartHidSimpleFormalParameter:                "_simple_formal_parameter"
    of dartHidOptionalPostionalFormalParameters:    "_optional_postional_formal_parameters"
    of dartHidLateBuiltin:                          "_late_builtin"
    of dartHidStatic:                               "_static"
    of dartSpreadParameter:                         "spread_parameter"
    of dartHidPrimary:                              "_primary"
    of dartHidTypeNotVoidList:                      "_type_not_void_list"
    of dartHidFunctionBuiltinIdentifier:            "_function_builtin_identifier"
    of dartHidStrictFormalParameterList:            "_strict_formal_parameter_list"
    of dartHidNewBuiltin:                           "_new_builtin"
    of dartHidMethodHeader:                         "_method_header"
    of dartHidRawStringLiteralSingleQuotes:         "_raw_string_literal_single_quotes"
    of dartHidAutomaticSemicolon:                   "_automatic_semicolon"
    of dartHidPostfixExpression:                    "_postfix_expression"
    of dartHidUnusedEscapeSequence:                 "_unused_escape_sequence"
    of dartVariableDeclaration:                     "variable_declaration"
    of dartHidMultiplicativeOperator:               "_multiplicative_operator"
    of dartSyntaxError:                             "ERROR"

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
                                                                                                       dartHidLiteral,
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
                                                                                             dartHidLiteral,
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
                                                                                              dartHidLiteral,
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
                                                                                                         dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                         dartHidLiteral,
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
                                                                                                        dartHidLiteral,
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
                                                                                                         dartHidLiteral,
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
                                                                       tmp[dartBlock] = {dartHidStatement}
                                                                       tmp[dartBreakStatement] = {dartIdentifier}
                                                                       tmp[dartCascadeSection] = {
                                                                                                   dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                          dartHidLiteral,
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
                                                                                                       dartHidLiteral,
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
                                                                                                        dartHidLiteral,
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
                                                                                                     dartHidLiteral,
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
                                                                                                 dartHidLiteral,
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
                                                                                                           dartHidLiteral,
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
                                                                                                          dartHidLiteral,
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
                                                                       tmp[dartLabeledStatement] = {dartHidStatement, dartIdentifier}
                                                                       tmp[dartLibraryExport] = {dartAnnotation, dartCombinator, dartConfigurableUri, dartMarkerAnnotation}
                                                                       tmp[dartLibraryImport] = {dartAnnotation, dartImportSpecification, dartMarkerAnnotation}
                                                                       tmp[dartLibraryName] = {dartAnnotation, dartDottedIdentifierList, dartMarkerAnnotation}
                                                                       tmp[dartListLiteral] = {
                                                                                                dartHidLiteral,
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
                                                                                                         dartHidLiteral,
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
                                                                                                        dartHidLiteral,
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
                                                                                                             dartHidLiteral,
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
                                                                                                  dartHidLiteral,
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
                                                                                                             dartHidLiteral,
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
                                                                                                            dartHidLiteral,
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
                                                                                            dartHidStatement,
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
                                                                                                         dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                  dartHidLiteral,
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
                                                                                                           dartHidLiteral,
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
                                                                       tmp[dartSwitchBlock] = {dartHidStatement, dartSwitchLabel}
                                                                       tmp[dartSwitchLabel] = {
                                                                                                dartHidLiteral,
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
                                                                                                         dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                                  dartHidLiteral,
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
                                                                                                       dartHidLiteral,
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
                                                                                                       dartHidLiteral,
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
                                                                                                    dartHidLiteral,
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
                                                                                                                    dartHidLiteral,
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
                                                                                                       dartHidLiteral,
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
                                                                                                   dartHidLiteral,
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
const dartHiddenKinds*: set[DartNodeKind] = {
                                              dartHidClassMemberDefinition,
                                              dartHidAssignmentOperator,
                                              dartHidIdentifierList,
                                              dartInferredParameters,
                                              dartHidBreakBuiltin,
                                              dartHidFactory,
                                              dartAsterisk,
                                              dartHidExternal,
                                              dartHidWildcardBounds,
                                              dartPositionalParameters,
                                              dartHidFunctionTypeTail,
                                              dartConstructorBody,
                                              dartHidFinalConstVarOrType,
                                              dartHidImplements,
                                              dartHidExpression,
                                              dartHidExternalBuiltin,
                                              dartHidStringLiteralDoubleQuotesMultiple,
                                              dartHidFunctionTypeTails,
                                              dartHidAssignableSelector,
                                              dartHidFormalParameterPart,
                                              dartHidPart,
                                              dartHidTypeDotIdentifier,
                                              dartHidStaticOrCovariant,
                                              dartHidDynamic,
                                              dartHidDefaultFormalParameter,
                                              dartHidOperator,
                                              dartHidElement,
                                              dartWildcard,
                                              dartThrowStatement,
                                              dartHidMetadata,
                                              dartHidRawStringLiteralDoubleQuotesMultiple,
                                              dartHidCovariant,
                                              dartHidUnaryExpression,
                                              dartHidBitwiseOperator,
                                              dartHidMixin,
                                              dartFloatingPointType,
                                              dartHidTryHead,
                                              dartReceiverParameter,
                                              dartHidAdditiveOperator,
                                              dartHidInterface,
                                              dartHidSubStringTest,
                                              dartHidOnPart,
                                              dartHidTemplateCharsRawSlash,
                                              dartHidCompoundAccess,
                                              dartHidStringLiteralDoubleQuotes,
                                              dartHidStatement,
                                              dartHidExternalAndStatic,
                                              dartHidTemplateCharsSingle,
                                              dartHidTripleQuoteEnd,
                                              dartHidNamedFormalParameters,
                                              dartHidForLoopParts,
                                              dartHidTypeNotVoidNotFunction,
                                              dartHidLibrary,
                                              dartCatchType,
                                              dartHidIfNullExpression,
                                              dartHidTemplateCharsSingleSingle,
                                              dartHidTypeName,
                                              dartHidAs,
                                              dartHidCascadeAssignmentSection,
                                              dartHidTypedef,
                                              dartHidRawStringLiteralDoubleQuotes,
                                              dartHidCascadeSubsection,
                                              dartHidNormalFormalParameter,
                                              dartHidStringLiteralSingleQuotes,
                                              dartHidDefaultNamedParameter,
                                              dartBooleanType,
                                              dartHidLiteral,
                                              dartHidExport,
                                              dartHidTypeNotVoid,
                                              dartHidType,
                                              dartHidDeferred,
                                              dartHidRawStringLiteralSingleQuotesMultiple,
                                              dartHidRealExpression,
                                              dartHidFinalOrConst,
                                              dartHidMethodDeclarator,
                                              dartHidTripleDoubleQuoteEnd,
                                              dartHidAssertBuiltin,
                                              dartHidExpressionWithoutCascade,
                                              dartHidNormalFormalParameters,
                                              dartHidAmbiguousName,
                                              dartHidStringInterp,
                                              dartHidDeclaredIdentifier,
                                              dartHidAssignableSelectorPart,
                                              dartHidExclamationOperator,
                                              dartHidGet,
                                              dartHidTypeNotFunction,
                                              dartHidSemicolon,
                                              dartHidTemplateCharsDoubleSingle,
                                              dartHidDotIdentifier,
                                              dartHidFunctionFormalParameter,
                                              dartHidImport,
                                              dartHidNullableType,
                                              dartInterfaceTypeList,
                                              dartHidTopLevelDefinition,
                                              dartHidAnnotation,
                                              dartHidShiftOperator,
                                              dartHidTemplateCharsDouble,
                                              dartHidArgumentList,
                                              dartHidSet,
                                              dartHidNative,
                                              dartRequiresModifier,
                                              dartHidStringLiteralSingleQuotesMultiple,
                                              dartStaticInitializer,
                                              dartHidSimpleFormalParameter,
                                              dartHidOptionalPostionalFormalParameters,
                                              dartHidLateBuiltin,
                                              dartHidStatic,
                                              dartSpreadParameter,
                                              dartHidPrimary,
                                              dartHidTypeNotVoidList,
                                              dartHidFunctionBuiltinIdentifier,
                                              dartHidStrictFormalParameterList,
                                              dartHidNewBuiltin,
                                              dartHidMethodHeader,
                                              dartHidRawStringLiteralSingleQuotes,
                                              dartHidAutomaticSemicolon,
                                              dartHidPostfixExpression,
                                              dartHidUnusedEscapeSequence,
                                              dartVariableDeclaration,
                                              dartHidMultiplicativeOperator
                                            }
proc tsNodeType*(node: TsDartNode): string


proc kind*(node: TsDartNode): DartNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration":                              dartHidDeclaration
      of "_literal":                                  dartHidLiteral
      of "_statement":                                dartHidStatement
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


proc treeRepr*(node: TsDartNode, str: string): string =
  var res = addr result
  proc aux(node: TsDartNode, level: int) =
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
let dartGrammar*: array[DartNodeKind, HtsRule[DartNodeKind]] = block:
                                                                 var rules: array[DartNodeKind, HtsRule[DartNodeKind]]
                                                                 type
                                                                   K = DartNodeKind


                                                                 rules[dartHidAssignmentOperator] = tsChoice[K](tsString[K]("="), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMultiplicativeOperator), tsSymbol[K](dartHidShiftOperator), tsSymbol[K](dartHidBitwiseOperator), tsSymbol[K](dartHidAdditiveOperator), tsString[K]("??")), tsString[K]("=")))
                                                                 rules[dartFormalParameter] = tsSymbol[K](dartHidNormalFormalParameter)
                                                                 rules[dartInferredParameters] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartIdentifier)))), tsString[K](")"))
                                                                 rules[dartTypeParameters] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsSymbol[K](dartTypeParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartTypeParameter)))), tsString[K](">"))
                                                                 rules[dartHidBreakBuiltin] = tsString[K]("break")
                                                                 rules[dartHidFactory] = tsString[K]("factory")
                                                                 rules[dartLibraryImport] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartImportSpecification))
                                                                 rules[dartLambdaExpression] = tsSeq[K](tsSymbol[K](dartFunctionSignature), tsSymbol[K](dartFunctionBody))
                                                                 rules[dartFalse] = tsString[K]("false")
                                                                 rules[dartHidFunctionTypeTail] = tsSeq[K](tsSymbol[K](dartHidFunctionBuiltinIdentifier), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartParameterTypeList), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()))
                                                                 rules[dartHidFinalConstVarOrType] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidLateBuiltin), tsBlank[K]()), tsSymbol[K](dartFinalBuiltin), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]())), tsSeq[K](tsSymbol[K](dartConstBuiltin), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidLateBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartInferredType), tsSymbol[K](dartHidType))))
                                                                 rules[dartOptionalParameterTypes] = tsChoice[K](tsSymbol[K](dartOptionalPositionalParameterTypes), tsSymbol[K](dartNamedParameterTypes))
                                                                 rules[dartUriTest] = tsSeq[K](tsSymbol[K](dartDottedIdentifierList), tsChoice[K](tsSeq[K](tsString[K]("=="), tsSymbol[K](dartStringLiteral)), tsBlank[K]()))
                                                                 rules[dartForStatement] = tsSeq[K](tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsString[K]("for"), tsString[K]("("), tsSymbol[K](dartHidForLoopParts), tsString[K](")"), tsSymbol[K](dartHidStatement))
                                                                 rules[dartLibraryName] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsString[K]("library"), tsSymbol[K](dartDottedIdentifierList), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartFinalBuiltin] = tsString[K]("final")
                                                                 rules[dartHidStringLiteralDoubleQuotesMultiple] = tsSeq[K](tsString[K]("\"\"\""), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsDouble), tsString[K]("\'"), tsString[K]("\""), tsSymbol[K](dartEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsSymbol[K](dartTemplateSubstitution))), tsString[K]("\"\"\""))
                                                                 rules[dartQualified] = tsSeq[K](tsSymbol[K](dartIdentifier), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)), tsBlank[K]()))
                                                                 rules[dartGetterSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartHidGet), tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartHidNative), tsBlank[K]()))
                                                                 rules[dartHidFormalParameterPart] = tsSeq[K](tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsSymbol[K](dartFormalParameterList))
                                                                 rules[dartHidPart] = tsString[K]("part")
                                                                 rules[dartHidDynamic] = tsString[K]("dynamic")
                                                                 rules[dartHidElement] = tsChoice[K](tsSymbol[K](dartHidExpression), tsSymbol[K](dartPair), tsSymbol[K](dartSpreadElement), tsSymbol[K](dartIfElement), tsSymbol[K](dartForElement))
                                                                 rules[dartThrowStatement] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](dartHidExpression), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartFunctionSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidGet), tsSymbol[K](dartHidSet), tsSymbol[K](dartIdentifier)), tsSymbol[K](dartHidFormalParameterPart), tsChoice[K](tsSymbol[K](dartHidNative), tsBlank[K]()))
                                                                 rules[dartCascadeSelector] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()), tsString[K]("["), tsSymbol[K](dartHidExpression), tsString[K]("]")), tsSymbol[K](dartIdentifier))
                                                                 rules[dartHidRawStringLiteralDoubleQuotesMultiple] = tsSeq[K](tsString[K]("r\"\"\""), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsDouble), tsString[K]("\'"), tsSymbol[K](dartHidTemplateCharsRawSlash), tsString[K]("\""), tsSymbol[K](dartHidUnusedEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsString[K]("$"))), tsString[K]("\"\"\""))
                                                                 rules[dartAdditiveOperator] = tsSymbol[K](dartHidAdditiveOperator)
                                                                 rules[dartConditionalAssignableSelector] = tsSeq[K](tsString[K]("?."), tsSymbol[K](dartIdentifier))
                                                                 rules[dartAsOperator] = tsString[K]("as")
                                                                 rules[dartLibraryExport] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidExport), tsSymbol[K](dartConfigurableUri), tsRepeat[K](tsSymbol[K](dartCombinator)), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartEnumConstant] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartIdentifier))
                                                                 rules[dartHidUnaryExpression] = tsChoice[K](tsSymbol[K](dartHidPostfixExpression), tsSymbol[K](dartUnaryExpression))
                                                                 rules[dartHidBitwiseOperator] = tsChoice[K](tsString[K]("&"), tsString[K]("^"), tsString[K]("|"))
                                                                 rules[dartHidCovariant] = tsString[K]("covariant")
                                                                 rules[dartFloatingPointType] = tsString[K]("double")
                                                                 rules[dartHidTryHead] = tsSeq[K](tsString[K]("try"), tsSymbol[K](dartBlock))
                                                                 rules[dartUri] = tsSymbol[K](dartStringLiteral)
                                                                 rules[dartFunctionType] = tsChoice[K](tsSymbol[K](dartHidFunctionTypeTails), tsSeq[K](tsSymbol[K](dartHidTypeNotFunction), tsSymbol[K](dartHidFunctionTypeTails)))
                                                                 rules[dartReceiverParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidType), tsChoice[K](tsSeq[K](tsSymbol[K](dartIdentifier), tsString[K](".")), tsBlank[K]()), tsSymbol[K](dartThis))
                                                                 rules[dartPartOfDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsString[K]("part"), tsString[K]("of"), tsChoice[K](tsSymbol[K](dartDottedIdentifierList), tsSymbol[K](dartUri)), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartLabel] = tsSeq[K](tsSymbol[K](dartIdentifier), tsString[K](":"))
                                                                 rules[dartHidSubStringTest] = tsSeq[K](tsString[K]("$"), tsRegex[K]("[^a-zA-Z_{]"))
                                                                 rules[dartThis] = tsString[K]("this")
                                                                 rules[dartComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K]("[^/].*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                                 rules[dartConstantConstructorSignature] = tsSeq[K](tsSymbol[K](dartConstBuiltin), tsSymbol[K](dartQualified), tsSymbol[K](dartFormalParameterList))
                                                                 rules[dartHidCompoundAccess] = tsChoice[K](tsString[K]("."), tsString[K]("?."))
                                                                 rules[dartHidExternalAndStatic] = tsSeq[K](tsSymbol[K](dartHidExternal), tsChoice[K](tsSymbol[K](dartHidStatic), tsBlank[K]()))
                                                                 rules[dartArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidArgumentList), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                                 rules[dartFormalParameterList] = tsSymbol[K](dartHidStrictFormalParameterList)
                                                                 rules[dartSwitchLabel] = tsChoice[K](tsSeq[K](tsSymbol[K](dartCaseBuiltin), tsSymbol[K](dartHidExpression), tsString[K](":")), tsSeq[K](tsString[K]("default"), tsString[K](":")))
                                                                 rules[dartSelector] = tsChoice[K](tsSymbol[K](dartHidExclamationOperator), tsSymbol[K](dartHidAssignableSelector), tsSymbol[K](dartArgumentPart))
                                                                 rules[dartExtensionBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartDeclaration), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSeq[K](tsSymbol[K](dartMethodSignature), tsSymbol[K](dartFunctionBody))))), tsString[K]("}"))
                                                                 rules[dartHidForLoopParts] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidDeclaredIdentifier), tsSymbol[K](dartIdentifier)), tsString[K]("in"), tsSymbol[K](dartHidExpression)), tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](dartLocalVariableDeclaration), tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](dartHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidExpression)))), tsBlank[K]()), tsSymbol[K](dartHidSemicolon))), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidExpression), tsBlank[K]()), tsSymbol[K](dartHidSemicolon), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidExpression)))), tsBlank[K]())))
                                                                 rules[dartSetterSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartHidSet), tsSymbol[K](dartIdentifier), tsSymbol[K](dartHidFormalParameterPart), tsChoice[K](tsSymbol[K](dartHidNative), tsBlank[K]()))
                                                                 rules[dartHidTypeNotVoidNotFunction] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidTypeName), tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]())), tsSeq[K](tsSymbol[K](dartHidFunctionBuiltinIdentifier), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]())))
                                                                 rules[dartHidIfNullExpression] = tsRepeat1[K](tsSeq[K](tsString[K]("??"), tsSymbol[K](dartHidRealExpression)))
                                                                 rules[dartTypeBound] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](dartHidTypeNotVoid))
                                                                 rules[dartHidDeclaration] = tsChoice[K](tsSymbol[K](dartImportSpecification), tsSymbol[K](dartClassDefinition), tsSymbol[K](dartEnumDeclaration))
                                                                 rules[dartHidTypeName] = tsSeq[K](tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartHidTypeDotIdentifier), tsBlank[K]()))
                                                                 rules[dartFinallyClause] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](dartBlock))
                                                                 rules[dartHidCascadeAssignmentSection] = tsSeq[K](tsSymbol[K](dartHidAssignmentOperator), tsSymbol[K](dartHidExpressionWithoutCascade))
                                                                 rules[dartTypeParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartTypeBound), tsBlank[K]()))
                                                                 rules[dartHidTypedef] = tsString[K]("typedef")
                                                                 rules[dartBinaryOperator] = tsChoice[K](tsSymbol[K](dartMultiplicativeOperator), tsSymbol[K](dartAdditiveOperator), tsSymbol[K](dartShiftOperator), tsSymbol[K](dartRelationalOperator), tsString[K]("=="), tsSymbol[K](dartBitwiseOperator))
                                                                 rules[dartHidCascadeSubsection] = tsSeq[K](tsSymbol[K](dartHidAssignableSelector), tsRepeat[K](tsSymbol[K](dartArgumentPart)))
                                                                 rules[dartExtensionDeclaration] = tsChoice[K](tsSeq[K](tsString[K]("extension"), tsChoice[K](tsSymbol[K](dartIdentifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsString[K]("on"), tsSymbol[K](dartHidType), tsSymbol[K](dartExtensionBody)))
                                                                 rules[dartNamedParameterTypes] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](dartTypedIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartTypedIdentifier))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("}"))
                                                                 rules[dartDocumentationComment] = tsChoice[K](tsSeq[K](tsString[K]("///"), tsRegex[K](".*")))
                                                                 rules[dartMixinApplicationClass] = tsSeq[K](tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsString[K]("="), tsSymbol[K](dartMixinApplication), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartMethodSignature] = tsChoice[K](tsSeq[K](tsSymbol[K](dartConstructorSignature), tsChoice[K](tsSymbol[K](dartInitializers), tsBlank[K]())), tsSymbol[K](dartFactoryConstructorSignature), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidStatic), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartFunctionSignature), tsSymbol[K](dartGetterSignature), tsSymbol[K](dartSetterSignature))), tsSymbol[K](dartOperatorSignature))
                                                                 rules[dartTypeTest] = tsSeq[K](tsSymbol[K](dartIsOperator), tsSymbol[K](dartHidTypeNotVoid))
                                                                 rules[dartHidExport] = tsString[K]("export")
                                                                 rules[dartHidTypeNotVoid] = tsChoice[K](tsSeq[K](tsSymbol[K](dartFunctionType), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]())), tsSymbol[K](dartHidTypeNotVoidNotFunction))
                                                                 rules[dartShiftOperator] = tsSymbol[K](dartHidShiftOperator)
                                                                 rules[dartMinusOperator] = tsString[K]("-")
                                                                 rules[dartNullLiteral] = tsString[K]("null")
                                                                 rules[dartDecimalFloatingPointLiteral] = tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]())))
                                                                 rules[dartSymbolLiteral] = tsSeq[K](tsString[K]("#"), tsSymbol[K](dartIdentifier))
                                                                 rules[dartStringLiteral] = tsRepeat1[K](tsChoice[K](tsSymbol[K](dartHidStringLiteralDoubleQuotes), tsSymbol[K](dartHidStringLiteralSingleQuotes), tsSymbol[K](dartHidStringLiteralDoubleQuotesMultiple), tsSymbol[K](dartHidStringLiteralSingleQuotesMultiple), tsSymbol[K](dartHidRawStringLiteralDoubleQuotes), tsSymbol[K](dartHidRawStringLiteralSingleQuotes), tsSymbol[K](dartHidRawStringLiteralDoubleQuotesMultiple), tsSymbol[K](dartHidRawStringLiteralSingleQuotesMultiple)))
                                                                 rules[dartSwitchBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](dartSwitchLabel), tsSymbol[K](dartHidStatement))), tsString[K]("}"))
                                                                 rules[dartHidDeferred] = tsString[K]("deferred")
                                                                 rules[dartHidFinalOrConst] = tsChoice[K](tsSymbol[K](dartFinalBuiltin), tsSymbol[K](dartConstBuiltin))
                                                                 rules[dartListLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](dartConstBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidElement))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[dartHexIntegerLiteral] = tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsSeq[K](tsRegex[K]("[A-Fa-f0-9]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[A-Fa-f0-9]+")))))
                                                                 rules[dartNegationOperator] = tsSymbol[K](dartHidExclamationOperator)
                                                                 rules[dartHidAssertBuiltin] = tsString[K]("assert")
                                                                 rules[dartHidNormalFormalParameters] = tsSeq[K](tsSymbol[K](dartFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartFormalParameter))))
                                                                 rules[dartHidAmbiguousName] = tsChoice[K](tsSymbol[K](dartIdentifier), tsSymbol[K](dartScopedIdentifier))
                                                                 rules[dartDeclaration] = tsChoice[K](tsSeq[K](tsSymbol[K](dartConstantConstructorSignature), tsChoice[K](tsChoice[K](tsSymbol[K](dartRedirection), tsSymbol[K](dartInitializers)), tsBlank[K]())), tsSeq[K](tsSymbol[K](dartConstructorSignature), tsChoice[K](tsChoice[K](tsSymbol[K](dartRedirection), tsSymbol[K](dartInitializers)), tsBlank[K]())), tsSeq[K](tsSymbol[K](dartHidExternal), tsChoice[K](tsSymbol[K](dartConstBuiltin), tsBlank[K]()), tsSymbol[K](dartFactoryConstructorSignature)), tsSeq[K](tsChoice[K](tsSymbol[K](dartConstBuiltin), tsBlank[K]()), tsSymbol[K](dartFactoryConstructorSignature), tsSymbol[K](dartHidNative)), tsSeq[K](tsSymbol[K](dartHidExternal), tsSymbol[K](dartConstantConstructorSignature)), tsSymbol[K](dartRedirectingFactoryConstructorSignature), tsSeq[K](tsSymbol[K](dartHidExternal), tsSymbol[K](dartConstructorSignature)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidStatic), tsBlank[K]()), tsSymbol[K](dartGetterSignature)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalAndStatic), tsBlank[K]()), tsSymbol[K](dartSetterSignature)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternal), tsBlank[K]()), tsSymbol[K](dartOperatorSignature)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalAndStatic), tsBlank[K]()), tsSymbol[K](dartFunctionSignature)), tsSeq[K](tsSymbol[K](dartHidStatic), tsSymbol[K](dartFunctionSignature)), tsSeq[K](tsSymbol[K](dartHidStatic), tsSymbol[K](dartHidFinalOrConst), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartStaticFinalDeclarationList)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidLateBuiltin), tsBlank[K]()), tsSymbol[K](dartFinalBuiltin), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartInitializedIdentifierList)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidStaticOrCovariant), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidLateBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidType), tsSymbol[K](dartInferredType)), tsSymbol[K](dartInitializedIdentifierList)))
                                                                 rules[dartConstructorParam] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidFinalConstVarOrType), tsBlank[K]()), tsSymbol[K](dartThis), tsString[K]("."), tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartHidFormalParameterPart), tsBlank[K]()))
                                                                 rules[dartHidStringInterp] = tsRegex[K]("\\$((\\w+)|\\{([^{}]+)\\})")
                                                                 rules[dartAnnotation] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](dartIdentifier), tsSymbol[K](dartScopedIdentifier)), tsSymbol[K](dartArguments))
                                                                 rules[dartSpreadElement] = tsSeq[K](tsString[K]("..."), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsSymbol[K](dartHidExpression))
                                                                 rules[dartInitializedVariableDefinition] = tsSeq[K](tsSymbol[K](dartHidDeclaredIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](dartHidExpression)), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartInitializedIdentifier))))
                                                                 rules[dartSuperclass] = tsChoice[K](tsSeq[K](tsString[K]("extends"), tsSymbol[K](dartHidTypeNotVoid), tsChoice[K](tsSymbol[K](dartMixins), tsBlank[K]())), tsSymbol[K](dartMixins))
                                                                 rules[dartEscapeSequence] = tsSymbol[K](dartHidUnusedEscapeSequence)
                                                                 rules[dartHidExclamationOperator] = tsString[K]("!")
                                                                 rules[dartBitwiseXorExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsString[K]("^"), tsSymbol[K](dartHidRealExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsString[K]("^"), tsSymbol[K](dartHidRealExpression)))))
                                                                 rules[dartFactoryConstructorSignature] = tsSeq[K](tsSymbol[K](dartHidFactory), tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)))), tsSymbol[K](dartFormalParameterList))
                                                                 rules[dartHidGet] = tsString[K]("get")
                                                                 rules[dartTildeOperator] = tsString[K]("~")
                                                                 rules[dartHidDotIdentifier] = tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier))
                                                                 rules[dartAssertion] = tsSeq[K](tsSymbol[K](dartHidAssertBuiltin), tsString[K]("("), tsSymbol[K](dartHidExpression), tsChoice[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidExpression), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                                 rules[dartInferredType] = tsString[K]("var")
                                                                 rules[dartHidFunctionFormalParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidCovariant), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartIdentifier), tsSymbol[K](dartHidFormalParameterPart), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()))
                                                                 rules[dartLocalVariableDeclaration] = tsSeq[K](tsSymbol[K](dartInitializedVariableDefinition), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartHidImport] = tsString[K]("import")
                                                                 rules[dartConfigurableUri] = tsSeq[K](tsSymbol[K](dartUri), tsRepeat[K](tsSymbol[K](dartConfigurationUri)))
                                                                 rules[dartHidAnnotation] = tsChoice[K](tsSymbol[K](dartMarkerAnnotation), tsSymbol[K](dartAnnotation))
                                                                 rules[dartHidShiftOperator] = tsChoice[K](tsString[K]("<<"), tsString[K](">>"), tsString[K](">>>"))
                                                                 rules[dartTypeCast] = tsSeq[K](tsSymbol[K](dartAsOperator), tsSymbol[K](dartHidTypeNotVoid))
                                                                 rules[dartHidArgumentList] = tsChoice[K](tsSeq[K](tsSymbol[K](dartNamedArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartNamedArgument)))), tsSeq[K](tsSeq[K](tsSymbol[K](dartArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartArgument)))), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsSymbol[K](dartNamedArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartNamedArgument))))))))
                                                                 rules[dartCatchClause] = tsSeq[K](tsString[K]("catch"), tsString[K]("("), tsSymbol[K](dartIdentifier), tsChoice[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartIdentifier)), tsBlank[K]()), tsString[K](")"))
                                                                 rules[dartImportSpecification] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidImport), tsSymbol[K](dartConfigurableUri), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidAs), tsSymbol[K](dartIdentifier)), tsBlank[K]()), tsRepeat[K](tsSymbol[K](dartCombinator)), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsSymbol[K](dartHidImport), tsSymbol[K](dartUri), tsSymbol[K](dartHidDeferred), tsSymbol[K](dartHidAs), tsSymbol[K](dartIdentifier), tsRepeat[K](tsSymbol[K](dartCombinator)), tsSymbol[K](dartHidSemicolon)))
                                                                 rules[dartIdentifierDollarEscaped] = tsRegex[K]("([a-zA-Z_]|(\\\\\\$))([\\w]|(\\\\\\$))*")
                                                                 rules[dartRequiresModifier] = tsChoice[K](tsString[K]("transitive"), tsSymbol[K](dartHidStatic))
                                                                 rules[dartHidStringLiteralSingleQuotesMultiple] = tsSeq[K](tsString[K]("\'\'\'"), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsSingle), tsString[K]("\""), tsString[K]("\'"), tsSymbol[K](dartEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsSymbol[K](dartTemplateSubstitution))), tsString[K]("\'\'\'"))
                                                                 rules[dartAssignmentExpression] = tsSeq[K](tsSymbol[K](dartAssignableExpression), tsSymbol[K](dartHidAssignmentOperator), tsSymbol[K](dartHidExpression))
                                                                 rules[dartTypeArguments] = tsChoice[K](tsSeq[K](tsString[K]("<"), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidType)))), tsBlank[K]()), tsString[K](">")))
                                                                 rules[dartStaticInitializer] = tsSeq[K](tsSymbol[K](dartHidStatic), tsSymbol[K](dartBlock))
                                                                 rules[dartHidSimpleFormalParameter] = tsChoice[K](tsSymbol[K](dartHidDeclaredIdentifier), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidCovariant), tsBlank[K]()), tsSymbol[K](dartIdentifier)))
                                                                 rules[dartConstObjectExpression] = tsSeq[K](tsSymbol[K](dartConstBuiltin), tsSymbol[K](dartHidTypeNotVoid), tsChoice[K](tsSymbol[K](dartHidDotIdentifier), tsBlank[K]()), tsSymbol[K](dartArguments))
                                                                 rules[dartDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](dartHidStatement), tsString[K]("while"), tsSymbol[K](dartParenthesizedExpression), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartProgram] = tsSeq[K](tsChoice[K](tsSymbol[K](dartScriptTag), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartLibraryName), tsBlank[K]()), tsRepeat[K](tsSymbol[K](dartImportOrExport)), tsRepeat[K](tsSymbol[K](dartPartDirective)), tsRepeat[K](tsSymbol[K](dartPartOfDirective)), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidTopLevelDefinition))), tsRepeat[K](tsSymbol[K](dartHidStatement)))
                                                                 rules[dartHidOptionalPostionalFormalParameters] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](dartHidDefaultFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidDefaultFormalParameter))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("]"))
                                                                 rules[dartSpreadParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidType), tsString[K]("..."), tsSymbol[K](dartHidDeclaredIdentifier))
                                                                 rules[dartShiftExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartShiftOperator), tsSymbol[K](dartHidRealExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartShiftOperator), tsSymbol[K](dartHidRealExpression)))))
                                                                 rules[dartConstBuiltin] = tsString[K]("const")
                                                                 rules[dartEqualityOperator] = tsChoice[K](tsString[K]("=="), tsString[K]("!="))
                                                                 rules[dartOptionalFormalParameters] = tsChoice[K](tsSymbol[K](dartHidOptionalPostionalFormalParameters), tsSymbol[K](dartHidNamedFormalParameters))
                                                                 rules[dartHidNewBuiltin] = tsString[K]("new")
                                                                 rules[dartHidRawStringLiteralSingleQuotes] = tsSeq[K](tsString[K]("r\'"), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsSingleSingle), tsString[K]("\""), tsSymbol[K](dartHidTemplateCharsRawSlash), tsSymbol[K](dartHidUnusedEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsString[K]("$"))), tsString[K]("\'"))
                                                                 rules[dartVariableDeclaration] = tsSeq[K](tsSymbol[K](dartHidDeclaredIdentifier), tsChoice[K](tsSeq[K](tsString[K](","), tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartIdentifier))))), tsBlank[K]()))
                                                                 rules[dartHidUnusedEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu0-7]"), tsRegex[K]("[0-7]{1,3}"), tsRegex[K]("x[0-9a-fA-F]{2}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}")))
                                                                 rules[dartModuleName] = tsChoice[K](tsSymbol[K](dartIdentifier), tsSeq[K](tsSymbol[K](dartModuleName), tsString[K]("."), tsSymbol[K](dartIdentifier)))
                                                                 rules[dartOptionalPositionalParameterTypes] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](dartNormalParameterType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartNormalParameterType))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("]"))
                                                                 rules[dartHidMultiplicativeOperator] = tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("~/"))
                                                                 rules[dartHidClassMemberDefinition] = tsChoice[K](tsSeq[K](tsSymbol[K](dartDeclaration), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsSymbol[K](dartMethodSignature), tsSymbol[K](dartFunctionBody)))
                                                                 rules[dartHidIdentifierList] = tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartIdentifier))))
                                                                 rules[dartMixinDeclaration] = tsSeq[K](tsSymbol[K](dartHidMixin), tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("on"), tsSymbol[K](dartHidTypeNotVoidList)), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartInterfaces), tsBlank[K]()), tsSymbol[K](dartClassBody))
                                                                 rules[dartTypeTestExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartTypeTest))
                                                                 rules[dartDottedIdentifierList] = tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier))))
                                                                 rules[dartAsterisk] = tsString[K]("*")
                                                                 rules[dartHidExternal] = tsSymbol[K](dartHidExternalBuiltin)
                                                                 rules[dartFunctionBody] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("=>"), tsSymbol[K](dartHidExpression), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("async"), tsString[K]("async*"), tsString[K]("sync*")), tsBlank[K]()), tsSymbol[K](dartBlock)))
                                                                 rules[dartRedirectingFactoryConstructorSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](dartConstBuiltin), tsBlank[K]()), tsSymbol[K](dartHidFactory), tsSeq[K](tsSymbol[K](dartIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)))), tsSymbol[K](dartFormalParameterList), tsString[K]("="), tsSymbol[K](dartHidTypeNotVoid), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)), tsBlank[K]()))
                                                                 rules[dartHidWildcardBounds] = tsChoice[K](tsSeq[K](tsString[K]("extends"), tsSymbol[K](dartHidType)), tsSeq[K](tsSymbol[K](dartSuper), tsSymbol[K](dartHidType)))
                                                                 rules[dartBitwiseAndExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](dartHidRealExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](dartHidRealExpression)))))
                                                                 rules[dartNamedArgument] = tsSeq[K](tsSymbol[K](dartLabel), tsSymbol[K](dartHidExpression))
                                                                 rules[dartIsOperator] = tsSeq[K](tsString[K]("is"), tsChoice[K](tsSymbol[K](dartHidExclamationOperator), tsBlank[K]()))
                                                                 rules[dartForElement] = tsSeq[K](tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsString[K]("for"), tsString[K]("("), tsSymbol[K](dartHidForLoopParts), tsString[K](")"), tsSymbol[K](dartHidElement))
                                                                 rules[dartReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](dartHidExpression), tsBlank[K]()), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartStaticFinalDeclaration] = tsSeq[K](tsSymbol[K](dartIdentifier), tsString[K]("="), tsSymbol[K](dartHidExpression))
                                                                 rules[dartTypedIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidType), tsSymbol[K](dartIdentifier))
                                                                 rules[dartConstructorBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](dartExplicitConstructorInvocation), tsBlank[K]()), tsRepeat[K](tsSymbol[K](dartHidStatement)), tsString[K]("}"))
                                                                 rules[dartPositionalParameters] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](dartHidDefaultFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidDefaultFormalParameter)))), tsString[K]("]"))
                                                                 rules[dartThrows] = tsSeq[K](tsString[K]("throws"), tsSeq[K](tsSymbol[K](dartHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidType)))))
                                                                 rules[dartCaseBuiltin] = tsString[K]("case")
                                                                 rules[dartHidExpression] = tsChoice[K](tsSymbol[K](dartAssignmentExpression), tsSymbol[K](dartThrowExpression), tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat[K](tsSymbol[K](dartCascadeSection))))
                                                                 rules[dartLogicalAndExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsString[K]("&&"), tsSymbol[K](dartHidRealExpression))))
                                                                 rules[dartHidImplements] = tsString[K]("implements")
                                                                 rules[dartHidExternalBuiltin] = tsString[K]("external")
                                                                 rules[dartSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](dartParenthesizedExpression), tsSymbol[K](dartSwitchBlock))
                                                                 rules[dartNewExpression] = tsSeq[K](tsSymbol[K](dartHidNewBuiltin), tsSymbol[K](dartHidTypeNotVoid), tsChoice[K](tsSymbol[K](dartHidDotIdentifier), tsBlank[K]()), tsSymbol[K](dartArguments))
                                                                 rules[dartOperatorSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartHidOperator), tsChoice[K](tsString[K]("~"), tsSymbol[K](dartBinaryOperator), tsString[K]("[]"), tsString[K]("[]=")), tsSymbol[K](dartFormalParameterList), tsChoice[K](tsSymbol[K](dartHidNative), tsBlank[K]()))
                                                                 rules[dartPartDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsString[K]("part"), tsSymbol[K](dartUri), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartHidAssignableSelector] = tsChoice[K](tsSymbol[K](dartUnconditionalAssignableSelector), tsSymbol[K](dartConditionalAssignableSelector))
                                                                 rules[dartHidStaticOrCovariant] = tsChoice[K](tsSymbol[K](dartHidCovariant), tsSymbol[K](dartHidStatic))
                                                                 rules[dartSetOrMapLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](dartConstBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](dartHidElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidElement))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[dartYieldEachStatement] = tsSeq[K](tsString[K]("yield"), tsString[K]("*"), tsSymbol[K](dartHidExpression), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartCombinator] = tsChoice[K](tsSeq[K](tsString[K]("show"), tsSymbol[K](dartHidIdentifierList)), tsSeq[K](tsString[K]("hide"), tsSymbol[K](dartHidIdentifierList)))
                                                                 rules[dartConstructorSignature] = tsSeq[K](tsSeq[K](tsSymbol[K](dartIdentifier), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)), tsBlank[K]())), tsSymbol[K](dartFormalParameterList))
                                                                 rules[dartCascadeSection] = tsSeq[K](tsString[K](".."), tsSymbol[K](dartCascadeSelector), tsRepeat[K](tsSymbol[K](dartArgumentPart)), tsRepeat[K](tsSymbol[K](dartHidCascadeSubsection)), tsChoice[K](tsSymbol[K](dartHidCascadeAssignmentSection), tsBlank[K]()))
                                                                 rules[dartAssignmentExpressionWithoutCascade] = tsSeq[K](tsSymbol[K](dartAssignableExpression), tsSymbol[K](dartHidAssignmentOperator), tsSymbol[K](dartHidExpressionWithoutCascade))
                                                                 rules[dartWildcard] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsString[K]("?"), tsChoice[K](tsSymbol[K](dartHidWildcardBounds), tsBlank[K]()))
                                                                 rules[dartLogicalOrExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsString[K]("||"), tsSymbol[K](dartHidRealExpression))))
                                                                 rules[dartBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](dartHidStatement)), tsString[K]("}"))
                                                                 rules[dartHidFunctionTypeTails] = tsRepeat1[K](tsSymbol[K](dartHidFunctionTypeTail))
                                                                 rules[dartMultiplicativeExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidUnaryExpression), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartMultiplicativeOperator), tsSymbol[K](dartHidUnaryExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartMultiplicativeOperator), tsSymbol[K](dartHidUnaryExpression)))))
                                                                 rules[dartAwaitExpression] = tsSeq[K](tsString[K]("await"), tsSymbol[K](dartHidUnaryExpression))
                                                                 rules[dartParameterTypeList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsChoice[K](tsSeq[K](tsSymbol[K](dartNormalParameterType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartNormalParameterType))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsSeq[K](tsSeq[K](tsSymbol[K](dartNormalParameterType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartNormalParameterType)))), tsString[K](","), tsSymbol[K](dartOptionalParameterTypes)), tsSymbol[K](dartOptionalParameterTypes)), tsBlank[K]()), tsString[K](")"))
                                                                 rules[dartHidMetadata] = tsRepeat1[K](tsSymbol[K](dartHidAnnotation))
                                                                 rules[dartFunctionExpression] = tsSeq[K](tsSymbol[K](dartHidFormalParameterPart), tsSymbol[K](dartFunctionExpressionBody))
                                                                 rules[dartStaticFinalDeclarationList] = tsSeq[K](tsSymbol[K](dartStaticFinalDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartStaticFinalDeclaration))))
                                                                 rules[dartHidTypeDotIdentifier] = tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier))
                                                                 rules[dartHidDefaultFormalParameter] = tsSeq[K](tsSymbol[K](dartFormalParameter), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](dartHidExpression)), tsBlank[K]()))
                                                                 rules[dartMixinApplication] = tsSeq[K](tsSymbol[K](dartHidTypeNotVoid), tsSymbol[K](dartMixins), tsChoice[K](tsSymbol[K](dartInterfaces), tsBlank[K]()))
                                                                 rules[dartHidOperator] = tsString[K]("operator")
                                                                 rules[dartHidMixin] = tsString[K]("mixin")
                                                                 rules[dartScopedIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](dartIdentifier), tsSymbol[K](dartScopedIdentifier)), tsString[K]("."), tsSymbol[K](dartIdentifier))
                                                                 rules[dartPair] = tsSeq[K](tsSymbol[K](dartHidExpression), tsString[K](":"), tsSymbol[K](dartHidExpression))
                                                                 rules[dartAdditiveExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartAdditiveOperator), tsSymbol[K](dartHidRealExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsSymbol[K](dartAdditiveOperator), tsSymbol[K](dartHidRealExpression)))))
                                                                 rules[dartImportOrExport] = tsChoice[K](tsSymbol[K](dartLibraryImport), tsSymbol[K](dartLibraryExport))
                                                                 rules[dartUnaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartPrefixOperator), tsSymbol[K](dartHidUnaryExpression)), tsSymbol[K](dartAwaitExpression), tsSeq[K](tsChoice[K](tsSymbol[K](dartMinusOperator), tsSymbol[K](dartTildeOperator)), tsSymbol[K](dartSuper)), tsSeq[K](tsSymbol[K](dartIncrementOperator), tsSymbol[K](dartAssignableExpression)))
                                                                 rules[dartHidAdditiveOperator] = tsChoice[K](tsString[K]("+"), tsString[K]("-"))
                                                                 rules[dartIfElement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](dartParenthesizedExpression), tsSymbol[K](dartHidElement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](dartHidElement)), tsBlank[K]()))
                                                                 rules[dartHidInterface] = tsString[K]("interface")
                                                                 rules[dartHidOnPart] = tsChoice[K](tsSeq[K](tsSymbol[K](dartCatchClause), tsSymbol[K](dartBlock)), tsSeq[K](tsString[K]("on"), tsSymbol[K](dartHidTypeNotVoid), tsChoice[K](tsSymbol[K](dartCatchClause), tsBlank[K]()), tsSymbol[K](dartBlock)))
                                                                 rules[dartFunctionExpressionBody] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("=>"), tsSymbol[K](dartHidExpression)), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("async"), tsString[K]("async*"), tsString[K]("sync*")), tsBlank[K]()), tsSymbol[K](dartBlock)))
                                                                 rules[dartHidStringLiteralDoubleQuotes] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsDoubleSingle), tsString[K]("\'"), tsSymbol[K](dartEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsSymbol[K](dartTemplateSubstitution))), tsString[K]("\""))
                                                                 rules[dartAssignableExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidPrimary), tsSymbol[K](dartHidAssignableSelectorPart)), tsSeq[K](tsSymbol[K](dartSuper), tsSymbol[K](dartUnconditionalAssignableSelector)), tsSeq[K](tsSymbol[K](dartConstructorInvocation), tsSymbol[K](dartHidAssignableSelectorPart)), tsSymbol[K](dartIdentifier))
                                                                 rules[dartHidStatement] = tsChoice[K](tsSymbol[K](dartBlock), tsSymbol[K](dartLocalVariableDeclaration), tsSymbol[K](dartForStatement), tsSymbol[K](dartWhileStatement), tsSymbol[K](dartDoStatement), tsSymbol[K](dartSwitchStatement), tsSymbol[K](dartIfStatement), tsSymbol[K](dartTryStatement), tsSymbol[K](dartBreakStatement), tsSymbol[K](dartContinueStatement), tsSymbol[K](dartReturnStatement), tsSymbol[K](dartYieldStatement), tsSymbol[K](dartYieldEachStatement), tsSymbol[K](dartExpressionStatement), tsSymbol[K](dartAssertStatement), tsSymbol[K](dartLabeledStatement), tsSymbol[K](dartLambdaExpression))
                                                                 rules[dartIdentifier] = tsRegex[K]("[a-zA-Z_$][\\w$]*")
                                                                 rules[dartMarkerAnnotation] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](dartIdentifier), tsSymbol[K](dartScopedIdentifier)))
                                                                 rules[dartInitializers] = tsSeq[K](tsString[K](":"), tsSeq[K](tsSymbol[K](dartInitializerListEntry), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartInitializerListEntry)))))
                                                                 rules[dartExplicitConstructorInvocation] = tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartThis), tsSymbol[K](dartSuper))), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidAmbiguousName), tsSymbol[K](dartHidPrimary)), tsString[K]("."), tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsSymbol[K](dartSuper))), tsSymbol[K](dartArguments), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartIncrementOperator] = tsChoice[K](tsString[K]("++"), tsString[K]("--"))
                                                                 rules[dartHidTripleQuoteEnd] = tsString[K]("\'\'\'")
                                                                 rules[dartClassBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsSymbol[K](dartHidClassMemberDefinition))), tsString[K]("}"))
                                                                 rules[dartHidNamedFormalParameters] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](dartHidDefaultNamedParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidDefaultNamedParameter))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("}"))
                                                                 rules[dartScriptTag] = tsSeq[K](tsString[K]("#!"), tsRegex[K](".+"), tsString[K]("\x0A"))
                                                                 rules[dartHidLibrary] = tsString[K]("library")
                                                                 rules[dartCatchType] = tsSeq[K](tsSymbol[K](dartHidType), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](dartHidType))))
                                                                 rules[dartYieldStatement] = tsSeq[K](tsString[K]("yield"), tsSymbol[K](dartHidExpression), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartPrefixOperator] = tsChoice[K](tsSymbol[K](dartMinusOperator), tsSymbol[K](dartNegationOperator), tsSymbol[K](dartTildeOperator))
                                                                 rules[dartTrue] = tsString[K]("true")
                                                                 rules[dartPostfixExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartAssignableExpression), tsSymbol[K](dartPostfixOperator)), tsSeq[K](tsSymbol[K](dartConstructorInvocation), tsRepeat[K](tsSymbol[K](dartSelector))))
                                                                 rules[dartNormalParameterType] = tsChoice[K](tsSymbol[K](dartTypedIdentifier), tsSymbol[K](dartHidType))
                                                                 rules[dartHidAs] = tsString[K]("as")
                                                                 rules[dartHidRawStringLiteralDoubleQuotes] = tsSeq[K](tsString[K]("r\""), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsDoubleSingle), tsString[K]("\'"), tsSymbol[K](dartHidTemplateCharsRawSlash), tsSymbol[K](dartHidUnusedEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsString[K]("$"))), tsString[K]("\""))
                                                                 rules[dartLabeledStatement] = tsSeq[K](tsSymbol[K](dartIdentifier), tsString[K](":"), tsSymbol[K](dartHidStatement))
                                                                 rules[dartClassDefinition] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("abstract"), tsBlank[K]()), tsString[K]("class"), tsSymbol[K](dartIdentifier), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartSuperclass), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartInterfaces), tsBlank[K]()), tsSymbol[K](dartClassBody)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsChoice[K](tsString[K]("abstract"), tsBlank[K]()), tsString[K]("class"), tsSymbol[K](dartMixinApplicationClass)))
                                                                 rules[dartBitwiseOperator] = tsSymbol[K](dartHidBitwiseOperator)
                                                                 rules[dartParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](dartHidExpression), tsString[K](")"))
                                                                 rules[dartHidStringLiteralSingleQuotes] = tsSeq[K](tsString[K]("\'"), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsSingleSingle), tsString[K]("\""), tsSymbol[K](dartEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsSymbol[K](dartTemplateSubstitution))), tsString[K]("\'"))
                                                                 rules[dartHidNormalFormalParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidFunctionFormalParameter), tsSymbol[K](dartHidSimpleFormalParameter), tsSymbol[K](dartConstructorParam)))
                                                                 rules[dartEnumDeclaration] = tsSeq[K](tsString[K]("enum"), tsSymbol[K](dartIdentifier), tsSymbol[K](dartEnumBody))
                                                                 rules[dartBooleanType] = tsString[K]("bool")
                                                                 rules[dartHidDefaultNamedParameter] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("required"), tsBlank[K]()), tsSymbol[K](dartFormalParameter), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](dartHidExpression)), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("required"), tsBlank[K]()), tsSymbol[K](dartFormalParameter), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](dartHidExpression)), tsBlank[K]())))
                                                                 rules[dartHidLiteral] = tsChoice[K](tsSymbol[K](dartDecimalIntegerLiteral), tsSymbol[K](dartHexIntegerLiteral), tsSymbol[K](dartDecimalFloatingPointLiteral), tsSymbol[K](dartTrue), tsSymbol[K](dartFalse), tsSymbol[K](dartStringLiteral), tsSymbol[K](dartNullLiteral), tsSymbol[K](dartSymbolLiteral), tsSymbol[K](dartListLiteral), tsSymbol[K](dartSetOrMapLiteral))
                                                                 rules[dartConstructorInvocation] = tsSeq[K](tsSymbol[K](dartHidTypeName), tsSymbol[K](dartTypeArguments), tsString[K]("."), tsSymbol[K](dartIdentifier), tsSymbol[K](dartArguments))
                                                                 rules[dartWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](dartParenthesizedExpression), tsSymbol[K](dartHidStatement))
                                                                 rules[dartTypeCastExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartTypeCast))
                                                                 rules[dartBitwiseOrExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsRepeat1[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](dartHidRealExpression)))), tsSeq[K](tsSymbol[K](dartSuper), tsRepeat1[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](dartHidRealExpression)))))
                                                                 rules[dartHidType] = tsChoice[K](tsSeq[K](tsSymbol[K](dartFunctionType), tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]())), tsSymbol[K](dartHidTypeNotFunction))
                                                                 rules[dartHidRawStringLiteralSingleQuotesMultiple] = tsSeq[K](tsString[K]("r\'\'\'"), tsRepeat[K](tsChoice[K](tsSymbol[K](dartHidTemplateCharsSingle), tsString[K]("\""), tsString[K]("\'"), tsSymbol[K](dartHidTemplateCharsRawSlash), tsSymbol[K](dartHidUnusedEscapeSequence), tsSymbol[K](dartHidSubStringTest), tsString[K]("$"))), tsString[K]("\'\'\'"))
                                                                 rules[dartHidRealExpression] = tsChoice[K](tsSymbol[K](dartConditionalExpression), tsSymbol[K](dartLogicalOrExpression), tsSymbol[K](dartIfNullExpression), tsSymbol[K](dartAdditiveExpression), tsSymbol[K](dartMultiplicativeExpression), tsSymbol[K](dartRelationalExpression), tsSymbol[K](dartEqualityExpression), tsSymbol[K](dartLogicalAndExpression), tsSymbol[K](dartBitwiseAndExpression), tsSymbol[K](dartBitwiseOrExpression), tsSymbol[K](dartBitwiseXorExpression), tsSymbol[K](dartShiftExpression), tsSymbol[K](dartTypeCastExpression), tsSymbol[K](dartTypeTestExpression), tsSymbol[K](dartHidUnaryExpression))
                                                                 rules[dartHidMethodDeclarator] = tsSeq[K](tsSymbol[K](dartIdentifier), tsSymbol[K](dartFormalParameterList), tsChoice[K](tsSymbol[K](dartDimensions), tsBlank[K]()))
                                                                 rules[dartHidTripleDoubleQuoteEnd] = tsString[K]("\"\"\"")
                                                                 rules[dartAssertStatement] = tsSeq[K](tsSymbol[K](dartAssertion), tsString[K](";"))
                                                                 rules[dartTryStatement] = tsSeq[K](tsSymbol[K](dartHidTryHead), tsChoice[K](tsSymbol[K](dartFinallyClause), tsSeq[K](tsRepeat1[K](tsSymbol[K](dartHidOnPart)), tsChoice[K](tsSymbol[K](dartFinallyClause), tsBlank[K]()))))
                                                                 rules[dartHidExpressionWithoutCascade] = tsChoice[K](tsSymbol[K](dartAssignmentExpressionWithoutCascade), tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartThrowExpressionWithoutCascade))
                                                                 rules[dartDimensions] = tsRepeat1[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsString[K]("["), tsString[K]("]")))
                                                                 rules[dartConditionalExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSeq[K](tsString[K]("?"), tsSymbol[K](dartHidExpressionWithoutCascade), tsString[K](":"), tsSymbol[K](dartHidExpressionWithoutCascade)))
                                                                 rules[dartRelationalExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartRelationalOperator), tsSymbol[K](dartHidRealExpression)), tsSeq[K](tsSymbol[K](dartSuper), tsSymbol[K](dartRelationalOperator), tsSymbol[K](dartHidRealExpression)))
                                                                 rules[dartMixins] = tsSeq[K](tsString[K]("with"), tsSymbol[K](dartHidTypeNotVoidList))
                                                                 rules[dartThrowExpressionWithoutCascade] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](dartHidExpressionWithoutCascade))
                                                                 rules[dartBreakStatement] = tsSeq[K](tsSymbol[K](dartHidBreakBuiltin), tsChoice[K](tsSymbol[K](dartIdentifier), tsBlank[K]()), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartHidDeclaredIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidCovariant), tsBlank[K]()), tsSymbol[K](dartHidFinalConstVarOrType), tsSymbol[K](dartIdentifier))
                                                                 rules[dartHidAssignableSelectorPart] = tsSeq[K](tsRepeat[K](tsSymbol[K](dartSelector)), tsSymbol[K](dartHidAssignableSelector))
                                                                 rules[dartArgumentPart] = tsSeq[K](tsChoice[K](tsSymbol[K](dartTypeArguments), tsBlank[K]()), tsSymbol[K](dartArguments))
                                                                 rules[dartEnumBody] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](dartEnumConstant), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartEnumConstant))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("}"))
                                                                 rules[dartRelationalOperator] = tsChoice[K](tsString[K]("<"), tsString[K](">"), tsString[K]("<="), tsString[K](">="))
                                                                 rules[dartContinueStatement] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](dartIdentifier), tsBlank[K]()), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](dartParenthesizedExpression), tsSymbol[K](dartHidStatement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](dartHidStatement)), tsBlank[K]()))
                                                                 rules[dartConfigurationUri] = tsSeq[K](tsString[K]("if"), tsString[K]("("), tsSymbol[K](dartUriTest), tsString[K](")"), tsSymbol[K](dartUri))
                                                                 rules[dartHidTypeNotFunction] = tsChoice[K](tsSymbol[K](dartHidTypeNotVoidNotFunction), tsSymbol[K](dartVoidType))
                                                                 rules[dartVoidType] = tsString[K]("void")
                                                                 rules[dartHidSemicolon] = tsSeq[K](tsString[K](";"), tsChoice[K](tsSymbol[K](dartHidAutomaticSemicolon), tsBlank[K]()))
                                                                 rules[dartThrowExpression] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](dartHidExpression))
                                                                 rules[dartDecimalIntegerLiteral] = tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))
                                                                 rules[dartHidNullableType] = tsString[K]("?")
                                                                 rules[dartInterfaceTypeList] = tsSeq[K](tsSymbol[K](dartHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidType))))
                                                                 rules[dartHidTopLevelDefinition] = tsChoice[K](tsSymbol[K](dartClassDefinition), tsSymbol[K](dartEnumDeclaration), tsSymbol[K](dartExtensionDeclaration), tsSymbol[K](dartMixinDeclaration), tsSymbol[K](dartTypeAlias), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalBuiltin), tsBlank[K]()), tsSymbol[K](dartFunctionSignature), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalBuiltin), tsBlank[K]()), tsSymbol[K](dartGetterSignature), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidExternalBuiltin), tsBlank[K]()), tsSymbol[K](dartSetterSignature), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsSymbol[K](dartFunctionSignature), tsSymbol[K](dartFunctionBody)), tsSeq[K](tsSymbol[K](dartGetterSignature), tsSymbol[K](dartFunctionBody)), tsSeq[K](tsSymbol[K](dartSetterSignature), tsSymbol[K](dartFunctionBody)), tsSeq[K](tsChoice[K](tsSymbol[K](dartFinalBuiltin), tsSymbol[K](dartConstBuiltin)), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartStaticFinalDeclarationList), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsSymbol[K](dartHidLateBuiltin), tsSymbol[K](dartFinalBuiltin), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartInitializedIdentifierList), tsSymbol[K](dartHidSemicolon)), tsSeq[K](tsChoice[K](tsSymbol[K](dartHidLateBuiltin), tsBlank[K]()), tsChoice[K](tsSymbol[K](dartHidType), tsSymbol[K](dartInferredType)), tsSymbol[K](dartInitializedIdentifierList), tsSymbol[K](dartHidSemicolon)))
                                                                 rules[dartExpressionStatement] = tsSeq[K](tsSymbol[K](dartHidExpression), tsSymbol[K](dartHidSemicolon))
                                                                 rules[dartUnconditionalAssignableSelector] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](dartHidNullableType), tsBlank[K]()), tsString[K]("["), tsSymbol[K](dartHidExpression), tsString[K]("]")), tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)))
                                                                 rules[dartHidSet] = tsString[K]("set")
                                                                 rules[dartFieldInitializer] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](dartThis), tsString[K](".")), tsBlank[K]()), tsSymbol[K](dartIdentifier), tsString[K]("="), tsSymbol[K](dartHidRealExpression), tsRepeat[K](tsSymbol[K](dartCascadeSection)))
                                                                 rules[dartHidNative] = tsSeq[K](tsString[K]("native"), tsChoice[K](tsSymbol[K](dartStringLiteral), tsBlank[K]()))
                                                                 rules[dartArgument] = tsSymbol[K](dartHidExpression)
                                                                 rules[dartInitializerListEntry] = tsChoice[K](tsSeq[K](tsString[K]("super"), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartQualified)), tsBlank[K]()), tsSymbol[K](dartArguments)), tsSeq[K](tsString[K]("super"), tsSymbol[K](dartArguments)), tsSymbol[K](dartFieldInitializer), tsSymbol[K](dartAssertion))
                                                                 rules[dartRedirection] = tsSeq[K](tsString[K](":"), tsSymbol[K](dartThis), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](dartIdentifier)), tsBlank[K]()), tsSymbol[K](dartArguments))
                                                                 rules[dartSuper] = tsString[K]("super")
                                                                 rules[dartIfNullExpression] = tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartHidIfNullExpression))
                                                                 rules[dartInterfaces] = tsSeq[K](tsSymbol[K](dartHidImplements), tsSymbol[K](dartHidTypeNotVoidList))
                                                                 rules[dartPostfixOperator] = tsSymbol[K](dartIncrementOperator)
                                                                 rules[dartMultiplicativeOperator] = tsSymbol[K](dartHidMultiplicativeOperator)
                                                                 rules[dartHidStatic] = tsString[K]("static")
                                                                 rules[dartHidLateBuiltin] = tsString[K]("late")
                                                                 rules[dartInitializedIdentifierList] = tsSeq[K](tsSymbol[K](dartInitializedIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartInitializedIdentifier))))
                                                                 rules[dartTemplateSubstitution] = tsSeq[K](tsString[K]("$"), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSymbol[K](dartHidExpression), tsString[K]("}")), tsSymbol[K](dartIdentifierDollarEscaped)))
                                                                 rules[dartHidPrimary] = tsChoice[K](tsSymbol[K](dartHidLiteral), tsSymbol[K](dartFunctionExpression), tsSymbol[K](dartIdentifier), tsSymbol[K](dartNewExpression), tsSymbol[K](dartConstObjectExpression), tsSeq[K](tsString[K]("("), tsSymbol[K](dartHidExpression), tsString[K](")")), tsSymbol[K](dartThis), tsSeq[K](tsSymbol[K](dartSuper), tsSymbol[K](dartUnconditionalAssignableSelector)))
                                                                 rules[dartHidTypeNotVoidList] = tsSeq[K](tsSymbol[K](dartHidTypeNotVoid), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](dartHidTypeNotVoid))))
                                                                 rules[dartEqualityExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidRealExpression), tsSymbol[K](dartEqualityOperator), tsSymbol[K](dartHidRealExpression)), tsSeq[K](tsSymbol[K](dartSuper), tsSymbol[K](dartEqualityOperator), tsSymbol[K](dartHidRealExpression)))
                                                                 rules[dartHidFunctionBuiltinIdentifier] = tsString[K]("Function")
                                                                 rules[dartHidMethodHeader] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](dartTypeParameters), tsChoice[K](tsSymbol[K](dartHidMetadata), tsBlank[K]())), tsBlank[K]()), tsSymbol[K](dartHidType), tsSymbol[K](dartHidMethodDeclarator), tsChoice[K](tsSymbol[K](dartThrows), tsBlank[K]()))
                                                                 rules[dartHidStrictFormalParameterList] = tsChoice[K](tsSeq[K](tsString[K]("("), tsString[K](")")), tsSeq[K](tsString[K]("("), tsSymbol[K](dartHidNormalFormalParameters), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")")), tsSeq[K](tsString[K]("("), tsSymbol[K](dartHidNormalFormalParameters), tsString[K](","), tsSymbol[K](dartOptionalFormalParameters), tsString[K](")")), tsSeq[K](tsString[K]("("), tsSymbol[K](dartOptionalFormalParameters), tsString[K](")")))
                                                                 rules[dartInitializedIdentifier] = tsSeq[K](tsSymbol[K](dartIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](dartHidExpression)), tsBlank[K]()))
                                                                 rules[dartHidPostfixExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidPrimary), tsRepeat[K](tsSymbol[K](dartSelector))), tsSymbol[K](dartPostfixExpression))
                                                                 rules[dartTypeAlias] = tsChoice[K](tsSeq[K](tsSymbol[K](dartHidTypedef), tsSymbol[K](dartHidTypeName), tsChoice[K](tsSymbol[K](dartTypeParameters), tsBlank[K]()), tsString[K]("="), tsSymbol[K](dartFunctionType), tsString[K](";")), tsSeq[K](tsSymbol[K](dartHidTypedef), tsChoice[K](tsSymbol[K](dartHidType), tsBlank[K]()), tsSymbol[K](dartHidTypeName), tsSymbol[K](dartHidFormalParameterPart), tsString[K](";")))
                                                                 rules

