import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  VhdlNodeKind* = enum
    vhdlPSLActualParameter                                  ## PSL_Actual_Parameter
    vhdlPSLActualParameterList                              ## PSL_Actual_Parameter_List
    vhdlPSLAmbiguousInstance                                ## PSL_Ambiguous_Instance
    vhdlPSLAnyType                                          ## PSL_Any_Type
    vhdlPSLAssertDirective                                  ## PSL_Assert_Directive
    vhdlPSLAssumeDirective                                  ## PSL_Assume_Directive
    vhdlPSLAssumeGuaranteeDirective                         ## PSL_Assume_Guarantee_Directive
    vhdlPSLBoolean                                          ## PSL_Boolean
    vhdlPSLBoundingFLProperty                               ## PSL_Bounding_FL_Property
    vhdlPSLBracedSERE                                       ## PSL_Braced_SERE
    vhdlPSLBuiltInFunctionCall                              ## PSL_Built_In_Function_Call
    vhdlPSLClockDeclaration                                 ## PSL_Clock_Declaration
    vhdlPSLClockedFLProperty                                ## PSL_Clocked_FL_Property
    vhdlPSLClockedSERE                                      ## PSL_Clocked_SERE
    vhdlPSLCompoundSERE                                     ## PSL_Compound_SERE
    vhdlPSLConstantParameterSpecification                   ## PSL_Constant_Parameter_Specification
    vhdlPSLCount                                            ## PSL_Count
    vhdlPSLCoverDirective                                   ## PSL_Cover_Directive
    vhdlPSLExpression                                       ## PSL_Expression
    vhdlPSLExtendedOcurrenceFLProperty                      ## PSL_Extended_Ocurrence_FL_Property
    vhdlPSLFactorFLProperty                                 ## PSL_Factor_FL_Property
    vhdlPSLFairnessDirective                                ## PSL_Fairness_Directive
    vhdlPSLFormalParameter                                  ## PSL_Formal_Parameter
    vhdlPSLFormalParameterList                              ## PSL_Formal_Parameter_List
    vhdlPSLHDLType                                          ## PSL_HDL_Type
    vhdlPSLHierarchicalHDLName                              ## PSL_Hierarchical_HDL_Name
    vhdlPSLImplicationFLProperty                            ## PSL_Implication_FL_Property
    vhdlPSLIndexRange                                       ## PSL_Index_Range
    vhdlPSLInheritSpec                                      ## PSL_Inherit_Spec
    vhdlPSLInvariantFLProperty                              ## PSL_Invariant_FL_Property
    vhdlPSLLogicalFLProperty                                ## PSL_Logical_FL_Property
    vhdlPSLNumber                                           ## PSL_Number
    vhdlPSLOcurrenceFLProperty                              ## PSL_Ocurrence_FL_Property
    vhdlPSLParameterSpecification                           ## PSL_Parameter_Specification
    vhdlPSLParameterizedProperty                            ## PSL_Parameterized_Property
    vhdlPSLParameterizedSERE                                ## PSL_Parameterized_SERE
    vhdlPSLParametersDefinition                             ## PSL_Parameters_Definition
    vhdlPSLParenthesizedFLProperty                          ## PSL_Parenthesized_FL_Property
    vhdlPSLPropertyDeclaration                              ## PSL_Property_Declaration
    vhdlPSLPropertyInstance                                 ## PSL_Property_Instance
    vhdlPSLPropertyReplicator                               ## PSL_Property_Replicator
    vhdlPSLRepeatedSERE                                     ## PSL_Repeated_SERE
    vhdlPSLRestrictDirective                                ## PSL_Restrict_Directive
    vhdlPSLRestrictGuaranteeDirective                       ## PSL_Restrict_Guarantee_Directive
    vhdlPSLSequenceDeclaration                              ## PSL_Sequence_Declaration
    vhdlPSLSequenceInstance                                 ## PSL_Sequence_Instance
    vhdlPSLSequentialFLProperty                             ## PSL_Sequential_FL_Property
    vhdlPSLSimpleSERE                                       ## PSL_Simple_SERE
    vhdlPSLStrongFairnessDirective                          ## PSL_Strong_Fairness_Directive
    vhdlPSLSuffixImplicationFLProperty                      ## PSL_Suffix_Implication_FL_Property
    vhdlPSLTemporalParameterSpecification                   ## PSL_Temporal_Parameter_Specification
    vhdlPSLTerminationFLProperty                            ## PSL_Termination_FL_Property
    vhdlPSLTypeClass                                        ## PSL_Type_Class
    vhdlPSLUnionExpression                                  ## PSL_Union_Expression
    vhdlPSLVMOde                                            ## PSL_VMode
    vhdlPSLVPRop                                            ## PSL_VProp
    vhdlPSLVUNit                                            ## PSL_VUnit
    vhdlPSLValueSet                                         ## PSL_Value_Set
    vhdlPSLVerificationUnitBody                             ## PSL_Verification_Unit_Body
    vhdlAbsolutePathname                                    ## absolute_pathname
    vhdlAccessTypeDefinition                                ## access_type_definition
    vhdlAggregate                                           ## aggregate
    vhdlAliasDeclaration                                    ## alias_declaration
    vhdlAll                                                 ## all
    vhdlAllocator                                           ## allocator
    vhdlAlternativeConditionalExpressions                   ## alternative_conditional_expressions
    vhdlAlternativeConditionalWaveforms                     ## alternative_conditional_waveforms
    vhdlAlternativeSelectedExpressions                      ## alternative_selected_expressions
    vhdlAlternativeSelectedWaveforms                        ## alternative_selected_waveforms
    vhdlAmbiguousName                                       ## ambiguous_name
    vhdlArchitectureBody                                    ## architecture_body
    vhdlArrayConstraint                                     ## array_constraint
    vhdlAscendingRange                                      ## ascending_range
    vhdlAssertionStatement                                  ## assertion_statement
    vhdlAssociationList                                     ## association_list
    vhdlAttributeDeclaration                                ## attribute_declaration
    vhdlAttributeName                                       ## attribute_name
    vhdlAttributeSpecification                              ## attribute_specification
    vhdlBase                                                ## base
    vhdlBasedInteger                                        ## based_integer
    vhdlBasedLiteral                                        ## based_literal
    vhdlBasedReal                                           ## based_real
    vhdlBindingIndication                                   ## binding_indication
    vhdlBitStringLiteral                                    ## bit_string_literal
    vhdlBitValue                                            ## bit_value
    vhdlBlockConfiguration                                  ## block_configuration
    vhdlBlockHeader                                         ## block_header
    vhdlBlockSpecification                                  ## block_specification
    vhdlBlockStatement                                      ## block_statement
    vhdlBoolean                                             ## boolean
    vhdlCaseGenerateAlternative                             ## case_generate_alternative
    vhdlCaseGenerateStatement                               ## case_generate_statement
    vhdlCaseStatement                                       ## case_statement
    vhdlCaseStatementAlternative                            ## case_statement_alternative
    vhdlCharacterLiteral                                    ## character_literal
    vhdlChoices                                             ## choices
    vhdlComment                                             ## comment
    vhdlComponentConfiguration                              ## component_configuration
    vhdlComponentDeclaration                                ## component_declaration
    vhdlComponentHeader                                     ## component_header
    vhdlComponentInstantiation                              ## component_instantiation
    vhdlComponentInstantiationStatement                     ## component_instantiation_statement
    vhdlComponentMapAspect                                  ## component_map_aspect
    vhdlConcatenation                                       ## concatenation
    vhdlConcurrentStatementPart                             ## concurrent_statement_part
    vhdlCondition                                           ## condition
    vhdlConditionalConcurrentSignalAssignment               ## conditional_concurrent_signal_assignment
    vhdlConditionalExpression                               ## conditional_expression
    vhdlConditionalExpressions                              ## conditional_expressions
    vhdlConditionalForceAssignment                          ## conditional_force_assignment
    vhdlConditionalVariableAssignment                       ## conditional_variable_assignment
    vhdlConditionalWaveformAssignment                       ## conditional_waveform_assignment
    vhdlConditionalWaveforms                                ## conditional_waveforms
    vhdlConfigurationDeclaration                            ## configuration_declaration
    vhdlConfigurationInstantiation                          ## configuration_instantiation
    vhdlConfigurationSpecification                          ## configuration_specification
    vhdlConstantDeclaration                                 ## constant_declaration
    vhdlConstantInterfaceDeclaration                        ## constant_interface_declaration
    vhdlConstrainedArrayDefinition                          ## constrained_array_definition
    vhdlContextClause                                       ## context_clause
    vhdlContextDeclaration                                  ## context_declaration
    vhdlContextList                                         ## context_list
    vhdlContextReference                                    ## context_reference
    vhdlDeclarativePart                                     ## declarative_part
    vhdlDefault                                             ## default
    vhdlDefaultExpression                                   ## default_expression
    vhdlDelayMechanism                                      ## delay_mechanism
    vhdlDescendingRange                                     ## descending_range
    vhdlDesignFile                                          ## design_file
    vhdlDesignUnit                                          ## design_unit
    vhdlDisconnectionSpecification                          ## disconnection_specification
    vhdlElementDeclaration                                  ## element_declaration
    vhdlElse                                                ## else
    vhdlElseGenerate                                        ## else_generate
    vhdlElsif                                               ## elsif
    vhdlElsifGenerate                                       ## elsif_generate
    vhdlEntityClass                                         ## entity_class
    vhdlEntityClassEntry                                    ## entity_class_entry
    vhdlEntityClassEntryList                                ## entity_class_entry_list
    vhdlEntityDeclaration                                   ## entity_declaration
    vhdlEntityDesignator                                    ## entity_designator
    vhdlEntityHeader                                        ## entity_header
    vhdlEntityInstantiation                                 ## entity_instantiation
    vhdlEntityNameList                                      ## entity_name_list
    vhdlEntitySpecification                                 ## entity_specification
    vhdlEnumerationTypeDefinition                           ## enumeration_type_definition
    vhdlExitStatement                                       ## exit_statement
    vhdlExponentiation                                      ## exponentiation
    vhdlExpression                                          ## expression
    vhdlExpressionList                                      ## expression_list
    vhdlExternalConstantName                                ## external_constant_name
    vhdlExternalSignalName                                  ## external_signal_name
    vhdlExternalVariableName                                ## external_variable_name
    vhdlFactor                                              ## factor
    vhdlFileDeclaration                                     ## file_declaration
    vhdlFileInterfaceDeclaration                            ## file_interface_declaration
    vhdlFileOpenInformation                                 ## file_open_information
    vhdlFileOpenKind                                        ## file_open_kind
    vhdlFileTypeDefinition                                  ## file_type_definition
    vhdlForGenerateStatement                                ## for_generate_statement
    vhdlForLoop                                             ## for_loop
    vhdlForceMode                                           ## force_mode
    vhdlFullTypeDeclaration                                 ## full_type_declaration
    vhdlFunctionBody                                        ## function_body
    vhdlFunctionCall                                        ## function_call
    vhdlFunctionDeclaration                                 ## function_declaration
    vhdlFunctionInstantiationDeclaration                    ## function_instantiation_declaration
    vhdlFunctionInterfaceDeclaration                        ## function_interface_declaration
    vhdlFunctionParameterClause                             ## function_parameter_clause
    vhdlGenerateStatementBody                               ## generate_statement_body
    vhdlGenerateStatementElement                            ## generate_statement_element
    vhdlGenericClause                                       ## generic_clause
    vhdlGenericMapAspect                                    ## generic_map_aspect
    vhdlGroupConstituentList                                ## group_constituent_list
    vhdlGroupDeclaration                                    ## group_declaration
    vhdlGroupTemplateDeclaration                            ## group_template_declaration
    vhdlGuardedSignalSpecification                          ## guarded_signal_specification
    vhdlIdentifierList                                      ## identifier_list
    vhdlIf                                                  ## if
    vhdlIfGenerate                                          ## if_generate
    vhdlIfGenerateStatement                                 ## if_generate_statement
    vhdlIfStatement                                         ## if_statement
    vhdlIllegal                                             ## illegal
    vhdlIncompleteTypeDeclaration                           ## incomplete_type_declaration
    vhdlIndexConstraint                                     ## index_constraint
    vhdlIndexSubtypeDefinition                              ## index_subtype_definition
    vhdlInertial                                            ## inertial
    vhdlInertialExpression                                  ## inertial_expression
    vhdlInstantiationList                                   ## instantiation_list
    vhdlInteger                                             ## integer
    vhdlIntegerDecimal                                      ## integer_decimal
    vhdlInterfaceSubprogramDefault                          ## interface_subprogram_default
    vhdlLabel                                               ## label
    vhdlLength                                              ## length
    vhdlLibraryClause                                       ## library_clause
    vhdlLogicalExpression                                   ## logical_expression
    vhdlLogicalNameList                                     ## logical_name_list
    vhdlLoopStatement                                       ## loop_statement
    vhdlMode                                                ## mode
    vhdlNamedAssociationElement                             ## named_association_element
    vhdlNamedElementAssociation                             ## named_element_association
    vhdlNextStatement                                       ## next_statement
    vhdlNull                                                ## null
    vhdlNullStatement                                       ## null_statement
    vhdlNumericTypeDefinition                               ## numeric_type_definition
    vhdlOpen                                                ## open
    vhdlOperatorSymbol                                      ## operator_symbol
    vhdlOthers                                              ## others
    vhdlPackageBody                                         ## package_body
    vhdlPackageDeclaration                                  ## package_declaration
    vhdlPackageHeader                                       ## package_header
    vhdlPackageInstantiationDeclaration                     ## package_instantiation_declaration
    vhdlPackageInterfaceDeclaration                         ## package_interface_declaration
    vhdlPackageMapAspect                                    ## package_map_aspect
    vhdlPackagePathname                                     ## package_pathname
    vhdlParameterSpecification                              ## parameter_specification
    vhdlParenthesizedExpression                             ## parenthesized_expression
    vhdlParenthesizedResolution                             ## parenthesized_resolution
    vhdlPathnameElement                                     ## pathname_element
    vhdlPhysicalLiteral                                     ## physical_literal
    vhdlPhysicalTypeDefinition                              ## physical_type_definition
    vhdlPortClause                                          ## port_clause
    vhdlPortMapAspect                                       ## port_map_aspect
    vhdlPositionalAssociationElement                        ## positional_association_element
    vhdlPositionalElementAssociation                        ## positional_element_association
    vhdlPredefinedDesignator                                ## predefined_designator
    vhdlPrimaryUnitDeclaration                              ## primary_unit_declaration
    vhdlProcedureBody                                       ## procedure_body
    vhdlProcedureCallStatement                              ## procedure_call_statement
    vhdlProcedureDeclaration                                ## procedure_declaration
    vhdlProcedureInstantiationDeclaration                   ## procedure_instantiation_declaration
    vhdlProcedureInterfaceDeclaration                       ## procedure_interface_declaration
    vhdlProcedureParameterClause                            ## procedure_parameter_clause
    vhdlProcessStatement                                    ## process_statement
    vhdlProtectedTypeBody                                   ## protected_type_body
    vhdlProtectedTypeDeclaration                            ## protected_type_declaration
    vhdlQualifiedExpression                                 ## qualified_expression
    vhdlRangeConstraint                                     ## range_constraint
    vhdlRealDecimal                                         ## real_decimal
    vhdlRecordConstraint                                    ## record_constraint
    vhdlRecordElementConstraint                             ## record_element_constraint
    vhdlRecordElementResolution                             ## record_element_resolution
    vhdlRecordResolution                                    ## record_resolution
    vhdlRecordTypeDefinition                                ## record_type_definition
    vhdlReduction                                           ## reduction
    vhdlRelation                                            ## relation
    vhdlRelativePathname                                    ## relative_pathname
    vhdlReportStatement                                     ## report_statement
    vhdlResolutionFunction                                  ## resolution_function
    vhdlReturn                                              ## return
    vhdlReturnStatement                                     ## return_statement
    vhdlSecondaryUnitDeclaration                            ## secondary_unit_declaration
    vhdlSelectedConcurrentSignalAssignment                  ## selected_concurrent_signal_assignment
    vhdlSelectedExpressions                                 ## selected_expressions
    vhdlSelectedForceAssignment                             ## selected_force_assignment
    vhdlSelectedName                                        ## selected_name
    vhdlSelectedVariableAssignment                          ## selected_variable_assignment
    vhdlSelectedWaveformAssignment                          ## selected_waveform_assignment
    vhdlSelectedWaveforms                                   ## selected_waveforms
    vhdlSensitivityList                                     ## sensitivity_list
    vhdlSeparator                                           ## separator
    vhdlSequenceOfStatements                                ## sequence_of_statements
    vhdlSeverityExpression                                  ## severity_expression
    vhdlSharedVariableDeclaration                           ## shared_variable_declaration
    vhdlShiftExpression                                     ## shift_expression
    vhdlSign                                                ## sign
    vhdlSignalDeclaration                                   ## signal_declaration
    vhdlSignalInterfaceDeclaration                          ## signal_interface_declaration
    vhdlSignalKind                                          ## signal_kind
    vhdlSignalList                                          ## signal_list
    vhdlSignature                                           ## signature
    vhdlSimpleConcurrentSignalAssignment                    ## simple_concurrent_signal_assignment
    vhdlSimpleExpression                                    ## simple_expression
    vhdlSimpleForceAssignment                               ## simple_force_assignment
    vhdlSimpleReleaseAssignment                             ## simple_release_assignment
    vhdlSimpleVariableAssignment                            ## simple_variable_assignment
    vhdlSimpleWaveformAssignment                            ## simple_waveform_assignment
    vhdlSliceName                                           ## slice_name
    vhdlStringExpression                                    ## string_expression
    vhdlStringLiteral                                       ## string_literal
    vhdlSubprogramHeader                                    ## subprogram_header
    vhdlSubprogramMapAspect                                 ## subprogram_map_aspect
    vhdlSubtypeDeclaration                                  ## subtype_declaration
    vhdlSubtypeIndication                                   ## subtype_indication
    vhdlTerm                                                ## term
    vhdlTimeExpression                                      ## time_expression
    vhdlToolDirective                                       ## tool_directive
    vhdlTransport                                           ## transport
    vhdlTypeInterfaceDeclaration                            ## type_interface_declaration
    vhdlTypeMark                                            ## type_mark
    vhdlUnaffected                                          ## unaffected
    vhdlUnboundedArrayDefinition                            ## unbounded_array_definition
    vhdlUseClause                                           ## use_clause
    vhdlVariableDeclaration                                 ## variable_declaration
    vhdlVariableInterfaceDeclaration                        ## variable_interface_declaration
    vhdlVerificationUnitBindingIndication                   ## verification_unit_binding_indication
    vhdlVerificationUnitList                                ## verification_unit_list
    vhdlWaitStatement                                       ## wait_statement
    vhdlWaveformElement                                     ## waveform_element
    vhdlWaveforms                                           ## waveforms
    vhdlWhileLoop                                           ## while_loop
    vhdlExclamationTok                                      ## !
    vhdlExclamationEqualTok                                 ## !=
    vhdlQuoteTok                                            ## "
    vhdlHashTok                                             ## #
    vhdlAmpersandTok                                        ## &
    vhdlDoubleAmpersandTok                                  ## &&
    vhdlApostropheTok                                       ## '
    vhdlLParTok                                             ## (
    vhdlRParTok                                             ## )
    vhdlAsteriskTok                                         ## *
    vhdlDoubleAsteriskTok                                   ## **
    vhdlAsteriskSlashTok                                    ## */
    vhdlPlusTok                                             ## +
    vhdlCommaTok                                            ## ,
    vhdlMinusTok                                            ## -
    vhdlDoubleMinusTok                                      ## --
    vhdlMinusGreaterThanTok                                 ## ->
    vhdlDotTok                                              ## .
    vhdlSlashTok                                            ## /
    vhdlSlashAsteriskTok                                    ## /*
    vhdlSlashEqualTok                                       ## /=
    vhdl0Tok                                                ## 0
    vhdl1Tok                                                ## 1
    vhdl2Tok                                                ## 2
    vhdl3Tok                                                ## 3
    vhdl4Tok                                                ## 4
    vhdl5Tok                                                ## 5
    vhdl6Tok                                                ## 6
    vhdl7Tok                                                ## 7
    vhdl8Tok                                                ## 8
    vhdl9Tok                                                ## 9
    vhdlColonTok                                            ## :
    vhdlColonEqualTok                                       ## :=
    vhdlSemicolonTok                                        ## ;
    vhdlLessThanTok                                         ## <
    vhdlLessThanMinusGreaterThanTok                         ## <->
    vhdlDoubleLessThanTok                                   ## <<
    vhdlLessThanEqualTok                                    ## <=
    vhdlEqualTok                                            ## =
    vhdlDoubleEqualTok                                      ## ==
    vhdlEqualGreaterThanTok                                 ## =>
    vhdlGreaterThanTok                                      ## >
    vhdlGreaterThanEqualTok                                 ## >=
    vhdlDoubleGreaterThanTok                                ## >>
    vhdlQuestionTok                                         ## ?
    vhdlQuestionSlashEqualTok                               ## ?/=
    vhdlQuestionLessThanTok                                 ## ?<
    vhdlQuestionLessThanEqualTok                            ## ?<=
    vhdlQuestionEqualTok                                    ## ?=
    vhdlQuestionGreaterThanTok                              ## ?>
    vhdlQuestionGreaterThanEqualTok                         ## ?>=
    vhdlDoubleQuestionTok                                   ## ??
    vhdlAtTok                                               ## @
    vhdlLBrackTok                                           ## [
    vhdlRBrackTok                                           ## ]
    vhdlAccentDotTok                                        ## ^.
    vhdlHidUnderscoreTok                                    ## _
    vhdlBacktickTok                                         ## `
    vhdlAbortTok                                            ## abort
    vhdlAbsTok                                              ## abs
    vhdlAccessTok                                           ## access
    vhdlActiveTok                                           ## active
    vhdlAfterTok                                            ## after
    vhdlAliasTok                                            ## alias
    vhdlAllTok                                              ## all
    vhdlAlwaysTok                                           ## always
    vhdlAndTok                                              ## and
    vhdlAny                                                 ## any
    vhdlArchitectureTok                                     ## architecture
    vhdlArrayTok                                            ## array
    vhdlAscendingTok                                        ## ascending
    vhdlAssertTok                                           ## assert
    vhdlAssumeTok                                           ## assume
    vhdlAssumeGuaranteeTok                                  ## assume_guarantee
    vhdlAsyncAbortTok                                       ## async_abort
    vhdlAttributeTok                                        ## attribute
    vhdlBaseTok                                             ## base
    vhdlBaseSpecifier                                       ## base_specifier
    vhdlBeforeTok                                           ## before
    vhdlBeginTok                                            ## begin
    vhdlBitTok                                              ## bit
    vhdlBitVectorTok                                        ## bit_vector
    vhdlBlockTok                                            ## block
    vhdlBodyTok                                             ## body
    vhdlBooleanTok                                          ## boolean
    vhdlBufferTok                                           ## buffer
    vhdlBusTok                                              ## bus
    vhdlCaseTok                                             ## case
    vhdlClockTok                                            ## clock
    vhdlComponentTok                                        ## component
    vhdlConfigurationTok                                    ## configuration
    vhdlConstTok                                            ## const
    vhdlConstantTok                                         ## constant
    vhdlContextTok                                          ## context
    vhdlCountonesTok                                        ## countones
    vhdlCoverTok                                            ## cover
    vhdlDefaultTok                                          ## default
    vhdlDelayedTok                                          ## delayed
    vhdlDescendingTok                                       ## descending
    vhdlDisconnectTok                                       ## disconnect
    vhdlDontCare                                            ## dont_care
    vhdlDowntoTok                                           ## downto
    vhdlDrivingTok                                          ## driving
    vhdlDrivingValueTok                                     ## driving_value
    vhdlElementTok                                          ## element
    vhdlElseTok                                             ## else
    vhdlElsifTok                                            ## elsif
    vhdlEndTok                                              ## end
    vhdlEndedTok                                            ## ended
    vhdlEntityTok                                           ## entity
    vhdlEscapeSequence                                      ## escape_sequence
    vhdlEventTok                                            ## event
    vhdlEventuallyTok                                       ## eventually
    vhdlExitTok                                             ## exit
    vhdlExponent                                            ## exponent
    vhdlExtendedIdentifier                                  ## extended_identifier
    vhdlExtendedSimpleName                                  ## extended_simple_name
    vhdlFairnessTok                                         ## fairness
    vhdlFellTok                                             ## fell
    vhdlFileTok                                             ## file
    vhdlForTok                                              ## for
    vhdlForallTok                                           ## forall
    vhdlForceTok                                            ## force
    vhdlFunctionTok                                         ## function
    vhdlGenerateTok                                         ## generate
    vhdlGenericTok                                          ## generic
    vhdlGroupTok                                            ## group
    vhdlGuardedTok                                          ## guarded
    vhdlHdltypeTok                                          ## hdltype
    vhdlHighTok                                             ## high
    vhdlIdentifier                                          ## identifier
    vhdlIfTok                                               ## if
    vhdlImageTok                                            ## image
    vhdlImpureTok                                           ## impure
    vhdlInTok                                               ## in
    vhdlInertialTok                                         ## inertial
    vhdlInheritTok                                          ## inherit
    vhdlInoutTok                                            ## inout
    vhdlInstanceNameTok                                     ## instance_name
    vhdlIsTok                                               ## is
    vhdlIsunknownTok                                        ## isunknown
    vhdlLabelTok                                            ## label
    vhdlLastActiveTok                                       ## last_active
    vhdlLastEventTok                                        ## last_event
    vhdlLastValueTok                                        ## last_value
    vhdlLeftTok                                             ## left
    vhdlLeftofTok                                           ## leftof
    vhdlLengthTok                                           ## length
    vhdlLibraryTok                                          ## library
    vhdlLinkageTok                                          ## linkage
    vhdlLiteralTok                                          ## literal
    vhdlLoopTok                                             ## loop
    vhdlLowTok                                              ## low
    vhdlMapTok                                              ## map
    vhdlModTok                                              ## mod
    vhdlNandTok                                             ## nand
    vhdlNeverTok                                            ## never
    vhdlNewTok                                              ## new
    vhdlNextTok                                             ## next
    vhdlNextATok                                            ## next_a
    vhdlNextETok                                            ## next_e
    vhdlNextEventTok                                        ## next_event
    vhdlNextEventATok                                       ## next_event_a
    vhdlNextEventETok                                       ## next_event_e
    vhdlNondetTok                                           ## nondet
    vhdlNondetVectorTok                                     ## nondet_vector
    vhdlNorTok                                              ## nor
    vhdlNotTok                                              ## not
    vhdlNullTok                                             ## null
    vhdlNumericTok                                          ## numeric
    vhdlOfTok                                               ## of
    vhdlOnTok                                               ## on
    vhdlOnehotTok                                           ## onehot
    vhdlOnehot0Tok                                          ## onehot0
    vhdlOpenTok                                             ## open
    vhdlOrTok                                               ## or
    vhdlOthersTok                                           ## others
    vhdlOutTok                                              ## out
    vhdlPackageTok                                          ## package
    vhdlParameterTok                                        ## parameter
    vhdlPathNameTok                                         ## path_name
    vhdlPortTok                                             ## port
    vhdlPosTok                                              ## pos
    vhdlPostponedTok                                        ## postponed
    vhdlPredTok                                             ## pred
    vhdlPrevTok                                             ## prev
    vhdlProcedureTok                                        ## procedure
    vhdlProcessTok                                          ## process
    vhdlPropertyTok                                         ## property
    vhdlProtectedTok                                        ## protected
    vhdlPureTok                                             ## pure
    vhdlQuietTok                                            ## quiet
    vhdlRangeTok                                            ## range
    vhdlRecordTok                                           ## record
    vhdlRegisterTok                                         ## register
    vhdlRejectTok                                           ## reject
    vhdlReleaseTok                                          ## release
    vhdlRemTok                                              ## rem
    vhdlReportTok                                           ## report
    vhdlRestrictTok                                         ## restrict
    vhdlRestrictGuaranteeTok                                ## restrict_guarantee
    vhdlReturnTok                                           ## return
    vhdlReverseRangeTok                                     ## reverse_range
    vhdlRightTok                                            ## right
    vhdlRightofTok                                          ## rightof
    vhdlRolTok                                              ## rol
    vhdlRorTok                                              ## ror
    vhdlRoseTok                                             ## rose
    vhdlSame                                                ## same
    vhdlSelectTok                                           ## select
    vhdlSemicolon                                           ## semicolon
    vhdlSequenceTok                                         ## sequence
    vhdlSeverityTok                                         ## severity
    vhdlSharedTok                                           ## shared
    vhdlSignalTok                                           ## signal
    vhdlSimpleNameTok                                       ## simple_name
    vhdlSimpleName                                          ## simple_name
    vhdlSlaTok                                              ## sla
    vhdlSllTok                                              ## sll
    vhdlSraTok                                              ## sra
    vhdlSrlTok                                              ## srl
    vhdlStableTok                                           ## stable
    vhdlStringTok                                           ## string
    vhdlStrongTok                                           ## strong
    vhdlSubtypeTok                                          ## subtype
    vhdlSuccTok                                             ## succ
    vhdlSyncAbortTok                                        ## sync_abort
    vhdlThenTok                                             ## then
    vhdlToTok                                               ## to
    vhdlTransactionTok                                      ## transaction
    vhdlTransportTok                                        ## transport
    vhdlTypeTok                                             ## type
    vhdlUnaffectedTok                                       ## unaffected
    vhdlUnionTok                                            ## union
    vhdlUnitsTok                                            ## units
    vhdlUnresolved                                          ## unresolved
    vhdlUntilTok                                            ## until
    vhdlUseTok                                              ## use
    vhdlValTok                                              ## val
    vhdlValueTok                                            ## value
    vhdlVariableTok                                         ## variable
    vhdlVmodeTok                                            ## vmode
    vhdlVpropTok                                            ## vprop
    vhdlVunitTok                                            ## vunit
    vhdlWaitTok                                             ## wait
    vhdlWhenTok                                             ## when
    vhdlWhileTok                                            ## while
    vhdlWithTok                                             ## with
    vhdlWithinTok                                           ## within
    vhdlXnorTok                                             ## xnor
    vhdlXorTok                                              ## xor
    vhdlLCurlyTok                                           ## {
    vhdlPipeTok                                             ## |
    vhdlPipeMinusGreaterThanTok                             ## |->
    vhdlPipeEqualGreaterThanTok                             ## |=>
    vhdlRCurlyTok                                           ## }
    vhdlHidSeparator                                        ## _separator
    vhdlHidDigit                                            ## _digit
    vhdlHidPSLSequenceInstance                              ## _PSL_Sequence_Instance
    vhdlHidNameOrLabel                                      ## _name_or_label
    vhdlHidRangeAttributeName                               ## _range_attribute_name
    vhdlHidProcedureSpecification                           ## _procedure_specification
    vhdlHidPSLSequence                                      ## _PSL_Sequence
    vhdlHidClause                                           ## _clause
    vhdlHidExpr                                             ## _expr
    vhdlBase2                                               ## base2
    vhdlHidConcurrentSignalAssignment                       ## _concurrent_signal_assignment
    vhdlHidContextItem                                      ## _context_item
    vhdlHidTarget                                           ## _target
    vhdlHidFunctionParameterList                            ## _function_parameter_list
    vhdlHidActualPart                                       ## _actual_part
    vhdlHidConcurrentStatement                              ## _concurrent_statement
    vhdlHidSimpleExpression                                 ## _simple_expression
    vhdlHidAttributeDesignator                              ## _attribute_designator
    vhdlHidElementAssociation                               ## _element_association
    vhdlHidPSLSERE                                          ## _PSL_SERE
    vhdlHidPortInterfaceList                                ## _port_interface_list
    vhdlHidSubprogramBody                                   ## _subprogram_body
    vhdlHidGroupTemplate                                    ## _group_template
    vhdlHidUnit                                             ## _unit
    vhdlHidPSLExtendedOcurrenceArgument                     ## _PSL_Extended_Ocurrence_argument
    vhdlHidUnaryExpression                                  ## _unary_expression
    vhdlBase5                                               ## base5
    vhdlHidPhysicalLiteral                                  ## _physical_literal
    vhdlHidGuard                                            ## _guard
    vhdlHidFormalPart                                       ## _formal_part
    vhdlHidRangeDesignator                                  ## _range_designator
    vhdlHidIdentifier                                       ## _identifier
    vhdlBase11                                              ## base11
    vhdlHidSubprogramKind                                   ## _subprogram_kind
    vhdlHidSeverityExpression                               ## _severity_expression
    vhdlHidPartialPathname                                  ## _partial_pathname
    vhdlHidVariableAssignmentStatement                      ## _variable_assignment_statement
    vhdlHidGenericInterfaceList                             ## _generic_interface_list
    vhdlExtendedDigitBase5                                  ## extended_digit_base5
    vhdlHidPSLValueRange                                    ## _PSL_Value_Range
    vhdlArrayElementConstraint                              ## array_element_constraint
    vhdlBasicIdentifier                                     ## basic_identifier
    vhdlHidCondition                                        ## _condition
    vhdlHidDecimalBitValue                                  ## _decimal_bit_value
    vhdlHidAbstractLiteral                                  ## _abstract_literal
    vhdlHidComponentSpecification                           ## _component_specification
    vhdlBase7                                               ## base7
    vhdlRangeAttributeName                                  ## range_attribute_name
    vhdlHidPSLDirective                                     ## _PSL_Directive
    vhdlHidDeclaration                                      ## _declaration
    vhdlHidSequentialStatement                              ## _sequential_statement
    vhdlHidLinkage                                          ## _linkage
    vhdlHidPackageName                                      ## _package_name
    vhdlHidSubprogramInterfaceDeclaration                   ## _subprogram_interface_declaration
    vhdlBase13                                              ## base13
    vhdlHidEntityName                                       ## _entity_name
    vhdlHidOut                                              ## _out
    vhdlHidReport                                           ## _report
    vhdlHidEndSimpleName                                    ## _end_simple_name
    vhdlHidPSLParameterSpecification                        ## _PSL_Parameter_Specification
    vhdlHidFunctionInterfaceDeclaration                     ## _function_interface_declaration
    vhdlHidWhenClause                                       ## _when_clause
    vhdlHidPredefinedDesignator                             ## _predefined_designator
    vhdlHidConstraint                                       ## _constraint
    vhdlHidGenerateSpecification                            ## _generate_specification
    vhdlHidProcedureParameterList                           ## _procedure_parameter_list
    vhdlHidSensitivityClause                                ## _sensitivity_clause
    vhdlHidInout                                            ## _inout
    vhdlBase6                                               ## base6
    vhdlHidPredefinedDesignatorWithExpression               ## _predefined_designator_with_expression
    vhdlHidSubprogramDeclaration                            ## _subprogram_declaration
    vhdlBase4                                               ## base4
    vhdlHidIllegalInterfaceDeclaration                      ## _illegal_interface_declaration
    vhdlHidSimpleSignalAssignment                           ## _simple_signal_assignment
    vhdlHidBlockSpecification                               ## _block_specification
    vhdlBase9                                               ## base9
    vhdlHidValue                                            ## _value
    vhdlHidElementAssociationList                           ## _element_association_list
    vhdlHidDiscreteRange                                    ## _discrete_range
    vhdlHidArrayTypeDefinition                              ## _array_type_definition
    vhdlHidPSLIdentifier                                    ## _PSL_Identifier
    vhdlHidGenerateStatement                                ## _generate_statement
    vhdlHidPSLValue                                         ## _PSL_Value
    vhdlHidTimeExpression                                   ## _time_expression
    vhdlHidReject                                           ## _reject
    vhdlHidHeader                                           ## _header
    vhdlHidTimeoutClause                                    ## _timeout_clause
    vhdlHidEntityTag                                        ## _entity_tag
    vhdlHidLoopLabel                                        ## _loop_label
    vhdlPSLCompoundSEREWithin                               ## PSL_Compound_SERE_Within
    vhdlHidIn                                               ## _in
    vhdlHidName                                             ## _name
    vhdlHidAliasDenotator                                   ## _alias_denotator
    vhdlPSLIdentifier                                       ## PSL_Identifier
    vhdlHidUninstantiatedName                               ## _uninstantiated_name
    vhdlHidAny                                              ## _any
    vhdlHidPSLPropertyInstance                              ## _PSL_Property_Instance
    vhdlHidOperatorSymbol                                   ## _operator_symbol
    vhdlHidObjectDeclaration                                ## _object_declaration
    vhdlBase12                                              ## base12
    vhdlBase16                                              ## base16
    vhdlPSLCompoundSEREOr                                   ## PSL_Compound_SERE_Or
    vhdlHidPSLRange                                         ## _PSL_Range
    vhdlHidExternalPathname                                 ## _external_pathname
    vhdlHidArrayElementConstraint                           ## _array_element_constraint
    vhdlHidSelectedSignalAssignment                         ## _selected_signal_assignment
    vhdlExtendedDigitBase13                                 ## extended_digit_base13
    vhdlHidChoice                                           ## _choice
    vhdlHidPSLBoolean                                       ## _PSL_Boolean
    vhdlHidNumericLiteral                                   ## _numeric_literal
    vhdlHidPSLHDLModuleNAME                                 ## _PSL_HDL_Module_NAME
    vhdlHidComponentName                                    ## _component_name
    vhdlBase14                                              ## base14
    vhdlHidPSLCompoundSERE                                  ## _PSL_Compound_SERE
    vhdlHidSignalAssignmentStatement                        ## _signal_assignment_statement
    vhdlHidAssociationElement                               ## _association_element
    vhdlHidEnumerationLiteral                               ## _enumeration_literal
    vhdlHidFileOpenKind                                     ## _file_open_kind
    vhdlHidExpression                                       ## _expression
    vhdlHidPredefinedAttributeDesignatorWithExpression      ## _predefined_attribute_designator_with_expression
    vhdlHidOctalBitValue                                    ## _octal_bit_value
    vhdlHidExternalObjectName                               ## _external_object_name
    vhdlHidEndDesignator                                    ## _end_designator
    vhdlHidFunctionSpecification                            ## _function_specification
    vhdlPSLCompoundSEREAnd                                  ## PSL_Compound_SERE_And
    vhdlHidStringExpression                                 ## _string_expression
    vhdlExtendedDigitBase3                                  ## extended_digit_base3
    vhdlHidNumericTypeDefinition                            ## _numeric_type_definition
    vhdlPSLParenthesizedBoolean                             ## PSL_Parenthesized_Boolean
    vhdlHidBuffer                                           ## _buffer
    vhdlHidPSLAnyType                                       ## _PSL_Any_Type
    vhdlHidPSLConcatSERE                                    ## _PSL_Concat_SERE
    vhdlBase10                                              ## base10
    vhdlExtendedDigitBase16                                 ## extended_digit_base16
    vhdlHidPSLClockExpression                               ## _PSL_Clock_Expression
    vhdlExtendedDigitBase6                                  ## extended_digit_base6
    vhdlHidConditionalSignalAssignment                      ## _conditional_signal_assignment
    vhdlHidPrimaryUnit                                      ## _primary_unit
    vhdlHidPSLFusionSERE                                    ## _PSL_Fusion_SERE
    vhdlHidTypeDeclaration                                  ## _type_declaration
    vhdlHidIntegerImmed                                     ## _integer_immed
    vhdlHidBinaryBitValue                                   ## _binary_bit_value
    vhdlHidRange                                            ## _range
    vhdlHidConfigurationItem                                ## _configuration_item
    vhdlHidSignalName                                       ## _signal_name
    vhdlHidIterationScheme                                  ## _iteration_scheme
    vhdlExtendedDigitBase2                                  ## extended_digit_base2
    vhdlExtendedDigitBase10                                 ## extended_digit_base10
    vhdlBase8                                               ## base8
    vhdlHidPSLAmbiguousInstance                             ## _PSL_Ambiguous_Instance
    vhdlExtendedDigitBase9                                  ## extended_digit_base9
    vhdlHidSimpleName                                       ## _simple_name
    vhdlHidLibraryUnit                                      ## _library_unit
    vhdlHidDigitImmed                                       ## _digit_immed
    vhdlExtendedDigitBase7                                  ## extended_digit_base7
    vhdlHidAliasDesignator                                  ## _alias_designator
    vhdlHidLiteral                                          ## _literal
    vhdlExtendedDigitBase11                                 ## extended_digit_base11
    vhdlHidGenericInterfaceDeclaration                      ## _generic_interface_declaration
    vhdlExtendedDigitBase15                                 ## extended_digit_base15
    vhdlHidPSLExtendedOcurrenceFLPropertyUntilSpecification ## _PSL_Extended_Ocurrence_FL_Property_Until_Specification
    vhdlHidSecondaryUnit                                    ## _secondary_unit
    vhdlHidPredefinedAttributeDesignator                    ## _predefined_attribute_designator
    vhdlExtendedDigitBase14                                 ## extended_digit_base14
    vhdlHidDesignator                                       ## _designator
    vhdlHidPSLVerificationUnit                              ## _PSL_Verification_Unit
    vhdlHidFunctionName                                     ## _function_name
    vhdlHidPortInterfaceDeclaration                         ## _port_interface_declaration
    vhdlHidPSLProperty                                      ## _PSL_Property
    vhdlHidHexadecimalBitValue                              ## _hexadecimal_bit_value
    vhdlPSLInstance                                         ## PSL_Instance
    vhdlHidEntityAspect                                     ## _entity_aspect
    vhdlHidCompositeTypeDefinition                          ## _composite_type_definition
    vhdlHidPSLFLProperty                                    ## _PSL_FL_Property
    vhdlHidGroupConstituent                                 ## _group_constituent
    vhdlHidResolutionIndication                             ## _resolution_indication
    vhdlHidConditionClause                                  ## _condition_clause
    vhdlHidPSLDeclaration                                   ## _PSL_Declaration
    vhdlHidSemicolon                                        ## _semicolon
    vhdlHidPSLExtendedOcurrenceFLPropertyCountSpecification ## _PSL_Extended_Ocurrence_FL_Property_Count_Specification
    vhdlHidSubprogramInstantiationDeclaration               ## _subprogram_instantiation_declaration
    vhdlBase3                                               ## base3
    vhdlHidConstantMode                                     ## _constant_mode
    vhdlHidPSLVUNitItem                                     ## _PSL_VUnit_Item
    vhdlHidTypeDefinition                                   ## _type_definition
    vhdlHidProcedureInterfaceDeclaration                    ## _procedure_interface_declaration
    vhdlHidBinaryExpression                                 ## _binary_expression
    vhdlExtendedDigitBase4                                  ## extended_digit_base4
    vhdlExtendedDigitBase12                                 ## extended_digit_base12
    vhdlHidVariableMode                                     ## _variable_mode
    vhdlExtendedDigitBase8                                  ## extended_digit_base8
    vhdlHidAfter                                            ## _after
    vhdlHidSeverity                                         ## _severity
    vhdlHidPrimary                                          ## _primary
    vhdlHidSignalMode                                       ## _signal_mode
    vhdlHidPSLNumber                                        ## _PSL_Number
    vhdlHidScalarTypeDefinition                             ## _scalar_type_definition
    vhdlHidElementConstraint                                ## _element_constraint
    vhdlBase15                                              ## base15
    vhdlHidFileLogicalName                                  ## _file_logical_name
    vhdlHidRangeAttributeDesignator                         ## _range_attribute_designator
    vhdlSyntaxError                                         ## Tree-sitter parser syntax error

proc strRepr*(kind: VhdlNodeKind): string =
  case kind:
    of vhdlPSLActualParameter:                                  "PSL_Actual_Parameter"
    of vhdlPSLActualParameterList:                              "PSL_Actual_Parameter_List"
    of vhdlPSLAmbiguousInstance:                                "PSL_Ambiguous_Instance"
    of vhdlPSLAnyType:                                          "PSL_Any_Type"
    of vhdlPSLAssertDirective:                                  "PSL_Assert_Directive"
    of vhdlPSLAssumeDirective:                                  "PSL_Assume_Directive"
    of vhdlPSLAssumeGuaranteeDirective:                         "PSL_Assume_Guarantee_Directive"
    of vhdlPSLBoolean:                                          "PSL_Boolean"
    of vhdlPSLBoundingFLProperty:                               "PSL_Bounding_FL_Property"
    of vhdlPSLBracedSERE:                                       "PSL_Braced_SERE"
    of vhdlPSLBuiltInFunctionCall:                              "PSL_Built_In_Function_Call"
    of vhdlPSLClockDeclaration:                                 "PSL_Clock_Declaration"
    of vhdlPSLClockedFLProperty:                                "PSL_Clocked_FL_Property"
    of vhdlPSLClockedSERE:                                      "PSL_Clocked_SERE"
    of vhdlPSLCompoundSERE:                                     "PSL_Compound_SERE"
    of vhdlPSLConstantParameterSpecification:                   "PSL_Constant_Parameter_Specification"
    of vhdlPSLCount:                                            "PSL_Count"
    of vhdlPSLCoverDirective:                                   "PSL_Cover_Directive"
    of vhdlPSLExpression:                                       "PSL_Expression"
    of vhdlPSLExtendedOcurrenceFLProperty:                      "PSL_Extended_Ocurrence_FL_Property"
    of vhdlPSLFactorFLProperty:                                 "PSL_Factor_FL_Property"
    of vhdlPSLFairnessDirective:                                "PSL_Fairness_Directive"
    of vhdlPSLFormalParameter:                                  "PSL_Formal_Parameter"
    of vhdlPSLFormalParameterList:                              "PSL_Formal_Parameter_List"
    of vhdlPSLHDLType:                                          "PSL_HDL_Type"
    of vhdlPSLHierarchicalHDLName:                              "PSL_Hierarchical_HDL_Name"
    of vhdlPSLImplicationFLProperty:                            "PSL_Implication_FL_Property"
    of vhdlPSLIndexRange:                                       "PSL_Index_Range"
    of vhdlPSLInheritSpec:                                      "PSL_Inherit_Spec"
    of vhdlPSLInvariantFLProperty:                              "PSL_Invariant_FL_Property"
    of vhdlPSLLogicalFLProperty:                                "PSL_Logical_FL_Property"
    of vhdlPSLNumber:                                           "PSL_Number"
    of vhdlPSLOcurrenceFLProperty:                              "PSL_Ocurrence_FL_Property"
    of vhdlPSLParameterSpecification:                           "PSL_Parameter_Specification"
    of vhdlPSLParameterizedProperty:                            "PSL_Parameterized_Property"
    of vhdlPSLParameterizedSERE:                                "PSL_Parameterized_SERE"
    of vhdlPSLParametersDefinition:                             "PSL_Parameters_Definition"
    of vhdlPSLParenthesizedFLProperty:                          "PSL_Parenthesized_FL_Property"
    of vhdlPSLPropertyDeclaration:                              "PSL_Property_Declaration"
    of vhdlPSLPropertyInstance:                                 "PSL_Property_Instance"
    of vhdlPSLPropertyReplicator:                               "PSL_Property_Replicator"
    of vhdlPSLRepeatedSERE:                                     "PSL_Repeated_SERE"
    of vhdlPSLRestrictDirective:                                "PSL_Restrict_Directive"
    of vhdlPSLRestrictGuaranteeDirective:                       "PSL_Restrict_Guarantee_Directive"
    of vhdlPSLSequenceDeclaration:                              "PSL_Sequence_Declaration"
    of vhdlPSLSequenceInstance:                                 "PSL_Sequence_Instance"
    of vhdlPSLSequentialFLProperty:                             "PSL_Sequential_FL_Property"
    of vhdlPSLSimpleSERE:                                       "PSL_Simple_SERE"
    of vhdlPSLStrongFairnessDirective:                          "PSL_Strong_Fairness_Directive"
    of vhdlPSLSuffixImplicationFLProperty:                      "PSL_Suffix_Implication_FL_Property"
    of vhdlPSLTemporalParameterSpecification:                   "PSL_Temporal_Parameter_Specification"
    of vhdlPSLTerminationFLProperty:                            "PSL_Termination_FL_Property"
    of vhdlPSLTypeClass:                                        "PSL_Type_Class"
    of vhdlPSLUnionExpression:                                  "PSL_Union_Expression"
    of vhdlPSLVMOde:                                            "PSL_VMode"
    of vhdlPSLVPRop:                                            "PSL_VProp"
    of vhdlPSLVUNit:                                            "PSL_VUnit"
    of vhdlPSLValueSet:                                         "PSL_Value_Set"
    of vhdlPSLVerificationUnitBody:                             "PSL_Verification_Unit_Body"
    of vhdlAbsolutePathname:                                    "absolute_pathname"
    of vhdlAccessTypeDefinition:                                "access_type_definition"
    of vhdlAggregate:                                           "aggregate"
    of vhdlAliasDeclaration:                                    "alias_declaration"
    of vhdlAll:                                                 "all"
    of vhdlAllocator:                                           "allocator"
    of vhdlAlternativeConditionalExpressions:                   "alternative_conditional_expressions"
    of vhdlAlternativeConditionalWaveforms:                     "alternative_conditional_waveforms"
    of vhdlAlternativeSelectedExpressions:                      "alternative_selected_expressions"
    of vhdlAlternativeSelectedWaveforms:                        "alternative_selected_waveforms"
    of vhdlAmbiguousName:                                       "ambiguous_name"
    of vhdlArchitectureBody:                                    "architecture_body"
    of vhdlArrayConstraint:                                     "array_constraint"
    of vhdlAscendingRange:                                      "ascending_range"
    of vhdlAssertionStatement:                                  "assertion_statement"
    of vhdlAssociationList:                                     "association_list"
    of vhdlAttributeDeclaration:                                "attribute_declaration"
    of vhdlAttributeName:                                       "attribute_name"
    of vhdlAttributeSpecification:                              "attribute_specification"
    of vhdlBase:                                                "base"
    of vhdlBasedInteger:                                        "based_integer"
    of vhdlBasedLiteral:                                        "based_literal"
    of vhdlBasedReal:                                           "based_real"
    of vhdlBindingIndication:                                   "binding_indication"
    of vhdlBitStringLiteral:                                    "bit_string_literal"
    of vhdlBitValue:                                            "bit_value"
    of vhdlBlockConfiguration:                                  "block_configuration"
    of vhdlBlockHeader:                                         "block_header"
    of vhdlBlockSpecification:                                  "block_specification"
    of vhdlBlockStatement:                                      "block_statement"
    of vhdlBoolean:                                             "boolean"
    of vhdlCaseGenerateAlternative:                             "case_generate_alternative"
    of vhdlCaseGenerateStatement:                               "case_generate_statement"
    of vhdlCaseStatement:                                       "case_statement"
    of vhdlCaseStatementAlternative:                            "case_statement_alternative"
    of vhdlCharacterLiteral:                                    "character_literal"
    of vhdlChoices:                                             "choices"
    of vhdlComment:                                             "comment"
    of vhdlComponentConfiguration:                              "component_configuration"
    of vhdlComponentDeclaration:                                "component_declaration"
    of vhdlComponentHeader:                                     "component_header"
    of vhdlComponentInstantiation:                              "component_instantiation"
    of vhdlComponentInstantiationStatement:                     "component_instantiation_statement"
    of vhdlComponentMapAspect:                                  "component_map_aspect"
    of vhdlConcatenation:                                       "concatenation"
    of vhdlConcurrentStatementPart:                             "concurrent_statement_part"
    of vhdlCondition:                                           "condition"
    of vhdlConditionalConcurrentSignalAssignment:               "conditional_concurrent_signal_assignment"
    of vhdlConditionalExpression:                               "conditional_expression"
    of vhdlConditionalExpressions:                              "conditional_expressions"
    of vhdlConditionalForceAssignment:                          "conditional_force_assignment"
    of vhdlConditionalVariableAssignment:                       "conditional_variable_assignment"
    of vhdlConditionalWaveformAssignment:                       "conditional_waveform_assignment"
    of vhdlConditionalWaveforms:                                "conditional_waveforms"
    of vhdlConfigurationDeclaration:                            "configuration_declaration"
    of vhdlConfigurationInstantiation:                          "configuration_instantiation"
    of vhdlConfigurationSpecification:                          "configuration_specification"
    of vhdlConstantDeclaration:                                 "constant_declaration"
    of vhdlConstantInterfaceDeclaration:                        "constant_interface_declaration"
    of vhdlConstrainedArrayDefinition:                          "constrained_array_definition"
    of vhdlContextClause:                                       "context_clause"
    of vhdlContextDeclaration:                                  "context_declaration"
    of vhdlContextList:                                         "context_list"
    of vhdlContextReference:                                    "context_reference"
    of vhdlDeclarativePart:                                     "declarative_part"
    of vhdlDefault:                                             "default"
    of vhdlDefaultExpression:                                   "default_expression"
    of vhdlDelayMechanism:                                      "delay_mechanism"
    of vhdlDescendingRange:                                     "descending_range"
    of vhdlDesignFile:                                          "design_file"
    of vhdlDesignUnit:                                          "design_unit"
    of vhdlDisconnectionSpecification:                          "disconnection_specification"
    of vhdlElementDeclaration:                                  "element_declaration"
    of vhdlElse:                                                "else"
    of vhdlElseGenerate:                                        "else_generate"
    of vhdlElsif:                                               "elsif"
    of vhdlElsifGenerate:                                       "elsif_generate"
    of vhdlEntityClass:                                         "entity_class"
    of vhdlEntityClassEntry:                                    "entity_class_entry"
    of vhdlEntityClassEntryList:                                "entity_class_entry_list"
    of vhdlEntityDeclaration:                                   "entity_declaration"
    of vhdlEntityDesignator:                                    "entity_designator"
    of vhdlEntityHeader:                                        "entity_header"
    of vhdlEntityInstantiation:                                 "entity_instantiation"
    of vhdlEntityNameList:                                      "entity_name_list"
    of vhdlEntitySpecification:                                 "entity_specification"
    of vhdlEnumerationTypeDefinition:                           "enumeration_type_definition"
    of vhdlExitStatement:                                       "exit_statement"
    of vhdlExponentiation:                                      "exponentiation"
    of vhdlExpression:                                          "expression"
    of vhdlExpressionList:                                      "expression_list"
    of vhdlExternalConstantName:                                "external_constant_name"
    of vhdlExternalSignalName:                                  "external_signal_name"
    of vhdlExternalVariableName:                                "external_variable_name"
    of vhdlFactor:                                              "factor"
    of vhdlFileDeclaration:                                     "file_declaration"
    of vhdlFileInterfaceDeclaration:                            "file_interface_declaration"
    of vhdlFileOpenInformation:                                 "file_open_information"
    of vhdlFileOpenKind:                                        "file_open_kind"
    of vhdlFileTypeDefinition:                                  "file_type_definition"
    of vhdlForGenerateStatement:                                "for_generate_statement"
    of vhdlForLoop:                                             "for_loop"
    of vhdlForceMode:                                           "force_mode"
    of vhdlFullTypeDeclaration:                                 "full_type_declaration"
    of vhdlFunctionBody:                                        "function_body"
    of vhdlFunctionCall:                                        "function_call"
    of vhdlFunctionDeclaration:                                 "function_declaration"
    of vhdlFunctionInstantiationDeclaration:                    "function_instantiation_declaration"
    of vhdlFunctionInterfaceDeclaration:                        "function_interface_declaration"
    of vhdlFunctionParameterClause:                             "function_parameter_clause"
    of vhdlGenerateStatementBody:                               "generate_statement_body"
    of vhdlGenerateStatementElement:                            "generate_statement_element"
    of vhdlGenericClause:                                       "generic_clause"
    of vhdlGenericMapAspect:                                    "generic_map_aspect"
    of vhdlGroupConstituentList:                                "group_constituent_list"
    of vhdlGroupDeclaration:                                    "group_declaration"
    of vhdlGroupTemplateDeclaration:                            "group_template_declaration"
    of vhdlGuardedSignalSpecification:                          "guarded_signal_specification"
    of vhdlIdentifierList:                                      "identifier_list"
    of vhdlIf:                                                  "if"
    of vhdlIfGenerate:                                          "if_generate"
    of vhdlIfGenerateStatement:                                 "if_generate_statement"
    of vhdlIfStatement:                                         "if_statement"
    of vhdlIllegal:                                             "illegal"
    of vhdlIncompleteTypeDeclaration:                           "incomplete_type_declaration"
    of vhdlIndexConstraint:                                     "index_constraint"
    of vhdlIndexSubtypeDefinition:                              "index_subtype_definition"
    of vhdlInertial:                                            "inertial"
    of vhdlInertialExpression:                                  "inertial_expression"
    of vhdlInstantiationList:                                   "instantiation_list"
    of vhdlInteger:                                             "integer"
    of vhdlIntegerDecimal:                                      "integer_decimal"
    of vhdlInterfaceSubprogramDefault:                          "interface_subprogram_default"
    of vhdlLabel:                                               "label"
    of vhdlLength:                                              "length"
    of vhdlLibraryClause:                                       "library_clause"
    of vhdlLogicalExpression:                                   "logical_expression"
    of vhdlLogicalNameList:                                     "logical_name_list"
    of vhdlLoopStatement:                                       "loop_statement"
    of vhdlMode:                                                "mode"
    of vhdlNamedAssociationElement:                             "named_association_element"
    of vhdlNamedElementAssociation:                             "named_element_association"
    of vhdlNextStatement:                                       "next_statement"
    of vhdlNull:                                                "null"
    of vhdlNullStatement:                                       "null_statement"
    of vhdlNumericTypeDefinition:                               "numeric_type_definition"
    of vhdlOpen:                                                "open"
    of vhdlOperatorSymbol:                                      "operator_symbol"
    of vhdlOthers:                                              "others"
    of vhdlPackageBody:                                         "package_body"
    of vhdlPackageDeclaration:                                  "package_declaration"
    of vhdlPackageHeader:                                       "package_header"
    of vhdlPackageInstantiationDeclaration:                     "package_instantiation_declaration"
    of vhdlPackageInterfaceDeclaration:                         "package_interface_declaration"
    of vhdlPackageMapAspect:                                    "package_map_aspect"
    of vhdlPackagePathname:                                     "package_pathname"
    of vhdlParameterSpecification:                              "parameter_specification"
    of vhdlParenthesizedExpression:                             "parenthesized_expression"
    of vhdlParenthesizedResolution:                             "parenthesized_resolution"
    of vhdlPathnameElement:                                     "pathname_element"
    of vhdlPhysicalLiteral:                                     "physical_literal"
    of vhdlPhysicalTypeDefinition:                              "physical_type_definition"
    of vhdlPortClause:                                          "port_clause"
    of vhdlPortMapAspect:                                       "port_map_aspect"
    of vhdlPositionalAssociationElement:                        "positional_association_element"
    of vhdlPositionalElementAssociation:                        "positional_element_association"
    of vhdlPredefinedDesignator:                                "predefined_designator"
    of vhdlPrimaryUnitDeclaration:                              "primary_unit_declaration"
    of vhdlProcedureBody:                                       "procedure_body"
    of vhdlProcedureCallStatement:                              "procedure_call_statement"
    of vhdlProcedureDeclaration:                                "procedure_declaration"
    of vhdlProcedureInstantiationDeclaration:                   "procedure_instantiation_declaration"
    of vhdlProcedureInterfaceDeclaration:                       "procedure_interface_declaration"
    of vhdlProcedureParameterClause:                            "procedure_parameter_clause"
    of vhdlProcessStatement:                                    "process_statement"
    of vhdlProtectedTypeBody:                                   "protected_type_body"
    of vhdlProtectedTypeDeclaration:                            "protected_type_declaration"
    of vhdlQualifiedExpression:                                 "qualified_expression"
    of vhdlRangeConstraint:                                     "range_constraint"
    of vhdlRealDecimal:                                         "real_decimal"
    of vhdlRecordConstraint:                                    "record_constraint"
    of vhdlRecordElementConstraint:                             "record_element_constraint"
    of vhdlRecordElementResolution:                             "record_element_resolution"
    of vhdlRecordResolution:                                    "record_resolution"
    of vhdlRecordTypeDefinition:                                "record_type_definition"
    of vhdlReduction:                                           "reduction"
    of vhdlRelation:                                            "relation"
    of vhdlRelativePathname:                                    "relative_pathname"
    of vhdlReportStatement:                                     "report_statement"
    of vhdlResolutionFunction:                                  "resolution_function"
    of vhdlReturn:                                              "return"
    of vhdlReturnStatement:                                     "return_statement"
    of vhdlSecondaryUnitDeclaration:                            "secondary_unit_declaration"
    of vhdlSelectedConcurrentSignalAssignment:                  "selected_concurrent_signal_assignment"
    of vhdlSelectedExpressions:                                 "selected_expressions"
    of vhdlSelectedForceAssignment:                             "selected_force_assignment"
    of vhdlSelectedName:                                        "selected_name"
    of vhdlSelectedVariableAssignment:                          "selected_variable_assignment"
    of vhdlSelectedWaveformAssignment:                          "selected_waveform_assignment"
    of vhdlSelectedWaveforms:                                   "selected_waveforms"
    of vhdlSensitivityList:                                     "sensitivity_list"
    of vhdlSeparator:                                           "separator"
    of vhdlSequenceOfStatements:                                "sequence_of_statements"
    of vhdlSeverityExpression:                                  "severity_expression"
    of vhdlSharedVariableDeclaration:                           "shared_variable_declaration"
    of vhdlShiftExpression:                                     "shift_expression"
    of vhdlSign:                                                "sign"
    of vhdlSignalDeclaration:                                   "signal_declaration"
    of vhdlSignalInterfaceDeclaration:                          "signal_interface_declaration"
    of vhdlSignalKind:                                          "signal_kind"
    of vhdlSignalList:                                          "signal_list"
    of vhdlSignature:                                           "signature"
    of vhdlSimpleConcurrentSignalAssignment:                    "simple_concurrent_signal_assignment"
    of vhdlSimpleExpression:                                    "simple_expression"
    of vhdlSimpleForceAssignment:                               "simple_force_assignment"
    of vhdlSimpleReleaseAssignment:                             "simple_release_assignment"
    of vhdlSimpleVariableAssignment:                            "simple_variable_assignment"
    of vhdlSimpleWaveformAssignment:                            "simple_waveform_assignment"
    of vhdlSliceName:                                           "slice_name"
    of vhdlStringExpression:                                    "string_expression"
    of vhdlStringLiteral:                                       "string_literal"
    of vhdlSubprogramHeader:                                    "subprogram_header"
    of vhdlSubprogramMapAspect:                                 "subprogram_map_aspect"
    of vhdlSubtypeDeclaration:                                  "subtype_declaration"
    of vhdlSubtypeIndication:                                   "subtype_indication"
    of vhdlTerm:                                                "term"
    of vhdlTimeExpression:                                      "time_expression"
    of vhdlToolDirective:                                       "tool_directive"
    of vhdlTransport:                                           "transport"
    of vhdlTypeInterfaceDeclaration:                            "type_interface_declaration"
    of vhdlTypeMark:                                            "type_mark"
    of vhdlUnaffected:                                          "unaffected"
    of vhdlUnboundedArrayDefinition:                            "unbounded_array_definition"
    of vhdlUseClause:                                           "use_clause"
    of vhdlVariableDeclaration:                                 "variable_declaration"
    of vhdlVariableInterfaceDeclaration:                        "variable_interface_declaration"
    of vhdlVerificationUnitBindingIndication:                   "verification_unit_binding_indication"
    of vhdlVerificationUnitList:                                "verification_unit_list"
    of vhdlWaitStatement:                                       "wait_statement"
    of vhdlWaveformElement:                                     "waveform_element"
    of vhdlWaveforms:                                           "waveforms"
    of vhdlWhileLoop:                                           "while_loop"
    of vhdlExclamationTok:                                      "!"
    of vhdlExclamationEqualTok:                                 "!="
    of vhdlQuoteTok:                                            "\""
    of vhdlHashTok:                                             "#"
    of vhdlAmpersandTok:                                        "&"
    of vhdlDoubleAmpersandTok:                                  "&&"
    of vhdlApostropheTok:                                       "\'"
    of vhdlLParTok:                                             "("
    of vhdlRParTok:                                             ")"
    of vhdlAsteriskTok:                                         "*"
    of vhdlDoubleAsteriskTok:                                   "**"
    of vhdlAsteriskSlashTok:                                    "*/"
    of vhdlPlusTok:                                             "+"
    of vhdlCommaTok:                                            ","
    of vhdlMinusTok:                                            "-"
    of vhdlDoubleMinusTok:                                      "--"
    of vhdlMinusGreaterThanTok:                                 "->"
    of vhdlDotTok:                                              "."
    of vhdlSlashTok:                                            "/"
    of vhdlSlashAsteriskTok:                                    "/*"
    of vhdlSlashEqualTok:                                       "/="
    of vhdl0Tok:                                                "0"
    of vhdl1Tok:                                                "1"
    of vhdl2Tok:                                                "2"
    of vhdl3Tok:                                                "3"
    of vhdl4Tok:                                                "4"
    of vhdl5Tok:                                                "5"
    of vhdl6Tok:                                                "6"
    of vhdl7Tok:                                                "7"
    of vhdl8Tok:                                                "8"
    of vhdl9Tok:                                                "9"
    of vhdlColonTok:                                            ":"
    of vhdlColonEqualTok:                                       ":="
    of vhdlSemicolonTok:                                        ";"
    of vhdlLessThanTok:                                         "<"
    of vhdlLessThanMinusGreaterThanTok:                         "<->"
    of vhdlDoubleLessThanTok:                                   "<<"
    of vhdlLessThanEqualTok:                                    "<="
    of vhdlEqualTok:                                            "="
    of vhdlDoubleEqualTok:                                      "=="
    of vhdlEqualGreaterThanTok:                                 "=>"
    of vhdlGreaterThanTok:                                      ">"
    of vhdlGreaterThanEqualTok:                                 ">="
    of vhdlDoubleGreaterThanTok:                                ">>"
    of vhdlQuestionTok:                                         "?"
    of vhdlQuestionSlashEqualTok:                               "?/="
    of vhdlQuestionLessThanTok:                                 "?<"
    of vhdlQuestionLessThanEqualTok:                            "?<="
    of vhdlQuestionEqualTok:                                    "?="
    of vhdlQuestionGreaterThanTok:                              "?>"
    of vhdlQuestionGreaterThanEqualTok:                         "?>="
    of vhdlDoubleQuestionTok:                                   "??"
    of vhdlAtTok:                                               "@"
    of vhdlLBrackTok:                                           "["
    of vhdlRBrackTok:                                           "]"
    of vhdlAccentDotTok:                                        "^."
    of vhdlHidUnderscoreTok:                                    "_"
    of vhdlBacktickTok:                                         "`"
    of vhdlAbortTok:                                            "abort"
    of vhdlAbsTok:                                              "abs"
    of vhdlAccessTok:                                           "access"
    of vhdlActiveTok:                                           "active"
    of vhdlAfterTok:                                            "after"
    of vhdlAliasTok:                                            "alias"
    of vhdlAllTok:                                              "all"
    of vhdlAlwaysTok:                                           "always"
    of vhdlAndTok:                                              "and"
    of vhdlAny:                                                 "any"
    of vhdlArchitectureTok:                                     "architecture"
    of vhdlArrayTok:                                            "array"
    of vhdlAscendingTok:                                        "ascending"
    of vhdlAssertTok:                                           "assert"
    of vhdlAssumeTok:                                           "assume"
    of vhdlAssumeGuaranteeTok:                                  "assume_guarantee"
    of vhdlAsyncAbortTok:                                       "async_abort"
    of vhdlAttributeTok:                                        "attribute"
    of vhdlBaseTok:                                             "base"
    of vhdlBaseSpecifier:                                       "base_specifier"
    of vhdlBeforeTok:                                           "before"
    of vhdlBeginTok:                                            "begin"
    of vhdlBitTok:                                              "bit"
    of vhdlBitVectorTok:                                        "bit_vector"
    of vhdlBlockTok:                                            "block"
    of vhdlBodyTok:                                             "body"
    of vhdlBooleanTok:                                          "boolean"
    of vhdlBufferTok:                                           "buffer"
    of vhdlBusTok:                                              "bus"
    of vhdlCaseTok:                                             "case"
    of vhdlClockTok:                                            "clock"
    of vhdlComponentTok:                                        "component"
    of vhdlConfigurationTok:                                    "configuration"
    of vhdlConstTok:                                            "const"
    of vhdlConstantTok:                                         "constant"
    of vhdlContextTok:                                          "context"
    of vhdlCountonesTok:                                        "countones"
    of vhdlCoverTok:                                            "cover"
    of vhdlDefaultTok:                                          "default"
    of vhdlDelayedTok:                                          "delayed"
    of vhdlDescendingTok:                                       "descending"
    of vhdlDisconnectTok:                                       "disconnect"
    of vhdlDontCare:                                            "dont_care"
    of vhdlDowntoTok:                                           "downto"
    of vhdlDrivingTok:                                          "driving"
    of vhdlDrivingValueTok:                                     "driving_value"
    of vhdlElementTok:                                          "element"
    of vhdlElseTok:                                             "else"
    of vhdlElsifTok:                                            "elsif"
    of vhdlEndTok:                                              "end"
    of vhdlEndedTok:                                            "ended"
    of vhdlEntityTok:                                           "entity"
    of vhdlEscapeSequence:                                      "escape_sequence"
    of vhdlEventTok:                                            "event"
    of vhdlEventuallyTok:                                       "eventually"
    of vhdlExitTok:                                             "exit"
    of vhdlExponent:                                            "exponent"
    of vhdlExtendedIdentifier:                                  "extended_identifier"
    of vhdlExtendedSimpleName:                                  "extended_simple_name"
    of vhdlFairnessTok:                                         "fairness"
    of vhdlFellTok:                                             "fell"
    of vhdlFileTok:                                             "file"
    of vhdlForTok:                                              "for"
    of vhdlForallTok:                                           "forall"
    of vhdlForceTok:                                            "force"
    of vhdlFunctionTok:                                         "function"
    of vhdlGenerateTok:                                         "generate"
    of vhdlGenericTok:                                          "generic"
    of vhdlGroupTok:                                            "group"
    of vhdlGuardedTok:                                          "guarded"
    of vhdlHdltypeTok:                                          "hdltype"
    of vhdlHighTok:                                             "high"
    of vhdlIdentifier:                                          "identifier"
    of vhdlIfTok:                                               "if"
    of vhdlImageTok:                                            "image"
    of vhdlImpureTok:                                           "impure"
    of vhdlInTok:                                               "in"
    of vhdlInertialTok:                                         "inertial"
    of vhdlInheritTok:                                          "inherit"
    of vhdlInoutTok:                                            "inout"
    of vhdlInstanceNameTok:                                     "instance_name"
    of vhdlIsTok:                                               "is"
    of vhdlIsunknownTok:                                        "isunknown"
    of vhdlLabelTok:                                            "label"
    of vhdlLastActiveTok:                                       "last_active"
    of vhdlLastEventTok:                                        "last_event"
    of vhdlLastValueTok:                                        "last_value"
    of vhdlLeftTok:                                             "left"
    of vhdlLeftofTok:                                           "leftof"
    of vhdlLengthTok:                                           "length"
    of vhdlLibraryTok:                                          "library"
    of vhdlLinkageTok:                                          "linkage"
    of vhdlLiteralTok:                                          "literal"
    of vhdlLoopTok:                                             "loop"
    of vhdlLowTok:                                              "low"
    of vhdlMapTok:                                              "map"
    of vhdlModTok:                                              "mod"
    of vhdlNandTok:                                             "nand"
    of vhdlNeverTok:                                            "never"
    of vhdlNewTok:                                              "new"
    of vhdlNextTok:                                             "next"
    of vhdlNextATok:                                            "next_a"
    of vhdlNextETok:                                            "next_e"
    of vhdlNextEventTok:                                        "next_event"
    of vhdlNextEventATok:                                       "next_event_a"
    of vhdlNextEventETok:                                       "next_event_e"
    of vhdlNondetTok:                                           "nondet"
    of vhdlNondetVectorTok:                                     "nondet_vector"
    of vhdlNorTok:                                              "nor"
    of vhdlNotTok:                                              "not"
    of vhdlNullTok:                                             "null"
    of vhdlNumericTok:                                          "numeric"
    of vhdlOfTok:                                               "of"
    of vhdlOnTok:                                               "on"
    of vhdlOnehotTok:                                           "onehot"
    of vhdlOnehot0Tok:                                          "onehot0"
    of vhdlOpenTok:                                             "open"
    of vhdlOrTok:                                               "or"
    of vhdlOthersTok:                                           "others"
    of vhdlOutTok:                                              "out"
    of vhdlPackageTok:                                          "package"
    of vhdlParameterTok:                                        "parameter"
    of vhdlPathNameTok:                                         "path_name"
    of vhdlPortTok:                                             "port"
    of vhdlPosTok:                                              "pos"
    of vhdlPostponedTok:                                        "postponed"
    of vhdlPredTok:                                             "pred"
    of vhdlPrevTok:                                             "prev"
    of vhdlProcedureTok:                                        "procedure"
    of vhdlProcessTok:                                          "process"
    of vhdlPropertyTok:                                         "property"
    of vhdlProtectedTok:                                        "protected"
    of vhdlPureTok:                                             "pure"
    of vhdlQuietTok:                                            "quiet"
    of vhdlRangeTok:                                            "range"
    of vhdlRecordTok:                                           "record"
    of vhdlRegisterTok:                                         "register"
    of vhdlRejectTok:                                           "reject"
    of vhdlReleaseTok:                                          "release"
    of vhdlRemTok:                                              "rem"
    of vhdlReportTok:                                           "report"
    of vhdlRestrictTok:                                         "restrict"
    of vhdlRestrictGuaranteeTok:                                "restrict_guarantee"
    of vhdlReturnTok:                                           "return"
    of vhdlReverseRangeTok:                                     "reverse_range"
    of vhdlRightTok:                                            "right"
    of vhdlRightofTok:                                          "rightof"
    of vhdlRolTok:                                              "rol"
    of vhdlRorTok:                                              "ror"
    of vhdlRoseTok:                                             "rose"
    of vhdlSame:                                                "same"
    of vhdlSelectTok:                                           "select"
    of vhdlSemicolon:                                           "semicolon"
    of vhdlSequenceTok:                                         "sequence"
    of vhdlSeverityTok:                                         "severity"
    of vhdlSharedTok:                                           "shared"
    of vhdlSignalTok:                                           "signal"
    of vhdlSimpleNameTok:                                       "simple_name"
    of vhdlSimpleName:                                          "simple_name"
    of vhdlSlaTok:                                              "sla"
    of vhdlSllTok:                                              "sll"
    of vhdlSraTok:                                              "sra"
    of vhdlSrlTok:                                              "srl"
    of vhdlStableTok:                                           "stable"
    of vhdlStringTok:                                           "string"
    of vhdlStrongTok:                                           "strong"
    of vhdlSubtypeTok:                                          "subtype"
    of vhdlSuccTok:                                             "succ"
    of vhdlSyncAbortTok:                                        "sync_abort"
    of vhdlThenTok:                                             "then"
    of vhdlToTok:                                               "to"
    of vhdlTransactionTok:                                      "transaction"
    of vhdlTransportTok:                                        "transport"
    of vhdlTypeTok:                                             "type"
    of vhdlUnaffectedTok:                                       "unaffected"
    of vhdlUnionTok:                                            "union"
    of vhdlUnitsTok:                                            "units"
    of vhdlUnresolved:                                          "unresolved"
    of vhdlUntilTok:                                            "until"
    of vhdlUseTok:                                              "use"
    of vhdlValTok:                                              "val"
    of vhdlValueTok:                                            "value"
    of vhdlVariableTok:                                         "variable"
    of vhdlVmodeTok:                                            "vmode"
    of vhdlVpropTok:                                            "vprop"
    of vhdlVunitTok:                                            "vunit"
    of vhdlWaitTok:                                             "wait"
    of vhdlWhenTok:                                             "when"
    of vhdlWhileTok:                                            "while"
    of vhdlWithTok:                                             "with"
    of vhdlWithinTok:                                           "within"
    of vhdlXnorTok:                                             "xnor"
    of vhdlXorTok:                                              "xor"
    of vhdlLCurlyTok:                                           "{"
    of vhdlPipeTok:                                             "|"
    of vhdlPipeMinusGreaterThanTok:                             "|->"
    of vhdlPipeEqualGreaterThanTok:                             "|=>"
    of vhdlRCurlyTok:                                           "}"
    of vhdlHidSeparator:                                        "_separator"
    of vhdlHidDigit:                                            "_digit"
    of vhdlHidPSLSequenceInstance:                              "_PSL_Sequence_Instance"
    of vhdlHidNameOrLabel:                                      "_name_or_label"
    of vhdlHidRangeAttributeName:                               "_range_attribute_name"
    of vhdlHidProcedureSpecification:                           "_procedure_specification"
    of vhdlHidPSLSequence:                                      "_PSL_Sequence"
    of vhdlHidClause:                                           "_clause"
    of vhdlHidExpr:                                             "_expr"
    of vhdlBase2:                                               "base2"
    of vhdlHidConcurrentSignalAssignment:                       "_concurrent_signal_assignment"
    of vhdlHidContextItem:                                      "_context_item"
    of vhdlHidTarget:                                           "_target"
    of vhdlHidFunctionParameterList:                            "_function_parameter_list"
    of vhdlHidActualPart:                                       "_actual_part"
    of vhdlHidConcurrentStatement:                              "_concurrent_statement"
    of vhdlHidSimpleExpression:                                 "_simple_expression"
    of vhdlHidAttributeDesignator:                              "_attribute_designator"
    of vhdlHidElementAssociation:                               "_element_association"
    of vhdlHidPSLSERE:                                          "_PSL_SERE"
    of vhdlHidPortInterfaceList:                                "_port_interface_list"
    of vhdlHidSubprogramBody:                                   "_subprogram_body"
    of vhdlHidGroupTemplate:                                    "_group_template"
    of vhdlHidUnit:                                             "_unit"
    of vhdlHidPSLExtendedOcurrenceArgument:                     "_PSL_Extended_Ocurrence_argument"
    of vhdlHidUnaryExpression:                                  "_unary_expression"
    of vhdlBase5:                                               "base5"
    of vhdlHidPhysicalLiteral:                                  "_physical_literal"
    of vhdlHidGuard:                                            "_guard"
    of vhdlHidFormalPart:                                       "_formal_part"
    of vhdlHidRangeDesignator:                                  "_range_designator"
    of vhdlHidIdentifier:                                       "_identifier"
    of vhdlBase11:                                              "base11"
    of vhdlHidSubprogramKind:                                   "_subprogram_kind"
    of vhdlHidSeverityExpression:                               "_severity_expression"
    of vhdlHidPartialPathname:                                  "_partial_pathname"
    of vhdlHidVariableAssignmentStatement:                      "_variable_assignment_statement"
    of vhdlHidGenericInterfaceList:                             "_generic_interface_list"
    of vhdlExtendedDigitBase5:                                  "extended_digit_base5"
    of vhdlHidPSLValueRange:                                    "_PSL_Value_Range"
    of vhdlArrayElementConstraint:                              "array_element_constraint"
    of vhdlBasicIdentifier:                                     "basic_identifier"
    of vhdlHidCondition:                                        "_condition"
    of vhdlHidDecimalBitValue:                                  "_decimal_bit_value"
    of vhdlHidAbstractLiteral:                                  "_abstract_literal"
    of vhdlHidComponentSpecification:                           "_component_specification"
    of vhdlBase7:                                               "base7"
    of vhdlRangeAttributeName:                                  "range_attribute_name"
    of vhdlHidPSLDirective:                                     "_PSL_Directive"
    of vhdlHidDeclaration:                                      "_declaration"
    of vhdlHidSequentialStatement:                              "_sequential_statement"
    of vhdlHidLinkage:                                          "_linkage"
    of vhdlHidPackageName:                                      "_package_name"
    of vhdlHidSubprogramInterfaceDeclaration:                   "_subprogram_interface_declaration"
    of vhdlBase13:                                              "base13"
    of vhdlHidEntityName:                                       "_entity_name"
    of vhdlHidOut:                                              "_out"
    of vhdlHidReport:                                           "_report"
    of vhdlHidEndSimpleName:                                    "_end_simple_name"
    of vhdlHidPSLParameterSpecification:                        "_PSL_Parameter_Specification"
    of vhdlHidFunctionInterfaceDeclaration:                     "_function_interface_declaration"
    of vhdlHidWhenClause:                                       "_when_clause"
    of vhdlHidPredefinedDesignator:                             "_predefined_designator"
    of vhdlHidConstraint:                                       "_constraint"
    of vhdlHidGenerateSpecification:                            "_generate_specification"
    of vhdlHidProcedureParameterList:                           "_procedure_parameter_list"
    of vhdlHidSensitivityClause:                                "_sensitivity_clause"
    of vhdlHidInout:                                            "_inout"
    of vhdlBase6:                                               "base6"
    of vhdlHidPredefinedDesignatorWithExpression:               "_predefined_designator_with_expression"
    of vhdlHidSubprogramDeclaration:                            "_subprogram_declaration"
    of vhdlBase4:                                               "base4"
    of vhdlHidIllegalInterfaceDeclaration:                      "_illegal_interface_declaration"
    of vhdlHidSimpleSignalAssignment:                           "_simple_signal_assignment"
    of vhdlHidBlockSpecification:                               "_block_specification"
    of vhdlBase9:                                               "base9"
    of vhdlHidValue:                                            "_value"
    of vhdlHidElementAssociationList:                           "_element_association_list"
    of vhdlHidDiscreteRange:                                    "_discrete_range"
    of vhdlHidArrayTypeDefinition:                              "_array_type_definition"
    of vhdlHidPSLIdentifier:                                    "_PSL_Identifier"
    of vhdlHidGenerateStatement:                                "_generate_statement"
    of vhdlHidPSLValue:                                         "_PSL_Value"
    of vhdlHidTimeExpression:                                   "_time_expression"
    of vhdlHidReject:                                           "_reject"
    of vhdlHidHeader:                                           "_header"
    of vhdlHidTimeoutClause:                                    "_timeout_clause"
    of vhdlHidEntityTag:                                        "_entity_tag"
    of vhdlHidLoopLabel:                                        "_loop_label"
    of vhdlPSLCompoundSEREWithin:                               "PSL_Compound_SERE_Within"
    of vhdlHidIn:                                               "_in"
    of vhdlHidName:                                             "_name"
    of vhdlHidAliasDenotator:                                   "_alias_denotator"
    of vhdlPSLIdentifier:                                       "PSL_Identifier"
    of vhdlHidUninstantiatedName:                               "_uninstantiated_name"
    of vhdlHidAny:                                              "_any"
    of vhdlHidPSLPropertyInstance:                              "_PSL_Property_Instance"
    of vhdlHidOperatorSymbol:                                   "_operator_symbol"
    of vhdlHidObjectDeclaration:                                "_object_declaration"
    of vhdlBase12:                                              "base12"
    of vhdlBase16:                                              "base16"
    of vhdlPSLCompoundSEREOr:                                   "PSL_Compound_SERE_Or"
    of vhdlHidPSLRange:                                         "_PSL_Range"
    of vhdlHidExternalPathname:                                 "_external_pathname"
    of vhdlHidArrayElementConstraint:                           "_array_element_constraint"
    of vhdlHidSelectedSignalAssignment:                         "_selected_signal_assignment"
    of vhdlExtendedDigitBase13:                                 "extended_digit_base13"
    of vhdlHidChoice:                                           "_choice"
    of vhdlHidPSLBoolean:                                       "_PSL_Boolean"
    of vhdlHidNumericLiteral:                                   "_numeric_literal"
    of vhdlHidPSLHDLModuleNAME:                                 "_PSL_HDL_Module_NAME"
    of vhdlHidComponentName:                                    "_component_name"
    of vhdlBase14:                                              "base14"
    of vhdlHidPSLCompoundSERE:                                  "_PSL_Compound_SERE"
    of vhdlHidSignalAssignmentStatement:                        "_signal_assignment_statement"
    of vhdlHidAssociationElement:                               "_association_element"
    of vhdlHidEnumerationLiteral:                               "_enumeration_literal"
    of vhdlHidFileOpenKind:                                     "_file_open_kind"
    of vhdlHidExpression:                                       "_expression"
    of vhdlHidPredefinedAttributeDesignatorWithExpression:      "_predefined_attribute_designator_with_expression"
    of vhdlHidOctalBitValue:                                    "_octal_bit_value"
    of vhdlHidExternalObjectName:                               "_external_object_name"
    of vhdlHidEndDesignator:                                    "_end_designator"
    of vhdlHidFunctionSpecification:                            "_function_specification"
    of vhdlPSLCompoundSEREAnd:                                  "PSL_Compound_SERE_And"
    of vhdlHidStringExpression:                                 "_string_expression"
    of vhdlExtendedDigitBase3:                                  "extended_digit_base3"
    of vhdlHidNumericTypeDefinition:                            "_numeric_type_definition"
    of vhdlPSLParenthesizedBoolean:                             "PSL_Parenthesized_Boolean"
    of vhdlHidBuffer:                                           "_buffer"
    of vhdlHidPSLAnyType:                                       "_PSL_Any_Type"
    of vhdlHidPSLConcatSERE:                                    "_PSL_Concat_SERE"
    of vhdlBase10:                                              "base10"
    of vhdlExtendedDigitBase16:                                 "extended_digit_base16"
    of vhdlHidPSLClockExpression:                               "_PSL_Clock_Expression"
    of vhdlExtendedDigitBase6:                                  "extended_digit_base6"
    of vhdlHidConditionalSignalAssignment:                      "_conditional_signal_assignment"
    of vhdlHidPrimaryUnit:                                      "_primary_unit"
    of vhdlHidPSLFusionSERE:                                    "_PSL_Fusion_SERE"
    of vhdlHidTypeDeclaration:                                  "_type_declaration"
    of vhdlHidIntegerImmed:                                     "_integer_immed"
    of vhdlHidBinaryBitValue:                                   "_binary_bit_value"
    of vhdlHidRange:                                            "_range"
    of vhdlHidConfigurationItem:                                "_configuration_item"
    of vhdlHidSignalName:                                       "_signal_name"
    of vhdlHidIterationScheme:                                  "_iteration_scheme"
    of vhdlExtendedDigitBase2:                                  "extended_digit_base2"
    of vhdlExtendedDigitBase10:                                 "extended_digit_base10"
    of vhdlBase8:                                               "base8"
    of vhdlHidPSLAmbiguousInstance:                             "_PSL_Ambiguous_Instance"
    of vhdlExtendedDigitBase9:                                  "extended_digit_base9"
    of vhdlHidSimpleName:                                       "_simple_name"
    of vhdlHidLibraryUnit:                                      "_library_unit"
    of vhdlHidDigitImmed:                                       "_digit_immed"
    of vhdlExtendedDigitBase7:                                  "extended_digit_base7"
    of vhdlHidAliasDesignator:                                  "_alias_designator"
    of vhdlHidLiteral:                                          "_literal"
    of vhdlExtendedDigitBase11:                                 "extended_digit_base11"
    of vhdlHidGenericInterfaceDeclaration:                      "_generic_interface_declaration"
    of vhdlExtendedDigitBase15:                                 "extended_digit_base15"
    of vhdlHidPSLExtendedOcurrenceFLPropertyUntilSpecification: "_PSL_Extended_Ocurrence_FL_Property_Until_Specification"
    of vhdlHidSecondaryUnit:                                    "_secondary_unit"
    of vhdlHidPredefinedAttributeDesignator:                    "_predefined_attribute_designator"
    of vhdlExtendedDigitBase14:                                 "extended_digit_base14"
    of vhdlHidDesignator:                                       "_designator"
    of vhdlHidPSLVerificationUnit:                              "_PSL_Verification_Unit"
    of vhdlHidFunctionName:                                     "_function_name"
    of vhdlHidPortInterfaceDeclaration:                         "_port_interface_declaration"
    of vhdlHidPSLProperty:                                      "_PSL_Property"
    of vhdlHidHexadecimalBitValue:                              "_hexadecimal_bit_value"
    of vhdlPSLInstance:                                         "PSL_Instance"
    of vhdlHidEntityAspect:                                     "_entity_aspect"
    of vhdlHidCompositeTypeDefinition:                          "_composite_type_definition"
    of vhdlHidPSLFLProperty:                                    "_PSL_FL_Property"
    of vhdlHidGroupConstituent:                                 "_group_constituent"
    of vhdlHidResolutionIndication:                             "_resolution_indication"
    of vhdlHidConditionClause:                                  "_condition_clause"
    of vhdlHidPSLDeclaration:                                   "_PSL_Declaration"
    of vhdlHidSemicolon:                                        "_semicolon"
    of vhdlHidPSLExtendedOcurrenceFLPropertyCountSpecification: "_PSL_Extended_Ocurrence_FL_Property_Count_Specification"
    of vhdlHidSubprogramInstantiationDeclaration:               "_subprogram_instantiation_declaration"
    of vhdlBase3:                                               "base3"
    of vhdlHidConstantMode:                                     "_constant_mode"
    of vhdlHidPSLVUNitItem:                                     "_PSL_VUnit_Item"
    of vhdlHidTypeDefinition:                                   "_type_definition"
    of vhdlHidProcedureInterfaceDeclaration:                    "_procedure_interface_declaration"
    of vhdlHidBinaryExpression:                                 "_binary_expression"
    of vhdlExtendedDigitBase4:                                  "extended_digit_base4"
    of vhdlExtendedDigitBase12:                                 "extended_digit_base12"
    of vhdlHidVariableMode:                                     "_variable_mode"
    of vhdlExtendedDigitBase8:                                  "extended_digit_base8"
    of vhdlHidAfter:                                            "_after"
    of vhdlHidSeverity:                                         "_severity"
    of vhdlHidPrimary:                                          "_primary"
    of vhdlHidSignalMode:                                       "_signal_mode"
    of vhdlHidPSLNumber:                                        "_PSL_Number"
    of vhdlHidScalarTypeDefinition:                             "_scalar_type_definition"
    of vhdlHidElementConstraint:                                "_element_constraint"
    of vhdlBase15:                                              "base15"
    of vhdlHidFileLogicalName:                                  "_file_logical_name"
    of vhdlHidRangeAttributeDesignator:                         "_range_attribute_designator"
    of vhdlSyntaxError:                                         "ERROR"

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
                                             vhdlHidUnderscoreTok,
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
const vhdlHiddenKinds*: set[VhdlNodeKind] = {
                                              vhdlHidDigit,
                                              vhdlHidPSLSequenceInstance,
                                              vhdlHidNameOrLabel,
                                              vhdlHidRangeAttributeName,
                                              vhdlHidProcedureSpecification,
                                              vhdlHidPSLSequence,
                                              vhdlHidClause,
                                              vhdlHidExpr,
                                              vhdlBase2,
                                              vhdlHidConcurrentSignalAssignment,
                                              vhdlHidContextItem,
                                              vhdlHidTarget,
                                              vhdlHidFunctionParameterList,
                                              vhdlHidActualPart,
                                              vhdlHidConcurrentStatement,
                                              vhdlHidSimpleExpression,
                                              vhdlHidAttributeDesignator,
                                              vhdlHidElementAssociation,
                                              vhdlHidPSLSERE,
                                              vhdlHidPortInterfaceList,
                                              vhdlHidSubprogramBody,
                                              vhdlHidGroupTemplate,
                                              vhdlHidUnit,
                                              vhdlHidPSLExtendedOcurrenceArgument,
                                              vhdlHidUnaryExpression,
                                              vhdlBase5,
                                              vhdlHidPhysicalLiteral,
                                              vhdlHidGuard,
                                              vhdlHidFormalPart,
                                              vhdlHidRangeDesignator,
                                              vhdlHidIdentifier,
                                              vhdlBase11,
                                              vhdlHidSubprogramKind,
                                              vhdlHidSeverityExpression,
                                              vhdlHidPartialPathname,
                                              vhdlHidVariableAssignmentStatement,
                                              vhdlHidGenericInterfaceList,
                                              vhdlExtendedDigitBase5,
                                              vhdlHidPSLValueRange,
                                              vhdlArrayElementConstraint,
                                              vhdlBasicIdentifier,
                                              vhdlHidCondition,
                                              vhdlHidDecimalBitValue,
                                              vhdlHidAbstractLiteral,
                                              vhdlHidComponentSpecification,
                                              vhdlBase7,
                                              vhdlRangeAttributeName,
                                              vhdlHidPSLDirective,
                                              vhdlHidDeclaration,
                                              vhdlHidSequentialStatement,
                                              vhdlHidLinkage,
                                              vhdlHidPackageName,
                                              vhdlHidSubprogramInterfaceDeclaration,
                                              vhdlBase13,
                                              vhdlHidEntityName,
                                              vhdlHidOut,
                                              vhdlHidReport,
                                              vhdlHidEndSimpleName,
                                              vhdlHidPSLParameterSpecification,
                                              vhdlHidFunctionInterfaceDeclaration,
                                              vhdlHidWhenClause,
                                              vhdlHidPredefinedDesignator,
                                              vhdlHidConstraint,
                                              vhdlHidGenerateSpecification,
                                              vhdlHidProcedureParameterList,
                                              vhdlHidSensitivityClause,
                                              vhdlHidInout,
                                              vhdlBase6,
                                              vhdlHidPredefinedDesignatorWithExpression,
                                              vhdlHidSubprogramDeclaration,
                                              vhdlBase4,
                                              vhdlHidIllegalInterfaceDeclaration,
                                              vhdlHidSimpleSignalAssignment,
                                              vhdlHidBlockSpecification,
                                              vhdlBase9,
                                              vhdlHidValue,
                                              vhdlHidElementAssociationList,
                                              vhdlHidDiscreteRange,
                                              vhdlHidArrayTypeDefinition,
                                              vhdlHidPSLIdentifier,
                                              vhdlHidGenerateStatement,
                                              vhdlHidPSLValue,
                                              vhdlHidTimeExpression,
                                              vhdlHidReject,
                                              vhdlHidHeader,
                                              vhdlHidTimeoutClause,
                                              vhdlHidEntityTag,
                                              vhdlHidLoopLabel,
                                              vhdlPSLCompoundSEREWithin,
                                              vhdlHidIn,
                                              vhdlHidName,
                                              vhdlHidAliasDenotator,
                                              vhdlHidSeparator,
                                              vhdlPSLIdentifier,
                                              vhdlHidUninstantiatedName,
                                              vhdlHidAny,
                                              vhdlHidPSLPropertyInstance,
                                              vhdlHidOperatorSymbol,
                                              vhdlHidObjectDeclaration,
                                              vhdlBase12,
                                              vhdlBase16,
                                              vhdlPSLCompoundSEREOr,
                                              vhdlHidPSLRange,
                                              vhdlHidExternalPathname,
                                              vhdlHidArrayElementConstraint,
                                              vhdlHidSelectedSignalAssignment,
                                              vhdlExtendedDigitBase13,
                                              vhdlHidChoice,
                                              vhdlHidPSLBoolean,
                                              vhdlHidNumericLiteral,
                                              vhdlHidPSLHDLModuleNAME,
                                              vhdlHidComponentName,
                                              vhdlBase14,
                                              vhdlHidPSLCompoundSERE,
                                              vhdlHidSignalAssignmentStatement,
                                              vhdlHidAssociationElement,
                                              vhdlHidEnumerationLiteral,
                                              vhdlHidFileOpenKind,
                                              vhdlHidExpression,
                                              vhdlHidPredefinedAttributeDesignatorWithExpression,
                                              vhdlHidOctalBitValue,
                                              vhdlHidExternalObjectName,
                                              vhdlHidEndDesignator,
                                              vhdlHidFunctionSpecification,
                                              vhdlPSLCompoundSEREAnd,
                                              vhdlHidStringExpression,
                                              vhdlExtendedDigitBase3,
                                              vhdlHidNumericTypeDefinition,
                                              vhdlPSLParenthesizedBoolean,
                                              vhdlHidBuffer,
                                              vhdlHidPSLAnyType,
                                              vhdlHidPSLConcatSERE,
                                              vhdlBase10,
                                              vhdlExtendedDigitBase16,
                                              vhdlHidPSLClockExpression,
                                              vhdlExtendedDigitBase6,
                                              vhdlHidConditionalSignalAssignment,
                                              vhdlHidPrimaryUnit,
                                              vhdlHidPSLFusionSERE,
                                              vhdlHidTypeDeclaration,
                                              vhdlHidIntegerImmed,
                                              vhdlHidBinaryBitValue,
                                              vhdlHidRange,
                                              vhdlHidConfigurationItem,
                                              vhdlHidSignalName,
                                              vhdlHidIterationScheme,
                                              vhdlExtendedDigitBase2,
                                              vhdlExtendedDigitBase10,
                                              vhdlBase8,
                                              vhdlHidPSLAmbiguousInstance,
                                              vhdlExtendedDigitBase9,
                                              vhdlHidSimpleName,
                                              vhdlHidLibraryUnit,
                                              vhdlHidDigitImmed,
                                              vhdlExtendedDigitBase7,
                                              vhdlHidAliasDesignator,
                                              vhdlHidLiteral,
                                              vhdlExtendedDigitBase11,
                                              vhdlHidGenericInterfaceDeclaration,
                                              vhdlExtendedDigitBase15,
                                              vhdlHidPSLExtendedOcurrenceFLPropertyUntilSpecification,
                                              vhdlHidSecondaryUnit,
                                              vhdlHidPredefinedAttributeDesignator,
                                              vhdlExtendedDigitBase14,
                                              vhdlHidDesignator,
                                              vhdlHidPSLVerificationUnit,
                                              vhdlHidFunctionName,
                                              vhdlHidPortInterfaceDeclaration,
                                              vhdlHidPSLProperty,
                                              vhdlHidHexadecimalBitValue,
                                              vhdlPSLInstance,
                                              vhdlHidEntityAspect,
                                              vhdlHidCompositeTypeDefinition,
                                              vhdlHidPSLFLProperty,
                                              vhdlHidGroupConstituent,
                                              vhdlHidResolutionIndication,
                                              vhdlHidConditionClause,
                                              vhdlHidPSLDeclaration,
                                              vhdlHidSemicolon,
                                              vhdlHidPSLExtendedOcurrenceFLPropertyCountSpecification,
                                              vhdlHidSubprogramInstantiationDeclaration,
                                              vhdlBase3,
                                              vhdlHidConstantMode,
                                              vhdlHidPSLVUNitItem,
                                              vhdlHidTypeDefinition,
                                              vhdlHidProcedureInterfaceDeclaration,
                                              vhdlHidBinaryExpression,
                                              vhdlExtendedDigitBase4,
                                              vhdlExtendedDigitBase12,
                                              vhdlHidVariableMode,
                                              vhdlExtendedDigitBase8,
                                              vhdlHidAfter,
                                              vhdlHidSeverity,
                                              vhdlHidPrimary,
                                              vhdlHidSignalMode,
                                              vhdlHidPSLNumber,
                                              vhdlHidScalarTypeDefinition,
                                              vhdlHidElementConstraint,
                                              vhdlBase15,
                                              vhdlHidFileLogicalName,
                                              vhdlHidRangeAttributeDesignator
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
      of "_":                                        vhdlHidUnderscoreTok
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
      of "_separator":                               vhdlHidSeparator
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


proc treeRepr*(node: TsVhdlNode, str: string): string =
  var res = addr result
  proc aux(node: TsVhdlNode, level: int) =
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
let vhdlGrammar*: array[VhdlNodeKind, HtsRule[VhdlNodeKind]] = block:
                                                                 var rules: array[VhdlNodeKind, HtsRule[VhdlNodeKind]]
                                                                 type
                                                                   K = VhdlNodeKind


                                                                 rules[vhdlIfGenerate] = tsSeq[K](tsRegex[K]("[iI][fF]"), tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidCondition), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlGenerateStatementBody), tsBlank[K]()))
                                                                 rules[vhdlRecordConstraint] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](vhdlRecordElementConstraint), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlRecordElementConstraint)))), tsString[K](")"))
                                                                 rules[vhdlPSLPropertyDeclaration] = tsSeq[K](tsRegex[K]("[pP][rR][oO][pP][eE][rR][tT][yY]"), tsSymbol[K](vhdlHidPSLIdentifier), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlPSLFormalParameterList), tsString[K](")")), tsBlank[K]()), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlHidPSLPropertyInstance), tsSymbol[K](vhdlHidPSLProperty)), tsString[K](";"))
                                                                 rules[vhdlHidRangeAttributeName] = tsSymbol[K](vhdlRangeAttributeName)
                                                                 rules[vhdlPSLBuiltInFunctionCall] = tsChoice[K](tsSeq[K](tsChoice[K](tsRegex[K]("[pP][rR][eE][vV]"), tsRegex[K]("[nN][eE][xX][tT]"), tsRegex[K]("[sS][tT][aA][bB][lL][eE]"), tsRegex[K]("[rR][oO][sS][eE]"), tsRegex[K]("[fF][eE][lL][lL]"), tsRegex[K]("[iI][sS][uU][nN][kK][nN][oO][wW][nN]"), tsRegex[K]("[cC][oO][uU][nN][tT][oO][nN][eE][sS]"), tsRegex[K]("[oO][nN][eE][hH][oO][tT]"), tsRegex[K]("[oO][nN][eE][hH][oO][tT][00]"), tsRegex[K]("[nN][oO][nN][dD][eE][tT]"), tsRegex[K]("[nN][oO][nN][dD][eE][tT][__][vV][eE][cC][tT][oO][rR]")), tsString[K]("("), tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidPSLAnyType), tsSymbol[K](vhdlPSLValueSet)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](vhdlHidPSLAnyType), tsSymbol[K](vhdlPSLValueSet))))), tsString[K](")")), tsSeq[K](tsRegex[K]("[eE][nN][dD][eE][dD]"), tsString[K]("("), tsSymbol[K](vhdlHidPSLSequence), tsString[K](")")))
                                                                 rules[vhdlHidProcedureSpecification] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[pP][uU][rR][eE]"), tsRegex[K]("[iI][mM][pP][uU][rR][eE]")), tsBlank[K]()), tsRegex[K]("[pP][rR][oO][cC][eE][dD][uU][rR][eE]"), tsSymbol[K](vhdlHidDesignator), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlProcedureParameterClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlReturn), tsBlank[K]()))
                                                                 rules[vhdlIncompleteTypeDeclaration] = tsSeq[K](tsRegex[K]("[tT][yY][pP][eE]"), tsSymbol[K](vhdlHidIdentifier), tsString[K](";"))
                                                                 rules[vhdlHidClause] = tsChoice[K](tsSymbol[K](vhdlGenericClause), tsSymbol[K](vhdlGenericMapAspect), tsSymbol[K](vhdlPortClause), tsSymbol[K](vhdlPortMapAspect))
                                                                 rules[vhdlEntityDesignator] = tsSeq[K](tsSymbol[K](vhdlHidEntityTag), tsChoice[K](tsSymbol[K](vhdlSignature), tsBlank[K]()))
                                                                 rules[vhdlPSLUnionExpression] = tsSeq[K](tsSymbol[K](vhdlHidPSLAnyType), tsRegex[K]("[uU][nN][iI][oO][nN]"), tsSymbol[K](vhdlHidPSLAnyType))
                                                                 rules[vhdlHidPSLSequence] = tsChoice[K](tsSymbol[K](vhdlHidPSLSequenceInstance), tsSymbol[K](vhdlPSLRepeatedSERE), tsSymbol[K](vhdlPSLBracedSERE), tsSymbol[K](vhdlPSLClockedSERE))
                                                                 rules[vhdlBase2] = tsChoice[K](tsSeq[K](tsString[K]("2")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("2")))
                                                                 rules[vhdlSelectedExpressions] = tsSeq[K](tsSymbol[K](vhdlHidValue), tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlChoices), tsRepeat[K](tsSymbol[K](vhdlAlternativeSelectedExpressions)))
                                                                 rules[vhdlAttributeDeclaration] = tsSeq[K](tsRegex[K]("[aA][tT][tT][rR][iI][bB][uU][tT][eE]"), tsSymbol[K](vhdlHidIdentifier), tsString[K](":"), tsSymbol[K](vhdlTypeMark), tsString[K](";"))
                                                                 rules[vhdlContextList] = tsSeq[K](tsSymbol[K](vhdlSelectedName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlSelectedName))))
                                                                 rules[vhdlBitStringLiteral] = tsChoice[K](tsSeq[K](tsChoice[K](tsRegex[K]("[uUsS]?[bB]\""), tsSeq[K](tsSymbol[K](vhdlInteger), tsRegex[K]("[uUsS]?[bB]\""))), tsChoice[K](tsSymbol[K](vhdlHidBinaryBitValue), tsBlank[K]()), tsString[K]("\"")), tsSeq[K](tsChoice[K](tsRegex[K]("[uUsS]?[oO]\""), tsSeq[K](tsSymbol[K](vhdlInteger), tsRegex[K]("[uUsS]?[oO]\""))), tsChoice[K](tsSymbol[K](vhdlHidOctalBitValue), tsBlank[K]()), tsString[K]("\"")), tsSeq[K](tsChoice[K](tsRegex[K]("[dD]\""), tsSeq[K](tsSymbol[K](vhdlInteger), tsRegex[K]("[dD]\""))), tsChoice[K](tsSymbol[K](vhdlHidDecimalBitValue), tsBlank[K]()), tsString[K]("\"")), tsSeq[K](tsChoice[K](tsRegex[K]("[uUsS]?[xX]\""), tsSeq[K](tsSymbol[K](vhdlInteger), tsRegex[K]("[uUsS]?[xX]\""))), tsChoice[K](tsSymbol[K](vhdlHidHexadecimalBitValue), tsBlank[K]()), tsString[K]("\"")))
                                                                 rules[vhdlHidTarget] = tsChoice[K](tsSymbol[K](vhdlHidName), tsSymbol[K](vhdlAggregate))
                                                                 rules[vhdlHidFunctionParameterList] = tsSeq[K](tsSeq[K](tsSymbol[K](vhdlHidFunctionInterfaceDeclaration), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlHidFunctionInterfaceDeclaration)))))
                                                                 rules[vhdlConfigurationSpecification] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsChoice[K](tsSeq[K](tsSymbol[K](vhdlHidComponentSpecification), tsSymbol[K](vhdlBindingIndication), tsChoice[K](tsSeq[K](tsRepeat[K](tsSymbol[K](vhdlVerificationUnitBindingIndication)), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[fF][oO][rR]"), tsString[K](";")), tsBlank[K]())), tsBlank[K]()))
                                                                 rules[vhdlTransport] = tsRegex[K]("[tT][rR][aA][nN][sS][pP][oO][rR][tT]")
                                                                 rules[vhdlHidSimpleExpression] = tsSymbol[K](vhdlHidExpr)
                                                                 rules[vhdlProcedureInterfaceDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidProcedureSpecification), tsChoice[K](tsSeq[K](tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlInterfaceSubprogramDefault)), tsBlank[K]()))
                                                                 rules[vhdlConstantInterfaceDeclaration] = tsSeq[K](tsChoice[K](tsRegex[K]("[cC][oO][nN][sS][tT][aA][nN][tT]"), tsBlank[K]()), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsChoice[K](tsSymbol[K](vhdlHidConstantMode), tsBlank[K]()), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()))
                                                                 rules[vhdlConcurrentStatementPart] = tsRepeat1[K](tsSymbol[K](vhdlHidConcurrentStatement))
                                                                 rules[vhdlElementDeclaration] = tsSeq[K](tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsString[K](";"))
                                                                 rules[vhdlHidElementAssociation] = tsChoice[K](tsSymbol[K](vhdlPositionalElementAssociation), tsSymbol[K](vhdlNamedElementAssociation))
                                                                 rules[vhdlLogicalExpression] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsChoice[K](tsRepeat1[K](tsSeq[K](tsRegex[K]("[aA][nN][dD]"), tsSymbol[K](vhdlHidExpr))), tsRepeat1[K](tsSeq[K](tsRegex[K]("[oO][rR]"), tsSymbol[K](vhdlHidExpr))), tsRepeat1[K](tsSeq[K](tsRegex[K]("[xX][oO][rR]"), tsSymbol[K](vhdlHidExpr))), tsRepeat1[K](tsSeq[K](tsRegex[K]("[xX][nN][oO][rR]"), tsSymbol[K](vhdlHidExpr))), tsSeq[K](tsSeq[K](tsRegex[K]("[nN][aA][nN][dD]"), tsSymbol[K](vhdlHidExpr))), tsSeq[K](tsSeq[K](tsRegex[K]("[nN][oO][rR]"), tsSymbol[K](vhdlHidExpr)))))
                                                                 rules[vhdlPSLParameterizedSERE] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlPSLParametersDefinition), tsString[K](":"), tsChoice[K](tsString[K]("|"), tsString[K]("&"), tsString[K]("&&")), tsString[K]("{"), tsSymbol[K](vhdlHidPSLSERE), tsString[K]("}"))
                                                                 rules[vhdlWaveforms] = tsChoice[K](tsSymbol[K](vhdlUnaffected), tsSeq[K](tsSymbol[K](vhdlWaveformElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlWaveformElement)))))
                                                                 rules[vhdlSimpleForceAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsChoice[K](tsRegex[K]("[gG][uU][aA][rR][dD][eE][dD]"), tsBlank[K]()), tsRegex[K]("[fF][oO][rR][cC][eE]"), tsChoice[K](tsSymbol[K](vhdlForceMode), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidValue), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlConditionalForceAssignment] = tsSeq[K](tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsRegex[K]("[fF][oO][rR][cC][eE]"), tsChoice[K](tsSymbol[K](vhdlForceMode), tsBlank[K]()), tsSymbol[K](vhdlConditionalExpressions), tsString[K](";"))
                                                                 rules[vhdlSelectedVariableAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[wW][iI][tT][hH]"), tsSymbol[K](vhdlHidExpression), tsRegex[K]("[sS][eE][lL][eE][cC][tT]"), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K](":="), tsSymbol[K](vhdlSelectedExpressions), tsString[K](";"))
                                                                 rules[vhdlHidSubprogramBody] = tsChoice[K](tsSymbol[K](vhdlProcedureBody), tsSymbol[K](vhdlFunctionBody))
                                                                 rules[vhdlHidGroupTemplate] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName))
                                                                 rules[vhdlHidUnit] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName))
                                                                 rules[vhdlHidPSLExtendedOcurrenceArgument] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidPSLExtendedOcurrenceFLPropertyCountSpecification), tsSymbol[K](vhdlHidPSLExtendedOcurrenceFLPropertyUntilSpecification)), tsString[K]("("), tsSymbol[K](vhdlHidPSLFLProperty), tsString[K](")"))
                                                                 rules[vhdlHidFormalPart] = tsChoice[K](tsSymbol[K](vhdlHidName), tsSymbol[K](vhdlOthers))
                                                                 rules[vhdlElseGenerate] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlGenerateStatementBody), tsBlank[K]()))
                                                                 rules[vhdlComponentDeclaration] = tsSeq[K](tsRegex[K]("[cC][oO][mM][pP][oO][nN][eE][nN][tT]"), tsSymbol[K](vhdlHidIdentifier), tsChoice[K](tsRegex[K]("[iI][sS]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[cC][oO][mM][pP][oO][nN][eE][nN][tT]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlPSLClockedFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLFLProperty), tsRepeat1[K](tsSeq[K](tsString[K]("@"), tsSymbol[K](vhdlHidPSLClockExpression))))
                                                                 rules[vhdlHidSeverityExpression] = tsSymbol[K](vhdlHidPrimary)
                                                                 rules[vhdlHidVariableAssignmentStatement] = tsChoice[K](tsSymbol[K](vhdlSimpleVariableAssignment), tsSymbol[K](vhdlConditionalVariableAssignment), tsSymbol[K](vhdlSelectedVariableAssignment))
                                                                 rules[vhdlParenthesizedResolution] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidResolutionIndication), tsString[K](")"))
                                                                 rules[vhdlOthers] = tsRegex[K]("[oO][tT][hH][eE][rR][sS]")
                                                                 rules[vhdlExtendedDigitBase5] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-4]"), tsRegex[K]("[^0-4#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-4]"), tsRegex[K]("[^0-4#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlPortMapAspect] = tsSeq[K](tsRegex[K]("[pP][oO][rR][tT]"), tsRegex[K]("[mM][aA][pP]"), tsString[K]("("), tsChoice[K](tsSymbol[K](vhdlAssociationList), tsBlank[K]()), tsString[K](")"), tsChoice[K](tsSymbol[K](vhdlHidSemicolon), tsBlank[K]()))
                                                                 rules[vhdlPhysicalTypeDefinition] = tsSeq[K](tsSymbol[K](vhdlRangeConstraint), tsRegex[K]("[uU][nN][iI][tT][sS]"), tsChoice[K](tsSeq[K](tsSymbol[K](vhdlPrimaryUnitDeclaration), tsRepeat[K](tsSymbol[K](vhdlSecondaryUnitDeclaration))), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[uU][nN][iI][tT][sS]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()))
                                                                 rules[vhdlFunctionCall] = tsSeq[K](tsSymbol[K](vhdlHidFunctionName), tsString[K]("("), tsSymbol[K](vhdlAssociationList), tsString[K](")"))
                                                                 rules[vhdlPSLSequentialFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLSequence), tsChoice[K](tsString[K]("!"), tsBlank[K]()))
                                                                 rules[vhdlFactor] = tsSeq[K](tsChoice[K](tsRegex[K]("[nN][oO][tT]"), tsRegex[K]("[aA][bB][sS]")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlBasicIdentifier] = tsSeq[K](tsChoice[K](tsString[K]("a"), tsString[K]("b"), tsString[K]("c"), tsString[K]("d"), tsString[K]("e"), tsString[K]("f"), tsString[K]("g"), tsString[K]("h"), tsString[K]("i"), tsString[K]("j"), tsString[K]("k"), tsString[K]("l"), tsString[K]("m"), tsString[K]("n"), tsString[K]("o"), tsString[K]("p"), tsString[K]("q"), tsString[K]("r"), tsString[K]("s"), tsString[K]("t"), tsString[K]("u"), tsString[K]("v"), tsString[K]("w"), tsString[K]("x"), tsString[K]("y"), tsString[K]("z"), tsString[K]("\xC3\x9F"), tsString[K]("\xC3\xA0"), tsString[K]("\xC3\xA1"), tsString[K]("\xC3\xA2"), tsString[K]("\xC3\xA3"), tsString[K]("\xC3\xA4"), tsString[K]("\xC3\xA5"), tsString[K]("\xC3\xA6"), tsString[K]("\xC3\xA7"), tsString[K]("\xC3\xA8"), tsString[K]("\xC3\xA9"), tsString[K]("\xC3\xAA"), tsString[K]("\xC3\xAB"), tsString[K]("\xC3\xAC"), tsString[K]("\xC3\xAD"), tsString[K]("\xC3\xAE"), tsString[K]("\xC3\xAF"), tsString[K]("\xC3\xB0"), tsString[K]("\xC3\xB1"), tsString[K]("\xC3\xB2"), tsString[K]("\xC3\xB3"), tsString[K]("\xC3\xB4"), tsString[K]("\xC3\xB5"), tsString[K]("\xC3\xB6"), tsString[K]("\xC3\xB8"), tsString[K]("\xC3\xB9"), tsString[K]("\xC3\xBA"), tsString[K]("\xC3\xBB"), tsString[K]("\xC3\xBC"), tsString[K]("\xC3\xBD"), tsString[K]("\xC3\xBE"), tsString[K]("\xC3\xBF"), tsString[K]("A"), tsString[K]("B"), tsString[K]("C"), tsString[K]("D"), tsString[K]("E"), tsString[K]("F"), tsString[K]("G"), tsString[K]("H"), tsString[K]("I"), tsString[K]("J"), tsString[K]("K"), tsString[K]("L"), tsString[K]("M"), tsString[K]("N"), tsString[K]("O"), tsString[K]("P"), tsString[K]("Q"), tsString[K]("R"), tsString[K]("S"), tsString[K]("T"), tsString[K]("U"), tsString[K]("V"), tsString[K]("W"), tsString[K]("X"), tsString[K]("Y"), tsString[K]("Z"), tsString[K]("\xC3\x80"), tsString[K]("\xC3\x81"), tsString[K]("\xC3\x82"), tsString[K]("\xC3\x83"), tsString[K]("\xC3\x84"), tsString[K]("\xC3\x85"), tsString[K]("\xC3\x86"), tsString[K]("\xC3\x87"), tsString[K]("\xC3\x88"), tsString[K]("\xC3\x89"), tsString[K]("\xC3\x8A"), tsString[K]("\xC3\x8B"), tsString[K]("\xC3\x8C"), tsString[K]("\xC3\x8D"), tsString[K]("\xC3\x8E"), tsString[K]("\xC3\x8F"), tsString[K]("\xC3\x90"), tsString[K]("\xC3\x91"), tsString[K]("\xC3\x92"), tsString[K]("\xC3\x93"), tsString[K]("\xC3\x94"), tsString[K]("\xC3\x95"), tsString[K]("\xC3\x96"), tsString[K]("\xC3\x98"), tsString[K]("\xC3\x99"), tsString[K]("\xC3\x9A"), tsString[K]("\xC3\x9B"), tsString[K]("\xC3\x9C"), tsString[K]("\xC3\x9D"), tsString[K]("\xC3\x9E")), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsChoice[K](tsString[K]("a"), tsString[K]("b"), tsString[K]("c"), tsString[K]("d"), tsString[K]("e"), tsString[K]("f"), tsString[K]("g"), tsString[K]("h"), tsString[K]("i"), tsString[K]("j"), tsString[K]("k"), tsString[K]("l"), tsString[K]("m"), tsString[K]("n"), tsString[K]("o"), tsString[K]("p"), tsString[K]("q"), tsString[K]("r"), tsString[K]("s"), tsString[K]("t"), tsString[K]("u"), tsString[K]("v"), tsString[K]("w"), tsString[K]("x"), tsString[K]("y"), tsString[K]("z"), tsString[K]("\xC3\x9F"), tsString[K]("\xC3\xA0"), tsString[K]("\xC3\xA1"), tsString[K]("\xC3\xA2"), tsString[K]("\xC3\xA3"), tsString[K]("\xC3\xA4"), tsString[K]("\xC3\xA5"), tsString[K]("\xC3\xA6"), tsString[K]("\xC3\xA7"), tsString[K]("\xC3\xA8"), tsString[K]("\xC3\xA9"), tsString[K]("\xC3\xAA"), tsString[K]("\xC3\xAB"), tsString[K]("\xC3\xAC"), tsString[K]("\xC3\xAD"), tsString[K]("\xC3\xAE"), tsString[K]("\xC3\xAF"), tsString[K]("\xC3\xB0"), tsString[K]("\xC3\xB1"), tsString[K]("\xC3\xB2"), tsString[K]("\xC3\xB3"), tsString[K]("\xC3\xB4"), tsString[K]("\xC3\xB5"), tsString[K]("\xC3\xB6"), tsString[K]("\xC3\xB8"), tsString[K]("\xC3\xB9"), tsString[K]("\xC3\xBA"), tsString[K]("\xC3\xBB"), tsString[K]("\xC3\xBC"), tsString[K]("\xC3\xBD"), tsString[K]("\xC3\xBE"), tsString[K]("\xC3\xBF"), tsString[K]("A"), tsString[K]("B"), tsString[K]("C"), tsString[K]("D"), tsString[K]("E"), tsString[K]("F"), tsString[K]("G"), tsString[K]("H"), tsString[K]("I"), tsString[K]("J"), tsString[K]("K"), tsString[K]("L"), tsString[K]("M"), tsString[K]("N"), tsString[K]("O"), tsString[K]("P"), tsString[K]("Q"), tsString[K]("R"), tsString[K]("S"), tsString[K]("T"), tsString[K]("U"), tsString[K]("V"), tsString[K]("W"), tsString[K]("X"), tsString[K]("Y"), tsString[K]("Z"), tsString[K]("\xC3\x80"), tsString[K]("\xC3\x81"), tsString[K]("\xC3\x82"), tsString[K]("\xC3\x83"), tsString[K]("\xC3\x84"), tsString[K]("\xC3\x85"), tsString[K]("\xC3\x86"), tsString[K]("\xC3\x87"), tsString[K]("\xC3\x88"), tsString[K]("\xC3\x89"), tsString[K]("\xC3\x8A"), tsString[K]("\xC3\x8B"), tsString[K]("\xC3\x8C"), tsString[K]("\xC3\x8D"), tsString[K]("\xC3\x8E"), tsString[K]("\xC3\x8F"), tsString[K]("\xC3\x90"), tsString[K]("\xC3\x91"), tsString[K]("\xC3\x92"), tsString[K]("\xC3\x93"), tsString[K]("\xC3\x94"), tsString[K]("\xC3\x95"), tsString[K]("\xC3\x96"), tsString[K]("\xC3\x98"), tsString[K]("\xC3\x99"), tsString[K]("\xC3\x9A"), tsString[K]("\xC3\x9B"), tsString[K]("\xC3\x9C"), tsString[K]("\xC3\x9D"), tsString[K]("\xC3\x9E"), tsString[K]("0"), tsString[K]("1"), tsString[K]("2"), tsString[K]("3"), tsString[K]("4"), tsString[K]("5"), tsString[K]("6"), tsString[K]("7"), tsString[K]("8"), tsString[K]("9")))))
                                                                 rules[vhdlHidCondition] = tsSymbol[K](vhdlHidExpr)
                                                                 rules[vhdlHidAbstractLiteral] = tsChoice[K](tsSymbol[K](vhdlIntegerDecimal), tsSymbol[K](vhdlRealDecimal), tsSymbol[K](vhdlBasedInteger), tsSymbol[K](vhdlBasedReal))
                                                                 rules[vhdlInteger] = tsSeq[K](tsSymbol[K](vhdlHidDigit), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsSymbol[K](vhdlHidDigitImmed))))
                                                                 rules[vhdlBase7] = tsChoice[K](tsSeq[K](tsString[K]("7")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("7")))
                                                                 rules[vhdlHidDecimalBitValue] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare), tsSymbol[K](vhdlSeparator)), tsRepeat[K](tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlSeparator), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare)))))
                                                                 rules[vhdlRangeAttributeName] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlAttributeName), tsSymbol[K](vhdlHidExternalObjectName)), tsSymbol[K](vhdlHidRangeAttributeDesignator))
                                                                 rules[vhdlHidDeclaration] = tsChoice[K](tsSymbol[K](vhdlHidSubprogramDeclaration), tsSymbol[K](vhdlHidSubprogramBody), tsSymbol[K](vhdlHidSubprogramInstantiationDeclaration), tsSymbol[K](vhdlPackageDeclaration), tsSymbol[K](vhdlPackageBody), tsSymbol[K](vhdlPackageInstantiationDeclaration), tsSymbol[K](vhdlHidTypeDeclaration), tsSymbol[K](vhdlSubtypeDeclaration), tsSymbol[K](vhdlHidObjectDeclaration), tsSymbol[K](vhdlAliasDeclaration), tsSymbol[K](vhdlComponentDeclaration), tsSymbol[K](vhdlAttributeDeclaration), tsSymbol[K](vhdlAttributeSpecification), tsSymbol[K](vhdlConfigurationSpecification), tsSymbol[K](vhdlDisconnectionSpecification), tsSymbol[K](vhdlUseClause), tsSymbol[K](vhdlGroupTemplateDeclaration), tsSymbol[K](vhdlGroupDeclaration), tsSymbol[K](vhdlHidPSLDirective), tsSymbol[K](vhdlHidPSLDeclaration))
                                                                 rules[vhdlHidSequentialStatement] = tsChoice[K](tsSymbol[K](vhdlProcessStatement), tsSymbol[K](vhdlWaitStatement), tsSymbol[K](vhdlAssertionStatement), tsSymbol[K](vhdlReportStatement), tsSymbol[K](vhdlHidSignalAssignmentStatement), tsSymbol[K](vhdlHidVariableAssignmentStatement), tsSymbol[K](vhdlProcedureCallStatement), tsSymbol[K](vhdlIfStatement), tsSymbol[K](vhdlCaseStatement), tsSymbol[K](vhdlLoopStatement), tsSymbol[K](vhdlNextStatement), tsSymbol[K](vhdlExitStatement), tsSymbol[K](vhdlReturnStatement), tsSymbol[K](vhdlNullStatement), tsSymbol[K](vhdlHidPSLDirective), tsSymbol[K](vhdlHidPSLDeclaration))
                                                                 rules[vhdlHidLinkage] = tsRegex[K]("[lL][iI][nN][kK][aA][gG][eE]")
                                                                 rules[vhdlUnaffected] = tsRegex[K]("[uU][nN][aA][fF][fF][eE][cC][tT][eE][dD]")
                                                                 rules[vhdlProcedureCallStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsChoice[K](tsRegex[K]("[pP][oO][sS][tT][pP][oO][nN][eE][dD]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlAssociationList), tsString[K](")")), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidOut] = tsRegex[K]("[oO][uU][tT]")
                                                                 rules[vhdlExponent] = tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsBlank[K]()), tsRepeat1[K](tsChoice[K](tsString[K]("0"), tsString[K]("1"), tsString[K]("2"), tsString[K]("3"), tsString[K]("4"), tsString[K]("5"), tsString[K]("6"), tsString[K]("7"), tsString[K]("8"), tsString[K]("9"))))
                                                                 rules[vhdlDeclarativePart] = tsRepeat1[K](tsSymbol[K](vhdlHidDeclaration))
                                                                 rules[vhdlSign] = tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlSharedVariableDeclaration] = tsSeq[K](tsRegex[K]("[sS][hH][aA][rR][eE][dD]"), tsRegex[K]("[vV][aA][rR][iI][aA][bB][lL][eE]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidEndSimpleName] = tsSymbol[K](vhdlHidSimpleName)
                                                                 rules[vhdlConditionalWaveformAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsChoice[K](tsRegex[K]("[gG][uU][aA][rR][dD][eE][dD]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDelayMechanism), tsBlank[K]()), tsSymbol[K](vhdlConditionalWaveforms), tsString[K](";"))
                                                                 rules[vhdlPSLExpression] = tsSeq[K](tsSymbol[K](vhdlHidPSLBoolean), tsChoice[K](tsString[K]("->"), tsString[K]("<->")), tsSymbol[K](vhdlHidPSLBoolean))
                                                                 rules[vhdlReturn] = tsSeq[K](tsChoice[K](tsString[K](","), tsBlank[K]()), tsRegex[K]("[rR][eE][tT][uU][rR][nN]"), tsSymbol[K](vhdlTypeMark))
                                                                 rules[vhdlHidFunctionInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlConstantInterfaceDeclaration), tsSymbol[K](vhdlSignalInterfaceDeclaration), tsSymbol[K](vhdlFileInterfaceDeclaration), tsSymbol[K](vhdlHidIllegalInterfaceDeclaration))
                                                                 rules[vhdlSelectedName] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlSliceName), tsSymbol[K](vhdlHidExternalObjectName)), tsString[K]("."), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlHidOperatorSymbol), tsSymbol[K](vhdlAll)))
                                                                 rules[vhdlHidWhenClause] = tsSeq[K](tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlHidCondition))
                                                                 rules[vhdlContextDeclaration] = tsSeq[K](tsRegex[K]("[cC][oO][nN][tT][eE][xX][tT]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlContextClause), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[cC][oO][nN][tT][eE][xX][tT]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlFunctionInstantiationDeclaration] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[pP][uU][rR][eE]"), tsRegex[K]("[iI][mM][pP][uU][rR][eE]")), tsBlank[K]()), tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsSymbol[K](vhdlHidDesignator), tsRegex[K]("[iI][sS]"), tsRegex[K]("[nN][eE][wW]"), tsSymbol[K](vhdlHidUninstantiatedName), tsChoice[K](tsSymbol[K](vhdlSignature), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlConditionalVariableAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K](":="), tsSymbol[K](vhdlConditionalExpressions), tsString[K](";"))
                                                                 rules[vhdlProcessStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsChoice[K](tsRegex[K]("[pP][oO][sS][tT][pP][oO][nN][eE][dD]"), tsBlank[K]()), tsRegex[K]("[pP][rR][oO][cC][eE][sS][sS]"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlSensitivityList), tsString[K](")")), tsBlank[K]()), tsChoice[K](tsRegex[K]("[iI][sS]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[pP][oO][sS][tT][pP][oO][nN][eE][dD]"), tsBlank[K]()), tsRegex[K]("[pP][rR][oO][cC][eE][sS][sS]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlGroupTemplateDeclaration] = tsSeq[K](tsRegex[K]("[gG][rR][oO][uU][pP]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsString[K]("("), tsSymbol[K](vhdlEntityClassEntryList), tsString[K](")"), tsString[K](";"))
                                                                 rules[vhdlArchitectureBody] = tsSeq[K](tsRegex[K]("[aA][rR][cC][hH][iI][tT][eE][cC][tT][uU][rR][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlHidEntityName), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlConcurrentStatementPart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[aA][rR][cC][hH][iI][tT][eE][cC][tT][uU][rR][eE]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"]"), tsSymbol[K](vhdlEscapeSequence))), tsString[K]("\""))
                                                                 rules[vhdlHidPredefinedDesignator] = tsChoice[K](tsRegex[K]("[bB][aA][sS][eE]"), tsRegex[K]("[lL][eE][fF][tT]"), tsRegex[K]("[rR][iI][gG][hH][tT]"), tsRegex[K]("[hH][iI][gG][hH]"), tsRegex[K]("[lL][oO][wW]"), tsRegex[K]("[iI][mM][aA][gG][eE]"), tsRegex[K]("[pP][oO][sS]"), tsRegex[K]("[vV][aA][lL]"), tsRegex[K]("[sS][uU][cC][cC]"), tsRegex[K]("[pP][rR][eE][dD]"), tsRegex[K]("[lL][eE][fF][tT][oO][fF]"), tsRegex[K]("[rR][iI][gG][hH][tT][oO][fF]"), tsRegex[K]("[sS][uU][bB][tT][yY][pP][eE]"), tsRegex[K]("[lL][eE][nN][gG][tT][hH]"), tsRegex[K]("[aA][sS][cC][eE][nN][dD][iI][nN][gG]"), tsRegex[K]("[dD][eE][sS][cC][eE][nN][dD][iI][nN][gG]"), tsRegex[K]("[eE][lL][eE][mM][eE][nN][tT]"), tsRegex[K]("[dD][eE][lL][aA][yY][eE][dD]"), tsRegex[K]("[sS][tT][aA][bB][lL][eE]"), tsRegex[K]("[qQ][uU][iI][eE][tT]"), tsRegex[K]("[tT][rR][aA][nN][sS][aA][cC][tT][iI][oO][nN]"), tsRegex[K]("[eE][vV][eE][nN][tT]"), tsRegex[K]("[aA][cC][tT][iI][vV][eE]"), tsRegex[K]("[lL][aA][sS][tT][__][eE][vV][eE][nN][tT]"), tsRegex[K]("[lL][aA][sS][tT][__][aA][cC][tT][iI][vV][eE]"), tsRegex[K]("[lL][aA][sS][tT][__][vV][aA][lL][uU][eE]"), tsRegex[K]("[dD][rR][iI][vV][iI][nN][gG]"), tsRegex[K]("[dD][rR][iI][vV][iI][nN][gG][__][vV][aA][lL][uU][eE]"), tsRegex[K]("[sS][iI][mM][pP][lL][eE][__][nN][aA][mM][eE]"), tsRegex[K]("[iI][nN][sS][tT][aA][nN][cC][eE][__][nN][aA][mM][eE]"), tsRegex[K]("[pP][aA][tT][hH][__][nN][aA][mM][eE]"))
                                                                 rules[vhdlReportStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidReport), tsChoice[K](tsSymbol[K](vhdlHidSeverity), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidProcedureParameterList] = tsSeq[K](tsSeq[K](tsSymbol[K](vhdlHidProcedureInterfaceDeclaration), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlHidProcedureInterfaceDeclaration)))))
                                                                 rules[vhdlChoices] = tsSeq[K](tsSymbol[K](vhdlHidChoice), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](vhdlHidChoice))))
                                                                 rules[vhdlPSLVUNit] = tsSeq[K](tsRegex[K]("[vV][uU][nN][iI][tT]"), tsSymbol[K](vhdlHidPSLIdentifier), tsSymbol[K](vhdlPSLVerificationUnitBody))
                                                                 rules[vhdlHidInout] = tsRegex[K]("[iI][nN][oO][uU][tT]")
                                                                 rules[vhdlSliceName] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlSliceName), tsSymbol[K](vhdlFunctionCall)), tsString[K]("("), tsSymbol[K](vhdlHidRange), tsString[K](")"))
                                                                 rules[vhdlBase6] = tsChoice[K](tsSeq[K](tsString[K]("6")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("6")))
                                                                 rules[vhdlDesignUnit] = tsChoice[K](tsSymbol[K](vhdlContextClause), tsSeq[K](tsChoice[K](tsSymbol[K](vhdlContextClause), tsBlank[K]()), tsSymbol[K](vhdlHidLibraryUnit)))
                                                                 rules[vhdlBase4] = tsChoice[K](tsSeq[K](tsString[K]("4")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("4")))
                                                                 rules[vhdlInertialExpression] = tsSeq[K](tsRegex[K]("[iI][nN][eE][rR][tT][iI][aA][lL]"), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlPSLRestrictGuaranteeDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[rR][eE][sS][tT][rR][iI][cC][tT][__][gG][uU][aA][rR][aA][nN][tT][eE][eE]"), tsSymbol[K](vhdlHidPSLSequence), tsChoice[K](tsSymbol[K](vhdlHidReport), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidSimpleSignalAssignment] = tsChoice[K](tsSymbol[K](vhdlSimpleWaveformAssignment), tsSymbol[K](vhdlSimpleForceAssignment), tsSymbol[K](vhdlSimpleReleaseAssignment))
                                                                 rules[vhdlSignalInterfaceDeclaration] = tsSeq[K](tsChoice[K](tsRegex[K]("[sS][iI][gG][nN][aA][lL]"), tsBlank[K]()), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsChoice[K](tsSymbol[K](vhdlHidSignalMode), tsBlank[K]()), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlSignalKind), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()))
                                                                 rules[vhdlPSLParameterizedProperty] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlPSLParametersDefinition), tsString[K](":"), tsChoice[K](tsRegex[K]("[aA][nN][dD]"), tsRegex[K]("[oO][rR]")), tsString[K]("("), tsSymbol[K](vhdlHidPSLFLProperty), tsString[K](")"))
                                                                 rules[vhdlHidDiscreteRange] = tsChoice[K](tsSymbol[K](vhdlSubtypeIndication), tsSymbol[K](vhdlHidRange))
                                                                 rules[vhdlRecordTypeDefinition] = tsSeq[K](tsRegex[K]("[rR][eE][cC][oO][rR][dD]"), tsRepeat[K](tsSymbol[K](vhdlElementDeclaration)), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[rR][eE][cC][oO][rR][dD]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()))
                                                                 rules[vhdlDesignFile] = tsRepeat[K](tsChoice[K](tsSymbol[K](vhdlHidDeclaration), tsSymbol[K](vhdlHidSequentialStatement), tsSymbol[K](vhdlHidConcurrentStatement), tsSymbol[K](vhdlDesignUnit)))
                                                                 rules[vhdlRangeConstraint] = tsSeq[K](tsRegex[K]("[rR][aA][nN][gG][eE]"), tsSymbol[K](vhdlHidRange))
                                                                 rules[vhdlHidGenerateStatement] = tsChoice[K](tsSymbol[K](vhdlForGenerateStatement), tsSymbol[K](vhdlIfGenerateStatement), tsSymbol[K](vhdlCaseGenerateStatement))
                                                                 rules[vhdlEscapeSequence] = tsString[K]("\"\"")
                                                                 rules[vhdlHidPSLIdentifier] = tsSymbol[K](vhdlHidIdentifier)
                                                                 rules[vhdlExpressionList] = tsSeq[K](tsSymbol[K](vhdlHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidExpression))))
                                                                 rules[vhdlHidTimeExpression] = tsSymbol[K](vhdlHidExpr)
                                                                 rules[vhdlEntityClassEntryList] = tsSeq[K](tsSymbol[K](vhdlEntityClassEntry), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlEntityClassEntry))))
                                                                 rules[vhdlGenericMapAspect] = tsSeq[K](tsRegex[K]("[gG][eE][nN][eE][rR][iI][cC]"), tsRegex[K]("[mM][aA][pP]"), tsString[K]("("), tsChoice[K](tsChoice[K](tsSymbol[K](vhdlAssociationList), tsSymbol[K](vhdlDefault), tsSymbol[K](vhdlHidAny)), tsBlank[K]()), tsString[K](")"), tsChoice[K](tsSymbol[K](vhdlHidSemicolon), tsBlank[K]()))
                                                                 rules[vhdlHidReject] = tsSeq[K](tsRegex[K]("[rR][eE][jJ][eE][cC][tT]"), tsSymbol[K](vhdlHidTimeExpression))
                                                                 rules[vhdlPSLCount] = tsSeq[K](tsString[K]("["), tsChoice[K](tsChoice[K](tsString[K]("+"), tsString[K]("*"), tsString[K]("="), tsString[K]("->")), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](vhdlHidPSLNumber), tsSymbol[K](vhdlHidPSLRange)), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[vhdlPSLOcurrenceFLProperty] = tsSeq[K](tsSeq[K](tsChoice[K](tsRegex[K]("[nN][eE][xX][tT]"), tsRegex[K]("[eE][vV][eE][nN][tT][uU][aA][lL][lL][yY]")), tsChoice[K](tsString[K]("!"), tsBlank[K]())), tsSymbol[K](vhdlHidPSLFLProperty))
                                                                 rules[vhdlPSLVPRop] = tsSeq[K](tsRegex[K]("[vV][pP][rR][oO][pP]"), tsSymbol[K](vhdlHidPSLIdentifier), tsSymbol[K](vhdlPSLVerificationUnitBody))
                                                                 rules[vhdlHidTimeoutClause] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlHidTimeExpression))
                                                                 rules[vhdlPSLImplicationFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLFLProperty), tsRepeat1[K](tsSeq[K](tsChoice[K](tsString[K]("->"), tsString[K]("<->")), tsSymbol[K](vhdlHidPSLFLProperty))))
                                                                 rules[vhdlIntegerDecimal] = tsSeq[K](tsSymbol[K](vhdlInteger), tsChoice[K](tsSymbol[K](vhdlExponent), tsBlank[K]()))
                                                                 rules[vhdlPSLParameterSpecification] = tsSeq[K](tsSymbol[K](vhdlHidPSLIdentifier), tsChoice[K](tsSymbol[K](vhdlPSLIndexRange), tsBlank[K]()), tsRegex[K]("[iI][nN]"), tsSymbol[K](vhdlPSLValueSet))
                                                                 rules[vhdlInertial] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidReject), tsBlank[K]()), tsRegex[K]("[iI][nN][eE][rR][tT][iI][aA][lL]"))
                                                                 rules[vhdlPSLCompoundSEREWithin] = tsSeq[K](tsSymbol[K](vhdlHidPSLCompoundSERE), tsRepeat1[K](tsSeq[K](tsRegex[K]("[wW][iI][tT][hH][iI][nN]"), tsSymbol[K](vhdlHidPSLCompoundSERE))))
                                                                 rules[vhdlHidIn] = tsRegex[K]("[iI][nN]")
                                                                 rules[vhdlAlternativeSelectedExpressions] = tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidValue), tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlChoices))
                                                                 rules[vhdlHidSeparator] = tsChoice[K](tsString[K]("\x09"), tsString[K]("\x0B"), tsString[K]("\x0D"), tsString[K]("\x0A"), tsString[K]("\x0C"), tsString[K](" "), tsString[K](" "))
                                                                 rules[vhdlArrayConstraint] = tsSeq[K](tsSymbol[K](vhdlIndexConstraint), tsChoice[K](tsSymbol[K](vhdlHidArrayElementConstraint), tsBlank[K]()))
                                                                 rules[vhdlHidAny] = tsString[K]("<>")
                                                                 rules[vhdlHidPSLPropertyInstance] = tsSymbol[K](vhdlPSLInstance)
                                                                 rules[vhdlPSLBracedSERE] = tsSeq[K](tsString[K]("{"), tsSymbol[K](vhdlHidPSLSERE), tsString[K]("}"))
                                                                 rules[vhdlHidObjectDeclaration] = tsChoice[K](tsSymbol[K](vhdlConstantDeclaration), tsSymbol[K](vhdlSignalDeclaration), tsSymbol[K](vhdlVariableDeclaration), tsSymbol[K](vhdlSharedVariableDeclaration), tsSymbol[K](vhdlFileDeclaration))
                                                                 rules[vhdlBase12] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("2")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("2")))
                                                                 rules[vhdlPSLParametersDefinition] = tsSeq[K](tsSymbol[K](vhdlPSLParameterSpecification), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlPSLParameterSpecification))))
                                                                 rules[vhdlPSLCompoundSEREOr] = tsSeq[K](tsSymbol[K](vhdlHidPSLCompoundSERE), tsRepeat1[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](vhdlHidPSLCompoundSERE))))
                                                                 rules[vhdlHidExternalPathname] = tsChoice[K](tsSymbol[K](vhdlPackagePathname), tsSymbol[K](vhdlAbsolutePathname), tsSymbol[K](vhdlRelativePathname))
                                                                 rules[vhdlShiftExpression] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsChoice[K](tsRegex[K]("[sS][lL][lL]"), tsRegex[K]("[sS][rR][lL]"), tsRegex[K]("[sS][lL][aA]"), tsRegex[K]("[sS][rR][aA]"), tsRegex[K]("[rR][oO][lL]"), tsRegex[K]("[rR][oO][rR]")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlHidPSLRange] = tsSymbol[K](vhdlHidRange)
                                                                 rules[vhdlHidSelectedSignalAssignment] = tsChoice[K](tsSymbol[K](vhdlSelectedWaveformAssignment), tsSymbol[K](vhdlSelectedForceAssignment))
                                                                 rules[vhdlExtendedDigitBase13] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-cA-C]"), tsRegex[K]("[^0-9a-cA-C#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-cA-C]"), tsRegex[K]("[^0-9a-cA-C#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlElse] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()))
                                                                 rules[vhdlNamedElementAssociation] = tsSeq[K](tsSymbol[K](vhdlChoices), tsString[K]("=>"), tsSymbol[K](vhdlHidValue))
                                                                 rules[vhdlConfigurationDeclaration] = tsSeq[K](tsRegex[K]("[cC][oO][nN][fF][iI][gG][uU][rR][aA][tT][iI][oO][nN]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlHidEntityName), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRepeat[K](tsSymbol[K](vhdlVerificationUnitBindingIndication)), tsChoice[K](tsSymbol[K](vhdlBlockConfiguration), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[cC][oO][nN][fF][iI][gG][uU][rR][aA][tT][iI][oO][nN]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlPSLClockDeclaration] = tsSeq[K](tsRegex[K]("[dD][eE][fF][aA][uU][lL][tT]"), tsRegex[K]("[cC][lL][oO][cC][kK]"), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidPSLClockExpression), tsString[K](";"))
                                                                 rules[vhdlHidPSLBoolean] = tsChoice[K](tsSymbol[K](vhdlHidExpr), tsSymbol[K](vhdlPSLExpression), tsSymbol[K](vhdlPSLBuiltInFunctionCall))
                                                                 rules[vhdlIdentifierList] = tsSeq[K](tsSymbol[K](vhdlHidIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidIdentifier))))
                                                                 rules[vhdlHidNumericLiteral] = tsChoice[K](tsSymbol[K](vhdlHidAbstractLiteral), tsSymbol[K](vhdlPhysicalLiteral))
                                                                 rules[vhdlNextStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[nN][eE][xX][tT]"), tsChoice[K](tsSymbol[K](vhdlHidLoopLabel), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidWhenClause), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlEntityClass] = tsChoice[K](tsRegex[K]("[eE][nN][tT][iI][tT][yY]"), tsRegex[K]("[aA][rR][cC][hH][iI][tT][eE][cC][tT][uU][rR][eE]"), tsRegex[K]("[cC][oO][nN][fF][iI][gG][uU][rR][aA][tT][iI][oO][nN]"), tsRegex[K]("[pP][rR][oO][cC][eE][dD][uU][rR][eE]"), tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsRegex[K]("[tT][yY][pP][eE]"), tsRegex[K]("[sS][uU][bB][tT][yY][pP][eE]"), tsRegex[K]("[cC][oO][nN][sS][tT][aA][nN][tT]"), tsRegex[K]("[sS][iI][gG][nN][aA][lL]"), tsRegex[K]("[vV][aA][rR][iI][aA][bB][lL][eE]"), tsRegex[K]("[cC][oO][mM][pP][oO][nN][eE][nN][tT]"), tsRegex[K]("[lL][aA][bB][eE][lL]"), tsRegex[K]("[lL][iI][tT][eE][rR][aA][lL]"), tsRegex[K]("[uU][nN][iI][tT][sS]"), tsRegex[K]("[gG][rR][oO][uU][pP]"), tsRegex[K]("[fF][iI][lL][eE]"), tsRegex[K]("[pP][rR][oO][pP][eE][rR][tT][yY]"), tsRegex[K]("[sS][eE][qQ][uU][eE][nN][cC][eE]"))
                                                                 rules[vhdlBase14] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("4")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("4")))
                                                                 rules[vhdlInstantiationList] = tsChoice[K](tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidSimpleName)))), tsSymbol[K](vhdlOthers), tsSymbol[K](vhdlAll))
                                                                 rules[vhdlFunctionBody] = tsSeq[K](tsSymbol[K](vhdlHidFunctionSpecification), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsSymbol[K](vhdlHidSubprogramKind), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndDesignator), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidAssociationElement] = tsChoice[K](tsSymbol[K](vhdlPositionalAssociationElement), tsSymbol[K](vhdlNamedAssociationElement))
                                                                 rules[vhdlHidPSLCompoundSERE] = tsChoice[K](tsSymbol[K](vhdlPSLRepeatedSERE), tsSymbol[K](vhdlPSLBracedSERE), tsSymbol[K](vhdlPSLClockedSERE), tsChoice[K](tsSymbol[K](vhdlPSLCompoundSEREOr), tsSymbol[K](vhdlPSLCompoundSEREAnd), tsSymbol[K](vhdlPSLCompoundSEREWithin)), tsSymbol[K](vhdlPSLParameterizedSERE))
                                                                 rules[vhdlGenerateStatementBody] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsRepeat[K](tsSymbol[K](vhdlHidConcurrentStatement)), tsChoice[K](tsSeq[K](tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";")), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]")), tsBlank[K]()), tsRepeat[K](tsSymbol[K](vhdlHidConcurrentStatement)), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";")), tsRepeat1[K](tsSymbol[K](vhdlHidConcurrentStatement)))
                                                                 rules[vhdlPackageBody] = tsSeq[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsRegex[K]("[bB][oO][dD][yY]"), tsSymbol[K](vhdlHidPackageName), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsSeq[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsRegex[K]("[bB][oO][dD][yY]")), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidFileOpenKind] = tsSymbol[K](vhdlHidPrimary)
                                                                 rules[vhdlPSLInheritSpec] = tsSeq[K](tsRegex[K]("[iI][nN][hH][eE][rR][iI][tT]"), tsSeq[K](tsSymbol[K](vhdlHidName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidName)))), tsString[K](";"))
                                                                 rules[vhdlHidExpression] = tsSymbol[K](vhdlHidExpr)
                                                                 rules[vhdlHidEndDesignator] = tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsSymbol[K](vhdlHidOperatorSymbol))
                                                                 rules[vhdlHidExternalObjectName] = tsChoice[K](tsSymbol[K](vhdlExternalConstantName), tsSymbol[K](vhdlExternalSignalName), tsSymbol[K](vhdlExternalVariableName))
                                                                 rules[vhdlHidOctalBitValue] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-7]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare), tsSymbol[K](vhdlSeparator)), tsRepeat[K](tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlSeparator), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-7]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare)))))
                                                                 rules[vhdlPSLCompoundSEREAnd] = tsSeq[K](tsSymbol[K](vhdlHidPSLCompoundSERE), tsRepeat1[K](tsSeq[K](tsChoice[K](tsString[K]("&"), tsString[K]("&&")), tsSymbol[K](vhdlHidPSLCompoundSERE))))
                                                                 rules[vhdlFunctionParameterClause] = tsSeq[K](tsChoice[K](tsRegex[K]("[pP][aA][rR][aA][mM][eE][tT][eE][rR]"), tsBlank[K]()), tsString[K]("("), tsChoice[K](tsSymbol[K](vhdlHidFunctionParameterList), tsBlank[K]()), tsString[K](")"))
                                                                 rules[vhdlExtendedDigitBase3] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-2]"), tsRegex[K]("[^0-2#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-2]"), tsRegex[K]("[^0-2#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlTerm] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsChoice[K](tsRepeat1[K](tsSeq[K](tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsRegex[K]("[rR][eE][mM]"), tsRegex[K]("[mM][oO][dD]")), tsSymbol[K](vhdlHidExpr)))))
                                                                 rules[vhdlSelectedWaveforms] = tsSeq[K](tsSymbol[K](vhdlWaveforms), tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlChoices), tsRepeat[K](tsSymbol[K](vhdlAlternativeSelectedWaveforms)))
                                                                 rules[vhdlUnboundedArrayDefinition] = tsSeq[K](tsRegex[K]("[aA][rR][rR][aA][yY]"), tsString[K]("("), tsSeq[K](tsSymbol[K](vhdlIndexSubtypeDefinition), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlIndexSubtypeDefinition)))), tsString[K](")"), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlSubtypeIndication))
                                                                 rules[vhdlPSLParenthesizedBoolean] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidPSLBoolean), tsString[K](")"))
                                                                 rules[vhdlHidPSLAnyType] = tsChoice[K](tsSymbol[K](vhdlHidExpr), tsSymbol[K](vhdlPSLExpression), tsSymbol[K](vhdlPSLBuiltInFunctionCall), tsSymbol[K](vhdlPSLUnionExpression))
                                                                 rules[vhdlAttributeSpecification] = tsSeq[K](tsRegex[K]("[aA][tT][tT][rR][iI][bB][uU][tT][eE]"), tsSymbol[K](vhdlHidSimpleName), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlEntitySpecification), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidExpression), tsString[K](";"))
                                                                 rules[vhdlHidPSLConcatSERE] = tsSeq[K](tsSymbol[K](vhdlHidPSLSERE), tsRepeat1[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlHidPSLSERE))))
                                                                 rules[vhdlDelayMechanism] = tsChoice[K](tsSymbol[K](vhdlTransport), tsSymbol[K](vhdlInertial))
                                                                 rules[vhdlDefaultExpression] = tsSeq[K](tsString[K](":="), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlPSLSequenceDeclaration] = tsSeq[K](tsRegex[K]("[sS][eE][qQ][uU][eE][nN][cC][eE]"), tsSymbol[K](vhdlHidPSLIdentifier), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlPSLFormalParameterList), tsString[K](")")), tsBlank[K]()), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidPSLSequence), tsString[K](";"))
                                                                 rules[vhdlIfGenerateStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlIfGenerate), tsRepeat[K](tsSymbol[K](vhdlElsifGenerate)), tsChoice[K](tsSymbol[K](vhdlElseGenerate), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidPSLClockExpression] = tsChoice[K](tsSymbol[K](vhdlHidCondition), tsSymbol[K](vhdlPSLBuiltInFunctionCall))
                                                                 rules[vhdlPSLHierarchicalHDLName] = tsSeq[K](tsSymbol[K](vhdlHidPSLHDLModuleNAME), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K]("."), tsString[K]("/")), tsSymbol[K](vhdlHidSimpleName))))
                                                                 rules[vhdlPackageDeclaration] = tsSeq[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlExtendedDigitBase6] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-5]"), tsRegex[K]("[^0-5#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-5]"), tsRegex[K]("[^0-5#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlHidConditionalSignalAssignment] = tsChoice[K](tsSymbol[K](vhdlConditionalWaveformAssignment), tsSymbol[K](vhdlConditionalForceAssignment))
                                                                 rules[vhdlIndexSubtypeDefinition] = tsSeq[K](tsSymbol[K](vhdlTypeMark), tsRegex[K]("[rR][aA][nN][gG][eE]"), tsSymbol[K](vhdlHidAny))
                                                                 rules[vhdlProtectedTypeDeclaration] = tsSeq[K](tsRegex[K]("[pP][rR][oO][tT][eE][cC][tT][eE][dD]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[pP][rR][oO][tT][eE][cC][tT][eE][dD]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()))
                                                                 rules[vhdlPSLAssumeDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[aA][sS][sS][uU][mM][eE]"), tsSymbol[K](vhdlHidPSLProperty), tsString[K](";"))
                                                                 rules[vhdlHidPSLFusionSERE] = tsSeq[K](tsSymbol[K](vhdlHidPSLSERE), tsRepeat1[K](tsSeq[K](tsString[K](":"), tsSymbol[K](vhdlHidPSLSERE))))
                                                                 rules[vhdlPSLTypeClass] = tsChoice[K](tsRegex[K]("[bB][oO][oO][lL][eE][aA][nN]"), tsRegex[K]("[bB][iI][tT]"), tsRegex[K]("[bB][iI][tT][__][vV][eE][cC][tT][oO][rR]"), tsRegex[K]("[nN][uU][mM][eE][rR][iI][cC]"), tsRegex[K]("[sS][tT][rR][iI][nN][gG]"))
                                                                 rules[vhdlHidIntegerImmed] = tsSeq[K](tsSymbol[K](vhdlHidDigitImmed), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsSymbol[K](vhdlHidDigitImmed))))
                                                                 rules[vhdlEntityInstantiation] = tsSeq[K](tsRegex[K]("[eE][nN][tT][iI][tT][yY]"), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidSimpleName), tsString[K](")")), tsBlank[K]()))
                                                                 rules[vhdlHidRange] = tsChoice[K](tsSymbol[K](vhdlAscendingRange), tsSymbol[K](vhdlDescendingRange), tsSymbol[K](vhdlHidRangeAttributeName))
                                                                 rules[vhdlFileInterfaceDeclaration] = tsSeq[K](tsRegex[K]("[fF][iI][lL][eE]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsChoice[K](tsSymbol[K](vhdlHidSignalMode), tsBlank[K]()), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()))
                                                                 rules[vhdlHidSignalName] = tsSymbol[K](vhdlHidName)
                                                                 rules[vhdlPSLFormalParameterList] = tsSeq[K](tsSymbol[K](vhdlPSLFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlPSLFormalParameter))))
                                                                 rules[vhdlBindingIndication] = tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsSymbol[K](vhdlHidEntityAspect)), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlAscendingRange] = tsSeq[K](tsSymbol[K](vhdlHidSimpleExpression), tsRegex[K]("[tT][oO]"), tsSymbol[K](vhdlHidSimpleExpression))
                                                                 rules[vhdlProcedureParameterClause] = tsSeq[K](tsChoice[K](tsRegex[K]("[pP][aA][rR][aA][mM][eE][tT][eE][rR]"), tsBlank[K]()), tsString[K]("("), tsChoice[K](tsSymbol[K](vhdlHidProcedureParameterList), tsBlank[K]()), tsString[K](")"))
                                                                 rules[vhdlSelectedForceAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[wW][iI][tT][hH]"), tsSymbol[K](vhdlHidExpression), tsRegex[K]("[sS][eE][lL][eE][cC][tT]"), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsRegex[K]("[fF][oO][rR][cC][eE]"), tsChoice[K](tsSymbol[K](vhdlForceMode), tsBlank[K]()), tsSymbol[K](vhdlSelectedExpressions), tsString[K](";"))
                                                                 rules[vhdlHidIterationScheme] = tsChoice[K](tsSymbol[K](vhdlWhileLoop), tsSymbol[K](vhdlForLoop))
                                                                 rules[vhdlExtendedDigitBase2] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-1]"), tsRegex[K]("[^0-1#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-1]"), tsRegex[K]("[^0-1#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlSignalList] = tsChoice[K](tsSeq[K](tsSymbol[K](vhdlHidSignalName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidSignalName)))), tsSymbol[K](vhdlOthers), tsSymbol[K](vhdlAll))
                                                                 rules[vhdlVerificationUnitList] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)))))
                                                                 rules[vhdlHidPSLAmbiguousInstance] = tsSeq[K](tsSymbol[K](vhdlPSLInstance))
                                                                 rules[vhdlHidSimpleName] = tsChoice[K](tsSymbol[K](vhdlBasicIdentifier), tsSymbol[K](vhdlExtendedIdentifier))
                                                                 rules[vhdlSignalKind] = tsChoice[K](tsRegex[K]("[rR][eE][gG][iI][sS][tT][eE][rR]"), tsRegex[K]("[bB][uU][sS]"))
                                                                 rules[vhdlWhileLoop] = tsSeq[K](tsRegex[K]("[wW][hH][iI][lL][eE]"), tsSymbol[K](vhdlHidCondition))
                                                                 rules[vhdlExponentiation] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsChoice[K](tsString[K]("**")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlHidDigitImmed] = tsChoice[K](tsString[K]("0"), tsString[K]("1"), tsString[K]("2"), tsString[K]("3"), tsString[K]("4"), tsString[K]("5"), tsString[K]("6"), tsString[K]("7"), tsString[K]("8"), tsString[K]("9"))
                                                                 rules[vhdlHidLiteral] = tsChoice[K](tsSymbol[K](vhdlHidNumericLiteral), tsSymbol[K](vhdlStringLiteral), tsSymbol[K](vhdlBitStringLiteral), tsSymbol[K](vhdlNull), tsSymbol[K](vhdlCharacterLiteral))
                                                                 rules[vhdlFunctionDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidFunctionSpecification), tsString[K](";"))
                                                                 rules[vhdlGuardedSignalSpecification] = tsSeq[K](tsSymbol[K](vhdlSignalList), tsString[K](":"), tsSymbol[K](vhdlTypeMark))
                                                                 rules[vhdlExternalSignalName] = tsSeq[K](tsString[K]("<<"), tsRegex[K]("[sS][iI][gG][nN][aA][lL]"), tsSymbol[K](vhdlHidExternalPathname), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsString[K](">>"))
                                                                 rules[vhdlQualifiedExpression] = tsSeq[K](tsSymbol[K](vhdlTypeMark), tsString[K]("\'"), tsChoice[K](tsSymbol[K](vhdlAggregate), tsSymbol[K](vhdlParenthesizedExpression)))
                                                                 rules[vhdlExtendedDigitBase15] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-eA-E]"), tsRegex[K]("[^0-9a-eA-E#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-eA-E]"), tsRegex[K]("[^0-9a-eA-E#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlRelation] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsChoice[K](tsString[K]("<"), tsString[K](">"), tsString[K]("="), tsString[K]("<="), tsString[K](">="), tsString[K]("/="), tsString[K]("?<"), tsString[K]("?>"), tsString[K]("?="), tsString[K]("?<="), tsString[K]("?>="), tsString[K]("?/="), tsString[K]("=="), tsString[K]("!=")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlPSLRepeatedSERE] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](vhdlHidPSLBoolean), tsSymbol[K](vhdlHidPSLSequence)), tsBlank[K]()), tsSymbol[K](vhdlPSLCount))
                                                                 rules[vhdlNull] = tsRegex[K]("[nN][uU][lL][lL]")
                                                                 rules[vhdlHidPSLExtendedOcurrenceFLPropertyUntilSpecification] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidPSLBoolean), tsString[K](")"), tsChoice[K](tsSymbol[K](vhdlPSLCount), tsBlank[K]()))
                                                                 rules[vhdlProtectedTypeBody] = tsSeq[K](tsRegex[K]("[pP][rR][oO][tT][eE][cC][tT][eE][dD]"), tsRegex[K]("[bB][oO][dD][yY]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[pP][rR][oO][tT][eE][cC][tT][eE][dD]"), tsRegex[K]("[bB][oO][dD][yY]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()))
                                                                 rules[vhdlHidSecondaryUnit] = tsChoice[K](tsSymbol[K](vhdlArchitectureBody), tsSymbol[K](vhdlPackageBody))
                                                                 rules[vhdlHidPredefinedAttributeDesignator] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](vhdlHidPredefinedDesignator))
                                                                 rules[vhdlSelectedWaveformAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[wW][iI][tT][hH]"), tsSymbol[K](vhdlHidExpression), tsRegex[K]("[sS][eE][lL][eE][cC][tT]"), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsChoice[K](tsRegex[K]("[gG][uU][aA][rR][dD][eE][dD]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDelayMechanism), tsBlank[K]()), tsSymbol[K](vhdlSelectedWaveforms), tsString[K](";"))
                                                                 rules[vhdlHidDesignator] = tsChoice[K](tsSymbol[K](vhdlHidIdentifier), tsSymbol[K](vhdlHidOperatorSymbol))
                                                                 rules[vhdlWaitStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[wW][aA][iI][tT]"), tsChoice[K](tsSymbol[K](vhdlHidSensitivityClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidConditionClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidTimeoutClause), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlExtendedDigitBase14] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-dA-D]"), tsRegex[K]("[^0-9a-dA-D#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-dA-D]"), tsRegex[K]("[^0-9a-dA-D#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlHidPSLVerificationUnit] = tsChoice[K](tsSymbol[K](vhdlPSLVUNit), tsSymbol[K](vhdlPSLVPRop), tsSymbol[K](vhdlPSLVMOde))
                                                                 rules[vhdlIf] = tsSeq[K](tsRegex[K]("[iI][fF]"), tsSymbol[K](vhdlHidCondition), tsRegex[K]("[tT][hH][eE][nN]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()))
                                                                 rules[vhdlHidFunctionName] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlHidOperatorSymbol), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAttributeName))
                                                                 rules[vhdlRecordElementResolution] = tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlHidResolutionIndication))
                                                                 rules[vhdlLibraryClause] = tsSeq[K](tsRegex[K]("[lL][iI][bB][rR][aA][rR][yY]"), tsSymbol[K](vhdlLogicalNameList), tsString[K](";"))
                                                                 rules[vhdlHidHexadecimalBitValue] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-fA-F]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare), tsSymbol[K](vhdlSeparator)), tsRepeat[K](tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlSeparator), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-fA-F]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare)))))
                                                                 rules[vhdlHidPSLProperty] = tsChoice[K](tsSymbol[K](vhdlPSLPropertyReplicator), tsSymbol[K](vhdlHidPSLFLProperty), tsSymbol[K](vhdlHidPSLAmbiguousInstance))
                                                                 rules[vhdlPSLInstance] = tsSeq[K](tsSymbol[K](vhdlHidPSLIdentifier), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlPSLActualParameterList), tsString[K](")")), tsBlank[K]()))
                                                                 rules[vhdlBoolean] = tsRegex[K]("[bB][oO][oO][lL][eE][aA][nN]")
                                                                 rules[vhdlUseClause] = tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsSeq[K](tsSymbol[K](vhdlSelectedName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlSelectedName)))), tsString[K](";"))
                                                                 rules[vhdlHidPSLFLProperty] = tsChoice[K](tsSymbol[K](vhdlHidPSLPropertyInstance), tsSymbol[K](vhdlPSLParenthesizedFLProperty), tsSymbol[K](vhdlPSLSequentialFLProperty), tsSymbol[K](vhdlPSLClockedFLProperty), tsSymbol[K](vhdlPSLInvariantFLProperty), tsSymbol[K](vhdlPSLOcurrenceFLProperty), tsSymbol[K](vhdlPSLExtendedOcurrenceFLProperty), tsSymbol[K](vhdlPSLTerminationFLProperty), tsSymbol[K](vhdlPSLBoundingFLProperty), tsSymbol[K](vhdlPSLSuffixImplicationFLProperty), tsSymbol[K](vhdlPSLParameterizedProperty), tsSymbol[K](vhdlPSLImplicationFLProperty), tsSymbol[K](vhdlPSLLogicalFLProperty), tsSymbol[K](vhdlPSLFactorFLProperty), tsSymbol[K](vhdlHidPSLBoolean))
                                                                 rules[vhdlPSLTerminationFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLFLProperty), tsChoice[K](tsRegex[K]("[aA][sS][yY][nN][cC][__][aA][bB][oO][rR][tT]"), tsRegex[K]("[sS][yY][nN][cC][__][aA][bB][oO][rR][tT]"), tsRegex[K]("[aA][bB][oO][rR][tT]")), tsSymbol[K](vhdlHidPSLBoolean))
                                                                 rules[vhdlPSLIndexRange] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidPSLRange), tsString[K](")"))
                                                                 rules[vhdlHidResolutionIndication] = tsChoice[K](tsSymbol[K](vhdlResolutionFunction), tsSymbol[K](vhdlRecordResolution), tsSymbol[K](vhdlParenthesizedResolution))
                                                                 rules[vhdlEntityDeclaration] = tsSeq[K](tsRegex[K]("[eE][nN][tT][iI][tT][yY]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlConcurrentStatementPart), tsBlank[K]())), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsRegex[K]("[eE][nN][tT][iI][tT][yY]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlCaseStatementAlternative] = tsSeq[K](tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlChoices), tsString[K]("=>"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()))
                                                                 rules[vhdlIfStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlIf), tsRepeat[K](tsSymbol[K](vhdlElsif)), tsChoice[K](tsSymbol[K](vhdlElse), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[iI][fF]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidSemicolon] = tsString[K](";")
                                                                 rules[vhdlOpen] = tsRegex[K]("[oO][pP][eE][nN]")
                                                                 rules[vhdlAggregate] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidElementAssociationList), tsString[K](")"))
                                                                 rules[vhdlHidConstantMode] = tsChoice[K](tsSymbol[K](vhdlHidIn), tsSymbol[K](vhdlHidOut), tsSymbol[K](vhdlHidInout), tsSymbol[K](vhdlHidBuffer), tsSymbol[K](vhdlHidLinkage))
                                                                 rules[vhdlHidPSLVUNitItem] = tsChoice[K](tsSymbol[K](vhdlHidDeclaration), tsSymbol[K](vhdlHidConcurrentStatement))
                                                                 rules[vhdlPSLAssumeGuaranteeDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[aA][sS][sS][uU][mM][eE][__][gG][uU][aA][rR][aA][nN][tT][eE][eE]"), tsSymbol[K](vhdlHidPSLProperty), tsChoice[K](tsSymbol[K](vhdlHidReport), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlPackageInstantiationDeclaration] = tsSeq[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsRegex[K]("[nN][eE][wW]"), tsSymbol[K](vhdlHidUninstantiatedName), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlConfigurationInstantiation] = tsSeq[K](tsRegex[K]("[cC][oO][nN][fF][iI][gG][uU][rR][aA][tT][iI][oO][nN]"), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)))
                                                                 rules[vhdlLogicalNameList] = tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidSimpleName))))
                                                                 rules[vhdlBlockConfiguration] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlHidBlockSpecification), tsRepeat[K](tsSymbol[K](vhdlUseClause)), tsRepeat[K](tsSymbol[K](vhdlHidConfigurationItem)), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[fF][oO][rR]"), tsString[K](";"))
                                                                 rules[vhdlHidTypeDefinition] = tsChoice[K](tsSymbol[K](vhdlHidScalarTypeDefinition), tsSymbol[K](vhdlHidCompositeTypeDefinition), tsSymbol[K](vhdlAccessTypeDefinition), tsSymbol[K](vhdlFileTypeDefinition), tsSymbol[K](vhdlProtectedTypeDeclaration), tsSymbol[K](vhdlProtectedTypeBody))
                                                                 rules[vhdlSequenceOfStatements] = tsRepeat1[K](tsSymbol[K](vhdlHidSequentialStatement))
                                                                 rules[vhdlExternalVariableName] = tsSeq[K](tsString[K]("<<"), tsRegex[K]("[vV][aA][rR][iI][aA][bB][lL][eE]"), tsSymbol[K](vhdlHidExternalPathname), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsString[K](">>"))
                                                                 rules[vhdlHidBinaryExpression] = tsChoice[K](tsSymbol[K](vhdlLogicalExpression), tsSymbol[K](vhdlRelation), tsSymbol[K](vhdlShiftExpression), tsSymbol[K](vhdlSimpleExpression), tsSymbol[K](vhdlConcatenation), tsSymbol[K](vhdlTerm), tsSymbol[K](vhdlExponentiation))
                                                                 rules[vhdlExtendedDigitBase4] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-3]"), tsRegex[K]("[^0-3#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-3]"), tsRegex[K]("[^0-3#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlFileDeclaration] = tsSeq[K](tsRegex[K]("[fF][iI][lL][eE]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlFileOpenInformation), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlExtendedDigitBase12] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-bA-B]"), tsRegex[K]("[^0-9a-bA-B#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-bA-B]"), tsRegex[K]("[^0-9a-bA-B#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlPSLStrongFairnessDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[sS][tT][rR][oO][nN][gG]"), tsRegex[K]("[fF][aA][iI][rR][nN][eE][sS][sS]"), tsSymbol[K](vhdlHidPSLBoolean), tsString[K](","), tsSymbol[K](vhdlHidPSLBoolean), tsString[K](";"))
                                                                 rules[vhdlPSLTemporalParameterSpecification] = tsChoice[K](tsRegex[K]("[sS][eE][qQ][uU][eE][nN][cC][eE]"), tsRegex[K]("[pP][rR][oO][pP][eE][rR][tT][yY]"))
                                                                 rules[vhdlHidAfter] = tsSeq[K](tsRegex[K]("[aA][fF][tT][eE][rR]"), tsSymbol[K](vhdlHidTimeExpression))
                                                                 rules[vhdlFunctionInterfaceDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidFunctionSpecification), tsChoice[K](tsSeq[K](tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlInterfaceSubprogramDefault)), tsBlank[K]()))
                                                                 rules[vhdlHidSignalMode] = tsChoice[K](tsSymbol[K](vhdlHidIn), tsSymbol[K](vhdlHidOut), tsSymbol[K](vhdlHidInout), tsSymbol[K](vhdlHidBuffer), tsSymbol[K](vhdlHidLinkage))
                                                                 rules[vhdlPositionalAssociationElement] = tsSeq[K](tsSymbol[K](vhdlHidActualPart))
                                                                 rules[vhdlExtendedIdentifier] = tsSeq[K](tsString[K]("\\"), tsRepeat1[K](tsChoice[K](tsString[K]("A"), tsString[K]("B"), tsString[K]("C"), tsString[K]("D"), tsString[K]("E"), tsString[K]("F"), tsString[K]("G"), tsString[K]("H"), tsString[K]("I"), tsString[K]("J"), tsString[K]("K"), tsString[K]("L"), tsString[K]("M"), tsString[K]("N"), tsString[K]("O"), tsString[K]("P"), tsString[K]("Q"), tsString[K]("R"), tsString[K]("S"), tsString[K]("T"), tsString[K]("U"), tsString[K]("V"), tsString[K]("W"), tsString[K]("X"), tsString[K]("Y"), tsString[K]("Z"), tsString[K]("\xC3\x80"), tsString[K]("\xC3\x81"), tsString[K]("\xC3\x82"), tsString[K]("\xC3\x83"), tsString[K]("\xC3\x84"), tsString[K]("\xC3\x85"), tsString[K]("\xC3\x86"), tsString[K]("\xC3\x87"), tsString[K]("\xC3\x88"), tsString[K]("\xC3\x89"), tsString[K]("\xC3\x8A"), tsString[K]("\xC3\x8B"), tsString[K]("\xC3\x8C"), tsString[K]("\xC3\x8D"), tsString[K]("\xC3\x8E"), tsString[K]("\xC3\x8F"), tsString[K]("\xC3\x90"), tsString[K]("\xC3\x91"), tsString[K]("\xC3\x92"), tsString[K]("\xC3\x93"), tsString[K]("\xC3\x94"), tsString[K]("\xC3\x95"), tsString[K]("\xC3\x96"), tsString[K]("\xC3\x98"), tsString[K]("\xC3\x99"), tsString[K]("\xC3\x9A"), tsString[K]("\xC3\x9B"), tsString[K]("\xC3\x9C"), tsString[K]("\xC3\x9D"), tsString[K]("\xC3\x9E"), tsString[K]("0"), tsString[K]("1"), tsString[K]("2"), tsString[K]("3"), tsString[K]("4"), tsString[K]("5"), tsString[K]("6"), tsString[K]("7"), tsString[K]("8"), tsString[K]("9"), tsString[K]("\""), tsString[K]("#"), tsString[K]("&"), tsString[K]("\'"), tsString[K]("("), tsString[K](")"), tsString[K]("*"), tsString[K]("+"), tsString[K](","), tsString[K]("-"), tsString[K]("."), tsString[K]("/"), tsString[K](":"), tsString[K](";"), tsString[K]("<"), tsString[K]("="), tsString[K](">"), tsString[K]("?"), tsString[K]("@"), tsString[K]("["), tsString[K]("]"), tsString[K]("_"), tsString[K]("`"), tsString[K]("|"), tsString[K](" "), tsString[K](" "), tsString[K]("a"), tsString[K]("b"), tsString[K]("c"), tsString[K]("d"), tsString[K]("e"), tsString[K]("f"), tsString[K]("g"), tsString[K]("h"), tsString[K]("i"), tsString[K]("j"), tsString[K]("k"), tsString[K]("l"), tsString[K]("m"), tsString[K]("n"), tsString[K]("o"), tsString[K]("p"), tsString[K]("q"), tsString[K]("r"), tsString[K]("s"), tsString[K]("t"), tsString[K]("u"), tsString[K]("v"), tsString[K]("w"), tsString[K]("x"), tsString[K]("y"), tsString[K]("z"), tsString[K]("\xC3\x9F"), tsString[K]("\xC3\xA0"), tsString[K]("\xC3\xA1"), tsString[K]("\xC3\xA2"), tsString[K]("\xC3\xA3"), tsString[K]("\xC3\xA4"), tsString[K]("\xC3\xA5"), tsString[K]("\xC3\xA6"), tsString[K]("\xC3\xA7"), tsString[K]("\xC3\xA8"), tsString[K]("\xC3\xA9"), tsString[K]("\xC3\xAA"), tsString[K]("\xC3\xAB"), tsString[K]("\xC3\xAC"), tsString[K]("\xC3\xAD"), tsString[K]("\xC3\xAE"), tsString[K]("\xC3\xAF"), tsString[K]("\xC3\xB0"), tsString[K]("\xC3\xB1"), tsString[K]("\xC3\xB2"), tsString[K]("\xC3\xB3"), tsString[K]("\xC3\xB4"), tsString[K]("\xC3\xB5"), tsString[K]("\xC3\xB6"), tsString[K]("\xC3\xB8"), tsString[K]("\xC3\xB9"), tsString[K]("\xC3\xBA"), tsString[K]("\xC3\xBB"), tsString[K]("\xC3\xBC"), tsString[K]("\xC3\xBD"), tsString[K]("\xC3\xBE"), tsString[K]("\xC3\xBF"), tsString[K]("!"), tsString[K]("$"), tsString[K]("%"), tsString[K]("^"), tsString[K]("{"), tsString[K]("}"), tsString[K](""), tsString[K]("~"), tsString[K]("\xC2\xA1"), tsString[K]("\xC2\xA2"), tsString[K]("\xC2\xA3"), tsString[K]("\xC2\xA4"), tsString[K]("\xC2\xA5"), tsString[K]("\xC2\xA6"), tsString[K]("\xC2\xA7"), tsString[K]("\xC2\xA8"), tsString[K]("\xC2\xA9"), tsString[K]("\xC2\xAA"), tsString[K]("\xC2\xAB"), tsString[K]("\xC2\xAC"), tsString[K]("\xC2\xAE"), tsString[K]("\xC2\xAF"), tsString[K]("\xC2\xB0"), tsString[K]("\xC2\xB1"), tsString[K]("\xC2\xB2"), tsString[K]("\xC2\xB3"), tsString[K]("\xC2\xB4"), tsString[K]("\xC2\xB5"), tsString[K]("\xC2\xB6"), tsString[K]("\xC2\xB7"), tsString[K]("\xC2\xB8"), tsString[K]("\xC2\xB9"), tsString[K]("\xC2\xBA"), tsString[K]("\xC2\xBB"), tsString[K]("\xC2\xBC"), tsString[K]("\xC2\xBD"), tsString[K]("\xC2\xBE"), tsString[K]("\xC2\xBF"), tsString[K]("\xC3\x97"), tsString[K]("\xC3\xB7"), tsString[K]("-"), tsString[K]("\\\\"))), tsString[K]("\\"))
                                                                 rules[vhdlBase15] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("5")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("5")))
                                                                 rules[vhdlSignalDeclaration] = tsSeq[K](tsRegex[K]("[sS][iI][gG][nN][aA][lL]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlSignalKind), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidFileLogicalName] = tsSymbol[K](vhdlHidStringExpression)
                                                                 rules[vhdlHidRangeAttributeDesignator] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](vhdlHidRangeDesignator), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidExpression), tsString[K](")")), tsBlank[K]()))
                                                                 rules[vhdlHidDigit] = tsChoice[K](tsString[K]("0"), tsString[K]("1"), tsString[K]("2"), tsString[K]("3"), tsString[K]("4"), tsString[K]("5"), tsString[K]("6"), tsString[K]("7"), tsString[K]("8"), tsString[K]("9"))
                                                                 rules[vhdlHidPSLSequenceInstance] = tsSymbol[K](vhdlPSLInstance)
                                                                 rules[vhdlHidNameOrLabel] = tsSymbol[K](vhdlHidSimpleName)
                                                                 rules[vhdlPSLPropertyReplicator] = tsSeq[K](tsRegex[K]("[fF][oO][rR][aA][lL][lL]"), tsSymbol[K](vhdlPSLParameterSpecification), tsString[K](":"), tsChoice[K](tsSymbol[K](vhdlHidPSLPropertyInstance), tsSymbol[K](vhdlHidPSLProperty)))
                                                                 rules[vhdlHidExpr] = tsChoice[K](tsSymbol[K](vhdlHidUnaryExpression), tsSymbol[K](vhdlHidBinaryExpression), tsSymbol[K](vhdlHidPrimary))
                                                                 rules[vhdlAccessTypeDefinition] = tsSeq[K](tsRegex[K]("[aA][cC][cC][eE][sS][sS]"), tsSymbol[K](vhdlSubtypeIndication))
                                                                 rules[vhdlEntitySpecification] = tsSeq[K](tsSymbol[K](vhdlEntityNameList), tsString[K](":"), tsSymbol[K](vhdlEntityClass))
                                                                 rules[vhdlHidConcurrentSignalAssignment] = tsChoice[K](tsSymbol[K](vhdlSimpleWaveformAssignment), tsSymbol[K](vhdlConditionalWaveformAssignment), tsSymbol[K](vhdlSelectedWaveformAssignment))
                                                                 rules[vhdlHidContextItem] = tsChoice[K](tsSymbol[K](vhdlLibraryClause), tsSymbol[K](vhdlUseClause), tsSymbol[K](vhdlContextReference))
                                                                 rules[vhdlGenerateStatementElement] = tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsString[K]("("), tsSymbol[K](vhdlHidGenerateSpecification), tsString[K](")"))
                                                                 rules[vhdlHidActualPart] = tsChoice[K](tsSymbol[K](vhdlHidExpression), tsSymbol[K](vhdlInertialExpression), tsSymbol[K](vhdlSubtypeIndication), tsSymbol[K](vhdlOpen), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlStringLiteral))
                                                                 rules[vhdlHidConcurrentStatement] = tsChoice[K](tsSymbol[K](vhdlBlockStatement), tsSymbol[K](vhdlProcessStatement), tsSymbol[K](vhdlComponentInstantiationStatement), tsSymbol[K](vhdlProcedureCallStatement), tsSymbol[K](vhdlAssertionStatement), tsSymbol[K](vhdlHidConcurrentSignalAssignment), tsSymbol[K](vhdlHidGenerateStatement), tsSymbol[K](vhdlHidPSLDirective), tsSymbol[K](vhdlHidPSLDeclaration))
                                                                 rules[vhdlNullStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[nN][uU][lL][lL]"), tsString[K](";"))
                                                                 rules[vhdlHidAttributeDesignator] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](vhdlHidSimpleName))
                                                                 rules[vhdlEntityNameList] = tsChoice[K](tsSeq[K](tsSymbol[K](vhdlEntityDesignator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlEntityDesignator)))), tsSymbol[K](vhdlOthers), tsSymbol[K](vhdlAll))
                                                                 rules[vhdlPSLValueSet] = tsChoice[K](tsSymbol[K](vhdlBoolean), tsSeq[K](tsString[K]("{"), tsSymbol[K](vhdlHidPSLValueRange), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidPSLValueRange))), tsString[K]("}")))
                                                                 rules[vhdlBasedReal] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlBase2), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase2), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase2), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase3), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase3), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase3), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase4), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase4), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase4), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase5), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase5), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase5), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase6), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase6), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase6), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase7), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase7), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase7), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase8), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase8), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase8), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase9), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase9), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase9), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase10), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase10), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase10), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase11), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase11), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase11), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase12), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase12), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase12), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase13), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase13), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase13), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase14), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase14), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase14), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase15), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase15), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase15), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase16), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase16), tsString[K]("."), tsSymbol[K](vhdlExtendedDigitBase16), tsString[K]("#"))), tsChoice[K](tsSymbol[K](vhdlExponent), tsBlank[K]()))
                                                                 rules[vhdlPSLExtendedOcurrenceFLProperty] = tsSeq[K](tsSeq[K](tsChoice[K](tsRegex[K]("[eE][vV][eE][nN][tT][uU][aA][lL][lL][yY]"), tsRegex[K]("[nN][eE][xX][tT]"), tsRegex[K]("[nN][eE][xX][tT][__][aA]"), tsRegex[K]("[nN][eE][xX][tT][__][eE]"), tsRegex[K]("[nN][eE][xX][tT][__][eE][vV][eE][nN][tT]"), tsRegex[K]("[nN][eE][xX][tT][__][eE][vV][eE][nN][tT][__][aA]"), tsRegex[K]("[nN][eE][xX][tT][__][eE][vV][eE][nN][tT][__][eE]")), tsChoice[K](tsString[K]("!"), tsBlank[K]())), tsSymbol[K](vhdlHidPSLExtendedOcurrenceArgument))
                                                                 rules[vhdlExitStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[eE][xX][iI][tT]"), tsChoice[K](tsSymbol[K](vhdlHidLoopLabel), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidWhenClause), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidPSLSERE] = tsChoice[K](tsSymbol[K](vhdlHidPSLBoolean), tsSymbol[K](vhdlHidPSLSequence), tsSymbol[K](vhdlPSLSimpleSERE), tsSymbol[K](vhdlHidPSLCompoundSERE))
                                                                 rules[vhdlHidPortInterfaceList] = tsSeq[K](tsSeq[K](tsSymbol[K](vhdlHidPortInterfaceDeclaration), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlHidPortInterfaceDeclaration)))))
                                                                 rules[vhdlHidUnaryExpression] = tsChoice[K](tsSymbol[K](vhdlCondition), tsSymbol[K](vhdlReduction), tsSymbol[K](vhdlSign), tsSymbol[K](vhdlFactor))
                                                                 rules[vhdlConditionalExpressions] = tsSeq[K](tsSymbol[K](vhdlHidValue), tsSymbol[K](vhdlHidWhenClause), tsRepeat[K](tsSymbol[K](vhdlAlternativeConditionalExpressions)))
                                                                 rules[vhdlBase5] = tsChoice[K](tsSeq[K](tsString[K]("5")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("5")))
                                                                 rules[vhdlHidPhysicalLiteral] = tsSeq[K](tsSymbol[K](vhdlHidUnit))
                                                                 rules[vhdlHidGuard] = tsSymbol[K](vhdlHidCondition)
                                                                 rules[vhdlAlternativeSelectedWaveforms] = tsSeq[K](tsString[K](","), tsSymbol[K](vhdlWaveforms), tsRegex[K]("[wW][hH][eE][nN]"), tsSymbol[K](vhdlChoices))
                                                                 rules[vhdlForGenerateStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlParameterSpecification), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlGenerateStatementBody), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlConstrainedArrayDefinition] = tsSeq[K](tsRegex[K]("[aA][rR][rR][aA][yY]"), tsSymbol[K](vhdlIndexConstraint), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlSubtypeIndication))
                                                                 rules[vhdlPSLVerificationUnitBody] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlPSLHierarchicalHDLName), tsString[K](")")), tsBlank[K]()), tsString[K]("{"), tsRepeat[K](tsSymbol[K](vhdlPSLInheritSpec)), tsRepeat[K](tsSymbol[K](vhdlHidPSLVUNitItem)), tsString[K]("}"))
                                                                 rules[vhdlTypeInterfaceDeclaration] = tsSeq[K](tsRegex[K]("[tT][yY][pP][eE]"), tsSymbol[K](vhdlHidIdentifier))
                                                                 rules[vhdlHidRangeDesignator] = tsChoice[K](tsRegex[K]("[rR][aA][nN][gG][eE]"), tsRegex[K]("[rR][eE][vV][eE][rR][sS][eE][__][rR][aA][nN][gG][eE]"))
                                                                 rules[vhdlLabel] = tsSeq[K](tsSymbol[K](vhdlHidIdentifier), tsString[K](":"))
                                                                 rules[vhdlComment] = tsChoice[K](tsSeq[K](tsString[K]("--"), tsRegex[K]("[^\x0B\\r\\n\x0C]*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("([^\\*]|(\\*[^\\/]))*"), tsString[K]("*/")))
                                                                 rules[vhdlPSLVMOde] = tsSeq[K](tsRegex[K]("[vV][mM][oO][dD][eE]"), tsSymbol[K](vhdlHidPSLIdentifier), tsSymbol[K](vhdlPSLVerificationUnitBody))
                                                                 rules[vhdlHidIdentifier] = tsChoice[K](tsSymbol[K](vhdlBasicIdentifier), tsSymbol[K](vhdlExtendedIdentifier))
                                                                 rules[vhdlBase11] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("1")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("1")))
                                                                 rules[vhdlHidSubprogramKind] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[pP][uU][rR][eE]"), tsRegex[K]("[iI][mM][pP][uU][rR][eE]")), tsBlank[K]()), tsChoice[K](tsRegex[K]("[pP][rR][oO][cC][eE][dD][uU][rR][eE]"), tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]")))
                                                                 rules[vhdlHidPartialPathname] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](vhdlPathnameElement), tsString[K]("."))), tsSymbol[K](vhdlHidSimpleName))
                                                                 rules[vhdlComponentConfiguration] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlHidComponentSpecification), tsChoice[K](tsSymbol[K](vhdlBindingIndication), tsBlank[K]()), tsRepeat[K](tsSymbol[K](vhdlVerificationUnitBindingIndication)), tsChoice[K](tsSymbol[K](vhdlBlockConfiguration), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[fF][oO][rR]"), tsString[K](";"))
                                                                 rules[vhdlHidGenericInterfaceList] = tsSeq[K](tsSeq[K](tsSymbol[K](vhdlHidGenericInterfaceDeclaration), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](vhdlHidGenericInterfaceDeclaration)))))
                                                                 rules[vhdlHidPSLValueRange] = tsChoice[K](tsSymbol[K](vhdlHidPSLValue), tsSymbol[K](vhdlHidPSLRange))
                                                                 rules[vhdlHidSubprogramInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlProcedureInterfaceDeclaration), tsSymbol[K](vhdlFunctionInterfaceDeclaration))
                                                                 rules[vhdlHidComponentSpecification] = tsSeq[K](tsSymbol[K](vhdlInstantiationList), tsString[K](":"), tsSymbol[K](vhdlHidComponentName))
                                                                 rules[vhdlHidPackageName] = tsSymbol[K](vhdlHidSimpleName)
                                                                 rules[vhdlHidPSLDirective] = tsChoice[K](tsSymbol[K](vhdlPSLAssertDirective), tsSymbol[K](vhdlPSLAssumeDirective), tsSymbol[K](vhdlPSLAssumeGuaranteeDirective), tsSymbol[K](vhdlPSLRestrictDirective), tsSymbol[K](vhdlPSLRestrictGuaranteeDirective), tsSymbol[K](vhdlPSLCoverDirective), tsSymbol[K](vhdlPSLFairnessDirective), tsSymbol[K](vhdlPSLStrongFairnessDirective))
                                                                 rules[vhdlInterfaceSubprogramDefault] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlHidOperatorSymbol), tsString[K]("<>"))
                                                                 rules[vhdlBase13] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("3")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("3")))
                                                                 rules[vhdlHidEntityName] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName))
                                                                 rules[vhdlPSLConstantParameterSpecification] = tsChoice[K](tsRegex[K]("[cC][oO][nN][sS][tT]"), tsSeq[K](tsChoice[K](tsRegex[K]("[cC][oO][nN][sS][tT]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlPSLHDLType), tsSymbol[K](vhdlPSLTypeClass))))
                                                                 rules[vhdlPSLActualParameter] = tsChoice[K](tsSymbol[K](vhdlHidPSLAnyType), tsSymbol[K](vhdlHidPSLSequence), tsSymbol[K](vhdlHidPSLProperty))
                                                                 rules[vhdlPSLAssertDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[aA][sS][sS][eE][rR][tT]"), tsSymbol[K](vhdlHidPSLProperty), tsChoice[K](tsSymbol[K](vhdlHidReport), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlLoopStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidIterationScheme), tsBlank[K]()), tsRegex[K]("[lL][oO][oO][pP]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[lL][oO][oO][pP]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidReport] = tsSeq[K](tsRegex[K]("[rR][eE][pP][oO][rR][tT]"), tsSymbol[K](vhdlHidStringExpression))
                                                                 rules[vhdlAliasDeclaration] = tsSeq[K](tsRegex[K]("[aA][lL][iI][aA][sS]"), tsSymbol[K](vhdlHidAliasDesignator), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication)), tsBlank[K]()), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidAliasDenotator), tsChoice[K](tsSymbol[K](vhdlSignature), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlWaveformElement] = tsSeq[K](tsSymbol[K](vhdlHidValue), tsChoice[K](tsSymbol[K](vhdlHidAfter), tsBlank[K]()))
                                                                 rules[vhdlHidPSLParameterSpecification] = tsChoice[K](tsSymbol[K](vhdlPSLConstantParameterSpecification), tsSymbol[K](vhdlPSLTemporalParameterSpecification))
                                                                 rules[vhdlRecordElementConstraint] = tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlHidElementConstraint))
                                                                 rules[vhdlAll] = tsRegex[K]("[aA][lL][lL]")
                                                                 rules[vhdlAmbiguousName] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlFunctionCall)), tsString[K]("("), tsSymbol[K](vhdlExpressionList), tsString[K](")"))
                                                                 rules[vhdlComponentInstantiationStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidEntityAspect), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlRealDecimal] = tsSeq[K](tsSymbol[K](vhdlInteger), tsString[K]("."), tsSymbol[K](vhdlHidIntegerImmed), tsChoice[K](tsSymbol[K](vhdlExponent), tsBlank[K]()))
                                                                 rules[vhdlAlternativeConditionalExpressions] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsSymbol[K](vhdlHidValue), tsChoice[K](tsSymbol[K](vhdlHidWhenClause), tsBlank[K]()))
                                                                 rules[vhdlProcedureDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidProcedureSpecification), tsString[K](";"))
                                                                 rules[vhdlHidGenerateSpecification] = tsChoice[K](tsSymbol[K](vhdlHidExpression), tsSymbol[K](vhdlHidRange), tsSymbol[K](vhdlHidNameOrLabel))
                                                                 rules[vhdlHidConstraint] = tsChoice[K](tsSymbol[K](vhdlRangeConstraint), tsSymbol[K](vhdlArrayConstraint), tsSymbol[K](vhdlRecordConstraint))
                                                                 rules[vhdlAllocator] = tsSeq[K](tsRegex[K]("[nN][eE][wW]"), tsChoice[K](tsSymbol[K](vhdlSubtypeIndication), tsSymbol[K](vhdlQualifiedExpression)))
                                                                 rules[vhdlPackageInterfaceDeclaration] = tsSeq[K](tsRegex[K]("[pP][aA][cC][kK][aA][gG][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsRegex[K]("[nN][eE][wW]"), tsSymbol[K](vhdlHidUninstantiatedName), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()))
                                                                 rules[vhdlNamedAssociationElement] = tsSeq[K](tsSymbol[K](vhdlHidFormalPart), tsString[K]("=>"), tsSymbol[K](vhdlHidActualPart))
                                                                 rules[vhdlHidSensitivityClause] = tsSeq[K](tsRegex[K]("[oO][nN]"), tsSymbol[K](vhdlSensitivityList))
                                                                 rules[vhdlSimpleReleaseAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsChoice[K](tsRegex[K]("[gG][uU][aA][rR][dD][eE][dD]"), tsBlank[K]()), tsRegex[K]("[rR][eE][lL][eE][aA][sS][eE]"), tsChoice[K](tsSymbol[K](vhdlForceMode), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidPredefinedDesignatorWithExpression] = tsChoice[K](tsRegex[K]("[iI][mM][aA][gG][eE]"), tsRegex[K]("[vV][aA][lL][uU][eE]"), tsRegex[K]("[pP][oO][sS]"), tsRegex[K]("[vV][aA][lL]"), tsRegex[K]("[sS][uU][cC][cC]"), tsRegex[K]("[pP][rR][eE][dD]"), tsRegex[K]("[lL][eE][fF][tT][oO][fF]"), tsRegex[K]("[rR][iI][gG][hH][tT][oO][fF]"), tsRegex[K]("[lL][eE][fF][tT]"), tsRegex[K]("[rR][iI][gG][hH][tT]"), tsRegex[K]("[hH][iI][gG][hH]"), tsRegex[K]("[lL][oO][wW]"), tsRegex[K]("[lL][eE][nN][gG][tT][hH]"), tsRegex[K]("[aA][sS][cC][eE][nN][dD][iI][nN][gG]"), tsRegex[K]("[dD][eE][lL][aA][yY][eE][dD]"), tsRegex[K]("[sS][tT][aA][bB][lL][eE]"), tsRegex[K]("[qQ][uU][iI][eE][tT]"))
                                                                 rules[vhdlGenericClause] = tsSeq[K](tsRegex[K]("[gG][eE][nN][eE][rR][iI][cC]"), tsString[K]("("), tsChoice[K](tsSymbol[K](vhdlHidGenericInterfaceList), tsBlank[K]()), tsString[K](")"), tsChoice[K](tsSymbol[K](vhdlHidSemicolon), tsBlank[K]()))
                                                                 rules[vhdlCaseGenerateStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[cC][aA][sS][eE]"), tsSymbol[K](vhdlHidExpression), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsRepeat[K](tsSymbol[K](vhdlCaseGenerateAlternative)), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlPortClause] = tsSeq[K](tsRegex[K]("[pP][oO][rR][tT]"), tsString[K]("("), tsChoice[K](tsSymbol[K](vhdlHidPortInterfaceList), tsBlank[K]()), tsString[K](")"), tsChoice[K](tsSymbol[K](vhdlHidSemicolon), tsBlank[K]()))
                                                                 rules[vhdlPSLSuffixImplicationFLProperty] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsSymbol[K](vhdlHidPSLSERE), tsString[K]("}"), tsString[K]("("), tsSymbol[K](vhdlHidPSLFLProperty), tsString[K](")")), tsChoice[K](tsSeq[K](tsSymbol[K](vhdlHidPSLSequence), tsString[K]("|=>"), tsSymbol[K](vhdlHidPSLFLProperty)), tsSeq[K](tsSymbol[K](vhdlHidPSLSequence), tsString[K]("|->"), tsSymbol[K](vhdlHidPSLFLProperty))))
                                                                 rules[vhdlReduction] = tsSeq[K](tsChoice[K](tsRegex[K]("[aA][nN][dD]"), tsRegex[K]("[oO][rR]"), tsRegex[K]("[xX][oO][rR]"), tsRegex[K]("[nN][aA][nN][dD]"), tsRegex[K]("[nN][oO][rR]"), tsRegex[K]("[xX][nN][oO][rR]")), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlPSLCoverDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[cC][oO][vV][eE][rR]"), tsSymbol[K](vhdlHidPSLSequence), tsChoice[K](tsSymbol[K](vhdlHidReport), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidSubprogramDeclaration] = tsChoice[K](tsSymbol[K](vhdlProcedureDeclaration), tsSymbol[K](vhdlFunctionDeclaration))
                                                                 rules[vhdlSimpleExpression] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsRepeat1[K](tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsSymbol[K](vhdlHidExpr))))
                                                                 rules[vhdlConditionalWaveforms] = tsSeq[K](tsSymbol[K](vhdlWaveforms), tsSymbol[K](vhdlHidWhenClause), tsRepeat[K](tsSymbol[K](vhdlAlternativeConditionalWaveforms)))
                                                                 rules[vhdlHidIllegalInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlConstantInterfaceDeclaration), tsSymbol[K](vhdlSignalInterfaceDeclaration), tsSymbol[K](vhdlVariableInterfaceDeclaration), tsSymbol[K](vhdlFileInterfaceDeclaration), tsSymbol[K](vhdlTypeInterfaceDeclaration), tsSymbol[K](vhdlHidSubprogramInterfaceDeclaration), tsSymbol[K](vhdlPackageInterfaceDeclaration))
                                                                 rules[vhdlHidBlockSpecification] = tsSymbol[K](vhdlPathnameElement)
                                                                 rules[vhdlBase9] = tsChoice[K](tsSeq[K](tsString[K]("9")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("9")))
                                                                 rules[vhdlSubtypeIndication] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidResolutionIndication), tsBlank[K]()), tsSymbol[K](vhdlTypeMark), tsChoice[K](tsSymbol[K](vhdlHidConstraint), tsBlank[K]()))
                                                                 rules[vhdlHidValue] = tsSymbol[K](vhdlHidExpression)
                                                                 rules[vhdlProcedureBody] = tsSeq[K](tsSymbol[K](vhdlHidProcedureSpecification), tsRegex[K]("[iI][sS]"), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsChoice[K](tsSymbol[K](vhdlHidSubprogramKind), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndDesignator), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlPSLLogicalFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLFLProperty), tsRepeat1[K](tsSeq[K](tsChoice[K](tsRegex[K]("[aA][nN][dD]"), tsRegex[K]("[oO][rR]")), tsSymbol[K](vhdlHidPSLFLProperty))))
                                                                 rules[vhdlHidElementAssociationList] = tsChoice[K](tsSymbol[K](vhdlNamedElementAssociation), tsSeq[K](tsSymbol[K](vhdlHidElementAssociation), tsString[K](","), tsSeq[K](tsSymbol[K](vhdlHidElementAssociation), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidElementAssociation))))))
                                                                 rules[vhdlHidArrayTypeDefinition] = tsChoice[K](tsSymbol[K](vhdlUnboundedArrayDefinition), tsSymbol[K](vhdlConstrainedArrayDefinition))
                                                                 rules[vhdlRelativePathname] = tsSeq[K](tsRepeat[K](tsString[K]("^.")), tsSymbol[K](vhdlHidPartialPathname))
                                                                 rules[vhdlHidPSLValue] = tsSymbol[K](vhdlHidPSLAnyType)
                                                                 rules[vhdlForLoop] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsSymbol[K](vhdlParameterSpecification))
                                                                 rules[vhdlHidHeader] = tsSeq[K](tsSymbol[K](vhdlHidClause), tsChoice[K](tsSymbol[K](vhdlHidClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidClause), tsBlank[K]()))
                                                                 rules[vhdlContextReference] = tsSeq[K](tsRegex[K]("[cC][oO][nN][tT][eE][xX][tT]"), tsSymbol[K](vhdlContextList), tsString[K](";"))
                                                                 rules[vhdlHidEntityTag] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlHidOperatorSymbol))
                                                                 rules[vhdlElsif] = tsSeq[K](tsRegex[K]("[eE][lL][sS][iI][fF]"), tsSymbol[K](vhdlHidCondition), tsRegex[K]("[tT][hH][eE][nN]"), tsChoice[K](tsSymbol[K](vhdlSequenceOfStatements), tsBlank[K]()))
                                                                 rules[vhdlHidLoopLabel] = tsSymbol[K](vhdlHidSimpleName)
                                                                 rules[vhdlFileOpenInformation] = tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("[oO][pP][eE][nN]"), tsSymbol[K](vhdlHidFileOpenKind)), tsBlank[K]()), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidFileLogicalName))
                                                                 rules[vhdlHidAliasDenotator] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlSliceName), tsSymbol[K](vhdlAttributeName), tsSymbol[K](vhdlHidExternalObjectName))
                                                                 rules[vhdlHidName] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlSliceName), tsSymbol[K](vhdlAttributeName), tsSymbol[K](vhdlHidExternalObjectName))
                                                                 rules[vhdlFileTypeDefinition] = tsSeq[K](tsRegex[K]("[fF][iI][lL][eE]"), tsRegex[K]("[oO][fF]"), tsSymbol[K](vhdlTypeMark))
                                                                 rules[vhdlElsifGenerate] = tsSeq[K](tsRegex[K]("[eE][lL][sS][iI][fF]"), tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidCondition), tsRegex[K]("[gG][eE][nN][eE][rR][aA][tT][eE]"), tsChoice[K](tsSymbol[K](vhdlGenerateStatementBody), tsBlank[K]()))
                                                                 rules[vhdlHidUninstantiatedName] = tsChoice[K](tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlHidSimpleName))
                                                                 rules[vhdlEntityClassEntry] = tsSeq[K](tsSymbol[K](vhdlEntityClass), tsChoice[K](tsSymbol[K](vhdlHidAny), tsBlank[K]()))
                                                                 rules[vhdlPSLFactorFLProperty] = tsSeq[K](tsRegex[K]("[nN][oO][tT]"), tsSymbol[K](vhdlHidPSLFLProperty))
                                                                 rules[vhdlHidOperatorSymbol] = tsSymbol[K](vhdlStringLiteral)
                                                                 rules[vhdlBase16] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("6")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("6")))
                                                                 rules[vhdlIndexConstraint] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](vhdlHidDiscreteRange), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidDiscreteRange)))), tsSymbol[K](vhdlOpen)), tsString[K](")"))
                                                                 rules[vhdlEnumerationTypeDefinition] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](vhdlHidEnumerationLiteral), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidEnumerationLiteral)))), tsString[K](")"))
                                                                 rules[vhdlProcedureInstantiationDeclaration] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[pP][uU][rR][eE]"), tsRegex[K]("[iI][mM][pP][uU][rR][eE]")), tsBlank[K]()), tsRegex[K]("[pP][rR][oO][cC][eE][dD][uU][rR][eE]"), tsSymbol[K](vhdlHidDesignator), tsRegex[K]("[iI][sS]"), tsRegex[K]("[nN][eE][wW]"), tsSymbol[K](vhdlHidUninstantiatedName), tsChoice[K](tsSymbol[K](vhdlSignature), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidArrayElementConstraint] = tsSymbol[K](vhdlHidElementConstraint)
                                                                 rules[vhdlVerificationUnitBindingIndication] = tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsRegex[K]("[vV][uU][nN][iI][tT]"), tsSymbol[K](vhdlVerificationUnitList), tsString[K](";"))
                                                                 rules[vhdlSeparator] = tsString[K]("_")
                                                                 rules[vhdlVariableDeclaration] = tsSeq[K](tsRegex[K]("[vV][aA][rR][iI][aA][bB][lL][eE]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidChoice] = tsChoice[K](tsSymbol[K](vhdlHidSimpleExpression), tsSymbol[K](vhdlHidRange), tsSymbol[K](vhdlOthers))
                                                                 rules[vhdlPSLRestrictDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[rR][eE][sS][tT][rR][iI][cC][tT]"), tsSymbol[K](vhdlHidPSLSequence), tsString[K](";"))
                                                                 rules[vhdlHidPSLHDLModuleNAME] = tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidSimpleName), tsString[K](")")), tsBlank[K]()))
                                                                 rules[vhdlHidComponentName] = tsSymbol[K](vhdlHidSimpleName)
                                                                 rules[vhdlCharacterLiteral] = tsChoice[K](tsSeq[K](tsString[K]("\'"), tsRegex[K]("\'|[^\']"), tsString[K]("\'")))
                                                                 rules[vhdlAssociationList] = tsSeq[K](tsSymbol[K](vhdlHidAssociationElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidAssociationElement))))
                                                                 rules[vhdlGroupDeclaration] = tsSeq[K](tsRegex[K]("[gG][rR][oO][uU][pP]"), tsSymbol[K](vhdlHidIdentifier), tsString[K](":"), tsSymbol[K](vhdlHidGroupTemplate), tsString[K]("("), tsSymbol[K](vhdlGroupConstituentList), tsString[K](")"), tsString[K](";"))
                                                                 rules[vhdlHidSignalAssignmentStatement] = tsChoice[K](tsSymbol[K](vhdlHidSimpleSignalAssignment), tsSymbol[K](vhdlHidConditionalSignalAssignment), tsSymbol[K](vhdlHidSelectedSignalAssignment))
                                                                 rules[vhdlHidEnumerationLiteral] = tsChoice[K](tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlHidIdentifier))
                                                                 rules[vhdlGroupConstituentList] = tsSeq[K](tsSymbol[K](vhdlHidGroupConstituent), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidGroupConstituent))))
                                                                 rules[vhdlReturnStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[rR][eE][tT][uU][rR][nN]"), tsChoice[K](tsSymbol[K](vhdlHidExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlDontCare] = tsString[K]("-")
                                                                 rules[vhdlPSLInvariantFLProperty] = tsSeq[K](tsChoice[K](tsRegex[K]("[aA][lL][wW][aA][yY][sS]"), tsRegex[K]("[nN][eE][vV][eE][rR]")), tsSymbol[K](vhdlHidPSLFLProperty))
                                                                 rules[vhdlHidPredefinedAttributeDesignatorWithExpression] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](vhdlHidPredefinedDesignatorWithExpression), tsString[K]("("), tsSymbol[K](vhdlHidExpression), tsString[K](")"))
                                                                 rules[vhdlParameterSpecification] = tsSeq[K](tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][nN]"), tsSymbol[K](vhdlHidDiscreteRange))
                                                                 rules[vhdlPrimaryUnitDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidIdentifier), tsString[K](";"))
                                                                 rules[vhdlCaseStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[cC][aA][sS][eE]"), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsSymbol[K](vhdlHidExpression), tsRegex[K]("[iI][sS]"), tsRepeat[K](tsSymbol[K](vhdlCaseStatementAlternative)), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[cC][aA][sS][eE]"), tsChoice[K](tsString[K]("?"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidFunctionSpecification] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[pP][uU][rR][eE]"), tsRegex[K]("[iI][mM][pP][uU][rR][eE]")), tsBlank[K]()), tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsSymbol[K](vhdlHidDesignator), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlFunctionParameterClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlReturn), tsBlank[K]()))
                                                                 rules[vhdlPSLFairnessDirective] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[fF][aA][iI][rR][nN][eE][sS][sS]"), tsSymbol[K](vhdlHidPSLBoolean), tsString[K](";"))
                                                                 rules[vhdlPSLParenthesizedFLProperty] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidPSLFLProperty), tsString[K](")"))
                                                                 rules[vhdlDescendingRange] = tsSeq[K](tsSymbol[K](vhdlHidSimpleExpression), tsRegex[K]("[dD][oO][wW][nN][tT][oO]"), tsSymbol[K](vhdlHidSimpleExpression))
                                                                 rules[vhdlHidStringExpression] = tsSymbol[K](vhdlHidExpr)
                                                                 rules[vhdlHidNumericTypeDefinition] = tsSymbol[K](vhdlRangeConstraint)
                                                                 rules[vhdlPathnameElement] = tsChoice[K](tsSymbol[K](vhdlHidNameOrLabel), tsSymbol[K](vhdlGenerateStatementElement))
                                                                 rules[vhdlComponentInstantiation] = tsSeq[K](tsChoice[K](tsRegex[K]("[cC][oO][mM][pP][oO][nN][eE][nN][tT]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName)))
                                                                 rules[vhdlHidBuffer] = tsRegex[K]("[bB][uU][fF][fF][eE][rR]")
                                                                 rules[vhdlResolutionFunction] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName))
                                                                 rules[vhdlVariableInterfaceDeclaration] = tsSeq[K](tsChoice[K](tsRegex[K]("[vV][aA][rR][iI][aA][bB][lL][eE]"), tsBlank[K]()), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsChoice[K](tsSymbol[K](vhdlHidVariableMode), tsBlank[K]()), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()))
                                                                 rules[vhdlPSLActualParameterList] = tsSeq[K](tsSymbol[K](vhdlPSLActualParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlPSLActualParameter))))
                                                                 rules[vhdlBase10] = tsChoice[K](tsSeq[K](tsString[K]("1"), tsString[K]("0")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("1"), tsString[K]("0")))
                                                                 rules[vhdlSimpleVariableAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K](":="), tsSymbol[K](vhdlHidValue), tsString[K](";"))
                                                                 rules[vhdlExtendedDigitBase16] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[^0-9a-fA-F#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-fA-F]"), tsRegex[K]("[^0-9a-fA-F#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlSecondaryUnitDeclaration] = tsSeq[K](tsSymbol[K](vhdlHidIdentifier), tsString[K]("="), tsChoice[K](tsSymbol[K](vhdlPhysicalLiteral), tsSymbol[K](vhdlHidPhysicalLiteral)), tsString[K](";"))
                                                                 rules[vhdlHidPrimaryUnit] = tsChoice[K](tsSymbol[K](vhdlEntityDeclaration), tsSymbol[K](vhdlConfigurationDeclaration), tsSymbol[K](vhdlPackageDeclaration), tsSymbol[K](vhdlPackageInstantiationDeclaration), tsSymbol[K](vhdlContextDeclaration), tsSymbol[K](vhdlHidPSLVerificationUnit))
                                                                 rules[vhdlHidTypeDeclaration] = tsChoice[K](tsSymbol[K](vhdlFullTypeDeclaration), tsSymbol[K](vhdlIncompleteTypeDeclaration))
                                                                 rules[vhdlFullTypeDeclaration] = tsSeq[K](tsRegex[K]("[tT][yY][pP][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlHidTypeDefinition), tsString[K](";"))
                                                                 rules[vhdlHidBinaryBitValue] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-1]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare), tsSymbol[K](vhdlSeparator)), tsRepeat[K](tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlSeparator), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-1]"), tsSymbol[K](vhdlUnresolved), tsSymbol[K](vhdlDontCare)))))
                                                                 rules[vhdlHidConfigurationItem] = tsChoice[K](tsSymbol[K](vhdlBlockConfiguration), tsSymbol[K](vhdlComponentConfiguration))
                                                                 rules[vhdlBasedInteger] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](vhdlBase2), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase2), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase3), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase3), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase4), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase4), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase5), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase5), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase6), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase6), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase7), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase7), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase8), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase8), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase9), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase9), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase10), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase10), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase11), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase11), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase12), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase12), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase13), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase13), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase14), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase14), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase15), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase15), tsString[K]("#")), tsSeq[K](tsSymbol[K](vhdlBase16), tsString[K]("#"), tsSymbol[K](vhdlExtendedDigitBase16), tsString[K]("#"))), tsChoice[K](tsSymbol[K](vhdlExponent), tsBlank[K]()))
                                                                 rules[vhdlPSLSimpleSERE] = tsChoice[K](tsSymbol[K](vhdlHidPSLFusionSERE), tsSymbol[K](vhdlHidPSLConcatSERE))
                                                                 rules[vhdlSignature] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](vhdlTypeMark), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlTypeMark)))), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlReturn), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[vhdlExtendedDigitBase10] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9]"), tsRegex[K]("[^0-9#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9]"), tsRegex[K]("[^0-9#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlTypeMark] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAttributeName))
                                                                 rules[vhdlPackagePathname] = tsSeq[K](tsString[K]("@"), tsSymbol[K](vhdlHidSimpleName), tsString[K]("."), tsSeq[K](tsSymbol[K](vhdlHidSimpleName), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](vhdlHidSimpleName)))), tsString[K]("."), tsSymbol[K](vhdlHidSimpleName))
                                                                 rules[vhdlAssertionStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsChoice[K](tsRegex[K]("[pP][oO][sS][tT][pP][oO][nN][eE][dD]"), tsBlank[K]()), tsRegex[K]("[aA][sS][sS][eE][rR][tT]"), tsSymbol[K](vhdlHidCondition), tsChoice[K](tsSymbol[K](vhdlHidReport), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidSeverity), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlBase8] = tsChoice[K](tsSeq[K](tsString[K]("8")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("8")))
                                                                 rules[vhdlPSLFormalParameter] = tsSeq[K](tsSymbol[K](vhdlHidPSLParameterSpecification), tsSeq[K](tsSymbol[K](vhdlHidPSLIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidPSLIdentifier)))))
                                                                 rules[vhdlExtendedDigitBase9] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-8]"), tsRegex[K]("[^0-8#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-8]"), tsRegex[K]("[^0-8#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlHidLibraryUnit] = tsChoice[K](tsSymbol[K](vhdlHidPrimaryUnit), tsSymbol[K](vhdlHidSecondaryUnit))
                                                                 rules[vhdlParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidExpr), tsString[K](")"))
                                                                 rules[vhdlHidAliasDesignator] = tsChoice[K](tsSymbol[K](vhdlHidIdentifier), tsSymbol[K](vhdlCharacterLiteral), tsSymbol[K](vhdlHidOperatorSymbol))
                                                                 rules[vhdlConcatenation] = tsSeq[K](tsSymbol[K](vhdlHidExpr), tsRepeat1[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](vhdlHidExpr))))
                                                                 rules[vhdlExtendedDigitBase7] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-6]"), tsRegex[K]("[^0-6#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-6]"), tsRegex[K]("[^0-6#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlExtendedDigitBase11] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9aA]"), tsRegex[K]("[^0-9aA#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9aA]"), tsRegex[K]("[^0-9aA#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlHidGenericInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlConstantInterfaceDeclaration), tsSymbol[K](vhdlTypeInterfaceDeclaration), tsSymbol[K](vhdlHidSubprogramInterfaceDeclaration), tsSymbol[K](vhdlPackageInterfaceDeclaration), tsSymbol[K](vhdlHidIllegalInterfaceDeclaration))
                                                                 rules[vhdlToolDirective] = tsSeq[K](tsString[K]("`"), tsRegex[K]("[^\x0B\\r\\n\x0C]*"))
                                                                 rules[vhdlDefault] = tsRegex[K]("[dD][eE][fF][aA][uU][lL][tT]")
                                                                 rules[vhdlPositionalElementAssociation] = tsSeq[K](tsSymbol[K](vhdlHidValue))
                                                                 rules[vhdlBlockStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsRegex[K]("[bB][lL][oO][cC][kK]"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](vhdlHidGuard), tsString[K](")")), tsBlank[K]()), tsChoice[K](tsRegex[K]("[iI][sS]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidHeader), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDeclarativePart), tsBlank[K]()), tsRegex[K]("[bB][eE][gG][iI][nN]"), tsChoice[K](tsSymbol[K](vhdlConcurrentStatementPart), tsBlank[K]()), tsRegex[K]("[eE][nN][dD]"), tsRegex[K]("[bB][lL][oO][cC][kK]"), tsChoice[K](tsSymbol[K](vhdlHidEndSimpleName), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlConstantDeclaration] = tsSeq[K](tsRegex[K]("[cC][oO][nN][sS][tT][aA][nN][tT]"), tsSymbol[K](vhdlIdentifierList), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsChoice[K](tsSymbol[K](vhdlDefaultExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[vhdlHidPortInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlSignalInterfaceDeclaration), tsSymbol[K](vhdlHidIllegalInterfaceDeclaration))
                                                                 rules[vhdlCaseGenerateAlternative] = tsSeq[K](tsRegex[K]("[wW][hH][eE][nN]"), tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlChoices), tsString[K]("=>"), tsChoice[K](tsSymbol[K](vhdlGenerateStatementBody), tsBlank[K]()))
                                                                 rules[vhdlPSLHDLType] = tsSeq[K](tsRegex[K]("[hH][dD][lL][tT][yY][pP][eE]"), tsSymbol[K](vhdlSubtypeIndication))
                                                                 rules[vhdlHidEntityAspect] = tsChoice[K](tsSymbol[K](vhdlEntityInstantiation), tsSymbol[K](vhdlConfigurationInstantiation), tsSymbol[K](vhdlComponentInstantiation), tsSymbol[K](vhdlOpen))
                                                                 rules[vhdlSimpleWaveformAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlLabel), tsBlank[K]()), tsSymbol[K](vhdlHidTarget), tsString[K]("<="), tsChoice[K](tsRegex[K]("[gG][uU][aA][rR][dD][eE][dD]"), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlDelayMechanism), tsBlank[K]()), tsSymbol[K](vhdlWaveforms), tsString[K](";"))
                                                                 rules[vhdlHidCompositeTypeDefinition] = tsChoice[K](tsSymbol[K](vhdlHidArrayTypeDefinition), tsSymbol[K](vhdlRecordTypeDefinition))
                                                                 rules[vhdlCondition] = tsSeq[K](tsString[K]("??"), tsSymbol[K](vhdlHidExpr))
                                                                 rules[vhdlSubtypeDeclaration] = tsSeq[K](tsRegex[K]("[sS][uU][bB][tT][yY][pP][eE]"), tsSymbol[K](vhdlHidIdentifier), tsRegex[K]("[iI][sS]"), tsSymbol[K](vhdlSubtypeIndication), tsString[K](";"))
                                                                 rules[vhdlHidGroupConstituent] = tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlCharacterLiteral))
                                                                 rules[vhdlExternalConstantName] = tsSeq[K](tsString[K]("<<"), tsRegex[K]("[cC][oO][nN][sS][tT][aA][nN][tT]"), tsSymbol[K](vhdlHidExternalPathname), tsString[K](":"), tsSymbol[K](vhdlSubtypeIndication), tsString[K](">>"))
                                                                 rules[vhdlHidConditionClause] = tsSeq[K](tsRegex[K]("[uU][nN][tT][iI][lL]"), tsSymbol[K](vhdlHidCondition))
                                                                 rules[vhdlHidPSLDeclaration] = tsChoice[K](tsSymbol[K](vhdlPSLPropertyDeclaration), tsSymbol[K](vhdlPSLSequenceDeclaration), tsSymbol[K](vhdlPSLClockDeclaration))
                                                                 rules[vhdlAttributeName] = tsSeq[K](tsChoice[K](tsSymbol[K](vhdlHidSimpleName), tsSymbol[K](vhdlSelectedName), tsSymbol[K](vhdlAmbiguousName), tsSymbol[K](vhdlAttributeName), tsSymbol[K](vhdlFunctionCall), tsSymbol[K](vhdlHidExternalObjectName)), tsChoice[K](tsSymbol[K](vhdlSignature), tsBlank[K]()), tsChoice[K](tsSymbol[K](vhdlHidAttributeDesignator), tsSymbol[K](vhdlHidPredefinedAttributeDesignator), tsSymbol[K](vhdlHidPredefinedAttributeDesignatorWithExpression)))
                                                                 rules[vhdlRecordResolution] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](vhdlRecordElementResolution), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlRecordElementResolution)))), tsString[K](")"))
                                                                 rules[vhdlHidSubprogramInstantiationDeclaration] = tsChoice[K](tsSymbol[K](vhdlProcedureInstantiationDeclaration), tsSymbol[K](vhdlFunctionInstantiationDeclaration))
                                                                 rules[vhdlBase3] = tsChoice[K](tsSeq[K](tsString[K]("3")), tsSeq[K](tsString[K]("0"), tsRepeat[K](tsString[K]("0")), tsString[K]("3")))
                                                                 rules[vhdlHidPSLExtendedOcurrenceFLPropertyCountSpecification] = tsSeq[K](tsSymbol[K](vhdlPSLCount))
                                                                 rules[vhdlPSLBoundingFLProperty] = tsSeq[K](tsSymbol[K](vhdlHidPSLFLProperty), tsSeq[K](tsChoice[K](tsRegex[K]("[uU][nN][tT][iI][lL]"), tsRegex[K]("[bB][eE][fF][oO][rR][eE]")), tsChoice[K](tsString[K]("!"), tsBlank[K]()), tsChoice[K](tsString[K]("_"), tsBlank[K]())), tsSymbol[K](vhdlHidPSLFLProperty))
                                                                 rules[vhdlDisconnectionSpecification] = tsSeq[K](tsRegex[K]("[dD][iI][sS][cC][oO][nN][nN][eE][cC][tT]"), tsSymbol[K](vhdlGuardedSignalSpecification), tsSymbol[K](vhdlHidAfter), tsString[K](";"))
                                                                 rules[vhdlSensitivityList] = tsChoice[K](tsSymbol[K](vhdlAll), tsSeq[K](tsSymbol[K](vhdlHidSignalName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](vhdlHidSignalName)))))
                                                                 rules[vhdlAbsolutePathname] = tsSeq[K](tsString[K]("."), tsSymbol[K](vhdlHidPartialPathname))
                                                                 rules[vhdlHidProcedureInterfaceDeclaration] = tsChoice[K](tsSymbol[K](vhdlConstantInterfaceDeclaration), tsSymbol[K](vhdlSignalInterfaceDeclaration), tsSymbol[K](vhdlVariableInterfaceDeclaration), tsSymbol[K](vhdlFileInterfaceDeclaration), tsSymbol[K](vhdlHidIllegalInterfaceDeclaration))
                                                                 rules[vhdlAlternativeConditionalWaveforms] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsSymbol[K](vhdlWaveforms), tsChoice[K](tsSymbol[K](vhdlHidWhenClause), tsBlank[K]()))
                                                                 rules[vhdlUnresolved] = tsRegex[K]("[^_ , \x09,\x0B,\\r,\\n,\x0C\"]")
                                                                 rules[vhdlHidVariableMode] = tsChoice[K](tsSymbol[K](vhdlHidIn), tsSymbol[K](vhdlHidOut), tsSymbol[K](vhdlHidInout), tsSymbol[K](vhdlHidBuffer), tsSymbol[K](vhdlHidLinkage))
                                                                 rules[vhdlExtendedDigitBase8] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-7]"), tsRegex[K]("[^0-7#]+")), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-7]"), tsRegex[K]("[^0-7#]+")))), tsChoice[K](tsSymbol[K](vhdlSeparator), tsBlank[K]()))
                                                                 rules[vhdlHidSeverity] = tsSeq[K](tsRegex[K]("[sS][eE][vV][eE][rR][iI][tT][yY]"), tsSymbol[K](vhdlHidSeverityExpression))
                                                                 rules[vhdlHidPrimary] = tsChoice[K](tsSymbol[K](vhdlHidName), tsSymbol[K](vhdlHidLiteral), tsSymbol[K](vhdlAggregate), tsSymbol[K](vhdlQualifiedExpression), tsSymbol[K](vhdlAllocator), tsSymbol[K](vhdlParenthesizedExpression), tsSymbol[K](vhdlFunctionCall))
                                                                 rules[vhdlPSLClockedSERE] = tsSeq[K](tsString[K]("{"), tsSymbol[K](vhdlHidPSLSERE), tsString[K]("}"), tsString[K]("@"), tsSymbol[K](vhdlHidPSLClockExpression))
                                                                 rules[vhdlHidScalarTypeDefinition] = tsChoice[K](tsSymbol[K](vhdlEnumerationTypeDefinition), tsSymbol[K](vhdlHidNumericTypeDefinition), tsSymbol[K](vhdlPhysicalTypeDefinition))
                                                                 rules[vhdlHidElementConstraint] = tsChoice[K](tsSymbol[K](vhdlArrayConstraint), tsSymbol[K](vhdlRecordConstraint))
                                                                 rules[vhdlHidPSLNumber] = tsChoice[K](tsSymbol[K](vhdlHidExpr), tsSymbol[K](vhdlPSLBuiltInFunctionCall))
                                                                 rules[vhdlPhysicalLiteral] = tsSeq[K](tsSymbol[K](vhdlHidAbstractLiteral), tsSymbol[K](vhdlHidUnit))
                                                                 rules[vhdlForceMode] = tsChoice[K](tsSymbol[K](vhdlHidIn), tsSymbol[K](vhdlHidOut))
                                                                 rules[vhdlContextClause] = tsRepeat1[K](tsSymbol[K](vhdlHidContextItem))
                                                                 rules

