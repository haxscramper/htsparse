import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  CppNodeKind* = enum
    cppHidAbstractDeclarator                ## _abstract_declarator
    cppHidDeclarator                        ## _declarator
    cppHidExpression                        ## _expression
    cppHidFieldDeclarator                   ## _field_declarator
    cppHidStatement                         ## _statement
    cppHidTypeDeclarator                    ## _type_declarator
    cppHidTypeSpecifier                     ## _type_specifier
    cppAbstractArrayDeclarator              ## abstract_array_declarator
    cppAbstractFunctionDeclarator           ## abstract_function_declarator
    cppAbstractParenthesizedDeclarator      ## abstract_parenthesized_declarator
    cppAbstractPointerDeclarator            ## abstract_pointer_declarator
    cppAbstractReferenceDeclarator          ## abstract_reference_declarator
    cppAccessSpecifier                      ## access_specifier
    cppAliasDeclaration                     ## alias_declaration
    cppArgumentList                         ## argument_list
    cppArrayDeclarator                      ## array_declarator
    cppAssignmentExpression                 ## assignment_expression
    cppAttribute                            ## attribute
    cppAttributeDeclaration                 ## attribute_declaration
    cppAttributeSpecifier                   ## attribute_specifier
    cppAttributedDeclarator                 ## attributed_declarator
    cppAttributedStatement                  ## attributed_statement
    cppBaseClassClause                      ## base_class_clause
    cppBinaryExpression                     ## binary_expression
    cppBitfieldClause                       ## bitfield_clause
    cppBreakStatement                       ## break_statement
    cppCallExpression                       ## call_expression
    cppCaseStatement                        ## case_statement
    cppCastExpression                       ## cast_expression
    cppCatchClause                          ## catch_clause
    cppCharLiteral                          ## char_literal
    cppClassSpecifier                       ## class_specifier
    cppCoAwaitExpression                    ## co_await_expression
    cppCoReturnStatement                    ## co_return_statement
    cppCoYieldStatement                     ## co_yield_statement
    cppCommaExpression                      ## comma_expression
    cppCompoundLiteralExpression            ## compound_literal_expression
    cppCompoundStatement                    ## compound_statement
    cppConcatenatedString                   ## concatenated_string
    cppConditionClause                      ## condition_clause
    cppConditionalExpression                ## conditional_expression
    cppContinueStatement                    ## continue_statement
    cppDeclaration                          ## declaration
    cppDeclarationList                      ## declaration_list
    cppDecltype                             ## decltype
    cppDefaultMethodClause                  ## default_method_clause
    cppDeleteExpression                     ## delete_expression
    cppDeleteMethodClause                   ## delete_method_clause
    cppDependentName                        ## dependent_name
    cppDependentType                        ## dependent_type
    cppDestructorName                       ## destructor_name
    cppDoStatement                          ## do_statement
    cppEnumSpecifier                        ## enum_specifier
    cppEnumerator                           ## enumerator
    cppEnumeratorList                       ## enumerator_list
    cppExplicitFunctionSpecifier            ## explicit_function_specifier
    cppExpressionStatement                  ## expression_statement
    cppFieldDeclaration                     ## field_declaration
    cppFieldDeclarationList                 ## field_declaration_list
    cppFieldDesignator                      ## field_designator
    cppFieldExpression                      ## field_expression
    cppFieldInitializer                     ## field_initializer
    cppFieldInitializerList                 ## field_initializer_list
    cppForRangeLoop                         ## for_range_loop
    cppForStatement                         ## for_statement
    cppFriendDeclaration                    ## friend_declaration
    cppFunctionDeclarator                   ## function_declarator
    cppFunctionDefinition                   ## function_definition
    cppGotoStatement                        ## goto_statement
    cppIfStatement                          ## if_statement
    cppInitDeclarator                       ## init_declarator
    cppInitializerList                      ## initializer_list
    cppInitializerPair                      ## initializer_pair
    cppLabeledStatement                     ## labeled_statement
    cppLambdaCaptureSpecifier               ## lambda_capture_specifier
    cppLambdaDefaultCapture                 ## lambda_default_capture
    cppLambdaExpression                     ## lambda_expression
    cppLinkageSpecification                 ## linkage_specification
    cppMsBasedModifier                      ## ms_based_modifier
    cppMsCallModifier                       ## ms_call_modifier
    cppMsDeclspecModifier                   ## ms_declspec_modifier
    cppMsPointerModifier                    ## ms_pointer_modifier
    cppMsUnalignedPtrModifier               ## ms_unaligned_ptr_modifier
    cppNamespaceAliasDefinition             ## namespace_alias_definition
    cppNamespaceDefinition                  ## namespace_definition
    cppNamespaceDefinitionName              ## namespace_definition_name
    cppNewDeclarator                        ## new_declarator
    cppNewExpression                        ## new_expression
    cppNoexcept                             ## noexcept
    cppOperatorCast                         ## operator_cast
    cppOperatorName                         ## operator_name
    cppOptionalParameterDeclaration         ## optional_parameter_declaration
    cppOptionalTypeParameterDeclaration     ## optional_type_parameter_declaration
    cppParameterDeclaration                 ## parameter_declaration
    cppParameterList                        ## parameter_list
    cppParameterPackExpansion               ## parameter_pack_expansion
    cppParenthesizedDeclarator              ## parenthesized_declarator
    cppParenthesizedExpression              ## parenthesized_expression
    cppPointerDeclarator                    ## pointer_declarator
    cppPointerExpression                    ## pointer_expression
    cppPreprocCall                          ## preproc_call
    cppPreprocDef                           ## preproc_def
    cppPreprocDefined                       ## preproc_defined
    cppPreprocElif                          ## preproc_elif
    cppPreprocElse                          ## preproc_else
    cppPreprocFunctionDef                   ## preproc_function_def
    cppPreprocIf                            ## preproc_if
    cppPreprocIfdef                         ## preproc_ifdef
    cppPreprocInclude                       ## preproc_include
    cppPreprocParams                        ## preproc_params
    cppQpropertyDeclaration                 ## qproperty_declaration
    cppQualifiedIdentifier                  ## qualified_identifier
    cppRefQualifier                         ## ref_qualifier
    cppReferenceDeclarator                  ## reference_declarator
    cppReturnStatement                      ## return_statement
    cppSizedTypeSpecifier                   ## sized_type_specifier
    cppSizeofExpression                     ## sizeof_expression
    cppStaticAssertDeclaration              ## static_assert_declaration
    cppStorageClassSpecifier                ## storage_class_specifier
    cppStringLiteral                        ## string_literal
    cppStructSpecifier                      ## struct_specifier
    cppStructuredBindingDeclarator          ## structured_binding_declarator
    cppSubscriptDesignator                  ## subscript_designator
    cppSubscriptExpression                  ## subscript_expression
    cppSwitchStatement                      ## switch_statement
    cppTemplateArgumentList                 ## template_argument_list
    cppTemplateDeclaration                  ## template_declaration
    cppTemplateFunction                     ## template_function
    cppTemplateInstantiation                ## template_instantiation
    cppTemplateMethod                       ## template_method
    cppTemplateParameterList                ## template_parameter_list
    cppTemplateTemplateParameterDeclaration ## template_template_parameter_declaration
    cppTemplateType                         ## template_type
    cppThrowSpecifier                       ## throw_specifier
    cppThrowStatement                       ## throw_statement
    cppTrailingReturnType                   ## trailing_return_type
    cppTranslationUnit                      ## translation_unit
    cppTryStatement                         ## try_statement
    cppTypeDefinition                       ## type_definition
    cppTypeDescriptor                       ## type_descriptor
    cppTypeParameterDeclaration             ## type_parameter_declaration
    cppTypeQualifier                        ## type_qualifier
    cppUnaryExpression                      ## unary_expression
    cppUnionSpecifier                       ## union_specifier
    cppUpdateExpression                     ## update_expression
    cppUserDefinedLiteral                   ## user_defined_literal
    cppUsingDeclaration                     ## using_declaration
    cppVariadicDeclarator                   ## variadic_declarator
    cppVariadicParameterDeclaration         ## variadic_parameter_declaration
    cppVariadicTypeParameterDeclaration     ## variadic_type_parameter_declaration
    cppVirtualFunctionSpecifier             ## virtual_function_specifier
    cppVirtualSpecifier                     ## virtual_specifier
    cppWhileStatement                       ## while_statement
    cppNewlineTok                           ##
                                            ##
    cppExclamationTok                       ## !
    cppExclamationEqualTok                  ## !=
    cppQuoteTok                             ## "
    cppDoubleQuoteTok                       ## ""
    cppHashdefineTok                        ## #define
    cppHashelifTok                          ## #elif
    cppHashelseTok                          ## #else
    cppHashendifTok                         ## #endif
    cppHashifTok                            ## #if
    cppHashifdefTok                         ## #ifdef
    cppHashifndefTok                        ## #ifndef
    cppHashincludeTok                       ## #include
    cppPercentTok                           ## %
    cppPercentEqualTok                      ## %=
    cppAmpersandTok                         ## &
    cppDoubleAmpersandTok                   ## &&
    cppAmpersandEqualTok                    ## &=
    cppApostropheTok                        ## '
    cppLParTok                              ## (
    cppLParRParTok                          ## ()
    cppRParTok                              ## )
    cppAsteriskTok                          ## *
    cppAsteriskEqualTok                     ## *=
    cppPlusTok                              ## +
    cppDoublePlusTok                        ## ++
    cppPlusEqualTok                         ## +=
    cppCommaTok                             ## ,
    cppMinusTok                             ## -
    cppDoubleMinusTok                       ## --
    cppMinusEqualTok                        ## -=
    cppMinusGreaterThanTok                  ## ->
    cppMinusGreaterThanAsteriskTok          ## ->*
    cppDotTok                               ## .
    cppTripleDotTok                         ## ...
    cppSlashTok                             ## /
    cppSlashEqualTok                        ## /=
    cppColonTok                             ## :
    cppDoubleColonTok                       ## ::
    cppSemicolonTok                         ## ;
    cppLessThanTok                          ## <
    cppDoubleLessThanTok                    ## <<
    cppDoubleLessThanEqualTok               ## <<=
    cppLessThanEqualTok                     ## <=
    cppEqualTok                             ## =
    cppDoubleEqualTok                       ## ==
    cppGreaterThanTok                       ## >
    cppGreaterThanEqualTok                  ## >=
    cppDoubleGreaterThanTok                 ## >>
    cppDoubleGreaterThanEqualTok            ## >>=
    cppQuestionTok                          ## ?
    cppLQuoteTok                            ## L"
    cppLApostropheTok                       ## L'
    cppQPROPERTYTok                         ## Q_PROPERTY
    cppUQuoteTok                            ## U"
    cppUApostropheTok                       ## U'
    cppLBrackTok                            ## [
    cppDoubleLBrackTok                      ## [[
    cppLBrackRBrackTok                      ## []
    cppRBrackTok                            ## ]
    cppDoubleRBrackTok                      ## ]]
    cppAccentTok                            ## ^
    cppAccentEqualTok                       ## ^=
    cppHidAtomicTok                         ## _Atomic
    cppHidAttributeTok                      ## __attribute__
    cppHidBasedTok                          ## __based
    cppHidCdeclTok                          ## __cdecl
    cppHidClrcallTok                        ## __clrcall
    cppHidDeclspecTok                       ## __declspec
    cppHidFastcallTok                       ## __fastcall
    cppHidStdcallTok                        ## __stdcall
    cppHidThiscallTok                       ## __thiscall
    cppHidUnalignedTok                      ## __unaligned
    cppHidVectorcallTok                     ## __vectorcall
    cppAuto                                 ## auto
    cppBreakTok                             ## break
    cppCaseTok                              ## case
    cppCatchTok                             ## catch
    cppClassTok                             ## class
    cppCoAwaitTok                           ## co_await
    cppCoReturnTok                          ## co_return
    cppCoYieldTok                           ## co_yield
    cppComment                              ## comment
    cppConstTok                             ## const
    cppConstexprTok                         ## constexpr
    cppContinueTok                          ## continue
    cppDecltypeTok                          ## decltype
    cppDefaultTok                           ## default
    cppDefinedTok                           ## defined
    cppDeleteTok                            ## delete
    cppDoTok                                ## do
    cppElseTok                              ## else
    cppEnumTok                              ## enum
    cppEscapeSequence                       ## escape_sequence
    cppExplicitTok                          ## explicit
    cppExternTok                            ## extern
    cppFalse                                ## false
    cppFieldIdentifier                      ## field_identifier
    cppFinalTok                             ## final
    cppForTok                               ## for
    cppFriendTok                            ## friend
    cppGotoTok                              ## goto
    cppIdentifier                           ## identifier
    cppIfTok                                ## if
    cppInlineTok                            ## inline
    cppLiteralSuffix                        ## literal_suffix
    cppLongTok                              ## long
    cppMsRestrictModifier                   ## ms_restrict_modifier
    cppMsSignedPtrModifier                  ## ms_signed_ptr_modifier
    cppMsUnsignedPtrModifier                ## ms_unsigned_ptr_modifier
    cppMutableTok                           ## mutable
    cppNamespaceTok                         ## namespace
    cppNamespaceIdentifier                  ## namespace_identifier
    cppNewTok                               ## new
    cppNoexceptTok                          ## noexcept
    cppNull                                 ## null
    cppNullptr                              ## nullptr
    cppNumberLiteral                        ## number_literal
    cppOperatorTok                          ## operator
    cppOverrideTok                          ## override
    cppPreprocArg                           ## preproc_arg
    cppPreprocDirective                     ## preproc_directive
    cppPrimitiveType                        ## primitive_type
    cppPrivateTok                           ## private
    cppProtectedTok                         ## protected
    cppPublicTok                            ## public
    cppRawStringLiteral                     ## raw_string_literal
    cppRegisterTok                          ## register
    cppRestrictTok                          ## restrict
    cppReturnTok                            ## return
    cppShortTok                             ## short
    cppSignalsTok                           ## signals
    cppSignedTok                            ## signed
    cppSizeofTok                            ## sizeof
    cppSlotsTok                             ## slots
    cppStatementIdentifier                  ## statement_identifier
    cppStaticTok                            ## static
    cppStaticAssertTok                      ## static_assert
    cppStructTok                            ## struct
    cppSwitchTok                            ## switch
    cppSystemLibString                      ## system_lib_string
    cppTemplateTok                          ## template
    cppThis                                 ## this
    cppThreadLocalTok                       ## thread_local
    cppThrowTok                             ## throw
    cppTrue                                 ## true
    cppTryTok                               ## try
    cppTypeIdentifier                       ## type_identifier
    cppTypedefTok                           ## typedef
    cppTypenameTok                          ## typename
    cppU8QuoteTok                           ## u8"
    cppU8ApostropheTok                      ## u8'
    cppUnionTok                             ## union
    cppUnsignedTok                          ## unsigned
    cppUsingTok                             ## using
    cppVirtualTok                           ## virtual
    cppVolatileTok                          ## volatile
    cppWhileTok                             ## while
    cppLCurlyTok                            ## {
    cppPipeTok                              ## |
    cppPipeEqualTok                         ## |=
    cppDoublePipeTok                        ## ||
    cppRCurlyTok                            ## }
    cppTildeTok                             ## ~
    cppFunctionTypeDeclarator               ## function_type_declarator
    cppVariadicReferenceDeclarator          ## variadic_reference_declarator
    cppPreprocArgumentList                  ## preproc_argument_list
    cppReferenceFieldDeclarator             ## reference_field_declarator
    cppPreprocElseInFieldDeclarationList    ## preproc_else_in_field_declaration_list
    cppAttributedFieldDeclarator            ## attributed_field_declarator
    cppOperatorCastDeclaration              ## operator_cast_declaration
    cppAttributedNonCaseStatement           ## attributed_non_case_statement
    cppHidClassName                         ## _class_name
    cppQualifiedTypeIdentifier              ## qualified_type_identifier
    cppQualifiedOperatorCastIdentifier      ## qualified_operator_cast_identifier
    cppArrayTypeDeclarator                  ## array_type_declarator
    cppPreprocUnaryExpression               ## preproc_unary_expression
    cppPointerFieldDeclarator               ## pointer_field_declarator
    cppPreprocElifInFieldDeclarationList    ## preproc_elif_in_field_declaration_list
    cppHidFieldIdentifier                   ## _field_identifier
    cppPreprocParenthesizedExpression       ## preproc_parenthesized_expression
    cppParenthesizedTypeDeclarator          ## parenthesized_type_declarator
    cppConstructorOrDestructorDefinition    ## constructor_or_destructor_definition
    cppHidDeclarationSpecifiers             ## _declaration_specifiers
    cppQualifiedFieldIdentifier             ## qualified_field_identifier
    cppPreprocBinaryExpression              ## preproc_binary_expression
    cppConditionDeclaration                 ## condition_declaration
    cppPreprocIfdefInFieldDeclarationList   ## preproc_ifdef_in_field_declaration_list
    cppHidEnumBaseClause                    ## _enum_base_clause
    cppDependentFieldIdentifier             ## dependent_field_identifier
    cppHidTopLevelItem                      ## _top_level_item
    cppDependentIdentifier                  ## dependent_identifier
    cppPointerTypeDeclarator                ## pointer_type_declarator
    cppMacroTypeSpecifier                   ## macro_type_specifier
    cppHidTypeIdentifier                    ## _type_identifier
    cppPreprocIfInFieldDeclarationList      ## preproc_if_in_field_declaration_list
    cppPreprocCallExpression                ## preproc_call_expression
    cppVariadicParameter                    ## variadic_parameter
    cppDependentTypeIdentifier              ## dependent_type_identifier
    cppInlineMethodDefinition               ## inline_method_definition
    cppOperatorCastDefinition               ## operator_cast_definition
    cppHidFieldDeclarationListItem          ## _field_declaration_list_item
    cppHidDeclarationModifiers              ## _declaration_modifiers
    cppHidConstructorSpecifiers             ## _constructor_specifiers
    cppConstructorOrDestructorDeclaration   ## constructor_or_destructor_declaration
    cppHidScopeResolution                   ## _scope_resolution
    cppAttributedTypeDeclarator             ## attributed_type_declarator
    cppHidNamespaceIdentifier               ## _namespace_identifier
    cppHidStatementIdentifier               ## _statement_identifier
    cppArrayFieldDeclarator                 ## array_field_declarator
    cppHidAssignmentLeftExpression          ## _assignment_left_expression
    cppParenthesizedFieldDeclarator         ## parenthesized_field_declarator
    cppHidPreprocExpression                 ## _preproc_expression
    cppHidNonCaseStatement                  ## _non_case_statement
    cppTypeParameterPackExpansion           ## type_parameter_pack_expansion
    cppHidEmptyDeclaration                  ## _empty_declaration
    cppFunctionFieldDeclarator              ## function_field_declarator
    cppSyntaxError                          ## Tree-sitter parser syntax error

proc strRepr*(kind: CppNodeKind): string =
  case kind:
    of cppHidAbstractDeclarator:                "_abstract_declarator"
    of cppHidDeclarator:                        "_declarator"
    of cppHidExpression:                        "_expression"
    of cppHidFieldDeclarator:                   "_field_declarator"
    of cppHidStatement:                         "_statement"
    of cppHidTypeDeclarator:                    "_type_declarator"
    of cppHidTypeSpecifier:                     "_type_specifier"
    of cppAbstractArrayDeclarator:              "abstract_array_declarator"
    of cppAbstractFunctionDeclarator:           "abstract_function_declarator"
    of cppAbstractParenthesizedDeclarator:      "abstract_parenthesized_declarator"
    of cppAbstractPointerDeclarator:            "abstract_pointer_declarator"
    of cppAbstractReferenceDeclarator:          "abstract_reference_declarator"
    of cppAccessSpecifier:                      "access_specifier"
    of cppAliasDeclaration:                     "alias_declaration"
    of cppArgumentList:                         "argument_list"
    of cppArrayDeclarator:                      "array_declarator"
    of cppAssignmentExpression:                 "assignment_expression"
    of cppAttribute:                            "attribute"
    of cppAttributeDeclaration:                 "attribute_declaration"
    of cppAttributeSpecifier:                   "attribute_specifier"
    of cppAttributedDeclarator:                 "attributed_declarator"
    of cppAttributedStatement:                  "attributed_statement"
    of cppBaseClassClause:                      "base_class_clause"
    of cppBinaryExpression:                     "binary_expression"
    of cppBitfieldClause:                       "bitfield_clause"
    of cppBreakStatement:                       "break_statement"
    of cppCallExpression:                       "call_expression"
    of cppCaseStatement:                        "case_statement"
    of cppCastExpression:                       "cast_expression"
    of cppCatchClause:                          "catch_clause"
    of cppCharLiteral:                          "char_literal"
    of cppClassSpecifier:                       "class_specifier"
    of cppCoAwaitExpression:                    "co_await_expression"
    of cppCoReturnStatement:                    "co_return_statement"
    of cppCoYieldStatement:                     "co_yield_statement"
    of cppCommaExpression:                      "comma_expression"
    of cppCompoundLiteralExpression:            "compound_literal_expression"
    of cppCompoundStatement:                    "compound_statement"
    of cppConcatenatedString:                   "concatenated_string"
    of cppConditionClause:                      "condition_clause"
    of cppConditionalExpression:                "conditional_expression"
    of cppContinueStatement:                    "continue_statement"
    of cppDeclaration:                          "declaration"
    of cppDeclarationList:                      "declaration_list"
    of cppDecltype:                             "decltype"
    of cppDefaultMethodClause:                  "default_method_clause"
    of cppDeleteExpression:                     "delete_expression"
    of cppDeleteMethodClause:                   "delete_method_clause"
    of cppDependentName:                        "dependent_name"
    of cppDependentType:                        "dependent_type"
    of cppDestructorName:                       "destructor_name"
    of cppDoStatement:                          "do_statement"
    of cppEnumSpecifier:                        "enum_specifier"
    of cppEnumerator:                           "enumerator"
    of cppEnumeratorList:                       "enumerator_list"
    of cppExplicitFunctionSpecifier:            "explicit_function_specifier"
    of cppExpressionStatement:                  "expression_statement"
    of cppFieldDeclaration:                     "field_declaration"
    of cppFieldDeclarationList:                 "field_declaration_list"
    of cppFieldDesignator:                      "field_designator"
    of cppFieldExpression:                      "field_expression"
    of cppFieldInitializer:                     "field_initializer"
    of cppFieldInitializerList:                 "field_initializer_list"
    of cppForRangeLoop:                         "for_range_loop"
    of cppForStatement:                         "for_statement"
    of cppFriendDeclaration:                    "friend_declaration"
    of cppFunctionDeclarator:                   "function_declarator"
    of cppFunctionDefinition:                   "function_definition"
    of cppGotoStatement:                        "goto_statement"
    of cppIfStatement:                          "if_statement"
    of cppInitDeclarator:                       "init_declarator"
    of cppInitializerList:                      "initializer_list"
    of cppInitializerPair:                      "initializer_pair"
    of cppLabeledStatement:                     "labeled_statement"
    of cppLambdaCaptureSpecifier:               "lambda_capture_specifier"
    of cppLambdaDefaultCapture:                 "lambda_default_capture"
    of cppLambdaExpression:                     "lambda_expression"
    of cppLinkageSpecification:                 "linkage_specification"
    of cppMsBasedModifier:                      "ms_based_modifier"
    of cppMsCallModifier:                       "ms_call_modifier"
    of cppMsDeclspecModifier:                   "ms_declspec_modifier"
    of cppMsPointerModifier:                    "ms_pointer_modifier"
    of cppMsUnalignedPtrModifier:               "ms_unaligned_ptr_modifier"
    of cppNamespaceAliasDefinition:             "namespace_alias_definition"
    of cppNamespaceDefinition:                  "namespace_definition"
    of cppNamespaceDefinitionName:              "namespace_definition_name"
    of cppNewDeclarator:                        "new_declarator"
    of cppNewExpression:                        "new_expression"
    of cppNoexcept:                             "noexcept"
    of cppOperatorCast:                         "operator_cast"
    of cppOperatorName:                         "operator_name"
    of cppOptionalParameterDeclaration:         "optional_parameter_declaration"
    of cppOptionalTypeParameterDeclaration:     "optional_type_parameter_declaration"
    of cppParameterDeclaration:                 "parameter_declaration"
    of cppParameterList:                        "parameter_list"
    of cppParameterPackExpansion:               "parameter_pack_expansion"
    of cppParenthesizedDeclarator:              "parenthesized_declarator"
    of cppParenthesizedExpression:              "parenthesized_expression"
    of cppPointerDeclarator:                    "pointer_declarator"
    of cppPointerExpression:                    "pointer_expression"
    of cppPreprocCall:                          "preproc_call"
    of cppPreprocDef:                           "preproc_def"
    of cppPreprocDefined:                       "preproc_defined"
    of cppPreprocElif:                          "preproc_elif"
    of cppPreprocElse:                          "preproc_else"
    of cppPreprocFunctionDef:                   "preproc_function_def"
    of cppPreprocIf:                            "preproc_if"
    of cppPreprocIfdef:                         "preproc_ifdef"
    of cppPreprocInclude:                       "preproc_include"
    of cppPreprocParams:                        "preproc_params"
    of cppQpropertyDeclaration:                 "qproperty_declaration"
    of cppQualifiedIdentifier:                  "qualified_identifier"
    of cppRefQualifier:                         "ref_qualifier"
    of cppReferenceDeclarator:                  "reference_declarator"
    of cppReturnStatement:                      "return_statement"
    of cppSizedTypeSpecifier:                   "sized_type_specifier"
    of cppSizeofExpression:                     "sizeof_expression"
    of cppStaticAssertDeclaration:              "static_assert_declaration"
    of cppStorageClassSpecifier:                "storage_class_specifier"
    of cppStringLiteral:                        "string_literal"
    of cppStructSpecifier:                      "struct_specifier"
    of cppStructuredBindingDeclarator:          "structured_binding_declarator"
    of cppSubscriptDesignator:                  "subscript_designator"
    of cppSubscriptExpression:                  "subscript_expression"
    of cppSwitchStatement:                      "switch_statement"
    of cppTemplateArgumentList:                 "template_argument_list"
    of cppTemplateDeclaration:                  "template_declaration"
    of cppTemplateFunction:                     "template_function"
    of cppTemplateInstantiation:                "template_instantiation"
    of cppTemplateMethod:                       "template_method"
    of cppTemplateParameterList:                "template_parameter_list"
    of cppTemplateTemplateParameterDeclaration: "template_template_parameter_declaration"
    of cppTemplateType:                         "template_type"
    of cppThrowSpecifier:                       "throw_specifier"
    of cppThrowStatement:                       "throw_statement"
    of cppTrailingReturnType:                   "trailing_return_type"
    of cppTranslationUnit:                      "translation_unit"
    of cppTryStatement:                         "try_statement"
    of cppTypeDefinition:                       "type_definition"
    of cppTypeDescriptor:                       "type_descriptor"
    of cppTypeParameterDeclaration:             "type_parameter_declaration"
    of cppTypeQualifier:                        "type_qualifier"
    of cppUnaryExpression:                      "unary_expression"
    of cppUnionSpecifier:                       "union_specifier"
    of cppUpdateExpression:                     "update_expression"
    of cppUserDefinedLiteral:                   "user_defined_literal"
    of cppUsingDeclaration:                     "using_declaration"
    of cppVariadicDeclarator:                   "variadic_declarator"
    of cppVariadicParameterDeclaration:         "variadic_parameter_declaration"
    of cppVariadicTypeParameterDeclaration:     "variadic_type_parameter_declaration"
    of cppVirtualFunctionSpecifier:             "virtual_function_specifier"
    of cppVirtualSpecifier:                     "virtual_specifier"
    of cppWhileStatement:                       "while_statement"
    of cppNewlineTok:                           "\x0A"
    of cppExclamationTok:                       "!"
    of cppExclamationEqualTok:                  "!="
    of cppQuoteTok:                             "\""
    of cppDoubleQuoteTok:                       "\"\""
    of cppHashdefineTok:                        "#define"
    of cppHashelifTok:                          "#elif"
    of cppHashelseTok:                          "#else"
    of cppHashendifTok:                         "#endif"
    of cppHashifTok:                            "#if"
    of cppHashifdefTok:                         "#ifdef"
    of cppHashifndefTok:                        "#ifndef"
    of cppHashincludeTok:                       "#include"
    of cppPercentTok:                           "%"
    of cppPercentEqualTok:                      "%="
    of cppAmpersandTok:                         "&"
    of cppDoubleAmpersandTok:                   "&&"
    of cppAmpersandEqualTok:                    "&="
    of cppApostropheTok:                        "\'"
    of cppLParTok:                              "("
    of cppLParRParTok:                          "()"
    of cppRParTok:                              ")"
    of cppAsteriskTok:                          "*"
    of cppAsteriskEqualTok:                     "*="
    of cppPlusTok:                              "+"
    of cppDoublePlusTok:                        "++"
    of cppPlusEqualTok:                         "+="
    of cppCommaTok:                             ","
    of cppMinusTok:                             "-"
    of cppDoubleMinusTok:                       "--"
    of cppMinusEqualTok:                        "-="
    of cppMinusGreaterThanTok:                  "->"
    of cppMinusGreaterThanAsteriskTok:          "->*"
    of cppDotTok:                               "."
    of cppTripleDotTok:                         "..."
    of cppSlashTok:                             "/"
    of cppSlashEqualTok:                        "/="
    of cppColonTok:                             ":"
    of cppDoubleColonTok:                       "::"
    of cppSemicolonTok:                         ";"
    of cppLessThanTok:                          "<"
    of cppDoubleLessThanTok:                    "<<"
    of cppDoubleLessThanEqualTok:               "<<="
    of cppLessThanEqualTok:                     "<="
    of cppEqualTok:                             "="
    of cppDoubleEqualTok:                       "=="
    of cppGreaterThanTok:                       ">"
    of cppGreaterThanEqualTok:                  ">="
    of cppDoubleGreaterThanTok:                 ">>"
    of cppDoubleGreaterThanEqualTok:            ">>="
    of cppQuestionTok:                          "?"
    of cppLQuoteTok:                            "L\""
    of cppLApostropheTok:                       "L\'"
    of cppQPROPERTYTok:                         "Q_PROPERTY"
    of cppUQuoteTok:                            "U\""
    of cppUApostropheTok:                       "U\'"
    of cppLBrackTok:                            "["
    of cppDoubleLBrackTok:                      "[["
    of cppLBrackRBrackTok:                      "[]"
    of cppRBrackTok:                            "]"
    of cppDoubleRBrackTok:                      "]]"
    of cppAccentTok:                            "^"
    of cppAccentEqualTok:                       "^="
    of cppHidAtomicTok:                         "_Atomic"
    of cppHidAttributeTok:                      "__attribute__"
    of cppHidBasedTok:                          "__based"
    of cppHidCdeclTok:                          "__cdecl"
    of cppHidClrcallTok:                        "__clrcall"
    of cppHidDeclspecTok:                       "__declspec"
    of cppHidFastcallTok:                       "__fastcall"
    of cppHidStdcallTok:                        "__stdcall"
    of cppHidThiscallTok:                       "__thiscall"
    of cppHidUnalignedTok:                      "__unaligned"
    of cppHidVectorcallTok:                     "__vectorcall"
    of cppAuto:                                 "auto"
    of cppBreakTok:                             "break"
    of cppCaseTok:                              "case"
    of cppCatchTok:                             "catch"
    of cppClassTok:                             "class"
    of cppCoAwaitTok:                           "co_await"
    of cppCoReturnTok:                          "co_return"
    of cppCoYieldTok:                           "co_yield"
    of cppComment:                              "comment"
    of cppConstTok:                             "const"
    of cppConstexprTok:                         "constexpr"
    of cppContinueTok:                          "continue"
    of cppDecltypeTok:                          "decltype"
    of cppDefaultTok:                           "default"
    of cppDefinedTok:                           "defined"
    of cppDeleteTok:                            "delete"
    of cppDoTok:                                "do"
    of cppElseTok:                              "else"
    of cppEnumTok:                              "enum"
    of cppEscapeSequence:                       "escape_sequence"
    of cppExplicitTok:                          "explicit"
    of cppExternTok:                            "extern"
    of cppFalse:                                "false"
    of cppFieldIdentifier:                      "field_identifier"
    of cppFinalTok:                             "final"
    of cppForTok:                               "for"
    of cppFriendTok:                            "friend"
    of cppGotoTok:                              "goto"
    of cppIdentifier:                           "identifier"
    of cppIfTok:                                "if"
    of cppInlineTok:                            "inline"
    of cppLiteralSuffix:                        "literal_suffix"
    of cppLongTok:                              "long"
    of cppMsRestrictModifier:                   "ms_restrict_modifier"
    of cppMsSignedPtrModifier:                  "ms_signed_ptr_modifier"
    of cppMsUnsignedPtrModifier:                "ms_unsigned_ptr_modifier"
    of cppMutableTok:                           "mutable"
    of cppNamespaceTok:                         "namespace"
    of cppNamespaceIdentifier:                  "namespace_identifier"
    of cppNewTok:                               "new"
    of cppNoexceptTok:                          "noexcept"
    of cppNull:                                 "null"
    of cppNullptr:                              "nullptr"
    of cppNumberLiteral:                        "number_literal"
    of cppOperatorTok:                          "operator"
    of cppOverrideTok:                          "override"
    of cppPreprocArg:                           "preproc_arg"
    of cppPreprocDirective:                     "preproc_directive"
    of cppPrimitiveType:                        "primitive_type"
    of cppPrivateTok:                           "private"
    of cppProtectedTok:                         "protected"
    of cppPublicTok:                            "public"
    of cppRawStringLiteral:                     "raw_string_literal"
    of cppRegisterTok:                          "register"
    of cppRestrictTok:                          "restrict"
    of cppReturnTok:                            "return"
    of cppShortTok:                             "short"
    of cppSignalsTok:                           "signals"
    of cppSignedTok:                            "signed"
    of cppSizeofTok:                            "sizeof"
    of cppSlotsTok:                             "slots"
    of cppStatementIdentifier:                  "statement_identifier"
    of cppStaticTok:                            "static"
    of cppStaticAssertTok:                      "static_assert"
    of cppStructTok:                            "struct"
    of cppSwitchTok:                            "switch"
    of cppSystemLibString:                      "system_lib_string"
    of cppTemplateTok:                          "template"
    of cppThis:                                 "this"
    of cppThreadLocalTok:                       "thread_local"
    of cppThrowTok:                             "throw"
    of cppTrue:                                 "true"
    of cppTryTok:                               "try"
    of cppTypeIdentifier:                       "type_identifier"
    of cppTypedefTok:                           "typedef"
    of cppTypenameTok:                          "typename"
    of cppU8QuoteTok:                           "u8\""
    of cppU8ApostropheTok:                      "u8\'"
    of cppUnionTok:                             "union"
    of cppUnsignedTok:                          "unsigned"
    of cppUsingTok:                             "using"
    of cppVirtualTok:                           "virtual"
    of cppVolatileTok:                          "volatile"
    of cppWhileTok:                             "while"
    of cppLCurlyTok:                            "{"
    of cppPipeTok:                              "|"
    of cppPipeEqualTok:                         "|="
    of cppDoublePipeTok:                        "||"
    of cppRCurlyTok:                            "}"
    of cppTildeTok:                             "~"
    of cppFunctionTypeDeclarator:               "function_type_declarator"
    of cppVariadicReferenceDeclarator:          "variadic_reference_declarator"
    of cppPreprocArgumentList:                  "preproc_argument_list"
    of cppReferenceFieldDeclarator:             "reference_field_declarator"
    of cppPreprocElseInFieldDeclarationList:    "preproc_else_in_field_declaration_list"
    of cppAttributedFieldDeclarator:            "attributed_field_declarator"
    of cppOperatorCastDeclaration:              "operator_cast_declaration"
    of cppAttributedNonCaseStatement:           "attributed_non_case_statement"
    of cppHidClassName:                         "_class_name"
    of cppQualifiedTypeIdentifier:              "qualified_type_identifier"
    of cppQualifiedOperatorCastIdentifier:      "qualified_operator_cast_identifier"
    of cppArrayTypeDeclarator:                  "array_type_declarator"
    of cppPreprocUnaryExpression:               "preproc_unary_expression"
    of cppPointerFieldDeclarator:               "pointer_field_declarator"
    of cppPreprocElifInFieldDeclarationList:    "preproc_elif_in_field_declaration_list"
    of cppHidFieldIdentifier:                   "_field_identifier"
    of cppPreprocParenthesizedExpression:       "preproc_parenthesized_expression"
    of cppParenthesizedTypeDeclarator:          "parenthesized_type_declarator"
    of cppConstructorOrDestructorDefinition:    "constructor_or_destructor_definition"
    of cppHidDeclarationSpecifiers:             "_declaration_specifiers"
    of cppQualifiedFieldIdentifier:             "qualified_field_identifier"
    of cppPreprocBinaryExpression:              "preproc_binary_expression"
    of cppConditionDeclaration:                 "condition_declaration"
    of cppPreprocIfdefInFieldDeclarationList:   "preproc_ifdef_in_field_declaration_list"
    of cppHidEnumBaseClause:                    "_enum_base_clause"
    of cppDependentFieldIdentifier:             "dependent_field_identifier"
    of cppHidTopLevelItem:                      "_top_level_item"
    of cppDependentIdentifier:                  "dependent_identifier"
    of cppPointerTypeDeclarator:                "pointer_type_declarator"
    of cppMacroTypeSpecifier:                   "macro_type_specifier"
    of cppHidTypeIdentifier:                    "_type_identifier"
    of cppPreprocIfInFieldDeclarationList:      "preproc_if_in_field_declaration_list"
    of cppPreprocCallExpression:                "preproc_call_expression"
    of cppVariadicParameter:                    "variadic_parameter"
    of cppDependentTypeIdentifier:              "dependent_type_identifier"
    of cppInlineMethodDefinition:               "inline_method_definition"
    of cppOperatorCastDefinition:               "operator_cast_definition"
    of cppHidFieldDeclarationListItem:          "_field_declaration_list_item"
    of cppHidDeclarationModifiers:              "_declaration_modifiers"
    of cppHidConstructorSpecifiers:             "_constructor_specifiers"
    of cppConstructorOrDestructorDeclaration:   "constructor_or_destructor_declaration"
    of cppHidScopeResolution:                   "_scope_resolution"
    of cppAttributedTypeDeclarator:             "attributed_type_declarator"
    of cppHidNamespaceIdentifier:               "_namespace_identifier"
    of cppHidStatementIdentifier:               "_statement_identifier"
    of cppArrayFieldDeclarator:                 "array_field_declarator"
    of cppHidAssignmentLeftExpression:          "_assignment_left_expression"
    of cppParenthesizedFieldDeclarator:         "parenthesized_field_declarator"
    of cppHidPreprocExpression:                 "_preproc_expression"
    of cppHidNonCaseStatement:                  "_non_case_statement"
    of cppTypeParameterPackExpansion:           "type_parameter_pack_expansion"
    of cppHidEmptyDeclaration:                  "_empty_declaration"
    of cppFunctionFieldDeclarator:              "function_field_declarator"
    of cppSyntaxError:                          "ERROR"

type
  CppExternalTok* = enum
    cppExternRaw_string_literal ## raw_string_literal

type
  TsCppNode* = distinct TSNode

type
  CppParser* = distinct PtsParser

const cppAllowedSubnodes*: array[CppNodeKind, set[CppNodeKind]] = block:
                                                                    var tmp: array[CppNodeKind, set[CppNodeKind]]
                                                                    tmp[cppAbstractArrayDeclarator] = {cppTypeQualifier}
                                                                    tmp[cppAbstractFunctionDeclarator] = {cppNoexcept, cppRefQualifier, cppThrowSpecifier, cppTrailingReturnType, cppTypeQualifier}
                                                                    tmp[cppAbstractParenthesizedDeclarator] = {cppHidAbstractDeclarator}
                                                                    tmp[cppAbstractPointerDeclarator] = {cppTypeQualifier}
                                                                    tmp[cppAbstractReferenceDeclarator] = {cppHidAbstractDeclarator}
                                                                    tmp[cppArgumentList] = {cppHidExpression, cppInitializerList, cppPreprocDefined}
                                                                    tmp[cppArrayDeclarator] = {cppTypeQualifier}
                                                                    tmp[cppAttribute] = {cppArgumentList}
                                                                    tmp[cppAttributeDeclaration] = {cppAttribute}
                                                                    tmp[cppAttributeSpecifier] = {cppArgumentList}
                                                                    tmp[cppAttributedDeclarator] = {cppHidDeclarator, cppHidFieldDeclarator, cppHidTypeDeclarator, cppAttributeDeclaration}
                                                                    tmp[cppAttributedStatement] = {cppHidStatement, cppAttributeDeclaration}
                                                                    tmp[cppBaseClassClause] = {cppQualifiedIdentifier, cppTemplateType, cppTypeIdentifier}
                                                                    tmp[cppBitfieldClause] = {cppHidExpression}
                                                                    tmp[cppCaseStatement] = {
                                                                                              cppAttributedStatement,
                                                                                              cppBreakStatement,
                                                                                              cppCoReturnStatement,
                                                                                              cppCoYieldStatement,
                                                                                              cppCompoundStatement,
                                                                                              cppContinueStatement,
                                                                                              cppDeclaration,
                                                                                              cppDoStatement,
                                                                                              cppExpressionStatement,
                                                                                              cppForRangeLoop,
                                                                                              cppForStatement,
                                                                                              cppGotoStatement,
                                                                                              cppIfStatement,
                                                                                              cppLabeledStatement,
                                                                                              cppReturnStatement,
                                                                                              cppSwitchStatement,
                                                                                              cppThrowStatement,
                                                                                              cppTryStatement,
                                                                                              cppTypeDefinition,
                                                                                              cppWhileStatement
                                                                                            }
                                                                    tmp[cppCharLiteral] = {cppEscapeSequence}
                                                                    tmp[cppClassSpecifier] = {cppAttributeDeclaration, cppBaseClassClause, cppMsDeclspecModifier, cppVirtualSpecifier}
                                                                    tmp[cppCoReturnStatement] = {cppHidExpression}
                                                                    tmp[cppCoYieldStatement] = {cppHidExpression}
                                                                    tmp[cppCompoundStatement] = {
                                                                                                  cppHidStatement,
                                                                                                  cppHidTypeSpecifier,
                                                                                                  cppAliasDeclaration,
                                                                                                  cppAttributedStatement,
                                                                                                  cppDeclaration,
                                                                                                  cppFunctionDefinition,
                                                                                                  cppLinkageSpecification,
                                                                                                  cppNamespaceAliasDefinition,
                                                                                                  cppNamespaceDefinition,
                                                                                                  cppPreprocCall,
                                                                                                  cppPreprocDef,
                                                                                                  cppPreprocFunctionDef,
                                                                                                  cppPreprocIf,
                                                                                                  cppPreprocIfdef,
                                                                                                  cppPreprocInclude,
                                                                                                  cppStaticAssertDeclaration,
                                                                                                  cppTemplateDeclaration,
                                                                                                  cppTemplateInstantiation,
                                                                                                  cppTypeDefinition,
                                                                                                  cppUsingDeclaration
                                                                                                }
                                                                    tmp[cppConcatenatedString] = {cppRawStringLiteral, cppStringLiteral}
                                                                    tmp[cppDeclaration] = {
                                                                                            cppAttributeDeclaration,
                                                                                            cppAttributeSpecifier,
                                                                                            cppExplicitFunctionSpecifier,
                                                                                            cppMsDeclspecModifier,
                                                                                            cppStorageClassSpecifier,
                                                                                            cppTypeQualifier,
                                                                                            cppVirtualFunctionSpecifier
                                                                                          }
                                                                    tmp[cppDeclarationList] = {
                                                                                                cppHidStatement,
                                                                                                cppHidTypeSpecifier,
                                                                                                cppAliasDeclaration,
                                                                                                cppAttributedStatement,
                                                                                                cppDeclaration,
                                                                                                cppFunctionDefinition,
                                                                                                cppLinkageSpecification,
                                                                                                cppNamespaceAliasDefinition,
                                                                                                cppNamespaceDefinition,
                                                                                                cppPreprocCall,
                                                                                                cppPreprocDef,
                                                                                                cppPreprocFunctionDef,
                                                                                                cppPreprocIf,
                                                                                                cppPreprocIfdef,
                                                                                                cppPreprocInclude,
                                                                                                cppStaticAssertDeclaration,
                                                                                                cppTemplateDeclaration,
                                                                                                cppTemplateInstantiation,
                                                                                                cppTypeDefinition,
                                                                                                cppUsingDeclaration
                                                                                              }
                                                                    tmp[cppDecltype] = {cppHidExpression}
                                                                    tmp[cppDeleteExpression] = {cppHidExpression}
                                                                    tmp[cppDependentName] = {cppTemplateFunction, cppTemplateMethod, cppTemplateType}
                                                                    tmp[cppDependentType] = {cppHidTypeSpecifier}
                                                                    tmp[cppDestructorName] = {cppIdentifier}
                                                                    tmp[cppEnumeratorList] = {cppEnumerator}
                                                                    tmp[cppExplicitFunctionSpecifier] = {cppHidExpression}
                                                                    tmp[cppExpressionStatement] = {cppHidExpression, cppCommaExpression}
                                                                    tmp[cppFieldDeclaration] = {
                                                                                                 cppAttributeDeclaration,
                                                                                                 cppAttributeSpecifier,
                                                                                                 cppBitfieldClause,
                                                                                                 cppMsDeclspecModifier,
                                                                                                 cppStorageClassSpecifier,
                                                                                                 cppTypeQualifier,
                                                                                                 cppVirtualFunctionSpecifier
                                                                                               }
                                                                    tmp[cppFieldDeclarationList] = {
                                                                                                     cppAccessSpecifier,
                                                                                                     cppAliasDeclaration,
                                                                                                     cppDeclaration,
                                                                                                     cppFieldDeclaration,
                                                                                                     cppFriendDeclaration,
                                                                                                     cppFunctionDefinition,
                                                                                                     cppPreprocCall,
                                                                                                     cppPreprocDef,
                                                                                                     cppPreprocFunctionDef,
                                                                                                     cppPreprocIf,
                                                                                                     cppPreprocIfdef,
                                                                                                     cppQpropertyDeclaration,
                                                                                                     cppStaticAssertDeclaration,
                                                                                                     cppTemplateDeclaration,
                                                                                                     cppTypeDefinition,
                                                                                                     cppUsingDeclaration
                                                                                                   }
                                                                    tmp[cppFieldDesignator] = {cppFieldIdentifier}
                                                                    tmp[cppFieldInitializer] = {cppArgumentList, cppFieldIdentifier, cppInitializerList, cppQualifiedIdentifier, cppTemplateMethod}
                                                                    tmp[cppFieldInitializerList] = {cppFieldInitializer}
                                                                    tmp[cppForRangeLoop] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppForStatement] = {cppHidStatement}
                                                                    tmp[cppFriendDeclaration] = {cppDeclaration, cppFunctionDefinition, cppQualifiedIdentifier, cppTemplateType, cppTypeIdentifier}
                                                                    tmp[cppFunctionDeclarator] = {
                                                                                                   cppAttributeSpecifier,
                                                                                                   cppNoexcept,
                                                                                                   cppRefQualifier,
                                                                                                   cppThrowSpecifier,
                                                                                                   cppTrailingReturnType,
                                                                                                   cppTypeQualifier,
                                                                                                   cppVirtualSpecifier
                                                                                                 }
                                                                    tmp[cppFunctionDefinition] = {
                                                                                                   cppAttributeDeclaration,
                                                                                                   cppAttributeSpecifier,
                                                                                                   cppDefaultMethodClause,
                                                                                                   cppDeleteMethodClause,
                                                                                                   cppExplicitFunctionSpecifier,
                                                                                                   cppFieldInitializerList,
                                                                                                   cppMsCallModifier,
                                                                                                   cppMsDeclspecModifier,
                                                                                                   cppStorageClassSpecifier,
                                                                                                   cppTypeQualifier,
                                                                                                   cppVirtualFunctionSpecifier
                                                                                                 }
                                                                    tmp[cppInitializerList] = {cppHidExpression, cppInitializerList, cppInitializerPair}
                                                                    tmp[cppLabeledStatement] = {cppHidStatement}
                                                                    tmp[cppLambdaCaptureSpecifier] = {cppHidExpression, cppLambdaDefaultCapture}
                                                                    tmp[cppMsBasedModifier] = {cppArgumentList}
                                                                    tmp[cppMsDeclspecModifier] = {cppIdentifier}
                                                                    tmp[cppMsPointerModifier] = {cppMsRestrictModifier, cppMsSignedPtrModifier, cppMsUnalignedPtrModifier, cppMsUnsignedPtrModifier}
                                                                    tmp[cppNamespaceAliasDefinition] = {cppIdentifier, cppQualifiedIdentifier}
                                                                    tmp[cppNamespaceDefinitionName] = {cppIdentifier, cppNamespaceDefinitionName}
                                                                    tmp[cppNewDeclarator] = {cppNewDeclarator}
                                                                    tmp[cppNoexcept] = {cppHidExpression}
                                                                    tmp[cppOperatorCast] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppOperatorName] = {cppIdentifier}
                                                                    tmp[cppOptionalParameterDeclaration] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppParameterDeclaration] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppParameterList] = {cppOptionalParameterDeclaration, cppParameterDeclaration, cppVariadicParameterDeclaration}
                                                                    tmp[cppParenthesizedDeclarator] = {cppHidDeclarator, cppHidFieldDeclarator, cppHidTypeDeclarator}
                                                                    tmp[cppParenthesizedExpression] = {cppHidExpression, cppCommaExpression, cppPreprocDefined}
                                                                    tmp[cppPointerDeclarator] = {cppMsBasedModifier, cppMsPointerModifier, cppTypeQualifier}
                                                                    tmp[cppPreprocDefined] = {cppIdentifier}
                                                                    tmp[cppPreprocElif] = {
                                                                                            cppHidStatement,
                                                                                            cppHidTypeSpecifier,
                                                                                            cppAccessSpecifier,
                                                                                            cppAliasDeclaration,
                                                                                            cppAttributedStatement,
                                                                                            cppDeclaration,
                                                                                            cppFieldDeclaration,
                                                                                            cppFriendDeclaration,
                                                                                            cppFunctionDefinition,
                                                                                            cppLinkageSpecification,
                                                                                            cppNamespaceAliasDefinition,
                                                                                            cppNamespaceDefinition,
                                                                                            cppPreprocCall,
                                                                                            cppPreprocDef,
                                                                                            cppPreprocFunctionDef,
                                                                                            cppPreprocIf,
                                                                                            cppPreprocIfdef,
                                                                                            cppPreprocInclude,
                                                                                            cppQpropertyDeclaration,
                                                                                            cppStaticAssertDeclaration,
                                                                                            cppTemplateDeclaration,
                                                                                            cppTemplateInstantiation,
                                                                                            cppTypeDefinition,
                                                                                            cppUsingDeclaration
                                                                                          }
                                                                    tmp[cppPreprocElse] = {
                                                                                            cppHidStatement,
                                                                                            cppHidTypeSpecifier,
                                                                                            cppAccessSpecifier,
                                                                                            cppAliasDeclaration,
                                                                                            cppAttributedStatement,
                                                                                            cppDeclaration,
                                                                                            cppFieldDeclaration,
                                                                                            cppFriendDeclaration,
                                                                                            cppFunctionDefinition,
                                                                                            cppLinkageSpecification,
                                                                                            cppNamespaceAliasDefinition,
                                                                                            cppNamespaceDefinition,
                                                                                            cppPreprocCall,
                                                                                            cppPreprocDef,
                                                                                            cppPreprocFunctionDef,
                                                                                            cppPreprocIf,
                                                                                            cppPreprocIfdef,
                                                                                            cppPreprocInclude,
                                                                                            cppQpropertyDeclaration,
                                                                                            cppStaticAssertDeclaration,
                                                                                            cppTemplateDeclaration,
                                                                                            cppTemplateInstantiation,
                                                                                            cppTypeDefinition,
                                                                                            cppUsingDeclaration
                                                                                          }
                                                                    tmp[cppPreprocIf] = {
                                                                                          cppHidStatement,
                                                                                          cppHidTypeSpecifier,
                                                                                          cppAccessSpecifier,
                                                                                          cppAliasDeclaration,
                                                                                          cppAttributedStatement,
                                                                                          cppDeclaration,
                                                                                          cppFieldDeclaration,
                                                                                          cppFriendDeclaration,
                                                                                          cppFunctionDefinition,
                                                                                          cppLinkageSpecification,
                                                                                          cppNamespaceAliasDefinition,
                                                                                          cppNamespaceDefinition,
                                                                                          cppPreprocCall,
                                                                                          cppPreprocDef,
                                                                                          cppPreprocFunctionDef,
                                                                                          cppPreprocIf,
                                                                                          cppPreprocIfdef,
                                                                                          cppPreprocInclude,
                                                                                          cppQpropertyDeclaration,
                                                                                          cppStaticAssertDeclaration,
                                                                                          cppTemplateDeclaration,
                                                                                          cppTemplateInstantiation,
                                                                                          cppTypeDefinition,
                                                                                          cppUsingDeclaration
                                                                                        }
                                                                    tmp[cppPreprocIfdef] = {
                                                                                             cppHidStatement,
                                                                                             cppHidTypeSpecifier,
                                                                                             cppAccessSpecifier,
                                                                                             cppAliasDeclaration,
                                                                                             cppAttributedStatement,
                                                                                             cppDeclaration,
                                                                                             cppFieldDeclaration,
                                                                                             cppFriendDeclaration,
                                                                                             cppFunctionDefinition,
                                                                                             cppLinkageSpecification,
                                                                                             cppNamespaceAliasDefinition,
                                                                                             cppNamespaceDefinition,
                                                                                             cppPreprocCall,
                                                                                             cppPreprocDef,
                                                                                             cppPreprocFunctionDef,
                                                                                             cppPreprocIf,
                                                                                             cppPreprocIfdef,
                                                                                             cppPreprocInclude,
                                                                                             cppQpropertyDeclaration,
                                                                                             cppStaticAssertDeclaration,
                                                                                             cppTemplateDeclaration,
                                                                                             cppTemplateInstantiation,
                                                                                             cppTypeDefinition,
                                                                                             cppUsingDeclaration
                                                                                           }
                                                                    tmp[cppPreprocParams] = {cppIdentifier}
                                                                    tmp[cppQpropertyDeclaration] = {cppTypeIdentifier}
                                                                    tmp[cppReferenceDeclarator] = {cppHidDeclarator, cppHidFieldDeclarator, cppVariadicDeclarator}
                                                                    tmp[cppReturnStatement] = {cppHidExpression, cppCommaExpression, cppInitializerList}
                                                                    tmp[cppStringLiteral] = {cppEscapeSequence}
                                                                    tmp[cppStructSpecifier] = {cppAttributeDeclaration, cppBaseClassClause, cppMsDeclspecModifier, cppVirtualSpecifier}
                                                                    tmp[cppStructuredBindingDeclarator] = {cppIdentifier}
                                                                    tmp[cppSubscriptDesignator] = {cppHidExpression}
                                                                    tmp[cppTemplateArgumentList] = {cppHidExpression, cppTypeDescriptor}
                                                                    tmp[cppTemplateDeclaration] = {cppHidTypeSpecifier, cppAliasDeclaration, cppDeclaration, cppFunctionDefinition, cppTemplateDeclaration}
                                                                    tmp[cppTemplateInstantiation] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppTemplateParameterList] = {
                                                                                                      cppOptionalParameterDeclaration,
                                                                                                      cppOptionalTypeParameterDeclaration,
                                                                                                      cppParameterDeclaration,
                                                                                                      cppTemplateTemplateParameterDeclaration,
                                                                                                      cppTypeParameterDeclaration,
                                                                                                      cppVariadicParameterDeclaration,
                                                                                                      cppVariadicTypeParameterDeclaration
                                                                                                    }
                                                                    tmp[cppTemplateTemplateParameterDeclaration] = {cppOptionalTypeParameterDeclaration, cppTypeParameterDeclaration, cppVariadicTypeParameterDeclaration}
                                                                    tmp[cppThrowSpecifier] = {cppTypeDescriptor}
                                                                    tmp[cppThrowStatement] = {cppHidExpression}
                                                                    tmp[cppTrailingReturnType] = {cppHidAbstractDeclarator, cppHidTypeSpecifier, cppTypeQualifier}
                                                                    tmp[cppTranslationUnit] = {
                                                                                                cppHidStatement,
                                                                                                cppHidTypeSpecifier,
                                                                                                cppAliasDeclaration,
                                                                                                cppAttributedStatement,
                                                                                                cppDeclaration,
                                                                                                cppFunctionDefinition,
                                                                                                cppLinkageSpecification,
                                                                                                cppNamespaceAliasDefinition,
                                                                                                cppNamespaceDefinition,
                                                                                                cppPreprocCall,
                                                                                                cppPreprocDef,
                                                                                                cppPreprocFunctionDef,
                                                                                                cppPreprocIf,
                                                                                                cppPreprocIfdef,
                                                                                                cppPreprocInclude,
                                                                                                cppStaticAssertDeclaration,
                                                                                                cppTemplateDeclaration,
                                                                                                cppTemplateInstantiation,
                                                                                                cppTypeDefinition,
                                                                                                cppUsingDeclaration
                                                                                              }
                                                                    tmp[cppTryStatement] = {cppCatchClause}
                                                                    tmp[cppTypeDefinition] = {cppTypeQualifier}
                                                                    tmp[cppTypeDescriptor] = {cppTypeQualifier}
                                                                    tmp[cppTypeParameterDeclaration] = {cppTypeIdentifier}
                                                                    tmp[cppUnionSpecifier] = {cppAttributeDeclaration, cppBaseClassClause, cppMsDeclspecModifier, cppVirtualSpecifier}
                                                                    tmp[cppUserDefinedLiteral] = {cppCharLiteral, cppConcatenatedString, cppLiteralSuffix, cppNumberLiteral, cppRawStringLiteral, cppStringLiteral}
                                                                    tmp[cppUsingDeclaration] = {cppIdentifier, cppQualifiedIdentifier}
                                                                    tmp[cppVariadicDeclarator] = {cppIdentifier}
                                                                    tmp[cppVariadicParameterDeclaration] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppVariadicTypeParameterDeclaration] = {cppTypeIdentifier}
                                                                    tmp
const cppTokenKinds*: set[CppNodeKind] = {
                                           cppNewlineTok,
                                           cppExclamationTok,
                                           cppExclamationEqualTok,
                                           cppQuoteTok,
                                           cppDoubleQuoteTok,
                                           cppHashdefineTok,
                                           cppHashelifTok,
                                           cppHashelseTok,
                                           cppHashendifTok,
                                           cppHashifTok,
                                           cppHashifdefTok,
                                           cppHashifndefTok,
                                           cppHashincludeTok,
                                           cppPercentTok,
                                           cppPercentEqualTok,
                                           cppAmpersandTok,
                                           cppDoubleAmpersandTok,
                                           cppAmpersandEqualTok,
                                           cppApostropheTok,
                                           cppLParTok,
                                           cppLParRParTok,
                                           cppRParTok,
                                           cppAsteriskTok,
                                           cppAsteriskEqualTok,
                                           cppPlusTok,
                                           cppDoublePlusTok,
                                           cppPlusEqualTok,
                                           cppCommaTok,
                                           cppMinusTok,
                                           cppDoubleMinusTok,
                                           cppMinusEqualTok,
                                           cppMinusGreaterThanTok,
                                           cppMinusGreaterThanAsteriskTok,
                                           cppDotTok,
                                           cppTripleDotTok,
                                           cppSlashTok,
                                           cppSlashEqualTok,
                                           cppColonTok,
                                           cppDoubleColonTok,
                                           cppSemicolonTok,
                                           cppLessThanTok,
                                           cppDoubleLessThanTok,
                                           cppDoubleLessThanEqualTok,
                                           cppLessThanEqualTok,
                                           cppEqualTok,
                                           cppDoubleEqualTok,
                                           cppGreaterThanTok,
                                           cppGreaterThanEqualTok,
                                           cppDoubleGreaterThanTok,
                                           cppDoubleGreaterThanEqualTok,
                                           cppQuestionTok,
                                           cppLQuoteTok,
                                           cppLApostropheTok,
                                           cppQPROPERTYTok,
                                           cppUQuoteTok,
                                           cppUApostropheTok,
                                           cppLBrackTok,
                                           cppDoubleLBrackTok,
                                           cppLBrackRBrackTok,
                                           cppRBrackTok,
                                           cppDoubleRBrackTok,
                                           cppAccentTok,
                                           cppAccentEqualTok,
                                           cppHidAtomicTok,
                                           cppHidAttributeTok,
                                           cppHidBasedTok,
                                           cppHidCdeclTok,
                                           cppHidClrcallTok,
                                           cppHidDeclspecTok,
                                           cppHidFastcallTok,
                                           cppHidStdcallTok,
                                           cppHidThiscallTok,
                                           cppHidUnalignedTok,
                                           cppHidVectorcallTok,
                                           cppHidUnalignedTok,
                                           cppBreakTok,
                                           cppCaseTok,
                                           cppCatchTok,
                                           cppClassTok,
                                           cppCoAwaitTok,
                                           cppCoReturnTok,
                                           cppCoYieldTok,
                                           cppConstTok,
                                           cppConstexprTok,
                                           cppContinueTok,
                                           cppDecltypeTok,
                                           cppDefaultTok,
                                           cppDefinedTok,
                                           cppDeleteTok,
                                           cppDoTok,
                                           cppElseTok,
                                           cppEnumTok,
                                           cppExplicitTok,
                                           cppExternTok,
                                           cppFinalTok,
                                           cppForTok,
                                           cppFriendTok,
                                           cppGotoTok,
                                           cppIfTok,
                                           cppInlineTok,
                                           cppLongTok,
                                           cppMutableTok,
                                           cppNamespaceTok,
                                           cppNewTok,
                                           cppNoexceptTok,
                                           cppOperatorTok,
                                           cppOverrideTok,
                                           cppPrivateTok,
                                           cppProtectedTok,
                                           cppPublicTok,
                                           cppRegisterTok,
                                           cppRestrictTok,
                                           cppReturnTok,
                                           cppShortTok,
                                           cppSignalsTok,
                                           cppSignedTok,
                                           cppSizeofTok,
                                           cppSlotsTok,
                                           cppStaticTok,
                                           cppStaticAssertTok,
                                           cppStructTok,
                                           cppSwitchTok,
                                           cppTemplateTok,
                                           cppThreadLocalTok,
                                           cppThrowTok,
                                           cppTryTok,
                                           cppTypedefTok,
                                           cppTypenameTok,
                                           cppUQuoteTok,
                                           cppUApostropheTok,
                                           cppU8QuoteTok,
                                           cppU8ApostropheTok,
                                           cppUnionTok,
                                           cppUnsignedTok,
                                           cppUsingTok,
                                           cppVirtualTok,
                                           cppVolatileTok,
                                           cppWhileTok,
                                           cppLCurlyTok,
                                           cppPipeTok,
                                           cppPipeEqualTok,
                                           cppDoublePipeTok,
                                           cppRCurlyTok,
                                           cppTildeTok
                                         }
const cppHiddenKinds*: set[CppNodeKind] = {
                                            cppFunctionTypeDeclarator,
                                            cppVariadicReferenceDeclarator,
                                            cppPreprocArgumentList,
                                            cppReferenceFieldDeclarator,
                                            cppHidAbstractDeclarator,
                                            cppPreprocElseInFieldDeclarationList,
                                            cppAttributedFieldDeclarator,
                                            cppOperatorCastDeclaration,
                                            cppAttributedNonCaseStatement,
                                            cppHidClassName,
                                            cppHidExpression,
                                            cppQualifiedTypeIdentifier,
                                            cppQualifiedOperatorCastIdentifier,
                                            cppArrayTypeDeclarator,
                                            cppPreprocUnaryExpression,
                                            cppPointerFieldDeclarator,
                                            cppPreprocElifInFieldDeclarationList,
                                            cppHidFieldIdentifier,
                                            cppHidTypeSpecifier,
                                            cppHidTypeDeclarator,
                                            cppPreprocParenthesizedExpression,
                                            cppParenthesizedTypeDeclarator,
                                            cppConstructorOrDestructorDefinition,
                                            cppHidDeclarationSpecifiers,
                                            cppHidDeclarator,
                                            cppQualifiedFieldIdentifier,
                                            cppPreprocBinaryExpression,
                                            cppConditionDeclaration,
                                            cppPreprocIfdefInFieldDeclarationList,
                                            cppHidEnumBaseClause,
                                            cppDependentFieldIdentifier,
                                            cppHidTopLevelItem,
                                            cppDependentIdentifier,
                                            cppPointerTypeDeclarator,
                                            cppMacroTypeSpecifier,
                                            cppHidTypeIdentifier,
                                            cppPreprocIfInFieldDeclarationList,
                                            cppPreprocCallExpression,
                                            cppVariadicParameter,
                                            cppHidStatement,
                                            cppDependentTypeIdentifier,
                                            cppInlineMethodDefinition,
                                            cppOperatorCastDefinition,
                                            cppHidFieldDeclarationListItem,
                                            cppHidDeclarationModifiers,
                                            cppHidConstructorSpecifiers,
                                            cppConstructorOrDestructorDeclaration,
                                            cppHidScopeResolution,
                                            cppAttributedTypeDeclarator,
                                            cppHidFieldDeclarator,
                                            cppHidNamespaceIdentifier,
                                            cppHidStatementIdentifier,
                                            cppArrayFieldDeclarator,
                                            cppHidAssignmentLeftExpression,
                                            cppParenthesizedFieldDeclarator,
                                            cppHidPreprocExpression,
                                            cppHidNonCaseStatement,
                                            cppTypeParameterPackExpansion,
                                            cppHidEmptyDeclaration,
                                            cppFunctionFieldDeclarator
                                          }
proc tsNodeType*(node: TsCppNode): string


proc kind*(node: TsCppNode): CppNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_abstract_declarator":                    cppHidAbstractDeclarator
      of "_declarator":                             cppHidDeclarator
      of "_expression":                             cppHidExpression
      of "_field_declarator":                       cppHidFieldDeclarator
      of "_statement":                              cppHidStatement
      of "_type_declarator":                        cppHidTypeDeclarator
      of "_type_specifier":                         cppHidTypeSpecifier
      of "abstract_array_declarator":               cppAbstractArrayDeclarator
      of "abstract_function_declarator":            cppAbstractFunctionDeclarator
      of "abstract_parenthesized_declarator":       cppAbstractParenthesizedDeclarator
      of "abstract_pointer_declarator":             cppAbstractPointerDeclarator
      of "abstract_reference_declarator":           cppAbstractReferenceDeclarator
      of "access_specifier":                        cppAccessSpecifier
      of "alias_declaration":                       cppAliasDeclaration
      of "argument_list":                           cppArgumentList
      of "array_declarator":                        cppArrayDeclarator
      of "assignment_expression":                   cppAssignmentExpression
      of "attribute":                               cppAttribute
      of "attribute_declaration":                   cppAttributeDeclaration
      of "attribute_specifier":                     cppAttributeSpecifier
      of "attributed_declarator":                   cppAttributedDeclarator
      of "attributed_statement":                    cppAttributedStatement
      of "base_class_clause":                       cppBaseClassClause
      of "binary_expression":                       cppBinaryExpression
      of "bitfield_clause":                         cppBitfieldClause
      of "break_statement":                         cppBreakStatement
      of "call_expression":                         cppCallExpression
      of "case_statement":                          cppCaseStatement
      of "cast_expression":                         cppCastExpression
      of "catch_clause":                            cppCatchClause
      of "char_literal":                            cppCharLiteral
      of "class_specifier":                         cppClassSpecifier
      of "co_await_expression":                     cppCoAwaitExpression
      of "co_return_statement":                     cppCoReturnStatement
      of "co_yield_statement":                      cppCoYieldStatement
      of "comma_expression":                        cppCommaExpression
      of "compound_literal_expression":             cppCompoundLiteralExpression
      of "compound_statement":                      cppCompoundStatement
      of "concatenated_string":                     cppConcatenatedString
      of "condition_clause":                        cppConditionClause
      of "conditional_expression":                  cppConditionalExpression
      of "continue_statement":                      cppContinueStatement
      of "declaration":                             cppDeclaration
      of "declaration_list":                        cppDeclarationList
      of "decltype":                                cppDecltype
      of "default_method_clause":                   cppDefaultMethodClause
      of "delete_expression":                       cppDeleteExpression
      of "delete_method_clause":                    cppDeleteMethodClause
      of "dependent_name":                          cppDependentName
      of "dependent_type":                          cppDependentType
      of "destructor_name":                         cppDestructorName
      of "do_statement":                            cppDoStatement
      of "enum_specifier":                          cppEnumSpecifier
      of "enumerator":                              cppEnumerator
      of "enumerator_list":                         cppEnumeratorList
      of "explicit_function_specifier":             cppExplicitFunctionSpecifier
      of "expression_statement":                    cppExpressionStatement
      of "field_declaration":                       cppFieldDeclaration
      of "field_declaration_list":                  cppFieldDeclarationList
      of "field_designator":                        cppFieldDesignator
      of "field_expression":                        cppFieldExpression
      of "field_initializer":                       cppFieldInitializer
      of "field_initializer_list":                  cppFieldInitializerList
      of "for_range_loop":                          cppForRangeLoop
      of "for_statement":                           cppForStatement
      of "friend_declaration":                      cppFriendDeclaration
      of "function_declarator":                     cppFunctionDeclarator
      of "function_definition":                     cppFunctionDefinition
      of "goto_statement":                          cppGotoStatement
      of "if_statement":                            cppIfStatement
      of "init_declarator":                         cppInitDeclarator
      of "initializer_list":                        cppInitializerList
      of "initializer_pair":                        cppInitializerPair
      of "labeled_statement":                       cppLabeledStatement
      of "lambda_capture_specifier":                cppLambdaCaptureSpecifier
      of "lambda_default_capture":                  cppLambdaDefaultCapture
      of "lambda_expression":                       cppLambdaExpression
      of "linkage_specification":                   cppLinkageSpecification
      of "ms_based_modifier":                       cppMsBasedModifier
      of "ms_call_modifier":                        cppMsCallModifier
      of "ms_declspec_modifier":                    cppMsDeclspecModifier
      of "ms_pointer_modifier":                     cppMsPointerModifier
      of "ms_unaligned_ptr_modifier":               cppMsUnalignedPtrModifier
      of "namespace_alias_definition":              cppNamespaceAliasDefinition
      of "namespace_definition":                    cppNamespaceDefinition
      of "namespace_definition_name":               cppNamespaceDefinitionName
      of "new_declarator":                          cppNewDeclarator
      of "new_expression":                          cppNewExpression
      of "noexcept":                                cppNoexcept
      of "operator_cast":                           cppOperatorCast
      of "operator_name":                           cppOperatorName
      of "optional_parameter_declaration":          cppOptionalParameterDeclaration
      of "optional_type_parameter_declaration":     cppOptionalTypeParameterDeclaration
      of "parameter_declaration":                   cppParameterDeclaration
      of "parameter_list":                          cppParameterList
      of "parameter_pack_expansion":                cppParameterPackExpansion
      of "parenthesized_declarator":                cppParenthesizedDeclarator
      of "parenthesized_expression":                cppParenthesizedExpression
      of "pointer_declarator":                      cppPointerDeclarator
      of "pointer_expression":                      cppPointerExpression
      of "preproc_call":                            cppPreprocCall
      of "preproc_def":                             cppPreprocDef
      of "preproc_defined":                         cppPreprocDefined
      of "preproc_elif":                            cppPreprocElif
      of "preproc_else":                            cppPreprocElse
      of "preproc_function_def":                    cppPreprocFunctionDef
      of "preproc_if":                              cppPreprocIf
      of "preproc_ifdef":                           cppPreprocIfdef
      of "preproc_include":                         cppPreprocInclude
      of "preproc_params":                          cppPreprocParams
      of "qproperty_declaration":                   cppQpropertyDeclaration
      of "qualified_identifier":                    cppQualifiedIdentifier
      of "ref_qualifier":                           cppRefQualifier
      of "reference_declarator":                    cppReferenceDeclarator
      of "return_statement":                        cppReturnStatement
      of "sized_type_specifier":                    cppSizedTypeSpecifier
      of "sizeof_expression":                       cppSizeofExpression
      of "static_assert_declaration":               cppStaticAssertDeclaration
      of "storage_class_specifier":                 cppStorageClassSpecifier
      of "string_literal":                          cppStringLiteral
      of "struct_specifier":                        cppStructSpecifier
      of "structured_binding_declarator":           cppStructuredBindingDeclarator
      of "subscript_designator":                    cppSubscriptDesignator
      of "subscript_expression":                    cppSubscriptExpression
      of "switch_statement":                        cppSwitchStatement
      of "template_argument_list":                  cppTemplateArgumentList
      of "template_declaration":                    cppTemplateDeclaration
      of "template_function":                       cppTemplateFunction
      of "template_instantiation":                  cppTemplateInstantiation
      of "template_method":                         cppTemplateMethod
      of "template_parameter_list":                 cppTemplateParameterList
      of "template_template_parameter_declaration": cppTemplateTemplateParameterDeclaration
      of "template_type":                           cppTemplateType
      of "throw_specifier":                         cppThrowSpecifier
      of "throw_statement":                         cppThrowStatement
      of "trailing_return_type":                    cppTrailingReturnType
      of "translation_unit":                        cppTranslationUnit
      of "try_statement":                           cppTryStatement
      of "type_definition":                         cppTypeDefinition
      of "type_descriptor":                         cppTypeDescriptor
      of "type_parameter_declaration":              cppTypeParameterDeclaration
      of "type_qualifier":                          cppTypeQualifier
      of "unary_expression":                        cppUnaryExpression
      of "union_specifier":                         cppUnionSpecifier
      of "update_expression":                       cppUpdateExpression
      of "user_defined_literal":                    cppUserDefinedLiteral
      of "using_declaration":                       cppUsingDeclaration
      of "variadic_declarator":                     cppVariadicDeclarator
      of "variadic_parameter_declaration":          cppVariadicParameterDeclaration
      of "variadic_type_parameter_declaration":     cppVariadicTypeParameterDeclaration
      of "virtual_function_specifier":              cppVirtualFunctionSpecifier
      of "virtual_specifier":                       cppVirtualSpecifier
      of "while_statement":                         cppWhileStatement
      of "\x0A":                                    cppNewlineTok
      of "!":                                       cppExclamationTok
      of "!=":                                      cppExclamationEqualTok
      of "\"":                                      cppQuoteTok
      of "\"\"":                                    cppDoubleQuoteTok
      of "#define":                                 cppHashdefineTok
      of "#elif":                                   cppHashelifTok
      of "#else":                                   cppHashelseTok
      of "#endif":                                  cppHashendifTok
      of "#if":                                     cppHashifTok
      of "#ifdef":                                  cppHashifdefTok
      of "#ifndef":                                 cppHashifndefTok
      of "#include":                                cppHashincludeTok
      of "%":                                       cppPercentTok
      of "%=":                                      cppPercentEqualTok
      of "&":                                       cppAmpersandTok
      of "&&":                                      cppDoubleAmpersandTok
      of "&=":                                      cppAmpersandEqualTok
      of "\'":                                      cppApostropheTok
      of "(":                                       cppLParTok
      of "()":                                      cppLParRParTok
      of ")":                                       cppRParTok
      of "*":                                       cppAsteriskTok
      of "*=":                                      cppAsteriskEqualTok
      of "+":                                       cppPlusTok
      of "++":                                      cppDoublePlusTok
      of "+=":                                      cppPlusEqualTok
      of ",":                                       cppCommaTok
      of "-":                                       cppMinusTok
      of "--":                                      cppDoubleMinusTok
      of "-=":                                      cppMinusEqualTok
      of "->":                                      cppMinusGreaterThanTok
      of "->*":                                     cppMinusGreaterThanAsteriskTok
      of ".":                                       cppDotTok
      of "...":                                     cppTripleDotTok
      of "/":                                       cppSlashTok
      of "/=":                                      cppSlashEqualTok
      of ":":                                       cppColonTok
      of "::":                                      cppDoubleColonTok
      of ";":                                       cppSemicolonTok
      of "<":                                       cppLessThanTok
      of "<<":                                      cppDoubleLessThanTok
      of "<<=":                                     cppDoubleLessThanEqualTok
      of "<=":                                      cppLessThanEqualTok
      of "=":                                       cppEqualTok
      of "==":                                      cppDoubleEqualTok
      of ">":                                       cppGreaterThanTok
      of ">=":                                      cppGreaterThanEqualTok
      of ">>":                                      cppDoubleGreaterThanTok
      of ">>=":                                     cppDoubleGreaterThanEqualTok
      of "?":                                       cppQuestionTok
      of "L\"":                                     cppLQuoteTok
      of "L\'":                                     cppLApostropheTok
      of "Q_PROPERTY":                              cppQPROPERTYTok
      of "U\"":                                     cppUQuoteTok
      of "U\'":                                     cppUApostropheTok
      of "[":                                       cppLBrackTok
      of "[[":                                      cppDoubleLBrackTok
      of "[]":                                      cppLBrackRBrackTok
      of "]":                                       cppRBrackTok
      of "]]":                                      cppDoubleRBrackTok
      of "^":                                       cppAccentTok
      of "^=":                                      cppAccentEqualTok
      of "_Atomic":                                 cppHidAtomicTok
      of "__attribute__":                           cppHidAttributeTok
      of "__based":                                 cppHidBasedTok
      of "__cdecl":                                 cppHidCdeclTok
      of "__clrcall":                               cppHidClrcallTok
      of "__declspec":                              cppHidDeclspecTok
      of "__fastcall":                              cppHidFastcallTok
      of "__stdcall":                               cppHidStdcallTok
      of "__thiscall":                              cppHidThiscallTok
      of "__unaligned":                             cppHidUnalignedTok
      of "__vectorcall":                            cppHidVectorcallTok
      of "_unaligned":                              cppHidUnalignedTok
      of "auto":                                    cppAuto
      of "break":                                   cppBreakTok
      of "case":                                    cppCaseTok
      of "catch":                                   cppCatchTok
      of "class":                                   cppClassTok
      of "co_await":                                cppCoAwaitTok
      of "co_return":                               cppCoReturnTok
      of "co_yield":                                cppCoYieldTok
      of "comment":                                 cppComment
      of "const":                                   cppConstTok
      of "constexpr":                               cppConstexprTok
      of "continue":                                cppContinueTok
      of "default":                                 cppDefaultTok
      of "defined":                                 cppDefinedTok
      of "delete":                                  cppDeleteTok
      of "do":                                      cppDoTok
      of "else":                                    cppElseTok
      of "enum":                                    cppEnumTok
      of "escape_sequence":                         cppEscapeSequence
      of "explicit":                                cppExplicitTok
      of "extern":                                  cppExternTok
      of "false":                                   cppFalse
      of "field_identifier":                        cppFieldIdentifier
      of "final":                                   cppFinalTok
      of "for":                                     cppForTok
      of "friend":                                  cppFriendTok
      of "goto":                                    cppGotoTok
      of "identifier":                              cppIdentifier
      of "if":                                      cppIfTok
      of "inline":                                  cppInlineTok
      of "literal_suffix":                          cppLiteralSuffix
      of "long":                                    cppLongTok
      of "ms_restrict_modifier":                    cppMsRestrictModifier
      of "ms_signed_ptr_modifier":                  cppMsSignedPtrModifier
      of "ms_unsigned_ptr_modifier":                cppMsUnsignedPtrModifier
      of "mutable":                                 cppMutableTok
      of "namespace":                               cppNamespaceTok
      of "namespace_identifier":                    cppNamespaceIdentifier
      of "new":                                     cppNewTok
      of "null":                                    cppNull
      of "nullptr":                                 cppNullptr
      of "number_literal":                          cppNumberLiteral
      of "operator":                                cppOperatorTok
      of "override":                                cppOverrideTok
      of "preproc_arg":                             cppPreprocArg
      of "preproc_directive":                       cppPreprocDirective
      of "primitive_type":                          cppPrimitiveType
      of "private":                                 cppPrivateTok
      of "protected":                               cppProtectedTok
      of "public":                                  cppPublicTok
      of "raw_string_literal":                      cppRawStringLiteral
      of "register":                                cppRegisterTok
      of "restrict":                                cppRestrictTok
      of "return":                                  cppReturnTok
      of "short":                                   cppShortTok
      of "signals":                                 cppSignalsTok
      of "signed":                                  cppSignedTok
      of "sizeof":                                  cppSizeofTok
      of "slots":                                   cppSlotsTok
      of "statement_identifier":                    cppStatementIdentifier
      of "static":                                  cppStaticTok
      of "static_assert":                           cppStaticAssertTok
      of "struct":                                  cppStructTok
      of "switch":                                  cppSwitchTok
      of "system_lib_string":                       cppSystemLibString
      of "template":                                cppTemplateTok
      of "this":                                    cppThis
      of "thread_local":                            cppThreadLocalTok
      of "throw":                                   cppThrowTok
      of "true":                                    cppTrue
      of "try":                                     cppTryTok
      of "type_identifier":                         cppTypeIdentifier
      of "typedef":                                 cppTypedefTok
      of "typename":                                cppTypenameTok
      of "u\"":                                     cppUQuoteTok
      of "u\'":                                     cppUApostropheTok
      of "u8\"":                                    cppU8QuoteTok
      of "u8\'":                                    cppU8ApostropheTok
      of "union":                                   cppUnionTok
      of "unsigned":                                cppUnsignedTok
      of "using":                                   cppUsingTok
      of "virtual":                                 cppVirtualTok
      of "volatile":                                cppVolatileTok
      of "while":                                   cppWhileTok
      of "{":                                       cppLCurlyTok
      of "|":                                       cppPipeTok
      of "|=":                                      cppPipeEqualTok
      of "||":                                      cppDoublePipeTok
      of "}":                                       cppRCurlyTok
      of "~":                                       cppTildeTok
      of "ERROR":                                   cppSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsCppNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsCppNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsCppNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_cpp(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsCppNode): string =
  $ts_node_type(TSNode(node))

proc newTsCppParser*(): CppParser =
  result = CppParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_cpp())

proc parseString*(parser: CppParser, str: string): TsCppNode =
  TsCppNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsCppString*(str: string): TsCppNode =
  let parser = newTsCppParser()
  return parseString(parser, str)

func `$`*(node: TsCppNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsCppNode,
    idx:  int,
    kind: CppNodeKind | set[CppNodeKind]
  ): TsCppNode =
  assert 0 <= idx and idx < node.len
  result = TsCppNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  CppNode* = HtsNode[TsCppNode, CppNodeKind]


proc treeReprTsCpp*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsCppNode, CppNodeKind](parseTsCppString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsCppNode,
    str:  ptr string
  ): HtsNode[TsCppNode, CppNodeKind] =
  toHtsNode[TsCppNode, CppNodeKind](node, str)

proc toHtsTree*(node: TsCppNode, str: ptr string): CppNode =
  toHtsNode[TsCppNode, CppNodeKind](node, str)

proc parseCppString*(str: ptr string, unnamed: bool = false): CppNode =
  let parser = newTsCppParser()
  return toHtsTree[TsCppNode, CppNodeKind](parseString(parser, str[]), str)

proc parseCppString*(str: string, unnamed: bool = false): CppNode =
  let parser = newTsCppParser()
  return toHtsTree[TsCppNode, CppNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let cppGrammar*: array[CppNodeKind, HtsRule[CppNodeKind]] = block:
                                                              var rules: array[CppNodeKind, HtsRule[CppNodeKind]]
                                                              type
                                                                K = CppNodeKind


                                                              rules[cppFunctionTypeDeclarator] = tsSeq[K](tsSymbol[K](cppHidTypeDeclarator), tsSymbol[K](cppParameterList))
                                                              rules[cppPreprocElse] = tsSeq[K](tsRegex[K]("#[ \x09]*else"), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)))
                                                              rules[cppTemplateArgumentList] = tsSeq[K](tsString[K]("<"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppTypeDescriptor), tsSymbol[K](cppTypeParameterPackExpansion), tsSymbol[K](cppHidExpression)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppTypeDescriptor), tsSymbol[K](cppTypeParameterPackExpansion), tsSymbol[K](cppHidExpression))))), tsBlank[K]()), tsString[K](">"))
                                                              rules[cppCompoundLiteralExpression] = tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](cppTypeDescriptor), tsString[K](")"), tsSymbol[K](cppInitializerList)), tsSeq[K](tsSymbol[K](cppHidClassName), tsSymbol[K](cppInitializerList)))
                                                              rules[cppLambdaDefaultCapture] = tsChoice[K](tsString[K]("="), tsString[K]("&"))
                                                              rules[cppTypeDefinition] = tsSeq[K](tsString[K]("typedef"), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsSymbol[K](cppHidTypeSpecifier), tsSeq[K](tsSymbol[K](cppHidTypeDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppHidTypeDeclarator)))), tsString[K](";"))
                                                              rules[cppStructSpecifier] = tsSeq[K](tsString[K]("struct"), tsChoice[K](tsSymbol[K](cppMsDeclspecModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppAttributeDeclaration), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppHidClassName), tsSeq[K](tsChoice[K](tsSymbol[K](cppHidClassName), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppVirtualSpecifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppBaseClassClause), tsBlank[K]()), tsSymbol[K](cppFieldDeclarationList))))
                                                              rules[cppHidAbstractDeclarator] = tsChoice[K](tsChoice[K](tsSymbol[K](cppAbstractPointerDeclarator), tsSymbol[K](cppAbstractFunctionDeclarator), tsSymbol[K](cppAbstractArrayDeclarator), tsSymbol[K](cppAbstractParenthesizedDeclarator)), tsSymbol[K](cppAbstractReferenceDeclarator))
                                                              rules[cppPreprocElseInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*else"), tsRepeat[K](tsSymbol[K](cppHidFieldDeclarationListItem)))
                                                              rules[cppStaticAssertDeclaration] = tsSeq[K](tsString[K]("static_assert"), tsString[K]("("), tsSymbol[K](cppHidExpression), tsChoice[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppStringLiteral), tsSymbol[K](cppRawStringLiteral), tsSymbol[K](cppConcatenatedString))), tsBlank[K]()), tsString[K](")"), tsString[K](";"))
                                                              rules[cppExplicitFunctionSpecifier] = tsChoice[K](tsString[K]("explicit"), tsSeq[K](tsString[K]("explicit"), tsString[K]("("), tsSymbol[K](cppHidExpression), tsString[K](")")))
                                                              rules[cppPreprocDefined] = tsChoice[K](tsSeq[K](tsString[K]("defined"), tsString[K]("("), tsSymbol[K](cppIdentifier), tsString[K](")")), tsSeq[K](tsString[K]("defined"), tsSymbol[K](cppIdentifier)))
                                                              rules[cppFalse] = tsChoice[K](tsString[K]("FALSE"), tsString[K]("false"))
                                                              rules[cppGotoStatement] = tsSeq[K](tsString[K]("goto"), tsSymbol[K](cppHidStatementIdentifier), tsString[K](";"))
                                                              rules[cppLambdaExpression] = tsSeq[K](tsSymbol[K](cppLambdaCaptureSpecifier), tsChoice[K](tsSymbol[K](cppAbstractFunctionDeclarator), tsBlank[K]()), tsSymbol[K](cppCompoundStatement))
                                                              rules[cppHidClassName] = tsChoice[K](tsSymbol[K](cppHidTypeIdentifier), tsSymbol[K](cppTemplateType), tsSymbol[K](cppQualifiedTypeIdentifier))
                                                              rules[cppAttributeDeclaration] = tsSeq[K](tsString[K]("[["), tsSeq[K](tsSymbol[K](cppAttribute), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppAttribute)))), tsString[K]("]]"))
                                                              rules[cppForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsSymbol[K](cppDeclaration), tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)), tsBlank[K]()), tsString[K](";"))), tsChoice[K](tsSymbol[K](cppHidExpression), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)), tsBlank[K]()), tsString[K](")"), tsSymbol[K](cppHidStatement))
                                                              rules[cppQualifiedOperatorCastIdentifier] = tsSeq[K](tsSymbol[K](cppHidScopeResolution), tsChoice[K](tsSymbol[K](cppQualifiedOperatorCastIdentifier), tsSymbol[K](cppOperatorCast)))
                                                              rules[cppPreprocUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~"), tsString[K]("-"), tsString[K]("+")), tsSymbol[K](cppHidPreprocExpression))
                                                              rules[cppOptionalTypeParameterDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("typename"), tsString[K]("class")), tsChoice[K](tsSymbol[K](cppHidTypeIdentifier), tsBlank[K]()), tsString[K]("="), tsSymbol[K](cppHidTypeSpecifier))
                                                              rules[cppPreprocElifInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*elif"), tsSymbol[K](cppHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cppHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElseInFieldDeclarationList), tsSymbol[K](cppPreprocElifInFieldDeclarationList)), tsBlank[K]()))
                                                              rules[cppNewDeclarator] = tsSeq[K](tsString[K]("["), tsSymbol[K](cppHidExpression), tsString[K]("]"), tsChoice[K](tsSymbol[K](cppNewDeclarator), tsBlank[K]()))
                                                              rules[cppUserDefinedLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](cppNumberLiteral), tsSymbol[K](cppCharLiteral), tsSymbol[K](cppStringLiteral), tsSymbol[K](cppRawStringLiteral), tsSymbol[K](cppConcatenatedString)), tsSymbol[K](cppLiteralSuffix))
                                                              rules[cppBitfieldClause] = tsSeq[K](tsString[K](":"), tsSymbol[K](cppHidExpression))
                                                              rules[cppPreprocParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppHidPreprocExpression), tsString[K](")"))
                                                              rules[cppHidTypeDeclarator] = tsChoice[K](tsSymbol[K](cppAttributedTypeDeclarator), tsSymbol[K](cppPointerTypeDeclarator), tsSymbol[K](cppFunctionTypeDeclarator), tsSymbol[K](cppArrayTypeDeclarator), tsSymbol[K](cppParenthesizedTypeDeclarator), tsSymbol[K](cppHidTypeIdentifier))
                                                              rules[cppPreprocDirective] = tsRegex[K]("#[ \\t]*[a-zA-Z]\\w*")
                                                              rules[cppThrowStatement] = tsSeq[K](tsString[K]("throw"), tsChoice[K](tsSymbol[K](cppHidExpression), tsBlank[K]()), tsString[K](";"))
                                                              rules[cppHidDeclarator] = tsChoice[K](tsChoice[K](tsSymbol[K](cppAttributedDeclarator), tsSymbol[K](cppPointerDeclarator), tsSymbol[K](cppFunctionDeclarator), tsSymbol[K](cppArrayDeclarator), tsSymbol[K](cppParenthesizedDeclarator), tsSymbol[K](cppIdentifier)), tsSymbol[K](cppReferenceDeclarator), tsSymbol[K](cppQualifiedIdentifier), tsSymbol[K](cppTemplateFunction), tsSymbol[K](cppOperatorName), tsSymbol[K](cppDestructorName), tsSymbol[K](cppStructuredBindingDeclarator))
                                                              rules[cppArrayDeclarator] = tsSeq[K](tsSymbol[K](cppHidDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                              rules[cppClassSpecifier] = tsSeq[K](tsString[K]("class"), tsChoice[K](tsSymbol[K](cppMsDeclspecModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppAttributeDeclaration), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppHidClassName), tsSeq[K](tsChoice[K](tsSymbol[K](cppHidClassName), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppVirtualSpecifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppBaseClassClause), tsBlank[K]()), tsSymbol[K](cppFieldDeclarationList))))
                                                              rules[cppForRangeLoop] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsSymbol[K](cppHidDeclarationSpecifiers), tsSymbol[K](cppHidDeclarator), tsString[K](":"), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)), tsString[K](")"), tsSymbol[K](cppHidStatement))
                                                              rules[cppDependentIdentifier] = tsSeq[K](tsString[K]("template"), tsSymbol[K](cppTemplateFunction))
                                                              rules[cppTemplateType] = tsSeq[K](tsSymbol[K](cppHidTypeIdentifier), tsSymbol[K](cppTemplateArgumentList))
                                                              rules[cppOperatorName] = tsSeq[K](tsString[K]("operator"), tsChoice[K](tsString[K]("co_await"), tsString[K]("+"), tsString[K]("-"), tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("^"), tsString[K]("&"), tsString[K]("|"), tsString[K]("~"), tsString[K]("!"), tsString[K]("="), tsString[K]("<"), tsString[K](">"), tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("^="), tsString[K]("&="), tsString[K]("|="), tsString[K]("<<"), tsString[K](">>"), tsString[K](">>="), tsString[K]("<<="), tsString[K]("=="), tsString[K]("!="), tsString[K]("<="), tsString[K](">="), tsString[K]("&&"), tsString[K]("||"), tsString[K]("++"), tsString[K]("--"), tsString[K](","), tsString[K]("->*"), tsString[K]("->"), tsString[K]("()"), tsString[K]("[]"), tsSeq[K](tsChoice[K](tsString[K]("new"), tsString[K]("delete")), tsChoice[K](tsString[K]("[]"), tsBlank[K]())), tsSeq[K](tsString[K]("\"\""), tsSymbol[K](cppIdentifier))))
                                                              rules[cppNamespaceAliasDefinition] = tsSeq[K](tsString[K]("namespace"), tsSymbol[K](cppIdentifier), tsString[K]("="), tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppQualifiedIdentifier)), tsString[K](";"))
                                                              rules[cppHidTypeIdentifier] = tsSymbol[K](cppIdentifier)
                                                              rules[cppComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K]("(\\\\(.|\\r?\\n)|[^\\\\\\n])*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                              rules[cppThis] = tsString[K]("this")
                                                              rules[cppPreprocCallExpression] = tsSeq[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppPreprocArgumentList))
                                                              rules[cppEnumSpecifier] = tsSeq[K](tsString[K]("enum"), tsChoice[K](tsChoice[K](tsString[K]("class"), tsString[K]("struct")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](cppHidClassName), tsChoice[K](tsSymbol[K](cppHidEnumBaseClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppEnumeratorList), tsBlank[K]())), tsSymbol[K](cppEnumeratorList)))
                                                              rules[cppVariadicParameter] = tsSeq[K](tsString[K]("..."))
                                                              rules[cppPreprocDef] = tsSeq[K](tsRegex[K]("#[ \x09]*define"), tsSymbol[K](cppIdentifier), tsChoice[K](tsSymbol[K](cppPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                              rules[cppInlineMethodDefinition] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsSymbol[K](cppHidFieldDeclarator), tsChoice[K](tsSymbol[K](cppCompoundStatement), tsSymbol[K](cppDefaultMethodClause), tsSymbol[K](cppDeleteMethodClause)))
                                                              rules[cppAbstractPointerDeclarator] = tsSeq[K](tsString[K]("*"), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()))
                                                              rules[cppAbstractArrayDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()), tsString[K]("["), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                              rules[cppSubscriptExpression] = tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("["), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)), tsString[K]("]"))
                                                              rules[cppPreprocFunctionDef] = tsSeq[K](tsRegex[K]("#[ \x09]*define"), tsSymbol[K](cppIdentifier), tsSymbol[K](cppPreprocParams), tsChoice[K](tsSymbol[K](cppPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                              rules[cppArrayFieldDeclarator] = tsSeq[K](tsSymbol[K](cppHidFieldDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                              rules[cppPointerExpression] = tsSeq[K](tsChoice[K](tsString[K]("*"), tsString[K]("&")), tsSymbol[K](cppHidExpression))
                                                              rules[cppPreprocCall] = tsSeq[K](tsSymbol[K](cppPreprocDirective), tsChoice[K](tsSymbol[K](cppPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                              rules[cppTemplateTemplateParameterDeclaration] = tsSeq[K](tsString[K]("template"), tsSymbol[K](cppTemplateParameterList), tsChoice[K](tsSymbol[K](cppTypeParameterDeclaration), tsSymbol[K](cppVariadicTypeParameterDeclaration), tsSymbol[K](cppOptionalTypeParameterDeclaration)))
                                                              rules[cppSubscriptDesignator] = tsSeq[K](tsString[K]("["), tsSymbol[K](cppHidExpression), tsString[K]("]"))
                                                              rules[cppFieldDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cppHidFieldDeclarationListItem)), tsString[K]("}"))
                                                              rules[cppParenthesizedFieldDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppHidFieldDeclarator), tsString[K](")"))
                                                              rules[cppParameterDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidDeclarator), tsSymbol[K](cppHidAbstractDeclarator)), tsBlank[K]()))
                                                              rules[cppMsCallModifier] = tsChoice[K](tsString[K]("__cdecl"), tsString[K]("__clrcall"), tsString[K]("__stdcall"), tsString[K]("__fastcall"), tsString[K]("__thiscall"), tsString[K]("__vectorcall"))
                                                              rules[cppAttributedStatement] = tsSeq[K](tsRepeat1[K](tsSymbol[K](cppAttributeDeclaration)), tsSymbol[K](cppHidStatement))
                                                              rules[cppVariadicReferenceDeclarator] = tsSeq[K](tsChoice[K](tsString[K]("&&"), tsString[K]("&")), tsSymbol[K](cppVariadicDeclarator))
                                                              rules[cppAliasDeclaration] = tsSeq[K](tsString[K]("using"), tsSymbol[K](cppHidTypeIdentifier), tsString[K]("="), tsSymbol[K](cppTypeDescriptor), tsString[K](";"))
                                                              rules[cppCoAwaitExpression] = tsSeq[K](tsString[K]("co_await"), tsSymbol[K](cppHidExpression))
                                                              rules[cppTranslationUnit] = tsRepeat[K](tsSymbol[K](cppHidTopLevelItem))
                                                              rules[cppPreprocArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppHidPreprocExpression)))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cppAttributedFieldDeclarator] = tsSeq[K](tsSymbol[K](cppHidFieldDeclarator), tsRepeat1[K](tsSymbol[K](cppAttributeDeclaration)))
                                                              rules[cppSizedTypeSpecifier] = tsSeq[K](tsRepeat1[K](tsChoice[K](tsString[K]("signed"), tsString[K]("unsigned"), tsString[K]("long"), tsString[K]("short"))), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidTypeIdentifier), tsSymbol[K](cppPrimitiveType)), tsBlank[K]()))
                                                              rules[cppStringLiteral] = tsSeq[K](tsChoice[K](tsString[K]("L\""), tsString[K]("u\""), tsString[K]("U\""), tsString[K]("u8\""), tsString[K]("\"")), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\\\\"\\n]+"), tsSymbol[K](cppEscapeSequence))), tsString[K]("\""))
                                                              rules[cppPreprocElif] = tsSeq[K](tsRegex[K]("#[ \x09]*elif"), tsSymbol[K](cppHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElse), tsSymbol[K](cppPreprocElif)), tsBlank[K]()))
                                                              rules[cppMsRestrictModifier] = tsString[K]("__restrict")
                                                              rules[cppPreprocArg] = tsRepeat1[K](tsRegex[K](".|\\\\\\r?\\n"))
                                                              rules[cppDefaultMethodClause] = tsSeq[K](tsString[K]("="), tsString[K]("default"), tsString[K](";"))
                                                              rules[cppPointerFieldDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cppMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cppMsPointerModifier)), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsSymbol[K](cppHidFieldDeclarator))
                                                              rules[cppTypeDescriptor] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsSymbol[K](cppHidTypeSpecifier), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()))
                                                              rules[cppBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("+"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("-"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("*"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("/"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("%"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("||"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("&&"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("|"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("^"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("&"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("=="), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("!="), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K](">"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K](">="), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("<="), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("<"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("<<"), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K](">>"), tsSymbol[K](cppHidExpression)))
                                                              rules[cppTemplateInstantiation] = tsSeq[K](tsString[K]("template"), tsChoice[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsBlank[K]()), tsSymbol[K](cppHidDeclarator), tsString[K](";"))
                                                              rules[cppCompoundStatement] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)), tsString[K]("}"))
                                                              rules[cppAttributedDeclarator] = tsSeq[K](tsSymbol[K](cppHidDeclarator), tsRepeat1[K](tsSymbol[K](cppAttributeDeclaration)))
                                                              rules[cppInitDeclarator] = tsChoice[K](tsSeq[K](tsSymbol[K](cppHidDeclarator), tsString[K]("="), tsChoice[K](tsSymbol[K](cppInitializerList), tsSymbol[K](cppHidExpression))), tsSeq[K](tsSymbol[K](cppHidDeclarator), tsChoice[K](tsSymbol[K](cppArgumentList), tsSymbol[K](cppInitializerList))))
                                                              rules[cppHidTypeSpecifier] = tsChoice[K](tsSymbol[K](cppStructSpecifier), tsSymbol[K](cppUnionSpecifier), tsSymbol[K](cppEnumSpecifier), tsSymbol[K](cppClassSpecifier), tsSymbol[K](cppSizedTypeSpecifier), tsSymbol[K](cppPrimitiveType), tsSymbol[K](cppTemplateType), tsSymbol[K](cppAuto), tsSymbol[K](cppDependentType), tsSymbol[K](cppDecltype), tsChoice[K](tsSymbol[K](cppQualifiedTypeIdentifier), tsSymbol[K](cppHidTypeIdentifier)))
                                                              rules[cppDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsSeq[K](tsChoice[K](tsSymbol[K](cppHidDeclarator), tsSymbol[K](cppInitDeclarator)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppHidDeclarator), tsSymbol[K](cppInitDeclarator))))), tsString[K](";"))
                                                              rules[cppFriendDeclaration] = tsSeq[K](tsString[K]("friend"), tsChoice[K](tsSymbol[K](cppDeclaration), tsSymbol[K](cppFunctionDefinition), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("class"), tsString[K]("struct"), tsString[K]("union")), tsBlank[K]()), tsSymbol[K](cppHidClassName), tsString[K](";"))))
                                                              rules[cppHidDeclarationSpecifiers] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppHidDeclarationModifiers)), tsSymbol[K](cppHidTypeSpecifier), tsRepeat[K](tsSymbol[K](cppHidDeclarationModifiers)))
                                                              rules[cppStructuredBindingDeclarator] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](cppIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppIdentifier)))), tsString[K]("]"))
                                                              rules[cppCastExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppTypeDescriptor), tsString[K](")"), tsSymbol[K](cppHidExpression))
                                                              rules[cppEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xuU]"), tsRegex[K]("\\d{2,3}"), tsRegex[K]("x[0-9a-fA-F]{2,}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("U[0-9a-fA-F]{8}")))
                                                              rules[cppDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)), tsString[K]("}"))
                                                              rules[cppVariadicTypeParameterDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("typename"), tsString[K]("class")), tsString[K]("..."), tsChoice[K](tsSymbol[K](cppHidTypeIdentifier), tsBlank[K]()))
                                                              rules[cppFunctionDefinition] = tsSeq[K](tsChoice[K](tsSymbol[K](cppMsCallModifier), tsBlank[K]()), tsSymbol[K](cppHidDeclarationSpecifiers), tsSymbol[K](cppHidDeclarator), tsSymbol[K](cppCompoundStatement))
                                                              rules[cppPointerTypeDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cppMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cppMsPointerModifier)), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsSymbol[K](cppHidTypeDeclarator))
                                                              rules[cppUpdateExpression] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("--"), tsString[K]("++")), tsSymbol[K](cppHidExpression)), tsSeq[K](tsSymbol[K](cppHidExpression), tsChoice[K](tsString[K]("--"), tsString[K]("++"))))
                                                              rules[cppAttribute] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](cppIdentifier), tsString[K]("::")), tsBlank[K]()), tsSymbol[K](cppIdentifier), tsChoice[K](tsSymbol[K](cppArgumentList), tsBlank[K]()))
                                                              rules[cppNoexcept] = tsSeq[K](tsString[K]("noexcept"), tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](cppHidExpression), tsBlank[K]()), tsString[K](")")), tsBlank[K]()))
                                                              rules[cppEnumerator] = tsSeq[K](tsSymbol[K](cppIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](cppHidExpression)), tsBlank[K]()))
                                                              rules[cppCatchClause] = tsSeq[K](tsString[K]("catch"), tsSymbol[K](cppParameterList), tsSymbol[K](cppCompoundStatement))
                                                              rules[cppNamespaceDefinitionName] = tsSeq[K](tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppNamespaceDefinitionName)), tsString[K]("::"), tsChoice[K](tsString[K]("inline"), tsBlank[K]()), tsSymbol[K](cppIdentifier))
                                                              rules[cppOperatorCastDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppHidConstructorSpecifiers)), tsChoice[K](tsSymbol[K](cppOperatorCast), tsSymbol[K](cppQualifiedOperatorCastIdentifier)), tsSymbol[K](cppCompoundStatement))
                                                              rules[cppTemplateDeclaration] = tsSeq[K](tsString[K]("template"), tsSymbol[K](cppTemplateParameterList), tsChoice[K](tsSymbol[K](cppHidEmptyDeclaration), tsSymbol[K](cppAliasDeclaration), tsSymbol[K](cppDeclaration), tsSymbol[K](cppTemplateDeclaration), tsSymbol[K](cppFunctionDefinition), tsSymbol[K](cppConstructorOrDestructorDeclaration), tsSymbol[K](cppConstructorOrDestructorDefinition), tsSymbol[K](cppOperatorCastDeclaration), tsSymbol[K](cppOperatorCastDefinition)))
                                                              rules[cppInitializerPair] = tsSeq[K](tsRepeat1[K](tsChoice[K](tsSymbol[K](cppSubscriptDesignator), tsSymbol[K](cppFieldDesignator))), tsString[K]("="), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)))
                                                              rules[cppCoYieldStatement] = tsSeq[K](tsString[K]("co_yield"), tsSymbol[K](cppHidExpression), tsString[K](";"))
                                                              rules[cppAttributedTypeDeclarator] = tsSeq[K](tsSymbol[K](cppHidTypeDeclarator), tsRepeat1[K](tsSymbol[K](cppAttributeDeclaration)))
                                                              rules[cppAssignmentExpression] = tsSeq[K](tsSymbol[K](cppHidAssignmentLeftExpression), tsChoice[K](tsString[K]("="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("+="), tsString[K]("-="), tsString[K]("<<="), tsString[K](">>="), tsString[K]("&="), tsString[K]("^="), tsString[K]("|=")), tsSymbol[K](cppHidExpression))
                                                              rules[cppHidScopeResolution] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cppHidNamespaceIdentifier), tsSymbol[K](cppTemplateType), tsSymbol[K](cppDependentTypeIdentifier)), tsBlank[K]()), tsString[K]("::"))
                                                              rules[cppHidNamespaceIdentifier] = tsSymbol[K](cppIdentifier)
                                                              rules[cppDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](cppHidStatement), tsString[K]("while"), tsSymbol[K](cppParenthesizedExpression), tsString[K](";"))
                                                              rules[cppPreprocIf] = tsSeq[K](tsRegex[K]("#[ \x09]*if"), tsSymbol[K](cppHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElse), tsSymbol[K](cppPreprocElif)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                              rules[cppHidPreprocExpression] = tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppPreprocCallExpression), tsSymbol[K](cppNumberLiteral), tsSymbol[K](cppCharLiteral), tsSymbol[K](cppPreprocDefined), tsSymbol[K](cppPreprocUnaryExpression), tsSymbol[K](cppPreprocBinaryExpression), tsSymbol[K](cppPreprocParenthesizedExpression))
                                                              rules[cppHidNonCaseStatement] = tsChoice[K](tsChoice[K](tsSymbol[K](cppLabeledStatement), tsSymbol[K](cppCompoundStatement), tsSymbol[K](cppExpressionStatement), tsSymbol[K](cppIfStatement), tsSymbol[K](cppSwitchStatement), tsSymbol[K](cppDoStatement), tsSymbol[K](cppWhileStatement), tsSymbol[K](cppForStatement), tsSymbol[K](cppReturnStatement), tsSymbol[K](cppBreakStatement), tsSymbol[K](cppContinueStatement), tsSymbol[K](cppGotoStatement)), tsSymbol[K](cppCoReturnStatement), tsSymbol[K](cppCoYieldStatement), tsSymbol[K](cppForRangeLoop), tsSymbol[K](cppTryStatement), tsSymbol[K](cppThrowStatement))
                                                              rules[cppDependentType] = tsSeq[K](tsString[K]("typename"), tsSymbol[K](cppHidTypeSpecifier))
                                                              rules[cppOptionalParameterDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsChoice[K](tsSymbol[K](cppHidDeclarator), tsBlank[K]()), tsString[K]("="), tsSymbol[K](cppHidExpression))
                                                              rules[cppTypeParameterPackExpansion] = tsSeq[K](tsSymbol[K](cppTypeDescriptor), tsString[K]("..."))
                                                              rules[cppRefQualifier] = tsChoice[K](tsString[K]("&"), tsString[K]("&&"))
                                                              rules[cppPointerDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cppMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cppMsPointerModifier)), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsSymbol[K](cppHidDeclarator))
                                                              rules[cppLambdaCaptureSpecifier] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](cppLambdaDefaultCapture), tsChoice[K](tsSeq[K](tsSymbol[K](cppHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppHidExpression)))), tsBlank[K]()), tsSeq[K](tsSymbol[K](cppLambdaDefaultCapture), tsString[K](","), tsSeq[K](tsSymbol[K](cppHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppHidExpression)))))), tsString[K]("]"))
                                                              rules[cppReferenceFieldDeclarator] = tsSeq[K](tsChoice[K](tsString[K]("&"), tsString[K]("&&")), tsSymbol[K](cppHidFieldDeclarator))
                                                              rules[cppOperatorCastDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppHidConstructorSpecifiers)), tsChoice[K](tsSymbol[K](cppOperatorCast), tsSymbol[K](cppQualifiedOperatorCastIdentifier)), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](cppHidExpression)), tsBlank[K]()), tsString[K](";"))
                                                              rules[cppReturnStatement] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("return"), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)), tsBlank[K]()), tsString[K](";")), tsSeq[K](tsString[K]("return"), tsSymbol[K](cppInitializerList), tsString[K](";"))))
                                                              rules[cppConditionClause] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cppDeclaration), tsSymbol[K](cppExpressionStatement)), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression))), tsSymbol[K](cppConditionDeclaration)), tsString[K](")"))
                                                              rules[cppAttributedNonCaseStatement] = tsSeq[K](tsRepeat1[K](tsSymbol[K](cppAttributeDeclaration)), tsSymbol[K](cppHidNonCaseStatement))
                                                              rules[cppCharLiteral] = tsSeq[K](tsChoice[K](tsString[K]("L\'"), tsString[K]("u\'"), tsString[K]("U\'"), tsString[K]("u8\'"), tsString[K]("\'")), tsChoice[K](tsSymbol[K](cppEscapeSequence), tsRegex[K]("[^\\n\']")), tsString[K]("\'"))
                                                              rules[cppArrayTypeDeclarator] = tsSeq[K](tsSymbol[K](cppHidTypeDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cppTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                              rules[cppMsPointerModifier] = tsChoice[K](tsSymbol[K](cppMsUnalignedPtrModifier), tsSymbol[K](cppMsRestrictModifier), tsSymbol[K](cppMsUnsignedPtrModifier), tsSymbol[K](cppMsSignedPtrModifier))
                                                              rules[cppHidExpression] = tsChoice[K](tsChoice[K](tsSymbol[K](cppConditionalExpression), tsSymbol[K](cppAssignmentExpression), tsSymbol[K](cppBinaryExpression), tsSymbol[K](cppUnaryExpression), tsSymbol[K](cppUpdateExpression), tsSymbol[K](cppCastExpression), tsSymbol[K](cppPointerExpression), tsSymbol[K](cppSizeofExpression), tsSymbol[K](cppSubscriptExpression), tsSymbol[K](cppCallExpression), tsSymbol[K](cppFieldExpression), tsSymbol[K](cppCompoundLiteralExpression), tsSymbol[K](cppIdentifier), tsSymbol[K](cppNumberLiteral), tsSymbol[K](cppStringLiteral), tsSymbol[K](cppTrue), tsSymbol[K](cppFalse), tsSymbol[K](cppNull), tsSymbol[K](cppConcatenatedString), tsSymbol[K](cppCharLiteral), tsSymbol[K](cppParenthesizedExpression)), tsSymbol[K](cppCoAwaitExpression), tsSymbol[K](cppTemplateFunction), tsSymbol[K](cppQualifiedIdentifier), tsSymbol[K](cppNewExpression), tsSymbol[K](cppDeleteExpression), tsSymbol[K](cppLambdaExpression), tsSymbol[K](cppParameterPackExpansion), tsSymbol[K](cppNullptr), tsSymbol[K](cppThis), tsSymbol[K](cppRawStringLiteral), tsSymbol[K](cppUserDefinedLiteral))
                                                              rules[cppSystemLibString] = tsSeq[K](tsString[K]("<"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^>\\n]"), tsString[K]("\\>"))), tsString[K](">"))
                                                              rules[cppUsingDeclaration] = tsSeq[K](tsString[K]("using"), tsChoice[K](tsString[K]("namespace"), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppQualifiedIdentifier)), tsString[K](";"))
                                                              rules[cppQualifiedTypeIdentifier] = tsSeq[K](tsSymbol[K](cppHidScopeResolution), tsChoice[K](tsSymbol[K](cppDependentTypeIdentifier), tsSymbol[K](cppQualifiedTypeIdentifier), tsSymbol[K](cppTemplateType), tsSymbol[K](cppHidTypeIdentifier)))
                                                              rules[cppSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](cppConditionClause), tsSymbol[K](cppCompoundStatement))
                                                              rules[cppCaseStatement] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("case"), tsSymbol[K](cppHidExpression)), tsString[K]("default")), tsString[K](":"), tsRepeat[K](tsChoice[K](tsSymbol[K](cppAttributedNonCaseStatement), tsSymbol[K](cppHidNonCaseStatement), tsSymbol[K](cppDeclaration), tsSymbol[K](cppTypeDefinition))))
                                                              rules[cppNewExpression] = tsSeq[K](tsChoice[K](tsString[K]("::"), tsBlank[K]()), tsString[K]("new"), tsChoice[K](tsSymbol[K](cppArgumentList), tsBlank[K]()), tsSymbol[K](cppHidTypeSpecifier), tsChoice[K](tsSymbol[K](cppNewDeclarator), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](cppArgumentList), tsSymbol[K](cppInitializerList)), tsBlank[K]()))
                                                              rules[cppHidFieldIdentifier] = tsSymbol[K](cppIdentifier)
                                                              rules[cppVirtualFunctionSpecifier] = tsChoice[K](tsString[K]("virtual"))
                                                              rules[cppMsUnsignedPtrModifier] = tsString[K]("__uptr")
                                                              rules[cppFunctionDeclarator] = tsSeq[K](tsSeq[K](tsSymbol[K](cppHidDeclarator), tsSymbol[K](cppParameterList), tsRepeat[K](tsSymbol[K](cppAttributeSpecifier))), tsRepeat[K](tsChoice[K](tsSymbol[K](cppTypeQualifier), tsSymbol[K](cppRefQualifier), tsSymbol[K](cppVirtualSpecifier), tsSymbol[K](cppNoexcept), tsSymbol[K](cppThrowSpecifier), tsSymbol[K](cppTrailingReturnType))))
                                                              rules[cppAbstractReferenceDeclarator] = tsSeq[K](tsChoice[K](tsString[K]("&"), tsString[K]("&&")), tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()))
                                                              rules[cppPreprocIfdefInFieldDeclarationList] = tsSeq[K](tsChoice[K](tsRegex[K]("#[ \x09]*ifdef"), tsRegex[K]("#[ \x09]*ifndef")), tsSymbol[K](cppIdentifier), tsRepeat[K](tsSymbol[K](cppHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElseInFieldDeclarationList), tsSymbol[K](cppPreprocElifInFieldDeclarationList)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                              rules[cppStorageClassSpecifier] = tsChoice[K](tsString[K]("extern"), tsString[K]("static"), tsString[K]("register"), tsString[K]("inline"), tsString[K]("thread_local"))
                                                              rules[cppHidEnumBaseClause] = tsSeq[K](tsString[K](":"), tsChoice[K](tsSymbol[K](cppQualifiedTypeIdentifier), tsSymbol[K](cppHidTypeIdentifier), tsSymbol[K](cppSizedTypeSpecifier)))
                                                              rules[cppVariadicParameterDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsChoice[K](tsSymbol[K](cppVariadicDeclarator), tsSymbol[K](cppVariadicReferenceDeclarator)))
                                                              rules[cppParenthesizedDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppHidDeclarator), tsString[K](")"))
                                                              rules[cppEnumeratorList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](cppEnumerator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppEnumerator)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                              rules[cppUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~"), tsString[K]("-"), tsString[K]("+")), tsSymbol[K](cppHidExpression))
                                                              rules[cppMacroTypeSpecifier] = tsSeq[K](tsSymbol[K](cppIdentifier), tsString[K]("("), tsSymbol[K](cppTypeDescriptor), tsString[K](")"))
                                                              rules[cppFieldExpression] = tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](cppHidExpression), tsChoice[K](tsString[K]("."), tsString[K]("->"))), tsSymbol[K](cppHidFieldIdentifier)), tsSeq[K](tsSeq[K](tsSymbol[K](cppHidExpression), tsChoice[K](tsString[K]("."), tsString[K]("->"))), tsChoice[K](tsSymbol[K](cppDestructorName), tsSymbol[K](cppTemplateMethod), tsSymbol[K](cppDependentFieldIdentifier))))
                                                              rules[cppPreprocIfdef] = tsSeq[K](tsChoice[K](tsRegex[K]("#[ \x09]*ifdef"), tsRegex[K]("#[ \x09]*ifndef")), tsSymbol[K](cppIdentifier), tsRepeat[K](tsSymbol[K](cppHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElse), tsSymbol[K](cppPreprocElif)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                              rules[cppQualifiedIdentifier] = tsSeq[K](tsSymbol[K](cppHidScopeResolution), tsChoice[K](tsSymbol[K](cppDependentIdentifier), tsSymbol[K](cppQualifiedIdentifier), tsSymbol[K](cppTemplateFunction), tsSymbol[K](cppIdentifier), tsSymbol[K](cppOperatorName), tsSymbol[K](cppDestructorName)))
                                                              rules[cppPreprocIfInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*if"), tsSymbol[K](cppHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cppHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cppPreprocElseInFieldDeclarationList), tsSymbol[K](cppPreprocElifInFieldDeclarationList)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                              rules[cppTypeQualifier] = tsChoice[K](tsChoice[K](tsString[K]("const"), tsString[K]("volatile"), tsString[K]("restrict"), tsString[K]("_Atomic")), tsString[K]("mutable"), tsString[K]("constexpr"))
                                                              rules[cppHidStatement] = tsChoice[K](tsSymbol[K](cppCaseStatement), tsSymbol[K](cppHidNonCaseStatement))
                                                              rules[cppIdentifier] = tsRegex[K]("[a-zA-Z_]\\w*")
                                                              rules[cppHidFieldDeclarationListItem] = tsChoice[K](tsChoice[K](tsSymbol[K](cppFieldDeclaration), tsSymbol[K](cppPreprocDef), tsSymbol[K](cppPreprocFunctionDef), tsSymbol[K](cppPreprocCall), tsSymbol[K](cppPreprocIfInFieldDeclarationList), tsSymbol[K](cppPreprocIfdefInFieldDeclarationList)), tsSymbol[K](cppTemplateDeclaration), tsSymbol[K](cppInlineMethodDefinition), tsSymbol[K](cppConstructorOrDestructorDefinition), tsSymbol[K](cppConstructorOrDestructorDeclaration), tsSymbol[K](cppOperatorCastDefinition), tsSymbol[K](cppOperatorCastDeclaration), tsSymbol[K](cppFriendDeclaration), tsSymbol[K](cppAccessSpecifier), tsSymbol[K](cppAliasDeclaration), tsSymbol[K](cppUsingDeclaration), tsSymbol[K](cppTypeDefinition), tsSymbol[K](cppStaticAssertDeclaration), tsSymbol[K](cppQpropertyDeclaration))
                                                              rules[cppHidDeclarationModifiers] = tsChoice[K](tsChoice[K](tsSymbol[K](cppStorageClassSpecifier), tsSymbol[K](cppTypeQualifier), tsSymbol[K](cppAttributeSpecifier), tsSymbol[K](cppAttributeDeclaration), tsSymbol[K](cppMsDeclspecModifier)), tsSymbol[K](cppVirtualFunctionSpecifier))
                                                              rules[cppAuto] = tsString[K]("auto")
                                                              rules[cppNullptr] = tsString[K]("nullptr")
                                                              rules[cppFieldDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsChoice[K](tsSeq[K](tsSymbol[K](cppHidFieldDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppHidFieldDeclarator)))), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](cppBitfieldClause), tsSymbol[K](cppInitializerList), tsSeq[K](tsString[K]("="), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)))), tsBlank[K]()), tsString[K](";"))
                                                              rules[cppReferenceDeclarator] = tsSeq[K](tsChoice[K](tsString[K]("&"), tsString[K]("&&")), tsSymbol[K](cppHidDeclarator))
                                                              rules[cppParameterList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppParameterDeclaration), tsSymbol[K](cppOptionalParameterDeclaration), tsSymbol[K](cppVariadicParameterDeclaration), tsString[K]("...")), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppParameterDeclaration), tsSymbol[K](cppOptionalParameterDeclaration), tsSymbol[K](cppVariadicParameterDeclaration), tsString[K]("..."))))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cppHidStatementIdentifier] = tsSymbol[K](cppIdentifier)
                                                              rules[cppOperatorCast] = tsSeq[K](tsString[K]("operator"), tsSymbol[K](cppHidDeclarationSpecifiers), tsSymbol[K](cppHidAbstractDeclarator))
                                                              rules[cppMsSignedPtrModifier] = tsString[K]("__sptr")
                                                              rules[cppTrue] = tsChoice[K](tsString[K]("TRUE"), tsString[K]("true"))
                                                              rules[cppCommaExpression] = tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K](","), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)))
                                                              rules[cppAttributeSpecifier] = tsSeq[K](tsString[K]("__attribute__"), tsString[K]("("), tsSymbol[K](cppArgumentList), tsString[K](")"))
                                                              rules[cppHidAssignmentLeftExpression] = tsChoice[K](tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppCallExpression), tsSymbol[K](cppFieldExpression), tsSymbol[K](cppPointerExpression), tsSymbol[K](cppSubscriptExpression), tsSymbol[K](cppParenthesizedExpression)), tsSymbol[K](cppQualifiedIdentifier))
                                                              rules[cppLabeledStatement] = tsSeq[K](tsSymbol[K](cppHidStatementIdentifier), tsString[K](":"), tsSymbol[K](cppHidStatement))
                                                              rules[cppInitializerList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppInitializerPair), tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppInitializerPair), tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                              rules[cppTemplateParameterList] = tsSeq[K](tsString[K]("<"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppParameterDeclaration), tsSymbol[K](cppOptionalParameterDeclaration), tsSymbol[K](cppTypeParameterDeclaration), tsSymbol[K](cppVariadicParameterDeclaration), tsSymbol[K](cppVariadicTypeParameterDeclaration), tsSymbol[K](cppOptionalTypeParameterDeclaration), tsSymbol[K](cppTemplateTemplateParameterDeclaration)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppParameterDeclaration), tsSymbol[K](cppOptionalParameterDeclaration), tsSymbol[K](cppTypeParameterDeclaration), tsSymbol[K](cppVariadicParameterDeclaration), tsSymbol[K](cppVariadicTypeParameterDeclaration), tsSymbol[K](cppOptionalTypeParameterDeclaration), tsSymbol[K](cppTemplateTemplateParameterDeclaration))))), tsBlank[K]()), tsString[K](">"))
                                                              rules[cppParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)), tsString[K](")"))
                                                              rules[cppHidEmptyDeclaration] = tsSeq[K](tsSymbol[K](cppHidTypeSpecifier), tsString[K](";"))
                                                              rules[cppAbstractFunctionDeclarator] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()), tsSymbol[K](cppParameterList)), tsRepeat[K](tsChoice[K](tsSymbol[K](cppTypeQualifier), tsSymbol[K](cppRefQualifier), tsSymbol[K](cppNoexcept), tsSymbol[K](cppThrowSpecifier))), tsChoice[K](tsSymbol[K](cppTrailingReturnType), tsBlank[K]()))
                                                              rules[cppUnionSpecifier] = tsSeq[K](tsString[K]("union"), tsChoice[K](tsSymbol[K](cppMsDeclspecModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppAttributeDeclaration), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppHidClassName), tsSeq[K](tsChoice[K](tsSymbol[K](cppHidClassName), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppVirtualSpecifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppBaseClassClause), tsBlank[K]()), tsSymbol[K](cppFieldDeclarationList))))
                                                              rules[cppWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](cppConditionClause), tsSymbol[K](cppHidStatement))
                                                              rules[cppNamespaceDefinition] = tsSeq[K](tsString[K]("namespace"), tsChoice[K](tsChoice[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppNamespaceDefinitionName)), tsBlank[K]()), tsSymbol[K](cppDeclarationList))
                                                              rules[cppMsUnalignedPtrModifier] = tsChoice[K](tsString[K]("_unaligned"), tsString[K]("__unaligned"))
                                                              rules[cppNull] = tsString[K]("NULL")
                                                              rules[cppLiteralSuffix] = tsRegex[K]("[a-zA-Z_]\\w*")
                                                              rules[cppVariadicDeclarator] = tsSeq[K](tsString[K]("..."), tsChoice[K](tsSymbol[K](cppIdentifier), tsBlank[K]()))
                                                              rules[cppTemplateMethod] = tsSeq[K](tsSymbol[K](cppHidFieldIdentifier), tsSymbol[K](cppTemplateArgumentList))
                                                              rules[cppCallExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppArgumentList)), tsSeq[K](tsSymbol[K](cppPrimitiveType), tsSymbol[K](cppArgumentList)))
                                                              rules[cppVirtualSpecifier] = tsChoice[K](tsString[K]("final"), tsString[K]("override"))
                                                              rules[cppFieldInitializerList] = tsSeq[K](tsString[K](":"), tsSeq[K](tsSymbol[K](cppFieldInitializer), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppFieldInitializer)))))
                                                              rules[cppDeleteExpression] = tsSeq[K](tsChoice[K](tsString[K]("::"), tsBlank[K]()), tsString[K]("delete"), tsChoice[K](tsSeq[K](tsString[K]("["), tsString[K]("]")), tsBlank[K]()), tsSymbol[K](cppHidExpression))
                                                              rules[cppAbstractParenthesizedDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppHidAbstractDeclarator), tsString[K](")"))
                                                              rules[cppTryStatement] = tsSeq[K](tsString[K]("try"), tsSymbol[K](cppCompoundStatement), tsRepeat1[K](tsSymbol[K](cppCatchClause)))
                                                              rules[cppThrowSpecifier] = tsSeq[K](tsString[K]("throw"), tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](cppTypeDescriptor), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cppTypeDescriptor)))), tsBlank[K]()), tsString[K](")")))
                                                              rules[cppParameterPackExpansion] = tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("..."))
                                                              rules[cppDestructorName] = tsSeq[K](tsString[K]("~"), tsSymbol[K](cppIdentifier))
                                                              rules[cppConditionalExpression] = tsSeq[K](tsSymbol[K](cppHidExpression), tsString[K]("?"), tsSymbol[K](cppHidExpression), tsString[K](":"), tsSymbol[K](cppHidExpression))
                                                              rules[cppParenthesizedTypeDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cppHidTypeDeclarator), tsString[K](")"))
                                                              rules[cppSizeofExpression] = tsChoice[K](tsSeq[K](tsString[K]("sizeof"), tsChoice[K](tsSymbol[K](cppHidExpression), tsSeq[K](tsString[K]("("), tsSymbol[K](cppTypeDescriptor), tsString[K](")")))), tsSeq[K](tsString[K]("sizeof"), tsString[K]("..."), tsString[K]("("), tsSymbol[K](cppIdentifier), tsString[K](")")))
                                                              rules[cppNumberLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[-\\+]"), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0b")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]"))))), tsSeq[K](tsString[K]("0b"), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]")))))), tsSeq[K](tsString[K]("0x"), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]"))))))), tsChoice[K](tsSeq[K](tsString[K]("."), tsChoice[K](tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]"))))), tsBlank[K]())), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]"))))))), tsChoice[K](tsSeq[K](tsRegex[K]("[eEpP]"), tsChoice[K](tsSeq[K](tsChoice[K](tsRegex[K]("[-\\+]"), tsBlank[K]()), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")))))), tsBlank[K]())), tsBlank[K]()), tsRepeat[K](tsChoice[K](tsString[K]("u"), tsString[K]("l"), tsString[K]("U"), tsString[K]("L"), tsString[K]("f"), tsString[K]("F"))))
                                                              rules[cppLinkageSpecification] = tsSeq[K](tsString[K]("extern"), tsSymbol[K](cppStringLiteral), tsChoice[K](tsSymbol[K](cppFunctionDefinition), tsSymbol[K](cppDeclaration), tsSymbol[K](cppDeclarationList)))
                                                              rules[cppPrimitiveType] = tsChoice[K](tsString[K]("bool"), tsString[K]("char"), tsString[K]("int"), tsString[K]("float"), tsString[K]("double"), tsString[K]("void"), tsString[K]("size_t"), tsString[K]("ssize_t"), tsString[K]("intptr_t"), tsString[K]("uintptr_t"), tsString[K]("charptr_t"), tsString[K]("int8_t"), tsString[K]("int16_t"), tsString[K]("int32_t"), tsString[K]("int64_t"), tsString[K]("uint8_t"), tsString[K]("uint16_t"), tsString[K]("uint32_t"), tsString[K]("uint64_t"), tsString[K]("char8_t"), tsString[K]("char16_t"), tsString[K]("char32_t"), tsString[K]("char64_t"))
                                                              rules[cppBreakStatement] = tsSeq[K](tsString[K]("break"), tsString[K](";"))
                                                              rules[cppConstructorOrDestructorDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppHidConstructorSpecifiers)), tsSymbol[K](cppFunctionDeclarator), tsChoice[K](tsSymbol[K](cppFieldInitializerList), tsBlank[K]()), tsChoice[K](tsSymbol[K](cppCompoundStatement), tsSymbol[K](cppDefaultMethodClause), tsSymbol[K](cppDeleteMethodClause)))
                                                              rules[cppQualifiedFieldIdentifier] = tsSeq[K](tsSymbol[K](cppHidScopeResolution), tsChoice[K](tsSymbol[K](cppDependentFieldIdentifier), tsSymbol[K](cppQualifiedFieldIdentifier), tsSymbol[K](cppTemplateMethod), tsSymbol[K](cppHidFieldIdentifier)))
                                                              rules[cppPreprocBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("+"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("-"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("*"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("/"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("%"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("||"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("&&"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("|"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("^"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("&"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("=="), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("!="), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K](">"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K](">="), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("<="), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("<"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K]("<<"), tsSymbol[K](cppHidPreprocExpression)), tsSeq[K](tsSymbol[K](cppHidPreprocExpression), tsString[K](">>"), tsSymbol[K](cppHidPreprocExpression)))
                                                              rules[cppFieldDesignator] = tsSeq[K](tsString[K]("."), tsSymbol[K](cppHidFieldIdentifier))
                                                              rules[cppDeleteMethodClause] = tsSeq[K](tsString[K]("="), tsString[K]("delete"), tsString[K](";"))
                                                              rules[cppConditionDeclaration] = tsSeq[K](tsSymbol[K](cppHidDeclarationSpecifiers), tsSymbol[K](cppHidDeclarator), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](cppHidExpression)), tsSymbol[K](cppInitializerList)))
                                                              rules[cppDependentFieldIdentifier] = tsSeq[K](tsString[K]("template"), tsSymbol[K](cppTemplateMethod))
                                                              rules[cppArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppInitializerList))))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cppHidTopLevelItem] = tsChoice[K](tsChoice[K](tsSymbol[K](cppFunctionDefinition), tsSymbol[K](cppLinkageSpecification), tsSymbol[K](cppDeclaration), tsSymbol[K](cppHidStatement), tsSymbol[K](cppAttributedStatement), tsSymbol[K](cppTypeDefinition), tsSymbol[K](cppHidEmptyDeclaration), tsSymbol[K](cppPreprocIf), tsSymbol[K](cppPreprocIfdef), tsSymbol[K](cppPreprocInclude), tsSymbol[K](cppPreprocDef), tsSymbol[K](cppPreprocFunctionDef), tsSymbol[K](cppPreprocCall)), tsSymbol[K](cppNamespaceDefinition), tsSymbol[K](cppNamespaceAliasDefinition), tsSymbol[K](cppUsingDeclaration), tsSymbol[K](cppAliasDeclaration), tsSymbol[K](cppStaticAssertDeclaration), tsSymbol[K](cppTemplateDeclaration), tsSymbol[K](cppTemplateInstantiation), tsSymbol[K](cppConstructorOrDestructorDefinition), tsSymbol[K](cppOperatorCastDefinition), tsSymbol[K](cppOperatorCastDeclaration))
                                                              rules[cppIfStatement] = tsSeq[K](tsString[K]("if"), tsChoice[K](tsString[K]("constexpr"), tsBlank[K]()), tsSymbol[K](cppConditionClause), tsSymbol[K](cppHidStatement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](cppHidStatement)), tsBlank[K]()))
                                                              rules[cppContinueStatement] = tsSeq[K](tsString[K]("continue"), tsString[K](";"))
                                                              rules[cppMsDeclspecModifier] = tsSeq[K](tsString[K]("__declspec"), tsString[K]("("), tsSymbol[K](cppIdentifier), tsString[K](")"))
                                                              rules[cppMsBasedModifier] = tsSeq[K](tsString[K]("__based"), tsSymbol[K](cppArgumentList))
                                                              rules[cppQpropertyDeclaration] = tsSeq[K](tsString[K]("Q_PROPERTY"), tsString[K]("("), tsRepeat[K](tsSymbol[K](cppHidTypeIdentifier)), tsString[K](")"))
                                                              rules[cppExpressionStatement] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cppHidExpression), tsSymbol[K](cppCommaExpression)), tsBlank[K]()), tsString[K](";"))
                                                              rules[cppPreprocParams] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cppIdentifier), tsString[K]("...")), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cppIdentifier), tsString[K]("..."))))), tsBlank[K]()), tsString[K](")"))
                                                              rules[cppTrailingReturnType] = tsSeq[K](tsString[K]("->"), tsChoice[K](tsSymbol[K](cppTypeQualifier), tsBlank[K]()), tsSymbol[K](cppHidTypeSpecifier), tsChoice[K](tsSymbol[K](cppHidAbstractDeclarator), tsBlank[K]()))
                                                              rules[cppBaseClassClause] = tsSeq[K](tsString[K](":"), tsSeq[K](tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("public"), tsString[K]("private"), tsString[K]("protected")), tsBlank[K]()), tsSymbol[K](cppHidClassName), tsChoice[K](tsString[K]("..."), tsBlank[K]())), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("public"), tsString[K]("private"), tsString[K]("protected")), tsBlank[K]()), tsSymbol[K](cppHidClassName), tsChoice[K](tsString[K]("..."), tsBlank[K]()))))))
                                                              rules[cppFieldInitializer] = tsSeq[K](tsChoice[K](tsSymbol[K](cppHidFieldIdentifier), tsSymbol[K](cppTemplateMethod), tsSymbol[K](cppQualifiedFieldIdentifier)), tsChoice[K](tsSymbol[K](cppInitializerList), tsSymbol[K](cppArgumentList)), tsChoice[K](tsString[K]("..."), tsBlank[K]()))
                                                              rules[cppCoReturnStatement] = tsSeq[K](tsString[K]("co_return"), tsChoice[K](tsSymbol[K](cppHidExpression), tsBlank[K]()), tsString[K](";"))
                                                              rules[cppDependentTypeIdentifier] = tsSeq[K](tsString[K]("template"), tsSymbol[K](cppTemplateType))
                                                              rules[cppPreprocInclude] = tsSeq[K](tsRegex[K]("#[ \x09]*include"), tsChoice[K](tsSymbol[K](cppStringLiteral), tsSymbol[K](cppSystemLibString), tsSymbol[K](cppIdentifier), tsSymbol[K](cppPreprocCallExpression)), tsString[K]("\x0A"))
                                                              rules[cppConstructorOrDestructorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](cppHidConstructorSpecifiers)), tsSymbol[K](cppFunctionDeclarator), tsString[K](";"))
                                                              rules[cppHidConstructorSpecifiers] = tsChoice[K](tsSymbol[K](cppHidDeclarationModifiers), tsSymbol[K](cppExplicitFunctionSpecifier))
                                                              rules[cppDecltype] = tsSeq[K](tsString[K]("decltype"), tsString[K]("("), tsSymbol[K](cppHidExpression), tsString[K](")"))
                                                              rules[cppHidFieldDeclarator] = tsChoice[K](tsChoice[K](tsSymbol[K](cppAttributedFieldDeclarator), tsSymbol[K](cppPointerFieldDeclarator), tsSymbol[K](cppFunctionFieldDeclarator), tsSymbol[K](cppArrayFieldDeclarator), tsSymbol[K](cppParenthesizedFieldDeclarator), tsSymbol[K](cppHidFieldIdentifier)), tsSymbol[K](cppReferenceFieldDeclarator), tsSymbol[K](cppTemplateMethod), tsSymbol[K](cppOperatorName))
                                                              rules[cppAccessSpecifier] = tsSeq[K](tsChoice[K](tsString[K]("public"), tsString[K]("private"), tsString[K]("protected"), tsString[K]("slots"), tsString[K]("signals"), tsSeq[K](tsString[K]("public"), tsString[K]("slots")), tsSeq[K](tsString[K]("public"), tsString[K]("signals")), tsSeq[K](tsString[K]("private"), tsString[K]("slots")), tsSeq[K](tsString[K]("private"), tsString[K]("signals")), tsSeq[K](tsString[K]("protected"), tsString[K]("slots")), tsSeq[K](tsString[K]("protected"), tsString[K]("signals"))), tsString[K](":"))
                                                              rules[cppTypeParameterDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("typename"), tsString[K]("class")), tsChoice[K](tsSymbol[K](cppHidTypeIdentifier), tsBlank[K]()))
                                                              rules[cppTemplateFunction] = tsSeq[K](tsSymbol[K](cppIdentifier), tsSymbol[K](cppTemplateArgumentList))
                                                              rules[cppFunctionFieldDeclarator] = tsSeq[K](tsSeq[K](tsSymbol[K](cppHidFieldDeclarator), tsSymbol[K](cppParameterList)), tsRepeat[K](tsChoice[K](tsSymbol[K](cppTypeQualifier), tsSymbol[K](cppRefQualifier), tsSymbol[K](cppVirtualSpecifier), tsSymbol[K](cppNoexcept), tsSymbol[K](cppThrowSpecifier), tsSymbol[K](cppTrailingReturnType))))
                                                              rules[cppConcatenatedString] = tsSeq[K](tsChoice[K](tsSymbol[K](cppRawStringLiteral), tsSymbol[K](cppStringLiteral)), tsRepeat1[K](tsChoice[K](tsSymbol[K](cppRawStringLiteral), tsSymbol[K](cppStringLiteral))))
                                                              rules

