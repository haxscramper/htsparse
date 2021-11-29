import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  ScalaNodeKind* = enum
    scalaHidDefinition                        ## _definition
    scalaHidPattern                           ## _pattern
    scalaExpression                           ## expression
    scalaAccessModifier                       ## access_modifier
    scalaAccessQualifier                      ## access_qualifier
    scalaAlternativePattern                   ## alternative_pattern
    scalaAnnotation                           ## annotation
    scalaArguments                            ## arguments
    scalaAscriptionExpression                 ## ascription_expression
    scalaAssignmentExpression                 ## assignment_expression
    scalaBinding                              ## binding
    scalaBindings                             ## bindings
    scalaBlock                                ## block
    scalaBooleanLiteral                       ## boolean_literal
    scalaCallExpression                       ## call_expression
    scalaCapturePattern                       ## capture_pattern
    scalaCaseBlock                            ## case_block
    scalaCaseClassPattern                     ## case_class_pattern
    scalaCaseClause                           ## case_clause
    scalaCatchClause                          ## catch_clause
    scalaClassDefinition                      ## class_definition
    scalaClassParameter                       ## class_parameter
    scalaClassParameters                      ## class_parameters
    scalaCompilationUnit                      ## compilation_unit
    scalaCompoundType                         ## compound_type
    scalaContextBound                         ## context_bound
    scalaContravariantTypeParameter           ## contravariant_type_parameter
    scalaCovariantTypeParameter               ## covariant_type_parameter
    scalaDoWhileExpression                    ## do_while_expression
    scalaEnumerator                           ## enumerator
    scalaEnumerators                          ## enumerators
    scalaExtendsClause                        ## extends_clause
    scalaFieldExpression                      ## field_expression
    scalaFinallyClause                        ## finally_clause
    scalaForExpression                        ## for_expression
    scalaFunctionDeclaration                  ## function_declaration
    scalaFunctionDefinition                   ## function_definition
    scalaFunctionType                         ## function_type
    scalaGenericFunction                      ## generic_function
    scalaGenericType                          ## generic_type
    scalaGuard                                ## guard
    scalaIfExpression                         ## if_expression
    scalaImportDeclaration                    ## import_declaration
    scalaImportSelectors                      ## import_selectors
    scalaInfixExpression                      ## infix_expression
    scalaInfixPattern                         ## infix_pattern
    scalaInfixType                            ## infix_type
    scalaInstanceExpression                   ## instance_expression
    scalaInterpolatedString                   ## interpolated_string
    scalaInterpolatedStringExpression         ## interpolated_string_expression
    scalaInterpolation                        ## interpolation
    scalaLambdaExpression                     ## lambda_expression
    scalaLazyParameterType                    ## lazy_parameter_type
    scalaLowerBound                           ## lower_bound
    scalaMatchExpression                      ## match_expression
    scalaModifiers                            ## modifiers
    scalaObjectDefinition                     ## object_definition
    scalaPackageClause                        ## package_clause
    scalaPackageIdentifier                    ## package_identifier
    scalaPackageObject                        ## package_object
    scalaParameter                            ## parameter
    scalaParameterTypes                       ## parameter_types
    scalaParameters                           ## parameters
    scalaParenthesizedExpression              ## parenthesized_expression
    scalaPostfixExpression                    ## postfix_expression
    scalaPrefixExpression                     ## prefix_expression
    scalaProjectedType                        ## projected_type
    scalaRenamedIdentifier                    ## renamed_identifier
    scalaRepeatedParameterType                ## repeated_parameter_type
    scalaReturnExpression                     ## return_expression
    scalaStableIdentifier                     ## stable_identifier
    scalaStableTypeIdentifier                 ## stable_type_identifier
    scalaString                               ## string
    scalaTemplateBody                         ## template_body
    scalaThrowExpression                      ## throw_expression
    scalaTraitDefinition                      ## trait_definition
    scalaTryExpression                        ## try_expression
    scalaTupleExpression                      ## tuple_expression
    scalaTuplePattern                         ## tuple_pattern
    scalaTupleType                            ## tuple_type
    scalaTypeArguments                        ## type_arguments
    scalaTypeDefinition                       ## type_definition
    scalaTypeParameters                       ## type_parameters
    scalaTypedPattern                         ## typed_pattern
    scalaUnit                                 ## unit
    scalaUpperBound                           ## upper_bound
    scalaValDeclaration                       ## val_declaration
    scalaValDefinition                        ## val_definition
    scalaVarDeclaration                       ## var_declaration
    scalaVarDefinition                        ## var_definition
    scalaViewBound                            ## view_bound
    scalaWhileExpression                      ## while_expression
    scalaExclamationTok                       ## !
    scalaHashTok                              ## #
    scalaDollarTok                            ## $
    scalaLParTok                              ## (
    scalaRParTok                              ## )
    scalaAsteriskTok                          ## *
    scalaPlusTok                              ## +
    scalaCommaTok                             ## ,
    scalaMinusTok                             ## -
    scalaDotTok                               ## .
    scalaColonTok                             ## :
    scalaSemicolonTok                         ## ;
    scalaLessThanPercentTok                   ## <%
    scalaLessThanMinusTok                     ## <-
    scalaLessThanColonTok                     ## <:
    scalaEqualTok                             ## =
    scalaEqualGreaterThanTok                  ## =>
    scalaGreaterThanColonTok                  ## >:
    scalaAtTok                                ## @
    scalaLBrackTok                            ## [
    scalaRBrackTok                            ## ]
    scalaAbstractTok                          ## abstract
    scalaCaseTok                              ## case
    scalaCatchTok                             ## catch
    scalaCharacterLiteral                     ## character_literal
    scalaClassTok                             ## class
    scalaComment                              ## comment
    scalaDefTok                               ## def
    scalaDoTok                                ## do
    scalaElseTok                              ## else
    scalaExtendsTok                           ## extends
    scalaFalseTok                             ## false
    scalaFinalTok                             ## final
    scalaFinallyTok                           ## finally
    scalaFloatingPointLiteral                 ## floating_point_literal
    scalaForTok                               ## for
    scalaIdentifier                           ## identifier
    scalaIfTok                                ## if
    scalaImplicitTok                          ## implicit
    scalaImportTok                            ## import
    scalaIntegerLiteral                       ## integer_literal
    scalaLazyTok                              ## lazy
    scalaMatchTok                             ## match
    scalaNewTok                               ## new
    scalaNullLiteral                          ## null_literal
    scalaObjectTok                            ## object
    scalaOperatorIdentifier                   ## operator_identifier
    scalaOverrideTok                          ## override
    scalaPackageTok                           ## package
    scalaPrivateTok                           ## private
    scalaProtectedTok                         ## protected
    scalaReturnTok                            ## return
    scalaSealedTok                            ## sealed
    scalaSymbolLiteral                        ## symbol_literal
    scalaThrowTok                             ## throw
    scalaTraitTok                             ## trait
    scalaTrueTok                              ## true
    scalaTryTok                               ## try
    scalaTypeTok                              ## type
    scalaTypeIdentifier                       ## type_identifier
    scalaValTok                               ## val
    scalaVarTok                               ## var
    scalaWhileTok                             ## while
    scalaWildcard                             ## wildcard
    scalaWithTok                              ## with
    scalaYieldTok                             ## yield
    scalaLCurlyTok                            ## {
    scalaPipeTok                              ## |
    scalaRCurlyTok                            ## }
    scalaTildeTok                             ## ~
    scalaHidSimpleString                      ## _simple_string
    scalaHidSimpleMultilineString             ## _simple_multiline_string
    scalaHidSimpleType                        ## _simple_type
    scalaHidVariantTypeParameter              ## _variant_type_parameter
    scalaHidInterpolatedMultilineStringMiddle ## _interpolated_multiline_string_middle
    scalaHidType                              ## _type
    scalaHidInterpolatedMultilineStringEnd    ## _interpolated_multiline_string_end
    scalaHidObjectDefinition                  ## _object_definition
    scalaHidInterpolatedStringMiddle          ## _interpolated_string_middle
    scalaHidTypeParameter                     ## _type_parameter
    scalaHidSemicolon                         ## _semicolon
    scalaHidParamType                         ## _param_type
    scalaLiteral                              ## literal
    scalaHidBlock                             ## _block
    scalaHidTypeIdentifier                    ## _type_identifier
    scalaHidInterpolatedStringStart           ## _interpolated_string_start
    scalaHidInterpolatedMultilineStringStart  ## _interpolated_multiline_string_start
    scalaHidImportExpression                  ## _import_expression
    scalaHidAutomaticSemicolon                ## _automatic_semicolon
    scalaHidInterpolatedStringEnd             ## _interpolated_string_end
    scalaHidAnnotatedType                     ## _annotated_type
    scalaSyntaxError                          ## Tree-sitter parser syntax error

proc strRepr*(kind: ScalaNodeKind): string =
  case kind:
    of scalaHidDefinition:                        "_definition"
    of scalaHidPattern:                           "_pattern"
    of scalaExpression:                           "expression"
    of scalaAccessModifier:                       "access_modifier"
    of scalaAccessQualifier:                      "access_qualifier"
    of scalaAlternativePattern:                   "alternative_pattern"
    of scalaAnnotation:                           "annotation"
    of scalaArguments:                            "arguments"
    of scalaAscriptionExpression:                 "ascription_expression"
    of scalaAssignmentExpression:                 "assignment_expression"
    of scalaBinding:                              "binding"
    of scalaBindings:                             "bindings"
    of scalaBlock:                                "block"
    of scalaBooleanLiteral:                       "boolean_literal"
    of scalaCallExpression:                       "call_expression"
    of scalaCapturePattern:                       "capture_pattern"
    of scalaCaseBlock:                            "case_block"
    of scalaCaseClassPattern:                     "case_class_pattern"
    of scalaCaseClause:                           "case_clause"
    of scalaCatchClause:                          "catch_clause"
    of scalaClassDefinition:                      "class_definition"
    of scalaClassParameter:                       "class_parameter"
    of scalaClassParameters:                      "class_parameters"
    of scalaCompilationUnit:                      "compilation_unit"
    of scalaCompoundType:                         "compound_type"
    of scalaContextBound:                         "context_bound"
    of scalaContravariantTypeParameter:           "contravariant_type_parameter"
    of scalaCovariantTypeParameter:               "covariant_type_parameter"
    of scalaDoWhileExpression:                    "do_while_expression"
    of scalaEnumerator:                           "enumerator"
    of scalaEnumerators:                          "enumerators"
    of scalaExtendsClause:                        "extends_clause"
    of scalaFieldExpression:                      "field_expression"
    of scalaFinallyClause:                        "finally_clause"
    of scalaForExpression:                        "for_expression"
    of scalaFunctionDeclaration:                  "function_declaration"
    of scalaFunctionDefinition:                   "function_definition"
    of scalaFunctionType:                         "function_type"
    of scalaGenericFunction:                      "generic_function"
    of scalaGenericType:                          "generic_type"
    of scalaGuard:                                "guard"
    of scalaIfExpression:                         "if_expression"
    of scalaImportDeclaration:                    "import_declaration"
    of scalaImportSelectors:                      "import_selectors"
    of scalaInfixExpression:                      "infix_expression"
    of scalaInfixPattern:                         "infix_pattern"
    of scalaInfixType:                            "infix_type"
    of scalaInstanceExpression:                   "instance_expression"
    of scalaInterpolatedString:                   "interpolated_string"
    of scalaInterpolatedStringExpression:         "interpolated_string_expression"
    of scalaInterpolation:                        "interpolation"
    of scalaLambdaExpression:                     "lambda_expression"
    of scalaLazyParameterType:                    "lazy_parameter_type"
    of scalaLowerBound:                           "lower_bound"
    of scalaMatchExpression:                      "match_expression"
    of scalaModifiers:                            "modifiers"
    of scalaObjectDefinition:                     "object_definition"
    of scalaPackageClause:                        "package_clause"
    of scalaPackageIdentifier:                    "package_identifier"
    of scalaPackageObject:                        "package_object"
    of scalaParameter:                            "parameter"
    of scalaParameterTypes:                       "parameter_types"
    of scalaParameters:                           "parameters"
    of scalaParenthesizedExpression:              "parenthesized_expression"
    of scalaPostfixExpression:                    "postfix_expression"
    of scalaPrefixExpression:                     "prefix_expression"
    of scalaProjectedType:                        "projected_type"
    of scalaRenamedIdentifier:                    "renamed_identifier"
    of scalaRepeatedParameterType:                "repeated_parameter_type"
    of scalaReturnExpression:                     "return_expression"
    of scalaStableIdentifier:                     "stable_identifier"
    of scalaStableTypeIdentifier:                 "stable_type_identifier"
    of scalaString:                               "string"
    of scalaTemplateBody:                         "template_body"
    of scalaThrowExpression:                      "throw_expression"
    of scalaTraitDefinition:                      "trait_definition"
    of scalaTryExpression:                        "try_expression"
    of scalaTupleExpression:                      "tuple_expression"
    of scalaTuplePattern:                         "tuple_pattern"
    of scalaTupleType:                            "tuple_type"
    of scalaTypeArguments:                        "type_arguments"
    of scalaTypeDefinition:                       "type_definition"
    of scalaTypeParameters:                       "type_parameters"
    of scalaTypedPattern:                         "typed_pattern"
    of scalaUnit:                                 "unit"
    of scalaUpperBound:                           "upper_bound"
    of scalaValDeclaration:                       "val_declaration"
    of scalaValDefinition:                        "val_definition"
    of scalaVarDeclaration:                       "var_declaration"
    of scalaVarDefinition:                        "var_definition"
    of scalaViewBound:                            "view_bound"
    of scalaWhileExpression:                      "while_expression"
    of scalaExclamationTok:                       "!"
    of scalaHashTok:                              "#"
    of scalaDollarTok:                            "$"
    of scalaLParTok:                              "("
    of scalaRParTok:                              ")"
    of scalaAsteriskTok:                          "*"
    of scalaPlusTok:                              "+"
    of scalaCommaTok:                             ","
    of scalaMinusTok:                             "-"
    of scalaDotTok:                               "."
    of scalaColonTok:                             ":"
    of scalaSemicolonTok:                         ";"
    of scalaLessThanPercentTok:                   "<%"
    of scalaLessThanMinusTok:                     "<-"
    of scalaLessThanColonTok:                     "<:"
    of scalaEqualTok:                             "="
    of scalaEqualGreaterThanTok:                  "=>"
    of scalaGreaterThanColonTok:                  ">:"
    of scalaAtTok:                                "@"
    of scalaLBrackTok:                            "["
    of scalaRBrackTok:                            "]"
    of scalaAbstractTok:                          "abstract"
    of scalaCaseTok:                              "case"
    of scalaCatchTok:                             "catch"
    of scalaCharacterLiteral:                     "character_literal"
    of scalaClassTok:                             "class"
    of scalaComment:                              "comment"
    of scalaDefTok:                               "def"
    of scalaDoTok:                                "do"
    of scalaElseTok:                              "else"
    of scalaExtendsTok:                           "extends"
    of scalaFalseTok:                             "false"
    of scalaFinalTok:                             "final"
    of scalaFinallyTok:                           "finally"
    of scalaFloatingPointLiteral:                 "floating_point_literal"
    of scalaForTok:                               "for"
    of scalaIdentifier:                           "identifier"
    of scalaIfTok:                                "if"
    of scalaImplicitTok:                          "implicit"
    of scalaImportTok:                            "import"
    of scalaIntegerLiteral:                       "integer_literal"
    of scalaLazyTok:                              "lazy"
    of scalaMatchTok:                             "match"
    of scalaNewTok:                               "new"
    of scalaNullLiteral:                          "null_literal"
    of scalaObjectTok:                            "object"
    of scalaOperatorIdentifier:                   "operator_identifier"
    of scalaOverrideTok:                          "override"
    of scalaPackageTok:                           "package"
    of scalaPrivateTok:                           "private"
    of scalaProtectedTok:                         "protected"
    of scalaReturnTok:                            "return"
    of scalaSealedTok:                            "sealed"
    of scalaSymbolLiteral:                        "symbol_literal"
    of scalaThrowTok:                             "throw"
    of scalaTraitTok:                             "trait"
    of scalaTrueTok:                              "true"
    of scalaTryTok:                               "try"
    of scalaTypeTok:                              "type"
    of scalaTypeIdentifier:                       "type_identifier"
    of scalaValTok:                               "val"
    of scalaVarTok:                               "var"
    of scalaWhileTok:                             "while"
    of scalaWildcard:                             "wildcard"
    of scalaWithTok:                              "with"
    of scalaYieldTok:                             "yield"
    of scalaLCurlyTok:                            "{"
    of scalaPipeTok:                              "|"
    of scalaRCurlyTok:                            "}"
    of scalaTildeTok:                             "~"
    of scalaHidSimpleString:                      "_simple_string"
    of scalaHidSimpleMultilineString:             "_simple_multiline_string"
    of scalaHidSimpleType:                        "_simple_type"
    of scalaHidVariantTypeParameter:              "_variant_type_parameter"
    of scalaHidInterpolatedMultilineStringMiddle: "_interpolated_multiline_string_middle"
    of scalaHidType:                              "_type"
    of scalaHidInterpolatedMultilineStringEnd:    "_interpolated_multiline_string_end"
    of scalaHidObjectDefinition:                  "_object_definition"
    of scalaHidInterpolatedStringMiddle:          "_interpolated_string_middle"
    of scalaHidTypeParameter:                     "_type_parameter"
    of scalaHidSemicolon:                         "_semicolon"
    of scalaHidParamType:                         "_param_type"
    of scalaLiteral:                              "literal"
    of scalaHidBlock:                             "_block"
    of scalaHidTypeIdentifier:                    "_type_identifier"
    of scalaHidInterpolatedStringStart:           "_interpolated_string_start"
    of scalaHidInterpolatedMultilineStringStart:  "_interpolated_multiline_string_start"
    of scalaHidImportExpression:                  "_import_expression"
    of scalaHidAutomaticSemicolon:                "_automatic_semicolon"
    of scalaHidInterpolatedStringEnd:             "_interpolated_string_end"
    of scalaHidAnnotatedType:                     "_annotated_type"
    of scalaSyntaxError:                          "ERROR"

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

const scalaAllowedSubnodes*: array[ScalaNodeKind, set[ScalaNodeKind]] = block:
                                                                          var tmp: array[ScalaNodeKind, set[ScalaNodeKind]]
                                                                          tmp[scalaAccessModifier] = {scalaAccessQualifier}
                                                                          tmp[scalaAccessQualifier] = {scalaIdentifier}
                                                                          tmp[scalaAlternativePattern] = {scalaHidPattern}
                                                                          tmp[scalaArguments] = {scalaExpression}
                                                                          tmp[scalaAscriptionExpression] = {
                                                                                                             scalaAnnotation,
                                                                                                             scalaCompoundType,
                                                                                                             scalaExpression,
                                                                                                             scalaFunctionType,
                                                                                                             scalaGenericType,
                                                                                                             scalaInfixType,
                                                                                                             scalaLazyParameterType,
                                                                                                             scalaProjectedType,
                                                                                                             scalaRepeatedParameterType,
                                                                                                             scalaStableTypeIdentifier,
                                                                                                             scalaTupleType,
                                                                                                             scalaTypeIdentifier
                                                                                                           }
                                                                          tmp[scalaBindings] = {scalaBinding}
                                                                          tmp[scalaBlock] = {scalaHidDefinition, scalaExpression}
                                                                          tmp[scalaCaseBlock] = {scalaCaseClause}
                                                                          tmp[scalaCaseClause] = {scalaGuard}
                                                                          tmp[scalaCatchClause] = {scalaCaseBlock}
                                                                          tmp[scalaClassDefinition] = {scalaAccessModifier, scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaClassParameter] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaClassParameters] = {scalaClassParameter}
                                                                          tmp[scalaCompilationUnit] = {scalaHidDefinition}
                                                                          tmp[scalaEnumerator] = {scalaHidPattern, scalaExpression, scalaGuard}
                                                                          tmp[scalaEnumerators] = {scalaEnumerator}
                                                                          tmp[scalaExtendsClause] = {scalaArguments}
                                                                          tmp[scalaFinallyClause] = {scalaExpression}
                                                                          tmp[scalaFunctionDeclaration] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaFunctionDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaImportDeclaration] = {scalaImportSelectors, scalaWildcard}
                                                                          tmp[scalaImportSelectors] = {scalaIdentifier, scalaRenamedIdentifier}
                                                                          tmp[scalaInstanceExpression] = {scalaExpression}
                                                                          tmp[scalaInterpolatedString] = {scalaInterpolation}
                                                                          tmp[scalaInterpolatedStringExpression] = {scalaIdentifier, scalaInterpolatedString}
                                                                          tmp[scalaInterpolation] = {scalaBlock, scalaIdentifier}
                                                                          tmp[scalaLambdaExpression] = {scalaBindings, scalaExpression}
                                                                          tmp[scalaModifiers] = {scalaAccessModifier}
                                                                          tmp[scalaObjectDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaPackageIdentifier] = {scalaIdentifier}
                                                                          tmp[scalaParameter] = {scalaAnnotation}
                                                                          tmp[scalaParameterTypes] = {
                                                                                                       scalaAnnotation,
                                                                                                       scalaCompoundType,
                                                                                                       scalaFunctionType,
                                                                                                       scalaGenericType,
                                                                                                       scalaInfixType,
                                                                                                       scalaLazyParameterType,
                                                                                                       scalaProjectedType,
                                                                                                       scalaRepeatedParameterType,
                                                                                                       scalaStableTypeIdentifier,
                                                                                                       scalaTupleType,
                                                                                                       scalaTypeIdentifier
                                                                                                     }
                                                                          tmp[scalaParameters] = {scalaParameter}
                                                                          tmp[scalaParenthesizedExpression] = {scalaExpression}
                                                                          tmp[scalaPostfixExpression] = {scalaExpression, scalaOperatorIdentifier}
                                                                          tmp[scalaPrefixExpression] = {scalaExpression}
                                                                          tmp[scalaReturnExpression] = {scalaExpression}
                                                                          tmp[scalaStableIdentifier] = {scalaIdentifier, scalaStableIdentifier}
                                                                          tmp[scalaStableTypeIdentifier] = {scalaIdentifier, scalaStableIdentifier, scalaTypeIdentifier}
                                                                          tmp[scalaTemplateBody] = {scalaHidDefinition, scalaExpression}
                                                                          tmp[scalaThrowExpression] = {scalaExpression}
                                                                          tmp[scalaTraitDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaTryExpression] = {scalaCatchClause, scalaFinallyClause}
                                                                          tmp[scalaTupleExpression] = {scalaExpression}
                                                                          tmp[scalaTuplePattern] = {scalaHidPattern}
                                                                          tmp[scalaTupleType] = {
                                                                                                  scalaAnnotation,
                                                                                                  scalaCompoundType,
                                                                                                  scalaFunctionType,
                                                                                                  scalaGenericType,
                                                                                                  scalaInfixType,
                                                                                                  scalaProjectedType,
                                                                                                  scalaStableTypeIdentifier,
                                                                                                  scalaTupleType,
                                                                                                  scalaTypeIdentifier
                                                                                                }
                                                                          tmp[scalaTypeArguments] = {
                                                                                                      scalaAnnotation,
                                                                                                      scalaCompoundType,
                                                                                                      scalaFunctionType,
                                                                                                      scalaGenericType,
                                                                                                      scalaInfixType,
                                                                                                      scalaProjectedType,
                                                                                                      scalaStableTypeIdentifier,
                                                                                                      scalaTupleType,
                                                                                                      scalaTypeIdentifier
                                                                                                    }
                                                                          tmp[scalaTypeDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaTypeParameters] = {scalaAnnotation, scalaContravariantTypeParameter, scalaCovariantTypeParameter}
                                                                          tmp[scalaValDeclaration] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaValDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaVarDeclaration] = {scalaAnnotation, scalaModifiers}
                                                                          tmp[scalaVarDefinition] = {scalaAnnotation, scalaModifiers}
                                                                          tmp
const scalaTokenKinds*: set[ScalaNodeKind] = {
                                               scalaExclamationTok,
                                               scalaHashTok,
                                               scalaDollarTok,
                                               scalaLParTok,
                                               scalaRParTok,
                                               scalaAsteriskTok,
                                               scalaPlusTok,
                                               scalaCommaTok,
                                               scalaMinusTok,
                                               scalaDotTok,
                                               scalaColonTok,
                                               scalaSemicolonTok,
                                               scalaLessThanPercentTok,
                                               scalaLessThanMinusTok,
                                               scalaLessThanColonTok,
                                               scalaEqualTok,
                                               scalaEqualGreaterThanTok,
                                               scalaGreaterThanColonTok,
                                               scalaAtTok,
                                               scalaLBrackTok,
                                               scalaRBrackTok,
                                               scalaAbstractTok,
                                               scalaCaseTok,
                                               scalaCatchTok,
                                               scalaClassTok,
                                               scalaDefTok,
                                               scalaDoTok,
                                               scalaElseTok,
                                               scalaExtendsTok,
                                               scalaFalseTok,
                                               scalaFinalTok,
                                               scalaFinallyTok,
                                               scalaForTok,
                                               scalaIfTok,
                                               scalaImplicitTok,
                                               scalaImportTok,
                                               scalaLazyTok,
                                               scalaMatchTok,
                                               scalaNewTok,
                                               scalaObjectTok,
                                               scalaOverrideTok,
                                               scalaPackageTok,
                                               scalaPrivateTok,
                                               scalaProtectedTok,
                                               scalaReturnTok,
                                               scalaSealedTok,
                                               scalaThrowTok,
                                               scalaTraitTok,
                                               scalaTrueTok,
                                               scalaTryTok,
                                               scalaTypeTok,
                                               scalaValTok,
                                               scalaVarTok,
                                               scalaWhileTok,
                                               scalaWithTok,
                                               scalaYieldTok,
                                               scalaLCurlyTok,
                                               scalaPipeTok,
                                               scalaRCurlyTok,
                                               scalaTildeTok
                                             }
const scalaHiddenKinds*: set[ScalaNodeKind] = {
                                                scalaHidSimpleString,
                                                scalaHidSimpleMultilineString,
                                                scalaHidSimpleType,
                                                scalaHidVariantTypeParameter,
                                                scalaHidInterpolatedMultilineStringMiddle,
                                                scalaHidType,
                                                scalaHidInterpolatedMultilineStringEnd,
                                                scalaHidDefinition,
                                                scalaHidObjectDefinition,
                                                scalaHidInterpolatedStringMiddle,
                                                scalaHidTypeParameter,
                                                scalaHidSemicolon,
                                                scalaHidParamType,
                                                scalaLiteral,
                                                scalaHidBlock,
                                                scalaHidTypeIdentifier,
                                                scalaHidPattern,
                                                scalaHidInterpolatedStringStart,
                                                scalaHidInterpolatedMultilineStringStart,
                                                scalaHidImportExpression,
                                                scalaHidAutomaticSemicolon,
                                                scalaHidInterpolatedStringEnd,
                                                scalaHidAnnotatedType
                                              }
proc tsNodeType*(node: TsScalaNode): string


proc kind*(node: TsScalaNode): ScalaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_definition":                    scalaHidDefinition
      of "_pattern":                       scalaHidPattern
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


proc treeRepr*(node: TsScalaNode, str: string): string =
  var res = addr result
  proc aux(node: TsScalaNode, level: int) =
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
let scalaGrammar*: array[ScalaNodeKind, HtsRule[ScalaNodeKind]] = block:
                                                                    var rules: array[ScalaNodeKind, HtsRule[ScalaNodeKind]]
                                                                    type
                                                                      K = ScalaNodeKind


                                                                    rules[scalaFloatingPointLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[-]"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRegex[K]("[\\d]+\\.[\\d]+"), tsChoice[K](tsRegex[K]("[eE][+-]?[\\d]+"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[dfDF]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("\\.[\\d]+"), tsChoice[K](tsRegex[K]("[eE][+-]?[\\d]+"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[dfDF]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("[\\d]+"), tsRegex[K]("[eE][+-]?[\\d]+"), tsChoice[K](tsRegex[K]("[dfDF]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("[\\d]+"), tsChoice[K](tsRegex[K]("[eE][+-]?[\\d]+"), tsBlank[K]()), tsRegex[K]("[dfDF]"))))
                                                                    rules[scalaInterpolation] = tsSeq[K](tsString[K]("$"), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaBlock)))
                                                                    rules[scalaTypeParameters] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](scalaHidVariantTypeParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidVariantTypeParameter)))), tsString[K]("]"))
                                                                    rules[scalaCaseClause] = tsSeq[K](tsString[K]("case"), tsSymbol[K](scalaHidPattern), tsChoice[K](tsSymbol[K](scalaGuard), tsBlank[K]()), tsString[K]("=>"), tsChoice[K](tsSymbol[K](scalaHidBlock), tsBlank[K]()))
                                                                    rules[scalaTryExpression] = tsSeq[K](tsString[K]("try"), tsSymbol[K](scalaExpression), tsChoice[K](tsSymbol[K](scalaCatchClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaFinallyClause), tsBlank[K]()))
                                                                    rules[scalaCapturePattern] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsString[K]("@"), tsSymbol[K](scalaHidPattern))
                                                                    rules[scalaLowerBound] = tsSeq[K](tsString[K](">:"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaTypeDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("type"), tsSymbol[K](scalaHidTypeIdentifier), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsString[K]("="), tsSymbol[K](scalaHidType))
                                                                    rules[scalaCharacterLiteral] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu]"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}"), tsRegex[K]("x[0-9a-fA-F]{2}"))), tsRegex[K]("[^\\\\\'\\n]")), tsBlank[K]()), tsString[K]("\'"))
                                                                    rules[scalaInfixPattern] = tsSeq[K](tsSymbol[K](scalaHidPattern), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)), tsSymbol[K](scalaHidPattern))
                                                                    rules[scalaTraitDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("trait"), tsSymbol[K](scalaIdentifier), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaExtendsClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaTemplateBody), tsBlank[K]()))
                                                                    rules[scalaLambdaExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaBindings), tsSymbol[K](scalaIdentifier)), tsString[K]("=>"), tsSymbol[K](scalaExpression))
                                                                    rules[scalaCompilationUnit] = tsRepeat[K](tsSymbol[K](scalaHidDefinition))
                                                                    rules[scalaBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                    rules[scalaHidDefinition] = tsChoice[K](tsSymbol[K](scalaPackageClause), tsSymbol[K](scalaPackageObject), tsSymbol[K](scalaClassDefinition), tsSymbol[K](scalaImportDeclaration), tsSymbol[K](scalaObjectDefinition), tsSymbol[K](scalaTraitDefinition), tsSymbol[K](scalaValDefinition), tsSymbol[K](scalaValDeclaration), tsSymbol[K](scalaVarDefinition), tsSymbol[K](scalaVarDeclaration), tsSymbol[K](scalaTypeDefinition), tsSymbol[K](scalaFunctionDefinition), tsSymbol[K](scalaFunctionDeclaration))
                                                                    rules[scalaValDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("val"), tsSymbol[K](scalaHidPattern), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType)), tsBlank[K]()), tsString[K]("="), tsSymbol[K](scalaExpression))
                                                                    rules[scalaValDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("val"), tsSeq[K](tsSymbol[K](scalaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaIdentifier)))), tsString[K](":"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaVarDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("var"), tsSymbol[K](scalaHidPattern), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType)), tsBlank[K]()), tsString[K]("="), tsSymbol[K](scalaExpression))
                                                                    rules[scalaContravariantTypeParameter] = tsSeq[K](tsString[K]("-"), tsSymbol[K](scalaHidTypeParameter))
                                                                    rules[scalaExtendsClause] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](scalaHidType), tsChoice[K](tsSymbol[K](scalaArguments), tsBlank[K]()))
                                                                    rules[scalaIfExpression] = tsSeq[K](tsString[K]("if"), tsSymbol[K](scalaParenthesizedExpression), tsSymbol[K](scalaExpression), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](scalaExpression)), tsBlank[K]()))
                                                                    rules[scalaTupleExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](scalaExpression), tsRepeat1[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaExpression))), tsString[K](")"))
                                                                    rules[scalaTuplePattern] = tsSeq[K](tsString[K]("("), tsSymbol[K](scalaHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidPattern))), tsString[K](")"))
                                                                    rules[scalaHidTypeParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaWildcard), tsSymbol[K](scalaIdentifier)), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaUpperBound), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaLowerBound), tsBlank[K]()), tsChoice[K](tsRepeat[K](tsSymbol[K](scalaViewBound)), tsBlank[K]()), tsChoice[K](tsRepeat[K](tsSymbol[K](scalaContextBound)), tsBlank[K]()))
                                                                    rules[scalaWildcard] = tsString[K]("_")
                                                                    rules[scalaForExpression] = tsSeq[K](tsString[K]("for"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](scalaEnumerators), tsString[K](")")), tsSeq[K](tsString[K]("{"), tsSymbol[K](scalaEnumerators), tsString[K]("}"))), tsChoice[K](tsString[K]("yield"), tsBlank[K]()), tsSymbol[K](scalaExpression))
                                                                    rules[scalaBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](scalaHidBlock), tsBlank[K]()), tsString[K]("}"))
                                                                    rules[scalaProjectedType] = tsSeq[K](tsSymbol[K](scalaHidSimpleType), tsString[K]("#"), tsSymbol[K](scalaHidTypeIdentifier))
                                                                    rules[scalaBinding] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidParamType)), tsBlank[K]()))
                                                                    rules[scalaPackageObject] = tsSeq[K](tsString[K]("package"), tsString[K]("object"), tsSymbol[K](scalaHidObjectDefinition))
                                                                    rules[scalaCompoundType] = tsSeq[K](tsSymbol[K](scalaHidAnnotatedType), tsRepeat1[K](tsSeq[K](tsString[K]("with"), tsSymbol[K](scalaHidAnnotatedType))))
                                                                    rules[scalaFunctionType] = tsSeq[K](tsSymbol[K](scalaParameterTypes), tsString[K]("=>"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaVarDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("var"), tsSeq[K](tsSymbol[K](scalaIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaIdentifier)))), tsString[K](":"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaHidParamType] = tsChoice[K](tsSymbol[K](scalaHidType), tsSymbol[K](scalaLazyParameterType), tsSymbol[K](scalaRepeatedParameterType))
                                                                    rules[scalaAscriptionExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsString[K](":"), tsSymbol[K](scalaHidParamType))
                                                                    rules[scalaFieldExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsString[K]("."), tsSymbol[K](scalaIdentifier))
                                                                    rules[scalaTemplateBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](scalaHidBlock), tsBlank[K]()), tsString[K]("}"))
                                                                    rules[scalaHidBlock] = tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](scalaExpression), tsSymbol[K](scalaHidDefinition)), tsRepeat[K](tsSeq[K](tsSymbol[K](scalaHidSemicolon), tsChoice[K](tsSymbol[K](scalaExpression), tsSymbol[K](scalaHidDefinition))))), tsChoice[K](tsSymbol[K](scalaHidSemicolon), tsBlank[K]()))
                                                                    rules[scalaHidTypeIdentifier] = tsSymbol[K](scalaIdentifier)
                                                                    rules[scalaExpression] = tsChoice[K](tsSymbol[K](scalaIfExpression), tsSymbol[K](scalaMatchExpression), tsSymbol[K](scalaTryExpression), tsSymbol[K](scalaCallExpression), tsSymbol[K](scalaGenericFunction), tsSymbol[K](scalaAssignmentExpression), tsSymbol[K](scalaParenthesizedExpression), tsSymbol[K](scalaInterpolatedStringExpression), tsSymbol[K](scalaLambdaExpression), tsSymbol[K](scalaFieldExpression), tsSymbol[K](scalaInstanceExpression), tsSymbol[K](scalaPostfixExpression), tsSymbol[K](scalaAscriptionExpression), tsSymbol[K](scalaInfixExpression), tsSymbol[K](scalaPrefixExpression), tsSymbol[K](scalaTupleExpression), tsSymbol[K](scalaCaseBlock), tsSymbol[K](scalaBlock), tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaLiteral), tsSymbol[K](scalaUnit), tsSymbol[K](scalaReturnExpression), tsSymbol[K](scalaThrowExpression), tsSymbol[K](scalaWhileExpression), tsSymbol[K](scalaDoWhileExpression), tsSymbol[K](scalaForExpression))
                                                                    rules[scalaComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                                    rules[scalaIdentifier] = tsRegex[K]("[a-zA-Z_]\\w*")
                                                                    rules[scalaArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](scalaExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaExpression)))), tsBlank[K]()), tsString[K](")"))
                                                                    rules[scalaHidPattern] = tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaStableIdentifier), tsSymbol[K](scalaCapturePattern), tsSymbol[K](scalaTuplePattern), tsSymbol[K](scalaCaseClassPattern), tsSymbol[K](scalaInfixPattern), tsSymbol[K](scalaAlternativePattern), tsSymbol[K](scalaTypedPattern), tsSymbol[K](scalaLiteral), tsSymbol[K](scalaWildcard))
                                                                    rules[scalaObjectDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsChoice[K](tsString[K]("case"), tsBlank[K]()), tsString[K]("object"), tsSymbol[K](scalaHidObjectDefinition))
                                                                    rules[scalaHidInterpolatedStringStart] = tsString[K]("\"")
                                                                    rules[scalaLazyParameterType] = tsSeq[K](tsString[K]("=>"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaImportSelectors] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaRenamedIdentifier)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaRenamedIdentifier))))), tsString[K]("}"))
                                                                    rules[scalaOperatorIdentifier] = tsRegex[K]("[^\\s\\w\\(\\)\\[\\]\\{\\}\'\"`\\.;,]+")
                                                                    rules[scalaInterpolatedStringExpression] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaInterpolatedString))
                                                                    rules[scalaViewBound] = tsSeq[K](tsString[K]("<%"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaInfixType] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaCompoundType), tsSymbol[K](scalaInfixType), tsSymbol[K](scalaHidAnnotatedType)), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)), tsChoice[K](tsSymbol[K](scalaCompoundType), tsSymbol[K](scalaInfixType), tsSymbol[K](scalaHidAnnotatedType)))
                                                                    rules[scalaFinallyClause] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](scalaExpression))
                                                                    rules[scalaHidImportExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaStableIdentifier), tsSymbol[K](scalaIdentifier)), tsChoice[K](tsSeq[K](tsString[K]("."), tsChoice[K](tsSymbol[K](scalaWildcard), tsSymbol[K](scalaImportSelectors))), tsBlank[K]()))
                                                                    rules[scalaAccessModifier] = tsSeq[K](tsChoice[K](tsString[K]("private"), tsString[K]("protected")), tsChoice[K](tsSymbol[K](scalaAccessQualifier), tsBlank[K]()))
                                                                    rules[scalaPostfixExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)))
                                                                    rules[scalaClassDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsChoice[K](tsString[K]("case"), tsBlank[K]()), tsString[K]("class"), tsSymbol[K](scalaIdentifier), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaAccessModifier), tsBlank[K]()), tsRepeat[K](tsSymbol[K](scalaClassParameters)), tsChoice[K](tsSymbol[K](scalaExtendsClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaTemplateBody), tsBlank[K]()))
                                                                    rules[scalaWhileExpression] = tsSeq[K](tsString[K]("while"), tsSymbol[K](scalaParenthesizedExpression), tsSymbol[K](scalaExpression))
                                                                    rules[scalaTypedPattern] = tsSeq[K](tsSymbol[K](scalaHidPattern), tsString[K](":"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaGuard] = tsSeq[K](tsString[K]("if"), tsSymbol[K](scalaExpression))
                                                                    rules[scalaParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](scalaExpression), tsString[K](")"))
                                                                    rules[scalaInstanceExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](scalaExpression))
                                                                    rules[scalaUpperBound] = tsSeq[K](tsString[K]("<:"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaFunctionDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("def"), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsRepeat[K](tsSymbol[K](scalaParameters)), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType)), tsBlank[K]()))
                                                                    rules[scalaParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsSymbol[K](scalaIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidParamType)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](scalaExpression)), tsBlank[K]()))
                                                                    rules[scalaBindings] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](scalaBinding), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaBinding)))), tsBlank[K]()), tsString[K](")"))
                                                                    rules[scalaCovariantTypeParameter] = tsSeq[K](tsString[K]("+"), tsSymbol[K](scalaHidTypeParameter))
                                                                    rules[scalaHidSimpleType] = tsChoice[K](tsSymbol[K](scalaGenericType), tsSymbol[K](scalaProjectedType), tsSymbol[K](scalaTupleType), tsSymbol[K](scalaStableTypeIdentifier), tsSymbol[K](scalaHidTypeIdentifier))
                                                                    rules[scalaHidVariantTypeParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaCovariantTypeParameter), tsSymbol[K](scalaContravariantTypeParameter), tsSymbol[K](scalaHidTypeParameter)))
                                                                    rules[scalaModifiers] = tsRepeat1[K](tsChoice[K](tsString[K]("abstract"), tsString[K]("final"), tsString[K]("sealed"), tsString[K]("implicit"), tsString[K]("lazy"), tsString[K]("override"), tsSymbol[K](scalaAccessModifier)))
                                                                    rules[scalaHidType] = tsChoice[K](tsSymbol[K](scalaFunctionType), tsSymbol[K](scalaCompoundType), tsSymbol[K](scalaInfixType), tsSymbol[K](scalaHidAnnotatedType))
                                                                    rules[scalaNullLiteral] = tsString[K]("null")
                                                                    rules[scalaPackageIdentifier] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](scalaIdentifier))))
                                                                    rules[scalaSymbolLiteral] = tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[^\\\\\'\\n]")))
                                                                    rules[scalaClassParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsString[K]("implicit"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](scalaClassParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaClassParameter)))), tsBlank[K]()), tsString[K](")"))
                                                                    rules[scalaCallExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsChoice[K](tsSymbol[K](scalaArguments), tsSymbol[K](scalaCaseBlock), tsSymbol[K](scalaBlock)))
                                                                    rules[scalaUnit] = tsSeq[K](tsString[K]("("), tsString[K](")"))
                                                                    rules[scalaCaseBlock] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsString[K]("}")), tsSeq[K](tsString[K]("{"), tsRepeat1[K](tsSymbol[K](scalaCaseClause)), tsString[K]("}")))
                                                                    rules[scalaHidObjectDefinition] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsChoice[K](tsSymbol[K](scalaExtendsClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](scalaTemplateBody), tsBlank[K]()))
                                                                    rules[scalaDoWhileExpression] = tsSeq[K](tsString[K]("do"), tsSymbol[K](scalaExpression), tsString[K]("while"), tsSymbol[K](scalaParenthesizedExpression))
                                                                    rules[scalaString] = tsChoice[K](tsSymbol[K](scalaHidSimpleString), tsSymbol[K](scalaHidSimpleMultilineString))
                                                                    rules[scalaStableIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaStableIdentifier)), tsString[K]("."), tsSymbol[K](scalaIdentifier))
                                                                    rules[scalaAnnotation] = tsSeq[K](tsString[K]("@"), tsSymbol[K](scalaHidSimpleType), tsRepeat[K](tsSymbol[K](scalaArguments)))
                                                                    rules[scalaEnumerators] = tsSeq[K](tsSeq[K](tsSymbol[K](scalaEnumerator), tsRepeat[K](tsSeq[K](tsSymbol[K](scalaHidSemicolon), tsSymbol[K](scalaEnumerator)))), tsChoice[K](tsSymbol[K](scalaHidAutomaticSemicolon), tsBlank[K]()))
                                                                    rules[scalaInterpolatedString] = tsChoice[K](tsSeq[K](tsSymbol[K](scalaHidInterpolatedStringStart), tsRepeat[K](tsSeq[K](tsSymbol[K](scalaHidInterpolatedStringMiddle), tsSymbol[K](scalaInterpolation))), tsSymbol[K](scalaHidInterpolatedStringEnd)), tsSeq[K](tsSymbol[K](scalaHidInterpolatedMultilineStringStart), tsRepeat[K](tsSeq[K](tsSymbol[K](scalaHidInterpolatedMultilineStringMiddle), tsSymbol[K](scalaInterpolation))), tsSymbol[K](scalaHidInterpolatedMultilineStringEnd)))
                                                                    rules[scalaMatchExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsString[K]("match"), tsSymbol[K](scalaCaseBlock))
                                                                    rules[scalaIntegerLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[-]"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[\\d]+"), tsRegex[K]("0[xX][\\da-fA-F]+")), tsChoice[K](tsRegex[K]("[lL]"), tsBlank[K]()))
                                                                    rules[scalaAccessQualifier] = tsSeq[K](tsString[K]("["), tsSymbol[K](scalaIdentifier), tsString[K]("]"))
                                                                    rules[scalaFunctionDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsString[K]("def"), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)), tsChoice[K](tsSymbol[K](scalaTypeParameters), tsBlank[K]()), tsRepeat[K](tsSymbol[K](scalaParameters)), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](scalaExpression)), tsSymbol[K](scalaBlock)))
                                                                    rules[scalaHidSemicolon] = tsChoice[K](tsString[K](";"), tsSymbol[K](scalaHidAutomaticSemicolon))
                                                                    rules[scalaCaseClassPattern] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaHidTypeIdentifier), tsSymbol[K](scalaStableTypeIdentifier)), tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](scalaHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidPattern)))), tsBlank[K]()), tsString[K](")"))
                                                                    rules[scalaPrefixExpression] = tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("!"), tsString[K]("~")), tsSymbol[K](scalaExpression))
                                                                    rules[scalaContextBound] = tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType))
                                                                    rules[scalaLiteral] = tsChoice[K](tsSymbol[K](scalaIntegerLiteral), tsSymbol[K](scalaFloatingPointLiteral), tsSymbol[K](scalaBooleanLiteral), tsSymbol[K](scalaCharacterLiteral), tsSymbol[K](scalaSymbolLiteral), tsSymbol[K](scalaString), tsSymbol[K](scalaNullLiteral))
                                                                    rules[scalaThrowExpression] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](scalaExpression))
                                                                    rules[scalaEnumerator] = tsSeq[K](tsSymbol[K](scalaHidPattern), tsChoice[K](tsString[K]("<-"), tsString[K]("=")), tsSymbol[K](scalaExpression), tsChoice[K](tsSymbol[K](scalaGuard), tsBlank[K]()))
                                                                    rules[scalaRepeatedParameterType] = tsSeq[K](tsSymbol[K](scalaHidType), tsString[K]("*"))
                                                                    rules[scalaAlternativePattern] = tsSeq[K](tsSymbol[K](scalaHidPattern), tsString[K]("|"), tsSymbol[K](scalaHidPattern))
                                                                    rules[scalaTupleType] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](scalaHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidType)))), tsString[K](")"))
                                                                    rules[scalaPackageClause] = tsSeq[K](tsString[K]("package"), tsSymbol[K](scalaPackageIdentifier), tsChoice[K](tsSymbol[K](scalaTemplateBody), tsBlank[K]()))
                                                                    rules[scalaCatchClause] = tsSeq[K](tsString[K]("catch"), tsSymbol[K](scalaCaseBlock))
                                                                    rules[scalaParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsString[K]("implicit"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](scalaParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaParameter)))), tsBlank[K]()), tsString[K](")"))
                                                                    rules[scalaGenericFunction] = tsSeq[K](tsSymbol[K](scalaExpression), tsSymbol[K](scalaTypeArguments))
                                                                    rules[scalaParameterTypes] = tsChoice[K](tsSymbol[K](scalaHidAnnotatedType), tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](scalaHidParamType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidParamType)))), tsBlank[K]()), tsString[K](")")), tsSymbol[K](scalaCompoundType), tsSymbol[K](scalaInfixType))
                                                                    rules[scalaImportDeclaration] = tsSeq[K](tsString[K]("import"), tsSeq[K](tsSymbol[K](scalaHidImportExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidImportExpression)))))
                                                                    rules[scalaInfixExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaOperatorIdentifier)), tsSymbol[K](scalaExpression))
                                                                    rules[scalaStableTypeIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaStableIdentifier)), tsString[K]("."), tsSymbol[K](scalaHidTypeIdentifier))
                                                                    rules[scalaAssignmentExpression] = tsSeq[K](tsSymbol[K](scalaExpression), tsString[K]("="), tsSymbol[K](scalaExpression))
                                                                    rules[scalaTypeArguments] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](scalaHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](scalaHidType)))), tsString[K]("]"))
                                                                    rules[scalaClassParameter] = tsSeq[K](tsRepeat[K](tsSymbol[K](scalaAnnotation)), tsChoice[K](tsSymbol[K](scalaModifiers), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("val"), tsString[K]("var")), tsBlank[K]()), tsSymbol[K](scalaIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](scalaHidType)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](scalaExpression)), tsBlank[K]()))
                                                                    rules[scalaReturnExpression] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](scalaExpression), tsBlank[K]()))
                                                                    rules[scalaHidInterpolatedMultilineStringStart] = tsString[K]("\"\"\"")
                                                                    rules[scalaRenamedIdentifier] = tsSeq[K](tsSymbol[K](scalaIdentifier), tsString[K]("=>"), tsChoice[K](tsSymbol[K](scalaIdentifier), tsSymbol[K](scalaWildcard)))
                                                                    rules[scalaGenericType] = tsSeq[K](tsSymbol[K](scalaHidSimpleType), tsSymbol[K](scalaTypeArguments))
                                                                    rules[scalaHidAnnotatedType] = tsSeq[K](tsSymbol[K](scalaHidSimpleType), tsRepeat[K](tsSymbol[K](scalaAnnotation)))
                                                                    rules

