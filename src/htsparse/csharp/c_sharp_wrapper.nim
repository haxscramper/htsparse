
import
  hmisc / wrappers / treesitter

import
  strutils

type
  C_sharpNodeKind* = enum
    c_sharpDeclaration,     ## _declaration
    c_sharpExpression,      ## _expression
    c_sharpStatement,       ## _statement
    c_sharpType,            ## _type
    c_sharpAccessorDeclaration, ## accessor_declaration
    c_sharpAccessorList,    ## accessor_list
    c_sharpAliasQualifiedName, ## alias_qualified_name
    c_sharpAnonymousMethodExpression, ## anonymous_method_expression
    c_sharpAnonymousObjectCreationExpression, ## anonymous_object_creation_expression
    c_sharpArgument,        ## argument
    c_sharpArgumentList,    ## argument_list
    c_sharpArrayCreationExpression, ## array_creation_expression
    c_sharpArrayRankSpecifier, ## array_rank_specifier
    c_sharpArrayType,       ## array_type
    c_sharpArrowExpressionClause, ## arrow_expression_clause
    c_sharpAsExpression,    ## as_expression
    c_sharpAssignmentExpression, ## assignment_expression
    c_sharpAssignmentOperator, ## assignment_operator
    c_sharpAttribute,       ## attribute
    c_sharpAttributeArgument, ## attribute_argument
    c_sharpAttributeArgumentList, ## attribute_argument_list
    c_sharpAttributeList,   ## attribute_list
    c_sharpAttributeTargetSpecifier, ## attribute_target_specifier
    c_sharpAwaitExpression, ## await_expression
    c_sharpBaseExpression,  ## base_expression
    c_sharpBaseList,        ## base_list
    c_sharpBinaryExpression, ## binary_expression
    c_sharpBinaryPattern,   ## binary_pattern
    c_sharpBlock,           ## block
    c_sharpBooleanLiteral,  ## boolean_literal
    c_sharpBracketedArgumentList, ## bracketed_argument_list
    c_sharpBracketedParameterList, ## bracketed_parameter_list
    c_sharpBreakStatement,  ## break_statement
    c_sharpCasePatternSwitchLabel, ## case_pattern_switch_label
    c_sharpCaseSwitchLabel, ## case_switch_label
    c_sharpCastExpression,  ## cast_expression
    c_sharpCatchClause,     ## catch_clause
    c_sharpCatchDeclaration, ## catch_declaration
    c_sharpCatchFilterClause, ## catch_filter_clause
    c_sharpCharacterLiteral, ## character_literal
    c_sharpCheckedExpression, ## checked_expression
    c_sharpCheckedStatement, ## checked_statement
    c_sharpClassDeclaration, ## class_declaration
    c_sharpCompilationUnit, ## compilation_unit
    c_sharpConditionalAccessExpression, ## conditional_access_expression
    c_sharpConditionalExpression, ## conditional_expression
    c_sharpConstantPattern, ## constant_pattern
    c_sharpConstructorConstraint, ## constructor_constraint
    c_sharpConstructorDeclaration, ## constructor_declaration
    c_sharpConstructorInitializer, ## constructor_initializer
    c_sharpContinueStatement, ## continue_statement
    c_sharpConversionOperatorDeclaration, ## conversion_operator_declaration
    c_sharpDeclarationExpression, ## declaration_expression
    c_sharpDeclarationList, ## declaration_list
    c_sharpDeclarationPattern, ## declaration_pattern
    c_sharpDefaultExpression, ## default_expression
    c_sharpDefaultSwitchLabel, ## default_switch_label
    c_sharpDefineDirective, ## define_directive
    c_sharpDelegateDeclaration, ## delegate_declaration
    c_sharpDestructorDeclaration, ## destructor_declaration
    c_sharpDoStatement,     ## do_statement
    c_sharpElementAccessExpression, ## element_access_expression
    c_sharpElementBindingExpression, ## element_binding_expression
    c_sharpElifDirective,   ## elif_directive
    c_sharpElseDirective,   ## else_directive
    c_sharpEmptyStatement,  ## empty_statement
    c_sharpEndregionDirective, ## endregion_directive
    c_sharpEnumDeclaration, ## enum_declaration
    c_sharpEnumMemberDeclaration, ## enum_member_declaration
    c_sharpEnumMemberDeclarationList, ## enum_member_declaration_list
    c_sharpEqualsValueClause, ## equals_value_clause
    c_sharpErrorDirective,  ## error_directive
    c_sharpEventDeclaration, ## event_declaration
    c_sharpEventFieldDeclaration, ## event_field_declaration
    c_sharpExplicitInterfaceSpecifier, ## explicit_interface_specifier
    c_sharpExpressionStatement, ## expression_statement
    c_sharpExternAliasDirective, ## extern_alias_directive
    c_sharpFieldDeclaration, ## field_declaration
    c_sharpFinallyClause,   ## finally_clause
    c_sharpFixedStatement,  ## fixed_statement
    c_sharpForEachStatement, ## for_each_statement
    c_sharpForStatement,    ## for_statement
    c_sharpFromClause,      ## from_clause
    c_sharpFunctionPointerCallingConvention, ## function_pointer_calling_convention
    c_sharpFunctionPointerParameter, ## function_pointer_parameter
    c_sharpFunctionPointerType, ## function_pointer_type
    c_sharpFunctionPointerUnmanagedCallingConvention, ## function_pointer_unmanaged_calling_convention
    c_sharpFunctionPointerUnmanagedCallingConventionList, ## function_pointer_unmanaged_calling_convention_list
    c_sharpGenericName,     ## generic_name
    c_sharpGlobal,          ## global
    c_sharpGlobalAttributeList, ## global_attribute_list
    c_sharpGlobalStatement, ## global_statement
    c_sharpGotoStatement,   ## goto_statement
    c_sharpGroupClause,     ## group_clause
    c_sharpIdentifier,      ## identifier
    c_sharpIfDirective,     ## if_directive
    c_sharpIfStatement,     ## if_statement
    c_sharpImplicitArrayCreationExpression, ## implicit_array_creation_expression
    c_sharpImplicitObjectCreationExpression, ## implicit_object_creation_expression
    c_sharpImplicitStackAllocArrayCreationExpression, ## implicit_stack_alloc_array_creation_expression
    c_sharpImplicitType,    ## implicit_type
    c_sharpIndexerDeclaration, ## indexer_declaration
    c_sharpInitializerExpression, ## initializer_expression
    c_sharpInterfaceDeclaration, ## interface_declaration
    c_sharpInterpolatedStringExpression, ## interpolated_string_expression
    c_sharpInterpolatedStringText, ## interpolated_string_text
    c_sharpInterpolatedVerbatimStringText, ## interpolated_verbatim_string_text
    c_sharpInterpolation,   ## interpolation
    c_sharpInterpolationAlignmentClause, ## interpolation_alignment_clause
    c_sharpInterpolationFormatClause, ## interpolation_format_clause
    c_sharpInvocationExpression, ## invocation_expression
    c_sharpIsExpression,    ## is_expression
    c_sharpIsPatternExpression, ## is_pattern_expression
    c_sharpJoinClause,      ## join_clause
    c_sharpJoinIntoClause,  ## join_into_clause
    c_sharpLabelName,       ## label_name
    c_sharpLabeledStatement, ## labeled_statement
    c_sharpLambdaExpression, ## lambda_expression
    c_sharpLetClause,       ## let_clause
    c_sharpLineDirective,   ## line_directive
    c_sharpLocalDeclarationStatement, ## local_declaration_statement
    c_sharpLocalFunctionStatement, ## local_function_statement
    c_sharpLockStatement,   ## lock_statement
    c_sharpMakeRefExpression, ## make_ref_expression
    c_sharpMemberAccessExpression, ## member_access_expression
    c_sharpMemberBindingExpression, ## member_binding_expression
    c_sharpMethodDeclaration, ## method_declaration
    c_sharpModifier,        ## modifier
    c_sharpNameColon,       ## name_colon
    c_sharpNameEquals,      ## name_equals
    c_sharpNamespaceDeclaration, ## namespace_declaration
    c_sharpNegatedPattern,  ## negated_pattern
    c_sharpNullableDirective, ## nullable_directive
    c_sharpNullableType,    ## nullable_type
    c_sharpObjectCreationExpression, ## object_creation_expression
    c_sharpOperatorDeclaration, ## operator_declaration
    c_sharpOrderByClause,   ## order_by_clause
    c_sharpParameter,       ## parameter
    c_sharpParameterArray,  ## parameter_array
    c_sharpParameterList,   ## parameter_list
    c_sharpParameterModifier, ## parameter_modifier
    c_sharpParenthesizedExpression, ## parenthesized_expression
    c_sharpParenthesizedPattern, ## parenthesized_pattern
    c_sharpParenthesizedVariableDesignation, ## parenthesized_variable_designation
    c_sharpPointerType,     ## pointer_type
    c_sharpPositionalPatternClause, ## positional_pattern_clause
    c_sharpPostfixUnaryExpression, ## postfix_unary_expression
    c_sharpPragmaDirective, ## pragma_directive
    c_sharpPrefixUnaryExpression, ## prefix_unary_expression
    c_sharpPrimaryConstructorBaseType, ## primary_constructor_base_type
    c_sharpPropertyDeclaration, ## property_declaration
    c_sharpPropertyPatternClause, ## property_pattern_clause
    c_sharpQualifiedName,   ## qualified_name
    c_sharpQueryContinuation, ## query_continuation
    c_sharpQueryExpression, ## query_expression
    c_sharpRangeExpression, ## range_expression
    c_sharpRecordDeclaration, ## record_declaration
    c_sharpRecursivePattern, ## recursive_pattern
    c_sharpRefExpression,   ## ref_expression
    c_sharpRefTypeExpression, ## ref_type_expression
    c_sharpRefValueExpression, ## ref_value_expression
    c_sharpRegionDirective, ## region_directive
    c_sharpRelationalPattern, ## relational_pattern
    c_sharpReturnStatement, ## return_statement
    c_sharpSelectClause,    ## select_clause
    c_sharpSimpleAssignmentExpression, ## simple_assignment_expression
    c_sharpSizeOfExpression, ## size_of_expression
    c_sharpStackAllocArrayCreationExpression, ## stack_alloc_array_creation_expression
    c_sharpStringLiteral,   ## string_literal
    c_sharpStructDeclaration, ## struct_declaration
    c_sharpSubpattern,      ## subpattern
    c_sharpSwitchBody,      ## switch_body
    c_sharpSwitchExpression, ## switch_expression
    c_sharpSwitchExpressionArm, ## switch_expression_arm
    c_sharpSwitchSection,   ## switch_section
    c_sharpSwitchStatement, ## switch_statement
    c_sharpThisExpression,  ## this_expression
    c_sharpThrowExpression, ## throw_expression
    c_sharpThrowStatement,  ## throw_statement
    c_sharpTryStatement,    ## try_statement
    c_sharpTupleElement,    ## tuple_element
    c_sharpTupleExpression, ## tuple_expression
    c_sharpTuplePattern,    ## tuple_pattern
    c_sharpTupleType,       ## tuple_type
    c_sharpTypeArgumentList, ## type_argument_list
    c_sharpTypeConstraint,  ## type_constraint
    c_sharpTypeOfExpression, ## type_of_expression
    c_sharpTypeParameter,   ## type_parameter
    c_sharpTypeParameterConstraint, ## type_parameter_constraint
    c_sharpTypeParameterConstraintsClause, ## type_parameter_constraints_clause
    c_sharpTypeParameterList, ## type_parameter_list
    c_sharpTypePattern,     ## type_pattern
    c_sharpUndefDirective,  ## undef_directive
    c_sharpUnsafeStatement, ## unsafe_statement
    c_sharpUsingDirective,  ## using_directive
    c_sharpUsingStatement,  ## using_statement
    c_sharpVarPattern,      ## var_pattern
    c_sharpVariableDeclaration, ## variable_declaration
    c_sharpVariableDeclarator, ## variable_declarator
    c_sharpWarningDirective, ## warning_directive
    c_sharpWhenClause,      ## when_clause
    c_sharpWhereClause,     ## where_clause
    c_sharpWhileStatement,  ## while_statement
    c_sharpWithExpression,  ## with_expression
    c_sharpWithInitializerExpression, ## with_initializer_expression
    c_sharpYieldStatement,  ## yield_statement
    c_sharpExclamationTok,  ## !
    c_sharpExclamationEqualTok, ## !=
    c_sharpQuoteTok,        ## "
    c_sharpDoubleQuoteTok,  ## ""
    c_sharpDollarQuoteTok,  ## $"
    c_sharpDollarAtQuoteTok, ## $@"
    c_sharpPercentTok,      ## %
    c_sharpPercentEqualTok, ## %=
    c_sharpAmpersandTok,    ## &
    c_sharpDoubleAmpersandTok, ## &&
    c_sharpAmpersandEqualTok, ## &=
    c_sharpApostropheTok,   ## '
    c_sharpLParTok,         ## (
    c_sharpRParTok,         ## )
    c_sharpAsteriskTok,     ## *
    c_sharpAsteriskEqualTok, ## *=
    c_sharpPlusTok,         ## +
    c_sharpDoublePlusTok,   ## ++
    c_sharpPlusEqualTok,    ## +=
    c_sharpCommaTok,        ## ,
    c_sharpMinusTok,        ## -
    c_sharpDoubleMinusTok,  ## --
    c_sharpMinusEqualTok,   ## -=
    c_sharpMinusGreaterThanTok, ## ->
    c_sharpDotTok,          ## .
    c_sharpDoubleDotTok,    ## ..
    c_sharpSlashTok,        ## /
    c_sharpSlashEqualTok,   ## /=
    c_sharpColonTok,        ## :
    c_sharpDoubleColonTok,  ## ::
    c_sharpSemicolonTok,    ## ;
    c_sharpLessThanTok,     ## <
    c_sharpDoubleLessThanTok, ## <<
    c_sharpDoubleLessThanEqualTok, ## <<=
    c_sharpLessThanEqualTok, ## <=
    c_sharpEqualTok,        ## =
    c_sharpDoubleEqualTok,  ## ==
    c_sharpEqualGreaterThanTok, ## =>
    c_sharpGreaterThanTok,  ## >
    c_sharpGreaterThanEqualTok, ## >=
    c_sharpDoubleGreaterThanTok, ## >>
    c_sharpDoubleGreaterThanEqualTok, ## >>=
    c_sharpQuestionTok,     ## ?
    c_sharpDoubleQuestionTok, ## ??
    c_sharpDoubleQuestionEqualTok, ## ??=
    c_sharpAtDollarQuoteTok, ## @$"
    c_sharpCdeclTok,        ## Cdecl
    c_sharpFastcallTok,     ## Fastcall
    c_sharpStdcallTok,      ## Stdcall
    c_sharpThiscallTok,     ## Thiscall
    c_sharpLBrackTok,       ## [
    c_sharpRBrackTok,       ## ]
    c_sharpAccentTok,       ## ^
    c_sharpAccentEqualTok,  ## ^=
    c_sharpMakerefTok,      ## __makeref
    c_sharpReftypeTok,      ## __reftype
    c_sharpRefvalueTok,     ## __refvalue
    c_sharpAbstractTok,     ## abstract
    c_sharpAddTok,          ## add
    c_sharpAliasTok,        ## alias
    c_sharpAndTok,          ## and
    c_sharpAnnotationsTok,  ## annotations
    c_sharpAsTok,           ## as
    c_sharpAscendingTok,    ## ascending
    c_sharpAssemblyTok,     ## assembly
    c_sharpAsyncTok,        ## async
    c_sharpAwaitTok,        ## await
    c_sharpBaseTok,         ## base
    c_sharpBreakTok,        ## break
    c_sharpByTok,           ## by
    c_sharpCaseTok,         ## case
    c_sharpCatchTok,        ## catch
    c_sharpCheckedTok,      ## checked
    c_sharpChecksumTok,     ## checksum
    c_sharpClassTok,        ## class
    c_sharpComment,         ## comment
    c_sharpConstTok,        ## const
    c_sharpContinueTok,     ## continue
    c_sharpDefaultTok,      ## default
    c_sharpDefineTok,       ## define
    c_sharpDelegateTok,     ## delegate
    c_sharpDescendingTok,   ## descending
    c_sharpDisableTok,      ## disable
    c_sharpDiscard,         ## discard
    c_sharpDoTok,           ## do
    c_sharpDynamicTok,      ## dynamic
    c_sharpElifTok,         ## elif
    c_sharpElseTok,         ## else
    c_sharpEnableTok,       ## enable
    c_sharpEndifDirective,  ## endif_directive
    c_sharpEndregionTok,    ## endregion
    c_sharpEnumTok,         ## enum
    c_sharpEqualsTok,       ## equals
    c_sharpErrorTok,        ## error
    c_sharpEscapeSequence,  ## escape_sequence
    c_sharpEventTok,        ## event
    c_sharpExplicitTok,     ## explicit
    c_sharpExternTok,       ## extern
    c_sharpFalseTok,        ## false
    c_sharpFieldTok,        ## field
    c_sharpFinallyTok,      ## finally
    c_sharpFixedTok,        ## fixed
    c_sharpForTok,          ## for
    c_sharpForeachTok,      ## foreach
    c_sharpFromTok,         ## from
    c_sharpGetTok,          ## get
    c_sharpGlobalTok,       ## global
    c_sharpGotoTok,         ## goto
    c_sharpGroupTok,        ## group
    c_sharpHiddenTok,       ## hidden
    c_sharpIfTok,           ## if
    c_sharpImplicitTok,     ## implicit
    c_sharpInTok,           ## in
    c_sharpInitTok,         ## init
    c_sharpIntegerLiteral,  ## integer_literal
    c_sharpInterfaceTok,    ## interface
    c_sharpInternalTok,     ## internal
    c_sharpIntoTok,         ## into
    c_sharpIsTok,           ## is
    c_sharpJoinTok,         ## join
    c_sharpLetTok,          ## let
    c_sharpLineTok,         ## line
    c_sharpLockTok,         ## lock
    c_sharpManagedTok,      ## managed
    c_sharpMethodTok,       ## method
    c_sharpModuleTok,       ## module
    c_sharpNameofTok,       ## nameof
    c_sharpNamespaceTok,    ## namespace
    c_sharpNewTok,          ## new
    c_sharpNotTok,          ## not
    c_sharpNotnullTok,      ## notnull
    c_sharpNullLiteral,     ## null_literal
    c_sharpNullableTok,     ## nullable
    c_sharpOnTok,           ## on
    c_sharpOperatorTok,     ## operator
    c_sharpOrTok,           ## or
    c_sharpOrderbyTok,      ## orderby
    c_sharpOutTok,          ## out
    c_sharpOverrideTok,     ## override
    c_sharpParamTok,        ## param
    c_sharpParamsTok,       ## params
    c_sharpPartialTok,      ## partial
    c_sharpPragmaTok,       ## pragma
    c_sharpPredefinedType,  ## predefined_type
    c_sharpPreprocIntegerLiteral, ## preproc_integer_literal
    c_sharpPreprocMessage,  ## preproc_message
    c_sharpPreprocStringLiteral, ## preproc_string_literal
    c_sharpPrivateTok,      ## private
    c_sharpPropertyTok,     ## property
    c_sharpProtectedTok,    ## protected
    c_sharpPublicTok,       ## public
    c_sharpReadonlyTok,     ## readonly
    c_sharpRealLiteral,     ## real_literal
    c_sharpRecordTok,       ## record
    c_sharpRefTok,          ## ref
    c_sharpRegionTok,       ## region
    c_sharpRemoveTok,       ## remove
    c_sharpRestoreTok,      ## restore
    c_sharpReturnTok,       ## return
    c_sharpSealedTok,       ## sealed
    c_sharpSelectTok,       ## select
    c_sharpSetTok,          ## set
    c_sharpSizeofTok,       ## sizeof
    c_sharpStackallocTok,   ## stackalloc
    c_sharpStaticTok,       ## static
    c_sharpStructTok,       ## struct
    c_sharpSwitchTok,       ## switch
    c_sharpThisTok,         ## this
    c_sharpThrowTok,        ## throw
    c_sharpTrueTok,         ## true
    c_sharpTryTok,          ## try
    c_sharpTypeTok,         ## type
    c_sharpTypeofTok,       ## typeof
    c_sharpUncheckedTok,    ## unchecked
    c_sharpUndefTok,        ## undef
    c_sharpUnmanagedTok,    ## unmanaged
    c_sharpUnsafeTok,       ## unsafe
    c_sharpUsingTok,        ## using
    c_sharpVarTok,          ## var
    c_sharpVerbatimStringLiteral, ## verbatim_string_literal
    c_sharpVirtualTok,      ## virtual
    c_sharpVoidKeyword,     ## void_keyword
    c_sharpVolatileTok,     ## volatile
    c_sharpWarningTok,      ## warning
    c_sharpWarningsTok,     ## warnings
    c_sharpWhenTok,         ## when
    c_sharpWhereTok,        ## where
    c_sharpWhileTok,        ## while
    c_sharpWithTok,         ## with
    c_sharpYieldTok,        ## yield
    c_sharpLCurlyTok,       ## {
    c_sharpDoubleLCurlyTok, ## {{
    c_sharpPipeTok,         ## |
    c_sharpPipeEqualTok,    ## |=
    c_sharpDoublePipeTok,   ## ||
    c_sharpRCurlyTok,       ## }
    c_sharpTildeTok,        ## ~
    c_sharpPreprocessorCall, ## _preprocessor_call
    c_sharpSyntaxError       ## Tree-sitter parser syntax error
type
  C_sharpExternalTok* = enum
    c_sharpExtern_preproc_directive_end ## _preproc_directive_end
type
  C_sharpNode* = distinct TSNode
type
  C_sharpParser* = distinct PtsParser
proc tsNodeType*(node: C_sharpNode): string
proc kind*(node: C_sharpNode): C_sharpNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_declaration":
      c_sharpDeclaration
    of "_expression":
      c_sharpExpression
    of "_statement":
      c_sharpStatement
    of "_type":
      c_sharpType
    of "accessor_declaration":
      c_sharpAccessorDeclaration
    of "accessor_list":
      c_sharpAccessorList
    of "alias_qualified_name":
      c_sharpAliasQualifiedName
    of "anonymous_method_expression":
      c_sharpAnonymousMethodExpression
    of "anonymous_object_creation_expression":
      c_sharpAnonymousObjectCreationExpression
    of "argument":
      c_sharpArgument
    of "argument_list":
      c_sharpArgumentList
    of "array_creation_expression":
      c_sharpArrayCreationExpression
    of "array_rank_specifier":
      c_sharpArrayRankSpecifier
    of "array_type":
      c_sharpArrayType
    of "arrow_expression_clause":
      c_sharpArrowExpressionClause
    of "as_expression":
      c_sharpAsExpression
    of "assignment_expression":
      c_sharpAssignmentExpression
    of "assignment_operator":
      c_sharpAssignmentOperator
    of "attribute":
      c_sharpAttribute
    of "attribute_argument":
      c_sharpAttributeArgument
    of "attribute_argument_list":
      c_sharpAttributeArgumentList
    of "attribute_list":
      c_sharpAttributeList
    of "attribute_target_specifier":
      c_sharpAttributeTargetSpecifier
    of "await_expression":
      c_sharpAwaitExpression
    of "base_expression":
      c_sharpBaseExpression
    of "base_list":
      c_sharpBaseList
    of "binary_expression":
      c_sharpBinaryExpression
    of "binary_pattern":
      c_sharpBinaryPattern
    of "block":
      c_sharpBlock
    of "boolean_literal":
      c_sharpBooleanLiteral
    of "bracketed_argument_list":
      c_sharpBracketedArgumentList
    of "bracketed_parameter_list":
      c_sharpBracketedParameterList
    of "break_statement":
      c_sharpBreakStatement
    of "case_pattern_switch_label":
      c_sharpCasePatternSwitchLabel
    of "case_switch_label":
      c_sharpCaseSwitchLabel
    of "cast_expression":
      c_sharpCastExpression
    of "catch_clause":
      c_sharpCatchClause
    of "catch_declaration":
      c_sharpCatchDeclaration
    of "catch_filter_clause":
      c_sharpCatchFilterClause
    of "character_literal":
      c_sharpCharacterLiteral
    of "checked_expression":
      c_sharpCheckedExpression
    of "checked_statement":
      c_sharpCheckedStatement
    of "class_declaration":
      c_sharpClassDeclaration
    of "compilation_unit":
      c_sharpCompilationUnit
    of "conditional_access_expression":
      c_sharpConditionalAccessExpression
    of "conditional_expression":
      c_sharpConditionalExpression
    of "constant_pattern":
      c_sharpConstantPattern
    of "constructor_constraint":
      c_sharpConstructorConstraint
    of "constructor_declaration":
      c_sharpConstructorDeclaration
    of "constructor_initializer":
      c_sharpConstructorInitializer
    of "continue_statement":
      c_sharpContinueStatement
    of "conversion_operator_declaration":
      c_sharpConversionOperatorDeclaration
    of "declaration_expression":
      c_sharpDeclarationExpression
    of "declaration_list":
      c_sharpDeclarationList
    of "declaration_pattern":
      c_sharpDeclarationPattern
    of "default_expression":
      c_sharpDefaultExpression
    of "default_switch_label":
      c_sharpDefaultSwitchLabel
    of "define_directive":
      c_sharpDefineDirective
    of "delegate_declaration":
      c_sharpDelegateDeclaration
    of "destructor_declaration":
      c_sharpDestructorDeclaration
    of "do_statement":
      c_sharpDoStatement
    of "element_access_expression":
      c_sharpElementAccessExpression
    of "element_binding_expression":
      c_sharpElementBindingExpression
    of "elif_directive":
      c_sharpElifDirective
    of "else_directive":
      c_sharpElseDirective
    of "empty_statement":
      c_sharpEmptyStatement
    of "endregion_directive":
      c_sharpEndregionDirective
    of "enum_declaration":
      c_sharpEnumDeclaration
    of "enum_member_declaration":
      c_sharpEnumMemberDeclaration
    of "enum_member_declaration_list":
      c_sharpEnumMemberDeclarationList
    of "equals_value_clause":
      c_sharpEqualsValueClause
    of "error_directive":
      c_sharpErrorDirective
    of "event_declaration":
      c_sharpEventDeclaration
    of "event_field_declaration":
      c_sharpEventFieldDeclaration
    of "explicit_interface_specifier":
      c_sharpExplicitInterfaceSpecifier
    of "expression_statement":
      c_sharpExpressionStatement
    of "extern_alias_directive":
      c_sharpExternAliasDirective
    of "field_declaration":
      c_sharpFieldDeclaration
    of "finally_clause":
      c_sharpFinallyClause
    of "fixed_statement":
      c_sharpFixedStatement
    of "for_each_statement":
      c_sharpForEachStatement
    of "for_statement":
      c_sharpForStatement
    of "from_clause":
      c_sharpFromClause
    of "function_pointer_calling_convention":
      c_sharpFunctionPointerCallingConvention
    of "function_pointer_parameter":
      c_sharpFunctionPointerParameter
    of "function_pointer_type":
      c_sharpFunctionPointerType
    of "function_pointer_unmanaged_calling_convention":
      c_sharpFunctionPointerUnmanagedCallingConvention
    of "function_pointer_unmanaged_calling_convention_list":
      c_sharpFunctionPointerUnmanagedCallingConventionList
    of "generic_name":
      c_sharpGenericName
    of "global":
      c_sharpGlobal
    of "global_attribute_list":
      c_sharpGlobalAttributeList
    of "global_statement":
      c_sharpGlobalStatement
    of "goto_statement":
      c_sharpGotoStatement
    of "group_clause":
      c_sharpGroupClause
    of "identifier":
      c_sharpIdentifier
    of "if_directive":
      c_sharpIfDirective
    of "if_statement":
      c_sharpIfStatement
    of "implicit_array_creation_expression":
      c_sharpImplicitArrayCreationExpression
    of "implicit_object_creation_expression":
      c_sharpImplicitObjectCreationExpression
    of "implicit_stack_alloc_array_creation_expression":
      c_sharpImplicitStackAllocArrayCreationExpression
    of "implicit_type":
      c_sharpImplicitType
    of "indexer_declaration":
      c_sharpIndexerDeclaration
    of "initializer_expression":
      c_sharpInitializerExpression
    of "interface_declaration":
      c_sharpInterfaceDeclaration
    of "interpolated_string_expression":
      c_sharpInterpolatedStringExpression
    of "interpolated_string_text":
      c_sharpInterpolatedStringText
    of "interpolated_verbatim_string_text":
      c_sharpInterpolatedVerbatimStringText
    of "interpolation":
      c_sharpInterpolation
    of "interpolation_alignment_clause":
      c_sharpInterpolationAlignmentClause
    of "interpolation_format_clause":
      c_sharpInterpolationFormatClause
    of "invocation_expression":
      c_sharpInvocationExpression
    of "is_expression":
      c_sharpIsExpression
    of "is_pattern_expression":
      c_sharpIsPatternExpression
    of "join_clause":
      c_sharpJoinClause
    of "join_into_clause":
      c_sharpJoinIntoClause
    of "label_name":
      c_sharpLabelName
    of "labeled_statement":
      c_sharpLabeledStatement
    of "lambda_expression":
      c_sharpLambdaExpression
    of "let_clause":
      c_sharpLetClause
    of "line_directive":
      c_sharpLineDirective
    of "local_declaration_statement":
      c_sharpLocalDeclarationStatement
    of "local_function_statement":
      c_sharpLocalFunctionStatement
    of "lock_statement":
      c_sharpLockStatement
    of "make_ref_expression":
      c_sharpMakeRefExpression
    of "member_access_expression":
      c_sharpMemberAccessExpression
    of "member_binding_expression":
      c_sharpMemberBindingExpression
    of "method_declaration":
      c_sharpMethodDeclaration
    of "modifier":
      c_sharpModifier
    of "name_colon":
      c_sharpNameColon
    of "name_equals":
      c_sharpNameEquals
    of "namespace_declaration":
      c_sharpNamespaceDeclaration
    of "negated_pattern":
      c_sharpNegatedPattern
    of "nullable_directive":
      c_sharpNullableDirective
    of "nullable_type":
      c_sharpNullableType
    of "object_creation_expression":
      c_sharpObjectCreationExpression
    of "operator_declaration":
      c_sharpOperatorDeclaration
    of "order_by_clause":
      c_sharpOrderByClause
    of "parameter":
      c_sharpParameter
    of "parameter_array":
      c_sharpParameterArray
    of "parameter_list":
      c_sharpParameterList
    of "parameter_modifier":
      c_sharpParameterModifier
    of "parenthesized_expression":
      c_sharpParenthesizedExpression
    of "parenthesized_pattern":
      c_sharpParenthesizedPattern
    of "parenthesized_variable_designation":
      c_sharpParenthesizedVariableDesignation
    of "pointer_type":
      c_sharpPointerType
    of "positional_pattern_clause":
      c_sharpPositionalPatternClause
    of "postfix_unary_expression":
      c_sharpPostfixUnaryExpression
    of "pragma_directive":
      c_sharpPragmaDirective
    of "prefix_unary_expression":
      c_sharpPrefixUnaryExpression
    of "primary_constructor_base_type":
      c_sharpPrimaryConstructorBaseType
    of "property_declaration":
      c_sharpPropertyDeclaration
    of "property_pattern_clause":
      c_sharpPropertyPatternClause
    of "qualified_name":
      c_sharpQualifiedName
    of "query_continuation":
      c_sharpQueryContinuation
    of "query_expression":
      c_sharpQueryExpression
    of "range_expression":
      c_sharpRangeExpression
    of "record_declaration":
      c_sharpRecordDeclaration
    of "recursive_pattern":
      c_sharpRecursivePattern
    of "ref_expression":
      c_sharpRefExpression
    of "ref_type_expression":
      c_sharpRefTypeExpression
    of "ref_value_expression":
      c_sharpRefValueExpression
    of "region_directive":
      c_sharpRegionDirective
    of "relational_pattern":
      c_sharpRelationalPattern
    of "return_statement":
      c_sharpReturnStatement
    of "select_clause":
      c_sharpSelectClause
    of "simple_assignment_expression":
      c_sharpSimpleAssignmentExpression
    of "size_of_expression":
      c_sharpSizeOfExpression
    of "stack_alloc_array_creation_expression":
      c_sharpStackAllocArrayCreationExpression
    of "string_literal":
      c_sharpStringLiteral
    of "struct_declaration":
      c_sharpStructDeclaration
    of "subpattern":
      c_sharpSubpattern
    of "switch_body":
      c_sharpSwitchBody
    of "switch_expression":
      c_sharpSwitchExpression
    of "switch_expression_arm":
      c_sharpSwitchExpressionArm
    of "switch_section":
      c_sharpSwitchSection
    of "switch_statement":
      c_sharpSwitchStatement
    of "this_expression":
      c_sharpThisExpression
    of "throw_expression":
      c_sharpThrowExpression
    of "throw_statement":
      c_sharpThrowStatement
    of "try_statement":
      c_sharpTryStatement
    of "tuple_element":
      c_sharpTupleElement
    of "tuple_expression":
      c_sharpTupleExpression
    of "tuple_pattern":
      c_sharpTuplePattern
    of "tuple_type":
      c_sharpTupleType
    of "type_argument_list":
      c_sharpTypeArgumentList
    of "type_constraint":
      c_sharpTypeConstraint
    of "type_of_expression":
      c_sharpTypeOfExpression
    of "type_parameter":
      c_sharpTypeParameter
    of "type_parameter_constraint":
      c_sharpTypeParameterConstraint
    of "type_parameter_constraints_clause":
      c_sharpTypeParameterConstraintsClause
    of "type_parameter_list":
      c_sharpTypeParameterList
    of "type_pattern":
      c_sharpTypePattern
    of "undef_directive":
      c_sharpUndefDirective
    of "unsafe_statement":
      c_sharpUnsafeStatement
    of "using_directive":
      c_sharpUsingDirective
    of "using_statement":
      c_sharpUsingStatement
    of "var_pattern":
      c_sharpVarPattern
    of "variable_declaration":
      c_sharpVariableDeclaration
    of "variable_declarator":
      c_sharpVariableDeclarator
    of "warning_directive":
      c_sharpWarningDirective
    of "when_clause":
      c_sharpWhenClause
    of "where_clause":
      c_sharpWhereClause
    of "while_statement":
      c_sharpWhileStatement
    of "with_expression":
      c_sharpWithExpression
    of "with_initializer_expression":
      c_sharpWithInitializerExpression
    of "yield_statement":
      c_sharpYieldStatement
    of "!":
      c_sharpExclamationTok
    of "!=":
      c_sharpExclamationEqualTok
    of "\"":
      c_sharpQuoteTok
    of "\"\"":
      c_sharpDoubleQuoteTok
    of "$\"":
      c_sharpDollarQuoteTok
    of "$@\"":
      c_sharpDollarAtQuoteTok
    of "%":
      c_sharpPercentTok
    of "%=":
      c_sharpPercentEqualTok
    of "&":
      c_sharpAmpersandTok
    of "&&":
      c_sharpDoubleAmpersandTok
    of "&=":
      c_sharpAmpersandEqualTok
    of "\'":
      c_sharpApostropheTok
    of "(":
      c_sharpLParTok
    of ")":
      c_sharpRParTok
    of "*":
      c_sharpAsteriskTok
    of "*=":
      c_sharpAsteriskEqualTok
    of "+":
      c_sharpPlusTok
    of "++":
      c_sharpDoublePlusTok
    of "+=":
      c_sharpPlusEqualTok
    of ",":
      c_sharpCommaTok
    of "-":
      c_sharpMinusTok
    of "--":
      c_sharpDoubleMinusTok
    of "-=":
      c_sharpMinusEqualTok
    of "->":
      c_sharpMinusGreaterThanTok
    of ".":
      c_sharpDotTok
    of "..":
      c_sharpDoubleDotTok
    of "/":
      c_sharpSlashTok
    of "/=":
      c_sharpSlashEqualTok
    of ":":
      c_sharpColonTok
    of "::":
      c_sharpDoubleColonTok
    of ";":
      c_sharpSemicolonTok
    of "<":
      c_sharpLessThanTok
    of "<<":
      c_sharpDoubleLessThanTok
    of "<<=":
      c_sharpDoubleLessThanEqualTok
    of "<=":
      c_sharpLessThanEqualTok
    of "=":
      c_sharpEqualTok
    of "==":
      c_sharpDoubleEqualTok
    of "=>":
      c_sharpEqualGreaterThanTok
    of ">":
      c_sharpGreaterThanTok
    of ">=":
      c_sharpGreaterThanEqualTok
    of ">>":
      c_sharpDoubleGreaterThanTok
    of ">>=":
      c_sharpDoubleGreaterThanEqualTok
    of "?":
      c_sharpQuestionTok
    of "??":
      c_sharpDoubleQuestionTok
    of "??=":
      c_sharpDoubleQuestionEqualTok
    of "@$\"":
      c_sharpAtDollarQuoteTok
    of "Cdecl":
      c_sharpCdeclTok
    of "Fastcall":
      c_sharpFastcallTok
    of "Stdcall":
      c_sharpStdcallTok
    of "Thiscall":
      c_sharpThiscallTok
    of "[":
      c_sharpLBrackTok
    of "]":
      c_sharpRBrackTok
    of "^":
      c_sharpAccentTok
    of "^=":
      c_sharpAccentEqualTok
    of "__makeref":
      c_sharpMakerefTok
    of "__reftype":
      c_sharpReftypeTok
    of "__refvalue":
      c_sharpRefvalueTok
    of "abstract":
      c_sharpAbstractTok
    of "add":
      c_sharpAddTok
    of "alias":
      c_sharpAliasTok
    of "and":
      c_sharpAndTok
    of "annotations":
      c_sharpAnnotationsTok
    of "as":
      c_sharpAsTok
    of "ascending":
      c_sharpAscendingTok
    of "assembly":
      c_sharpAssemblyTok
    of "async":
      c_sharpAsyncTok
    of "await":
      c_sharpAwaitTok
    of "base":
      c_sharpBaseTok
    of "break":
      c_sharpBreakTok
    of "by":
      c_sharpByTok
    of "case":
      c_sharpCaseTok
    of "catch":
      c_sharpCatchTok
    of "checked":
      c_sharpCheckedTok
    of "checksum":
      c_sharpChecksumTok
    of "class":
      c_sharpClassTok
    of "comment":
      c_sharpComment
    of "const":
      c_sharpConstTok
    of "continue":
      c_sharpContinueTok
    of "default":
      c_sharpDefaultTok
    of "define":
      c_sharpDefineTok
    of "delegate":
      c_sharpDelegateTok
    of "descending":
      c_sharpDescendingTok
    of "disable":
      c_sharpDisableTok
    of "discard":
      c_sharpDiscard
    of "do":
      c_sharpDoTok
    of "dynamic":
      c_sharpDynamicTok
    of "elif":
      c_sharpElifTok
    of "else":
      c_sharpElseTok
    of "enable":
      c_sharpEnableTok
    of "endif_directive":
      c_sharpEndifDirective
    of "endregion":
      c_sharpEndregionTok
    of "enum":
      c_sharpEnumTok
    of "equals":
      c_sharpEqualsTok
    of "error":
      c_sharpErrorTok
    of "escape_sequence":
      c_sharpEscapeSequence
    of "event":
      c_sharpEventTok
    of "explicit":
      c_sharpExplicitTok
    of "extern":
      c_sharpExternTok
    of "false":
      c_sharpFalseTok
    of "field":
      c_sharpFieldTok
    of "finally":
      c_sharpFinallyTok
    of "fixed":
      c_sharpFixedTok
    of "for":
      c_sharpForTok
    of "foreach":
      c_sharpForeachTok
    of "from":
      c_sharpFromTok
    of "get":
      c_sharpGetTok
    of "goto":
      c_sharpGotoTok
    of "group":
      c_sharpGroupTok
    of "hidden":
      c_sharpHiddenTok
    of "if":
      c_sharpIfTok
    of "implicit":
      c_sharpImplicitTok
    of "in":
      c_sharpInTok
    of "init":
      c_sharpInitTok
    of "integer_literal":
      c_sharpIntegerLiteral
    of "interface":
      c_sharpInterfaceTok
    of "internal":
      c_sharpInternalTok
    of "into":
      c_sharpIntoTok
    of "is":
      c_sharpIsTok
    of "join":
      c_sharpJoinTok
    of "let":
      c_sharpLetTok
    of "line":
      c_sharpLineTok
    of "lock":
      c_sharpLockTok
    of "managed":
      c_sharpManagedTok
    of "method":
      c_sharpMethodTok
    of "module":
      c_sharpModuleTok
    of "nameof":
      c_sharpNameofTok
    of "namespace":
      c_sharpNamespaceTok
    of "new":
      c_sharpNewTok
    of "not":
      c_sharpNotTok
    of "notnull":
      c_sharpNotnullTok
    of "null_literal":
      c_sharpNullLiteral
    of "nullable":
      c_sharpNullableTok
    of "on":
      c_sharpOnTok
    of "operator":
      c_sharpOperatorTok
    of "or":
      c_sharpOrTok
    of "orderby":
      c_sharpOrderbyTok
    of "out":
      c_sharpOutTok
    of "override":
      c_sharpOverrideTok
    of "param":
      c_sharpParamTok
    of "params":
      c_sharpParamsTok
    of "partial":
      c_sharpPartialTok
    of "pragma":
      c_sharpPragmaTok
    of "predefined_type":
      c_sharpPredefinedType
    of "preproc_integer_literal":
      c_sharpPreprocIntegerLiteral
    of "preproc_message":
      c_sharpPreprocMessage
    of "preproc_string_literal":
      c_sharpPreprocStringLiteral
    of "private":
      c_sharpPrivateTok
    of "property":
      c_sharpPropertyTok
    of "protected":
      c_sharpProtectedTok
    of "public":
      c_sharpPublicTok
    of "readonly":
      c_sharpReadonlyTok
    of "real_literal":
      c_sharpRealLiteral
    of "record":
      c_sharpRecordTok
    of "ref":
      c_sharpRefTok
    of "region":
      c_sharpRegionTok
    of "remove":
      c_sharpRemoveTok
    of "restore":
      c_sharpRestoreTok
    of "return":
      c_sharpReturnTok
    of "sealed":
      c_sharpSealedTok
    of "select":
      c_sharpSelectTok
    of "set":
      c_sharpSetTok
    of "sizeof":
      c_sharpSizeofTok
    of "stackalloc":
      c_sharpStackallocTok
    of "static":
      c_sharpStaticTok
    of "struct":
      c_sharpStructTok
    of "switch":
      c_sharpSwitchTok
    of "this":
      c_sharpThisTok
    of "throw":
      c_sharpThrowTok
    of "true":
      c_sharpTrueTok
    of "try":
      c_sharpTryTok
    of "type":
      c_sharpTypeTok
    of "typeof":
      c_sharpTypeofTok
    of "unchecked":
      c_sharpUncheckedTok
    of "undef":
      c_sharpUndefTok
    of "unmanaged":
      c_sharpUnmanagedTok
    of "unsafe":
      c_sharpUnsafeTok
    of "using":
      c_sharpUsingTok
    of "var":
      c_sharpVarTok
    of "verbatim_string_literal":
      c_sharpVerbatimStringLiteral
    of "virtual":
      c_sharpVirtualTok
    of "void_keyword":
      c_sharpVoidKeyword
    of "volatile":
      c_sharpVolatileTok
    of "warning":
      c_sharpWarningTok
    of "warnings":
      c_sharpWarningsTok
    of "when":
      c_sharpWhenTok
    of "where":
      c_sharpWhereTok
    of "while":
      c_sharpWhileTok
    of "with":
      c_sharpWithTok
    of "yield":
      c_sharpYieldTok
    of "{":
      c_sharpLCurlyTok
    of "{{":
      c_sharpDoubleLCurlyTok
    of "|":
      c_sharpPipeTok
    of "|=":
      c_sharpPipeEqualTok
    of "||":
      c_sharpDoublePipeTok
    of "}":
      c_sharpRCurlyTok
    of "~":
      c_sharpTildeTok
    of "_preprocessor_call":
      c_sharpPreprocessorCall
    of "ERROR":
      c_sharpSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_c_sharp(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: C_sharpNode): string =
  $ts_node_type(TSNode(node))

proc newC_sharpParser*(): C_sharpParser =
  result = C_sharpParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_c_sharp())

proc parseString*(parser: C_sharpParser; str: string): C_sharpNode =
  C_sharpNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseC_sharpString*(str: string): C_sharpNode =
  let parser = newC_sharpParser()
  return parseString(parser, str)

func `[]`*(node: C_sharpNode; idx: int; withUnnamed: bool = false): C_sharpNode =
  if withUnnamed:
    C_sharpNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    C_sharpNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: C_sharpNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: C_sharpNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: C_sharpNode; withUnnamed: bool = false): C_sharpNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                             ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: C_sharpNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: C_sharpNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: C_sharpNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: C_sharpNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: C_sharpNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: C_sharpNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: C_sharpNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: C_sharpNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: C_sharpNode): C_sharpNode =
  C_sharpNode(ts_node_parent(TSNode(node)))

func child*(node: C_sharpNode; a2: int): C_sharpNode =
  C_sharpNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: C_sharpNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: C_sharpNode; a2: int): C_sharpNode =
  C_sharpNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: C_sharpNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: C_sharpNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: C_sharpNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: C_sharpNode): int =
  node.startPoint().row.int

func endLine*(node: C_sharpNode): int =
  node.endPoint().row.int

func startColumn*(node: C_sharpNode): int =
  node.startPoint().column.int

func endColumn*(node: C_sharpNode): int =
  node.endPoint().column.int

func childByFieldName*(self: C_sharpNode; fieldName: string;
                       fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
