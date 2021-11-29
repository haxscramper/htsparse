import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  PhpNodeKind* = enum
    phpHidExpression                           ## _expression
    phpHidLiteral                              ## _literal
    phpHidPrimaryExpression                    ## _primary_expression
    phpHidStatement                            ## _statement
    phpHidType                                 ## _type
    phpAbstractModifier                        ## abstract_modifier
    phpAnonymousFunctionCreationExpression     ## anonymous_function_creation_expression
    phpAnonymousFunctionUseClause              ## anonymous_function_use_clause
    phpArgument                                ## argument
    phpArguments                               ## arguments
    phpArrayCreationExpression                 ## array_creation_expression
    phpArrayElementInitializer                 ## array_element_initializer
    phpArrowFunction                           ## arrow_function
    phpAssignmentExpression                    ## assignment_expression
    phpAttribute                               ## attribute
    phpAttributeList                           ## attribute_list
    phpAugmentedAssignmentExpression           ## augmented_assignment_expression
    phpBaseClause                              ## base_clause
    phpBinaryExpression                        ## binary_expression
    phpBreakStatement                          ## break_statement
    phpByRef                                   ## by_ref
    phpCaseStatement                           ## case_statement
    phpCastExpression                          ## cast_expression
    phpCastType                                ## cast_type
    phpCatchClause                             ## catch_clause
    phpClassConstantAccessExpression           ## class_constant_access_expression
    phpClassDeclaration                        ## class_declaration
    phpClassInterfaceClause                    ## class_interface_clause
    phpCloneExpression                         ## clone_expression
    phpColonBlock                              ## colon_block
    phpCompoundStatement                       ## compound_statement
    phpConditionalExpression                   ## conditional_expression
    phpConstDeclaration                        ## const_declaration
    phpConstElement                            ## const_element
    phpContinueStatement                       ## continue_statement
    phpDeclarationList                         ## declaration_list
    phpDeclareDirective                        ## declare_directive
    phpDeclareStatement                        ## declare_statement
    phpDefaultStatement                        ## default_statement
    phpDoStatement                             ## do_statement
    phpDynamicVariableName                     ## dynamic_variable_name
    phpEchoStatement                           ## echo_statement
    phpElseClause                              ## else_clause
    phpElseIfClause                            ## else_if_clause
    phpEmptyStatement                          ## empty_statement
    phpEncapsedString                          ## encapsed_string
    phpEnumCase                                ## enum_case
    phpEnumDeclaration                         ## enum_declaration
    phpEnumDeclarationList                     ## enum_declaration_list
    phpExponentiationExpression                ## exponentiation_expression
    phpExpressionStatement                     ## expression_statement
    phpFinalModifier                           ## final_modifier
    phpFinallyClause                           ## finally_clause
    phpForStatement                            ## for_statement
    phpForeachStatement                        ## foreach_statement
    phpFormalParameters                        ## formal_parameters
    phpFunctionCallExpression                  ## function_call_expression
    phpFunctionDefinition                      ## function_definition
    phpFunctionStaticDeclaration               ## function_static_declaration
    phpGlobalDeclaration                       ## global_declaration
    phpGotoStatement                           ## goto_statement
    phpIfStatement                             ## if_statement
    phpIncludeExpression                       ## include_expression
    phpIncludeOnceExpression                   ## include_once_expression
    phpInterfaceDeclaration                    ## interface_declaration
    phpListLiteral                             ## list_literal
    phpMatchBlock                              ## match_block
    phpMatchConditionList                      ## match_condition_list
    phpMatchConditionalExpression              ## match_conditional_expression
    phpMatchDefaultExpression                  ## match_default_expression
    phpMatchExpression                         ## match_expression
    phpMemberAccessExpression                  ## member_access_expression
    phpMemberCallExpression                    ## member_call_expression
    phpMethodDeclaration                       ## method_declaration
    phpName                                    ## name
    phpNamedLabelStatement                     ## named_label_statement
    phpNamedType                               ## named_type
    phpNamespaceAliasingClause                 ## namespace_aliasing_clause
    phpNamespaceDefinition                     ## namespace_definition
    phpNamespaceName                           ## namespace_name
    phpNamespaceNameAsPrefix                   ## namespace_name_as_prefix
    phpNamespaceUseClause                      ## namespace_use_clause
    phpNamespaceUseDeclaration                 ## namespace_use_declaration
    phpNamespaceUseGroup                       ## namespace_use_group
    phpNamespaceUseGroupClause                 ## namespace_use_group_clause
    phpNullsafeMemberAccessExpression          ## nullsafe_member_access_expression
    phpNullsafeMemberCallExpression            ## nullsafe_member_call_expression
    phpObjectCreationExpression                ## object_creation_expression
    phpOptionalType                            ## optional_type
    phpPair                                    ## pair
    phpParenthesizedExpression                 ## parenthesized_expression
    phpPrimitiveType                           ## primitive_type
    phpPrintIntrinsic                          ## print_intrinsic
    phpProgram                                 ## program
    phpPropertyDeclaration                     ## property_declaration
    phpPropertyElement                         ## property_element
    phpPropertyInitializer                     ## property_initializer
    phpPropertyPromotionParameter              ## property_promotion_parameter
    phpQualifiedName                           ## qualified_name
    phpReferenceAssignmentExpression           ## reference_assignment_expression
    phpReferenceModifier                       ## reference_modifier
    phpRelativeScope                           ## relative_scope
    phpRequireExpression                       ## require_expression
    phpRequireOnceExpression                   ## require_once_expression
    phpReturnStatement                         ## return_statement
    phpScopedCallExpression                    ## scoped_call_expression
    phpScopedPropertyAccessExpression          ## scoped_property_access_expression
    phpSequenceExpression                      ## sequence_expression
    phpSimpleParameter                         ## simple_parameter
    phpStaticModifier                          ## static_modifier
    phpStaticVariableDeclaration               ## static_variable_declaration
    phpString                                  ## string
    phpSubscriptExpression                     ## subscript_expression
    phpSwitchBlock                             ## switch_block
    phpSwitchStatement                         ## switch_statement
    phpText                                    ## text
    phpTextInterpolation                       ## text_interpolation
    phpThrowExpression                         ## throw_expression
    phpTraitDeclaration                        ## trait_declaration
    phpTryStatement                            ## try_statement
    phpTypeList                                ## type_list
    phpUnaryOpExpression                       ## unary_op_expression
    phpUnsetStatement                          ## unset_statement
    phpUpdateExpression                        ## update_expression
    phpUseAsClause                             ## use_as_clause
    phpUseDeclaration                          ## use_declaration
    phpUseInsteadOfClause                      ## use_instead_of_clause
    phpUseList                                 ## use_list
    phpVariableName                            ## variable_name
    phpVariadicParameter                       ## variadic_parameter
    phpVariadicUnpacking                       ## variadic_unpacking
    phpVisibilityModifier                      ## visibility_modifier
    phpWhileStatement                          ## while_statement
    phpYieldExpression                         ## yield_expression
    phpExclamationTok                          ## !
    phpExclamationEqualTok                     ## !=
    phpExclamationDoubleEqualTok               ## !==
    phpQuoteTok                                ## "
    phpHashLBrackTok                           ## #[
    phpDollarTok                               ## $
    phpPercentTok                              ## %
    phpPercentEqualTok                         ## %=
    phpAmpersandTok                            ## &
    phpDoubleAmpersandTok                      ## &&
    phpAmpersandEqualTok                       ## &=
    phpApostropheTok                           ## '
    phpLParTok                                 ## (
    phpRParTok                                 ## )
    phpAsteriskTok                             ## *
    phpDoubleAsteriskTok                       ## **
    phpDoubleAsteriskEqualTok                  ## **=
    phpAsteriskEqualTok                        ## *=
    phpPlusTok                                 ## +
    phpDoublePlusTok                           ## ++
    phpPlusEqualTok                            ## +=
    phpCommaTok                                ## ,
    phpMinusTok                                ## -
    phpDoubleMinusTok                          ## --
    phpMinusEqualTok                           ## -=
    phpMinusGreaterThanTok                     ## ->
    phpDotTok                                  ## .
    phpTripleDotTok                            ## ...
    phpDotEqualTok                             ## .=
    phpSlashTok                                ## /
    phpSlashEqualTok                           ## /=
    phpColonTok                                ## :
    phpDoubleColonTok                          ## ::
    phpSemicolonTok                            ## ;
    phpLessThanTok                             ## <
    phpDoubleLessThanTok                       ## <<
    phpDoubleLessThanEqualTok                  ## <<=
    phpLessThanEqualTok                        ## <=
    phpLessThanEqualGreaterThanTok             ## <=>
    phpLessThanGreaterThanTok                  ## <>
    phpEqualTok                                ## =
    phpDoubleEqualTok                          ## ==
    phpTripleEqualTok                          ## ===
    phpEqualGreaterThanTok                     ## =>
    phpGreaterThanTok                          ## >
    phpGreaterThanEqualTok                     ## >=
    phpDoubleGreaterThanTok                    ## >>
    phpDoubleGreaterThanEqualTok               ## >>=
    phpQuestionTok                             ## ?
    phpQuestionMinusGreaterThanTok             ## ?->
    phpQuestionGreaterThanTok                  ## ?>
    phpDoubleQuestionTok                       ## ??
    phpDoubleQuestionEqualTok                  ## ??=
    phpAtTok                                   ## @
    phpLBrackTok                               ## [
    phpBackslashTok                            ## \
    phpRBrackTok                               ## ]
    phpAccentTok                               ## ^
    phpAccentEqualTok                          ## ^=
    phpAbstractTok                             ## abstract
    phpAndTok                                  ## and
    phpArrayTok                                ## array
    phpAsTok                                   ## as
    phpBoolTok                                 ## bool
    phpBoolean                                 ## boolean
    phpBreakTok                                ## break
    phpCallableTok                             ## callable
    phpCaseTok                                 ## case
    phpCatchTok                                ## catch
    phpClassTok                                ## class
    phpCloneTok                                ## clone
    phpComment                                 ## comment
    phpConstTok                                ## const
    phpContinueTok                             ## continue
    phpDeclareTok                              ## declare
    phpDefaultTok                              ## default
    phpDoTok                                   ## do
    phpEchoTok                                 ## echo
    phpElseTok                                 ## else
    phpElseifTok                               ## elseif
    phpEncodingTok                             ## encoding
    phpEnddeclareTok                           ## enddeclare
    phpEndforTok                               ## endfor
    phpEndforeachTok                           ## endforeach
    phpEndifTok                                ## endif
    phpEndswitchTok                            ## endswitch
    phpEndwhileTok                             ## endwhile
    phpEnumTok                                 ## enum
    phpEscapeSequence                          ## escape_sequence
    phpExtendsTok                              ## extends
    phpFalseTok                                ## false
    phpFinalTok                                ## final
    phpFinallyTok                              ## finally
    phpFloat                                   ## float
    phpFloatTok                                ## float
    phpFnTok                                   ## fn
    phpForTok                                  ## for
    phpForeachTok                              ## foreach
    phpFromTok                                 ## from
    phpFunctionTok                             ## function
    phpGlobalTok                               ## global
    phpGotoTok                                 ## goto
    phpHeredoc                                 ## heredoc
    phpIfTok                                   ## if
    phpImplementsTok                           ## implements
    phpIncludeTok                              ## include
    phpIncludeOnceTok                          ## include_once
    phpInstanceofTok                           ## instanceof
    phpInsteadofTok                            ## insteadof
    phpIntTok                                  ## int
    phpInteger                                 ## integer
    phpInterfaceTok                            ## interface
    phpIterableTok                             ## iterable
    phpListTok                                 ## list
    phpMatchTok                                ## match
    phpMixedTok                                ## mixed
    phpNamespaceTok                            ## namespace
    phpNewTok                                  ## new
    phpNull                                    ## null
    phpNullTok                                 ## null
    phpOrTok                                   ## or
    phpParentTok                               ## parent
    phpPhpTag                                  ## php_tag
    phpPrintTok                                ## print
    phpPrivateTok                              ## private
    phpProtectedTok                            ## protected
    phpPublicTok                               ## public
    phpRequireTok                              ## require
    phpRequireOnceTok                          ## require_once
    phpReturnTok                               ## return
    phpSelfTok                                 ## self
    phpShellCommandExpression                  ## shell_command_expression
    phpStaticTok                               ## static
    phpStrictTypesTok                          ## strict_types
    phpStringTok                               ## string
    phpSwitchTok                               ## switch
    phpThrowTok                                ## throw
    phpTicksTok                                ## ticks
    phpTraitTok                                ## trait
    phpTryTok                                  ## try
    phpUnsetTok                                ## unset
    phpUseTok                                  ## use
    phpVarModifier                             ## var_modifier
    phpVoidTok                                 ## void
    phpWhileTok                                ## while
    phpXorTok                                  ## xor
    phpYieldTok                                ## yield
    phpLCurlyTok                               ## {
    phpPipeTok                                 ## |
    phpPipeEqualTok                            ## |=
    phpDoublePipeTok                           ## ||
    phpRCurlyTok                               ## }
    phpTildeTok                                ## ~
    phpHidEnumMemberDeclaration                ## _enum_member_declaration
    phpHidMemberName                           ## _member_name
    phpHidReturnType                           ## _return_type
    phpHidArrayDestructing                     ## _array_destructing
    phpUnionType                               ## union_type
    phpHidSimpleStringSubscriptExpression      ## _simple_string_subscript_expression
    phpHidExpressions                          ## _expressions
    phpHidEof                                  ## _eof
    phpHidClassTypeDesignator                  ## _class_type_designator
    phpHidFunctionDefinitionHeader             ## _function_definition_header
    phpHidClassConstDeclaration                ## _class_const_declaration
    phpHidListDestructing                      ## _list_destructing
    phpEncapsedStringChars                     ## encapsed_string_chars
    phpElseClause2                             ## else_clause_2
    phpHidScopeResolutionQualifier             ## _scope_resolution_qualifier
    phpHidModifier                             ## _modifier
    phpHidSimpleStringPart                     ## _simple_string_part
    phpHidVariableName                         ## _variable_name
    phpElseIfClause2                           ## else_if_clause_2
    phpHidCallableExpression                   ## _callable_expression
    phpHidUnaryExpression                      ## _unary_expression
    phpHidReservedIdentifier                   ## _reserved_identifier
    phpHidSimpleStringSubscriptUnaryExpression ## _simple_string_subscript_unary_expression
    phpVariableReference                       ## variable_reference
    phpHidSemicolon                            ## _semicolon
    phpCastVariable                            ## cast_variable
    phpHidTypes                                ## _types
    phpHidConstDeclaration                     ## _const_declaration
    phpHidDereferencableExpression             ## _dereferencable_expression
    phpHidString                               ## _string
    phpHidArrayDestructingElement              ## _array_destructing_element
    phpHidForeachValue                         ## _foreach_value
    phpHidMemberDeclaration                    ## _member_declaration
    phpHidVariable                             ## _variable
    phpHidSimpleStringMemberAccessExpression   ## _simple_string_member_access_expression
    phpHidCallableVariable                     ## _callable_variable
    phpHidComplexStringPart                    ## _complex_string_part
    phpEncapsedStringCharsAfterVariable        ## encapsed_string_chars_after_variable
    phpHidSimpleStringArrayAccessArgument      ## _simple_string_array_access_argument
    phpForeachPair                             ## foreach_pair
    phpHidAutomaticSemicolon                   ## _automatic_semicolon
    phpSyntaxError                             ## Tree-sitter parser syntax error

proc strRepr*(kind: PhpNodeKind): string =
  case kind:
    of phpHidExpression:                           "_expression"
    of phpHidLiteral:                              "_literal"
    of phpHidPrimaryExpression:                    "_primary_expression"
    of phpHidStatement:                            "_statement"
    of phpHidType:                                 "_type"
    of phpAbstractModifier:                        "abstract_modifier"
    of phpAnonymousFunctionCreationExpression:     "anonymous_function_creation_expression"
    of phpAnonymousFunctionUseClause:              "anonymous_function_use_clause"
    of phpArgument:                                "argument"
    of phpArguments:                               "arguments"
    of phpArrayCreationExpression:                 "array_creation_expression"
    of phpArrayElementInitializer:                 "array_element_initializer"
    of phpArrowFunction:                           "arrow_function"
    of phpAssignmentExpression:                    "assignment_expression"
    of phpAttribute:                               "attribute"
    of phpAttributeList:                           "attribute_list"
    of phpAugmentedAssignmentExpression:           "augmented_assignment_expression"
    of phpBaseClause:                              "base_clause"
    of phpBinaryExpression:                        "binary_expression"
    of phpBreakStatement:                          "break_statement"
    of phpByRef:                                   "by_ref"
    of phpCaseStatement:                           "case_statement"
    of phpCastExpression:                          "cast_expression"
    of phpCastType:                                "cast_type"
    of phpCatchClause:                             "catch_clause"
    of phpClassConstantAccessExpression:           "class_constant_access_expression"
    of phpClassDeclaration:                        "class_declaration"
    of phpClassInterfaceClause:                    "class_interface_clause"
    of phpCloneExpression:                         "clone_expression"
    of phpColonBlock:                              "colon_block"
    of phpCompoundStatement:                       "compound_statement"
    of phpConditionalExpression:                   "conditional_expression"
    of phpConstDeclaration:                        "const_declaration"
    of phpConstElement:                            "const_element"
    of phpContinueStatement:                       "continue_statement"
    of phpDeclarationList:                         "declaration_list"
    of phpDeclareDirective:                        "declare_directive"
    of phpDeclareStatement:                        "declare_statement"
    of phpDefaultStatement:                        "default_statement"
    of phpDoStatement:                             "do_statement"
    of phpDynamicVariableName:                     "dynamic_variable_name"
    of phpEchoStatement:                           "echo_statement"
    of phpElseClause:                              "else_clause"
    of phpElseIfClause:                            "else_if_clause"
    of phpEmptyStatement:                          "empty_statement"
    of phpEncapsedString:                          "encapsed_string"
    of phpEnumCase:                                "enum_case"
    of phpEnumDeclaration:                         "enum_declaration"
    of phpEnumDeclarationList:                     "enum_declaration_list"
    of phpExponentiationExpression:                "exponentiation_expression"
    of phpExpressionStatement:                     "expression_statement"
    of phpFinalModifier:                           "final_modifier"
    of phpFinallyClause:                           "finally_clause"
    of phpForStatement:                            "for_statement"
    of phpForeachStatement:                        "foreach_statement"
    of phpFormalParameters:                        "formal_parameters"
    of phpFunctionCallExpression:                  "function_call_expression"
    of phpFunctionDefinition:                      "function_definition"
    of phpFunctionStaticDeclaration:               "function_static_declaration"
    of phpGlobalDeclaration:                       "global_declaration"
    of phpGotoStatement:                           "goto_statement"
    of phpIfStatement:                             "if_statement"
    of phpIncludeExpression:                       "include_expression"
    of phpIncludeOnceExpression:                   "include_once_expression"
    of phpInterfaceDeclaration:                    "interface_declaration"
    of phpListLiteral:                             "list_literal"
    of phpMatchBlock:                              "match_block"
    of phpMatchConditionList:                      "match_condition_list"
    of phpMatchConditionalExpression:              "match_conditional_expression"
    of phpMatchDefaultExpression:                  "match_default_expression"
    of phpMatchExpression:                         "match_expression"
    of phpMemberAccessExpression:                  "member_access_expression"
    of phpMemberCallExpression:                    "member_call_expression"
    of phpMethodDeclaration:                       "method_declaration"
    of phpName:                                    "name"
    of phpNamedLabelStatement:                     "named_label_statement"
    of phpNamedType:                               "named_type"
    of phpNamespaceAliasingClause:                 "namespace_aliasing_clause"
    of phpNamespaceDefinition:                     "namespace_definition"
    of phpNamespaceName:                           "namespace_name"
    of phpNamespaceNameAsPrefix:                   "namespace_name_as_prefix"
    of phpNamespaceUseClause:                      "namespace_use_clause"
    of phpNamespaceUseDeclaration:                 "namespace_use_declaration"
    of phpNamespaceUseGroup:                       "namespace_use_group"
    of phpNamespaceUseGroupClause:                 "namespace_use_group_clause"
    of phpNullsafeMemberAccessExpression:          "nullsafe_member_access_expression"
    of phpNullsafeMemberCallExpression:            "nullsafe_member_call_expression"
    of phpObjectCreationExpression:                "object_creation_expression"
    of phpOptionalType:                            "optional_type"
    of phpPair:                                    "pair"
    of phpParenthesizedExpression:                 "parenthesized_expression"
    of phpPrimitiveType:                           "primitive_type"
    of phpPrintIntrinsic:                          "print_intrinsic"
    of phpProgram:                                 "program"
    of phpPropertyDeclaration:                     "property_declaration"
    of phpPropertyElement:                         "property_element"
    of phpPropertyInitializer:                     "property_initializer"
    of phpPropertyPromotionParameter:              "property_promotion_parameter"
    of phpQualifiedName:                           "qualified_name"
    of phpReferenceAssignmentExpression:           "reference_assignment_expression"
    of phpReferenceModifier:                       "reference_modifier"
    of phpRelativeScope:                           "relative_scope"
    of phpRequireExpression:                       "require_expression"
    of phpRequireOnceExpression:                   "require_once_expression"
    of phpReturnStatement:                         "return_statement"
    of phpScopedCallExpression:                    "scoped_call_expression"
    of phpScopedPropertyAccessExpression:          "scoped_property_access_expression"
    of phpSequenceExpression:                      "sequence_expression"
    of phpSimpleParameter:                         "simple_parameter"
    of phpStaticModifier:                          "static_modifier"
    of phpStaticVariableDeclaration:               "static_variable_declaration"
    of phpString:                                  "string"
    of phpSubscriptExpression:                     "subscript_expression"
    of phpSwitchBlock:                             "switch_block"
    of phpSwitchStatement:                         "switch_statement"
    of phpText:                                    "text"
    of phpTextInterpolation:                       "text_interpolation"
    of phpThrowExpression:                         "throw_expression"
    of phpTraitDeclaration:                        "trait_declaration"
    of phpTryStatement:                            "try_statement"
    of phpTypeList:                                "type_list"
    of phpUnaryOpExpression:                       "unary_op_expression"
    of phpUnsetStatement:                          "unset_statement"
    of phpUpdateExpression:                        "update_expression"
    of phpUseAsClause:                             "use_as_clause"
    of phpUseDeclaration:                          "use_declaration"
    of phpUseInsteadOfClause:                      "use_instead_of_clause"
    of phpUseList:                                 "use_list"
    of phpVariableName:                            "variable_name"
    of phpVariadicParameter:                       "variadic_parameter"
    of phpVariadicUnpacking:                       "variadic_unpacking"
    of phpVisibilityModifier:                      "visibility_modifier"
    of phpWhileStatement:                          "while_statement"
    of phpYieldExpression:                         "yield_expression"
    of phpExclamationTok:                          "!"
    of phpExclamationEqualTok:                     "!="
    of phpExclamationDoubleEqualTok:               "!=="
    of phpQuoteTok:                                "\""
    of phpHashLBrackTok:                           "#["
    of phpDollarTok:                               "$"
    of phpPercentTok:                              "%"
    of phpPercentEqualTok:                         "%="
    of phpAmpersandTok:                            "&"
    of phpDoubleAmpersandTok:                      "&&"
    of phpAmpersandEqualTok:                       "&="
    of phpApostropheTok:                           "\'"
    of phpLParTok:                                 "("
    of phpRParTok:                                 ")"
    of phpAsteriskTok:                             "*"
    of phpDoubleAsteriskTok:                       "**"
    of phpDoubleAsteriskEqualTok:                  "**="
    of phpAsteriskEqualTok:                        "*="
    of phpPlusTok:                                 "+"
    of phpDoublePlusTok:                           "++"
    of phpPlusEqualTok:                            "+="
    of phpCommaTok:                                ","
    of phpMinusTok:                                "-"
    of phpDoubleMinusTok:                          "--"
    of phpMinusEqualTok:                           "-="
    of phpMinusGreaterThanTok:                     "->"
    of phpDotTok:                                  "."
    of phpTripleDotTok:                            "..."
    of phpDotEqualTok:                             ".="
    of phpSlashTok:                                "/"
    of phpSlashEqualTok:                           "/="
    of phpColonTok:                                ":"
    of phpDoubleColonTok:                          "::"
    of phpSemicolonTok:                            ";"
    of phpLessThanTok:                             "<"
    of phpDoubleLessThanTok:                       "<<"
    of phpDoubleLessThanEqualTok:                  "<<="
    of phpLessThanEqualTok:                        "<="
    of phpLessThanEqualGreaterThanTok:             "<=>"
    of phpLessThanGreaterThanTok:                  "<>"
    of phpEqualTok:                                "="
    of phpDoubleEqualTok:                          "=="
    of phpTripleEqualTok:                          "==="
    of phpEqualGreaterThanTok:                     "=>"
    of phpGreaterThanTok:                          ">"
    of phpGreaterThanEqualTok:                     ">="
    of phpDoubleGreaterThanTok:                    ">>"
    of phpDoubleGreaterThanEqualTok:               ">>="
    of phpQuestionTok:                             "?"
    of phpQuestionMinusGreaterThanTok:             "?->"
    of phpQuestionGreaterThanTok:                  "?>"
    of phpDoubleQuestionTok:                       "??"
    of phpDoubleQuestionEqualTok:                  "??="
    of phpAtTok:                                   "@"
    of phpLBrackTok:                               "["
    of phpBackslashTok:                            "\\"
    of phpRBrackTok:                               "]"
    of phpAccentTok:                               "^"
    of phpAccentEqualTok:                          "^="
    of phpAbstractTok:                             "abstract"
    of phpAndTok:                                  "and"
    of phpArrayTok:                                "array"
    of phpAsTok:                                   "as"
    of phpBoolTok:                                 "bool"
    of phpBoolean:                                 "boolean"
    of phpBreakTok:                                "break"
    of phpCallableTok:                             "callable"
    of phpCaseTok:                                 "case"
    of phpCatchTok:                                "catch"
    of phpClassTok:                                "class"
    of phpCloneTok:                                "clone"
    of phpComment:                                 "comment"
    of phpConstTok:                                "const"
    of phpContinueTok:                             "continue"
    of phpDeclareTok:                              "declare"
    of phpDefaultTok:                              "default"
    of phpDoTok:                                   "do"
    of phpEchoTok:                                 "echo"
    of phpElseTok:                                 "else"
    of phpElseifTok:                               "elseif"
    of phpEncodingTok:                             "encoding"
    of phpEnddeclareTok:                           "enddeclare"
    of phpEndforTok:                               "endfor"
    of phpEndforeachTok:                           "endforeach"
    of phpEndifTok:                                "endif"
    of phpEndswitchTok:                            "endswitch"
    of phpEndwhileTok:                             "endwhile"
    of phpEnumTok:                                 "enum"
    of phpEscapeSequence:                          "escape_sequence"
    of phpExtendsTok:                              "extends"
    of phpFalseTok:                                "false"
    of phpFinalTok:                                "final"
    of phpFinallyTok:                              "finally"
    of phpFloat:                                   "float"
    of phpFloatTok:                                "float"
    of phpFnTok:                                   "fn"
    of phpForTok:                                  "for"
    of phpForeachTok:                              "foreach"
    of phpFromTok:                                 "from"
    of phpFunctionTok:                             "function"
    of phpGlobalTok:                               "global"
    of phpGotoTok:                                 "goto"
    of phpHeredoc:                                 "heredoc"
    of phpIfTok:                                   "if"
    of phpImplementsTok:                           "implements"
    of phpIncludeTok:                              "include"
    of phpIncludeOnceTok:                          "include_once"
    of phpInstanceofTok:                           "instanceof"
    of phpInsteadofTok:                            "insteadof"
    of phpIntTok:                                  "int"
    of phpInteger:                                 "integer"
    of phpInterfaceTok:                            "interface"
    of phpIterableTok:                             "iterable"
    of phpListTok:                                 "list"
    of phpMatchTok:                                "match"
    of phpMixedTok:                                "mixed"
    of phpNamespaceTok:                            "namespace"
    of phpNewTok:                                  "new"
    of phpNull:                                    "null"
    of phpNullTok:                                 "null"
    of phpOrTok:                                   "or"
    of phpParentTok:                               "parent"
    of phpPhpTag:                                  "php_tag"
    of phpPrintTok:                                "print"
    of phpPrivateTok:                              "private"
    of phpProtectedTok:                            "protected"
    of phpPublicTok:                               "public"
    of phpRequireTok:                              "require"
    of phpRequireOnceTok:                          "require_once"
    of phpReturnTok:                               "return"
    of phpSelfTok:                                 "self"
    of phpShellCommandExpression:                  "shell_command_expression"
    of phpStaticTok:                               "static"
    of phpStrictTypesTok:                          "strict_types"
    of phpStringTok:                               "string"
    of phpSwitchTok:                               "switch"
    of phpThrowTok:                                "throw"
    of phpTicksTok:                                "ticks"
    of phpTraitTok:                                "trait"
    of phpTryTok:                                  "try"
    of phpUnsetTok:                                "unset"
    of phpUseTok:                                  "use"
    of phpVarModifier:                             "var_modifier"
    of phpVoidTok:                                 "void"
    of phpWhileTok:                                "while"
    of phpXorTok:                                  "xor"
    of phpYieldTok:                                "yield"
    of phpLCurlyTok:                               "{"
    of phpPipeTok:                                 "|"
    of phpPipeEqualTok:                            "|="
    of phpDoublePipeTok:                           "||"
    of phpRCurlyTok:                               "}"
    of phpTildeTok:                                "~"
    of phpHidEnumMemberDeclaration:                "_enum_member_declaration"
    of phpHidMemberName:                           "_member_name"
    of phpHidReturnType:                           "_return_type"
    of phpHidArrayDestructing:                     "_array_destructing"
    of phpUnionType:                               "union_type"
    of phpHidSimpleStringSubscriptExpression:      "_simple_string_subscript_expression"
    of phpHidExpressions:                          "_expressions"
    of phpHidEof:                                  "_eof"
    of phpHidClassTypeDesignator:                  "_class_type_designator"
    of phpHidFunctionDefinitionHeader:             "_function_definition_header"
    of phpHidClassConstDeclaration:                "_class_const_declaration"
    of phpHidListDestructing:                      "_list_destructing"
    of phpEncapsedStringChars:                     "encapsed_string_chars"
    of phpElseClause2:                             "else_clause_2"
    of phpHidScopeResolutionQualifier:             "_scope_resolution_qualifier"
    of phpHidModifier:                             "_modifier"
    of phpHidSimpleStringPart:                     "_simple_string_part"
    of phpHidVariableName:                         "_variable_name"
    of phpElseIfClause2:                           "else_if_clause_2"
    of phpHidCallableExpression:                   "_callable_expression"
    of phpHidUnaryExpression:                      "_unary_expression"
    of phpHidReservedIdentifier:                   "_reserved_identifier"
    of phpHidSimpleStringSubscriptUnaryExpression: "_simple_string_subscript_unary_expression"
    of phpVariableReference:                       "variable_reference"
    of phpHidSemicolon:                            "_semicolon"
    of phpCastVariable:                            "cast_variable"
    of phpHidTypes:                                "_types"
    of phpHidConstDeclaration:                     "_const_declaration"
    of phpHidDereferencableExpression:             "_dereferencable_expression"
    of phpHidString:                               "_string"
    of phpHidArrayDestructingElement:              "_array_destructing_element"
    of phpHidForeachValue:                         "_foreach_value"
    of phpHidMemberDeclaration:                    "_member_declaration"
    of phpHidVariable:                             "_variable"
    of phpHidSimpleStringMemberAccessExpression:   "_simple_string_member_access_expression"
    of phpHidCallableVariable:                     "_callable_variable"
    of phpHidComplexStringPart:                    "_complex_string_part"
    of phpEncapsedStringCharsAfterVariable:        "encapsed_string_chars_after_variable"
    of phpHidSimpleStringArrayAccessArgument:      "_simple_string_array_access_argument"
    of phpForeachPair:                             "foreach_pair"
    of phpHidAutomaticSemicolon:                   "_automatic_semicolon"
    of phpSyntaxError:                             "ERROR"

type
  PhpExternalTok* = enum
    phpExtern_automatic_semicolon                 ## _automatic_semicolon
    phpExternHeredoc                              ## heredoc
    phpExternEncapsed_string_chars                ## encapsed_string_chars
    phpExternEncapsed_string_chars_after_variable ## encapsed_string_chars_after_variable
    phpExtern_eof                                 ## _eof
    phpExternSentinel_error                       ## sentinel_error

type
  TsPhpNode* = distinct TSNode

type
  PhpParser* = distinct PtsParser

const phpAllowedSubnodes*: array[PhpNodeKind, set[PhpNodeKind]] = block:
                                                                    var tmp: array[PhpNodeKind, set[PhpNodeKind]]
                                                                    tmp[phpAnonymousFunctionCreationExpression] = {phpAnonymousFunctionUseClause}
                                                                    tmp[phpAnonymousFunctionUseClause] = {phpByRef, phpVariableName}
                                                                    tmp[phpArgument] = {phpHidExpression, phpVariadicUnpacking}
                                                                    tmp[phpArguments] = {phpArgument}
                                                                    tmp[phpArrayCreationExpression] = {phpArrayElementInitializer}
                                                                    tmp[phpArrayElementInitializer] = {phpHidExpression, phpByRef, phpVariadicUnpacking}
                                                                    tmp[phpArrowFunction] = {phpStaticModifier}
                                                                    tmp[phpAttribute] = {phpName, phpQualifiedName}
                                                                    tmp[phpAttributeList] = {phpAttribute}
                                                                    tmp[phpBaseClause] = {phpName, phpQualifiedName}
                                                                    tmp[phpBinaryExpression] = {phpHidExpression}
                                                                    tmp[phpBreakStatement] = {phpHidExpression}
                                                                    tmp[phpByRef] = {
                                                                                      phpDynamicVariableName,
                                                                                      phpFunctionCallExpression,
                                                                                      phpMemberAccessExpression,
                                                                                      phpMemberCallExpression,
                                                                                      phpNullsafeMemberAccessExpression,
                                                                                      phpNullsafeMemberCallExpression,
                                                                                      phpScopedCallExpression,
                                                                                      phpSubscriptExpression,
                                                                                      phpVariableName
                                                                                    }
                                                                    tmp[phpCaseStatement] = {phpHidStatement}
                                                                    tmp[phpClassConstantAccessExpression] = {
                                                                                                              phpArrayCreationExpression,
                                                                                                              phpCastExpression,
                                                                                                              phpClassConstantAccessExpression,
                                                                                                              phpDynamicVariableName,
                                                                                                              phpEncapsedString,
                                                                                                              phpFunctionCallExpression,
                                                                                                              phpHeredoc,
                                                                                                              phpMemberAccessExpression,
                                                                                                              phpMemberCallExpression,
                                                                                                              phpName,
                                                                                                              phpNullsafeMemberAccessExpression,
                                                                                                              phpNullsafeMemberCallExpression,
                                                                                                              phpParenthesizedExpression,
                                                                                                              phpQualifiedName,
                                                                                                              phpRelativeScope,
                                                                                                              phpScopedCallExpression,
                                                                                                              phpScopedPropertyAccessExpression,
                                                                                                              phpString,
                                                                                                              phpSubscriptExpression,
                                                                                                              phpVariableName
                                                                                                            }
                                                                    tmp[phpClassDeclaration] = {phpBaseClause, phpClassInterfaceClause}
                                                                    tmp[phpClassInterfaceClause] = {phpName, phpQualifiedName}
                                                                    tmp[phpCloneExpression] = {phpHidPrimaryExpression}
                                                                    tmp[phpColonBlock] = {phpHidStatement}
                                                                    tmp[phpCompoundStatement] = {phpHidStatement}
                                                                    tmp[phpConstDeclaration] = {phpConstElement, phpVisibilityModifier}
                                                                    tmp[phpConstElement] = {phpHidExpression, phpName}
                                                                    tmp[phpContinueStatement] = {phpHidExpression}
                                                                    tmp[phpDeclarationList] = {phpConstDeclaration, phpMethodDeclaration, phpPropertyDeclaration, phpUseDeclaration}
                                                                    tmp[phpDeclareDirective] = {phpHidLiteral}
                                                                    tmp[phpDeclareStatement] = {phpHidStatement, phpDeclareDirective}
                                                                    tmp[phpDefaultStatement] = {phpHidStatement}
                                                                    tmp[phpDynamicVariableName] = {phpHidExpression, phpDynamicVariableName, phpVariableName}
                                                                    tmp[phpEchoStatement] = {phpHidExpression, phpSequenceExpression}
                                                                    tmp[phpEncapsedString] = {
                                                                                               phpHidExpression,
                                                                                               phpDynamicVariableName,
                                                                                               phpEscapeSequence,
                                                                                               phpMemberAccessExpression,
                                                                                               phpString,
                                                                                               phpSubscriptExpression,
                                                                                               phpVariableName
                                                                                             }
                                                                    tmp[phpEnumDeclaration] = {phpHidType, phpClassInterfaceClause}
                                                                    tmp[phpEnumDeclarationList] = {phpEnumCase, phpMethodDeclaration, phpUseDeclaration}
                                                                    tmp[phpExpressionStatement] = {phpHidExpression}
                                                                    tmp[phpForStatement] = {phpHidExpression, phpHidStatement, phpSequenceExpression}
                                                                    tmp[phpForeachStatement] = {phpHidExpression, phpByRef, phpListLiteral, phpPair}
                                                                    tmp[phpFormalParameters] = {phpPropertyPromotionParameter, phpSimpleParameter, phpVariadicParameter}
                                                                    tmp[phpFunctionStaticDeclaration] = {phpStaticVariableDeclaration}
                                                                    tmp[phpGlobalDeclaration] = {phpDynamicVariableName, phpVariableName}
                                                                    tmp[phpGotoStatement] = {phpName}
                                                                    tmp[phpIncludeExpression] = {phpHidExpression}
                                                                    tmp[phpIncludeOnceExpression] = {phpHidExpression}
                                                                    tmp[phpInterfaceDeclaration] = {phpBaseClause}
                                                                    tmp[phpListLiteral] = {
                                                                                            phpHidExpression,
                                                                                            phpByRef,
                                                                                            phpDynamicVariableName,
                                                                                            phpFunctionCallExpression,
                                                                                            phpListLiteral,
                                                                                            phpMemberAccessExpression,
                                                                                            phpMemberCallExpression,
                                                                                            phpNullsafeMemberAccessExpression,
                                                                                            phpNullsafeMemberCallExpression,
                                                                                            phpScopedCallExpression,
                                                                                            phpScopedPropertyAccessExpression,
                                                                                            phpSubscriptExpression,
                                                                                            phpVariableName
                                                                                          }
                                                                    tmp[phpMatchBlock] = {phpMatchConditionalExpression, phpMatchDefaultExpression}
                                                                    tmp[phpMatchConditionList] = {phpHidExpression}
                                                                    tmp[phpMethodDeclaration] = {phpAbstractModifier, phpFinalModifier, phpStaticModifier, phpVarModifier, phpVisibilityModifier}
                                                                    tmp[phpNamedLabelStatement] = {phpName}
                                                                    tmp[phpNamedType] = {phpName, phpQualifiedName}
                                                                    tmp[phpNamespaceAliasingClause] = {phpName}
                                                                    tmp[phpNamespaceName] = {phpName}
                                                                    tmp[phpNamespaceNameAsPrefix] = {phpNamespaceName}
                                                                    tmp[phpNamespaceUseClause] = {phpName, phpNamespaceAliasingClause, phpQualifiedName}
                                                                    tmp[phpNamespaceUseDeclaration] = {phpNamespaceName, phpNamespaceUseClause, phpNamespaceUseGroup}
                                                                    tmp[phpNamespaceUseGroup] = {phpNamespaceUseGroupClause}
                                                                    tmp[phpNamespaceUseGroupClause] = {phpNamespaceAliasingClause, phpNamespaceName}
                                                                    tmp[phpObjectCreationExpression] = {
                                                                                                         phpArguments,
                                                                                                         phpBaseClause,
                                                                                                         phpClassInterfaceClause,
                                                                                                         phpDeclarationList,
                                                                                                         phpDynamicVariableName,
                                                                                                         phpMemberAccessExpression,
                                                                                                         phpName,
                                                                                                         phpNullsafeMemberAccessExpression,
                                                                                                         phpQualifiedName,
                                                                                                         phpScopedPropertyAccessExpression,
                                                                                                         phpSubscriptExpression,
                                                                                                         phpVariableName
                                                                                                       }
                                                                    tmp[phpOptionalType] = {phpNamedType, phpPrimitiveType}
                                                                    tmp[phpPair] = {phpHidExpression, phpByRef, phpListLiteral}
                                                                    tmp[phpParenthesizedExpression] = {phpHidExpression}
                                                                    tmp[phpPrintIntrinsic] = {phpHidExpression}
                                                                    tmp[phpProgram] = {phpHidStatement, phpPhpTag, phpText}
                                                                    tmp[phpPropertyDeclaration] = {phpAbstractModifier, phpFinalModifier, phpPropertyElement, phpStaticModifier, phpVarModifier, phpVisibilityModifier}
                                                                    tmp[phpPropertyElement] = {phpPropertyInitializer, phpVariableName}
                                                                    tmp[phpPropertyInitializer] = {phpHidExpression}
                                                                    tmp[phpQualifiedName] = {phpName, phpNamespaceNameAsPrefix}
                                                                    tmp[phpRequireExpression] = {phpHidExpression}
                                                                    tmp[phpRequireOnceExpression] = {phpHidExpression}
                                                                    tmp[phpReturnStatement] = {phpHidExpression}
                                                                    tmp[phpSequenceExpression] = {phpHidExpression, phpSequenceExpression}
                                                                    tmp[phpSubscriptExpression] = {
                                                                                                    phpHidExpression,
                                                                                                    phpArrayCreationExpression,
                                                                                                    phpClassConstantAccessExpression,
                                                                                                    phpDynamicVariableName,
                                                                                                    phpEncapsedString,
                                                                                                    phpFunctionCallExpression,
                                                                                                    phpHeredoc,
                                                                                                    phpInteger,
                                                                                                    phpMemberAccessExpression,
                                                                                                    phpMemberCallExpression,
                                                                                                    phpName,
                                                                                                    phpNullsafeMemberAccessExpression,
                                                                                                    phpNullsafeMemberCallExpression,
                                                                                                    phpParenthesizedExpression,
                                                                                                    phpQualifiedName,
                                                                                                    phpScopedCallExpression,
                                                                                                    phpScopedPropertyAccessExpression,
                                                                                                    phpString,
                                                                                                    phpSubscriptExpression,
                                                                                                    phpVariableName
                                                                                                  }
                                                                    tmp[phpSwitchBlock] = {phpCaseStatement, phpDefaultStatement}
                                                                    tmp[phpTextInterpolation] = {phpPhpTag, phpText}
                                                                    tmp[phpThrowExpression] = {phpHidExpression}
                                                                    tmp[phpTryStatement] = {phpCatchClause, phpFinallyClause}
                                                                    tmp[phpTypeList] = {phpNamedType, phpOptionalType, phpPrimitiveType}
                                                                    tmp[phpUnaryOpExpression] = {phpHidExpression, phpInteger}
                                                                    tmp[phpUnsetStatement] = {
                                                                                               phpCastExpression,
                                                                                               phpDynamicVariableName,
                                                                                               phpFunctionCallExpression,
                                                                                               phpMemberAccessExpression,
                                                                                               phpMemberCallExpression,
                                                                                               phpNullsafeMemberAccessExpression,
                                                                                               phpNullsafeMemberCallExpression,
                                                                                               phpScopedCallExpression,
                                                                                               phpScopedPropertyAccessExpression,
                                                                                               phpSubscriptExpression,
                                                                                               phpVariableName
                                                                                             }
                                                                    tmp[phpUpdateExpression] = {
                                                                                                 phpCastExpression,
                                                                                                 phpDynamicVariableName,
                                                                                                 phpFunctionCallExpression,
                                                                                                 phpMemberAccessExpression,
                                                                                                 phpMemberCallExpression,
                                                                                                 phpNullsafeMemberAccessExpression,
                                                                                                 phpNullsafeMemberCallExpression,
                                                                                                 phpScopedCallExpression,
                                                                                                 phpScopedPropertyAccessExpression,
                                                                                                 phpSubscriptExpression,
                                                                                                 phpVariableName
                                                                                               }
                                                                    tmp[phpUseAsClause] = {phpClassConstantAccessExpression, phpName, phpVisibilityModifier}
                                                                    tmp[phpUseDeclaration] = {phpName, phpQualifiedName, phpUseList}
                                                                    tmp[phpUseInsteadOfClause] = {phpClassConstantAccessExpression, phpName}
                                                                    tmp[phpUseList] = {phpUseAsClause, phpUseInsteadOfClause}
                                                                    tmp[phpVariableName] = {phpName}
                                                                    tmp[phpVariadicUnpacking] = {phpHidExpression}
                                                                    tmp[phpYieldExpression] = {phpHidExpression, phpArrayElementInitializer}
                                                                    tmp
const phpTokenKinds*: set[PhpNodeKind] = {
                                           phpExclamationTok,
                                           phpExclamationEqualTok,
                                           phpExclamationDoubleEqualTok,
                                           phpQuoteTok,
                                           phpHashLBrackTok,
                                           phpDollarTok,
                                           phpPercentTok,
                                           phpPercentEqualTok,
                                           phpAmpersandTok,
                                           phpDoubleAmpersandTok,
                                           phpAmpersandEqualTok,
                                           phpApostropheTok,
                                           phpLParTok,
                                           phpRParTok,
                                           phpAsteriskTok,
                                           phpDoubleAsteriskTok,
                                           phpDoubleAsteriskEqualTok,
                                           phpAsteriskEqualTok,
                                           phpPlusTok,
                                           phpDoublePlusTok,
                                           phpPlusEqualTok,
                                           phpCommaTok,
                                           phpMinusTok,
                                           phpDoubleMinusTok,
                                           phpMinusEqualTok,
                                           phpMinusGreaterThanTok,
                                           phpDotTok,
                                           phpTripleDotTok,
                                           phpDotEqualTok,
                                           phpSlashTok,
                                           phpSlashEqualTok,
                                           phpColonTok,
                                           phpDoubleColonTok,
                                           phpSemicolonTok,
                                           phpLessThanTok,
                                           phpDoubleLessThanTok,
                                           phpDoubleLessThanEqualTok,
                                           phpLessThanEqualTok,
                                           phpLessThanEqualGreaterThanTok,
                                           phpLessThanGreaterThanTok,
                                           phpEqualTok,
                                           phpDoubleEqualTok,
                                           phpTripleEqualTok,
                                           phpEqualGreaterThanTok,
                                           phpGreaterThanTok,
                                           phpGreaterThanEqualTok,
                                           phpDoubleGreaterThanTok,
                                           phpDoubleGreaterThanEqualTok,
                                           phpQuestionTok,
                                           phpQuestionMinusGreaterThanTok,
                                           phpQuestionGreaterThanTok,
                                           phpDoubleQuestionTok,
                                           phpDoubleQuestionEqualTok,
                                           phpAtTok,
                                           phpLBrackTok,
                                           phpBackslashTok,
                                           phpRBrackTok,
                                           phpAccentTok,
                                           phpAccentEqualTok,
                                           phpAbstractTok,
                                           phpAndTok,
                                           phpArrayTok,
                                           phpAsTok,
                                           phpBoolTok,
                                           phpBreakTok,
                                           phpCallableTok,
                                           phpCaseTok,
                                           phpCatchTok,
                                           phpClassTok,
                                           phpCloneTok,
                                           phpConstTok,
                                           phpContinueTok,
                                           phpDeclareTok,
                                           phpDefaultTok,
                                           phpDoTok,
                                           phpEchoTok,
                                           phpElseTok,
                                           phpElseifTok,
                                           phpEncodingTok,
                                           phpEnddeclareTok,
                                           phpEndforTok,
                                           phpEndforeachTok,
                                           phpEndifTok,
                                           phpEndswitchTok,
                                           phpEndwhileTok,
                                           phpEnumTok,
                                           phpExtendsTok,
                                           phpFalseTok,
                                           phpFinalTok,
                                           phpFinallyTok,
                                           phpFloatTok,
                                           phpFnTok,
                                           phpForTok,
                                           phpForeachTok,
                                           phpFromTok,
                                           phpFunctionTok,
                                           phpGlobalTok,
                                           phpGotoTok,
                                           phpIfTok,
                                           phpImplementsTok,
                                           phpIncludeTok,
                                           phpIncludeOnceTok,
                                           phpInstanceofTok,
                                           phpInsteadofTok,
                                           phpIntTok,
                                           phpInterfaceTok,
                                           phpIterableTok,
                                           phpListTok,
                                           phpMatchTok,
                                           phpMixedTok,
                                           phpNamespaceTok,
                                           phpNewTok,
                                           phpNullTok,
                                           phpOrTok,
                                           phpParentTok,
                                           phpPrintTok,
                                           phpPrivateTok,
                                           phpProtectedTok,
                                           phpPublicTok,
                                           phpRequireTok,
                                           phpRequireOnceTok,
                                           phpReturnTok,
                                           phpSelfTok,
                                           phpStaticTok,
                                           phpStrictTypesTok,
                                           phpStringTok,
                                           phpSwitchTok,
                                           phpThrowTok,
                                           phpTicksTok,
                                           phpTraitTok,
                                           phpTryTok,
                                           phpUnsetTok,
                                           phpUseTok,
                                           phpVoidTok,
                                           phpWhileTok,
                                           phpXorTok,
                                           phpYieldTok,
                                           phpLCurlyTok,
                                           phpPipeTok,
                                           phpPipeEqualTok,
                                           phpDoublePipeTok,
                                           phpRCurlyTok,
                                           phpTildeTok
                                         }
const phpHiddenKinds*: set[PhpNodeKind] = {
                                            phpHidEnumMemberDeclaration,
                                            phpHidMemberName,
                                            phpHidReturnType,
                                            phpHidArrayDestructing,
                                            phpUnionType,
                                            phpHidLiteral,
                                            phpHidSimpleStringSubscriptExpression,
                                            phpHidType,
                                            phpHidExpressions,
                                            phpHidEof,
                                            phpHidClassTypeDesignator,
                                            phpHidExpression,
                                            phpHidFunctionDefinitionHeader,
                                            phpHidClassConstDeclaration,
                                            phpHidListDestructing,
                                            phpEncapsedStringChars,
                                            phpHidPrimaryExpression,
                                            phpElseClause2,
                                            phpHidScopeResolutionQualifier,
                                            phpHidModifier,
                                            phpHidSimpleStringPart,
                                            phpHidVariableName,
                                            phpElseIfClause2,
                                            phpHidCallableExpression,
                                            phpHidUnaryExpression,
                                            phpHidReservedIdentifier,
                                            phpHidSimpleStringSubscriptUnaryExpression,
                                            phpVariableReference,
                                            phpHidSemicolon,
                                            phpCastVariable,
                                            phpHidTypes,
                                            phpHidConstDeclaration,
                                            phpHidDereferencableExpression,
                                            phpHidStatement,
                                            phpHidString,
                                            phpHidArrayDestructingElement,
                                            phpHidForeachValue,
                                            phpHidMemberDeclaration,
                                            phpHidVariable,
                                            phpHidSimpleStringMemberAccessExpression,
                                            phpHidCallableVariable,
                                            phpHidComplexStringPart,
                                            phpEncapsedStringCharsAfterVariable,
                                            phpHidSimpleStringArrayAccessArgument,
                                            phpForeachPair,
                                            phpHidAutomaticSemicolon
                                          }
proc tsNodeType*(node: TsPhpNode): string


proc kind*(node: TsPhpNode): PhpNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":                            phpHidExpression
      of "_literal":                               phpHidLiteral
      of "_primary_expression":                    phpHidPrimaryExpression
      of "_statement":                             phpHidStatement
      of "_type":                                  phpHidType
      of "abstract_modifier":                      phpAbstractModifier
      of "anonymous_function_creation_expression": phpAnonymousFunctionCreationExpression
      of "anonymous_function_use_clause":          phpAnonymousFunctionUseClause
      of "argument":                               phpArgument
      of "arguments":                              phpArguments
      of "array_creation_expression":              phpArrayCreationExpression
      of "array_element_initializer":              phpArrayElementInitializer
      of "arrow_function":                         phpArrowFunction
      of "assignment_expression":                  phpAssignmentExpression
      of "attribute":                              phpAttribute
      of "attribute_list":                         phpAttributeList
      of "augmented_assignment_expression":        phpAugmentedAssignmentExpression
      of "base_clause":                            phpBaseClause
      of "binary_expression":                      phpBinaryExpression
      of "break_statement":                        phpBreakStatement
      of "by_ref":                                 phpByRef
      of "case_statement":                         phpCaseStatement
      of "cast_expression":                        phpCastExpression
      of "cast_type":                              phpCastType
      of "catch_clause":                           phpCatchClause
      of "class_constant_access_expression":       phpClassConstantAccessExpression
      of "class_declaration":                      phpClassDeclaration
      of "class_interface_clause":                 phpClassInterfaceClause
      of "clone_expression":                       phpCloneExpression
      of "colon_block":                            phpColonBlock
      of "compound_statement":                     phpCompoundStatement
      of "conditional_expression":                 phpConditionalExpression
      of "const_declaration":                      phpConstDeclaration
      of "const_element":                          phpConstElement
      of "continue_statement":                     phpContinueStatement
      of "declaration_list":                       phpDeclarationList
      of "declare_directive":                      phpDeclareDirective
      of "declare_statement":                      phpDeclareStatement
      of "default_statement":                      phpDefaultStatement
      of "do_statement":                           phpDoStatement
      of "dynamic_variable_name":                  phpDynamicVariableName
      of "echo_statement":                         phpEchoStatement
      of "else_clause":                            phpElseClause
      of "else_if_clause":                         phpElseIfClause
      of "empty_statement":                        phpEmptyStatement
      of "encapsed_string":                        phpEncapsedString
      of "enum_case":                              phpEnumCase
      of "enum_declaration":                       phpEnumDeclaration
      of "enum_declaration_list":                  phpEnumDeclarationList
      of "exponentiation_expression":              phpExponentiationExpression
      of "expression_statement":                   phpExpressionStatement
      of "final_modifier":                         phpFinalModifier
      of "finally_clause":                         phpFinallyClause
      of "for_statement":                          phpForStatement
      of "foreach_statement":                      phpForeachStatement
      of "formal_parameters":                      phpFormalParameters
      of "function_call_expression":               phpFunctionCallExpression
      of "function_definition":                    phpFunctionDefinition
      of "function_static_declaration":            phpFunctionStaticDeclaration
      of "global_declaration":                     phpGlobalDeclaration
      of "goto_statement":                         phpGotoStatement
      of "if_statement":                           phpIfStatement
      of "include_expression":                     phpIncludeExpression
      of "include_once_expression":                phpIncludeOnceExpression
      of "interface_declaration":                  phpInterfaceDeclaration
      of "list_literal":                           phpListLiteral
      of "match_block":                            phpMatchBlock
      of "match_condition_list":                   phpMatchConditionList
      of "match_conditional_expression":           phpMatchConditionalExpression
      of "match_default_expression":               phpMatchDefaultExpression
      of "match_expression":                       phpMatchExpression
      of "member_access_expression":               phpMemberAccessExpression
      of "member_call_expression":                 phpMemberCallExpression
      of "method_declaration":                     phpMethodDeclaration
      of "name":                                   phpName
      of "named_label_statement":                  phpNamedLabelStatement
      of "named_type":                             phpNamedType
      of "namespace_aliasing_clause":              phpNamespaceAliasingClause
      of "namespace_definition":                   phpNamespaceDefinition
      of "namespace_name":                         phpNamespaceName
      of "namespace_name_as_prefix":               phpNamespaceNameAsPrefix
      of "namespace_use_clause":                   phpNamespaceUseClause
      of "namespace_use_declaration":              phpNamespaceUseDeclaration
      of "namespace_use_group":                    phpNamespaceUseGroup
      of "namespace_use_group_clause":             phpNamespaceUseGroupClause
      of "nullsafe_member_access_expression":      phpNullsafeMemberAccessExpression
      of "nullsafe_member_call_expression":        phpNullsafeMemberCallExpression
      of "object_creation_expression":             phpObjectCreationExpression
      of "optional_type":                          phpOptionalType
      of "pair":                                   phpPair
      of "parenthesized_expression":               phpParenthesizedExpression
      of "primitive_type":                         phpPrimitiveType
      of "print_intrinsic":                        phpPrintIntrinsic
      of "program":                                phpProgram
      of "property_declaration":                   phpPropertyDeclaration
      of "property_element":                       phpPropertyElement
      of "property_initializer":                   phpPropertyInitializer
      of "property_promotion_parameter":           phpPropertyPromotionParameter
      of "qualified_name":                         phpQualifiedName
      of "reference_assignment_expression":        phpReferenceAssignmentExpression
      of "reference_modifier":                     phpReferenceModifier
      of "relative_scope":                         phpRelativeScope
      of "require_expression":                     phpRequireExpression
      of "require_once_expression":                phpRequireOnceExpression
      of "return_statement":                       phpReturnStatement
      of "scoped_call_expression":                 phpScopedCallExpression
      of "scoped_property_access_expression":      phpScopedPropertyAccessExpression
      of "sequence_expression":                    phpSequenceExpression
      of "simple_parameter":                       phpSimpleParameter
      of "static_modifier":                        phpStaticModifier
      of "static_variable_declaration":            phpStaticVariableDeclaration
      of "string":                                 phpString
      of "subscript_expression":                   phpSubscriptExpression
      of "switch_block":                           phpSwitchBlock
      of "switch_statement":                       phpSwitchStatement
      of "text":                                   phpText
      of "text_interpolation":                     phpTextInterpolation
      of "throw_expression":                       phpThrowExpression
      of "trait_declaration":                      phpTraitDeclaration
      of "try_statement":                          phpTryStatement
      of "type_list":                              phpTypeList
      of "unary_op_expression":                    phpUnaryOpExpression
      of "unset_statement":                        phpUnsetStatement
      of "update_expression":                      phpUpdateExpression
      of "use_as_clause":                          phpUseAsClause
      of "use_declaration":                        phpUseDeclaration
      of "use_instead_of_clause":                  phpUseInsteadOfClause
      of "use_list":                               phpUseList
      of "variable_name":                          phpVariableName
      of "variadic_parameter":                     phpVariadicParameter
      of "variadic_unpacking":                     phpVariadicUnpacking
      of "visibility_modifier":                    phpVisibilityModifier
      of "while_statement":                        phpWhileStatement
      of "yield_expression":                       phpYieldExpression
      of "!":                                      phpExclamationTok
      of "!=":                                     phpExclamationEqualTok
      of "!==":                                    phpExclamationDoubleEqualTok
      of "\"":                                     phpQuoteTok
      of "#[":                                     phpHashLBrackTok
      of "$":                                      phpDollarTok
      of "%":                                      phpPercentTok
      of "%=":                                     phpPercentEqualTok
      of "&":                                      phpAmpersandTok
      of "&&":                                     phpDoubleAmpersandTok
      of "&=":                                     phpAmpersandEqualTok
      of "\'":                                     phpApostropheTok
      of "(":                                      phpLParTok
      of ")":                                      phpRParTok
      of "*":                                      phpAsteriskTok
      of "**":                                     phpDoubleAsteriskTok
      of "**=":                                    phpDoubleAsteriskEqualTok
      of "*=":                                     phpAsteriskEqualTok
      of "+":                                      phpPlusTok
      of "++":                                     phpDoublePlusTok
      of "+=":                                     phpPlusEqualTok
      of ",":                                      phpCommaTok
      of "-":                                      phpMinusTok
      of "--":                                     phpDoubleMinusTok
      of "-=":                                     phpMinusEqualTok
      of "->":                                     phpMinusGreaterThanTok
      of ".":                                      phpDotTok
      of "...":                                    phpTripleDotTok
      of ".=":                                     phpDotEqualTok
      of "/":                                      phpSlashTok
      of "/=":                                     phpSlashEqualTok
      of ":":                                      phpColonTok
      of "::":                                     phpDoubleColonTok
      of ";":                                      phpSemicolonTok
      of "<":                                      phpLessThanTok
      of "<<":                                     phpDoubleLessThanTok
      of "<<=":                                    phpDoubleLessThanEqualTok
      of "<=":                                     phpLessThanEqualTok
      of "<=>":                                    phpLessThanEqualGreaterThanTok
      of "<>":                                     phpLessThanGreaterThanTok
      of "=":                                      phpEqualTok
      of "==":                                     phpDoubleEqualTok
      of "===":                                    phpTripleEqualTok
      of "=>":                                     phpEqualGreaterThanTok
      of ">":                                      phpGreaterThanTok
      of ">=":                                     phpGreaterThanEqualTok
      of ">>":                                     phpDoubleGreaterThanTok
      of ">>=":                                    phpDoubleGreaterThanEqualTok
      of "?":                                      phpQuestionTok
      of "?->":                                    phpQuestionMinusGreaterThanTok
      of "?>":                                     phpQuestionGreaterThanTok
      of "??":                                     phpDoubleQuestionTok
      of "??=":                                    phpDoubleQuestionEqualTok
      of "@":                                      phpAtTok
      of "[":                                      phpLBrackTok
      of "\\":                                     phpBackslashTok
      of "]":                                      phpRBrackTok
      of "^":                                      phpAccentTok
      of "^=":                                     phpAccentEqualTok
      of "abstract":                               phpAbstractTok
      of "and":                                    phpAndTok
      of "array":                                  phpArrayTok
      of "as":                                     phpAsTok
      of "bool":                                   phpBoolTok
      of "boolean":                                phpBoolean
      of "break":                                  phpBreakTok
      of "callable":                               phpCallableTok
      of "case":                                   phpCaseTok
      of "catch":                                  phpCatchTok
      of "class":                                  phpClassTok
      of "clone":                                  phpCloneTok
      of "comment":                                phpComment
      of "const":                                  phpConstTok
      of "continue":                               phpContinueTok
      of "declare":                                phpDeclareTok
      of "default":                                phpDefaultTok
      of "do":                                     phpDoTok
      of "echo":                                   phpEchoTok
      of "else":                                   phpElseTok
      of "elseif":                                 phpElseifTok
      of "encoding":                               phpEncodingTok
      of "enddeclare":                             phpEnddeclareTok
      of "endfor":                                 phpEndforTok
      of "endforeach":                             phpEndforeachTok
      of "endif":                                  phpEndifTok
      of "endswitch":                              phpEndswitchTok
      of "endwhile":                               phpEndwhileTok
      of "enum":                                   phpEnumTok
      of "escape_sequence":                        phpEscapeSequence
      of "extends":                                phpExtendsTok
      of "false":                                  phpFalseTok
      of "final":                                  phpFinalTok
      of "finally":                                phpFinallyTok
      of "float":                                  phpFloat
      of "fn":                                     phpFnTok
      of "for":                                    phpForTok
      of "foreach":                                phpForeachTok
      of "from":                                   phpFromTok
      of "function":                               phpFunctionTok
      of "global":                                 phpGlobalTok
      of "goto":                                   phpGotoTok
      of "heredoc":                                phpHeredoc
      of "if":                                     phpIfTok
      of "implements":                             phpImplementsTok
      of "include":                                phpIncludeTok
      of "include_once":                           phpIncludeOnceTok
      of "instanceof":                             phpInstanceofTok
      of "insteadof":                              phpInsteadofTok
      of "int":                                    phpIntTok
      of "integer":                                phpInteger
      of "interface":                              phpInterfaceTok
      of "iterable":                               phpIterableTok
      of "list":                                   phpListTok
      of "match":                                  phpMatchTok
      of "mixed":                                  phpMixedTok
      of "namespace":                              phpNamespaceTok
      of "new":                                    phpNewTok
      of "null":                                   phpNull
      of "or":                                     phpOrTok
      of "parent":                                 phpParentTok
      of "php_tag":                                phpPhpTag
      of "print":                                  phpPrintTok
      of "private":                                phpPrivateTok
      of "protected":                              phpProtectedTok
      of "public":                                 phpPublicTok
      of "require":                                phpRequireTok
      of "require_once":                           phpRequireOnceTok
      of "return":                                 phpReturnTok
      of "self":                                   phpSelfTok
      of "shell_command_expression":               phpShellCommandExpression
      of "static":                                 phpStaticTok
      of "strict_types":                           phpStrictTypesTok
      of "switch":                                 phpSwitchTok
      of "throw":                                  phpThrowTok
      of "ticks":                                  phpTicksTok
      of "trait":                                  phpTraitTok
      of "try":                                    phpTryTok
      of "unset":                                  phpUnsetTok
      of "use":                                    phpUseTok
      of "var_modifier":                           phpVarModifier
      of "void":                                   phpVoidTok
      of "while":                                  phpWhileTok
      of "xor":                                    phpXorTok
      of "yield":                                  phpYieldTok
      of "{":                                      phpLCurlyTok
      of "|":                                      phpPipeTok
      of "|=":                                     phpPipeEqualTok
      of "||":                                     phpDoublePipeTok
      of "}":                                      phpRCurlyTok
      of "~":                                      phpTildeTok
      of "ERROR":                                  phpSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsPhpNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsPhpNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsPhpNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_php(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsPhpNode): string =
  $ts_node_type(TSNode(node))

proc newTsPhpParser*(): PhpParser =
  result = PhpParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_php())

proc parseString*(parser: PhpParser, str: string): TsPhpNode =
  TsPhpNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsPhpString*(str: string): TsPhpNode =
  let parser = newTsPhpParser()
  return parseString(parser, str)

func `$`*(node: TsPhpNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsPhpNode, str: string): string =
  var res = addr result
  proc aux(node: TsPhpNode, level: int) =
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
let phpGrammar*: array[PhpNodeKind, HtsRule[PhpNodeKind]] = block:
                                                              var rules: array[PhpNodeKind, HtsRule[PhpNodeKind]]
                                                              type
                                                                K = PhpNodeKind


                                                              rules[phpHidReturnType] = tsSeq[K](tsString[K](":"), tsSymbol[K](phpHidType))
                                                              rules[phpHidArrayDestructing] = tsSeq[K](tsString[K]("["), tsSeq[K](tsChoice[K](tsSymbol[K](phpHidArrayDestructingElement), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpHidArrayDestructingElement), tsBlank[K]())))), tsString[K]("]"))
                                                              rules[phpGotoStatement] = tsSeq[K](tsRegex[K]("[gG][oO][tT][oO]"), tsSymbol[K](phpName), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpMemberCallExpression] = tsSeq[K](tsSymbol[K](phpHidDereferencableExpression), tsString[K]("->"), tsSymbol[K](phpHidMemberName), tsSymbol[K](phpArguments))
                                                              rules[phpForStatement] = tsSeq[K](tsRegex[K]("[fF][oO][rR]"), tsString[K]("("), tsChoice[K](tsSymbol[K](phpHidExpressions), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSymbol[K](phpHidExpressions), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsSymbol[K](phpHidExpressions), tsBlank[K]()), tsString[K](")"), tsChoice[K](tsSymbol[K](phpHidSemicolon), tsSymbol[K](phpHidStatement), tsSeq[K](tsString[K](":"), tsRepeat[K](tsSymbol[K](phpHidStatement)), tsRegex[K]("[eE][nN][dD][fF][oO][rR]"), tsSymbol[K](phpHidSemicolon))))
                                                              rules[phpArrowFunction] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpStaticModifier), tsBlank[K]()), tsRegex[K]("[fF][nN]"), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsSymbol[K](phpFormalParameters), tsChoice[K](tsSymbol[K](phpHidReturnType), tsBlank[K]()), tsString[K]("=>"), tsSymbol[K](phpHidExpression))
                                                              rules[phpText] = tsRepeat1[K](tsChoice[K](tsRegex[K]("<"), tsRegex[K]("[^\\s<][^<]*")))
                                                              rules[phpHidPrimaryExpression] = tsChoice[K](tsSymbol[K](phpHidVariable), tsSymbol[K](phpHidLiteral), tsSymbol[K](phpClassConstantAccessExpression), tsSymbol[K](phpQualifiedName), tsSymbol[K](phpName), tsSymbol[K](phpArrayCreationExpression), tsSymbol[K](phpPrintIntrinsic), tsSymbol[K](phpAnonymousFunctionCreationExpression), tsSymbol[K](phpArrowFunction), tsSymbol[K](phpObjectCreationExpression), tsSymbol[K](phpUpdateExpression), tsSymbol[K](phpShellCommandExpression), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpThrowExpression), tsSymbol[K](phpArrowFunction))
                                                              rules[phpGlobalDeclaration] = tsSeq[K](tsRegex[K]("[gG][lL][oO][bB][aA][lL]"), tsSeq[K](tsSymbol[K](phpHidVariableName), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpHidVariableName)))), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpMatchConditionalExpression] = tsSeq[K](tsSymbol[K](phpMatchConditionList), tsString[K]("=>"), tsSymbol[K](phpHidExpression))
                                                              rules[phpUnsetStatement] = tsSeq[K](tsString[K]("unset"), tsString[K]("("), tsSeq[K](tsSymbol[K](phpHidVariable), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpHidVariable)))), tsString[K](")"), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpElseIfClause2] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE][iI][fF]"), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpColonBlock))
                                                              rules[phpHidVariableName] = tsChoice[K](tsSymbol[K](phpDynamicVariableName), tsSymbol[K](phpVariableName))
                                                              rules[phpForeachStatement] = tsSeq[K](tsRegex[K]("[fF][oO][rR][eE][aA][cC][hH]"), tsString[K]("("), tsSymbol[K](phpHidExpression), tsRegex[K]("[aA][sS]"), tsChoice[K](tsSymbol[K](phpForeachPair), tsSymbol[K](phpHidForeachValue)), tsString[K](")"), tsChoice[K](tsSymbol[K](phpHidSemicolon), tsSymbol[K](phpHidStatement), tsSeq[K](tsSymbol[K](phpColonBlock), tsRegex[K]("[eE][nN][dD][fF][oO][rR][eE][aA][cC][hH]"), tsSymbol[K](phpHidSemicolon))))
                                                              rules[phpHidUnaryExpression] = tsChoice[K](tsSymbol[K](phpCloneExpression), tsSymbol[K](phpHidPrimaryExpression), tsSymbol[K](phpExponentiationExpression), tsSymbol[K](phpUnaryOpExpression), tsSymbol[K](phpCastExpression))
                                                              rules[phpVarModifier] = tsRegex[K]("[vV][aA][rR]")
                                                              rules[phpVariadicUnpacking] = tsSeq[K](tsString[K]("..."), tsSymbol[K](phpHidExpression))
                                                              rules[phpAnonymousFunctionCreationExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsRegex[K]("[sS][tT][aA][tT][iI][cC]"), tsBlank[K]()), tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsSymbol[K](phpFormalParameters), tsChoice[K](tsSymbol[K](phpAnonymousFunctionUseClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpHidReturnType), tsBlank[K]()), tsSymbol[K](phpCompoundStatement))
                                                              rules[phpComment] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("//"), tsRegex[K]("#[^?\\[?\\r?\\n]")), tsRepeat[K](tsRegex[K]("[^?\\r?\\n]|\\?[^>\\r\\n]")), tsChoice[K](tsRegex[K]("\\?\\r?\\n"), tsBlank[K]())), tsString[K]("#"), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                              rules[phpMethodDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsRepeat[K](tsSymbol[K](phpHidModifier)), tsSymbol[K](phpHidFunctionDefinitionHeader), tsChoice[K](tsSymbol[K](phpCompoundStatement), tsSymbol[K](phpHidSemicolon)))
                                                              rules[phpVariadicParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpHidType), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsString[K]("..."), tsSymbol[K](phpVariableName))
                                                              rules[phpArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](phpArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpArgument)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                              rules[phpEnumCase] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsRegex[K]("[cC][aA][sS][eE]"), tsSymbol[K](phpName), tsChoice[K](tsSeq[K](tsString[K]("="), tsChoice[K](tsSymbol[K](phpString), tsSymbol[K](phpInteger))), tsBlank[K]()), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpSubscriptExpression] = tsSeq[K](tsSymbol[K](phpHidDereferencableExpression), tsChoice[K](tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](phpHidExpression), tsBlank[K]()), tsString[K]("]")), tsSeq[K](tsString[K]("{"), tsSymbol[K](phpHidExpression), tsString[K]("}"))))
                                                              rules[phpInteger] = tsChoice[K](tsRegex[K]("[1-9]\\d*(_\\d+)*"), tsRegex[K]("0[oO]?[0-7]*(_[0-7]+)*"), tsRegex[K]("0[xX][0-9a-fA-F]+(_[0-9a-fA-F]+)*"), tsRegex[K]("0[bB][01]+(_[01]+)*"))
                                                              rules[phpHidSimpleStringMemberAccessExpression] = tsSeq[K](tsSymbol[K](phpVariableName), tsString[K]("->"), tsSymbol[K](phpName))
                                                              rules[phpHidComplexStringPart] = tsSeq[K](tsString[K]("{"), tsSymbol[K](phpHidExpression), tsString[K]("}"))
                                                              rules[phpFinallyClause] = tsSeq[K](tsRegex[K]("[fF][iI][nN][aA][lL][lL][yY]"), tsSymbol[K](phpCompoundStatement))
                                                              rules[phpHidSimpleStringArrayAccessArgument] = tsChoice[K](tsSymbol[K](phpInteger), tsSymbol[K](phpHidSimpleStringSubscriptUnaryExpression), tsSymbol[K](phpName), tsSymbol[K](phpVariableName))
                                                              rules[phpForeachPair] = tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=>"), tsSymbol[K](phpHidForeachValue))
                                                              rules[phpStaticModifier] = tsRegex[K]("[sS][tT][aA][tT][iI][cC]")
                                                              rules[phpDeclareDirective] = tsSeq[K](tsChoice[K](tsString[K]("ticks"), tsString[K]("encoding"), tsString[K]("strict_types")), tsString[K]("="), tsSymbol[K](phpHidLiteral))
                                                              rules[phpMemberAccessExpression] = tsSeq[K](tsSymbol[K](phpHidDereferencableExpression), tsString[K]("->"), tsSymbol[K](phpHidMemberName))
                                                              rules[phpSimpleParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpHidType), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsSymbol[K](phpVariableName), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](phpHidExpression)), tsBlank[K]()))
                                                              rules[phpPropertyDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsRepeat1[K](tsSymbol[K](phpHidModifier)), tsChoice[K](tsSymbol[K](phpHidType), tsBlank[K]()), tsSeq[K](tsSymbol[K](phpPropertyElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpPropertyElement)))), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpSwitchBlock] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](phpCaseStatement), tsSymbol[K](phpDefaultStatement))), tsString[K]("}")), tsSeq[K](tsString[K](":"), tsRepeat[K](tsChoice[K](tsSymbol[K](phpCaseStatement), tsSymbol[K](phpDefaultStatement))), tsRegex[K]("[eE][nN][dD][sS][wW][iI][tT][cC][hH]"), tsSymbol[K](phpHidSemicolon)))
                                                              rules[phpVariableName] = tsSeq[K](tsString[K]("$"), tsSymbol[K](phpName))
                                                              rules[phpOptionalType] = tsSeq[K](tsString[K]("?"), tsChoice[K](tsSymbol[K](phpNamedType), tsSymbol[K](phpPrimitiveType)))
                                                              rules[phpListLiteral] = tsChoice[K](tsSymbol[K](phpHidListDestructing), tsSymbol[K](phpHidArrayDestructing))
                                                              rules[phpHidClassTypeDesignator] = tsChoice[K](tsSymbol[K](phpQualifiedName), tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpSubscriptExpression), tsSymbol[K](phpMemberAccessExpression), tsSymbol[K](phpNullsafeMemberAccessExpression), tsSymbol[K](phpScopedPropertyAccessExpression), tsSymbol[K](phpHidVariableName))
                                                              rules[phpHidFunctionDefinitionHeader] = tsSeq[K](tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier)), tsSymbol[K](phpFormalParameters), tsChoice[K](tsSymbol[K](phpHidReturnType), tsBlank[K]()))
                                                              rules[phpFunctionCallExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName), tsSymbol[K](phpHidCallableExpression)), tsSymbol[K](phpArguments))
                                                              rules[phpDynamicVariableName] = tsChoice[K](tsSeq[K](tsString[K]("$"), tsSymbol[K](phpHidVariableName)), tsSeq[K](tsString[K]("$"), tsString[K]("{"), tsSymbol[K](phpHidExpression), tsString[K]("}")))
                                                              rules[phpBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](phpHidUnaryExpression), tsRegex[K]("[iI][nN][sS][tT][aA][nN][cC][eE][oO][fF]"), tsSymbol[K](phpHidClassTypeDesignator)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("??"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsRegex[K]("[aA][nN][dD]"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsRegex[K]("[oO][rR]"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsRegex[K]("[xX][oO][rR]"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("||"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("&&"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("|"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("^"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("&"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("!="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("<>"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("==="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("!=="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("<"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K](">"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("<="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K](">="), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("<=>"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("<<"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K](">>"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("+"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("-"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("."), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("*"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("/"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("%"), tsSymbol[K](phpHidExpression)))
                                                              rules[phpCompoundStatement] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](phpHidStatement)), tsString[K]("}"))
                                                              rules[phpQualifiedName] = tsSeq[K](tsSymbol[K](phpNamespaceNameAsPrefix), tsSymbol[K](phpName))
                                                              rules[phpString] = tsSeq[K](tsChoice[K](tsRegex[K]("[bB]\'"), tsString[K]("\'")), tsRepeat[K](tsRegex[K]("\\\\\'|\\\\\\\\|\\\\?[^\'\\\\]")), tsString[K]("\'"))
                                                              rules[phpIncludeOnceExpression] = tsSeq[K](tsRegex[K]("[iI][nN][cC][lL][uU][dD][eE][__][oO][nN][cC][eE]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpExponentiationExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](phpCloneExpression), tsSymbol[K](phpHidPrimaryExpression), tsSymbol[K](phpUnaryOpExpression), tsSymbol[K](phpMatchExpression)), tsString[K]("**"), tsChoice[K](tsSymbol[K](phpExponentiationExpression), tsSymbol[K](phpCloneExpression), tsSymbol[K](phpUnaryOpExpression), tsSymbol[K](phpHidPrimaryExpression), tsSymbol[K](phpAugmentedAssignmentExpression), tsSymbol[K](phpAssignmentExpression), tsSymbol[K](phpMatchExpression), tsSymbol[K](phpCastExpression)))
                                                              rules[phpCastExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](phpCastType), tsString[K](")"), tsChoice[K](tsSymbol[K](phpHidUnaryExpression), tsSymbol[K](phpIncludeExpression), tsSymbol[K](phpIncludeOnceExpression)))
                                                              rules[phpRelativeScope] = tsChoice[K](tsString[K]("self"), tsString[K]("parent"), tsRegex[K]("[sS][tT][aA][tT][iI][cC]"))
                                                              rules[phpHidSimpleStringPart] = tsChoice[K](tsSymbol[K](phpHidSimpleStringMemberAccessExpression), tsSymbol[K](phpHidVariableName), tsSymbol[K](phpHidSimpleStringSubscriptExpression))
                                                              rules[phpMatchExpression] = tsSeq[K](tsRegex[K]("[mM][aA][tT][cC][hH]"), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpMatchBlock))
                                                              rules[phpEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsString[K]("n"), tsString[K]("r"), tsString[K]("t"), tsString[K]("v"), tsString[K]("e"), tsString[K]("f"), tsString[K]("\\"), tsRegex[K]("\\$"), tsString[K]("\""), tsRegex[K]("[0-7]{1,3}"), tsRegex[K]("x[0-9A-Fa-f]{1,2}"), tsRegex[K]("u{[0-9A-Fa-f]+}")))
                                                              rules[phpNullsafeMemberAccessExpression] = tsSeq[K](tsSymbol[K](phpHidDereferencableExpression), tsString[K]("?->"), tsSymbol[K](phpHidMemberName))
                                                              rules[phpDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](phpHidMemberDeclaration)), tsString[K]("}"))
                                                              rules[phpHidCallableExpression] = tsChoice[K](tsSymbol[K](phpHidCallableVariable), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpArrayCreationExpression), tsSymbol[K](phpHidString))
                                                              rules[phpHidReservedIdentifier] = tsChoice[K](tsString[K]("self"), tsString[K]("parent"), tsRegex[K]("[sS][tT][aA][tT][iI][cC]"))
                                                              rules[phpFunctionDefinition] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsSymbol[K](phpHidFunctionDefinitionHeader), tsSymbol[K](phpCompoundStatement))
                                                              rules[phpHidSimpleStringSubscriptUnaryExpression] = tsSeq[K](tsString[K]("-"), tsSymbol[K](phpInteger))
                                                              rules[phpReferenceModifier] = tsString[K]("&")
                                                              rules[phpAugmentedAssignmentExpression] = tsSeq[K](tsSymbol[K](phpHidVariable), tsChoice[K](tsString[K]("**="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("+="), tsString[K]("-="), tsString[K](".="), tsString[K]("<<="), tsString[K](">>="), tsString[K]("&="), tsString[K]("^="), tsString[K]("|="), tsString[K]("??=")), tsSymbol[K](phpHidExpression))
                                                              rules[phpArrayCreationExpression] = tsChoice[K](tsSeq[K](tsRegex[K]("[aA][rR][rR][aA][yY]"), tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](phpArrayElementInitializer), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpArrayElementInitializer)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")")), tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](phpArrayElementInitializer), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpArrayElementInitializer)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]")))
                                                              rules[phpUpdateExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](phpHidVariable), tsString[K]("++")), tsSeq[K](tsSymbol[K](phpHidVariable), tsString[K]("--")), tsSeq[K](tsString[K]("++"), tsSymbol[K](phpHidVariable)), tsSeq[K](tsString[K]("--"), tsSymbol[K](phpHidVariable)))
                                                              rules[phpCastVariable] = tsSeq[K](tsString[K]("("), tsSymbol[K](phpCastType), tsString[K](")"), tsSymbol[K](phpHidVariable))
                                                              rules[phpAttribute] = tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName)), tsChoice[K](tsSymbol[K](phpArguments), tsBlank[K]()))
                                                              rules[phpHidConstDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpVisibilityModifier), tsBlank[K]()), tsRegex[K]("[cC][oO][nN][sS][tT]"), tsSeq[K](tsSymbol[K](phpConstElement), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpConstElement)))), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpTextInterpolation] = tsSeq[K](tsString[K]("?>"), tsChoice[K](tsSymbol[K](phpText), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpPhpTag), tsSymbol[K](phpHidEof)))
                                                              rules[phpCatchClause] = tsSeq[K](tsRegex[K]("[cC][aA][tT][cC][hH]"), tsString[K]("("), tsSymbol[K](phpTypeList), tsChoice[K](tsSymbol[K](phpVariableName), tsBlank[K]()), tsString[K](")"), tsSymbol[K](phpCompoundStatement))
                                                              rules[phpFormalParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](phpSimpleParameter), tsSymbol[K](phpVariadicParameter), tsSymbol[K](phpPropertyPromotionParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpSimpleParameter), tsSymbol[K](phpVariadicParameter), tsSymbol[K](phpPropertyPromotionParameter))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                              rules[phpFunctionStaticDeclaration] = tsSeq[K](tsRegex[K]("[sS][tT][aA][tT][iI][cC]"), tsSeq[K](tsSymbol[K](phpStaticVariableDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpStaticVariableDeclaration)))), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpHidArrayDestructingElement] = tsChoice[K](tsChoice[K](tsSymbol[K](phpHidArrayDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=>"), tsChoice[K](tsSymbol[K](phpHidArrayDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef))))
                                                              rules[phpNamespaceAliasingClause] = tsSeq[K](tsRegex[K]("[aA][sS]"), tsSymbol[K](phpName))
                                                              rules[phpEnumDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](phpHidEnumMemberDeclaration)), tsString[K]("}"))
                                                              rules[phpHidMemberDeclaration] = tsChoice[K](tsSymbol[K](phpHidClassConstDeclaration), tsSymbol[K](phpPropertyDeclaration), tsSymbol[K](phpMethodDeclaration), tsSymbol[K](phpUseDeclaration))
                                                              rules[phpAssignmentExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](phpHidVariable), tsSymbol[K](phpListLiteral)), tsString[K]("="), tsSymbol[K](phpHidExpression))
                                                              rules[phpElseIfClause] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE][iI][fF]"), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpHidStatement))
                                                              rules[phpDoStatement] = tsSeq[K](tsRegex[K]("[dD][oO]"), tsSymbol[K](phpHidStatement), tsRegex[K]("[wW][hH][iI][lL][eE]"), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpProgram] = tsSeq[K](tsChoice[K](tsSymbol[K](phpText), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](phpPhpTag), tsRepeat[K](tsSymbol[K](phpHidStatement))), tsBlank[K]()))
                                                              rules[phpUnaryOpExpression] = tsChoice[K](tsSeq[K](tsString[K]("@"), tsSymbol[K](phpHidExpression)), tsSeq[K](tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("~"), tsString[K]("!")), tsSymbol[K](phpHidExpression)))
                                                              rules[phpMatchDefaultExpression] = tsSeq[K](tsRegex[K]("[dD][eE][fF][aA][uU][lL][tT]"), tsString[K]("=>"), tsSymbol[K](phpHidExpression))
                                                              rules[phpPrintIntrinsic] = tsSeq[K](tsRegex[K]("[pP][rR][iI][nN][tT]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpUnionType] = tsSeq[K](tsSymbol[K](phpHidTypes), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](phpHidTypes))))
                                                              rules[phpYieldExpression] = tsSeq[K](tsRegex[K]("[yY][iI][eE][lL][dD]"), tsChoice[K](tsChoice[K](tsSymbol[K](phpArrayElementInitializer), tsSeq[K](tsRegex[K]("[fF][rR][oO][mM]"), tsSymbol[K](phpHidExpression))), tsBlank[K]()))
                                                              rules[phpPropertyPromotionParameter] = tsSeq[K](tsSymbol[K](phpVisibilityModifier), tsChoice[K](tsSymbol[K](phpHidType), tsBlank[K]()), tsSymbol[K](phpVariableName), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](phpHidExpression)), tsBlank[K]()))
                                                              rules[phpNamespaceUseDeclaration] = tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsChoice[K](tsChoice[K](tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsRegex[K]("[cC][oO][nN][sS][tT]")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](phpNamespaceUseClause), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpNamespaceUseClause))))), tsSeq[K](tsChoice[K](tsString[K]("\\"), tsBlank[K]()), tsSymbol[K](phpNamespaceName), tsString[K]("\\"), tsSymbol[K](phpNamespaceUseGroup))), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpHidSimpleStringSubscriptExpression] = tsSeq[K](tsSymbol[K](phpVariableName), tsSeq[K](tsString[K]("["), tsSymbol[K](phpHidSimpleStringArrayAccessArgument), tsString[K]("]")))
                                                              rules[phpUseList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](phpUseInsteadOfClause), tsSymbol[K](phpUseAsClause)), tsSymbol[K](phpHidSemicolon))), tsString[K]("}"))
                                                              rules[phpReturnStatement] = tsSeq[K](tsRegex[K]("[rR][eE][tT][uU][rR][nN]"), tsChoice[K](tsSymbol[K](phpHidExpression), tsBlank[K]()), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpEncapsedString] = tsSeq[K](tsChoice[K](tsRegex[K]("[bB]\""), tsString[K]("\"")), tsRepeat[K](tsChoice[K](tsSymbol[K](phpEscapeSequence), tsSeq[K](tsSymbol[K](phpVariableName), tsSymbol[K](phpEncapsedStringCharsAfterVariable)), tsSymbol[K](phpEncapsedStringChars), tsSymbol[K](phpHidSimpleStringPart), tsSymbol[K](phpHidComplexStringPart), tsString[K]("\\u"), tsString[K]("\'"))), tsString[K]("\""))
                                                              rules[phpHidExpression] = tsChoice[K](tsSymbol[K](phpConditionalExpression), tsSymbol[K](phpMatchExpression), tsSymbol[K](phpAugmentedAssignmentExpression), tsSymbol[K](phpAssignmentExpression), tsSymbol[K](phpReferenceAssignmentExpression), tsSymbol[K](phpYieldExpression), tsSymbol[K](phpHidUnaryExpression), tsSymbol[K](phpBinaryExpression), tsSymbol[K](phpIncludeExpression), tsSymbol[K](phpIncludeOnceExpression), tsSymbol[K](phpRequireExpression), tsSymbol[K](phpRequireOnceExpression))
                                                              rules[phpColonBlock] = tsSeq[K](tsString[K](":"), tsRepeat[K](tsSymbol[K](phpHidStatement)))
                                                              rules[phpSwitchStatement] = tsSeq[K](tsRegex[K]("[sS][wW][iI][tT][cC][hH]"), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpSwitchBlock))
                                                              rules[phpCaseStatement] = tsSeq[K](tsRegex[K]("[cC][aA][sS][eE]"), tsSymbol[K](phpHidExpression), tsChoice[K](tsString[K](":"), tsString[K](";")), tsRepeat[K](tsSymbol[K](phpHidStatement)))
                                                              rules[phpClassDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](phpFinalModifier), tsSymbol[K](phpAbstractModifier)), tsBlank[K]()), tsRegex[K]("[cC][lL][aA][sS][sS]"), tsSymbol[K](phpName), tsChoice[K](tsSymbol[K](phpBaseClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpClassInterfaceClause), tsBlank[K]()), tsSymbol[K](phpDeclarationList), tsChoice[K](tsSymbol[K](phpHidSemicolon), tsBlank[K]()))
                                                              rules[phpElseClause2] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsSymbol[K](phpColonBlock))
                                                              rules[phpClassInterfaceClause] = tsSeq[K](tsRegex[K]("[iI][mM][pP][lL][eE][mM][eE][nN][tT][sS]"), tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName))))))
                                                              rules[phpRequireOnceExpression] = tsSeq[K](tsRegex[K]("[rR][eE][qQ][uU][iI][rR][eE][__][oO][nN][cC][eE]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpHidModifier] = tsChoice[K](tsSymbol[K](phpVarModifier), tsSymbol[K](phpVisibilityModifier), tsSymbol[K](phpStaticModifier), tsSymbol[K](phpFinalModifier), tsSymbol[K](phpAbstractModifier))
                                                              rules[phpUseInsteadOfClause] = tsSeq[K](tsChoice[K](tsSymbol[K](phpClassConstantAccessExpression), tsSymbol[K](phpName)), tsRegex[K]("[iI][nN][sS][tT][eE][aA][dD][oO][fF]"), tsSymbol[K](phpName))
                                                              rules[phpFinalModifier] = tsRegex[K]("[fF][iI][nN][aA][lL]")
                                                              rules[phpNamespaceUseGroup] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](phpNamespaceUseGroupClause), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpNamespaceUseGroupClause)))), tsString[K]("}"))
                                                              rules[phpBaseClause] = tsSeq[K](tsRegex[K]("[eE][xX][tT][eE][nN][dD][sS]"), tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName))))))
                                                              rules[phpInterfaceDeclaration] = tsSeq[K](tsRegex[K]("[iI][nN][tT][eE][rR][fF][aA][cC][eE]"), tsSymbol[K](phpName), tsChoice[K](tsSymbol[K](phpBaseClause), tsBlank[K]()), tsSymbol[K](phpDeclarationList))
                                                              rules[phpMatchConditionList] = tsSeq[K](tsSymbol[K](phpHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpHidExpression))))
                                                              rules[phpVariableReference] = tsSeq[K](tsString[K]("&"), tsSymbol[K](phpVariableName))
                                                              rules[phpShellCommandExpression] = tsSeq[K](tsString[K]("`"), tsRepeat[K](tsChoice[K](tsChoice[K](tsRegex[K]("\\\\\"|\\\\\\\\|\\\\\\$|\\\\e|\\\\f|\\\\n|\\\\r|\\\\t|\\\\v"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("[0-7]"), tsChoice[K](tsRegex[K]("[0-7]"), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-7]"), tsBlank[K]())), tsSeq[K](tsRegex[K]("\\\\[xX]"), tsRegex[K]("\\d|a-f|A-F"), tsChoice[K](tsRegex[K]("\\d|a-f|A-F"), tsBlank[K]())), tsSeq[K](tsString[K]("\\u{"), tsRepeat1[K](tsRegex[K]("\\d|a-f|A-F")), tsString[K]("}"))), tsRegex[K]("[^`\\\\]|\\\\[^`\\\\$efnrtv0-7]"))), tsString[K]("`"))
                                                              rules[phpCloneExpression] = tsSeq[K](tsRegex[K]("[cC][lL][oO][nN][eE]"), tsSymbol[K](phpHidPrimaryExpression))
                                                              rules[phpVisibilityModifier] = tsChoice[K](tsRegex[K]("[pP][uU][bB][lL][iI][cC]"), tsRegex[K]("[pP][rR][oO][tT][eE][cC][tT][eE][dD]"), tsRegex[K]("[pP][rR][iI][vV][aA][tT][eE]"))
                                                              rules[phpElseClause] = tsSeq[K](tsRegex[K]("[eE][lL][sS][eE]"), tsSymbol[K](phpHidStatement))
                                                              rules[phpAttributeList] = tsRepeat1[K](tsSeq[K](tsString[K]("#["), tsSeq[K](tsSymbol[K](phpAttribute), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](phpAttribute)))), tsString[K]("]")))
                                                              rules[phpHidStatement] = tsChoice[K](tsSymbol[K](phpEmptyStatement), tsSymbol[K](phpCompoundStatement), tsSymbol[K](phpNamedLabelStatement), tsSymbol[K](phpExpressionStatement), tsSymbol[K](phpIfStatement), tsSymbol[K](phpSwitchStatement), tsSymbol[K](phpWhileStatement), tsSymbol[K](phpDoStatement), tsSymbol[K](phpForStatement), tsSymbol[K](phpForeachStatement), tsSymbol[K](phpGotoStatement), tsSymbol[K](phpContinueStatement), tsSymbol[K](phpBreakStatement), tsSymbol[K](phpReturnStatement), tsSymbol[K](phpTryStatement), tsSymbol[K](phpDeclareStatement), tsSymbol[K](phpEchoStatement), tsSymbol[K](phpUnsetStatement), tsSymbol[K](phpConstDeclaration), tsSymbol[K](phpFunctionDefinition), tsSymbol[K](phpClassDeclaration), tsSymbol[K](phpInterfaceDeclaration), tsSymbol[K](phpTraitDeclaration), tsSymbol[K](phpEnumDeclaration), tsSymbol[K](phpNamespaceDefinition), tsSymbol[K](phpNamespaceUseDeclaration), tsSymbol[K](phpGlobalDeclaration), tsSymbol[K](phpFunctionStaticDeclaration))
                                                              rules[phpScopedCallExpression] = tsSeq[K](tsSymbol[K](phpHidScopeResolutionQualifier), tsString[K]("::"), tsSymbol[K](phpHidMemberName), tsSymbol[K](phpArguments))
                                                              rules[phpHidDereferencableExpression] = tsChoice[K](tsSymbol[K](phpHidVariable), tsSymbol[K](phpClassConstantAccessExpression), tsSymbol[K](phpParenthesizedExpression), tsSymbol[K](phpArrayCreationExpression), tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName), tsSymbol[K](phpHidString))
                                                              rules[phpNamedLabelStatement] = tsSeq[K](tsSymbol[K](phpName), tsString[K](":"))
                                                              rules[phpHidCallableVariable] = tsChoice[K](tsSymbol[K](phpHidVariableName), tsSymbol[K](phpSubscriptExpression), tsSymbol[K](phpMemberCallExpression), tsSymbol[K](phpNullsafeMemberCallExpression), tsSymbol[K](phpScopedCallExpression), tsSymbol[K](phpFunctionCallExpression))
                                                              rules[phpScopedPropertyAccessExpression] = tsSeq[K](tsSymbol[K](phpHidScopeResolutionQualifier), tsString[K]("::"), tsSymbol[K](phpHidVariableName))
                                                              rules[phpDefaultStatement] = tsSeq[K](tsRegex[K]("[dD][eE][fF][aA][uU][lL][tT]"), tsChoice[K](tsString[K](":"), tsString[K](";")), tsRepeat[K](tsSymbol[K](phpHidStatement)))
                                                              rules[phpReferenceAssignmentExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](phpHidVariable), tsSymbol[K](phpListLiteral)), tsString[K]("="), tsString[K]("&"), tsSymbol[K](phpHidExpression))
                                                              rules[phpPropertyInitializer] = tsSeq[K](tsString[K]("="), tsSymbol[K](phpHidExpression))
                                                              rules[phpAbstractModifier] = tsRegex[K]("[aA][bB][sS][tT][rR][aA][cC][tT]")
                                                              rules[phpDeclareStatement] = tsSeq[K](tsRegex[K]("[dD][eE][cC][lL][aA][rR][eE]"), tsString[K]("("), tsSymbol[K](phpDeclareDirective), tsString[K](")"), tsChoice[K](tsSymbol[K](phpHidStatement), tsSeq[K](tsString[K](":"), tsRepeat[K](tsSymbol[K](phpHidStatement)), tsRegex[K]("[eE][nN][dD][dD][eE][cC][lL][aA][rR][eE]"), tsSymbol[K](phpHidSemicolon)), tsSymbol[K](phpHidSemicolon)))
                                                              rules[phpParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](phpHidExpression), tsString[K](")"))
                                                              rules[phpHidEnumMemberDeclaration] = tsChoice[K](tsSymbol[K](phpEnumCase), tsSymbol[K](phpMethodDeclaration), tsSymbol[K](phpUseDeclaration))
                                                              rules[phpEnumDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsRegex[K]("[eE][nN][uU][mM]"), tsSymbol[K](phpName), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](phpHidType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpClassInterfaceClause), tsBlank[K]()), tsSymbol[K](phpEnumDeclarationList))
                                                              rules[phpHidMemberName] = tsChoice[K](tsChoice[K](tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpName), tsSymbol[K](phpHidVariableName)), tsSeq[K](tsString[K]("{"), tsSymbol[K](phpHidExpression), tsString[K]("}")))
                                                              rules[phpByRef] = tsSeq[K](tsString[K]("&"), tsChoice[K](tsSymbol[K](phpHidCallableVariable), tsSymbol[K](phpMemberAccessExpression), tsSymbol[K](phpNullsafeMemberAccessExpression)))
                                                              rules[phpMatchBlock] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](phpMatchConditionalExpression), tsSymbol[K](phpMatchDefaultExpression)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpMatchConditionalExpression), tsSymbol[K](phpMatchDefaultExpression))))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                              rules[phpPropertyElement] = tsSeq[K](tsSymbol[K](phpVariableName), tsChoice[K](tsSymbol[K](phpPropertyInitializer), tsBlank[K]()))
                                                              rules[phpHidLiteral] = tsChoice[K](tsSymbol[K](phpInteger), tsSymbol[K](phpFloat), tsSymbol[K](phpHidString), tsSymbol[K](phpBoolean), tsSymbol[K](phpNull))
                                                              rules[phpUseAsClause] = tsSeq[K](tsChoice[K](tsSymbol[K](phpClassConstantAccessExpression), tsSymbol[K](phpName)), tsRegex[K]("[aA][sS]"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](phpVisibilityModifier), tsBlank[K]()), tsSymbol[K](phpName)), tsSeq[K](tsSymbol[K](phpVisibilityModifier), tsChoice[K](tsSymbol[K](phpName), tsBlank[K]()))))
                                                              rules[phpCastType] = tsChoice[K](tsRegex[K]("[aA][rR][rR][aA][yY]"), tsRegex[K]("[bB][iI][nN][aA][rR][yY]"), tsRegex[K]("[bB][oO][oO][lL]"), tsRegex[K]("[bB][oO][oO][lL][eE][aA][nN]"), tsRegex[K]("[dD][oO][uU][bB][lL][eE]"), tsRegex[K]("[iI][nN][tT]"), tsRegex[K]("[iI][nN][tT][eE][gG][eE][rR]"), tsRegex[K]("[fF][lL][oO][aA][tT]"), tsRegex[K]("[oO][bB][jJ][eE][cC][tT]"), tsRegex[K]("[rR][eE][aA][lL]"), tsRegex[K]("[sS][tT][rR][iI][nN][gG]"), tsRegex[K]("[uU][nN][sS][eE][tT]"))
                                                              rules[phpNamespaceDefinition] = tsSeq[K](tsRegex[K]("[nN][aA][mM][eE][sS][pP][aA][cC][eE]"), tsChoice[K](tsSeq[K](tsSymbol[K](phpNamespaceName), tsSymbol[K](phpHidSemicolon)), tsSeq[K](tsChoice[K](tsSymbol[K](phpNamespaceName), tsBlank[K]()), tsSymbol[K](phpCompoundStatement))))
                                                              rules[phpWhileStatement] = tsSeq[K](tsRegex[K]("[wW][hH][iI][lL][eE]"), tsSymbol[K](phpParenthesizedExpression), tsChoice[K](tsSymbol[K](phpHidStatement), tsSeq[K](tsSymbol[K](phpColonBlock), tsRegex[K]("[eE][nN][dD][wW][hH][iI][lL][eE]"), tsSymbol[K](phpHidSemicolon))))
                                                              rules[phpNamespaceName] = tsSeq[K](tsSymbol[K](phpName), tsRepeat[K](tsSeq[K](tsString[K]("\\"), tsSymbol[K](phpName))))
                                                              rules[phpNull] = tsRegex[K]("[nN][uU][lL][lL]")
                                                              rules[phpHidType] = tsSymbol[K](phpUnionType)
                                                              rules[phpPhpTag] = tsRegex[K]("<\\?([pP][hH][pP]|=)?")
                                                              rules[phpHidExpressions] = tsChoice[K](tsSymbol[K](phpHidExpression), tsSymbol[K](phpSequenceExpression))
                                                              rules[phpObjectCreationExpression] = tsChoice[K](tsSeq[K](tsRegex[K]("[nN][eE][wW]"), tsSymbol[K](phpHidClassTypeDesignator), tsChoice[K](tsSymbol[K](phpArguments), tsBlank[K]())), tsSeq[K](tsRegex[K]("[nN][eE][wW]"), tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsRegex[K]("[cC][lL][aA][sS][sS]"), tsChoice[K](tsSymbol[K](phpArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpBaseClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpClassInterfaceClause), tsBlank[K]()), tsSymbol[K](phpDeclarationList)))
                                                              rules[phpNamespaceNameAsPrefix] = tsChoice[K](tsString[K]("\\"), tsSeq[K](tsChoice[K](tsString[K]("\\"), tsBlank[K]()), tsSymbol[K](phpNamespaceName), tsString[K]("\\")), tsSeq[K](tsRegex[K]("[nN][aA][mM][eE][sS][pP][aA][cC][eE]"), tsString[K]("\\")), tsSeq[K](tsRegex[K]("[nN][aA][mM][eE][sS][pP][aA][cC][eE]"), tsChoice[K](tsString[K]("\\"), tsBlank[K]()), tsSymbol[K](phpNamespaceName), tsString[K]("\\")))
                                                              rules[phpHidClassConstDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](phpAttributeList), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpFinalModifier), tsBlank[K]()), tsSymbol[K](phpHidConstDeclaration))
                                                              rules[phpUseDeclaration] = tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName))))), tsChoice[K](tsSymbol[K](phpUseList), tsSymbol[K](phpHidSemicolon)))
                                                              rules[phpTryStatement] = tsSeq[K](tsRegex[K]("[tT][rR][yY]"), tsSymbol[K](phpCompoundStatement), tsRepeat1[K](tsChoice[K](tsSymbol[K](phpCatchClause), tsSymbol[K](phpFinallyClause))))
                                                              rules[phpHidListDestructing] = tsSeq[K](tsRegex[K]("[lL][iI][sS][tT]"), tsString[K]("("), tsSeq[K](tsChoice[K](tsChoice[K](tsChoice[K](tsSymbol[K](phpHidListDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=>"), tsChoice[K](tsSymbol[K](phpHidListDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef)))), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsChoice[K](tsSymbol[K](phpHidListDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=>"), tsChoice[K](tsSymbol[K](phpHidListDestructing), tsSymbol[K](phpHidVariable), tsSymbol[K](phpByRef)))), tsBlank[K]())))), tsString[K](")"))
                                                              rules[phpConditionalExpression] = tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("?"), tsChoice[K](tsSymbol[K](phpHidExpression), tsBlank[K]()), tsString[K](":"), tsSymbol[K](phpHidExpression))
                                                              rules[phpConstElement] = tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier)), tsString[K]("="), tsSymbol[K](phpHidExpression))
                                                              rules[phpNamespaceUseClause] = tsSeq[K](tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName)), tsChoice[K](tsSymbol[K](phpNamespaceAliasingClause), tsBlank[K]()))
                                                              rules[phpBoolean] = tsRegex[K]("[Tt][Rr][Uu][Ee]|[Ff][Aa][Ll][Ss][Ee]")
                                                              rules[phpHidScopeResolutionQualifier] = tsChoice[K](tsSymbol[K](phpRelativeScope), tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier), tsSymbol[K](phpQualifiedName), tsSymbol[K](phpHidDereferencableExpression))
                                                              rules[phpConstDeclaration] = tsSymbol[K](phpHidConstDeclaration)
                                                              rules[phpPrimitiveType] = tsChoice[K](tsString[K]("array"), tsRegex[K]("[cC][aA][lL][lL][aA][bB][lL][eE]"), tsString[K]("iterable"), tsString[K]("bool"), tsString[K]("float"), tsString[K]("int"), tsString[K]("string"), tsString[K]("void"), tsString[K]("mixed"), tsString[K]("static"), tsString[K]("false"), tsString[K]("null"))
                                                              rules[phpBreakStatement] = tsSeq[K](tsRegex[K]("[bB][rR][eE][aA][kK]"), tsChoice[K](tsSymbol[K](phpHidExpression), tsBlank[K]()), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpAnonymousFunctionUseClause] = tsSeq[K](tsRegex[K]("[uU][sS][eE]"), tsString[K]("("), tsSeq[K](tsChoice[K](tsSymbol[K](phpVariableReference), tsSymbol[K](phpVariableName)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](phpVariableReference), tsSymbol[K](phpVariableName))))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                              rules[phpTraitDeclaration] = tsSeq[K](tsRegex[K]("[tT][rR][aA][iI][tT]"), tsSymbol[K](phpName), tsSymbol[K](phpDeclarationList))
                                                              rules[phpContinueStatement] = tsSeq[K](tsRegex[K]("[cC][oO][nN][tT][iI][nN][uU][eE]"), tsChoice[K](tsSymbol[K](phpHidExpression), tsBlank[K]()), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpIfStatement] = tsSeq[K](tsRegex[K]("[iI][fF]"), tsSymbol[K](phpParenthesizedExpression), tsChoice[K](tsSeq[K](tsSymbol[K](phpHidStatement), tsRepeat[K](tsSymbol[K](phpElseIfClause)), tsChoice[K](tsSymbol[K](phpElseClause), tsBlank[K]())), tsSeq[K](tsSymbol[K](phpColonBlock), tsRepeat[K](tsSymbol[K](phpElseIfClause2)), tsChoice[K](tsSymbol[K](phpElseClause2), tsBlank[K]()), tsRegex[K]("[eE][nN][dD][iI][fF]"), tsSymbol[K](phpHidSemicolon))))
                                                              rules[phpRequireExpression] = tsSeq[K](tsRegex[K]("[rR][eE][qQ][uU][iI][rR][eE]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpHidSemicolon] = tsChoice[K](tsSymbol[K](phpHidAutomaticSemicolon), tsString[K](";"))
                                                              rules[phpThrowExpression] = tsSeq[K](tsRegex[K]("[tT][hH][rR][oO][wW]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpHidTypes] = tsChoice[K](tsSymbol[K](phpOptionalType), tsSymbol[K](phpNamedType), tsSymbol[K](phpPrimitiveType))
                                                              rules[phpTypeList] = tsSeq[K](tsSymbol[K](phpNamedType), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](phpNamedType))))
                                                              rules[phpIncludeExpression] = tsSeq[K](tsRegex[K]("[iI][nN][cC][lL][uU][dD][eE]"), tsSymbol[K](phpHidExpression))
                                                              rules[phpStaticVariableDeclaration] = tsSeq[K](tsSymbol[K](phpVariableName), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](phpHidExpression)), tsBlank[K]()))
                                                              rules[phpExpressionStatement] = tsSeq[K](tsSymbol[K](phpHidExpression), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpHidString] = tsChoice[K](tsSymbol[K](phpEncapsedString), tsSymbol[K](phpString), tsSymbol[K](phpHeredoc))
                                                              rules[phpNamedType] = tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpQualifiedName))
                                                              rules[phpClassConstantAccessExpression] = tsSeq[K](tsSymbol[K](phpHidScopeResolutionQualifier), tsString[K]("::"), tsChoice[K](tsSymbol[K](phpName), tsSymbol[K](phpHidReservedIdentifier)))
                                                              rules[phpArgument] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](phpName), tsString[K](":")), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpReferenceModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](phpVariadicUnpacking), tsSymbol[K](phpHidExpression)))
                                                              rules[phpEchoStatement] = tsSeq[K](tsRegex[K]("[eE][cC][hH][oO]"), tsSymbol[K](phpHidExpressions), tsSymbol[K](phpHidSemicolon))
                                                              rules[phpEmptyStatement] = tsString[K](";")
                                                              rules[phpHidForeachValue] = tsChoice[K](tsSymbol[K](phpByRef), tsSymbol[K](phpHidExpression), tsSymbol[K](phpListLiteral))
                                                              rules[phpNamespaceUseGroupClause] = tsSeq[K](tsChoice[K](tsChoice[K](tsRegex[K]("[fF][uU][nN][cC][tT][iI][oO][nN]"), tsRegex[K]("[cC][oO][nN][sS][tT]")), tsBlank[K]()), tsSymbol[K](phpNamespaceName), tsChoice[K](tsSymbol[K](phpNamespaceAliasingClause), tsBlank[K]()))
                                                              rules[phpFloat] = tsRegex[K]("\\d*(_\\d+)*((\\.\\d*(_\\d+)*)?([eE][\\+-]?\\d+(_\\d+)*)|(\\.\\d*(_\\d+)*)([eE][\\+-]?\\d+(_\\d+)*)?)")
                                                              rules[phpArrayElementInitializer] = tsChoice[K](tsChoice[K](tsSymbol[K](phpByRef), tsSymbol[K](phpHidExpression)), tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K]("=>"), tsChoice[K](tsSymbol[K](phpByRef), tsSymbol[K](phpHidExpression))), tsSymbol[K](phpVariadicUnpacking))
                                                              rules[phpHidVariable] = tsChoice[K](tsSymbol[K](phpCastVariable), tsSymbol[K](phpHidCallableVariable), tsSymbol[K](phpScopedPropertyAccessExpression), tsSymbol[K](phpMemberAccessExpression), tsSymbol[K](phpNullsafeMemberAccessExpression))
                                                              rules[phpSequenceExpression] = tsSeq[K](tsSymbol[K](phpHidExpression), tsString[K](","), tsChoice[K](tsSymbol[K](phpSequenceExpression), tsSymbol[K](phpHidExpression)))
                                                              rules[phpName] = tsRegex[K]("[_a-zA-Z\\u00A1-\\u00ff][_a-zA-Z\\u00A1-\\u00ff\\d]*")
                                                              rules[phpNullsafeMemberCallExpression] = tsSeq[K](tsSymbol[K](phpHidDereferencableExpression), tsString[K]("?->"), tsSymbol[K](phpHidMemberName), tsSymbol[K](phpArguments))
                                                              rules

