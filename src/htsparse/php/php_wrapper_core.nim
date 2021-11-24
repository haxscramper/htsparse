import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  PhpNodeKind* = enum
    phpUsExpression                        ## _expression
    phpUsLiteral                           ## _literal
    phpUsPrimaryExpression                 ## _primary_expression
    phpUsStatement                         ## _statement
    phpUsType                              ## _type
    phpAbstractModifier                    ## abstract_modifier
    phpAnonymousFunctionCreationExpression ## anonymous_function_creation_expression
    phpAnonymousFunctionUseClause          ## anonymous_function_use_clause
    phpArgument                            ## argument
    phpArguments                           ## arguments
    phpArrayCreationExpression             ## array_creation_expression
    phpArrayElementInitializer             ## array_element_initializer
    phpArrowFunction                       ## arrow_function
    phpAssignmentExpression                ## assignment_expression
    phpAttribute                           ## attribute
    phpAttributeList                       ## attribute_list
    phpAugmentedAssignmentExpression       ## augmented_assignment_expression
    phpBaseClause                          ## base_clause
    phpBinaryExpression                    ## binary_expression
    phpBreakStatement                      ## break_statement
    phpByRef                               ## by_ref
    phpCaseStatement                       ## case_statement
    phpCastExpression                      ## cast_expression
    phpCastType                            ## cast_type
    phpCatchClause                         ## catch_clause
    phpClassConstantAccessExpression       ## class_constant_access_expression
    phpClassDeclaration                    ## class_declaration
    phpClassInterfaceClause                ## class_interface_clause
    phpCloneExpression                     ## clone_expression
    phpColonBlock                          ## colon_block
    phpCompoundStatement                   ## compound_statement
    phpConditionalExpression               ## conditional_expression
    phpConstDeclaration                    ## const_declaration
    phpConstElement                        ## const_element
    phpContinueStatement                   ## continue_statement
    phpDeclarationList                     ## declaration_list
    phpDeclareDirective                    ## declare_directive
    phpDeclareStatement                    ## declare_statement
    phpDefaultStatement                    ## default_statement
    phpDoStatement                         ## do_statement
    phpDynamicVariableName                 ## dynamic_variable_name
    phpEchoStatement                       ## echo_statement
    phpElseClause                          ## else_clause
    phpElseIfClause                        ## else_if_clause
    phpEmptyStatement                      ## empty_statement
    phpEncapsedString                      ## encapsed_string
    phpEnumCase                            ## enum_case
    phpEnumDeclaration                     ## enum_declaration
    phpEnumDeclarationList                 ## enum_declaration_list
    phpExponentiationExpression            ## exponentiation_expression
    phpExpressionStatement                 ## expression_statement
    phpFinalModifier                       ## final_modifier
    phpFinallyClause                       ## finally_clause
    phpForStatement                        ## for_statement
    phpForeachStatement                    ## foreach_statement
    phpFormalParameters                    ## formal_parameters
    phpFunctionCallExpression              ## function_call_expression
    phpFunctionDefinition                  ## function_definition
    phpFunctionStaticDeclaration           ## function_static_declaration
    phpGlobalDeclaration                   ## global_declaration
    phpGotoStatement                       ## goto_statement
    phpIfStatement                         ## if_statement
    phpIncludeExpression                   ## include_expression
    phpIncludeOnceExpression               ## include_once_expression
    phpInterfaceDeclaration                ## interface_declaration
    phpListLiteral                         ## list_literal
    phpMatchBlock                          ## match_block
    phpMatchConditionList                  ## match_condition_list
    phpMatchConditionalExpression          ## match_conditional_expression
    phpMatchDefaultExpression              ## match_default_expression
    phpMatchExpression                     ## match_expression
    phpMemberAccessExpression              ## member_access_expression
    phpMemberCallExpression                ## member_call_expression
    phpMethodDeclaration                   ## method_declaration
    phpName                                ## name
    phpNamedLabelStatement                 ## named_label_statement
    phpNamedType                           ## named_type
    phpNamespaceAliasingClause             ## namespace_aliasing_clause
    phpNamespaceDefinition                 ## namespace_definition
    phpNamespaceName                       ## namespace_name
    phpNamespaceNameAsPrefix               ## namespace_name_as_prefix
    phpNamespaceUseClause                  ## namespace_use_clause
    phpNamespaceUseDeclaration             ## namespace_use_declaration
    phpNamespaceUseGroup                   ## namespace_use_group
    phpNamespaceUseGroupClause             ## namespace_use_group_clause
    phpNullsafeMemberAccessExpression      ## nullsafe_member_access_expression
    phpNullsafeMemberCallExpression        ## nullsafe_member_call_expression
    phpObjectCreationExpression            ## object_creation_expression
    phpOptionalType                        ## optional_type
    phpPair                                ## pair
    phpParenthesizedExpression             ## parenthesized_expression
    phpPrimitiveType                       ## primitive_type
    phpPrintIntrinsic                      ## print_intrinsic
    phpProgram                             ## program
    phpPropertyDeclaration                 ## property_declaration
    phpPropertyElement                     ## property_element
    phpPropertyInitializer                 ## property_initializer
    phpPropertyPromotionParameter          ## property_promotion_parameter
    phpQualifiedName                       ## qualified_name
    phpReferenceAssignmentExpression       ## reference_assignment_expression
    phpReferenceModifier                   ## reference_modifier
    phpRelativeScope                       ## relative_scope
    phpRequireExpression                   ## require_expression
    phpRequireOnceExpression               ## require_once_expression
    phpReturnStatement                     ## return_statement
    phpScopedCallExpression                ## scoped_call_expression
    phpScopedPropertyAccessExpression      ## scoped_property_access_expression
    phpSequenceExpression                  ## sequence_expression
    phpSimpleParameter                     ## simple_parameter
    phpStaticModifier                      ## static_modifier
    phpStaticVariableDeclaration           ## static_variable_declaration
    phpString                              ## string
    phpSubscriptExpression                 ## subscript_expression
    phpSwitchBlock                         ## switch_block
    phpSwitchStatement                     ## switch_statement
    phpText                                ## text
    phpTextInterpolation                   ## text_interpolation
    phpThrowExpression                     ## throw_expression
    phpTraitDeclaration                    ## trait_declaration
    phpTryStatement                        ## try_statement
    phpTypeList                            ## type_list
    phpUnaryOpExpression                   ## unary_op_expression
    phpUnsetStatement                      ## unset_statement
    phpUpdateExpression                    ## update_expression
    phpUseAsClause                         ## use_as_clause
    phpUseDeclaration                      ## use_declaration
    phpUseInsteadOfClause                  ## use_instead_of_clause
    phpUseList                             ## use_list
    phpVariableName                        ## variable_name
    phpVariadicParameter                   ## variadic_parameter
    phpVariadicUnpacking                   ## variadic_unpacking
    phpVisibilityModifier                  ## visibility_modifier
    phpWhileStatement                      ## while_statement
    phpYieldExpression                     ## yield_expression
    phpExclamationTok                      ## !
    phpExclamationEqualTok                 ## !=
    phpExclamationDoubleEqualTok           ## !==
    phpQuoteTok                            ## "
    phpHashLBrackTok                       ## #[
    phpDollarTok                           ## $
    phpPercentTok                          ## %
    phpPercentEqualTok                     ## %=
    phpAmpersandTok                        ## &
    phpDoubleAmpersandTok                  ## &&
    phpAmpersandEqualTok                   ## &=
    phpApostropheTok                       ## '
    phpLParTok                             ## (
    phpRParTok                             ## )
    phpAsteriskTok                         ## *
    phpDoubleAsteriskTok                   ## **
    phpDoubleAsteriskEqualTok              ## **=
    phpAsteriskEqualTok                    ## *=
    phpPlusTok                             ## +
    phpDoublePlusTok                       ## ++
    phpPlusEqualTok                        ## +=
    phpCommaTok                            ## ,
    phpMinusTok                            ## -
    phpDoubleMinusTok                      ## --
    phpMinusEqualTok                       ## -=
    phpMinusGreaterThanTok                 ## ->
    phpDotTok                              ## .
    phpTripleDotTok                        ## ...
    phpDotEqualTok                         ## .=
    phpSlashTok                            ## /
    phpSlashEqualTok                       ## /=
    phpColonTok                            ## :
    phpDoubleColonTok                      ## ::
    phpSemicolonTok                        ## ;
    phpLessThanTok                         ## <
    phpDoubleLessThanTok                   ## <<
    phpDoubleLessThanEqualTok              ## <<=
    phpLessThanEqualTok                    ## <=
    phpLessThanEqualGreaterThanTok         ## <=>
    phpLessThanGreaterThanTok              ## <>
    phpEqualTok                            ## =
    phpDoubleEqualTok                      ## ==
    phpTripleEqualTok                      ## ===
    phpEqualGreaterThanTok                 ## =>
    phpGreaterThanTok                      ## >
    phpGreaterThanEqualTok                 ## >=
    phpDoubleGreaterThanTok                ## >>
    phpDoubleGreaterThanEqualTok           ## >>=
    phpQuestionTok                         ## ?
    phpQuestionMinusGreaterThanTok         ## ?->
    phpQuestionGreaterThanTok              ## ?>
    phpDoubleQuestionTok                   ## ??
    phpDoubleQuestionEqualTok              ## ??=
    phpAtTok                               ## @
    phpLBrackTok                           ## [
    phpBackslashTok                        ## \
    phpRBrackTok                           ## ]
    phpAccentTok                           ## ^
    phpAccentEqualTok                      ## ^=
    phpAbstractTok                         ## abstract
    phpAndTok                              ## and
    phpArrayTok                            ## array
    phpAsTok                               ## as
    phpBoolTok                             ## bool
    phpBoolean                             ## boolean
    phpBreakTok                            ## break
    phpCallableTok                         ## callable
    phpCaseTok                             ## case
    phpCatchTok                            ## catch
    phpClassTok                            ## class
    phpCloneTok                            ## clone
    phpComment                             ## comment
    phpConstTok                            ## const
    phpContinueTok                         ## continue
    phpDeclareTok                          ## declare
    phpDefaultTok                          ## default
    phpDoTok                               ## do
    phpEchoTok                             ## echo
    phpElseTok                             ## else
    phpElseifTok                           ## elseif
    phpEncodingTok                         ## encoding
    phpEnddeclareTok                       ## enddeclare
    phpEndforTok                           ## endfor
    phpEndforeachTok                       ## endforeach
    phpEndifTok                            ## endif
    phpEndswitchTok                        ## endswitch
    phpEndwhileTok                         ## endwhile
    phpEnumTok                             ## enum
    phpEscapeSequence                      ## escape_sequence
    phpExtendsTok                          ## extends
    phpFalseTok                            ## false
    phpFinalTok                            ## final
    phpFinallyTok                          ## finally
    phpFloat                               ## float
    phpFloatTok                            ## float
    phpFnTok                               ## fn
    phpForTok                              ## for
    phpForeachTok                          ## foreach
    phpFromTok                             ## from
    phpFunctionTok                         ## function
    phpGlobalTok                           ## global
    phpGotoTok                             ## goto
    phpHeredoc                             ## heredoc
    phpIfTok                               ## if
    phpImplementsTok                       ## implements
    phpIncludeTok                          ## include
    phpIncludeOnceTok                      ## include_once
    phpInstanceofTok                       ## instanceof
    phpInsteadofTok                        ## insteadof
    phpIntTok                              ## int
    phpInteger                             ## integer
    phpInterfaceTok                        ## interface
    phpIterableTok                         ## iterable
    phpListTok                             ## list
    phpMatchTok                            ## match
    phpMixedTok                            ## mixed
    phpNamespaceTok                        ## namespace
    phpNewTok                              ## new
    phpNull                                ## null
    phpNullTok                             ## null
    phpOrTok                               ## or
    phpParentTok                           ## parent
    phpPhpTag                              ## php_tag
    phpPrintTok                            ## print
    phpPrivateTok                          ## private
    phpProtectedTok                        ## protected
    phpPublicTok                           ## public
    phpRequireTok                          ## require
    phpRequireOnceTok                      ## require_once
    phpReturnTok                           ## return
    phpSelfTok                             ## self
    phpShellCommandExpression              ## shell_command_expression
    phpStaticTok                           ## static
    phpStrictTypesTok                      ## strict_types
    phpStringTok                           ## string
    phpSwitchTok                           ## switch
    phpThrowTok                            ## throw
    phpTicksTok                            ## ticks
    phpTraitTok                            ## trait
    phpTryTok                              ## try
    phpUnsetTok                            ## unset
    phpUseTok                              ## use
    phpVarModifier                         ## var_modifier
    phpVoidTok                             ## void
    phpWhileTok                            ## while
    phpXorTok                              ## xor
    phpYieldTok                            ## yield
    phpLCurlyTok                           ## {
    phpPipeTok                             ## |
    phpPipeEqualTok                        ## |=
    phpDoublePipeTok                       ## ||
    phpRCurlyTok                           ## }
    phpTildeTok                            ## ~
    phpSyntaxError                         ## Tree-sitter parser syntax error


proc strRepr*(kind: PhpNodeKind): string =
  case kind:
    of phpUsExpression:                        "_expression"
    of phpUsLiteral:                           "_literal"
    of phpUsPrimaryExpression:                 "_primary_expression"
    of phpUsStatement:                         "_statement"
    of phpUsType:                              "_type"
    of phpAbstractModifier:                    "abstract_modifier"
    of phpAnonymousFunctionCreationExpression: "anonymous_function_creation_expression"
    of phpAnonymousFunctionUseClause:          "anonymous_function_use_clause"
    of phpArgument:                            "argument"
    of phpArguments:                           "arguments"
    of phpArrayCreationExpression:             "array_creation_expression"
    of phpArrayElementInitializer:             "array_element_initializer"
    of phpArrowFunction:                       "arrow_function"
    of phpAssignmentExpression:                "assignment_expression"
    of phpAttribute:                           "attribute"
    of phpAttributeList:                       "attribute_list"
    of phpAugmentedAssignmentExpression:       "augmented_assignment_expression"
    of phpBaseClause:                          "base_clause"
    of phpBinaryExpression:                    "binary_expression"
    of phpBreakStatement:                      "break_statement"
    of phpByRef:                               "by_ref"
    of phpCaseStatement:                       "case_statement"
    of phpCastExpression:                      "cast_expression"
    of phpCastType:                            "cast_type"
    of phpCatchClause:                         "catch_clause"
    of phpClassConstantAccessExpression:       "class_constant_access_expression"
    of phpClassDeclaration:                    "class_declaration"
    of phpClassInterfaceClause:                "class_interface_clause"
    of phpCloneExpression:                     "clone_expression"
    of phpColonBlock:                          "colon_block"
    of phpCompoundStatement:                   "compound_statement"
    of phpConditionalExpression:               "conditional_expression"
    of phpConstDeclaration:                    "const_declaration"
    of phpConstElement:                        "const_element"
    of phpContinueStatement:                   "continue_statement"
    of phpDeclarationList:                     "declaration_list"
    of phpDeclareDirective:                    "declare_directive"
    of phpDeclareStatement:                    "declare_statement"
    of phpDefaultStatement:                    "default_statement"
    of phpDoStatement:                         "do_statement"
    of phpDynamicVariableName:                 "dynamic_variable_name"
    of phpEchoStatement:                       "echo_statement"
    of phpElseClause:                          "else_clause"
    of phpElseIfClause:                        "else_if_clause"
    of phpEmptyStatement:                      "empty_statement"
    of phpEncapsedString:                      "encapsed_string"
    of phpEnumCase:                            "enum_case"
    of phpEnumDeclaration:                     "enum_declaration"
    of phpEnumDeclarationList:                 "enum_declaration_list"
    of phpExponentiationExpression:            "exponentiation_expression"
    of phpExpressionStatement:                 "expression_statement"
    of phpFinalModifier:                       "final_modifier"
    of phpFinallyClause:                       "finally_clause"
    of phpForStatement:                        "for_statement"
    of phpForeachStatement:                    "foreach_statement"
    of phpFormalParameters:                    "formal_parameters"
    of phpFunctionCallExpression:              "function_call_expression"
    of phpFunctionDefinition:                  "function_definition"
    of phpFunctionStaticDeclaration:           "function_static_declaration"
    of phpGlobalDeclaration:                   "global_declaration"
    of phpGotoStatement:                       "goto_statement"
    of phpIfStatement:                         "if_statement"
    of phpIncludeExpression:                   "include_expression"
    of phpIncludeOnceExpression:               "include_once_expression"
    of phpInterfaceDeclaration:                "interface_declaration"
    of phpListLiteral:                         "list_literal"
    of phpMatchBlock:                          "match_block"
    of phpMatchConditionList:                  "match_condition_list"
    of phpMatchConditionalExpression:          "match_conditional_expression"
    of phpMatchDefaultExpression:              "match_default_expression"
    of phpMatchExpression:                     "match_expression"
    of phpMemberAccessExpression:              "member_access_expression"
    of phpMemberCallExpression:                "member_call_expression"
    of phpMethodDeclaration:                   "method_declaration"
    of phpName:                                "name"
    of phpNamedLabelStatement:                 "named_label_statement"
    of phpNamedType:                           "named_type"
    of phpNamespaceAliasingClause:             "namespace_aliasing_clause"
    of phpNamespaceDefinition:                 "namespace_definition"
    of phpNamespaceName:                       "namespace_name"
    of phpNamespaceNameAsPrefix:               "namespace_name_as_prefix"
    of phpNamespaceUseClause:                  "namespace_use_clause"
    of phpNamespaceUseDeclaration:             "namespace_use_declaration"
    of phpNamespaceUseGroup:                   "namespace_use_group"
    of phpNamespaceUseGroupClause:             "namespace_use_group_clause"
    of phpNullsafeMemberAccessExpression:      "nullsafe_member_access_expression"
    of phpNullsafeMemberCallExpression:        "nullsafe_member_call_expression"
    of phpObjectCreationExpression:            "object_creation_expression"
    of phpOptionalType:                        "optional_type"
    of phpPair:                                "pair"
    of phpParenthesizedExpression:             "parenthesized_expression"
    of phpPrimitiveType:                       "primitive_type"
    of phpPrintIntrinsic:                      "print_intrinsic"
    of phpProgram:                             "program"
    of phpPropertyDeclaration:                 "property_declaration"
    of phpPropertyElement:                     "property_element"
    of phpPropertyInitializer:                 "property_initializer"
    of phpPropertyPromotionParameter:          "property_promotion_parameter"
    of phpQualifiedName:                       "qualified_name"
    of phpReferenceAssignmentExpression:       "reference_assignment_expression"
    of phpReferenceModifier:                   "reference_modifier"
    of phpRelativeScope:                       "relative_scope"
    of phpRequireExpression:                   "require_expression"
    of phpRequireOnceExpression:               "require_once_expression"
    of phpReturnStatement:                     "return_statement"
    of phpScopedCallExpression:                "scoped_call_expression"
    of phpScopedPropertyAccessExpression:      "scoped_property_access_expression"
    of phpSequenceExpression:                  "sequence_expression"
    of phpSimpleParameter:                     "simple_parameter"
    of phpStaticModifier:                      "static_modifier"
    of phpStaticVariableDeclaration:           "static_variable_declaration"
    of phpString:                              "string"
    of phpSubscriptExpression:                 "subscript_expression"
    of phpSwitchBlock:                         "switch_block"
    of phpSwitchStatement:                     "switch_statement"
    of phpText:                                "text"
    of phpTextInterpolation:                   "text_interpolation"
    of phpThrowExpression:                     "throw_expression"
    of phpTraitDeclaration:                    "trait_declaration"
    of phpTryStatement:                        "try_statement"
    of phpTypeList:                            "type_list"
    of phpUnaryOpExpression:                   "unary_op_expression"
    of phpUnsetStatement:                      "unset_statement"
    of phpUpdateExpression:                    "update_expression"
    of phpUseAsClause:                         "use_as_clause"
    of phpUseDeclaration:                      "use_declaration"
    of phpUseInsteadOfClause:                  "use_instead_of_clause"
    of phpUseList:                             "use_list"
    of phpVariableName:                        "variable_name"
    of phpVariadicParameter:                   "variadic_parameter"
    of phpVariadicUnpacking:                   "variadic_unpacking"
    of phpVisibilityModifier:                  "visibility_modifier"
    of phpWhileStatement:                      "while_statement"
    of phpYieldExpression:                     "yield_expression"
    of phpExclamationTok:                      "!"
    of phpExclamationEqualTok:                 "!="
    of phpExclamationDoubleEqualTok:           "!=="
    of phpQuoteTok:                            "\""
    of phpHashLBrackTok:                       "#["
    of phpDollarTok:                           "$"
    of phpPercentTok:                          "%"
    of phpPercentEqualTok:                     "%="
    of phpAmpersandTok:                        "&"
    of phpDoubleAmpersandTok:                  "&&"
    of phpAmpersandEqualTok:                   "&="
    of phpApostropheTok:                       "\'"
    of phpLParTok:                             "("
    of phpRParTok:                             ")"
    of phpAsteriskTok:                         "*"
    of phpDoubleAsteriskTok:                   "**"
    of phpDoubleAsteriskEqualTok:              "**="
    of phpAsteriskEqualTok:                    "*="
    of phpPlusTok:                             "+"
    of phpDoublePlusTok:                       "++"
    of phpPlusEqualTok:                        "+="
    of phpCommaTok:                            ","
    of phpMinusTok:                            "-"
    of phpDoubleMinusTok:                      "--"
    of phpMinusEqualTok:                       "-="
    of phpMinusGreaterThanTok:                 "->"
    of phpDotTok:                              "."
    of phpTripleDotTok:                        "..."
    of phpDotEqualTok:                         ".="
    of phpSlashTok:                            "/"
    of phpSlashEqualTok:                       "/="
    of phpColonTok:                            ":"
    of phpDoubleColonTok:                      "::"
    of phpSemicolonTok:                        ";"
    of phpLessThanTok:                         "<"
    of phpDoubleLessThanTok:                   "<<"
    of phpDoubleLessThanEqualTok:              "<<="
    of phpLessThanEqualTok:                    "<="
    of phpLessThanEqualGreaterThanTok:         "<=>"
    of phpLessThanGreaterThanTok:              "<>"
    of phpEqualTok:                            "="
    of phpDoubleEqualTok:                      "=="
    of phpTripleEqualTok:                      "==="
    of phpEqualGreaterThanTok:                 "=>"
    of phpGreaterThanTok:                      ">"
    of phpGreaterThanEqualTok:                 ">="
    of phpDoubleGreaterThanTok:                ">>"
    of phpDoubleGreaterThanEqualTok:           ">>="
    of phpQuestionTok:                         "?"
    of phpQuestionMinusGreaterThanTok:         "?->"
    of phpQuestionGreaterThanTok:              "?>"
    of phpDoubleQuestionTok:                   "??"
    of phpDoubleQuestionEqualTok:              "??="
    of phpAtTok:                               "@"
    of phpLBrackTok:                           "["
    of phpBackslashTok:                        "\\"
    of phpRBrackTok:                           "]"
    of phpAccentTok:                           "^"
    of phpAccentEqualTok:                      "^="
    of phpAbstractTok:                         "abstract"
    of phpAndTok:                              "and"
    of phpArrayTok:                            "array"
    of phpAsTok:                               "as"
    of phpBoolTok:                             "bool"
    of phpBoolean:                             "boolean"
    of phpBreakTok:                            "break"
    of phpCallableTok:                         "callable"
    of phpCaseTok:                             "case"
    of phpCatchTok:                            "catch"
    of phpClassTok:                            "class"
    of phpCloneTok:                            "clone"
    of phpComment:                             "comment"
    of phpConstTok:                            "const"
    of phpContinueTok:                         "continue"
    of phpDeclareTok:                          "declare"
    of phpDefaultTok:                          "default"
    of phpDoTok:                               "do"
    of phpEchoTok:                             "echo"
    of phpElseTok:                             "else"
    of phpElseifTok:                           "elseif"
    of phpEncodingTok:                         "encoding"
    of phpEnddeclareTok:                       "enddeclare"
    of phpEndforTok:                           "endfor"
    of phpEndforeachTok:                       "endforeach"
    of phpEndifTok:                            "endif"
    of phpEndswitchTok:                        "endswitch"
    of phpEndwhileTok:                         "endwhile"
    of phpEnumTok:                             "enum"
    of phpEscapeSequence:                      "escape_sequence"
    of phpExtendsTok:                          "extends"
    of phpFalseTok:                            "false"
    of phpFinalTok:                            "final"
    of phpFinallyTok:                          "finally"
    of phpFloat:                               "float"
    of phpFloatTok:                            "float"
    of phpFnTok:                               "fn"
    of phpForTok:                              "for"
    of phpForeachTok:                          "foreach"
    of phpFromTok:                             "from"
    of phpFunctionTok:                         "function"
    of phpGlobalTok:                           "global"
    of phpGotoTok:                             "goto"
    of phpHeredoc:                             "heredoc"
    of phpIfTok:                               "if"
    of phpImplementsTok:                       "implements"
    of phpIncludeTok:                          "include"
    of phpIncludeOnceTok:                      "include_once"
    of phpInstanceofTok:                       "instanceof"
    of phpInsteadofTok:                        "insteadof"
    of phpIntTok:                              "int"
    of phpInteger:                             "integer"
    of phpInterfaceTok:                        "interface"
    of phpIterableTok:                         "iterable"
    of phpListTok:                             "list"
    of phpMatchTok:                            "match"
    of phpMixedTok:                            "mixed"
    of phpNamespaceTok:                        "namespace"
    of phpNewTok:                              "new"
    of phpNull:                                "null"
    of phpNullTok:                             "null"
    of phpOrTok:                               "or"
    of phpParentTok:                           "parent"
    of phpPhpTag:                              "php_tag"
    of phpPrintTok:                            "print"
    of phpPrivateTok:                          "private"
    of phpProtectedTok:                        "protected"
    of phpPublicTok:                           "public"
    of phpRequireTok:                          "require"
    of phpRequireOnceTok:                      "require_once"
    of phpReturnTok:                           "return"
    of phpSelfTok:                             "self"
    of phpShellCommandExpression:              "shell_command_expression"
    of phpStaticTok:                           "static"
    of phpStrictTypesTok:                      "strict_types"
    of phpStringTok:                           "string"
    of phpSwitchTok:                           "switch"
    of phpThrowTok:                            "throw"
    of phpTicksTok:                            "ticks"
    of phpTraitTok:                            "trait"
    of phpTryTok:                              "try"
    of phpUnsetTok:                            "unset"
    of phpUseTok:                              "use"
    of phpVarModifier:                         "var_modifier"
    of phpVoidTok:                             "void"
    of phpWhileTok:                            "while"
    of phpXorTok:                              "xor"
    of phpYieldTok:                            "yield"
    of phpLCurlyTok:                           "{"
    of phpPipeTok:                             "|"
    of phpPipeEqualTok:                        "|="
    of phpDoublePipeTok:                       "||"
    of phpRCurlyTok:                           "}"
    of phpTildeTok:                            "~"
    of phpSyntaxError:                         "ERROR"


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
                                                                    tmp[phpArgument] = {phpUsExpression, phpVariadicUnpacking}
                                                                    tmp[phpArguments] = {phpArgument}
                                                                    tmp[phpArrayCreationExpression] = {phpArrayElementInitializer}
                                                                    tmp[phpArrayElementInitializer] = {phpUsExpression, phpByRef, phpVariadicUnpacking}
                                                                    tmp[phpArrowFunction] = {phpStaticModifier}
                                                                    tmp[phpAttribute] = {phpName, phpQualifiedName}
                                                                    tmp[phpAttributeList] = {phpAttribute}
                                                                    tmp[phpBaseClause] = {phpName, phpQualifiedName}
                                                                    tmp[phpBinaryExpression] = {phpUsExpression}
                                                                    tmp[phpBreakStatement] = {phpUsExpression}
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
                                                                    tmp[phpCaseStatement] = {phpUsStatement}
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
                                                                    tmp[phpCloneExpression] = {phpUsPrimaryExpression}
                                                                    tmp[phpColonBlock] = {phpUsStatement}
                                                                    tmp[phpCompoundStatement] = {phpUsStatement}
                                                                    tmp[phpConstDeclaration] = {phpConstElement, phpVisibilityModifier}
                                                                    tmp[phpConstElement] = {phpUsExpression, phpName}
                                                                    tmp[phpContinueStatement] = {phpUsExpression}
                                                                    tmp[phpDeclarationList] = {phpConstDeclaration, phpMethodDeclaration, phpPropertyDeclaration, phpUseDeclaration}
                                                                    tmp[phpDeclareDirective] = {phpUsLiteral}
                                                                    tmp[phpDeclareStatement] = {phpUsStatement, phpDeclareDirective}
                                                                    tmp[phpDefaultStatement] = {phpUsStatement}
                                                                    tmp[phpDynamicVariableName] = {phpUsExpression, phpDynamicVariableName, phpVariableName}
                                                                    tmp[phpEchoStatement] = {phpUsExpression, phpSequenceExpression}
                                                                    tmp[phpEncapsedString] = {
                                                                                               phpUsExpression,
                                                                                               phpDynamicVariableName,
                                                                                               phpEscapeSequence,
                                                                                               phpMemberAccessExpression,
                                                                                               phpString,
                                                                                               phpSubscriptExpression,
                                                                                               phpVariableName
                                                                                             }
                                                                    tmp[phpEnumDeclaration] = {phpUsType, phpClassInterfaceClause}
                                                                    tmp[phpEnumDeclarationList] = {phpEnumCase, phpMethodDeclaration, phpUseDeclaration}
                                                                    tmp[phpExpressionStatement] = {phpUsExpression}
                                                                    tmp[phpForStatement] = {phpUsExpression, phpUsStatement, phpSequenceExpression}
                                                                    tmp[phpForeachStatement] = {phpUsExpression, phpByRef, phpListLiteral, phpPair}
                                                                    tmp[phpFormalParameters] = {phpPropertyPromotionParameter, phpSimpleParameter, phpVariadicParameter}
                                                                    tmp[phpFunctionStaticDeclaration] = {phpStaticVariableDeclaration}
                                                                    tmp[phpGlobalDeclaration] = {phpDynamicVariableName, phpVariableName}
                                                                    tmp[phpGotoStatement] = {phpName}
                                                                    tmp[phpIncludeExpression] = {phpUsExpression}
                                                                    tmp[phpIncludeOnceExpression] = {phpUsExpression}
                                                                    tmp[phpInterfaceDeclaration] = {phpBaseClause}
                                                                    tmp[phpListLiteral] = {
                                                                                            phpUsExpression,
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
                                                                    tmp[phpMatchConditionList] = {phpUsExpression}
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
                                                                    tmp[phpPair] = {phpUsExpression, phpByRef, phpListLiteral}
                                                                    tmp[phpParenthesizedExpression] = {phpUsExpression}
                                                                    tmp[phpPrintIntrinsic] = {phpUsExpression}
                                                                    tmp[phpProgram] = {phpUsStatement, phpPhpTag, phpText}
                                                                    tmp[phpPropertyDeclaration] = {phpAbstractModifier, phpFinalModifier, phpPropertyElement, phpStaticModifier, phpVarModifier, phpVisibilityModifier}
                                                                    tmp[phpPropertyElement] = {phpPropertyInitializer, phpVariableName}
                                                                    tmp[phpPropertyInitializer] = {phpUsExpression}
                                                                    tmp[phpQualifiedName] = {phpName, phpNamespaceNameAsPrefix}
                                                                    tmp[phpRequireExpression] = {phpUsExpression}
                                                                    tmp[phpRequireOnceExpression] = {phpUsExpression}
                                                                    tmp[phpReturnStatement] = {phpUsExpression}
                                                                    tmp[phpSequenceExpression] = {phpUsExpression, phpSequenceExpression}
                                                                    tmp[phpSubscriptExpression] = {
                                                                                                    phpUsExpression,
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
                                                                    tmp[phpThrowExpression] = {phpUsExpression}
                                                                    tmp[phpTryStatement] = {phpCatchClause, phpFinallyClause}
                                                                    tmp[phpTypeList] = {phpNamedType, phpOptionalType, phpPrimitiveType}
                                                                    tmp[phpUnaryOpExpression] = {phpUsExpression, phpInteger}
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
                                                                    tmp[phpVariadicUnpacking] = {phpUsExpression}
                                                                    tmp[phpYieldExpression] = {phpUsExpression, phpArrayElementInitializer}
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

proc tsNodeType*(node: TsPhpNode): string



proc kind*(node: TsPhpNode): PhpNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":                            phpUsExpression
      of "_literal":                               phpUsLiteral
      of "_primary_expression":                    phpUsPrimaryExpression
      of "_statement":                             phpUsStatement
      of "_type":                                  phpUsType
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


