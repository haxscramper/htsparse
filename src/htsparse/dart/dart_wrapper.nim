import
  hmisc / wrappers/treesitter
import
  hmisc / core/all
import
  hmisc / types/colorstring
import
  strutils

type
  DartNodeKind* = enum
    dartDeclaration                            ## _declaration                             
    dartLiteral                                ## _literal                                 
    dartStatement                              ## _statement                               
    dartAdditiveExpression                     ## additive_expression                      
    dartAdditiveOperator                       ## additive_operator                        
    dartAnnotation                             ## annotation                               
    dartArgument                               ## argument                                 
    dartArgumentPart                           ## argument_part                            
    dartArguments                              ## arguments                                
    dartAsOperator                             ## as_operator                              
    dartAssertStatement                        ## assert_statement                         
    dartAssertion                              ## assertion                                
    dartAssignableExpression                   ## assignable_expression                    
    dartAssignmentExpression                   ## assignment_expression                    
    dartAssignmentExpressionWithoutCascade     ## assignment_expression_without_cascade    
    dartAwaitExpression                        ## await_expression                         
    dartBinaryOperator                         ## binary_operator                          
    dartBitwiseAndExpression                   ## bitwise_and_expression                   
    dartBitwiseOperator                        ## bitwise_operator                         
    dartBitwiseOrExpression                    ## bitwise_or_expression                    
    dartBitwiseXorExpression                   ## bitwise_xor_expression                   
    dartBlock                                  ## block                                    
    dartBreakStatement                         ## break_statement                          
    dartCascadeSection                         ## cascade_section                          
    dartCascadeSelector                        ## cascade_selector                         
    dartCatchClause                            ## catch_clause                             
    dartClassBody                              ## class_body                               
    dartClassDefinition                        ## class_definition                         
    dartCombinator                             ## combinator                               
    dartConditionalAssignableSelector          ## conditional_assignable_selector          
    dartConditionalExpression                  ## conditional_expression                   
    dartConfigurableUri                        ## configurable_uri                         
    dartConfigurationUri                       ## configuration_uri                        
    dartConstObjectExpression                  ## const_object_expression                  
    dartConstantConstructorSignature           ## constant_constructor_signature           
    dartConstructorInvocation                  ## constructor_invocation                   
    dartConstructorParam                       ## constructor_param                        
    dartConstructorSignature                   ## constructor_signature                    
    dartContinueStatement                      ## continue_statement                       
    dartDimensions                             ## dimensions                               
    dartDoStatement                            ## do_statement                             
    dartDottedIdentifierList                   ## dotted_identifier_list                   
    dartEnumBody                               ## enum_body                                
    dartEnumConstant                           ## enum_constant                            
    dartEnumDeclaration                        ## enum_declaration                         
    dartEqualityExpression                     ## equality_expression                      
    dartEscapeSequence                         ## escape_sequence                          
    dartExplicitConstructorInvocation          ## explicit_constructor_invocation          
    dartExpressionStatement                    ## expression_statement                     
    dartExtensionBody                          ## extension_body                           
    dartExtensionDeclaration                   ## extension_declaration                    
    dartFactoryConstructorSignature            ## factory_constructor_signature            
    dartFalse                                  ## false                                    
    dartFieldInitializer                       ## field_initializer                        
    dartFinallyClause                          ## finally_clause                           
    dartForElement                             ## for_element                              
    dartForStatement                           ## for_statement                            
    dartFormalParameter                        ## formal_parameter                         
    dartFormalParameterList                    ## formal_parameter_list                    
    dartFunctionBody                           ## function_body                            
    dartFunctionExpression                     ## function_expression                      
    dartFunctionExpressionBody                 ## function_expression_body                 
    dartFunctionSignature                      ## function_signature                       
    dartFunctionType                           ## function_type                            
    dartGetterSignature                        ## getter_signature                         
    dartIdentifier                             ## identifier                               
    dartIfElement                              ## if_element                               
    dartIfNullExpression                       ## if_null_expression                       
    dartIfStatement                            ## if_statement                             
    dartImportOrExport                         ## import_or_export                         
    dartImportSpecification                    ## import_specification                     
    dartInferredType                           ## inferred_type                            
    dartInitializedIdentifier                  ## initialized_identifier                   
    dartInitializedIdentifierList              ## initialized_identifier_list              
    dartInitializedVariableDefinition          ## initialized_variable_definition          
    dartInitializerListEntry                   ## initializer_list_entry                   
    dartInitializers                           ## initializers                             
    dartInterfaces                             ## interfaces                               
    dartIsOperator                             ## is_operator                              
    dartLabel                                  ## label                                    
    dartLabeledStatement                       ## labeled_statement                        
    dartLambdaExpression                       ## lambda_expression                        
    dartLibraryExport                          ## library_export                           
    dartLibraryImport                          ## library_import                           
    dartLibraryName                            ## library_name                             
    dartListLiteral                            ## list_literal                             
    dartLocalVariableDeclaration               ## local_variable_declaration               
    dartLogicalAndExpression                   ## logical_and_expression                   
    dartLogicalOrExpression                    ## logical_or_expression                    
    dartMarkerAnnotation                       ## marker_annotation                        
    dartMethodSignature                        ## method_signature                         
    dartMixinApplication                       ## mixin_application                        
    dartMixinApplicationClass                  ## mixin_application_class                  
    dartMixinDeclaration                       ## mixin_declaration                        
    dartMixins                                 ## mixins                                   
    dartModuleName                             ## module_name                              
    dartMultiplicativeExpression               ## multiplicative_expression                
    dartMultiplicativeOperator                 ## multiplicative_operator                  
    dartNamedArgument                          ## named_argument                           
    dartNamedParameterTypes                    ## named_parameter_types                    
    dartNegationOperator                       ## negation_operator                        
    dartNewExpression                          ## new_expression                           
    dartNormalParameterType                    ## normal_parameter_type                    
    dartNullLiteral                            ## null_literal                             
    dartOperatorSignature                      ## operator_signature                       
    dartOptionalFormalParameters               ## optional_formal_parameters               
    dartOptionalParameterTypes                 ## optional_parameter_types                 
    dartOptionalPositionalParameterTypes       ## optional_positional_parameter_types      
    dartPair                                   ## pair                                     
    dartParameterTypeList                      ## parameter_type_list                      
    dartParenthesizedExpression                ## parenthesized_expression                 
    dartPartDirective                          ## part_directive                           
    dartPartOfDirective                        ## part_of_directive                        
    dartPostfixExpression                      ## postfix_expression                       
    dartPostfixOperator                        ## postfix_operator                         
    dartPrefixOperator                         ## prefix_operator                          
    dartProgram                                ## program                                  
    dartQualified                              ## qualified                                
    dartRedirectingFactoryConstructorSignature ## redirecting_factory_constructor_signature
    dartRedirection                            ## redirection                              
    dartRelationalExpression                   ## relational_expression                    
    dartRelationalOperator                     ## relational_operator                      
    dartReturnStatement                        ## return_statement                         
    dartScopedIdentifier                       ## scoped_identifier                        
    dartScriptTag                              ## script_tag                               
    dartSelector                               ## selector                                 
    dartSetOrMapLiteral                        ## set_or_map_literal                       
    dartSetterSignature                        ## setter_signature                         
    dartShiftExpression                        ## shift_expression                         
    dartShiftOperator                          ## shift_operator                           
    dartSpreadElement                          ## spread_element                           
    dartStaticFinalDeclaration                 ## static_final_declaration                 
    dartStaticFinalDeclarationList             ## static_final_declaration_list            
    dartStringLiteral                          ## string_literal                           
    dartSuper                                  ## super                                    
    dartSuperclass                             ## superclass                               
    dartSwitchBlock                            ## switch_block                             
    dartSwitchLabel                            ## switch_label                             
    dartSwitchStatement                        ## switch_statement                         
    dartSymbolLiteral                          ## symbol_literal                           
    dartTemplateSubstitution                   ## template_substitution                    
    dartThis                                   ## this                                     
    dartThrowExpression                        ## throw_expression                         
    dartThrowExpressionWithoutCascade          ## throw_expression_without_cascade         
    dartThrows                                 ## throws                                   
    dartTildeOperator                          ## tilde_operator                           
    dartTrue                                   ## true                                     
    dartTryStatement                           ## try_statement                            
    dartTypeAlias                              ## type_alias                               
    dartTypeArguments                          ## type_arguments                           
    dartTypeBound                              ## type_bound                               
    dartTypeCast                               ## type_cast                                
    dartTypeCastExpression                     ## type_cast_expression                     
    dartTypeParameter                          ## type_parameter                           
    dartTypeParameters                         ## type_parameters                          
    dartTypeTest                               ## type_test                                
    dartTypeTestExpression                     ## type_test_expression                     
    dartTypedIdentifier                        ## typed_identifier                         
    dartUnaryExpression                        ## unary_expression                         
    dartUnconditionalAssignableSelector        ## unconditional_assignable_selector        
    dartUri                                    ## uri                                      
    dartUriTest                                ## uri_test                                 
    dartWhileStatement                         ## while_statement                          
    dartYieldEachStatement                     ## yield_each_statement                     
    dartYieldStatement                         ## yield_statement                          
    dartNewlineTok                             ## 
                                               ##                                          
    dartQuoteTok                               ## "                                        
    dartTripleQuoteTok                         ## """                                      
    dartHashTok                                ## #                                        
    dartHashExclamationTok                     ## #!                                       
    dartDollarTok                              ## $                                        
    dartPercentTok                             ## %                                        
    dartAmpersandTok                           ## &                                        
    dartDoubleAmpersandTok                     ## &&                                       
    dartApostropheTok                          ## '                                        
    dartTripleApostropheTok                    ## '''                                      
    dartLParTok                                ## (                                        
    dartRParTok                                ## )                                        
    dartAsteriskTok                            ## *                                        
    dartCommaTok                               ## ,                                        
    dartDotTok                                 ## .                                        
    dartDoubleDotTok                           ## ..                                       
    dartTripleDotTok                           ## ...                                      
    dartSlashTok                               ## /                                        
    dartColonTok                               ## :                                        
    dartSemicolonTok                           ## ;                                        
    dartLessThanTok                            ## <                                        
    dartDoubleLessThanTok                      ## <<                                       
    dartLessThanEqualTok                       ## <=                                       
    dartEqualTok                               ## =                                        
    dartDoubleEqualTok                         ## ==                                       
    dartEqualGreaterThanTok                    ## =>                                       
    dartGreaterThanTok                         ## >                                        
    dartGreaterThanEqualTok                    ## >=                                       
    dartDoubleGreaterThanTok                   ## >>                                       
    dartTripleGreaterThanTok                   ## >>>                                      
    dartQuestionTok                            ## ?                                        
    dartQuestionDotTok                         ## ?.                                       
    dartDoubleQuestionTok                      ## ??                                       
    dartAtTok                                  ## @                                        
    dartFunctionTok                            ## Function                                 
    dartLBrackTok                              ## [                                        
    dartLBrackRBrackTok                        ## []                                       
    dartLBrackRBrackEqualTok                   ## []=                                      
    dartRBrackTok                              ## ]                                        
    dartAccentTok                              ## ^                                        
    dartAbstractTok                            ## abstract                                 
    dartAsTok                                  ## as                                       
    dartAsyncTok                               ## async                                    
    dartAsyncAsteriskTok                       ## async*                                   
    dartAwaitTok                               ## await                                    
    dartBoolTok                                ## bool                                     
    dartCaseBuiltin                            ## case_builtin                             
    dartCatchTok                               ## catch                                    
    dartClassTok                               ## class                                    
    dartComment                                ## comment                                  
    dartConstBuiltin                           ## const_builtin                            
    dartContinueTok                            ## continue                                 
    dartCovariantTok                           ## covariant                                
    dartDecimalFloatingPointLiteral            ## decimal_floating_point_literal           
    dartDecimalIntegerLiteral                  ## decimal_integer_literal                  
    dartDefaultTok                             ## default                                  
    dartDeferredTok                            ## deferred                                 
    dartDoTok                                  ## do                                       
    dartDocumentationComment                   ## documentation_comment                    
    dartDynamicTok                             ## dynamic                                  
    dartElseTok                                ## else                                     
    dartEnumTok                                ## enum                                     
    dartEqualityOperator                       ## equality_operator                        
    dartExportTok                              ## export                                   
    dartExtendsTok                             ## extends                                  
    dartExtensionTok                           ## extension                                
    dartExternalTok                            ## external                                 
    dartFactoryTok                             ## factory                                  
    dartFalseTok                               ## false                                    
    dartFinalBuiltin                           ## final_builtin                            
    dartFinallyTok                             ## finally                                  
    dartForTok                                 ## for                                      
    dartGetTok                                 ## get                                      
    dartHexIntegerLiteral                      ## hex_integer_literal                      
    dartHideTok                                ## hide                                     
    dartIdentifierDollarEscaped                ## identifier_dollar_escaped                
    dartIfTok                                  ## if                                       
    dartImplementsTok                          ## implements                               
    dartImportTok                              ## import                                   
    dartInTok                                  ## in                                       
    dartIncrementOperator                      ## increment_operator                       
    dartInterfaceTok                           ## interface                                
    dartIsTok                                  ## is                                       
    dartLateTok                                ## late                                     
    dartLibraryTok                             ## library                                  
    dartMinusOperator                          ## minus_operator                           
    dartMixinTok                               ## mixin                                    
    dartNativeTok                              ## native                                   
    dartNewTok                                 ## new                                      
    dartNullTok                                ## null                                     
    dartOfTok                                  ## of                                       
    dartOnTok                                  ## on                                       
    dartOperatorTok                            ## operator                                 
    dartPartTok                                ## part                                     
    dartRQuoteTok                              ## r"                                       
    dartRTripleQuoteTok                        ## r"""                                     
    dartRApostropheTok                         ## r'                                       
    dartRTripleApostropheTok                   ## r'''                                     
    dartRequiredTok                            ## required                                 
    dartReturnTok                              ## return                                   
    dartSetTok                                 ## set                                      
    dartShowTok                                ## show                                     
    dartStaticTok                              ## static                                   
    dartSuperTok                               ## super                                    
    dartSwitchTok                              ## switch                                   
    dartSyncAsteriskTok                        ## sync*                                    
    dartThisTok                                ## this                                     
    dartThrowTok                               ## throw                                    
    dartThrowsTok                              ## throws                                   
    dartTransitiveTok                          ## transitive                               
    dartTrueTok                                ## true                                     
    dartTryTok                                 ## try                                      
    dartTypeIdentifier                         ## type_identifier                          
    dartTypedefTok                             ## typedef                                  
    dartVarTok                                 ## var                                      
    dartVoidType                               ## void_type                                
    dartWhileTok                               ## while                                    
    dartWithTok                                ## with                                     
    dartYieldTok                               ## yield                                    
    dartLCurlyTok                              ## {                                        
    dartPipeTok                                ## |                                        
    dartDoublePipeTok                          ## ||                                       
    dartRCurlyTok                              ## }                                        
    dartTildeTok                               ## ~                                        
    dartTildeSlashTok                          ## ~/                                       
    dartSyntaxError                            ## Tree-sitter parser syntax error          
   

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
   

proc tsNodeType*(node: TsDartNode): string
  
 

proc kind*(node: TsDartNode): DartNodeKind {.noSideEffect.} = 
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration":                              dartDeclaration                           
      of "_literal":                                  dartLiteral                               
      of "_statement":                                dartStatement                             
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
 

type
  DartNode* = HtsNode[TsDartNode, DartNodeKind]
   
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
  
 
func `[]`*(
    node: TsDartNode,
    idx:  int,
    kind: DartNodeKind | set[DartNodeKind]
  ): TsDartNode = 
  assert 0 <= idx and idx < node.len
  result = TsDartNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)
 
proc treeReprTsDart*(str: string, unnamed: bool = false): ColoredText = 
  treeRepr[TsDartNode, DartNodeKind](parseTsDartString(str), str, 4, unnamed = unnamed)
 
proc toHtsNode*(
    node: TsDartNode,
    str:  ptr string
  ): HtsNode[TsDartNode, DartNodeKind] = 
  toHtsNode[TsDartNode, DartNodeKind](node, str)
 
proc toHtsTree*(node: TsDartNode, str: ptr string): DartNode = 
  toHtsNode[TsDartNode, DartNodeKind](node, str)
 
proc parseDartString*(str: ptr string, unnamed: bool = false): DartNode = 
  let parser = newTsDartParser()
  return toHtsTree[TsDartNode, DartNodeKind](parseString(parser, str[]), str)
 
proc parseDartString*(str: string, unnamed: bool = false): DartNode = 
  let parser = newTsDartParser()
  return toHtsTree[TsDartNode, DartNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)
 

