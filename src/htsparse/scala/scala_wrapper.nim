import
  hmisc / wrappers/treesitter
import
  hmisc / core/all
import
  hmisc / types/colorstring
import
  strutils

type
  ScalaNodeKind* = enum
    scalaDefinition                   ## _definition                    
    scalaPattern                      ## _pattern                       
    scalaExpression                   ## expression                     
    scalaAccessModifier               ## access_modifier                
    scalaAccessQualifier              ## access_qualifier               
    scalaAlternativePattern           ## alternative_pattern            
    scalaAnnotation                   ## annotation                     
    scalaArguments                    ## arguments                      
    scalaAscriptionExpression         ## ascription_expression          
    scalaAssignmentExpression         ## assignment_expression          
    scalaBinding                      ## binding                        
    scalaBindings                     ## bindings                       
    scalaBlock                        ## block                          
    scalaBooleanLiteral               ## boolean_literal                
    scalaCallExpression               ## call_expression                
    scalaCapturePattern               ## capture_pattern                
    scalaCaseBlock                    ## case_block                     
    scalaCaseClassPattern             ## case_class_pattern             
    scalaCaseClause                   ## case_clause                    
    scalaCatchClause                  ## catch_clause                   
    scalaClassDefinition              ## class_definition               
    scalaClassParameter               ## class_parameter                
    scalaClassParameters              ## class_parameters               
    scalaCompilationUnit              ## compilation_unit               
    scalaCompoundType                 ## compound_type                  
    scalaContextBound                 ## context_bound                  
    scalaContravariantTypeParameter   ## contravariant_type_parameter   
    scalaCovariantTypeParameter       ## covariant_type_parameter       
    scalaDoWhileExpression            ## do_while_expression            
    scalaEnumerator                   ## enumerator                     
    scalaEnumerators                  ## enumerators                    
    scalaExtendsClause                ## extends_clause                 
    scalaFieldExpression              ## field_expression               
    scalaFinallyClause                ## finally_clause                 
    scalaForExpression                ## for_expression                 
    scalaFunctionDeclaration          ## function_declaration           
    scalaFunctionDefinition           ## function_definition            
    scalaFunctionType                 ## function_type                  
    scalaGenericFunction              ## generic_function               
    scalaGenericType                  ## generic_type                   
    scalaGuard                        ## guard                          
    scalaIfExpression                 ## if_expression                  
    scalaImportDeclaration            ## import_declaration             
    scalaImportSelectors              ## import_selectors               
    scalaInfixExpression              ## infix_expression               
    scalaInfixPattern                 ## infix_pattern                  
    scalaInfixType                    ## infix_type                     
    scalaInstanceExpression           ## instance_expression            
    scalaInterpolatedString           ## interpolated_string            
    scalaInterpolatedStringExpression ## interpolated_string_expression 
    scalaInterpolation                ## interpolation                  
    scalaLambdaExpression             ## lambda_expression              
    scalaLazyParameterType            ## lazy_parameter_type            
    scalaLowerBound                   ## lower_bound                    
    scalaMatchExpression              ## match_expression               
    scalaModifiers                    ## modifiers                      
    scalaObjectDefinition             ## object_definition              
    scalaPackageClause                ## package_clause                 
    scalaPackageIdentifier            ## package_identifier             
    scalaPackageObject                ## package_object                 
    scalaParameter                    ## parameter                      
    scalaParameterTypes               ## parameter_types                
    scalaParameters                   ## parameters                     
    scalaParenthesizedExpression      ## parenthesized_expression       
    scalaPostfixExpression            ## postfix_expression             
    scalaPrefixExpression             ## prefix_expression              
    scalaProjectedType                ## projected_type                 
    scalaRenamedIdentifier            ## renamed_identifier             
    scalaRepeatedParameterType        ## repeated_parameter_type        
    scalaReturnExpression             ## return_expression              
    scalaStableIdentifier             ## stable_identifier              
    scalaStableTypeIdentifier         ## stable_type_identifier         
    scalaString                       ## string                         
    scalaTemplateBody                 ## template_body                  
    scalaThrowExpression              ## throw_expression               
    scalaTraitDefinition              ## trait_definition               
    scalaTryExpression                ## try_expression                 
    scalaTupleExpression              ## tuple_expression               
    scalaTuplePattern                 ## tuple_pattern                  
    scalaTupleType                    ## tuple_type                     
    scalaTypeArguments                ## type_arguments                 
    scalaTypeDefinition               ## type_definition                
    scalaTypeParameters               ## type_parameters                
    scalaTypedPattern                 ## typed_pattern                  
    scalaUnit                         ## unit                           
    scalaUpperBound                   ## upper_bound                    
    scalaValDeclaration               ## val_declaration                
    scalaValDefinition                ## val_definition                 
    scalaVarDeclaration               ## var_declaration                
    scalaVarDefinition                ## var_definition                 
    scalaViewBound                    ## view_bound                     
    scalaWhileExpression              ## while_expression               
    scalaExclamationTok               ## !                              
    scalaHashTok                      ## #                              
    scalaDollarTok                    ## $                              
    scalaLParTok                      ## (                              
    scalaRParTok                      ## )                              
    scalaAsteriskTok                  ## *                              
    scalaPlusTok                      ## +                              
    scalaCommaTok                     ## ,                              
    scalaMinusTok                     ## -                              
    scalaDotTok                       ## .                              
    scalaColonTok                     ## :                              
    scalaSemicolonTok                 ## ;                              
    scalaLessThanPercentTok           ## <%                             
    scalaLessThanMinusTok             ## <-                             
    scalaLessThanColonTok             ## <:                             
    scalaEqualTok                     ## =                              
    scalaEqualGreaterThanTok          ## =>                             
    scalaGreaterThanColonTok          ## >:                             
    scalaAtTok                        ## @                              
    scalaLBrackTok                    ## [                              
    scalaRBrackTok                    ## ]                              
    scalaAbstractTok                  ## abstract                       
    scalaCaseTok                      ## case                           
    scalaCatchTok                     ## catch                          
    scalaCharacterLiteral             ## character_literal              
    scalaClassTok                     ## class                          
    scalaComment                      ## comment                        
    scalaDefTok                       ## def                            
    scalaDoTok                        ## do                             
    scalaElseTok                      ## else                           
    scalaExtendsTok                   ## extends                        
    scalaFalseTok                     ## false                          
    scalaFinalTok                     ## final                          
    scalaFinallyTok                   ## finally                        
    scalaFloatingPointLiteral         ## floating_point_literal         
    scalaForTok                       ## for                            
    scalaIdentifier                   ## identifier                     
    scalaIfTok                        ## if                             
    scalaImplicitTok                  ## implicit                       
    scalaImportTok                    ## import                         
    scalaIntegerLiteral               ## integer_literal                
    scalaLazyTok                      ## lazy                           
    scalaMatchTok                     ## match                          
    scalaNewTok                       ## new                            
    scalaNullLiteral                  ## null_literal                   
    scalaObjectTok                    ## object                         
    scalaOperatorIdentifier           ## operator_identifier            
    scalaOverrideTok                  ## override                       
    scalaPackageTok                   ## package                        
    scalaPrivateTok                   ## private                        
    scalaProtectedTok                 ## protected                      
    scalaReturnTok                    ## return                         
    scalaSealedTok                    ## sealed                         
    scalaSymbolLiteral                ## symbol_literal                 
    scalaThrowTok                     ## throw                          
    scalaTraitTok                     ## trait                          
    scalaTrueTok                      ## true                           
    scalaTryTok                       ## try                            
    scalaTypeTok                      ## type                           
    scalaTypeIdentifier               ## type_identifier                
    scalaValTok                       ## val                            
    scalaVarTok                       ## var                            
    scalaWhileTok                     ## while                          
    scalaWildcard                     ## wildcard                       
    scalaWithTok                      ## with                           
    scalaYieldTok                     ## yield                          
    scalaLCurlyTok                    ## {                              
    scalaPipeTok                      ## |                              
    scalaRCurlyTok                    ## }                              
    scalaTildeTok                     ## ~                              
    scalaSyntaxError                  ## Tree-sitter parser syntax error
   

type
  ScalaExternalTok* = enum
    scalaExtern_automatic_semicolon                  ## _automatic_semicolon                 
    scalaExtern_simple_string                        ## _simple_string                       
    scalaExtern_simple_multiline_string              ## _simple_multiline_string             
    scalaExtern_interpolated_string_middle           ## _interpolated_string_middle          
    scalaExtern_interpolated_string_end              ## _interpolated_string_end             
    scalaExtern_interpolated_multiline_string_middle ## _interpolated_multiline_string_middle
    scalaExtern_interpolated_multiline_string_end    ## _interpolated_multiline_string_end   
   

type
  TsScalaNode* = distinct TSNode
   

type
  ScalaParser* = distinct PtsParser
   

proc tsNodeType*(node: TsScalaNode): string
  
 

proc kind*(node: TsScalaNode): ScalaNodeKind {.noSideEffect.} = 
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_definition":                    scalaDefinition                  
      of "_pattern":                       scalaPattern                     
      of "expression":                     scalaExpression                  
      of "access_modifier":                scalaAccessModifier              
      of "access_qualifier":               scalaAccessQualifier             
      of "alternative_pattern":            scalaAlternativePattern          
      of "annotation":                     scalaAnnotation                  
      of "arguments":                      scalaArguments                   
      of "ascription_expression":          scalaAscriptionExpression        
      of "assignment_expression":          scalaAssignmentExpression        
      of "binding":                        scalaBinding                     
      of "bindings":                       scalaBindings                    
      of "block":                          scalaBlock                       
      of "boolean_literal":                scalaBooleanLiteral              
      of "call_expression":                scalaCallExpression              
      of "capture_pattern":                scalaCapturePattern              
      of "case_block":                     scalaCaseBlock                   
      of "case_class_pattern":             scalaCaseClassPattern            
      of "case_clause":                    scalaCaseClause                  
      of "catch_clause":                   scalaCatchClause                 
      of "class_definition":               scalaClassDefinition             
      of "class_parameter":                scalaClassParameter              
      of "class_parameters":               scalaClassParameters             
      of "compilation_unit":               scalaCompilationUnit             
      of "compound_type":                  scalaCompoundType                
      of "context_bound":                  scalaContextBound                
      of "contravariant_type_parameter":   scalaContravariantTypeParameter  
      of "covariant_type_parameter":       scalaCovariantTypeParameter      
      of "do_while_expression":            scalaDoWhileExpression           
      of "enumerator":                     scalaEnumerator                  
      of "enumerators":                    scalaEnumerators                 
      of "extends_clause":                 scalaExtendsClause               
      of "field_expression":               scalaFieldExpression             
      of "finally_clause":                 scalaFinallyClause               
      of "for_expression":                 scalaForExpression               
      of "function_declaration":           scalaFunctionDeclaration         
      of "function_definition":            scalaFunctionDefinition          
      of "function_type":                  scalaFunctionType                
      of "generic_function":               scalaGenericFunction             
      of "generic_type":                   scalaGenericType                 
      of "guard":                          scalaGuard                       
      of "if_expression":                  scalaIfExpression                
      of "import_declaration":             scalaImportDeclaration           
      of "import_selectors":               scalaImportSelectors             
      of "infix_expression":               scalaInfixExpression             
      of "infix_pattern":                  scalaInfixPattern                
      of "infix_type":                     scalaInfixType                   
      of "instance_expression":            scalaInstanceExpression          
      of "interpolated_string":            scalaInterpolatedString          
      of "interpolated_string_expression": scalaInterpolatedStringExpression
      of "interpolation":                  scalaInterpolation               
      of "lambda_expression":              scalaLambdaExpression            
      of "lazy_parameter_type":            scalaLazyParameterType           
      of "lower_bound":                    scalaLowerBound                  
      of "match_expression":               scalaMatchExpression             
      of "modifiers":                      scalaModifiers                   
      of "object_definition":              scalaObjectDefinition            
      of "package_clause":                 scalaPackageClause               
      of "package_identifier":             scalaPackageIdentifier           
      of "package_object":                 scalaPackageObject               
      of "parameter":                      scalaParameter                   
      of "parameter_types":                scalaParameterTypes              
      of "parameters":                     scalaParameters                  
      of "parenthesized_expression":       scalaParenthesizedExpression     
      of "postfix_expression":             scalaPostfixExpression           
      of "prefix_expression":              scalaPrefixExpression            
      of "projected_type":                 scalaProjectedType               
      of "renamed_identifier":             scalaRenamedIdentifier           
      of "repeated_parameter_type":        scalaRepeatedParameterType       
      of "return_expression":              scalaReturnExpression            
      of "stable_identifier":              scalaStableIdentifier            
      of "stable_type_identifier":         scalaStableTypeIdentifier        
      of "string":                         scalaString                      
      of "template_body":                  scalaTemplateBody                
      of "throw_expression":               scalaThrowExpression             
      of "trait_definition":               scalaTraitDefinition             
      of "try_expression":                 scalaTryExpression               
      of "tuple_expression":               scalaTupleExpression             
      of "tuple_pattern":                  scalaTuplePattern                
      of "tuple_type":                     scalaTupleType                   
      of "type_arguments":                 scalaTypeArguments               
      of "type_definition":                scalaTypeDefinition              
      of "type_parameters":                scalaTypeParameters              
      of "typed_pattern":                  scalaTypedPattern                
      of "unit":                           scalaUnit                        
      of "upper_bound":                    scalaUpperBound                  
      of "val_declaration":                scalaValDeclaration              
      of "val_definition":                 scalaValDefinition               
      of "var_declaration":                scalaVarDeclaration              
      of "var_definition":                 scalaVarDefinition               
      of "view_bound":                     scalaViewBound                   
      of "while_expression":               scalaWhileExpression             
      of "!":                              scalaExclamationTok              
      of "#":                              scalaHashTok                     
      of "$":                              scalaDollarTok                   
      of "(":                              scalaLParTok                     
      of ")":                              scalaRParTok                     
      of "*":                              scalaAsteriskTok                 
      of "+":                              scalaPlusTok                     
      of ",":                              scalaCommaTok                    
      of "-":                              scalaMinusTok                    
      of ".":                              scalaDotTok                      
      of ":":                              scalaColonTok                    
      of ";":                              scalaSemicolonTok                
      of "<%":                             scalaLessThanPercentTok          
      of "<-":                             scalaLessThanMinusTok            
      of "<:":                             scalaLessThanColonTok            
      of "=":                              scalaEqualTok                    
      of "=>":                             scalaEqualGreaterThanTok         
      of ">:":                             scalaGreaterThanColonTok         
      of "@":                              scalaAtTok                       
      of "[":                              scalaLBrackTok                   
      of "]":                              scalaRBrackTok                   
      of "abstract":                       scalaAbstractTok                 
      of "case":                           scalaCaseTok                     
      of "catch":                          scalaCatchTok                    
      of "character_literal":              scalaCharacterLiteral            
      of "class":                          scalaClassTok                    
      of "comment":                        scalaComment                     
      of "def":                            scalaDefTok                      
      of "do":                             scalaDoTok                       
      of "else":                           scalaElseTok                     
      of "extends":                        scalaExtendsTok                  
      of "false":                          scalaFalseTok                    
      of "final":                          scalaFinalTok                    
      of "finally":                        scalaFinallyTok                  
      of "floating_point_literal":         scalaFloatingPointLiteral        
      of "for":                            scalaForTok                      
      of "identifier":                     scalaIdentifier                  
      of "if":                             scalaIfTok                       
      of "implicit":                       scalaImplicitTok                 
      of "import":                         scalaImportTok                   
      of "integer_literal":                scalaIntegerLiteral              
      of "lazy":                           scalaLazyTok                     
      of "match":                          scalaMatchTok                    
      of "new":                            scalaNewTok                      
      of "null_literal":                   scalaNullLiteral                 
      of "object":                         scalaObjectTok                   
      of "operator_identifier":            scalaOperatorIdentifier          
      of "override":                       scalaOverrideTok                 
      of "package":                        scalaPackageTok                  
      of "private":                        scalaPrivateTok                  
      of "protected":                      scalaProtectedTok                
      of "return":                         scalaReturnTok                   
      of "sealed":                         scalaSealedTok                   
      of "symbol_literal":                 scalaSymbolLiteral               
      of "throw":                          scalaThrowTok                    
      of "trait":                          scalaTraitTok                    
      of "true":                           scalaTrueTok                     
      of "try":                            scalaTryTok                      
      of "type":                           scalaTypeTok                     
      of "type_identifier":                scalaTypeIdentifier              
      of "val":                            scalaValTok                      
      of "var":                            scalaVarTok                      
      of "while":                          scalaWhileTok                    
      of "wildcard":                       scalaWildcard                    
      of "with":                           scalaWithTok                     
      of "yield":                          scalaYieldTok                    
      of "{":                              scalaLCurlyTok                   
      of "|":                              scalaPipeTok                     
      of "}":                              scalaRCurlyTok                   
      of "~":                              scalaTildeTok                    
      of "ERROR":                          scalaSyntaxError                 
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")
 

type
  ScalaNode* = HtsNode[TsScalaNode, ScalaNodeKind]
   
func isNil*(node: TsScalaNode): bool = 
  ts_node_is_null(TSNode(node))
 
func len*(node: TsScalaNode, unnamed: bool = false): int = 
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  
  else:
    int(ts_node_named_child_count(TSNode(node)))
  
 
func has*(node: TsScalaNode, idx: int, unnamed: bool = false): bool = 
  0 <= idx and idx < node.len(unnamed)
 
proc tree_sitter_scala(): PtsLanguage {.importc, cdecl.}
  
 
proc tsNodeType*(node: TsScalaNode): string = 
  $ts_node_type(TSNode(node))
 
proc newTsScalaParser*(): ScalaParser = 
  result = ScalaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_scala())
 
proc parseString*(parser: ScalaParser, str: string): TsScalaNode = 
  TsScalaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))
 
proc parseTsScalaString*(str: string): TsScalaNode = 
  let parser = newTsScalaParser()
  return parseString(parser, str)
 
func `$`*(node: TsScalaNode): string = 
  if isNil(node):
    "<nil tree>"
  
  else:
    $node.kind
  
 
func `[]`*(
    node: TsScalaNode,
    idx:  int,
    kind: ScalaNodeKind | set[ScalaNodeKind]
  ): TsScalaNode = 
  assert 0 <= idx and idx < node.len
  result = TsScalaNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)
 
proc treeReprTsScala*(str: string, unnamed: bool = false): ColoredText = 
  treeRepr[TsScalaNode, ScalaNodeKind](parseTsScalaString(str), str, 5, unnamed = unnamed)
 
proc toHtsNode*(
    node: TsScalaNode,
    str:  ptr string
  ): HtsNode[TsScalaNode, ScalaNodeKind] = 
  toHtsNode[TsScalaNode, ScalaNodeKind](node, str)
 
proc toHtsTree*(node: TsScalaNode, str: ptr string): ScalaNode = 
  toHtsNode[TsScalaNode, ScalaNodeKind](node, str)
 
proc parseScalaString*(str: ptr string, unnamed: bool = false): ScalaNode = 
  let parser = newTsScalaParser()
  return toHtsTree[TsScalaNode, ScalaNodeKind](parseString(parser, str[]), str)
 
proc parseScalaString*(str: string, unnamed: bool = false): ScalaNode = 
  let parser = newTsScalaParser()
  return toHtsTree[TsScalaNode, ScalaNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)
 

