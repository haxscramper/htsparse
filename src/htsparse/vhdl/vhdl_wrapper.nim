import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  VhdlNodeKind* = enum
    vhdlPSLActualParameter                    ## PSL_Actual_Parameter
    vhdlPSLActualParameterList                ## PSL_Actual_Parameter_List
    vhdlPSLAmbiguousInstance                  ## PSL_Ambiguous_Instance
    vhdlPSLAnyType                            ## PSL_Any_Type
    vhdlPSLAssertDirective                    ## PSL_Assert_Directive
    vhdlPSLAssumeDirective                    ## PSL_Assume_Directive
    vhdlPSLAssumeGuaranteeDirective           ## PSL_Assume_Guarantee_Directive
    vhdlPSLBoolean                            ## PSL_Boolean
    vhdlPSLBoundingFLProperty                 ## PSL_Bounding_FL_Property
    vhdlPSLBracedSERE                         ## PSL_Braced_SERE
    vhdlPSLBuiltInFunctionCall                ## PSL_Built_In_Function_Call
    vhdlPSLClockDeclaration                   ## PSL_Clock_Declaration
    vhdlPSLClockedFLProperty                  ## PSL_Clocked_FL_Property
    vhdlPSLClockedSERE                        ## PSL_Clocked_SERE
    vhdlPSLCompoundSERE                       ## PSL_Compound_SERE
    vhdlPSLConstantParameterSpecification     ## PSL_Constant_Parameter_Specification
    vhdlPSLCount                              ## PSL_Count
    vhdlPSLCoverDirective                     ## PSL_Cover_Directive
    vhdlPSLExpression                         ## PSL_Expression
    vhdlPSLExtendedOcurrenceFLProperty        ## PSL_Extended_Ocurrence_FL_Property
    vhdlPSLFactorFLProperty                   ## PSL_Factor_FL_Property
    vhdlPSLFairnessDirective                  ## PSL_Fairness_Directive
    vhdlPSLFormalParameter                    ## PSL_Formal_Parameter
    vhdlPSLFormalParameterList                ## PSL_Formal_Parameter_List
    vhdlPSLHDLType                            ## PSL_HDL_Type
    vhdlPSLHierarchicalHDLName                ## PSL_Hierarchical_HDL_Name
    vhdlPSLImplicationFLProperty              ## PSL_Implication_FL_Property
    vhdlPSLIndexRange                         ## PSL_Index_Range
    vhdlPSLInheritSpec                        ## PSL_Inherit_Spec
    vhdlPSLInvariantFLProperty                ## PSL_Invariant_FL_Property
    vhdlPSLLogicalFLProperty                  ## PSL_Logical_FL_Property
    vhdlPSLNumber                             ## PSL_Number
    vhdlPSLOcurrenceFLProperty                ## PSL_Ocurrence_FL_Property
    vhdlPSLParameterSpecification             ## PSL_Parameter_Specification
    vhdlPSLParameterizedProperty              ## PSL_Parameterized_Property
    vhdlPSLParameterizedSERE                  ## PSL_Parameterized_SERE
    vhdlPSLParametersDefinition               ## PSL_Parameters_Definition
    vhdlPSLParenthesizedFLProperty            ## PSL_Parenthesized_FL_Property
    vhdlPSLPropertyDeclaration                ## PSL_Property_Declaration
    vhdlPSLPropertyInstance                   ## PSL_Property_Instance
    vhdlPSLPropertyReplicator                 ## PSL_Property_Replicator
    vhdlPSLRepeatedSERE                       ## PSL_Repeated_SERE
    vhdlPSLRestrictDirective                  ## PSL_Restrict_Directive
    vhdlPSLRestrictGuaranteeDirective         ## PSL_Restrict_Guarantee_Directive
    vhdlPSLSequenceDeclaration                ## PSL_Sequence_Declaration
    vhdlPSLSequenceInstance                   ## PSL_Sequence_Instance
    vhdlPSLSequentialFLProperty               ## PSL_Sequential_FL_Property
    vhdlPSLSimpleSERE                         ## PSL_Simple_SERE
    vhdlPSLStrongFairnessDirective            ## PSL_Strong_Fairness_Directive
    vhdlPSLSuffixImplicationFLProperty        ## PSL_Suffix_Implication_FL_Property
    vhdlPSLTemporalParameterSpecification     ## PSL_Temporal_Parameter_Specification
    vhdlPSLTerminationFLProperty              ## PSL_Termination_FL_Property
    vhdlPSLTypeClass                          ## PSL_Type_Class
    vhdlPSLUnionExpression                    ## PSL_Union_Expression
    vhdlPSLVMOde                              ## PSL_VMode
    vhdlPSLVPRop                              ## PSL_VProp
    vhdlPSLVUNit                              ## PSL_VUnit
    vhdlPSLValueSet                           ## PSL_Value_Set
    vhdlPSLVerificationUnitBody               ## PSL_Verification_Unit_Body
    vhdlAbsolutePathname                      ## absolute_pathname
    vhdlAccessTypeDefinition                  ## access_type_definition
    vhdlAggregate                             ## aggregate
    vhdlAliasDeclaration                      ## alias_declaration
    vhdlAll                                   ## all
    vhdlAllocator                             ## allocator
    vhdlAlternativeConditionalExpressions     ## alternative_conditional_expressions
    vhdlAlternativeConditionalWaveforms       ## alternative_conditional_waveforms
    vhdlAlternativeSelectedExpressions        ## alternative_selected_expressions
    vhdlAlternativeSelectedWaveforms          ## alternative_selected_waveforms
    vhdlAmbiguousName                         ## ambiguous_name
    vhdlArchitectureBody                      ## architecture_body
    vhdlArrayConstraint                       ## array_constraint
    vhdlAscendingRange                        ## ascending_range
    vhdlAssertionStatement                    ## assertion_statement
    vhdlAssociationList                       ## association_list
    vhdlAttributeDeclaration                  ## attribute_declaration
    vhdlAttributeName                         ## attribute_name
    vhdlAttributeSpecification                ## attribute_specification
    vhdlBase                                  ## base
    vhdlBasedInteger                          ## based_integer
    vhdlBasedLiteral                          ## based_literal
    vhdlBasedReal                             ## based_real
    vhdlBindingIndication                     ## binding_indication
    vhdlBitStringLiteral                      ## bit_string_literal
    vhdlBitValue                              ## bit_value
    vhdlBlockConfiguration                    ## block_configuration
    vhdlBlockHeader                           ## block_header
    vhdlBlockSpecification                    ## block_specification
    vhdlBlockStatement                        ## block_statement
    vhdlBoolean                               ## boolean
    vhdlCaseGenerateAlternative               ## case_generate_alternative
    vhdlCaseGenerateStatement                 ## case_generate_statement
    vhdlCaseStatement                         ## case_statement
    vhdlCaseStatementAlternative              ## case_statement_alternative
    vhdlCharacterLiteral                      ## character_literal
    vhdlChoices                               ## choices
    vhdlComment                               ## comment
    vhdlComponentConfiguration                ## component_configuration
    vhdlComponentDeclaration                  ## component_declaration
    vhdlComponentHeader                       ## component_header
    vhdlComponentInstantiation                ## component_instantiation
    vhdlComponentInstantiationStatement       ## component_instantiation_statement
    vhdlComponentMapAspect                    ## component_map_aspect
    vhdlConcatenation                         ## concatenation
    vhdlConcurrentStatementPart               ## concurrent_statement_part
    vhdlCondition                             ## condition
    vhdlConditionalConcurrentSignalAssignment ## conditional_concurrent_signal_assignment
    vhdlConditionalExpression                 ## conditional_expression
    vhdlConditionalExpressions                ## conditional_expressions
    vhdlConditionalForceAssignment            ## conditional_force_assignment
    vhdlConditionalVariableAssignment         ## conditional_variable_assignment
    vhdlConditionalWaveformAssignment         ## conditional_waveform_assignment
    vhdlConditionalWaveforms                  ## conditional_waveforms
    vhdlConfigurationDeclaration              ## configuration_declaration
    vhdlConfigurationInstantiation            ## configuration_instantiation
    vhdlConfigurationSpecification            ## configuration_specification
    vhdlConstantDeclaration                   ## constant_declaration
    vhdlConstantInterfaceDeclaration          ## constant_interface_declaration
    vhdlConstrainedArrayDefinition            ## constrained_array_definition
    vhdlContextClause                         ## context_clause
    vhdlContextDeclaration                    ## context_declaration
    vhdlContextList                           ## context_list
    vhdlContextReference                      ## context_reference
    vhdlDeclarativePart                       ## declarative_part
    vhdlDefault                               ## default
    vhdlDefaultExpression                     ## default_expression
    vhdlDelayMechanism                        ## delay_mechanism
    vhdlDescendingRange                       ## descending_range
    vhdlDesignFile                            ## design_file
    vhdlDesignUnit                            ## design_unit
    vhdlDisconnectionSpecification            ## disconnection_specification
    vhdlElementDeclaration                    ## element_declaration
    vhdlElse                                  ## else
    vhdlElseGenerate                          ## else_generate
    vhdlElsif                                 ## elsif
    vhdlElsifGenerate                         ## elsif_generate
    vhdlEntityClass                           ## entity_class
    vhdlEntityClassEntry                      ## entity_class_entry
    vhdlEntityClassEntryList                  ## entity_class_entry_list
    vhdlEntityDeclaration                     ## entity_declaration
    vhdlEntityDesignator                      ## entity_designator
    vhdlEntityHeader                          ## entity_header
    vhdlEntityInstantiation                   ## entity_instantiation
    vhdlEntityNameList                        ## entity_name_list
    vhdlEntitySpecification                   ## entity_specification
    vhdlEnumerationTypeDefinition             ## enumeration_type_definition
    vhdlExitStatement                         ## exit_statement
    vhdlExponentiation                        ## exponentiation
    vhdlExpression                            ## expression
    vhdlExpressionList                        ## expression_list
    vhdlExternalConstantName                  ## external_constant_name
    vhdlExternalSignalName                    ## external_signal_name
    vhdlExternalVariableName                  ## external_variable_name
    vhdlFactor                                ## factor
    vhdlFileDeclaration                       ## file_declaration
    vhdlFileInterfaceDeclaration              ## file_interface_declaration
    vhdlFileOpenInformation                   ## file_open_information
    vhdlFileOpenKind                          ## file_open_kind
    vhdlFileTypeDefinition                    ## file_type_definition
    vhdlForGenerateStatement                  ## for_generate_statement
    vhdlForLoop                               ## for_loop
    vhdlForceMode                             ## force_mode
    vhdlFullTypeDeclaration                   ## full_type_declaration
    vhdlFunctionBody                          ## function_body
    vhdlFunctionCall                          ## function_call
    vhdlFunctionDeclaration                   ## function_declaration
    vhdlFunctionInstantiationDeclaration      ## function_instantiation_declaration
    vhdlFunctionInterfaceDeclaration          ## function_interface_declaration
    vhdlFunctionParameterClause               ## function_parameter_clause
    vhdlGenerateStatementBody                 ## generate_statement_body
    vhdlGenerateStatementElement              ## generate_statement_element
    vhdlGenericClause                         ## generic_clause
    vhdlGenericMapAspect                      ## generic_map_aspect
    vhdlGroupConstituentList                  ## group_constituent_list
    vhdlGroupDeclaration                      ## group_declaration
    vhdlGroupTemplateDeclaration              ## group_template_declaration
    vhdlGuardedSignalSpecification            ## guarded_signal_specification
    vhdlIdentifierList                        ## identifier_list
    vhdlIf                                    ## if
    vhdlIfGenerate                            ## if_generate
    vhdlIfGenerateStatement                   ## if_generate_statement
    vhdlIfStatement                           ## if_statement
    vhdlIllegal                               ## illegal
    vhdlIncompleteTypeDeclaration             ## incomplete_type_declaration
    vhdlIndexConstraint                       ## index_constraint
    vhdlIndexSubtypeDefinition                ## index_subtype_definition
    vhdlInertial                              ## inertial
    vhdlInertialExpression                    ## inertial_expression
    vhdlInstantiationList                     ## instantiation_list
    vhdlInteger                               ## integer
    vhdlIntegerDecimal                        ## integer_decimal
    vhdlInterfaceSubprogramDefault            ## interface_subprogram_default
    vhdlLabel                                 ## label
    vhdlLength                                ## length
    vhdlLibraryClause                         ## library_clause
    vhdlLogicalExpression                     ## logical_expression
    vhdlLogicalNameList                       ## logical_name_list
    vhdlLoopStatement                         ## loop_statement
    vhdlMode                                  ## mode
    vhdlNamedAssociationElement               ## named_association_element
    vhdlNamedElementAssociation               ## named_element_association
    vhdlNextStatement                         ## next_statement
    vhdlNull                                  ## null
    vhdlNullStatement                         ## null_statement
    vhdlNumericTypeDefinition                 ## numeric_type_definition
    vhdlOpen                                  ## open
    vhdlOperatorSymbol                        ## operator_symbol
    vhdlOthers                                ## others
    vhdlPackageBody                           ## package_body
    vhdlPackageDeclaration                    ## package_declaration
    vhdlPackageHeader                         ## package_header
    vhdlPackageInstantiationDeclaration       ## package_instantiation_declaration
    vhdlPackageInterfaceDeclaration           ## package_interface_declaration
    vhdlPackageMapAspect                      ## package_map_aspect
    vhdlPackagePathname                       ## package_pathname
    vhdlParameterSpecification                ## parameter_specification
    vhdlParenthesizedExpression               ## parenthesized_expression
    vhdlParenthesizedResolution               ## parenthesized_resolution
    vhdlPathnameElement                       ## pathname_element
    vhdlPhysicalLiteral                       ## physical_literal
    vhdlPhysicalTypeDefinition                ## physical_type_definition
    vhdlPortClause                            ## port_clause
    vhdlPortMapAspect                         ## port_map_aspect
    vhdlPositionalAssociationElement          ## positional_association_element
    vhdlPositionalElementAssociation          ## positional_element_association
    vhdlPredefinedDesignator                  ## predefined_designator
    vhdlPrimaryUnitDeclaration                ## primary_unit_declaration
    vhdlProcedureBody                         ## procedure_body
    vhdlProcedureCallStatement                ## procedure_call_statement
    vhdlProcedureDeclaration                  ## procedure_declaration
    vhdlProcedureInstantiationDeclaration     ## procedure_instantiation_declaration
    vhdlProcedureInterfaceDeclaration         ## procedure_interface_declaration
    vhdlProcedureParameterClause              ## procedure_parameter_clause
    vhdlProcessStatement                      ## process_statement
    vhdlProtectedTypeBody                     ## protected_type_body
    vhdlProtectedTypeDeclaration              ## protected_type_declaration
    vhdlQualifiedExpression                   ## qualified_expression
    vhdlRangeConstraint                       ## range_constraint
    vhdlRealDecimal                           ## real_decimal
    vhdlRecordConstraint                      ## record_constraint
    vhdlRecordElementConstraint               ## record_element_constraint
    vhdlRecordElementResolution               ## record_element_resolution
    vhdlRecordResolution                      ## record_resolution
    vhdlRecordTypeDefinition                  ## record_type_definition
    vhdlReduction                             ## reduction
    vhdlRelation                              ## relation
    vhdlRelativePathname                      ## relative_pathname
    vhdlReportStatement                       ## report_statement
    vhdlResolutionFunction                    ## resolution_function
    vhdlReturn                                ## return
    vhdlReturnStatement                       ## return_statement
    vhdlSecondaryUnitDeclaration              ## secondary_unit_declaration
    vhdlSelectedConcurrentSignalAssignment    ## selected_concurrent_signal_assignment
    vhdlSelectedExpressions                   ## selected_expressions
    vhdlSelectedForceAssignment               ## selected_force_assignment
    vhdlSelectedName                          ## selected_name
    vhdlSelectedVariableAssignment            ## selected_variable_assignment
    vhdlSelectedWaveformAssignment            ## selected_waveform_assignment
    vhdlSelectedWaveforms                     ## selected_waveforms
    vhdlSensitivityList                       ## sensitivity_list
    vhdlSeparator                             ## separator
    vhdlSequenceOfStatements                  ## sequence_of_statements
    vhdlSeverityExpression                    ## severity_expression
    vhdlSharedVariableDeclaration             ## shared_variable_declaration
    vhdlShiftExpression                       ## shift_expression
    vhdlSign                                  ## sign
    vhdlSignalDeclaration                     ## signal_declaration
    vhdlSignalInterfaceDeclaration            ## signal_interface_declaration
    vhdlSignalKind                            ## signal_kind
    vhdlSignalList                            ## signal_list
    vhdlSignature                             ## signature
    vhdlSimpleConcurrentSignalAssignment      ## simple_concurrent_signal_assignment
    vhdlSimpleExpression                      ## simple_expression
    vhdlSimpleForceAssignment                 ## simple_force_assignment
    vhdlSimpleReleaseAssignment               ## simple_release_assignment
    vhdlSimpleVariableAssignment              ## simple_variable_assignment
    vhdlSimpleWaveformAssignment              ## simple_waveform_assignment
    vhdlSliceName                             ## slice_name
    vhdlStringExpression                      ## string_expression
    vhdlStringLiteral                         ## string_literal
    vhdlSubprogramHeader                      ## subprogram_header
    vhdlSubprogramMapAspect                   ## subprogram_map_aspect
    vhdlSubtypeDeclaration                    ## subtype_declaration
    vhdlSubtypeIndication                     ## subtype_indication
    vhdlTerm                                  ## term
    vhdlTimeExpression                        ## time_expression
    vhdlToolDirective                         ## tool_directive
    vhdlTransport                             ## transport
    vhdlTypeInterfaceDeclaration              ## type_interface_declaration
    vhdlTypeMark                              ## type_mark
    vhdlUnaffected                            ## unaffected
    vhdlUnboundedArrayDefinition              ## unbounded_array_definition
    vhdlUseClause                             ## use_clause
    vhdlVariableDeclaration                   ## variable_declaration
    vhdlVariableInterfaceDeclaration          ## variable_interface_declaration
    vhdlVerificationUnitBindingIndication     ## verification_unit_binding_indication
    vhdlVerificationUnitList                  ## verification_unit_list
    vhdlWaitStatement                         ## wait_statement
    vhdlWaveformElement                       ## waveform_element
    vhdlWaveforms                             ## waveforms
    vhdlWhileLoop                             ## while_loop
    vhdlExclamationTok                        ## !
    vhdlExclamationEqualTok                   ## !=
    vhdlQuoteTok                              ## "
    vhdlHashTok                               ## #
    vhdlAmpersandTok                          ## &
    vhdlDoubleAmpersandTok                    ## &&
    vhdlApostropheTok                         ## '
    vhdlLParTok                               ## (
    vhdlRParTok                               ## )
    vhdlAsteriskTok                           ## *
    vhdlDoubleAsteriskTok                     ## **
    vhdlAsteriskSlashTok                      ## */
    vhdlPlusTok                               ## +
    vhdlCommaTok                              ## ,
    vhdlMinusTok                              ## -
    vhdlDoubleMinusTok                        ## --
    vhdlMinusGreaterThanTok                   ## ->
    vhdlDotTok                                ## .
    vhdlSlashTok                              ## /
    vhdlSlashAsteriskTok                      ## /*
    vhdlSlashEqualTok                         ## /=
    vhdl0Tok                                  ## 0
    vhdl1Tok                                  ## 1
    vhdl2Tok                                  ## 2
    vhdl3Tok                                  ## 3
    vhdl4Tok                                  ## 4
    vhdl5Tok                                  ## 5
    vhdl6Tok                                  ## 6
    vhdl7Tok                                  ## 7
    vhdl8Tok                                  ## 8
    vhdl9Tok                                  ## 9
    vhdlColonTok                              ## :
    vhdlColonEqualTok                         ## :=
    vhdlSemicolonTok                          ## ;
    vhdlLessThanTok                           ## <
    vhdlLessThanMinusGreaterThanTok           ## <->
    vhdlDoubleLessThanTok                     ## <<
    vhdlLessThanEqualTok                      ## <=
    vhdlEqualTok                              ## =
    vhdlDoubleEqualTok                        ## ==
    vhdlEqualGreaterThanTok                   ## =>
    vhdlGreaterThanTok                        ## >
    vhdlGreaterThanEqualTok                   ## >=
    vhdlDoubleGreaterThanTok                  ## >>
    vhdlQuestionTok                           ## ?
    vhdlQuestionSlashEqualTok                 ## ?/=
    vhdlQuestionLessThanTok                   ## ?<
    vhdlQuestionLessThanEqualTok              ## ?<=
    vhdlQuestionEqualTok                      ## ?=
    vhdlQuestionGreaterThanTok                ## ?>
    vhdlQuestionGreaterThanEqualTok           ## ?>=
    vhdlDoubleQuestionTok                     ## ??
    vhdlAtTok                                 ## @
    vhdlLBrackTok                             ## [
    vhdlRBrackTok                             ## ]
    vhdlAccentDotTok                          ## ^.
    vhdlUnderscoreTok                         ## _
    vhdlBacktickTok                           ## `
    vhdlAbortTok                              ## abort
    vhdlAbsTok                                ## abs
    vhdlAccessTok                             ## access
    vhdlActiveTok                             ## active
    vhdlAfterTok                              ## after
    vhdlAliasTok                              ## alias
    vhdlAllTok                                ## all
    vhdlAlwaysTok                             ## always
    vhdlAndTok                                ## and
    vhdlAny                                   ## any
    vhdlArchitectureTok                       ## architecture
    vhdlArrayTok                              ## array
    vhdlAscendingTok                          ## ascending
    vhdlAssertTok                             ## assert
    vhdlAssumeTok                             ## assume
    vhdlAssumeGuaranteeTok                    ## assume_guarantee
    vhdlAsyncAbortTok                         ## async_abort
    vhdlAttributeTok                          ## attribute
    vhdlBaseTok                               ## base
    vhdlBaseSpecifier                         ## base_specifier
    vhdlBeforeTok                             ## before
    vhdlBeginTok                              ## begin
    vhdlBitTok                                ## bit
    vhdlBitVectorTok                          ## bit_vector
    vhdlBlockTok                              ## block
    vhdlBodyTok                               ## body
    vhdlBooleanTok                            ## boolean
    vhdlBufferTok                             ## buffer
    vhdlBusTok                                ## bus
    vhdlCaseTok                               ## case
    vhdlClockTok                              ## clock
    vhdlComponentTok                          ## component
    vhdlConfigurationTok                      ## configuration
    vhdlConstTok                              ## const
    vhdlConstantTok                           ## constant
    vhdlContextTok                            ## context
    vhdlCountonesTok                          ## countones
    vhdlCoverTok                              ## cover
    vhdlDefaultTok                            ## default
    vhdlDelayedTok                            ## delayed
    vhdlDescendingTok                         ## descending
    vhdlDisconnectTok                         ## disconnect
    vhdlDontCare                              ## dont_care
    vhdlDowntoTok                             ## downto
    vhdlDrivingTok                            ## driving
    vhdlDrivingValueTok                       ## driving_value
    vhdlElementTok                            ## element
    vhdlElseTok                               ## else
    vhdlElsifTok                              ## elsif
    vhdlEndTok                                ## end
    vhdlEndedTok                              ## ended
    vhdlEntityTok                             ## entity
    vhdlEscapeSequence                        ## escape_sequence
    vhdlEventTok                              ## event
    vhdlEventuallyTok                         ## eventually
    vhdlExitTok                               ## exit
    vhdlExponent                              ## exponent
    vhdlExtendedIdentifier                    ## extended_identifier
    vhdlExtendedSimpleName                    ## extended_simple_name
    vhdlFairnessTok                           ## fairness
    vhdlFellTok                               ## fell
    vhdlFileTok                               ## file
    vhdlForTok                                ## for
    vhdlForallTok                             ## forall
    vhdlForceTok                              ## force
    vhdlFunctionTok                           ## function
    vhdlGenerateTok                           ## generate
    vhdlGenericTok                            ## generic
    vhdlGroupTok                              ## group
    vhdlGuardedTok                            ## guarded
    vhdlHdltypeTok                            ## hdltype
    vhdlHighTok                               ## high
    vhdlIdentifier                            ## identifier
    vhdlIfTok                                 ## if
    vhdlImageTok                              ## image
    vhdlImpureTok                             ## impure
    vhdlInTok                                 ## in
    vhdlInertialTok                           ## inertial
    vhdlInheritTok                            ## inherit
    vhdlInoutTok                              ## inout
    vhdlInstanceNameTok                       ## instance_name
    vhdlIsTok                                 ## is
    vhdlIsunknownTok                          ## isunknown
    vhdlLabelTok                              ## label
    vhdlLastActiveTok                         ## last_active
    vhdlLastEventTok                          ## last_event
    vhdlLastValueTok                          ## last_value
    vhdlLeftTok                               ## left
    vhdlLeftofTok                             ## leftof
    vhdlLengthTok                             ## length
    vhdlLibraryTok                            ## library
    vhdlLinkageTok                            ## linkage
    vhdlLiteralTok                            ## literal
    vhdlLoopTok                               ## loop
    vhdlLowTok                                ## low
    vhdlMapTok                                ## map
    vhdlModTok                                ## mod
    vhdlNandTok                               ## nand
    vhdlNeverTok                              ## never
    vhdlNewTok                                ## new
    vhdlNextTok                               ## next
    vhdlNextATok                              ## next_a
    vhdlNextETok                              ## next_e
    vhdlNextEventTok                          ## next_event
    vhdlNextEventATok                         ## next_event_a
    vhdlNextEventETok                         ## next_event_e
    vhdlNondetTok                             ## nondet
    vhdlNondetVectorTok                       ## nondet_vector
    vhdlNorTok                                ## nor
    vhdlNotTok                                ## not
    vhdlNullTok                               ## null
    vhdlNumericTok                            ## numeric
    vhdlOfTok                                 ## of
    vhdlOnTok                                 ## on
    vhdlOnehotTok                             ## onehot
    vhdlOnehot0Tok                            ## onehot0
    vhdlOpenTok                               ## open
    vhdlOrTok                                 ## or
    vhdlOthersTok                             ## others
    vhdlOutTok                                ## out
    vhdlPackageTok                            ## package
    vhdlParameterTok                          ## parameter
    vhdlPathNameTok                           ## path_name
    vhdlPortTok                               ## port
    vhdlPosTok                                ## pos
    vhdlPostponedTok                          ## postponed
    vhdlPredTok                               ## pred
    vhdlPrevTok                               ## prev
    vhdlProcedureTok                          ## procedure
    vhdlProcessTok                            ## process
    vhdlPropertyTok                           ## property
    vhdlProtectedTok                          ## protected
    vhdlPureTok                               ## pure
    vhdlQuietTok                              ## quiet
    vhdlRangeTok                              ## range
    vhdlRecordTok                             ## record
    vhdlRegisterTok                           ## register
    vhdlRejectTok                             ## reject
    vhdlReleaseTok                            ## release
    vhdlRemTok                                ## rem
    vhdlReportTok                             ## report
    vhdlRestrictTok                           ## restrict
    vhdlRestrictGuaranteeTok                  ## restrict_guarantee
    vhdlReturnTok                             ## return
    vhdlReverseRangeTok                       ## reverse_range
    vhdlRightTok                              ## right
    vhdlRightofTok                            ## rightof
    vhdlRolTok                                ## rol
    vhdlRorTok                                ## ror
    vhdlRoseTok                               ## rose
    vhdlSame                                  ## same
    vhdlSelectTok                             ## select
    vhdlSemicolon                             ## semicolon
    vhdlSequenceTok                           ## sequence
    vhdlSeverityTok                           ## severity
    vhdlSharedTok                             ## shared
    vhdlSignalTok                             ## signal
    vhdlSimpleNameTok                         ## simple_name
    vhdlSimpleName                            ## simple_name
    vhdlSlaTok                                ## sla
    vhdlSllTok                                ## sll
    vhdlSraTok                                ## sra
    vhdlSrlTok                                ## srl
    vhdlStableTok                             ## stable
    vhdlStringTok                             ## string
    vhdlStrongTok                             ## strong
    vhdlSubtypeTok                            ## subtype
    vhdlSuccTok                               ## succ
    vhdlSyncAbortTok                          ## sync_abort
    vhdlThenTok                               ## then
    vhdlToTok                                 ## to
    vhdlTransactionTok                        ## transaction
    vhdlTransportTok                          ## transport
    vhdlTypeTok                               ## type
    vhdlUnaffectedTok                         ## unaffected
    vhdlUnionTok                              ## union
    vhdlUnitsTok                              ## units
    vhdlUnresolved                            ## unresolved
    vhdlUntilTok                              ## until
    vhdlUseTok                                ## use
    vhdlValTok                                ## val
    vhdlValueTok                              ## value
    vhdlVariableTok                           ## variable
    vhdlVmodeTok                              ## vmode
    vhdlVpropTok                              ## vprop
    vhdlVunitTok                              ## vunit
    vhdlWaitTok                               ## wait
    vhdlWhenTok                               ## when
    vhdlWhileTok                              ## while
    vhdlWithTok                               ## with
    vhdlWithinTok                             ## within
    vhdlXnorTok                               ## xnor
    vhdlXorTok                                ## xor
    vhdlLCurlyTok                             ## {
    vhdlPipeTok                               ## |
    vhdlPipeMinusGreaterThanTok               ## |->
    vhdlPipeEqualGreaterThanTok               ## |=>
    vhdlRCurlyTok                             ## }
    vhdlSyntaxError                           ## Tree-sitter parser syntax error


proc strRepr*(kind: VhdlNodeKind): string =
  case kind:
    of vhdlPSLActualParameter:                    "PSL_Actual_Parameter"
    of vhdlPSLActualParameterList:                "PSL_Actual_Parameter_List"
    of vhdlPSLAmbiguousInstance:                  "PSL_Ambiguous_Instance"
    of vhdlPSLAnyType:                            "PSL_Any_Type"
    of vhdlPSLAssertDirective:                    "PSL_Assert_Directive"
    of vhdlPSLAssumeDirective:                    "PSL_Assume_Directive"
    of vhdlPSLAssumeGuaranteeDirective:           "PSL_Assume_Guarantee_Directive"
    of vhdlPSLBoolean:                            "PSL_Boolean"
    of vhdlPSLBoundingFLProperty:                 "PSL_Bounding_FL_Property"
    of vhdlPSLBracedSERE:                         "PSL_Braced_SERE"
    of vhdlPSLBuiltInFunctionCall:                "PSL_Built_In_Function_Call"
    of vhdlPSLClockDeclaration:                   "PSL_Clock_Declaration"
    of vhdlPSLClockedFLProperty:                  "PSL_Clocked_FL_Property"
    of vhdlPSLClockedSERE:                        "PSL_Clocked_SERE"
    of vhdlPSLCompoundSERE:                       "PSL_Compound_SERE"
    of vhdlPSLConstantParameterSpecification:     "PSL_Constant_Parameter_Specification"
    of vhdlPSLCount:                              "PSL_Count"
    of vhdlPSLCoverDirective:                     "PSL_Cover_Directive"
    of vhdlPSLExpression:                         "PSL_Expression"
    of vhdlPSLExtendedOcurrenceFLProperty:        "PSL_Extended_Ocurrence_FL_Property"
    of vhdlPSLFactorFLProperty:                   "PSL_Factor_FL_Property"
    of vhdlPSLFairnessDirective:                  "PSL_Fairness_Directive"
    of vhdlPSLFormalParameter:                    "PSL_Formal_Parameter"
    of vhdlPSLFormalParameterList:                "PSL_Formal_Parameter_List"
    of vhdlPSLHDLType:                            "PSL_HDL_Type"
    of vhdlPSLHierarchicalHDLName:                "PSL_Hierarchical_HDL_Name"
    of vhdlPSLImplicationFLProperty:              "PSL_Implication_FL_Property"
    of vhdlPSLIndexRange:                         "PSL_Index_Range"
    of vhdlPSLInheritSpec:                        "PSL_Inherit_Spec"
    of vhdlPSLInvariantFLProperty:                "PSL_Invariant_FL_Property"
    of vhdlPSLLogicalFLProperty:                  "PSL_Logical_FL_Property"
    of vhdlPSLNumber:                             "PSL_Number"
    of vhdlPSLOcurrenceFLProperty:                "PSL_Ocurrence_FL_Property"
    of vhdlPSLParameterSpecification:             "PSL_Parameter_Specification"
    of vhdlPSLParameterizedProperty:              "PSL_Parameterized_Property"
    of vhdlPSLParameterizedSERE:                  "PSL_Parameterized_SERE"
    of vhdlPSLParametersDefinition:               "PSL_Parameters_Definition"
    of vhdlPSLParenthesizedFLProperty:            "PSL_Parenthesized_FL_Property"
    of vhdlPSLPropertyDeclaration:                "PSL_Property_Declaration"
    of vhdlPSLPropertyInstance:                   "PSL_Property_Instance"
    of vhdlPSLPropertyReplicator:                 "PSL_Property_Replicator"
    of vhdlPSLRepeatedSERE:                       "PSL_Repeated_SERE"
    of vhdlPSLRestrictDirective:                  "PSL_Restrict_Directive"
    of vhdlPSLRestrictGuaranteeDirective:         "PSL_Restrict_Guarantee_Directive"
    of vhdlPSLSequenceDeclaration:                "PSL_Sequence_Declaration"
    of vhdlPSLSequenceInstance:                   "PSL_Sequence_Instance"
    of vhdlPSLSequentialFLProperty:               "PSL_Sequential_FL_Property"
    of vhdlPSLSimpleSERE:                         "PSL_Simple_SERE"
    of vhdlPSLStrongFairnessDirective:            "PSL_Strong_Fairness_Directive"
    of vhdlPSLSuffixImplicationFLProperty:        "PSL_Suffix_Implication_FL_Property"
    of vhdlPSLTemporalParameterSpecification:     "PSL_Temporal_Parameter_Specification"
    of vhdlPSLTerminationFLProperty:              "PSL_Termination_FL_Property"
    of vhdlPSLTypeClass:                          "PSL_Type_Class"
    of vhdlPSLUnionExpression:                    "PSL_Union_Expression"
    of vhdlPSLVMOde:                              "PSL_VMode"
    of vhdlPSLVPRop:                              "PSL_VProp"
    of vhdlPSLVUNit:                              "PSL_VUnit"
    of vhdlPSLValueSet:                           "PSL_Value_Set"
    of vhdlPSLVerificationUnitBody:               "PSL_Verification_Unit_Body"
    of vhdlAbsolutePathname:                      "absolute_pathname"
    of vhdlAccessTypeDefinition:                  "access_type_definition"
    of vhdlAggregate:                             "aggregate"
    of vhdlAliasDeclaration:                      "alias_declaration"
    of vhdlAll:                                   "all"
    of vhdlAllocator:                             "allocator"
    of vhdlAlternativeConditionalExpressions:     "alternative_conditional_expressions"
    of vhdlAlternativeConditionalWaveforms:       "alternative_conditional_waveforms"
    of vhdlAlternativeSelectedExpressions:        "alternative_selected_expressions"
    of vhdlAlternativeSelectedWaveforms:          "alternative_selected_waveforms"
    of vhdlAmbiguousName:                         "ambiguous_name"
    of vhdlArchitectureBody:                      "architecture_body"
    of vhdlArrayConstraint:                       "array_constraint"
    of vhdlAscendingRange:                        "ascending_range"
    of vhdlAssertionStatement:                    "assertion_statement"
    of vhdlAssociationList:                       "association_list"
    of vhdlAttributeDeclaration:                  "attribute_declaration"
    of vhdlAttributeName:                         "attribute_name"
    of vhdlAttributeSpecification:                "attribute_specification"
    of vhdlBase:                                  "base"
    of vhdlBasedInteger:                          "based_integer"
    of vhdlBasedLiteral:                          "based_literal"
    of vhdlBasedReal:                             "based_real"
    of vhdlBindingIndication:                     "binding_indication"
    of vhdlBitStringLiteral:                      "bit_string_literal"
    of vhdlBitValue:                              "bit_value"
    of vhdlBlockConfiguration:                    "block_configuration"
    of vhdlBlockHeader:                           "block_header"
    of vhdlBlockSpecification:                    "block_specification"
    of vhdlBlockStatement:                        "block_statement"
    of vhdlBoolean:                               "boolean"
    of vhdlCaseGenerateAlternative:               "case_generate_alternative"
    of vhdlCaseGenerateStatement:                 "case_generate_statement"
    of vhdlCaseStatement:                         "case_statement"
    of vhdlCaseStatementAlternative:              "case_statement_alternative"
    of vhdlCharacterLiteral:                      "character_literal"
    of vhdlChoices:                               "choices"
    of vhdlComment:                               "comment"
    of vhdlComponentConfiguration:                "component_configuration"
    of vhdlComponentDeclaration:                  "component_declaration"
    of vhdlComponentHeader:                       "component_header"
    of vhdlComponentInstantiation:                "component_instantiation"
    of vhdlComponentInstantiationStatement:       "component_instantiation_statement"
    of vhdlComponentMapAspect:                    "component_map_aspect"
    of vhdlConcatenation:                         "concatenation"
    of vhdlConcurrentStatementPart:               "concurrent_statement_part"
    of vhdlCondition:                             "condition"
    of vhdlConditionalConcurrentSignalAssignment: "conditional_concurrent_signal_assignment"
    of vhdlConditionalExpression:                 "conditional_expression"
    of vhdlConditionalExpressions:                "conditional_expressions"
    of vhdlConditionalForceAssignment:            "conditional_force_assignment"
    of vhdlConditionalVariableAssignment:         "conditional_variable_assignment"
    of vhdlConditionalWaveformAssignment:         "conditional_waveform_assignment"
    of vhdlConditionalWaveforms:                  "conditional_waveforms"
    of vhdlConfigurationDeclaration:              "configuration_declaration"
    of vhdlConfigurationInstantiation:            "configuration_instantiation"
    of vhdlConfigurationSpecification:            "configuration_specification"
    of vhdlConstantDeclaration:                   "constant_declaration"
    of vhdlConstantInterfaceDeclaration:          "constant_interface_declaration"
    of vhdlConstrainedArrayDefinition:            "constrained_array_definition"
    of vhdlContextClause:                         "context_clause"
    of vhdlContextDeclaration:                    "context_declaration"
    of vhdlContextList:                           "context_list"
    of vhdlContextReference:                      "context_reference"
    of vhdlDeclarativePart:                       "declarative_part"
    of vhdlDefault:                               "default"
    of vhdlDefaultExpression:                     "default_expression"
    of vhdlDelayMechanism:                        "delay_mechanism"
    of vhdlDescendingRange:                       "descending_range"
    of vhdlDesignFile:                            "design_file"
    of vhdlDesignUnit:                            "design_unit"
    of vhdlDisconnectionSpecification:            "disconnection_specification"
    of vhdlElementDeclaration:                    "element_declaration"
    of vhdlElse:                                  "else"
    of vhdlElseGenerate:                          "else_generate"
    of vhdlElsif:                                 "elsif"
    of vhdlElsifGenerate:                         "elsif_generate"
    of vhdlEntityClass:                           "entity_class"
    of vhdlEntityClassEntry:                      "entity_class_entry"
    of vhdlEntityClassEntryList:                  "entity_class_entry_list"
    of vhdlEntityDeclaration:                     "entity_declaration"
    of vhdlEntityDesignator:                      "entity_designator"
    of vhdlEntityHeader:                          "entity_header"
    of vhdlEntityInstantiation:                   "entity_instantiation"
    of vhdlEntityNameList:                        "entity_name_list"
    of vhdlEntitySpecification:                   "entity_specification"
    of vhdlEnumerationTypeDefinition:             "enumeration_type_definition"
    of vhdlExitStatement:                         "exit_statement"
    of vhdlExponentiation:                        "exponentiation"
    of vhdlExpression:                            "expression"
    of vhdlExpressionList:                        "expression_list"
    of vhdlExternalConstantName:                  "external_constant_name"
    of vhdlExternalSignalName:                    "external_signal_name"
    of vhdlExternalVariableName:                  "external_variable_name"
    of vhdlFactor:                                "factor"
    of vhdlFileDeclaration:                       "file_declaration"
    of vhdlFileInterfaceDeclaration:              "file_interface_declaration"
    of vhdlFileOpenInformation:                   "file_open_information"
    of vhdlFileOpenKind:                          "file_open_kind"
    of vhdlFileTypeDefinition:                    "file_type_definition"
    of vhdlForGenerateStatement:                  "for_generate_statement"
    of vhdlForLoop:                               "for_loop"
    of vhdlForceMode:                             "force_mode"
    of vhdlFullTypeDeclaration:                   "full_type_declaration"
    of vhdlFunctionBody:                          "function_body"
    of vhdlFunctionCall:                          "function_call"
    of vhdlFunctionDeclaration:                   "function_declaration"
    of vhdlFunctionInstantiationDeclaration:      "function_instantiation_declaration"
    of vhdlFunctionInterfaceDeclaration:          "function_interface_declaration"
    of vhdlFunctionParameterClause:               "function_parameter_clause"
    of vhdlGenerateStatementBody:                 "generate_statement_body"
    of vhdlGenerateStatementElement:              "generate_statement_element"
    of vhdlGenericClause:                         "generic_clause"
    of vhdlGenericMapAspect:                      "generic_map_aspect"
    of vhdlGroupConstituentList:                  "group_constituent_list"
    of vhdlGroupDeclaration:                      "group_declaration"
    of vhdlGroupTemplateDeclaration:              "group_template_declaration"
    of vhdlGuardedSignalSpecification:            "guarded_signal_specification"
    of vhdlIdentifierList:                        "identifier_list"
    of vhdlIf:                                    "if"
    of vhdlIfGenerate:                            "if_generate"
    of vhdlIfGenerateStatement:                   "if_generate_statement"
    of vhdlIfStatement:                           "if_statement"
    of vhdlIllegal:                               "illegal"
    of vhdlIncompleteTypeDeclaration:             "incomplete_type_declaration"
    of vhdlIndexConstraint:                       "index_constraint"
    of vhdlIndexSubtypeDefinition:                "index_subtype_definition"
    of vhdlInertial:                              "inertial"
    of vhdlInertialExpression:                    "inertial_expression"
    of vhdlInstantiationList:                     "instantiation_list"
    of vhdlInteger:                               "integer"
    of vhdlIntegerDecimal:                        "integer_decimal"
    of vhdlInterfaceSubprogramDefault:            "interface_subprogram_default"
    of vhdlLabel:                                 "label"
    of vhdlLength:                                "length"
    of vhdlLibraryClause:                         "library_clause"
    of vhdlLogicalExpression:                     "logical_expression"
    of vhdlLogicalNameList:                       "logical_name_list"
    of vhdlLoopStatement:                         "loop_statement"
    of vhdlMode:                                  "mode"
    of vhdlNamedAssociationElement:               "named_association_element"
    of vhdlNamedElementAssociation:               "named_element_association"
    of vhdlNextStatement:                         "next_statement"
    of vhdlNull:                                  "null"
    of vhdlNullStatement:                         "null_statement"
    of vhdlNumericTypeDefinition:                 "numeric_type_definition"
    of vhdlOpen:                                  "open"
    of vhdlOperatorSymbol:                        "operator_symbol"
    of vhdlOthers:                                "others"
    of vhdlPackageBody:                           "package_body"
    of vhdlPackageDeclaration:                    "package_declaration"
    of vhdlPackageHeader:                         "package_header"
    of vhdlPackageInstantiationDeclaration:       "package_instantiation_declaration"
    of vhdlPackageInterfaceDeclaration:           "package_interface_declaration"
    of vhdlPackageMapAspect:                      "package_map_aspect"
    of vhdlPackagePathname:                       "package_pathname"
    of vhdlParameterSpecification:                "parameter_specification"
    of vhdlParenthesizedExpression:               "parenthesized_expression"
    of vhdlParenthesizedResolution:               "parenthesized_resolution"
    of vhdlPathnameElement:                       "pathname_element"
    of vhdlPhysicalLiteral:                       "physical_literal"
    of vhdlPhysicalTypeDefinition:                "physical_type_definition"
    of vhdlPortClause:                            "port_clause"
    of vhdlPortMapAspect:                         "port_map_aspect"
    of vhdlPositionalAssociationElement:          "positional_association_element"
    of vhdlPositionalElementAssociation:          "positional_element_association"
    of vhdlPredefinedDesignator:                  "predefined_designator"
    of vhdlPrimaryUnitDeclaration:                "primary_unit_declaration"
    of vhdlProcedureBody:                         "procedure_body"
    of vhdlProcedureCallStatement:                "procedure_call_statement"
    of vhdlProcedureDeclaration:                  "procedure_declaration"
    of vhdlProcedureInstantiationDeclaration:     "procedure_instantiation_declaration"
    of vhdlProcedureInterfaceDeclaration:         "procedure_interface_declaration"
    of vhdlProcedureParameterClause:              "procedure_parameter_clause"
    of vhdlProcessStatement:                      "process_statement"
    of vhdlProtectedTypeBody:                     "protected_type_body"
    of vhdlProtectedTypeDeclaration:              "protected_type_declaration"
    of vhdlQualifiedExpression:                   "qualified_expression"
    of vhdlRangeConstraint:                       "range_constraint"
    of vhdlRealDecimal:                           "real_decimal"
    of vhdlRecordConstraint:                      "record_constraint"
    of vhdlRecordElementConstraint:               "record_element_constraint"
    of vhdlRecordElementResolution:               "record_element_resolution"
    of vhdlRecordResolution:                      "record_resolution"
    of vhdlRecordTypeDefinition:                  "record_type_definition"
    of vhdlReduction:                             "reduction"
    of vhdlRelation:                              "relation"
    of vhdlRelativePathname:                      "relative_pathname"
    of vhdlReportStatement:                       "report_statement"
    of vhdlResolutionFunction:                    "resolution_function"
    of vhdlReturn:                                "return"
    of vhdlReturnStatement:                       "return_statement"
    of vhdlSecondaryUnitDeclaration:              "secondary_unit_declaration"
    of vhdlSelectedConcurrentSignalAssignment:    "selected_concurrent_signal_assignment"
    of vhdlSelectedExpressions:                   "selected_expressions"
    of vhdlSelectedForceAssignment:               "selected_force_assignment"
    of vhdlSelectedName:                          "selected_name"
    of vhdlSelectedVariableAssignment:            "selected_variable_assignment"
    of vhdlSelectedWaveformAssignment:            "selected_waveform_assignment"
    of vhdlSelectedWaveforms:                     "selected_waveforms"
    of vhdlSensitivityList:                       "sensitivity_list"
    of vhdlSeparator:                             "separator"
    of vhdlSequenceOfStatements:                  "sequence_of_statements"
    of vhdlSeverityExpression:                    "severity_expression"
    of vhdlSharedVariableDeclaration:             "shared_variable_declaration"
    of vhdlShiftExpression:                       "shift_expression"
    of vhdlSign:                                  "sign"
    of vhdlSignalDeclaration:                     "signal_declaration"
    of vhdlSignalInterfaceDeclaration:            "signal_interface_declaration"
    of vhdlSignalKind:                            "signal_kind"
    of vhdlSignalList:                            "signal_list"
    of vhdlSignature:                             "signature"
    of vhdlSimpleConcurrentSignalAssignment:      "simple_concurrent_signal_assignment"
    of vhdlSimpleExpression:                      "simple_expression"
    of vhdlSimpleForceAssignment:                 "simple_force_assignment"
    of vhdlSimpleReleaseAssignment:               "simple_release_assignment"
    of vhdlSimpleVariableAssignment:              "simple_variable_assignment"
    of vhdlSimpleWaveformAssignment:              "simple_waveform_assignment"
    of vhdlSliceName:                             "slice_name"
    of vhdlStringExpression:                      "string_expression"
    of vhdlStringLiteral:                         "string_literal"
    of vhdlSubprogramHeader:                      "subprogram_header"
    of vhdlSubprogramMapAspect:                   "subprogram_map_aspect"
    of vhdlSubtypeDeclaration:                    "subtype_declaration"
    of vhdlSubtypeIndication:                     "subtype_indication"
    of vhdlTerm:                                  "term"
    of vhdlTimeExpression:                        "time_expression"
    of vhdlToolDirective:                         "tool_directive"
    of vhdlTransport:                             "transport"
    of vhdlTypeInterfaceDeclaration:              "type_interface_declaration"
    of vhdlTypeMark:                              "type_mark"
    of vhdlUnaffected:                            "unaffected"
    of vhdlUnboundedArrayDefinition:              "unbounded_array_definition"
    of vhdlUseClause:                             "use_clause"
    of vhdlVariableDeclaration:                   "variable_declaration"
    of vhdlVariableInterfaceDeclaration:          "variable_interface_declaration"
    of vhdlVerificationUnitBindingIndication:     "verification_unit_binding_indication"
    of vhdlVerificationUnitList:                  "verification_unit_list"
    of vhdlWaitStatement:                         "wait_statement"
    of vhdlWaveformElement:                       "waveform_element"
    of vhdlWaveforms:                             "waveforms"
    of vhdlWhileLoop:                             "while_loop"
    of vhdlExclamationTok:                        "!"
    of vhdlExclamationEqualTok:                   "!="
    of vhdlQuoteTok:                              "\""
    of vhdlHashTok:                               "#"
    of vhdlAmpersandTok:                          "&"
    of vhdlDoubleAmpersandTok:                    "&&"
    of vhdlApostropheTok:                         "\'"
    of vhdlLParTok:                               "("
    of vhdlRParTok:                               ")"
    of vhdlAsteriskTok:                           "*"
    of vhdlDoubleAsteriskTok:                     "**"
    of vhdlAsteriskSlashTok:                      "*/"
    of vhdlPlusTok:                               "+"
    of vhdlCommaTok:                              ","
    of vhdlMinusTok:                              "-"
    of vhdlDoubleMinusTok:                        "--"
    of vhdlMinusGreaterThanTok:                   "->"
    of vhdlDotTok:                                "."
    of vhdlSlashTok:                              "/"
    of vhdlSlashAsteriskTok:                      "/*"
    of vhdlSlashEqualTok:                         "/="
    of vhdl0Tok:                                  "0"
    of vhdl1Tok:                                  "1"
    of vhdl2Tok:                                  "2"
    of vhdl3Tok:                                  "3"
    of vhdl4Tok:                                  "4"
    of vhdl5Tok:                                  "5"
    of vhdl6Tok:                                  "6"
    of vhdl7Tok:                                  "7"
    of vhdl8Tok:                                  "8"
    of vhdl9Tok:                                  "9"
    of vhdlColonTok:                              ":"
    of vhdlColonEqualTok:                         ":="
    of vhdlSemicolonTok:                          ";"
    of vhdlLessThanTok:                           "<"
    of vhdlLessThanMinusGreaterThanTok:           "<->"
    of vhdlDoubleLessThanTok:                     "<<"
    of vhdlLessThanEqualTok:                      "<="
    of vhdlEqualTok:                              "="
    of vhdlDoubleEqualTok:                        "=="
    of vhdlEqualGreaterThanTok:                   "=>"
    of vhdlGreaterThanTok:                        ">"
    of vhdlGreaterThanEqualTok:                   ">="
    of vhdlDoubleGreaterThanTok:                  ">>"
    of vhdlQuestionTok:                           "?"
    of vhdlQuestionSlashEqualTok:                 "?/="
    of vhdlQuestionLessThanTok:                   "?<"
    of vhdlQuestionLessThanEqualTok:              "?<="
    of vhdlQuestionEqualTok:                      "?="
    of vhdlQuestionGreaterThanTok:                "?>"
    of vhdlQuestionGreaterThanEqualTok:           "?>="
    of vhdlDoubleQuestionTok:                     "??"
    of vhdlAtTok:                                 "@"
    of vhdlLBrackTok:                             "["
    of vhdlRBrackTok:                             "]"
    of vhdlAccentDotTok:                          "^."
    of vhdlUnderscoreTok:                         "_"
    of vhdlBacktickTok:                           "`"
    of vhdlAbortTok:                              "abort"
    of vhdlAbsTok:                                "abs"
    of vhdlAccessTok:                             "access"
    of vhdlActiveTok:                             "active"
    of vhdlAfterTok:                              "after"
    of vhdlAliasTok:                              "alias"
    of vhdlAllTok:                                "all"
    of vhdlAlwaysTok:                             "always"
    of vhdlAndTok:                                "and"
    of vhdlAny:                                   "any"
    of vhdlArchitectureTok:                       "architecture"
    of vhdlArrayTok:                              "array"
    of vhdlAscendingTok:                          "ascending"
    of vhdlAssertTok:                             "assert"
    of vhdlAssumeTok:                             "assume"
    of vhdlAssumeGuaranteeTok:                    "assume_guarantee"
    of vhdlAsyncAbortTok:                         "async_abort"
    of vhdlAttributeTok:                          "attribute"
    of vhdlBaseTok:                               "base"
    of vhdlBaseSpecifier:                         "base_specifier"
    of vhdlBeforeTok:                             "before"
    of vhdlBeginTok:                              "begin"
    of vhdlBitTok:                                "bit"
    of vhdlBitVectorTok:                          "bit_vector"
    of vhdlBlockTok:                              "block"
    of vhdlBodyTok:                               "body"
    of vhdlBooleanTok:                            "boolean"
    of vhdlBufferTok:                             "buffer"
    of vhdlBusTok:                                "bus"
    of vhdlCaseTok:                               "case"
    of vhdlClockTok:                              "clock"
    of vhdlComponentTok:                          "component"
    of vhdlConfigurationTok:                      "configuration"
    of vhdlConstTok:                              "const"
    of vhdlConstantTok:                           "constant"
    of vhdlContextTok:                            "context"
    of vhdlCountonesTok:                          "countones"
    of vhdlCoverTok:                              "cover"
    of vhdlDefaultTok:                            "default"
    of vhdlDelayedTok:                            "delayed"
    of vhdlDescendingTok:                         "descending"
    of vhdlDisconnectTok:                         "disconnect"
    of vhdlDontCare:                              "dont_care"
    of vhdlDowntoTok:                             "downto"
    of vhdlDrivingTok:                            "driving"
    of vhdlDrivingValueTok:                       "driving_value"
    of vhdlElementTok:                            "element"
    of vhdlElseTok:                               "else"
    of vhdlElsifTok:                              "elsif"
    of vhdlEndTok:                                "end"
    of vhdlEndedTok:                              "ended"
    of vhdlEntityTok:                             "entity"
    of vhdlEscapeSequence:                        "escape_sequence"
    of vhdlEventTok:                              "event"
    of vhdlEventuallyTok:                         "eventually"
    of vhdlExitTok:                               "exit"
    of vhdlExponent:                              "exponent"
    of vhdlExtendedIdentifier:                    "extended_identifier"
    of vhdlExtendedSimpleName:                    "extended_simple_name"
    of vhdlFairnessTok:                           "fairness"
    of vhdlFellTok:                               "fell"
    of vhdlFileTok:                               "file"
    of vhdlForTok:                                "for"
    of vhdlForallTok:                             "forall"
    of vhdlForceTok:                              "force"
    of vhdlFunctionTok:                           "function"
    of vhdlGenerateTok:                           "generate"
    of vhdlGenericTok:                            "generic"
    of vhdlGroupTok:                              "group"
    of vhdlGuardedTok:                            "guarded"
    of vhdlHdltypeTok:                            "hdltype"
    of vhdlHighTok:                               "high"
    of vhdlIdentifier:                            "identifier"
    of vhdlIfTok:                                 "if"
    of vhdlImageTok:                              "image"
    of vhdlImpureTok:                             "impure"
    of vhdlInTok:                                 "in"
    of vhdlInertialTok:                           "inertial"
    of vhdlInheritTok:                            "inherit"
    of vhdlInoutTok:                              "inout"
    of vhdlInstanceNameTok:                       "instance_name"
    of vhdlIsTok:                                 "is"
    of vhdlIsunknownTok:                          "isunknown"
    of vhdlLabelTok:                              "label"
    of vhdlLastActiveTok:                         "last_active"
    of vhdlLastEventTok:                          "last_event"
    of vhdlLastValueTok:                          "last_value"
    of vhdlLeftTok:                               "left"
    of vhdlLeftofTok:                             "leftof"
    of vhdlLengthTok:                             "length"
    of vhdlLibraryTok:                            "library"
    of vhdlLinkageTok:                            "linkage"
    of vhdlLiteralTok:                            "literal"
    of vhdlLoopTok:                               "loop"
    of vhdlLowTok:                                "low"
    of vhdlMapTok:                                "map"
    of vhdlModTok:                                "mod"
    of vhdlNandTok:                               "nand"
    of vhdlNeverTok:                              "never"
    of vhdlNewTok:                                "new"
    of vhdlNextTok:                               "next"
    of vhdlNextATok:                              "next_a"
    of vhdlNextETok:                              "next_e"
    of vhdlNextEventTok:                          "next_event"
    of vhdlNextEventATok:                         "next_event_a"
    of vhdlNextEventETok:                         "next_event_e"
    of vhdlNondetTok:                             "nondet"
    of vhdlNondetVectorTok:                       "nondet_vector"
    of vhdlNorTok:                                "nor"
    of vhdlNotTok:                                "not"
    of vhdlNullTok:                               "null"
    of vhdlNumericTok:                            "numeric"
    of vhdlOfTok:                                 "of"
    of vhdlOnTok:                                 "on"
    of vhdlOnehotTok:                             "onehot"
    of vhdlOnehot0Tok:                            "onehot0"
    of vhdlOpenTok:                               "open"
    of vhdlOrTok:                                 "or"
    of vhdlOthersTok:                             "others"
    of vhdlOutTok:                                "out"
    of vhdlPackageTok:                            "package"
    of vhdlParameterTok:                          "parameter"
    of vhdlPathNameTok:                           "path_name"
    of vhdlPortTok:                               "port"
    of vhdlPosTok:                                "pos"
    of vhdlPostponedTok:                          "postponed"
    of vhdlPredTok:                               "pred"
    of vhdlPrevTok:                               "prev"
    of vhdlProcedureTok:                          "procedure"
    of vhdlProcessTok:                            "process"
    of vhdlPropertyTok:                           "property"
    of vhdlProtectedTok:                          "protected"
    of vhdlPureTok:                               "pure"
    of vhdlQuietTok:                              "quiet"
    of vhdlRangeTok:                              "range"
    of vhdlRecordTok:                             "record"
    of vhdlRegisterTok:                           "register"
    of vhdlRejectTok:                             "reject"
    of vhdlReleaseTok:                            "release"
    of vhdlRemTok:                                "rem"
    of vhdlReportTok:                             "report"
    of vhdlRestrictTok:                           "restrict"
    of vhdlRestrictGuaranteeTok:                  "restrict_guarantee"
    of vhdlReturnTok:                             "return"
    of vhdlReverseRangeTok:                       "reverse_range"
    of vhdlRightTok:                              "right"
    of vhdlRightofTok:                            "rightof"
    of vhdlRolTok:                                "rol"
    of vhdlRorTok:                                "ror"
    of vhdlRoseTok:                               "rose"
    of vhdlSame:                                  "same"
    of vhdlSelectTok:                             "select"
    of vhdlSemicolon:                             "semicolon"
    of vhdlSequenceTok:                           "sequence"
    of vhdlSeverityTok:                           "severity"
    of vhdlSharedTok:                             "shared"
    of vhdlSignalTok:                             "signal"
    of vhdlSimpleNameTok:                         "simple_name"
    of vhdlSimpleName:                            "simple_name"
    of vhdlSlaTok:                                "sla"
    of vhdlSllTok:                                "sll"
    of vhdlSraTok:                                "sra"
    of vhdlSrlTok:                                "srl"
    of vhdlStableTok:                             "stable"
    of vhdlStringTok:                             "string"
    of vhdlStrongTok:                             "strong"
    of vhdlSubtypeTok:                            "subtype"
    of vhdlSuccTok:                               "succ"
    of vhdlSyncAbortTok:                          "sync_abort"
    of vhdlThenTok:                               "then"
    of vhdlToTok:                                 "to"
    of vhdlTransactionTok:                        "transaction"
    of vhdlTransportTok:                          "transport"
    of vhdlTypeTok:                               "type"
    of vhdlUnaffectedTok:                         "unaffected"
    of vhdlUnionTok:                              "union"
    of vhdlUnitsTok:                              "units"
    of vhdlUnresolved:                            "unresolved"
    of vhdlUntilTok:                              "until"
    of vhdlUseTok:                                "use"
    of vhdlValTok:                                "val"
    of vhdlValueTok:                              "value"
    of vhdlVariableTok:                           "variable"
    of vhdlVmodeTok:                              "vmode"
    of vhdlVpropTok:                              "vprop"
    of vhdlVunitTok:                              "vunit"
    of vhdlWaitTok:                               "wait"
    of vhdlWhenTok:                               "when"
    of vhdlWhileTok:                              "while"
    of vhdlWithTok:                               "with"
    of vhdlWithinTok:                             "within"
    of vhdlXnorTok:                               "xnor"
    of vhdlXorTok:                                "xor"
    of vhdlLCurlyTok:                             "{"
    of vhdlPipeTok:                               "|"
    of vhdlPipeMinusGreaterThanTok:               "|->"
    of vhdlPipeEqualGreaterThanTok:               "|=>"
    of vhdlRCurlyTok:                             "}"
    of vhdlSyntaxError:                           "ERROR"


type
  TsVhdlNode* = distinct TSNode


type
  VhdlParser* = distinct PtsParser


const vhdlAllowedSubnodes*: array[VhdlNodeKind, set[VhdlNodeKind]] = block:
                                                                       var tmp: array[VhdlNodeKind, set[VhdlNodeKind]]
                                                                       tmp[vhdlPSLActualParameter] = {
                                                                                                       vhdlPSLAmbiguousInstance,
                                                                                                       vhdlPSLAnyType,
                                                                                                       vhdlPSLBoolean,
                                                                                                       vhdlPSLBoundingFLProperty,
                                                                                                       vhdlPSLBracedSERE,
                                                                                                       vhdlPSLBuiltInFunctionCall,
                                                                                                       vhdlPSLClockedFLProperty,
                                                                                                       vhdlPSLClockedSERE,
                                                                                                       vhdlPSLExpression,
                                                                                                       vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                       vhdlPSLFactorFLProperty,
                                                                                                       vhdlPSLImplicationFLProperty,
                                                                                                       vhdlPSLInvariantFLProperty,
                                                                                                       vhdlPSLLogicalFLProperty,
                                                                                                       vhdlPSLOcurrenceFLProperty,
                                                                                                       vhdlPSLParameterizedProperty,
                                                                                                       vhdlPSLParenthesizedFLProperty,
                                                                                                       vhdlPSLPropertyInstance,
                                                                                                       vhdlPSLPropertyReplicator,
                                                                                                       vhdlPSLRepeatedSERE,
                                                                                                       vhdlPSLSequenceInstance,
                                                                                                       vhdlPSLSequentialFLProperty,
                                                                                                       vhdlPSLSuffixImplicationFLProperty,
                                                                                                       vhdlPSLTerminationFLProperty,
                                                                                                       vhdlPSLUnionExpression
                                                                                                     }
                                                                       tmp[vhdlPSLActualParameterList] = {vhdlPSLActualParameter}
                                                                       tmp[vhdlPSLAmbiguousInstance] = {vhdlPSLActualParameterList, vhdlPSLIdentifier}
                                                                       tmp[vhdlPSLAnyType] = {
                                                                                               vhdlAggregate,
                                                                                               vhdlAllocator,
                                                                                               vhdlAmbiguousName,
                                                                                               vhdlAttributeName,
                                                                                               vhdlBasedInteger,
                                                                                               vhdlBasedReal,
                                                                                               vhdlBitStringLiteral,
                                                                                               vhdlCharacterLiteral,
                                                                                               vhdlConcatenation,
                                                                                               vhdlCondition,
                                                                                               vhdlExponentiation,
                                                                                               vhdlExtendedSimpleName,
                                                                                               vhdlExternalConstantName,
                                                                                               vhdlExternalSignalName,
                                                                                               vhdlExternalVariableName,
                                                                                               vhdlFactor,
                                                                                               vhdlFunctionCall,
                                                                                               vhdlIntegerDecimal,
                                                                                               vhdlLogicalExpression,
                                                                                               vhdlNull,
                                                                                               vhdlParenthesizedExpression,
                                                                                               vhdlPhysicalLiteral,
                                                                                               vhdlQualifiedExpression,
                                                                                               vhdlRealDecimal,
                                                                                               vhdlReduction,
                                                                                               vhdlRelation,
                                                                                               vhdlSelectedName,
                                                                                               vhdlShiftExpression,
                                                                                               vhdlSign,
                                                                                               vhdlSimpleExpression,
                                                                                               vhdlSimpleName,
                                                                                               vhdlSliceName,
                                                                                               vhdlStringLiteral,
                                                                                               vhdlTerm
                                                                                             }
                                                                       tmp[vhdlPSLAssertDirective] = {
                                                                                                       vhdlPSLAmbiguousInstance,
                                                                                                       vhdlPSLBoolean,
                                                                                                       vhdlPSLBoundingFLProperty,
                                                                                                       vhdlPSLBuiltInFunctionCall,
                                                                                                       vhdlPSLClockedFLProperty,
                                                                                                       vhdlPSLExpression,
                                                                                                       vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                       vhdlPSLFactorFLProperty,
                                                                                                       vhdlPSLImplicationFLProperty,
                                                                                                       vhdlPSLInvariantFLProperty,
                                                                                                       vhdlPSLLogicalFLProperty,
                                                                                                       vhdlPSLOcurrenceFLProperty,
                                                                                                       vhdlPSLParameterizedProperty,
                                                                                                       vhdlPSLParenthesizedFLProperty,
                                                                                                       vhdlPSLPropertyInstance,
                                                                                                       vhdlPSLPropertyReplicator,
                                                                                                       vhdlPSLSequentialFLProperty,
                                                                                                       vhdlPSLSuffixImplicationFLProperty,
                                                                                                       vhdlPSLTerminationFLProperty,
                                                                                                       vhdlLabel,
                                                                                                       vhdlStringExpression
                                                                                                     }
                                                                       tmp[vhdlPSLAssumeDirective] = {
                                                                                                       vhdlPSLAmbiguousInstance,
                                                                                                       vhdlPSLBoolean,
                                                                                                       vhdlPSLBoundingFLProperty,
                                                                                                       vhdlPSLBuiltInFunctionCall,
                                                                                                       vhdlPSLClockedFLProperty,
                                                                                                       vhdlPSLExpression,
                                                                                                       vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                       vhdlPSLFactorFLProperty,
                                                                                                       vhdlPSLImplicationFLProperty,
                                                                                                       vhdlPSLInvariantFLProperty,
                                                                                                       vhdlPSLLogicalFLProperty,
                                                                                                       vhdlPSLOcurrenceFLProperty,
                                                                                                       vhdlPSLParameterizedProperty,
                                                                                                       vhdlPSLParenthesizedFLProperty,
                                                                                                       vhdlPSLPropertyInstance,
                                                                                                       vhdlPSLPropertyReplicator,
                                                                                                       vhdlPSLSequentialFLProperty,
                                                                                                       vhdlPSLSuffixImplicationFLProperty,
                                                                                                       vhdlPSLTerminationFLProperty,
                                                                                                       vhdlLabel
                                                                                                     }
                                                                       tmp[vhdlPSLAssumeGuaranteeDirective] = {
                                                                                                                vhdlPSLAmbiguousInstance,
                                                                                                                vhdlPSLBoolean,
                                                                                                                vhdlPSLBoundingFLProperty,
                                                                                                                vhdlPSLBuiltInFunctionCall,
                                                                                                                vhdlPSLClockedFLProperty,
                                                                                                                vhdlPSLExpression,
                                                                                                                vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                                vhdlPSLFactorFLProperty,
                                                                                                                vhdlPSLImplicationFLProperty,
                                                                                                                vhdlPSLInvariantFLProperty,
                                                                                                                vhdlPSLLogicalFLProperty,
                                                                                                                vhdlPSLOcurrenceFLProperty,
                                                                                                                vhdlPSLParameterizedProperty,
                                                                                                                vhdlPSLParenthesizedFLProperty,
                                                                                                                vhdlPSLPropertyInstance,
                                                                                                                vhdlPSLPropertyReplicator,
                                                                                                                vhdlPSLSequentialFLProperty,
                                                                                                                vhdlPSLSuffixImplicationFLProperty,
                                                                                                                vhdlPSLTerminationFLProperty,
                                                                                                                vhdlLabel,
                                                                                                                vhdlStringExpression
                                                                                                              }
                                                                       tmp[vhdlPSLBoolean] = {
                                                                                               vhdlAggregate,
                                                                                               vhdlAllocator,
                                                                                               vhdlAmbiguousName,
                                                                                               vhdlAttributeName,
                                                                                               vhdlBasedInteger,
                                                                                               vhdlBasedReal,
                                                                                               vhdlBitStringLiteral,
                                                                                               vhdlCharacterLiteral,
                                                                                               vhdlConcatenation,
                                                                                               vhdlCondition,
                                                                                               vhdlExponentiation,
                                                                                               vhdlExtendedSimpleName,
                                                                                               vhdlExternalConstantName,
                                                                                               vhdlExternalSignalName,
                                                                                               vhdlExternalVariableName,
                                                                                               vhdlFactor,
                                                                                               vhdlFunctionCall,
                                                                                               vhdlIntegerDecimal,
                                                                                               vhdlLogicalExpression,
                                                                                               vhdlNull,
                                                                                               vhdlParenthesizedExpression,
                                                                                               vhdlPhysicalLiteral,
                                                                                               vhdlQualifiedExpression,
                                                                                               vhdlRealDecimal,
                                                                                               vhdlReduction,
                                                                                               vhdlRelation,
                                                                                               vhdlSelectedName,
                                                                                               vhdlShiftExpression,
                                                                                               vhdlSign,
                                                                                               vhdlSimpleExpression,
                                                                                               vhdlSimpleName,
                                                                                               vhdlSliceName,
                                                                                               vhdlStringLiteral,
                                                                                               vhdlTerm
                                                                                             }
                                                                       tmp[vhdlPSLBoundingFLProperty] = {
                                                                                                          vhdlPSLBoolean,
                                                                                                          vhdlPSLBoundingFLProperty,
                                                                                                          vhdlPSLBuiltInFunctionCall,
                                                                                                          vhdlPSLClockedFLProperty,
                                                                                                          vhdlPSLExpression,
                                                                                                          vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                          vhdlPSLFactorFLProperty,
                                                                                                          vhdlPSLImplicationFLProperty,
                                                                                                          vhdlPSLInvariantFLProperty,
                                                                                                          vhdlPSLLogicalFLProperty,
                                                                                                          vhdlPSLOcurrenceFLProperty,
                                                                                                          vhdlPSLParameterizedProperty,
                                                                                                          vhdlPSLParenthesizedFLProperty,
                                                                                                          vhdlPSLPropertyInstance,
                                                                                                          vhdlPSLSequentialFLProperty,
                                                                                                          vhdlPSLSuffixImplicationFLProperty,
                                                                                                          vhdlPSLTerminationFLProperty
                                                                                                        }
                                                                       tmp[vhdlPSLBracedSERE] = {
                                                                                                  vhdlPSLBoolean,
                                                                                                  vhdlPSLBracedSERE,
                                                                                                  vhdlPSLBuiltInFunctionCall,
                                                                                                  vhdlPSLClockedSERE,
                                                                                                  vhdlPSLCompoundSERE,
                                                                                                  vhdlPSLExpression,
                                                                                                  vhdlPSLParameterizedSERE,
                                                                                                  vhdlPSLRepeatedSERE,
                                                                                                  vhdlPSLSequenceInstance,
                                                                                                  vhdlPSLSimpleSERE
                                                                                                }
                                                                       tmp[vhdlPSLBuiltInFunctionCall] = {
                                                                                                           vhdlPSLAnyType,
                                                                                                           vhdlPSLBracedSERE,
                                                                                                           vhdlPSLBuiltInFunctionCall,
                                                                                                           vhdlPSLClockedSERE,
                                                                                                           vhdlPSLExpression,
                                                                                                           vhdlPSLRepeatedSERE,
                                                                                                           vhdlPSLSequenceInstance,
                                                                                                           vhdlPSLUnionExpression,
                                                                                                           vhdlPSLValueSet
                                                                                                         }
                                                                       tmp[vhdlPSLClockDeclaration] = {vhdlPSLBuiltInFunctionCall, vhdlConditionalExpression}
                                                                       tmp[vhdlPSLClockedFLProperty] = {
                                                                                                         vhdlPSLBoolean,
                                                                                                         vhdlPSLBoundingFLProperty,
                                                                                                         vhdlPSLBuiltInFunctionCall,
                                                                                                         vhdlPSLClockedFLProperty,
                                                                                                         vhdlPSLExpression,
                                                                                                         vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                         vhdlPSLFactorFLProperty,
                                                                                                         vhdlPSLImplicationFLProperty,
                                                                                                         vhdlPSLInvariantFLProperty,
                                                                                                         vhdlPSLLogicalFLProperty,
                                                                                                         vhdlPSLOcurrenceFLProperty,
                                                                                                         vhdlPSLParameterizedProperty,
                                                                                                         vhdlPSLParenthesizedFLProperty,
                                                                                                         vhdlPSLPropertyInstance,
                                                                                                         vhdlPSLSequentialFLProperty,
                                                                                                         vhdlPSLSuffixImplicationFLProperty,
                                                                                                         vhdlPSLTerminationFLProperty,
                                                                                                         vhdlConditionalExpression
                                                                                                       }
                                                                       tmp[vhdlPSLClockedSERE] = {
                                                                                                   vhdlPSLBoolean,
                                                                                                   vhdlPSLBracedSERE,
                                                                                                   vhdlPSLBuiltInFunctionCall,
                                                                                                   vhdlPSLClockedSERE,
                                                                                                   vhdlPSLCompoundSERE,
                                                                                                   vhdlPSLExpression,
                                                                                                   vhdlPSLParameterizedSERE,
                                                                                                   vhdlPSLRepeatedSERE,
                                                                                                   vhdlPSLSequenceInstance,
                                                                                                   vhdlPSLSimpleSERE,
                                                                                                   vhdlConditionalExpression
                                                                                                 }
                                                                       tmp[vhdlPSLCompoundSERE] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLCompoundSERE, vhdlPSLParameterizedSERE, vhdlPSLRepeatedSERE}
                                                                       tmp[vhdlPSLConstantParameterSpecification] = {vhdlPSLHDLType, vhdlPSLTypeClass}
                                                                       tmp[vhdlPSLCount] = {vhdlPSLBuiltInFunctionCall, vhdlPSLNumber, vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange}
                                                                       tmp[vhdlPSLCoverDirective] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLRepeatedSERE, vhdlPSLSequenceInstance, vhdlLabel, vhdlStringExpression}
                                                                       tmp[vhdlPSLExpression] = {vhdlPSLBoolean, vhdlPSLBuiltInFunctionCall, vhdlPSLExpression}
                                                                       tmp[vhdlPSLExtendedOcurrenceFLProperty] = {vhdlPSLCount}
                                                                       tmp[vhdlPSLFactorFLProperty] = {
                                                                                                        vhdlPSLBoolean,
                                                                                                        vhdlPSLBoundingFLProperty,
                                                                                                        vhdlPSLBuiltInFunctionCall,
                                                                                                        vhdlPSLClockedFLProperty,
                                                                                                        vhdlPSLExpression,
                                                                                                        vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                        vhdlPSLFactorFLProperty,
                                                                                                        vhdlPSLImplicationFLProperty,
                                                                                                        vhdlPSLInvariantFLProperty,
                                                                                                        vhdlPSLLogicalFLProperty,
                                                                                                        vhdlPSLOcurrenceFLProperty,
                                                                                                        vhdlPSLParameterizedProperty,
                                                                                                        vhdlPSLParenthesizedFLProperty,
                                                                                                        vhdlPSLPropertyInstance,
                                                                                                        vhdlPSLSequentialFLProperty,
                                                                                                        vhdlPSLSuffixImplicationFLProperty,
                                                                                                        vhdlPSLTerminationFLProperty
                                                                                                      }
                                                                       tmp[vhdlPSLFairnessDirective] = {vhdlPSLBoolean, vhdlPSLBuiltInFunctionCall, vhdlPSLExpression, vhdlLabel}
                                                                       tmp[vhdlPSLFormalParameter] = {vhdlPSLConstantParameterSpecification, vhdlPSLIdentifier, vhdlPSLTemporalParameterSpecification}
                                                                       tmp[vhdlPSLFormalParameterList] = {vhdlPSLFormalParameter}
                                                                       tmp[vhdlPSLHDLType] = {vhdlSubtypeIndication}
                                                                       tmp[vhdlPSLImplicationFLProperty] = {
                                                                                                             vhdlPSLBoolean,
                                                                                                             vhdlPSLBoundingFLProperty,
                                                                                                             vhdlPSLBuiltInFunctionCall,
                                                                                                             vhdlPSLClockedFLProperty,
                                                                                                             vhdlPSLExpression,
                                                                                                             vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                             vhdlPSLFactorFLProperty,
                                                                                                             vhdlPSLImplicationFLProperty,
                                                                                                             vhdlPSLInvariantFLProperty,
                                                                                                             vhdlPSLLogicalFLProperty,
                                                                                                             vhdlPSLOcurrenceFLProperty,
                                                                                                             vhdlPSLParameterizedProperty,
                                                                                                             vhdlPSLParenthesizedFLProperty,
                                                                                                             vhdlPSLPropertyInstance,
                                                                                                             vhdlPSLSequentialFLProperty,
                                                                                                             vhdlPSLSuffixImplicationFLProperty,
                                                                                                             vhdlPSLTerminationFLProperty
                                                                                                           }
                                                                       tmp[vhdlPSLIndexRange] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange}
                                                                       tmp[vhdlPSLInheritSpec] = {
                                                                                                   vhdlAmbiguousName,
                                                                                                   vhdlAttributeName,
                                                                                                   vhdlCharacterLiteral,
                                                                                                   vhdlExtendedSimpleName,
                                                                                                   vhdlExternalConstantName,
                                                                                                   vhdlExternalSignalName,
                                                                                                   vhdlExternalVariableName,
                                                                                                   vhdlSelectedName,
                                                                                                   vhdlSimpleName,
                                                                                                   vhdlSliceName
                                                                                                 }
                                                                       tmp[vhdlPSLInvariantFLProperty] = {
                                                                                                           vhdlPSLBoolean,
                                                                                                           vhdlPSLBoundingFLProperty,
                                                                                                           vhdlPSLBuiltInFunctionCall,
                                                                                                           vhdlPSLClockedFLProperty,
                                                                                                           vhdlPSLExpression,
                                                                                                           vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                           vhdlPSLFactorFLProperty,
                                                                                                           vhdlPSLImplicationFLProperty,
                                                                                                           vhdlPSLInvariantFLProperty,
                                                                                                           vhdlPSLLogicalFLProperty,
                                                                                                           vhdlPSLOcurrenceFLProperty,
                                                                                                           vhdlPSLParameterizedProperty,
                                                                                                           vhdlPSLParenthesizedFLProperty,
                                                                                                           vhdlPSLPropertyInstance,
                                                                                                           vhdlPSLSequentialFLProperty,
                                                                                                           vhdlPSLSuffixImplicationFLProperty,
                                                                                                           vhdlPSLTerminationFLProperty
                                                                                                         }
                                                                       tmp[vhdlPSLLogicalFLProperty] = {
                                                                                                         vhdlPSLBoolean,
                                                                                                         vhdlPSLBoundingFLProperty,
                                                                                                         vhdlPSLBuiltInFunctionCall,
                                                                                                         vhdlPSLClockedFLProperty,
                                                                                                         vhdlPSLExpression,
                                                                                                         vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                         vhdlPSLFactorFLProperty,
                                                                                                         vhdlPSLImplicationFLProperty,
                                                                                                         vhdlPSLInvariantFLProperty,
                                                                                                         vhdlPSLLogicalFLProperty,
                                                                                                         vhdlPSLOcurrenceFLProperty,
                                                                                                         vhdlPSLParameterizedProperty,
                                                                                                         vhdlPSLParenthesizedFLProperty,
                                                                                                         vhdlPSLPropertyInstance,
                                                                                                         vhdlPSLSequentialFLProperty,
                                                                                                         vhdlPSLSuffixImplicationFLProperty,
                                                                                                         vhdlPSLTerminationFLProperty
                                                                                                       }
                                                                       tmp[vhdlPSLNumber] = {
                                                                                              vhdlAggregate,
                                                                                              vhdlAllocator,
                                                                                              vhdlAmbiguousName,
                                                                                              vhdlAttributeName,
                                                                                              vhdlBasedInteger,
                                                                                              vhdlBasedReal,
                                                                                              vhdlBitStringLiteral,
                                                                                              vhdlCharacterLiteral,
                                                                                              vhdlConcatenation,
                                                                                              vhdlCondition,
                                                                                              vhdlExponentiation,
                                                                                              vhdlExtendedSimpleName,
                                                                                              vhdlExternalConstantName,
                                                                                              vhdlExternalSignalName,
                                                                                              vhdlExternalVariableName,
                                                                                              vhdlFactor,
                                                                                              vhdlFunctionCall,
                                                                                              vhdlIntegerDecimal,
                                                                                              vhdlLogicalExpression,
                                                                                              vhdlNull,
                                                                                              vhdlParenthesizedExpression,
                                                                                              vhdlPhysicalLiteral,
                                                                                              vhdlQualifiedExpression,
                                                                                              vhdlRealDecimal,
                                                                                              vhdlReduction,
                                                                                              vhdlRelation,
                                                                                              vhdlSelectedName,
                                                                                              vhdlShiftExpression,
                                                                                              vhdlSign,
                                                                                              vhdlSimpleExpression,
                                                                                              vhdlSimpleName,
                                                                                              vhdlSliceName,
                                                                                              vhdlStringLiteral,
                                                                                              vhdlTerm
                                                                                            }
                                                                       tmp[vhdlPSLOcurrenceFLProperty] = {
                                                                                                           vhdlPSLBoolean,
                                                                                                           vhdlPSLBoundingFLProperty,
                                                                                                           vhdlPSLBuiltInFunctionCall,
                                                                                                           vhdlPSLClockedFLProperty,
                                                                                                           vhdlPSLExpression,
                                                                                                           vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                           vhdlPSLFactorFLProperty,
                                                                                                           vhdlPSLImplicationFLProperty,
                                                                                                           vhdlPSLInvariantFLProperty,
                                                                                                           vhdlPSLLogicalFLProperty,
                                                                                                           vhdlPSLOcurrenceFLProperty,
                                                                                                           vhdlPSLParameterizedProperty,
                                                                                                           vhdlPSLParenthesizedFLProperty,
                                                                                                           vhdlPSLPropertyInstance,
                                                                                                           vhdlPSLSequentialFLProperty,
                                                                                                           vhdlPSLSuffixImplicationFLProperty,
                                                                                                           vhdlPSLTerminationFLProperty
                                                                                                         }
                                                                       tmp[vhdlPSLParameterSpecification] = {vhdlPSLIdentifier, vhdlPSLIndexRange, vhdlPSLValueSet}
                                                                       tmp[vhdlPSLParameterizedProperty] = {
                                                                                                             vhdlPSLBoolean,
                                                                                                             vhdlPSLBoundingFLProperty,
                                                                                                             vhdlPSLBuiltInFunctionCall,
                                                                                                             vhdlPSLClockedFLProperty,
                                                                                                             vhdlPSLExpression,
                                                                                                             vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                             vhdlPSLFactorFLProperty,
                                                                                                             vhdlPSLImplicationFLProperty,
                                                                                                             vhdlPSLInvariantFLProperty,
                                                                                                             vhdlPSLLogicalFLProperty,
                                                                                                             vhdlPSLOcurrenceFLProperty,
                                                                                                             vhdlPSLParameterizedProperty,
                                                                                                             vhdlPSLParametersDefinition,
                                                                                                             vhdlPSLParenthesizedFLProperty,
                                                                                                             vhdlPSLPropertyInstance,
                                                                                                             vhdlPSLSequentialFLProperty,
                                                                                                             vhdlPSLSuffixImplicationFLProperty,
                                                                                                             vhdlPSLTerminationFLProperty
                                                                                                           }
                                                                       tmp[vhdlPSLParameterizedSERE] = {vhdlPSLParametersDefinition}
                                                                       tmp[vhdlPSLParametersDefinition] = {vhdlPSLParameterSpecification}
                                                                       tmp[vhdlPSLParenthesizedFLProperty] = {
                                                                                                               vhdlPSLBoolean,
                                                                                                               vhdlPSLBoundingFLProperty,
                                                                                                               vhdlPSLBuiltInFunctionCall,
                                                                                                               vhdlPSLClockedFLProperty,
                                                                                                               vhdlPSLExpression,
                                                                                                               vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                               vhdlPSLFactorFLProperty,
                                                                                                               vhdlPSLImplicationFLProperty,
                                                                                                               vhdlPSLInvariantFLProperty,
                                                                                                               vhdlPSLLogicalFLProperty,
                                                                                                               vhdlPSLOcurrenceFLProperty,
                                                                                                               vhdlPSLParameterizedProperty,
                                                                                                               vhdlPSLParenthesizedFLProperty,
                                                                                                               vhdlPSLPropertyInstance,
                                                                                                               vhdlPSLSequentialFLProperty,
                                                                                                               vhdlPSLSuffixImplicationFLProperty,
                                                                                                               vhdlPSLTerminationFLProperty
                                                                                                             }
                                                                       tmp[vhdlPSLPropertyDeclaration] = {
                                                                                                           vhdlPSLAmbiguousInstance,
                                                                                                           vhdlPSLBoolean,
                                                                                                           vhdlPSLBoundingFLProperty,
                                                                                                           vhdlPSLBuiltInFunctionCall,
                                                                                                           vhdlPSLClockedFLProperty,
                                                                                                           vhdlPSLExpression,
                                                                                                           vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                           vhdlPSLFactorFLProperty,
                                                                                                           vhdlPSLFormalParameterList,
                                                                                                           vhdlPSLIdentifier,
                                                                                                           vhdlPSLImplicationFLProperty,
                                                                                                           vhdlPSLInvariantFLProperty,
                                                                                                           vhdlPSLLogicalFLProperty,
                                                                                                           vhdlPSLOcurrenceFLProperty,
                                                                                                           vhdlPSLParameterizedProperty,
                                                                                                           vhdlPSLParenthesizedFLProperty,
                                                                                                           vhdlPSLPropertyInstance,
                                                                                                           vhdlPSLPropertyReplicator,
                                                                                                           vhdlPSLSequentialFLProperty,
                                                                                                           vhdlPSLSuffixImplicationFLProperty,
                                                                                                           vhdlPSLTerminationFLProperty
                                                                                                         }
                                                                       tmp[vhdlPSLPropertyInstance] = {vhdlPSLActualParameterList, vhdlPSLIdentifier}
                                                                       tmp[vhdlPSLPropertyReplicator] = {vhdlPSLParameterSpecification}
                                                                       tmp[vhdlPSLRepeatedSERE] = {
                                                                                                    vhdlPSLBoolean,
                                                                                                    vhdlPSLBracedSERE,
                                                                                                    vhdlPSLBuiltInFunctionCall,
                                                                                                    vhdlPSLClockedSERE,
                                                                                                    vhdlPSLCount,
                                                                                                    vhdlPSLExpression,
                                                                                                    vhdlPSLRepeatedSERE,
                                                                                                    vhdlPSLSequenceInstance
                                                                                                  }
                                                                       tmp[vhdlPSLRestrictDirective] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLRepeatedSERE, vhdlPSLSequenceInstance, vhdlLabel}
                                                                       tmp[vhdlPSLRestrictGuaranteeDirective] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLRepeatedSERE, vhdlPSLSequenceInstance, vhdlLabel, vhdlStringExpression}
                                                                       tmp[vhdlPSLSequenceDeclaration] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLFormalParameterList, vhdlPSLIdentifier, vhdlPSLRepeatedSERE, vhdlPSLSequenceInstance}
                                                                       tmp[vhdlPSLSequenceInstance] = {vhdlPSLActualParameterList, vhdlPSLIdentifier}
                                                                       tmp[vhdlPSLSequentialFLProperty] = {vhdlPSLBracedSERE, vhdlPSLClockedSERE, vhdlPSLRepeatedSERE, vhdlPSLSequenceInstance}
                                                                       tmp[vhdlPSLSimpleSERE] = {
                                                                                                  vhdlPSLBoolean,
                                                                                                  vhdlPSLBracedSERE,
                                                                                                  vhdlPSLBuiltInFunctionCall,
                                                                                                  vhdlPSLClockedSERE,
                                                                                                  vhdlPSLCompoundSERE,
                                                                                                  vhdlPSLExpression,
                                                                                                  vhdlPSLParameterizedSERE,
                                                                                                  vhdlPSLRepeatedSERE,
                                                                                                  vhdlPSLSequenceInstance,
                                                                                                  vhdlPSLSimpleSERE
                                                                                                }
                                                                       tmp[vhdlPSLStrongFairnessDirective] = {vhdlPSLBoolean, vhdlPSLBuiltInFunctionCall, vhdlPSLExpression, vhdlLabel}
                                                                       tmp[vhdlPSLTerminationFLProperty] = {
                                                                                                             vhdlPSLBoolean,
                                                                                                             vhdlPSLBoundingFLProperty,
                                                                                                             vhdlPSLBuiltInFunctionCall,
                                                                                                             vhdlPSLClockedFLProperty,
                                                                                                             vhdlPSLExpression,
                                                                                                             vhdlPSLExtendedOcurrenceFLProperty,
                                                                                                             vhdlPSLFactorFLProperty,
                                                                                                             vhdlPSLImplicationFLProperty,
                                                                                                             vhdlPSLInvariantFLProperty,
                                                                                                             vhdlPSLLogicalFLProperty,
                                                                                                             vhdlPSLOcurrenceFLProperty,
                                                                                                             vhdlPSLParameterizedProperty,
                                                                                                             vhdlPSLParenthesizedFLProperty,
                                                                                                             vhdlPSLPropertyInstance,
                                                                                                             vhdlPSLSequentialFLProperty,
                                                                                                             vhdlPSLSuffixImplicationFLProperty,
                                                                                                             vhdlPSLTerminationFLProperty
                                                                                                           }
                                                                       tmp[vhdlPSLUnionExpression] = {vhdlPSLAnyType, vhdlPSLBuiltInFunctionCall, vhdlPSLExpression, vhdlPSLUnionExpression}
                                                                       tmp[vhdlPSLVMOde] = {vhdlPSLIdentifier, vhdlPSLVerificationUnitBody}
                                                                       tmp[vhdlPSLVPRop] = {vhdlPSLIdentifier, vhdlPSLVerificationUnitBody}
                                                                       tmp[vhdlPSLVUNit] = {vhdlPSLIdentifier, vhdlPSLVerificationUnitBody}
                                                                       tmp[vhdlPSLValueSet] = {
                                                                                                vhdlPSLAnyType,
                                                                                                vhdlPSLBuiltInFunctionCall,
                                                                                                vhdlPSLExpression,
                                                                                                vhdlPSLUnionExpression,
                                                                                                vhdlAscendingRange,
                                                                                                vhdlAttributeName,
                                                                                                vhdlBoolean,
                                                                                                vhdlDescendingRange
                                                                                              }
                                                                       tmp[vhdlPSLVerificationUnitBody] = {
                                                                                                            vhdlPSLAssertDirective,
                                                                                                            vhdlPSLAssumeDirective,
                                                                                                            vhdlPSLAssumeGuaranteeDirective,
                                                                                                            vhdlPSLClockDeclaration,
                                                                                                            vhdlPSLCoverDirective,
                                                                                                            vhdlPSLFairnessDirective,
                                                                                                            vhdlPSLHierarchicalHDLName,
                                                                                                            vhdlPSLInheritSpec,
                                                                                                            vhdlPSLPropertyDeclaration,
                                                                                                            vhdlPSLRestrictDirective,
                                                                                                            vhdlPSLRestrictGuaranteeDirective,
                                                                                                            vhdlPSLSequenceDeclaration,
                                                                                                            vhdlPSLStrongFairnessDirective,
                                                                                                            vhdlAliasDeclaration,
                                                                                                            vhdlAssertionStatement,
                                                                                                            vhdlAttributeDeclaration,
                                                                                                            vhdlAttributeSpecification,
                                                                                                            vhdlBlockStatement,
                                                                                                            vhdlCaseGenerateStatement,
                                                                                                            vhdlComponentDeclaration,
                                                                                                            vhdlComponentInstantiationStatement,
                                                                                                            vhdlConditionalConcurrentSignalAssignment,
                                                                                                            vhdlConfigurationSpecification,
                                                                                                            vhdlConstantDeclaration,
                                                                                                            vhdlDisconnectionSpecification,
                                                                                                            vhdlFileDeclaration,
                                                                                                            vhdlForGenerateStatement,
                                                                                                            vhdlFullTypeDeclaration,
                                                                                                            vhdlFunctionBody,
                                                                                                            vhdlFunctionDeclaration,
                                                                                                            vhdlFunctionInstantiationDeclaration,
                                                                                                            vhdlGroupDeclaration,
                                                                                                            vhdlGroupTemplateDeclaration,
                                                                                                            vhdlIfGenerateStatement,
                                                                                                            vhdlIncompleteTypeDeclaration,
                                                                                                            vhdlPackageBody,
                                                                                                            vhdlPackageDeclaration,
                                                                                                            vhdlPackageInstantiationDeclaration,
                                                                                                            vhdlProcedureBody,
                                                                                                            vhdlProcedureCallStatement,
                                                                                                            vhdlProcedureDeclaration,
                                                                                                            vhdlProcedureInstantiationDeclaration,
                                                                                                            vhdlProcessStatement,
                                                                                                            vhdlSelectedConcurrentSignalAssignment,
                                                                                                            vhdlSharedVariableDeclaration,
                                                                                                            vhdlSignalDeclaration,
                                                                                                            vhdlSimpleConcurrentSignalAssignment,
                                                                                                            vhdlSubtypeDeclaration,
                                                                                                            vhdlUseClause,
                                                                                                            vhdlVariableDeclaration
                                                                                                          }
                                                                       tmp[vhdlAbsolutePathname] = {vhdlPathnameElement}
                                                                       tmp[vhdlAccessTypeDefinition] = {vhdlSubtypeIndication}
                                                                       tmp[vhdlAggregate] = {vhdlNamedElementAssociation, vhdlPositionalElementAssociation}
                                                                       tmp[vhdlAliasDeclaration] = {vhdlSignature, vhdlSubtypeIndication}
                                                                       tmp[vhdlAllocator] = {vhdlQualifiedExpression, vhdlSubtypeIndication}
                                                                       tmp[vhdlAlternativeConditionalExpressions] = {vhdlConditionalExpression, vhdlExpression}
                                                                       tmp[vhdlAlternativeConditionalWaveforms] = {vhdlConditionalExpression, vhdlWaveforms}
                                                                       tmp[vhdlAlternativeSelectedExpressions] = {vhdlChoices, vhdlExpression}
                                                                       tmp[vhdlAlternativeSelectedWaveforms] = {vhdlChoices, vhdlWaveforms}
                                                                       tmp[vhdlAmbiguousName] = {vhdlExpressionList}
                                                                       tmp[vhdlArchitectureBody] = {vhdlConcurrentStatementPart, vhdlDeclarativePart}
                                                                       tmp[vhdlArrayConstraint] = {vhdlArrayElementConstraint, vhdlIndexConstraint}
                                                                       tmp[vhdlAssertionStatement] = {vhdlConditionalExpression, vhdlLabel, vhdlSeverityExpression, vhdlStringExpression}
                                                                       tmp[vhdlAssociationList] = {vhdlNamedAssociationElement, vhdlPositionalAssociationElement}
                                                                       tmp[vhdlAttributeDeclaration] = {vhdlTypeMark}
                                                                       tmp[vhdlAttributeName] = {vhdlExpression, vhdlSignature}
                                                                       tmp[vhdlAttributeSpecification] = {vhdlEntitySpecification, vhdlExpression}
                                                                       tmp[vhdlBasedInteger] = {vhdlBase, vhdlBasedLiteral, vhdlExponent}
                                                                       tmp[vhdlBasedLiteral] = {vhdlIllegal, vhdlSeparator}
                                                                       tmp[vhdlBasedReal] = {vhdlBase, vhdlBasedLiteral, vhdlExponent}
                                                                       tmp[vhdlBindingIndication] = {
                                                                                                      vhdlComponentInstantiation,
                                                                                                      vhdlConfigurationInstantiation,
                                                                                                      vhdlEntityInstantiation,
                                                                                                      vhdlGenericClause,
                                                                                                      vhdlGenericMapAspect,
                                                                                                      vhdlOpen,
                                                                                                      vhdlPortClause,
                                                                                                      vhdlPortMapAspect
                                                                                                    }
                                                                       tmp[vhdlBitStringLiteral] = {vhdlBaseSpecifier, vhdlBitValue, vhdlLength}
                                                                       tmp[vhdlBitValue] = {vhdlDontCare, vhdlIllegal, vhdlSeparator, vhdlUnresolved}
                                                                       tmp[vhdlBlockConfiguration] = {vhdlBlockConfiguration, vhdlBlockSpecification, vhdlComponentConfiguration, vhdlUseClause}
                                                                       tmp[vhdlBlockHeader] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlBlockSpecification] = {vhdlGenerateStatementElement}
                                                                       tmp[vhdlBlockStatement] = {vhdlBlockHeader, vhdlConcurrentStatementPart, vhdlDeclarativePart, vhdlLabel}
                                                                       tmp[vhdlCaseGenerateAlternative] = {vhdlChoices, vhdlGenerateStatementBody, vhdlLabel}
                                                                       tmp[vhdlCaseGenerateStatement] = {vhdlCaseGenerateAlternative, vhdlExpression, vhdlLabel}
                                                                       tmp[vhdlCaseStatement] = {vhdlCaseStatementAlternative, vhdlExpression, vhdlLabel}
                                                                       tmp[vhdlCaseStatementAlternative] = {vhdlChoices, vhdlSequenceOfStatements}
                                                                       tmp[vhdlChoices] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange, vhdlOthers, vhdlSimpleExpression}
                                                                       tmp[vhdlComponentConfiguration] = {vhdlBindingIndication, vhdlBlockConfiguration, vhdlInstantiationList, vhdlVerificationUnitBindingIndication}
                                                                       tmp[vhdlComponentDeclaration] = {vhdlComponentHeader}
                                                                       tmp[vhdlComponentHeader] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlComponentInstantiationStatement] = {vhdlComponentInstantiation, vhdlComponentMapAspect, vhdlConfigurationInstantiation, vhdlEntityInstantiation, vhdlLabel, vhdlOpen}
                                                                       tmp[vhdlComponentMapAspect] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlConcatenation] = {
                                                                                                  vhdlAggregate,
                                                                                                  vhdlAllocator,
                                                                                                  vhdlAmbiguousName,
                                                                                                  vhdlAttributeName,
                                                                                                  vhdlBasedInteger,
                                                                                                  vhdlBasedReal,
                                                                                                  vhdlBitStringLiteral,
                                                                                                  vhdlCharacterLiteral,
                                                                                                  vhdlConcatenation,
                                                                                                  vhdlCondition,
                                                                                                  vhdlExponentiation,
                                                                                                  vhdlExtendedSimpleName,
                                                                                                  vhdlExternalConstantName,
                                                                                                  vhdlExternalSignalName,
                                                                                                  vhdlExternalVariableName,
                                                                                                  vhdlFactor,
                                                                                                  vhdlFunctionCall,
                                                                                                  vhdlIntegerDecimal,
                                                                                                  vhdlLogicalExpression,
                                                                                                  vhdlNull,
                                                                                                  vhdlParenthesizedExpression,
                                                                                                  vhdlPhysicalLiteral,
                                                                                                  vhdlQualifiedExpression,
                                                                                                  vhdlRealDecimal,
                                                                                                  vhdlReduction,
                                                                                                  vhdlRelation,
                                                                                                  vhdlSelectedName,
                                                                                                  vhdlShiftExpression,
                                                                                                  vhdlSign,
                                                                                                  vhdlSimpleExpression,
                                                                                                  vhdlSimpleName,
                                                                                                  vhdlSliceName,
                                                                                                  vhdlStringLiteral,
                                                                                                  vhdlTerm
                                                                                                }
                                                                       tmp[vhdlConcurrentStatementPart] = {
                                                                                                            vhdlPSLAssertDirective,
                                                                                                            vhdlPSLAssumeDirective,
                                                                                                            vhdlPSLAssumeGuaranteeDirective,
                                                                                                            vhdlPSLClockDeclaration,
                                                                                                            vhdlPSLCoverDirective,
                                                                                                            vhdlPSLFairnessDirective,
                                                                                                            vhdlPSLPropertyDeclaration,
                                                                                                            vhdlPSLRestrictDirective,
                                                                                                            vhdlPSLRestrictGuaranteeDirective,
                                                                                                            vhdlPSLSequenceDeclaration,
                                                                                                            vhdlPSLStrongFairnessDirective,
                                                                                                            vhdlAssertionStatement,
                                                                                                            vhdlBlockStatement,
                                                                                                            vhdlCaseGenerateStatement,
                                                                                                            vhdlComponentInstantiationStatement,
                                                                                                            vhdlConditionalConcurrentSignalAssignment,
                                                                                                            vhdlForGenerateStatement,
                                                                                                            vhdlIfGenerateStatement,
                                                                                                            vhdlProcedureCallStatement,
                                                                                                            vhdlProcessStatement,
                                                                                                            vhdlSelectedConcurrentSignalAssignment,
                                                                                                            vhdlSimpleConcurrentSignalAssignment
                                                                                                          }
                                                                       tmp[vhdlCondition] = {
                                                                                              vhdlAggregate,
                                                                                              vhdlAllocator,
                                                                                              vhdlAmbiguousName,
                                                                                              vhdlAttributeName,
                                                                                              vhdlBasedInteger,
                                                                                              vhdlBasedReal,
                                                                                              vhdlBitStringLiteral,
                                                                                              vhdlCharacterLiteral,
                                                                                              vhdlConcatenation,
                                                                                              vhdlCondition,
                                                                                              vhdlExponentiation,
                                                                                              vhdlExtendedSimpleName,
                                                                                              vhdlExternalConstantName,
                                                                                              vhdlExternalSignalName,
                                                                                              vhdlExternalVariableName,
                                                                                              vhdlFactor,
                                                                                              vhdlFunctionCall,
                                                                                              vhdlIntegerDecimal,
                                                                                              vhdlLogicalExpression,
                                                                                              vhdlNull,
                                                                                              vhdlParenthesizedExpression,
                                                                                              vhdlPhysicalLiteral,
                                                                                              vhdlQualifiedExpression,
                                                                                              vhdlRealDecimal,
                                                                                              vhdlReduction,
                                                                                              vhdlRelation,
                                                                                              vhdlSelectedName,
                                                                                              vhdlShiftExpression,
                                                                                              vhdlSign,
                                                                                              vhdlSimpleExpression,
                                                                                              vhdlSimpleName,
                                                                                              vhdlSliceName,
                                                                                              vhdlStringLiteral,
                                                                                              vhdlTerm
                                                                                            }
                                                                       tmp[vhdlConditionalConcurrentSignalAssignment] = {vhdlConditionalWaveforms, vhdlDelayMechanism, vhdlLabel}
                                                                       tmp[vhdlConditionalExpression] = {
                                                                                                          vhdlAggregate,
                                                                                                          vhdlAllocator,
                                                                                                          vhdlAmbiguousName,
                                                                                                          vhdlAttributeName,
                                                                                                          vhdlBasedInteger,
                                                                                                          vhdlBasedReal,
                                                                                                          vhdlBitStringLiteral,
                                                                                                          vhdlCharacterLiteral,
                                                                                                          vhdlConcatenation,
                                                                                                          vhdlCondition,
                                                                                                          vhdlExponentiation,
                                                                                                          vhdlExtendedSimpleName,
                                                                                                          vhdlExternalConstantName,
                                                                                                          vhdlExternalSignalName,
                                                                                                          vhdlExternalVariableName,
                                                                                                          vhdlFactor,
                                                                                                          vhdlFunctionCall,
                                                                                                          vhdlIntegerDecimal,
                                                                                                          vhdlLogicalExpression,
                                                                                                          vhdlNull,
                                                                                                          vhdlParenthesizedExpression,
                                                                                                          vhdlPhysicalLiteral,
                                                                                                          vhdlQualifiedExpression,
                                                                                                          vhdlRealDecimal,
                                                                                                          vhdlReduction,
                                                                                                          vhdlRelation,
                                                                                                          vhdlSelectedName,
                                                                                                          vhdlShiftExpression,
                                                                                                          vhdlSign,
                                                                                                          vhdlSimpleExpression,
                                                                                                          vhdlSimpleName,
                                                                                                          vhdlSliceName,
                                                                                                          vhdlStringLiteral,
                                                                                                          vhdlTerm
                                                                                                        }
                                                                       tmp[vhdlConditionalExpressions] = {vhdlAlternativeConditionalExpressions, vhdlConditionalExpression, vhdlExpression}
                                                                       tmp[vhdlConditionalForceAssignment] = {vhdlConditionalExpressions, vhdlForceMode}
                                                                       tmp[vhdlConditionalVariableAssignment] = {vhdlConditionalExpressions, vhdlLabel}
                                                                       tmp[vhdlConditionalWaveformAssignment] = {vhdlConditionalWaveforms, vhdlDelayMechanism, vhdlLabel}
                                                                       tmp[vhdlConditionalWaveforms] = {vhdlAlternativeConditionalWaveforms, vhdlConditionalExpression, vhdlWaveforms}
                                                                       tmp[vhdlConfigurationDeclaration] = {vhdlBlockConfiguration, vhdlDeclarativePart, vhdlVerificationUnitBindingIndication}
                                                                       tmp[vhdlConfigurationSpecification] = {vhdlBindingIndication, vhdlInstantiationList, vhdlVerificationUnitBindingIndication}
                                                                       tmp[vhdlConstantDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlSubtypeIndication}
                                                                       tmp[vhdlConstantInterfaceDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlMode, vhdlSubtypeIndication}
                                                                       tmp[vhdlConstrainedArrayDefinition] = {vhdlIndexConstraint}
                                                                       tmp[vhdlContextClause] = {vhdlContextReference, vhdlLibraryClause, vhdlUseClause}
                                                                       tmp[vhdlContextDeclaration] = {vhdlContextClause}
                                                                       tmp[vhdlContextList] = {vhdlSelectedName}
                                                                       tmp[vhdlContextReference] = {vhdlContextList}
                                                                       tmp[vhdlDeclarativePart] = {
                                                                                                    vhdlPSLAssertDirective,
                                                                                                    vhdlPSLAssumeDirective,
                                                                                                    vhdlPSLAssumeGuaranteeDirective,
                                                                                                    vhdlPSLClockDeclaration,
                                                                                                    vhdlPSLCoverDirective,
                                                                                                    vhdlPSLFairnessDirective,
                                                                                                    vhdlPSLPropertyDeclaration,
                                                                                                    vhdlPSLRestrictDirective,
                                                                                                    vhdlPSLRestrictGuaranteeDirective,
                                                                                                    vhdlPSLSequenceDeclaration,
                                                                                                    vhdlPSLStrongFairnessDirective,
                                                                                                    vhdlAliasDeclaration,
                                                                                                    vhdlAttributeDeclaration,
                                                                                                    vhdlAttributeSpecification,
                                                                                                    vhdlComponentDeclaration,
                                                                                                    vhdlConfigurationSpecification,
                                                                                                    vhdlConstantDeclaration,
                                                                                                    vhdlDisconnectionSpecification,
                                                                                                    vhdlFileDeclaration,
                                                                                                    vhdlFullTypeDeclaration,
                                                                                                    vhdlFunctionBody,
                                                                                                    vhdlFunctionDeclaration,
                                                                                                    vhdlFunctionInstantiationDeclaration,
                                                                                                    vhdlGroupDeclaration,
                                                                                                    vhdlGroupTemplateDeclaration,
                                                                                                    vhdlIncompleteTypeDeclaration,
                                                                                                    vhdlPackageBody,
                                                                                                    vhdlPackageDeclaration,
                                                                                                    vhdlPackageInstantiationDeclaration,
                                                                                                    vhdlProcedureBody,
                                                                                                    vhdlProcedureDeclaration,
                                                                                                    vhdlProcedureInstantiationDeclaration,
                                                                                                    vhdlSharedVariableDeclaration,
                                                                                                    vhdlSignalDeclaration,
                                                                                                    vhdlSubtypeDeclaration,
                                                                                                    vhdlUseClause,
                                                                                                    vhdlVariableDeclaration
                                                                                                  }
                                                                       tmp[vhdlDefaultExpression] = {
                                                                                                      vhdlAggregate,
                                                                                                      vhdlAllocator,
                                                                                                      vhdlAmbiguousName,
                                                                                                      vhdlAttributeName,
                                                                                                      vhdlBasedInteger,
                                                                                                      vhdlBasedReal,
                                                                                                      vhdlBitStringLiteral,
                                                                                                      vhdlCharacterLiteral,
                                                                                                      vhdlConcatenation,
                                                                                                      vhdlCondition,
                                                                                                      vhdlExponentiation,
                                                                                                      vhdlExtendedSimpleName,
                                                                                                      vhdlExternalConstantName,
                                                                                                      vhdlExternalSignalName,
                                                                                                      vhdlExternalVariableName,
                                                                                                      vhdlFactor,
                                                                                                      vhdlFunctionCall,
                                                                                                      vhdlIntegerDecimal,
                                                                                                      vhdlLogicalExpression,
                                                                                                      vhdlNull,
                                                                                                      vhdlParenthesizedExpression,
                                                                                                      vhdlPhysicalLiteral,
                                                                                                      vhdlQualifiedExpression,
                                                                                                      vhdlRealDecimal,
                                                                                                      vhdlReduction,
                                                                                                      vhdlRelation,
                                                                                                      vhdlSelectedName,
                                                                                                      vhdlShiftExpression,
                                                                                                      vhdlSign,
                                                                                                      vhdlSimpleExpression,
                                                                                                      vhdlSimpleName,
                                                                                                      vhdlSliceName,
                                                                                                      vhdlStringLiteral,
                                                                                                      vhdlTerm
                                                                                                    }
                                                                       tmp[vhdlDelayMechanism] = {vhdlInertial, vhdlTransport}
                                                                       tmp[vhdlDesignFile] = {
                                                                                               vhdlPSLAssertDirective,
                                                                                               vhdlPSLAssumeDirective,
                                                                                               vhdlPSLAssumeGuaranteeDirective,
                                                                                               vhdlPSLClockDeclaration,
                                                                                               vhdlPSLCoverDirective,
                                                                                               vhdlPSLFairnessDirective,
                                                                                               vhdlPSLPropertyDeclaration,
                                                                                               vhdlPSLRestrictDirective,
                                                                                               vhdlPSLRestrictGuaranteeDirective,
                                                                                               vhdlPSLSequenceDeclaration,
                                                                                               vhdlPSLStrongFairnessDirective,
                                                                                               vhdlAliasDeclaration,
                                                                                               vhdlAssertionStatement,
                                                                                               vhdlAttributeDeclaration,
                                                                                               vhdlAttributeSpecification,
                                                                                               vhdlBlockStatement,
                                                                                               vhdlCaseGenerateStatement,
                                                                                               vhdlCaseStatement,
                                                                                               vhdlComponentDeclaration,
                                                                                               vhdlComponentInstantiationStatement,
                                                                                               vhdlConditionalConcurrentSignalAssignment,
                                                                                               vhdlConditionalForceAssignment,
                                                                                               vhdlConditionalVariableAssignment,
                                                                                               vhdlConditionalWaveformAssignment,
                                                                                               vhdlConfigurationSpecification,
                                                                                               vhdlConstantDeclaration,
                                                                                               vhdlDesignUnit,
                                                                                               vhdlDisconnectionSpecification,
                                                                                               vhdlExitStatement,
                                                                                               vhdlFileDeclaration,
                                                                                               vhdlForGenerateStatement,
                                                                                               vhdlFullTypeDeclaration,
                                                                                               vhdlFunctionBody,
                                                                                               vhdlFunctionDeclaration,
                                                                                               vhdlFunctionInstantiationDeclaration,
                                                                                               vhdlGroupDeclaration,
                                                                                               vhdlGroupTemplateDeclaration,
                                                                                               vhdlIfGenerateStatement,
                                                                                               vhdlIfStatement,
                                                                                               vhdlIncompleteTypeDeclaration,
                                                                                               vhdlLoopStatement,
                                                                                               vhdlNextStatement,
                                                                                               vhdlNullStatement,
                                                                                               vhdlPackageBody,
                                                                                               vhdlPackageDeclaration,
                                                                                               vhdlPackageInstantiationDeclaration,
                                                                                               vhdlProcedureBody,
                                                                                               vhdlProcedureCallStatement,
                                                                                               vhdlProcedureDeclaration,
                                                                                               vhdlProcedureInstantiationDeclaration,
                                                                                               vhdlProcessStatement,
                                                                                               vhdlReportStatement,
                                                                                               vhdlReturnStatement,
                                                                                               vhdlSelectedConcurrentSignalAssignment,
                                                                                               vhdlSelectedForceAssignment,
                                                                                               vhdlSelectedVariableAssignment,
                                                                                               vhdlSelectedWaveformAssignment,
                                                                                               vhdlSharedVariableDeclaration,
                                                                                               vhdlSignalDeclaration,
                                                                                               vhdlSimpleConcurrentSignalAssignment,
                                                                                               vhdlSimpleForceAssignment,
                                                                                               vhdlSimpleReleaseAssignment,
                                                                                               vhdlSimpleVariableAssignment,
                                                                                               vhdlSimpleWaveformAssignment,
                                                                                               vhdlSubtypeDeclaration,
                                                                                               vhdlUseClause,
                                                                                               vhdlVariableDeclaration,
                                                                                               vhdlWaitStatement
                                                                                             }
                                                                       tmp[vhdlDesignUnit] = {
                                                                                               vhdlPSLVMOde,
                                                                                               vhdlPSLVPRop,
                                                                                               vhdlPSLVUNit,
                                                                                               vhdlArchitectureBody,
                                                                                               vhdlConfigurationDeclaration,
                                                                                               vhdlContextClause,
                                                                                               vhdlContextDeclaration,
                                                                                               vhdlEntityDeclaration,
                                                                                               vhdlPackageBody,
                                                                                               vhdlPackageDeclaration,
                                                                                               vhdlPackageInstantiationDeclaration
                                                                                             }
                                                                       tmp[vhdlDisconnectionSpecification] = {vhdlGuardedSignalSpecification, vhdlTimeExpression}
                                                                       tmp[vhdlElementDeclaration] = {vhdlIdentifierList, vhdlSubtypeIndication}
                                                                       tmp[vhdlElse] = {vhdlSequenceOfStatements}
                                                                       tmp[vhdlElseGenerate] = {vhdlGenerateStatementBody, vhdlLabel}
                                                                       tmp[vhdlElsif] = {vhdlConditionalExpression, vhdlSequenceOfStatements}
                                                                       tmp[vhdlElsifGenerate] = {vhdlConditionalExpression, vhdlGenerateStatementBody, vhdlLabel}
                                                                       tmp[vhdlEntityClassEntry] = {vhdlAny, vhdlEntityClass}
                                                                       tmp[vhdlEntityClassEntryList] = {vhdlEntityClassEntry}
                                                                       tmp[vhdlEntityDeclaration] = {vhdlConcurrentStatementPart, vhdlDeclarativePart, vhdlEntityHeader}
                                                                       tmp[vhdlEntityDesignator] = {vhdlCharacterLiteral, vhdlExtendedSimpleName, vhdlOperatorSymbol, vhdlSignature, vhdlSimpleName}
                                                                       tmp[vhdlEntityHeader] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlEntityNameList] = {vhdlAll, vhdlEntityDesignator, vhdlOthers}
                                                                       tmp[vhdlEntitySpecification] = {vhdlEntityClass, vhdlEntityNameList}
                                                                       tmp[vhdlExitStatement] = {vhdlConditionalExpression, vhdlLabel}
                                                                       tmp[vhdlExponentiation] = {
                                                                                                   vhdlAggregate,
                                                                                                   vhdlAllocator,
                                                                                                   vhdlAmbiguousName,
                                                                                                   vhdlAttributeName,
                                                                                                   vhdlBasedInteger,
                                                                                                   vhdlBasedReal,
                                                                                                   vhdlBitStringLiteral,
                                                                                                   vhdlCharacterLiteral,
                                                                                                   vhdlConcatenation,
                                                                                                   vhdlCondition,
                                                                                                   vhdlExponentiation,
                                                                                                   vhdlExtendedSimpleName,
                                                                                                   vhdlExternalConstantName,
                                                                                                   vhdlExternalSignalName,
                                                                                                   vhdlExternalVariableName,
                                                                                                   vhdlFactor,
                                                                                                   vhdlFunctionCall,
                                                                                                   vhdlIntegerDecimal,
                                                                                                   vhdlLogicalExpression,
                                                                                                   vhdlNull,
                                                                                                   vhdlParenthesizedExpression,
                                                                                                   vhdlPhysicalLiteral,
                                                                                                   vhdlQualifiedExpression,
                                                                                                   vhdlRealDecimal,
                                                                                                   vhdlReduction,
                                                                                                   vhdlRelation,
                                                                                                   vhdlSelectedName,
                                                                                                   vhdlShiftExpression,
                                                                                                   vhdlSign,
                                                                                                   vhdlSimpleExpression,
                                                                                                   vhdlSimpleName,
                                                                                                   vhdlSliceName,
                                                                                                   vhdlStringLiteral,
                                                                                                   vhdlTerm
                                                                                                 }
                                                                       tmp[vhdlExpression] = {
                                                                                               vhdlAggregate,
                                                                                               vhdlAllocator,
                                                                                               vhdlAmbiguousName,
                                                                                               vhdlAttributeName,
                                                                                               vhdlBasedInteger,
                                                                                               vhdlBasedReal,
                                                                                               vhdlBitStringLiteral,
                                                                                               vhdlCharacterLiteral,
                                                                                               vhdlConcatenation,
                                                                                               vhdlCondition,
                                                                                               vhdlExponentiation,
                                                                                               vhdlExtendedSimpleName,
                                                                                               vhdlExternalConstantName,
                                                                                               vhdlExternalSignalName,
                                                                                               vhdlExternalVariableName,
                                                                                               vhdlFactor,
                                                                                               vhdlFunctionCall,
                                                                                               vhdlIntegerDecimal,
                                                                                               vhdlLogicalExpression,
                                                                                               vhdlNull,
                                                                                               vhdlParenthesizedExpression,
                                                                                               vhdlPhysicalLiteral,
                                                                                               vhdlQualifiedExpression,
                                                                                               vhdlRealDecimal,
                                                                                               vhdlReduction,
                                                                                               vhdlRelation,
                                                                                               vhdlSelectedName,
                                                                                               vhdlShiftExpression,
                                                                                               vhdlSign,
                                                                                               vhdlSimpleExpression,
                                                                                               vhdlSimpleName,
                                                                                               vhdlSliceName,
                                                                                               vhdlStringLiteral,
                                                                                               vhdlTerm
                                                                                             }
                                                                       tmp[vhdlExpressionList] = {vhdlExpression}
                                                                       tmp[vhdlExternalConstantName] = {vhdlAbsolutePathname, vhdlPackagePathname, vhdlRelativePathname, vhdlSubtypeIndication}
                                                                       tmp[vhdlExternalSignalName] = {vhdlAbsolutePathname, vhdlPackagePathname, vhdlRelativePathname, vhdlSubtypeIndication}
                                                                       tmp[vhdlExternalVariableName] = {vhdlAbsolutePathname, vhdlPackagePathname, vhdlRelativePathname, vhdlSubtypeIndication}
                                                                       tmp[vhdlFactor] = {
                                                                                           vhdlAggregate,
                                                                                           vhdlAllocator,
                                                                                           vhdlAmbiguousName,
                                                                                           vhdlAttributeName,
                                                                                           vhdlBasedInteger,
                                                                                           vhdlBasedReal,
                                                                                           vhdlBitStringLiteral,
                                                                                           vhdlCharacterLiteral,
                                                                                           vhdlConcatenation,
                                                                                           vhdlCondition,
                                                                                           vhdlExponentiation,
                                                                                           vhdlExtendedSimpleName,
                                                                                           vhdlExternalConstantName,
                                                                                           vhdlExternalSignalName,
                                                                                           vhdlExternalVariableName,
                                                                                           vhdlFactor,
                                                                                           vhdlFunctionCall,
                                                                                           vhdlIntegerDecimal,
                                                                                           vhdlLogicalExpression,
                                                                                           vhdlNull,
                                                                                           vhdlParenthesizedExpression,
                                                                                           vhdlPhysicalLiteral,
                                                                                           vhdlQualifiedExpression,
                                                                                           vhdlRealDecimal,
                                                                                           vhdlReduction,
                                                                                           vhdlRelation,
                                                                                           vhdlSelectedName,
                                                                                           vhdlShiftExpression,
                                                                                           vhdlSign,
                                                                                           vhdlSimpleExpression,
                                                                                           vhdlSimpleName,
                                                                                           vhdlSliceName,
                                                                                           vhdlStringLiteral,
                                                                                           vhdlTerm
                                                                                         }
                                                                       tmp[vhdlFileDeclaration] = {vhdlFileOpenInformation, vhdlIdentifierList, vhdlSubtypeIndication}
                                                                       tmp[vhdlFileInterfaceDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlMode, vhdlSubtypeIndication}
                                                                       tmp[vhdlFileOpenInformation] = {vhdlFileOpenKind, vhdlStringExpression}
                                                                       tmp[vhdlFileOpenKind] = {
                                                                                                 vhdlAggregate,
                                                                                                 vhdlAllocator,
                                                                                                 vhdlAmbiguousName,
                                                                                                 vhdlAttributeName,
                                                                                                 vhdlBasedInteger,
                                                                                                 vhdlBasedReal,
                                                                                                 vhdlBitStringLiteral,
                                                                                                 vhdlCharacterLiteral,
                                                                                                 vhdlExtendedSimpleName,
                                                                                                 vhdlExternalConstantName,
                                                                                                 vhdlExternalSignalName,
                                                                                                 vhdlExternalVariableName,
                                                                                                 vhdlFunctionCall,
                                                                                                 vhdlIntegerDecimal,
                                                                                                 vhdlNull,
                                                                                                 vhdlParenthesizedExpression,
                                                                                                 vhdlPhysicalLiteral,
                                                                                                 vhdlQualifiedExpression,
                                                                                                 vhdlRealDecimal,
                                                                                                 vhdlSelectedName,
                                                                                                 vhdlSimpleName,
                                                                                                 vhdlSliceName,
                                                                                                 vhdlStringLiteral
                                                                                               }
                                                                       tmp[vhdlFileTypeDefinition] = {vhdlTypeMark}
                                                                       tmp[vhdlForGenerateStatement] = {vhdlGenerateStatementBody, vhdlLabel, vhdlParameterSpecification}
                                                                       tmp[vhdlForLoop] = {vhdlParameterSpecification}
                                                                       tmp[vhdlFullTypeDeclaration] = {
                                                                                                        vhdlAccessTypeDefinition,
                                                                                                        vhdlConstrainedArrayDefinition,
                                                                                                        vhdlEnumerationTypeDefinition,
                                                                                                        vhdlFileTypeDefinition,
                                                                                                        vhdlNumericTypeDefinition,
                                                                                                        vhdlPhysicalTypeDefinition,
                                                                                                        vhdlProtectedTypeBody,
                                                                                                        vhdlProtectedTypeDeclaration,
                                                                                                        vhdlRecordTypeDefinition,
                                                                                                        vhdlUnboundedArrayDefinition
                                                                                                      }
                                                                       tmp[vhdlFunctionBody] = {vhdlDeclarativePart, vhdlFunctionParameterClause, vhdlReturn, vhdlSequenceOfStatements, vhdlSubprogramHeader}
                                                                       tmp[vhdlFunctionCall] = {vhdlAssociationList}
                                                                       tmp[vhdlFunctionDeclaration] = {vhdlFunctionParameterClause, vhdlReturn, vhdlSubprogramHeader}
                                                                       tmp[vhdlFunctionInstantiationDeclaration] = {vhdlSignature, vhdlSubprogramMapAspect}
                                                                       tmp[vhdlFunctionInterfaceDeclaration] = {vhdlFunctionParameterClause, vhdlInterfaceSubprogramDefault, vhdlReturn, vhdlSubprogramHeader}
                                                                       tmp[vhdlFunctionParameterClause] = {
                                                                                                            vhdlConstantInterfaceDeclaration,
                                                                                                            vhdlFileInterfaceDeclaration,
                                                                                                            vhdlFunctionInterfaceDeclaration,
                                                                                                            vhdlPackageInterfaceDeclaration,
                                                                                                            vhdlProcedureInterfaceDeclaration,
                                                                                                            vhdlSignalInterfaceDeclaration,
                                                                                                            vhdlTypeInterfaceDeclaration,
                                                                                                            vhdlVariableInterfaceDeclaration
                                                                                                          }
                                                                       tmp[vhdlGenerateStatementBody] = {
                                                                                                          vhdlPSLAssertDirective,
                                                                                                          vhdlPSLAssumeDirective,
                                                                                                          vhdlPSLAssumeGuaranteeDirective,
                                                                                                          vhdlPSLClockDeclaration,
                                                                                                          vhdlPSLCoverDirective,
                                                                                                          vhdlPSLFairnessDirective,
                                                                                                          vhdlPSLPropertyDeclaration,
                                                                                                          vhdlPSLRestrictDirective,
                                                                                                          vhdlPSLRestrictGuaranteeDirective,
                                                                                                          vhdlPSLSequenceDeclaration,
                                                                                                          vhdlPSLStrongFairnessDirective,
                                                                                                          vhdlAssertionStatement,
                                                                                                          vhdlBlockStatement,
                                                                                                          vhdlCaseGenerateStatement,
                                                                                                          vhdlComponentInstantiationStatement,
                                                                                                          vhdlConditionalConcurrentSignalAssignment,
                                                                                                          vhdlDeclarativePart,
                                                                                                          vhdlForGenerateStatement,
                                                                                                          vhdlIfGenerateStatement,
                                                                                                          vhdlProcedureCallStatement,
                                                                                                          vhdlProcessStatement,
                                                                                                          vhdlSelectedConcurrentSignalAssignment,
                                                                                                          vhdlSimpleConcurrentSignalAssignment
                                                                                                        }
                                                                       tmp[vhdlGenericClause] = {
                                                                                                  vhdlConstantInterfaceDeclaration,
                                                                                                  vhdlFileInterfaceDeclaration,
                                                                                                  vhdlFunctionInterfaceDeclaration,
                                                                                                  vhdlPackageInterfaceDeclaration,
                                                                                                  vhdlProcedureInterfaceDeclaration,
                                                                                                  vhdlSemicolon,
                                                                                                  vhdlSignalInterfaceDeclaration,
                                                                                                  vhdlTypeInterfaceDeclaration,
                                                                                                  vhdlVariableInterfaceDeclaration
                                                                                                }
                                                                       tmp[vhdlGenericMapAspect] = {vhdlAny, vhdlAssociationList, vhdlDefault, vhdlSemicolon}
                                                                       tmp[vhdlGroupConstituentList] = {vhdlCharacterLiteral, vhdlExtendedSimpleName, vhdlSelectedName, vhdlSimpleName}
                                                                       tmp[vhdlGroupDeclaration] = {vhdlGroupConstituentList}
                                                                       tmp[vhdlGroupTemplateDeclaration] = {vhdlEntityClassEntryList}
                                                                       tmp[vhdlGuardedSignalSpecification] = {vhdlSignalList, vhdlTypeMark}
                                                                       tmp[vhdlIdentifierList] = {vhdlExtendedIdentifier, vhdlIdentifier}
                                                                       tmp[vhdlIf] = {vhdlConditionalExpression, vhdlSequenceOfStatements}
                                                                       tmp[vhdlIfGenerate] = {vhdlConditionalExpression, vhdlGenerateStatementBody, vhdlLabel}
                                                                       tmp[vhdlIfGenerateStatement] = {vhdlElseGenerate, vhdlElsifGenerate, vhdlIfGenerate, vhdlLabel}
                                                                       tmp[vhdlIfStatement] = {vhdlElse, vhdlElsif, vhdlIf, vhdlLabel}
                                                                       tmp[vhdlIndexConstraint] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange, vhdlOpen, vhdlSubtypeIndication}
                                                                       tmp[vhdlIndexSubtypeDefinition] = {vhdlAny, vhdlTypeMark}
                                                                       tmp[vhdlInertialExpression] = {
                                                                                                       vhdlAggregate,
                                                                                                       vhdlAllocator,
                                                                                                       vhdlAmbiguousName,
                                                                                                       vhdlAttributeName,
                                                                                                       vhdlBasedInteger,
                                                                                                       vhdlBasedReal,
                                                                                                       vhdlBitStringLiteral,
                                                                                                       vhdlCharacterLiteral,
                                                                                                       vhdlConcatenation,
                                                                                                       vhdlCondition,
                                                                                                       vhdlExponentiation,
                                                                                                       vhdlExtendedSimpleName,
                                                                                                       vhdlExternalConstantName,
                                                                                                       vhdlExternalSignalName,
                                                                                                       vhdlExternalVariableName,
                                                                                                       vhdlFactor,
                                                                                                       vhdlFunctionCall,
                                                                                                       vhdlIntegerDecimal,
                                                                                                       vhdlLogicalExpression,
                                                                                                       vhdlNull,
                                                                                                       vhdlParenthesizedExpression,
                                                                                                       vhdlPhysicalLiteral,
                                                                                                       vhdlQualifiedExpression,
                                                                                                       vhdlRealDecimal,
                                                                                                       vhdlReduction,
                                                                                                       vhdlRelation,
                                                                                                       vhdlSelectedName,
                                                                                                       vhdlShiftExpression,
                                                                                                       vhdlSign,
                                                                                                       vhdlSimpleExpression,
                                                                                                       vhdlSimpleName,
                                                                                                       vhdlSliceName,
                                                                                                       vhdlStringLiteral,
                                                                                                       vhdlTerm
                                                                                                     }
                                                                       tmp[vhdlInstantiationList] = {vhdlAll, vhdlExtendedSimpleName, vhdlOthers, vhdlSimpleName}
                                                                       tmp[vhdlInteger] = {vhdlSeparator}
                                                                       tmp[vhdlIntegerDecimal] = {vhdlExponent, vhdlInteger}
                                                                       tmp[vhdlInterfaceSubprogramDefault] = {vhdlExtendedSimpleName, vhdlOperatorSymbol, vhdlSame, vhdlSelectedName, vhdlSimpleName}
                                                                       tmp[vhdlLabel] = {vhdlExtendedIdentifier, vhdlIdentifier}
                                                                       tmp[vhdlLength] = {vhdlSeparator}
                                                                       tmp[vhdlLibraryClause] = {vhdlLogicalNameList}
                                                                       tmp[vhdlLogicalExpression] = {
                                                                                                      vhdlAggregate,
                                                                                                      vhdlAllocator,
                                                                                                      vhdlAmbiguousName,
                                                                                                      vhdlAttributeName,
                                                                                                      vhdlBasedInteger,
                                                                                                      vhdlBasedReal,
                                                                                                      vhdlBitStringLiteral,
                                                                                                      vhdlCharacterLiteral,
                                                                                                      vhdlConcatenation,
                                                                                                      vhdlCondition,
                                                                                                      vhdlExponentiation,
                                                                                                      vhdlExtendedSimpleName,
                                                                                                      vhdlExternalConstantName,
                                                                                                      vhdlExternalSignalName,
                                                                                                      vhdlExternalVariableName,
                                                                                                      vhdlFactor,
                                                                                                      vhdlFunctionCall,
                                                                                                      vhdlIntegerDecimal,
                                                                                                      vhdlLogicalExpression,
                                                                                                      vhdlNull,
                                                                                                      vhdlParenthesizedExpression,
                                                                                                      vhdlPhysicalLiteral,
                                                                                                      vhdlQualifiedExpression,
                                                                                                      vhdlRealDecimal,
                                                                                                      vhdlReduction,
                                                                                                      vhdlRelation,
                                                                                                      vhdlSelectedName,
                                                                                                      vhdlShiftExpression,
                                                                                                      vhdlSign,
                                                                                                      vhdlSimpleExpression,
                                                                                                      vhdlSimpleName,
                                                                                                      vhdlSliceName,
                                                                                                      vhdlStringLiteral,
                                                                                                      vhdlTerm
                                                                                                    }
                                                                       tmp[vhdlLogicalNameList] = {vhdlExtendedSimpleName, vhdlSimpleName}
                                                                       tmp[vhdlLoopStatement] = {vhdlForLoop, vhdlLabel, vhdlSequenceOfStatements, vhdlWhileLoop}
                                                                       tmp[vhdlNamedElementAssociation] = {vhdlChoices, vhdlExpression}
                                                                       tmp[vhdlNextStatement] = {vhdlConditionalExpression, vhdlLabel}
                                                                       tmp[vhdlNullStatement] = {vhdlLabel}
                                                                       tmp[vhdlNumericTypeDefinition] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange}
                                                                       tmp[vhdlOperatorSymbol] = {vhdlEscapeSequence}
                                                                       tmp[vhdlPackageBody] = {vhdlDeclarativePart}
                                                                       tmp[vhdlPackageDeclaration] = {vhdlDeclarativePart, vhdlPackageHeader}
                                                                       tmp[vhdlPackageHeader] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlPackageInstantiationDeclaration] = {vhdlPackageMapAspect}
                                                                       tmp[vhdlPackageInterfaceDeclaration] = {vhdlPackageMapAspect}
                                                                       tmp[vhdlPackageMapAspect] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlParameterSpecification] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange, vhdlSubtypeIndication}
                                                                       tmp[vhdlParenthesizedExpression] = {
                                                                                                            vhdlAggregate,
                                                                                                            vhdlAllocator,
                                                                                                            vhdlAmbiguousName,
                                                                                                            vhdlAttributeName,
                                                                                                            vhdlBasedInteger,
                                                                                                            vhdlBasedReal,
                                                                                                            vhdlBitStringLiteral,
                                                                                                            vhdlCharacterLiteral,
                                                                                                            vhdlConcatenation,
                                                                                                            vhdlCondition,
                                                                                                            vhdlExponentiation,
                                                                                                            vhdlExtendedSimpleName,
                                                                                                            vhdlExternalConstantName,
                                                                                                            vhdlExternalSignalName,
                                                                                                            vhdlExternalVariableName,
                                                                                                            vhdlFactor,
                                                                                                            vhdlFunctionCall,
                                                                                                            vhdlIntegerDecimal,
                                                                                                            vhdlLogicalExpression,
                                                                                                            vhdlNull,
                                                                                                            vhdlParenthesizedExpression,
                                                                                                            vhdlPhysicalLiteral,
                                                                                                            vhdlQualifiedExpression,
                                                                                                            vhdlRealDecimal,
                                                                                                            vhdlReduction,
                                                                                                            vhdlRelation,
                                                                                                            vhdlSelectedName,
                                                                                                            vhdlShiftExpression,
                                                                                                            vhdlSign,
                                                                                                            vhdlSimpleExpression,
                                                                                                            vhdlSimpleName,
                                                                                                            vhdlSliceName,
                                                                                                            vhdlStringLiteral,
                                                                                                            vhdlTerm
                                                                                                          }
                                                                       tmp[vhdlParenthesizedResolution] = {vhdlParenthesizedResolution, vhdlRecordResolution, vhdlResolutionFunction}
                                                                       tmp[vhdlPathnameElement] = {vhdlGenerateStatementElement}
                                                                       tmp[vhdlPhysicalLiteral] = {vhdlBasedInteger, vhdlBasedReal, vhdlIntegerDecimal, vhdlRealDecimal}
                                                                       tmp[vhdlPhysicalTypeDefinition] = {vhdlPrimaryUnitDeclaration, vhdlRangeConstraint, vhdlSecondaryUnitDeclaration}
                                                                       tmp[vhdlPortClause] = {
                                                                                               vhdlConstantInterfaceDeclaration,
                                                                                               vhdlFileInterfaceDeclaration,
                                                                                               vhdlFunctionInterfaceDeclaration,
                                                                                               vhdlPackageInterfaceDeclaration,
                                                                                               vhdlProcedureInterfaceDeclaration,
                                                                                               vhdlSemicolon,
                                                                                               vhdlSignalInterfaceDeclaration,
                                                                                               vhdlTypeInterfaceDeclaration,
                                                                                               vhdlVariableInterfaceDeclaration
                                                                                             }
                                                                       tmp[vhdlPortMapAspect] = {vhdlAssociationList, vhdlSemicolon}
                                                                       tmp[vhdlPositionalElementAssociation] = {vhdlExpression}
                                                                       tmp[vhdlProcedureBody] = {vhdlDeclarativePart, vhdlProcedureParameterClause, vhdlReturn, vhdlSequenceOfStatements, vhdlSubprogramHeader}
                                                                       tmp[vhdlProcedureCallStatement] = {vhdlAssociationList, vhdlLabel}
                                                                       tmp[vhdlProcedureDeclaration] = {vhdlProcedureParameterClause, vhdlReturn, vhdlSubprogramHeader}
                                                                       tmp[vhdlProcedureInstantiationDeclaration] = {vhdlSignature, vhdlSubprogramMapAspect}
                                                                       tmp[vhdlProcedureInterfaceDeclaration] = {vhdlInterfaceSubprogramDefault, vhdlProcedureParameterClause, vhdlReturn, vhdlSubprogramHeader}
                                                                       tmp[vhdlProcedureParameterClause] = {
                                                                                                             vhdlConstantInterfaceDeclaration,
                                                                                                             vhdlFileInterfaceDeclaration,
                                                                                                             vhdlFunctionInterfaceDeclaration,
                                                                                                             vhdlPackageInterfaceDeclaration,
                                                                                                             vhdlProcedureInterfaceDeclaration,
                                                                                                             vhdlSignalInterfaceDeclaration,
                                                                                                             vhdlTypeInterfaceDeclaration,
                                                                                                             vhdlVariableInterfaceDeclaration
                                                                                                           }
                                                                       tmp[vhdlProcessStatement] = {vhdlDeclarativePart, vhdlLabel, vhdlSensitivityList, vhdlSequenceOfStatements}
                                                                       tmp[vhdlProtectedTypeBody] = {vhdlDeclarativePart}
                                                                       tmp[vhdlProtectedTypeDeclaration] = {vhdlDeclarativePart}
                                                                       tmp[vhdlQualifiedExpression] = {vhdlAggregate, vhdlExpression, vhdlTypeMark}
                                                                       tmp[vhdlRangeConstraint] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange}
                                                                       tmp[vhdlRealDecimal] = {vhdlExponent, vhdlInteger}
                                                                       tmp[vhdlRecordConstraint] = {vhdlRecordElementConstraint}
                                                                       tmp[vhdlRecordElementConstraint] = {vhdlArrayConstraint, vhdlRecordConstraint}
                                                                       tmp[vhdlRecordElementResolution] = {vhdlParenthesizedResolution, vhdlRecordResolution, vhdlResolutionFunction}
                                                                       tmp[vhdlRecordResolution] = {vhdlRecordElementResolution}
                                                                       tmp[vhdlRecordTypeDefinition] = {vhdlElementDeclaration}
                                                                       tmp[vhdlReduction] = {
                                                                                              vhdlAggregate,
                                                                                              vhdlAllocator,
                                                                                              vhdlAmbiguousName,
                                                                                              vhdlAttributeName,
                                                                                              vhdlBasedInteger,
                                                                                              vhdlBasedReal,
                                                                                              vhdlBitStringLiteral,
                                                                                              vhdlCharacterLiteral,
                                                                                              vhdlConcatenation,
                                                                                              vhdlCondition,
                                                                                              vhdlExponentiation,
                                                                                              vhdlExtendedSimpleName,
                                                                                              vhdlExternalConstantName,
                                                                                              vhdlExternalSignalName,
                                                                                              vhdlExternalVariableName,
                                                                                              vhdlFactor,
                                                                                              vhdlFunctionCall,
                                                                                              vhdlIntegerDecimal,
                                                                                              vhdlLogicalExpression,
                                                                                              vhdlNull,
                                                                                              vhdlParenthesizedExpression,
                                                                                              vhdlPhysicalLiteral,
                                                                                              vhdlQualifiedExpression,
                                                                                              vhdlRealDecimal,
                                                                                              vhdlReduction,
                                                                                              vhdlRelation,
                                                                                              vhdlSelectedName,
                                                                                              vhdlShiftExpression,
                                                                                              vhdlSign,
                                                                                              vhdlSimpleExpression,
                                                                                              vhdlSimpleName,
                                                                                              vhdlSliceName,
                                                                                              vhdlStringLiteral,
                                                                                              vhdlTerm
                                                                                            }
                                                                       tmp[vhdlRelation] = {
                                                                                             vhdlAggregate,
                                                                                             vhdlAllocator,
                                                                                             vhdlAmbiguousName,
                                                                                             vhdlAttributeName,
                                                                                             vhdlBasedInteger,
                                                                                             vhdlBasedReal,
                                                                                             vhdlBitStringLiteral,
                                                                                             vhdlCharacterLiteral,
                                                                                             vhdlConcatenation,
                                                                                             vhdlCondition,
                                                                                             vhdlExponentiation,
                                                                                             vhdlExtendedSimpleName,
                                                                                             vhdlExternalConstantName,
                                                                                             vhdlExternalSignalName,
                                                                                             vhdlExternalVariableName,
                                                                                             vhdlFactor,
                                                                                             vhdlFunctionCall,
                                                                                             vhdlIntegerDecimal,
                                                                                             vhdlLogicalExpression,
                                                                                             vhdlNull,
                                                                                             vhdlParenthesizedExpression,
                                                                                             vhdlPhysicalLiteral,
                                                                                             vhdlQualifiedExpression,
                                                                                             vhdlRealDecimal,
                                                                                             vhdlReduction,
                                                                                             vhdlRelation,
                                                                                             vhdlSelectedName,
                                                                                             vhdlShiftExpression,
                                                                                             vhdlSign,
                                                                                             vhdlSimpleExpression,
                                                                                             vhdlSimpleName,
                                                                                             vhdlSliceName,
                                                                                             vhdlStringLiteral,
                                                                                             vhdlTerm
                                                                                           }
                                                                       tmp[vhdlRelativePathname] = {vhdlPathnameElement}
                                                                       tmp[vhdlReportStatement] = {vhdlLabel, vhdlSeverityExpression, vhdlStringExpression}
                                                                       tmp[vhdlResolutionFunction] = {vhdlExtendedSimpleName, vhdlSelectedName, vhdlSimpleName}
                                                                       tmp[vhdlReturn] = {vhdlTypeMark}
                                                                       tmp[vhdlReturnStatement] = {vhdlExpression, vhdlLabel}
                                                                       tmp[vhdlSecondaryUnitDeclaration] = {vhdlPhysicalLiteral}
                                                                       tmp[vhdlSelectedConcurrentSignalAssignment] = {vhdlDelayMechanism, vhdlExpression, vhdlLabel, vhdlSelectedWaveforms}
                                                                       tmp[vhdlSelectedExpressions] = {vhdlAlternativeSelectedExpressions, vhdlChoices, vhdlExpression}
                                                                       tmp[vhdlSelectedForceAssignment] = {vhdlExpression, vhdlForceMode, vhdlLabel, vhdlSelectedExpressions}
                                                                       tmp[vhdlSelectedVariableAssignment] = {vhdlExpression, vhdlLabel, vhdlSelectedExpressions}
                                                                       tmp[vhdlSelectedWaveformAssignment] = {vhdlDelayMechanism, vhdlExpression, vhdlLabel, vhdlSelectedWaveforms}
                                                                       tmp[vhdlSelectedWaveforms] = {vhdlAlternativeSelectedWaveforms, vhdlChoices, vhdlWaveforms}
                                                                       tmp[vhdlSensitivityList] = {
                                                                                                    vhdlAll,
                                                                                                    vhdlAmbiguousName,
                                                                                                    vhdlAttributeName,
                                                                                                    vhdlCharacterLiteral,
                                                                                                    vhdlExtendedSimpleName,
                                                                                                    vhdlExternalConstantName,
                                                                                                    vhdlExternalSignalName,
                                                                                                    vhdlExternalVariableName,
                                                                                                    vhdlSelectedName,
                                                                                                    vhdlSimpleName,
                                                                                                    vhdlSliceName
                                                                                                  }
                                                                       tmp[vhdlSequenceOfStatements] = {
                                                                                                         vhdlPSLAssertDirective,
                                                                                                         vhdlPSLAssumeDirective,
                                                                                                         vhdlPSLAssumeGuaranteeDirective,
                                                                                                         vhdlPSLClockDeclaration,
                                                                                                         vhdlPSLCoverDirective,
                                                                                                         vhdlPSLFairnessDirective,
                                                                                                         vhdlPSLPropertyDeclaration,
                                                                                                         vhdlPSLRestrictDirective,
                                                                                                         vhdlPSLRestrictGuaranteeDirective,
                                                                                                         vhdlPSLSequenceDeclaration,
                                                                                                         vhdlPSLStrongFairnessDirective,
                                                                                                         vhdlAssertionStatement,
                                                                                                         vhdlCaseStatement,
                                                                                                         vhdlConditionalForceAssignment,
                                                                                                         vhdlConditionalVariableAssignment,
                                                                                                         vhdlConditionalWaveformAssignment,
                                                                                                         vhdlExitStatement,
                                                                                                         vhdlIfStatement,
                                                                                                         vhdlLoopStatement,
                                                                                                         vhdlNextStatement,
                                                                                                         vhdlNullStatement,
                                                                                                         vhdlProcedureCallStatement,
                                                                                                         vhdlProcessStatement,
                                                                                                         vhdlReportStatement,
                                                                                                         vhdlReturnStatement,
                                                                                                         vhdlSelectedForceAssignment,
                                                                                                         vhdlSelectedVariableAssignment,
                                                                                                         vhdlSelectedWaveformAssignment,
                                                                                                         vhdlSimpleForceAssignment,
                                                                                                         vhdlSimpleReleaseAssignment,
                                                                                                         vhdlSimpleVariableAssignment,
                                                                                                         vhdlSimpleWaveformAssignment,
                                                                                                         vhdlWaitStatement
                                                                                                       }
                                                                       tmp[vhdlSeverityExpression] = {
                                                                                                       vhdlAggregate,
                                                                                                       vhdlAllocator,
                                                                                                       vhdlAmbiguousName,
                                                                                                       vhdlAttributeName,
                                                                                                       vhdlBasedInteger,
                                                                                                       vhdlBasedReal,
                                                                                                       vhdlBitStringLiteral,
                                                                                                       vhdlCharacterLiteral,
                                                                                                       vhdlExtendedSimpleName,
                                                                                                       vhdlExternalConstantName,
                                                                                                       vhdlExternalSignalName,
                                                                                                       vhdlExternalVariableName,
                                                                                                       vhdlFunctionCall,
                                                                                                       vhdlIntegerDecimal,
                                                                                                       vhdlNull,
                                                                                                       vhdlParenthesizedExpression,
                                                                                                       vhdlPhysicalLiteral,
                                                                                                       vhdlQualifiedExpression,
                                                                                                       vhdlRealDecimal,
                                                                                                       vhdlSelectedName,
                                                                                                       vhdlSimpleName,
                                                                                                       vhdlSliceName,
                                                                                                       vhdlStringLiteral
                                                                                                     }
                                                                       tmp[vhdlSharedVariableDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlSubtypeIndication}
                                                                       tmp[vhdlShiftExpression] = {
                                                                                                    vhdlAggregate,
                                                                                                    vhdlAllocator,
                                                                                                    vhdlAmbiguousName,
                                                                                                    vhdlAttributeName,
                                                                                                    vhdlBasedInteger,
                                                                                                    vhdlBasedReal,
                                                                                                    vhdlBitStringLiteral,
                                                                                                    vhdlCharacterLiteral,
                                                                                                    vhdlConcatenation,
                                                                                                    vhdlCondition,
                                                                                                    vhdlExponentiation,
                                                                                                    vhdlExtendedSimpleName,
                                                                                                    vhdlExternalConstantName,
                                                                                                    vhdlExternalSignalName,
                                                                                                    vhdlExternalVariableName,
                                                                                                    vhdlFactor,
                                                                                                    vhdlFunctionCall,
                                                                                                    vhdlIntegerDecimal,
                                                                                                    vhdlLogicalExpression,
                                                                                                    vhdlNull,
                                                                                                    vhdlParenthesizedExpression,
                                                                                                    vhdlPhysicalLiteral,
                                                                                                    vhdlQualifiedExpression,
                                                                                                    vhdlRealDecimal,
                                                                                                    vhdlReduction,
                                                                                                    vhdlRelation,
                                                                                                    vhdlSelectedName,
                                                                                                    vhdlShiftExpression,
                                                                                                    vhdlSign,
                                                                                                    vhdlSimpleExpression,
                                                                                                    vhdlSimpleName,
                                                                                                    vhdlSliceName,
                                                                                                    vhdlStringLiteral,
                                                                                                    vhdlTerm
                                                                                                  }
                                                                       tmp[vhdlSign] = {
                                                                                         vhdlAggregate,
                                                                                         vhdlAllocator,
                                                                                         vhdlAmbiguousName,
                                                                                         vhdlAttributeName,
                                                                                         vhdlBasedInteger,
                                                                                         vhdlBasedReal,
                                                                                         vhdlBitStringLiteral,
                                                                                         vhdlCharacterLiteral,
                                                                                         vhdlConcatenation,
                                                                                         vhdlCondition,
                                                                                         vhdlExponentiation,
                                                                                         vhdlExtendedSimpleName,
                                                                                         vhdlExternalConstantName,
                                                                                         vhdlExternalSignalName,
                                                                                         vhdlExternalVariableName,
                                                                                         vhdlFactor,
                                                                                         vhdlFunctionCall,
                                                                                         vhdlIntegerDecimal,
                                                                                         vhdlLogicalExpression,
                                                                                         vhdlNull,
                                                                                         vhdlParenthesizedExpression,
                                                                                         vhdlPhysicalLiteral,
                                                                                         vhdlQualifiedExpression,
                                                                                         vhdlRealDecimal,
                                                                                         vhdlReduction,
                                                                                         vhdlRelation,
                                                                                         vhdlSelectedName,
                                                                                         vhdlShiftExpression,
                                                                                         vhdlSign,
                                                                                         vhdlSimpleExpression,
                                                                                         vhdlSimpleName,
                                                                                         vhdlSliceName,
                                                                                         vhdlStringLiteral,
                                                                                         vhdlTerm
                                                                                       }
                                                                       tmp[vhdlSignalDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlSignalKind, vhdlSubtypeIndication}
                                                                       tmp[vhdlSignalInterfaceDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlMode, vhdlSignalKind, vhdlSubtypeIndication}
                                                                       tmp[vhdlSignalList] = {
                                                                                               vhdlAll,
                                                                                               vhdlAmbiguousName,
                                                                                               vhdlAttributeName,
                                                                                               vhdlCharacterLiteral,
                                                                                               vhdlExtendedSimpleName,
                                                                                               vhdlExternalConstantName,
                                                                                               vhdlExternalSignalName,
                                                                                               vhdlExternalVariableName,
                                                                                               vhdlOthers,
                                                                                               vhdlSelectedName,
                                                                                               vhdlSimpleName,
                                                                                               vhdlSliceName
                                                                                             }
                                                                       tmp[vhdlSignature] = {vhdlReturn, vhdlTypeMark}
                                                                       tmp[vhdlSimpleConcurrentSignalAssignment] = {vhdlDelayMechanism, vhdlLabel, vhdlWaveforms}
                                                                       tmp[vhdlSimpleExpression] = {
                                                                                                     vhdlAggregate,
                                                                                                     vhdlAllocator,
                                                                                                     vhdlAmbiguousName,
                                                                                                     vhdlAttributeName,
                                                                                                     vhdlBasedInteger,
                                                                                                     vhdlBasedReal,
                                                                                                     vhdlBitStringLiteral,
                                                                                                     vhdlCharacterLiteral,
                                                                                                     vhdlConcatenation,
                                                                                                     vhdlCondition,
                                                                                                     vhdlExponentiation,
                                                                                                     vhdlExtendedSimpleName,
                                                                                                     vhdlExternalConstantName,
                                                                                                     vhdlExternalSignalName,
                                                                                                     vhdlExternalVariableName,
                                                                                                     vhdlFactor,
                                                                                                     vhdlFunctionCall,
                                                                                                     vhdlIntegerDecimal,
                                                                                                     vhdlLogicalExpression,
                                                                                                     vhdlNull,
                                                                                                     vhdlParenthesizedExpression,
                                                                                                     vhdlPhysicalLiteral,
                                                                                                     vhdlQualifiedExpression,
                                                                                                     vhdlRealDecimal,
                                                                                                     vhdlReduction,
                                                                                                     vhdlRelation,
                                                                                                     vhdlSelectedName,
                                                                                                     vhdlShiftExpression,
                                                                                                     vhdlSign,
                                                                                                     vhdlSimpleExpression,
                                                                                                     vhdlSimpleName,
                                                                                                     vhdlSliceName,
                                                                                                     vhdlStringLiteral,
                                                                                                     vhdlTerm
                                                                                                   }
                                                                       tmp[vhdlSimpleForceAssignment] = {vhdlExpression, vhdlForceMode, vhdlLabel}
                                                                       tmp[vhdlSimpleReleaseAssignment] = {vhdlForceMode, vhdlLabel}
                                                                       tmp[vhdlSimpleVariableAssignment] = {vhdlExpression, vhdlLabel}
                                                                       tmp[vhdlSimpleWaveformAssignment] = {vhdlDelayMechanism, vhdlLabel, vhdlWaveforms}
                                                                       tmp[vhdlSliceName] = {vhdlAscendingRange, vhdlAttributeName, vhdlDescendingRange}
                                                                       tmp[vhdlStringExpression] = {
                                                                                                     vhdlAggregate,
                                                                                                     vhdlAllocator,
                                                                                                     vhdlAmbiguousName,
                                                                                                     vhdlAttributeName,
                                                                                                     vhdlBasedInteger,
                                                                                                     vhdlBasedReal,
                                                                                                     vhdlBitStringLiteral,
                                                                                                     vhdlCharacterLiteral,
                                                                                                     vhdlConcatenation,
                                                                                                     vhdlCondition,
                                                                                                     vhdlExponentiation,
                                                                                                     vhdlExtendedSimpleName,
                                                                                                     vhdlExternalConstantName,
                                                                                                     vhdlExternalSignalName,
                                                                                                     vhdlExternalVariableName,
                                                                                                     vhdlFactor,
                                                                                                     vhdlFunctionCall,
                                                                                                     vhdlIntegerDecimal,
                                                                                                     vhdlLogicalExpression,
                                                                                                     vhdlNull,
                                                                                                     vhdlParenthesizedExpression,
                                                                                                     vhdlPhysicalLiteral,
                                                                                                     vhdlQualifiedExpression,
                                                                                                     vhdlRealDecimal,
                                                                                                     vhdlReduction,
                                                                                                     vhdlRelation,
                                                                                                     vhdlSelectedName,
                                                                                                     vhdlShiftExpression,
                                                                                                     vhdlSign,
                                                                                                     vhdlSimpleExpression,
                                                                                                     vhdlSimpleName,
                                                                                                     vhdlSliceName,
                                                                                                     vhdlStringLiteral,
                                                                                                     vhdlTerm
                                                                                                   }
                                                                       tmp[vhdlStringLiteral] = {vhdlEscapeSequence}
                                                                       tmp[vhdlSubprogramHeader] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlSubprogramMapAspect] = {vhdlGenericClause, vhdlGenericMapAspect, vhdlPortClause, vhdlPortMapAspect}
                                                                       tmp[vhdlSubtypeDeclaration] = {vhdlSubtypeIndication}
                                                                       tmp[vhdlSubtypeIndication] = {
                                                                                                      vhdlArrayConstraint,
                                                                                                      vhdlParenthesizedResolution,
                                                                                                      vhdlRangeConstraint,
                                                                                                      vhdlRecordConstraint,
                                                                                                      vhdlRecordResolution,
                                                                                                      vhdlResolutionFunction,
                                                                                                      vhdlTypeMark
                                                                                                    }
                                                                       tmp[vhdlTerm] = {
                                                                                         vhdlAggregate,
                                                                                         vhdlAllocator,
                                                                                         vhdlAmbiguousName,
                                                                                         vhdlAttributeName,
                                                                                         vhdlBasedInteger,
                                                                                         vhdlBasedReal,
                                                                                         vhdlBitStringLiteral,
                                                                                         vhdlCharacterLiteral,
                                                                                         vhdlConcatenation,
                                                                                         vhdlCondition,
                                                                                         vhdlExponentiation,
                                                                                         vhdlExtendedSimpleName,
                                                                                         vhdlExternalConstantName,
                                                                                         vhdlExternalSignalName,
                                                                                         vhdlExternalVariableName,
                                                                                         vhdlFactor,
                                                                                         vhdlFunctionCall,
                                                                                         vhdlIntegerDecimal,
                                                                                         vhdlLogicalExpression,
                                                                                         vhdlNull,
                                                                                         vhdlParenthesizedExpression,
                                                                                         vhdlPhysicalLiteral,
                                                                                         vhdlQualifiedExpression,
                                                                                         vhdlRealDecimal,
                                                                                         vhdlReduction,
                                                                                         vhdlRelation,
                                                                                         vhdlSelectedName,
                                                                                         vhdlShiftExpression,
                                                                                         vhdlSign,
                                                                                         vhdlSimpleExpression,
                                                                                         vhdlSimpleName,
                                                                                         vhdlSliceName,
                                                                                         vhdlStringLiteral,
                                                                                         vhdlTerm
                                                                                       }
                                                                       tmp[vhdlTimeExpression] = {
                                                                                                   vhdlAggregate,
                                                                                                   vhdlAllocator,
                                                                                                   vhdlAmbiguousName,
                                                                                                   vhdlAttributeName,
                                                                                                   vhdlBasedInteger,
                                                                                                   vhdlBasedReal,
                                                                                                   vhdlBitStringLiteral,
                                                                                                   vhdlCharacterLiteral,
                                                                                                   vhdlConcatenation,
                                                                                                   vhdlCondition,
                                                                                                   vhdlExponentiation,
                                                                                                   vhdlExtendedSimpleName,
                                                                                                   vhdlExternalConstantName,
                                                                                                   vhdlExternalSignalName,
                                                                                                   vhdlExternalVariableName,
                                                                                                   vhdlFactor,
                                                                                                   vhdlFunctionCall,
                                                                                                   vhdlIntegerDecimal,
                                                                                                   vhdlLogicalExpression,
                                                                                                   vhdlNull,
                                                                                                   vhdlParenthesizedExpression,
                                                                                                   vhdlPhysicalLiteral,
                                                                                                   vhdlQualifiedExpression,
                                                                                                   vhdlRealDecimal,
                                                                                                   vhdlReduction,
                                                                                                   vhdlRelation,
                                                                                                   vhdlSelectedName,
                                                                                                   vhdlShiftExpression,
                                                                                                   vhdlSign,
                                                                                                   vhdlSimpleExpression,
                                                                                                   vhdlSimpleName,
                                                                                                   vhdlSliceName,
                                                                                                   vhdlStringLiteral,
                                                                                                   vhdlTerm
                                                                                                 }
                                                                       tmp[vhdlTypeMark] = {vhdlAttributeName, vhdlExtendedSimpleName, vhdlSelectedName, vhdlSimpleName}
                                                                       tmp[vhdlUnboundedArrayDefinition] = {vhdlIndexSubtypeDefinition}
                                                                       tmp[vhdlUseClause] = {vhdlSelectedName}
                                                                       tmp[vhdlVariableDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlSubtypeIndication}
                                                                       tmp[vhdlVariableInterfaceDeclaration] = {vhdlDefaultExpression, vhdlIdentifierList, vhdlMode, vhdlSubtypeIndication}
                                                                       tmp[vhdlVerificationUnitBindingIndication] = {vhdlVerificationUnitList}
                                                                       tmp[vhdlVerificationUnitList] = {vhdlExtendedSimpleName, vhdlSelectedName, vhdlSimpleName}
                                                                       tmp[vhdlWaitStatement] = {vhdlConditionalExpression, vhdlLabel, vhdlSensitivityList, vhdlTimeExpression}
                                                                       tmp[vhdlWaveformElement] = {vhdlExpression, vhdlTimeExpression}
                                                                       tmp[vhdlWaveforms] = {vhdlUnaffected, vhdlWaveformElement}
                                                                       tmp[vhdlWhileLoop] = {vhdlConditionalExpression}
                                                                       tmp
const vhdlTokenKinds*: set[VhdlNodeKind] = {
                                             vhdlExclamationTok,
                                             vhdlExclamationEqualTok,
                                             vhdlQuoteTok,
                                             vhdlHashTok,
                                             vhdlAmpersandTok,
                                             vhdlDoubleAmpersandTok,
                                             vhdlApostropheTok,
                                             vhdlLParTok,
                                             vhdlRParTok,
                                             vhdlAsteriskTok,
                                             vhdlDoubleAsteriskTok,
                                             vhdlAsteriskSlashTok,
                                             vhdlPlusTok,
                                             vhdlCommaTok,
                                             vhdlMinusTok,
                                             vhdlDoubleMinusTok,
                                             vhdlMinusGreaterThanTok,
                                             vhdlDotTok,
                                             vhdlSlashTok,
                                             vhdlSlashAsteriskTok,
                                             vhdlSlashEqualTok,
                                             vhdl0Tok,
                                             vhdl1Tok,
                                             vhdl2Tok,
                                             vhdl3Tok,
                                             vhdl4Tok,
                                             vhdl5Tok,
                                             vhdl6Tok,
                                             vhdl7Tok,
                                             vhdl8Tok,
                                             vhdl9Tok,
                                             vhdlColonTok,
                                             vhdlColonEqualTok,
                                             vhdlSemicolonTok,
                                             vhdlLessThanTok,
                                             vhdlLessThanMinusGreaterThanTok,
                                             vhdlDoubleLessThanTok,
                                             vhdlLessThanEqualTok,
                                             vhdlEqualTok,
                                             vhdlDoubleEqualTok,
                                             vhdlEqualGreaterThanTok,
                                             vhdlGreaterThanTok,
                                             vhdlGreaterThanEqualTok,
                                             vhdlDoubleGreaterThanTok,
                                             vhdlQuestionTok,
                                             vhdlQuestionSlashEqualTok,
                                             vhdlQuestionLessThanTok,
                                             vhdlQuestionLessThanEqualTok,
                                             vhdlQuestionEqualTok,
                                             vhdlQuestionGreaterThanTok,
                                             vhdlQuestionGreaterThanEqualTok,
                                             vhdlDoubleQuestionTok,
                                             vhdlAtTok,
                                             vhdlLBrackTok,
                                             vhdlRBrackTok,
                                             vhdlAccentDotTok,
                                             vhdlUnderscoreTok,
                                             vhdlBacktickTok,
                                             vhdlAbortTok,
                                             vhdlAbsTok,
                                             vhdlAccessTok,
                                             vhdlActiveTok,
                                             vhdlAfterTok,
                                             vhdlAliasTok,
                                             vhdlAllTok,
                                             vhdlAlwaysTok,
                                             vhdlAndTok,
                                             vhdlArchitectureTok,
                                             vhdlArrayTok,
                                             vhdlAscendingTok,
                                             vhdlAssertTok,
                                             vhdlAssumeTok,
                                             vhdlAssumeGuaranteeTok,
                                             vhdlAsyncAbortTok,
                                             vhdlAttributeTok,
                                             vhdlBaseTok,
                                             vhdlBeforeTok,
                                             vhdlBeginTok,
                                             vhdlBitTok,
                                             vhdlBitVectorTok,
                                             vhdlBlockTok,
                                             vhdlBodyTok,
                                             vhdlBooleanTok,
                                             vhdlBufferTok,
                                             vhdlBusTok,
                                             vhdlCaseTok,
                                             vhdlClockTok,
                                             vhdlComponentTok,
                                             vhdlConfigurationTok,
                                             vhdlConstTok,
                                             vhdlConstantTok,
                                             vhdlContextTok,
                                             vhdlCountonesTok,
                                             vhdlCoverTok,
                                             vhdlDefaultTok,
                                             vhdlDelayedTok,
                                             vhdlDescendingTok,
                                             vhdlDisconnectTok,
                                             vhdlDowntoTok,
                                             vhdlDrivingTok,
                                             vhdlDrivingValueTok,
                                             vhdlElementTok,
                                             vhdlElseTok,
                                             vhdlElsifTok,
                                             vhdlEndTok,
                                             vhdlEndedTok,
                                             vhdlEntityTok,
                                             vhdlEventTok,
                                             vhdlEventuallyTok,
                                             vhdlExitTok,
                                             vhdlFairnessTok,
                                             vhdlFellTok,
                                             vhdlFileTok,
                                             vhdlForTok,
                                             vhdlForallTok,
                                             vhdlForceTok,
                                             vhdlFunctionTok,
                                             vhdlGenerateTok,
                                             vhdlGenericTok,
                                             vhdlGroupTok,
                                             vhdlGuardedTok,
                                             vhdlHdltypeTok,
                                             vhdlHighTok,
                                             vhdlIfTok,
                                             vhdlImageTok,
                                             vhdlImpureTok,
                                             vhdlInTok,
                                             vhdlInertialTok,
                                             vhdlInheritTok,
                                             vhdlInoutTok,
                                             vhdlInstanceNameTok,
                                             vhdlIsTok,
                                             vhdlIsunknownTok,
                                             vhdlLabelTok,
                                             vhdlLastActiveTok,
                                             vhdlLastEventTok,
                                             vhdlLastValueTok,
                                             vhdlLeftTok,
                                             vhdlLeftofTok,
                                             vhdlLengthTok,
                                             vhdlLibraryTok,
                                             vhdlLinkageTok,
                                             vhdlLiteralTok,
                                             vhdlLoopTok,
                                             vhdlLowTok,
                                             vhdlMapTok,
                                             vhdlModTok,
                                             vhdlNandTok,
                                             vhdlNeverTok,
                                             vhdlNewTok,
                                             vhdlNextTok,
                                             vhdlNextATok,
                                             vhdlNextETok,
                                             vhdlNextEventTok,
                                             vhdlNextEventATok,
                                             vhdlNextEventETok,
                                             vhdlNondetTok,
                                             vhdlNondetVectorTok,
                                             vhdlNorTok,
                                             vhdlNotTok,
                                             vhdlNullTok,
                                             vhdlNumericTok,
                                             vhdlOfTok,
                                             vhdlOnTok,
                                             vhdlOnehotTok,
                                             vhdlOnehot0Tok,
                                             vhdlOpenTok,
                                             vhdlOrTok,
                                             vhdlOthersTok,
                                             vhdlOutTok,
                                             vhdlPackageTok,
                                             vhdlParameterTok,
                                             vhdlPathNameTok,
                                             vhdlPortTok,
                                             vhdlPosTok,
                                             vhdlPostponedTok,
                                             vhdlPredTok,
                                             vhdlPrevTok,
                                             vhdlProcedureTok,
                                             vhdlProcessTok,
                                             vhdlPropertyTok,
                                             vhdlProtectedTok,
                                             vhdlPureTok,
                                             vhdlQuietTok,
                                             vhdlRangeTok,
                                             vhdlRecordTok,
                                             vhdlRegisterTok,
                                             vhdlRejectTok,
                                             vhdlReleaseTok,
                                             vhdlRemTok,
                                             vhdlReportTok,
                                             vhdlRestrictTok,
                                             vhdlRestrictGuaranteeTok,
                                             vhdlReturnTok,
                                             vhdlReverseRangeTok,
                                             vhdlRightTok,
                                             vhdlRightofTok,
                                             vhdlRolTok,
                                             vhdlRorTok,
                                             vhdlRoseTok,
                                             vhdlSelectTok,
                                             vhdlSequenceTok,
                                             vhdlSeverityTok,
                                             vhdlSharedTok,
                                             vhdlSignalTok,
                                             vhdlSimpleNameTok,
                                             vhdlSlaTok,
                                             vhdlSllTok,
                                             vhdlSraTok,
                                             vhdlSrlTok,
                                             vhdlStableTok,
                                             vhdlStringTok,
                                             vhdlStrongTok,
                                             vhdlSubtypeTok,
                                             vhdlSuccTok,
                                             vhdlSyncAbortTok,
                                             vhdlThenTok,
                                             vhdlToTok,
                                             vhdlTransactionTok,
                                             vhdlTransportTok,
                                             vhdlTypeTok,
                                             vhdlUnaffectedTok,
                                             vhdlUnionTok,
                                             vhdlUnitsTok,
                                             vhdlUntilTok,
                                             vhdlUseTok,
                                             vhdlValTok,
                                             vhdlValueTok,
                                             vhdlVariableTok,
                                             vhdlVmodeTok,
                                             vhdlVpropTok,
                                             vhdlVunitTok,
                                             vhdlWaitTok,
                                             vhdlWhenTok,
                                             vhdlWhileTok,
                                             vhdlWithTok,
                                             vhdlWithinTok,
                                             vhdlXnorTok,
                                             vhdlXorTok,
                                             vhdlLCurlyTok,
                                             vhdlPipeTok,
                                             vhdlPipeMinusGreaterThanTok,
                                             vhdlPipeEqualGreaterThanTok,
                                             vhdlRCurlyTok
                                           }

proc tsNodeType*(node: TsVhdlNode): string



proc kind*(node: TsVhdlNode): VhdlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "PSL_Actual_Parameter":                     vhdlPSLActualParameter
      of "PSL_Actual_Parameter_List":                vhdlPSLActualParameterList
      of "PSL_Ambiguous_Instance":                   vhdlPSLAmbiguousInstance
      of "PSL_Any_Type":                             vhdlPSLAnyType
      of "PSL_Assert_Directive":                     vhdlPSLAssertDirective
      of "PSL_Assume_Directive":                     vhdlPSLAssumeDirective
      of "PSL_Assume_Guarantee_Directive":           vhdlPSLAssumeGuaranteeDirective
      of "PSL_Boolean":                              vhdlPSLBoolean
      of "PSL_Bounding_FL_Property":                 vhdlPSLBoundingFLProperty
      of "PSL_Braced_SERE":                          vhdlPSLBracedSERE
      of "PSL_Built_In_Function_Call":               vhdlPSLBuiltInFunctionCall
      of "PSL_Clock_Declaration":                    vhdlPSLClockDeclaration
      of "PSL_Clocked_FL_Property":                  vhdlPSLClockedFLProperty
      of "PSL_Clocked_SERE":                         vhdlPSLClockedSERE
      of "PSL_Compound_SERE":                        vhdlPSLCompoundSERE
      of "PSL_Constant_Parameter_Specification":     vhdlPSLConstantParameterSpecification
      of "PSL_Count":                                vhdlPSLCount
      of "PSL_Cover_Directive":                      vhdlPSLCoverDirective
      of "PSL_Expression":                           vhdlPSLExpression
      of "PSL_Extended_Ocurrence_FL_Property":       vhdlPSLExtendedOcurrenceFLProperty
      of "PSL_Factor_FL_Property":                   vhdlPSLFactorFLProperty
      of "PSL_Fairness_Directive":                   vhdlPSLFairnessDirective
      of "PSL_Formal_Parameter":                     vhdlPSLFormalParameter
      of "PSL_Formal_Parameter_List":                vhdlPSLFormalParameterList
      of "PSL_HDL_Type":                             vhdlPSLHDLType
      of "PSL_Hierarchical_HDL_Name":                vhdlPSLHierarchicalHDLName
      of "PSL_Implication_FL_Property":              vhdlPSLImplicationFLProperty
      of "PSL_Index_Range":                          vhdlPSLIndexRange
      of "PSL_Inherit_Spec":                         vhdlPSLInheritSpec
      of "PSL_Invariant_FL_Property":                vhdlPSLInvariantFLProperty
      of "PSL_Logical_FL_Property":                  vhdlPSLLogicalFLProperty
      of "PSL_Number":                               vhdlPSLNumber
      of "PSL_Ocurrence_FL_Property":                vhdlPSLOcurrenceFLProperty
      of "PSL_Parameter_Specification":              vhdlPSLParameterSpecification
      of "PSL_Parameterized_Property":               vhdlPSLParameterizedProperty
      of "PSL_Parameterized_SERE":                   vhdlPSLParameterizedSERE
      of "PSL_Parameters_Definition":                vhdlPSLParametersDefinition
      of "PSL_Parenthesized_FL_Property":            vhdlPSLParenthesizedFLProperty
      of "PSL_Property_Declaration":                 vhdlPSLPropertyDeclaration
      of "PSL_Property_Instance":                    vhdlPSLPropertyInstance
      of "PSL_Property_Replicator":                  vhdlPSLPropertyReplicator
      of "PSL_Repeated_SERE":                        vhdlPSLRepeatedSERE
      of "PSL_Restrict_Directive":                   vhdlPSLRestrictDirective
      of "PSL_Restrict_Guarantee_Directive":         vhdlPSLRestrictGuaranteeDirective
      of "PSL_Sequence_Declaration":                 vhdlPSLSequenceDeclaration
      of "PSL_Sequence_Instance":                    vhdlPSLSequenceInstance
      of "PSL_Sequential_FL_Property":               vhdlPSLSequentialFLProperty
      of "PSL_Simple_SERE":                          vhdlPSLSimpleSERE
      of "PSL_Strong_Fairness_Directive":            vhdlPSLStrongFairnessDirective
      of "PSL_Suffix_Implication_FL_Property":       vhdlPSLSuffixImplicationFLProperty
      of "PSL_Temporal_Parameter_Specification":     vhdlPSLTemporalParameterSpecification
      of "PSL_Termination_FL_Property":              vhdlPSLTerminationFLProperty
      of "PSL_Type_Class":                           vhdlPSLTypeClass
      of "PSL_Union_Expression":                     vhdlPSLUnionExpression
      of "PSL_VMode":                                vhdlPSLVMOde
      of "PSL_VProp":                                vhdlPSLVPRop
      of "PSL_VUnit":                                vhdlPSLVUNit
      of "PSL_Value_Set":                            vhdlPSLValueSet
      of "PSL_Verification_Unit_Body":               vhdlPSLVerificationUnitBody
      of "absolute_pathname":                        vhdlAbsolutePathname
      of "access_type_definition":                   vhdlAccessTypeDefinition
      of "aggregate":                                vhdlAggregate
      of "alias_declaration":                        vhdlAliasDeclaration
      of "all":                                      vhdlAll
      of "allocator":                                vhdlAllocator
      of "alternative_conditional_expressions":      vhdlAlternativeConditionalExpressions
      of "alternative_conditional_waveforms":        vhdlAlternativeConditionalWaveforms
      of "alternative_selected_expressions":         vhdlAlternativeSelectedExpressions
      of "alternative_selected_waveforms":           vhdlAlternativeSelectedWaveforms
      of "ambiguous_name":                           vhdlAmbiguousName
      of "architecture_body":                        vhdlArchitectureBody
      of "array_constraint":                         vhdlArrayConstraint
      of "ascending_range":                          vhdlAscendingRange
      of "assertion_statement":                      vhdlAssertionStatement
      of "association_list":                         vhdlAssociationList
      of "attribute_declaration":                    vhdlAttributeDeclaration
      of "attribute_name":                           vhdlAttributeName
      of "attribute_specification":                  vhdlAttributeSpecification
      of "base":                                     vhdlBase
      of "based_integer":                            vhdlBasedInteger
      of "based_literal":                            vhdlBasedLiteral
      of "based_real":                               vhdlBasedReal
      of "binding_indication":                       vhdlBindingIndication
      of "bit_string_literal":                       vhdlBitStringLiteral
      of "bit_value":                                vhdlBitValue
      of "block_configuration":                      vhdlBlockConfiguration
      of "block_header":                             vhdlBlockHeader
      of "block_specification":                      vhdlBlockSpecification
      of "block_statement":                          vhdlBlockStatement
      of "boolean":                                  vhdlBoolean
      of "case_generate_alternative":                vhdlCaseGenerateAlternative
      of "case_generate_statement":                  vhdlCaseGenerateStatement
      of "case_statement":                           vhdlCaseStatement
      of "case_statement_alternative":               vhdlCaseStatementAlternative
      of "character_literal":                        vhdlCharacterLiteral
      of "choices":                                  vhdlChoices
      of "comment":                                  vhdlComment
      of "component_configuration":                  vhdlComponentConfiguration
      of "component_declaration":                    vhdlComponentDeclaration
      of "component_header":                         vhdlComponentHeader
      of "component_instantiation":                  vhdlComponentInstantiation
      of "component_instantiation_statement":        vhdlComponentInstantiationStatement
      of "component_map_aspect":                     vhdlComponentMapAspect
      of "concatenation":                            vhdlConcatenation
      of "concurrent_statement_part":                vhdlConcurrentStatementPart
      of "condition":                                vhdlCondition
      of "conditional_concurrent_signal_assignment": vhdlConditionalConcurrentSignalAssignment
      of "conditional_expression":                   vhdlConditionalExpression
      of "conditional_expressions":                  vhdlConditionalExpressions
      of "conditional_force_assignment":             vhdlConditionalForceAssignment
      of "conditional_variable_assignment":          vhdlConditionalVariableAssignment
      of "conditional_waveform_assignment":          vhdlConditionalWaveformAssignment
      of "conditional_waveforms":                    vhdlConditionalWaveforms
      of "configuration_declaration":                vhdlConfigurationDeclaration
      of "configuration_instantiation":              vhdlConfigurationInstantiation
      of "configuration_specification":              vhdlConfigurationSpecification
      of "constant_declaration":                     vhdlConstantDeclaration
      of "constant_interface_declaration":           vhdlConstantInterfaceDeclaration
      of "constrained_array_definition":             vhdlConstrainedArrayDefinition
      of "context_clause":                           vhdlContextClause
      of "context_declaration":                      vhdlContextDeclaration
      of "context_list":                             vhdlContextList
      of "context_reference":                        vhdlContextReference
      of "declarative_part":                         vhdlDeclarativePart
      of "default":                                  vhdlDefault
      of "default_expression":                       vhdlDefaultExpression
      of "delay_mechanism":                          vhdlDelayMechanism
      of "descending_range":                         vhdlDescendingRange
      of "design_file":                              vhdlDesignFile
      of "design_unit":                              vhdlDesignUnit
      of "disconnection_specification":              vhdlDisconnectionSpecification
      of "element_declaration":                      vhdlElementDeclaration
      of "else":                                     vhdlElse
      of "else_generate":                            vhdlElseGenerate
      of "elsif":                                    vhdlElsif
      of "elsif_generate":                           vhdlElsifGenerate
      of "entity_class":                             vhdlEntityClass
      of "entity_class_entry":                       vhdlEntityClassEntry
      of "entity_class_entry_list":                  vhdlEntityClassEntryList
      of "entity_declaration":                       vhdlEntityDeclaration
      of "entity_designator":                        vhdlEntityDesignator
      of "entity_header":                            vhdlEntityHeader
      of "entity_instantiation":                     vhdlEntityInstantiation
      of "entity_name_list":                         vhdlEntityNameList
      of "entity_specification":                     vhdlEntitySpecification
      of "enumeration_type_definition":              vhdlEnumerationTypeDefinition
      of "exit_statement":                           vhdlExitStatement
      of "exponentiation":                           vhdlExponentiation
      of "expression":                               vhdlExpression
      of "expression_list":                          vhdlExpressionList
      of "external_constant_name":                   vhdlExternalConstantName
      of "external_signal_name":                     vhdlExternalSignalName
      of "external_variable_name":                   vhdlExternalVariableName
      of "factor":                                   vhdlFactor
      of "file_declaration":                         vhdlFileDeclaration
      of "file_interface_declaration":               vhdlFileInterfaceDeclaration
      of "file_open_information":                    vhdlFileOpenInformation
      of "file_open_kind":                           vhdlFileOpenKind
      of "file_type_definition":                     vhdlFileTypeDefinition
      of "for_generate_statement":                   vhdlForGenerateStatement
      of "for_loop":                                 vhdlForLoop
      of "force_mode":                               vhdlForceMode
      of "full_type_declaration":                    vhdlFullTypeDeclaration
      of "function_body":                            vhdlFunctionBody
      of "function_call":                            vhdlFunctionCall
      of "function_declaration":                     vhdlFunctionDeclaration
      of "function_instantiation_declaration":       vhdlFunctionInstantiationDeclaration
      of "function_interface_declaration":           vhdlFunctionInterfaceDeclaration
      of "function_parameter_clause":                vhdlFunctionParameterClause
      of "generate_statement_body":                  vhdlGenerateStatementBody
      of "generate_statement_element":               vhdlGenerateStatementElement
      of "generic_clause":                           vhdlGenericClause
      of "generic_map_aspect":                       vhdlGenericMapAspect
      of "group_constituent_list":                   vhdlGroupConstituentList
      of "group_declaration":                        vhdlGroupDeclaration
      of "group_template_declaration":               vhdlGroupTemplateDeclaration
      of "guarded_signal_specification":             vhdlGuardedSignalSpecification
      of "identifier_list":                          vhdlIdentifierList
      of "if":                                       vhdlIf
      of "if_generate":                              vhdlIfGenerate
      of "if_generate_statement":                    vhdlIfGenerateStatement
      of "if_statement":                             vhdlIfStatement
      of "illegal":                                  vhdlIllegal
      of "incomplete_type_declaration":              vhdlIncompleteTypeDeclaration
      of "index_constraint":                         vhdlIndexConstraint
      of "index_subtype_definition":                 vhdlIndexSubtypeDefinition
      of "inertial":                                 vhdlInertial
      of "inertial_expression":                      vhdlInertialExpression
      of "instantiation_list":                       vhdlInstantiationList
      of "integer":                                  vhdlInteger
      of "integer_decimal":                          vhdlIntegerDecimal
      of "interface_subprogram_default":             vhdlInterfaceSubprogramDefault
      of "label":                                    vhdlLabel
      of "length":                                   vhdlLength
      of "library_clause":                           vhdlLibraryClause
      of "logical_expression":                       vhdlLogicalExpression
      of "logical_name_list":                        vhdlLogicalNameList
      of "loop_statement":                           vhdlLoopStatement
      of "mode":                                     vhdlMode
      of "named_association_element":                vhdlNamedAssociationElement
      of "named_element_association":                vhdlNamedElementAssociation
      of "next_statement":                           vhdlNextStatement
      of "null":                                     vhdlNull
      of "null_statement":                           vhdlNullStatement
      of "numeric_type_definition":                  vhdlNumericTypeDefinition
      of "open":                                     vhdlOpen
      of "operator_symbol":                          vhdlOperatorSymbol
      of "others":                                   vhdlOthers
      of "package_body":                             vhdlPackageBody
      of "package_declaration":                      vhdlPackageDeclaration
      of "package_header":                           vhdlPackageHeader
      of "package_instantiation_declaration":        vhdlPackageInstantiationDeclaration
      of "package_interface_declaration":            vhdlPackageInterfaceDeclaration
      of "package_map_aspect":                       vhdlPackageMapAspect
      of "package_pathname":                         vhdlPackagePathname
      of "parameter_specification":                  vhdlParameterSpecification
      of "parenthesized_expression":                 vhdlParenthesizedExpression
      of "parenthesized_resolution":                 vhdlParenthesizedResolution
      of "pathname_element":                         vhdlPathnameElement
      of "physical_literal":                         vhdlPhysicalLiteral
      of "physical_type_definition":                 vhdlPhysicalTypeDefinition
      of "port_clause":                              vhdlPortClause
      of "port_map_aspect":                          vhdlPortMapAspect
      of "positional_association_element":           vhdlPositionalAssociationElement
      of "positional_element_association":           vhdlPositionalElementAssociation
      of "predefined_designator":                    vhdlPredefinedDesignator
      of "primary_unit_declaration":                 vhdlPrimaryUnitDeclaration
      of "procedure_body":                           vhdlProcedureBody
      of "procedure_call_statement":                 vhdlProcedureCallStatement
      of "procedure_declaration":                    vhdlProcedureDeclaration
      of "procedure_instantiation_declaration":      vhdlProcedureInstantiationDeclaration
      of "procedure_interface_declaration":          vhdlProcedureInterfaceDeclaration
      of "procedure_parameter_clause":               vhdlProcedureParameterClause
      of "process_statement":                        vhdlProcessStatement
      of "protected_type_body":                      vhdlProtectedTypeBody
      of "protected_type_declaration":               vhdlProtectedTypeDeclaration
      of "qualified_expression":                     vhdlQualifiedExpression
      of "range_constraint":                         vhdlRangeConstraint
      of "real_decimal":                             vhdlRealDecimal
      of "record_constraint":                        vhdlRecordConstraint
      of "record_element_constraint":                vhdlRecordElementConstraint
      of "record_element_resolution":                vhdlRecordElementResolution
      of "record_resolution":                        vhdlRecordResolution
      of "record_type_definition":                   vhdlRecordTypeDefinition
      of "reduction":                                vhdlReduction
      of "relation":                                 vhdlRelation
      of "relative_pathname":                        vhdlRelativePathname
      of "report_statement":                         vhdlReportStatement
      of "resolution_function":                      vhdlResolutionFunction
      of "return":                                   vhdlReturn
      of "return_statement":                         vhdlReturnStatement
      of "secondary_unit_declaration":               vhdlSecondaryUnitDeclaration
      of "selected_concurrent_signal_assignment":    vhdlSelectedConcurrentSignalAssignment
      of "selected_expressions":                     vhdlSelectedExpressions
      of "selected_force_assignment":                vhdlSelectedForceAssignment
      of "selected_name":                            vhdlSelectedName
      of "selected_variable_assignment":             vhdlSelectedVariableAssignment
      of "selected_waveform_assignment":             vhdlSelectedWaveformAssignment
      of "selected_waveforms":                       vhdlSelectedWaveforms
      of "sensitivity_list":                         vhdlSensitivityList
      of "separator":                                vhdlSeparator
      of "sequence_of_statements":                   vhdlSequenceOfStatements
      of "severity_expression":                      vhdlSeverityExpression
      of "shared_variable_declaration":              vhdlSharedVariableDeclaration
      of "shift_expression":                         vhdlShiftExpression
      of "sign":                                     vhdlSign
      of "signal_declaration":                       vhdlSignalDeclaration
      of "signal_interface_declaration":             vhdlSignalInterfaceDeclaration
      of "signal_kind":                              vhdlSignalKind
      of "signal_list":                              vhdlSignalList
      of "signature":                                vhdlSignature
      of "simple_concurrent_signal_assignment":      vhdlSimpleConcurrentSignalAssignment
      of "simple_expression":                        vhdlSimpleExpression
      of "simple_force_assignment":                  vhdlSimpleForceAssignment
      of "simple_release_assignment":                vhdlSimpleReleaseAssignment
      of "simple_variable_assignment":               vhdlSimpleVariableAssignment
      of "simple_waveform_assignment":               vhdlSimpleWaveformAssignment
      of "slice_name":                               vhdlSliceName
      of "string_expression":                        vhdlStringExpression
      of "string_literal":                           vhdlStringLiteral
      of "subprogram_header":                        vhdlSubprogramHeader
      of "subprogram_map_aspect":                    vhdlSubprogramMapAspect
      of "subtype_declaration":                      vhdlSubtypeDeclaration
      of "subtype_indication":                       vhdlSubtypeIndication
      of "term":                                     vhdlTerm
      of "time_expression":                          vhdlTimeExpression
      of "tool_directive":                           vhdlToolDirective
      of "transport":                                vhdlTransport
      of "type_interface_declaration":               vhdlTypeInterfaceDeclaration
      of "type_mark":                                vhdlTypeMark
      of "unaffected":                               vhdlUnaffected
      of "unbounded_array_definition":               vhdlUnboundedArrayDefinition
      of "use_clause":                               vhdlUseClause
      of "variable_declaration":                     vhdlVariableDeclaration
      of "variable_interface_declaration":           vhdlVariableInterfaceDeclaration
      of "verification_unit_binding_indication":     vhdlVerificationUnitBindingIndication
      of "verification_unit_list":                   vhdlVerificationUnitList
      of "wait_statement":                           vhdlWaitStatement
      of "waveform_element":                         vhdlWaveformElement
      of "waveforms":                                vhdlWaveforms
      of "while_loop":                               vhdlWhileLoop
      of "!":                                        vhdlExclamationTok
      of "!=":                                       vhdlExclamationEqualTok
      of "\"":                                       vhdlQuoteTok
      of "#":                                        vhdlHashTok
      of "&":                                        vhdlAmpersandTok
      of "&&":                                       vhdlDoubleAmpersandTok
      of "\'":                                       vhdlApostropheTok
      of "(":                                        vhdlLParTok
      of ")":                                        vhdlRParTok
      of "*":                                        vhdlAsteriskTok
      of "**":                                       vhdlDoubleAsteriskTok
      of "*/":                                       vhdlAsteriskSlashTok
      of "+":                                        vhdlPlusTok
      of ",":                                        vhdlCommaTok
      of "-":                                        vhdlMinusTok
      of "--":                                       vhdlDoubleMinusTok
      of "->":                                       vhdlMinusGreaterThanTok
      of ".":                                        vhdlDotTok
      of "/":                                        vhdlSlashTok
      of "/*":                                       vhdlSlashAsteriskTok
      of "/=":                                       vhdlSlashEqualTok
      of "0":                                        vhdl0Tok
      of "1":                                        vhdl1Tok
      of "2":                                        vhdl2Tok
      of "3":                                        vhdl3Tok
      of "4":                                        vhdl4Tok
      of "5":                                        vhdl5Tok
      of "6":                                        vhdl6Tok
      of "7":                                        vhdl7Tok
      of "8":                                        vhdl8Tok
      of "9":                                        vhdl9Tok
      of ":":                                        vhdlColonTok
      of ":=":                                       vhdlColonEqualTok
      of ";":                                        vhdlSemicolonTok
      of "<":                                        vhdlLessThanTok
      of "<->":                                      vhdlLessThanMinusGreaterThanTok
      of "<<":                                       vhdlDoubleLessThanTok
      of "<=":                                       vhdlLessThanEqualTok
      of "=":                                        vhdlEqualTok
      of "==":                                       vhdlDoubleEqualTok
      of "=>":                                       vhdlEqualGreaterThanTok
      of ">":                                        vhdlGreaterThanTok
      of ">=":                                       vhdlGreaterThanEqualTok
      of ">>":                                       vhdlDoubleGreaterThanTok
      of "?":                                        vhdlQuestionTok
      of "?/=":                                      vhdlQuestionSlashEqualTok
      of "?<":                                       vhdlQuestionLessThanTok
      of "?<=":                                      vhdlQuestionLessThanEqualTok
      of "?=":                                       vhdlQuestionEqualTok
      of "?>":                                       vhdlQuestionGreaterThanTok
      of "?>=":                                      vhdlQuestionGreaterThanEqualTok
      of "??":                                       vhdlDoubleQuestionTok
      of "@":                                        vhdlAtTok
      of "[":                                        vhdlLBrackTok
      of "]":                                        vhdlRBrackTok
      of "^.":                                       vhdlAccentDotTok
      of "_":                                        vhdlUnderscoreTok
      of "`":                                        vhdlBacktickTok
      of "abort":                                    vhdlAbortTok
      of "abs":                                      vhdlAbsTok
      of "access":                                   vhdlAccessTok
      of "active":                                   vhdlActiveTok
      of "after":                                    vhdlAfterTok
      of "alias":                                    vhdlAliasTok
      of "always":                                   vhdlAlwaysTok
      of "and":                                      vhdlAndTok
      of "any":                                      vhdlAny
      of "architecture":                             vhdlArchitectureTok
      of "array":                                    vhdlArrayTok
      of "ascending":                                vhdlAscendingTok
      of "assert":                                   vhdlAssertTok
      of "assume":                                   vhdlAssumeTok
      of "assume_guarantee":                         vhdlAssumeGuaranteeTok
      of "async_abort":                              vhdlAsyncAbortTok
      of "attribute":                                vhdlAttributeTok
      of "base_specifier":                           vhdlBaseSpecifier
      of "before":                                   vhdlBeforeTok
      of "begin":                                    vhdlBeginTok
      of "bit":                                      vhdlBitTok
      of "bit_vector":                               vhdlBitVectorTok
      of "block":                                    vhdlBlockTok
      of "body":                                     vhdlBodyTok
      of "buffer":                                   vhdlBufferTok
      of "bus":                                      vhdlBusTok
      of "case":                                     vhdlCaseTok
      of "clock":                                    vhdlClockTok
      of "component":                                vhdlComponentTok
      of "configuration":                            vhdlConfigurationTok
      of "const":                                    vhdlConstTok
      of "constant":                                 vhdlConstantTok
      of "context":                                  vhdlContextTok
      of "countones":                                vhdlCountonesTok
      of "cover":                                    vhdlCoverTok
      of "delayed":                                  vhdlDelayedTok
      of "descending":                               vhdlDescendingTok
      of "disconnect":                               vhdlDisconnectTok
      of "dont_care":                                vhdlDontCare
      of "downto":                                   vhdlDowntoTok
      of "driving":                                  vhdlDrivingTok
      of "driving_value":                            vhdlDrivingValueTok
      of "element":                                  vhdlElementTok
      of "end":                                      vhdlEndTok
      of "ended":                                    vhdlEndedTok
      of "entity":                                   vhdlEntityTok
      of "escape_sequence":                          vhdlEscapeSequence
      of "event":                                    vhdlEventTok
      of "eventually":                               vhdlEventuallyTok
      of "exit":                                     vhdlExitTok
      of "exponent":                                 vhdlExponent
      of "extended_identifier":                      vhdlExtendedIdentifier
      of "extended_simple_name":                     vhdlExtendedSimpleName
      of "fairness":                                 vhdlFairnessTok
      of "fell":                                     vhdlFellTok
      of "file":                                     vhdlFileTok
      of "for":                                      vhdlForTok
      of "forall":                                   vhdlForallTok
      of "force":                                    vhdlForceTok
      of "function":                                 vhdlFunctionTok
      of "generate":                                 vhdlGenerateTok
      of "generic":                                  vhdlGenericTok
      of "group":                                    vhdlGroupTok
      of "guarded":                                  vhdlGuardedTok
      of "hdltype":                                  vhdlHdltypeTok
      of "high":                                     vhdlHighTok
      of "identifier":                               vhdlIdentifier
      of "image":                                    vhdlImageTok
      of "impure":                                   vhdlImpureTok
      of "in":                                       vhdlInTok
      of "inherit":                                  vhdlInheritTok
      of "inout":                                    vhdlInoutTok
      of "instance_name":                            vhdlInstanceNameTok
      of "is":                                       vhdlIsTok
      of "isunknown":                                vhdlIsunknownTok
      of "last_active":                              vhdlLastActiveTok
      of "last_event":                               vhdlLastEventTok
      of "last_value":                               vhdlLastValueTok
      of "left":                                     vhdlLeftTok
      of "leftof":                                   vhdlLeftofTok
      of "library":                                  vhdlLibraryTok
      of "linkage":                                  vhdlLinkageTok
      of "literal":                                  vhdlLiteralTok
      of "loop":                                     vhdlLoopTok
      of "low":                                      vhdlLowTok
      of "map":                                      vhdlMapTok
      of "mod":                                      vhdlModTok
      of "nand":                                     vhdlNandTok
      of "never":                                    vhdlNeverTok
      of "new":                                      vhdlNewTok
      of "next":                                     vhdlNextTok
      of "next_a":                                   vhdlNextATok
      of "next_e":                                   vhdlNextETok
      of "next_event":                               vhdlNextEventTok
      of "next_event_a":                             vhdlNextEventATok
      of "next_event_e":                             vhdlNextEventETok
      of "nondet":                                   vhdlNondetTok
      of "nondet_vector":                            vhdlNondetVectorTok
      of "nor":                                      vhdlNorTok
      of "not":                                      vhdlNotTok
      of "numeric":                                  vhdlNumericTok
      of "of":                                       vhdlOfTok
      of "on":                                       vhdlOnTok
      of "onehot":                                   vhdlOnehotTok
      of "onehot0":                                  vhdlOnehot0Tok
      of "or":                                       vhdlOrTok
      of "out":                                      vhdlOutTok
      of "package":                                  vhdlPackageTok
      of "parameter":                                vhdlParameterTok
      of "path_name":                                vhdlPathNameTok
      of "port":                                     vhdlPortTok
      of "pos":                                      vhdlPosTok
      of "postponed":                                vhdlPostponedTok
      of "pred":                                     vhdlPredTok
      of "prev":                                     vhdlPrevTok
      of "procedure":                                vhdlProcedureTok
      of "process":                                  vhdlProcessTok
      of "property":                                 vhdlPropertyTok
      of "protected":                                vhdlProtectedTok
      of "pure":                                     vhdlPureTok
      of "quiet":                                    vhdlQuietTok
      of "range":                                    vhdlRangeTok
      of "record":                                   vhdlRecordTok
      of "register":                                 vhdlRegisterTok
      of "reject":                                   vhdlRejectTok
      of "release":                                  vhdlReleaseTok
      of "rem":                                      vhdlRemTok
      of "report":                                   vhdlReportTok
      of "restrict":                                 vhdlRestrictTok
      of "restrict_guarantee":                       vhdlRestrictGuaranteeTok
      of "reverse_range":                            vhdlReverseRangeTok
      of "right":                                    vhdlRightTok
      of "rightof":                                  vhdlRightofTok
      of "rol":                                      vhdlRolTok
      of "ror":                                      vhdlRorTok
      of "rose":                                     vhdlRoseTok
      of "same":                                     vhdlSame
      of "select":                                   vhdlSelectTok
      of "semicolon":                                vhdlSemicolon
      of "sequence":                                 vhdlSequenceTok
      of "severity":                                 vhdlSeverityTok
      of "shared":                                   vhdlSharedTok
      of "signal":                                   vhdlSignalTok
      of "simple_name":                              vhdlSimpleNameTok
      of "sla":                                      vhdlSlaTok
      of "sll":                                      vhdlSllTok
      of "sra":                                      vhdlSraTok
      of "srl":                                      vhdlSrlTok
      of "stable":                                   vhdlStableTok
      of "string":                                   vhdlStringTok
      of "strong":                                   vhdlStrongTok
      of "subtype":                                  vhdlSubtypeTok
      of "succ":                                     vhdlSuccTok
      of "sync_abort":                               vhdlSyncAbortTok
      of "then":                                     vhdlThenTok
      of "to":                                       vhdlToTok
      of "transaction":                              vhdlTransactionTok
      of "type":                                     vhdlTypeTok
      of "union":                                    vhdlUnionTok
      of "units":                                    vhdlUnitsTok
      of "unresolved":                               vhdlUnresolved
      of "until":                                    vhdlUntilTok
      of "use":                                      vhdlUseTok
      of "val":                                      vhdlValTok
      of "value":                                    vhdlValueTok
      of "variable":                                 vhdlVariableTok
      of "vmode":                                    vhdlVmodeTok
      of "vprop":                                    vhdlVpropTok
      of "vunit":                                    vhdlVunitTok
      of "wait":                                     vhdlWaitTok
      of "when":                                     vhdlWhenTok
      of "while":                                    vhdlWhileTok
      of "with":                                     vhdlWithTok
      of "within":                                   vhdlWithinTok
      of "xnor":                                     vhdlXnorTok
      of "xor":                                      vhdlXorTok
      of "{":                                        vhdlLCurlyTok
      of "|":                                        vhdlPipeTok
      of "|->":                                      vhdlPipeMinusGreaterThanTok
      of "|=>":                                      vhdlPipeEqualGreaterThanTok
      of "}":                                        vhdlRCurlyTok
      of "_separator":                               vhdlSeparator
      of "ERROR":                                    vhdlSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsVhdlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsVhdlNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsVhdlNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_vhdl(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsVhdlNode): string =
  $ts_node_type(TSNode(node))

proc newTsVhdlParser*(): VhdlParser =
  result = VhdlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_vhdl())

proc parseString*(parser: VhdlParser, str: string): TsVhdlNode =
  TsVhdlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsVhdlString*(str: string): TsVhdlNode =
  let parser = newTsVhdlParser()
  return parseString(parser, str)

func `$`*(node: TsVhdlNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsVhdlNode,
    idx:  int,
    kind: VhdlNodeKind | set[VhdlNodeKind]
  ): TsVhdlNode =
  assert 0 <= idx and idx < node.len
  result = TsVhdlNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  VhdlNode* = HtsNode[TsVhdlNode, VhdlNodeKind]


proc treeReprTsVhdl*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsVhdlNode, VhdlNodeKind](parseTsVhdlString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsVhdlNode,
    str:  ptr string
  ): HtsNode[TsVhdlNode, VhdlNodeKind] =
  toHtsNode[TsVhdlNode, VhdlNodeKind](node, str)

proc toHtsTree*(node: TsVhdlNode, str: ptr string): VhdlNode =
  toHtsNode[TsVhdlNode, VhdlNodeKind](node, str)

proc parseVhdlString*(str: ptr string, unnamed: bool = false): VhdlNode =
  let parser = newTsVhdlParser()
  return toHtsTree[TsVhdlNode, VhdlNodeKind](parseString(parser, str[]), str)

proc parseVhdlString*(str: string, unnamed: bool = false): VhdlNode =
  let parser = newTsVhdlParser()
  return toHtsTree[TsVhdlNode, VhdlNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


