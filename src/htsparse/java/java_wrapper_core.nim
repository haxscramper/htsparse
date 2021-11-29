import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  JavaNodeKind* = enum
    javaHidLiteral                             ## _literal
    javaHidSimpleType                          ## _simple_type
    javaHidType                                ## _type
    javaHidUnannotatedType                     ## _unannotated_type
    javaDeclaration                            ## declaration
    javaExpression                             ## expression
    javaPrimaryExpression                      ## primary_expression
    javaStatement                              ## statement
    javaAnnotatedType                          ## annotated_type
    javaAnnotation                             ## annotation
    javaAnnotationArgumentList                 ## annotation_argument_list
    javaAnnotationTypeBody                     ## annotation_type_body
    javaAnnotationTypeDeclaration              ## annotation_type_declaration
    javaAnnotationTypeElementDeclaration       ## annotation_type_element_declaration
    javaArgumentList                           ## argument_list
    javaArrayAccess                            ## array_access
    javaArrayCreationExpression                ## array_creation_expression
    javaArrayInitializer                       ## array_initializer
    javaArrayType                              ## array_type
    javaAssertStatement                        ## assert_statement
    javaAssignmentExpression                   ## assignment_expression
    javaAsterisk                               ## asterisk
    javaBinaryExpression                       ## binary_expression
    javaBlock                                  ## block
    javaBreakStatement                         ## break_statement
    javaCastExpression                         ## cast_expression
    javaCatchClause                            ## catch_clause
    javaCatchFormalParameter                   ## catch_formal_parameter
    javaCatchType                              ## catch_type
    javaClassBody                              ## class_body
    javaClassDeclaration                       ## class_declaration
    javaClassLiteral                           ## class_literal
    javaConstantDeclaration                    ## constant_declaration
    javaConstructorBody                        ## constructor_body
    javaConstructorDeclaration                 ## constructor_declaration
    javaContinueStatement                      ## continue_statement
    javaDimensions                             ## dimensions
    javaDimensionsExpr                         ## dimensions_expr
    javaDoStatement                            ## do_statement
    javaElementValueArrayInitializer           ## element_value_array_initializer
    javaElementValuePair                       ## element_value_pair
    javaEnhancedForStatement                   ## enhanced_for_statement
    javaEnumBody                               ## enum_body
    javaEnumBodyDeclarations                   ## enum_body_declarations
    javaEnumConstant                           ## enum_constant
    javaEnumDeclaration                        ## enum_declaration
    javaExplicitConstructorInvocation          ## explicit_constructor_invocation
    javaExpressionStatement                    ## expression_statement
    javaExtendsInterfaces                      ## extends_interfaces
    javaFieldAccess                            ## field_access
    javaFieldDeclaration                       ## field_declaration
    javaFinallyClause                          ## finally_clause
    javaFloatingPointType                      ## floating_point_type
    javaForStatement                           ## for_statement
    javaFormalParameter                        ## formal_parameter
    javaFormalParameters                       ## formal_parameters
    javaGenericType                            ## generic_type
    javaIfStatement                            ## if_statement
    javaImportDeclaration                      ## import_declaration
    javaInferredParameters                     ## inferred_parameters
    javaInstanceofExpression                   ## instanceof_expression
    javaIntegralType                           ## integral_type
    javaInterfaceBody                          ## interface_body
    javaInterfaceDeclaration                   ## interface_declaration
    javaInterfaceTypeList                      ## interface_type_list
    javaLabeledStatement                       ## labeled_statement
    javaLambdaExpression                       ## lambda_expression
    javaLocalVariableDeclaration               ## local_variable_declaration
    javaMarkerAnnotation                       ## marker_annotation
    javaMethodDeclaration                      ## method_declaration
    javaMethodInvocation                       ## method_invocation
    javaMethodReference                        ## method_reference
    javaModifiers                              ## modifiers
    javaModuleBody                             ## module_body
    javaModuleDeclaration                      ## module_declaration
    javaModuleDirective                        ## module_directive
    javaObjectCreationExpression               ## object_creation_expression
    javaPackageDeclaration                     ## package_declaration
    javaParenthesizedExpression                ## parenthesized_expression
    javaProgram                                ## program
    javaReceiverParameter                      ## receiver_parameter
    javaRecordDeclaration                      ## record_declaration
    javaRequiresModifier                       ## requires_modifier
    javaResource                               ## resource
    javaResourceSpecification                  ## resource_specification
    javaReturnStatement                        ## return_statement
    javaScopedIdentifier                       ## scoped_identifier
    javaScopedTypeIdentifier                   ## scoped_type_identifier
    javaSpreadParameter                        ## spread_parameter
    javaStaticInitializer                      ## static_initializer
    javaSuperInterfaces                        ## super_interfaces
    javaSuperclass                             ## superclass
    javaSwitchBlock                            ## switch_block
    javaSwitchBlockStatementGroup              ## switch_block_statement_group
    javaSwitchExpression                       ## switch_expression
    javaSwitchLabel                            ## switch_label
    javaSwitchRule                             ## switch_rule
    javaSynchronizedStatement                  ## synchronized_statement
    javaTernaryExpression                      ## ternary_expression
    javaThrowStatement                         ## throw_statement
    javaThrows                                 ## throws
    javaTryStatement                           ## try_statement
    javaTryWithResourcesStatement              ## try_with_resources_statement
    javaTypeArguments                          ## type_arguments
    javaTypeBound                              ## type_bound
    javaTypeParameter                          ## type_parameter
    javaTypeParameters                         ## type_parameters
    javaUnaryExpression                        ## unary_expression
    javaUpdateExpression                       ## update_expression
    javaVariableDeclarator                     ## variable_declarator
    javaWhileStatement                         ## while_statement
    javaWildcard                               ## wildcard
    javaYieldStatement                         ## yield_statement
    javaExclamationTok                         ## !
    javaExclamationEqualTok                    ## !=
    javaPercentTok                             ## %
    javaPercentEqualTok                        ## %=
    javaAmpersandTok                           ## &
    javaDoubleAmpersandTok                     ## &&
    javaAmpersandEqualTok                      ## &=
    javaLParTok                                ## (
    javaRParTok                                ## )
    javaAsteriskTok                            ## *
    javaAsteriskEqualTok                       ## *=
    javaPlusTok                                ## +
    javaDoublePlusTok                          ## ++
    javaPlusEqualTok                           ## +=
    javaCommaTok                               ## ,
    javaMinusTok                               ## -
    javaDoubleMinusTok                         ## --
    javaMinusEqualTok                          ## -=
    javaMinusGreaterThanTok                    ## ->
    javaDotTok                                 ## .
    javaTripleDotTok                           ## ...
    javaSlashTok                               ## /
    javaSlashEqualTok                          ## /=
    javaColonTok                               ## :
    javaDoubleColonTok                         ## ::
    javaSemicolonTok                           ## ;
    javaLessThanTok                            ## <
    javaDoubleLessThanTok                      ## <<
    javaDoubleLessThanEqualTok                 ## <<=
    javaLessThanEqualTok                       ## <=
    javaEqualTok                               ## =
    javaDoubleEqualTok                         ## ==
    javaGreaterThanTok                         ## >
    javaGreaterThanEqualTok                    ## >=
    javaDoubleGreaterThanTok                   ## >>
    javaDoubleGreaterThanEqualTok              ## >>=
    javaTripleGreaterThanTok                   ## >>>
    javaTripleGreaterThanEqualTok              ## >>>=
    javaQuestionTok                            ## ?
    javaAtTok                                  ## @
    javaAtinterfaceTok                         ## @interface
    javaLBrackTok                              ## [
    javaRBrackTok                              ## ]
    javaAccentTok                              ## ^
    javaAccentEqualTok                         ## ^=
    javaAbstractTok                            ## abstract
    javaAssertTok                              ## assert
    javaBinaryIntegerLiteral                   ## binary_integer_literal
    javaBooleanType                            ## boolean_type
    javaBreakTok                               ## break
    javaByteTok                                ## byte
    javaCaseTok                                ## case
    javaCatchTok                               ## catch
    javaCharTok                                ## char
    javaCharacterLiteral                       ## character_literal
    javaClassTok                               ## class
    javaComment                                ## comment
    javaContinueTok                            ## continue
    javaDecimalFloatingPointLiteral            ## decimal_floating_point_literal
    javaDecimalIntegerLiteral                  ## decimal_integer_literal
    javaDefaultTok                             ## default
    javaDoTok                                  ## do
    javaDoubleTok                              ## double
    javaElseTok                                ## else
    javaEnumTok                                ## enum
    javaExportsTok                             ## exports
    javaExtendsTok                             ## extends
    javaFalse                                  ## false
    javaFinalTok                               ## final
    javaFinallyTok                             ## finally
    javaFloatTok                               ## float
    javaForTok                                 ## for
    javaHexFloatingPointLiteral                ## hex_floating_point_literal
    javaHexIntegerLiteral                      ## hex_integer_literal
    javaIdentifier                             ## identifier
    javaIfTok                                  ## if
    javaImplementsTok                          ## implements
    javaImportTok                              ## import
    javaInstanceofTok                          ## instanceof
    javaIntTok                                 ## int
    javaInterfaceTok                           ## interface
    javaLongTok                                ## long
    javaModuleTok                              ## module
    javaNativeTok                              ## native
    javaNewTok                                 ## new
    javaNullLiteral                            ## null_literal
    javaOctalIntegerLiteral                    ## octal_integer_literal
    javaOpenTok                                ## open
    javaOpensTok                               ## opens
    javaPackageTok                             ## package
    javaPrivateTok                             ## private
    javaProtectedTok                           ## protected
    javaProvidesTok                            ## provides
    javaPublicTok                              ## public
    javaRecordTok                              ## record
    javaRequiresTok                            ## requires
    javaReturnTok                              ## return
    javaShortTok                               ## short
    javaStaticTok                              ## static
    javaStrictfpTok                            ## strictfp
    javaStringLiteral                          ## string_literal
    javaSuper                                  ## super
    javaSwitchTok                              ## switch
    javaSynchronizedTok                        ## synchronized
    javaThis                                   ## this
    javaThrowTok                               ## throw
    javaThrowsTok                              ## throws
    javaToTok                                  ## to
    javaTransientTok                           ## transient
    javaTransitiveTok                          ## transitive
    javaTrue                                   ## true
    javaTryTok                                 ## try
    javaTypeIdentifier                         ## type_identifier
    javaUsesTok                                ## uses
    javaVoidType                               ## void_type
    javaVolatileTok                            ## volatile
    javaWhileTok                               ## while
    javaWithTok                                ## with
    javaYieldTok                               ## yield
    javaLCurlyTok                              ## {
    javaPipeTok                                ## |
    javaPipeEqualTok                           ## |=
    javaDoublePipeTok                          ## ||
    javaRCurlyTok                              ## }
    javaTildeTok                               ## ~
    javaHidVariableInitializer                 ## _variable_initializer
    javaHidElementValue                        ## _element_value
    javaHidUnqualifiedObjectCreationExpression ## _unqualified_object_creation_expression
    javaHidWildcardBounds                      ## _wildcard_bounds
    javaHidVariableDeclaratorId                ## _variable_declarator_id
    javaHidMethodDeclarator                    ## _method_declarator
    javaHidClassBodyDeclaration                ## _class_body_declaration
    javaHidReservedIdentifier                  ## _reserved_identifier
    javaHidConstructorDeclarator               ## _constructor_declarator
    javaHidAnnotation                          ## _annotation
    javaHidVariableDeclaratorList              ## _variable_declarator_list
    javaHidName                                ## _name
    javaHidDefaultValue                        ## _default_value
    javaHidMethodHeader                        ## _method_header
    javaSyntaxError                            ## Tree-sitter parser syntax error

proc strRepr*(kind: JavaNodeKind): string =
  case kind:
    of javaHidLiteral:                             "_literal"
    of javaHidSimpleType:                          "_simple_type"
    of javaHidType:                                "_type"
    of javaHidUnannotatedType:                     "_unannotated_type"
    of javaDeclaration:                            "declaration"
    of javaExpression:                             "expression"
    of javaPrimaryExpression:                      "primary_expression"
    of javaStatement:                              "statement"
    of javaAnnotatedType:                          "annotated_type"
    of javaAnnotation:                             "annotation"
    of javaAnnotationArgumentList:                 "annotation_argument_list"
    of javaAnnotationTypeBody:                     "annotation_type_body"
    of javaAnnotationTypeDeclaration:              "annotation_type_declaration"
    of javaAnnotationTypeElementDeclaration:       "annotation_type_element_declaration"
    of javaArgumentList:                           "argument_list"
    of javaArrayAccess:                            "array_access"
    of javaArrayCreationExpression:                "array_creation_expression"
    of javaArrayInitializer:                       "array_initializer"
    of javaArrayType:                              "array_type"
    of javaAssertStatement:                        "assert_statement"
    of javaAssignmentExpression:                   "assignment_expression"
    of javaAsterisk:                               "asterisk"
    of javaBinaryExpression:                       "binary_expression"
    of javaBlock:                                  "block"
    of javaBreakStatement:                         "break_statement"
    of javaCastExpression:                         "cast_expression"
    of javaCatchClause:                            "catch_clause"
    of javaCatchFormalParameter:                   "catch_formal_parameter"
    of javaCatchType:                              "catch_type"
    of javaClassBody:                              "class_body"
    of javaClassDeclaration:                       "class_declaration"
    of javaClassLiteral:                           "class_literal"
    of javaConstantDeclaration:                    "constant_declaration"
    of javaConstructorBody:                        "constructor_body"
    of javaConstructorDeclaration:                 "constructor_declaration"
    of javaContinueStatement:                      "continue_statement"
    of javaDimensions:                             "dimensions"
    of javaDimensionsExpr:                         "dimensions_expr"
    of javaDoStatement:                            "do_statement"
    of javaElementValueArrayInitializer:           "element_value_array_initializer"
    of javaElementValuePair:                       "element_value_pair"
    of javaEnhancedForStatement:                   "enhanced_for_statement"
    of javaEnumBody:                               "enum_body"
    of javaEnumBodyDeclarations:                   "enum_body_declarations"
    of javaEnumConstant:                           "enum_constant"
    of javaEnumDeclaration:                        "enum_declaration"
    of javaExplicitConstructorInvocation:          "explicit_constructor_invocation"
    of javaExpressionStatement:                    "expression_statement"
    of javaExtendsInterfaces:                      "extends_interfaces"
    of javaFieldAccess:                            "field_access"
    of javaFieldDeclaration:                       "field_declaration"
    of javaFinallyClause:                          "finally_clause"
    of javaFloatingPointType:                      "floating_point_type"
    of javaForStatement:                           "for_statement"
    of javaFormalParameter:                        "formal_parameter"
    of javaFormalParameters:                       "formal_parameters"
    of javaGenericType:                            "generic_type"
    of javaIfStatement:                            "if_statement"
    of javaImportDeclaration:                      "import_declaration"
    of javaInferredParameters:                     "inferred_parameters"
    of javaInstanceofExpression:                   "instanceof_expression"
    of javaIntegralType:                           "integral_type"
    of javaInterfaceBody:                          "interface_body"
    of javaInterfaceDeclaration:                   "interface_declaration"
    of javaInterfaceTypeList:                      "interface_type_list"
    of javaLabeledStatement:                       "labeled_statement"
    of javaLambdaExpression:                       "lambda_expression"
    of javaLocalVariableDeclaration:               "local_variable_declaration"
    of javaMarkerAnnotation:                       "marker_annotation"
    of javaMethodDeclaration:                      "method_declaration"
    of javaMethodInvocation:                       "method_invocation"
    of javaMethodReference:                        "method_reference"
    of javaModifiers:                              "modifiers"
    of javaModuleBody:                             "module_body"
    of javaModuleDeclaration:                      "module_declaration"
    of javaModuleDirective:                        "module_directive"
    of javaObjectCreationExpression:               "object_creation_expression"
    of javaPackageDeclaration:                     "package_declaration"
    of javaParenthesizedExpression:                "parenthesized_expression"
    of javaProgram:                                "program"
    of javaReceiverParameter:                      "receiver_parameter"
    of javaRecordDeclaration:                      "record_declaration"
    of javaRequiresModifier:                       "requires_modifier"
    of javaResource:                               "resource"
    of javaResourceSpecification:                  "resource_specification"
    of javaReturnStatement:                        "return_statement"
    of javaScopedIdentifier:                       "scoped_identifier"
    of javaScopedTypeIdentifier:                   "scoped_type_identifier"
    of javaSpreadParameter:                        "spread_parameter"
    of javaStaticInitializer:                      "static_initializer"
    of javaSuperInterfaces:                        "super_interfaces"
    of javaSuperclass:                             "superclass"
    of javaSwitchBlock:                            "switch_block"
    of javaSwitchBlockStatementGroup:              "switch_block_statement_group"
    of javaSwitchExpression:                       "switch_expression"
    of javaSwitchLabel:                            "switch_label"
    of javaSwitchRule:                             "switch_rule"
    of javaSynchronizedStatement:                  "synchronized_statement"
    of javaTernaryExpression:                      "ternary_expression"
    of javaThrowStatement:                         "throw_statement"
    of javaThrows:                                 "throws"
    of javaTryStatement:                           "try_statement"
    of javaTryWithResourcesStatement:              "try_with_resources_statement"
    of javaTypeArguments:                          "type_arguments"
    of javaTypeBound:                              "type_bound"
    of javaTypeParameter:                          "type_parameter"
    of javaTypeParameters:                         "type_parameters"
    of javaUnaryExpression:                        "unary_expression"
    of javaUpdateExpression:                       "update_expression"
    of javaVariableDeclarator:                     "variable_declarator"
    of javaWhileStatement:                         "while_statement"
    of javaWildcard:                               "wildcard"
    of javaYieldStatement:                         "yield_statement"
    of javaExclamationTok:                         "!"
    of javaExclamationEqualTok:                    "!="
    of javaPercentTok:                             "%"
    of javaPercentEqualTok:                        "%="
    of javaAmpersandTok:                           "&"
    of javaDoubleAmpersandTok:                     "&&"
    of javaAmpersandEqualTok:                      "&="
    of javaLParTok:                                "("
    of javaRParTok:                                ")"
    of javaAsteriskTok:                            "*"
    of javaAsteriskEqualTok:                       "*="
    of javaPlusTok:                                "+"
    of javaDoublePlusTok:                          "++"
    of javaPlusEqualTok:                           "+="
    of javaCommaTok:                               ","
    of javaMinusTok:                               "-"
    of javaDoubleMinusTok:                         "--"
    of javaMinusEqualTok:                          "-="
    of javaMinusGreaterThanTok:                    "->"
    of javaDotTok:                                 "."
    of javaTripleDotTok:                           "..."
    of javaSlashTok:                               "/"
    of javaSlashEqualTok:                          "/="
    of javaColonTok:                               ":"
    of javaDoubleColonTok:                         "::"
    of javaSemicolonTok:                           ";"
    of javaLessThanTok:                            "<"
    of javaDoubleLessThanTok:                      "<<"
    of javaDoubleLessThanEqualTok:                 "<<="
    of javaLessThanEqualTok:                       "<="
    of javaEqualTok:                               "="
    of javaDoubleEqualTok:                         "=="
    of javaGreaterThanTok:                         ">"
    of javaGreaterThanEqualTok:                    ">="
    of javaDoubleGreaterThanTok:                   ">>"
    of javaDoubleGreaterThanEqualTok:              ">>="
    of javaTripleGreaterThanTok:                   ">>>"
    of javaTripleGreaterThanEqualTok:              ">>>="
    of javaQuestionTok:                            "?"
    of javaAtTok:                                  "@"
    of javaAtinterfaceTok:                         "@interface"
    of javaLBrackTok:                              "["
    of javaRBrackTok:                              "]"
    of javaAccentTok:                              "^"
    of javaAccentEqualTok:                         "^="
    of javaAbstractTok:                            "abstract"
    of javaAssertTok:                              "assert"
    of javaBinaryIntegerLiteral:                   "binary_integer_literal"
    of javaBooleanType:                            "boolean_type"
    of javaBreakTok:                               "break"
    of javaByteTok:                                "byte"
    of javaCaseTok:                                "case"
    of javaCatchTok:                               "catch"
    of javaCharTok:                                "char"
    of javaCharacterLiteral:                       "character_literal"
    of javaClassTok:                               "class"
    of javaComment:                                "comment"
    of javaContinueTok:                            "continue"
    of javaDecimalFloatingPointLiteral:            "decimal_floating_point_literal"
    of javaDecimalIntegerLiteral:                  "decimal_integer_literal"
    of javaDefaultTok:                             "default"
    of javaDoTok:                                  "do"
    of javaDoubleTok:                              "double"
    of javaElseTok:                                "else"
    of javaEnumTok:                                "enum"
    of javaExportsTok:                             "exports"
    of javaExtendsTok:                             "extends"
    of javaFalse:                                  "false"
    of javaFinalTok:                               "final"
    of javaFinallyTok:                             "finally"
    of javaFloatTok:                               "float"
    of javaForTok:                                 "for"
    of javaHexFloatingPointLiteral:                "hex_floating_point_literal"
    of javaHexIntegerLiteral:                      "hex_integer_literal"
    of javaIdentifier:                             "identifier"
    of javaIfTok:                                  "if"
    of javaImplementsTok:                          "implements"
    of javaImportTok:                              "import"
    of javaInstanceofTok:                          "instanceof"
    of javaIntTok:                                 "int"
    of javaInterfaceTok:                           "interface"
    of javaLongTok:                                "long"
    of javaModuleTok:                              "module"
    of javaNativeTok:                              "native"
    of javaNewTok:                                 "new"
    of javaNullLiteral:                            "null_literal"
    of javaOctalIntegerLiteral:                    "octal_integer_literal"
    of javaOpenTok:                                "open"
    of javaOpensTok:                               "opens"
    of javaPackageTok:                             "package"
    of javaPrivateTok:                             "private"
    of javaProtectedTok:                           "protected"
    of javaProvidesTok:                            "provides"
    of javaPublicTok:                              "public"
    of javaRecordTok:                              "record"
    of javaRequiresTok:                            "requires"
    of javaReturnTok:                              "return"
    of javaShortTok:                               "short"
    of javaStaticTok:                              "static"
    of javaStrictfpTok:                            "strictfp"
    of javaStringLiteral:                          "string_literal"
    of javaSuper:                                  "super"
    of javaSwitchTok:                              "switch"
    of javaSynchronizedTok:                        "synchronized"
    of javaThis:                                   "this"
    of javaThrowTok:                               "throw"
    of javaThrowsTok:                              "throws"
    of javaToTok:                                  "to"
    of javaTransientTok:                           "transient"
    of javaTransitiveTok:                          "transitive"
    of javaTrue:                                   "true"
    of javaTryTok:                                 "try"
    of javaTypeIdentifier:                         "type_identifier"
    of javaUsesTok:                                "uses"
    of javaVoidType:                               "void_type"
    of javaVolatileTok:                            "volatile"
    of javaWhileTok:                               "while"
    of javaWithTok:                                "with"
    of javaYieldTok:                               "yield"
    of javaLCurlyTok:                              "{"
    of javaPipeTok:                                "|"
    of javaPipeEqualTok:                           "|="
    of javaDoublePipeTok:                          "||"
    of javaRCurlyTok:                              "}"
    of javaTildeTok:                               "~"
    of javaHidVariableInitializer:                 "_variable_initializer"
    of javaHidElementValue:                        "_element_value"
    of javaHidUnqualifiedObjectCreationExpression: "_unqualified_object_creation_expression"
    of javaHidWildcardBounds:                      "_wildcard_bounds"
    of javaHidVariableDeclaratorId:                "_variable_declarator_id"
    of javaHidMethodDeclarator:                    "_method_declarator"
    of javaHidClassBodyDeclaration:                "_class_body_declaration"
    of javaHidReservedIdentifier:                  "_reserved_identifier"
    of javaHidConstructorDeclarator:               "_constructor_declarator"
    of javaHidAnnotation:                          "_annotation"
    of javaHidVariableDeclaratorList:              "_variable_declarator_list"
    of javaHidName:                                "_name"
    of javaHidDefaultValue:                        "_default_value"
    of javaHidMethodHeader:                        "_method_header"
    of javaSyntaxError:                            "ERROR"

type
  TsJavaNode* = distinct TSNode

type
  JavaParser* = distinct PtsParser

const javaAllowedSubnodes*: array[JavaNodeKind, set[JavaNodeKind]] = block:
                                                                       var tmp: array[JavaNodeKind, set[JavaNodeKind]]
                                                                       tmp[javaAnnotatedType] = {javaHidUnannotatedType, javaAnnotation, javaMarkerAnnotation}
                                                                       tmp[javaAnnotationArgumentList] = {javaAnnotation, javaElementValueArrayInitializer, javaElementValuePair, javaExpression, javaMarkerAnnotation}
                                                                       tmp[javaAnnotationTypeBody] = {javaAnnotationTypeDeclaration, javaAnnotationTypeElementDeclaration, javaClassDeclaration, javaConstantDeclaration, javaInterfaceDeclaration}
                                                                       tmp[javaAnnotationTypeDeclaration] = {javaModifiers}
                                                                       tmp[javaAnnotationTypeElementDeclaration] = {javaModifiers}
                                                                       tmp[javaArgumentList] = {javaExpression}
                                                                       tmp[javaArrayInitializer] = {javaArrayInitializer, javaExpression}
                                                                       tmp[javaAssertStatement] = {javaExpression}
                                                                       tmp[javaBlock] = {javaStatement}
                                                                       tmp[javaBreakStatement] = {javaIdentifier}
                                                                       tmp[javaCatchClause] = {javaCatchFormalParameter}
                                                                       tmp[javaCatchFormalParameter] = {javaCatchType, javaModifiers}
                                                                       tmp[javaCatchType] = {javaHidUnannotatedType}
                                                                       tmp[javaClassBody] = {
                                                                                              javaAnnotationTypeDeclaration,
                                                                                              javaBlock,
                                                                                              javaClassDeclaration,
                                                                                              javaConstructorDeclaration,
                                                                                              javaEnumDeclaration,
                                                                                              javaFieldDeclaration,
                                                                                              javaInterfaceDeclaration,
                                                                                              javaMethodDeclaration,
                                                                                              javaRecordDeclaration,
                                                                                              javaStaticInitializer
                                                                                            }
                                                                       tmp[javaClassDeclaration] = {javaModifiers}
                                                                       tmp[javaClassLiteral] = {javaHidUnannotatedType}
                                                                       tmp[javaConstantDeclaration] = {javaModifiers}
                                                                       tmp[javaConstructorBody] = {javaExplicitConstructorInvocation, javaStatement}
                                                                       tmp[javaConstructorDeclaration] = {javaModifiers, javaThrows}
                                                                       tmp[javaContinueStatement] = {javaIdentifier}
                                                                       tmp[javaDimensions] = {javaAnnotation, javaMarkerAnnotation}
                                                                       tmp[javaDimensionsExpr] = {javaAnnotation, javaExpression, javaMarkerAnnotation}
                                                                       tmp[javaElementValueArrayInitializer] = {javaAnnotation, javaElementValueArrayInitializer, javaExpression, javaMarkerAnnotation}
                                                                       tmp[javaEnhancedForStatement] = {javaModifiers}
                                                                       tmp[javaEnumBody] = {javaEnumBodyDeclarations, javaEnumConstant}
                                                                       tmp[javaEnumBodyDeclarations] = {
                                                                                                         javaAnnotationTypeDeclaration,
                                                                                                         javaBlock,
                                                                                                         javaClassDeclaration,
                                                                                                         javaConstructorDeclaration,
                                                                                                         javaEnumDeclaration,
                                                                                                         javaFieldDeclaration,
                                                                                                         javaInterfaceDeclaration,
                                                                                                         javaMethodDeclaration,
                                                                                                         javaRecordDeclaration,
                                                                                                         javaStaticInitializer
                                                                                                       }
                                                                       tmp[javaEnumConstant] = {javaModifiers}
                                                                       tmp[javaEnumDeclaration] = {javaModifiers}
                                                                       tmp[javaExpressionStatement] = {javaExpression}
                                                                       tmp[javaExtendsInterfaces] = {javaInterfaceTypeList}
                                                                       tmp[javaFieldAccess] = {javaSuper}
                                                                       tmp[javaFieldDeclaration] = {javaModifiers}
                                                                       tmp[javaFinallyClause] = {javaBlock}
                                                                       tmp[javaFormalParameter] = {javaModifiers}
                                                                       tmp[javaFormalParameters] = {javaFormalParameter, javaReceiverParameter, javaSpreadParameter}
                                                                       tmp[javaGenericType] = {javaScopedTypeIdentifier, javaTypeArguments, javaTypeIdentifier}
                                                                       tmp[javaImportDeclaration] = {javaAsterisk, javaIdentifier, javaScopedIdentifier}
                                                                       tmp[javaInferredParameters] = {javaIdentifier}
                                                                       tmp[javaInterfaceBody] = {javaAnnotationTypeDeclaration, javaClassDeclaration, javaConstantDeclaration, javaEnumDeclaration, javaInterfaceDeclaration, javaMethodDeclaration}
                                                                       tmp[javaInterfaceDeclaration] = {javaExtendsInterfaces, javaModifiers}
                                                                       tmp[javaInterfaceTypeList] = {javaHidType}
                                                                       tmp[javaLabeledStatement] = {javaIdentifier, javaStatement}
                                                                       tmp[javaLocalVariableDeclaration] = {javaModifiers}
                                                                       tmp[javaMethodDeclaration] = {javaAnnotation, javaMarkerAnnotation, javaModifiers, javaThrows}
                                                                       tmp[javaMethodInvocation] = {javaSuper}
                                                                       tmp[javaMethodReference] = {javaHidType, javaPrimaryExpression, javaSuper, javaTypeArguments}
                                                                       tmp[javaModifiers] = {javaAnnotation, javaMarkerAnnotation}
                                                                       tmp[javaModuleBody] = {javaModuleDirective}
                                                                       tmp[javaModuleDeclaration] = {javaAnnotation, javaMarkerAnnotation}
                                                                       tmp[javaModuleDirective] = {javaIdentifier, javaRequiresModifier, javaScopedIdentifier}
                                                                       tmp[javaObjectCreationExpression] = {javaClassBody, javaPrimaryExpression}
                                                                       tmp[javaPackageDeclaration] = {javaAnnotation, javaIdentifier, javaMarkerAnnotation, javaScopedIdentifier}
                                                                       tmp[javaParenthesizedExpression] = {javaExpression}
                                                                       tmp[javaProgram] = {javaStatement}
                                                                       tmp[javaReceiverParameter] = {javaHidUnannotatedType, javaAnnotation, javaIdentifier, javaMarkerAnnotation, javaThis}
                                                                       tmp[javaRecordDeclaration] = {javaModifiers}
                                                                       tmp[javaResource] = {javaFieldAccess, javaIdentifier, javaModifiers}
                                                                       tmp[javaResourceSpecification] = {javaResource}
                                                                       tmp[javaReturnStatement] = {javaExpression}
                                                                       tmp[javaScopedTypeIdentifier] = {javaAnnotation, javaGenericType, javaMarkerAnnotation, javaScopedTypeIdentifier, javaTypeIdentifier}
                                                                       tmp[javaSpreadParameter] = {javaHidUnannotatedType, javaModifiers, javaVariableDeclarator}
                                                                       tmp[javaStaticInitializer] = {javaBlock}
                                                                       tmp[javaSuperInterfaces] = {javaInterfaceTypeList}
                                                                       tmp[javaSuperclass] = {javaHidType}
                                                                       tmp[javaSwitchBlock] = {javaSwitchBlockStatementGroup, javaSwitchRule}
                                                                       tmp[javaSwitchBlockStatementGroup] = {javaStatement, javaSwitchLabel}
                                                                       tmp[javaSwitchLabel] = {javaExpression}
                                                                       tmp[javaSwitchRule] = {javaBlock, javaExpressionStatement, javaSwitchLabel, javaThrowStatement}
                                                                       tmp[javaSynchronizedStatement] = {javaParenthesizedExpression}
                                                                       tmp[javaThrowStatement] = {javaExpression}
                                                                       tmp[javaThrows] = {javaHidType}
                                                                       tmp[javaTryStatement] = {javaCatchClause, javaFinallyClause}
                                                                       tmp[javaTryWithResourcesStatement] = {javaCatchClause, javaFinallyClause}
                                                                       tmp[javaTypeArguments] = {javaHidType, javaWildcard}
                                                                       tmp[javaTypeBound] = {javaHidType}
                                                                       tmp[javaTypeParameter] = {javaAnnotation, javaIdentifier, javaMarkerAnnotation, javaTypeBound}
                                                                       tmp[javaTypeParameters] = {javaTypeParameter}
                                                                       tmp[javaUpdateExpression] = {javaExpression}
                                                                       tmp[javaWildcard] = {javaHidType, javaAnnotation, javaMarkerAnnotation, javaSuper}
                                                                       tmp[javaYieldStatement] = {javaExpression}
                                                                       tmp
const javaTokenKinds*: set[JavaNodeKind] = {
                                             javaExclamationTok,
                                             javaExclamationEqualTok,
                                             javaPercentTok,
                                             javaPercentEqualTok,
                                             javaAmpersandTok,
                                             javaDoubleAmpersandTok,
                                             javaAmpersandEqualTok,
                                             javaLParTok,
                                             javaRParTok,
                                             javaAsteriskTok,
                                             javaAsteriskEqualTok,
                                             javaPlusTok,
                                             javaDoublePlusTok,
                                             javaPlusEqualTok,
                                             javaCommaTok,
                                             javaMinusTok,
                                             javaDoubleMinusTok,
                                             javaMinusEqualTok,
                                             javaMinusGreaterThanTok,
                                             javaDotTok,
                                             javaTripleDotTok,
                                             javaSlashTok,
                                             javaSlashEqualTok,
                                             javaColonTok,
                                             javaDoubleColonTok,
                                             javaSemicolonTok,
                                             javaLessThanTok,
                                             javaDoubleLessThanTok,
                                             javaDoubleLessThanEqualTok,
                                             javaLessThanEqualTok,
                                             javaEqualTok,
                                             javaDoubleEqualTok,
                                             javaGreaterThanTok,
                                             javaGreaterThanEqualTok,
                                             javaDoubleGreaterThanTok,
                                             javaDoubleGreaterThanEqualTok,
                                             javaTripleGreaterThanTok,
                                             javaTripleGreaterThanEqualTok,
                                             javaQuestionTok,
                                             javaAtTok,
                                             javaAtinterfaceTok,
                                             javaLBrackTok,
                                             javaRBrackTok,
                                             javaAccentTok,
                                             javaAccentEqualTok,
                                             javaAbstractTok,
                                             javaAssertTok,
                                             javaBreakTok,
                                             javaByteTok,
                                             javaCaseTok,
                                             javaCatchTok,
                                             javaCharTok,
                                             javaClassTok,
                                             javaContinueTok,
                                             javaDefaultTok,
                                             javaDoTok,
                                             javaDoubleTok,
                                             javaElseTok,
                                             javaEnumTok,
                                             javaExportsTok,
                                             javaExtendsTok,
                                             javaFinalTok,
                                             javaFinallyTok,
                                             javaFloatTok,
                                             javaForTok,
                                             javaIfTok,
                                             javaImplementsTok,
                                             javaImportTok,
                                             javaInstanceofTok,
                                             javaIntTok,
                                             javaInterfaceTok,
                                             javaLongTok,
                                             javaModuleTok,
                                             javaNativeTok,
                                             javaNewTok,
                                             javaOpenTok,
                                             javaOpensTok,
                                             javaPackageTok,
                                             javaPrivateTok,
                                             javaProtectedTok,
                                             javaProvidesTok,
                                             javaPublicTok,
                                             javaRecordTok,
                                             javaRequiresTok,
                                             javaReturnTok,
                                             javaShortTok,
                                             javaStaticTok,
                                             javaStrictfpTok,
                                             javaSwitchTok,
                                             javaSynchronizedTok,
                                             javaThrowTok,
                                             javaThrowsTok,
                                             javaToTok,
                                             javaTransientTok,
                                             javaTransitiveTok,
                                             javaTryTok,
                                             javaUsesTok,
                                             javaVolatileTok,
                                             javaWhileTok,
                                             javaWithTok,
                                             javaYieldTok,
                                             javaLCurlyTok,
                                             javaPipeTok,
                                             javaPipeEqualTok,
                                             javaDoublePipeTok,
                                             javaRCurlyTok,
                                             javaTildeTok
                                           }
const javaHiddenKinds*: set[JavaNodeKind] = {
                                              javaHidLiteral,
                                              javaHidVariableInitializer,
                                              javaHidElementValue,
                                              javaHidSimpleType,
                                              javaHidUnqualifiedObjectCreationExpression,
                                              javaHidWildcardBounds,
                                              javaHidType,
                                              javaHidVariableDeclaratorId,
                                              javaHidMethodDeclarator,
                                              javaHidClassBodyDeclaration,
                                              javaHidReservedIdentifier,
                                              javaHidConstructorDeclarator,
                                              javaHidAnnotation,
                                              javaHidVariableDeclaratorList,
                                              javaHidName,
                                              javaHidDefaultValue,
                                              javaHidMethodHeader,
                                              javaHidUnannotatedType
                                            }
proc tsNodeType*(node: TsJavaNode): string


proc kind*(node: TsJavaNode): JavaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_literal":                            javaHidLiteral
      of "_simple_type":                        javaHidSimpleType
      of "_type":                               javaHidType
      of "_unannotated_type":                   javaHidUnannotatedType
      of "declaration":                         javaDeclaration
      of "expression":                          javaExpression
      of "primary_expression":                  javaPrimaryExpression
      of "statement":                           javaStatement
      of "annotated_type":                      javaAnnotatedType
      of "annotation":                          javaAnnotation
      of "annotation_argument_list":            javaAnnotationArgumentList
      of "annotation_type_body":                javaAnnotationTypeBody
      of "annotation_type_declaration":         javaAnnotationTypeDeclaration
      of "annotation_type_element_declaration": javaAnnotationTypeElementDeclaration
      of "argument_list":                       javaArgumentList
      of "array_access":                        javaArrayAccess
      of "array_creation_expression":           javaArrayCreationExpression
      of "array_initializer":                   javaArrayInitializer
      of "array_type":                          javaArrayType
      of "assert_statement":                    javaAssertStatement
      of "assignment_expression":               javaAssignmentExpression
      of "asterisk":                            javaAsterisk
      of "binary_expression":                   javaBinaryExpression
      of "block":                               javaBlock
      of "break_statement":                     javaBreakStatement
      of "cast_expression":                     javaCastExpression
      of "catch_clause":                        javaCatchClause
      of "catch_formal_parameter":              javaCatchFormalParameter
      of "catch_type":                          javaCatchType
      of "class_body":                          javaClassBody
      of "class_declaration":                   javaClassDeclaration
      of "class_literal":                       javaClassLiteral
      of "constant_declaration":                javaConstantDeclaration
      of "constructor_body":                    javaConstructorBody
      of "constructor_declaration":             javaConstructorDeclaration
      of "continue_statement":                  javaContinueStatement
      of "dimensions":                          javaDimensions
      of "dimensions_expr":                     javaDimensionsExpr
      of "do_statement":                        javaDoStatement
      of "element_value_array_initializer":     javaElementValueArrayInitializer
      of "element_value_pair":                  javaElementValuePair
      of "enhanced_for_statement":              javaEnhancedForStatement
      of "enum_body":                           javaEnumBody
      of "enum_body_declarations":              javaEnumBodyDeclarations
      of "enum_constant":                       javaEnumConstant
      of "enum_declaration":                    javaEnumDeclaration
      of "explicit_constructor_invocation":     javaExplicitConstructorInvocation
      of "expression_statement":                javaExpressionStatement
      of "extends_interfaces":                  javaExtendsInterfaces
      of "field_access":                        javaFieldAccess
      of "field_declaration":                   javaFieldDeclaration
      of "finally_clause":                      javaFinallyClause
      of "floating_point_type":                 javaFloatingPointType
      of "for_statement":                       javaForStatement
      of "formal_parameter":                    javaFormalParameter
      of "formal_parameters":                   javaFormalParameters
      of "generic_type":                        javaGenericType
      of "if_statement":                        javaIfStatement
      of "import_declaration":                  javaImportDeclaration
      of "inferred_parameters":                 javaInferredParameters
      of "instanceof_expression":               javaInstanceofExpression
      of "integral_type":                       javaIntegralType
      of "interface_body":                      javaInterfaceBody
      of "interface_declaration":               javaInterfaceDeclaration
      of "interface_type_list":                 javaInterfaceTypeList
      of "labeled_statement":                   javaLabeledStatement
      of "lambda_expression":                   javaLambdaExpression
      of "local_variable_declaration":          javaLocalVariableDeclaration
      of "marker_annotation":                   javaMarkerAnnotation
      of "method_declaration":                  javaMethodDeclaration
      of "method_invocation":                   javaMethodInvocation
      of "method_reference":                    javaMethodReference
      of "modifiers":                           javaModifiers
      of "module_body":                         javaModuleBody
      of "module_declaration":                  javaModuleDeclaration
      of "module_directive":                    javaModuleDirective
      of "object_creation_expression":          javaObjectCreationExpression
      of "package_declaration":                 javaPackageDeclaration
      of "parenthesized_expression":            javaParenthesizedExpression
      of "program":                             javaProgram
      of "receiver_parameter":                  javaReceiverParameter
      of "record_declaration":                  javaRecordDeclaration
      of "requires_modifier":                   javaRequiresModifier
      of "resource":                            javaResource
      of "resource_specification":              javaResourceSpecification
      of "return_statement":                    javaReturnStatement
      of "scoped_identifier":                   javaScopedIdentifier
      of "scoped_type_identifier":              javaScopedTypeIdentifier
      of "spread_parameter":                    javaSpreadParameter
      of "static_initializer":                  javaStaticInitializer
      of "super_interfaces":                    javaSuperInterfaces
      of "superclass":                          javaSuperclass
      of "switch_block":                        javaSwitchBlock
      of "switch_block_statement_group":        javaSwitchBlockStatementGroup
      of "switch_expression":                   javaSwitchExpression
      of "switch_label":                        javaSwitchLabel
      of "switch_rule":                         javaSwitchRule
      of "synchronized_statement":              javaSynchronizedStatement
      of "ternary_expression":                  javaTernaryExpression
      of "throw_statement":                     javaThrowStatement
      of "throws":                              javaThrows
      of "try_statement":                       javaTryStatement
      of "try_with_resources_statement":        javaTryWithResourcesStatement
      of "type_arguments":                      javaTypeArguments
      of "type_bound":                          javaTypeBound
      of "type_parameter":                      javaTypeParameter
      of "type_parameters":                     javaTypeParameters
      of "unary_expression":                    javaUnaryExpression
      of "update_expression":                   javaUpdateExpression
      of "variable_declarator":                 javaVariableDeclarator
      of "while_statement":                     javaWhileStatement
      of "wildcard":                            javaWildcard
      of "yield_statement":                     javaYieldStatement
      of "!":                                   javaExclamationTok
      of "!=":                                  javaExclamationEqualTok
      of "%":                                   javaPercentTok
      of "%=":                                  javaPercentEqualTok
      of "&":                                   javaAmpersandTok
      of "&&":                                  javaDoubleAmpersandTok
      of "&=":                                  javaAmpersandEqualTok
      of "(":                                   javaLParTok
      of ")":                                   javaRParTok
      of "*":                                   javaAsteriskTok
      of "*=":                                  javaAsteriskEqualTok
      of "+":                                   javaPlusTok
      of "++":                                  javaDoublePlusTok
      of "+=":                                  javaPlusEqualTok
      of ",":                                   javaCommaTok
      of "-":                                   javaMinusTok
      of "--":                                  javaDoubleMinusTok
      of "-=":                                  javaMinusEqualTok
      of "->":                                  javaMinusGreaterThanTok
      of ".":                                   javaDotTok
      of "...":                                 javaTripleDotTok
      of "/":                                   javaSlashTok
      of "/=":                                  javaSlashEqualTok
      of ":":                                   javaColonTok
      of "::":                                  javaDoubleColonTok
      of ";":                                   javaSemicolonTok
      of "<":                                   javaLessThanTok
      of "<<":                                  javaDoubleLessThanTok
      of "<<=":                                 javaDoubleLessThanEqualTok
      of "<=":                                  javaLessThanEqualTok
      of "=":                                   javaEqualTok
      of "==":                                  javaDoubleEqualTok
      of ">":                                   javaGreaterThanTok
      of ">=":                                  javaGreaterThanEqualTok
      of ">>":                                  javaDoubleGreaterThanTok
      of ">>=":                                 javaDoubleGreaterThanEqualTok
      of ">>>":                                 javaTripleGreaterThanTok
      of ">>>=":                                javaTripleGreaterThanEqualTok
      of "?":                                   javaQuestionTok
      of "@":                                   javaAtTok
      of "@interface":                          javaAtinterfaceTok
      of "[":                                   javaLBrackTok
      of "]":                                   javaRBrackTok
      of "^":                                   javaAccentTok
      of "^=":                                  javaAccentEqualTok
      of "abstract":                            javaAbstractTok
      of "assert":                              javaAssertTok
      of "binary_integer_literal":              javaBinaryIntegerLiteral
      of "boolean_type":                        javaBooleanType
      of "break":                               javaBreakTok
      of "byte":                                javaByteTok
      of "case":                                javaCaseTok
      of "catch":                               javaCatchTok
      of "char":                                javaCharTok
      of "character_literal":                   javaCharacterLiteral
      of "class":                               javaClassTok
      of "comment":                             javaComment
      of "continue":                            javaContinueTok
      of "decimal_floating_point_literal":      javaDecimalFloatingPointLiteral
      of "decimal_integer_literal":             javaDecimalIntegerLiteral
      of "default":                             javaDefaultTok
      of "do":                                  javaDoTok
      of "double":                              javaDoubleTok
      of "else":                                javaElseTok
      of "enum":                                javaEnumTok
      of "exports":                             javaExportsTok
      of "extends":                             javaExtendsTok
      of "false":                               javaFalse
      of "final":                               javaFinalTok
      of "finally":                             javaFinallyTok
      of "float":                               javaFloatTok
      of "for":                                 javaForTok
      of "hex_floating_point_literal":          javaHexFloatingPointLiteral
      of "hex_integer_literal":                 javaHexIntegerLiteral
      of "identifier":                          javaIdentifier
      of "if":                                  javaIfTok
      of "implements":                          javaImplementsTok
      of "import":                              javaImportTok
      of "instanceof":                          javaInstanceofTok
      of "int":                                 javaIntTok
      of "interface":                           javaInterfaceTok
      of "long":                                javaLongTok
      of "module":                              javaModuleTok
      of "native":                              javaNativeTok
      of "new":                                 javaNewTok
      of "null_literal":                        javaNullLiteral
      of "octal_integer_literal":               javaOctalIntegerLiteral
      of "open":                                javaOpenTok
      of "opens":                               javaOpensTok
      of "package":                             javaPackageTok
      of "private":                             javaPrivateTok
      of "protected":                           javaProtectedTok
      of "provides":                            javaProvidesTok
      of "public":                              javaPublicTok
      of "record":                              javaRecordTok
      of "requires":                            javaRequiresTok
      of "return":                              javaReturnTok
      of "short":                               javaShortTok
      of "static":                              javaStaticTok
      of "strictfp":                            javaStrictfpTok
      of "string_literal":                      javaStringLiteral
      of "super":                               javaSuper
      of "switch":                              javaSwitchTok
      of "synchronized":                        javaSynchronizedTok
      of "this":                                javaThis
      of "throw":                               javaThrowTok
      of "to":                                  javaToTok
      of "transient":                           javaTransientTok
      of "transitive":                          javaTransitiveTok
      of "true":                                javaTrue
      of "try":                                 javaTryTok
      of "type_identifier":                     javaTypeIdentifier
      of "uses":                                javaUsesTok
      of "void_type":                           javaVoidType
      of "volatile":                            javaVolatileTok
      of "while":                               javaWhileTok
      of "with":                                javaWithTok
      of "yield":                               javaYieldTok
      of "{":                                   javaLCurlyTok
      of "|":                                   javaPipeTok
      of "|=":                                  javaPipeEqualTok
      of "||":                                  javaDoublePipeTok
      of "}":                                   javaRCurlyTok
      of "~":                                   javaTildeTok
      of "ERROR":                               javaSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsJavaNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsJavaNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsJavaNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_java(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsJavaNode): string =
  $ts_node_type(TSNode(node))

proc newTsJavaParser*(): JavaParser =
  result = JavaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_java())

proc parseString*(parser: JavaParser, str: string): TsJavaNode =
  TsJavaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsJavaString*(str: string): TsJavaNode =
  let parser = newTsJavaParser()
  return parseString(parser, str)

func `$`*(node: TsJavaNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsJavaNode, str: string): string =
  var res = addr result
  proc aux(node: TsJavaNode, level: int) =
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
let javaGrammar*: array[JavaNodeKind, HtsRule[JavaNodeKind]] = block:
                                                                 var rules: array[JavaNodeKind, HtsRule[JavaNodeKind]]
                                                                 type
                                                                   K = JavaNodeKind


                                                                 rules[javaSwitchRule] = tsSeq[K](tsSymbol[K](javaSwitchLabel), tsString[K]("->"), tsChoice[K](tsSymbol[K](javaExpressionStatement), tsSymbol[K](javaThrowStatement), tsSymbol[K](javaBlock)))
                                                                 rules[javaFormalParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorId))
                                                                 rules[javaCharacterLiteral] = tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\\\\\'\\n]"), tsRegex[K]("\\\\."), tsRegex[K]("\\\\\\n"))), tsString[K]("\'"))
                                                                 rules[javaInferredParameters] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](javaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaIdentifier)))), tsString[K](")"))
                                                                 rules[javaTypeParameters] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsSymbol[K](javaTypeParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaTypeParameter)))), tsString[K](">"))
                                                                 rules[javaInstanceofExpression] = tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("instanceof"), tsSymbol[K](javaHidType))
                                                                 rules[javaAsterisk] = tsString[K]("*")
                                                                 rules[javaAnnotationTypeDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsString[K]("@interface"), tsSymbol[K](javaIdentifier), tsSymbol[K](javaAnnotationTypeBody))
                                                                 rules[javaArrayInitializer] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](javaHidVariableInitializer), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidVariableInitializer)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[javaScopedTypeIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaScopedTypeIdentifier), tsSymbol[K](javaGenericType)), tsString[K]("."), tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsSymbol[K](javaIdentifier))
                                                                 rules[javaHidWildcardBounds] = tsChoice[K](tsSeq[K](tsString[K]("extends"), tsSymbol[K](javaHidType)), tsSeq[K](tsSymbol[K](javaSuper), tsSymbol[K](javaHidType)))
                                                                 rules[javaExtendsInterfaces] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](javaInterfaceTypeList))
                                                                 rules[javaPrimaryExpression] = tsChoice[K](tsSymbol[K](javaHidLiteral), tsSymbol[K](javaClassLiteral), tsSymbol[K](javaThis), tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier), tsSymbol[K](javaParenthesizedExpression), tsSymbol[K](javaObjectCreationExpression), tsSymbol[K](javaFieldAccess), tsSymbol[K](javaArrayAccess), tsSymbol[K](javaMethodInvocation), tsSymbol[K](javaMethodReference), tsSymbol[K](javaArrayCreationExpression))
                                                                 rules[javaThrows] = tsSeq[K](tsString[K]("throws"), tsSeq[K](tsSymbol[K](javaHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidType)))))
                                                                 rules[javaLambdaExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaFormalParameters), tsSymbol[K](javaInferredParameters)), tsString[K]("->"), tsChoice[K](tsSymbol[K](javaExpression), tsSymbol[K](javaBlock)))
                                                                 rules[javaReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](javaExpression), tsBlank[K]()), tsString[K](";"))
                                                                 rules[javaFalse] = tsString[K]("false")
                                                                 rules[javaConstructorBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](javaExplicitConstructorInvocation), tsBlank[K]()), tsRepeat[K](tsSymbol[K](javaStatement)), tsString[K]("}"))
                                                                 rules[javaForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsSymbol[K](javaLocalVariableDeclaration), tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](javaExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaExpression)))), tsBlank[K]()), tsString[K](";"))), tsChoice[K](tsSymbol[K](javaExpression), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSeq[K](tsSymbol[K](javaExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaExpression)))), tsBlank[K]()), tsString[K](")"), tsSymbol[K](javaStatement))
                                                                 rules[javaResource] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorId), tsString[K]("="), tsSymbol[K](javaExpression)), tsSymbol[K](javaIdentifier), tsSymbol[K](javaFieldAccess))
                                                                 rules[javaAnnotationTypeElementDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaIdentifier), tsString[K]("("), tsString[K](")"), tsChoice[K](tsSymbol[K](javaDimensions), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaHidDefaultValue), tsBlank[K]()), tsString[K](";"))
                                                                 rules[javaMethodReference] = tsSeq[K](tsChoice[K](tsSymbol[K](javaHidType), tsSymbol[K](javaPrimaryExpression), tsSymbol[K](javaSuper)), tsString[K]("::"), tsChoice[K](tsSymbol[K](javaTypeArguments), tsBlank[K]()), tsChoice[K](tsString[K]("new"), tsSymbol[K](javaIdentifier)))
                                                                 rules[javaSynchronizedStatement] = tsSeq[K](tsString[K]("synchronized"), tsSymbol[K](javaParenthesizedExpression), tsSymbol[K](javaBlock))
                                                                 rules[javaClassDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsString[K]("class"), tsSymbol[K](javaIdentifier), tsChoice[K](tsSymbol[K](javaTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaSuperclass), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaSuperInterfaces), tsBlank[K]()), tsSymbol[K](javaClassBody))
                                                                 rules[javaHidClassBodyDeclaration] = tsChoice[K](tsSymbol[K](javaFieldDeclaration), tsSymbol[K](javaRecordDeclaration), tsSymbol[K](javaMethodDeclaration), tsSymbol[K](javaClassDeclaration), tsSymbol[K](javaInterfaceDeclaration), tsSymbol[K](javaAnnotationTypeDeclaration), tsSymbol[K](javaEnumDeclaration), tsSymbol[K](javaBlock), tsSymbol[K](javaStaticInitializer), tsSymbol[K](javaConstructorDeclaration), tsString[K](";"))
                                                                 rules[javaRecordDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsString[K]("record"), tsSymbol[K](javaIdentifier), tsSymbol[K](javaFormalParameters), tsSymbol[K](javaClassBody))
                                                                 rules[javaWildcard] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsString[K]("?"), tsChoice[K](tsSymbol[K](javaHidWildcardBounds), tsBlank[K]()))
                                                                 rules[javaBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](javaStatement)), tsString[K]("}"))
                                                                 rules[javaThrowStatement] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](javaExpression), tsString[K](";"))
                                                                 rules[javaClassLiteral] = tsSeq[K](tsSymbol[K](javaHidUnannotatedType), tsString[K]("."), tsString[K]("class"))
                                                                 rules[javaAnnotationTypeBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](javaAnnotationTypeElementDeclaration), tsSymbol[K](javaConstantDeclaration), tsSymbol[K](javaClassDeclaration), tsSymbol[K](javaInterfaceDeclaration), tsSymbol[K](javaAnnotationTypeDeclaration))), tsString[K]("}"))
                                                                 rules[javaAnnotationArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](javaHidElementValue), tsChoice[K](tsSeq[K](tsSymbol[K](javaElementValuePair), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaElementValuePair)))), tsBlank[K]())), tsString[K](")"))
                                                                 rules[javaEnumConstant] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaIdentifier), tsChoice[K](tsSymbol[K](javaArgumentList), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaClassBody), tsBlank[K]()))
                                                                 rules[javaVariableDeclarator] = tsSeq[K](tsSymbol[K](javaHidVariableDeclaratorId), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](javaHidVariableInitializer)), tsBlank[K]()))
                                                                 rules[javaInterfaceDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsString[K]("interface"), tsSymbol[K](javaIdentifier), tsChoice[K](tsSymbol[K](javaTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaExtendsInterfaces), tsBlank[K]()), tsSymbol[K](javaInterfaceBody))
                                                                 rules[javaScopedIdentifier] = tsSeq[K](tsSymbol[K](javaHidName), tsString[K]("."), tsSymbol[K](javaIdentifier))
                                                                 rules[javaFloatingPointType] = tsChoice[K](tsString[K]("float"), tsString[K]("double"))
                                                                 rules[javaReceiverParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsSymbol[K](javaHidUnannotatedType), tsChoice[K](tsSeq[K](tsSymbol[K](javaIdentifier), tsString[K](".")), tsBlank[K]()), tsSymbol[K](javaThis))
                                                                 rules[javaUnaryExpression] = tsChoice[K](tsSeq[K](tsString[K]("+"), tsSymbol[K](javaExpression)), tsSeq[K](tsString[K]("-"), tsSymbol[K](javaExpression)), tsSeq[K](tsString[K]("!"), tsSymbol[K](javaExpression)), tsSeq[K](tsString[K]("~"), tsSymbol[K](javaExpression)))
                                                                 rules[javaPackageDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsString[K]("package"), tsSymbol[K](javaHidName), tsString[K](";"))
                                                                 rules[javaArrayType] = tsSeq[K](tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaDimensions))
                                                                 rules[javaComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                                 rules[javaExpression] = tsChoice[K](tsSymbol[K](javaAssignmentExpression), tsSymbol[K](javaBinaryExpression), tsSymbol[K](javaInstanceofExpression), tsSymbol[K](javaLambdaExpression), tsSymbol[K](javaTernaryExpression), tsSymbol[K](javaUpdateExpression), tsSymbol[K](javaPrimaryExpression), tsSymbol[K](javaUnaryExpression), tsSymbol[K](javaCastExpression), tsSymbol[K](javaSwitchExpression))
                                                                 rules[javaThis] = tsString[K]("this")
                                                                 rules[javaMethodDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidMethodHeader), tsChoice[K](tsSymbol[K](javaBlock), tsString[K](";")))
                                                                 rules[javaSwitchBlockStatementGroup] = tsSeq[K](tsRepeat1[K](tsSeq[K](tsSymbol[K](javaSwitchLabel), tsString[K](":"))), tsRepeat[K](tsSymbol[K](javaStatement)))
                                                                 rules[javaHidVariableDeclaratorList] = tsSeq[K](tsSymbol[K](javaVariableDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaVariableDeclarator))))
                                                                 rules[javaTryWithResourcesStatement] = tsSeq[K](tsString[K]("try"), tsSymbol[K](javaResourceSpecification), tsSymbol[K](javaBlock), tsRepeat[K](tsSymbol[K](javaCatchClause)), tsChoice[K](tsSymbol[K](javaFinallyClause), tsBlank[K]()))
                                                                 rules[javaEnhancedForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorId), tsString[K](":"), tsSymbol[K](javaExpression), tsString[K](")"), tsSymbol[K](javaStatement))
                                                                 rules[javaIdentifier] = tsRegex[K]("[\\p{L}_$][\\p{L}\\p{Nd}_$]*")
                                                                 rules[javaMarkerAnnotation] = tsSeq[K](tsString[K]("@"), tsSymbol[K](javaHidName))
                                                                 rules[javaElementValuePair] = tsSeq[K](tsSymbol[K](javaIdentifier), tsString[K]("="), tsSymbol[K](javaHidElementValue))
                                                                 rules[javaSwitchLabel] = tsChoice[K](tsSeq[K](tsString[K]("case"), tsSeq[K](tsSymbol[K](javaExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaExpression))))), tsString[K]("default"))
                                                                 rules[javaExplicitConstructorInvocation] = tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](javaTypeArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaThis), tsSymbol[K](javaSuper))), tsSeq[K](tsChoice[K](tsSymbol[K](javaPrimaryExpression)), tsString[K]("."), tsChoice[K](tsSymbol[K](javaTypeArguments), tsBlank[K]()), tsSymbol[K](javaSuper))), tsSymbol[K](javaArgumentList), tsString[K](";"))
                                                                 rules[javaTernaryExpression] = tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("?"), tsSymbol[K](javaExpression), tsString[K](":"), tsSymbol[K](javaExpression))
                                                                 rules[javaClassBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](javaHidClassBodyDeclaration)), tsString[K]("}"))
                                                                 rules[javaBinaryIntegerLiteral] = tsSeq[K](tsChoice[K](tsString[K]("0b"), tsString[K]("0B")), tsSeq[K](tsRegex[K]("[01]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[01]+")))), tsChoice[K](tsChoice[K](tsString[K]("l"), tsString[K]("L")), tsBlank[K]()))
                                                                 rules[javaCatchType] = tsSeq[K](tsSymbol[K](javaHidUnannotatedType), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](javaHidUnannotatedType))))
                                                                 rules[javaTypeBound] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](javaHidType), tsRepeat[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](javaHidType))))
                                                                 rules[javaFieldDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorList), tsString[K](";"))
                                                                 rules[javaYieldStatement] = tsSeq[K](tsString[K]("yield"), tsSymbol[K](javaExpression), tsString[K](";"))
                                                                 rules[javaMethodInvocation] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier)), tsSeq[K](tsChoice[K](tsSymbol[K](javaPrimaryExpression), tsSymbol[K](javaSuper)), tsString[K]("."), tsChoice[K](tsSeq[K](tsSymbol[K](javaSuper), tsString[K](".")), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaTypeArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier)))), tsSymbol[K](javaArgumentList))
                                                                 rules[javaTrue] = tsString[K]("true")
                                                                 rules[javaFinallyClause] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](javaBlock))
                                                                 rules[javaTypeParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsSymbol[K](javaIdentifier), tsChoice[K](tsSymbol[K](javaTypeBound), tsBlank[K]()))
                                                                 rules[javaHidUnannotatedType] = tsChoice[K](tsSymbol[K](javaHidSimpleType), tsSymbol[K](javaArrayType))
                                                                 rules[javaLabeledStatement] = tsSeq[K](tsSymbol[K](javaIdentifier), tsString[K](":"), tsSymbol[K](javaStatement))
                                                                 rules[javaParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](javaExpression), tsString[K](")"))
                                                                 rules[javaEnumDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsString[K]("enum"), tsSymbol[K](javaIdentifier), tsChoice[K](tsSymbol[K](javaSuperInterfaces), tsBlank[K]()), tsSymbol[K](javaEnumBody))
                                                                 rules[javaElementValueArrayInitializer] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](javaHidElementValue), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidElementValue)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[javaBooleanType] = tsString[K]("boolean")
                                                                 rules[javaIntegralType] = tsChoice[K](tsString[K]("byte"), tsString[K]("short"), tsString[K]("int"), tsString[K]("long"), tsString[K]("char"))
                                                                 rules[javaHidLiteral] = tsChoice[K](tsSymbol[K](javaDecimalIntegerLiteral), tsSymbol[K](javaHexIntegerLiteral), tsSymbol[K](javaOctalIntegerLiteral), tsSymbol[K](javaBinaryIntegerLiteral), tsSymbol[K](javaDecimalFloatingPointLiteral), tsSymbol[K](javaHexFloatingPointLiteral), tsSymbol[K](javaTrue), tsSymbol[K](javaFalse), tsSymbol[K](javaCharacterLiteral), tsSymbol[K](javaStringLiteral), tsSymbol[K](javaNullLiteral))
                                                                 rules[javaResourceSpecification] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](javaResource), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](javaResource)))), tsChoice[K](tsString[K](";"), tsBlank[K]()), tsString[K](")"))
                                                                 rules[javaWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](javaParenthesizedExpression), tsSymbol[K](javaStatement))
                                                                 rules[javaHidElementValue] = tsChoice[K](tsSymbol[K](javaExpression), tsSymbol[K](javaElementValueArrayInitializer), tsSymbol[K](javaHidAnnotation))
                                                                 rules[javaHidUnqualifiedObjectCreationExpression] = tsSeq[K](tsString[K]("new"), tsChoice[K](tsSymbol[K](javaTypeArguments), tsBlank[K]()), tsSymbol[K](javaHidSimpleType), tsSymbol[K](javaArgumentList), tsChoice[K](tsSymbol[K](javaClassBody), tsBlank[K]()))
                                                                 rules[javaSuperInterfaces] = tsSeq[K](tsString[K]("implements"), tsSymbol[K](javaInterfaceTypeList))
                                                                 rules[javaModifiers] = tsRepeat1[K](tsChoice[K](tsSymbol[K](javaHidAnnotation), tsString[K]("public"), tsString[K]("protected"), tsString[K]("private"), tsString[K]("abstract"), tsString[K]("static"), tsString[K]("final"), tsString[K]("strictfp"), tsString[K]("default"), tsString[K]("synchronized"), tsString[K]("native"), tsString[K]("transient"), tsString[K]("volatile")))
                                                                 rules[javaHidVariableInitializer] = tsChoice[K](tsSymbol[K](javaExpression), tsSymbol[K](javaArrayInitializer))
                                                                 rules[javaHidSimpleType] = tsChoice[K](tsSymbol[K](javaVoidType), tsSymbol[K](javaIntegralType), tsSymbol[K](javaFloatingPointType), tsSymbol[K](javaBooleanType), tsSymbol[K](javaIdentifier), tsSymbol[K](javaScopedTypeIdentifier), tsSymbol[K](javaGenericType))
                                                                 rules[javaNullLiteral] = tsString[K]("null")
                                                                 rules[javaDecimalFloatingPointLiteral] = tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsString[K]("."), tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]()), tsChoice[K](tsRegex[K]("[fFdD]"), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]()), tsChoice[K](tsRegex[K]("[fFdD]"), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsRegex[K]("[eEpP]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsRegex[K]("[fFdD]"), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]()), tsRegex[K]("[fFdD]")))
                                                                 rules[javaFieldAccess] = tsSeq[K](tsChoice[K](tsSymbol[K](javaPrimaryExpression), tsSymbol[K](javaSuper)), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](javaSuper)), tsBlank[K]()), tsString[K]("."), tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier), tsSymbol[K](javaThis)))
                                                                 rules[javaStringLiteral] = tsChoice[K](tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\\\\"\\n]"), tsRegex[K]("\\\\(.|\\n)"))), tsString[K]("\"")))
                                                                 rules[javaObjectCreationExpression] = tsChoice[K](tsSymbol[K](javaHidUnqualifiedObjectCreationExpression), tsSeq[K](tsSymbol[K](javaPrimaryExpression), tsString[K]("."), tsSymbol[K](javaHidUnqualifiedObjectCreationExpression)))
                                                                 rules[javaSwitchBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsRepeat[K](tsSymbol[K](javaSwitchBlockStatementGroup)), tsRepeat[K](tsSymbol[K](javaSwitchRule))), tsString[K]("}"))
                                                                 rules[javaModuleDirective] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("requires"), tsRepeat[K](tsSymbol[K](javaRequiresModifier)), tsSymbol[K](javaHidName)), tsSeq[K](tsString[K]("exports"), tsSymbol[K](javaHidName), tsChoice[K](tsString[K]("to"), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaHidName), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidName)))), tsSeq[K](tsString[K]("opens"), tsSymbol[K](javaHidName), tsChoice[K](tsString[K]("to"), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaHidName), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidName)))), tsSeq[K](tsString[K]("uses"), tsSymbol[K](javaHidName)), tsSeq[K](tsString[K]("provides"), tsSymbol[K](javaHidName), tsString[K]("with"), tsSymbol[K](javaHidName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidName))))), tsString[K](";"))
                                                                 rules[javaHidVariableDeclaratorId] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier)), tsChoice[K](tsSymbol[K](javaDimensions), tsBlank[K]()))
                                                                 rules[javaHidType] = tsChoice[K](tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaAnnotatedType))
                                                                 rules[javaHidMethodDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier)), tsSymbol[K](javaFormalParameters), tsChoice[K](tsSymbol[K](javaDimensions), tsBlank[K]()))
                                                                 rules[javaHexIntegerLiteral] = tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsSeq[K](tsRegex[K]("[A-Fa-f0-9]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[A-Fa-f0-9]+")))), tsChoice[K](tsChoice[K](tsString[K]("l"), tsString[K]("L")), tsBlank[K]()))
                                                                 rules[javaAssertStatement] = tsChoice[K](tsSeq[K](tsString[K]("assert"), tsSymbol[K](javaExpression), tsString[K](";")), tsSeq[K](tsString[K]("assert"), tsSymbol[K](javaExpression), tsString[K](":"), tsSymbol[K](javaExpression), tsString[K](";")))
                                                                 rules[javaTryStatement] = tsSeq[K](tsString[K]("try"), tsSymbol[K](javaBlock), tsChoice[K](tsRepeat1[K](tsSymbol[K](javaCatchClause)), tsSeq[K](tsRepeat[K](tsSymbol[K](javaCatchClause)), tsSymbol[K](javaFinallyClause))))
                                                                 rules[javaBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](javaExpression), tsString[K](">"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("<"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K](">="), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("<="), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("=="), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("!="), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("&&"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("||"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("+"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("-"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("*"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("/"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("&"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("|"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("^"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("%"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("<<"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K](">>"), tsSymbol[K](javaExpression)), tsSeq[K](tsSymbol[K](javaExpression), tsString[K](">>>"), tsSymbol[K](javaExpression)))
                                                                 rules[javaConstantDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorList), tsString[K](";"))
                                                                 rules[javaDimensions] = tsRepeat1[K](tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsString[K]("["), tsString[K]("]")))
                                                                 rules[javaDeclaration] = tsChoice[K](tsSymbol[K](javaModuleDeclaration), tsSymbol[K](javaPackageDeclaration), tsSymbol[K](javaImportDeclaration), tsSymbol[K](javaClassDeclaration), tsSymbol[K](javaInterfaceDeclaration), tsSymbol[K](javaAnnotationTypeDeclaration), tsSymbol[K](javaEnumDeclaration))
                                                                 rules[javaAnnotation] = tsSeq[K](tsString[K]("@"), tsSymbol[K](javaHidName), tsSymbol[K](javaAnnotationArgumentList))
                                                                 rules[javaBreakStatement] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](javaIdentifier), tsBlank[K]()), tsString[K](";"))
                                                                 rules[javaCastExpression] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](javaHidType), tsRepeat[K](tsSeq[K](tsString[K]("&"), tsSymbol[K](javaHidType)))), tsString[K](")"), tsSymbol[K](javaExpression))
                                                                 rules[javaSuperclass] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](javaHidType))
                                                                 rules[javaAnnotatedType] = tsSeq[K](tsRepeat1[K](tsSymbol[K](javaHidAnnotation)), tsSymbol[K](javaHidUnannotatedType))
                                                                 rules[javaArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](javaExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaExpression)))), tsBlank[K]()), tsString[K](")"))
                                                                 rules[javaVoidType] = tsString[K]("void")
                                                                 rules[javaEnumBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](javaEnumConstant), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaEnumConstant)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsChoice[K](tsSymbol[K](javaEnumBodyDeclarations), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[javaContinueStatement] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](javaIdentifier), tsBlank[K]()), tsString[K](";"))
                                                                 rules[javaIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](javaParenthesizedExpression), tsSymbol[K](javaStatement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](javaStatement)), tsBlank[K]()))
                                                                 rules[javaArrayAccess] = tsSeq[K](tsSymbol[K](javaPrimaryExpression), tsString[K]("["), tsSymbol[K](javaExpression), tsString[K]("]"))
                                                                 rules[javaOctalIntegerLiteral] = tsSeq[K](tsChoice[K](tsString[K]("0o"), tsString[K]("0O")), tsSeq[K](tsRegex[K]("[0-7]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[0-7]+")))), tsChoice[K](tsChoice[K](tsString[K]("l"), tsString[K]("L")), tsBlank[K]()))
                                                                 rules[javaHidConstructorDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](javaTypeParameters), tsBlank[K]()), tsSymbol[K](javaIdentifier), tsSymbol[K](javaFormalParameters))
                                                                 rules[javaArrayCreationExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](javaHidSimpleType), tsChoice[K](tsSeq[K](tsRepeat1[K](tsSymbol[K](javaDimensionsExpr)), tsChoice[K](tsSymbol[K](javaDimensions), tsBlank[K]())), tsSeq[K](tsSymbol[K](javaDimensions), tsSymbol[K](javaArrayInitializer))))
                                                                 rules[javaModuleDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsChoice[K](tsString[K]("open"), tsBlank[K]()), tsString[K]("module"), tsSymbol[K](javaHidName), tsSymbol[K](javaModuleBody))
                                                                 rules[javaUpdateExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("++")), tsSeq[K](tsSymbol[K](javaExpression), tsString[K]("--")), tsSeq[K](tsString[K]("++"), tsSymbol[K](javaExpression)), tsSeq[K](tsString[K]("--"), tsSymbol[K](javaExpression)))
                                                                 rules[javaModuleBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](javaModuleDirective)), tsString[K]("}"))
                                                                 rules[javaInterfaceBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](javaConstantDeclaration), tsSymbol[K](javaEnumDeclaration), tsSymbol[K](javaMethodDeclaration), tsSymbol[K](javaClassDeclaration), tsSymbol[K](javaInterfaceDeclaration), tsSymbol[K](javaAnnotationTypeDeclaration), tsString[K](";"))), tsString[K]("}"))
                                                                 rules[javaDimensionsExpr] = tsSeq[K](tsRepeat[K](tsSymbol[K](javaHidAnnotation)), tsString[K]("["), tsSymbol[K](javaExpression), tsString[K]("]"))
                                                                 rules[javaDecimalIntegerLiteral] = tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsChoice[K](tsString[K]("l"), tsString[K]("L")), tsBlank[K]()))
                                                                 rules[javaLocalVariableDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidVariableDeclaratorList), tsString[K](";"))
                                                                 rules[javaHidReservedIdentifier] = tsChoice[K](tsString[K]("open"), tsString[K]("module"))
                                                                 rules[javaInterfaceTypeList] = tsSeq[K](tsSymbol[K](javaHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](javaHidType))))
                                                                 rules[javaConstructorDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidConstructorDeclarator), tsChoice[K](tsSymbol[K](javaThrows), tsBlank[K]()), tsSymbol[K](javaConstructorBody))
                                                                 rules[javaHidAnnotation] = tsChoice[K](tsSymbol[K](javaMarkerAnnotation), tsSymbol[K](javaAnnotation))
                                                                 rules[javaCatchClause] = tsSeq[K](tsString[K]("catch"), tsString[K]("("), tsSymbol[K](javaCatchFormalParameter), tsString[K](")"), tsSymbol[K](javaBlock))
                                                                 rules[javaExpressionStatement] = tsSeq[K](tsSymbol[K](javaExpression), tsString[K](";"))
                                                                 rules[javaHidName] = tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier), tsSymbol[K](javaScopedIdentifier))
                                                                 rules[javaRequiresModifier] = tsChoice[K](tsString[K]("transitive"), tsString[K]("static"))
                                                                 rules[javaFormalParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](javaReceiverParameter), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](javaFormalParameter), tsSymbol[K](javaSpreadParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](javaFormalParameter), tsSymbol[K](javaSpreadParameter))))), tsBlank[K]()), tsString[K](")"))
                                                                 rules[javaImportDeclaration] = tsSeq[K](tsString[K]("import"), tsChoice[K](tsString[K]("static"), tsBlank[K]()), tsSymbol[K](javaHidName), tsChoice[K](tsSeq[K](tsString[K]("."), tsSymbol[K](javaAsterisk)), tsBlank[K]()), tsString[K](";"))
                                                                 rules[javaCatchFormalParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaCatchType), tsSymbol[K](javaHidVariableDeclaratorId))
                                                                 rules[javaHexFloatingPointLiteral] = tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[A-Fa-f0-9]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[A-Fa-f0-9]+")))), tsChoice[K](tsString[K]("."), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("[A-Fa-f0-9]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[A-Fa-f0-9]+")))), tsBlank[K]()), tsString[K]("."), tsSeq[K](tsRegex[K]("[A-Fa-f0-9]+"), tsRepeat[K](tsSeq[K](tsString[K]("_"), tsRegex[K]("[A-Fa-f0-9]+")))))), tsChoice[K](tsSeq[K](tsRegex[K]("[eEpP]"), tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsRegex[K]("[fFdD]"), tsBlank[K]())), tsBlank[K]()))
                                                                 rules[javaAssignmentExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaHidReservedIdentifier), tsSymbol[K](javaFieldAccess), tsSymbol[K](javaArrayAccess)), tsChoice[K](tsString[K]("="), tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("&="), tsString[K]("|="), tsString[K]("^="), tsString[K]("%="), tsString[K]("<<="), tsString[K](">>="), tsString[K](">>>=")), tsSymbol[K](javaExpression))
                                                                 rules[javaTypeArguments] = tsSeq[K](tsString[K]("<"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](javaHidType), tsSymbol[K](javaWildcard)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](javaHidType), tsSymbol[K](javaWildcard))))), tsBlank[K]()), tsString[K](">"))
                                                                 rules[javaStaticInitializer] = tsSeq[K](tsString[K]("static"), tsSymbol[K](javaBlock))
                                                                 rules[javaSuper] = tsString[K]("super")
                                                                 rules[javaHidDefaultValue] = tsSeq[K](tsString[K]("default"), tsSymbol[K](javaHidElementValue))
                                                                 rules[javaStatement] = tsChoice[K](tsSymbol[K](javaDeclaration), tsSymbol[K](javaExpressionStatement), tsSymbol[K](javaLabeledStatement), tsSymbol[K](javaIfStatement), tsSymbol[K](javaWhileStatement), tsSymbol[K](javaForStatement), tsSymbol[K](javaEnhancedForStatement), tsSymbol[K](javaBlock), tsString[K](";"), tsSymbol[K](javaAssertStatement), tsSymbol[K](javaDoStatement), tsSymbol[K](javaBreakStatement), tsSymbol[K](javaContinueStatement), tsSymbol[K](javaReturnStatement), tsSymbol[K](javaYieldStatement), tsSymbol[K](javaSwitchExpression), tsSymbol[K](javaSynchronizedStatement), tsSymbol[K](javaLocalVariableDeclaration), tsSymbol[K](javaThrowStatement), tsSymbol[K](javaTryStatement), tsSymbol[K](javaTryWithResourcesStatement))
                                                                 rules[javaProgram] = tsRepeat[K](tsSymbol[K](javaStatement))
                                                                 rules[javaDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](javaStatement), tsString[K]("while"), tsSymbol[K](javaParenthesizedExpression), tsString[K](";"))
                                                                 rules[javaSwitchExpression] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](javaParenthesizedExpression), tsSymbol[K](javaSwitchBlock))
                                                                 rules[javaSpreadParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](javaModifiers), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsString[K]("..."), tsSymbol[K](javaVariableDeclarator))
                                                                 rules[javaHidMethodHeader] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](javaTypeParameters), tsRepeat[K](tsSymbol[K](javaHidAnnotation))), tsBlank[K]()), tsSymbol[K](javaHidUnannotatedType), tsSymbol[K](javaHidMethodDeclarator), tsChoice[K](tsSymbol[K](javaThrows), tsBlank[K]()))
                                                                 rules[javaGenericType] = tsSeq[K](tsChoice[K](tsSymbol[K](javaIdentifier), tsSymbol[K](javaScopedTypeIdentifier)), tsSymbol[K](javaTypeArguments))
                                                                 rules[javaEnumBodyDeclarations] = tsSeq[K](tsString[K](";"), tsRepeat[K](tsSymbol[K](javaHidClassBodyDeclaration)))
                                                                 rules

