import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  PhpNodeKind* = enum
    phpExpression                          ## _expression
    phpLiteral                             ## _literal
    phpPrimaryExpression                   ## _primary_expression
    phpStatement                           ## _statement
    phpType                                ## _type
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
    phpFloatTok                            ## float
    phpFloat                               ## float
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
    phpNullTok                             ## null
    phpNull                                ## null
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
    phpString                              ## string
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


proc tsNodeType*(node: TsPhpNode): string



proc kind*(node: TsPhpNode): PhpNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":                            phpExpression
      of "_literal":                               phpLiteral
      of "_primary_expression":                    phpPrimaryExpression
      of "_statement":                             phpStatement
      of "_type":                                  phpType
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
      of "float":                                  phpFloatTok
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
      of "null":                                   phpNullTok
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
      of "string":                                 phpStringTok
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


func `[]`*(
    node: TsPhpNode,
    idx:  int,
    kind: PhpNodeKind | set[PhpNodeKind]
  ): TsPhpNode =
  assert 0 <= idx and idx < node.len
  result = TsPhpNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  PhpNode* = HtsNode[TsPhpNode, PhpNodeKind]

proc treeReprTsPhp*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsPhpNode, PhpNodeKind](parseTsPhpString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsPhpNode,
    str:  ptr string
  ): HtsNode[TsPhpNode, PhpNodeKind] =
  toHtsNode[TsPhpNode, PhpNodeKind](node, str)

proc toHtsTree*(node: TsPhpNode, str: ptr string): PhpNode =
  toHtsNode[TsPhpNode, PhpNodeKind](node, str)

proc parsePhpString*(str: ptr string, unnamed: bool = false): PhpNode =
  let parser = newTsPhpParser()
  return toHtsTree[TsPhpNode, PhpNodeKind](parseString(parser, str[]), str)

proc parsePhpString*(str: string, unnamed: bool = false): PhpNode =
  let parser = newTsPhpParser()
  return toHtsTree[TsPhpNode, PhpNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


