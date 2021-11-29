import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  CsharpNodeKind* = enum
    csharpHidDeclaration                                ## _declaration
    csharpHidExpression                                 ## _expression
    csharpHidStatement                                  ## _statement
    csharpHidType                                       ## _type
    csharpAccessorDeclaration                           ## accessor_declaration
    csharpAccessorList                                  ## accessor_list
    csharpAliasQualifiedName                            ## alias_qualified_name
    csharpAnonymousMethodExpression                     ## anonymous_method_expression
    csharpAnonymousObjectCreationExpression             ## anonymous_object_creation_expression
    csharpArgument                                      ## argument
    csharpArgumentList                                  ## argument_list
    csharpArrayCreationExpression                       ## array_creation_expression
    csharpArrayRankSpecifier                            ## array_rank_specifier
    csharpArrayType                                     ## array_type
    csharpArrowExpressionClause                         ## arrow_expression_clause
    csharpAsExpression                                  ## as_expression
    csharpAssignmentExpression                          ## assignment_expression
    csharpAssignmentOperator                            ## assignment_operator
    csharpAttribute                                     ## attribute
    csharpAttributeArgument                             ## attribute_argument
    csharpAttributeArgumentList                         ## attribute_argument_list
    csharpAttributeList                                 ## attribute_list
    csharpAttributeTargetSpecifier                      ## attribute_target_specifier
    csharpAwaitExpression                               ## await_expression
    csharpBaseExpression                                ## base_expression
    csharpBaseList                                      ## base_list
    csharpBinaryExpression                              ## binary_expression
    csharpBinaryPattern                                 ## binary_pattern
    csharpBlock                                         ## block
    csharpBooleanLiteral                                ## boolean_literal
    csharpBracketedArgumentList                         ## bracketed_argument_list
    csharpBracketedParameterList                        ## bracketed_parameter_list
    csharpBreakStatement                                ## break_statement
    csharpCasePatternSwitchLabel                        ## case_pattern_switch_label
    csharpCaseSwitchLabel                               ## case_switch_label
    csharpCastExpression                                ## cast_expression
    csharpCatchClause                                   ## catch_clause
    csharpCatchDeclaration                              ## catch_declaration
    csharpCatchFilterClause                             ## catch_filter_clause
    csharpCharacterLiteral                              ## character_literal
    csharpCheckedExpression                             ## checked_expression
    csharpCheckedStatement                              ## checked_statement
    csharpClassDeclaration                              ## class_declaration
    csharpCompilationUnit                               ## compilation_unit
    csharpConditionalAccessExpression                   ## conditional_access_expression
    csharpConditionalExpression                         ## conditional_expression
    csharpConstantPattern                               ## constant_pattern
    csharpConstructorConstraint                         ## constructor_constraint
    csharpConstructorDeclaration                        ## constructor_declaration
    csharpConstructorInitializer                        ## constructor_initializer
    csharpContinueStatement                             ## continue_statement
    csharpConversionOperatorDeclaration                 ## conversion_operator_declaration
    csharpDeclarationExpression                         ## declaration_expression
    csharpDeclarationList                               ## declaration_list
    csharpDeclarationPattern                            ## declaration_pattern
    csharpDefaultExpression                             ## default_expression
    csharpDefaultSwitchLabel                            ## default_switch_label
    csharpDelegateDeclaration                           ## delegate_declaration
    csharpDestructorDeclaration                         ## destructor_declaration
    csharpDoStatement                                   ## do_statement
    csharpElementAccessExpression                       ## element_access_expression
    csharpElementBindingExpression                      ## element_binding_expression
    csharpEmptyStatement                                ## empty_statement
    csharpEnumDeclaration                               ## enum_declaration
    csharpEnumMemberDeclaration                         ## enum_member_declaration
    csharpEnumMemberDeclarationList                     ## enum_member_declaration_list
    csharpEqualsValueClause                             ## equals_value_clause
    csharpEventDeclaration                              ## event_declaration
    csharpEventFieldDeclaration                         ## event_field_declaration
    csharpExplicitInterfaceSpecifier                    ## explicit_interface_specifier
    csharpExpressionStatement                           ## expression_statement
    csharpExternAliasDirective                          ## extern_alias_directive
    csharpFieldDeclaration                              ## field_declaration
    csharpFinallyClause                                 ## finally_clause
    csharpFixedStatement                                ## fixed_statement
    csharpForEachStatement                              ## for_each_statement
    csharpForStatement                                  ## for_statement
    csharpFromClause                                    ## from_clause
    csharpFunctionPointerCallingConvention              ## function_pointer_calling_convention
    csharpFunctionPointerParameter                      ## function_pointer_parameter
    csharpFunctionPointerType                           ## function_pointer_type
    csharpFunctionPointerUnmanagedCallingConvention     ## function_pointer_unmanaged_calling_convention
    csharpFunctionPointerUnmanagedCallingConventionList ## function_pointer_unmanaged_calling_convention_list
    csharpGenericName                                   ## generic_name
    csharpGlobal                                        ## global
    csharpGlobalAttributeList                           ## global_attribute_list
    csharpGlobalStatement                               ## global_statement
    csharpGotoStatement                                 ## goto_statement
    csharpGroupClause                                   ## group_clause
    csharpIdentifier                                    ## identifier
    csharpIfStatement                                   ## if_statement
    csharpImplicitArrayCreationExpression               ## implicit_array_creation_expression
    csharpImplicitObjectCreationExpression              ## implicit_object_creation_expression
    csharpImplicitStackAllocArrayCreationExpression     ## implicit_stack_alloc_array_creation_expression
    csharpImplicitType                                  ## implicit_type
    csharpIndexerDeclaration                            ## indexer_declaration
    csharpInitializerExpression                         ## initializer_expression
    csharpInterfaceDeclaration                          ## interface_declaration
    csharpInterpolatedStringExpression                  ## interpolated_string_expression
    csharpInterpolatedStringText                        ## interpolated_string_text
    csharpInterpolatedVerbatimStringText                ## interpolated_verbatim_string_text
    csharpInterpolation                                 ## interpolation
    csharpInterpolationAlignmentClause                  ## interpolation_alignment_clause
    csharpInterpolationFormatClause                     ## interpolation_format_clause
    csharpInvocationExpression                          ## invocation_expression
    csharpIsExpression                                  ## is_expression
    csharpIsPatternExpression                           ## is_pattern_expression
    csharpJoinClause                                    ## join_clause
    csharpJoinIntoClause                                ## join_into_clause
    csharpLabelName                                     ## label_name
    csharpLabeledStatement                              ## labeled_statement
    csharpLambdaExpression                              ## lambda_expression
    csharpLetClause                                     ## let_clause
    csharpLocalDeclarationStatement                     ## local_declaration_statement
    csharpLocalFunctionStatement                        ## local_function_statement
    csharpLockStatement                                 ## lock_statement
    csharpMakeRefExpression                             ## make_ref_expression
    csharpMemberAccessExpression                        ## member_access_expression
    csharpMemberBindingExpression                       ## member_binding_expression
    csharpMethodDeclaration                             ## method_declaration
    csharpModifier                                      ## modifier
    csharpNameColon                                     ## name_colon
    csharpNameEquals                                    ## name_equals
    csharpNamespaceDeclaration                          ## namespace_declaration
    csharpNegatedPattern                                ## negated_pattern
    csharpNullableType                                  ## nullable_type
    csharpObjectCreationExpression                      ## object_creation_expression
    csharpOperatorDeclaration                           ## operator_declaration
    csharpOrderByClause                                 ## order_by_clause
    csharpParameter                                     ## parameter
    csharpParameterArray                                ## parameter_array
    csharpParameterList                                 ## parameter_list
    csharpParameterModifier                             ## parameter_modifier
    csharpParenthesizedExpression                       ## parenthesized_expression
    csharpParenthesizedPattern                          ## parenthesized_pattern
    csharpParenthesizedVariableDesignation              ## parenthesized_variable_designation
    csharpPointerType                                   ## pointer_type
    csharpPositionalPatternClause                       ## positional_pattern_clause
    csharpPostfixUnaryExpression                        ## postfix_unary_expression
    csharpPrefixUnaryExpression                         ## prefix_unary_expression
    csharpPreprocessorCall                              ## preprocessor_call
    csharpPrimaryConstructorBaseType                    ## primary_constructor_base_type
    csharpPropertyDeclaration                           ## property_declaration
    csharpPropertyPatternClause                         ## property_pattern_clause
    csharpQualifiedName                                 ## qualified_name
    csharpQueryContinuation                             ## query_continuation
    csharpQueryExpression                               ## query_expression
    csharpRangeExpression                               ## range_expression
    csharpRecordDeclaration                             ## record_declaration
    csharpRecursivePattern                              ## recursive_pattern
    csharpRefExpression                                 ## ref_expression
    csharpRefTypeExpression                             ## ref_type_expression
    csharpRefValueExpression                            ## ref_value_expression
    csharpRelationalPattern                             ## relational_pattern
    csharpReturnStatement                               ## return_statement
    csharpSelectClause                                  ## select_clause
    csharpSimpleAssignmentExpression                    ## simple_assignment_expression
    csharpSizeOfExpression                              ## size_of_expression
    csharpStackAllocArrayCreationExpression             ## stack_alloc_array_creation_expression
    csharpStringLiteral                                 ## string_literal
    csharpStructDeclaration                             ## struct_declaration
    csharpSubpattern                                    ## subpattern
    csharpSwitchBody                                    ## switch_body
    csharpSwitchExpression                              ## switch_expression
    csharpSwitchExpressionArm                           ## switch_expression_arm
    csharpSwitchSection                                 ## switch_section
    csharpSwitchStatement                               ## switch_statement
    csharpThisExpression                                ## this_expression
    csharpThrowExpression                               ## throw_expression
    csharpThrowStatement                                ## throw_statement
    csharpTryStatement                                  ## try_statement
    csharpTupleElement                                  ## tuple_element
    csharpTupleExpression                               ## tuple_expression
    csharpTuplePattern                                  ## tuple_pattern
    csharpTupleType                                     ## tuple_type
    csharpTypeArgumentList                              ## type_argument_list
    csharpTypeConstraint                                ## type_constraint
    csharpTypeOfExpression                              ## type_of_expression
    csharpTypeParameter                                 ## type_parameter
    csharpTypeParameterConstraint                       ## type_parameter_constraint
    csharpTypeParameterConstraintsClause                ## type_parameter_constraints_clause
    csharpTypeParameterList                             ## type_parameter_list
    csharpTypePattern                                   ## type_pattern
    csharpUnsafeStatement                               ## unsafe_statement
    csharpUsingDirective                                ## using_directive
    csharpUsingStatement                                ## using_statement
    csharpVarPattern                                    ## var_pattern
    csharpVariableDeclaration                           ## variable_declaration
    csharpVariableDeclarator                            ## variable_declarator
    csharpWhenClause                                    ## when_clause
    csharpWhereClause                                   ## where_clause
    csharpWhileStatement                                ## while_statement
    csharpWithExpression                                ## with_expression
    csharpWithInitializerExpression                     ## with_initializer_expression
    csharpYieldStatement                                ## yield_statement
    csharpExclamationTok                                ## !
    csharpExclamationEqualTok                           ## !=
    csharpQuoteTok                                      ## "
    csharpDoubleQuoteTok                                ## ""
    csharpDollarQuoteTok                                ## $"
    csharpDollarAtQuoteTok                              ## $@"
    csharpPercentTok                                    ## %
    csharpPercentEqualTok                               ## %=
    csharpAmpersandTok                                  ## &
    csharpDoubleAmpersandTok                            ## &&
    csharpAmpersandEqualTok                             ## &=
    csharpApostropheTok                                 ## '
    csharpLParTok                                       ## (
    csharpRParTok                                       ## )
    csharpAsteriskTok                                   ## *
    csharpAsteriskEqualTok                              ## *=
    csharpPlusTok                                       ## +
    csharpDoublePlusTok                                 ## ++
    csharpPlusEqualTok                                  ## +=
    csharpCommaTok                                      ## ,
    csharpMinusTok                                      ## -
    csharpDoubleMinusTok                                ## --
    csharpMinusEqualTok                                 ## -=
    csharpMinusGreaterThanTok                           ## ->
    csharpDotTok                                        ## .
    csharpDoubleDotTok                                  ## ..
    csharpSlashTok                                      ## /
    csharpSlashEqualTok                                 ## /=
    csharpColonTok                                      ## :
    csharpDoubleColonTok                                ## ::
    csharpSemicolonTok                                  ## ;
    csharpLessThanTok                                   ## <
    csharpDoubleLessThanTok                             ## <<
    csharpDoubleLessThanEqualTok                        ## <<=
    csharpLessThanEqualTok                              ## <=
    csharpEqualTok                                      ## =
    csharpDoubleEqualTok                                ## ==
    csharpEqualGreaterThanTok                           ## =>
    csharpGreaterThanTok                                ## >
    csharpGreaterThanEqualTok                           ## >=
    csharpDoubleGreaterThanTok                          ## >>
    csharpDoubleGreaterThanEqualTok                     ## >>=
    csharpQuestionTok                                   ## ?
    csharpDoubleQuestionTok                             ## ??
    csharpDoubleQuestionEqualTok                        ## ??=
    csharpAtDollarQuoteTok                              ## @$"
    csharpCdeclTok                                      ## Cdecl
    csharpFastcallTok                                   ## Fastcall
    csharpStdcallTok                                    ## Stdcall
    csharpThiscallTok                                   ## Thiscall
    csharpLBrackTok                                     ## [
    csharpRBrackTok                                     ## ]
    csharpAccentTok                                     ## ^
    csharpAccentEqualTok                                ## ^=
    csharpHidMakerefTok                                 ## __makeref
    csharpHidReftypeTok                                 ## __reftype
    csharpHidRefvalueTok                                ## __refvalue
    csharpAbstractTok                                   ## abstract
    csharpAddTok                                        ## add
    csharpAliasTok                                      ## alias
    csharpAndTok                                        ## and
    csharpAsTok                                         ## as
    csharpAscendingTok                                  ## ascending
    csharpAssemblyTok                                   ## assembly
    csharpAsyncTok                                      ## async
    csharpAwaitTok                                      ## await
    csharpBaseTok                                       ## base
    csharpBreakTok                                      ## break
    csharpByTok                                         ## by
    csharpCaseTok                                       ## case
    csharpCatchTok                                      ## catch
    csharpCheckedTok                                    ## checked
    csharpClassTok                                      ## class
    csharpComment                                       ## comment
    csharpConstTok                                      ## const
    csharpContinueTok                                   ## continue
    csharpDefaultTok                                    ## default
    csharpDelegateTok                                   ## delegate
    csharpDescendingTok                                 ## descending
    csharpDiscard                                       ## discard
    csharpDoTok                                         ## do
    csharpDynamicTok                                    ## dynamic
    csharpElseTok                                       ## else
    csharpEnumTok                                       ## enum
    csharpEqualsTok                                     ## equals
    csharpEscapeSequence                                ## escape_sequence
    csharpEventTok                                      ## event
    csharpExplicitTok                                   ## explicit
    csharpExternTok                                     ## extern
    csharpFalseTok                                      ## false
    csharpFieldTok                                      ## field
    csharpFinallyTok                                    ## finally
    csharpFixedTok                                      ## fixed
    csharpForTok                                        ## for
    csharpForeachTok                                    ## foreach
    csharpFromTok                                       ## from
    csharpGetTok                                        ## get
    csharpGlobalTok                                     ## global
    csharpGotoTok                                       ## goto
    csharpGroupTok                                      ## group
    csharpIfTok                                         ## if
    csharpImplicitTok                                   ## implicit
    csharpInTok                                         ## in
    csharpInitTok                                       ## init
    csharpIntegerLiteral                                ## integer_literal
    csharpInterfaceTok                                  ## interface
    csharpInternalTok                                   ## internal
    csharpIntoTok                                       ## into
    csharpIsTok                                         ## is
    csharpJoinTok                                       ## join
    csharpLetTok                                        ## let
    csharpLockTok                                       ## lock
    csharpManagedTok                                    ## managed
    csharpMethodTok                                     ## method
    csharpModuleTok                                     ## module
    csharpNameofTok                                     ## nameof
    csharpNamespaceTok                                  ## namespace
    csharpNewTok                                        ## new
    csharpNotTok                                        ## not
    csharpNotnullTok                                    ## notnull
    csharpNullLiteral                                   ## null_literal
    csharpOnTok                                         ## on
    csharpOperatorTok                                   ## operator
    csharpOrTok                                         ## or
    csharpOrderbyTok                                    ## orderby
    csharpOutTok                                        ## out
    csharpOverrideTok                                   ## override
    csharpParamTok                                      ## param
    csharpParamsTok                                     ## params
    csharpPartialTok                                    ## partial
    csharpPredefinedType                                ## predefined_type
    csharpPreprocessorDirective                         ## preprocessor_directive
    csharpPrivateTok                                    ## private
    csharpPropertyTok                                   ## property
    csharpProtectedTok                                  ## protected
    csharpPublicTok                                     ## public
    csharpReadonlyTok                                   ## readonly
    csharpRealLiteral                                   ## real_literal
    csharpRecordTok                                     ## record
    csharpRefTok                                        ## ref
    csharpRemoveTok                                     ## remove
    csharpReturnTok                                     ## return
    csharpSealedTok                                     ## sealed
    csharpSelectTok                                     ## select
    csharpSetTok                                        ## set
    csharpSizeofTok                                     ## sizeof
    csharpStackallocTok                                 ## stackalloc
    csharpStaticTok                                     ## static
    csharpStructTok                                     ## struct
    csharpSwitchTok                                     ## switch
    csharpThisTok                                       ## this
    csharpThrowTok                                      ## throw
    csharpTrueTok                                       ## true
    csharpTryTok                                        ## try
    csharpTypeTok                                       ## type
    csharpTypeofTok                                     ## typeof
    csharpUncheckedTok                                  ## unchecked
    csharpUnmanagedTok                                  ## unmanaged
    csharpUnsafeTok                                     ## unsafe
    csharpUsingTok                                      ## using
    csharpVarTok                                        ## var
    csharpVerbatimStringLiteral                         ## verbatim_string_literal
    csharpVirtualTok                                    ## virtual
    csharpVoidKeyword                                   ## void_keyword
    csharpVolatileTok                                   ## volatile
    csharpWhenTok                                       ## when
    csharpWhereTok                                      ## where
    csharpWhileTok                                      ## while
    csharpWithTok                                       ## with
    csharpYieldTok                                      ## yield
    csharpLCurlyTok                                     ## {
    csharpDoubleLCurlyTok                               ## {{
    csharpPipeTok                                       ## |
    csharpPipeEqualTok                                  ## |=
    csharpDoublePipeTok                                 ## ||
    csharpRCurlyTok                                     ## }
    csharpTildeTok                                      ## ~
    csharpHidInterpolatedVerbatimStringContent          ## _interpolated_verbatim_string_content
    csharpHidLiteral                                    ## _literal
    csharpHidIdentifierToken                            ## _identifier_token
    csharpHidQueryBody                                  ## _query_body
    csharpHidOverloadableOperator                       ## _overloadable_operator
    csharpHidContextualKeywords                         ## _contextual_keywords
    csharpHidOrdering                                   ## _ordering
    csharpHidVariableDesignation                        ## _variable_designation
    csharpHidQueryClause                                ## _query_clause
    csharpHidInterpolatedStringContent                  ## _interpolated_string_content
    csharpHidAnonymousObjectMemberDeclarator            ## _anonymous_object_member_declarator
    csharpReturnType                                    ## return_type
    csharpHidTypeDeclaration                            ## _type_declaration
    csharpHidName                                       ## _name
    csharpHidPattern                                    ## _pattern
    csharpRecordBase                                    ## record_base
    csharpHidFunctionBody                               ## _function_body
    csharpHidFormalParameterList                        ## _formal_parameter_list
    csharpHidNamespaceMemberDeclaration                 ## _namespace_member_declaration
    csharpHidSelectOrGroupClause                        ## _select_or_group_clause
    csharpRefType                                       ## ref_type
    csharpHidRecordBase                                 ## _record_base
    csharpHidPreprocDirectiveEnd                        ## _preproc_directive_end
    csharpHidSimpleName                                 ## _simple_name
    csharpHidIdentifierOrGlobal                         ## _identifier_or_global
    csharpSyntaxError                                   ## Tree-sitter parser syntax error

proc strRepr*(kind: CsharpNodeKind): string =
  case kind:
    of csharpHidDeclaration:                                "_declaration"
    of csharpHidExpression:                                 "_expression"
    of csharpHidStatement:                                  "_statement"
    of csharpHidType:                                       "_type"
    of csharpAccessorDeclaration:                           "accessor_declaration"
    of csharpAccessorList:                                  "accessor_list"
    of csharpAliasQualifiedName:                            "alias_qualified_name"
    of csharpAnonymousMethodExpression:                     "anonymous_method_expression"
    of csharpAnonymousObjectCreationExpression:             "anonymous_object_creation_expression"
    of csharpArgument:                                      "argument"
    of csharpArgumentList:                                  "argument_list"
    of csharpArrayCreationExpression:                       "array_creation_expression"
    of csharpArrayRankSpecifier:                            "array_rank_specifier"
    of csharpArrayType:                                     "array_type"
    of csharpArrowExpressionClause:                         "arrow_expression_clause"
    of csharpAsExpression:                                  "as_expression"
    of csharpAssignmentExpression:                          "assignment_expression"
    of csharpAssignmentOperator:                            "assignment_operator"
    of csharpAttribute:                                     "attribute"
    of csharpAttributeArgument:                             "attribute_argument"
    of csharpAttributeArgumentList:                         "attribute_argument_list"
    of csharpAttributeList:                                 "attribute_list"
    of csharpAttributeTargetSpecifier:                      "attribute_target_specifier"
    of csharpAwaitExpression:                               "await_expression"
    of csharpBaseExpression:                                "base_expression"
    of csharpBaseList:                                      "base_list"
    of csharpBinaryExpression:                              "binary_expression"
    of csharpBinaryPattern:                                 "binary_pattern"
    of csharpBlock:                                         "block"
    of csharpBooleanLiteral:                                "boolean_literal"
    of csharpBracketedArgumentList:                         "bracketed_argument_list"
    of csharpBracketedParameterList:                        "bracketed_parameter_list"
    of csharpBreakStatement:                                "break_statement"
    of csharpCasePatternSwitchLabel:                        "case_pattern_switch_label"
    of csharpCaseSwitchLabel:                               "case_switch_label"
    of csharpCastExpression:                                "cast_expression"
    of csharpCatchClause:                                   "catch_clause"
    of csharpCatchDeclaration:                              "catch_declaration"
    of csharpCatchFilterClause:                             "catch_filter_clause"
    of csharpCharacterLiteral:                              "character_literal"
    of csharpCheckedExpression:                             "checked_expression"
    of csharpCheckedStatement:                              "checked_statement"
    of csharpClassDeclaration:                              "class_declaration"
    of csharpCompilationUnit:                               "compilation_unit"
    of csharpConditionalAccessExpression:                   "conditional_access_expression"
    of csharpConditionalExpression:                         "conditional_expression"
    of csharpConstantPattern:                               "constant_pattern"
    of csharpConstructorConstraint:                         "constructor_constraint"
    of csharpConstructorDeclaration:                        "constructor_declaration"
    of csharpConstructorInitializer:                        "constructor_initializer"
    of csharpContinueStatement:                             "continue_statement"
    of csharpConversionOperatorDeclaration:                 "conversion_operator_declaration"
    of csharpDeclarationExpression:                         "declaration_expression"
    of csharpDeclarationList:                               "declaration_list"
    of csharpDeclarationPattern:                            "declaration_pattern"
    of csharpDefaultExpression:                             "default_expression"
    of csharpDefaultSwitchLabel:                            "default_switch_label"
    of csharpDelegateDeclaration:                           "delegate_declaration"
    of csharpDestructorDeclaration:                         "destructor_declaration"
    of csharpDoStatement:                                   "do_statement"
    of csharpElementAccessExpression:                       "element_access_expression"
    of csharpElementBindingExpression:                      "element_binding_expression"
    of csharpEmptyStatement:                                "empty_statement"
    of csharpEnumDeclaration:                               "enum_declaration"
    of csharpEnumMemberDeclaration:                         "enum_member_declaration"
    of csharpEnumMemberDeclarationList:                     "enum_member_declaration_list"
    of csharpEqualsValueClause:                             "equals_value_clause"
    of csharpEventDeclaration:                              "event_declaration"
    of csharpEventFieldDeclaration:                         "event_field_declaration"
    of csharpExplicitInterfaceSpecifier:                    "explicit_interface_specifier"
    of csharpExpressionStatement:                           "expression_statement"
    of csharpExternAliasDirective:                          "extern_alias_directive"
    of csharpFieldDeclaration:                              "field_declaration"
    of csharpFinallyClause:                                 "finally_clause"
    of csharpFixedStatement:                                "fixed_statement"
    of csharpForEachStatement:                              "for_each_statement"
    of csharpForStatement:                                  "for_statement"
    of csharpFromClause:                                    "from_clause"
    of csharpFunctionPointerCallingConvention:              "function_pointer_calling_convention"
    of csharpFunctionPointerParameter:                      "function_pointer_parameter"
    of csharpFunctionPointerType:                           "function_pointer_type"
    of csharpFunctionPointerUnmanagedCallingConvention:     "function_pointer_unmanaged_calling_convention"
    of csharpFunctionPointerUnmanagedCallingConventionList: "function_pointer_unmanaged_calling_convention_list"
    of csharpGenericName:                                   "generic_name"
    of csharpGlobal:                                        "global"
    of csharpGlobalAttributeList:                           "global_attribute_list"
    of csharpGlobalStatement:                               "global_statement"
    of csharpGotoStatement:                                 "goto_statement"
    of csharpGroupClause:                                   "group_clause"
    of csharpIdentifier:                                    "identifier"
    of csharpIfStatement:                                   "if_statement"
    of csharpImplicitArrayCreationExpression:               "implicit_array_creation_expression"
    of csharpImplicitObjectCreationExpression:              "implicit_object_creation_expression"
    of csharpImplicitStackAllocArrayCreationExpression:     "implicit_stack_alloc_array_creation_expression"
    of csharpImplicitType:                                  "implicit_type"
    of csharpIndexerDeclaration:                            "indexer_declaration"
    of csharpInitializerExpression:                         "initializer_expression"
    of csharpInterfaceDeclaration:                          "interface_declaration"
    of csharpInterpolatedStringExpression:                  "interpolated_string_expression"
    of csharpInterpolatedStringText:                        "interpolated_string_text"
    of csharpInterpolatedVerbatimStringText:                "interpolated_verbatim_string_text"
    of csharpInterpolation:                                 "interpolation"
    of csharpInterpolationAlignmentClause:                  "interpolation_alignment_clause"
    of csharpInterpolationFormatClause:                     "interpolation_format_clause"
    of csharpInvocationExpression:                          "invocation_expression"
    of csharpIsExpression:                                  "is_expression"
    of csharpIsPatternExpression:                           "is_pattern_expression"
    of csharpJoinClause:                                    "join_clause"
    of csharpJoinIntoClause:                                "join_into_clause"
    of csharpLabelName:                                     "label_name"
    of csharpLabeledStatement:                              "labeled_statement"
    of csharpLambdaExpression:                              "lambda_expression"
    of csharpLetClause:                                     "let_clause"
    of csharpLocalDeclarationStatement:                     "local_declaration_statement"
    of csharpLocalFunctionStatement:                        "local_function_statement"
    of csharpLockStatement:                                 "lock_statement"
    of csharpMakeRefExpression:                             "make_ref_expression"
    of csharpMemberAccessExpression:                        "member_access_expression"
    of csharpMemberBindingExpression:                       "member_binding_expression"
    of csharpMethodDeclaration:                             "method_declaration"
    of csharpModifier:                                      "modifier"
    of csharpNameColon:                                     "name_colon"
    of csharpNameEquals:                                    "name_equals"
    of csharpNamespaceDeclaration:                          "namespace_declaration"
    of csharpNegatedPattern:                                "negated_pattern"
    of csharpNullableType:                                  "nullable_type"
    of csharpObjectCreationExpression:                      "object_creation_expression"
    of csharpOperatorDeclaration:                           "operator_declaration"
    of csharpOrderByClause:                                 "order_by_clause"
    of csharpParameter:                                     "parameter"
    of csharpParameterArray:                                "parameter_array"
    of csharpParameterList:                                 "parameter_list"
    of csharpParameterModifier:                             "parameter_modifier"
    of csharpParenthesizedExpression:                       "parenthesized_expression"
    of csharpParenthesizedPattern:                          "parenthesized_pattern"
    of csharpParenthesizedVariableDesignation:              "parenthesized_variable_designation"
    of csharpPointerType:                                   "pointer_type"
    of csharpPositionalPatternClause:                       "positional_pattern_clause"
    of csharpPostfixUnaryExpression:                        "postfix_unary_expression"
    of csharpPrefixUnaryExpression:                         "prefix_unary_expression"
    of csharpPreprocessorCall:                              "preprocessor_call"
    of csharpPrimaryConstructorBaseType:                    "primary_constructor_base_type"
    of csharpPropertyDeclaration:                           "property_declaration"
    of csharpPropertyPatternClause:                         "property_pattern_clause"
    of csharpQualifiedName:                                 "qualified_name"
    of csharpQueryContinuation:                             "query_continuation"
    of csharpQueryExpression:                               "query_expression"
    of csharpRangeExpression:                               "range_expression"
    of csharpRecordDeclaration:                             "record_declaration"
    of csharpRecursivePattern:                              "recursive_pattern"
    of csharpRefExpression:                                 "ref_expression"
    of csharpRefTypeExpression:                             "ref_type_expression"
    of csharpRefValueExpression:                            "ref_value_expression"
    of csharpRelationalPattern:                             "relational_pattern"
    of csharpReturnStatement:                               "return_statement"
    of csharpSelectClause:                                  "select_clause"
    of csharpSimpleAssignmentExpression:                    "simple_assignment_expression"
    of csharpSizeOfExpression:                              "size_of_expression"
    of csharpStackAllocArrayCreationExpression:             "stack_alloc_array_creation_expression"
    of csharpStringLiteral:                                 "string_literal"
    of csharpStructDeclaration:                             "struct_declaration"
    of csharpSubpattern:                                    "subpattern"
    of csharpSwitchBody:                                    "switch_body"
    of csharpSwitchExpression:                              "switch_expression"
    of csharpSwitchExpressionArm:                           "switch_expression_arm"
    of csharpSwitchSection:                                 "switch_section"
    of csharpSwitchStatement:                               "switch_statement"
    of csharpThisExpression:                                "this_expression"
    of csharpThrowExpression:                               "throw_expression"
    of csharpThrowStatement:                                "throw_statement"
    of csharpTryStatement:                                  "try_statement"
    of csharpTupleElement:                                  "tuple_element"
    of csharpTupleExpression:                               "tuple_expression"
    of csharpTuplePattern:                                  "tuple_pattern"
    of csharpTupleType:                                     "tuple_type"
    of csharpTypeArgumentList:                              "type_argument_list"
    of csharpTypeConstraint:                                "type_constraint"
    of csharpTypeOfExpression:                              "type_of_expression"
    of csharpTypeParameter:                                 "type_parameter"
    of csharpTypeParameterConstraint:                       "type_parameter_constraint"
    of csharpTypeParameterConstraintsClause:                "type_parameter_constraints_clause"
    of csharpTypeParameterList:                             "type_parameter_list"
    of csharpTypePattern:                                   "type_pattern"
    of csharpUnsafeStatement:                               "unsafe_statement"
    of csharpUsingDirective:                                "using_directive"
    of csharpUsingStatement:                                "using_statement"
    of csharpVarPattern:                                    "var_pattern"
    of csharpVariableDeclaration:                           "variable_declaration"
    of csharpVariableDeclarator:                            "variable_declarator"
    of csharpWhenClause:                                    "when_clause"
    of csharpWhereClause:                                   "where_clause"
    of csharpWhileStatement:                                "while_statement"
    of csharpWithExpression:                                "with_expression"
    of csharpWithInitializerExpression:                     "with_initializer_expression"
    of csharpYieldStatement:                                "yield_statement"
    of csharpExclamationTok:                                "!"
    of csharpExclamationEqualTok:                           "!="
    of csharpQuoteTok:                                      "\""
    of csharpDoubleQuoteTok:                                "\"\""
    of csharpDollarQuoteTok:                                "$\""
    of csharpDollarAtQuoteTok:                              "$@\""
    of csharpPercentTok:                                    "%"
    of csharpPercentEqualTok:                               "%="
    of csharpAmpersandTok:                                  "&"
    of csharpDoubleAmpersandTok:                            "&&"
    of csharpAmpersandEqualTok:                             "&="
    of csharpApostropheTok:                                 "\'"
    of csharpLParTok:                                       "("
    of csharpRParTok:                                       ")"
    of csharpAsteriskTok:                                   "*"
    of csharpAsteriskEqualTok:                              "*="
    of csharpPlusTok:                                       "+"
    of csharpDoublePlusTok:                                 "++"
    of csharpPlusEqualTok:                                  "+="
    of csharpCommaTok:                                      ","
    of csharpMinusTok:                                      "-"
    of csharpDoubleMinusTok:                                "--"
    of csharpMinusEqualTok:                                 "-="
    of csharpMinusGreaterThanTok:                           "->"
    of csharpDotTok:                                        "."
    of csharpDoubleDotTok:                                  ".."
    of csharpSlashTok:                                      "/"
    of csharpSlashEqualTok:                                 "/="
    of csharpColonTok:                                      ":"
    of csharpDoubleColonTok:                                "::"
    of csharpSemicolonTok:                                  ";"
    of csharpLessThanTok:                                   "<"
    of csharpDoubleLessThanTok:                             "<<"
    of csharpDoubleLessThanEqualTok:                        "<<="
    of csharpLessThanEqualTok:                              "<="
    of csharpEqualTok:                                      "="
    of csharpDoubleEqualTok:                                "=="
    of csharpEqualGreaterThanTok:                           "=>"
    of csharpGreaterThanTok:                                ">"
    of csharpGreaterThanEqualTok:                           ">="
    of csharpDoubleGreaterThanTok:                          ">>"
    of csharpDoubleGreaterThanEqualTok:                     ">>="
    of csharpQuestionTok:                                   "?"
    of csharpDoubleQuestionTok:                             "??"
    of csharpDoubleQuestionEqualTok:                        "??="
    of csharpAtDollarQuoteTok:                              "@$\""
    of csharpCdeclTok:                                      "Cdecl"
    of csharpFastcallTok:                                   "Fastcall"
    of csharpStdcallTok:                                    "Stdcall"
    of csharpThiscallTok:                                   "Thiscall"
    of csharpLBrackTok:                                     "["
    of csharpRBrackTok:                                     "]"
    of csharpAccentTok:                                     "^"
    of csharpAccentEqualTok:                                "^="
    of csharpHidMakerefTok:                                 "__makeref"
    of csharpHidReftypeTok:                                 "__reftype"
    of csharpHidRefvalueTok:                                "__refvalue"
    of csharpAbstractTok:                                   "abstract"
    of csharpAddTok:                                        "add"
    of csharpAliasTok:                                      "alias"
    of csharpAndTok:                                        "and"
    of csharpAsTok:                                         "as"
    of csharpAscendingTok:                                  "ascending"
    of csharpAssemblyTok:                                   "assembly"
    of csharpAsyncTok:                                      "async"
    of csharpAwaitTok:                                      "await"
    of csharpBaseTok:                                       "base"
    of csharpBreakTok:                                      "break"
    of csharpByTok:                                         "by"
    of csharpCaseTok:                                       "case"
    of csharpCatchTok:                                      "catch"
    of csharpCheckedTok:                                    "checked"
    of csharpClassTok:                                      "class"
    of csharpComment:                                       "comment"
    of csharpConstTok:                                      "const"
    of csharpContinueTok:                                   "continue"
    of csharpDefaultTok:                                    "default"
    of csharpDelegateTok:                                   "delegate"
    of csharpDescendingTok:                                 "descending"
    of csharpDiscard:                                       "discard"
    of csharpDoTok:                                         "do"
    of csharpDynamicTok:                                    "dynamic"
    of csharpElseTok:                                       "else"
    of csharpEnumTok:                                       "enum"
    of csharpEqualsTok:                                     "equals"
    of csharpEscapeSequence:                                "escape_sequence"
    of csharpEventTok:                                      "event"
    of csharpExplicitTok:                                   "explicit"
    of csharpExternTok:                                     "extern"
    of csharpFalseTok:                                      "false"
    of csharpFieldTok:                                      "field"
    of csharpFinallyTok:                                    "finally"
    of csharpFixedTok:                                      "fixed"
    of csharpForTok:                                        "for"
    of csharpForeachTok:                                    "foreach"
    of csharpFromTok:                                       "from"
    of csharpGetTok:                                        "get"
    of csharpGlobalTok:                                     "global"
    of csharpGotoTok:                                       "goto"
    of csharpGroupTok:                                      "group"
    of csharpIfTok:                                         "if"
    of csharpImplicitTok:                                   "implicit"
    of csharpInTok:                                         "in"
    of csharpInitTok:                                       "init"
    of csharpIntegerLiteral:                                "integer_literal"
    of csharpInterfaceTok:                                  "interface"
    of csharpInternalTok:                                   "internal"
    of csharpIntoTok:                                       "into"
    of csharpIsTok:                                         "is"
    of csharpJoinTok:                                       "join"
    of csharpLetTok:                                        "let"
    of csharpLockTok:                                       "lock"
    of csharpManagedTok:                                    "managed"
    of csharpMethodTok:                                     "method"
    of csharpModuleTok:                                     "module"
    of csharpNameofTok:                                     "nameof"
    of csharpNamespaceTok:                                  "namespace"
    of csharpNewTok:                                        "new"
    of csharpNotTok:                                        "not"
    of csharpNotnullTok:                                    "notnull"
    of csharpNullLiteral:                                   "null_literal"
    of csharpOnTok:                                         "on"
    of csharpOperatorTok:                                   "operator"
    of csharpOrTok:                                         "or"
    of csharpOrderbyTok:                                    "orderby"
    of csharpOutTok:                                        "out"
    of csharpOverrideTok:                                   "override"
    of csharpParamTok:                                      "param"
    of csharpParamsTok:                                     "params"
    of csharpPartialTok:                                    "partial"
    of csharpPredefinedType:                                "predefined_type"
    of csharpPreprocessorDirective:                         "preprocessor_directive"
    of csharpPrivateTok:                                    "private"
    of csharpPropertyTok:                                   "property"
    of csharpProtectedTok:                                  "protected"
    of csharpPublicTok:                                     "public"
    of csharpReadonlyTok:                                   "readonly"
    of csharpRealLiteral:                                   "real_literal"
    of csharpRecordTok:                                     "record"
    of csharpRefTok:                                        "ref"
    of csharpRemoveTok:                                     "remove"
    of csharpReturnTok:                                     "return"
    of csharpSealedTok:                                     "sealed"
    of csharpSelectTok:                                     "select"
    of csharpSetTok:                                        "set"
    of csharpSizeofTok:                                     "sizeof"
    of csharpStackallocTok:                                 "stackalloc"
    of csharpStaticTok:                                     "static"
    of csharpStructTok:                                     "struct"
    of csharpSwitchTok:                                     "switch"
    of csharpThisTok:                                       "this"
    of csharpThrowTok:                                      "throw"
    of csharpTrueTok:                                       "true"
    of csharpTryTok:                                        "try"
    of csharpTypeTok:                                       "type"
    of csharpTypeofTok:                                     "typeof"
    of csharpUncheckedTok:                                  "unchecked"
    of csharpUnmanagedTok:                                  "unmanaged"
    of csharpUnsafeTok:                                     "unsafe"
    of csharpUsingTok:                                      "using"
    of csharpVarTok:                                        "var"
    of csharpVerbatimStringLiteral:                         "verbatim_string_literal"
    of csharpVirtualTok:                                    "virtual"
    of csharpVoidKeyword:                                   "void_keyword"
    of csharpVolatileTok:                                   "volatile"
    of csharpWhenTok:                                       "when"
    of csharpWhereTok:                                      "where"
    of csharpWhileTok:                                      "while"
    of csharpWithTok:                                       "with"
    of csharpYieldTok:                                      "yield"
    of csharpLCurlyTok:                                     "{"
    of csharpDoubleLCurlyTok:                               "{{"
    of csharpPipeTok:                                       "|"
    of csharpPipeEqualTok:                                  "|="
    of csharpDoublePipeTok:                                 "||"
    of csharpRCurlyTok:                                     "}"
    of csharpTildeTok:                                      "~"
    of csharpHidInterpolatedVerbatimStringContent:          "_interpolated_verbatim_string_content"
    of csharpHidLiteral:                                    "_literal"
    of csharpHidIdentifierToken:                            "_identifier_token"
    of csharpHidQueryBody:                                  "_query_body"
    of csharpHidOverloadableOperator:                       "_overloadable_operator"
    of csharpHidContextualKeywords:                         "_contextual_keywords"
    of csharpHidOrdering:                                   "_ordering"
    of csharpHidVariableDesignation:                        "_variable_designation"
    of csharpHidQueryClause:                                "_query_clause"
    of csharpHidInterpolatedStringContent:                  "_interpolated_string_content"
    of csharpHidAnonymousObjectMemberDeclarator:            "_anonymous_object_member_declarator"
    of csharpReturnType:                                    "return_type"
    of csharpHidTypeDeclaration:                            "_type_declaration"
    of csharpHidName:                                       "_name"
    of csharpHidPattern:                                    "_pattern"
    of csharpRecordBase:                                    "record_base"
    of csharpHidFunctionBody:                               "_function_body"
    of csharpHidFormalParameterList:                        "_formal_parameter_list"
    of csharpHidNamespaceMemberDeclaration:                 "_namespace_member_declaration"
    of csharpHidSelectOrGroupClause:                        "_select_or_group_clause"
    of csharpRefType:                                       "ref_type"
    of csharpHidRecordBase:                                 "_record_base"
    of csharpHidPreprocDirectiveEnd:                        "_preproc_directive_end"
    of csharpHidSimpleName:                                 "_simple_name"
    of csharpHidIdentifierOrGlobal:                         "_identifier_or_global"
    of csharpSyntaxError:                                   "ERROR"

type
  CsharpExternalTok* = enum
    csharpExtern_preproc_directive_end ## _preproc_directive_end

type
  TsCsharpNode* = distinct TSNode

type
  CsharpParser* = distinct PtsParser

const csharpAllowedSubnodes*: array[CsharpNodeKind, set[CsharpNodeKind]] = block:
                                                                             var tmp: array[CsharpNodeKind, set[CsharpNodeKind]]
                                                                             tmp[csharpAccessorDeclaration] = {csharpAttributeList, csharpIdentifier, csharpModifier}
                                                                             tmp[csharpAccessorList] = {csharpAccessorDeclaration}
                                                                             tmp[csharpAliasQualifiedName] = {csharpGenericName, csharpGlobal, csharpIdentifier}
                                                                             tmp[csharpAnonymousMethodExpression] = {csharpBlock, csharpParameterList}
                                                                             tmp[csharpAnonymousObjectCreationExpression] = {csharpHidExpression, csharpNameEquals}
                                                                             tmp[csharpArgument] = {csharpHidExpression, csharpDeclarationExpression, csharpNameColon}
                                                                             tmp[csharpArgumentList] = {csharpArgument}
                                                                             tmp[csharpArrayCreationExpression] = {csharpArrayType, csharpInitializerExpression}
                                                                             tmp[csharpArrayRankSpecifier] = {csharpHidExpression}
                                                                             tmp[csharpArrowExpressionClause] = {csharpHidExpression}
                                                                             tmp[csharpAssignmentExpression] = {csharpAssignmentOperator}
                                                                             tmp[csharpAttribute] = {csharpAttributeArgumentList}
                                                                             tmp[csharpAttributeArgument] = {csharpHidExpression, csharpNameColon, csharpNameEquals}
                                                                             tmp[csharpAttributeArgumentList] = {csharpAttributeArgument}
                                                                             tmp[csharpAttributeList] = {csharpAttribute, csharpAttributeTargetSpecifier}
                                                                             tmp[csharpAwaitExpression] = {csharpHidExpression}
                                                                             tmp[csharpBaseList] = {csharpHidType, csharpPrimaryConstructorBaseType}
                                                                             tmp[csharpBlock] = {csharpHidStatement}
                                                                             tmp[csharpBracketedArgumentList] = {csharpArgument}
                                                                             tmp[csharpBracketedParameterList] = {csharpParameter}
                                                                             tmp[csharpCasePatternSwitchLabel] = {
                                                                                                                   csharpBinaryPattern,
                                                                                                                   csharpConstantPattern,
                                                                                                                   csharpDeclarationPattern,
                                                                                                                   csharpDiscard,
                                                                                                                   csharpNegatedPattern,
                                                                                                                   csharpParenthesizedPattern,
                                                                                                                   csharpRecursivePattern,
                                                                                                                   csharpRelationalPattern,
                                                                                                                   csharpTypePattern,
                                                                                                                   csharpVarPattern,
                                                                                                                   csharpWhenClause
                                                                                                                 }
                                                                             tmp[csharpCaseSwitchLabel] = {csharpHidExpression}
                                                                             tmp[csharpCatchClause] = {csharpCatchDeclaration, csharpCatchFilterClause}
                                                                             tmp[csharpCatchFilterClause] = {csharpHidExpression}
                                                                             tmp[csharpCharacterLiteral] = {csharpEscapeSequence}
                                                                             tmp[csharpCheckedExpression] = {csharpHidExpression}
                                                                             tmp[csharpCheckedStatement] = {csharpBlock}
                                                                             tmp[csharpClassDeclaration] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpCompilationUnit] = {
                                                                                                            csharpClassDeclaration,
                                                                                                            csharpDelegateDeclaration,
                                                                                                            csharpEnumDeclaration,
                                                                                                            csharpExternAliasDirective,
                                                                                                            csharpGlobalAttributeList,
                                                                                                            csharpGlobalStatement,
                                                                                                            csharpInterfaceDeclaration,
                                                                                                            csharpNamespaceDeclaration,
                                                                                                            csharpRecordDeclaration,
                                                                                                            csharpStructDeclaration,
                                                                                                            csharpUsingDirective
                                                                                                          }
                                                                             tmp[csharpConditionalAccessExpression] = {csharpElementBindingExpression, csharpMemberBindingExpression}
                                                                             tmp[csharpConstantPattern] = {csharpHidExpression}
                                                                             tmp[csharpConstructorDeclaration] = {csharpAttributeList, csharpConstructorInitializer, csharpModifier}
                                                                             tmp[csharpConstructorInitializer] = {csharpArgumentList}
                                                                             tmp[csharpConversionOperatorDeclaration] = {csharpAttributeList, csharpModifier}
                                                                             tmp[csharpDeclarationList] = {csharpHidDeclaration}
                                                                             tmp[csharpDeclarationPattern] = {csharpDiscard, csharpIdentifier, csharpParenthesizedVariableDesignation}
                                                                             tmp[csharpDelegateDeclaration] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpDestructorDeclaration] = {csharpAttributeList, csharpIdentifier, csharpParameterList}
                                                                             tmp[csharpDoStatement] = {csharpHidExpression, csharpHidStatement}
                                                                             tmp[csharpElementBindingExpression] = {csharpBracketedArgumentList}
                                                                             tmp[csharpEnumDeclaration] = {csharpAttributeList, csharpModifier}
                                                                             tmp[csharpEnumMemberDeclaration] = {csharpAttributeList}
                                                                             tmp[csharpEnumMemberDeclarationList] = {csharpEnumMemberDeclaration}
                                                                             tmp[csharpEqualsValueClause] = {csharpHidExpression}
                                                                             tmp[csharpEventDeclaration] = {csharpAttributeList, csharpExplicitInterfaceSpecifier, csharpModifier}
                                                                             tmp[csharpEventFieldDeclaration] = {csharpAttributeList, csharpModifier, csharpVariableDeclaration}
                                                                             tmp[csharpExplicitInterfaceSpecifier] = {csharpAliasQualifiedName, csharpGenericName, csharpGlobal, csharpIdentifier, csharpQualifiedName}
                                                                             tmp[csharpExpressionStatement] = {csharpHidExpression}
                                                                             tmp[csharpExternAliasDirective] = {csharpIdentifier}
                                                                             tmp[csharpFieldDeclaration] = {csharpAttributeList, csharpModifier, csharpVariableDeclaration}
                                                                             tmp[csharpFinallyClause] = {csharpBlock}
                                                                             tmp[csharpFixedStatement] = {csharpHidStatement, csharpVariableDeclaration}
                                                                             tmp[csharpFromClause] = {csharpHidExpression, csharpHidType}
                                                                             tmp[csharpFunctionPointerCallingConvention] = {csharpFunctionPointerUnmanagedCallingConventionList}
                                                                             tmp[csharpFunctionPointerParameter] = {csharpHidType, csharpVoidKeyword}
                                                                             tmp[csharpFunctionPointerType] = {csharpFunctionPointerCallingConvention, csharpFunctionPointerParameter}
                                                                             tmp[csharpFunctionPointerUnmanagedCallingConvention] = {csharpIdentifier}
                                                                             tmp[csharpFunctionPointerUnmanagedCallingConventionList] = {csharpFunctionPointerUnmanagedCallingConvention}
                                                                             tmp[csharpGenericName] = {csharpIdentifier, csharpTypeArgumentList}
                                                                             tmp[csharpGlobalAttributeList] = {csharpAttribute}
                                                                             tmp[csharpGlobalStatement] = {csharpHidStatement}
                                                                             tmp[csharpGotoStatement] = {csharpHidExpression, csharpLabelName}
                                                                             tmp[csharpGroupClause] = {csharpHidExpression}
                                                                             tmp[csharpImplicitArrayCreationExpression] = {csharpInitializerExpression}
                                                                             tmp[csharpImplicitObjectCreationExpression] = {csharpArgumentList, csharpInitializerExpression}
                                                                             tmp[csharpImplicitStackAllocArrayCreationExpression] = {csharpInitializerExpression}
                                                                             tmp[csharpIndexerDeclaration] = {csharpAttributeList, csharpExplicitInterfaceSpecifier, csharpModifier}
                                                                             tmp[csharpInitializerExpression] = {csharpHidExpression}
                                                                             tmp[csharpInterfaceDeclaration] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpInterpolatedStringExpression] = {csharpInterpolatedStringText, csharpInterpolatedVerbatimStringText, csharpInterpolation}
                                                                             tmp[csharpInterpolatedStringText] = {csharpEscapeSequence}
                                                                             tmp[csharpInterpolation] = {csharpHidExpression, csharpInterpolationAlignmentClause, csharpInterpolationFormatClause}
                                                                             tmp[csharpInterpolationAlignmentClause] = {csharpHidExpression}
                                                                             tmp[csharpJoinClause] = {csharpHidExpression, csharpHidType, csharpJoinIntoClause}
                                                                             tmp[csharpJoinIntoClause] = {csharpIdentifier}
                                                                             tmp[csharpLabeledStatement] = {csharpHidStatement, csharpLabelName}
                                                                             tmp[csharpLambdaExpression] = {csharpIdentifier, csharpParameterList}
                                                                             tmp[csharpLetClause] = {csharpHidExpression}
                                                                             tmp[csharpLocalDeclarationStatement] = {csharpModifier, csharpVariableDeclaration}
                                                                             tmp[csharpLocalFunctionStatement] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpLockStatement] = {csharpHidExpression, csharpHidStatement}
                                                                             tmp[csharpMakeRefExpression] = {csharpHidExpression}
                                                                             tmp[csharpMethodDeclaration] = {csharpAttributeList, csharpExplicitInterfaceSpecifier, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpNameColon] = {csharpGlobal, csharpIdentifier}
                                                                             tmp[csharpNameEquals] = {csharpGlobal, csharpIdentifier}
                                                                             tmp[csharpNegatedPattern] = {
                                                                                                           csharpBinaryPattern,
                                                                                                           csharpConstantPattern,
                                                                                                           csharpDeclarationPattern,
                                                                                                           csharpDiscard,
                                                                                                           csharpNegatedPattern,
                                                                                                           csharpParenthesizedPattern,
                                                                                                           csharpRecursivePattern,
                                                                                                           csharpRelationalPattern,
                                                                                                           csharpTypePattern,
                                                                                                           csharpVarPattern
                                                                                                         }
                                                                             tmp[csharpNullableType] = {csharpHidType}
                                                                             tmp[csharpOperatorDeclaration] = {csharpAttributeList, csharpModifier}
                                                                             tmp[csharpOrderByClause] = {csharpHidExpression}
                                                                             tmp[csharpParameter] = {csharpAttributeList, csharpEqualsValueClause, csharpParameterModifier}
                                                                             tmp[csharpParameterArray] = {csharpArrayType, csharpAttributeList, csharpIdentifier, csharpNullableType}
                                                                             tmp[csharpParameterList] = {csharpParameter, csharpParameterArray}
                                                                             tmp[csharpParenthesizedExpression] = {csharpHidExpression}
                                                                             tmp[csharpParenthesizedPattern] = {
                                                                                                                 csharpBinaryPattern,
                                                                                                                 csharpConstantPattern,
                                                                                                                 csharpDeclarationPattern,
                                                                                                                 csharpDiscard,
                                                                                                                 csharpNegatedPattern,
                                                                                                                 csharpParenthesizedPattern,
                                                                                                                 csharpRecursivePattern,
                                                                                                                 csharpRelationalPattern,
                                                                                                                 csharpTypePattern,
                                                                                                                 csharpVarPattern
                                                                                                               }
                                                                             tmp[csharpParenthesizedVariableDesignation] = {csharpDiscard, csharpIdentifier, csharpParenthesizedVariableDesignation}
                                                                             tmp[csharpPointerType] = {csharpHidType}
                                                                             tmp[csharpPositionalPatternClause] = {csharpSubpattern}
                                                                             tmp[csharpPostfixUnaryExpression] = {csharpHidExpression}
                                                                             tmp[csharpPrefixUnaryExpression] = {csharpHidExpression}
                                                                             tmp[csharpPreprocessorCall] = {
                                                                                                             csharpBooleanLiteral,
                                                                                                             csharpCharacterLiteral,
                                                                                                             csharpIdentifier,
                                                                                                             csharpIntegerLiteral,
                                                                                                             csharpNullLiteral,
                                                                                                             csharpPreprocessorDirective,
                                                                                                             csharpRealLiteral,
                                                                                                             csharpStringLiteral,
                                                                                                             csharpVerbatimStringLiteral
                                                                                                           }
                                                                             tmp[csharpPrimaryConstructorBaseType] = {csharpArgumentList, csharpIdentifier}
                                                                             tmp[csharpPropertyDeclaration] = {csharpAttributeList, csharpExplicitInterfaceSpecifier, csharpModifier}
                                                                             tmp[csharpPropertyPatternClause] = {csharpSubpattern}
                                                                             tmp[csharpQualifiedName] = {csharpAliasQualifiedName, csharpGenericName, csharpGlobal, csharpIdentifier, csharpQualifiedName}
                                                                             tmp[csharpQueryContinuation] = {
                                                                                                              csharpFromClause,
                                                                                                              csharpGroupClause,
                                                                                                              csharpIdentifier,
                                                                                                              csharpJoinClause,
                                                                                                              csharpLetClause,
                                                                                                              csharpOrderByClause,
                                                                                                              csharpQueryContinuation,
                                                                                                              csharpSelectClause,
                                                                                                              csharpWhereClause
                                                                                                            }
                                                                             tmp[csharpQueryExpression] = {
                                                                                                            csharpFromClause,
                                                                                                            csharpGroupClause,
                                                                                                            csharpJoinClause,
                                                                                                            csharpLetClause,
                                                                                                            csharpOrderByClause,
                                                                                                            csharpQueryContinuation,
                                                                                                            csharpSelectClause,
                                                                                                            csharpWhereClause
                                                                                                          }
                                                                             tmp[csharpRangeExpression] = {csharpHidExpression}
                                                                             tmp[csharpRecordDeclaration] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpRecursivePattern] = {csharpHidType, csharpDiscard, csharpParenthesizedVariableDesignation, csharpPositionalPatternClause, csharpPropertyPatternClause}
                                                                             tmp[csharpRefExpression] = {csharpHidExpression}
                                                                             tmp[csharpRefTypeExpression] = {csharpHidExpression}
                                                                             tmp[csharpRelationalPattern] = {csharpHidExpression}
                                                                             tmp[csharpReturnStatement] = {csharpHidExpression}
                                                                             tmp[csharpSelectClause] = {csharpHidExpression}
                                                                             tmp[csharpSimpleAssignmentExpression] = {csharpHidExpression}
                                                                             tmp[csharpSizeOfExpression] = {csharpHidType}
                                                                             tmp[csharpStackAllocArrayCreationExpression] = {csharpArrayType, csharpInitializerExpression}
                                                                             tmp[csharpStringLiteral] = {csharpEscapeSequence}
                                                                             tmp[csharpStructDeclaration] = {csharpAttributeList, csharpModifier, csharpTypeParameterConstraintsClause}
                                                                             tmp[csharpSubpattern] = {
                                                                                                       csharpBinaryPattern,
                                                                                                       csharpConstantPattern,
                                                                                                       csharpDeclarationPattern,
                                                                                                       csharpDiscard,
                                                                                                       csharpNameColon,
                                                                                                       csharpNegatedPattern,
                                                                                                       csharpParenthesizedPattern,
                                                                                                       csharpRecursivePattern,
                                                                                                       csharpRelationalPattern,
                                                                                                       csharpTypePattern,
                                                                                                       csharpVarPattern
                                                                                                     }
                                                                             tmp[csharpSwitchBody] = {csharpSwitchSection}
                                                                             tmp[csharpSwitchExpression] = {csharpHidExpression, csharpSwitchExpressionArm}
                                                                             tmp[csharpSwitchExpressionArm] = {
                                                                                                                csharpHidExpression,
                                                                                                                csharpBinaryPattern,
                                                                                                                csharpConstantPattern,
                                                                                                                csharpDeclarationPattern,
                                                                                                                csharpDiscard,
                                                                                                                csharpNegatedPattern,
                                                                                                                csharpParenthesizedPattern,
                                                                                                                csharpRecursivePattern,
                                                                                                                csharpRelationalPattern,
                                                                                                                csharpTypePattern,
                                                                                                                csharpVarPattern,
                                                                                                                csharpWhenClause
                                                                                                              }
                                                                             tmp[csharpSwitchSection] = {csharpHidStatement, csharpCasePatternSwitchLabel, csharpCaseSwitchLabel, csharpDefaultSwitchLabel}
                                                                             tmp[csharpThrowExpression] = {csharpHidExpression}
                                                                             tmp[csharpThrowStatement] = {csharpHidExpression}
                                                                             tmp[csharpTryStatement] = {csharpCatchClause, csharpFinallyClause}
                                                                             tmp[csharpTupleExpression] = {csharpArgument}
                                                                             tmp[csharpTuplePattern] = {csharpDiscard, csharpIdentifier, csharpTuplePattern}
                                                                             tmp[csharpTupleType] = {csharpTupleElement}
                                                                             tmp[csharpTypeArgumentList] = {csharpHidType}
                                                                             tmp[csharpTypeOfExpression] = {csharpHidType}
                                                                             tmp[csharpTypeParameter] = {csharpAttributeList, csharpIdentifier}
                                                                             tmp[csharpTypeParameterConstraint] = {csharpConstructorConstraint, csharpTypeConstraint}
                                                                             tmp[csharpTypeParameterList] = {csharpTypeParameter}
                                                                             tmp[csharpTypePattern] = {csharpHidType}
                                                                             tmp[csharpUnsafeStatement] = {csharpBlock}
                                                                             tmp[csharpUsingDirective] = {csharpAliasQualifiedName, csharpGenericName, csharpGlobal, csharpIdentifier, csharpNameEquals, csharpQualifiedName}
                                                                             tmp[csharpUsingStatement] = {csharpHidExpression, csharpVariableDeclaration}
                                                                             tmp[csharpVarPattern] = {csharpDiscard, csharpIdentifier, csharpParenthesizedVariableDesignation}
                                                                             tmp[csharpVariableDeclaration] = {csharpVariableDeclarator}
                                                                             tmp[csharpVariableDeclarator] = {csharpBracketedArgumentList, csharpEqualsValueClause, csharpIdentifier, csharpTuplePattern}
                                                                             tmp[csharpWhenClause] = {csharpHidExpression}
                                                                             tmp[csharpWhereClause] = {csharpHidExpression}
                                                                             tmp[csharpWhileStatement] = {csharpHidExpression, csharpHidStatement}
                                                                             tmp[csharpWithExpression] = {csharpHidExpression, csharpWithInitializerExpression}
                                                                             tmp[csharpWithInitializerExpression] = {csharpSimpleAssignmentExpression}
                                                                             tmp[csharpYieldStatement] = {csharpHidExpression}
                                                                             tmp
const csharpTokenKinds*: set[CsharpNodeKind] = {
                                                 csharpExclamationTok,
                                                 csharpExclamationEqualTok,
                                                 csharpQuoteTok,
                                                 csharpDoubleQuoteTok,
                                                 csharpDollarQuoteTok,
                                                 csharpDollarAtQuoteTok,
                                                 csharpPercentTok,
                                                 csharpPercentEqualTok,
                                                 csharpAmpersandTok,
                                                 csharpDoubleAmpersandTok,
                                                 csharpAmpersandEqualTok,
                                                 csharpApostropheTok,
                                                 csharpLParTok,
                                                 csharpRParTok,
                                                 csharpAsteriskTok,
                                                 csharpAsteriskEqualTok,
                                                 csharpPlusTok,
                                                 csharpDoublePlusTok,
                                                 csharpPlusEqualTok,
                                                 csharpCommaTok,
                                                 csharpMinusTok,
                                                 csharpDoubleMinusTok,
                                                 csharpMinusEqualTok,
                                                 csharpMinusGreaterThanTok,
                                                 csharpDotTok,
                                                 csharpDoubleDotTok,
                                                 csharpSlashTok,
                                                 csharpSlashEqualTok,
                                                 csharpColonTok,
                                                 csharpDoubleColonTok,
                                                 csharpSemicolonTok,
                                                 csharpLessThanTok,
                                                 csharpDoubleLessThanTok,
                                                 csharpDoubleLessThanEqualTok,
                                                 csharpLessThanEqualTok,
                                                 csharpEqualTok,
                                                 csharpDoubleEqualTok,
                                                 csharpEqualGreaterThanTok,
                                                 csharpGreaterThanTok,
                                                 csharpGreaterThanEqualTok,
                                                 csharpDoubleGreaterThanTok,
                                                 csharpDoubleGreaterThanEqualTok,
                                                 csharpQuestionTok,
                                                 csharpDoubleQuestionTok,
                                                 csharpDoubleQuestionEqualTok,
                                                 csharpAtDollarQuoteTok,
                                                 csharpCdeclTok,
                                                 csharpFastcallTok,
                                                 csharpStdcallTok,
                                                 csharpThiscallTok,
                                                 csharpLBrackTok,
                                                 csharpRBrackTok,
                                                 csharpAccentTok,
                                                 csharpAccentEqualTok,
                                                 csharpHidMakerefTok,
                                                 csharpHidReftypeTok,
                                                 csharpHidRefvalueTok,
                                                 csharpAbstractTok,
                                                 csharpAddTok,
                                                 csharpAliasTok,
                                                 csharpAndTok,
                                                 csharpAsTok,
                                                 csharpAscendingTok,
                                                 csharpAssemblyTok,
                                                 csharpAsyncTok,
                                                 csharpAwaitTok,
                                                 csharpBaseTok,
                                                 csharpBreakTok,
                                                 csharpByTok,
                                                 csharpCaseTok,
                                                 csharpCatchTok,
                                                 csharpCheckedTok,
                                                 csharpClassTok,
                                                 csharpConstTok,
                                                 csharpContinueTok,
                                                 csharpDefaultTok,
                                                 csharpDelegateTok,
                                                 csharpDescendingTok,
                                                 csharpDoTok,
                                                 csharpDynamicTok,
                                                 csharpElseTok,
                                                 csharpEnumTok,
                                                 csharpEqualsTok,
                                                 csharpEventTok,
                                                 csharpExplicitTok,
                                                 csharpExternTok,
                                                 csharpFalseTok,
                                                 csharpFieldTok,
                                                 csharpFinallyTok,
                                                 csharpFixedTok,
                                                 csharpForTok,
                                                 csharpForeachTok,
                                                 csharpFromTok,
                                                 csharpGetTok,
                                                 csharpGlobalTok,
                                                 csharpGotoTok,
                                                 csharpGroupTok,
                                                 csharpIfTok,
                                                 csharpImplicitTok,
                                                 csharpInTok,
                                                 csharpInitTok,
                                                 csharpInterfaceTok,
                                                 csharpInternalTok,
                                                 csharpIntoTok,
                                                 csharpIsTok,
                                                 csharpJoinTok,
                                                 csharpLetTok,
                                                 csharpLockTok,
                                                 csharpManagedTok,
                                                 csharpMethodTok,
                                                 csharpModuleTok,
                                                 csharpNameofTok,
                                                 csharpNamespaceTok,
                                                 csharpNewTok,
                                                 csharpNotTok,
                                                 csharpNotnullTok,
                                                 csharpOnTok,
                                                 csharpOperatorTok,
                                                 csharpOrTok,
                                                 csharpOrderbyTok,
                                                 csharpOutTok,
                                                 csharpOverrideTok,
                                                 csharpParamTok,
                                                 csharpParamsTok,
                                                 csharpPartialTok,
                                                 csharpPrivateTok,
                                                 csharpPropertyTok,
                                                 csharpProtectedTok,
                                                 csharpPublicTok,
                                                 csharpReadonlyTok,
                                                 csharpRecordTok,
                                                 csharpRefTok,
                                                 csharpRemoveTok,
                                                 csharpReturnTok,
                                                 csharpSealedTok,
                                                 csharpSelectTok,
                                                 csharpSetTok,
                                                 csharpSizeofTok,
                                                 csharpStackallocTok,
                                                 csharpStaticTok,
                                                 csharpStructTok,
                                                 csharpSwitchTok,
                                                 csharpThisTok,
                                                 csharpThrowTok,
                                                 csharpTrueTok,
                                                 csharpTryTok,
                                                 csharpTypeTok,
                                                 csharpTypeofTok,
                                                 csharpUncheckedTok,
                                                 csharpUnmanagedTok,
                                                 csharpUnsafeTok,
                                                 csharpUsingTok,
                                                 csharpVarTok,
                                                 csharpVirtualTok,
                                                 csharpVolatileTok,
                                                 csharpWhenTok,
                                                 csharpWhereTok,
                                                 csharpWhileTok,
                                                 csharpWithTok,
                                                 csharpYieldTok,
                                                 csharpLCurlyTok,
                                                 csharpDoubleLCurlyTok,
                                                 csharpPipeTok,
                                                 csharpPipeEqualTok,
                                                 csharpDoublePipeTok,
                                                 csharpRCurlyTok,
                                                 csharpTildeTok
                                               }
const csharpHiddenKinds*: set[CsharpNodeKind] = {
                                                  csharpHidInterpolatedVerbatimStringContent,
                                                  csharpHidLiteral,
                                                  csharpHidIdentifierToken,
                                                  csharpHidType,
                                                  csharpHidExpression,
                                                  csharpHidQueryBody,
                                                  csharpHidOverloadableOperator,
                                                  csharpHidContextualKeywords,
                                                  csharpHidOrdering,
                                                  csharpHidVariableDesignation,
                                                  csharpHidQueryClause,
                                                  csharpHidInterpolatedStringContent,
                                                  csharpHidAnonymousObjectMemberDeclarator,
                                                  csharpReturnType,
                                                  csharpHidTypeDeclaration,
                                                  csharpHidStatement,
                                                  csharpHidName,
                                                  csharpHidPattern,
                                                  csharpRecordBase,
                                                  csharpHidFunctionBody,
                                                  csharpHidFormalParameterList,
                                                  csharpHidNamespaceMemberDeclaration,
                                                  csharpHidSelectOrGroupClause,
                                                  csharpHidDeclaration,
                                                  csharpRefType,
                                                  csharpHidRecordBase,
                                                  csharpHidPreprocDirectiveEnd,
                                                  csharpHidSimpleName,
                                                  csharpHidIdentifierOrGlobal
                                                }
proc tsNodeType*(node: TsCsharpNode): string


proc kind*(node: TsCsharpNode): CsharpNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration":                                       csharpHidDeclaration
      of "_expression":                                        csharpHidExpression
      of "_statement":                                         csharpHidStatement
      of "_type":                                              csharpHidType
      of "accessor_declaration":                               csharpAccessorDeclaration
      of "accessor_list":                                      csharpAccessorList
      of "alias_qualified_name":                               csharpAliasQualifiedName
      of "anonymous_method_expression":                        csharpAnonymousMethodExpression
      of "anonymous_object_creation_expression":               csharpAnonymousObjectCreationExpression
      of "argument":                                           csharpArgument
      of "argument_list":                                      csharpArgumentList
      of "array_creation_expression":                          csharpArrayCreationExpression
      of "array_rank_specifier":                               csharpArrayRankSpecifier
      of "array_type":                                         csharpArrayType
      of "arrow_expression_clause":                            csharpArrowExpressionClause
      of "as_expression":                                      csharpAsExpression
      of "assignment_expression":                              csharpAssignmentExpression
      of "assignment_operator":                                csharpAssignmentOperator
      of "attribute":                                          csharpAttribute
      of "attribute_argument":                                 csharpAttributeArgument
      of "attribute_argument_list":                            csharpAttributeArgumentList
      of "attribute_list":                                     csharpAttributeList
      of "attribute_target_specifier":                         csharpAttributeTargetSpecifier
      of "await_expression":                                   csharpAwaitExpression
      of "base_expression":                                    csharpBaseExpression
      of "base_list":                                          csharpBaseList
      of "binary_expression":                                  csharpBinaryExpression
      of "binary_pattern":                                     csharpBinaryPattern
      of "block":                                              csharpBlock
      of "boolean_literal":                                    csharpBooleanLiteral
      of "bracketed_argument_list":                            csharpBracketedArgumentList
      of "bracketed_parameter_list":                           csharpBracketedParameterList
      of "break_statement":                                    csharpBreakStatement
      of "case_pattern_switch_label":                          csharpCasePatternSwitchLabel
      of "case_switch_label":                                  csharpCaseSwitchLabel
      of "cast_expression":                                    csharpCastExpression
      of "catch_clause":                                       csharpCatchClause
      of "catch_declaration":                                  csharpCatchDeclaration
      of "catch_filter_clause":                                csharpCatchFilterClause
      of "character_literal":                                  csharpCharacterLiteral
      of "checked_expression":                                 csharpCheckedExpression
      of "checked_statement":                                  csharpCheckedStatement
      of "class_declaration":                                  csharpClassDeclaration
      of "compilation_unit":                                   csharpCompilationUnit
      of "conditional_access_expression":                      csharpConditionalAccessExpression
      of "conditional_expression":                             csharpConditionalExpression
      of "constant_pattern":                                   csharpConstantPattern
      of "constructor_constraint":                             csharpConstructorConstraint
      of "constructor_declaration":                            csharpConstructorDeclaration
      of "constructor_initializer":                            csharpConstructorInitializer
      of "continue_statement":                                 csharpContinueStatement
      of "conversion_operator_declaration":                    csharpConversionOperatorDeclaration
      of "declaration_expression":                             csharpDeclarationExpression
      of "declaration_list":                                   csharpDeclarationList
      of "declaration_pattern":                                csharpDeclarationPattern
      of "default_expression":                                 csharpDefaultExpression
      of "default_switch_label":                               csharpDefaultSwitchLabel
      of "delegate_declaration":                               csharpDelegateDeclaration
      of "destructor_declaration":                             csharpDestructorDeclaration
      of "do_statement":                                       csharpDoStatement
      of "element_access_expression":                          csharpElementAccessExpression
      of "element_binding_expression":                         csharpElementBindingExpression
      of "empty_statement":                                    csharpEmptyStatement
      of "enum_declaration":                                   csharpEnumDeclaration
      of "enum_member_declaration":                            csharpEnumMemberDeclaration
      of "enum_member_declaration_list":                       csharpEnumMemberDeclarationList
      of "equals_value_clause":                                csharpEqualsValueClause
      of "event_declaration":                                  csharpEventDeclaration
      of "event_field_declaration":                            csharpEventFieldDeclaration
      of "explicit_interface_specifier":                       csharpExplicitInterfaceSpecifier
      of "expression_statement":                               csharpExpressionStatement
      of "extern_alias_directive":                             csharpExternAliasDirective
      of "field_declaration":                                  csharpFieldDeclaration
      of "finally_clause":                                     csharpFinallyClause
      of "fixed_statement":                                    csharpFixedStatement
      of "for_each_statement":                                 csharpForEachStatement
      of "for_statement":                                      csharpForStatement
      of "from_clause":                                        csharpFromClause
      of "function_pointer_calling_convention":                csharpFunctionPointerCallingConvention
      of "function_pointer_parameter":                         csharpFunctionPointerParameter
      of "function_pointer_type":                              csharpFunctionPointerType
      of "function_pointer_unmanaged_calling_convention":      csharpFunctionPointerUnmanagedCallingConvention
      of "function_pointer_unmanaged_calling_convention_list": csharpFunctionPointerUnmanagedCallingConventionList
      of "generic_name":                                       csharpGenericName
      of "global":                                             csharpGlobal
      of "global_attribute_list":                              csharpGlobalAttributeList
      of "global_statement":                                   csharpGlobalStatement
      of "goto_statement":                                     csharpGotoStatement
      of "group_clause":                                       csharpGroupClause
      of "identifier":                                         csharpIdentifier
      of "if_statement":                                       csharpIfStatement
      of "implicit_array_creation_expression":                 csharpImplicitArrayCreationExpression
      of "implicit_object_creation_expression":                csharpImplicitObjectCreationExpression
      of "implicit_stack_alloc_array_creation_expression":     csharpImplicitStackAllocArrayCreationExpression
      of "implicit_type":                                      csharpImplicitType
      of "indexer_declaration":                                csharpIndexerDeclaration
      of "initializer_expression":                             csharpInitializerExpression
      of "interface_declaration":                              csharpInterfaceDeclaration
      of "interpolated_string_expression":                     csharpInterpolatedStringExpression
      of "interpolated_string_text":                           csharpInterpolatedStringText
      of "interpolated_verbatim_string_text":                  csharpInterpolatedVerbatimStringText
      of "interpolation":                                      csharpInterpolation
      of "interpolation_alignment_clause":                     csharpInterpolationAlignmentClause
      of "interpolation_format_clause":                        csharpInterpolationFormatClause
      of "invocation_expression":                              csharpInvocationExpression
      of "is_expression":                                      csharpIsExpression
      of "is_pattern_expression":                              csharpIsPatternExpression
      of "join_clause":                                        csharpJoinClause
      of "join_into_clause":                                   csharpJoinIntoClause
      of "label_name":                                         csharpLabelName
      of "labeled_statement":                                  csharpLabeledStatement
      of "lambda_expression":                                  csharpLambdaExpression
      of "let_clause":                                         csharpLetClause
      of "local_declaration_statement":                        csharpLocalDeclarationStatement
      of "local_function_statement":                           csharpLocalFunctionStatement
      of "lock_statement":                                     csharpLockStatement
      of "make_ref_expression":                                csharpMakeRefExpression
      of "member_access_expression":                           csharpMemberAccessExpression
      of "member_binding_expression":                          csharpMemberBindingExpression
      of "method_declaration":                                 csharpMethodDeclaration
      of "modifier":                                           csharpModifier
      of "name_colon":                                         csharpNameColon
      of "name_equals":                                        csharpNameEquals
      of "namespace_declaration":                              csharpNamespaceDeclaration
      of "negated_pattern":                                    csharpNegatedPattern
      of "nullable_type":                                      csharpNullableType
      of "object_creation_expression":                         csharpObjectCreationExpression
      of "operator_declaration":                               csharpOperatorDeclaration
      of "order_by_clause":                                    csharpOrderByClause
      of "parameter":                                          csharpParameter
      of "parameter_array":                                    csharpParameterArray
      of "parameter_list":                                     csharpParameterList
      of "parameter_modifier":                                 csharpParameterModifier
      of "parenthesized_expression":                           csharpParenthesizedExpression
      of "parenthesized_pattern":                              csharpParenthesizedPattern
      of "parenthesized_variable_designation":                 csharpParenthesizedVariableDesignation
      of "pointer_type":                                       csharpPointerType
      of "positional_pattern_clause":                          csharpPositionalPatternClause
      of "postfix_unary_expression":                           csharpPostfixUnaryExpression
      of "prefix_unary_expression":                            csharpPrefixUnaryExpression
      of "preprocessor_call":                                  csharpPreprocessorCall
      of "primary_constructor_base_type":                      csharpPrimaryConstructorBaseType
      of "property_declaration":                               csharpPropertyDeclaration
      of "property_pattern_clause":                            csharpPropertyPatternClause
      of "qualified_name":                                     csharpQualifiedName
      of "query_continuation":                                 csharpQueryContinuation
      of "query_expression":                                   csharpQueryExpression
      of "range_expression":                                   csharpRangeExpression
      of "record_declaration":                                 csharpRecordDeclaration
      of "recursive_pattern":                                  csharpRecursivePattern
      of "ref_expression":                                     csharpRefExpression
      of "ref_type_expression":                                csharpRefTypeExpression
      of "ref_value_expression":                               csharpRefValueExpression
      of "relational_pattern":                                 csharpRelationalPattern
      of "return_statement":                                   csharpReturnStatement
      of "select_clause":                                      csharpSelectClause
      of "simple_assignment_expression":                       csharpSimpleAssignmentExpression
      of "size_of_expression":                                 csharpSizeOfExpression
      of "stack_alloc_array_creation_expression":              csharpStackAllocArrayCreationExpression
      of "string_literal":                                     csharpStringLiteral
      of "struct_declaration":                                 csharpStructDeclaration
      of "subpattern":                                         csharpSubpattern
      of "switch_body":                                        csharpSwitchBody
      of "switch_expression":                                  csharpSwitchExpression
      of "switch_expression_arm":                              csharpSwitchExpressionArm
      of "switch_section":                                     csharpSwitchSection
      of "switch_statement":                                   csharpSwitchStatement
      of "this_expression":                                    csharpThisExpression
      of "throw_expression":                                   csharpThrowExpression
      of "throw_statement":                                    csharpThrowStatement
      of "try_statement":                                      csharpTryStatement
      of "tuple_element":                                      csharpTupleElement
      of "tuple_expression":                                   csharpTupleExpression
      of "tuple_pattern":                                      csharpTuplePattern
      of "tuple_type":                                         csharpTupleType
      of "type_argument_list":                                 csharpTypeArgumentList
      of "type_constraint":                                    csharpTypeConstraint
      of "type_of_expression":                                 csharpTypeOfExpression
      of "type_parameter":                                     csharpTypeParameter
      of "type_parameter_constraint":                          csharpTypeParameterConstraint
      of "type_parameter_constraints_clause":                  csharpTypeParameterConstraintsClause
      of "type_parameter_list":                                csharpTypeParameterList
      of "type_pattern":                                       csharpTypePattern
      of "unsafe_statement":                                   csharpUnsafeStatement
      of "using_directive":                                    csharpUsingDirective
      of "using_statement":                                    csharpUsingStatement
      of "var_pattern":                                        csharpVarPattern
      of "variable_declaration":                               csharpVariableDeclaration
      of "variable_declarator":                                csharpVariableDeclarator
      of "when_clause":                                        csharpWhenClause
      of "where_clause":                                       csharpWhereClause
      of "while_statement":                                    csharpWhileStatement
      of "with_expression":                                    csharpWithExpression
      of "with_initializer_expression":                        csharpWithInitializerExpression
      of "yield_statement":                                    csharpYieldStatement
      of "!":                                                  csharpExclamationTok
      of "!=":                                                 csharpExclamationEqualTok
      of "\"":                                                 csharpQuoteTok
      of "\"\"":                                               csharpDoubleQuoteTok
      of "$\"":                                                csharpDollarQuoteTok
      of "$@\"":                                               csharpDollarAtQuoteTok
      of "%":                                                  csharpPercentTok
      of "%=":                                                 csharpPercentEqualTok
      of "&":                                                  csharpAmpersandTok
      of "&&":                                                 csharpDoubleAmpersandTok
      of "&=":                                                 csharpAmpersandEqualTok
      of "\'":                                                 csharpApostropheTok
      of "(":                                                  csharpLParTok
      of ")":                                                  csharpRParTok
      of "*":                                                  csharpAsteriskTok
      of "*=":                                                 csharpAsteriskEqualTok
      of "+":                                                  csharpPlusTok
      of "++":                                                 csharpDoublePlusTok
      of "+=":                                                 csharpPlusEqualTok
      of ",":                                                  csharpCommaTok
      of "-":                                                  csharpMinusTok
      of "--":                                                 csharpDoubleMinusTok
      of "-=":                                                 csharpMinusEqualTok
      of "->":                                                 csharpMinusGreaterThanTok
      of ".":                                                  csharpDotTok
      of "..":                                                 csharpDoubleDotTok
      of "/":                                                  csharpSlashTok
      of "/=":                                                 csharpSlashEqualTok
      of ":":                                                  csharpColonTok
      of "::":                                                 csharpDoubleColonTok
      of ";":                                                  csharpSemicolonTok
      of "<":                                                  csharpLessThanTok
      of "<<":                                                 csharpDoubleLessThanTok
      of "<<=":                                                csharpDoubleLessThanEqualTok
      of "<=":                                                 csharpLessThanEqualTok
      of "=":                                                  csharpEqualTok
      of "==":                                                 csharpDoubleEqualTok
      of "=>":                                                 csharpEqualGreaterThanTok
      of ">":                                                  csharpGreaterThanTok
      of ">=":                                                 csharpGreaterThanEqualTok
      of ">>":                                                 csharpDoubleGreaterThanTok
      of ">>=":                                                csharpDoubleGreaterThanEqualTok
      of "?":                                                  csharpQuestionTok
      of "??":                                                 csharpDoubleQuestionTok
      of "??=":                                                csharpDoubleQuestionEqualTok
      of "@$\"":                                               csharpAtDollarQuoteTok
      of "Cdecl":                                              csharpCdeclTok
      of "Fastcall":                                           csharpFastcallTok
      of "Stdcall":                                            csharpStdcallTok
      of "Thiscall":                                           csharpThiscallTok
      of "[":                                                  csharpLBrackTok
      of "]":                                                  csharpRBrackTok
      of "^":                                                  csharpAccentTok
      of "^=":                                                 csharpAccentEqualTok
      of "__makeref":                                          csharpHidMakerefTok
      of "__reftype":                                          csharpHidReftypeTok
      of "__refvalue":                                         csharpHidRefvalueTok
      of "abstract":                                           csharpAbstractTok
      of "add":                                                csharpAddTok
      of "alias":                                              csharpAliasTok
      of "and":                                                csharpAndTok
      of "as":                                                 csharpAsTok
      of "ascending":                                          csharpAscendingTok
      of "assembly":                                           csharpAssemblyTok
      of "async":                                              csharpAsyncTok
      of "await":                                              csharpAwaitTok
      of "base":                                               csharpBaseTok
      of "break":                                              csharpBreakTok
      of "by":                                                 csharpByTok
      of "case":                                               csharpCaseTok
      of "catch":                                              csharpCatchTok
      of "checked":                                            csharpCheckedTok
      of "class":                                              csharpClassTok
      of "comment":                                            csharpComment
      of "const":                                              csharpConstTok
      of "continue":                                           csharpContinueTok
      of "default":                                            csharpDefaultTok
      of "delegate":                                           csharpDelegateTok
      of "descending":                                         csharpDescendingTok
      of "discard":                                            csharpDiscard
      of "do":                                                 csharpDoTok
      of "dynamic":                                            csharpDynamicTok
      of "else":                                               csharpElseTok
      of "enum":                                               csharpEnumTok
      of "equals":                                             csharpEqualsTok
      of "escape_sequence":                                    csharpEscapeSequence
      of "event":                                              csharpEventTok
      of "explicit":                                           csharpExplicitTok
      of "extern":                                             csharpExternTok
      of "false":                                              csharpFalseTok
      of "field":                                              csharpFieldTok
      of "finally":                                            csharpFinallyTok
      of "fixed":                                              csharpFixedTok
      of "for":                                                csharpForTok
      of "foreach":                                            csharpForeachTok
      of "from":                                               csharpFromTok
      of "get":                                                csharpGetTok
      of "goto":                                               csharpGotoTok
      of "group":                                              csharpGroupTok
      of "if":                                                 csharpIfTok
      of "implicit":                                           csharpImplicitTok
      of "in":                                                 csharpInTok
      of "init":                                               csharpInitTok
      of "integer_literal":                                    csharpIntegerLiteral
      of "interface":                                          csharpInterfaceTok
      of "internal":                                           csharpInternalTok
      of "into":                                               csharpIntoTok
      of "is":                                                 csharpIsTok
      of "join":                                               csharpJoinTok
      of "let":                                                csharpLetTok
      of "lock":                                               csharpLockTok
      of "managed":                                            csharpManagedTok
      of "method":                                             csharpMethodTok
      of "module":                                             csharpModuleTok
      of "nameof":                                             csharpNameofTok
      of "namespace":                                          csharpNamespaceTok
      of "new":                                                csharpNewTok
      of "not":                                                csharpNotTok
      of "notnull":                                            csharpNotnullTok
      of "null_literal":                                       csharpNullLiteral
      of "on":                                                 csharpOnTok
      of "operator":                                           csharpOperatorTok
      of "or":                                                 csharpOrTok
      of "orderby":                                            csharpOrderbyTok
      of "out":                                                csharpOutTok
      of "override":                                           csharpOverrideTok
      of "param":                                              csharpParamTok
      of "params":                                             csharpParamsTok
      of "partial":                                            csharpPartialTok
      of "predefined_type":                                    csharpPredefinedType
      of "preprocessor_directive":                             csharpPreprocessorDirective
      of "private":                                            csharpPrivateTok
      of "property":                                           csharpPropertyTok
      of "protected":                                          csharpProtectedTok
      of "public":                                             csharpPublicTok
      of "readonly":                                           csharpReadonlyTok
      of "real_literal":                                       csharpRealLiteral
      of "record":                                             csharpRecordTok
      of "ref":                                                csharpRefTok
      of "remove":                                             csharpRemoveTok
      of "return":                                             csharpReturnTok
      of "sealed":                                             csharpSealedTok
      of "select":                                             csharpSelectTok
      of "set":                                                csharpSetTok
      of "sizeof":                                             csharpSizeofTok
      of "stackalloc":                                         csharpStackallocTok
      of "static":                                             csharpStaticTok
      of "struct":                                             csharpStructTok
      of "switch":                                             csharpSwitchTok
      of "this":                                               csharpThisTok
      of "throw":                                              csharpThrowTok
      of "true":                                               csharpTrueTok
      of "try":                                                csharpTryTok
      of "type":                                               csharpTypeTok
      of "typeof":                                             csharpTypeofTok
      of "unchecked":                                          csharpUncheckedTok
      of "unmanaged":                                          csharpUnmanagedTok
      of "unsafe":                                             csharpUnsafeTok
      of "using":                                              csharpUsingTok
      of "var":                                                csharpVarTok
      of "verbatim_string_literal":                            csharpVerbatimStringLiteral
      of "virtual":                                            csharpVirtualTok
      of "void_keyword":                                       csharpVoidKeyword
      of "volatile":                                           csharpVolatileTok
      of "when":                                               csharpWhenTok
      of "where":                                              csharpWhereTok
      of "while":                                              csharpWhileTok
      of "with":                                               csharpWithTok
      of "yield":                                              csharpYieldTok
      of "{":                                                  csharpLCurlyTok
      of "{{":                                                 csharpDoubleLCurlyTok
      of "|":                                                  csharpPipeTok
      of "|=":                                                 csharpPipeEqualTok
      of "||":                                                 csharpDoublePipeTok
      of "}":                                                  csharpRCurlyTok
      of "~":                                                  csharpTildeTok
      of "ERROR":                                              csharpSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsCsharpNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsCsharpNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsCsharpNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_c_sharp(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsCsharpNode): string =
  $ts_node_type(TSNode(node))

proc newTsCsharpParser*(): CsharpParser =
  result = CsharpParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_c_sharp())

proc parseString*(parser: CsharpParser, str: string): TsCsharpNode =
  TsCsharpNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsCsharpString*(str: string): TsCsharpNode =
  let parser = newTsCsharpParser()
  return parseString(parser, str)

func `$`*(node: TsCsharpNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsCsharpNode, str: string): string =
  var res = addr result
  proc aux(node: TsCsharpNode, level: int) =
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
let csharpGrammar*: array[CsharpNodeKind, HtsRule[CsharpNodeKind]] = block:
                                                                       var rules: array[CsharpNodeKind, HtsRule[CsharpNodeKind]]
                                                                       type
                                                                         K = CsharpNodeKind


                                                                       rules[csharpInterpolation] = tsSeq[K](tsString[K]("{"), tsSymbol[K](csharpHidExpression), tsChoice[K](tsSymbol[K](csharpInterpolationAlignmentClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpInterpolationFormatClause), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpStructDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("struct"), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpBaseList), tsBlank[K]()), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpDeclarationList), tsChoice[K](tsString[K](";"), tsBlank[K]()))
                                                                       rules[csharpJoinClause] = tsSeq[K](tsString[K]("join"), tsChoice[K](tsSymbol[K](csharpHidType), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsString[K]("in"), tsSymbol[K](csharpHidExpression), tsString[K]("on"), tsSymbol[K](csharpHidExpression), tsString[K]("equals"), tsSymbol[K](csharpHidExpression), tsChoice[K](tsSymbol[K](csharpJoinIntoClause), tsBlank[K]()))
                                                                       rules[csharpDiscard] = tsString[K]("_")
                                                                       rules[csharpAssignmentOperator] = tsChoice[K](tsString[K]("="), tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("&="), tsString[K]("^="), tsString[K]("|="), tsString[K]("<<="), tsString[K](">>="), tsString[K]("??="))
                                                                       rules[csharpEnumMemberDeclarationList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpEnumMemberDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpEnumMemberDeclaration)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpHidIdentifierToken] = tsSeq[K](tsChoice[K](tsString[K]("@"), tsBlank[K]()), tsRegex[K]("[a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5_][a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5_0-9]*"))
                                                                       rules[csharpLambdaExpression] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsChoice[K](tsString[K]("static"), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpParameterList), tsSymbol[K](csharpIdentifier)), tsString[K]("=>"), tsChoice[K](tsSymbol[K](csharpBlock), tsSymbol[K](csharpHidExpression)))
                                                                       rules[csharpFixedStatement] = tsSeq[K](tsString[K]("fixed"), tsString[K]("("), tsSymbol[K](csharpVariableDeclaration), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpCompilationUnit] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpExternAliasDirective)), tsRepeat[K](tsSymbol[K](csharpUsingDirective)), tsRepeat[K](tsSymbol[K](csharpGlobalAttributeList)), tsRepeat[K](tsSymbol[K](csharpGlobalStatement)), tsRepeat[K](tsSymbol[K](csharpHidNamespaceMemberDeclaration)))
                                                                       rules[csharpTupleElement] = tsSeq[K](tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpIdentifier), tsBlank[K]()))
                                                                       rules[csharpGotoStatement] = tsSeq[K](tsString[K]("goto"), tsChoice[K](tsSymbol[K](csharpIdentifier), tsSeq[K](tsString[K]("case"), tsSymbol[K](csharpHidExpression)), tsString[K]("default")), tsString[K](";"))
                                                                       rules[csharpBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                       rules[csharpForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsChoice[K](tsSymbol[K](csharpVariableDeclaration), tsSeq[K](tsSymbol[K](csharpHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidExpression))))), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidExpression)))), tsBlank[K]()), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpCatchDeclaration] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpIdentifier), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpBracketedParameterList] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](csharpParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpParameter)))), tsString[K]("]"))
                                                                       rules[csharpTuplePattern] = tsSeq[K](tsString[K]("("), tsSeq[K](tsChoice[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpDiscard), tsSymbol[K](csharpTuplePattern)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpDiscard), tsSymbol[K](csharpTuplePattern))))), tsString[K](")"))
                                                                       rules[csharpParenthesizedVariableDesignation] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidVariableDesignation), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidVariableDesignation)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpImplicitArrayCreationExpression] = tsSeq[K](tsString[K]("new"), tsString[K]("["), tsRepeat[K](tsString[K](",")), tsString[K]("]"), tsSymbol[K](csharpInitializerExpression))
                                                                       rules[csharpGroupClause] = tsSeq[K](tsString[K]("group"), tsSymbol[K](csharpHidExpression), tsString[K]("by"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpExplicitInterfaceSpecifier] = tsSeq[K](tsSymbol[K](csharpHidName), tsString[K]("."))
                                                                       rules[csharpThrowStatement] = tsSeq[K](tsString[K]("throw"), tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()), tsString[K](";"))
                                                                       rules[csharpAccessorList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](csharpAccessorDeclaration)), tsString[K]("}"))
                                                                       rules[csharpInterpolationFormatClause] = tsSeq[K](tsString[K](":"), tsRegex[K]("[^}\"]+"))
                                                                       rules[csharpVariableDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpTuplePattern)), tsChoice[K](tsSymbol[K](csharpBracketedArgumentList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpEqualsValueClause), tsBlank[K]()))
                                                                       rules[csharpDeclarationExpression] = tsSeq[K](tsSymbol[K](csharpHidType), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpModifier] = tsChoice[K](tsString[K]("abstract"), tsString[K]("async"), tsString[K]("const"), tsString[K]("extern"), tsString[K]("fixed"), tsString[K]("internal"), tsString[K]("new"), tsString[K]("override"), tsString[K]("partial"), tsString[K]("private"), tsString[K]("protected"), tsString[K]("public"), tsString[K]("readonly"), tsString[K]("ref"), tsString[K]("sealed"), tsString[K]("static"), tsString[K]("unsafe"), tsString[K]("virtual"), tsString[K]("volatile"))
                                                                       rules[csharpNamespaceDeclaration] = tsSeq[K](tsString[K]("namespace"), tsSymbol[K](csharpHidName), tsSymbol[K](csharpDeclarationList), tsChoice[K](tsString[K](";"), tsBlank[K]()))
                                                                       rules[csharpEqualsValueClause] = tsSeq[K](tsString[K]("="), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpSelectClause] = tsSeq[K](tsString[K]("select"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpArrayType] = tsSeq[K](tsSymbol[K](csharpHidType), tsSymbol[K](csharpArrayRankSpecifier))
                                                                       rules[csharpComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^*]"), tsRegex[K]("\\*[^/]"))), tsString[K]("*/")))
                                                                       rules[csharpPrefixUnaryExpression] = tsChoice[K](tsSeq[K](tsString[K]("!"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("&"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("*"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("+"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("++"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("-"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("--"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("^"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("~"), tsSymbol[K](csharpHidExpression)))
                                                                       rules[csharpWithExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("with"), tsString[K]("{"), tsChoice[K](tsSymbol[K](csharpWithInitializerExpression), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpMethodDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpReturnType), tsChoice[K](tsSymbol[K](csharpExplicitInterfaceSpecifier), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsSymbol[K](csharpParameterList), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpAttributeArgument] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](csharpNameEquals), tsSymbol[K](csharpNameColon)), tsBlank[K]()), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpQueryExpression] = tsSeq[K](tsSymbol[K](csharpFromClause), tsSymbol[K](csharpHidQueryBody))
                                                                       rules[csharpNegatedPattern] = tsSeq[K](tsString[K]("not"), tsSymbol[K](csharpHidPattern))
                                                                       rules[csharpEnumMemberDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](csharpHidExpression)), tsBlank[K]()))
                                                                       rules[csharpNameEquals] = tsSeq[K](tsSymbol[K](csharpHidIdentifierOrGlobal), tsString[K]("="))
                                                                       rules[csharpHidFormalParameterList] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpParameter), tsSymbol[K](csharpParameterArray)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](csharpParameter), tsSymbol[K](csharpParameterArray)))))
                                                                       rules[csharpInterpolatedStringText] = tsChoice[K](tsString[K]("{{"), tsRegex[K]("[^{\"\\\\\\n]+"), tsSymbol[K](csharpEscapeSequence))
                                                                       rules[csharpExternAliasDirective] = tsSeq[K](tsString[K]("extern"), tsString[K]("alias"), tsSymbol[K](csharpIdentifier), tsString[K](";"))
                                                                       rules[csharpIndexerDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpExplicitInterfaceSpecifier), tsBlank[K]()), tsString[K]("this"), tsSymbol[K](csharpBracketedParameterList), tsChoice[K](tsSymbol[K](csharpAccessorList), tsSeq[K](tsSymbol[K](csharpArrowExpressionClause), tsString[K](";"))))
                                                                       rules[csharpPointerType] = tsSeq[K](tsSymbol[K](csharpHidType), tsString[K]("*"))
                                                                       rules[csharpVarPattern] = tsSeq[K](tsString[K]("var"), tsSymbol[K](csharpHidVariableDesignation))
                                                                       rules[csharpHidDeclaration] = tsChoice[K](tsSymbol[K](csharpClassDeclaration), tsSymbol[K](csharpConstructorDeclaration), tsSymbol[K](csharpConversionOperatorDeclaration), tsSymbol[K](csharpDelegateDeclaration), tsSymbol[K](csharpDestructorDeclaration), tsSymbol[K](csharpEnumDeclaration), tsSymbol[K](csharpEventDeclaration), tsSymbol[K](csharpEventFieldDeclaration), tsSymbol[K](csharpFieldDeclaration), tsSymbol[K](csharpIndexerDeclaration), tsSymbol[K](csharpInterfaceDeclaration), tsSymbol[K](csharpMethodDeclaration), tsSymbol[K](csharpNamespaceDeclaration), tsSymbol[K](csharpOperatorDeclaration), tsSymbol[K](csharpPropertyDeclaration), tsSymbol[K](csharpRecordDeclaration), tsSymbol[K](csharpStructDeclaration), tsSymbol[K](csharpUsingDirective))
                                                                       rules[csharpInterpolatedStringExpression] = tsChoice[K](tsSeq[K](tsString[K]("$\""), tsRepeat[K](tsSymbol[K](csharpHidInterpolatedStringContent)), tsString[K]("\"")), tsSeq[K](tsString[K]("$@\""), tsRepeat[K](tsSymbol[K](csharpHidInterpolatedVerbatimStringContent)), tsString[K]("\"")), tsSeq[K](tsString[K]("@$\""), tsRepeat[K](tsSymbol[K](csharpHidInterpolatedVerbatimStringContent)), tsString[K]("\"")))
                                                                       rules[csharpHidSelectOrGroupClause] = tsChoice[K](tsSymbol[K](csharpGroupClause), tsSymbol[K](csharpSelectClause))
                                                                       rules[csharpAnonymousMethodExpression] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("delegate"), tsChoice[K](tsSymbol[K](csharpParameterList), tsBlank[K]()), tsSymbol[K](csharpBlock))
                                                                       rules[csharpFinallyClause] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](csharpBlock))
                                                                       rules[csharpGenericName] = tsSeq[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpTypeArgumentList))
                                                                       rules[csharpTypeParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsChoice[K](tsChoice[K](tsString[K]("in"), tsString[K]("out")), tsBlank[K]()), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpAccessorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsChoice[K](tsString[K]("get"), tsString[K]("set"), tsString[K]("add"), tsString[K]("remove"), tsString[K]("init"), tsSymbol[K](csharpIdentifier)), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpPrimaryConstructorBaseType] = tsSeq[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpArgumentList))
                                                                       rules[csharpUsingStatement] = tsSeq[K](tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsString[K]("using"), tsString[K]("("), tsChoice[K](tsSymbol[K](csharpVariableDeclaration), tsSymbol[K](csharpHidExpression)), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpImplicitObjectCreationExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](csharpArgumentList), tsChoice[K](tsSymbol[K](csharpInitializerExpression), tsBlank[K]()))
                                                                       rules[csharpPostfixUnaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("++")), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("--")), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("!")))
                                                                       rules[csharpUnsafeStatement] = tsSeq[K](tsString[K]("unsafe"), tsSymbol[K](csharpBlock))
                                                                       rules[csharpMemberAccessExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpHidExpression), tsSymbol[K](csharpPredefinedType), tsSymbol[K](csharpHidName)), tsChoice[K](tsString[K]("."), tsString[K]("->")), tsSymbol[K](csharpHidSimpleName))
                                                                       rules[csharpGlobal] = tsString[K]("global")
                                                                       rules[csharpIsPatternExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("is"), tsSymbol[K](csharpHidPattern))
                                                                       rules[csharpTypePattern] = tsSymbol[K](csharpHidType)
                                                                       rules[csharpStackAllocArrayCreationExpression] = tsSeq[K](tsString[K]("stackalloc"), tsSymbol[K](csharpArrayType), tsChoice[K](tsSymbol[K](csharpInitializerExpression), tsBlank[K]()))
                                                                       rules[csharpHidIdentifierOrGlobal] = tsChoice[K](tsSymbol[K](csharpGlobal), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpHidInterpolatedVerbatimStringContent] = tsChoice[K](tsSymbol[K](csharpInterpolatedVerbatimStringText), tsSymbol[K](csharpInterpolation))
                                                                       rules[csharpDefaultSwitchLabel] = tsSeq[K](tsString[K]("default"), tsString[K](":"))
                                                                       rules[csharpDestructorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsChoice[K](tsString[K]("extern"), tsBlank[K]()), tsString[K]("~"), tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpParameterList), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpPositionalPatternClause] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](csharpSubpattern), tsString[K](","), tsSeq[K](tsSymbol[K](csharpSubpattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpSubpattern))))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpCheckedExpression] = tsChoice[K](tsSeq[K](tsString[K]("checked"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")")), tsSeq[K](tsString[K]("unchecked"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")")))
                                                                       rules[csharpAttributeTargetSpecifier] = tsSeq[K](tsChoice[K](tsString[K]("field"), tsString[K]("event"), tsString[K]("method"), tsString[K]("param"), tsString[K]("property"), tsString[K]("return"), tsString[K]("type")), tsString[K](":"))
                                                                       rules[csharpNullLiteral] = tsString[K]("null")
                                                                       rules[csharpPropertyDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpExplicitInterfaceSpecifier), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSeq[K](tsSymbol[K](csharpAccessorList), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](csharpHidExpression), tsString[K](";")), tsBlank[K]())), tsSeq[K](tsSymbol[K](csharpArrowExpressionClause), tsString[K](";"))))
                                                                       rules[csharpSizeOfExpression] = tsSeq[K](tsString[K]("sizeof"), tsString[K]("("), tsSymbol[K](csharpHidType), tsString[K](")"))
                                                                       rules[csharpStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"\\\\\\n]+"), tsSymbol[K](csharpEscapeSequence))), tsString[K]("\""))
                                                                       rules[csharpVerbatimStringLiteral] = tsSeq[K](tsString[K]("@\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"]"), tsString[K]("\"\""))), tsString[K]("\""))
                                                                       rules[csharpBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("&&"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("||"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K](">>"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("<<"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("&"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("^"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("|"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("+"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("-"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("*"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("/"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("%"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("<"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("<="), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("=="), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("!="), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K](">="), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K](">"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("??"), tsSymbol[K](csharpHidExpression)))
                                                                       rules[csharpHidContextualKeywords] = tsChoice[K](tsString[K]("ascending"), tsString[K]("by"), tsString[K]("descending"), tsString[K]("equals"), tsString[K]("from"), tsString[K]("group"), tsString[K]("into"), tsString[K]("join"), tsString[K]("let"), tsString[K]("on"), tsString[K]("orderby"), tsString[K]("select"), tsString[K]("where"), tsString[K]("add"), tsString[K]("get"), tsString[K]("remove"), tsString[K]("set"), tsString[K]("global"), tsString[K]("alias"), tsString[K]("dynamic"), tsString[K]("nameof"), tsString[K]("notnull"), tsString[K]("unmanaged"), tsString[K]("when"), tsString[K]("yield"))
                                                                       rules[csharpQualifiedName] = tsSeq[K](tsSymbol[K](csharpHidName), tsString[K]("."), tsSymbol[K](csharpHidSimpleName))
                                                                       rules[csharpArrowExpressionClause] = tsSeq[K](tsString[K]("=>"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpBaseList] = tsSeq[K](tsString[K](":"), tsSeq[K](tsSymbol[K](csharpHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidType)))))
                                                                       rules[csharpFunctionPointerParameter] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("ref"), tsString[K]("out"), tsString[K]("in"), tsSeq[K](tsString[K]("ref"), tsString[K]("readonly"))), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpHidType), tsSymbol[K](csharpVoidKeyword)))
                                                                       rules[csharpInitializerExpression] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidExpression)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpWhereClause] = tsSeq[K](tsString[K]("where"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpHidOrdering] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsChoice[K](tsChoice[K](tsString[K]("ascending"), tsString[K]("descending")), tsBlank[K]()))
                                                                       rules[csharpWithInitializerExpression] = tsSeq[K](tsSymbol[K](csharpSimpleAssignmentExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpSimpleAssignmentExpression))))
                                                                       rules[csharpCastExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidType), tsString[K](")"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpTypeArgumentList] = tsSeq[K](tsString[K]("<"), tsChoice[K](tsRepeat[K](tsString[K](",")), tsSeq[K](tsSymbol[K](csharpHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidType))))), tsString[K](">"))
                                                                       rules[csharpConstantPattern] = tsSymbol[K](csharpHidExpression)
                                                                       rules[csharpBinaryPattern] = tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidPattern), tsString[K]("and"), tsSymbol[K](csharpHidPattern)), tsSeq[K](tsSymbol[K](csharpHidPattern), tsString[K]("or"), tsSymbol[K](csharpHidPattern)))
                                                                       rules[csharpHidQueryClause] = tsChoice[K](tsSymbol[K](csharpFromClause), tsSymbol[K](csharpJoinClause), tsSymbol[K](csharpLetClause), tsSymbol[K](csharpOrderByClause), tsSymbol[K](csharpWhereClause))
                                                                       rules[csharpEscapeSequence] = tsChoice[K](tsRegex[K]("\\\\x[0-9a-fA-F][0-9a-fA-F]?[0-9a-fA-F]?[0-9a-fA-F]?"), tsRegex[K]("\\\\u[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]"), tsRegex[K]("\\\\U[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]"), tsRegex[K]("\\\\[^xuU]"))
                                                                       rules[csharpDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](csharpHidDeclaration)), tsString[K]("}"))
                                                                       rules[csharpParameterModifier] = tsChoice[K](tsString[K]("ref"), tsString[K]("out"), tsString[K]("this"), tsString[K]("in"))
                                                                       rules[csharpCatchFilterClause] = tsSeq[K](tsString[K]("when"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"))
                                                                       rules[csharpDeclarationPattern] = tsSeq[K](tsSymbol[K](csharpHidType), tsSymbol[K](csharpHidVariableDesignation))
                                                                       rules[csharpArrayCreationExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](csharpArrayType), tsChoice[K](tsSymbol[K](csharpInitializerExpression), tsBlank[K]()))
                                                                       rules[csharpTypeParameterConstraint] = tsChoice[K](tsSeq[K](tsString[K]("class"), tsChoice[K](tsString[K]("?"), tsBlank[K]())), tsString[K]("struct"), tsString[K]("notnull"), tsString[K]("unmanaged"), tsSymbol[K](csharpConstructorConstraint), tsSymbol[K](csharpTypeConstraint))
                                                                       rules[csharpAttribute] = tsSeq[K](tsSymbol[K](csharpHidName), tsChoice[K](tsSymbol[K](csharpAttributeArgumentList), tsBlank[K]()))
                                                                       rules[csharpConstructorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpParameterList), tsChoice[K](tsSymbol[K](csharpConstructorInitializer), tsBlank[K]()), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpHidAnonymousObjectMemberDeclarator] = tsChoice[K](tsSeq[K](tsSymbol[K](csharpNameEquals), tsSymbol[K](csharpHidExpression)), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpReturnType] = tsChoice[K](tsSymbol[K](csharpHidType), tsSymbol[K](csharpVoidKeyword))
                                                                       rules[csharpCatchClause] = tsSeq[K](tsString[K]("catch"), tsChoice[K](tsSymbol[K](csharpCatchDeclaration), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpCatchFilterClause), tsBlank[K]()), tsSymbol[K](csharpBlock))
                                                                       rules[csharpInvocationExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsSymbol[K](csharpArgumentList))
                                                                       rules[csharpSimpleAssignmentExpression] = tsSeq[K](tsSymbol[K](csharpIdentifier), tsString[K]("="), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpHidName] = tsChoice[K](tsSymbol[K](csharpAliasQualifiedName), tsSymbol[K](csharpQualifiedName), tsSymbol[K](csharpHidSimpleName))
                                                                       rules[csharpRefExpression] = tsSeq[K](tsString[K]("ref"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpArrayRankSpecifier] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]())))), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[csharpAssignmentExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsSymbol[K](csharpAssignmentOperator), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](csharpHidStatement), tsString[K]("while"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"), tsString[K](";"))
                                                                       rules[csharpRefType] = tsSeq[K](tsString[K]("ref"), tsChoice[K](tsString[K]("readonly"), tsBlank[K]()), tsSymbol[K](csharpHidType))
                                                                       rules[csharpParameterArray] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsString[K]("params"), tsChoice[K](tsSymbol[K](csharpArrayType), tsSymbol[K](csharpNullableType)), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpVariableDeclaration] = tsSeq[K](tsSymbol[K](csharpHidType), tsSeq[K](tsSymbol[K](csharpVariableDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpVariableDeclarator)))))
                                                                       rules[csharpLetClause] = tsSeq[K](tsString[K]("let"), tsSymbol[K](csharpIdentifier), tsString[K]("="), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpConstructorConstraint] = tsSeq[K](tsString[K]("new"), tsString[K]("("), tsString[K](")"))
                                                                       rules[csharpSwitchSection] = tsSeq[K](tsRepeat1[K](tsChoice[K](tsSymbol[K](csharpCaseSwitchLabel), tsSymbol[K](csharpCasePatternSwitchLabel), tsSymbol[K](csharpDefaultSwitchLabel))), tsRepeat1[K](tsSymbol[K](csharpHidStatement)))
                                                                       rules[csharpCheckedStatement] = tsSeq[K](tsChoice[K](tsString[K]("checked"), tsString[K]("unchecked")), tsSymbol[K](csharpBlock))
                                                                       rules[csharpCharacterLiteral] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsRegex[K]("[^\'\\\\]"), tsSymbol[K](csharpEscapeSequence)), tsString[K]("\'"))
                                                                       rules[csharpEventFieldDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("event"), tsSymbol[K](csharpVariableDeclaration), tsString[K](";"))
                                                                       rules[csharpRelationalPattern] = tsChoice[K](tsSeq[K](tsString[K]("<"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K]("<="), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K](">"), tsSymbol[K](csharpHidExpression)), tsSeq[K](tsString[K](">="), tsSymbol[K](csharpHidExpression)))
                                                                       rules[csharpImplicitType] = tsString[K]("var")
                                                                       rules[csharpConstructorInitializer] = tsSeq[K](tsString[K](":"), tsChoice[K](tsString[K]("base"), tsString[K]("this")), tsSymbol[K](csharpArgumentList))
                                                                       rules[csharpReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()), tsString[K](";"))
                                                                       rules[csharpEventDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("event"), tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpExplicitInterfaceSpecifier), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpAccessorList), tsString[K](";")))
                                                                       rules[csharpHidExpression] = tsChoice[K](tsSymbol[K](csharpAnonymousMethodExpression), tsSymbol[K](csharpAnonymousObjectCreationExpression), tsSymbol[K](csharpArrayCreationExpression), tsSymbol[K](csharpAsExpression), tsSymbol[K](csharpAssignmentExpression), tsSymbol[K](csharpAwaitExpression), tsSymbol[K](csharpBaseExpression), tsSymbol[K](csharpBinaryExpression), tsSymbol[K](csharpCastExpression), tsSymbol[K](csharpCheckedExpression), tsSymbol[K](csharpConditionalAccessExpression), tsSymbol[K](csharpConditionalExpression), tsSymbol[K](csharpDefaultExpression), tsSymbol[K](csharpElementAccessExpression), tsSymbol[K](csharpElementBindingExpression), tsSymbol[K](csharpImplicitArrayCreationExpression), tsSymbol[K](csharpImplicitObjectCreationExpression), tsSymbol[K](csharpImplicitStackAllocArrayCreationExpression), tsSymbol[K](csharpInitializerExpression), tsSymbol[K](csharpInterpolatedStringExpression), tsSymbol[K](csharpInvocationExpression), tsSymbol[K](csharpIsExpression), tsSymbol[K](csharpIsPatternExpression), tsSymbol[K](csharpLambdaExpression), tsSymbol[K](csharpMakeRefExpression), tsSymbol[K](csharpMemberAccessExpression), tsSymbol[K](csharpObjectCreationExpression), tsSymbol[K](csharpParenthesizedExpression), tsSymbol[K](csharpPostfixUnaryExpression), tsSymbol[K](csharpPrefixUnaryExpression), tsSymbol[K](csharpQueryExpression), tsSymbol[K](csharpRangeExpression), tsSymbol[K](csharpRefExpression), tsSymbol[K](csharpRefTypeExpression), tsSymbol[K](csharpRefValueExpression), tsSymbol[K](csharpSizeOfExpression), tsSymbol[K](csharpStackAllocArrayCreationExpression), tsSymbol[K](csharpSwitchExpression), tsSymbol[K](csharpThisExpression), tsSymbol[K](csharpThrowExpression), tsSymbol[K](csharpTupleExpression), tsSymbol[K](csharpTypeOfExpression), tsSymbol[K](csharpWithExpression), tsSymbol[K](csharpHidSimpleName), tsSymbol[K](csharpHidLiteral))
                                                                       rules[csharpIsExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("is"), tsSymbol[K](csharpHidType))
                                                                       rules[csharpVoidKeyword] = tsString[K]("void")
                                                                       rules[csharpGlobalStatement] = tsSymbol[K](csharpHidStatement)
                                                                       rules[csharpLocalFunctionStatement] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpReturnType), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsSymbol[K](csharpParameterList), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")")), tsSymbol[K](csharpTupleExpression)), tsSymbol[K](csharpSwitchBody))
                                                                       rules[csharpSubpattern] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpNameColon), tsBlank[K]()), tsSymbol[K](csharpHidPattern))
                                                                       rules[csharpHidQueryBody] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpHidQueryClause)), tsSymbol[K](csharpHidSelectOrGroupClause), tsChoice[K](tsSymbol[K](csharpQueryContinuation), tsBlank[K]()))
                                                                       rules[csharpHidOverloadableOperator] = tsChoice[K](tsString[K]("!"), tsString[K]("~"), tsString[K]("++"), tsString[K]("--"), tsString[K]("true"), tsString[K]("false"), tsString[K]("+"), tsString[K]("-"), tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("^"), tsString[K]("|"), tsString[K]("&"), tsString[K]("<<"), tsString[K](">>"), tsString[K]("=="), tsString[K]("!="), tsString[K](">"), tsString[K]("<"), tsString[K](">="), tsString[K]("<="))
                                                                       rules[csharpOrderByClause] = tsSeq[K](tsString[K]("orderby"), tsSeq[K](tsSymbol[K](csharpHidOrdering), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidOrdering)))))
                                                                       rules[csharpClassDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("class"), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpBaseList), tsBlank[K]()), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpDeclarationList), tsChoice[K](tsString[K](";"), tsBlank[K]()))
                                                                       rules[csharpRecordDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("record"), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpRecordBase), tsBlank[K]()), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpHidRecordBase))
                                                                       rules[csharpTupleExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpArgument), tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpArgument))), tsString[K](")"))
                                                                       rules[csharpBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](csharpHidStatement)), tsString[K]("}"))
                                                                       rules[csharpFunctionPointerType] = tsSeq[K](tsString[K]("delegate"), tsString[K]("*"), tsChoice[K](tsSymbol[K](csharpFunctionPointerCallingConvention), tsBlank[K]()), tsString[K]("<"), tsSeq[K](tsSymbol[K](csharpFunctionPointerParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpFunctionPointerParameter)))), tsString[K](">"))
                                                                       rules[csharpRefTypeExpression] = tsSeq[K](tsString[K]("__reftype"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"))
                                                                       rules[csharpAwaitExpression] = tsSeq[K](tsString[K]("await"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpHidVariableDesignation] = tsChoice[K](tsSymbol[K](csharpDiscard), tsSymbol[K](csharpParenthesizedVariableDesignation), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpTypeConstraint] = tsSymbol[K](csharpHidType)
                                                                       rules[csharpDefaultExpression] = tsSeq[K](tsString[K]("default"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidType), tsString[K](")")), tsBlank[K]()))
                                                                       rules[csharpFunctionPointerUnmanagedCallingConventionList] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](csharpFunctionPointerUnmanagedCallingConvention), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpFunctionPointerUnmanagedCallingConvention)))), tsString[K]("]"))
                                                                       rules[csharpInterfaceDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("interface"), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpBaseList), tsBlank[K]()), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsSymbol[K](csharpDeclarationList), tsChoice[K](tsString[K](";"), tsBlank[K]()))
                                                                       rules[csharpTypeParameterList] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsSymbol[K](csharpTypeParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpTypeParameter)))), tsString[K](">"))
                                                                       rules[csharpRangeExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()), tsString[K](".."), tsChoice[K](tsSymbol[K](csharpHidExpression), tsBlank[K]()))
                                                                       rules[csharpInterpolatedVerbatimStringText] = tsChoice[K](tsString[K]("{{"), tsRegex[K]("[^{\"]+"), tsString[K]("\"\""))
                                                                       rules[csharpDelegateDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("delegate"), tsSymbol[K](csharpReturnType), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpTypeParameterList), tsBlank[K]()), tsSymbol[K](csharpParameterList), tsRepeat[K](tsSymbol[K](csharpTypeParameterConstraintsClause)), tsString[K](";"))
                                                                       rules[csharpHidTypeDeclaration] = tsChoice[K](tsSymbol[K](csharpClassDeclaration), tsSymbol[K](csharpStructDeclaration), tsSymbol[K](csharpInterfaceDeclaration), tsSymbol[K](csharpEnumDeclaration), tsSymbol[K](csharpDelegateDeclaration), tsSymbol[K](csharpRecordDeclaration))
                                                                       rules[csharpAttributeList] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](csharpAttributeTargetSpecifier), tsBlank[K]()), tsSeq[K](tsSymbol[K](csharpAttribute), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpAttribute)))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[csharpHidStatement] = tsChoice[K](tsSymbol[K](csharpBlock), tsSymbol[K](csharpBreakStatement), tsSymbol[K](csharpCheckedStatement), tsSymbol[K](csharpContinueStatement), tsSymbol[K](csharpDoStatement), tsSymbol[K](csharpEmptyStatement), tsSymbol[K](csharpExpressionStatement), tsSymbol[K](csharpFixedStatement), tsSymbol[K](csharpForEachStatement), tsSymbol[K](csharpForStatement), tsSymbol[K](csharpGotoStatement), tsSymbol[K](csharpIfStatement), tsSymbol[K](csharpLabeledStatement), tsSymbol[K](csharpLocalDeclarationStatement), tsSymbol[K](csharpLocalFunctionStatement), tsSymbol[K](csharpLockStatement), tsSymbol[K](csharpReturnStatement), tsSymbol[K](csharpSwitchStatement), tsSymbol[K](csharpThrowStatement), tsSymbol[K](csharpTryStatement), tsSymbol[K](csharpUnsafeStatement), tsSymbol[K](csharpUsingStatement), tsSymbol[K](csharpWhileStatement), tsSymbol[K](csharpYieldStatement))
                                                                       rules[csharpIdentifier] = tsChoice[K](tsSymbol[K](csharpHidIdentifierToken), tsSymbol[K](csharpHidContextualKeywords))
                                                                       rules[csharpConversionOperatorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsChoice[K](tsString[K]("implicit"), tsString[K]("explicit")), tsString[K]("operator"), tsSymbol[K](csharpHidType), tsSymbol[K](csharpParameterList), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpAttributeArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](csharpAttributeArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpAttributeArgument)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpHidPattern] = tsChoice[K](tsSymbol[K](csharpConstantPattern), tsSymbol[K](csharpDeclarationPattern), tsSymbol[K](csharpDiscard), tsSymbol[K](csharpRecursivePattern), tsSymbol[K](csharpVarPattern), tsSymbol[K](csharpNegatedPattern), tsSymbol[K](csharpParenthesizedPattern), tsSymbol[K](csharpRelationalPattern), tsSymbol[K](csharpBinaryPattern), tsSymbol[K](csharpTypePattern))
                                                                       rules[csharpRecordBase] = tsChoice[K](tsSeq[K](tsString[K](":"), tsSeq[K](tsSymbol[K](csharpIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpIdentifier))))), tsSeq[K](tsString[K](":"), tsSymbol[K](csharpPrimaryConstructorBaseType), tsChoice[K](tsSeq[K](tsString[K](","), tsSeq[K](tsSymbol[K](csharpIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpIdentifier))))), tsBlank[K]())))
                                                                       rules[csharpFunctionPointerCallingConvention] = tsChoice[K](tsString[K]("managed"), tsSeq[K](tsString[K]("unmanaged"), tsChoice[K](tsSymbol[K](csharpFunctionPointerUnmanagedCallingConventionList), tsBlank[K]())))
                                                                       rules[csharpHidNamespaceMemberDeclaration] = tsChoice[K](tsSymbol[K](csharpNamespaceDeclaration), tsSymbol[K](csharpHidTypeDeclaration))
                                                                       rules[csharpFieldDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpVariableDeclaration), tsString[K](";"))
                                                                       rules[csharpUsingDirective] = tsSeq[K](tsString[K]("using"), tsChoice[K](tsChoice[K](tsString[K]("static"), tsSymbol[K](csharpNameEquals)), tsBlank[K]()), tsSymbol[K](csharpHidName), tsString[K](";"))
                                                                       rules[csharpParameterList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](csharpHidFormalParameterList), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpTypeParameterConstraintsClause] = tsSeq[K](tsString[K]("where"), tsSymbol[K](csharpHidIdentifierOrGlobal), tsString[K](":"), tsSeq[K](tsSymbol[K](csharpTypeParameterConstraint), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpTypeParameterConstraint)))))
                                                                       rules[csharpNameColon] = tsSeq[K](tsSymbol[K](csharpHidIdentifierOrGlobal), tsString[K](":"))
                                                                       rules[csharpHidRecordBase] = tsChoice[K](tsSymbol[K](csharpDeclarationList), tsString[K](";"))
                                                                       rules[csharpYieldStatement] = tsSeq[K](tsString[K]("yield"), tsChoice[K](tsSeq[K](tsString[K]("return"), tsSymbol[K](csharpHidExpression)), tsString[K]("break")), tsString[K](";"))
                                                                       rules[csharpImplicitStackAllocArrayCreationExpression] = tsSeq[K](tsString[K]("stackalloc"), tsString[K]("["), tsString[K]("]"), tsSymbol[K](csharpInitializerExpression))
                                                                       rules[csharpRefValueExpression] = tsSeq[K](tsString[K]("__refvalue"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](","), tsSymbol[K](csharpHidType), tsString[K](")"))
                                                                       rules[csharpHidSimpleName] = tsChoice[K](tsSymbol[K](csharpGenericName), tsSymbol[K](csharpHidIdentifierOrGlobal))
                                                                       rules[csharpLabeledStatement] = tsSeq[K](tsSymbol[K](csharpIdentifier), tsString[K](":"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpLocalDeclarationStatement] = tsSeq[K](tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsChoice[K](tsString[K]("using"), tsBlank[K]()), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpVariableDeclaration), tsString[K](";"))
                                                                       rules[csharpParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"))
                                                                       rules[csharpLockStatement] = tsSeq[K](tsString[K]("lock"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpEnumDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsString[K]("enum"), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpBaseList), tsBlank[K]()), tsSymbol[K](csharpEnumMemberDeclarationList), tsChoice[K](tsString[K](";"), tsBlank[K]()))
                                                                       rules[csharpFunctionPointerUnmanagedCallingConvention] = tsChoice[K](tsString[K]("Cdecl"), tsString[K]("Stdcall"), tsString[K]("Thiscall"), tsString[K]("Fastcall"), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpOperatorDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsRepeat[K](tsSymbol[K](csharpModifier)), tsSymbol[K](csharpHidType), tsString[K]("operator"), tsSymbol[K](csharpHidOverloadableOperator), tsSymbol[K](csharpParameterList), tsSymbol[K](csharpHidFunctionBody))
                                                                       rules[csharpParenthesizedPattern] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpHidPattern), tsString[K](")"))
                                                                       rules[csharpAsExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("as"), tsSymbol[K](csharpHidType))
                                                                       rules[csharpHidLiteral] = tsChoice[K](tsSymbol[K](csharpNullLiteral), tsSymbol[K](csharpBooleanLiteral), tsSymbol[K](csharpCharacterLiteral), tsSymbol[K](csharpRealLiteral), tsSymbol[K](csharpIntegerLiteral), tsSymbol[K](csharpStringLiteral), tsSymbol[K](csharpVerbatimStringLiteral))
                                                                       rules[csharpParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](csharpAttributeList)), tsChoice[K](tsSymbol[K](csharpParameterModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpHidType), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsChoice[K](tsSymbol[K](csharpEqualsValueClause), tsBlank[K]()))
                                                                       rules[csharpWhileStatement] = tsSeq[K](tsString[K]("while"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpHidType] = tsChoice[K](tsSymbol[K](csharpImplicitType), tsSymbol[K](csharpArrayType), tsSymbol[K](csharpHidName), tsSymbol[K](csharpNullableType), tsSymbol[K](csharpPointerType), tsSymbol[K](csharpFunctionPointerType), tsSymbol[K](csharpPredefinedType), tsSymbol[K](csharpTupleType))
                                                                       rules[csharpPredefinedType] = tsChoice[K](tsString[K]("bool"), tsString[K]("byte"), tsString[K]("char"), tsString[K]("decimal"), tsString[K]("double"), tsString[K]("float"), tsString[K]("int"), tsString[K]("long"), tsString[K]("object"), tsString[K]("sbyte"), tsString[K]("short"), tsString[K]("string"), tsString[K]("uint"), tsString[K]("ulong"), tsString[K]("ushort"), tsString[K]("nint"), tsString[K]("nuint"))
                                                                       rules[csharpObjectCreationExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpArgumentList), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpInitializerExpression), tsBlank[K]()))
                                                                       rules[csharpBaseExpression] = tsString[K]("base")
                                                                       rules[csharpMemberBindingExpression] = tsSeq[K](tsString[K]("."), tsSymbol[K](csharpHidSimpleName))
                                                                       rules[csharpTryStatement] = tsSeq[K](tsString[K]("try"), tsSymbol[K](csharpBlock), tsRepeat[K](tsSymbol[K](csharpCatchClause)), tsChoice[K](tsSymbol[K](csharpFinallyClause), tsBlank[K]()))
                                                                       rules[csharpConditionalAccessExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("?"), tsChoice[K](tsSymbol[K](csharpMemberBindingExpression), tsSymbol[K](csharpElementBindingExpression)))
                                                                       rules[csharpJoinIntoClause] = tsSeq[K](tsString[K]("into"), tsSymbol[K](csharpIdentifier))
                                                                       rules[csharpTypeOfExpression] = tsSeq[K](tsString[K]("typeof"), tsString[K]("("), tsSymbol[K](csharpHidType), tsString[K](")"))
                                                                       rules[csharpConditionalExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("?"), tsSymbol[K](csharpHidExpression), tsString[K](":"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpThisExpression] = tsString[K]("this")
                                                                       rules[csharpNullableType] = tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidType), tsString[K]("?")), tsSeq[K](tsSymbol[K](csharpHidType), tsString[K]("?")))
                                                                       rules[csharpBreakStatement] = tsSeq[K](tsString[K]("break"), tsString[K](";"))
                                                                       rules[csharpCasePatternSwitchLabel] = tsSeq[K](tsString[K]("case"), tsSymbol[K](csharpHidPattern), tsChoice[K](tsSymbol[K](csharpWhenClause), tsBlank[K]()), tsString[K](":"))
                                                                       rules[csharpPreprocessorDirective] = tsRegex[K]("#[ \\t]*[a-z]\\w*")
                                                                       rules[csharpElementAccessExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsSymbol[K](csharpBracketedArgumentList))
                                                                       rules[csharpMakeRefExpression] = tsSeq[K](tsString[K]("__makeref"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"))
                                                                       rules[csharpIntegerLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsRegex[K]("0[xX][0-9a-fA-F_]*[0-9a-fA-F]+"), tsRegex[K]("0[bB][01_]*[01]+")), tsChoice[K](tsRegex[K]("u|U|l|L|ul|UL|uL|Ul|lu|LU|Lu|lU"), tsBlank[K]()))
                                                                       rules[csharpArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](csharpArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpArgument)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[csharpContinueStatement] = tsSeq[K](tsString[K]("continue"), tsString[K](";"))
                                                                       rules[csharpIfStatement] = tsSeq[K](tsString[K]("if"), tsString[K]("("), tsSymbol[K](csharpHidExpression), tsString[K](")"), tsSymbol[K](csharpHidStatement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](csharpHidStatement)), tsBlank[K]()))
                                                                       rules[csharpAnonymousObjectCreationExpression] = tsSeq[K](tsString[K]("new"), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidAnonymousObjectMemberDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidAnonymousObjectMemberDeclarator)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpHidInterpolatedStringContent] = tsChoice[K](tsSymbol[K](csharpInterpolatedStringText), tsSymbol[K](csharpInterpolation))
                                                                       rules[csharpSwitchBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](csharpSwitchSection)), tsString[K]("}"))
                                                                       rules[csharpThrowExpression] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpSwitchExpressionArm] = tsSeq[K](tsSymbol[K](csharpHidPattern), tsChoice[K](tsSymbol[K](csharpWhenClause), tsBlank[K]()), tsString[K]("=>"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpGlobalAttributeList] = tsSeq[K](tsString[K]("["), tsChoice[K](tsString[K]("assembly"), tsString[K]("module")), tsString[K](":"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpAttribute), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpAttribute)))), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[csharpBracketedArgumentList] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](csharpArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpArgument)))), tsString[K]("]"))
                                                                       rules[csharpTupleType] = tsSeq[K](tsString[K]("("), tsSymbol[K](csharpTupleElement), tsString[K](","), tsSeq[K](tsSymbol[K](csharpTupleElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpTupleElement)))), tsString[K](")"))
                                                                       rules[csharpExpressionStatement] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K](";"))
                                                                       rules[csharpElementBindingExpression] = tsSymbol[K](csharpBracketedArgumentList)
                                                                       rules[csharpArgument] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpNameColon), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("ref"), tsString[K]("out"), tsString[K]("in")), tsBlank[K]()), tsChoice[K](tsSymbol[K](csharpHidExpression), tsSymbol[K](csharpDeclarationExpression)))
                                                                       rules[csharpEmptyStatement] = tsString[K](";")
                                                                       rules[csharpWhenClause] = tsSeq[K](tsString[K]("when"), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpHidFunctionBody] = tsChoice[K](tsSymbol[K](csharpBlock), tsSeq[K](tsSymbol[K](csharpArrowExpressionClause), tsString[K](";")), tsString[K](";"))
                                                                       rules[csharpAliasQualifiedName] = tsSeq[K](tsSymbol[K](csharpHidIdentifierOrGlobal), tsString[K]("::"), tsSymbol[K](csharpHidSimpleName))
                                                                       rules[csharpCaseSwitchLabel] = tsSeq[K](tsString[K]("case"), tsSymbol[K](csharpHidExpression), tsString[K](":"))
                                                                       rules[csharpRealLiteral] = tsChoice[K](tsSeq[K](tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsString[K]("."), tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsChoice[K](tsRegex[K]("[eE][+-]?[0-9][0-9_]*"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[fFdDmM]"), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsChoice[K](tsRegex[K]("[eE][+-]?[0-9][0-9_]*"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[fFdDmM]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsRegex[K]("[eE][+-]?[0-9][0-9_]*"), tsChoice[K](tsRegex[K]("[fFdDmM]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("([0-9][0-9_]*[0-9]|[0-9])"), tsRegex[K]("[fFdDmM]")))
                                                                       rules[csharpPreprocessorCall] = tsSeq[K](tsSymbol[K](csharpPreprocessorDirective), tsRepeat[K](tsChoice[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpHidLiteral), tsRegex[K]("[^\\s]+"))), tsSymbol[K](csharpHidPreprocDirectiveEnd))
                                                                       rules[csharpSwitchExpression] = tsSeq[K](tsSymbol[K](csharpHidExpression), tsString[K]("switch"), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpSwitchExpressionArm), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpSwitchExpressionArm)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpRecursivePattern] = tsSeq[K](tsChoice[K](tsSymbol[K](csharpHidType), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](csharpPositionalPatternClause), tsChoice[K](tsSymbol[K](csharpPropertyPatternClause), tsBlank[K]())), tsSymbol[K](csharpPropertyPatternClause)), tsChoice[K](tsSymbol[K](csharpHidVariableDesignation), tsBlank[K]()))
                                                                       rules[csharpForEachStatement] = tsSeq[K](tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsString[K]("foreach"), tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](csharpHidType), tsChoice[K](tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpTuplePattern))), tsSymbol[K](csharpHidExpression)), tsString[K]("in"), tsSymbol[K](csharpHidExpression), tsString[K](")"), tsSymbol[K](csharpHidStatement))
                                                                       rules[csharpInterpolationAlignmentClause] = tsSeq[K](tsString[K](","), tsSymbol[K](csharpHidExpression))
                                                                       rules[csharpQueryContinuation] = tsSeq[K](tsString[K]("into"), tsSymbol[K](csharpIdentifier), tsSymbol[K](csharpHidQueryBody))
                                                                       rules[csharpPropertyPatternClause] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](csharpSubpattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](csharpSubpattern)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[csharpFromClause] = tsSeq[K](tsString[K]("from"), tsChoice[K](tsSymbol[K](csharpHidType), tsBlank[K]()), tsSymbol[K](csharpIdentifier), tsString[K]("in"), tsSymbol[K](csharpHidExpression))
                                                                       rules

