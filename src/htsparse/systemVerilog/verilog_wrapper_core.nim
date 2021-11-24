import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  VerilogNodeKind* = enum
    verilogDollarfulskewUnderscoretimingUnderscorecheck   ## $fullskew_timing_check
    verilogDollarholdUnderscoretimingUnderscorecheck      ## $hold_timing_check
    verilogDollarnochangeUnderscoretimingUnderscorecheck  ## $nochange_timing_check
    verilogDollarperiodUnderscoretimingUnderscorecheck    ## $period_timing_check
    verilogDollarrecoveryUnderscoretimingUnderscorecheck  ## $recovery_timing_check
    verilogDollarrecremUnderscoretimingUnderscorecheck    ## $recrem_timing_check
    verilogDollarremovalUnderscoretimingUnderscorecheck   ## $removal_timing_check
    verilogDollarsetupUnderscoretimingUnderscorecheck     ## $setup_timing_check
    verilogDollarsetupholdUnderscoretimingUnderscorecheck ## $setuphold_timing_check
    verilogDollarskewUnderscoretimingUnderscorecheck      ## $skew_timing_check
    verilogDollartimeskewUnderscoretimingUnderscorecheck  ## $timeskew_timing_check
    verilogDollarwidthUnderscoretimingUnderscorecheck     ## $width_timing_check
    verilogOrderedParameterAssignment                     ## _ordered_parameter_assignment
    verilogActionBlock                                    ## action_block
    verilogAlwaysConstruct                                ## always_construct
    verilogAlwaysKeyword                                  ## always_keyword
    verilogAnonymousProgram                               ## anonymous_program
    verilogAnonymousProgramItem                           ## anonymous_program_item
    verilogAnsiPortDeclaration                            ## ansi_port_declaration
    verilogArrayManipulationCall                          ## array_manipulation_call
    verilogArrayMethodName                                ## array_method_name
    verilogArrayRangeExpression                           ## array_range_expression
    verilogAssertPropertyStatement                        ## assert_property_statement
    verilogAssertionVariableDeclaration                   ## assertion_variable_declaration
    verilogAssignmentOperator                             ## assignment_operator
    verilogAssignmentPattern                              ## assignment_pattern
    verilogAssignmentPatternExpression                    ## assignment_pattern_expression
    verilogAssignmentPatternKey                           ## assignment_pattern_key
    verilogAssignmentPatternNetLvalue                     ## assignment_pattern_net_lvalue
    verilogAssignmentPatternVariableLvalue                ## assignment_pattern_variable_lvalue
    verilogAssociativeDimension                           ## associative_dimension
    verilogAssumePropertyStatement                        ## assume_property_statement
    verilogAttrSpec                                       ## attr_spec
    verilogAttributeInstance                              ## attribute_instance
    verilogBeginKeywords                                  ## begin_keywords
    verilogBindDirective                                  ## bind_directive
    verilogBindTargetInstance                             ## bind_target_instance
    verilogBindTargetInstanceList                         ## bind_target_instance_list
    verilogBindTargetScope                                ## bind_target_scope
    verilogBinsExpression                                 ## bins_expression
    verilogBinsKeyword                                    ## bins_keyword
    verilogBinsOrEmpty                                    ## bins_or_empty
    verilogBinsOrOptions                                  ## bins_or_options
    verilogBinsSelection                                  ## bins_selection
    verilogBinsSelectionOrOption                          ## bins_selection_or_option
    verilogBitSelect1                                     ## bit_select1
    verilogBlockEventExpression                           ## block_event_expression
    verilogBlockItemDeclaration                           ## block_item_declaration
    verilogBlockingAssignment                             ## blocking_assignment
    verilogCaseExpression                                 ## case_expression
    verilogCaseGenerateConstruct                          ## case_generate_construct
    verilogCaseGenerateItem                               ## case_generate_item
    verilogCaseInsideItem                                 ## case_inside_item
    verilogCaseItem                                       ## case_item
    verilogCaseItemExpression                             ## case_item_expression
    verilogCaseKeyword                                    ## case_keyword
    verilogCasePatternItem                                ## case_pattern_item
    verilogCaseStatement                                  ## case_statement
    verilogCast                                           ## cast
    verilogCastingType                                    ## casting_type
    verilogCellClause                                     ## cell_clause
    verilogCellIdentifier                                 ## cell_identifier
    verilogChargeStrength                                 ## charge_strength
    verilogCheckerDeclaration                             ## checker_declaration
    verilogCheckerIdentifier                              ## checker_identifier
    verilogCheckerInstantiation                           ## checker_instantiation
    verilogCheckerOrGenerateItemDeclaration               ## checker_or_generate_item_declaration
    verilogCheckerPortDirection                           ## checker_port_direction
    verilogCheckerPortItem                                ## checker_port_item
    verilogCheckerPortList                                ## checker_port_list
    verilogClassConstructorDeclaration                    ## class_constructor_declaration
    verilogClassConstructorPrototype                      ## class_constructor_prototype
    verilogClassDeclaration                               ## class_declaration
    verilogClassIdentifier                                ## class_identifier
    verilogClassItem                                      ## class_item
    verilogClassItemQualifier                             ## class_item_qualifier
    verilogClassMethod                                    ## class_method
    verilogClassNew                                       ## class_new
    verilogClassProperty                                  ## class_property
    verilogClassQualifier                                 ## class_qualifier
    verilogClassScope                                     ## class_scope
    verilogClassType                                      ## class_type
    verilogClockingDeclAssign                             ## clocking_decl_assign
    verilogClockingDeclaration                            ## clocking_declaration
    verilogClockingDirection                              ## clocking_direction
    verilogClockingDrive                                  ## clocking_drive
    verilogClockingEvent                                  ## clocking_event
    verilogClockingIdentifier                             ## clocking_identifier
    verilogClockingItem                                   ## clocking_item
    verilogClockingSkew                                   ## clocking_skew
    verilogClockvar                                       ## clockvar
    verilogClockvarExpression                             ## clockvar_expression
    verilogCmosSwitchInstance                             ## cmos_switch_instance
    verilogCmosSwitchtype                                 ## cmos_switchtype
    verilogCombinationalBody                              ## combinational_body
    verilogCombinationalEntry                             ## combinational_entry
    verilogConcatenation                                  ## concatenation
    verilogConcurrentAssertionItem                        ## concurrent_assertion_item
    verilogCondPattern                                    ## cond_pattern
    verilogCondPredicate                                  ## cond_predicate
    verilogConditionalExpression                          ## conditional_expression
    verilogConditionalStatement                           ## conditional_statement
    verilogConfigIdentifier                               ## config_identifier
    verilogConfigRuleStatement                            ## config_rule_statement
    verilogConsecutiveRepetition                          ## consecutive_repetition
    verilogConstIdentifier                                ## const_identifier
    verilogConstantBitSelect1                             ## constant_bit_select1
    verilogConstantConcatenation                          ## constant_concatenation
    verilogConstantExpression                             ## constant_expression
    verilogConstantIndexedRange                           ## constant_indexed_range
    verilogConstantMintypmaxExpression                    ## constant_mintypmax_expression
    verilogConstantMultipleConcatenation                  ## constant_multiple_concatenation
    verilogConstantParamExpression                        ## constant_param_expression
    verilogConstantPrimary                                ## constant_primary
    verilogConstantRange                                  ## constant_range
    verilogConstantSelect1                                ## constant_select1
    verilogConstraintBlock                                ## constraint_block
    verilogConstraintBlockItem                            ## constraint_block_item
    verilogConstraintDeclaration                          ## constraint_declaration
    verilogConstraintExpression                           ## constraint_expression
    verilogConstraintIdentifier                           ## constraint_identifier
    verilogConstraintPrimary                              ## constraint_primary
    verilogConstraintPrototype                            ## constraint_prototype
    verilogConstraintPrototypeQualifier                   ## constraint_prototype_qualifier
    verilogConstraintSet                                  ## constraint_set
    verilogContinuousAssign                               ## continuous_assign
    verilogControlledReferenceEvent                       ## controlled_reference_event
    verilogCoverCross                                     ## cover_cross
    verilogCoverPoint                                     ## cover_point
    verilogCoverPointIdentifier                           ## cover_point_identifier
    verilogCoverPropertyStatement                         ## cover_property_statement
    verilogCoverSequenceStatement                         ## cover_sequence_statement
    verilogCoverageEvent                                  ## coverage_event
    verilogCoverageOption                                 ## coverage_option
    verilogCoverageSpecOrOption                           ## coverage_spec_or_option
    verilogCovergroupDeclaration                          ## covergroup_declaration
    verilogCovergroupIdentifier                           ## covergroup_identifier
    verilogCovergroupRangeList                            ## covergroup_range_list
    verilogCovergroupValueRange                           ## covergroup_value_range
    verilogCrossBody                                      ## cross_body
    verilogCrossBodyItem                                  ## cross_body_item
    verilogCrossIdentifier                                ## cross_identifier
    verilogCycleDelay                                     ## cycle_delay
    verilogCycleDelayConstRangeExpression                 ## cycle_delay_const_range_expression
    verilogCycleDelayRange                                ## cycle_delay_range
    verilogDataDeclaration                                ## data_declaration
    verilogDataEvent                                      ## data_event
    verilogDataSourceExpression                           ## data_source_expression
    verilogDataType                                       ## data_type
    verilogDataTypeOrImplicit1                            ## data_type_or_implicit1
    verilogDataTypeOrVoid                                 ## data_type_or_void
    verilogDecimalNumber                                  ## decimal_number
    verilogDefaultClause                                  ## default_clause
    verilogDefaultNettypeCompilerDirective                ## default_nettype_compiler_directive
    verilogDefaultNettypeValue                            ## default_nettype_value
    verilogDefaultSkew                                    ## default_skew
    verilogDeferredImmediateAssertStatement               ## deferred_immediate_assert_statement
    verilogDeferredImmediateAssertionItem                 ## deferred_immediate_assertion_item
    verilogDeferredImmediateAssumeStatement               ## deferred_immediate_assume_statement
    verilogDeferredImmediateCoverStatement                ## deferred_immediate_cover_statement
    verilogDefparamAssignment                             ## defparam_assignment
    verilogDelay2                                         ## delay2
    verilogDelay3                                         ## delay3
    verilogDelayControl                                   ## delay_control
    verilogDelayOrEventControl                            ## delay_or_event_control
    verilogDelayValue                                     ## delay_value
    verilogDelayedData                                    ## delayed_data
    verilogDelayedReference                               ## delayed_reference
    verilogDesignStatement                                ## design_statement
    verilogDisableStatement                               ## disable_statement
    verilogDistItem                                       ## dist_item
    verilogDistList                                       ## dist_list
    verilogDistWeight                                     ## dist_weight
    verilogDoubleQuotedString                             ## double_quoted_string
    verilogDpiFunctionImportProperty                      ## dpi_function_import_property
    verilogDpiFunctionProto                               ## dpi_function_proto
    verilogDpiImportExport                                ## dpi_import_export
    verilogDpiSpecString                                  ## dpi_spec_string
    verilogDpiTaskImportProperty                          ## dpi_task_import_property
    verilogDpiTaskProto                                   ## dpi_task_proto
    verilogDriveStrength                                  ## drive_strength
    verilogDynamicArrayNew                                ## dynamic_array_new
    verilogEdgeControlSpecifier                           ## edge_control_specifier
    verilogEdgeDescriptor                                 ## edge_descriptor
    verilogEdgeIdentifier                                 ## edge_identifier
    verilogEdgeIndicator                                  ## edge_indicator
    verilogEdgeInputList                                  ## edge_input_list
    verilogEdgeSensitivePathDeclaration                   ## edge_sensitive_path_declaration
    verilogElaborationSystemTask                          ## elaboration_system_task
    verilogEmptyUnpackedArrayConcatenation                ## empty_unpacked_array_concatenation
    verilogEnableGateInstance                             ## enable_gate_instance
    verilogEnableGatetype                                 ## enable_gatetype
    verilogEnableTerminal                                 ## enable_terminal
    verilogEndEdgeOffset                                  ## end_edge_offset
    verilogEnumBaseType                                   ## enum_base_type
    verilogEnumIdentifier                                 ## enum_identifier
    verilogEnumNameDeclaration                            ## enum_name_declaration
    verilogErrorLimitValue                                ## error_limit_value
    verilogEscapedIdentifier                              ## escaped_identifier
    verilogEventBasedFlag                                 ## event_based_flag
    verilogEventControl                                   ## event_control
    verilogEventExpression                                ## event_expression
    verilogEventTrigger                                   ## event_trigger
    verilogExpectPropertyStatement                        ## expect_property_statement
    verilogExpression                                     ## expression
    verilogExpressionOrDist                               ## expression_or_dist
    verilogExternConstraintDeclaration                    ## extern_constraint_declaration
    verilogExternTfDeclaration                            ## extern_tf_declaration
    verilogFinalConstruct                                 ## final_construct
    verilogFinishNumber                                   ## finish_number
    verilogForInitialization                              ## for_initialization
    verilogForStep                                        ## for_step
    verilogForVariableDeclaration                         ## for_variable_declaration
    verilogFormalArgument                                 ## formal_argument
    verilogFormalIdentifier                               ## formal_identifier
    verilogFormalPortIdentifier                           ## formal_port_identifier
    verilogFullEdgeSensitivePathDescription               ## full_edge_sensitive_path_description
    verilogFullPathDescription                            ## full_path_description
    verilogFunctionBodyDeclaration                        ## function_body_declaration
    verilogFunctionDataTypeOrImplicit1                    ## function_data_type_or_implicit1
    verilogFunctionDeclaration                            ## function_declaration
    verilogFunctionIdentifier                             ## function_identifier
    verilogFunctionPrototype                              ## function_prototype
    verilogFunctionStatement                              ## function_statement
    verilogFunctionStatementOrNull                        ## function_statement_or_null
    verilogFunctionSubroutineCall                         ## function_subroutine_call
    verilogGateInstantiation                              ## gate_instantiation
    verilogGenerateBlock                                  ## generate_block
    verilogGenerateBlockIdentifier                        ## generate_block_identifier
    verilogGenerateRegion                                 ## generate_region
    verilogGenvarDeclaration                              ## genvar_declaration
    verilogGenvarIdentifier                               ## genvar_identifier
    verilogGenvarInitialization                           ## genvar_initialization
    verilogGenvarIteration                                ## genvar_iteration
    verilogGotoRepetition                                 ## goto_repetition
    verilogHierarchicalBtfIdentifier                      ## hierarchical_btf_identifier
    verilogHierarchicalInstance                           ## hierarchical_instance
    verilogIdDirective                                    ## id_directive
    verilogIdentifierList                                 ## identifier_list
    verilogIfGenerateConstruct                            ## if_generate_construct
    verilogImplicitClassHandle                            ## implicit_class_handle
    verilogImplicitDataType1                              ## implicit_data_type1
    verilogImportExport                                   ## import_export
    verilogIncOrDecExpression                             ## inc_or_dec_expression
    verilogIncOrDecOperator                               ## inc_or_dec_operator
    verilogIncludeCompilerDirective                       ## include_compiler_directive
    verilogIncludeCompilerDirectiveStandard               ## include_compiler_directive_standard
    verilogIndexVariableIdentifier                        ## index_variable_identifier
    verilogIndexedRange                                   ## indexed_range
    verilogInitVal                                        ## init_val
    verilogInitialConstruct                               ## initial_construct
    verilogInoutDeclaration                               ## inout_declaration
    verilogInoutPortIdentifier                            ## inout_port_identifier
    verilogInoutTerminal                                  ## inout_terminal
    verilogInputDeclaration                               ## input_declaration
    verilogInputIdentifier                                ## input_identifier
    verilogInputPortIdentifier                            ## input_port_identifier
    verilogInputTerminal                                  ## input_terminal
    verilogInsideExpression                               ## inside_expression
    verilogInstClause                                     ## inst_clause
    verilogInstName                                       ## inst_name
    verilogInstanceIdentifier                             ## instance_identifier
    verilogIntegerAtomType                                ## integer_atom_type
    verilogIntegerVectorType                              ## integer_vector_type
    verilogIntegralNumber                                 ## integral_number
    verilogInterfaceAnsiHeader                            ## interface_ansi_header
    verilogInterfaceClassDeclaration                      ## interface_class_declaration
    verilogInterfaceClassItem                             ## interface_class_item
    verilogInterfaceClassMethod                           ## interface_class_method
    verilogInterfaceClassType                             ## interface_class_type
    verilogInterfaceDeclaration                           ## interface_declaration
    verilogInterfaceIdentifier                            ## interface_identifier
    verilogInterfaceInstanceIdentifier                    ## interface_instance_identifier
    verilogInterfaceInstantiation                         ## interface_instantiation
    verilogInterfaceItem                                  ## interface_item
    verilogInterfaceNonansiHeader                         ## interface_nonansi_header
    verilogInterfaceOrGenerateItem                        ## interface_or_generate_item
    verilogInterfacePortDeclaration                       ## interface_port_declaration
    verilogInterfacePortHeader                            ## interface_port_header
    verilogJoinKeyword                                    ## join_keyword
    verilogJumpStatement                                  ## jump_statement
    verilogLetActualArg                                   ## let_actual_arg
    verilogLetDeclaration                                 ## let_declaration
    verilogLetExpression                                  ## let_expression
    verilogLetFormalType1                                 ## let_formal_type1
    verilogLetListOfArguments                             ## let_list_of_arguments
    verilogLetPortItem                                    ## let_port_item
    verilogLetPortList                                    ## let_port_list
    verilogLevelInputList                                 ## level_input_list
    verilogLiblistClause                                  ## liblist_clause
    verilogLibraryIdentifier                              ## library_identifier
    verilogLifetime                                       ## lifetime
    verilogLimitValue                                     ## limit_value
    verilogLineCompilerDirective                          ## line_compiler_directive
    verilogListOfActualArguments                          ## list_of_actual_arguments
    verilogListOfArguments                                ## list_of_arguments
    verilogListOfArgumentsParent                          ## list_of_arguments_parent
    verilogListOfClockingDeclAssign                       ## list_of_clocking_decl_assign
    verilogListOfCrossItems                               ## list_of_cross_items
    verilogListOfDefparamAssignments                      ## list_of_defparam_assignments
    verilogListOfFormalArguments                          ## list_of_formal_arguments
    verilogListOfGenvarIdentifiers                        ## list_of_genvar_identifiers
    verilogListOfInterfaceIdentifiers                     ## list_of_interface_identifiers
    verilogListOfNetAssignments                           ## list_of_net_assignments
    verilogListOfNetDeclAssignments                       ## list_of_net_decl_assignments
    verilogListOfParamAssignments                         ## list_of_param_assignments
    verilogListOfParameterAssignments                     ## list_of_parameter_assignments
    verilogListOfPathDelayExpressions                     ## list_of_path_delay_expressions
    verilogListOfPathInputs                               ## list_of_path_inputs
    verilogListOfPathOutputs                              ## list_of_path_outputs
    verilogListOfPortConnections                          ## list_of_port_connections
    verilogListOfPortDeclarations                         ## list_of_port_declarations
    verilogListOfPortIdentifiers                          ## list_of_port_identifiers
    verilogListOfPorts                                    ## list_of_ports
    verilogListOfSpecparamAssignments                     ## list_of_specparam_assignments
    verilogListOfTfVariableIdentifiers                    ## list_of_tf_variable_identifiers
    verilogListOfTypeAssignments                          ## list_of_type_assignments
    verilogListOfUdpPortIdentifiers                       ## list_of_udp_port_identifiers
    verilogListOfVariableAssignments                      ## list_of_variable_assignments
    verilogListOfVariableDeclAssignments                  ## list_of_variable_decl_assignments
    verilogListOfVariableIdentifiers                      ## list_of_variable_identifiers
    verilogListOfVariablePortIdentifiers                  ## list_of_variable_port_identifiers
    verilogLocalParameterDeclaration                      ## local_parameter_declaration
    verilogLoopGenerateConstruct                          ## loop_generate_construct
    verilogLoopStatement                                  ## loop_statement
    verilogLoopVariables1                                 ## loop_variables1
    verilogMemberIdentifier                               ## member_identifier
    verilogMethodCall                                     ## method_call
    verilogMethodCallBody                                 ## method_call_body
    verilogMethodIdentifier                               ## method_identifier
    verilogMethodQualifier                                ## method_qualifier
    verilogMintypmaxExpression                            ## mintypmax_expression
    verilogModportClockingDeclaration                     ## modport_clocking_declaration
    verilogModportDeclaration                             ## modport_declaration
    verilogModportIdentifier                              ## modport_identifier
    verilogModportItem                                    ## modport_item
    verilogModportPortsDeclaration                        ## modport_ports_declaration
    verilogModportSimplePort                              ## modport_simple_port
    verilogModportSimplePortsDeclaration                  ## modport_simple_ports_declaration
    verilogModportTfPortsDeclaration                      ## modport_tf_ports_declaration
    verilogModuleAnsiHeader                               ## module_ansi_header
    verilogModuleDeclaration                              ## module_declaration
    verilogModuleHeader                                   ## module_header
    verilogModuleInstantiation                            ## module_instantiation
    verilogModuleKeyword                                  ## module_keyword
    verilogModuleNonansiHeader                            ## module_nonansi_header
    verilogModuleOrGenerateItem                           ## module_or_generate_item
    verilogModulePathConcatenation                        ## module_path_concatenation
    verilogModulePathExpression                           ## module_path_expression
    verilogModulePathMintypmaxExpression                  ## module_path_mintypmax_expression
    verilogModulePathMultipleConcatenation                ## module_path_multiple_concatenation
    verilogModulePathPrimary                              ## module_path_primary
    verilogMosSwitchInstance                              ## mos_switch_instance
    verilogMosSwitchtype                                  ## mos_switchtype
    verilogMultipleConcatenation                          ## multiple_concatenation
    verilogNInputGateInstance                             ## n_input_gate_instance
    verilogNInputGatetype                                 ## n_input_gatetype
    verilogNOutputGateInstance                            ## n_output_gate_instance
    verilogNOutputGatetype                                ## n_output_gatetype
    verilogNameOfInstance                                 ## name_of_instance
    verilogNamedParameterAssignment                       ## named_parameter_assignment
    verilogNamedPortConnection                            ## named_port_connection
    verilogNcontrolTerminal                               ## ncontrol_terminal
    verilogNetAlias                                       ## net_alias
    verilogNetAssignment                                  ## net_assignment
    verilogNetDeclAssignment                              ## net_decl_assignment
    verilogNetDeclaration                                 ## net_declaration
    verilogNetLvalue                                      ## net_lvalue
    verilogNetPortHeader1                                 ## net_port_header1
    verilogNetPortType1                                   ## net_port_type1
    verilogNetType                                        ## net_type
    verilogNetTypeDeclaration                             ## net_type_declaration
    verilogNextState                                      ## next_state
    verilogNonConsecutiveRepetition                       ## non_consecutive_repetition
    verilogNonIntegerType                                 ## non_integer_type
    verilogNonPortProgramItem                             ## non_port_program_item
    verilogNonblockingAssignment                          ## nonblocking_assignment
    verilogNonrangeSelect1                                ## nonrange_select1
    verilogNonrangeVariableLvalue                         ## nonrange_variable_lvalue
    verilogNotifier                                       ## notifier
    verilogOpenRangeList                                  ## open_range_list
    verilogOpenValueRange                                 ## open_value_range
    verilogOperatorAssignment                             ## operator_assignment
    verilogOrderedPortConnection                          ## ordered_port_connection
    verilogOutputDeclaration                              ## output_declaration
    verilogOutputIdentifier                               ## output_identifier
    verilogOutputPortIdentifier                           ## output_port_identifier
    verilogOutputTerminal                                 ## output_terminal
    verilogOverloadDeclaration                            ## overload_declaration
    verilogOverloadOperator                               ## overload_operator
    verilogOverloadProtoFormals                           ## overload_proto_formals
    verilogPackageDeclaration                             ## package_declaration
    verilogPackageExportDeclaration                       ## package_export_declaration
    verilogPackageIdentifier                              ## package_identifier
    verilogPackageImportDeclaration                       ## package_import_declaration
    verilogPackageImportItem                              ## package_import_item
    verilogPackageOrGenerateItemDeclaration               ## package_or_generate_item_declaration
    verilogPackageScope                                   ## package_scope
    verilogPackedDimension                                ## packed_dimension
    verilogParBlock                                       ## par_block
    verilogParallelEdgeSensitivePathDescription           ## parallel_edge_sensitive_path_description
    verilogParallelPathDescription                        ## parallel_path_description
    verilogParamAssignment                                ## param_assignment
    verilogParamExpression                                ## param_expression
    verilogParameterDeclaration                           ## parameter_declaration
    verilogParameterIdentifier                            ## parameter_identifier
    verilogParameterOverride                              ## parameter_override
    verilogParameterPortDeclaration                       ## parameter_port_declaration
    verilogParameterPortList                              ## parameter_port_list
    verilogParameterValueAssignment                       ## parameter_value_assignment
    verilogPassEnSwitchtype                               ## pass_en_switchtype
    verilogPassEnableSwitchInstance                       ## pass_enable_switch_instance
    verilogPassSwitchInstance                             ## pass_switch_instance
    verilogPassSwitchtype                                 ## pass_switchtype
    verilogPathDeclaration                                ## path_declaration
    verilogPathDelayExpression                            ## path_delay_expression
    verilogPathDelayValue                                 ## path_delay_value
    verilogPattern                                        ## pattern
    verilogPcontrolTerminal                               ## pcontrol_terminal
    verilogPolarityOperator                               ## polarity_operator
    verilogPort                                           ## port
    verilogPortDeclaration                                ## port_declaration
    verilogPortDirection                                  ## port_direction
    verilogPortIdentifier                                 ## port_identifier
    verilogPortReference                                  ## port_reference
    verilogPrimary                                        ## primary
    verilogPrimaryLiteral                                 ## primary_literal
    verilogProceduralContinuousAssignment                 ## procedural_continuous_assignment
    verilogProceduralTimingControlStatement               ## procedural_timing_control_statement
    verilogProductionIdentifier                           ## production_identifier
    verilogProgramAnsiHeader                              ## program_ansi_header
    verilogProgramDeclaration                             ## program_declaration
    verilogProgramIdentifier                              ## program_identifier
    verilogProgramInstantiation                           ## program_instantiation
    verilogProgramItem                                    ## program_item
    verilogProgramNonansiHeader                           ## program_nonansi_header
    verilogPropertyCaseItem                               ## property_case_item
    verilogPropertyDeclaration                            ## property_declaration
    verilogPropertyExpr                                   ## property_expr
    verilogPropertyFormalType1                            ## property_formal_type1
    verilogPropertyIdentifier                             ## property_identifier
    verilogPropertyListOfArguments                        ## property_list_of_arguments
    verilogPropertyLvarPortDirection                      ## property_lvar_port_direction
    verilogPropertyPortItem                               ## property_port_item
    verilogPropertyPortList                               ## property_port_list
    verilogPropertySpec                                   ## property_spec
    verilogPsIdentifier                                   ## ps_identifier
    verilogPsOrHierarchicalArrayIdentifier                ## ps_or_hierarchical_array_identifier
    verilogPullGateInstance                               ## pull_gate_instance
    verilogPulldownStrength                               ## pulldown_strength
    verilogPullupStrength                                 ## pullup_strength
    verilogPulseControlSpecparam                          ## pulse_control_specparam
    verilogPulsestyleDeclaration                          ## pulsestyle_declaration
    verilogQueueDimension                                 ## queue_dimension
    verilogRandcaseItem                                   ## randcase_item
    verilogRandcaseStatement                              ## randcase_statement
    verilogRandomQualifier                                ## random_qualifier
    verilogRandomizeCall                                  ## randomize_call
    verilogRangeExpression                                ## range_expression
    verilogRealNumber                                     ## real_number
    verilogRefDeclaration                                 ## ref_declaration
    verilogReferenceEvent                                 ## reference_event
    verilogRejectLimitValue                               ## reject_limit_value
    verilogRemainActiveFlag                               ## remain_active_flag
    verilogRepeatRange                                    ## repeat_range
    verilogRestrictPropertyStatement                      ## restrict_property_statement
    verilogScalarConstant                                 ## scalar_constant
    verilogScalarTimingCheckCondition                     ## scalar_timing_check_condition
    verilogSelect1                                        ## select1
    verilogSelectCondition                                ## select_condition
    verilogSelectExpression                               ## select_expression
    verilogSeqBlock                                       ## seq_block
    verilogSequenceAbbrev                                 ## sequence_abbrev
    verilogSequenceDeclaration                            ## sequence_declaration
    verilogSequenceExpr                                   ## sequence_expr
    verilogSequenceFormalType1                            ## sequence_formal_type1
    verilogSequenceInstance                               ## sequence_instance
    verilogSequenceListOfArguments                        ## sequence_list_of_arguments
    verilogSequenceLvarPortDirection                      ## sequence_lvar_port_direction
    verilogSequenceMethodCall                             ## sequence_method_call
    verilogSequencePortItem                               ## sequence_port_item
    verilogSequencePortList                               ## sequence_port_list
    verilogSequentialBody                                 ## sequential_body
    verilogSequentialEntry                                ## sequential_entry
    verilogShowcancelledDeclaration                       ## showcancelled_declaration
    verilogSimpleImmediateAssertStatement                 ## simple_immediate_assert_statement
    verilogSimpleImmediateAssumeStatement                 ## simple_immediate_assume_statement
    verilogSimpleImmediateCoverStatement                  ## simple_immediate_cover_statement
    verilogSimplePathDeclaration                          ## simple_path_declaration
    verilogSimpleTextMacroUsage                           ## simple_text_macro_usage
    verilogSliceSize                                      ## slice_size
    verilogSolveBeforeList                                ## solve_before_list
    verilogSourceFile                                     ## source_file
    verilogSpecifyBlock                                   ## specify_block
    verilogSpecifyInputTerminalDescriptor                 ## specify_input_terminal_descriptor
    verilogSpecifyOutputTerminalDescriptor                ## specify_output_terminal_descriptor
    verilogSpecparamAssignment                            ## specparam_assignment
    verilogSpecparamDeclaration                           ## specparam_declaration
    verilogSpecparamIdentifier                            ## specparam_identifier
    verilogStartEdgeOffset                                ## start_edge_offset
    verilogStateDependentPathDeclaration                  ## state_dependent_path_declaration
    verilogStatement                                      ## statement
    verilogStatementItem                                  ## statement_item
    verilogStatementOrNull                                ## statement_or_null
    verilogStreamConcatenation                            ## stream_concatenation
    verilogStreamExpression                               ## stream_expression
    verilogStreamOperator                                 ## stream_operator
    verilogStreamingConcatenation                         ## streaming_concatenation
    verilogStrength0                                      ## strength0
    verilogStrength1                                      ## strength1
    verilogStringLiteral                                  ## string_literal
    verilogStructUnion                                    ## struct_union
    verilogStructUnionMember                              ## struct_union_member
    verilogSubroutineCall                                 ## subroutine_call
    verilogSystemTfCall                                   ## system_tf_call
    verilogTaggedUnionExpression                          ## tagged_union_expression
    verilogTaskBodyDeclaration                            ## task_body_declaration
    verilogTaskDeclaration                                ## task_declaration
    verilogTaskIdentifier                                 ## task_identifier
    verilogTaskPrototype                                  ## task_prototype
    verilogTerminalIdentifier                             ## terminal_identifier
    verilogTextMacroDefinition                            ## text_macro_definition
    verilogTextMacroIdentifier                            ## text_macro_identifier
    verilogTextMacroName                                  ## text_macro_name
    verilogTextMacroUsage                                 ## text_macro_usage
    verilogTfCall                                         ## tf_call
    verilogTfIdentifier                                   ## tf_identifier
    verilogTfItemDeclaration                              ## tf_item_declaration
    verilogTfPortDeclaration                              ## tf_port_declaration
    verilogTfPortDirection                                ## tf_port_direction
    verilogTfPortItem1                                    ## tf_port_item1
    verilogTfPortList                                     ## tf_port_list
    verilogThreshold                                      ## threshold
    verilogTimeLiteral                                    ## time_literal
    verilogTimeUnit                                       ## time_unit
    verilogTimecheckCondition                             ## timecheck_condition
    verilogTimescaleCompilerDirective                     ## timescale_compiler_directive
    verilogTimestampCondition                             ## timestamp_condition
    verilogTimeunitsDeclaration                           ## timeunits_declaration
    verilogTimingCheckCondition                           ## timing_check_condition
    verilogTimingCheckEvent                               ## timing_check_event
    verilogTimingCheckEventControl                        ## timing_check_event_control
    verilogTimingCheckLimit                               ## timing_check_limit
    verilogTopmoduleIdentifier                            ## topmodule_identifier
    verilogTransItem                                      ## trans_item
    verilogTransList                                      ## trans_list
    verilogTransRangeList                                 ## trans_range_list
    verilogTransSet                                       ## trans_set
    verilogTypeAssignment                                 ## type_assignment
    verilogTypeDeclaration                                ## type_declaration
    verilogTypeReference                                  ## type_reference
    verilogUdpAnsiDeclaration                             ## udp_ansi_declaration
    verilogUdpDeclaration                                 ## udp_declaration
    verilogUdpDeclarationPortList                         ## udp_declaration_port_list
    verilogUdpInitialStatement                            ## udp_initial_statement
    verilogUdpInputDeclaration                            ## udp_input_declaration
    verilogUdpInstance                                    ## udp_instance
    verilogUdpInstantiation                               ## udp_instantiation
    verilogUdpNonansiDeclaration                          ## udp_nonansi_declaration
    verilogUdpOutputDeclaration                           ## udp_output_declaration
    verilogUdpPortDeclaration                             ## udp_port_declaration
    verilogUdpPortList                                    ## udp_port_list
    verilogUdpRegDeclaration                              ## udp_reg_declaration
    verilogUnaryOperator                                  ## unary_operator
    verilogUnbasedUnsizedLiteral                          ## unbased_unsized_literal
    verilogUnconnectedDrive                               ## unconnected_drive
    verilogUniquePriority                                 ## unique_priority
    verilogUniquenessConstraint                           ## uniqueness_constraint
    verilogUnpackedDimension                              ## unpacked_dimension
    verilogUnsizedDimension                               ## unsized_dimension
    verilogUseClause                                      ## use_clause
    verilogValueRange                                     ## value_range
    verilogVariableAssignment                             ## variable_assignment
    verilogVariableDeclAssignment                         ## variable_decl_assignment
    verilogVariableIdentifierList                         ## variable_identifier_list
    verilogVariableLvalue                                 ## variable_lvalue
    verilogVariablePortHeader                             ## variable_port_header
    verilogWaitStatement                                  ## wait_statement
    verilogZeroDirective                                  ## zero_directive
    verilogNewlineTok                                     ##
                                                          ##
    verilogExclamationTok                                 ## !
    verilogExclamationEqualTok                            ## !=
    verilogExclamationDoubleEqualTok                      ## !==
    verilogExclamationEqualQuestionTok                    ## !=?
    verilogQuoteTok                                       ## "
    verilogQuoteDPIQuoteTok                               ## "DPI"
    verilogQuoteDPIMinusCQuoteTok                         ## "DPI-C"
    verilogHashTok                                        ## #
    verilogDoubleHashTok                                  ## ##
    verilogDoubleHashLBrackAsteriskRBrackTok              ## ##[*]
    verilogDoubleHashLBrackPlusRBrackTok                  ## ##[+]
    verilogHashMinusHashTok                               ## #-#
    verilogHash0Tok                                       ## #0
    verilogHashEqualHashTok                               ## #=#
    verilogDollarTok                                      ## $
    verilogDollarerorTok                                  ## $error
    verilogDollarfatalTok                                 ## $fatal
    verilogDollarfulskewTok                               ## $fullskew
    verilogDollarholdTok                                  ## $hold
    verilogDollarinfoTok                                  ## $info
    verilogDollarnochangeTok                              ## $nochange
    verilogDollarperiodTok                                ## $period
    verilogDollarrecoveryTok                              ## $recovery
    verilogDollarrecremTok                                ## $recrem
    verilogDollarremovalTok                               ## $removal
    verilogDollarrotTok                                   ## $root
    verilogDollarsetupTok                                 ## $setup
    verilogDollarsetupholdTok                             ## $setuphold
    verilogDollarskewTok                                  ## $skew
    verilogDollartimeskewTok                              ## $timeskew
    verilogDollarunitTok                                  ## $unit
    verilogDollarwarningTok                               ## $warning
    verilogDollarwidthTok                                 ## $width
    verilogPercentTok                                     ## %
    verilogPercentEqualTok                                ## %=
    verilogAmpersandTok                                   ## &
    verilogDoubleAmpersandTok                             ## &&
    verilogTripleAmpersandTok                             ## &&&
    verilogAmpersandEqualTok                              ## &=
    verilogApostropheTok                                  ## '
    verilogApostrophe0Tok                                 ## '0
    verilogApostrophe1Tok                                 ## '1
    verilogApostropheB0Tok                                ## 'B0
    verilogApostropheB1Tok                                ## 'B1
    verilogApostropheb0Tok1                               ## 'b0
    verilogApostropheb1Tok1                               ## 'b1
    verilogApostropheLCurlyTok                            ## '{
    verilogLParTok                                        ## (
    verilogLParAsteriskTok                                ## (*
    verilogRParTok                                        ## )
    verilogAsteriskTok                                    ## *
    verilogAsteriskRParTok                                ## *)
    verilogDoubleAsteriskTok                              ## **
    verilogAsteriskDoubleColonAsteriskTok                 ## *::*
    verilogAsteriskEqualTok                               ## *=
    verilogAsteriskGreaterThanTok                         ## *>
    verilogPlusTok                                        ## +
    verilogDoublePlusTok                                  ## ++
    verilogPlusColonTok                                   ## +:
    verilogPlusEqualTok                                   ## +=
    verilogCommaTok                                       ## ,
    verilogMinusTok                                       ## -
    verilogDoubleMinusTok                                 ## --
    verilogMinusColonTok                                  ## -:
    verilogMinusEqualTok                                  ## -=
    verilogMinusGreaterThanTok                            ## ->
    verilogMinusDoubleGreaterThanTok                      ## ->>
    verilogDotTok                                         ## .
    verilogDotAsteriskTok                                 ## .*
    verilogSlashTok                                       ## /
    verilogSlashEqualTok                                  ## /=
    verilog0Tok                                           ## 0
    verilog01Tok                                          ## 01
    verilog1Tok                                           ## 1
    verilog1ApostropheB0Tok                               ## 1'B0
    verilog1ApostropheB1Tok                               ## 1'B1
    verilog1ApostropheBXTok                               ## 1'BX
    verilog1ApostropheBxTok1                              ## 1'Bx
    verilog1Apostropheb0Tok1                              ## 1'b0
    verilog1Apostropheb1Tok1                              ## 1'b1
    verilog1ApostrophebXTok2                              ## 1'bX
    verilog1ApostrophebxTok3                              ## 1'bx
    verilog10Tok                                          ## 10
    verilog1stepTok                                       ## 1step
    verilog2Tok                                           ## 2
    verilogColonTok                                       ## :
    verilogColonSlashTok                                  ## :/
    verilogDoubleColonTok                                 ## ::
    verilogColonEqualTok                                  ## :=
    verilogSemicolonTok                                   ## ;
    verilogLessThanTok                                    ## <
    verilogLessThanMinusGreaterThanTok                    ## <->
    verilogDoubleLessThanTok                              ## <<
    verilogTripleLessThanTok                              ## <<<
    verilogTripleLessThanEqualTok                         ## <<<=
    verilogDoubleLessThanEqualTok                         ## <<=
    verilogLessThanEqualTok                               ## <=
    verilogEqualTok                                       ## =
    verilogDoubleEqualTok                                 ## ==
    verilogTripleEqualTok                                 ## ===
    verilogDoubleEqualQuestionTok                         ## ==?
    verilogEqualGreaterThanTok                            ## =>
    verilogGreaterThanTok                                 ## >
    verilogGreaterThanEqualTok                            ## >=
    verilogDoubleGreaterThanTok                           ## >>
    verilogDoubleGreaterThanEqualTok                      ## >>=
    verilogTripleGreaterThanTok                           ## >>>
    verilogTripleGreaterThanEqualTok                      ## >>>=
    verilogQuestionTok                                    ## ?
    verilogAtTok                                          ## @
    verilogAtAsteriskTok                                  ## @*
    verilogDoubleAtTok                                    ## @@
    verilogPATHPULSEDollarEqualTok                        ## PATHPULSE$=
    verilogLBrackTok                                      ## [
    verilogLBrackAsteriskTok                              ## [*
    verilogLBrackAsteriskRBrackTok                        ## [*]
    verilogLBrackPlusRBrackTok                            ## [+]
    verilogLBrackMinusGreaterThanTok                      ## [->
    verilogLBrackEqualTok                                 ## [=
    verilogLBrack–GreaterThanTok                        ## [–>
    verilogBackslashTok                                   ## \
    verilogRBrackTok                                      ## ]
    verilogAccentTok                                      ## ^
    verilogAccentEqualTok                                 ## ^=
    verilogAccentTildeTok                                 ## ^~
    verilogBacktickTok                                    ## `
    verilogAcceptOnTok                                    ## accept_on
    verilogAliasTok                                       ## alias
    verilogAlwaysTok                                      ## always
    verilogAlwaysCombTok                                  ## always_comb
    verilogAlwaysFfTok                                    ## always_ff
    verilogAlwaysLatchTok                                 ## always_latch
    verilogAndTok                                         ## and
    verilogAssertTok                                      ## assert
    verilogAssignTok                                      ## assign
    verilogAssumeTok                                      ## assume
    verilogAutomaticTok                                   ## automatic
    verilogBeforeTok                                      ## before
    verilogBeginTok                                       ## begin
    verilogBinaryNumber                                   ## binary_number
    verilogBindTok                                        ## bind
    verilogBinsTok                                        ## bins
    verilogBinsofTok                                      ## binsof
    verilogBitTok                                         ## bit
    verilogBreakTok                                       ## break
    verilogBufTok                                         ## buf
    verilogBufif0Tok                                      ## bufif0
    verilogBufif1Tok                                      ## bufif1
    verilogByteTok                                        ## byte
    verilogCIdentifier                                    ## c_identifier
    verilogCaseTok                                        ## case
    verilogCasexTok                                       ## casex
    verilogCasezTok                                       ## casez
    verilogCellTok                                        ## cell
    verilogChandleTok                                     ## chandle
    verilogCheckerTok                                     ## checker
    verilogClassTok                                       ## class
    verilogClockingTok                                    ## clocking
    verilogCmosTok                                        ## cmos
    verilogComment                                        ## comment
    verilogConfigTok                                      ## config
    verilogConstTok                                       ## const
    verilogConstraintTok                                  ## constraint
    verilogContextTok                                     ## context
    verilogContinueTok                                    ## continue
    verilogCoverTok                                       ## cover
    verilogCovergroupTok                                  ## covergroup
    verilogCoverpointTok                                  ## coverpoint
    verilogCrossTok                                       ## cross
    verilogDeassignTok                                    ## deassign
    verilogDefaultTok                                     ## default
    verilogDefaultText                                    ## default_text
    verilogDefparamTok                                    ## defparam
    verilogDesignTok                                      ## design
    verilogDirectiveBeginKeywordsTok                      ## directive_begin_keywords
    verilogDirectiveCelldefineTok                         ## directive_celldefine
    verilogDirectiveDefaultNettypeTok                     ## directive_default_nettype
    verilogDirectiveDefineTok                             ## directive_define
    verilogDirectiveElseTok                               ## directive_else
    verilogDirectiveElsifTok                              ## directive_elsif
    verilogDirectiveEndKeywordsTok                        ## directive_end_keywords
    verilogDirectiveEndcelldefineTok                      ## directive_endcelldefine
    verilogDirectiveEndifTok                              ## directive_endif
    verilogDirectiveIfdefTok                              ## directive_ifdef
    verilogDirectiveIfndefTok                             ## directive_ifndef
    verilogDirectiveIncludeTok                            ## directive_include
    verilogDirectiveLineTok                               ## directive_line
    verilogDirectiveNounconnectedDriveTok                 ## directive_nounconnected_drive
    verilogDirectiveResetallTok                           ## directive_resetall
    verilogDirectiveTimescaleTok                          ## directive_timescale
    verilogDirectiveUnconnectedDriveTok                   ## directive_unconnected_drive
    verilogDirectiveUndefTok                              ## directive_undef
    verilogDirectiveUndefineallTok                        ## directive_undefineall
    verilogDisableTok                                     ## disable
    verilogDistTok                                        ## dist
    verilogDoTok                                          ## do
    verilogEdgeTok                                        ## edge
    verilogEdgeSymbol                                     ## edge_symbol
    verilogElseTok                                        ## else
    verilogEndTok                                         ## end
    verilogEndcaseTok                                     ## endcase
    verilogEndcheckerTok                                  ## endchecker
    verilogEndclassTok                                    ## endclass
    verilogEndclockingTok                                 ## endclocking
    verilogEndconfigTok                                   ## endconfig
    verilogEndfunctionTok                                 ## endfunction
    verilogEndgenerateTok                                 ## endgenerate
    verilogEndgroupTok                                    ## endgroup
    verilogEndinterfaceTok                                ## endinterface
    verilogEndmoduleTok                                   ## endmodule
    verilogEndpackageTok                                  ## endpackage
    verilogEndprimitiveTok                                ## endprimitive
    verilogEndprogramTok                                  ## endprogram
    verilogEndpropertyTok                                 ## endproperty
    verilogEndsequenceTok                                 ## endsequence
    verilogEndspecifyTok                                  ## endspecify
    verilogEndtableTok                                    ## endtable
    verilogEndtaskTok                                     ## endtask
    verilogEnumTok                                        ## enum
    verilogEventTok                                       ## event
    verilogEventuallyTok                                  ## eventually
    verilogExpectTok                                      ## expect
    verilogExportTok                                      ## export
    verilogExtendsTok                                     ## extends
    verilogExternTok                                      ## extern
    verilogFinalTok                                       ## final
    verilogFirstMatchTok                                  ## first_match
    verilogFixedPointNumber                               ## fixed_point_number
    verilogForTok                                         ## for
    verilogForceTok                                       ## force
    verilogForeachTok                                     ## foreach
    verilogForeverTok                                     ## forever
    verilogForkTok                                        ## fork
    verilogForkjoinTok                                    ## forkjoin
    verilogFsTok                                          ## fs
    verilogFunctionTok                                    ## function
    verilogGenerateTok                                    ## generate
    verilogGenvarTok                                      ## genvar
    verilogGlobalTok                                      ## global
    verilogHexNumber                                      ## hex_number
    verilogHighz0Tok                                      ## highz0
    verilogHighz1Tok                                      ## highz1
    verilogIfTok                                          ## if
    verilogIffTok                                         ## iff
    verilogIfnoneTok                                      ## ifnone
    verilogIgnoreBinsTok                                  ## ignore_bins
    verilogIllegalBinsTok                                 ## illegal_bins
    verilogImplementsTok                                  ## implements
    verilogImpliesTok                                     ## implies
    verilogImportTok                                      ## import
    verilogInitialTok                                     ## initial
    verilogInoutTok                                       ## inout
    verilogInputTok                                       ## input
    verilogInsideTok                                      ## inside
    verilogInstanceTok                                    ## instance
    verilogIntTok                                         ## int
    verilogIntegerTok                                     ## integer
    verilogInterconnectTok                                ## interconnect
    verilogInterfaceTok                                   ## interface
    verilogIntersectTok                                   ## intersect
    verilogJoinTok                                        ## join
    verilogJoinAnyTok                                     ## join_any
    verilogJoinNoneTok                                    ## join_none
    verilogLargeTok                                       ## large
    verilogLetTok                                         ## let
    verilogLevelSymbol                                    ## level_symbol
    verilogLiblistTok                                     ## liblist
    verilogLocalTok                                       ## local
    verilogLocalparamTok                                  ## localparam
    verilogLogicTok                                       ## logic
    verilogLongintTok                                     ## longint
    verilogMacroText                                      ## macro_text
    verilogMacromoduleTok                                 ## macromodule
    verilogMatchesTok                                     ## matches
    verilogMediumTok                                      ## medium
    verilogModportTok                                     ## modport
    verilogModuleTok                                      ## module
    verilogMsTok                                          ## ms
    verilogNandTok                                        ## nand
    verilogNegedgeTok                                     ## negedge
    verilogNettypeTok                                     ## nettype
    verilogNewTok                                         ## new
    verilogNexttimeTok                                    ## nexttime
    verilogNmosTok                                        ## nmos
    verilogNoneTok                                        ## none
    verilogNorTok                                         ## nor
    verilogNoshowcancelledTok                             ## noshowcancelled
    verilogNotTok                                         ## not
    verilogNotif0Tok                                      ## notif0
    verilogNotif1Tok                                      ## notif1
    verilogNsTok                                          ## ns
    verilogNullTok                                        ## null
    verilogOctalNumber                                    ## octal_number
    verilogOptionTok                                      ## option
    verilogOrTok                                          ## or
    verilogOutputTok                                      ## output
    verilogOutputSymbol                                   ## output_symbol
    verilogPackageTok                                     ## package
    verilogPackedTok                                      ## packed
    verilogParameterTok                                   ## parameter
    verilogPmosTok                                        ## pmos
    verilogPosedgeTok                                     ## posedge
    verilogPrimitiveTok                                   ## primitive
    verilogPriorityTok                                    ## priority
    verilogProgramTok                                     ## program
    verilogPropertyTok                                    ## property
    verilogProtectedTok                                   ## protected
    verilogPsTok                                          ## ps
    verilogPull0Tok                                       ## pull0
    verilogPull1Tok                                       ## pull1
    verilogPulldownTok                                    ## pulldown
    verilogPullupTok                                      ## pullup
    verilogPulsestyleOndetectTok                          ## pulsestyle_ondetect
    verilogPulsestyleOneventTok                           ## pulsestyle_onevent
    verilogPureTok                                        ## pure
    verilogRandTok                                        ## rand
    verilogRandcTok                                       ## randc
    verilogRandcaseTok                                    ## randcase
    verilogRandomizeTok                                   ## randomize
    verilogRcmosTok                                       ## rcmos
    verilogRealTok                                        ## real
    verilogRealtimeTok                                    ## realtime
    verilogRefTok                                         ## ref
    verilogRegTok                                         ## reg
    verilogRejectOnTok                                    ## reject_on
    verilogReleaseTok                                     ## release
    verilogRepeatTok                                      ## repeat
    verilogRestrictTok                                    ## restrict
    verilogReturnTok                                      ## return
    verilogRnmosTok                                       ## rnmos
    verilogRpmosTok                                       ## rpmos
    verilogRtranTok                                       ## rtran
    verilogRtranif0Tok                                    ## rtranif0
    verilogRtranif1Tok                                    ## rtranif1
    verilogSTok                                           ## s
    verilogSAlwaysTok                                     ## s_always
    verilogSEventuallyTok                                 ## s_eventually
    verilogSNexttimeTok                                   ## s_nexttime
    verilogSUntilTok                                      ## s_until
    verilogSUntilWithTok                                  ## s_until_with
    verilogSampleTok                                      ## sample
    verilogScalaredTok                                    ## scalared
    verilogSequenceTok                                    ## sequence
    verilogShortintTok                                    ## shortint
    verilogShortrealTok                                   ## shortreal
    verilogShowcancelledTok                               ## showcancelled
    verilogSignedTok                                      ## signed
    verilogSimpleIdentifier                               ## simple_identifier
    verilogSmallTok                                       ## small
    verilogSoftTok                                        ## soft
    verilogSolveTok                                       ## solve
    verilogSpecifyTok                                     ## specify
    verilogSpecparamTok                                   ## specparam
    verilogStaticTok                                      ## static
    verilogStdTok                                         ## std
    verilogStringTok                                      ## string
    verilogStrongTok                                      ## strong
    verilogStrong0Tok                                     ## strong0
    verilogStrong1Tok                                     ## strong1
    verilogStructTok                                      ## struct
    verilogSuperTok                                       ## super
    verilogSupply0Tok                                     ## supply0
    verilogSupply1Tok                                     ## supply1
    verilogSyncAcceptOnTok                                ## sync_accept_on
    verilogSyncRejectOnTok                                ## sync_reject_on
    verilogSystemTfIdentifier                             ## system_tf_identifier
    verilogTableTok                                       ## table
    verilogTaggedTok                                      ## tagged
    verilogTaskTok                                        ## task
    verilogThisTok                                        ## this
    verilogThroughoutTok                                  ## throughout
    verilogTimeTok                                        ## time
    verilogTimeprecisionTok                               ## timeprecision
    verilogTimeunitTok                                    ## timeunit
    verilogTranTok                                        ## tran
    verilogTranif0Tok                                     ## tranif0
    verilogTranif1Tok                                     ## tranif1
    verilogTriTok                                         ## tri
    verilogTri0Tok                                        ## tri0
    verilogTri1Tok                                        ## tri1
    verilogTriandTok                                      ## triand
    verilogTriorTok                                       ## trior
    verilogTriregTok                                      ## trireg
    verilogTypeTok                                        ## type
    verilogTypeOptionTok                                  ## type_option
    verilogTypedefTok                                     ## typedef
    verilogUnionTok                                       ## union
    verilogUniqueTok                                      ## unique
    verilogUnique0Tok                                     ## unique0
    verilogUnsignedTok                                    ## unsigned
    verilogUnsignedNumber                                 ## unsigned_number
    verilogUntilTok                                       ## until
    verilogUntilWithTok                                   ## until_with
    verilogUntypedTok                                     ## untyped
    verilogUsTok                                          ## us
    verilogUseTok                                         ## use
    verilogUwireTok                                       ## uwire
    verilogVarTok                                         ## var
    verilogVectoredTok                                    ## vectored
    verilogVirtualTok                                     ## virtual
    verilogVoidTok                                        ## void
    verilogVoidApostropheTok                              ## void'
    verilogWaitTok                                        ## wait
    verilogWaitOrderTok                                   ## wait_order
    verilogWandTok                                        ## wand
    verilogWeakTok                                        ## weak
    verilogWeak0Tok                                       ## weak0
    verilogWeak1Tok                                       ## weak1
    verilogWhileTok                                       ## while
    verilogWildcardTok                                    ## wildcard
    verilogWireTok                                        ## wire
    verilogWithTok                                        ## with
    verilogWithinTok                                      ## within
    verilogWorTok                                         ## wor
    verilogXnorTok                                        ## xnor
    verilogXorTok                                         ## xor
    verilogLCurlyTok                                      ## {
    verilogPipeTok                                        ## |
    verilogPipeMinusGreaterThanTok                        ## |->
    verilogPipeEqualTok                                   ## |=
    verilogPipeEqualGreaterThanTok                        ## |=>
    verilogDoublePipeTok                                  ## ||
    verilogRCurlyTok                                      ## }
    verilogTildeTok                                       ## ~
    verilogTildeAmpersandTok                              ## ~&
    verilogTildeAccentTok                                 ## ~^
    verilogTildePipeTok                                   ## ~|
    verilog–Tok                                         ## –
    verilog–GreaterThanTok                              ## –>
    verilog––Tok                                      ## ––
    verilogSyntaxError                                    ## Tree-sitter parser syntax error


proc strRepr*(kind: VerilogNodeKind): string =
  case kind:
    of verilogDollarfulskewUnderscoretimingUnderscorecheck:   "$fullskew_timing_check"
    of verilogDollarholdUnderscoretimingUnderscorecheck:      "$hold_timing_check"
    of verilogDollarnochangeUnderscoretimingUnderscorecheck:  "$nochange_timing_check"
    of verilogDollarperiodUnderscoretimingUnderscorecheck:    "$period_timing_check"
    of verilogDollarrecoveryUnderscoretimingUnderscorecheck:  "$recovery_timing_check"
    of verilogDollarrecremUnderscoretimingUnderscorecheck:    "$recrem_timing_check"
    of verilogDollarremovalUnderscoretimingUnderscorecheck:   "$removal_timing_check"
    of verilogDollarsetupUnderscoretimingUnderscorecheck:     "$setup_timing_check"
    of verilogDollarsetupholdUnderscoretimingUnderscorecheck: "$setuphold_timing_check"
    of verilogDollarskewUnderscoretimingUnderscorecheck:      "$skew_timing_check"
    of verilogDollartimeskewUnderscoretimingUnderscorecheck:  "$timeskew_timing_check"
    of verilogDollarwidthUnderscoretimingUnderscorecheck:     "$width_timing_check"
    of verilogOrderedParameterAssignment:                     "_ordered_parameter_assignment"
    of verilogActionBlock:                                    "action_block"
    of verilogAlwaysConstruct:                                "always_construct"
    of verilogAlwaysKeyword:                                  "always_keyword"
    of verilogAnonymousProgram:                               "anonymous_program"
    of verilogAnonymousProgramItem:                           "anonymous_program_item"
    of verilogAnsiPortDeclaration:                            "ansi_port_declaration"
    of verilogArrayManipulationCall:                          "array_manipulation_call"
    of verilogArrayMethodName:                                "array_method_name"
    of verilogArrayRangeExpression:                           "array_range_expression"
    of verilogAssertPropertyStatement:                        "assert_property_statement"
    of verilogAssertionVariableDeclaration:                   "assertion_variable_declaration"
    of verilogAssignmentOperator:                             "assignment_operator"
    of verilogAssignmentPattern:                              "assignment_pattern"
    of verilogAssignmentPatternExpression:                    "assignment_pattern_expression"
    of verilogAssignmentPatternKey:                           "assignment_pattern_key"
    of verilogAssignmentPatternNetLvalue:                     "assignment_pattern_net_lvalue"
    of verilogAssignmentPatternVariableLvalue:                "assignment_pattern_variable_lvalue"
    of verilogAssociativeDimension:                           "associative_dimension"
    of verilogAssumePropertyStatement:                        "assume_property_statement"
    of verilogAttrSpec:                                       "attr_spec"
    of verilogAttributeInstance:                              "attribute_instance"
    of verilogBeginKeywords:                                  "begin_keywords"
    of verilogBindDirective:                                  "bind_directive"
    of verilogBindTargetInstance:                             "bind_target_instance"
    of verilogBindTargetInstanceList:                         "bind_target_instance_list"
    of verilogBindTargetScope:                                "bind_target_scope"
    of verilogBinsExpression:                                 "bins_expression"
    of verilogBinsKeyword:                                    "bins_keyword"
    of verilogBinsOrEmpty:                                    "bins_or_empty"
    of verilogBinsOrOptions:                                  "bins_or_options"
    of verilogBinsSelection:                                  "bins_selection"
    of verilogBinsSelectionOrOption:                          "bins_selection_or_option"
    of verilogBitSelect1:                                     "bit_select1"
    of verilogBlockEventExpression:                           "block_event_expression"
    of verilogBlockItemDeclaration:                           "block_item_declaration"
    of verilogBlockingAssignment:                             "blocking_assignment"
    of verilogCaseExpression:                                 "case_expression"
    of verilogCaseGenerateConstruct:                          "case_generate_construct"
    of verilogCaseGenerateItem:                               "case_generate_item"
    of verilogCaseInsideItem:                                 "case_inside_item"
    of verilogCaseItem:                                       "case_item"
    of verilogCaseItemExpression:                             "case_item_expression"
    of verilogCaseKeyword:                                    "case_keyword"
    of verilogCasePatternItem:                                "case_pattern_item"
    of verilogCaseStatement:                                  "case_statement"
    of verilogCast:                                           "cast"
    of verilogCastingType:                                    "casting_type"
    of verilogCellClause:                                     "cell_clause"
    of verilogCellIdentifier:                                 "cell_identifier"
    of verilogChargeStrength:                                 "charge_strength"
    of verilogCheckerDeclaration:                             "checker_declaration"
    of verilogCheckerIdentifier:                              "checker_identifier"
    of verilogCheckerInstantiation:                           "checker_instantiation"
    of verilogCheckerOrGenerateItemDeclaration:               "checker_or_generate_item_declaration"
    of verilogCheckerPortDirection:                           "checker_port_direction"
    of verilogCheckerPortItem:                                "checker_port_item"
    of verilogCheckerPortList:                                "checker_port_list"
    of verilogClassConstructorDeclaration:                    "class_constructor_declaration"
    of verilogClassConstructorPrototype:                      "class_constructor_prototype"
    of verilogClassDeclaration:                               "class_declaration"
    of verilogClassIdentifier:                                "class_identifier"
    of verilogClassItem:                                      "class_item"
    of verilogClassItemQualifier:                             "class_item_qualifier"
    of verilogClassMethod:                                    "class_method"
    of verilogClassNew:                                       "class_new"
    of verilogClassProperty:                                  "class_property"
    of verilogClassQualifier:                                 "class_qualifier"
    of verilogClassScope:                                     "class_scope"
    of verilogClassType:                                      "class_type"
    of verilogClockingDeclAssign:                             "clocking_decl_assign"
    of verilogClockingDeclaration:                            "clocking_declaration"
    of verilogClockingDirection:                              "clocking_direction"
    of verilogClockingDrive:                                  "clocking_drive"
    of verilogClockingEvent:                                  "clocking_event"
    of verilogClockingIdentifier:                             "clocking_identifier"
    of verilogClockingItem:                                   "clocking_item"
    of verilogClockingSkew:                                   "clocking_skew"
    of verilogClockvar:                                       "clockvar"
    of verilogClockvarExpression:                             "clockvar_expression"
    of verilogCmosSwitchInstance:                             "cmos_switch_instance"
    of verilogCmosSwitchtype:                                 "cmos_switchtype"
    of verilogCombinationalBody:                              "combinational_body"
    of verilogCombinationalEntry:                             "combinational_entry"
    of verilogConcatenation:                                  "concatenation"
    of verilogConcurrentAssertionItem:                        "concurrent_assertion_item"
    of verilogCondPattern:                                    "cond_pattern"
    of verilogCondPredicate:                                  "cond_predicate"
    of verilogConditionalExpression:                          "conditional_expression"
    of verilogConditionalStatement:                           "conditional_statement"
    of verilogConfigIdentifier:                               "config_identifier"
    of verilogConfigRuleStatement:                            "config_rule_statement"
    of verilogConsecutiveRepetition:                          "consecutive_repetition"
    of verilogConstIdentifier:                                "const_identifier"
    of verilogConstantBitSelect1:                             "constant_bit_select1"
    of verilogConstantConcatenation:                          "constant_concatenation"
    of verilogConstantExpression:                             "constant_expression"
    of verilogConstantIndexedRange:                           "constant_indexed_range"
    of verilogConstantMintypmaxExpression:                    "constant_mintypmax_expression"
    of verilogConstantMultipleConcatenation:                  "constant_multiple_concatenation"
    of verilogConstantParamExpression:                        "constant_param_expression"
    of verilogConstantPrimary:                                "constant_primary"
    of verilogConstantRange:                                  "constant_range"
    of verilogConstantSelect1:                                "constant_select1"
    of verilogConstraintBlock:                                "constraint_block"
    of verilogConstraintBlockItem:                            "constraint_block_item"
    of verilogConstraintDeclaration:                          "constraint_declaration"
    of verilogConstraintExpression:                           "constraint_expression"
    of verilogConstraintIdentifier:                           "constraint_identifier"
    of verilogConstraintPrimary:                              "constraint_primary"
    of verilogConstraintPrototype:                            "constraint_prototype"
    of verilogConstraintPrototypeQualifier:                   "constraint_prototype_qualifier"
    of verilogConstraintSet:                                  "constraint_set"
    of verilogContinuousAssign:                               "continuous_assign"
    of verilogControlledReferenceEvent:                       "controlled_reference_event"
    of verilogCoverCross:                                     "cover_cross"
    of verilogCoverPoint:                                     "cover_point"
    of verilogCoverPointIdentifier:                           "cover_point_identifier"
    of verilogCoverPropertyStatement:                         "cover_property_statement"
    of verilogCoverSequenceStatement:                         "cover_sequence_statement"
    of verilogCoverageEvent:                                  "coverage_event"
    of verilogCoverageOption:                                 "coverage_option"
    of verilogCoverageSpecOrOption:                           "coverage_spec_or_option"
    of verilogCovergroupDeclaration:                          "covergroup_declaration"
    of verilogCovergroupIdentifier:                           "covergroup_identifier"
    of verilogCovergroupRangeList:                            "covergroup_range_list"
    of verilogCovergroupValueRange:                           "covergroup_value_range"
    of verilogCrossBody:                                      "cross_body"
    of verilogCrossBodyItem:                                  "cross_body_item"
    of verilogCrossIdentifier:                                "cross_identifier"
    of verilogCycleDelay:                                     "cycle_delay"
    of verilogCycleDelayConstRangeExpression:                 "cycle_delay_const_range_expression"
    of verilogCycleDelayRange:                                "cycle_delay_range"
    of verilogDataDeclaration:                                "data_declaration"
    of verilogDataEvent:                                      "data_event"
    of verilogDataSourceExpression:                           "data_source_expression"
    of verilogDataType:                                       "data_type"
    of verilogDataTypeOrImplicit1:                            "data_type_or_implicit1"
    of verilogDataTypeOrVoid:                                 "data_type_or_void"
    of verilogDecimalNumber:                                  "decimal_number"
    of verilogDefaultClause:                                  "default_clause"
    of verilogDefaultNettypeCompilerDirective:                "default_nettype_compiler_directive"
    of verilogDefaultNettypeValue:                            "default_nettype_value"
    of verilogDefaultSkew:                                    "default_skew"
    of verilogDeferredImmediateAssertStatement:               "deferred_immediate_assert_statement"
    of verilogDeferredImmediateAssertionItem:                 "deferred_immediate_assertion_item"
    of verilogDeferredImmediateAssumeStatement:               "deferred_immediate_assume_statement"
    of verilogDeferredImmediateCoverStatement:                "deferred_immediate_cover_statement"
    of verilogDefparamAssignment:                             "defparam_assignment"
    of verilogDelay2:                                         "delay2"
    of verilogDelay3:                                         "delay3"
    of verilogDelayControl:                                   "delay_control"
    of verilogDelayOrEventControl:                            "delay_or_event_control"
    of verilogDelayValue:                                     "delay_value"
    of verilogDelayedData:                                    "delayed_data"
    of verilogDelayedReference:                               "delayed_reference"
    of verilogDesignStatement:                                "design_statement"
    of verilogDisableStatement:                               "disable_statement"
    of verilogDistItem:                                       "dist_item"
    of verilogDistList:                                       "dist_list"
    of verilogDistWeight:                                     "dist_weight"
    of verilogDoubleQuotedString:                             "double_quoted_string"
    of verilogDpiFunctionImportProperty:                      "dpi_function_import_property"
    of verilogDpiFunctionProto:                               "dpi_function_proto"
    of verilogDpiImportExport:                                "dpi_import_export"
    of verilogDpiSpecString:                                  "dpi_spec_string"
    of verilogDpiTaskImportProperty:                          "dpi_task_import_property"
    of verilogDpiTaskProto:                                   "dpi_task_proto"
    of verilogDriveStrength:                                  "drive_strength"
    of verilogDynamicArrayNew:                                "dynamic_array_new"
    of verilogEdgeControlSpecifier:                           "edge_control_specifier"
    of verilogEdgeDescriptor:                                 "edge_descriptor"
    of verilogEdgeIdentifier:                                 "edge_identifier"
    of verilogEdgeIndicator:                                  "edge_indicator"
    of verilogEdgeInputList:                                  "edge_input_list"
    of verilogEdgeSensitivePathDeclaration:                   "edge_sensitive_path_declaration"
    of verilogElaborationSystemTask:                          "elaboration_system_task"
    of verilogEmptyUnpackedArrayConcatenation:                "empty_unpacked_array_concatenation"
    of verilogEnableGateInstance:                             "enable_gate_instance"
    of verilogEnableGatetype:                                 "enable_gatetype"
    of verilogEnableTerminal:                                 "enable_terminal"
    of verilogEndEdgeOffset:                                  "end_edge_offset"
    of verilogEnumBaseType:                                   "enum_base_type"
    of verilogEnumIdentifier:                                 "enum_identifier"
    of verilogEnumNameDeclaration:                            "enum_name_declaration"
    of verilogErrorLimitValue:                                "error_limit_value"
    of verilogEscapedIdentifier:                              "escaped_identifier"
    of verilogEventBasedFlag:                                 "event_based_flag"
    of verilogEventControl:                                   "event_control"
    of verilogEventExpression:                                "event_expression"
    of verilogEventTrigger:                                   "event_trigger"
    of verilogExpectPropertyStatement:                        "expect_property_statement"
    of verilogExpression:                                     "expression"
    of verilogExpressionOrDist:                               "expression_or_dist"
    of verilogExternConstraintDeclaration:                    "extern_constraint_declaration"
    of verilogExternTfDeclaration:                            "extern_tf_declaration"
    of verilogFinalConstruct:                                 "final_construct"
    of verilogFinishNumber:                                   "finish_number"
    of verilogForInitialization:                              "for_initialization"
    of verilogForStep:                                        "for_step"
    of verilogForVariableDeclaration:                         "for_variable_declaration"
    of verilogFormalArgument:                                 "formal_argument"
    of verilogFormalIdentifier:                               "formal_identifier"
    of verilogFormalPortIdentifier:                           "formal_port_identifier"
    of verilogFullEdgeSensitivePathDescription:               "full_edge_sensitive_path_description"
    of verilogFullPathDescription:                            "full_path_description"
    of verilogFunctionBodyDeclaration:                        "function_body_declaration"
    of verilogFunctionDataTypeOrImplicit1:                    "function_data_type_or_implicit1"
    of verilogFunctionDeclaration:                            "function_declaration"
    of verilogFunctionIdentifier:                             "function_identifier"
    of verilogFunctionPrototype:                              "function_prototype"
    of verilogFunctionStatement:                              "function_statement"
    of verilogFunctionStatementOrNull:                        "function_statement_or_null"
    of verilogFunctionSubroutineCall:                         "function_subroutine_call"
    of verilogGateInstantiation:                              "gate_instantiation"
    of verilogGenerateBlock:                                  "generate_block"
    of verilogGenerateBlockIdentifier:                        "generate_block_identifier"
    of verilogGenerateRegion:                                 "generate_region"
    of verilogGenvarDeclaration:                              "genvar_declaration"
    of verilogGenvarIdentifier:                               "genvar_identifier"
    of verilogGenvarInitialization:                           "genvar_initialization"
    of verilogGenvarIteration:                                "genvar_iteration"
    of verilogGotoRepetition:                                 "goto_repetition"
    of verilogHierarchicalBtfIdentifier:                      "hierarchical_btf_identifier"
    of verilogHierarchicalInstance:                           "hierarchical_instance"
    of verilogIdDirective:                                    "id_directive"
    of verilogIdentifierList:                                 "identifier_list"
    of verilogIfGenerateConstruct:                            "if_generate_construct"
    of verilogImplicitClassHandle:                            "implicit_class_handle"
    of verilogImplicitDataType1:                              "implicit_data_type1"
    of verilogImportExport:                                   "import_export"
    of verilogIncOrDecExpression:                             "inc_or_dec_expression"
    of verilogIncOrDecOperator:                               "inc_or_dec_operator"
    of verilogIncludeCompilerDirective:                       "include_compiler_directive"
    of verilogIncludeCompilerDirectiveStandard:               "include_compiler_directive_standard"
    of verilogIndexVariableIdentifier:                        "index_variable_identifier"
    of verilogIndexedRange:                                   "indexed_range"
    of verilogInitVal:                                        "init_val"
    of verilogInitialConstruct:                               "initial_construct"
    of verilogInoutDeclaration:                               "inout_declaration"
    of verilogInoutPortIdentifier:                            "inout_port_identifier"
    of verilogInoutTerminal:                                  "inout_terminal"
    of verilogInputDeclaration:                               "input_declaration"
    of verilogInputIdentifier:                                "input_identifier"
    of verilogInputPortIdentifier:                            "input_port_identifier"
    of verilogInputTerminal:                                  "input_terminal"
    of verilogInsideExpression:                               "inside_expression"
    of verilogInstClause:                                     "inst_clause"
    of verilogInstName:                                       "inst_name"
    of verilogInstanceIdentifier:                             "instance_identifier"
    of verilogIntegerAtomType:                                "integer_atom_type"
    of verilogIntegerVectorType:                              "integer_vector_type"
    of verilogIntegralNumber:                                 "integral_number"
    of verilogInterfaceAnsiHeader:                            "interface_ansi_header"
    of verilogInterfaceClassDeclaration:                      "interface_class_declaration"
    of verilogInterfaceClassItem:                             "interface_class_item"
    of verilogInterfaceClassMethod:                           "interface_class_method"
    of verilogInterfaceClassType:                             "interface_class_type"
    of verilogInterfaceDeclaration:                           "interface_declaration"
    of verilogInterfaceIdentifier:                            "interface_identifier"
    of verilogInterfaceInstanceIdentifier:                    "interface_instance_identifier"
    of verilogInterfaceInstantiation:                         "interface_instantiation"
    of verilogInterfaceItem:                                  "interface_item"
    of verilogInterfaceNonansiHeader:                         "interface_nonansi_header"
    of verilogInterfaceOrGenerateItem:                        "interface_or_generate_item"
    of verilogInterfacePortDeclaration:                       "interface_port_declaration"
    of verilogInterfacePortHeader:                            "interface_port_header"
    of verilogJoinKeyword:                                    "join_keyword"
    of verilogJumpStatement:                                  "jump_statement"
    of verilogLetActualArg:                                   "let_actual_arg"
    of verilogLetDeclaration:                                 "let_declaration"
    of verilogLetExpression:                                  "let_expression"
    of verilogLetFormalType1:                                 "let_formal_type1"
    of verilogLetListOfArguments:                             "let_list_of_arguments"
    of verilogLetPortItem:                                    "let_port_item"
    of verilogLetPortList:                                    "let_port_list"
    of verilogLevelInputList:                                 "level_input_list"
    of verilogLiblistClause:                                  "liblist_clause"
    of verilogLibraryIdentifier:                              "library_identifier"
    of verilogLifetime:                                       "lifetime"
    of verilogLimitValue:                                     "limit_value"
    of verilogLineCompilerDirective:                          "line_compiler_directive"
    of verilogListOfActualArguments:                          "list_of_actual_arguments"
    of verilogListOfArguments:                                "list_of_arguments"
    of verilogListOfArgumentsParent:                          "list_of_arguments_parent"
    of verilogListOfClockingDeclAssign:                       "list_of_clocking_decl_assign"
    of verilogListOfCrossItems:                               "list_of_cross_items"
    of verilogListOfDefparamAssignments:                      "list_of_defparam_assignments"
    of verilogListOfFormalArguments:                          "list_of_formal_arguments"
    of verilogListOfGenvarIdentifiers:                        "list_of_genvar_identifiers"
    of verilogListOfInterfaceIdentifiers:                     "list_of_interface_identifiers"
    of verilogListOfNetAssignments:                           "list_of_net_assignments"
    of verilogListOfNetDeclAssignments:                       "list_of_net_decl_assignments"
    of verilogListOfParamAssignments:                         "list_of_param_assignments"
    of verilogListOfParameterAssignments:                     "list_of_parameter_assignments"
    of verilogListOfPathDelayExpressions:                     "list_of_path_delay_expressions"
    of verilogListOfPathInputs:                               "list_of_path_inputs"
    of verilogListOfPathOutputs:                              "list_of_path_outputs"
    of verilogListOfPortConnections:                          "list_of_port_connections"
    of verilogListOfPortDeclarations:                         "list_of_port_declarations"
    of verilogListOfPortIdentifiers:                          "list_of_port_identifiers"
    of verilogListOfPorts:                                    "list_of_ports"
    of verilogListOfSpecparamAssignments:                     "list_of_specparam_assignments"
    of verilogListOfTfVariableIdentifiers:                    "list_of_tf_variable_identifiers"
    of verilogListOfTypeAssignments:                          "list_of_type_assignments"
    of verilogListOfUdpPortIdentifiers:                       "list_of_udp_port_identifiers"
    of verilogListOfVariableAssignments:                      "list_of_variable_assignments"
    of verilogListOfVariableDeclAssignments:                  "list_of_variable_decl_assignments"
    of verilogListOfVariableIdentifiers:                      "list_of_variable_identifiers"
    of verilogListOfVariablePortIdentifiers:                  "list_of_variable_port_identifiers"
    of verilogLocalParameterDeclaration:                      "local_parameter_declaration"
    of verilogLoopGenerateConstruct:                          "loop_generate_construct"
    of verilogLoopStatement:                                  "loop_statement"
    of verilogLoopVariables1:                                 "loop_variables1"
    of verilogMemberIdentifier:                               "member_identifier"
    of verilogMethodCall:                                     "method_call"
    of verilogMethodCallBody:                                 "method_call_body"
    of verilogMethodIdentifier:                               "method_identifier"
    of verilogMethodQualifier:                                "method_qualifier"
    of verilogMintypmaxExpression:                            "mintypmax_expression"
    of verilogModportClockingDeclaration:                     "modport_clocking_declaration"
    of verilogModportDeclaration:                             "modport_declaration"
    of verilogModportIdentifier:                              "modport_identifier"
    of verilogModportItem:                                    "modport_item"
    of verilogModportPortsDeclaration:                        "modport_ports_declaration"
    of verilogModportSimplePort:                              "modport_simple_port"
    of verilogModportSimplePortsDeclaration:                  "modport_simple_ports_declaration"
    of verilogModportTfPortsDeclaration:                      "modport_tf_ports_declaration"
    of verilogModuleAnsiHeader:                               "module_ansi_header"
    of verilogModuleDeclaration:                              "module_declaration"
    of verilogModuleHeader:                                   "module_header"
    of verilogModuleInstantiation:                            "module_instantiation"
    of verilogModuleKeyword:                                  "module_keyword"
    of verilogModuleNonansiHeader:                            "module_nonansi_header"
    of verilogModuleOrGenerateItem:                           "module_or_generate_item"
    of verilogModulePathConcatenation:                        "module_path_concatenation"
    of verilogModulePathExpression:                           "module_path_expression"
    of verilogModulePathMintypmaxExpression:                  "module_path_mintypmax_expression"
    of verilogModulePathMultipleConcatenation:                "module_path_multiple_concatenation"
    of verilogModulePathPrimary:                              "module_path_primary"
    of verilogMosSwitchInstance:                              "mos_switch_instance"
    of verilogMosSwitchtype:                                  "mos_switchtype"
    of verilogMultipleConcatenation:                          "multiple_concatenation"
    of verilogNInputGateInstance:                             "n_input_gate_instance"
    of verilogNInputGatetype:                                 "n_input_gatetype"
    of verilogNOutputGateInstance:                            "n_output_gate_instance"
    of verilogNOutputGatetype:                                "n_output_gatetype"
    of verilogNameOfInstance:                                 "name_of_instance"
    of verilogNamedParameterAssignment:                       "named_parameter_assignment"
    of verilogNamedPortConnection:                            "named_port_connection"
    of verilogNcontrolTerminal:                               "ncontrol_terminal"
    of verilogNetAlias:                                       "net_alias"
    of verilogNetAssignment:                                  "net_assignment"
    of verilogNetDeclAssignment:                              "net_decl_assignment"
    of verilogNetDeclaration:                                 "net_declaration"
    of verilogNetLvalue:                                      "net_lvalue"
    of verilogNetPortHeader1:                                 "net_port_header1"
    of verilogNetPortType1:                                   "net_port_type1"
    of verilogNetType:                                        "net_type"
    of verilogNetTypeDeclaration:                             "net_type_declaration"
    of verilogNextState:                                      "next_state"
    of verilogNonConsecutiveRepetition:                       "non_consecutive_repetition"
    of verilogNonIntegerType:                                 "non_integer_type"
    of verilogNonPortProgramItem:                             "non_port_program_item"
    of verilogNonblockingAssignment:                          "nonblocking_assignment"
    of verilogNonrangeSelect1:                                "nonrange_select1"
    of verilogNonrangeVariableLvalue:                         "nonrange_variable_lvalue"
    of verilogNotifier:                                       "notifier"
    of verilogOpenRangeList:                                  "open_range_list"
    of verilogOpenValueRange:                                 "open_value_range"
    of verilogOperatorAssignment:                             "operator_assignment"
    of verilogOrderedPortConnection:                          "ordered_port_connection"
    of verilogOutputDeclaration:                              "output_declaration"
    of verilogOutputIdentifier:                               "output_identifier"
    of verilogOutputPortIdentifier:                           "output_port_identifier"
    of verilogOutputTerminal:                                 "output_terminal"
    of verilogOverloadDeclaration:                            "overload_declaration"
    of verilogOverloadOperator:                               "overload_operator"
    of verilogOverloadProtoFormals:                           "overload_proto_formals"
    of verilogPackageDeclaration:                             "package_declaration"
    of verilogPackageExportDeclaration:                       "package_export_declaration"
    of verilogPackageIdentifier:                              "package_identifier"
    of verilogPackageImportDeclaration:                       "package_import_declaration"
    of verilogPackageImportItem:                              "package_import_item"
    of verilogPackageOrGenerateItemDeclaration:               "package_or_generate_item_declaration"
    of verilogPackageScope:                                   "package_scope"
    of verilogPackedDimension:                                "packed_dimension"
    of verilogParBlock:                                       "par_block"
    of verilogParallelEdgeSensitivePathDescription:           "parallel_edge_sensitive_path_description"
    of verilogParallelPathDescription:                        "parallel_path_description"
    of verilogParamAssignment:                                "param_assignment"
    of verilogParamExpression:                                "param_expression"
    of verilogParameterDeclaration:                           "parameter_declaration"
    of verilogParameterIdentifier:                            "parameter_identifier"
    of verilogParameterOverride:                              "parameter_override"
    of verilogParameterPortDeclaration:                       "parameter_port_declaration"
    of verilogParameterPortList:                              "parameter_port_list"
    of verilogParameterValueAssignment:                       "parameter_value_assignment"
    of verilogPassEnSwitchtype:                               "pass_en_switchtype"
    of verilogPassEnableSwitchInstance:                       "pass_enable_switch_instance"
    of verilogPassSwitchInstance:                             "pass_switch_instance"
    of verilogPassSwitchtype:                                 "pass_switchtype"
    of verilogPathDeclaration:                                "path_declaration"
    of verilogPathDelayExpression:                            "path_delay_expression"
    of verilogPathDelayValue:                                 "path_delay_value"
    of verilogPattern:                                        "pattern"
    of verilogPcontrolTerminal:                               "pcontrol_terminal"
    of verilogPolarityOperator:                               "polarity_operator"
    of verilogPort:                                           "port"
    of verilogPortDeclaration:                                "port_declaration"
    of verilogPortDirection:                                  "port_direction"
    of verilogPortIdentifier:                                 "port_identifier"
    of verilogPortReference:                                  "port_reference"
    of verilogPrimary:                                        "primary"
    of verilogPrimaryLiteral:                                 "primary_literal"
    of verilogProceduralContinuousAssignment:                 "procedural_continuous_assignment"
    of verilogProceduralTimingControlStatement:               "procedural_timing_control_statement"
    of verilogProductionIdentifier:                           "production_identifier"
    of verilogProgramAnsiHeader:                              "program_ansi_header"
    of verilogProgramDeclaration:                             "program_declaration"
    of verilogProgramIdentifier:                              "program_identifier"
    of verilogProgramInstantiation:                           "program_instantiation"
    of verilogProgramItem:                                    "program_item"
    of verilogProgramNonansiHeader:                           "program_nonansi_header"
    of verilogPropertyCaseItem:                               "property_case_item"
    of verilogPropertyDeclaration:                            "property_declaration"
    of verilogPropertyExpr:                                   "property_expr"
    of verilogPropertyFormalType1:                            "property_formal_type1"
    of verilogPropertyIdentifier:                             "property_identifier"
    of verilogPropertyListOfArguments:                        "property_list_of_arguments"
    of verilogPropertyLvarPortDirection:                      "property_lvar_port_direction"
    of verilogPropertyPortItem:                               "property_port_item"
    of verilogPropertyPortList:                               "property_port_list"
    of verilogPropertySpec:                                   "property_spec"
    of verilogPsIdentifier:                                   "ps_identifier"
    of verilogPsOrHierarchicalArrayIdentifier:                "ps_or_hierarchical_array_identifier"
    of verilogPullGateInstance:                               "pull_gate_instance"
    of verilogPulldownStrength:                               "pulldown_strength"
    of verilogPullupStrength:                                 "pullup_strength"
    of verilogPulseControlSpecparam:                          "pulse_control_specparam"
    of verilogPulsestyleDeclaration:                          "pulsestyle_declaration"
    of verilogQueueDimension:                                 "queue_dimension"
    of verilogRandcaseItem:                                   "randcase_item"
    of verilogRandcaseStatement:                              "randcase_statement"
    of verilogRandomQualifier:                                "random_qualifier"
    of verilogRandomizeCall:                                  "randomize_call"
    of verilogRangeExpression:                                "range_expression"
    of verilogRealNumber:                                     "real_number"
    of verilogRefDeclaration:                                 "ref_declaration"
    of verilogReferenceEvent:                                 "reference_event"
    of verilogRejectLimitValue:                               "reject_limit_value"
    of verilogRemainActiveFlag:                               "remain_active_flag"
    of verilogRepeatRange:                                    "repeat_range"
    of verilogRestrictPropertyStatement:                      "restrict_property_statement"
    of verilogScalarConstant:                                 "scalar_constant"
    of verilogScalarTimingCheckCondition:                     "scalar_timing_check_condition"
    of verilogSelect1:                                        "select1"
    of verilogSelectCondition:                                "select_condition"
    of verilogSelectExpression:                               "select_expression"
    of verilogSeqBlock:                                       "seq_block"
    of verilogSequenceAbbrev:                                 "sequence_abbrev"
    of verilogSequenceDeclaration:                            "sequence_declaration"
    of verilogSequenceExpr:                                   "sequence_expr"
    of verilogSequenceFormalType1:                            "sequence_formal_type1"
    of verilogSequenceInstance:                               "sequence_instance"
    of verilogSequenceListOfArguments:                        "sequence_list_of_arguments"
    of verilogSequenceLvarPortDirection:                      "sequence_lvar_port_direction"
    of verilogSequenceMethodCall:                             "sequence_method_call"
    of verilogSequencePortItem:                               "sequence_port_item"
    of verilogSequencePortList:                               "sequence_port_list"
    of verilogSequentialBody:                                 "sequential_body"
    of verilogSequentialEntry:                                "sequential_entry"
    of verilogShowcancelledDeclaration:                       "showcancelled_declaration"
    of verilogSimpleImmediateAssertStatement:                 "simple_immediate_assert_statement"
    of verilogSimpleImmediateAssumeStatement:                 "simple_immediate_assume_statement"
    of verilogSimpleImmediateCoverStatement:                  "simple_immediate_cover_statement"
    of verilogSimplePathDeclaration:                          "simple_path_declaration"
    of verilogSimpleTextMacroUsage:                           "simple_text_macro_usage"
    of verilogSliceSize:                                      "slice_size"
    of verilogSolveBeforeList:                                "solve_before_list"
    of verilogSourceFile:                                     "source_file"
    of verilogSpecifyBlock:                                   "specify_block"
    of verilogSpecifyInputTerminalDescriptor:                 "specify_input_terminal_descriptor"
    of verilogSpecifyOutputTerminalDescriptor:                "specify_output_terminal_descriptor"
    of verilogSpecparamAssignment:                            "specparam_assignment"
    of verilogSpecparamDeclaration:                           "specparam_declaration"
    of verilogSpecparamIdentifier:                            "specparam_identifier"
    of verilogStartEdgeOffset:                                "start_edge_offset"
    of verilogStateDependentPathDeclaration:                  "state_dependent_path_declaration"
    of verilogStatement:                                      "statement"
    of verilogStatementItem:                                  "statement_item"
    of verilogStatementOrNull:                                "statement_or_null"
    of verilogStreamConcatenation:                            "stream_concatenation"
    of verilogStreamExpression:                               "stream_expression"
    of verilogStreamOperator:                                 "stream_operator"
    of verilogStreamingConcatenation:                         "streaming_concatenation"
    of verilogStrength0:                                      "strength0"
    of verilogStrength1:                                      "strength1"
    of verilogStringLiteral:                                  "string_literal"
    of verilogStructUnion:                                    "struct_union"
    of verilogStructUnionMember:                              "struct_union_member"
    of verilogSubroutineCall:                                 "subroutine_call"
    of verilogSystemTfCall:                                   "system_tf_call"
    of verilogTaggedUnionExpression:                          "tagged_union_expression"
    of verilogTaskBodyDeclaration:                            "task_body_declaration"
    of verilogTaskDeclaration:                                "task_declaration"
    of verilogTaskIdentifier:                                 "task_identifier"
    of verilogTaskPrototype:                                  "task_prototype"
    of verilogTerminalIdentifier:                             "terminal_identifier"
    of verilogTextMacroDefinition:                            "text_macro_definition"
    of verilogTextMacroIdentifier:                            "text_macro_identifier"
    of verilogTextMacroName:                                  "text_macro_name"
    of verilogTextMacroUsage:                                 "text_macro_usage"
    of verilogTfCall:                                         "tf_call"
    of verilogTfIdentifier:                                   "tf_identifier"
    of verilogTfItemDeclaration:                              "tf_item_declaration"
    of verilogTfPortDeclaration:                              "tf_port_declaration"
    of verilogTfPortDirection:                                "tf_port_direction"
    of verilogTfPortItem1:                                    "tf_port_item1"
    of verilogTfPortList:                                     "tf_port_list"
    of verilogThreshold:                                      "threshold"
    of verilogTimeLiteral:                                    "time_literal"
    of verilogTimeUnit:                                       "time_unit"
    of verilogTimecheckCondition:                             "timecheck_condition"
    of verilogTimescaleCompilerDirective:                     "timescale_compiler_directive"
    of verilogTimestampCondition:                             "timestamp_condition"
    of verilogTimeunitsDeclaration:                           "timeunits_declaration"
    of verilogTimingCheckCondition:                           "timing_check_condition"
    of verilogTimingCheckEvent:                               "timing_check_event"
    of verilogTimingCheckEventControl:                        "timing_check_event_control"
    of verilogTimingCheckLimit:                               "timing_check_limit"
    of verilogTopmoduleIdentifier:                            "topmodule_identifier"
    of verilogTransItem:                                      "trans_item"
    of verilogTransList:                                      "trans_list"
    of verilogTransRangeList:                                 "trans_range_list"
    of verilogTransSet:                                       "trans_set"
    of verilogTypeAssignment:                                 "type_assignment"
    of verilogTypeDeclaration:                                "type_declaration"
    of verilogTypeReference:                                  "type_reference"
    of verilogUdpAnsiDeclaration:                             "udp_ansi_declaration"
    of verilogUdpDeclaration:                                 "udp_declaration"
    of verilogUdpDeclarationPortList:                         "udp_declaration_port_list"
    of verilogUdpInitialStatement:                            "udp_initial_statement"
    of verilogUdpInputDeclaration:                            "udp_input_declaration"
    of verilogUdpInstance:                                    "udp_instance"
    of verilogUdpInstantiation:                               "udp_instantiation"
    of verilogUdpNonansiDeclaration:                          "udp_nonansi_declaration"
    of verilogUdpOutputDeclaration:                           "udp_output_declaration"
    of verilogUdpPortDeclaration:                             "udp_port_declaration"
    of verilogUdpPortList:                                    "udp_port_list"
    of verilogUdpRegDeclaration:                              "udp_reg_declaration"
    of verilogUnaryOperator:                                  "unary_operator"
    of verilogUnbasedUnsizedLiteral:                          "unbased_unsized_literal"
    of verilogUnconnectedDrive:                               "unconnected_drive"
    of verilogUniquePriority:                                 "unique_priority"
    of verilogUniquenessConstraint:                           "uniqueness_constraint"
    of verilogUnpackedDimension:                              "unpacked_dimension"
    of verilogUnsizedDimension:                               "unsized_dimension"
    of verilogUseClause:                                      "use_clause"
    of verilogValueRange:                                     "value_range"
    of verilogVariableAssignment:                             "variable_assignment"
    of verilogVariableDeclAssignment:                         "variable_decl_assignment"
    of verilogVariableIdentifierList:                         "variable_identifier_list"
    of verilogVariableLvalue:                                 "variable_lvalue"
    of verilogVariablePortHeader:                             "variable_port_header"
    of verilogWaitStatement:                                  "wait_statement"
    of verilogZeroDirective:                                  "zero_directive"
    of verilogNewlineTok:                                     "\x0A"
    of verilogExclamationTok:                                 "!"
    of verilogExclamationEqualTok:                            "!="
    of verilogExclamationDoubleEqualTok:                      "!=="
    of verilogExclamationEqualQuestionTok:                    "!=?"
    of verilogQuoteTok:                                       "\""
    of verilogQuoteDPIQuoteTok:                               "\"DPI\""
    of verilogQuoteDPIMinusCQuoteTok:                         "\"DPI-C\""
    of verilogHashTok:                                        "#"
    of verilogDoubleHashTok:                                  "##"
    of verilogDoubleHashLBrackAsteriskRBrackTok:              "##[*]"
    of verilogDoubleHashLBrackPlusRBrackTok:                  "##[+]"
    of verilogHashMinusHashTok:                               "#-#"
    of verilogHash0Tok:                                       "#0"
    of verilogHashEqualHashTok:                               "#=#"
    of verilogDollarTok:                                      "$"
    of verilogDollarerorTok:                                  "$error"
    of verilogDollarfatalTok:                                 "$fatal"
    of verilogDollarfulskewTok:                               "$fullskew"
    of verilogDollarholdTok:                                  "$hold"
    of verilogDollarinfoTok:                                  "$info"
    of verilogDollarnochangeTok:                              "$nochange"
    of verilogDollarperiodTok:                                "$period"
    of verilogDollarrecoveryTok:                              "$recovery"
    of verilogDollarrecremTok:                                "$recrem"
    of verilogDollarremovalTok:                               "$removal"
    of verilogDollarrotTok:                                   "$root"
    of verilogDollarsetupTok:                                 "$setup"
    of verilogDollarsetupholdTok:                             "$setuphold"
    of verilogDollarskewTok:                                  "$skew"
    of verilogDollartimeskewTok:                              "$timeskew"
    of verilogDollarunitTok:                                  "$unit"
    of verilogDollarwarningTok:                               "$warning"
    of verilogDollarwidthTok:                                 "$width"
    of verilogPercentTok:                                     "%"
    of verilogPercentEqualTok:                                "%="
    of verilogAmpersandTok:                                   "&"
    of verilogDoubleAmpersandTok:                             "&&"
    of verilogTripleAmpersandTok:                             "&&&"
    of verilogAmpersandEqualTok:                              "&="
    of verilogApostropheTok:                                  "\'"
    of verilogApostrophe0Tok:                                 "\'0"
    of verilogApostrophe1Tok:                                 "\'1"
    of verilogApostropheB0Tok:                                "\'B0"
    of verilogApostropheB1Tok:                                "\'B1"
    of verilogApostropheb0Tok1:                               "\'b0"
    of verilogApostropheb1Tok1:                               "\'b1"
    of verilogApostropheLCurlyTok:                            "\'{"
    of verilogLParTok:                                        "("
    of verilogLParAsteriskTok:                                "(*"
    of verilogRParTok:                                        ")"
    of verilogAsteriskTok:                                    "*"
    of verilogAsteriskRParTok:                                "*)"
    of verilogDoubleAsteriskTok:                              "**"
    of verilogAsteriskDoubleColonAsteriskTok:                 "*::*"
    of verilogAsteriskEqualTok:                               "*="
    of verilogAsteriskGreaterThanTok:                         "*>"
    of verilogPlusTok:                                        "+"
    of verilogDoublePlusTok:                                  "++"
    of verilogPlusColonTok:                                   "+:"
    of verilogPlusEqualTok:                                   "+="
    of verilogCommaTok:                                       ","
    of verilogMinusTok:                                       "-"
    of verilogDoubleMinusTok:                                 "--"
    of verilogMinusColonTok:                                  "-:"
    of verilogMinusEqualTok:                                  "-="
    of verilogMinusGreaterThanTok:                            "->"
    of verilogMinusDoubleGreaterThanTok:                      "->>"
    of verilogDotTok:                                         "."
    of verilogDotAsteriskTok:                                 ".*"
    of verilogSlashTok:                                       "/"
    of verilogSlashEqualTok:                                  "/="
    of verilog0Tok:                                           "0"
    of verilog01Tok:                                          "01"
    of verilog1Tok:                                           "1"
    of verilog1ApostropheB0Tok:                               "1\'B0"
    of verilog1ApostropheB1Tok:                               "1\'B1"
    of verilog1ApostropheBXTok:                               "1\'BX"
    of verilog1ApostropheBxTok1:                              "1\'Bx"
    of verilog1Apostropheb0Tok1:                              "1\'b0"
    of verilog1Apostropheb1Tok1:                              "1\'b1"
    of verilog1ApostrophebXTok2:                              "1\'bX"
    of verilog1ApostrophebxTok3:                              "1\'bx"
    of verilog10Tok:                                          "10"
    of verilog1stepTok:                                       "1step"
    of verilog2Tok:                                           "2"
    of verilogColonTok:                                       ":"
    of verilogColonSlashTok:                                  ":/"
    of verilogDoubleColonTok:                                 "::"
    of verilogColonEqualTok:                                  ":="
    of verilogSemicolonTok:                                   ";"
    of verilogLessThanTok:                                    "<"
    of verilogLessThanMinusGreaterThanTok:                    "<->"
    of verilogDoubleLessThanTok:                              "<<"
    of verilogTripleLessThanTok:                              "<<<"
    of verilogTripleLessThanEqualTok:                         "<<<="
    of verilogDoubleLessThanEqualTok:                         "<<="
    of verilogLessThanEqualTok:                               "<="
    of verilogEqualTok:                                       "="
    of verilogDoubleEqualTok:                                 "=="
    of verilogTripleEqualTok:                                 "==="
    of verilogDoubleEqualQuestionTok:                         "==?"
    of verilogEqualGreaterThanTok:                            "=>"
    of verilogGreaterThanTok:                                 ">"
    of verilogGreaterThanEqualTok:                            ">="
    of verilogDoubleGreaterThanTok:                           ">>"
    of verilogDoubleGreaterThanEqualTok:                      ">>="
    of verilogTripleGreaterThanTok:                           ">>>"
    of verilogTripleGreaterThanEqualTok:                      ">>>="
    of verilogQuestionTok:                                    "?"
    of verilogAtTok:                                          "@"
    of verilogAtAsteriskTok:                                  "@*"
    of verilogDoubleAtTok:                                    "@@"
    of verilogPATHPULSEDollarEqualTok:                        "PATHPULSE$="
    of verilogLBrackTok:                                      "["
    of verilogLBrackAsteriskTok:                              "[*"
    of verilogLBrackAsteriskRBrackTok:                        "[*]"
    of verilogLBrackPlusRBrackTok:                            "[+]"
    of verilogLBrackMinusGreaterThanTok:                      "[->"
    of verilogLBrackEqualTok:                                 "[="
    of verilogLBrack–GreaterThanTok:                          "[\xE2\x80\x93>"
    of verilogBackslashTok:                                   "\\"
    of verilogRBrackTok:                                      "]"
    of verilogAccentTok:                                      "^"
    of verilogAccentEqualTok:                                 "^="
    of verilogAccentTildeTok:                                 "^~"
    of verilogBacktickTok:                                    "`"
    of verilogAcceptOnTok:                                    "accept_on"
    of verilogAliasTok:                                       "alias"
    of verilogAlwaysTok:                                      "always"
    of verilogAlwaysCombTok:                                  "always_comb"
    of verilogAlwaysFfTok:                                    "always_ff"
    of verilogAlwaysLatchTok:                                 "always_latch"
    of verilogAndTok:                                         "and"
    of verilogAssertTok:                                      "assert"
    of verilogAssignTok:                                      "assign"
    of verilogAssumeTok:                                      "assume"
    of verilogAutomaticTok:                                   "automatic"
    of verilogBeforeTok:                                      "before"
    of verilogBeginTok:                                       "begin"
    of verilogBinaryNumber:                                   "binary_number"
    of verilogBindTok:                                        "bind"
    of verilogBinsTok:                                        "bins"
    of verilogBinsofTok:                                      "binsof"
    of verilogBitTok:                                         "bit"
    of verilogBreakTok:                                       "break"
    of verilogBufTok:                                         "buf"
    of verilogBufif0Tok:                                      "bufif0"
    of verilogBufif1Tok:                                      "bufif1"
    of verilogByteTok:                                        "byte"
    of verilogCIdentifier:                                    "c_identifier"
    of verilogCaseTok:                                        "case"
    of verilogCasexTok:                                       "casex"
    of verilogCasezTok:                                       "casez"
    of verilogCellTok:                                        "cell"
    of verilogChandleTok:                                     "chandle"
    of verilogCheckerTok:                                     "checker"
    of verilogClassTok:                                       "class"
    of verilogClockingTok:                                    "clocking"
    of verilogCmosTok:                                        "cmos"
    of verilogComment:                                        "comment"
    of verilogConfigTok:                                      "config"
    of verilogConstTok:                                       "const"
    of verilogConstraintTok:                                  "constraint"
    of verilogContextTok:                                     "context"
    of verilogContinueTok:                                    "continue"
    of verilogCoverTok:                                       "cover"
    of verilogCovergroupTok:                                  "covergroup"
    of verilogCoverpointTok:                                  "coverpoint"
    of verilogCrossTok:                                       "cross"
    of verilogDeassignTok:                                    "deassign"
    of verilogDefaultTok:                                     "default"
    of verilogDefaultText:                                    "default_text"
    of verilogDefparamTok:                                    "defparam"
    of verilogDesignTok:                                      "design"
    of verilogDirectiveBeginKeywordsTok:                      "directive_begin_keywords"
    of verilogDirectiveCelldefineTok:                         "directive_celldefine"
    of verilogDirectiveDefaultNettypeTok:                     "directive_default_nettype"
    of verilogDirectiveDefineTok:                             "directive_define"
    of verilogDirectiveElseTok:                               "directive_else"
    of verilogDirectiveElsifTok:                              "directive_elsif"
    of verilogDirectiveEndKeywordsTok:                        "directive_end_keywords"
    of verilogDirectiveEndcelldefineTok:                      "directive_endcelldefine"
    of verilogDirectiveEndifTok:                              "directive_endif"
    of verilogDirectiveIfdefTok:                              "directive_ifdef"
    of verilogDirectiveIfndefTok:                             "directive_ifndef"
    of verilogDirectiveIncludeTok:                            "directive_include"
    of verilogDirectiveLineTok:                               "directive_line"
    of verilogDirectiveNounconnectedDriveTok:                 "directive_nounconnected_drive"
    of verilogDirectiveResetallTok:                           "directive_resetall"
    of verilogDirectiveTimescaleTok:                          "directive_timescale"
    of verilogDirectiveUnconnectedDriveTok:                   "directive_unconnected_drive"
    of verilogDirectiveUndefTok:                              "directive_undef"
    of verilogDirectiveUndefineallTok:                        "directive_undefineall"
    of verilogDisableTok:                                     "disable"
    of verilogDistTok:                                        "dist"
    of verilogDoTok:                                          "do"
    of verilogEdgeTok:                                        "edge"
    of verilogEdgeSymbol:                                     "edge_symbol"
    of verilogElseTok:                                        "else"
    of verilogEndTok:                                         "end"
    of verilogEndcaseTok:                                     "endcase"
    of verilogEndcheckerTok:                                  "endchecker"
    of verilogEndclassTok:                                    "endclass"
    of verilogEndclockingTok:                                 "endclocking"
    of verilogEndconfigTok:                                   "endconfig"
    of verilogEndfunctionTok:                                 "endfunction"
    of verilogEndgenerateTok:                                 "endgenerate"
    of verilogEndgroupTok:                                    "endgroup"
    of verilogEndinterfaceTok:                                "endinterface"
    of verilogEndmoduleTok:                                   "endmodule"
    of verilogEndpackageTok:                                  "endpackage"
    of verilogEndprimitiveTok:                                "endprimitive"
    of verilogEndprogramTok:                                  "endprogram"
    of verilogEndpropertyTok:                                 "endproperty"
    of verilogEndsequenceTok:                                 "endsequence"
    of verilogEndspecifyTok:                                  "endspecify"
    of verilogEndtableTok:                                    "endtable"
    of verilogEndtaskTok:                                     "endtask"
    of verilogEnumTok:                                        "enum"
    of verilogEventTok:                                       "event"
    of verilogEventuallyTok:                                  "eventually"
    of verilogExpectTok:                                      "expect"
    of verilogExportTok:                                      "export"
    of verilogExtendsTok:                                     "extends"
    of verilogExternTok:                                      "extern"
    of verilogFinalTok:                                       "final"
    of verilogFirstMatchTok:                                  "first_match"
    of verilogFixedPointNumber:                               "fixed_point_number"
    of verilogForTok:                                         "for"
    of verilogForceTok:                                       "force"
    of verilogForeachTok:                                     "foreach"
    of verilogForeverTok:                                     "forever"
    of verilogForkTok:                                        "fork"
    of verilogForkjoinTok:                                    "forkjoin"
    of verilogFsTok:                                          "fs"
    of verilogFunctionTok:                                    "function"
    of verilogGenerateTok:                                    "generate"
    of verilogGenvarTok:                                      "genvar"
    of verilogGlobalTok:                                      "global"
    of verilogHexNumber:                                      "hex_number"
    of verilogHighz0Tok:                                      "highz0"
    of verilogHighz1Tok:                                      "highz1"
    of verilogIfTok:                                          "if"
    of verilogIffTok:                                         "iff"
    of verilogIfnoneTok:                                      "ifnone"
    of verilogIgnoreBinsTok:                                  "ignore_bins"
    of verilogIllegalBinsTok:                                 "illegal_bins"
    of verilogImplementsTok:                                  "implements"
    of verilogImpliesTok:                                     "implies"
    of verilogImportTok:                                      "import"
    of verilogInitialTok:                                     "initial"
    of verilogInoutTok:                                       "inout"
    of verilogInputTok:                                       "input"
    of verilogInsideTok:                                      "inside"
    of verilogInstanceTok:                                    "instance"
    of verilogIntTok:                                         "int"
    of verilogIntegerTok:                                     "integer"
    of verilogInterconnectTok:                                "interconnect"
    of verilogInterfaceTok:                                   "interface"
    of verilogIntersectTok:                                   "intersect"
    of verilogJoinTok:                                        "join"
    of verilogJoinAnyTok:                                     "join_any"
    of verilogJoinNoneTok:                                    "join_none"
    of verilogLargeTok:                                       "large"
    of verilogLetTok:                                         "let"
    of verilogLevelSymbol:                                    "level_symbol"
    of verilogLiblistTok:                                     "liblist"
    of verilogLocalTok:                                       "local"
    of verilogLocalparamTok:                                  "localparam"
    of verilogLogicTok:                                       "logic"
    of verilogLongintTok:                                     "longint"
    of verilogMacroText:                                      "macro_text"
    of verilogMacromoduleTok:                                 "macromodule"
    of verilogMatchesTok:                                     "matches"
    of verilogMediumTok:                                      "medium"
    of verilogModportTok:                                     "modport"
    of verilogModuleTok:                                      "module"
    of verilogMsTok:                                          "ms"
    of verilogNandTok:                                        "nand"
    of verilogNegedgeTok:                                     "negedge"
    of verilogNettypeTok:                                     "nettype"
    of verilogNewTok:                                         "new"
    of verilogNexttimeTok:                                    "nexttime"
    of verilogNmosTok:                                        "nmos"
    of verilogNoneTok:                                        "none"
    of verilogNorTok:                                         "nor"
    of verilogNoshowcancelledTok:                             "noshowcancelled"
    of verilogNotTok:                                         "not"
    of verilogNotif0Tok:                                      "notif0"
    of verilogNotif1Tok:                                      "notif1"
    of verilogNsTok:                                          "ns"
    of verilogNullTok:                                        "null"
    of verilogOctalNumber:                                    "octal_number"
    of verilogOptionTok:                                      "option"
    of verilogOrTok:                                          "or"
    of verilogOutputTok:                                      "output"
    of verilogOutputSymbol:                                   "output_symbol"
    of verilogPackageTok:                                     "package"
    of verilogPackedTok:                                      "packed"
    of verilogParameterTok:                                   "parameter"
    of verilogPmosTok:                                        "pmos"
    of verilogPosedgeTok:                                     "posedge"
    of verilogPrimitiveTok:                                   "primitive"
    of verilogPriorityTok:                                    "priority"
    of verilogProgramTok:                                     "program"
    of verilogPropertyTok:                                    "property"
    of verilogProtectedTok:                                   "protected"
    of verilogPsTok:                                          "ps"
    of verilogPull0Tok:                                       "pull0"
    of verilogPull1Tok:                                       "pull1"
    of verilogPulldownTok:                                    "pulldown"
    of verilogPullupTok:                                      "pullup"
    of verilogPulsestyleOndetectTok:                          "pulsestyle_ondetect"
    of verilogPulsestyleOneventTok:                           "pulsestyle_onevent"
    of verilogPureTok:                                        "pure"
    of verilogRandTok:                                        "rand"
    of verilogRandcTok:                                       "randc"
    of verilogRandcaseTok:                                    "randcase"
    of verilogRandomizeTok:                                   "randomize"
    of verilogRcmosTok:                                       "rcmos"
    of verilogRealTok:                                        "real"
    of verilogRealtimeTok:                                    "realtime"
    of verilogRefTok:                                         "ref"
    of verilogRegTok:                                         "reg"
    of verilogRejectOnTok:                                    "reject_on"
    of verilogReleaseTok:                                     "release"
    of verilogRepeatTok:                                      "repeat"
    of verilogRestrictTok:                                    "restrict"
    of verilogReturnTok:                                      "return"
    of verilogRnmosTok:                                       "rnmos"
    of verilogRpmosTok:                                       "rpmos"
    of verilogRtranTok:                                       "rtran"
    of verilogRtranif0Tok:                                    "rtranif0"
    of verilogRtranif1Tok:                                    "rtranif1"
    of verilogSTok:                                           "s"
    of verilogSAlwaysTok:                                     "s_always"
    of verilogSEventuallyTok:                                 "s_eventually"
    of verilogSNexttimeTok:                                   "s_nexttime"
    of verilogSUntilTok:                                      "s_until"
    of verilogSUntilWithTok:                                  "s_until_with"
    of verilogSampleTok:                                      "sample"
    of verilogScalaredTok:                                    "scalared"
    of verilogSequenceTok:                                    "sequence"
    of verilogShortintTok:                                    "shortint"
    of verilogShortrealTok:                                   "shortreal"
    of verilogShowcancelledTok:                               "showcancelled"
    of verilogSignedTok:                                      "signed"
    of verilogSimpleIdentifier:                               "simple_identifier"
    of verilogSmallTok:                                       "small"
    of verilogSoftTok:                                        "soft"
    of verilogSolveTok:                                       "solve"
    of verilogSpecifyTok:                                     "specify"
    of verilogSpecparamTok:                                   "specparam"
    of verilogStaticTok:                                      "static"
    of verilogStdTok:                                         "std"
    of verilogStringTok:                                      "string"
    of verilogStrongTok:                                      "strong"
    of verilogStrong0Tok:                                     "strong0"
    of verilogStrong1Tok:                                     "strong1"
    of verilogStructTok:                                      "struct"
    of verilogSuperTok:                                       "super"
    of verilogSupply0Tok:                                     "supply0"
    of verilogSupply1Tok:                                     "supply1"
    of verilogSyncAcceptOnTok:                                "sync_accept_on"
    of verilogSyncRejectOnTok:                                "sync_reject_on"
    of verilogSystemTfIdentifier:                             "system_tf_identifier"
    of verilogTableTok:                                       "table"
    of verilogTaggedTok:                                      "tagged"
    of verilogTaskTok:                                        "task"
    of verilogThisTok:                                        "this"
    of verilogThroughoutTok:                                  "throughout"
    of verilogTimeTok:                                        "time"
    of verilogTimeprecisionTok:                               "timeprecision"
    of verilogTimeunitTok:                                    "timeunit"
    of verilogTranTok:                                        "tran"
    of verilogTranif0Tok:                                     "tranif0"
    of verilogTranif1Tok:                                     "tranif1"
    of verilogTriTok:                                         "tri"
    of verilogTri0Tok:                                        "tri0"
    of verilogTri1Tok:                                        "tri1"
    of verilogTriandTok:                                      "triand"
    of verilogTriorTok:                                       "trior"
    of verilogTriregTok:                                      "trireg"
    of verilogTypeTok:                                        "type"
    of verilogTypeOptionTok:                                  "type_option"
    of verilogTypedefTok:                                     "typedef"
    of verilogUnionTok:                                       "union"
    of verilogUniqueTok:                                      "unique"
    of verilogUnique0Tok:                                     "unique0"
    of verilogUnsignedTok:                                    "unsigned"
    of verilogUnsignedNumber:                                 "unsigned_number"
    of verilogUntilTok:                                       "until"
    of verilogUntilWithTok:                                   "until_with"
    of verilogUntypedTok:                                     "untyped"
    of verilogUsTok:                                          "us"
    of verilogUseTok:                                         "use"
    of verilogUwireTok:                                       "uwire"
    of verilogVarTok:                                         "var"
    of verilogVectoredTok:                                    "vectored"
    of verilogVirtualTok:                                     "virtual"
    of verilogVoidTok:                                        "void"
    of verilogVoidApostropheTok:                              "void\'"
    of verilogWaitTok:                                        "wait"
    of verilogWaitOrderTok:                                   "wait_order"
    of verilogWandTok:                                        "wand"
    of verilogWeakTok:                                        "weak"
    of verilogWeak0Tok:                                       "weak0"
    of verilogWeak1Tok:                                       "weak1"
    of verilogWhileTok:                                       "while"
    of verilogWildcardTok:                                    "wildcard"
    of verilogWireTok:                                        "wire"
    of verilogWithTok:                                        "with"
    of verilogWithinTok:                                      "within"
    of verilogWorTok:                                         "wor"
    of verilogXnorTok:                                        "xnor"
    of verilogXorTok:                                         "xor"
    of verilogLCurlyTok:                                      "{"
    of verilogPipeTok:                                        "|"
    of verilogPipeMinusGreaterThanTok:                        "|->"
    of verilogPipeEqualTok:                                   "|="
    of verilogPipeEqualGreaterThanTok:                        "|=>"
    of verilogDoublePipeTok:                                  "||"
    of verilogRCurlyTok:                                      "}"
    of verilogTildeTok:                                       "~"
    of verilogTildeAmpersandTok:                              "~&"
    of verilogTildeAccentTok:                                 "~^"
    of verilogTildePipeTok:                                   "~|"
    of verilog–Tok:                                           "\xE2\x80\x93"
    of verilog–GreaterThanTok:                                "\xE2\x80\x93>"
    of verilog––Tok:                                          "\xE2\x80\x93\xE2\x80\x93"
    of verilogSyntaxError:                                    "ERROR"


type
  TsVerilogNode* = distinct TSNode


type
  VerilogParser* = distinct PtsParser


const verilogAllowedSubnodes*: array[VerilogNodeKind, set[VerilogNodeKind]] = block:
                                                                                var tmp: array[VerilogNodeKind, set[VerilogNodeKind]]
                                                                                tmp[verilogDollarfulskewUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogEventBasedFlag, verilogNotifier, verilogReferenceEvent, verilogRemainActiveFlag, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarholdUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogNotifier, verilogReferenceEvent, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarnochangeUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogEndEdgeOffset, verilogNotifier, verilogReferenceEvent, verilogStartEdgeOffset}
                                                                                tmp[verilogDollarperiodUnderscoretimingUnderscorecheck] = {verilogControlledReferenceEvent, verilogNotifier, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarrecoveryUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogNotifier, verilogReferenceEvent, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarrecremUnderscoretimingUnderscorecheck] = {
                                                                                                                                            verilogDataEvent,
                                                                                                                                            verilogDelayedData,
                                                                                                                                            verilogDelayedReference,
                                                                                                                                            verilogNotifier,
                                                                                                                                            verilogReferenceEvent,
                                                                                                                                            verilogTimecheckCondition,
                                                                                                                                            verilogTimestampCondition,
                                                                                                                                            verilogTimingCheckLimit
                                                                                                                                          }
                                                                                tmp[verilogDollarremovalUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogNotifier, verilogReferenceEvent, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarsetupUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogNotifier, verilogReferenceEvent, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarsetupholdUnderscoretimingUnderscorecheck] = {
                                                                                                                                               verilogDataEvent,
                                                                                                                                               verilogDelayedData,
                                                                                                                                               verilogDelayedReference,
                                                                                                                                               verilogNotifier,
                                                                                                                                               verilogReferenceEvent,
                                                                                                                                               verilogTimecheckCondition,
                                                                                                                                               verilogTimestampCondition,
                                                                                                                                               verilogTimingCheckLimit
                                                                                                                                             }
                                                                                tmp[verilogDollarskewUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogNotifier, verilogReferenceEvent, verilogTimingCheckLimit}
                                                                                tmp[verilogDollartimeskewUnderscoretimingUnderscorecheck] = {verilogDataEvent, verilogEventBasedFlag, verilogNotifier, verilogReferenceEvent, verilogRemainActiveFlag, verilogTimingCheckLimit}
                                                                                tmp[verilogDollarwidthUnderscoretimingUnderscorecheck] = {verilogControlledReferenceEvent, verilogNotifier, verilogThreshold, verilogTimingCheckLimit}
                                                                                tmp[verilogOrderedParameterAssignment] = {verilogDataType, verilogMintypmaxExpression}
                                                                                tmp[verilogActionBlock] = {verilogStatement, verilogStatementOrNull}
                                                                                tmp[verilogAlwaysConstruct] = {verilogAlwaysKeyword, verilogStatement}
                                                                                tmp[verilogAnonymousProgram] = {verilogAnonymousProgramItem}
                                                                                tmp[verilogAnonymousProgramItem] = {verilogClassConstructorDeclaration, verilogClassDeclaration, verilogCovergroupDeclaration, verilogFunctionDeclaration, verilogTaskDeclaration}
                                                                                tmp[verilogAnsiPortDeclaration] = {
                                                                                                                    verilogAssociativeDimension,
                                                                                                                    verilogConstantExpression,
                                                                                                                    verilogExpression,
                                                                                                                    verilogInterfacePortHeader,
                                                                                                                    verilogNetPortHeader1,
                                                                                                                    verilogPortDirection,
                                                                                                                    verilogPortIdentifier,
                                                                                                                    verilogQueueDimension,
                                                                                                                    verilogUnpackedDimension,
                                                                                                                    verilogUnsizedDimension,
                                                                                                                    verilogVariablePortHeader
                                                                                                                  }
                                                                                tmp[verilogArrayManipulationCall] = {verilogArrayMethodName, verilogAttributeInstance, verilogExpression, verilogListOfArgumentsParent}
                                                                                tmp[verilogArrayMethodName] = {verilogMethodIdentifier}
                                                                                tmp[verilogArrayRangeExpression] = {verilogExpression}
                                                                                tmp[verilogAssertPropertyStatement] = {verilogActionBlock, verilogPropertySpec}
                                                                                tmp[verilogAssertionVariableDeclaration] = {verilogDataType, verilogDataTypeOrImplicit1, verilogListOfVariableDeclAssignments}
                                                                                tmp[verilogAssignmentPattern] = {verilogAssignmentPatternKey, verilogConstantExpression, verilogExpression}
                                                                                tmp[verilogAssignmentPatternExpression] = {
                                                                                                                            verilogAssignmentPattern,
                                                                                                                            verilogClassScope,
                                                                                                                            verilogEscapedIdentifier,
                                                                                                                            verilogIntegerAtomType,
                                                                                                                            verilogPackageScope,
                                                                                                                            verilogSimpleIdentifier,
                                                                                                                            verilogTypeReference
                                                                                                                          }
                                                                                tmp[verilogAssignmentPatternKey] = {
                                                                                                                     verilogClassScope,
                                                                                                                     verilogConstantExpression,
                                                                                                                     verilogEscapedIdentifier,
                                                                                                                     verilogGenerateBlockIdentifier,
                                                                                                                     verilogIntegerAtomType,
                                                                                                                     verilogIntegerVectorType,
                                                                                                                     verilogNonIntegerType,
                                                                                                                     verilogPackageScope,
                                                                                                                     verilogParameterIdentifier,
                                                                                                                     verilogSimpleIdentifier
                                                                                                                   }
                                                                                tmp[verilogAssignmentPatternNetLvalue] = {verilogNetLvalue}
                                                                                tmp[verilogAssignmentPatternVariableLvalue] = {verilogVariableLvalue}
                                                                                tmp[verilogAssociativeDimension] = {verilogDataType}
                                                                                tmp[verilogAssumePropertyStatement] = {verilogActionBlock, verilogPropertySpec}
                                                                                tmp[verilogAttrSpec] = {verilogConstantExpression, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogAttributeInstance] = {verilogAttrSpec}
                                                                                tmp[verilogBeginKeywords] = {verilogDoubleQuotedString}
                                                                                tmp[verilogBindDirective] = {
                                                                                                              verilogBindTargetInstance,
                                                                                                              verilogBindTargetInstanceList,
                                                                                                              verilogBindTargetScope,
                                                                                                              verilogCheckerInstantiation,
                                                                                                              verilogInterfaceInstantiation,
                                                                                                              verilogModuleInstantiation,
                                                                                                              verilogProgramInstantiation
                                                                                                            }
                                                                                tmp[verilogBindTargetInstance] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogBindTargetInstanceList] = {verilogBindTargetInstance}
                                                                                tmp[verilogBindTargetScope] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogBinsExpression] = {verilogCoverPointIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogBinsOrEmpty] = {verilogAttributeInstance, verilogBinsOrOptions}
                                                                                tmp[verilogBinsOrOptions] = {
                                                                                                              verilogBinsKeyword,
                                                                                                              verilogCoverPointIdentifier,
                                                                                                              verilogCoverageOption,
                                                                                                              verilogCovergroupRangeList,
                                                                                                              verilogEscapedIdentifier,
                                                                                                              verilogExpression,
                                                                                                              verilogSimpleIdentifier,
                                                                                                              verilogTransList
                                                                                                            }
                                                                                tmp[verilogBinsSelection] = {verilogBinsKeyword, verilogEscapedIdentifier, verilogExpression, verilogSelectExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogBinsSelectionOrOption] = {verilogAttributeInstance, verilogBinsSelection, verilogCoverageOption}
                                                                                tmp[verilogBitSelect1] = {verilogExpression}
                                                                                tmp[verilogBlockEventExpression] = {verilogBlockEventExpression, verilogHierarchicalBtfIdentifier}
                                                                                tmp[verilogBlockItemDeclaration] = {verilogAttributeInstance, verilogDataDeclaration, verilogLetDeclaration, verilogLocalParameterDeclaration, verilogOverloadDeclaration, verilogParameterDeclaration}
                                                                                tmp[verilogBlockingAssignment] = {verilogDelayOrEventControl, verilogDynamicArrayNew, verilogExpression, verilogNonrangeVariableLvalue, verilogOperatorAssignment, verilogVariableLvalue}
                                                                                tmp[verilogCaseExpression] = {verilogExpression}
                                                                                tmp[verilogCaseGenerateConstruct] = {verilogCaseGenerateItem, verilogConstantExpression}
                                                                                tmp[verilogCaseGenerateItem] = {verilogConstantExpression, verilogGenerateBlock}
                                                                                tmp[verilogCaseInsideItem] = {verilogOpenRangeList, verilogStatementOrNull}
                                                                                tmp[verilogCaseItem] = {verilogCaseItemExpression, verilogStatementOrNull}
                                                                                tmp[verilogCaseItemExpression] = {verilogExpression}
                                                                                tmp[verilogCasePatternItem] = {verilogExpression, verilogPattern, verilogStatementOrNull}
                                                                                tmp[verilogCaseStatement] = {verilogCaseExpression, verilogCaseInsideItem, verilogCaseItem, verilogCaseKeyword, verilogCasePatternItem, verilogUniquePriority}
                                                                                tmp[verilogCast] = {verilogCastingType, verilogExpression}
                                                                                tmp[verilogCastingType] = {
                                                                                                            verilogClassScope,
                                                                                                            verilogConstantExpression,
                                                                                                            verilogConstantPrimary,
                                                                                                            verilogEscapedIdentifier,
                                                                                                            verilogGenerateBlockIdentifier,
                                                                                                            verilogIntegerAtomType,
                                                                                                            verilogIntegerVectorType,
                                                                                                            verilogNonIntegerType,
                                                                                                            verilogPackageScope,
                                                                                                            verilogParameterIdentifier,
                                                                                                            verilogSimpleIdentifier
                                                                                                          }
                                                                                tmp[verilogCellClause] = {verilogCellIdentifier, verilogLibraryIdentifier}
                                                                                tmp[verilogCellIdentifier] = {verilogCellIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogCheckerDeclaration] = {
                                                                                                                   verilogAlwaysConstruct,
                                                                                                                   verilogAttributeInstance,
                                                                                                                   verilogCaseGenerateConstruct,
                                                                                                                   verilogCheckerIdentifier,
                                                                                                                   verilogCheckerOrGenerateItemDeclaration,
                                                                                                                   verilogCheckerPortList,
                                                                                                                   verilogConcurrentAssertionItem,
                                                                                                                   verilogContinuousAssign,
                                                                                                                   verilogDeferredImmediateAssertionItem,
                                                                                                                   verilogElaborationSystemTask,
                                                                                                                   verilogFinalConstruct,
                                                                                                                   verilogGenerateRegion,
                                                                                                                   verilogIfGenerateConstruct,
                                                                                                                   verilogInitialConstruct,
                                                                                                                   verilogLoopGenerateConstruct
                                                                                                                 }
                                                                                tmp[verilogCheckerIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogCheckerInstantiation] = {
                                                                                                                     verilogAttributeInstance,
                                                                                                                     verilogCheckerIdentifier,
                                                                                                                     verilogEventExpression,
                                                                                                                     verilogFormalPortIdentifier,
                                                                                                                     verilogNameOfInstance,
                                                                                                                     verilogPackageScope,
                                                                                                                     verilogPropertyExpr,
                                                                                                                     verilogSequenceExpr
                                                                                                                   }
                                                                                tmp[verilogCheckerOrGenerateItemDeclaration] = {
                                                                                                                                 verilogCheckerDeclaration,
                                                                                                                                 verilogClockingDeclaration,
                                                                                                                                 verilogClockingIdentifier,
                                                                                                                                 verilogCovergroupDeclaration,
                                                                                                                                 verilogDataDeclaration,
                                                                                                                                 verilogExpressionOrDist,
                                                                                                                                 verilogFunctionDeclaration,
                                                                                                                                 verilogGenvarDeclaration,
                                                                                                                                 verilogLetDeclaration,
                                                                                                                                 verilogPropertyDeclaration,
                                                                                                                                 verilogSequenceDeclaration
                                                                                                                               }
                                                                                tmp[verilogCheckerPortItem] = {
                                                                                                                verilogAssociativeDimension,
                                                                                                                verilogAttributeInstance,
                                                                                                                verilogCheckerPortDirection,
                                                                                                                verilogEventExpression,
                                                                                                                verilogFormalPortIdentifier,
                                                                                                                verilogPropertyExpr,
                                                                                                                verilogPropertyFormalType1,
                                                                                                                verilogQueueDimension,
                                                                                                                verilogSequenceExpr,
                                                                                                                verilogUnpackedDimension,
                                                                                                                verilogUnsizedDimension
                                                                                                              }
                                                                                tmp[verilogCheckerPortList] = {verilogCheckerPortItem}
                                                                                tmp[verilogClassConstructorDeclaration] = {verilogBlockItemDeclaration, verilogClassScope, verilogFunctionStatementOrNull, verilogListOfArgumentsParent, verilogTfPortList}
                                                                                tmp[verilogClassConstructorPrototype] = {verilogTfPortList}
                                                                                tmp[verilogClassDeclaration] = {
                                                                                                                 verilogClassIdentifier,
                                                                                                                 verilogClassItem,
                                                                                                                 verilogClassType,
                                                                                                                 verilogInterfaceClassType,
                                                                                                                 verilogLifetime,
                                                                                                                 verilogListOfArgumentsParent,
                                                                                                                 verilogParameterPortList
                                                                                                               }
                                                                                tmp[verilogClassIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogClassItem] = {
                                                                                                          verilogAttributeInstance,
                                                                                                          verilogBeginKeywords,
                                                                                                          verilogClassDeclaration,
                                                                                                          verilogClassMethod,
                                                                                                          verilogClassProperty,
                                                                                                          verilogConstraintDeclaration,
                                                                                                          verilogConstraintPrototype,
                                                                                                          verilogCovergroupDeclaration,
                                                                                                          verilogDefaultNettypeCompilerDirective,
                                                                                                          verilogIdDirective,
                                                                                                          verilogIncludeCompilerDirective,
                                                                                                          verilogLineCompilerDirective,
                                                                                                          verilogLocalParameterDeclaration,
                                                                                                          verilogParameterDeclaration,
                                                                                                          verilogTextMacroDefinition,
                                                                                                          verilogTextMacroUsage,
                                                                                                          verilogTimescaleCompilerDirective,
                                                                                                          verilogUnconnectedDrive,
                                                                                                          verilogZeroDirective
                                                                                                        }
                                                                                tmp[verilogClassMethod] = {
                                                                                                            verilogClassConstructorDeclaration,
                                                                                                            verilogClassConstructorPrototype,
                                                                                                            verilogClassItemQualifier,
                                                                                                            verilogFunctionDeclaration,
                                                                                                            verilogFunctionPrototype,
                                                                                                            verilogMethodQualifier,
                                                                                                            verilogTaskDeclaration,
                                                                                                            verilogTaskPrototype
                                                                                                          }
                                                                                tmp[verilogClassNew] = {verilogClassScope, verilogExpression, verilogListOfArgumentsParent}
                                                                                tmp[verilogClassProperty] = {verilogClassItemQualifier, verilogConstIdentifier, verilogConstantExpression, verilogDataDeclaration, verilogDataType, verilogRandomQualifier}
                                                                                tmp[verilogClassQualifier] = {verilogClassScope, verilogImplicitClassHandle}
                                                                                tmp[verilogClassScope] = {verilogClassType}
                                                                                tmp[verilogClassType] = {verilogClassIdentifier, verilogPackageScope, verilogParameterValueAssignment}
                                                                                tmp[verilogClockingDeclAssign] = {verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogClockingDeclaration] = {verilogClockingEvent, verilogClockingIdentifier, verilogClockingItem}
                                                                                tmp[verilogClockingDirection] = {verilogClockingSkew}
                                                                                tmp[verilogClockingDrive] = {verilogClockvarExpression, verilogCycleDelay, verilogExpression}
                                                                                tmp[verilogClockingEvent] = {verilogEscapedIdentifier, verilogEventExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogClockingIdentifier] = {verilogClockingIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogClockingItem] = {
                                                                                                             verilogAttributeInstance,
                                                                                                             verilogClockingDirection,
                                                                                                             verilogDefaultSkew,
                                                                                                             verilogLetDeclaration,
                                                                                                             verilogListOfClockingDeclAssign,
                                                                                                             verilogPropertyDeclaration,
                                                                                                             verilogSequenceDeclaration
                                                                                                           }
                                                                                tmp[verilogClockingSkew] = {verilogDelayControl, verilogEdgeIdentifier}
                                                                                tmp[verilogClockvar] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogClockvarExpression] = {verilogClockvar, verilogSelect1}
                                                                                tmp[verilogCmosSwitchInstance] = {verilogInputTerminal, verilogNameOfInstance, verilogNcontrolTerminal, verilogOutputTerminal, verilogPcontrolTerminal}
                                                                                tmp[verilogCombinationalBody] = {verilogCombinationalEntry}
                                                                                tmp[verilogCombinationalEntry] = {verilogLevelInputList, verilogOutputSymbol}
                                                                                tmp[verilogConcatenation] = {verilogExpression}
                                                                                tmp[verilogConcurrentAssertionItem] = {
                                                                                                                        verilogAssertPropertyStatement,
                                                                                                                        verilogAssumePropertyStatement,
                                                                                                                        verilogCheckerInstantiation,
                                                                                                                        verilogCoverPropertyStatement,
                                                                                                                        verilogCoverSequenceStatement,
                                                                                                                        verilogEscapedIdentifier,
                                                                                                                        verilogRestrictPropertyStatement,
                                                                                                                        verilogSimpleIdentifier
                                                                                                                      }
                                                                                tmp[verilogCondPattern] = {verilogExpression, verilogPattern}
                                                                                tmp[verilogCondPredicate] = {verilogCondPattern, verilogExpression}
                                                                                tmp[verilogConditionalExpression] = {verilogAttributeInstance, verilogCondPredicate, verilogExpression}
                                                                                tmp[verilogConditionalStatement] = {verilogCondPredicate, verilogStatementOrNull, verilogUniquePriority}
                                                                                tmp[verilogConfigIdentifier] = {verilogConfigIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogConfigRuleStatement] = {verilogCellClause, verilogDefaultClause, verilogInstClause, verilogLiblistClause, verilogUseClause}
                                                                                tmp[verilogConsecutiveRepetition] = {verilogConstantExpression, verilogCycleDelayConstRangeExpression}
                                                                                tmp[verilogConstIdentifier] = {verilogConstIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogConstantBitSelect1] = {verilogConstantExpression}
                                                                                tmp[verilogConstantConcatenation] = {verilogConstantExpression}
                                                                                tmp[verilogConstantExpression] = {verilogAttributeInstance, verilogConstantExpression, verilogConstantPrimary, verilogUnaryOperator}
                                                                                tmp[verilogConstantIndexedRange] = {verilogConstantExpression}
                                                                                tmp[verilogConstantMintypmaxExpression] = {verilogConstantExpression}
                                                                                tmp[verilogConstantMultipleConcatenation] = {verilogConstantConcatenation, verilogConstantExpression}
                                                                                tmp[verilogConstantParamExpression] = {verilogConstantMintypmaxExpression, verilogDataType}
                                                                                tmp[verilogConstantPrimary] = {
                                                                                                                verilogClassScope,
                                                                                                                verilogConstantConcatenation,
                                                                                                                verilogConstantExpression,
                                                                                                                verilogConstantIndexedRange,
                                                                                                                verilogConstantMintypmaxExpression,
                                                                                                                verilogConstantMultipleConcatenation,
                                                                                                                verilogConstantRange,
                                                                                                                verilogConstantSelect1,
                                                                                                                verilogGenerateBlockIdentifier,
                                                                                                                verilogPackageScope,
                                                                                                                verilogParameterIdentifier,
                                                                                                                verilogPrimaryLiteral,
                                                                                                                verilogTypeReference
                                                                                                              }
                                                                                tmp[verilogConstantRange] = {verilogConstantExpression}
                                                                                tmp[verilogConstantSelect1] = {verilogConstantExpression, verilogConstantIndexedRange, verilogConstantRange}
                                                                                tmp[verilogConstraintBlock] = {verilogConstraintBlockItem}
                                                                                tmp[verilogConstraintBlockItem] = {verilogConstraintExpression, verilogSolveBeforeList}
                                                                                tmp[verilogConstraintDeclaration] = {verilogConstraintBlock, verilogConstraintIdentifier}
                                                                                tmp[verilogConstraintExpression] = {
                                                                                                                     verilogConstraintPrimary,
                                                                                                                     verilogConstraintSet,
                                                                                                                     verilogExpression,
                                                                                                                     verilogExpressionOrDist,
                                                                                                                     verilogLoopVariables1,
                                                                                                                     verilogPsOrHierarchicalArrayIdentifier,
                                                                                                                     verilogUniquenessConstraint
                                                                                                                   }
                                                                                tmp[verilogConstraintIdentifier] = {verilogConstraintIdentifier, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogConstraintPrimary] = {verilogClassScope, verilogConstantBitSelect1, verilogEscapedIdentifier, verilogImplicitClassHandle, verilogSelect1, verilogSimpleIdentifier}
                                                                                tmp[verilogConstraintPrototype] = {verilogConstraintIdentifier, verilogConstraintPrototypeQualifier}
                                                                                tmp[verilogConstraintSet] = {verilogConstraintExpression}
                                                                                tmp[verilogContinuousAssign] = {verilogDelay3, verilogDelayControl, verilogDriveStrength, verilogListOfNetAssignments, verilogListOfVariableAssignments}
                                                                                tmp[verilogControlledReferenceEvent] = {verilogControlledReferenceEvent, verilogSpecifyInputTerminalDescriptor, verilogSpecifyOutputTerminalDescriptor, verilogTimingCheckCondition, verilogTimingCheckEventControl}
                                                                                tmp[verilogCoverCross] = {verilogCrossBody, verilogCrossIdentifier, verilogExpression, verilogListOfCrossItems}
                                                                                tmp[verilogCoverPoint] = {verilogBinsOrEmpty, verilogCoverPointIdentifier, verilogDataTypeOrImplicit1, verilogExpression}
                                                                                tmp[verilogCoverPointIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogCoverPropertyStatement] = {verilogPropertySpec, verilogStatementOrNull}
                                                                                tmp[verilogCoverSequenceStatement] = {verilogClockingEvent, verilogExpressionOrDist, verilogSequenceExpr, verilogStatementOrNull}
                                                                                tmp[verilogCoverageEvent] = {verilogBlockEventExpression, verilogClockingEvent, verilogTfPortList}
                                                                                tmp[verilogCoverageOption] = {verilogConstantExpression, verilogExpression, verilogMemberIdentifier}
                                                                                tmp[verilogCoverageSpecOrOption] = {verilogAttributeInstance, verilogCoverCross, verilogCoverPoint, verilogCoverageOption}
                                                                                tmp[verilogCovergroupDeclaration] = {verilogCoverageEvent, verilogCoverageSpecOrOption, verilogCovergroupIdentifier, verilogTfPortList}
                                                                                tmp[verilogCovergroupIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogCovergroupRangeList] = {verilogCovergroupValueRange}
                                                                                tmp[verilogCovergroupValueRange] = {verilogExpression}
                                                                                tmp[verilogCrossBody] = {verilogCrossBodyItem}
                                                                                tmp[verilogCrossBodyItem] = {verilogBinsSelectionOrOption, verilogFunctionDeclaration}
                                                                                tmp[verilogCrossIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogCycleDelay] = {verilogEscapedIdentifier, verilogExpression, verilogIntegralNumber, verilogSimpleIdentifier}
                                                                                tmp[verilogCycleDelayConstRangeExpression] = {verilogConstantExpression}
                                                                                tmp[verilogCycleDelayRange] = {verilogConstantPrimary, verilogCycleDelayConstRangeExpression}
                                                                                tmp[verilogDataDeclaration] = {verilogDataTypeOrImplicit1, verilogLifetime, verilogListOfVariableDeclAssignments, verilogNetTypeDeclaration, verilogPackageImportDeclaration, verilogTypeDeclaration}
                                                                                tmp[verilogDataEvent] = {verilogTimingCheckEvent}
                                                                                tmp[verilogDataSourceExpression] = {verilogExpression}
                                                                                tmp[verilogDataType] = {
                                                                                                         verilogClassScope,
                                                                                                         verilogClassType,
                                                                                                         verilogCovergroupIdentifier,
                                                                                                         verilogEnumBaseType,
                                                                                                         verilogEnumNameDeclaration,
                                                                                                         verilogEscapedIdentifier,
                                                                                                         verilogIntegerAtomType,
                                                                                                         verilogIntegerVectorType,
                                                                                                         verilogInterfaceIdentifier,
                                                                                                         verilogModportIdentifier,
                                                                                                         verilogNonIntegerType,
                                                                                                         verilogPackageScope,
                                                                                                         verilogPackedDimension,
                                                                                                         verilogParameterValueAssignment,
                                                                                                         verilogSimpleIdentifier,
                                                                                                         verilogStructUnion,
                                                                                                         verilogStructUnionMember,
                                                                                                         verilogTypeReference
                                                                                                       }
                                                                                tmp[verilogDataTypeOrImplicit1] = {verilogDataType, verilogImplicitDataType1}
                                                                                tmp[verilogDataTypeOrVoid] = {verilogDataType}
                                                                                tmp[verilogDecimalNumber] = {verilogUnsignedNumber}
                                                                                tmp[verilogDefaultNettypeCompilerDirective] = {verilogDefaultNettypeValue}
                                                                                tmp[verilogDefaultSkew] = {verilogClockingSkew}
                                                                                tmp[verilogDeferredImmediateAssertStatement] = {verilogActionBlock, verilogExpression}
                                                                                tmp[verilogDeferredImmediateAssertionItem] = {verilogDeferredImmediateAssertStatement, verilogDeferredImmediateAssumeStatement, verilogDeferredImmediateCoverStatement, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogDeferredImmediateAssumeStatement] = {verilogActionBlock, verilogExpression}
                                                                                tmp[verilogDeferredImmediateCoverStatement] = {verilogExpression, verilogStatementOrNull}
                                                                                tmp[verilogDefparamAssignment] = {verilogConstantBitSelect1, verilogConstantMintypmaxExpression, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogDelay2] = {verilogDelayValue, verilogMintypmaxExpression}
                                                                                tmp[verilogDelay3] = {verilogDelayValue, verilogMintypmaxExpression}
                                                                                tmp[verilogDelayControl] = {verilogDelayValue, verilogMintypmaxExpression}
                                                                                tmp[verilogDelayOrEventControl] = {verilogDelayControl, verilogEventControl, verilogExpression}
                                                                                tmp[verilogDelayValue] = {verilogPsIdentifier, verilogRealNumber, verilogTimeLiteral, verilogUnsignedNumber}
                                                                                tmp[verilogDelayedData] = {verilogConstantMintypmaxExpression, verilogTerminalIdentifier}
                                                                                tmp[verilogDelayedReference] = {verilogConstantMintypmaxExpression, verilogTerminalIdentifier}
                                                                                tmp[verilogDesignStatement] = {verilogCellIdentifier, verilogLibraryIdentifier}
                                                                                tmp[verilogDisableStatement] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogDistItem] = {verilogDistWeight, verilogValueRange}
                                                                                tmp[verilogDistList] = {verilogDistItem}
                                                                                tmp[verilogDistWeight] = {verilogExpression}
                                                                                tmp[verilogDpiFunctionProto] = {verilogFunctionPrototype}
                                                                                tmp[verilogDpiImportExport] = {
                                                                                                                verilogCIdentifier,
                                                                                                                verilogDpiFunctionImportProperty,
                                                                                                                verilogDpiFunctionProto,
                                                                                                                verilogDpiSpecString,
                                                                                                                verilogDpiTaskImportProperty,
                                                                                                                verilogDpiTaskProto,
                                                                                                                verilogFunctionIdentifier,
                                                                                                                verilogTaskIdentifier
                                                                                                              }
                                                                                tmp[verilogDpiTaskProto] = {verilogTaskPrototype}
                                                                                tmp[verilogDriveStrength] = {verilogStrength0, verilogStrength1}
                                                                                tmp[verilogDynamicArrayNew] = {verilogExpression}
                                                                                tmp[verilogEdgeControlSpecifier] = {verilogEdgeDescriptor}
                                                                                tmp[verilogEdgeIndicator] = {verilogEdgeSymbol, verilogLevelSymbol}
                                                                                tmp[verilogEdgeInputList] = {verilogEdgeIndicator, verilogLevelSymbol}
                                                                                tmp[verilogEdgeSensitivePathDeclaration] = {verilogFullEdgeSensitivePathDescription, verilogParallelEdgeSensitivePathDescription, verilogPathDelayValue}
                                                                                tmp[verilogElaborationSystemTask] = {verilogFinishNumber, verilogListOfArguments, verilogListOfArgumentsParent}
                                                                                tmp[verilogEnableGateInstance] = {verilogEnableTerminal, verilogInputTerminal, verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogEnableTerminal] = {verilogExpression}
                                                                                tmp[verilogEndEdgeOffset] = {verilogMintypmaxExpression}
                                                                                tmp[verilogEnumBaseType] = {verilogEscapedIdentifier, verilogIntegerAtomType, verilogIntegerVectorType, verilogPackedDimension, verilogSimpleIdentifier}
                                                                                tmp[verilogEnumIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogEnumNameDeclaration] = {verilogConstantExpression, verilogEnumIdentifier, verilogIntegralNumber}
                                                                                tmp[verilogErrorLimitValue] = {verilogLimitValue}
                                                                                tmp[verilogEventBasedFlag] = {verilogConstantExpression}
                                                                                tmp[verilogEventControl] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogEventExpression, verilogPackageScope, verilogSimpleIdentifier}
                                                                                tmp[verilogEventExpression] = {verilogEdgeIdentifier, verilogEventExpression, verilogExpression}
                                                                                tmp[verilogEventTrigger] = {verilogConstantBitSelect1, verilogDelayOrEventControl, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogExpectPropertyStatement] = {verilogActionBlock, verilogPropertySpec}
                                                                                tmp[verilogExpression] = {
                                                                                                           verilogAttributeInstance,
                                                                                                           verilogConditionalExpression,
                                                                                                           verilogExpression,
                                                                                                           verilogIncOrDecExpression,
                                                                                                           verilogInsideExpression,
                                                                                                           verilogOperatorAssignment,
                                                                                                           verilogPrimary,
                                                                                                           verilogTaggedUnionExpression,
                                                                                                           verilogUnaryOperator
                                                                                                         }
                                                                                tmp[verilogExpressionOrDist] = {verilogDistList, verilogExpression}
                                                                                tmp[verilogExternConstraintDeclaration] = {verilogClassScope, verilogConstraintBlock, verilogConstraintIdentifier}
                                                                                tmp[verilogExternTfDeclaration] = {verilogFunctionPrototype, verilogTaskPrototype}
                                                                                tmp[verilogFinalConstruct] = {verilogFunctionStatement}
                                                                                tmp[verilogForInitialization] = {verilogForVariableDeclaration, verilogListOfVariableAssignments}
                                                                                tmp[verilogForStep] = {verilogFunctionSubroutineCall, verilogIncOrDecExpression, verilogOperatorAssignment}
                                                                                tmp[verilogForVariableDeclaration] = {verilogDataType, verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogFormalArgument] = {verilogDefaultText, verilogSimpleIdentifier}
                                                                                tmp[verilogFormalIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogFormalPortIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogFullEdgeSensitivePathDescription] = {verilogDataSourceExpression, verilogEdgeIdentifier, verilogListOfPathInputs, verilogListOfPathOutputs, verilogPolarityOperator}
                                                                                tmp[verilogFullPathDescription] = {verilogListOfPathInputs, verilogListOfPathOutputs, verilogPolarityOperator}
                                                                                tmp[verilogFunctionBodyDeclaration] = {
                                                                                                                        verilogBlockItemDeclaration,
                                                                                                                        verilogClassScope,
                                                                                                                        verilogFunctionDataTypeOrImplicit1,
                                                                                                                        verilogFunctionIdentifier,
                                                                                                                        verilogFunctionStatementOrNull,
                                                                                                                        verilogInterfaceIdentifier,
                                                                                                                        verilogTfItemDeclaration,
                                                                                                                        verilogTfPortList
                                                                                                                      }
                                                                                tmp[verilogFunctionDataTypeOrImplicit1] = {verilogDataTypeOrVoid, verilogImplicitDataType1}
                                                                                tmp[verilogFunctionDeclaration] = {verilogFunctionBodyDeclaration, verilogLifetime}
                                                                                tmp[verilogFunctionIdentifier] = {verilogEscapedIdentifier, verilogFunctionIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogFunctionPrototype] = {verilogDataTypeOrVoid, verilogFunctionIdentifier, verilogTfPortList}
                                                                                tmp[verilogFunctionStatement] = {verilogStatement}
                                                                                tmp[verilogFunctionStatementOrNull] = {verilogAttributeInstance, verilogFunctionStatement}
                                                                                tmp[verilogFunctionSubroutineCall] = {verilogSubroutineCall}
                                                                                tmp[verilogGateInstantiation] = {
                                                                                                                  verilogCmosSwitchInstance,
                                                                                                                  verilogCmosSwitchtype,
                                                                                                                  verilogDelay2,
                                                                                                                  verilogDelay3,
                                                                                                                  verilogDriveStrength,
                                                                                                                  verilogEnableGateInstance,
                                                                                                                  verilogEnableGatetype,
                                                                                                                  verilogMosSwitchInstance,
                                                                                                                  verilogMosSwitchtype,
                                                                                                                  verilogNInputGateInstance,
                                                                                                                  verilogNInputGatetype,
                                                                                                                  verilogNOutputGateInstance,
                                                                                                                  verilogNOutputGatetype,
                                                                                                                  verilogPassEnSwitchtype,
                                                                                                                  verilogPassEnableSwitchInstance,
                                                                                                                  verilogPassSwitchInstance,
                                                                                                                  verilogPassSwitchtype,
                                                                                                                  verilogPullGateInstance,
                                                                                                                  verilogPulldownStrength,
                                                                                                                  verilogPullupStrength
                                                                                                                }
                                                                                tmp[verilogGenerateBlock] = {
                                                                                                              verilogAlwaysConstruct,
                                                                                                              verilogCaseGenerateConstruct,
                                                                                                              verilogCheckerOrGenerateItemDeclaration,
                                                                                                              verilogConcurrentAssertionItem,
                                                                                                              verilogContinuousAssign,
                                                                                                              verilogDeferredImmediateAssertionItem,
                                                                                                              verilogElaborationSystemTask,
                                                                                                              verilogFinalConstruct,
                                                                                                              verilogGenerateBlockIdentifier,
                                                                                                              verilogGenerateRegion,
                                                                                                              verilogIfGenerateConstruct,
                                                                                                              verilogInitialConstruct,
                                                                                                              verilogInterfaceOrGenerateItem,
                                                                                                              verilogLoopGenerateConstruct,
                                                                                                              verilogModuleOrGenerateItem
                                                                                                            }
                                                                                tmp[verilogGenerateBlockIdentifier] = {verilogEscapedIdentifier, verilogGenerateBlockIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogGenerateRegion] = {
                                                                                                               verilogAlwaysConstruct,
                                                                                                               verilogCaseGenerateConstruct,
                                                                                                               verilogCheckerOrGenerateItemDeclaration,
                                                                                                               verilogConcurrentAssertionItem,
                                                                                                               verilogContinuousAssign,
                                                                                                               verilogDeferredImmediateAssertionItem,
                                                                                                               verilogElaborationSystemTask,
                                                                                                               verilogFinalConstruct,
                                                                                                               verilogGenerateRegion,
                                                                                                               verilogIfGenerateConstruct,
                                                                                                               verilogInitialConstruct,
                                                                                                               verilogInterfaceOrGenerateItem,
                                                                                                               verilogLoopGenerateConstruct,
                                                                                                               verilogModuleOrGenerateItem
                                                                                                             }
                                                                                tmp[verilogGenvarDeclaration] = {verilogListOfGenvarIdentifiers}
                                                                                tmp[verilogGenvarIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogGenvarInitialization] = {verilogConstantExpression, verilogGenvarIdentifier}
                                                                                tmp[verilogGenvarIteration] = {verilogAssignmentOperator, verilogConstantExpression, verilogGenvarIdentifier, verilogIncOrDecOperator}
                                                                                tmp[verilogGotoRepetition] = {verilogConstantExpression, verilogCycleDelayConstRangeExpression}
                                                                                tmp[verilogHierarchicalBtfIdentifier] = {verilogClassScope, verilogConstantBitSelect1, verilogEscapedIdentifier, verilogMethodIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogHierarchicalInstance] = {verilogListOfPortConnections, verilogNameOfInstance}
                                                                                tmp[verilogIdDirective] = {verilogTextMacroIdentifier}
                                                                                tmp[verilogIdentifierList] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogIfGenerateConstruct] = {verilogConstantExpression, verilogGenerateBlock}
                                                                                tmp[verilogImplicitDataType1] = {verilogPackedDimension}
                                                                                tmp[verilogIncOrDecExpression] = {verilogAttributeInstance, verilogIncOrDecOperator, verilogVariableLvalue}
                                                                                tmp[verilogIncludeCompilerDirective] = {verilogDoubleQuotedString, verilogIncludeCompilerDirectiveStandard}
                                                                                tmp[verilogIndexVariableIdentifier] = {verilogEscapedIdentifier, verilogIndexVariableIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogIndexedRange] = {verilogConstantExpression, verilogExpression}
                                                                                tmp[verilogInitialConstruct] = {verilogStatementOrNull}
                                                                                tmp[verilogInoutDeclaration] = {verilogListOfPortIdentifiers, verilogNetPortType1}
                                                                                tmp[verilogInoutPortIdentifier] = {verilogEscapedIdentifier, verilogInoutPortIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogInoutTerminal] = {verilogNetLvalue}
                                                                                tmp[verilogInputDeclaration] = {verilogDataType, verilogDataTypeOrImplicit1, verilogListOfPortIdentifiers, verilogListOfVariableIdentifiers, verilogNetPortType1}
                                                                                tmp[verilogInputIdentifier] = {verilogInoutPortIdentifier, verilogInputPortIdentifier, verilogInterfaceIdentifier, verilogPortIdentifier}
                                                                                tmp[verilogInputPortIdentifier] = {verilogEscapedIdentifier, verilogInputPortIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogInputTerminal] = {verilogExpression}
                                                                                tmp[verilogInsideExpression] = {verilogExpression, verilogOpenRangeList}
                                                                                tmp[verilogInstClause] = {verilogInstName}
                                                                                tmp[verilogInstName] = {verilogInstanceIdentifier, verilogTopmoduleIdentifier}
                                                                                tmp[verilogInstanceIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogIntegralNumber] = {verilogBinaryNumber, verilogDecimalNumber, verilogHexNumber, verilogOctalNumber}
                                                                                tmp[verilogInterfaceAnsiHeader] = {verilogAttributeInstance, verilogInterfaceIdentifier, verilogLifetime, verilogListOfPortDeclarations, verilogPackageImportDeclaration, verilogParameterPortList}
                                                                                tmp[verilogInterfaceClassDeclaration] = {verilogClassIdentifier, verilogInterfaceClassItem, verilogInterfaceClassType, verilogParameterPortList}
                                                                                tmp[verilogInterfaceClassItem] = {verilogAttributeInstance, verilogInterfaceClassMethod, verilogLocalParameterDeclaration, verilogParameterDeclaration, verilogTypeDeclaration}
                                                                                tmp[verilogInterfaceClassMethod] = {verilogFunctionPrototype, verilogTaskPrototype}
                                                                                tmp[verilogInterfaceClassType] = {verilogClassIdentifier, verilogPackageScope, verilogParameterValueAssignment}
                                                                                tmp[verilogInterfaceDeclaration] = {
                                                                                                                     verilogAttributeInstance,
                                                                                                                     verilogGenerateRegion,
                                                                                                                     verilogInterfaceAnsiHeader,
                                                                                                                     verilogInterfaceDeclaration,
                                                                                                                     verilogInterfaceIdentifier,
                                                                                                                     verilogInterfaceItem,
                                                                                                                     verilogInterfaceNonansiHeader,
                                                                                                                     verilogInterfaceOrGenerateItem,
                                                                                                                     verilogModportDeclaration,
                                                                                                                     verilogProgramDeclaration,
                                                                                                                     verilogTimeunitsDeclaration
                                                                                                                   }
                                                                                tmp[verilogInterfaceIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogInterfaceInstanceIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogInterfaceInstantiation] = {verilogHierarchicalInstance, verilogInterfaceIdentifier, verilogParameterValueAssignment}
                                                                                tmp[verilogInterfaceItem] = {
                                                                                                              verilogGenerateRegion,
                                                                                                              verilogInterfaceDeclaration,
                                                                                                              verilogInterfaceOrGenerateItem,
                                                                                                              verilogModportDeclaration,
                                                                                                              verilogPortDeclaration,
                                                                                                              verilogProgramDeclaration,
                                                                                                              verilogTimeunitsDeclaration
                                                                                                            }
                                                                                tmp[verilogInterfaceNonansiHeader] = {verilogAttributeInstance, verilogInterfaceIdentifier, verilogLifetime, verilogListOfPorts, verilogPackageImportDeclaration, verilogParameterPortList}
                                                                                tmp[verilogInterfaceOrGenerateItem] = {
                                                                                                                        verilogAlwaysConstruct,
                                                                                                                        verilogAttributeInstance,
                                                                                                                        verilogBindDirective,
                                                                                                                        verilogCaseGenerateConstruct,
                                                                                                                        verilogClockingDeclaration,
                                                                                                                        verilogClockingIdentifier,
                                                                                                                        verilogConcurrentAssertionItem,
                                                                                                                        verilogContinuousAssign,
                                                                                                                        verilogDeferredImmediateAssertionItem,
                                                                                                                        verilogElaborationSystemTask,
                                                                                                                        verilogExpressionOrDist,
                                                                                                                        verilogExternTfDeclaration,
                                                                                                                        verilogFinalConstruct,
                                                                                                                        verilogGenvarDeclaration,
                                                                                                                        verilogIfGenerateConstruct,
                                                                                                                        verilogInitialConstruct,
                                                                                                                        verilogInterfaceInstantiation,
                                                                                                                        verilogLoopGenerateConstruct,
                                                                                                                        verilogNetAlias,
                                                                                                                        verilogPackageOrGenerateItemDeclaration,
                                                                                                                        verilogProgramInstantiation
                                                                                                                      }
                                                                                tmp[verilogInterfacePortDeclaration] = {verilogInterfaceIdentifier, verilogListOfInterfaceIdentifiers, verilogModportIdentifier}
                                                                                tmp[verilogInterfacePortHeader] = {verilogInterfaceIdentifier, verilogModportIdentifier}
                                                                                tmp[verilogJumpStatement] = {verilogExpression}
                                                                                tmp[verilogLetActualArg] = {verilogExpression}
                                                                                tmp[verilogLetDeclaration] = {verilogEscapedIdentifier, verilogExpression, verilogLetPortList, verilogSimpleIdentifier}
                                                                                tmp[verilogLetExpression] = {verilogEscapedIdentifier, verilogLetListOfArguments, verilogPackageScope, verilogSimpleIdentifier}
                                                                                tmp[verilogLetFormalType1] = {verilogDataTypeOrImplicit1}
                                                                                tmp[verilogLetListOfArguments] = {verilogEscapedIdentifier, verilogLetActualArg, verilogSimpleIdentifier}
                                                                                tmp[verilogLetPortItem] = {
                                                                                                            verilogAssociativeDimension,
                                                                                                            verilogAttributeInstance,
                                                                                                            verilogExpression,
                                                                                                            verilogFormalPortIdentifier,
                                                                                                            verilogLetFormalType1,
                                                                                                            verilogQueueDimension,
                                                                                                            verilogUnpackedDimension,
                                                                                                            verilogUnsizedDimension
                                                                                                          }
                                                                                tmp[verilogLetPortList] = {verilogLetPortItem}
                                                                                tmp[verilogLevelInputList] = {verilogLevelSymbol}
                                                                                tmp[verilogLiblistClause] = {verilogLibraryIdentifier}
                                                                                tmp[verilogLibraryIdentifier] = {verilogEscapedIdentifier, verilogLibraryIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogLimitValue] = {verilogConstantMintypmaxExpression}
                                                                                tmp[verilogLineCompilerDirective] = {verilogDoubleQuotedString, verilogUnsignedNumber}
                                                                                tmp[verilogListOfActualArguments] = {verilogExpression}
                                                                                tmp[verilogListOfArguments] = {verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogListOfArgumentsParent] = {verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier}
                                                                                tmp[verilogListOfClockingDeclAssign] = {verilogClockingDeclAssign}
                                                                                tmp[verilogListOfCrossItems] = {verilogCoverPointIdentifier}
                                                                                tmp[verilogListOfDefparamAssignments] = {verilogDefparamAssignment}
                                                                                tmp[verilogListOfFormalArguments] = {verilogFormalArgument}
                                                                                tmp[verilogListOfGenvarIdentifiers] = {verilogGenvarIdentifier}
                                                                                tmp[verilogListOfInterfaceIdentifiers] = {verilogInterfaceIdentifier, verilogUnpackedDimension}
                                                                                tmp[verilogListOfNetAssignments] = {verilogNetAssignment}
                                                                                tmp[verilogListOfNetDeclAssignments] = {verilogNetDeclAssignment}
                                                                                tmp[verilogListOfParamAssignments] = {verilogParamAssignment}
                                                                                tmp[verilogListOfParameterAssignments] = {verilogNamedParameterAssignment, verilogOrderedParameterAssignment}
                                                                                tmp[verilogListOfPathDelayExpressions] = {verilogPathDelayExpression}
                                                                                tmp[verilogListOfPathInputs] = {verilogSpecifyInputTerminalDescriptor}
                                                                                tmp[verilogListOfPathOutputs] = {verilogSpecifyOutputTerminalDescriptor}
                                                                                tmp[verilogListOfPortConnections] = {verilogNamedPortConnection, verilogOrderedPortConnection}
                                                                                tmp[verilogListOfPortDeclarations] = {verilogAnsiPortDeclaration, verilogAttributeInstance}
                                                                                tmp[verilogListOfPortIdentifiers] = {verilogPortIdentifier, verilogUnpackedDimension}
                                                                                tmp[verilogListOfPorts] = {verilogLineCompilerDirective, verilogPort}
                                                                                tmp[verilogListOfSpecparamAssignments] = {verilogSpecparamAssignment}
                                                                                tmp[verilogListOfTfVariableIdentifiers] = {verilogAssociativeDimension, verilogExpression, verilogPortIdentifier, verilogQueueDimension, verilogUnpackedDimension, verilogUnsizedDimension}
                                                                                tmp[verilogListOfTypeAssignments] = {verilogTypeAssignment}
                                                                                tmp[verilogListOfUdpPortIdentifiers] = {verilogPortIdentifier}
                                                                                tmp[verilogListOfVariableAssignments] = {verilogVariableAssignment}
                                                                                tmp[verilogListOfVariableDeclAssignments] = {verilogVariableDeclAssignment}
                                                                                tmp[verilogListOfVariableIdentifiers] = {verilogAssociativeDimension, verilogEscapedIdentifier, verilogQueueDimension, verilogSimpleIdentifier, verilogUnpackedDimension, verilogUnsizedDimension}
                                                                                tmp[verilogListOfVariablePortIdentifiers] = {verilogAssociativeDimension, verilogConstantExpression, verilogPortIdentifier, verilogQueueDimension, verilogUnpackedDimension, verilogUnsizedDimension}
                                                                                tmp[verilogLocalParameterDeclaration] = {verilogDataTypeOrImplicit1, verilogListOfParamAssignments, verilogListOfTypeAssignments}
                                                                                tmp[verilogLoopGenerateConstruct] = {verilogConstantExpression, verilogGenerateBlock, verilogGenvarInitialization, verilogGenvarIteration}
                                                                                tmp[verilogLoopStatement] = {
                                                                                                              verilogExpression,
                                                                                                              verilogForInitialization,
                                                                                                              verilogForStep,
                                                                                                              verilogLoopVariables1,
                                                                                                              verilogPsOrHierarchicalArrayIdentifier,
                                                                                                              verilogStatement,
                                                                                                              verilogStatementOrNull
                                                                                                            }
                                                                                tmp[verilogLoopVariables1] = {verilogIndexVariableIdentifier}
                                                                                tmp[verilogMemberIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogMethodCall] = {verilogImplicitClassHandle, verilogMethodCallBody, verilogPrimary}
                                                                                tmp[verilogMethodCallBody] = {verilogArrayManipulationCall, verilogAttributeInstance, verilogListOfArgumentsParent, verilogMethodIdentifier, verilogRandomizeCall}
                                                                                tmp[verilogMethodIdentifier] = {verilogEscapedIdentifier, verilogMethodIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogMethodQualifier] = {verilogClassItemQualifier}
                                                                                tmp[verilogMintypmaxExpression] = {verilogExpression}
                                                                                tmp[verilogModportClockingDeclaration] = {verilogClockingIdentifier}
                                                                                tmp[verilogModportDeclaration] = {verilogModportItem}
                                                                                tmp[verilogModportIdentifier] = {verilogEscapedIdentifier, verilogModportIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogModportItem] = {verilogModportIdentifier, verilogModportPortsDeclaration}
                                                                                tmp[verilogModportPortsDeclaration] = {verilogAttributeInstance, verilogModportClockingDeclaration, verilogModportSimplePortsDeclaration, verilogModportTfPortsDeclaration}
                                                                                tmp[verilogModportSimplePort] = {verilogExpression, verilogPortIdentifier}
                                                                                tmp[verilogModportSimplePortsDeclaration] = {verilogModportSimplePort, verilogPortDirection}
                                                                                tmp[verilogModportTfPortsDeclaration] = {verilogFunctionPrototype, verilogImportExport, verilogTaskPrototype, verilogTfIdentifier}
                                                                                tmp[verilogModuleAnsiHeader] = {verilogListOfPortDeclarations, verilogPackageImportDeclaration, verilogParameterPortList}
                                                                                tmp[verilogModuleDeclaration] = {
                                                                                                                  verilogAttributeInstance,
                                                                                                                  verilogBeginKeywords,
                                                                                                                  verilogDefaultNettypeCompilerDirective,
                                                                                                                  verilogEscapedIdentifier,
                                                                                                                  verilogGenerateRegion,
                                                                                                                  verilogIdDirective,
                                                                                                                  verilogIncludeCompilerDirective,
                                                                                                                  verilogInterfaceDeclaration,
                                                                                                                  verilogLineCompilerDirective,
                                                                                                                  verilogModuleAnsiHeader,
                                                                                                                  verilogModuleDeclaration,
                                                                                                                  verilogModuleHeader,
                                                                                                                  verilogModuleNonansiHeader,
                                                                                                                  verilogModuleOrGenerateItem,
                                                                                                                  verilogPortDeclaration,
                                                                                                                  verilogProgramDeclaration,
                                                                                                                  verilogSimpleIdentifier,
                                                                                                                  verilogSpecifyBlock,
                                                                                                                  verilogSpecparamDeclaration,
                                                                                                                  verilogTextMacroDefinition,
                                                                                                                  verilogTextMacroUsage,
                                                                                                                  verilogTimescaleCompilerDirective,
                                                                                                                  verilogTimeunitsDeclaration,
                                                                                                                  verilogUnconnectedDrive,
                                                                                                                  verilogZeroDirective
                                                                                                                }
                                                                                tmp[verilogModuleHeader] = {verilogAttributeInstance, verilogEscapedIdentifier, verilogLifetime, verilogModuleKeyword, verilogSimpleIdentifier}
                                                                                tmp[verilogModuleInstantiation] = {verilogEscapedIdentifier, verilogHierarchicalInstance, verilogParameterValueAssignment, verilogSimpleIdentifier}
                                                                                tmp[verilogModuleNonansiHeader] = {verilogListOfPorts, verilogPackageImportDeclaration, verilogParameterPortList}
                                                                                tmp[verilogModuleOrGenerateItem] = {
                                                                                                                     verilogAlwaysConstruct,
                                                                                                                     verilogAttributeInstance,
                                                                                                                     verilogBindDirective,
                                                                                                                     verilogCaseGenerateConstruct,
                                                                                                                     verilogClockingDeclaration,
                                                                                                                     verilogClockingIdentifier,
                                                                                                                     verilogConcurrentAssertionItem,
                                                                                                                     verilogContinuousAssign,
                                                                                                                     verilogDeferredImmediateAssertionItem,
                                                                                                                     verilogElaborationSystemTask,
                                                                                                                     verilogExpressionOrDist,
                                                                                                                     verilogFinalConstruct,
                                                                                                                     verilogGateInstantiation,
                                                                                                                     verilogGenvarDeclaration,
                                                                                                                     verilogIfGenerateConstruct,
                                                                                                                     verilogInitialConstruct,
                                                                                                                     verilogInterfaceInstantiation,
                                                                                                                     verilogLoopGenerateConstruct,
                                                                                                                     verilogModuleInstantiation,
                                                                                                                     verilogNetAlias,
                                                                                                                     verilogPackageOrGenerateItemDeclaration,
                                                                                                                     verilogParameterOverride,
                                                                                                                     verilogProgramInstantiation,
                                                                                                                     verilogUdpInstantiation
                                                                                                                   }
                                                                                tmp[verilogModulePathConcatenation] = {verilogModulePathExpression}
                                                                                tmp[verilogModulePathExpression] = {verilogModulePathPrimary}
                                                                                tmp[verilogModulePathMintypmaxExpression] = {verilogModulePathExpression}
                                                                                tmp[verilogModulePathMultipleConcatenation] = {verilogConstantExpression, verilogModulePathConcatenation}
                                                                                tmp[verilogModulePathPrimary] = {
                                                                                                                  verilogEscapedIdentifier,
                                                                                                                  verilogFunctionSubroutineCall,
                                                                                                                  verilogIntegralNumber,
                                                                                                                  verilogModulePathConcatenation,
                                                                                                                  verilogModulePathMintypmaxExpression,
                                                                                                                  verilogModulePathMultipleConcatenation,
                                                                                                                  verilogRealNumber,
                                                                                                                  verilogSimpleIdentifier
                                                                                                                }
                                                                                tmp[verilogMosSwitchInstance] = {verilogEnableTerminal, verilogInputTerminal, verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogMultipleConcatenation] = {verilogConcatenation, verilogExpression}
                                                                                tmp[verilogNInputGateInstance] = {verilogInputTerminal, verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogNOutputGateInstance] = {verilogInputTerminal, verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogNameOfInstance] = {verilogInstanceIdentifier, verilogUnpackedDimension}
                                                                                tmp[verilogNamedParameterAssignment] = {verilogParamExpression, verilogParameterIdentifier}
                                                                                tmp[verilogNamedPortConnection] = {verilogAttributeInstance, verilogExpression, verilogPortIdentifier}
                                                                                tmp[verilogNcontrolTerminal] = {verilogExpression}
                                                                                tmp[verilogNetAlias] = {verilogNetLvalue}
                                                                                tmp[verilogNetAssignment] = {verilogExpression, verilogNetLvalue}
                                                                                tmp[verilogNetDeclAssignment] = {verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier, verilogUnpackedDimension}
                                                                                tmp[verilogNetDeclaration] = {
                                                                                                               verilogChargeStrength,
                                                                                                               verilogDataTypeOrImplicit1,
                                                                                                               verilogDelay3,
                                                                                                               verilogDelayControl,
                                                                                                               verilogDelayValue,
                                                                                                               verilogDriveStrength,
                                                                                                               verilogEscapedIdentifier,
                                                                                                               verilogImplicitDataType1,
                                                                                                               verilogListOfNetDeclAssignments,
                                                                                                               verilogNetType,
                                                                                                               verilogSimpleIdentifier,
                                                                                                               verilogUnpackedDimension
                                                                                                             }
                                                                                tmp[verilogNetLvalue] = {
                                                                                                          verilogAssignmentPatternNetLvalue,
                                                                                                          verilogClassScope,
                                                                                                          verilogConstantBitSelect1,
                                                                                                          verilogConstantSelect1,
                                                                                                          verilogEscapedIdentifier,
                                                                                                          verilogIntegerAtomType,
                                                                                                          verilogNetLvalue,
                                                                                                          verilogPackageScope,
                                                                                                          verilogSimpleIdentifier,
                                                                                                          verilogTypeReference
                                                                                                        }
                                                                                tmp[verilogNetPortHeader1] = {verilogNetPortType1, verilogPortDirection}
                                                                                tmp[verilogNetPortType1] = {verilogDataTypeOrImplicit1, verilogEscapedIdentifier, verilogImplicitDataType1, verilogNetType, verilogSimpleIdentifier}
                                                                                tmp[verilogNetTypeDeclaration] = {verilogClassScope, verilogDataType, verilogEscapedIdentifier, verilogPackageScope, verilogSimpleIdentifier, verilogTfIdentifier}
                                                                                tmp[verilogNextState] = {verilogOutputSymbol}
                                                                                tmp[verilogNonConsecutiveRepetition] = {verilogConstantExpression, verilogCycleDelayConstRangeExpression}
                                                                                tmp[verilogNonPortProgramItem] = {
                                                                                                                   verilogAttributeInstance,
                                                                                                                   verilogCaseGenerateConstruct,
                                                                                                                   verilogClockingDeclaration,
                                                                                                                   verilogClockingIdentifier,
                                                                                                                   verilogConcurrentAssertionItem,
                                                                                                                   verilogContinuousAssign,
                                                                                                                   verilogElaborationSystemTask,
                                                                                                                   verilogExpressionOrDist,
                                                                                                                   verilogFinalConstruct,
                                                                                                                   verilogGenerateRegion,
                                                                                                                   verilogGenvarDeclaration,
                                                                                                                   verilogIfGenerateConstruct,
                                                                                                                   verilogInitialConstruct,
                                                                                                                   verilogLoopGenerateConstruct,
                                                                                                                   verilogPackageOrGenerateItemDeclaration,
                                                                                                                   verilogTimeunitsDeclaration
                                                                                                                 }
                                                                                tmp[verilogNonblockingAssignment] = {verilogDelayOrEventControl, verilogExpression, verilogVariableLvalue}
                                                                                tmp[verilogNonrangeSelect1] = {verilogBitSelect1, verilogMemberIdentifier}
                                                                                tmp[verilogNonrangeVariableLvalue] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogImplicitClassHandle, verilogNonrangeSelect1, verilogPackageScope, verilogSimpleIdentifier}
                                                                                tmp[verilogNotifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogOpenRangeList] = {verilogOpenValueRange}
                                                                                tmp[verilogOpenValueRange] = {verilogValueRange}
                                                                                tmp[verilogOperatorAssignment] = {verilogAssignmentOperator, verilogExpression, verilogVariableLvalue}
                                                                                tmp[verilogOrderedParameterAssignment] = {verilogOrderedParameterAssignment}
                                                                                tmp[verilogOrderedPortConnection] = {verilogAttributeInstance, verilogExpression}
                                                                                tmp[verilogOutputDeclaration] = {verilogDataType, verilogDataTypeOrImplicit1, verilogListOfPortIdentifiers, verilogListOfVariablePortIdentifiers, verilogNetPortType1}
                                                                                tmp[verilogOutputIdentifier] = {verilogInoutPortIdentifier, verilogInterfaceIdentifier, verilogOutputPortIdentifier, verilogPortIdentifier}
                                                                                tmp[verilogOutputPortIdentifier] = {verilogEscapedIdentifier, verilogOutputPortIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogOutputTerminal] = {verilogNetLvalue}
                                                                                tmp[verilogOverloadDeclaration] = {verilogDataType, verilogFunctionIdentifier, verilogOverloadOperator, verilogOverloadProtoFormals}
                                                                                tmp[verilogOverloadProtoFormals] = {verilogDataType}
                                                                                tmp[verilogPackageDeclaration] = {
                                                                                                                   verilogAnonymousProgram,
                                                                                                                   verilogAttributeInstance,
                                                                                                                   verilogLifetime,
                                                                                                                   verilogPackageExportDeclaration,
                                                                                                                   verilogPackageIdentifier,
                                                                                                                   verilogPackageOrGenerateItemDeclaration,
                                                                                                                   verilogTimeunitsDeclaration
                                                                                                                 }
                                                                                tmp[verilogPackageExportDeclaration] = {verilogPackageImportItem}
                                                                                tmp[verilogPackageIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogPackageImportDeclaration] = {verilogPackageImportItem}
                                                                                tmp[verilogPackageImportItem] = {verilogEscapedIdentifier, verilogPackageIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogPackageOrGenerateItemDeclaration] = {
                                                                                                                                 verilogCheckerDeclaration,
                                                                                                                                 verilogClassConstructorDeclaration,
                                                                                                                                 verilogClassDeclaration,
                                                                                                                                 verilogCovergroupDeclaration,
                                                                                                                                 verilogDataDeclaration,
                                                                                                                                 verilogDpiImportExport,
                                                                                                                                 verilogExternConstraintDeclaration,
                                                                                                                                 verilogFunctionDeclaration,
                                                                                                                                 verilogInterfaceClassDeclaration,
                                                                                                                                 verilogLetDeclaration,
                                                                                                                                 verilogLocalParameterDeclaration,
                                                                                                                                 verilogNetDeclaration,
                                                                                                                                 verilogOverloadDeclaration,
                                                                                                                                 verilogParameterDeclaration,
                                                                                                                                 verilogPropertyDeclaration,
                                                                                                                                 verilogSequenceDeclaration,
                                                                                                                                 verilogTaskDeclaration
                                                                                                                               }
                                                                                tmp[verilogPackageScope] = {verilogPackageIdentifier}
                                                                                tmp[verilogPackedDimension] = {verilogConstantRange, verilogUnsizedDimension}
                                                                                tmp[verilogParBlock] = {verilogBlockItemDeclaration, verilogEscapedIdentifier, verilogJoinKeyword, verilogSimpleIdentifier, verilogStatementOrNull}
                                                                                tmp[verilogParallelEdgeSensitivePathDescription] = {verilogDataSourceExpression, verilogEdgeIdentifier, verilogPolarityOperator, verilogSpecifyInputTerminalDescriptor, verilogSpecifyOutputTerminalDescriptor}
                                                                                tmp[verilogParallelPathDescription] = {verilogPolarityOperator, verilogSpecifyInputTerminalDescriptor, verilogSpecifyOutputTerminalDescriptor}
                                                                                tmp[verilogParamAssignment] = {verilogConstantParamExpression, verilogParameterIdentifier, verilogUnpackedDimension}
                                                                                tmp[verilogParamExpression] = {verilogDataType, verilogMintypmaxExpression}
                                                                                tmp[verilogParameterDeclaration] = {verilogDataTypeOrImplicit1, verilogListOfParamAssignments, verilogListOfTypeAssignments}
                                                                                tmp[verilogParameterIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogParameterOverride] = {verilogListOfDefparamAssignments}
                                                                                tmp[verilogParameterPortDeclaration] = {verilogDataType, verilogListOfParamAssignments, verilogListOfTypeAssignments, verilogLocalParameterDeclaration, verilogParameterDeclaration}
                                                                                tmp[verilogParameterPortList] = {verilogListOfParamAssignments, verilogParameterPortDeclaration}
                                                                                tmp[verilogParameterValueAssignment] = {verilogListOfParameterAssignments}
                                                                                tmp[verilogPassEnableSwitchInstance] = {verilogEnableTerminal, verilogInoutTerminal, verilogNameOfInstance}
                                                                                tmp[verilogPassSwitchInstance] = {verilogInoutTerminal, verilogNameOfInstance}
                                                                                tmp[verilogPathDeclaration] = {verilogEdgeSensitivePathDeclaration, verilogSimplePathDeclaration, verilogStateDependentPathDeclaration}
                                                                                tmp[verilogPathDelayExpression] = {verilogConstantMintypmaxExpression}
                                                                                tmp[verilogPathDelayValue] = {verilogListOfPathDelayExpressions}
                                                                                tmp[verilogPattern] = {verilogConstantExpression, verilogEscapedIdentifier, verilogMemberIdentifier, verilogPattern, verilogSimpleIdentifier}
                                                                                tmp[verilogPcontrolTerminal] = {verilogExpression}
                                                                                tmp[verilogPort] = {verilogPortIdentifier, verilogPortReference}
                                                                                tmp[verilogPortDeclaration] = {verilogAttributeInstance, verilogInoutDeclaration, verilogInputDeclaration, verilogInterfacePortDeclaration, verilogOutputDeclaration, verilogRefDeclaration}
                                                                                tmp[verilogPortIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogPortReference] = {verilogConstantSelect1, verilogPortIdentifier}
                                                                                tmp[verilogPrimary] = {
                                                                                                        verilogAssignmentPatternExpression,
                                                                                                        verilogCast,
                                                                                                        verilogClassQualifier,
                                                                                                        verilogConcatenation,
                                                                                                        verilogConstantBitSelect1,
                                                                                                        verilogEmptyUnpackedArrayConcatenation,
                                                                                                        verilogEscapedIdentifier,
                                                                                                        verilogFunctionSubroutineCall,
                                                                                                        verilogLetExpression,
                                                                                                        verilogMintypmaxExpression,
                                                                                                        verilogMultipleConcatenation,
                                                                                                        verilogPackageScope,
                                                                                                        verilogPrimaryLiteral,
                                                                                                        verilogRangeExpression,
                                                                                                        verilogSelect1,
                                                                                                        verilogSequenceMethodCall,
                                                                                                        verilogSimpleIdentifier,
                                                                                                        verilogStreamingConcatenation
                                                                                                      }
                                                                                tmp[verilogPrimaryLiteral] = {verilogIntegralNumber, verilogRealNumber, verilogSimpleTextMacroUsage, verilogStringLiteral, verilogTimeLiteral, verilogUnbasedUnsizedLiteral}
                                                                                tmp[verilogProceduralContinuousAssignment] = {verilogNetAssignment, verilogNetLvalue, verilogVariableAssignment, verilogVariableLvalue}
                                                                                tmp[verilogProceduralTimingControlStatement] = {verilogCycleDelay, verilogDelayControl, verilogEventControl, verilogStatementOrNull}
                                                                                tmp[verilogProductionIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogProgramAnsiHeader] = {verilogAttributeInstance, verilogLifetime, verilogListOfPortDeclarations, verilogPackageImportDeclaration, verilogParameterPortList, verilogProgramIdentifier}
                                                                                tmp[verilogProgramDeclaration] = {
                                                                                                                   verilogAttributeInstance,
                                                                                                                   verilogNonPortProgramItem,
                                                                                                                   verilogProgramAnsiHeader,
                                                                                                                   verilogProgramIdentifier,
                                                                                                                   verilogProgramItem,
                                                                                                                   verilogProgramNonansiHeader,
                                                                                                                   verilogTimeunitsDeclaration
                                                                                                                 }
                                                                                tmp[verilogProgramIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogProgramInstantiation] = {verilogHierarchicalInstance, verilogParameterValueAssignment, verilogProgramIdentifier}
                                                                                tmp[verilogProgramItem] = {verilogNonPortProgramItem, verilogPortDeclaration}
                                                                                tmp[verilogProgramNonansiHeader] = {verilogAttributeInstance, verilogLifetime, verilogListOfPorts, verilogPackageImportDeclaration, verilogParameterPortList, verilogProgramIdentifier}
                                                                                tmp[verilogPropertyCaseItem] = {verilogExpressionOrDist, verilogPropertyExpr}
                                                                                tmp[verilogPropertyDeclaration] = {verilogAssertionVariableDeclaration, verilogPropertyIdentifier, verilogPropertyPortList, verilogPropertySpec}
                                                                                tmp[verilogPropertyExpr] = {
                                                                                                             verilogClockingEvent,
                                                                                                             verilogConstantExpression,
                                                                                                             verilogConstantRange,
                                                                                                             verilogCycleDelayConstRangeExpression,
                                                                                                             verilogExpressionOrDist,
                                                                                                             verilogPropertyCaseItem,
                                                                                                             verilogPropertyExpr,
                                                                                                             verilogSequenceExpr
                                                                                                           }
                                                                                tmp[verilogPropertyFormalType1] = {verilogSequenceFormalType1}
                                                                                tmp[verilogPropertyIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogPropertyListOfArguments] = {verilogEscapedIdentifier, verilogEventExpression, verilogPropertyExpr, verilogSequenceExpr, verilogSimpleIdentifier}
                                                                                tmp[verilogPropertyPortItem] = {
                                                                                                                 verilogAssociativeDimension,
                                                                                                                 verilogAttributeInstance,
                                                                                                                 verilogEventExpression,
                                                                                                                 verilogFormalPortIdentifier,
                                                                                                                 verilogPropertyExpr,
                                                                                                                 verilogPropertyFormalType1,
                                                                                                                 verilogPropertyLvarPortDirection,
                                                                                                                 verilogQueueDimension,
                                                                                                                 verilogSequenceExpr,
                                                                                                                 verilogUnpackedDimension,
                                                                                                                 verilogUnsizedDimension
                                                                                                               }
                                                                                tmp[verilogPropertyPortList] = {verilogPropertyPortItem}
                                                                                tmp[verilogPropertySpec] = {verilogClockingEvent, verilogExpressionOrDist, verilogPropertyExpr}
                                                                                tmp[verilogPsIdentifier] = {verilogEscapedIdentifier, verilogPackageScope, verilogSimpleIdentifier}
                                                                                tmp[verilogPsOrHierarchicalArrayIdentifier] = {verilogClassScope, verilogConstantBitSelect1, verilogEscapedIdentifier, verilogImplicitClassHandle, verilogPackageScope, verilogSimpleIdentifier}
                                                                                tmp[verilogPullGateInstance] = {verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogPulldownStrength] = {verilogStrength0, verilogStrength1}
                                                                                tmp[verilogPullupStrength] = {verilogStrength0, verilogStrength1}
                                                                                tmp[verilogPulseControlSpecparam] = {verilogErrorLimitValue, verilogRejectLimitValue}
                                                                                tmp[verilogPulsestyleDeclaration] = {verilogListOfPathOutputs}
                                                                                tmp[verilogQueueDimension] = {verilogConstantExpression}
                                                                                tmp[verilogRandcaseItem] = {verilogExpression, verilogStatementOrNull}
                                                                                tmp[verilogRandcaseStatement] = {verilogRandcaseItem}
                                                                                tmp[verilogRandomizeCall] = {verilogAttributeInstance, verilogConstraintBlock, verilogIdentifierList, verilogVariableIdentifierList}
                                                                                tmp[verilogRangeExpression] = {verilogConstantRange, verilogExpression, verilogIndexedRange}
                                                                                tmp[verilogRealNumber] = {verilogFixedPointNumber}
                                                                                tmp[verilogRefDeclaration] = {verilogDataType, verilogDataTypeOrImplicit1, verilogListOfVariableIdentifiers}
                                                                                tmp[verilogReferenceEvent] = {verilogTimingCheckEvent}
                                                                                tmp[verilogRejectLimitValue] = {verilogLimitValue}
                                                                                tmp[verilogRemainActiveFlag] = {verilogConstantMintypmaxExpression}
                                                                                tmp[verilogRepeatRange] = {verilogExpression}
                                                                                tmp[verilogRestrictPropertyStatement] = {verilogPropertySpec}
                                                                                tmp[verilogScalarTimingCheckCondition] = {verilogExpression, verilogScalarConstant}
                                                                                tmp[verilogSelect1] = {verilogBitSelect1, verilogConstantRange, verilogIndexedRange, verilogMemberIdentifier}
                                                                                tmp[verilogSelectCondition] = {verilogBinsExpression, verilogCovergroupRangeList}
                                                                                tmp[verilogSelectExpression] = {verilogCrossIdentifier, verilogExpression, verilogSelectCondition, verilogSelectExpression}
                                                                                tmp[verilogSeqBlock] = {verilogBlockItemDeclaration, verilogEscapedIdentifier, verilogSimpleIdentifier, verilogStatementOrNull}
                                                                                tmp[verilogSequenceAbbrev] = {verilogConsecutiveRepetition}
                                                                                tmp[verilogSequenceDeclaration] = {verilogAssertionVariableDeclaration, verilogEscapedIdentifier, verilogSequenceExpr, verilogSequencePortList, verilogSimpleIdentifier}
                                                                                tmp[verilogSequenceExpr] = {
                                                                                                             verilogClockingEvent,
                                                                                                             verilogConsecutiveRepetition,
                                                                                                             verilogCycleDelayRange,
                                                                                                             verilogExpressionOrDist,
                                                                                                             verilogGotoRepetition,
                                                                                                             verilogIncOrDecExpression,
                                                                                                             verilogNonConsecutiveRepetition,
                                                                                                             verilogOperatorAssignment,
                                                                                                             verilogSequenceAbbrev,
                                                                                                             verilogSequenceExpr,
                                                                                                             verilogSequenceInstance,
                                                                                                             verilogSubroutineCall
                                                                                                           }
                                                                                tmp[verilogSequenceFormalType1] = {verilogDataTypeOrImplicit1}
                                                                                tmp[verilogSequenceInstance] = {verilogConstantBitSelect1, verilogEscapedIdentifier, verilogPackageScope, verilogSequenceListOfArguments, verilogSimpleIdentifier}
                                                                                tmp[verilogSequenceListOfArguments] = {verilogEscapedIdentifier, verilogEventExpression, verilogSequenceExpr, verilogSimpleIdentifier}
                                                                                tmp[verilogSequenceMethodCall] = {verilogMethodIdentifier, verilogSequenceInstance}
                                                                                tmp[verilogSequencePortItem] = {
                                                                                                                 verilogAssociativeDimension,
                                                                                                                 verilogAttributeInstance,
                                                                                                                 verilogEventExpression,
                                                                                                                 verilogFormalPortIdentifier,
                                                                                                                 verilogQueueDimension,
                                                                                                                 verilogSequenceExpr,
                                                                                                                 verilogSequenceFormalType1,
                                                                                                                 verilogSequenceLvarPortDirection,
                                                                                                                 verilogUnpackedDimension,
                                                                                                                 verilogUnsizedDimension
                                                                                                               }
                                                                                tmp[verilogSequencePortList] = {verilogSequencePortItem}
                                                                                tmp[verilogSequentialBody] = {verilogSequentialEntry, verilogUdpInitialStatement}
                                                                                tmp[verilogSequentialEntry] = {verilogEdgeInputList, verilogLevelInputList, verilogLevelSymbol, verilogNextState}
                                                                                tmp[verilogShowcancelledDeclaration] = {verilogListOfPathOutputs}
                                                                                tmp[verilogSimpleImmediateAssertStatement] = {verilogActionBlock, verilogExpression}
                                                                                tmp[verilogSimpleImmediateAssumeStatement] = {verilogActionBlock, verilogExpression}
                                                                                tmp[verilogSimpleImmediateCoverStatement] = {verilogExpression, verilogStatementOrNull}
                                                                                tmp[verilogSimplePathDeclaration] = {verilogFullPathDescription, verilogParallelPathDescription, verilogPathDelayValue}
                                                                                tmp[verilogSimpleTextMacroUsage] = {verilogTextMacroIdentifier}
                                                                                tmp[verilogSliceSize] = {
                                                                                                          verilogClassScope,
                                                                                                          verilogConstantExpression,
                                                                                                          verilogEscapedIdentifier,
                                                                                                          verilogGenerateBlockIdentifier,
                                                                                                          verilogIntegerAtomType,
                                                                                                          verilogIntegerVectorType,
                                                                                                          verilogNonIntegerType,
                                                                                                          verilogPackageScope,
                                                                                                          verilogParameterIdentifier,
                                                                                                          verilogSimpleIdentifier
                                                                                                        }
                                                                                tmp[verilogSolveBeforeList] = {verilogConstraintPrimary}
                                                                                tmp[verilogSourceFile] = {
                                                                                                           verilogAnonymousProgram,
                                                                                                           verilogAttributeInstance,
                                                                                                           verilogBeginKeywords,
                                                                                                           verilogBindDirective,
                                                                                                           verilogDefaultNettypeCompilerDirective,
                                                                                                           verilogIdDirective,
                                                                                                           verilogIncludeCompilerDirective,
                                                                                                           verilogInterfaceDeclaration,
                                                                                                           verilogLineCompilerDirective,
                                                                                                           verilogModuleDeclaration,
                                                                                                           verilogPackageDeclaration,
                                                                                                           verilogPackageExportDeclaration,
                                                                                                           verilogPackageOrGenerateItemDeclaration,
                                                                                                           verilogProgramDeclaration,
                                                                                                           verilogTextMacroDefinition,
                                                                                                           verilogTextMacroUsage,
                                                                                                           verilogTimescaleCompilerDirective,
                                                                                                           verilogTimeunitsDeclaration,
                                                                                                           verilogUdpDeclaration,
                                                                                                           verilogUnconnectedDrive,
                                                                                                           verilogZeroDirective
                                                                                                         }
                                                                                tmp[verilogSpecifyBlock] = {
                                                                                                             verilogDollarfulskewUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarholdUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarnochangeUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarperiodUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarrecoveryUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarrecremUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarremovalUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarsetupUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarsetupholdUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarskewUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollartimeskewUnderscoretimingUnderscorecheck,
                                                                                                             verilogDollarwidthUnderscoretimingUnderscorecheck,
                                                                                                             verilogPathDeclaration,
                                                                                                             verilogPulsestyleDeclaration,
                                                                                                             verilogShowcancelledDeclaration,
                                                                                                             verilogSpecparamDeclaration
                                                                                                           }
                                                                                tmp[verilogSpecifyInputTerminalDescriptor] = {verilogConstantExpression, verilogConstantIndexedRange, verilogConstantRange, verilogInputIdentifier}
                                                                                tmp[verilogSpecifyOutputTerminalDescriptor] = {verilogConstantExpression, verilogConstantIndexedRange, verilogConstantRange, verilogOutputIdentifier}
                                                                                tmp[verilogSpecparamAssignment] = {verilogConstantMintypmaxExpression, verilogPulseControlSpecparam, verilogSpecparamIdentifier}
                                                                                tmp[verilogSpecparamDeclaration] = {verilogListOfSpecparamAssignments, verilogPackedDimension}
                                                                                tmp[verilogSpecparamIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogStartEdgeOffset] = {verilogMintypmaxExpression}
                                                                                tmp[verilogStateDependentPathDeclaration] = {verilogEdgeSensitivePathDeclaration, verilogModulePathExpression, verilogSimplePathDeclaration}
                                                                                tmp[verilogStatement] = {verilogAttributeInstance, verilogEscapedIdentifier, verilogSimpleIdentifier, verilogStatementItem}
                                                                                tmp[verilogStatementItem] = {
                                                                                                              verilogAssertPropertyStatement,
                                                                                                              verilogAssumePropertyStatement,
                                                                                                              verilogBlockingAssignment,
                                                                                                              verilogCaseStatement,
                                                                                                              verilogCheckerInstantiation,
                                                                                                              verilogClockingDrive,
                                                                                                              verilogConditionalStatement,
                                                                                                              verilogCoverPropertyStatement,
                                                                                                              verilogCoverSequenceStatement,
                                                                                                              verilogDeferredImmediateAssertStatement,
                                                                                                              verilogDeferredImmediateAssumeStatement,
                                                                                                              verilogDeferredImmediateCoverStatement,
                                                                                                              verilogDisableStatement,
                                                                                                              verilogEventTrigger,
                                                                                                              verilogExpectPropertyStatement,
                                                                                                              verilogIncOrDecExpression,
                                                                                                              verilogJumpStatement,
                                                                                                              verilogLoopStatement,
                                                                                                              verilogNonblockingAssignment,
                                                                                                              verilogParBlock,
                                                                                                              verilogProceduralContinuousAssignment,
                                                                                                              verilogProceduralTimingControlStatement,
                                                                                                              verilogRandcaseStatement,
                                                                                                              verilogRestrictPropertyStatement,
                                                                                                              verilogSeqBlock,
                                                                                                              verilogSimpleImmediateAssertStatement,
                                                                                                              verilogSimpleImmediateAssumeStatement,
                                                                                                              verilogSimpleImmediateCoverStatement,
                                                                                                              verilogSystemTfCall,
                                                                                                              verilogWaitStatement
                                                                                                            }
                                                                                tmp[verilogStatementOrNull] = {verilogAttributeInstance, verilogStatement}
                                                                                tmp[verilogStreamConcatenation] = {verilogStreamExpression}
                                                                                tmp[verilogStreamExpression] = {verilogArrayRangeExpression, verilogExpression}
                                                                                tmp[verilogStreamingConcatenation] = {verilogSliceSize, verilogStreamConcatenation, verilogStreamOperator}
                                                                                tmp[verilogStructUnionMember] = {verilogAttributeInstance, verilogDataTypeOrVoid, verilogListOfVariableDeclAssignments, verilogRandomQualifier}
                                                                                tmp[verilogSubroutineCall] = {verilogMethodCall, verilogRandomizeCall, verilogSystemTfCall, verilogTfCall}
                                                                                tmp[verilogSystemTfCall] = {verilogClockingEvent, verilogDataType, verilogExpression, verilogListOfArgumentsParent, verilogSystemTfIdentifier}
                                                                                tmp[verilogTaggedUnionExpression] = {verilogExpression, verilogMemberIdentifier}
                                                                                tmp[verilogTaskBodyDeclaration] = {
                                                                                                                    verilogBlockItemDeclaration,
                                                                                                                    verilogClassScope,
                                                                                                                    verilogInterfaceIdentifier,
                                                                                                                    verilogStatementOrNull,
                                                                                                                    verilogTaskIdentifier,
                                                                                                                    verilogTfItemDeclaration,
                                                                                                                    verilogTfPortList
                                                                                                                  }
                                                                                tmp[verilogTaskDeclaration] = {verilogLifetime, verilogTaskBodyDeclaration}
                                                                                tmp[verilogTaskIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier, verilogTaskIdentifier}
                                                                                tmp[verilogTaskPrototype] = {verilogTaskIdentifier, verilogTfPortList}
                                                                                tmp[verilogTerminalIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier, verilogTerminalIdentifier}
                                                                                tmp[verilogTextMacroDefinition] = {verilogMacroText, verilogTextMacroName}
                                                                                tmp[verilogTextMacroIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogTextMacroName] = {verilogListOfFormalArguments, verilogTextMacroIdentifier}
                                                                                tmp[verilogTextMacroUsage] = {verilogListOfActualArguments, verilogTextMacroIdentifier}
                                                                                tmp[verilogTfCall] = {verilogAttributeInstance, verilogConstantBitSelect1, verilogEscapedIdentifier, verilogListOfArgumentsParent, verilogSimpleIdentifier}
                                                                                tmp[verilogTfIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogTfItemDeclaration] = {verilogBlockItemDeclaration, verilogTfPortDeclaration}
                                                                                tmp[verilogTfPortDeclaration] = {verilogAttributeInstance, verilogDataTypeOrImplicit1, verilogListOfTfVariableIdentifiers, verilogTfPortDirection}
                                                                                tmp[verilogTfPortDirection] = {verilogPortDirection}
                                                                                tmp[verilogTfPortItem1] = {
                                                                                                            verilogAssociativeDimension,
                                                                                                            verilogAttributeInstance,
                                                                                                            verilogDataTypeOrImplicit1,
                                                                                                            verilogExpression,
                                                                                                            verilogPortIdentifier,
                                                                                                            verilogQueueDimension,
                                                                                                            verilogTfPortDirection,
                                                                                                            verilogUnpackedDimension,
                                                                                                            verilogUnsizedDimension
                                                                                                          }
                                                                                tmp[verilogTfPortList] = {verilogTfPortItem1}
                                                                                tmp[verilogThreshold] = {verilogConstantExpression}
                                                                                tmp[verilogTimeLiteral] = {verilogFixedPointNumber, verilogTimeUnit, verilogUnsignedNumber}
                                                                                tmp[verilogTimecheckCondition] = {verilogMintypmaxExpression}
                                                                                tmp[verilogTimescaleCompilerDirective] = {verilogTimeLiteral}
                                                                                tmp[verilogTimestampCondition] = {verilogMintypmaxExpression}
                                                                                tmp[verilogTimeunitsDeclaration] = {verilogTimeLiteral}
                                                                                tmp[verilogTimingCheckCondition] = {verilogScalarTimingCheckCondition}
                                                                                tmp[verilogTimingCheckEvent] = {verilogSpecifyInputTerminalDescriptor, verilogSpecifyOutputTerminalDescriptor, verilogTimingCheckCondition, verilogTimingCheckEventControl}
                                                                                tmp[verilogTimingCheckEventControl] = {verilogEdgeControlSpecifier}
                                                                                tmp[verilogTimingCheckLimit] = {verilogExpression}
                                                                                tmp[verilogTopmoduleIdentifier] = {verilogEscapedIdentifier, verilogSimpleIdentifier, verilogTopmoduleIdentifier}
                                                                                tmp[verilogTransItem] = {verilogCovergroupRangeList}
                                                                                tmp[verilogTransList] = {verilogTransSet}
                                                                                tmp[verilogTransRangeList] = {verilogRepeatRange, verilogTransItem}
                                                                                tmp[verilogTransSet] = {verilogTransRangeList}
                                                                                tmp[verilogTypeAssignment] = {verilogDataType, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogTypeDeclaration] = {
                                                                                                                verilogAssociativeDimension,
                                                                                                                verilogConstantBitSelect1,
                                                                                                                verilogDataType,
                                                                                                                verilogEscapedIdentifier,
                                                                                                                verilogInterfaceInstanceIdentifier,
                                                                                                                verilogQueueDimension,
                                                                                                                verilogSimpleIdentifier,
                                                                                                                verilogUnpackedDimension,
                                                                                                                verilogUnsizedDimension
                                                                                                              }
                                                                                tmp[verilogTypeReference] = {verilogDataType, verilogExpression}
                                                                                tmp[verilogUdpAnsiDeclaration] = {verilogAttributeInstance, verilogEscapedIdentifier, verilogSimpleIdentifier, verilogUdpDeclarationPortList}
                                                                                tmp[verilogUdpDeclaration] = {
                                                                                                               verilogAttributeInstance,
                                                                                                               verilogCombinationalBody,
                                                                                                               verilogEscapedIdentifier,
                                                                                                               verilogSequentialBody,
                                                                                                               verilogSimpleIdentifier,
                                                                                                               verilogUdpAnsiDeclaration,
                                                                                                               verilogUdpNonansiDeclaration,
                                                                                                               verilogUdpPortDeclaration
                                                                                                             }
                                                                                tmp[verilogUdpDeclarationPortList] = {verilogUdpInputDeclaration, verilogUdpOutputDeclaration}
                                                                                tmp[verilogUdpInitialStatement] = {verilogInitVal, verilogOutputPortIdentifier}
                                                                                tmp[verilogUdpInputDeclaration] = {verilogAttributeInstance, verilogListOfUdpPortIdentifiers}
                                                                                tmp[verilogUdpInstance] = {verilogInputTerminal, verilogNameOfInstance, verilogOutputTerminal}
                                                                                tmp[verilogUdpInstantiation] = {verilogDelay2, verilogDriveStrength, verilogEscapedIdentifier, verilogSimpleIdentifier, verilogUdpInstance}
                                                                                tmp[verilogUdpNonansiDeclaration] = {verilogAttributeInstance, verilogEscapedIdentifier, verilogSimpleIdentifier, verilogUdpPortList}
                                                                                tmp[verilogUdpOutputDeclaration] = {verilogAttributeInstance, verilogConstantExpression, verilogPortIdentifier}
                                                                                tmp[verilogUdpPortDeclaration] = {verilogUdpInputDeclaration, verilogUdpOutputDeclaration, verilogUdpRegDeclaration}
                                                                                tmp[verilogUdpPortList] = {verilogInputPortIdentifier, verilogOutputPortIdentifier}
                                                                                tmp[verilogUdpRegDeclaration] = {verilogAttributeInstance, verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogUniquenessConstraint] = {verilogOpenRangeList}
                                                                                tmp[verilogUnpackedDimension] = {verilogConstantExpression, verilogConstantRange}
                                                                                tmp[verilogUseClause] = {verilogCellIdentifier, verilogLibraryIdentifier, verilogNamedParameterAssignment}
                                                                                tmp[verilogValueRange] = {verilogExpression}
                                                                                tmp[verilogVariableAssignment] = {verilogExpression, verilogVariableLvalue}
                                                                                tmp[verilogVariableDeclAssignment] = {
                                                                                                                       verilogAssociativeDimension,
                                                                                                                       verilogClassNew,
                                                                                                                       verilogDynamicArrayNew,
                                                                                                                       verilogDynamicArrayVariableIdentifier,
                                                                                                                       verilogEscapedIdentifier,
                                                                                                                       verilogExpression,
                                                                                                                       verilogQueueDimension,
                                                                                                                       verilogSimpleIdentifier,
                                                                                                                       verilogUnpackedDimension,
                                                                                                                       verilogUnsizedDimension
                                                                                                                     }
                                                                                tmp[verilogVariableIdentifierList] = {verilogEscapedIdentifier, verilogSimpleIdentifier}
                                                                                tmp[verilogVariableLvalue] = {
                                                                                                               verilogAssignmentPatternVariableLvalue,
                                                                                                               verilogClassScope,
                                                                                                               verilogConstantBitSelect1,
                                                                                                               verilogEscapedIdentifier,
                                                                                                               verilogImplicitClassHandle,
                                                                                                               verilogIntegerAtomType,
                                                                                                               verilogPackageScope,
                                                                                                               verilogSelect1,
                                                                                                               verilogSimpleIdentifier,
                                                                                                               verilogStreamingConcatenation,
                                                                                                               verilogTypeReference,
                                                                                                               verilogVariableLvalue
                                                                                                             }
                                                                                tmp[verilogVariablePortHeader] = {verilogDataType, verilogDataTypeOrImplicit1, verilogPortDirection}
                                                                                tmp[verilogWaitStatement] = {verilogActionBlock, verilogConstantBitSelect1, verilogEscapedIdentifier, verilogExpression, verilogSimpleIdentifier, verilogStatementOrNull}
                                                                                tmp
const verilogTokenKinds*: set[VerilogNodeKind] = {
                                                   verilogNewlineTok,
                                                   verilogExclamationTok,
                                                   verilogExclamationEqualTok,
                                                   verilogExclamationDoubleEqualTok,
                                                   verilogExclamationEqualQuestionTok,
                                                   verilogQuoteTok,
                                                   verilogQuoteDPIQuoteTok,
                                                   verilogQuoteDPIMinusCQuoteTok,
                                                   verilogHashTok,
                                                   verilogDoubleHashTok,
                                                   verilogDoubleHashLBrackAsteriskRBrackTok,
                                                   verilogDoubleHashLBrackPlusRBrackTok,
                                                   verilogHashMinusHashTok,
                                                   verilogHash0Tok,
                                                   verilogHashEqualHashTok,
                                                   verilogDollarTok,
                                                   verilogDollarerorTok,
                                                   verilogDollarfatalTok,
                                                   verilogDollarfulskewTok,
                                                   verilogDollarholdTok,
                                                   verilogDollarinfoTok,
                                                   verilogDollarnochangeTok,
                                                   verilogDollarperiodTok,
                                                   verilogDollarrecoveryTok,
                                                   verilogDollarrecremTok,
                                                   verilogDollarremovalTok,
                                                   verilogDollarrotTok,
                                                   verilogDollarsetupTok,
                                                   verilogDollarsetupholdTok,
                                                   verilogDollarskewTok,
                                                   verilogDollartimeskewTok,
                                                   verilogDollarunitTok,
                                                   verilogDollarwarningTok,
                                                   verilogDollarwidthTok,
                                                   verilogPercentTok,
                                                   verilogPercentEqualTok,
                                                   verilogAmpersandTok,
                                                   verilogDoubleAmpersandTok,
                                                   verilogTripleAmpersandTok,
                                                   verilogAmpersandEqualTok,
                                                   verilogApostropheTok,
                                                   verilogApostrophe0Tok,
                                                   verilogApostrophe1Tok,
                                                   verilogApostropheB0Tok,
                                                   verilogApostropheB1Tok,
                                                   verilogApostropheb0Tok1,
                                                   verilogApostropheb1Tok1,
                                                   verilogApostropheLCurlyTok,
                                                   verilogLParTok,
                                                   verilogLParAsteriskTok,
                                                   verilogRParTok,
                                                   verilogAsteriskTok,
                                                   verilogAsteriskRParTok,
                                                   verilogDoubleAsteriskTok,
                                                   verilogAsteriskDoubleColonAsteriskTok,
                                                   verilogAsteriskEqualTok,
                                                   verilogAsteriskGreaterThanTok,
                                                   verilogPlusTok,
                                                   verilogDoublePlusTok,
                                                   verilogPlusColonTok,
                                                   verilogPlusEqualTok,
                                                   verilogCommaTok,
                                                   verilogMinusTok,
                                                   verilogDoubleMinusTok,
                                                   verilogMinusColonTok,
                                                   verilogMinusEqualTok,
                                                   verilogMinusGreaterThanTok,
                                                   verilogMinusDoubleGreaterThanTok,
                                                   verilogDotTok,
                                                   verilogDotAsteriskTok,
                                                   verilogSlashTok,
                                                   verilogSlashEqualTok,
                                                   verilog0Tok,
                                                   verilog01Tok,
                                                   verilog1Tok,
                                                   verilog1ApostropheB0Tok,
                                                   verilog1ApostropheB1Tok,
                                                   verilog1ApostropheBXTok,
                                                   verilog1ApostropheBxTok1,
                                                   verilog1Apostropheb0Tok1,
                                                   verilog1Apostropheb1Tok1,
                                                   verilog1ApostrophebXTok2,
                                                   verilog1ApostrophebxTok3,
                                                   verilog10Tok,
                                                   verilog1stepTok,
                                                   verilog2Tok,
                                                   verilogColonTok,
                                                   verilogColonSlashTok,
                                                   verilogDoubleColonTok,
                                                   verilogColonEqualTok,
                                                   verilogSemicolonTok,
                                                   verilogLessThanTok,
                                                   verilogLessThanMinusGreaterThanTok,
                                                   verilogDoubleLessThanTok,
                                                   verilogTripleLessThanTok,
                                                   verilogTripleLessThanEqualTok,
                                                   verilogDoubleLessThanEqualTok,
                                                   verilogLessThanEqualTok,
                                                   verilogEqualTok,
                                                   verilogDoubleEqualTok,
                                                   verilogTripleEqualTok,
                                                   verilogDoubleEqualQuestionTok,
                                                   verilogEqualGreaterThanTok,
                                                   verilogGreaterThanTok,
                                                   verilogGreaterThanEqualTok,
                                                   verilogDoubleGreaterThanTok,
                                                   verilogDoubleGreaterThanEqualTok,
                                                   verilogTripleGreaterThanTok,
                                                   verilogTripleGreaterThanEqualTok,
                                                   verilogQuestionTok,
                                                   verilogAtTok,
                                                   verilogAtAsteriskTok,
                                                   verilogDoubleAtTok,
                                                   verilogPATHPULSEDollarEqualTok,
                                                   verilogLBrackTok,
                                                   verilogLBrackAsteriskTok,
                                                   verilogLBrackAsteriskRBrackTok,
                                                   verilogLBrackPlusRBrackTok,
                                                   verilogLBrackMinusGreaterThanTok,
                                                   verilogLBrackEqualTok,
                                                   verilogLBrack–GreaterThanTok,
                                                   verilogBackslashTok,
                                                   verilogRBrackTok,
                                                   verilogAccentTok,
                                                   verilogAccentEqualTok,
                                                   verilogAccentTildeTok,
                                                   verilogBacktickTok,
                                                   verilogAcceptOnTok,
                                                   verilogAliasTok,
                                                   verilogAlwaysTok,
                                                   verilogAlwaysCombTok,
                                                   verilogAlwaysFfTok,
                                                   verilogAlwaysLatchTok,
                                                   verilogAndTok,
                                                   verilogAssertTok,
                                                   verilogAssignTok,
                                                   verilogAssumeTok,
                                                   verilogAutomaticTok,
                                                   verilogBeforeTok,
                                                   verilogBeginTok,
                                                   verilogBindTok,
                                                   verilogBinsTok,
                                                   verilogBinsofTok,
                                                   verilogBitTok,
                                                   verilogBreakTok,
                                                   verilogBufTok,
                                                   verilogBufif0Tok,
                                                   verilogBufif1Tok,
                                                   verilogByteTok,
                                                   verilogCaseTok,
                                                   verilogCasexTok,
                                                   verilogCasezTok,
                                                   verilogCellTok,
                                                   verilogChandleTok,
                                                   verilogCheckerTok,
                                                   verilogClassTok,
                                                   verilogClockingTok,
                                                   verilogCmosTok,
                                                   verilogConfigTok,
                                                   verilogConstTok,
                                                   verilogConstraintTok,
                                                   verilogContextTok,
                                                   verilogContinueTok,
                                                   verilogCoverTok,
                                                   verilogCovergroupTok,
                                                   verilogCoverpointTok,
                                                   verilogCrossTok,
                                                   verilogDeassignTok,
                                                   verilogDefaultTok,
                                                   verilogDefparamTok,
                                                   verilogDesignTok,
                                                   verilogDirectiveBeginKeywordsTok,
                                                   verilogDirectiveCelldefineTok,
                                                   verilogDirectiveDefaultNettypeTok,
                                                   verilogDirectiveDefineTok,
                                                   verilogDirectiveElseTok,
                                                   verilogDirectiveElsifTok,
                                                   verilogDirectiveEndKeywordsTok,
                                                   verilogDirectiveEndcelldefineTok,
                                                   verilogDirectiveEndifTok,
                                                   verilogDirectiveIfdefTok,
                                                   verilogDirectiveIfndefTok,
                                                   verilogDirectiveIncludeTok,
                                                   verilogDirectiveLineTok,
                                                   verilogDirectiveNounconnectedDriveTok,
                                                   verilogDirectiveResetallTok,
                                                   verilogDirectiveTimescaleTok,
                                                   verilogDirectiveUnconnectedDriveTok,
                                                   verilogDirectiveUndefTok,
                                                   verilogDirectiveUndefineallTok,
                                                   verilogDisableTok,
                                                   verilogDistTok,
                                                   verilogDoTok,
                                                   verilogEdgeTok,
                                                   verilogElseTok,
                                                   verilogEndTok,
                                                   verilogEndcaseTok,
                                                   verilogEndcheckerTok,
                                                   verilogEndclassTok,
                                                   verilogEndclockingTok,
                                                   verilogEndconfigTok,
                                                   verilogEndfunctionTok,
                                                   verilogEndgenerateTok,
                                                   verilogEndgroupTok,
                                                   verilogEndinterfaceTok,
                                                   verilogEndmoduleTok,
                                                   verilogEndpackageTok,
                                                   verilogEndprimitiveTok,
                                                   verilogEndprogramTok,
                                                   verilogEndpropertyTok,
                                                   verilogEndsequenceTok,
                                                   verilogEndspecifyTok,
                                                   verilogEndtableTok,
                                                   verilogEndtaskTok,
                                                   verilogEnumTok,
                                                   verilogEventTok,
                                                   verilogEventuallyTok,
                                                   verilogExpectTok,
                                                   verilogExportTok,
                                                   verilogExtendsTok,
                                                   verilogExternTok,
                                                   verilogFinalTok,
                                                   verilogFirstMatchTok,
                                                   verilogForTok,
                                                   verilogForceTok,
                                                   verilogForeachTok,
                                                   verilogForeverTok,
                                                   verilogForkTok,
                                                   verilogForkjoinTok,
                                                   verilogFsTok,
                                                   verilogFunctionTok,
                                                   verilogGenerateTok,
                                                   verilogGenvarTok,
                                                   verilogGlobalTok,
                                                   verilogHighz0Tok,
                                                   verilogHighz1Tok,
                                                   verilogIfTok,
                                                   verilogIffTok,
                                                   verilogIfnoneTok,
                                                   verilogIgnoreBinsTok,
                                                   verilogIllegalBinsTok,
                                                   verilogImplementsTok,
                                                   verilogImpliesTok,
                                                   verilogImportTok,
                                                   verilogInitialTok,
                                                   verilogInoutTok,
                                                   verilogInputTok,
                                                   verilogInsideTok,
                                                   verilogInstanceTok,
                                                   verilogIntTok,
                                                   verilogIntegerTok,
                                                   verilogInterconnectTok,
                                                   verilogInterfaceTok,
                                                   verilogIntersectTok,
                                                   verilogJoinTok,
                                                   verilogJoinAnyTok,
                                                   verilogJoinNoneTok,
                                                   verilogLargeTok,
                                                   verilogLetTok,
                                                   verilogLiblistTok,
                                                   verilogLocalTok,
                                                   verilogLocalparamTok,
                                                   verilogLogicTok,
                                                   verilogLongintTok,
                                                   verilogMacromoduleTok,
                                                   verilogMatchesTok,
                                                   verilogMediumTok,
                                                   verilogModportTok,
                                                   verilogModuleTok,
                                                   verilogMsTok,
                                                   verilogNandTok,
                                                   verilogNegedgeTok,
                                                   verilogNettypeTok,
                                                   verilogNewTok,
                                                   verilogNexttimeTok,
                                                   verilogNmosTok,
                                                   verilogNoneTok,
                                                   verilogNorTok,
                                                   verilogNoshowcancelledTok,
                                                   verilogNotTok,
                                                   verilogNotif0Tok,
                                                   verilogNotif1Tok,
                                                   verilogNsTok,
                                                   verilogNullTok,
                                                   verilogOptionTok,
                                                   verilogOrTok,
                                                   verilogOutputTok,
                                                   verilogPackageTok,
                                                   verilogPackedTok,
                                                   verilogParameterTok,
                                                   verilogPmosTok,
                                                   verilogPosedgeTok,
                                                   verilogPrimitiveTok,
                                                   verilogPriorityTok,
                                                   verilogProgramTok,
                                                   verilogPropertyTok,
                                                   verilogProtectedTok,
                                                   verilogPsTok,
                                                   verilogPull0Tok,
                                                   verilogPull1Tok,
                                                   verilogPulldownTok,
                                                   verilogPullupTok,
                                                   verilogPulsestyleOndetectTok,
                                                   verilogPulsestyleOneventTok,
                                                   verilogPureTok,
                                                   verilogRandTok,
                                                   verilogRandcTok,
                                                   verilogRandcaseTok,
                                                   verilogRandomizeTok,
                                                   verilogRcmosTok,
                                                   verilogRealTok,
                                                   verilogRealtimeTok,
                                                   verilogRefTok,
                                                   verilogRegTok,
                                                   verilogRejectOnTok,
                                                   verilogReleaseTok,
                                                   verilogRepeatTok,
                                                   verilogRestrictTok,
                                                   verilogReturnTok,
                                                   verilogRnmosTok,
                                                   verilogRpmosTok,
                                                   verilogRtranTok,
                                                   verilogRtranif0Tok,
                                                   verilogRtranif1Tok,
                                                   verilogSTok,
                                                   verilogSAlwaysTok,
                                                   verilogSEventuallyTok,
                                                   verilogSNexttimeTok,
                                                   verilogSUntilTok,
                                                   verilogSUntilWithTok,
                                                   verilogSampleTok,
                                                   verilogScalaredTok,
                                                   verilogSequenceTok,
                                                   verilogShortintTok,
                                                   verilogShortrealTok,
                                                   verilogShowcancelledTok,
                                                   verilogSignedTok,
                                                   verilogSmallTok,
                                                   verilogSoftTok,
                                                   verilogSolveTok,
                                                   verilogSpecifyTok,
                                                   verilogSpecparamTok,
                                                   verilogStaticTok,
                                                   verilogStdTok,
                                                   verilogStringTok,
                                                   verilogStrongTok,
                                                   verilogStrong0Tok,
                                                   verilogStrong1Tok,
                                                   verilogStructTok,
                                                   verilogSuperTok,
                                                   verilogSupply0Tok,
                                                   verilogSupply1Tok,
                                                   verilogSyncAcceptOnTok,
                                                   verilogSyncRejectOnTok,
                                                   verilogTableTok,
                                                   verilogTaggedTok,
                                                   verilogTaskTok,
                                                   verilogThisTok,
                                                   verilogThroughoutTok,
                                                   verilogTimeTok,
                                                   verilogTimeprecisionTok,
                                                   verilogTimeunitTok,
                                                   verilogTranTok,
                                                   verilogTranif0Tok,
                                                   verilogTranif1Tok,
                                                   verilogTriTok,
                                                   verilogTri0Tok,
                                                   verilogTri1Tok,
                                                   verilogTriandTok,
                                                   verilogTriorTok,
                                                   verilogTriregTok,
                                                   verilogTypeTok,
                                                   verilogTypeOptionTok,
                                                   verilogTypedefTok,
                                                   verilogUnionTok,
                                                   verilogUniqueTok,
                                                   verilogUnique0Tok,
                                                   verilogUnsignedTok,
                                                   verilogUntilTok,
                                                   verilogUntilWithTok,
                                                   verilogUntypedTok,
                                                   verilogUsTok,
                                                   verilogUseTok,
                                                   verilogUwireTok,
                                                   verilogVarTok,
                                                   verilogVectoredTok,
                                                   verilogVirtualTok,
                                                   verilogVoidTok,
                                                   verilogVoidApostropheTok,
                                                   verilogWaitTok,
                                                   verilogWaitOrderTok,
                                                   verilogWandTok,
                                                   verilogWeakTok,
                                                   verilogWeak0Tok,
                                                   verilogWeak1Tok,
                                                   verilogWhileTok,
                                                   verilogWildcardTok,
                                                   verilogWireTok,
                                                   verilogWithTok,
                                                   verilogWithinTok,
                                                   verilogWorTok,
                                                   verilogXnorTok,
                                                   verilogXorTok,
                                                   verilogLCurlyTok,
                                                   verilogPipeTok,
                                                   verilogPipeMinusGreaterThanTok,
                                                   verilogPipeEqualTok,
                                                   verilogPipeEqualGreaterThanTok,
                                                   verilogDoublePipeTok,
                                                   verilogRCurlyTok,
                                                   verilogTildeTok,
                                                   verilogTildeAmpersandTok,
                                                   verilogTildeAccentTok,
                                                   verilogTildePipeTok,
                                                   verilog–Tok,
                                                   verilog–GreaterThanTok,
                                                   verilog––Tok
                                                 }

proc tsNodeType*(node: TsVerilogNode): string



proc kind*(node: TsVerilogNode): VerilogNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "$fullskew_timing_check":                   verilogDollarfulskewUnderscoretimingUnderscorecheck
      of "$hold_timing_check":                       verilogDollarholdUnderscoretimingUnderscorecheck
      of "$nochange_timing_check":                   verilogDollarnochangeUnderscoretimingUnderscorecheck
      of "$period_timing_check":                     verilogDollarperiodUnderscoretimingUnderscorecheck
      of "$recovery_timing_check":                   verilogDollarrecoveryUnderscoretimingUnderscorecheck
      of "$recrem_timing_check":                     verilogDollarrecremUnderscoretimingUnderscorecheck
      of "$removal_timing_check":                    verilogDollarremovalUnderscoretimingUnderscorecheck
      of "$setup_timing_check":                      verilogDollarsetupUnderscoretimingUnderscorecheck
      of "$setuphold_timing_check":                  verilogDollarsetupholdUnderscoretimingUnderscorecheck
      of "$skew_timing_check":                       verilogDollarskewUnderscoretimingUnderscorecheck
      of "$timeskew_timing_check":                   verilogDollartimeskewUnderscoretimingUnderscorecheck
      of "$width_timing_check":                      verilogDollarwidthUnderscoretimingUnderscorecheck
      of "_ordered_parameter_assignment":            verilogOrderedParameterAssignment
      of "action_block":                             verilogActionBlock
      of "always_construct":                         verilogAlwaysConstruct
      of "always_keyword":                           verilogAlwaysKeyword
      of "anonymous_program":                        verilogAnonymousProgram
      of "anonymous_program_item":                   verilogAnonymousProgramItem
      of "ansi_port_declaration":                    verilogAnsiPortDeclaration
      of "array_manipulation_call":                  verilogArrayManipulationCall
      of "array_method_name":                        verilogArrayMethodName
      of "array_range_expression":                   verilogArrayRangeExpression
      of "assert_property_statement":                verilogAssertPropertyStatement
      of "assertion_variable_declaration":           verilogAssertionVariableDeclaration
      of "assignment_operator":                      verilogAssignmentOperator
      of "assignment_pattern":                       verilogAssignmentPattern
      of "assignment_pattern_expression":            verilogAssignmentPatternExpression
      of "assignment_pattern_key":                   verilogAssignmentPatternKey
      of "assignment_pattern_net_lvalue":            verilogAssignmentPatternNetLvalue
      of "assignment_pattern_variable_lvalue":       verilogAssignmentPatternVariableLvalue
      of "associative_dimension":                    verilogAssociativeDimension
      of "assume_property_statement":                verilogAssumePropertyStatement
      of "attr_spec":                                verilogAttrSpec
      of "attribute_instance":                       verilogAttributeInstance
      of "begin_keywords":                           verilogBeginKeywords
      of "bind_directive":                           verilogBindDirective
      of "bind_target_instance":                     verilogBindTargetInstance
      of "bind_target_instance_list":                verilogBindTargetInstanceList
      of "bind_target_scope":                        verilogBindTargetScope
      of "bins_expression":                          verilogBinsExpression
      of "bins_keyword":                             verilogBinsKeyword
      of "bins_or_empty":                            verilogBinsOrEmpty
      of "bins_or_options":                          verilogBinsOrOptions
      of "bins_selection":                           verilogBinsSelection
      of "bins_selection_or_option":                 verilogBinsSelectionOrOption
      of "bit_select1":                              verilogBitSelect1
      of "block_event_expression":                   verilogBlockEventExpression
      of "block_item_declaration":                   verilogBlockItemDeclaration
      of "blocking_assignment":                      verilogBlockingAssignment
      of "case_expression":                          verilogCaseExpression
      of "case_generate_construct":                  verilogCaseGenerateConstruct
      of "case_generate_item":                       verilogCaseGenerateItem
      of "case_inside_item":                         verilogCaseInsideItem
      of "case_item":                                verilogCaseItem
      of "case_item_expression":                     verilogCaseItemExpression
      of "case_keyword":                             verilogCaseKeyword
      of "case_pattern_item":                        verilogCasePatternItem
      of "case_statement":                           verilogCaseStatement
      of "cast":                                     verilogCast
      of "casting_type":                             verilogCastingType
      of "cell_clause":                              verilogCellClause
      of "cell_identifier":                          verilogCellIdentifier
      of "charge_strength":                          verilogChargeStrength
      of "checker_declaration":                      verilogCheckerDeclaration
      of "checker_identifier":                       verilogCheckerIdentifier
      of "checker_instantiation":                    verilogCheckerInstantiation
      of "checker_or_generate_item_declaration":     verilogCheckerOrGenerateItemDeclaration
      of "checker_port_direction":                   verilogCheckerPortDirection
      of "checker_port_item":                        verilogCheckerPortItem
      of "checker_port_list":                        verilogCheckerPortList
      of "class_constructor_declaration":            verilogClassConstructorDeclaration
      of "class_constructor_prototype":              verilogClassConstructorPrototype
      of "class_declaration":                        verilogClassDeclaration
      of "class_identifier":                         verilogClassIdentifier
      of "class_item":                               verilogClassItem
      of "class_item_qualifier":                     verilogClassItemQualifier
      of "class_method":                             verilogClassMethod
      of "class_new":                                verilogClassNew
      of "class_property":                           verilogClassProperty
      of "class_qualifier":                          verilogClassQualifier
      of "class_scope":                              verilogClassScope
      of "class_type":                               verilogClassType
      of "clocking_decl_assign":                     verilogClockingDeclAssign
      of "clocking_declaration":                     verilogClockingDeclaration
      of "clocking_direction":                       verilogClockingDirection
      of "clocking_drive":                           verilogClockingDrive
      of "clocking_event":                           verilogClockingEvent
      of "clocking_identifier":                      verilogClockingIdentifier
      of "clocking_item":                            verilogClockingItem
      of "clocking_skew":                            verilogClockingSkew
      of "clockvar":                                 verilogClockvar
      of "clockvar_expression":                      verilogClockvarExpression
      of "cmos_switch_instance":                     verilogCmosSwitchInstance
      of "cmos_switchtype":                          verilogCmosSwitchtype
      of "combinational_body":                       verilogCombinationalBody
      of "combinational_entry":                      verilogCombinationalEntry
      of "concatenation":                            verilogConcatenation
      of "concurrent_assertion_item":                verilogConcurrentAssertionItem
      of "cond_pattern":                             verilogCondPattern
      of "cond_predicate":                           verilogCondPredicate
      of "conditional_expression":                   verilogConditionalExpression
      of "conditional_statement":                    verilogConditionalStatement
      of "config_identifier":                        verilogConfigIdentifier
      of "config_rule_statement":                    verilogConfigRuleStatement
      of "consecutive_repetition":                   verilogConsecutiveRepetition
      of "const_identifier":                         verilogConstIdentifier
      of "constant_bit_select1":                     verilogConstantBitSelect1
      of "constant_concatenation":                   verilogConstantConcatenation
      of "constant_expression":                      verilogConstantExpression
      of "constant_indexed_range":                   verilogConstantIndexedRange
      of "constant_mintypmax_expression":            verilogConstantMintypmaxExpression
      of "constant_multiple_concatenation":          verilogConstantMultipleConcatenation
      of "constant_param_expression":                verilogConstantParamExpression
      of "constant_primary":                         verilogConstantPrimary
      of "constant_range":                           verilogConstantRange
      of "constant_select1":                         verilogConstantSelect1
      of "constraint_block":                         verilogConstraintBlock
      of "constraint_block_item":                    verilogConstraintBlockItem
      of "constraint_declaration":                   verilogConstraintDeclaration
      of "constraint_expression":                    verilogConstraintExpression
      of "constraint_identifier":                    verilogConstraintIdentifier
      of "constraint_primary":                       verilogConstraintPrimary
      of "constraint_prototype":                     verilogConstraintPrototype
      of "constraint_prototype_qualifier":           verilogConstraintPrototypeQualifier
      of "constraint_set":                           verilogConstraintSet
      of "continuous_assign":                        verilogContinuousAssign
      of "controlled_reference_event":               verilogControlledReferenceEvent
      of "cover_cross":                              verilogCoverCross
      of "cover_point":                              verilogCoverPoint
      of "cover_point_identifier":                   verilogCoverPointIdentifier
      of "cover_property_statement":                 verilogCoverPropertyStatement
      of "cover_sequence_statement":                 verilogCoverSequenceStatement
      of "coverage_event":                           verilogCoverageEvent
      of "coverage_option":                          verilogCoverageOption
      of "coverage_spec_or_option":                  verilogCoverageSpecOrOption
      of "covergroup_declaration":                   verilogCovergroupDeclaration
      of "covergroup_identifier":                    verilogCovergroupIdentifier
      of "covergroup_range_list":                    verilogCovergroupRangeList
      of "covergroup_value_range":                   verilogCovergroupValueRange
      of "cross_body":                               verilogCrossBody
      of "cross_body_item":                          verilogCrossBodyItem
      of "cross_identifier":                         verilogCrossIdentifier
      of "cycle_delay":                              verilogCycleDelay
      of "cycle_delay_const_range_expression":       verilogCycleDelayConstRangeExpression
      of "cycle_delay_range":                        verilogCycleDelayRange
      of "data_declaration":                         verilogDataDeclaration
      of "data_event":                               verilogDataEvent
      of "data_source_expression":                   verilogDataSourceExpression
      of "data_type":                                verilogDataType
      of "data_type_or_implicit1":                   verilogDataTypeOrImplicit1
      of "data_type_or_void":                        verilogDataTypeOrVoid
      of "decimal_number":                           verilogDecimalNumber
      of "default_clause":                           verilogDefaultClause
      of "default_nettype_compiler_directive":       verilogDefaultNettypeCompilerDirective
      of "default_nettype_value":                    verilogDefaultNettypeValue
      of "default_skew":                             verilogDefaultSkew
      of "deferred_immediate_assert_statement":      verilogDeferredImmediateAssertStatement
      of "deferred_immediate_assertion_item":        verilogDeferredImmediateAssertionItem
      of "deferred_immediate_assume_statement":      verilogDeferredImmediateAssumeStatement
      of "deferred_immediate_cover_statement":       verilogDeferredImmediateCoverStatement
      of "defparam_assignment":                      verilogDefparamAssignment
      of "delay2":                                   verilogDelay2
      of "delay3":                                   verilogDelay3
      of "delay_control":                            verilogDelayControl
      of "delay_or_event_control":                   verilogDelayOrEventControl
      of "delay_value":                              verilogDelayValue
      of "delayed_data":                             verilogDelayedData
      of "delayed_reference":                        verilogDelayedReference
      of "design_statement":                         verilogDesignStatement
      of "disable_statement":                        verilogDisableStatement
      of "dist_item":                                verilogDistItem
      of "dist_list":                                verilogDistList
      of "dist_weight":                              verilogDistWeight
      of "double_quoted_string":                     verilogDoubleQuotedString
      of "dpi_function_import_property":             verilogDpiFunctionImportProperty
      of "dpi_function_proto":                       verilogDpiFunctionProto
      of "dpi_import_export":                        verilogDpiImportExport
      of "dpi_spec_string":                          verilogDpiSpecString
      of "dpi_task_import_property":                 verilogDpiTaskImportProperty
      of "dpi_task_proto":                           verilogDpiTaskProto
      of "drive_strength":                           verilogDriveStrength
      of "dynamic_array_new":                        verilogDynamicArrayNew
      of "edge_control_specifier":                   verilogEdgeControlSpecifier
      of "edge_descriptor":                          verilogEdgeDescriptor
      of "edge_identifier":                          verilogEdgeIdentifier
      of "edge_indicator":                           verilogEdgeIndicator
      of "edge_input_list":                          verilogEdgeInputList
      of "edge_sensitive_path_declaration":          verilogEdgeSensitivePathDeclaration
      of "elaboration_system_task":                  verilogElaborationSystemTask
      of "empty_unpacked_array_concatenation":       verilogEmptyUnpackedArrayConcatenation
      of "enable_gate_instance":                     verilogEnableGateInstance
      of "enable_gatetype":                          verilogEnableGatetype
      of "enable_terminal":                          verilogEnableTerminal
      of "end_edge_offset":                          verilogEndEdgeOffset
      of "enum_base_type":                           verilogEnumBaseType
      of "enum_identifier":                          verilogEnumIdentifier
      of "enum_name_declaration":                    verilogEnumNameDeclaration
      of "error_limit_value":                        verilogErrorLimitValue
      of "escaped_identifier":                       verilogEscapedIdentifier
      of "event_based_flag":                         verilogEventBasedFlag
      of "event_control":                            verilogEventControl
      of "event_expression":                         verilogEventExpression
      of "event_trigger":                            verilogEventTrigger
      of "expect_property_statement":                verilogExpectPropertyStatement
      of "expression":                               verilogExpression
      of "expression_or_dist":                       verilogExpressionOrDist
      of "extern_constraint_declaration":            verilogExternConstraintDeclaration
      of "extern_tf_declaration":                    verilogExternTfDeclaration
      of "final_construct":                          verilogFinalConstruct
      of "finish_number":                            verilogFinishNumber
      of "for_initialization":                       verilogForInitialization
      of "for_step":                                 verilogForStep
      of "for_variable_declaration":                 verilogForVariableDeclaration
      of "formal_argument":                          verilogFormalArgument
      of "formal_identifier":                        verilogFormalIdentifier
      of "formal_port_identifier":                   verilogFormalPortIdentifier
      of "full_edge_sensitive_path_description":     verilogFullEdgeSensitivePathDescription
      of "full_path_description":                    verilogFullPathDescription
      of "function_body_declaration":                verilogFunctionBodyDeclaration
      of "function_data_type_or_implicit1":          verilogFunctionDataTypeOrImplicit1
      of "function_declaration":                     verilogFunctionDeclaration
      of "function_identifier":                      verilogFunctionIdentifier
      of "function_prototype":                       verilogFunctionPrototype
      of "function_statement":                       verilogFunctionStatement
      of "function_statement_or_null":               verilogFunctionStatementOrNull
      of "function_subroutine_call":                 verilogFunctionSubroutineCall
      of "gate_instantiation":                       verilogGateInstantiation
      of "generate_block":                           verilogGenerateBlock
      of "generate_block_identifier":                verilogGenerateBlockIdentifier
      of "generate_region":                          verilogGenerateRegion
      of "genvar_declaration":                       verilogGenvarDeclaration
      of "genvar_identifier":                        verilogGenvarIdentifier
      of "genvar_initialization":                    verilogGenvarInitialization
      of "genvar_iteration":                         verilogGenvarIteration
      of "goto_repetition":                          verilogGotoRepetition
      of "hierarchical_btf_identifier":              verilogHierarchicalBtfIdentifier
      of "hierarchical_instance":                    verilogHierarchicalInstance
      of "id_directive":                             verilogIdDirective
      of "identifier_list":                          verilogIdentifierList
      of "if_generate_construct":                    verilogIfGenerateConstruct
      of "implicit_class_handle":                    verilogImplicitClassHandle
      of "implicit_data_type1":                      verilogImplicitDataType1
      of "import_export":                            verilogImportExport
      of "inc_or_dec_expression":                    verilogIncOrDecExpression
      of "inc_or_dec_operator":                      verilogIncOrDecOperator
      of "include_compiler_directive":               verilogIncludeCompilerDirective
      of "include_compiler_directive_standard":      verilogIncludeCompilerDirectiveStandard
      of "index_variable_identifier":                verilogIndexVariableIdentifier
      of "indexed_range":                            verilogIndexedRange
      of "init_val":                                 verilogInitVal
      of "initial_construct":                        verilogInitialConstruct
      of "inout_declaration":                        verilogInoutDeclaration
      of "inout_port_identifier":                    verilogInoutPortIdentifier
      of "inout_terminal":                           verilogInoutTerminal
      of "input_declaration":                        verilogInputDeclaration
      of "input_identifier":                         verilogInputIdentifier
      of "input_port_identifier":                    verilogInputPortIdentifier
      of "input_terminal":                           verilogInputTerminal
      of "inside_expression":                        verilogInsideExpression
      of "inst_clause":                              verilogInstClause
      of "inst_name":                                verilogInstName
      of "instance_identifier":                      verilogInstanceIdentifier
      of "integer_atom_type":                        verilogIntegerAtomType
      of "integer_vector_type":                      verilogIntegerVectorType
      of "integral_number":                          verilogIntegralNumber
      of "interface_ansi_header":                    verilogInterfaceAnsiHeader
      of "interface_class_declaration":              verilogInterfaceClassDeclaration
      of "interface_class_item":                     verilogInterfaceClassItem
      of "interface_class_method":                   verilogInterfaceClassMethod
      of "interface_class_type":                     verilogInterfaceClassType
      of "interface_declaration":                    verilogInterfaceDeclaration
      of "interface_identifier":                     verilogInterfaceIdentifier
      of "interface_instance_identifier":            verilogInterfaceInstanceIdentifier
      of "interface_instantiation":                  verilogInterfaceInstantiation
      of "interface_item":                           verilogInterfaceItem
      of "interface_nonansi_header":                 verilogInterfaceNonansiHeader
      of "interface_or_generate_item":               verilogInterfaceOrGenerateItem
      of "interface_port_declaration":               verilogInterfacePortDeclaration
      of "interface_port_header":                    verilogInterfacePortHeader
      of "join_keyword":                             verilogJoinKeyword
      of "jump_statement":                           verilogJumpStatement
      of "let_actual_arg":                           verilogLetActualArg
      of "let_declaration":                          verilogLetDeclaration
      of "let_expression":                           verilogLetExpression
      of "let_formal_type1":                         verilogLetFormalType1
      of "let_list_of_arguments":                    verilogLetListOfArguments
      of "let_port_item":                            verilogLetPortItem
      of "let_port_list":                            verilogLetPortList
      of "level_input_list":                         verilogLevelInputList
      of "liblist_clause":                           verilogLiblistClause
      of "library_identifier":                       verilogLibraryIdentifier
      of "lifetime":                                 verilogLifetime
      of "limit_value":                              verilogLimitValue
      of "line_compiler_directive":                  verilogLineCompilerDirective
      of "list_of_actual_arguments":                 verilogListOfActualArguments
      of "list_of_arguments":                        verilogListOfArguments
      of "list_of_arguments_parent":                 verilogListOfArgumentsParent
      of "list_of_clocking_decl_assign":             verilogListOfClockingDeclAssign
      of "list_of_cross_items":                      verilogListOfCrossItems
      of "list_of_defparam_assignments":             verilogListOfDefparamAssignments
      of "list_of_formal_arguments":                 verilogListOfFormalArguments
      of "list_of_genvar_identifiers":               verilogListOfGenvarIdentifiers
      of "list_of_interface_identifiers":            verilogListOfInterfaceIdentifiers
      of "list_of_net_assignments":                  verilogListOfNetAssignments
      of "list_of_net_decl_assignments":             verilogListOfNetDeclAssignments
      of "list_of_param_assignments":                verilogListOfParamAssignments
      of "list_of_parameter_assignments":            verilogListOfParameterAssignments
      of "list_of_path_delay_expressions":           verilogListOfPathDelayExpressions
      of "list_of_path_inputs":                      verilogListOfPathInputs
      of "list_of_path_outputs":                     verilogListOfPathOutputs
      of "list_of_port_connections":                 verilogListOfPortConnections
      of "list_of_port_declarations":                verilogListOfPortDeclarations
      of "list_of_port_identifiers":                 verilogListOfPortIdentifiers
      of "list_of_ports":                            verilogListOfPorts
      of "list_of_specparam_assignments":            verilogListOfSpecparamAssignments
      of "list_of_tf_variable_identifiers":          verilogListOfTfVariableIdentifiers
      of "list_of_type_assignments":                 verilogListOfTypeAssignments
      of "list_of_udp_port_identifiers":             verilogListOfUdpPortIdentifiers
      of "list_of_variable_assignments":             verilogListOfVariableAssignments
      of "list_of_variable_decl_assignments":        verilogListOfVariableDeclAssignments
      of "list_of_variable_identifiers":             verilogListOfVariableIdentifiers
      of "list_of_variable_port_identifiers":        verilogListOfVariablePortIdentifiers
      of "local_parameter_declaration":              verilogLocalParameterDeclaration
      of "loop_generate_construct":                  verilogLoopGenerateConstruct
      of "loop_statement":                           verilogLoopStatement
      of "loop_variables1":                          verilogLoopVariables1
      of "member_identifier":                        verilogMemberIdentifier
      of "method_call":                              verilogMethodCall
      of "method_call_body":                         verilogMethodCallBody
      of "method_identifier":                        verilogMethodIdentifier
      of "method_qualifier":                         verilogMethodQualifier
      of "mintypmax_expression":                     verilogMintypmaxExpression
      of "modport_clocking_declaration":             verilogModportClockingDeclaration
      of "modport_declaration":                      verilogModportDeclaration
      of "modport_identifier":                       verilogModportIdentifier
      of "modport_item":                             verilogModportItem
      of "modport_ports_declaration":                verilogModportPortsDeclaration
      of "modport_simple_port":                      verilogModportSimplePort
      of "modport_simple_ports_declaration":         verilogModportSimplePortsDeclaration
      of "modport_tf_ports_declaration":             verilogModportTfPortsDeclaration
      of "module_ansi_header":                       verilogModuleAnsiHeader
      of "module_declaration":                       verilogModuleDeclaration
      of "module_header":                            verilogModuleHeader
      of "module_instantiation":                     verilogModuleInstantiation
      of "module_keyword":                           verilogModuleKeyword
      of "module_nonansi_header":                    verilogModuleNonansiHeader
      of "module_or_generate_item":                  verilogModuleOrGenerateItem
      of "module_path_concatenation":                verilogModulePathConcatenation
      of "module_path_expression":                   verilogModulePathExpression
      of "module_path_mintypmax_expression":         verilogModulePathMintypmaxExpression
      of "module_path_multiple_concatenation":       verilogModulePathMultipleConcatenation
      of "module_path_primary":                      verilogModulePathPrimary
      of "mos_switch_instance":                      verilogMosSwitchInstance
      of "mos_switchtype":                           verilogMosSwitchtype
      of "multiple_concatenation":                   verilogMultipleConcatenation
      of "n_input_gate_instance":                    verilogNInputGateInstance
      of "n_input_gatetype":                         verilogNInputGatetype
      of "n_output_gate_instance":                   verilogNOutputGateInstance
      of "n_output_gatetype":                        verilogNOutputGatetype
      of "name_of_instance":                         verilogNameOfInstance
      of "named_parameter_assignment":               verilogNamedParameterAssignment
      of "named_port_connection":                    verilogNamedPortConnection
      of "ncontrol_terminal":                        verilogNcontrolTerminal
      of "net_alias":                                verilogNetAlias
      of "net_assignment":                           verilogNetAssignment
      of "net_decl_assignment":                      verilogNetDeclAssignment
      of "net_declaration":                          verilogNetDeclaration
      of "net_lvalue":                               verilogNetLvalue
      of "net_port_header1":                         verilogNetPortHeader1
      of "net_port_type1":                           verilogNetPortType1
      of "net_type":                                 verilogNetType
      of "net_type_declaration":                     verilogNetTypeDeclaration
      of "next_state":                               verilogNextState
      of "non_consecutive_repetition":               verilogNonConsecutiveRepetition
      of "non_integer_type":                         verilogNonIntegerType
      of "non_port_program_item":                    verilogNonPortProgramItem
      of "nonblocking_assignment":                   verilogNonblockingAssignment
      of "nonrange_select1":                         verilogNonrangeSelect1
      of "nonrange_variable_lvalue":                 verilogNonrangeVariableLvalue
      of "notifier":                                 verilogNotifier
      of "open_range_list":                          verilogOpenRangeList
      of "open_value_range":                         verilogOpenValueRange
      of "operator_assignment":                      verilogOperatorAssignment
      of "ordered_parameter_assignment":             verilogOrderedParameterAssignment
      of "ordered_port_connection":                  verilogOrderedPortConnection
      of "output_declaration":                       verilogOutputDeclaration
      of "output_identifier":                        verilogOutputIdentifier
      of "output_port_identifier":                   verilogOutputPortIdentifier
      of "output_terminal":                          verilogOutputTerminal
      of "overload_declaration":                     verilogOverloadDeclaration
      of "overload_operator":                        verilogOverloadOperator
      of "overload_proto_formals":                   verilogOverloadProtoFormals
      of "package_declaration":                      verilogPackageDeclaration
      of "package_export_declaration":               verilogPackageExportDeclaration
      of "package_identifier":                       verilogPackageIdentifier
      of "package_import_declaration":               verilogPackageImportDeclaration
      of "package_import_item":                      verilogPackageImportItem
      of "package_or_generate_item_declaration":     verilogPackageOrGenerateItemDeclaration
      of "package_scope":                            verilogPackageScope
      of "packed_dimension":                         verilogPackedDimension
      of "par_block":                                verilogParBlock
      of "parallel_edge_sensitive_path_description": verilogParallelEdgeSensitivePathDescription
      of "parallel_path_description":                verilogParallelPathDescription
      of "param_assignment":                         verilogParamAssignment
      of "param_expression":                         verilogParamExpression
      of "parameter_declaration":                    verilogParameterDeclaration
      of "parameter_identifier":                     verilogParameterIdentifier
      of "parameter_override":                       verilogParameterOverride
      of "parameter_port_declaration":               verilogParameterPortDeclaration
      of "parameter_port_list":                      verilogParameterPortList
      of "parameter_value_assignment":               verilogParameterValueAssignment
      of "pass_en_switchtype":                       verilogPassEnSwitchtype
      of "pass_enable_switch_instance":              verilogPassEnableSwitchInstance
      of "pass_switch_instance":                     verilogPassSwitchInstance
      of "pass_switchtype":                          verilogPassSwitchtype
      of "path_declaration":                         verilogPathDeclaration
      of "path_delay_expression":                    verilogPathDelayExpression
      of "path_delay_value":                         verilogPathDelayValue
      of "pattern":                                  verilogPattern
      of "pcontrol_terminal":                        verilogPcontrolTerminal
      of "polarity_operator":                        verilogPolarityOperator
      of "port":                                     verilogPort
      of "port_declaration":                         verilogPortDeclaration
      of "port_direction":                           verilogPortDirection
      of "port_identifier":                          verilogPortIdentifier
      of "port_reference":                           verilogPortReference
      of "primary":                                  verilogPrimary
      of "primary_literal":                          verilogPrimaryLiteral
      of "procedural_continuous_assignment":         verilogProceduralContinuousAssignment
      of "procedural_timing_control_statement":      verilogProceduralTimingControlStatement
      of "production_identifier":                    verilogProductionIdentifier
      of "program_ansi_header":                      verilogProgramAnsiHeader
      of "program_declaration":                      verilogProgramDeclaration
      of "program_identifier":                       verilogProgramIdentifier
      of "program_instantiation":                    verilogProgramInstantiation
      of "program_item":                             verilogProgramItem
      of "program_nonansi_header":                   verilogProgramNonansiHeader
      of "property_case_item":                       verilogPropertyCaseItem
      of "property_declaration":                     verilogPropertyDeclaration
      of "property_expr":                            verilogPropertyExpr
      of "property_formal_type1":                    verilogPropertyFormalType1
      of "property_identifier":                      verilogPropertyIdentifier
      of "property_list_of_arguments":               verilogPropertyListOfArguments
      of "property_lvar_port_direction":             verilogPropertyLvarPortDirection
      of "property_port_item":                       verilogPropertyPortItem
      of "property_port_list":                       verilogPropertyPortList
      of "property_spec":                            verilogPropertySpec
      of "ps_identifier":                            verilogPsIdentifier
      of "ps_or_hierarchical_array_identifier":      verilogPsOrHierarchicalArrayIdentifier
      of "pull_gate_instance":                       verilogPullGateInstance
      of "pulldown_strength":                        verilogPulldownStrength
      of "pullup_strength":                          verilogPullupStrength
      of "pulse_control_specparam":                  verilogPulseControlSpecparam
      of "pulsestyle_declaration":                   verilogPulsestyleDeclaration
      of "queue_dimension":                          verilogQueueDimension
      of "randcase_item":                            verilogRandcaseItem
      of "randcase_statement":                       verilogRandcaseStatement
      of "random_qualifier":                         verilogRandomQualifier
      of "randomize_call":                           verilogRandomizeCall
      of "range_expression":                         verilogRangeExpression
      of "real_number":                              verilogRealNumber
      of "ref_declaration":                          verilogRefDeclaration
      of "reference_event":                          verilogReferenceEvent
      of "reject_limit_value":                       verilogRejectLimitValue
      of "remain_active_flag":                       verilogRemainActiveFlag
      of "repeat_range":                             verilogRepeatRange
      of "restrict_property_statement":              verilogRestrictPropertyStatement
      of "scalar_constant":                          verilogScalarConstant
      of "scalar_timing_check_condition":            verilogScalarTimingCheckCondition
      of "select1":                                  verilogSelect1
      of "select_condition":                         verilogSelectCondition
      of "select_expression":                        verilogSelectExpression
      of "seq_block":                                verilogSeqBlock
      of "sequence_abbrev":                          verilogSequenceAbbrev
      of "sequence_declaration":                     verilogSequenceDeclaration
      of "sequence_expr":                            verilogSequenceExpr
      of "sequence_formal_type1":                    verilogSequenceFormalType1
      of "sequence_instance":                        verilogSequenceInstance
      of "sequence_list_of_arguments":               verilogSequenceListOfArguments
      of "sequence_lvar_port_direction":             verilogSequenceLvarPortDirection
      of "sequence_method_call":                     verilogSequenceMethodCall
      of "sequence_port_item":                       verilogSequencePortItem
      of "sequence_port_list":                       verilogSequencePortList
      of "sequential_body":                          verilogSequentialBody
      of "sequential_entry":                         verilogSequentialEntry
      of "showcancelled_declaration":                verilogShowcancelledDeclaration
      of "simple_immediate_assert_statement":        verilogSimpleImmediateAssertStatement
      of "simple_immediate_assume_statement":        verilogSimpleImmediateAssumeStatement
      of "simple_immediate_cover_statement":         verilogSimpleImmediateCoverStatement
      of "simple_path_declaration":                  verilogSimplePathDeclaration
      of "simple_text_macro_usage":                  verilogSimpleTextMacroUsage
      of "slice_size":                               verilogSliceSize
      of "solve_before_list":                        verilogSolveBeforeList
      of "source_file":                              verilogSourceFile
      of "specify_block":                            verilogSpecifyBlock
      of "specify_input_terminal_descriptor":        verilogSpecifyInputTerminalDescriptor
      of "specify_output_terminal_descriptor":       verilogSpecifyOutputTerminalDescriptor
      of "specparam_assignment":                     verilogSpecparamAssignment
      of "specparam_declaration":                    verilogSpecparamDeclaration
      of "specparam_identifier":                     verilogSpecparamIdentifier
      of "start_edge_offset":                        verilogStartEdgeOffset
      of "state_dependent_path_declaration":         verilogStateDependentPathDeclaration
      of "statement":                                verilogStatement
      of "statement_item":                           verilogStatementItem
      of "statement_or_null":                        verilogStatementOrNull
      of "stream_concatenation":                     verilogStreamConcatenation
      of "stream_expression":                        verilogStreamExpression
      of "stream_operator":                          verilogStreamOperator
      of "streaming_concatenation":                  verilogStreamingConcatenation
      of "strength0":                                verilogStrength0
      of "strength1":                                verilogStrength1
      of "string_literal":                           verilogStringLiteral
      of "struct_union":                             verilogStructUnion
      of "struct_union_member":                      verilogStructUnionMember
      of "subroutine_call":                          verilogSubroutineCall
      of "system_tf_call":                           verilogSystemTfCall
      of "tagged_union_expression":                  verilogTaggedUnionExpression
      of "task_body_declaration":                    verilogTaskBodyDeclaration
      of "task_declaration":                         verilogTaskDeclaration
      of "task_identifier":                          verilogTaskIdentifier
      of "task_prototype":                           verilogTaskPrototype
      of "terminal_identifier":                      verilogTerminalIdentifier
      of "text_macro_definition":                    verilogTextMacroDefinition
      of "text_macro_identifier":                    verilogTextMacroIdentifier
      of "text_macro_name":                          verilogTextMacroName
      of "text_macro_usage":                         verilogTextMacroUsage
      of "tf_call":                                  verilogTfCall
      of "tf_identifier":                            verilogTfIdentifier
      of "tf_item_declaration":                      verilogTfItemDeclaration
      of "tf_port_declaration":                      verilogTfPortDeclaration
      of "tf_port_direction":                        verilogTfPortDirection
      of "tf_port_item1":                            verilogTfPortItem1
      of "tf_port_list":                             verilogTfPortList
      of "threshold":                                verilogThreshold
      of "time_literal":                             verilogTimeLiteral
      of "time_unit":                                verilogTimeUnit
      of "timecheck_condition":                      verilogTimecheckCondition
      of "timescale_compiler_directive":             verilogTimescaleCompilerDirective
      of "timestamp_condition":                      verilogTimestampCondition
      of "timeunits_declaration":                    verilogTimeunitsDeclaration
      of "timing_check_condition":                   verilogTimingCheckCondition
      of "timing_check_event":                       verilogTimingCheckEvent
      of "timing_check_event_control":               verilogTimingCheckEventControl
      of "timing_check_limit":                       verilogTimingCheckLimit
      of "topmodule_identifier":                     verilogTopmoduleIdentifier
      of "trans_item":                               verilogTransItem
      of "trans_list":                               verilogTransList
      of "trans_range_list":                         verilogTransRangeList
      of "trans_set":                                verilogTransSet
      of "type_assignment":                          verilogTypeAssignment
      of "type_declaration":                         verilogTypeDeclaration
      of "type_reference":                           verilogTypeReference
      of "udp_ansi_declaration":                     verilogUdpAnsiDeclaration
      of "udp_declaration":                          verilogUdpDeclaration
      of "udp_declaration_port_list":                verilogUdpDeclarationPortList
      of "udp_initial_statement":                    verilogUdpInitialStatement
      of "udp_input_declaration":                    verilogUdpInputDeclaration
      of "udp_instance":                             verilogUdpInstance
      of "udp_instantiation":                        verilogUdpInstantiation
      of "udp_nonansi_declaration":                  verilogUdpNonansiDeclaration
      of "udp_output_declaration":                   verilogUdpOutputDeclaration
      of "udp_port_declaration":                     verilogUdpPortDeclaration
      of "udp_port_list":                            verilogUdpPortList
      of "udp_reg_declaration":                      verilogUdpRegDeclaration
      of "unary_operator":                           verilogUnaryOperator
      of "unbased_unsized_literal":                  verilogUnbasedUnsizedLiteral
      of "unconnected_drive":                        verilogUnconnectedDrive
      of "unique_priority":                          verilogUniquePriority
      of "uniqueness_constraint":                    verilogUniquenessConstraint
      of "unpacked_dimension":                       verilogUnpackedDimension
      of "unsized_dimension":                        verilogUnsizedDimension
      of "use_clause":                               verilogUseClause
      of "value_range":                              verilogValueRange
      of "variable_assignment":                      verilogVariableAssignment
      of "variable_decl_assignment":                 verilogVariableDeclAssignment
      of "variable_identifier_list":                 verilogVariableIdentifierList
      of "variable_lvalue":                          verilogVariableLvalue
      of "variable_port_header":                     verilogVariablePortHeader
      of "wait_statement":                           verilogWaitStatement
      of "zero_directive":                           verilogZeroDirective
      of "\x0A":                                     verilogNewlineTok
      of "!":                                        verilogExclamationTok
      of "!=":                                       verilogExclamationEqualTok
      of "!==":                                      verilogExclamationDoubleEqualTok
      of "!=?":                                      verilogExclamationEqualQuestionTok
      of "\"":                                       verilogQuoteTok
      of "\"DPI\"":                                  verilogQuoteDPIQuoteTok
      of "\"DPI-C\"":                                verilogQuoteDPIMinusCQuoteTok
      of "#":                                        verilogHashTok
      of "##":                                       verilogDoubleHashTok
      of "##[*]":                                    verilogDoubleHashLBrackAsteriskRBrackTok
      of "##[+]":                                    verilogDoubleHashLBrackPlusRBrackTok
      of "#-#":                                      verilogHashMinusHashTok
      of "#0":                                       verilogHash0Tok
      of "#=#":                                      verilogHashEqualHashTok
      of "$":                                        verilogDollarTok
      of "$error":                                   verilogDollarerorTok
      of "$fatal":                                   verilogDollarfatalTok
      of "$fullskew":                                verilogDollarfulskewTok
      of "$hold":                                    verilogDollarholdTok
      of "$info":                                    verilogDollarinfoTok
      of "$nochange":                                verilogDollarnochangeTok
      of "$period":                                  verilogDollarperiodTok
      of "$recovery":                                verilogDollarrecoveryTok
      of "$recrem":                                  verilogDollarrecremTok
      of "$removal":                                 verilogDollarremovalTok
      of "$root":                                    verilogDollarrotTok
      of "$setup":                                   verilogDollarsetupTok
      of "$setuphold":                               verilogDollarsetupholdTok
      of "$skew":                                    verilogDollarskewTok
      of "$timeskew":                                verilogDollartimeskewTok
      of "$unit":                                    verilogDollarunitTok
      of "$warning":                                 verilogDollarwarningTok
      of "$width":                                   verilogDollarwidthTok
      of "%":                                        verilogPercentTok
      of "%=":                                       verilogPercentEqualTok
      of "&":                                        verilogAmpersandTok
      of "&&":                                       verilogDoubleAmpersandTok
      of "&&&":                                      verilogTripleAmpersandTok
      of "&=":                                       verilogAmpersandEqualTok
      of "\'":                                       verilogApostropheTok
      of "\'0":                                      verilogApostrophe0Tok
      of "\'1":                                      verilogApostrophe1Tok
      of "\'B0":                                     verilogApostropheB0Tok
      of "\'B1":                                     verilogApostropheB1Tok
      of "\'b0":                                     verilogApostropheb0Tok1
      of "\'b1":                                     verilogApostropheb1Tok1
      of "\'{":                                      verilogApostropheLCurlyTok
      of "(":                                        verilogLParTok
      of "(*":                                       verilogLParAsteriskTok
      of ")":                                        verilogRParTok
      of "*":                                        verilogAsteriskTok
      of "*)":                                       verilogAsteriskRParTok
      of "**":                                       verilogDoubleAsteriskTok
      of "*::*":                                     verilogAsteriskDoubleColonAsteriskTok
      of "*=":                                       verilogAsteriskEqualTok
      of "*>":                                       verilogAsteriskGreaterThanTok
      of "+":                                        verilogPlusTok
      of "++":                                       verilogDoublePlusTok
      of "+:":                                       verilogPlusColonTok
      of "+=":                                       verilogPlusEqualTok
      of ",":                                        verilogCommaTok
      of "-":                                        verilogMinusTok
      of "--":                                       verilogDoubleMinusTok
      of "-:":                                       verilogMinusColonTok
      of "-=":                                       verilogMinusEqualTok
      of "->":                                       verilogMinusGreaterThanTok
      of "->>":                                      verilogMinusDoubleGreaterThanTok
      of ".":                                        verilogDotTok
      of ".*":                                       verilogDotAsteriskTok
      of "/":                                        verilogSlashTok
      of "/=":                                       verilogSlashEqualTok
      of "0":                                        verilog0Tok
      of "01":                                       verilog01Tok
      of "1":                                        verilog1Tok
      of "1\'B0":                                    verilog1ApostropheB0Tok
      of "1\'B1":                                    verilog1ApostropheB1Tok
      of "1\'BX":                                    verilog1ApostropheBXTok
      of "1\'Bx":                                    verilog1ApostropheBxTok1
      of "1\'b0":                                    verilog1Apostropheb0Tok1
      of "1\'b1":                                    verilog1Apostropheb1Tok1
      of "1\'bX":                                    verilog1ApostrophebXTok2
      of "1\'bx":                                    verilog1ApostrophebxTok3
      of "10":                                       verilog10Tok
      of "1step":                                    verilog1stepTok
      of "2":                                        verilog2Tok
      of ":":                                        verilogColonTok
      of ":/":                                       verilogColonSlashTok
      of "::":                                       verilogDoubleColonTok
      of ":=":                                       verilogColonEqualTok
      of ";":                                        verilogSemicolonTok
      of "<":                                        verilogLessThanTok
      of "<->":                                      verilogLessThanMinusGreaterThanTok
      of "<<":                                       verilogDoubleLessThanTok
      of "<<<":                                      verilogTripleLessThanTok
      of "<<<=":                                     verilogTripleLessThanEqualTok
      of "<<=":                                      verilogDoubleLessThanEqualTok
      of "<=":                                       verilogLessThanEqualTok
      of "=":                                        verilogEqualTok
      of "==":                                       verilogDoubleEqualTok
      of "===":                                      verilogTripleEqualTok
      of "==?":                                      verilogDoubleEqualQuestionTok
      of "=>":                                       verilogEqualGreaterThanTok
      of ">":                                        verilogGreaterThanTok
      of ">=":                                       verilogGreaterThanEqualTok
      of ">>":                                       verilogDoubleGreaterThanTok
      of ">>=":                                      verilogDoubleGreaterThanEqualTok
      of ">>>":                                      verilogTripleGreaterThanTok
      of ">>>=":                                     verilogTripleGreaterThanEqualTok
      of "?":                                        verilogQuestionTok
      of "@":                                        verilogAtTok
      of "@*":                                       verilogAtAsteriskTok
      of "@@":                                       verilogDoubleAtTok
      of "PATHPULSE$=":                              verilogPATHPULSEDollarEqualTok
      of "[":                                        verilogLBrackTok
      of "[*":                                       verilogLBrackAsteriskTok
      of "[*]":                                      verilogLBrackAsteriskRBrackTok
      of "[+]":                                      verilogLBrackPlusRBrackTok
      of "[->":                                      verilogLBrackMinusGreaterThanTok
      of "[=":                                       verilogLBrackEqualTok
      of "[\xE2\x80\x93>":                           verilogLBrack–GreaterThanTok
      of "\\":                                       verilogBackslashTok
      of "]":                                        verilogRBrackTok
      of "^":                                        verilogAccentTok
      of "^=":                                       verilogAccentEqualTok
      of "^~":                                       verilogAccentTildeTok
      of "`":                                        verilogBacktickTok
      of "accept_on":                                verilogAcceptOnTok
      of "alias":                                    verilogAliasTok
      of "always":                                   verilogAlwaysTok
      of "always_comb":                              verilogAlwaysCombTok
      of "always_ff":                                verilogAlwaysFfTok
      of "always_latch":                             verilogAlwaysLatchTok
      of "and":                                      verilogAndTok
      of "assert":                                   verilogAssertTok
      of "assign":                                   verilogAssignTok
      of "assume":                                   verilogAssumeTok
      of "automatic":                                verilogAutomaticTok
      of "before":                                   verilogBeforeTok
      of "begin":                                    verilogBeginTok
      of "binary_number":                            verilogBinaryNumber
      of "bind":                                     verilogBindTok
      of "bins":                                     verilogBinsTok
      of "binsof":                                   verilogBinsofTok
      of "bit":                                      verilogBitTok
      of "break":                                    verilogBreakTok
      of "buf":                                      verilogBufTok
      of "bufif0":                                   verilogBufif0Tok
      of "bufif1":                                   verilogBufif1Tok
      of "byte":                                     verilogByteTok
      of "c_identifier":                             verilogCIdentifier
      of "case":                                     verilogCaseTok
      of "casex":                                    verilogCasexTok
      of "casez":                                    verilogCasezTok
      of "cell":                                     verilogCellTok
      of "chandle":                                  verilogChandleTok
      of "checker":                                  verilogCheckerTok
      of "class":                                    verilogClassTok
      of "clocking":                                 verilogClockingTok
      of "cmos":                                     verilogCmosTok
      of "comment":                                  verilogComment
      of "config":                                   verilogConfigTok
      of "const":                                    verilogConstTok
      of "constraint":                               verilogConstraintTok
      of "context":                                  verilogContextTok
      of "continue":                                 verilogContinueTok
      of "cover":                                    verilogCoverTok
      of "covergroup":                               verilogCovergroupTok
      of "coverpoint":                               verilogCoverpointTok
      of "cross":                                    verilogCrossTok
      of "deassign":                                 verilogDeassignTok
      of "default":                                  verilogDefaultTok
      of "default_text":                             verilogDefaultText
      of "defparam":                                 verilogDefparamTok
      of "design":                                   verilogDesignTok
      of "directive_begin_keywords":                 verilogDirectiveBeginKeywordsTok
      of "directive_celldefine":                     verilogDirectiveCelldefineTok
      of "directive_default_nettype":                verilogDirectiveDefaultNettypeTok
      of "directive_define":                         verilogDirectiveDefineTok
      of "directive_else":                           verilogDirectiveElseTok
      of "directive_elsif":                          verilogDirectiveElsifTok
      of "directive_end_keywords":                   verilogDirectiveEndKeywordsTok
      of "directive_endcelldefine":                  verilogDirectiveEndcelldefineTok
      of "directive_endif":                          verilogDirectiveEndifTok
      of "directive_ifdef":                          verilogDirectiveIfdefTok
      of "directive_ifndef":                         verilogDirectiveIfndefTok
      of "directive_include":                        verilogDirectiveIncludeTok
      of "directive_line":                           verilogDirectiveLineTok
      of "directive_nounconnected_drive":            verilogDirectiveNounconnectedDriveTok
      of "directive_resetall":                       verilogDirectiveResetallTok
      of "directive_timescale":                      verilogDirectiveTimescaleTok
      of "directive_unconnected_drive":              verilogDirectiveUnconnectedDriveTok
      of "directive_undef":                          verilogDirectiveUndefTok
      of "directive_undefineall":                    verilogDirectiveUndefineallTok
      of "disable":                                  verilogDisableTok
      of "dist":                                     verilogDistTok
      of "do":                                       verilogDoTok
      of "edge":                                     verilogEdgeTok
      of "edge_symbol":                              verilogEdgeSymbol
      of "else":                                     verilogElseTok
      of "end":                                      verilogEndTok
      of "endcase":                                  verilogEndcaseTok
      of "endchecker":                               verilogEndcheckerTok
      of "endclass":                                 verilogEndclassTok
      of "endclocking":                              verilogEndclockingTok
      of "endconfig":                                verilogEndconfigTok
      of "endfunction":                              verilogEndfunctionTok
      of "endgenerate":                              verilogEndgenerateTok
      of "endgroup":                                 verilogEndgroupTok
      of "endinterface":                             verilogEndinterfaceTok
      of "endmodule":                                verilogEndmoduleTok
      of "endpackage":                               verilogEndpackageTok
      of "endprimitive":                             verilogEndprimitiveTok
      of "endprogram":                               verilogEndprogramTok
      of "endproperty":                              verilogEndpropertyTok
      of "endsequence":                              verilogEndsequenceTok
      of "endspecify":                               verilogEndspecifyTok
      of "endtable":                                 verilogEndtableTok
      of "endtask":                                  verilogEndtaskTok
      of "enum":                                     verilogEnumTok
      of "event":                                    verilogEventTok
      of "eventually":                               verilogEventuallyTok
      of "expect":                                   verilogExpectTok
      of "export":                                   verilogExportTok
      of "extends":                                  verilogExtendsTok
      of "extern":                                   verilogExternTok
      of "final":                                    verilogFinalTok
      of "first_match":                              verilogFirstMatchTok
      of "fixed_point_number":                       verilogFixedPointNumber
      of "for":                                      verilogForTok
      of "force":                                    verilogForceTok
      of "foreach":                                  verilogForeachTok
      of "forever":                                  verilogForeverTok
      of "fork":                                     verilogForkTok
      of "forkjoin":                                 verilogForkjoinTok
      of "fs":                                       verilogFsTok
      of "function":                                 verilogFunctionTok
      of "generate":                                 verilogGenerateTok
      of "genvar":                                   verilogGenvarTok
      of "global":                                   verilogGlobalTok
      of "hex_number":                               verilogHexNumber
      of "highz0":                                   verilogHighz0Tok
      of "highz1":                                   verilogHighz1Tok
      of "if":                                       verilogIfTok
      of "iff":                                      verilogIffTok
      of "ifnone":                                   verilogIfnoneTok
      of "ignore_bins":                              verilogIgnoreBinsTok
      of "illegal_bins":                             verilogIllegalBinsTok
      of "implements":                               verilogImplementsTok
      of "implies":                                  verilogImpliesTok
      of "import":                                   verilogImportTok
      of "initial":                                  verilogInitialTok
      of "inout":                                    verilogInoutTok
      of "input":                                    verilogInputTok
      of "inside":                                   verilogInsideTok
      of "instance":                                 verilogInstanceTok
      of "int":                                      verilogIntTok
      of "integer":                                  verilogIntegerTok
      of "interconnect":                             verilogInterconnectTok
      of "interface":                                verilogInterfaceTok
      of "intersect":                                verilogIntersectTok
      of "join":                                     verilogJoinTok
      of "join_any":                                 verilogJoinAnyTok
      of "join_none":                                verilogJoinNoneTok
      of "large":                                    verilogLargeTok
      of "let":                                      verilogLetTok
      of "level_symbol":                             verilogLevelSymbol
      of "liblist":                                  verilogLiblistTok
      of "local":                                    verilogLocalTok
      of "localparam":                               verilogLocalparamTok
      of "logic":                                    verilogLogicTok
      of "longint":                                  verilogLongintTok
      of "macro_text":                               verilogMacroText
      of "macromodule":                              verilogMacromoduleTok
      of "matches":                                  verilogMatchesTok
      of "medium":                                   verilogMediumTok
      of "modport":                                  verilogModportTok
      of "module":                                   verilogModuleTok
      of "ms":                                       verilogMsTok
      of "nand":                                     verilogNandTok
      of "negedge":                                  verilogNegedgeTok
      of "nettype":                                  verilogNettypeTok
      of "new":                                      verilogNewTok
      of "nexttime":                                 verilogNexttimeTok
      of "nmos":                                     verilogNmosTok
      of "none":                                     verilogNoneTok
      of "nor":                                      verilogNorTok
      of "noshowcancelled":                          verilogNoshowcancelledTok
      of "not":                                      verilogNotTok
      of "notif0":                                   verilogNotif0Tok
      of "notif1":                                   verilogNotif1Tok
      of "ns":                                       verilogNsTok
      of "null":                                     verilogNullTok
      of "octal_number":                             verilogOctalNumber
      of "option":                                   verilogOptionTok
      of "or":                                       verilogOrTok
      of "output":                                   verilogOutputTok
      of "output_symbol":                            verilogOutputSymbol
      of "package":                                  verilogPackageTok
      of "packed":                                   verilogPackedTok
      of "parameter":                                verilogParameterTok
      of "pmos":                                     verilogPmosTok
      of "posedge":                                  verilogPosedgeTok
      of "primitive":                                verilogPrimitiveTok
      of "priority":                                 verilogPriorityTok
      of "program":                                  verilogProgramTok
      of "property":                                 verilogPropertyTok
      of "protected":                                verilogProtectedTok
      of "ps":                                       verilogPsTok
      of "pull0":                                    verilogPull0Tok
      of "pull1":                                    verilogPull1Tok
      of "pulldown":                                 verilogPulldownTok
      of "pullup":                                   verilogPullupTok
      of "pulsestyle_ondetect":                      verilogPulsestyleOndetectTok
      of "pulsestyle_onevent":                       verilogPulsestyleOneventTok
      of "pure":                                     verilogPureTok
      of "rand":                                     verilogRandTok
      of "randc":                                    verilogRandcTok
      of "randcase":                                 verilogRandcaseTok
      of "randomize":                                verilogRandomizeTok
      of "rcmos":                                    verilogRcmosTok
      of "real":                                     verilogRealTok
      of "realtime":                                 verilogRealtimeTok
      of "ref":                                      verilogRefTok
      of "reg":                                      verilogRegTok
      of "reject_on":                                verilogRejectOnTok
      of "release":                                  verilogReleaseTok
      of "repeat":                                   verilogRepeatTok
      of "restrict":                                 verilogRestrictTok
      of "return":                                   verilogReturnTok
      of "rnmos":                                    verilogRnmosTok
      of "rpmos":                                    verilogRpmosTok
      of "rtran":                                    verilogRtranTok
      of "rtranif0":                                 verilogRtranif0Tok
      of "rtranif1":                                 verilogRtranif1Tok
      of "s":                                        verilogSTok
      of "s_always":                                 verilogSAlwaysTok
      of "s_eventually":                             verilogSEventuallyTok
      of "s_nexttime":                               verilogSNexttimeTok
      of "s_until":                                  verilogSUntilTok
      of "s_until_with":                             verilogSUntilWithTok
      of "sample":                                   verilogSampleTok
      of "scalared":                                 verilogScalaredTok
      of "sequence":                                 verilogSequenceTok
      of "shortint":                                 verilogShortintTok
      of "shortreal":                                verilogShortrealTok
      of "showcancelled":                            verilogShowcancelledTok
      of "signed":                                   verilogSignedTok
      of "simple_identifier":                        verilogSimpleIdentifier
      of "small":                                    verilogSmallTok
      of "soft":                                     verilogSoftTok
      of "solve":                                    verilogSolveTok
      of "specify":                                  verilogSpecifyTok
      of "specparam":                                verilogSpecparamTok
      of "static":                                   verilogStaticTok
      of "std":                                      verilogStdTok
      of "string":                                   verilogStringTok
      of "strong":                                   verilogStrongTok
      of "strong0":                                  verilogStrong0Tok
      of "strong1":                                  verilogStrong1Tok
      of "struct":                                   verilogStructTok
      of "super":                                    verilogSuperTok
      of "supply0":                                  verilogSupply0Tok
      of "supply1":                                  verilogSupply1Tok
      of "sync_accept_on":                           verilogSyncAcceptOnTok
      of "sync_reject_on":                           verilogSyncRejectOnTok
      of "system_tf_identifier":                     verilogSystemTfIdentifier
      of "table":                                    verilogTableTok
      of "tagged":                                   verilogTaggedTok
      of "task":                                     verilogTaskTok
      of "this":                                     verilogThisTok
      of "throughout":                               verilogThroughoutTok
      of "time":                                     verilogTimeTok
      of "timeprecision":                            verilogTimeprecisionTok
      of "timeunit":                                 verilogTimeunitTok
      of "tran":                                     verilogTranTok
      of "tranif0":                                  verilogTranif0Tok
      of "tranif1":                                  verilogTranif1Tok
      of "tri":                                      verilogTriTok
      of "tri0":                                     verilogTri0Tok
      of "tri1":                                     verilogTri1Tok
      of "triand":                                   verilogTriandTok
      of "trior":                                    verilogTriorTok
      of "trireg":                                   verilogTriregTok
      of "type":                                     verilogTypeTok
      of "type_option":                              verilogTypeOptionTok
      of "typedef":                                  verilogTypedefTok
      of "union":                                    verilogUnionTok
      of "unique":                                   verilogUniqueTok
      of "unique0":                                  verilogUnique0Tok
      of "unsigned":                                 verilogUnsignedTok
      of "unsigned_number":                          verilogUnsignedNumber
      of "until":                                    verilogUntilTok
      of "until_with":                               verilogUntilWithTok
      of "untyped":                                  verilogUntypedTok
      of "us":                                       verilogUsTok
      of "use":                                      verilogUseTok
      of "uwire":                                    verilogUwireTok
      of "var":                                      verilogVarTok
      of "vectored":                                 verilogVectoredTok
      of "virtual":                                  verilogVirtualTok
      of "void":                                     verilogVoidTok
      of "void\'":                                   verilogVoidApostropheTok
      of "wait":                                     verilogWaitTok
      of "wait_order":                               verilogWaitOrderTok
      of "wand":                                     verilogWandTok
      of "weak":                                     verilogWeakTok
      of "weak0":                                    verilogWeak0Tok
      of "weak1":                                    verilogWeak1Tok
      of "while":                                    verilogWhileTok
      of "wildcard":                                 verilogWildcardTok
      of "wire":                                     verilogWireTok
      of "with":                                     verilogWithTok
      of "within":                                   verilogWithinTok
      of "wor":                                      verilogWorTok
      of "xnor":                                     verilogXnorTok
      of "xor":                                      verilogXorTok
      of "{":                                        verilogLCurlyTok
      of "|":                                        verilogPipeTok
      of "|->":                                      verilogPipeMinusGreaterThanTok
      of "|=":                                       verilogPipeEqualTok
      of "|=>":                                      verilogPipeEqualGreaterThanTok
      of "||":                                       verilogDoublePipeTok
      of "}":                                        verilogRCurlyTok
      of "~":                                        verilogTildeTok
      of "~&":                                       verilogTildeAmpersandTok
      of "~^":                                       verilogTildeAccentTok
      of "~|":                                       verilogTildePipeTok
      of "\xE2\x80\x93":                             verilog–Tok
      of "\xE2\x80\x93>":                            verilog–GreaterThanTok
      of "\xE2\x80\x93\xE2\x80\x93":                 verilog––Tok
      of "ERROR":                                    verilogSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsVerilogNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsVerilogNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsVerilogNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_verilog(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsVerilogNode): string =
  $ts_node_type(TSNode(node))

proc newTsVerilogParser*(): VerilogParser =
  result = VerilogParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_verilog())

proc parseString*(parser: VerilogParser, str: string): TsVerilogNode =
  TsVerilogNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsVerilogString*(str: string): TsVerilogNode =
  let parser = newTsVerilogParser()
  return parseString(parser, str)

func `$`*(node: TsVerilogNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsVerilogNode, str: string): string =
  var res = addr result
  proc aux(node: TsVerilogNode, level: int) =
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


