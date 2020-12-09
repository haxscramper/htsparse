
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  VhdlNodeKind* = enum
    vhdlPSLActualParameter, ## PSL_Actual_Parameter
    vhdlPSLActualParameterList, ## PSL_Actual_Parameter_List
    vhdlPSLAssertDirective, ## PSL_Assert_Directive
    vhdlPSLAssumeDirective, ## PSL_Assume_Directive
    vhdlPSLAssumeGuaranteeDirective, ## PSL_Assume_Guarantee_Directive
    vhdlPSLBoundingFLProperty, ## PSL_Bounding_FL_Property
    vhdlPSLBracedSERE,      ## PSL_Braced_SERE
    vhdlPSLBuiltInFunctionCall, ## PSL_Built_In_Function_Call
    vhdlPSLClockDeclaration, ## PSL_Clock_Declaration
    vhdlPSLClockedFLProperty, ## PSL_Clocked_FL_Property
    vhdlPSLClockedSERE,     ## PSL_Clocked_SERE
    vhdlPSLConstantParameterSpecification, ## PSL_Constant_Parameter_Specification
    vhdlPSLCoverDirective,  ## PSL_Cover_Directive
    vhdlPSLExpression,      ## PSL_Expression
    vhdlPSLExtendedOcurrenceFLProperty, ## PSL_Extended_Ocurrence_FL_Property
    vhdlPSLFactorFLProperty, ## PSL_Factor_FL_Property
    vhdlPSLFairnessDirective, ## PSL_Fairness_Directive
    vhdlPSLFormalParameter, ## PSL_Formal_Parameter
    vhdlPSLFormalParameterList, ## PSL_Formal_Parameter_List
    vhdlPSLHDLType,         ## PSL_HDL_Type
    vhdlPSLHierarchicalHDLName, ## PSL_Hierarchical_HDL_Name
    vhdlPSLImplicationFLProperty, ## PSL_Implication_FL_Property
    vhdlPSLInheritSpec,     ## PSL_Inherit_Spec
    vhdlPSLInvariantFLProperty, ## PSL_Invariant_FL_Property
    vhdlPSLLogicalFLProperty, ## PSL_Logical_FL_Property
    vhdlPSLOcurrenceFLProperty, ## PSL_Ocurrence_FL_Property
    vhdlPSLParameterSpecification, ## PSL_Parameter_Specification
    vhdlPSLParameterizedProperty, ## PSL_Parameterized_Property
    vhdlPSLParameterizedSERE, ## PSL_Parameterized_SERE
    vhdlPSLParametersDefinition, ## PSL_Parameters_Definition
    vhdlPSLParenthesizedFLProperty, ## PSL_Parenthesized_FL_Property
    vhdlPSLPropertyDeclaration, ## PSL_Property_Declaration
    vhdlPSLPropertyInstance, ## PSL_Property_Instance
    vhdlPSLPropertyReplicator, ## PSL_Property_Replicator
    vhdlPSLRepeatedSERE,    ## PSL_Repeated_SERE
    vhdlPSLRestrictDirective, ## PSL_Restrict_Directive
    vhdlPSLRestrictGuaranteeDirective, ## PSL_Restrict_Guarantee_Directive
    vhdlPSLSEREAnd,         ## PSL_SERE_And
    vhdlPSLSEREConcatenation, ## PSL_SERE_Concatenation
    vhdlPSLSEREFusion,      ## PSL_SERE_Fusion
    vhdlPSLSEREOr,          ## PSL_SERE_Or
    vhdlPSLSEREWithin,      ## PSL_SERE_Within
    vhdlPSLSequenceDeclaration, ## PSL_Sequence_Declaration
    vhdlPSLSequenceInstance, ## PSL_Sequence_Instance
    vhdlPSLSequentialFLProperty, ## PSL_Sequential_FL_Property
    vhdlPSLStrongFairnessDirective, ## PSL_Strong_Fairness_Directive
    vhdlPSLSuffixImplicationFLProperty, ## PSL_Suffix_Implication_FL_Property
    vhdlPSLTemporalParameterSpecification, ## PSL_Temporal_Parameter_Specification
    vhdlPSLTerminationFLProperty, ## PSL_Termination_FL_Property
    vhdlPSLTypeClass,       ## PSL_Type_Class
    vhdlPSLVMode,           ## PSL_VMode
    vhdlPSLVProp,           ## PSL_VProp
    vhdlPSLVUnit,           ## PSL_VUnit
    vhdlPSLValueSet,        ## PSL_Value_Set
    vhdlAbsolutePathname,   ## absolute_pathname
    vhdlAccessTypeDefinition, ## access_type_definition
    vhdlAggregate,          ## aggregate
    vhdlAliasDeclaration,   ## alias_declaration
    vhdlAll,                ## all
    vhdlAllocator,          ## allocator
    vhdlAlternativeConditionalExpression, ## alternative_conditional_expression
    vhdlAlternativeConditionalWaveform, ## alternative_conditional_waveform
    vhdlAlternativeSelectedExpressions, ## alternative_selected_expressions
    vhdlAmbiguousName,      ## ambiguous_name
    vhdlArchitectureBody,   ## architecture_body
    vhdlArrayConstraint,    ## array_constraint
    vhdlAscendingRange,     ## ascending_range
    vhdlAssertionStatement, ## assertion_statement
    vhdlAssociationList,    ## association_list
    vhdlAttributeDeclaration, ## attribute_declaration
    vhdlAttributeName,      ## attribute_name
    vhdlAttributeSpecification, ## attribute_specification
    vhdlBasedInteger,       ## based_integer
    vhdlBasedLiteral,       ## based_literal
    vhdlBasedReal,          ## based_real
    vhdlBindingIndication,  ## binding_indication
    vhdlBitStringLiteral,   ## bit_string_literal
    vhdlBitValue,           ## bit_value
    vhdlBlockConfiguration, ## block_configuration
    vhdlBlockSpecification, ## block_specification
    vhdlBlockStatement,     ## block_statement
    vhdlCaseGenerateAlternative, ## case_generate_alternative
    vhdlCaseGenerateStatement, ## case_generate_statement
    vhdlCaseStatement,      ## case_statement
    vhdlCaseStatementAlternative, ## case_statement_alternative
    vhdlCharacterLiteral,   ## character_literal
    vhdlChoices,            ## choices
    vhdlComment,            ## comment
    vhdlComponentConfiguration, ## component_configuration
    vhdlComponentDeclaration, ## component_declaration
    vhdlComponentInstantiation, ## component_instantiation
    vhdlComponentInstantiationStatement, ## component_instantiation_statement
    vhdlComponentSpecification, ## component_specification
    vhdlCompoundConfigurationSpecification, ## compound_configuration_specification
    vhdlConcatenation,      ## concatenation
    vhdlConcurrentStatementPart, ## concurrent_statement_part
    vhdlCondition,          ## condition
    vhdlConditionClause,    ## condition_clause
    vhdlConditionalExpressions, ## conditional_expressions
    vhdlConditionalForceAssignment, ## conditional_force_assignment
    vhdlConditionalVariableAssignment, ## conditional_variable_assignment
    vhdlConditionalWaveformAssignment, ## conditional_waveform_assignment
    vhdlConditionalWaveforms, ## conditional_waveforms
    vhdlConfigurationAspect, ## configuration_aspect
    vhdlConfigurationDeclaration, ## configuration_declaration
    vhdlConfigurationInstantiation, ## configuration_instantiation
    vhdlConstantDeclaration, ## constant_declaration
    vhdlConstrainedArrayDefinition, ## constrained_array_definition
    vhdlContextClause,      ## context_clause
    vhdlContextDeclaration, ## context_declaration
    vhdlContextReference,   ## context_reference
    vhdlDeclarativePart,    ## declarative_part
    vhdlDefaultExpression,  ## default_expression
    vhdlDeferredConstantDeclaration, ## deferred_constant_declaration
    vhdlDescendingRange,    ## descending_range
    vhdlDesignFile,         ## design_file
    vhdlDesignUnit,         ## design_unit
    vhdlDisconnectionSpecification, ## disconnection_specification
    vhdlElementAsociation,  ## element_asociation
    vhdlElementDeclaration, ## element_declaration
    vhdlElse,               ## else
    vhdlElseGenerate,       ## else_generate
    vhdlElsif,              ## elsif
    vhdlElsifGenerate,      ## elsif_generate
    vhdlEntityAspect,       ## entity_aspect
    vhdlEntityClass,        ## entity_class
    vhdlEntityClassEntry,   ## entity_class_entry
    vhdlEntityClassEntryList, ## entity_class_entry_list
    vhdlEntityDeclaration,  ## entity_declaration
    vhdlEntityDesignator,   ## entity_designator
    vhdlEntityInstantiation, ## entity_instantiation
    vhdlEntityNameList,     ## entity_name_list
    vhdlEntitySpecification, ## entity_specification
    vhdlEnumerationTypeDefinition, ## enumeration_type_definition
    vhdlExitStatement,      ## exit_statement
    vhdlExponentiation,     ## exponentiation
    vhdlExpressionList,     ## expression_list
    vhdlExternalConstantName, ## external_constant_name
    vhdlExternalSignalName, ## external_signal_name
    vhdlExternalVariableName, ## external_variable_name
    vhdlFactor,             ## factor
    vhdlFileDeclaration,    ## file_declaration
    vhdlFileOpenInformation, ## file_open_information
    vhdlFileTypeDefinition, ## file_type_definition
    vhdlForGenerateStatement, ## for_generate_statement
    vhdlForLoop,            ## for_loop
    vhdlForceMode,          ## force_mode
    vhdlFormalFunctionParameterClause, ## formal_function_parameter_clause
    vhdlFormalProcedureParameterClause, ## formal_procedure_parameter_clause
    vhdlFullTypeDeclaration, ## full_type_declaration
    vhdlFunctionCall,       ## function_call
    vhdlFunctionInstantiationDeclaration, ## function_instantiation_declaration
    vhdlGenerateStatementBody, ## generate_statement_body
    vhdlGenerateStatementElement, ## generate_statement_element
    vhdlGenericAssociationList, ## generic_association_list
    vhdlGenericClause,      ## generic_clause
    vhdlGenericMapAspect,   ## generic_map_aspect
    vhdlGroupConstituentList, ## group_constituent_list
    vhdlGroupDeclaration,   ## group_declaration
    vhdlGroupTemplateDeclaration, ## group_template_declaration
    vhdlGuardedConditionalSignalAssignment, ## guarded_conditional_signal_assignment
    vhdlGuardedSelectedSignalAssignment, ## guarded_selected_signal_assignment
    vhdlGuardedSignalSpecification, ## guarded_signal_specification
    vhdlGuardedSimpleSignalAssignment, ## guarded_simple_signal_assignment
    vhdlHeader,             ## header
    vhdlIdentifierList,     ## identifier_list
    vhdlIf,                 ## if
    vhdlIfGenerate,         ## if_generate
    vhdlIfGenerateStatement, ## if_generate_statement
    vhdlIfStatement,        ## if_statement
    vhdlImpureFunctionSpecification, ## impure_function_specification
    vhdlIncompleteTypeDeclaration, ## incomplete_type_declaration
    vhdlIndexConstraint,    ## index_constraint
    vhdlIndexSubtypeDefinition, ## index_subtype_definition
    vhdlInertial,           ## inertial
    vhdlInertialExpression, ## inertial_expression
    vhdlInstantiationList,  ## instantiation_list
    vhdlIntegerDecimal,     ## integer_decimal
    vhdlInterfaceConstantDeclaration, ## interface_constant_declaration
    vhdlInterfaceFileDeclaration, ## interface_file_declaration
    vhdlInterfacePackageDeclaration, ## interface_package_declaration
    vhdlInterfaceSignalDeclaration, ## interface_signal_declaration
    vhdlInterfaceSubprogramDeclaration, ## interface_subprogram_declaration
    vhdlInterfaceSubprogramDefault, ## interface_subprogram_default
    vhdlInterfaceTypeDeclaration, ## interface_type_declaration
    vhdlInterfaceVariableDeclaration, ## interface_variable_declaration
    vhdlLabel,              ## label
    vhdlLibraryClause,      ## library_clause
    vhdlLogicalExpression,  ## logical_expression
    vhdlLogicalNameList,    ## logical_name_list
    vhdlLoopStatement,      ## loop_statement
    vhdlMapAspect,          ## map_aspect
    vhdlMode,               ## mode
    vhdlNamedAssociationElement, ## named_association_element
    vhdlNegativeExponent,   ## negative_exponent
    vhdlNextStatement,      ## next_statement
    vhdlNull,               ## null
    vhdlNullStatement,      ## null_statement
    vhdlNumericTypeDefinition, ## numeric_type_definition
    vhdlOpen,               ## open
    vhdlOperatorSymbol,     ## operator_symbol
    vhdlOthers,             ## others
    vhdlPackageBody,        ## package_body
    vhdlPackageDeclaration, ## package_declaration
    vhdlPackageInstantiationDeclaration, ## package_instantiation_declaration
    vhdlPackagePathname,    ## package_pathname
    vhdlParameterSpecification, ## parameter_specification
    vhdlParenthesizedExpression, ## parenthesized_expression
    vhdlParenthesizedResolution, ## parenthesized_resolution
    vhdlPathnameElement,    ## pathname_element
    vhdlPhysicalLiteral,    ## physical_literal
    vhdlPhysicalTypeDefinition, ## physical_type_definition
    vhdlPortAssociationList, ## port_association_list
    vhdlPortClause,         ## port_clause
    vhdlPortMapAspect,      ## port_map_aspect
    vhdlPositionalAssociationElement, ## positional_association_element
    vhdlPositiveExponent,   ## positive_exponent
    vhdlPrimaryUnitDeclaration, ## primary_unit_declaration
    vhdlProcedureCallStatement, ## procedure_call_statement
    vhdlProcedureInstantiationDeclaration, ## procedure_instantiation_declaration
    vhdlProcedureSpecification, ## procedure_specification
    vhdlProcessStatement,   ## process_statement
    vhdlProtectedTypeBody,  ## protected_type_body
    vhdlProtectedTypeBodyDeclarativePart, ## protected_type_body_declarative_part
    vhdlProtectedTypeDeclaration, ## protected_type_declaration
    vhdlPureFunctionSpecification, ## pure_function_specification
    vhdlQualifiedExpression, ## qualified_expression
    vhdlRangeAttributeFunctionCall, ## range_attribute_function_call
    vhdlRangeAttributeName, ## range_attribute_name
    vhdlRangeConstraint,    ## range_constraint
    vhdlRealDecimal,        ## real_decimal
    vhdlRecordConstraint,   ## record_constraint
    vhdlRecordElementConstraint, ## record_element_constraint
    vhdlRecordElementResolution, ## record_element_resolution
    vhdlRecordResolution,   ## record_resolution
    vhdlRecordTypeDefinition, ## record_type_definition
    vhdlReduction,          ## reduction
    vhdlRelation,           ## relation
    vhdlRelativePathname,   ## relative_pathname
    vhdlReport,             ## report
    vhdlReportStatement,    ## report_statement
    vhdlReturn,             ## return
    vhdlReturnStatement,    ## return_statement
    vhdlSecondaryUnitDeclaration, ## secondary_unit_declaration
    vhdlSelectedExpressions, ## selected_expressions
    vhdlSelectedForceAssignment, ## selected_force_assignment
    vhdlSelectedName,       ## selected_name
    vhdlSelectedVariableAssignment, ## selected_variable_assignment
    vhdlSelectedWaveformAssignment, ## selected_waveform_assignment
    vhdlSelectedWaveforms,  ## selected_waveforms
    vhdlSensitivityClause,  ## sensitivity_clause
    vhdlSensitivityList,    ## sensitivity_list
    vhdlSequenceOfStatements, ## sequence_of_statements
    vhdlSeverity,           ## severity
    vhdlSharedVariableDeclaration, ## shared_variable_declaration
    vhdlShiftExpression,    ## shift_expression
    vhdlSign,               ## sign
    vhdlSignalDeclaration,  ## signal_declaration
    vhdlSignalKind,         ## signal_kind
    vhdlSignalList,         ## signal_list
    vhdlSignature,          ## signature
    vhdlSimpleConfigurationSpecification, ## simple_configuration_specification
    vhdlSimpleExpression,   ## simple_expression
    vhdlSimpleForceAssignment, ## simple_force_assignment
    vhdlSimpleReleaseAssignment, ## simple_release_assignment
    vhdlSimpleVariableAssignment, ## simple_variable_assignment
    vhdlSimpleWaveformAssignment, ## simple_waveform_assignment
    vhdlSliceName,          ## slice_name
    vhdlStringLiteral,      ## string_literal
    vhdlSubprogramBody,     ## subprogram_body
    vhdlSubprogramDeclaration, ## subprogram_declaration
    vhdlSubprogramKind,     ## subprogram_kind
    vhdlSubtypeDeclaration, ## subtype_declaration
    vhdlSubtypeIndication,  ## subtype_indication
    vhdlTerm,               ## term
    vhdlTimeoutClause,      ## timeout_clause
    vhdlTransport,          ## transport
    vhdlTypeMark,           ## type_mark
    vhdlUnboundedArrayDefinition, ## unbounded_array_definition
    vhdlUseClause,          ## use_clause
    vhdlVariableDeclaration, ## variable_declaration
    vhdlVerificationUnitBindingIndication, ## verification_unit_binding_indication
    vhdlVerificationUnitList, ## verification_unit_list
    vhdlWaitStatement,      ## wait_statement
    vhdlWaveformElement,    ## waveform_element
    vhdlWaveforms,          ## waveforms
    vhdlWhileLoop,          ## while_loop
    vhdlSingleExclamationTok, ## !
    vhdlSingleQuoteTok,     ## "
    vhdlSingleHashTok,      ## #
    vhdlSingleAmpersandTok, ## &
    vhdlDoubleAmpersandTok, ## &&
    vhdlSingleApostropheTok, ## '
    vhdlSingleLParTok,      ## (
    vhdlSingleRParTok,      ## )
    vhdlSingleAsteriskTok,  ## *
    vhdlDoubleAsteriskTok,  ## **
    vhdlSinglePlusTok,      ## +
    vhdlSingleCommaTok,     ## ,
    vhdlSingleMinusTok,     ## -
    vhdlSingleMinusSingleGreaterThanTok, ## ->
    vhdlSingleDotTok,       ## .
    vhdlSingleSlashTok,     ## /
    vhdlSingleSlashSingleEqualTok, ## /=
    vhdlSingleColonTok,     ## :
    vhdlSingleColonSingleEqualTok, ## :=
    vhdlSingleSemicolonTok, ## ;
    vhdlSingleLessThanTok,  ## <
    vhdlSingleLessThanSingleMinusSingleGreaterThanTok, ## <->
    vhdlDoubleLessThanTok,  ## <<
    vhdlSingleLessThanSingleEqualTok, ## <=
    vhdlSingleEqualTok,     ## =
    vhdlSingleEqualSingleGreaterThanTok, ## =>
    vhdlSingleGreaterThanTok, ## >
    vhdlSingleGreaterThanSingleEqualTok, ## >=
    vhdlDoubleGreaterThanTok, ## >>
    vhdlSingleQuestionSingleSlashSingleEqualTok, ## ?/=
    vhdlSingleQuestionSingleLessThanTok, ## ?<
    vhdlSingleQuestionSingleLessThanSingleEqualTok, ## ?<=
    vhdlSingleQuestionSingleEqualTok, ## ?=
    vhdlSingleQuestionSingleGreaterThanTok, ## ?>
    vhdlSingleQuestionSingleGreaterThanSingleEqualTok, ## ?>=
    vhdlDoubleQuestionTok,  ## ??
    vhdlSingleAtTok,        ## @
    vhdlPSLBuiltInFunctionName, ## PSL_Built_In_Function_Name
    vhdlPSLIdentifier,      ## PSL_Identifier
    vhdlSingleLBrackTok,    ## [
    vhdlSingleRBrackTok,    ## ]
    vhdlSingleAccentSingleDotTok, ## ^.
    vhdlAbortTok,           ## abort
    vhdlAbsTok,             ## abs
    vhdlAccessTok,          ## access
    vhdlAfterTok,           ## after
    vhdlAliasTok,           ## alias
    vhdlAllTok,             ## all
    vhdlAlwaysTok,          ## always
    vhdlAndTok,             ## and
    vhdlAny,                ## any
    vhdlArchitectureTok,    ## architecture
    vhdlArrayTok,           ## array
    vhdlAssertTok,          ## assert
    vhdlAssumeTok,          ## assume
    vhdlAssumeGuaranteeTok, ## assume_guarantee
    vhdlAsyncAbortTok,      ## async_abort
    vhdlAttributeTok,       ## attribute
    vhdlAttributeDesignator, ## attribute_designator
    vhdlBase,               ## base
    vhdlBasedLiteralError,  ## based_literal_error
    vhdlBeginTok,           ## begin
    vhdlBitTok,             ## bit
    vhdlBitValueError,      ## bit_value_error
    vhdlBitVectorTok,       ## bit_vector
    vhdlBlockTok,           ## block
    vhdlBodyTok,            ## body
    vhdlBooleanTok,         ## boolean
    vhdlBoolean,            ## boolean
    vhdlBufferTok,          ## buffer
    vhdlBusTok,             ## bus
    vhdlCaseTok,            ## case
    vhdlClockTok,           ## clock
    vhdlComponentTok,       ## component
    vhdlConfigurationTok,   ## configuration
    vhdlConstTok,           ## const
    vhdlConstantTok,        ## constant
    vhdlContextTok,         ## context
    vhdlCountonesTok,       ## countones
    vhdlCoverTok,           ## cover
    vhdlDefault,            ## default
    vhdlDefaultTok,         ## default
    vhdlDisconnectTok,      ## disconnect
    vhdlDowntoTok,          ## downto
    vhdlElseTok,            ## else
    vhdlElsifTok,           ## elsif
    vhdlEndTok,             ## end
    vhdlEntityTok,          ## entity
    vhdlEscapeSequence,     ## escape_sequence
    vhdlEventuallyTok,      ## eventually
    vhdlExitTok,            ## exit
    vhdlFairnessTok,        ## fairness
    vhdlFellTok,            ## fell
    vhdlFileTok,            ## file
    vhdlForTok,             ## for
    vhdlForallTok,          ## forall
    vhdlForceTok,           ## force
    vhdlFunctionTok,        ## function
    vhdlGenerateTok,        ## generate
    vhdlGenericTok,         ## generic
    vhdlGroupTok,           ## group
    vhdlGuardedTok,         ## guarded
    vhdlHdltypeTok,         ## hdltype
    vhdlIdentifier,         ## identifier
    vhdlIfTok,              ## if
    vhdlImpureTok,          ## impure
    vhdlInTok,              ## in
    vhdlInertialTok,        ## inertial
    vhdlInheritTok,         ## inherit
    vhdlInoutTok,           ## inout
    vhdlInteger,            ## integer
    vhdlIsTok,              ## is
    vhdlIsunknownTok,       ## isunknown
    vhdlLabelTok,           ## label
    vhdlLibraryTok,         ## library
    vhdlLinkageTok,         ## linkage
    vhdlLiteralTok,         ## literal
    vhdlLoopTok,            ## loop
    vhdlMapTok,             ## map
    vhdlModTok,             ## mod
    vhdlNandTok,            ## nand
    vhdlNeverTok,           ## never
    vhdlNewTok,             ## new
    vhdlNextTok,            ## next
    vhdlNextATok,           ## next_a
    vhdlNextETok,           ## next_e
    vhdlNextEventTok,       ## next_event
    vhdlNextEventATok,      ## next_event_a
    vhdlNextEventETok,      ## next_event_e
    vhdlNondetTok,          ## nondet
    vhdlNondetVectorTok,    ## nondet_vector
    vhdlNorTok,             ## nor
    vhdlNotTok,             ## not
    vhdlNullTok,            ## null
    vhdlNumericTok,         ## numeric
    vhdlOfTok,              ## of
    vhdlOnTok,              ## on
    vhdlOnehotTok,          ## onehot
    vhdlOnehot0Tok,         ## onehot0
    vhdlOpenTok,            ## open
    vhdlOrTok,              ## or
    vhdlOthersTok,          ## others
    vhdlOutTok,             ## out
    vhdlPackageTok,         ## package
    vhdlParameterTok,       ## parameter
    vhdlPortTok,            ## port
    vhdlPostponedTok,       ## postponed
    vhdlPrevTok,            ## prev
    vhdlProcedureTok,       ## procedure
    vhdlProcessTok,         ## process
    vhdlPropertyTok,        ## property
    vhdlProtectedTok,       ## protected
    vhdlPureTok,            ## pure
    vhdlRangeTok,           ## range
    vhdlRangeAttributeDesignator, ## range_attribute_designator
    vhdlRecordTok,          ## record
    vhdlRegisterTok,        ## register
    vhdlRejectTok,          ## reject
    vhdlReleaseTok,         ## release
    vhdlRemTok,             ## rem
    vhdlReportTok,          ## report
    vhdlRestrictTok,        ## restrict
    vhdlRestrictGuaranteeTok, ## restrict_guarantee
    vhdlReturnTok,          ## return
    vhdlRolTok,             ## rol
    vhdlRorTok,             ## ror
    vhdlRoseTok,            ## rose
    vhdlSame,               ## same
    vhdlSelectTok,          ## select
    vhdlSemicolon,          ## semicolon
    vhdlSequenceTok,        ## sequence
    vhdlSeverityTok,        ## severity
    vhdlSharedTok,          ## shared
    vhdlSignalTok,          ## signal
    vhdlSimpleName,         ## simple_name
    vhdlSlaTok,             ## sla
    vhdlSllTok,             ## sll
    vhdlSraTok,             ## sra
    vhdlSrlTok,             ## srl
    vhdlStableTok,          ## stable
    vhdlStringTok,          ## string
    vhdlStrongTok,          ## strong
    vhdlSubtypeTok,         ## subtype
    vhdlSyncAbortTok,       ## sync_abort
    vhdlThenTok,            ## then
    vhdlToTok,              ## to
    vhdlToolDirective,      ## tool_directive
    vhdlTransportTok,       ## transport
    vhdlTypeTok,            ## type
    vhdlUnaffected,         ## unaffected
    vhdlUnitsTok,           ## units
    vhdlUntilTok,           ## until
    vhdlUseTok,             ## use
    vhdlVariableTok,        ## variable
    vhdlVmodeTok,           ## vmode
    vhdlVpropTok,           ## vprop
    vhdlVunitTok,           ## vunit
    vhdlWaitTok,            ## wait
    vhdlWhenTok,            ## when
    vhdlWhileTok,           ## while
    vhdlWithTok,            ## with
    vhdlWithinTok,          ## within
    vhdlXnorTok,            ## xnor
    vhdlXorTok,             ## xor
    vhdlSingleLCurlyTok,    ## {
    vhdlSinglePipeTok,      ## |
    vhdlSinglePipeSingleMinusSingleGreaterThanTok, ## |->
    vhdlSinglePipeSingleEqualSingleGreaterThanTok, ## |=>
    vhdlSingleRCurlyTok,    ## }
    vhdlSyntaxError          ## Tree-sitter parser syntax error
type
  VhdlExternalTok* = enum
type
  VhdlNode* = distinct TSNode
type
  VhdlParser* = distinct PtsParser
proc tsNodeType*(node: VhdlNode): string
proc kind*(node: VhdlNode): VhdlNodeKind =
  case node.tsNodeType
  of "PSL_Actual_Parameter":
    vhdlPSLActualParameter
  of "PSL_Actual_Parameter_List":
    vhdlPSLActualParameterList
  of "PSL_Assert_Directive":
    vhdlPSLAssertDirective
  of "PSL_Assume_Directive":
    vhdlPSLAssumeDirective
  of "PSL_Assume_Guarantee_Directive":
    vhdlPSLAssumeGuaranteeDirective
  of "PSL_Bounding_FL_Property":
    vhdlPSLBoundingFLProperty
  of "PSL_Braced_SERE":
    vhdlPSLBracedSERE
  of "PSL_Built_In_Function_Call":
    vhdlPSLBuiltInFunctionCall
  of "PSL_Clock_Declaration":
    vhdlPSLClockDeclaration
  of "PSL_Clocked_FL_Property":
    vhdlPSLClockedFLProperty
  of "PSL_Clocked_SERE":
    vhdlPSLClockedSERE
  of "PSL_Constant_Parameter_Specification":
    vhdlPSLConstantParameterSpecification
  of "PSL_Cover_Directive":
    vhdlPSLCoverDirective
  of "PSL_Expression":
    vhdlPSLExpression
  of "PSL_Extended_Ocurrence_FL_Property":
    vhdlPSLExtendedOcurrenceFLProperty
  of "PSL_Factor_FL_Property":
    vhdlPSLFactorFLProperty
  of "PSL_Fairness_Directive":
    vhdlPSLFairnessDirective
  of "PSL_Formal_Parameter":
    vhdlPSLFormalParameter
  of "PSL_Formal_Parameter_List":
    vhdlPSLFormalParameterList
  of "PSL_HDL_Type":
    vhdlPSLHDLType
  of "PSL_Hierarchical_HDL_Name":
    vhdlPSLHierarchicalHDLName
  of "PSL_Implication_FL_Property":
    vhdlPSLImplicationFLProperty
  of "PSL_Inherit_Spec":
    vhdlPSLInheritSpec
  of "PSL_Invariant_FL_Property":
    vhdlPSLInvariantFLProperty
  of "PSL_Logical_FL_Property":
    vhdlPSLLogicalFLProperty
  of "PSL_Ocurrence_FL_Property":
    vhdlPSLOcurrenceFLProperty
  of "PSL_Parameter_Specification":
    vhdlPSLParameterSpecification
  of "PSL_Parameterized_Property":
    vhdlPSLParameterizedProperty
  of "PSL_Parameterized_SERE":
    vhdlPSLParameterizedSERE
  of "PSL_Parameters_Definition":
    vhdlPSLParametersDefinition
  of "PSL_Parenthesized_FL_Property":
    vhdlPSLParenthesizedFLProperty
  of "PSL_Property_Declaration":
    vhdlPSLPropertyDeclaration
  of "PSL_Property_Instance":
    vhdlPSLPropertyInstance
  of "PSL_Property_Replicator":
    vhdlPSLPropertyReplicator
  of "PSL_Repeated_SERE":
    vhdlPSLRepeatedSERE
  of "PSL_Restrict_Directive":
    vhdlPSLRestrictDirective
  of "PSL_Restrict_Guarantee_Directive":
    vhdlPSLRestrictGuaranteeDirective
  of "PSL_SERE_And":
    vhdlPSLSEREAnd
  of "PSL_SERE_Concatenation":
    vhdlPSLSEREConcatenation
  of "PSL_SERE_Fusion":
    vhdlPSLSEREFusion
  of "PSL_SERE_Or":
    vhdlPSLSEREOr
  of "PSL_SERE_Within":
    vhdlPSLSEREWithin
  of "PSL_Sequence_Declaration":
    vhdlPSLSequenceDeclaration
  of "PSL_Sequence_Instance":
    vhdlPSLSequenceInstance
  of "PSL_Sequential_FL_Property":
    vhdlPSLSequentialFLProperty
  of "PSL_Strong_Fairness_Directive":
    vhdlPSLStrongFairnessDirective
  of "PSL_Suffix_Implication_FL_Property":
    vhdlPSLSuffixImplicationFLProperty
  of "PSL_Temporal_Parameter_Specification":
    vhdlPSLTemporalParameterSpecification
  of "PSL_Termination_FL_Property":
    vhdlPSLTerminationFLProperty
  of "PSL_Type_Class":
    vhdlPSLTypeClass
  of "PSL_VMode":
    vhdlPSLVMode
  of "PSL_VProp":
    vhdlPSLVProp
  of "PSL_VUnit":
    vhdlPSLVUnit
  of "PSL_Value_Set":
    vhdlPSLValueSet
  of "absolute_pathname":
    vhdlAbsolutePathname
  of "access_type_definition":
    vhdlAccessTypeDefinition
  of "aggregate":
    vhdlAggregate
  of "alias_declaration":
    vhdlAliasDeclaration
  of "all":
    vhdlAll
  of "allocator":
    vhdlAllocator
  of "alternative_conditional_expression":
    vhdlAlternativeConditionalExpression
  of "alternative_conditional_waveform":
    vhdlAlternativeConditionalWaveform
  of "alternative_selected_expressions":
    vhdlAlternativeSelectedExpressions
  of "ambiguous_name":
    vhdlAmbiguousName
  of "architecture_body":
    vhdlArchitectureBody
  of "array_constraint":
    vhdlArrayConstraint
  of "ascending_range":
    vhdlAscendingRange
  of "assertion_statement":
    vhdlAssertionStatement
  of "association_list":
    vhdlAssociationList
  of "attribute_declaration":
    vhdlAttributeDeclaration
  of "attribute_name":
    vhdlAttributeName
  of "attribute_specification":
    vhdlAttributeSpecification
  of "based_integer":
    vhdlBasedInteger
  of "based_literal":
    vhdlBasedLiteral
  of "based_real":
    vhdlBasedReal
  of "binding_indication":
    vhdlBindingIndication
  of "bit_string_literal":
    vhdlBitStringLiteral
  of "bit_value":
    vhdlBitValue
  of "block_configuration":
    vhdlBlockConfiguration
  of "block_specification":
    vhdlBlockSpecification
  of "block_statement":
    vhdlBlockStatement
  of "case_generate_alternative":
    vhdlCaseGenerateAlternative
  of "case_generate_statement":
    vhdlCaseGenerateStatement
  of "case_statement":
    vhdlCaseStatement
  of "case_statement_alternative":
    vhdlCaseStatementAlternative
  of "character_literal":
    vhdlCharacterLiteral
  of "choices":
    vhdlChoices
  of "comment":
    vhdlComment
  of "component_configuration":
    vhdlComponentConfiguration
  of "component_declaration":
    vhdlComponentDeclaration
  of "component_instantiation":
    vhdlComponentInstantiation
  of "component_instantiation_statement":
    vhdlComponentInstantiationStatement
  of "component_specification":
    vhdlComponentSpecification
  of "compound_configuration_specification":
    vhdlCompoundConfigurationSpecification
  of "concatenation":
    vhdlConcatenation
  of "concurrent_statement_part":
    vhdlConcurrentStatementPart
  of "condition":
    vhdlCondition
  of "condition_clause":
    vhdlConditionClause
  of "conditional_expressions":
    vhdlConditionalExpressions
  of "conditional_force_assignment":
    vhdlConditionalForceAssignment
  of "conditional_variable_assignment":
    vhdlConditionalVariableAssignment
  of "conditional_waveform_assignment":
    vhdlConditionalWaveformAssignment
  of "conditional_waveforms":
    vhdlConditionalWaveforms
  of "configuration_aspect":
    vhdlConfigurationAspect
  of "configuration_declaration":
    vhdlConfigurationDeclaration
  of "configuration_instantiation":
    vhdlConfigurationInstantiation
  of "constant_declaration":
    vhdlConstantDeclaration
  of "constrained_array_definition":
    vhdlConstrainedArrayDefinition
  of "context_clause":
    vhdlContextClause
  of "context_declaration":
    vhdlContextDeclaration
  of "context_reference":
    vhdlContextReference
  of "declarative_part":
    vhdlDeclarativePart
  of "default_expression":
    vhdlDefaultExpression
  of "deferred_constant_declaration":
    vhdlDeferredConstantDeclaration
  of "descending_range":
    vhdlDescendingRange
  of "design_file":
    vhdlDesignFile
  of "design_unit":
    vhdlDesignUnit
  of "disconnection_specification":
    vhdlDisconnectionSpecification
  of "element_asociation":
    vhdlElementAsociation
  of "element_declaration":
    vhdlElementDeclaration
  of "else":
    vhdlElse
  of "else_generate":
    vhdlElseGenerate
  of "elsif":
    vhdlElsif
  of "elsif_generate":
    vhdlElsifGenerate
  of "entity_aspect":
    vhdlEntityAspect
  of "entity_class":
    vhdlEntityClass
  of "entity_class_entry":
    vhdlEntityClassEntry
  of "entity_class_entry_list":
    vhdlEntityClassEntryList
  of "entity_declaration":
    vhdlEntityDeclaration
  of "entity_designator":
    vhdlEntityDesignator
  of "entity_instantiation":
    vhdlEntityInstantiation
  of "entity_name_list":
    vhdlEntityNameList
  of "entity_specification":
    vhdlEntitySpecification
  of "enumeration_type_definition":
    vhdlEnumerationTypeDefinition
  of "exit_statement":
    vhdlExitStatement
  of "exponentiation":
    vhdlExponentiation
  of "expression_list":
    vhdlExpressionList
  of "external_constant_name":
    vhdlExternalConstantName
  of "external_signal_name":
    vhdlExternalSignalName
  of "external_variable_name":
    vhdlExternalVariableName
  of "factor":
    vhdlFactor
  of "file_declaration":
    vhdlFileDeclaration
  of "file_open_information":
    vhdlFileOpenInformation
  of "file_type_definition":
    vhdlFileTypeDefinition
  of "for_generate_statement":
    vhdlForGenerateStatement
  of "for_loop":
    vhdlForLoop
  of "force_mode":
    vhdlForceMode
  of "formal_function_parameter_clause":
    vhdlFormalFunctionParameterClause
  of "formal_procedure_parameter_clause":
    vhdlFormalProcedureParameterClause
  of "full_type_declaration":
    vhdlFullTypeDeclaration
  of "function_call":
    vhdlFunctionCall
  of "function_instantiation_declaration":
    vhdlFunctionInstantiationDeclaration
  of "generate_statement_body":
    vhdlGenerateStatementBody
  of "generate_statement_element":
    vhdlGenerateStatementElement
  of "generic_association_list":
    vhdlGenericAssociationList
  of "generic_clause":
    vhdlGenericClause
  of "generic_map_aspect":
    vhdlGenericMapAspect
  of "group_constituent_list":
    vhdlGroupConstituentList
  of "group_declaration":
    vhdlGroupDeclaration
  of "group_template_declaration":
    vhdlGroupTemplateDeclaration
  of "guarded_conditional_signal_assignment":
    vhdlGuardedConditionalSignalAssignment
  of "guarded_selected_signal_assignment":
    vhdlGuardedSelectedSignalAssignment
  of "guarded_signal_specification":
    vhdlGuardedSignalSpecification
  of "guarded_simple_signal_assignment":
    vhdlGuardedSimpleSignalAssignment
  of "header":
    vhdlHeader
  of "identifier_list":
    vhdlIdentifierList
  of "if":
    vhdlIf
  of "if_generate":
    vhdlIfGenerate
  of "if_generate_statement":
    vhdlIfGenerateStatement
  of "if_statement":
    vhdlIfStatement
  of "impure_function_specification":
    vhdlImpureFunctionSpecification
  of "incomplete_type_declaration":
    vhdlIncompleteTypeDeclaration
  of "index_constraint":
    vhdlIndexConstraint
  of "index_subtype_definition":
    vhdlIndexSubtypeDefinition
  of "inertial":
    vhdlInertial
  of "inertial_expression":
    vhdlInertialExpression
  of "instantiation_list":
    vhdlInstantiationList
  of "integer_decimal":
    vhdlIntegerDecimal
  of "interface_constant_declaration":
    vhdlInterfaceConstantDeclaration
  of "interface_file_declaration":
    vhdlInterfaceFileDeclaration
  of "interface_package_declaration":
    vhdlInterfacePackageDeclaration
  of "interface_signal_declaration":
    vhdlInterfaceSignalDeclaration
  of "interface_subprogram_declaration":
    vhdlInterfaceSubprogramDeclaration
  of "interface_subprogram_default":
    vhdlInterfaceSubprogramDefault
  of "interface_type_declaration":
    vhdlInterfaceTypeDeclaration
  of "interface_variable_declaration":
    vhdlInterfaceVariableDeclaration
  of "label":
    vhdlLabel
  of "library_clause":
    vhdlLibraryClause
  of "logical_expression":
    vhdlLogicalExpression
  of "logical_name_list":
    vhdlLogicalNameList
  of "loop_statement":
    vhdlLoopStatement
  of "map_aspect":
    vhdlMapAspect
  of "mode":
    vhdlMode
  of "named_association_element":
    vhdlNamedAssociationElement
  of "negative_exponent":
    vhdlNegativeExponent
  of "next_statement":
    vhdlNextStatement
  of "null":
    vhdlNull
  of "null_statement":
    vhdlNullStatement
  of "numeric_type_definition":
    vhdlNumericTypeDefinition
  of "open":
    vhdlOpen
  of "operator_symbol":
    vhdlOperatorSymbol
  of "others":
    vhdlOthers
  of "package_body":
    vhdlPackageBody
  of "package_declaration":
    vhdlPackageDeclaration
  of "package_instantiation_declaration":
    vhdlPackageInstantiationDeclaration
  of "package_pathname":
    vhdlPackagePathname
  of "parameter_specification":
    vhdlParameterSpecification
  of "parenthesized_expression":
    vhdlParenthesizedExpression
  of "parenthesized_resolution":
    vhdlParenthesizedResolution
  of "pathname_element":
    vhdlPathnameElement
  of "physical_literal":
    vhdlPhysicalLiteral
  of "physical_type_definition":
    vhdlPhysicalTypeDefinition
  of "port_association_list":
    vhdlPortAssociationList
  of "port_clause":
    vhdlPortClause
  of "port_map_aspect":
    vhdlPortMapAspect
  of "positional_association_element":
    vhdlPositionalAssociationElement
  of "positive_exponent":
    vhdlPositiveExponent
  of "primary_unit_declaration":
    vhdlPrimaryUnitDeclaration
  of "procedure_call_statement":
    vhdlProcedureCallStatement
  of "procedure_instantiation_declaration":
    vhdlProcedureInstantiationDeclaration
  of "procedure_specification":
    vhdlProcedureSpecification
  of "process_statement":
    vhdlProcessStatement
  of "protected_type_body":
    vhdlProtectedTypeBody
  of "protected_type_body_declarative_part":
    vhdlProtectedTypeBodyDeclarativePart
  of "protected_type_declaration":
    vhdlProtectedTypeDeclaration
  of "pure_function_specification":
    vhdlPureFunctionSpecification
  of "qualified_expression":
    vhdlQualifiedExpression
  of "range_attribute_function_call":
    vhdlRangeAttributeFunctionCall
  of "range_attribute_name":
    vhdlRangeAttributeName
  of "range_constraint":
    vhdlRangeConstraint
  of "real_decimal":
    vhdlRealDecimal
  of "record_constraint":
    vhdlRecordConstraint
  of "record_element_constraint":
    vhdlRecordElementConstraint
  of "record_element_resolution":
    vhdlRecordElementResolution
  of "record_resolution":
    vhdlRecordResolution
  of "record_type_definition":
    vhdlRecordTypeDefinition
  of "reduction":
    vhdlReduction
  of "relation":
    vhdlRelation
  of "relative_pathname":
    vhdlRelativePathname
  of "report":
    vhdlReport
  of "report_statement":
    vhdlReportStatement
  of "return":
    vhdlReturn
  of "return_statement":
    vhdlReturnStatement
  of "secondary_unit_declaration":
    vhdlSecondaryUnitDeclaration
  of "selected_expressions":
    vhdlSelectedExpressions
  of "selected_force_assignment":
    vhdlSelectedForceAssignment
  of "selected_name":
    vhdlSelectedName
  of "selected_variable_assignment":
    vhdlSelectedVariableAssignment
  of "selected_waveform_assignment":
    vhdlSelectedWaveformAssignment
  of "selected_waveforms":
    vhdlSelectedWaveforms
  of "sensitivity_clause":
    vhdlSensitivityClause
  of "sensitivity_list":
    vhdlSensitivityList
  of "sequence_of_statements":
    vhdlSequenceOfStatements
  of "severity":
    vhdlSeverity
  of "shared_variable_declaration":
    vhdlSharedVariableDeclaration
  of "shift_expression":
    vhdlShiftExpression
  of "sign":
    vhdlSign
  of "signal_declaration":
    vhdlSignalDeclaration
  of "signal_kind":
    vhdlSignalKind
  of "signal_list":
    vhdlSignalList
  of "signature":
    vhdlSignature
  of "simple_configuration_specification":
    vhdlSimpleConfigurationSpecification
  of "simple_expression":
    vhdlSimpleExpression
  of "simple_force_assignment":
    vhdlSimpleForceAssignment
  of "simple_release_assignment":
    vhdlSimpleReleaseAssignment
  of "simple_variable_assignment":
    vhdlSimpleVariableAssignment
  of "simple_waveform_assignment":
    vhdlSimpleWaveformAssignment
  of "slice_name":
    vhdlSliceName
  of "string_literal":
    vhdlStringLiteral
  of "subprogram_body":
    vhdlSubprogramBody
  of "subprogram_declaration":
    vhdlSubprogramDeclaration
  of "subprogram_kind":
    vhdlSubprogramKind
  of "subtype_declaration":
    vhdlSubtypeDeclaration
  of "subtype_indication":
    vhdlSubtypeIndication
  of "term":
    vhdlTerm
  of "timeout_clause":
    vhdlTimeoutClause
  of "transport":
    vhdlTransport
  of "type_mark":
    vhdlTypeMark
  of "unbounded_array_definition":
    vhdlUnboundedArrayDefinition
  of "use_clause":
    vhdlUseClause
  of "variable_declaration":
    vhdlVariableDeclaration
  of "verification_unit_binding_indication":
    vhdlVerificationUnitBindingIndication
  of "verification_unit_list":
    vhdlVerificationUnitList
  of "wait_statement":
    vhdlWaitStatement
  of "waveform_element":
    vhdlWaveformElement
  of "waveforms":
    vhdlWaveforms
  of "while_loop":
    vhdlWhileLoop
  of "!":
    vhdlSingleExclamationTok
  of "\"":
    vhdlSingleQuoteTok
  of "#":
    vhdlSingleHashTok
  of "&":
    vhdlSingleAmpersandTok
  of "&&":
    vhdlDoubleAmpersandTok
  of "\'":
    vhdlSingleApostropheTok
  of "(":
    vhdlSingleLParTok
  of ")":
    vhdlSingleRParTok
  of "*":
    vhdlSingleAsteriskTok
  of "**":
    vhdlDoubleAsteriskTok
  of "+":
    vhdlSinglePlusTok
  of ",":
    vhdlSingleCommaTok
  of "-":
    vhdlSingleMinusTok
  of "->":
    vhdlSingleMinusSingleGreaterThanTok
  of ".":
    vhdlSingleDotTok
  of "/":
    vhdlSingleSlashTok
  of "/=":
    vhdlSingleSlashSingleEqualTok
  of ":":
    vhdlSingleColonTok
  of ":=":
    vhdlSingleColonSingleEqualTok
  of ";":
    vhdlSingleSemicolonTok
  of "<":
    vhdlSingleLessThanTok
  of "<->":
    vhdlSingleLessThanSingleMinusSingleGreaterThanTok
  of "<<":
    vhdlDoubleLessThanTok
  of "<=":
    vhdlSingleLessThanSingleEqualTok
  of "=":
    vhdlSingleEqualTok
  of "=>":
    vhdlSingleEqualSingleGreaterThanTok
  of ">":
    vhdlSingleGreaterThanTok
  of ">=":
    vhdlSingleGreaterThanSingleEqualTok
  of ">>":
    vhdlDoubleGreaterThanTok
  of "?/=":
    vhdlSingleQuestionSingleSlashSingleEqualTok
  of "?<":
    vhdlSingleQuestionSingleLessThanTok
  of "?<=":
    vhdlSingleQuestionSingleLessThanSingleEqualTok
  of "?=":
    vhdlSingleQuestionSingleEqualTok
  of "?>":
    vhdlSingleQuestionSingleGreaterThanTok
  of "?>=":
    vhdlSingleQuestionSingleGreaterThanSingleEqualTok
  of "??":
    vhdlDoubleQuestionTok
  of "@":
    vhdlSingleAtTok
  of "PSL_Built_In_Function_Name":
    vhdlPSLBuiltInFunctionName
  of "PSL_Identifier":
    vhdlPSLIdentifier
  of "[":
    vhdlSingleLBrackTok
  of "]":
    vhdlSingleRBrackTok
  of "^.":
    vhdlSingleAccentSingleDotTok
  of "abort":
    vhdlAbortTok
  of "abs":
    vhdlAbsTok
  of "access":
    vhdlAccessTok
  of "after":
    vhdlAfterTok
  of "alias":
    vhdlAliasTok
  of "always":
    vhdlAlwaysTok
  of "and":
    vhdlAndTok
  of "any":
    vhdlAny
  of "architecture":
    vhdlArchitectureTok
  of "array":
    vhdlArrayTok
  of "assert":
    vhdlAssertTok
  of "assume":
    vhdlAssumeTok
  of "assume_guarantee":
    vhdlAssumeGuaranteeTok
  of "async_abort":
    vhdlAsyncAbortTok
  of "attribute":
    vhdlAttributeTok
  of "attribute_designator":
    vhdlAttributeDesignator
  of "base":
    vhdlBase
  of "based_literal_error":
    vhdlBasedLiteralError
  of "begin":
    vhdlBeginTok
  of "bit":
    vhdlBitTok
  of "bit_value_error":
    vhdlBitValueError
  of "bit_vector":
    vhdlBitVectorTok
  of "block":
    vhdlBlockTok
  of "body":
    vhdlBodyTok
  of "boolean":
    vhdlBooleanTok
  of "buffer":
    vhdlBufferTok
  of "bus":
    vhdlBusTok
  of "case":
    vhdlCaseTok
  of "clock":
    vhdlClockTok
  of "component":
    vhdlComponentTok
  of "configuration":
    vhdlConfigurationTok
  of "const":
    vhdlConstTok
  of "constant":
    vhdlConstantTok
  of "context":
    vhdlContextTok
  of "countones":
    vhdlCountonesTok
  of "cover":
    vhdlCoverTok
  of "default":
    vhdlDefault
  of "disconnect":
    vhdlDisconnectTok
  of "downto":
    vhdlDowntoTok
  of "end":
    vhdlEndTok
  of "entity":
    vhdlEntityTok
  of "escape_sequence":
    vhdlEscapeSequence
  of "eventually":
    vhdlEventuallyTok
  of "exit":
    vhdlExitTok
  of "fairness":
    vhdlFairnessTok
  of "fell":
    vhdlFellTok
  of "file":
    vhdlFileTok
  of "for":
    vhdlForTok
  of "forall":
    vhdlForallTok
  of "force":
    vhdlForceTok
  of "function":
    vhdlFunctionTok
  of "generate":
    vhdlGenerateTok
  of "generic":
    vhdlGenericTok
  of "group":
    vhdlGroupTok
  of "guarded":
    vhdlGuardedTok
  of "hdltype":
    vhdlHdltypeTok
  of "identifier":
    vhdlIdentifier
  of "impure":
    vhdlImpureTok
  of "in":
    vhdlInTok
  of "inherit":
    vhdlInheritTok
  of "inout":
    vhdlInoutTok
  of "integer":
    vhdlInteger
  of "is":
    vhdlIsTok
  of "isunknown":
    vhdlIsunknownTok
  of "library":
    vhdlLibraryTok
  of "linkage":
    vhdlLinkageTok
  of "literal":
    vhdlLiteralTok
  of "loop":
    vhdlLoopTok
  of "map":
    vhdlMapTok
  of "mod":
    vhdlModTok
  of "nand":
    vhdlNandTok
  of "never":
    vhdlNeverTok
  of "new":
    vhdlNewTok
  of "next":
    vhdlNextTok
  of "next_a":
    vhdlNextATok
  of "next_e":
    vhdlNextETok
  of "next_event":
    vhdlNextEventTok
  of "next_event_a":
    vhdlNextEventATok
  of "next_event_e":
    vhdlNextEventETok
  of "nondet":
    vhdlNondetTok
  of "nondet_vector":
    vhdlNondetVectorTok
  of "nor":
    vhdlNorTok
  of "not":
    vhdlNotTok
  of "numeric":
    vhdlNumericTok
  of "of":
    vhdlOfTok
  of "on":
    vhdlOnTok
  of "onehot":
    vhdlOnehotTok
  of "onehot0":
    vhdlOnehot0Tok
  of "or":
    vhdlOrTok
  of "out":
    vhdlOutTok
  of "package":
    vhdlPackageTok
  of "parameter":
    vhdlParameterTok
  of "port":
    vhdlPortTok
  of "postponed":
    vhdlPostponedTok
  of "prev":
    vhdlPrevTok
  of "procedure":
    vhdlProcedureTok
  of "process":
    vhdlProcessTok
  of "property":
    vhdlPropertyTok
  of "protected":
    vhdlProtectedTok
  of "pure":
    vhdlPureTok
  of "range":
    vhdlRangeTok
  of "range_attribute_designator":
    vhdlRangeAttributeDesignator
  of "record":
    vhdlRecordTok
  of "register":
    vhdlRegisterTok
  of "reject":
    vhdlRejectTok
  of "release":
    vhdlReleaseTok
  of "rem":
    vhdlRemTok
  of "restrict":
    vhdlRestrictTok
  of "restrict_guarantee":
    vhdlRestrictGuaranteeTok
  of "rol":
    vhdlRolTok
  of "ror":
    vhdlRorTok
  of "rose":
    vhdlRoseTok
  of "same":
    vhdlSame
  of "select":
    vhdlSelectTok
  of "semicolon":
    vhdlSemicolon
  of "sequence":
    vhdlSequenceTok
  of "shared":
    vhdlSharedTok
  of "signal":
    vhdlSignalTok
  of "simple_name":
    vhdlSimpleName
  of "sla":
    vhdlSlaTok
  of "sll":
    vhdlSllTok
  of "sra":
    vhdlSraTok
  of "srl":
    vhdlSrlTok
  of "stable":
    vhdlStableTok
  of "string":
    vhdlStringTok
  of "strong":
    vhdlStrongTok
  of "subtype":
    vhdlSubtypeTok
  of "sync_abort":
    vhdlSyncAbortTok
  of "then":
    vhdlThenTok
  of "to":
    vhdlToTok
  of "tool_directive":
    vhdlToolDirective
  of "type":
    vhdlTypeTok
  of "unaffected":
    vhdlUnaffected
  of "units":
    vhdlUnitsTok
  of "until":
    vhdlUntilTok
  of "use":
    vhdlUseTok
  of "variable":
    vhdlVariableTok
  of "vmode":
    vhdlVmodeTok
  of "vprop":
    vhdlVpropTok
  of "vunit":
    vhdlVunitTok
  of "wait":
    vhdlWaitTok
  of "when":
    vhdlWhenTok
  of "while":
    vhdlWhileTok
  of "with":
    vhdlWithTok
  of "within":
    vhdlWithinTok
  of "xnor":
    vhdlXnorTok
  of "xor":
    vhdlXorTok
  of "{":
    vhdlSingleLCurlyTok
  of "|":
    vhdlSinglePipeTok
  of "|->":
    vhdlSinglePipeSingleMinusSingleGreaterThanTok
  of "|=>":
    vhdlSinglePipeSingleEqualSingleGreaterThanTok
  of "}":
    vhdlSingleRCurlyTok
  of "ERROR":
    vhdlSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_vhdl(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: VhdlNode): string =
  $ts_node_type(TSNode(node))

proc newVhdlParser*(): VhdlParser =
  result = VhdlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_vhdl())

proc parseString*(parser: VhdlParser; str: string): VhdlNode =
  VhdlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: VhdlNode; idx: int; withUnnamed: bool = false): VhdlNode =
  if withUnnamed:
    VhdlNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    VhdlNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: VhdlNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: VhdlNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: VhdlNode; withUnnamed: bool = false): VhdlNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: VhdlNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: VhdlNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: VhdlNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
