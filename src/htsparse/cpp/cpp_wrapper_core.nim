import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  CppNodeKind* = enum
    cppUsAbstractDeclarator                 ## _abstract_declarator
    cppUsDeclarator                         ## _declarator
    cppUsExpression                         ## _expression
    cppUsFieldDeclarator                    ## _field_declarator
    cppUsStatement                          ## _statement
    cppUsTypeDeclarator                     ## _type_declarator
    cppUsTypeSpecifier                      ## _type_specifier
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
    cppUsAtomicTok                          ## _Atomic
    cppUsUsAttributeTok                     ## __attribute__
    cppUsUsBasedTok                         ## __based
    cppUsUsCdeclTok                         ## __cdecl
    cppUsUsClrcallTok                       ## __clrcall
    cppUsUsDeclspecTok                      ## __declspec
    cppUsUsFastcallTok                      ## __fastcall
    cppUsUsStdcallTok                       ## __stdcall
    cppUsUsThiscallTok                      ## __thiscall
    cppUsUsUnalignedTok                     ## __unaligned
    cppUsUsVectorcallTok                    ## __vectorcall
    cppUsUnalignedTok                       ## _unaligned
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
    cppSyntaxError                          ## Tree-sitter parser syntax error


proc strRepr*(kind: CppNodeKind): string =
  case kind:
    of cppUsAbstractDeclarator:                 "_abstract_declarator"
    of cppUsDeclarator:                         "_declarator"
    of cppUsExpression:                         "_expression"
    of cppUsFieldDeclarator:                    "_field_declarator"
    of cppUsStatement:                          "_statement"
    of cppUsTypeDeclarator:                     "_type_declarator"
    of cppUsTypeSpecifier:                      "_type_specifier"
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
    of cppUsAtomicTok:                          "_Atomic"
    of cppUsUsAttributeTok:                     "__attribute__"
    of cppUsUsBasedTok:                         "__based"
    of cppUsUsCdeclTok:                         "__cdecl"
    of cppUsUsClrcallTok:                       "__clrcall"
    of cppUsUsDeclspecTok:                      "__declspec"
    of cppUsUsFastcallTok:                      "__fastcall"
    of cppUsUsStdcallTok:                       "__stdcall"
    of cppUsUsThiscallTok:                      "__thiscall"
    of cppUsUsUnalignedTok:                     "__unaligned"
    of cppUsUsVectorcallTok:                    "__vectorcall"
    of cppUsUnalignedTok:                       "_unaligned"
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
                                                                    tmp[cppAbstractParenthesizedDeclarator] = {cppUsAbstractDeclarator}
                                                                    tmp[cppAbstractPointerDeclarator] = {cppTypeQualifier}
                                                                    tmp[cppAbstractReferenceDeclarator] = {cppUsAbstractDeclarator}
                                                                    tmp[cppArgumentList] = {cppUsExpression, cppInitializerList, cppPreprocDefined}
                                                                    tmp[cppArrayDeclarator] = {cppTypeQualifier}
                                                                    tmp[cppAttribute] = {cppArgumentList}
                                                                    tmp[cppAttributeDeclaration] = {cppAttribute}
                                                                    tmp[cppAttributeSpecifier] = {cppArgumentList}
                                                                    tmp[cppAttributedDeclarator] = {cppUsDeclarator, cppUsFieldDeclarator, cppUsTypeDeclarator, cppAttributeDeclaration}
                                                                    tmp[cppAttributedStatement] = {cppUsStatement, cppAttributeDeclaration}
                                                                    tmp[cppBaseClassClause] = {cppQualifiedIdentifier, cppTemplateType, cppTypeIdentifier}
                                                                    tmp[cppBitfieldClause] = {cppUsExpression}
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
                                                                    tmp[cppCoReturnStatement] = {cppUsExpression}
                                                                    tmp[cppCoYieldStatement] = {cppUsExpression}
                                                                    tmp[cppCompoundStatement] = {
                                                                                                  cppUsStatement,
                                                                                                  cppUsTypeSpecifier,
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
                                                                                                cppUsStatement,
                                                                                                cppUsTypeSpecifier,
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
                                                                    tmp[cppDecltype] = {cppUsExpression}
                                                                    tmp[cppDeleteExpression] = {cppUsExpression}
                                                                    tmp[cppDependentName] = {cppTemplateFunction, cppTemplateMethod, cppTemplateType}
                                                                    tmp[cppDependentType] = {cppUsTypeSpecifier}
                                                                    tmp[cppDestructorName] = {cppIdentifier}
                                                                    tmp[cppEnumeratorList] = {cppEnumerator}
                                                                    tmp[cppExplicitFunctionSpecifier] = {cppUsExpression}
                                                                    tmp[cppExpressionStatement] = {cppUsExpression, cppCommaExpression}
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
                                                                    tmp[cppForStatement] = {cppUsStatement}
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
                                                                    tmp[cppInitializerList] = {cppUsExpression, cppInitializerList, cppInitializerPair}
                                                                    tmp[cppLabeledStatement] = {cppUsStatement}
                                                                    tmp[cppLambdaCaptureSpecifier] = {cppUsExpression, cppLambdaDefaultCapture}
                                                                    tmp[cppMsBasedModifier] = {cppArgumentList}
                                                                    tmp[cppMsDeclspecModifier] = {cppIdentifier}
                                                                    tmp[cppMsPointerModifier] = {cppMsRestrictModifier, cppMsSignedPtrModifier, cppMsUnalignedPtrModifier, cppMsUnsignedPtrModifier}
                                                                    tmp[cppNamespaceAliasDefinition] = {cppIdentifier, cppQualifiedIdentifier}
                                                                    tmp[cppNamespaceDefinitionName] = {cppIdentifier, cppNamespaceDefinitionName}
                                                                    tmp[cppNewDeclarator] = {cppNewDeclarator}
                                                                    tmp[cppNoexcept] = {cppUsExpression}
                                                                    tmp[cppOperatorCast] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppOperatorName] = {cppIdentifier}
                                                                    tmp[cppOptionalParameterDeclaration] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppParameterDeclaration] = {cppAttributeDeclaration, cppAttributeSpecifier, cppMsDeclspecModifier, cppStorageClassSpecifier, cppTypeQualifier, cppVirtualFunctionSpecifier}
                                                                    tmp[cppParameterList] = {cppOptionalParameterDeclaration, cppParameterDeclaration, cppVariadicParameterDeclaration}
                                                                    tmp[cppParenthesizedDeclarator] = {cppUsDeclarator, cppUsFieldDeclarator, cppUsTypeDeclarator}
                                                                    tmp[cppParenthesizedExpression] = {cppUsExpression, cppCommaExpression, cppPreprocDefined}
                                                                    tmp[cppPointerDeclarator] = {cppMsBasedModifier, cppMsPointerModifier, cppTypeQualifier}
                                                                    tmp[cppPreprocDefined] = {cppIdentifier}
                                                                    tmp[cppPreprocElif] = {
                                                                                            cppUsStatement,
                                                                                            cppUsTypeSpecifier,
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
                                                                                            cppUsStatement,
                                                                                            cppUsTypeSpecifier,
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
                                                                                          cppUsStatement,
                                                                                          cppUsTypeSpecifier,
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
                                                                                             cppUsStatement,
                                                                                             cppUsTypeSpecifier,
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
                                                                    tmp[cppReferenceDeclarator] = {cppUsDeclarator, cppUsFieldDeclarator, cppVariadicDeclarator}
                                                                    tmp[cppReturnStatement] = {cppUsExpression, cppCommaExpression, cppInitializerList}
                                                                    tmp[cppStringLiteral] = {cppEscapeSequence}
                                                                    tmp[cppStructSpecifier] = {cppAttributeDeclaration, cppBaseClassClause, cppMsDeclspecModifier, cppVirtualSpecifier}
                                                                    tmp[cppStructuredBindingDeclarator] = {cppIdentifier}
                                                                    tmp[cppSubscriptDesignator] = {cppUsExpression}
                                                                    tmp[cppTemplateArgumentList] = {cppUsExpression, cppTypeDescriptor}
                                                                    tmp[cppTemplateDeclaration] = {cppUsTypeSpecifier, cppAliasDeclaration, cppDeclaration, cppFunctionDefinition, cppTemplateDeclaration}
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
                                                                    tmp[cppThrowStatement] = {cppUsExpression}
                                                                    tmp[cppTrailingReturnType] = {cppUsAbstractDeclarator, cppUsTypeSpecifier, cppTypeQualifier}
                                                                    tmp[cppTranslationUnit] = {
                                                                                                cppUsStatement,
                                                                                                cppUsTypeSpecifier,
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
                                           cppUsAtomicTok,
                                           cppUsUsAttributeTok,
                                           cppUsUsBasedTok,
                                           cppUsUsCdeclTok,
                                           cppUsUsClrcallTok,
                                           cppUsUsDeclspecTok,
                                           cppUsUsFastcallTok,
                                           cppUsUsStdcallTok,
                                           cppUsUsThiscallTok,
                                           cppUsUsUnalignedTok,
                                           cppUsUsVectorcallTok,
                                           cppUsUnalignedTok,
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

proc tsNodeType*(node: TsCppNode): string



proc kind*(node: TsCppNode): CppNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_abstract_declarator":                    cppUsAbstractDeclarator
      of "_declarator":                             cppUsDeclarator
      of "_expression":                             cppUsExpression
      of "_field_declarator":                       cppUsFieldDeclarator
      of "_statement":                              cppUsStatement
      of "_type_declarator":                        cppUsTypeDeclarator
      of "_type_specifier":                         cppUsTypeSpecifier
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
      of "_Atomic":                                 cppUsAtomicTok
      of "__attribute__":                           cppUsUsAttributeTok
      of "__based":                                 cppUsUsBasedTok
      of "__cdecl":                                 cppUsUsCdeclTok
      of "__clrcall":                               cppUsUsClrcallTok
      of "__declspec":                              cppUsUsDeclspecTok
      of "__fastcall":                              cppUsUsFastcallTok
      of "__stdcall":                               cppUsUsStdcallTok
      of "__thiscall":                              cppUsUsThiscallTok
      of "__unaligned":                             cppUsUsUnalignedTok
      of "__vectorcall":                            cppUsUsVectorcallTok
      of "_unaligned":                              cppUsUnalignedTok
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


proc treeRepr*(node: TsCppNode, str: string): string =
  var res = addr result
  proc aux(node: TsCppNode, level: int) =
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


