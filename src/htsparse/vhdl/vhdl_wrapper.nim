
import
  hmisc / wrappers / treesitter

import
  strutils

type
  VhdlNodeKind* = enum
    vhdlPSLActualParameter, ## PSL_Actual_Parameter
    vhdlPSLActualParameterList, ## PSL_Actual_Parameter_List
    vhdlPSLAmbiguousInstance, ## PSL_Ambiguous_Instance
    vhdlPSLAnyType,         ## PSL_Any_Type
    vhdlPSLAssertDirective, ## PSL_Assert_Directive
    vhdlPSLAssumeDirective, ## PSL_Assume_Directive
    vhdlPSLAssumeGuaranteeDirective, ## PSL_Assume_Guarantee_Directive
    vhdlPSLBoolean,         ## PSL_Boolean
    vhdlPSLBoundingFLProperty, ## PSL_Bounding_FL_Property
    vhdlPSLBracedSERE,      ## PSL_Braced_SERE
    vhdlPSLBuiltInFunctionCall, ## PSL_Built_In_Function_Call
    vhdlPSLClockDeclaration, ## PSL_Clock_Declaration
    vhdlPSLClockedFLProperty, ## PSL_Clocked_FL_Property
    vhdlPSLClockedSERE,     ## PSL_Clocked_SERE
    vhdlPSLCompoundSERE,    ## PSL_Compound_SERE
    vhdlPSLConstantParameterSpecification, ## PSL_Constant_Parameter_Specification
    vhdlPSLCount,           ## PSL_Count
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
    vhdlPSLIndexRange,      ## PSL_Index_Range
    vhdlPSLInheritSpec,     ## PSL_Inherit_Spec
    vhdlPSLInvariantFLProperty, ## PSL_Invariant_FL_Property
    vhdlPSLLogicalFLProperty, ## PSL_Logical_FL_Property
    vhdlPSLNumber,          ## PSL_Number
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
    vhdlPSLSequenceDeclaration, ## PSL_Sequence_Declaration
    vhdlPSLSequenceInstance, ## PSL_Sequence_Instance
    vhdlPSLSequentialFLProperty, ## PSL_Sequential_FL_Property
    vhdlPSLSimpleSERE,      ## PSL_Simple_SERE
    vhdlPSLStrongFairnessDirective, ## PSL_Strong_Fairness_Directive
    vhdlPSLSuffixImplicationFLProperty, ## PSL_Suffix_Implication_FL_Property
    vhdlPSLTemporalParameterSpecification, ## PSL_Temporal_Parameter_Specification
    vhdlPSLTerminationFLProperty, ## PSL_Termination_FL_Property
    vhdlPSLTypeClass,       ## PSL_Type_Class
    vhdlPSLUnionExpression, ## PSL_Union_Expression
    vhdlPSLVMOde,           ## PSL_VMode
    vhdlPSLVPRop,           ## PSL_VProp
    vhdlPSLVUNit,           ## PSL_VUnit
    vhdlPSLValueSet,        ## PSL_Value_Set
    vhdlPSLVerificationUnitBody, ## PSL_Verification_Unit_Body
    vhdlAbsolutePathname,   ## absolute_pathname
    vhdlAccessTypeDefinition, ## access_type_definition
    vhdlAggregate,          ## aggregate
    vhdlAliasDeclaration,   ## alias_declaration
    vhdlAll,                ## all
    vhdlAllocator,          ## allocator
    vhdlAlternativeConditionalExpressions, ## alternative_conditional_expressions
    vhdlAlternativeConditionalWaveforms, ## alternative_conditional_waveforms
    vhdlAlternativeSelectedExpressions, ## alternative_selected_expressions
    vhdlAlternativeSelectedWaveforms, ## alternative_selected_waveforms
    vhdlAmbiguousName,      ## ambiguous_name
    vhdlArchitectureBody,   ## architecture_body
    vhdlArrayConstraint,    ## array_constraint
    vhdlAscendingRange,     ## ascending_range
    vhdlAssertionStatement, ## assertion_statement
    vhdlAssociationList,    ## association_list
    vhdlAttributeDeclaration, ## attribute_declaration
    vhdlAttributeName,      ## attribute_name
    vhdlAttributeSpecification, ## attribute_specification
    vhdlBase,               ## base
    vhdlBasedInteger,       ## based_integer
    vhdlBasedLiteral,       ## based_literal
    vhdlBasedReal,          ## based_real
    vhdlBindingIndication,  ## binding_indication
    vhdlBitStringLiteral,   ## bit_string_literal
    vhdlBitValue,           ## bit_value
    vhdlBlockConfiguration, ## block_configuration
    vhdlBlockHeader,        ## block_header
    vhdlBlockSpecification, ## block_specification
    vhdlBlockStatement,     ## block_statement
    vhdlBoolean,            ## boolean
    vhdlCaseGenerateAlternative, ## case_generate_alternative
    vhdlCaseGenerateStatement, ## case_generate_statement
    vhdlCaseStatement,      ## case_statement
    vhdlCaseStatementAlternative, ## case_statement_alternative
    vhdlCharacterLiteral,   ## character_literal
    vhdlChoices,            ## choices
    vhdlComment,            ## comment
    vhdlComponentConfiguration, ## component_configuration
    vhdlComponentDeclaration, ## component_declaration
    vhdlComponentHeader,    ## component_header
    vhdlComponentInstantiation, ## component_instantiation
    vhdlComponentInstantiationStatement, ## component_instantiation_statement
    vhdlComponentMapAspect, ## component_map_aspect
    vhdlConcatenation,      ## concatenation
    vhdlConcurrentStatementPart, ## concurrent_statement_part
    vhdlCondition,          ## condition
    vhdlConditionalConcurrentSignalAssignment, ## conditional_concurrent_signal_assignment
    vhdlConditionalExpression, ## conditional_expression
    vhdlConditionalExpressions, ## conditional_expressions
    vhdlConditionalForceAssignment, ## conditional_force_assignment
    vhdlConditionalVariableAssignment, ## conditional_variable_assignment
    vhdlConditionalWaveformAssignment, ## conditional_waveform_assignment
    vhdlConditionalWaveforms, ## conditional_waveforms
    vhdlConfigurationDeclaration, ## configuration_declaration
    vhdlConfigurationInstantiation, ## configuration_instantiation
    vhdlConfigurationSpecification, ## configuration_specification
    vhdlConstantDeclaration, ## constant_declaration
    vhdlConstantInterfaceDeclaration, ## constant_interface_declaration
    vhdlConstrainedArrayDefinition, ## constrained_array_definition
    vhdlContextClause,      ## context_clause
    vhdlContextDeclaration, ## context_declaration
    vhdlContextList,        ## context_list
    vhdlContextReference,   ## context_reference
    vhdlDeclarativePart,    ## declarative_part
    vhdlDefault,            ## default
    vhdlDefaultExpression,  ## default_expression
    vhdlDelayMechanism,     ## delay_mechanism
    vhdlDescendingRange,    ## descending_range
    vhdlDesignFile,         ## design_file
    vhdlDesignUnit,         ## design_unit
    vhdlDisconnectionSpecification, ## disconnection_specification
    vhdlElementDeclaration, ## element_declaration
    vhdlElse,               ## else
    vhdlElseGenerate,       ## else_generate
    vhdlElsif,              ## elsif
    vhdlElsifGenerate,      ## elsif_generate
    vhdlEntityClass,        ## entity_class
    vhdlEntityClassEntry,   ## entity_class_entry
    vhdlEntityClassEntryList, ## entity_class_entry_list
    vhdlEntityDeclaration,  ## entity_declaration
    vhdlEntityDesignator,   ## entity_designator
    vhdlEntityHeader,       ## entity_header
    vhdlEntityInstantiation, ## entity_instantiation
    vhdlEntityNameList,     ## entity_name_list
    vhdlEntitySpecification, ## entity_specification
    vhdlEnumerationTypeDefinition, ## enumeration_type_definition
    vhdlExitStatement,      ## exit_statement
    vhdlExponentiation,     ## exponentiation
    vhdlExpression,         ## expression
    vhdlExpressionList,     ## expression_list
    vhdlExternalConstantName, ## external_constant_name
    vhdlExternalSignalName, ## external_signal_name
    vhdlExternalVariableName, ## external_variable_name
    vhdlFactor,             ## factor
    vhdlFileDeclaration,    ## file_declaration
    vhdlFileInterfaceDeclaration, ## file_interface_declaration
    vhdlFileOpenInformation, ## file_open_information
    vhdlFileOpenKind,       ## file_open_kind
    vhdlFileTypeDefinition, ## file_type_definition
    vhdlForGenerateStatement, ## for_generate_statement
    vhdlForLoop,            ## for_loop
    vhdlForceMode,          ## force_mode
    vhdlFullTypeDeclaration, ## full_type_declaration
    vhdlFunctionBody,       ## function_body
    vhdlFunctionCall,       ## function_call
    vhdlFunctionDeclaration, ## function_declaration
    vhdlFunctionInstantiationDeclaration, ## function_instantiation_declaration
    vhdlFunctionInterfaceDeclaration, ## function_interface_declaration
    vhdlFunctionParameterClause, ## function_parameter_clause
    vhdlGenerateStatementBody, ## generate_statement_body
    vhdlGenerateStatementElement, ## generate_statement_element
    vhdlGenericClause,      ## generic_clause
    vhdlGenericMapAspect,   ## generic_map_aspect
    vhdlGroupConstituentList, ## group_constituent_list
    vhdlGroupDeclaration,   ## group_declaration
    vhdlGroupTemplateDeclaration, ## group_template_declaration
    vhdlGuardedSignalSpecification, ## guarded_signal_specification
    vhdlIdentifierList,     ## identifier_list
    vhdlIf,                 ## if
    vhdlIfGenerate,         ## if_generate
    vhdlIfGenerateStatement, ## if_generate_statement
    vhdlIfStatement,        ## if_statement
    vhdlIllegal,            ## illegal
    vhdlIncompleteTypeDeclaration, ## incomplete_type_declaration
    vhdlIndexConstraint,    ## index_constraint
    vhdlIndexSubtypeDefinition, ## index_subtype_definition
    vhdlInertial,           ## inertial
    vhdlInertialExpression, ## inertial_expression
    vhdlInstantiationList,  ## instantiation_list
    vhdlInteger,            ## integer
    vhdlIntegerDecimal,     ## integer_decimal
    vhdlInterfaceSubprogramDefault, ## interface_subprogram_default
    vhdlLabel,              ## label
    vhdlLength,             ## length
    vhdlLibraryClause,      ## library_clause
    vhdlLogicalExpression,  ## logical_expression
    vhdlLogicalNameList,    ## logical_name_list
    vhdlLoopStatement,      ## loop_statement
    vhdlMode,               ## mode
    vhdlNamedAssociationElement, ## named_association_element
    vhdlNamedElementAssociation, ## named_element_association
    vhdlNextStatement,      ## next_statement
    vhdlNull,               ## null
    vhdlNullStatement,      ## null_statement
    vhdlNumericTypeDefinition, ## numeric_type_definition
    vhdlOpen,               ## open
    vhdlOperatorSymbol,     ## operator_symbol
    vhdlOthers,             ## others
    vhdlPackageBody,        ## package_body
    vhdlPackageDeclaration, ## package_declaration
    vhdlPackageHeader,      ## package_header
    vhdlPackageInstantiationDeclaration, ## package_instantiation_declaration
    vhdlPackageInterfaceDeclaration, ## package_interface_declaration
    vhdlPackageMapAspect,   ## package_map_aspect
    vhdlPackagePathname,    ## package_pathname
    vhdlParameterSpecification, ## parameter_specification
    vhdlParenthesizedExpression, ## parenthesized_expression
    vhdlParenthesizedResolution, ## parenthesized_resolution
    vhdlPathnameElement,    ## pathname_element
    vhdlPhysicalLiteral,    ## physical_literal
    vhdlPhysicalTypeDefinition, ## physical_type_definition
    vhdlPortClause,         ## port_clause
    vhdlPortMapAspect,      ## port_map_aspect
    vhdlPositionalAssociationElement, ## positional_association_element
    vhdlPositionalElementAssociation, ## positional_element_association
    vhdlPredefinedDesignator, ## predefined_designator
    vhdlPrimaryUnitDeclaration, ## primary_unit_declaration
    vhdlProcedureBody,      ## procedure_body
    vhdlProcedureCallStatement, ## procedure_call_statement
    vhdlProcedureDeclaration, ## procedure_declaration
    vhdlProcedureInstantiationDeclaration, ## procedure_instantiation_declaration
    vhdlProcedureInterfaceDeclaration, ## procedure_interface_declaration
    vhdlProcedureParameterClause, ## procedure_parameter_clause
    vhdlProcessStatement,   ## process_statement
    vhdlProtectedTypeBody,  ## protected_type_body
    vhdlProtectedTypeDeclaration, ## protected_type_declaration
    vhdlQualifiedExpression, ## qualified_expression
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
    vhdlReportStatement,    ## report_statement
    vhdlResolutionFunction, ## resolution_function
    vhdlReturn,             ## return
    vhdlReturnStatement,    ## return_statement
    vhdlSecondaryUnitDeclaration, ## secondary_unit_declaration
    vhdlSelectedConcurrentSignalAssignment, ## selected_concurrent_signal_assignment
    vhdlSelectedExpressions, ## selected_expressions
    vhdlSelectedForceAssignment, ## selected_force_assignment
    vhdlSelectedName,       ## selected_name
    vhdlSelectedVariableAssignment, ## selected_variable_assignment
    vhdlSelectedWaveformAssignment, ## selected_waveform_assignment
    vhdlSelectedWaveforms,  ## selected_waveforms
    vhdlSensitivityList,    ## sensitivity_list
    vhdlSeparator,          ## separator
    vhdlSequenceOfStatements, ## sequence_of_statements
    vhdlSeverityExpression, ## severity_expression
    vhdlSharedVariableDeclaration, ## shared_variable_declaration
    vhdlShiftExpression,    ## shift_expression
    vhdlSign,               ## sign
    vhdlSignalDeclaration,  ## signal_declaration
    vhdlSignalInterfaceDeclaration, ## signal_interface_declaration
    vhdlSignalKind,         ## signal_kind
    vhdlSignalList,         ## signal_list
    vhdlSignature,          ## signature
    vhdlSimpleConcurrentSignalAssignment, ## simple_concurrent_signal_assignment
    vhdlSimpleExpression,   ## simple_expression
    vhdlSimpleForceAssignment, ## simple_force_assignment
    vhdlSimpleReleaseAssignment, ## simple_release_assignment
    vhdlSimpleVariableAssignment, ## simple_variable_assignment
    vhdlSimpleWaveformAssignment, ## simple_waveform_assignment
    vhdlSliceName,          ## slice_name
    vhdlStringExpression,   ## string_expression
    vhdlStringLiteral,      ## string_literal
    vhdlSubprogramHeader,   ## subprogram_header
    vhdlSubprogramMapAspect, ## subprogram_map_aspect
    vhdlSubtypeDeclaration, ## subtype_declaration
    vhdlSubtypeIndication,  ## subtype_indication
    vhdlTerm,               ## term
    vhdlTimeExpression,     ## time_expression
    vhdlToolDirective,      ## tool_directive
    vhdlTransport,          ## transport
    vhdlTypeInterfaceDeclaration, ## type_interface_declaration
    vhdlTypeMark,           ## type_mark
    vhdlUnaffected,         ## unaffected
    vhdlUnboundedArrayDefinition, ## unbounded_array_definition
    vhdlUseClause,          ## use_clause
    vhdlVariableDeclaration, ## variable_declaration
    vhdlVariableInterfaceDeclaration, ## variable_interface_declaration
    vhdlVerificationUnitBindingIndication, ## verification_unit_binding_indication
    vhdlVerificationUnitList, ## verification_unit_list
    vhdlWaitStatement,      ## wait_statement
    vhdlWaveformElement,    ## waveform_element
    vhdlWaveforms,          ## waveforms
    vhdlWhileLoop,          ## while_loop
    vhdlExclamationTok,     ## !
    vhdlExclamationEqualTok, ## !=
    vhdlQuoteTok,           ## "
    vhdlHashTok,            ## #
    vhdlAmpersandTok,       ## &
    vhdlDoubleAmpersandTok, ## &&
    vhdlApostropheTok,      ## '
    vhdlLParTok,            ## (
    vhdlRParTok,            ## )
    vhdlAsteriskTok,        ## *
    vhdlDoubleAsteriskTok,  ## **
    vhdlPlusTok,            ## +
    vhdlCommaTok,           ## ,
    vhdlMinusTok,           ## -
    vhdlDoubleMinusTok,     ## --
    vhdlMinusGreaterThanTok, ## ->
    vhdlDotTok,             ## .
    vhdlSlashTok,           ## /
    vhdlSlashAsteriskTok,   ## /*
    vhdlSlashEqualTok,      ## /=
    vhdl0Tok,               ## 0
    vhdl1Tok,               ## 1
    vhdl2Tok,               ## 2
    vhdl3Tok,               ## 3
    vhdl4Tok,               ## 4
    vhdl5Tok,               ## 5
    vhdl6Tok,               ## 6
    vhdl7Tok,               ## 7
    vhdl8Tok,               ## 8
    vhdl9Tok,               ## 9
    vhdlColonTok,           ## :
    vhdlColonEqualTok,      ## :=
    vhdlSemicolonTok,       ## ;
    vhdlLessThanTok,        ## <
    vhdlLessThanMinusGreaterThanTok, ## <->
    vhdlDoubleLessThanTok,  ## <<
    vhdlLessThanEqualTok,   ## <=
    vhdlEqualTok,           ## =
    vhdlDoubleEqualTok,     ## ==
    vhdlEqualGreaterThanTok, ## =>
    vhdlGreaterThanTok,     ## >
    vhdlGreaterThanEqualTok, ## >=
    vhdlDoubleGreaterThanTok, ## >>
    vhdlQuestionTok,        ## ?
    vhdlQuestionSlashEqualTok, ## ?/=
    vhdlQuestionLessThanTok, ## ?<
    vhdlQuestionLessThanEqualTok, ## ?<=
    vhdlQuestionEqualTok,   ## ?=
    vhdlQuestionGreaterThanTok, ## ?>
    vhdlQuestionGreaterThanEqualTok, ## ?>=
    vhdlDoubleQuestionTok,  ## ??
    vhdlAtTok,              ## @
    vhdlLBrackTok,          ## [
    vhdlRBrackTok,          ## ]
    vhdlAccentDotTok,       ## ^.
    vhdlUnderscoreTok,      ## _
    vhdlBacktickTok,        ## `
    vhdlAbortTok,           ## abort
    vhdlAbsTok,             ## abs
    vhdlAccessTok,          ## access
    vhdlActiveTok,          ## active
    vhdlAfterTok,           ## after
    vhdlAliasTok,           ## alias
    vhdlAllTok,             ## all
    vhdlAlwaysTok,          ## always
    vhdlAndTok,             ## and
    vhdlAny,                ## any
    vhdlArchitectureTok,    ## architecture
    vhdlArrayTok,           ## array
    vhdlAscendingTok,       ## ascending
    vhdlAssertTok,          ## assert
    vhdlAssumeTok,          ## assume
    vhdlAssumeGuaranteeTok, ## assume_guarantee
    vhdlAsyncAbortTok,      ## async_abort
    vhdlAttributeTok,       ## attribute
    vhdlBaseTok,            ## base
    vhdlBaseSpecifier,      ## base_specifier
    vhdlBeforeTok,          ## before
    vhdlBeginTok,           ## begin
    vhdlBitTok,             ## bit
    vhdlBitVectorTok,       ## bit_vector
    vhdlBlockTok,           ## block
    vhdlBodyTok,            ## body
    vhdlBooleanTok,         ## boolean
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
    vhdlDefaultTok,         ## default
    vhdlDelayedTok,         ## delayed
    vhdlDescendingTok,      ## descending
    vhdlDisconnectTok,      ## disconnect
    vhdlDontCare,           ## dont_care
    vhdlDowntoTok,          ## downto
    vhdlDrivingTok,         ## driving
    vhdlDrivingValueTok,    ## driving_value
    vhdlElementTok,         ## element
    vhdlElseTok,            ## else
    vhdlElsifTok,           ## elsif
    vhdlEndTok,             ## end
    vhdlEndedTok,           ## ended
    vhdlEntityTok,          ## entity
    vhdlEscapeSequence,     ## escape_sequence
    vhdlEventTok,           ## event
    vhdlEventuallyTok,      ## eventually
    vhdlExitTok,            ## exit
    vhdlExponent,           ## exponent
    vhdlExtendedIdentifier, ## extended_identifier
    vhdlExtendedSimpleName, ## extended_simple_name
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
    vhdlHighTok,            ## high
    vhdlIdentifier,         ## identifier
    vhdlIfTok,              ## if
    vhdlImageTok,           ## image
    vhdlImpureTok,          ## impure
    vhdlInTok,              ## in
    vhdlInertialTok,        ## inertial
    vhdlInheritTok,         ## inherit
    vhdlInoutTok,           ## inout
    vhdlInstanceNameTok,    ## instance_name
    vhdlIsTok,              ## is
    vhdlIsunknownTok,       ## isunknown
    vhdlLabelTok,           ## label
    vhdlLastActiveTok,      ## last_active
    vhdlLastEventTok,       ## last_event
    vhdlLastValueTok,       ## last_value
    vhdlLeftTok,            ## left
    vhdlLeftofTok,          ## leftof
    vhdlLengthTok,          ## length
    vhdlLibraryTok,         ## library
    vhdlLinkageTok,         ## linkage
    vhdlLiteralTok,         ## literal
    vhdlLoopTok,            ## loop
    vhdlLowTok,             ## low
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
    vhdlPathNameTok,        ## path_name
    vhdlPortTok,            ## port
    vhdlPosTok,             ## pos
    vhdlPostponedTok,       ## postponed
    vhdlPredTok,            ## pred
    vhdlPrevTok,            ## prev
    vhdlProcedureTok,       ## procedure
    vhdlProcessTok,         ## process
    vhdlPropertyTok,        ## property
    vhdlProtectedTok,       ## protected
    vhdlPureTok,            ## pure
    vhdlQuietTok,           ## quiet
    vhdlRangeTok,           ## range
    vhdlRecordTok,          ## record
    vhdlRegisterTok,        ## register
    vhdlRejectTok,          ## reject
    vhdlReleaseTok,         ## release
    vhdlRemTok,             ## rem
    vhdlReportTok,          ## report
    vhdlRestrictTok,        ## restrict
    vhdlRestrictGuaranteeTok, ## restrict_guarantee
    vhdlReturnTok,          ## return
    vhdlReverseRangeTok,    ## reverse_range
    vhdlRightTok,           ## right
    vhdlRightofTok,         ## rightof
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
    vhdlSimpleNameTok,      ## simple_name
    vhdlSimpleName,         ## simple_name
    vhdlSlaTok,             ## sla
    vhdlSllTok,             ## sll
    vhdlSraTok,             ## sra
    vhdlSrlTok,             ## srl
    vhdlStableTok,          ## stable
    vhdlStringTok,          ## string
    vhdlStrongTok,          ## strong
    vhdlSubtypeTok,         ## subtype
    vhdlSuccTok,            ## succ
    vhdlSyncAbortTok,       ## sync_abort
    vhdlThenTok,            ## then
    vhdlToTok,              ## to
    vhdlTransactionTok,     ## transaction
    vhdlTransportTok,       ## transport
    vhdlTypeTok,            ## type
    vhdlUnaffectedTok,      ## unaffected
    vhdlUnionTok,           ## union
    vhdlUnitsTok,           ## units
    vhdlUnresolved,         ## unresolved
    vhdlUntilTok,           ## until
    vhdlUseTok,             ## use
    vhdlValTok,             ## val
    vhdlValueTok,           ## value
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
    vhdlLCurlyTok,          ## {
    vhdlPipeTok,            ## |
    vhdlPipeMinusGreaterThanTok, ## |->
    vhdlPipeEqualGreaterThanTok, ## |=>
    vhdlRCurlyTok,          ## }
    vhdlSyntaxError          ## Tree-sitter parser syntax error
type
  VhdlNode* = distinct TSNode
type
  VhdlParser* = distinct PtsParser
proc tsNodeType*(node: VhdlNode): string
proc kind*(node: VhdlNode): VhdlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "PSL_Actual_Parameter":
      vhdlPSLActualParameter
    of "PSL_Actual_Parameter_List":
      vhdlPSLActualParameterList
    of "PSL_Ambiguous_Instance":
      vhdlPSLAmbiguousInstance
    of "PSL_Any_Type":
      vhdlPSLAnyType
    of "PSL_Assert_Directive":
      vhdlPSLAssertDirective
    of "PSL_Assume_Directive":
      vhdlPSLAssumeDirective
    of "PSL_Assume_Guarantee_Directive":
      vhdlPSLAssumeGuaranteeDirective
    of "PSL_Boolean":
      vhdlPSLBoolean
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
    of "PSL_Compound_SERE":
      vhdlPSLCompoundSERE
    of "PSL_Constant_Parameter_Specification":
      vhdlPSLConstantParameterSpecification
    of "PSL_Count":
      vhdlPSLCount
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
    of "PSL_Index_Range":
      vhdlPSLIndexRange
    of "PSL_Inherit_Spec":
      vhdlPSLInheritSpec
    of "PSL_Invariant_FL_Property":
      vhdlPSLInvariantFLProperty
    of "PSL_Logical_FL_Property":
      vhdlPSLLogicalFLProperty
    of "PSL_Number":
      vhdlPSLNumber
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
    of "PSL_Sequence_Declaration":
      vhdlPSLSequenceDeclaration
    of "PSL_Sequence_Instance":
      vhdlPSLSequenceInstance
    of "PSL_Sequential_FL_Property":
      vhdlPSLSequentialFLProperty
    of "PSL_Simple_SERE":
      vhdlPSLSimpleSERE
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
    of "PSL_Union_Expression":
      vhdlPSLUnionExpression
    of "PSL_VMode":
      vhdlPSLVMOde
    of "PSL_VProp":
      vhdlPSLVPRop
    of "PSL_VUnit":
      vhdlPSLVUNit
    of "PSL_Value_Set":
      vhdlPSLValueSet
    of "PSL_Verification_Unit_Body":
      vhdlPSLVerificationUnitBody
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
    of "alternative_conditional_expressions":
      vhdlAlternativeConditionalExpressions
    of "alternative_conditional_waveforms":
      vhdlAlternativeConditionalWaveforms
    of "alternative_selected_expressions":
      vhdlAlternativeSelectedExpressions
    of "alternative_selected_waveforms":
      vhdlAlternativeSelectedWaveforms
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
    of "base":
      vhdlBase
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
    of "block_header":
      vhdlBlockHeader
    of "block_specification":
      vhdlBlockSpecification
    of "block_statement":
      vhdlBlockStatement
    of "boolean":
      vhdlBoolean
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
    of "component_header":
      vhdlComponentHeader
    of "component_instantiation":
      vhdlComponentInstantiation
    of "component_instantiation_statement":
      vhdlComponentInstantiationStatement
    of "component_map_aspect":
      vhdlComponentMapAspect
    of "concatenation":
      vhdlConcatenation
    of "concurrent_statement_part":
      vhdlConcurrentStatementPart
    of "condition":
      vhdlCondition
    of "conditional_concurrent_signal_assignment":
      vhdlConditionalConcurrentSignalAssignment
    of "conditional_expression":
      vhdlConditionalExpression
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
    of "configuration_declaration":
      vhdlConfigurationDeclaration
    of "configuration_instantiation":
      vhdlConfigurationInstantiation
    of "configuration_specification":
      vhdlConfigurationSpecification
    of "constant_declaration":
      vhdlConstantDeclaration
    of "constant_interface_declaration":
      vhdlConstantInterfaceDeclaration
    of "constrained_array_definition":
      vhdlConstrainedArrayDefinition
    of "context_clause":
      vhdlContextClause
    of "context_declaration":
      vhdlContextDeclaration
    of "context_list":
      vhdlContextList
    of "context_reference":
      vhdlContextReference
    of "declarative_part":
      vhdlDeclarativePart
    of "default":
      vhdlDefault
    of "default_expression":
      vhdlDefaultExpression
    of "delay_mechanism":
      vhdlDelayMechanism
    of "descending_range":
      vhdlDescendingRange
    of "design_file":
      vhdlDesignFile
    of "design_unit":
      vhdlDesignUnit
    of "disconnection_specification":
      vhdlDisconnectionSpecification
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
    of "entity_header":
      vhdlEntityHeader
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
    of "expression":
      vhdlExpression
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
    of "file_interface_declaration":
      vhdlFileInterfaceDeclaration
    of "file_open_information":
      vhdlFileOpenInformation
    of "file_open_kind":
      vhdlFileOpenKind
    of "file_type_definition":
      vhdlFileTypeDefinition
    of "for_generate_statement":
      vhdlForGenerateStatement
    of "for_loop":
      vhdlForLoop
    of "force_mode":
      vhdlForceMode
    of "full_type_declaration":
      vhdlFullTypeDeclaration
    of "function_body":
      vhdlFunctionBody
    of "function_call":
      vhdlFunctionCall
    of "function_declaration":
      vhdlFunctionDeclaration
    of "function_instantiation_declaration":
      vhdlFunctionInstantiationDeclaration
    of "function_interface_declaration":
      vhdlFunctionInterfaceDeclaration
    of "function_parameter_clause":
      vhdlFunctionParameterClause
    of "generate_statement_body":
      vhdlGenerateStatementBody
    of "generate_statement_element":
      vhdlGenerateStatementElement
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
    of "guarded_signal_specification":
      vhdlGuardedSignalSpecification
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
    of "illegal":
      vhdlIllegal
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
    of "integer":
      vhdlInteger
    of "integer_decimal":
      vhdlIntegerDecimal
    of "interface_subprogram_default":
      vhdlInterfaceSubprogramDefault
    of "label":
      vhdlLabel
    of "length":
      vhdlLength
    of "library_clause":
      vhdlLibraryClause
    of "logical_expression":
      vhdlLogicalExpression
    of "logical_name_list":
      vhdlLogicalNameList
    of "loop_statement":
      vhdlLoopStatement
    of "mode":
      vhdlMode
    of "named_association_element":
      vhdlNamedAssociationElement
    of "named_element_association":
      vhdlNamedElementAssociation
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
    of "package_header":
      vhdlPackageHeader
    of "package_instantiation_declaration":
      vhdlPackageInstantiationDeclaration
    of "package_interface_declaration":
      vhdlPackageInterfaceDeclaration
    of "package_map_aspect":
      vhdlPackageMapAspect
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
    of "port_clause":
      vhdlPortClause
    of "port_map_aspect":
      vhdlPortMapAspect
    of "positional_association_element":
      vhdlPositionalAssociationElement
    of "positional_element_association":
      vhdlPositionalElementAssociation
    of "predefined_designator":
      vhdlPredefinedDesignator
    of "primary_unit_declaration":
      vhdlPrimaryUnitDeclaration
    of "procedure_body":
      vhdlProcedureBody
    of "procedure_call_statement":
      vhdlProcedureCallStatement
    of "procedure_declaration":
      vhdlProcedureDeclaration
    of "procedure_instantiation_declaration":
      vhdlProcedureInstantiationDeclaration
    of "procedure_interface_declaration":
      vhdlProcedureInterfaceDeclaration
    of "procedure_parameter_clause":
      vhdlProcedureParameterClause
    of "process_statement":
      vhdlProcessStatement
    of "protected_type_body":
      vhdlProtectedTypeBody
    of "protected_type_declaration":
      vhdlProtectedTypeDeclaration
    of "qualified_expression":
      vhdlQualifiedExpression
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
    of "report_statement":
      vhdlReportStatement
    of "resolution_function":
      vhdlResolutionFunction
    of "return":
      vhdlReturn
    of "return_statement":
      vhdlReturnStatement
    of "secondary_unit_declaration":
      vhdlSecondaryUnitDeclaration
    of "selected_concurrent_signal_assignment":
      vhdlSelectedConcurrentSignalAssignment
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
    of "sensitivity_list":
      vhdlSensitivityList
    of "separator":
      vhdlSeparator
    of "sequence_of_statements":
      vhdlSequenceOfStatements
    of "severity_expression":
      vhdlSeverityExpression
    of "shared_variable_declaration":
      vhdlSharedVariableDeclaration
    of "shift_expression":
      vhdlShiftExpression
    of "sign":
      vhdlSign
    of "signal_declaration":
      vhdlSignalDeclaration
    of "signal_interface_declaration":
      vhdlSignalInterfaceDeclaration
    of "signal_kind":
      vhdlSignalKind
    of "signal_list":
      vhdlSignalList
    of "signature":
      vhdlSignature
    of "simple_concurrent_signal_assignment":
      vhdlSimpleConcurrentSignalAssignment
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
    of "string_expression":
      vhdlStringExpression
    of "string_literal":
      vhdlStringLiteral
    of "subprogram_header":
      vhdlSubprogramHeader
    of "subprogram_map_aspect":
      vhdlSubprogramMapAspect
    of "subtype_declaration":
      vhdlSubtypeDeclaration
    of "subtype_indication":
      vhdlSubtypeIndication
    of "term":
      vhdlTerm
    of "time_expression":
      vhdlTimeExpression
    of "tool_directive":
      vhdlToolDirective
    of "transport":
      vhdlTransport
    of "type_interface_declaration":
      vhdlTypeInterfaceDeclaration
    of "type_mark":
      vhdlTypeMark
    of "unaffected":
      vhdlUnaffected
    of "unbounded_array_definition":
      vhdlUnboundedArrayDefinition
    of "use_clause":
      vhdlUseClause
    of "variable_declaration":
      vhdlVariableDeclaration
    of "variable_interface_declaration":
      vhdlVariableInterfaceDeclaration
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
      vhdlExclamationTok
    of "!=":
      vhdlExclamationEqualTok
    of "\"":
      vhdlQuoteTok
    of "#":
      vhdlHashTok
    of "&":
      vhdlAmpersandTok
    of "&&":
      vhdlDoubleAmpersandTok
    of "\'":
      vhdlApostropheTok
    of "(":
      vhdlLParTok
    of ")":
      vhdlRParTok
    of "*":
      vhdlAsteriskTok
    of "**":
      vhdlDoubleAsteriskTok
    of "+":
      vhdlPlusTok
    of ",":
      vhdlCommaTok
    of "-":
      vhdlMinusTok
    of "--":
      vhdlDoubleMinusTok
    of "->":
      vhdlMinusGreaterThanTok
    of ".":
      vhdlDotTok
    of "/":
      vhdlSlashTok
    of "/*":
      vhdlSlashAsteriskTok
    of "/=":
      vhdlSlashEqualTok
    of "0":
      vhdl0Tok
    of "1":
      vhdl1Tok
    of "2":
      vhdl2Tok
    of "3":
      vhdl3Tok
    of "4":
      vhdl4Tok
    of "5":
      vhdl5Tok
    of "6":
      vhdl6Tok
    of "7":
      vhdl7Tok
    of "8":
      vhdl8Tok
    of "9":
      vhdl9Tok
    of ":":
      vhdlColonTok
    of ":=":
      vhdlColonEqualTok
    of ";":
      vhdlSemicolonTok
    of "<":
      vhdlLessThanTok
    of "<->":
      vhdlLessThanMinusGreaterThanTok
    of "<<":
      vhdlDoubleLessThanTok
    of "<=":
      vhdlLessThanEqualTok
    of "=":
      vhdlEqualTok
    of "==":
      vhdlDoubleEqualTok
    of "=>":
      vhdlEqualGreaterThanTok
    of ">":
      vhdlGreaterThanTok
    of ">=":
      vhdlGreaterThanEqualTok
    of ">>":
      vhdlDoubleGreaterThanTok
    of "?":
      vhdlQuestionTok
    of "?/=":
      vhdlQuestionSlashEqualTok
    of "?<":
      vhdlQuestionLessThanTok
    of "?<=":
      vhdlQuestionLessThanEqualTok
    of "?=":
      vhdlQuestionEqualTok
    of "?>":
      vhdlQuestionGreaterThanTok
    of "?>=":
      vhdlQuestionGreaterThanEqualTok
    of "??":
      vhdlDoubleQuestionTok
    of "@":
      vhdlAtTok
    of "[":
      vhdlLBrackTok
    of "]":
      vhdlRBrackTok
    of "^.":
      vhdlAccentDotTok
    of "_":
      vhdlUnderscoreTok
    of "`":
      vhdlBacktickTok
    of "abort":
      vhdlAbortTok
    of "abs":
      vhdlAbsTok
    of "access":
      vhdlAccessTok
    of "active":
      vhdlActiveTok
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
    of "ascending":
      vhdlAscendingTok
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
    of "base_specifier":
      vhdlBaseSpecifier
    of "before":
      vhdlBeforeTok
    of "begin":
      vhdlBeginTok
    of "bit":
      vhdlBitTok
    of "bit_vector":
      vhdlBitVectorTok
    of "block":
      vhdlBlockTok
    of "body":
      vhdlBodyTok
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
    of "delayed":
      vhdlDelayedTok
    of "descending":
      vhdlDescendingTok
    of "disconnect":
      vhdlDisconnectTok
    of "dont_care":
      vhdlDontCare
    of "downto":
      vhdlDowntoTok
    of "driving":
      vhdlDrivingTok
    of "driving_value":
      vhdlDrivingValueTok
    of "element":
      vhdlElementTok
    of "end":
      vhdlEndTok
    of "ended":
      vhdlEndedTok
    of "entity":
      vhdlEntityTok
    of "escape_sequence":
      vhdlEscapeSequence
    of "event":
      vhdlEventTok
    of "eventually":
      vhdlEventuallyTok
    of "exit":
      vhdlExitTok
    of "exponent":
      vhdlExponent
    of "extended_identifier":
      vhdlExtendedIdentifier
    of "extended_simple_name":
      vhdlExtendedSimpleName
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
    of "high":
      vhdlHighTok
    of "identifier":
      vhdlIdentifier
    of "image":
      vhdlImageTok
    of "impure":
      vhdlImpureTok
    of "in":
      vhdlInTok
    of "inherit":
      vhdlInheritTok
    of "inout":
      vhdlInoutTok
    of "instance_name":
      vhdlInstanceNameTok
    of "is":
      vhdlIsTok
    of "isunknown":
      vhdlIsunknownTok
    of "last_active":
      vhdlLastActiveTok
    of "last_event":
      vhdlLastEventTok
    of "last_value":
      vhdlLastValueTok
    of "left":
      vhdlLeftTok
    of "leftof":
      vhdlLeftofTok
    of "library":
      vhdlLibraryTok
    of "linkage":
      vhdlLinkageTok
    of "literal":
      vhdlLiteralTok
    of "loop":
      vhdlLoopTok
    of "low":
      vhdlLowTok
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
    of "path_name":
      vhdlPathNameTok
    of "port":
      vhdlPortTok
    of "pos":
      vhdlPosTok
    of "postponed":
      vhdlPostponedTok
    of "pred":
      vhdlPredTok
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
    of "quiet":
      vhdlQuietTok
    of "range":
      vhdlRangeTok
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
    of "report":
      vhdlReportTok
    of "restrict":
      vhdlRestrictTok
    of "restrict_guarantee":
      vhdlRestrictGuaranteeTok
    of "reverse_range":
      vhdlReverseRangeTok
    of "right":
      vhdlRightTok
    of "rightof":
      vhdlRightofTok
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
    of "severity":
      vhdlSeverityTok
    of "shared":
      vhdlSharedTok
    of "signal":
      vhdlSignalTok
    of "simple_name":
      vhdlSimpleNameTok
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
    of "succ":
      vhdlSuccTok
    of "sync_abort":
      vhdlSyncAbortTok
    of "then":
      vhdlThenTok
    of "to":
      vhdlToTok
    of "transaction":
      vhdlTransactionTok
    of "type":
      vhdlTypeTok
    of "union":
      vhdlUnionTok
    of "units":
      vhdlUnitsTok
    of "unresolved":
      vhdlUnresolved
    of "until":
      vhdlUntilTok
    of "use":
      vhdlUseTok
    of "val":
      vhdlValTok
    of "value":
      vhdlValueTok
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
      vhdlLCurlyTok
    of "|":
      vhdlPipeTok
    of "|->":
      vhdlPipeMinusGreaterThanTok
    of "|=>":
      vhdlPipeEqualGreaterThanTok
    of "}":
      vhdlRCurlyTok
    of "_separator":
      vhdlSeparator
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

proc parseVhdlString*(str: string): VhdlNode =
  let parser = newVhdlParser()
  return parseString(parser, str)

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
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                       ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

iterator pairs*(node: VhdlNode; withUnnamed: bool = false): (int, VhdlNode) =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                              ## nodes.
  for i in 0 ..< node.len(withUnnamed):
    yield (i, node[i, withUnnamed])

func slice*(node: VhdlNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func `[]`*(s: string; node: VhdlNode): string =
  s[node.slice()]

func nodeString*(node: VhdlNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: VhdlNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: VhdlNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: VhdlNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: VhdlNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: VhdlNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: VhdlNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: VhdlNode): VhdlNode =
  VhdlNode(ts_node_parent(TSNode(node)))

func child*(node: VhdlNode; a2: int): VhdlNode =
  VhdlNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: VhdlNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: VhdlNode; a2: int): VhdlNode =
  VhdlNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: VhdlNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: VhdlNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: VhdlNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: VhdlNode): int =
  node.startPoint().row.int

func endLine*(node: VhdlNode): int =
  node.endPoint().row.int

func startColumn*(node: VhdlNode): int =
  node.startPoint().column.int

func endColumn*(node: VhdlNode): int =
  node.endPoint().column.int

func childByFieldName*(self: VhdlNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
