import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  KotlinNodeKind* = enum
    kotlinAdditiveExpression              ## additive_expression
    kotlinAnnotatedLambda                 ## annotated_lambda
    kotlinAnnotation                      ## annotation
    kotlinAnonymousFunction               ## anonymous_function
    kotlinAnonymousInitializer            ## anonymous_initializer
    kotlinAsExpression                    ## as_expression
    kotlinAssignment                      ## assignment
    kotlinBooleanLiteral                  ## boolean_literal
    kotlinCallExpression                  ## call_expression
    kotlinCallSuffix                      ## call_suffix
    kotlinCallableReference               ## callable_reference
    kotlinCatchBlock                      ## catch_block
    kotlinCharacterLiteral                ## character_literal
    kotlinCheckExpression                 ## check_expression
    kotlinClassBody                       ## class_body
    kotlinClassDeclaration                ## class_declaration
    kotlinClassModifier                   ## class_modifier
    kotlinClassParameter                  ## class_parameter
    kotlinCollectionLiteral               ## collection_literal
    kotlinCompanionObject                 ## companion_object
    kotlinComparisonExpression            ## comparison_expression
    kotlinConjunctionExpression           ## conjunction_expression
    kotlinConstructorDelegationCall       ## constructor_delegation_call
    kotlinConstructorInvocation           ## constructor_invocation
    kotlinControlStructureBody            ## control_structure_body
    kotlinDelegationSpecifier             ## delegation_specifier
    kotlinDirectlyAssignableExpression    ## directly_assignable_expression
    kotlinDisjunctionExpression           ## disjunction_expression
    kotlinDoWhileStatement                ## do_while_statement
    kotlinElvisExpression                 ## elvis_expression
    kotlinEnumClassBody                   ## enum_class_body
    kotlinEnumEntry                       ## enum_entry
    kotlinEqualityExpression              ## equality_expression
    kotlinExplicitDelegation              ## explicit_delegation
    kotlinFileAnnotation                  ## file_annotation
    kotlinFinallyBlock                    ## finally_block
    kotlinForStatement                    ## for_statement
    kotlinFunctionBody                    ## function_body
    kotlinFunctionDeclaration             ## function_declaration
    kotlinFunctionModifier                ## function_modifier
    kotlinFunctionType                    ## function_type
    kotlinFunctionTypeParameters          ## function_type_parameters
    kotlinGetter                          ## getter
    kotlinIdentifier                      ## identifier
    kotlinIfExpression                    ## if_expression
    kotlinImportAlias                     ## import_alias
    kotlinImportHeader                    ## import_header
    kotlinIndexingExpression              ## indexing_expression
    kotlinIndexingSuffix                  ## indexing_suffix
    kotlinInfixExpression                 ## infix_expression
    kotlinInheritanceModifier             ## inheritance_modifier
    kotlinInterpolatedExpression          ## interpolated_expression
    kotlinInterpolatedIdentifier          ## interpolated_identifier
    kotlinJumpExpression                  ## jump_expression
    kotlinLambdaLiteral                   ## lambda_literal
    kotlinLambdaParameters                ## lambda_parameters
    kotlinLineStringLiteral               ## line_string_literal
    kotlinLongLiteral                     ## long_literal
    kotlinMemberModifier                  ## member_modifier
    kotlinModifiers                       ## modifiers
    kotlinMultiLineStringLiteral          ## multi_line_string_literal
    kotlinMultiplicativeExpression        ## multiplicative_expression
    kotlinNavigationExpression            ## navigation_expression
    kotlinNavigationSuffix                ## navigation_suffix
    kotlinNullableType                    ## nullable_type
    kotlinObjectDeclaration               ## object_declaration
    kotlinObjectLiteral                   ## object_literal
    kotlinPackageHeader                   ## package_header
    kotlinParameter                       ## parameter
    kotlinParameterModifier               ## parameter_modifier
    kotlinParameterModifiers              ## parameter_modifiers
    kotlinParameterWithOptionalType       ## parameter_with_optional_type
    kotlinParenthesizedExpression         ## parenthesized_expression
    kotlinParenthesizedType               ## parenthesized_type
    kotlinParenthesizedUserType           ## parenthesized_user_type
    kotlinPlatformModifier                ## platform_modifier
    kotlinPostfixExpression               ## postfix_expression
    kotlinPrefixExpression                ## prefix_expression
    kotlinPrimaryConstructor              ## primary_constructor
    kotlinPropertyDeclaration             ## property_declaration
    kotlinPropertyDelegate                ## property_delegate
    kotlinRangeExpression                 ## range_expression
    kotlinRangeTest                       ## range_test
    kotlinSecondaryConstructor            ## secondary_constructor
    kotlinSetter                          ## setter
    kotlinShebangLine                     ## shebang_line
    kotlinSimpleIdentifier                ## simple_identifier
    kotlinSourceFile                      ## source_file
    kotlinSpreadExpression                ## spread_expression
    kotlinStatements                      ## statements
    kotlinSuperExpression                 ## super_expression
    kotlinThisExpression                  ## this_expression
    kotlinTryExpression                   ## try_expression
    kotlinTypeAlias                       ## type_alias
    kotlinTypeArguments                   ## type_arguments
    kotlinTypeConstraint                  ## type_constraint
    kotlinTypeConstraints                 ## type_constraints
    kotlinTypeIdentifier                  ## type_identifier
    kotlinTypeModifiers                   ## type_modifiers
    kotlinTypeParameter                   ## type_parameter
    kotlinTypeParameterModifiers          ## type_parameter_modifiers
    kotlinTypeParameters                  ## type_parameters
    kotlinTypeProjection                  ## type_projection
    kotlinTypeProjectionModifiers         ## type_projection_modifiers
    kotlinTypeTest                        ## type_test
    kotlinUnsignedLiteral                 ## unsigned_literal
    kotlinUseSiteTarget                   ## use_site_target
    kotlinUserType                        ## user_type
    kotlinValueArgument                   ## value_argument
    kotlinValueArguments                  ## value_arguments
    kotlinVariableDeclaration             ## variable_declaration
    kotlinVarianceModifier                ## variance_modifier
    kotlinVisibilityModifier              ## visibility_modifier
    kotlinWhenCondition                   ## when_condition
    kotlinWhenEntry                       ## when_entry
    kotlinWhenExpression                  ## when_expression
    kotlinWhenSubject                     ## when_subject
    kotlinWhileStatement                  ## while_statement
    kotlinExclamationTok                  ## !
    kotlinDoubleExclamationTok            ## !!
    kotlinExclamationEqualTok             ## !=
    kotlinExclamationDoubleEqualTok       ## !==
    kotlinExclamationinTok                ## !in
    kotlinQuoteTok                        ## "
    kotlinTripleQuoteTok                  ## """
    kotlinHashExclamationTok              ## #!
    kotlinDollarTok                       ## $
    kotlinDollarLCurlyTok                 ## ${
    kotlinPercentTok                      ## %
    kotlinPercentEqualTok                 ## %=
    kotlinDoubleAmpersandTok              ## &&
    kotlinApostropheTok                   ## '
    kotlinLParTok                         ## (
    kotlinRParTok                         ## )
    kotlinAsteriskTok                     ## *
    kotlinAsteriskEqualTok                ## *=
    kotlinPlusTok                         ## +
    kotlinDoublePlusTok                   ## ++
    kotlinPlusEqualTok                    ## +=
    kotlinCommaTok                        ## ,
    kotlinMinusTok                        ## -
    kotlinDoubleMinusTok                  ## --
    kotlinMinusEqualTok                   ## -=
    kotlinMinusGreaterThanTok             ## ->
    kotlinDotTok                          ## .
    kotlinDotAsteriskTok                  ## .*
    kotlinDoubleDotTok                    ## ..
    kotlinSlashTok                        ## /
    kotlinSlashEqualTok                   ## /=
    kotlinColonTok                        ## :
    kotlinDoubleColonTok                  ## ::
    kotlinSemicolonTok                    ## ;
    kotlinLessThanTok                     ## <
    kotlinLessThanEqualTok                ## <=
    kotlinEqualTok                        ## =
    kotlinDoubleEqualTok                  ## ==
    kotlinTripleEqualTok                  ## ===
    kotlinGreaterThanTok                  ## >
    kotlinGreaterThanEqualTok             ## >=
    kotlinQuestionColonTok                ## ?:
    kotlinAtTok                           ## @
    kotlinLTok                            ## L
    kotlinLBrackTok                       ## [
    kotlinBackslashTok                    ## \
    kotlinRBrackTok                       ## ]
    kotlinAbstractTok                     ## abstract
    kotlinActualTok                       ## actual
    kotlinAnnotationTok                   ## annotation
    kotlinAsTok                           ## as
    kotlinAsQuestionTok                   ## as?
    kotlinBinLiteral                      ## bin_literal
    kotlinBreakTok                        ## break
    kotlinBreakAtTok                      ## break@
    kotlinByTok                           ## by
    kotlinCatchTok                        ## catch
    kotlinClassTok                        ## class
    kotlinComment                         ## comment
    kotlinCompanionTok                    ## companion
    kotlinConstructorTok                  ## constructor
    kotlinContinueTok                     ## continue
    kotlinContinueAtTok                   ## continue@
    kotlinCrossinlineTok                  ## crossinline
    kotlinDataTok                         ## data
    kotlinDelegateTok                     ## delegate
    kotlinDoTok                           ## do
    kotlinDynamicTok                      ## dynamic
    kotlinElseTok                         ## else
    kotlinEnumTok                         ## enum
    kotlinExpectTok                       ## expect
    kotlinExternalTok                     ## external
    kotlinFalseTok                        ## false
    kotlinFieldTok                        ## field
    kotlinFileTok                         ## file
    kotlinFinalTok                        ## final
    kotlinFinallyTok                      ## finally
    kotlinForTok                          ## for
    kotlinFunTok                          ## fun
    kotlinGetTok                          ## get
    kotlinHexLiteral                      ## hex_literal
    kotlinIfTok                           ## if
    kotlinImportTok                       ## import
    kotlinInTok                           ## in
    kotlinInfixTok                        ## infix
    kotlinInitTok                         ## init
    kotlinInlineTok                       ## inline
    kotlinInnerTok                        ## inner
    kotlinIntegerLiteral                  ## integer_literal
    kotlinInterfaceTok                    ## interface
    kotlinInternalTok                     ## internal
    kotlinIsTok                           ## is
    kotlinLabel                           ## label
    kotlinLateinitTok                     ## lateinit
    kotlinNoinlineTok                     ## noinline
    kotlinNullTok                         ## null
    kotlinObjectTok                       ## object
    kotlinOpenTok                         ## open
    kotlinOperatorTok                     ## operator
    kotlinOutTok                          ## out
    kotlinOverrideTok                     ## override
    kotlinPackageTok                      ## package
    kotlinParamTok                        ## param
    kotlinPrivateTok                      ## private
    kotlinPropertyTok                     ## property
    kotlinPropertyModifier                ## property_modifier
    kotlinProtectedTok                    ## protected
    kotlinPublicTok                       ## public
    kotlinRealLiteral                     ## real_literal
    kotlinReceiverTok                     ## receiver
    kotlinReificationModifier             ## reification_modifier
    kotlinReturnTok                       ## return
    kotlinReturnAtTok                     ## return@
    kotlinSealedTok                       ## sealed
    kotlinSetTok                          ## set
    kotlinSetparamTok                     ## setparam
    kotlinSuperTok                        ## super
    kotlinSuperAtTok                      ## super@
    kotlinSuspendTok                      ## suspend
    kotlinTailrecTok                      ## tailrec
    kotlinThisTok                         ## this
    kotlinThisAtTok                       ## this@
    kotlinThrowTok                        ## throw
    kotlinTrueTok                         ## true
    kotlinTryTok                          ## try
    kotlinTypealiasTok                    ## typealias
    kotlinUTok                            ## u
    kotlinValTok                          ## val
    kotlinVarTok                          ## var
    kotlinVarargTok                       ## vararg
    kotlinWhenTok                         ## when
    kotlinWhereTok                        ## where
    kotlinWhileTok                        ## while
    kotlinLCurlyTok                       ## {
    kotlinDoublePipeTok                   ## ||
    kotlinRCurlyTok                       ## }
    kotlinHidMultiplicativeOperator       ## _multiplicative_operator
    kotlinHidPostfixUnarySuffix           ## _postfix_unary_suffix
    kotlinHidReturnAt                     ## _return_at
    kotlinParametersWithOptionalType      ## parameters_with_optional_type
    kotlinHidInOperator                   ## _in_operator
    kotlinHidTypeProjectionModifier       ## _type_projection_modifier
    kotlinHidMultiLineStringContent       ## _multi_line_string_content
    kotlinHidLexicalIdentifier            ## _lexical_identifier
    kotlinHidType                         ## _type
    kotlinHidNotIn                        ## _not_in
    kotlinHidEqualityOperator             ## _equality_operator
    kotlinHidExpression                   ## _expression
    kotlinHidUniCharacterLiteral          ## _uni_character_literal
    kotlinHidSimpleUserType               ## _simple_user_type
    kotlinHidLiteralConstant              ## _literal_constant
    kotlinHidTypeParameterModifier        ## _type_parameter_modifier
    kotlinHidIsOperator                   ## _is_operator
    kotlinHidAnnotatedDelegationSpecifier ## _annotated_delegation_specifier
    kotlinHidBacktickIdentifier           ## _backtick_identifier
    kotlinHidPrimaryExpression            ## _primary_expression
    kotlinHidPostfixUnaryOperator         ## _postfix_unary_operator
    kotlinHidStringLiteral                ## _string_literal
    kotlinHidPrefixUnaryOperator          ## _prefix_unary_operator
    kotlinHidSafeNav                      ## _safe_nav
    kotlinHidModifier                     ## _modifier
    kotlinHidFunctionValueParameters      ## _function_value_parameters
    kotlinHidPostfixUnaryExpression       ## _postfix_unary_expression
    kotlinHidUnescapedAnnotation          ## _unescaped_annotation
    kotlinHidEscapeSeq                    ## _escape_seq
    kotlinHidUnaryExpression              ## _unary_expression
    kotlinHidLineStrEscapedChar           ## _line_str_escaped_char
    kotlinHidContinueAt                   ## _continue_at
    kotlinHidTypeModifier                 ## _type_modifier
    kotlinTopLevelObject                  ## top_level_object
    kotlinHidLambdaParameter              ## _lambda_parameter
    kotlinHidClassMemberDeclaration       ## _class_member_declaration
    kotlinHidThisAt                       ## _this_at
    kotlinHidAlphaIdentifier              ## _alpha_identifier
    kotlinHidBlock                        ## _block
    kotlinHidFunctionLiteral              ## _function_literal
    kotlinHidEscapedIdentifier            ## _escaped_identifier
    kotlinHidLoopStatement                ## _loop_statement
    kotlinHidAdditiveOperator             ## _additive_operator
    kotlinHidNotIs                        ## _not_is
    kotlinHidAssignmentAndOperator        ## _assignment_and_operator
    kotlinHidAsOperator                   ## _as_operator
    kotlinHidStatement                    ## _statement
    kotlinLineStringExpression            ## line_string_expression
    kotlinHidQuest                        ## _quest
    kotlinHidBreakAt                      ## _break_at
    kotlinHidMultiLineStrText             ## _multi_line_str_text
    kotlinHidBinaryExpression             ## _binary_expression
    kotlinHidEnumEntries                  ## _enum_entries
    kotlinHidDelegationSpecifiers         ## _delegation_specifiers
    kotlinHidLineStringContent            ## _line_string_content
    kotlinHidLineStrText                  ## _line_str_text
    kotlinHidComparisonOperator           ## _comparison_operator
    kotlinHidDeclaration                  ## _declaration
    kotlinHidSemi                         ## _semi
    kotlinHidTypeReference                ## _type_reference
    kotlinHidSemis                        ## _semis
    kotlinHidMemberAccessOperator         ## _member_access_operator
    kotlinHidFunctionValueParameter       ## _function_value_parameter
    kotlinHidSuperAt                      ## _super_at
    kotlinHidClassParameters              ## _class_parameters
    kotlinHidSingleAnnotation             ## _single_annotation
    kotlinHidIndexingSuffix               ## _indexing_suffix
    kotlinHidInterpolation                ## _interpolation
    kotlinHidClassMemberDeclarations      ## _class_member_declarations
    kotlinHidMultiAnnotation              ## _multi_annotation
    kotlinSyntaxError                     ## Tree-sitter parser syntax error

proc strRepr*(kind: KotlinNodeKind): string =
  case kind:
    of kotlinAdditiveExpression:              "additive_expression"
    of kotlinAnnotatedLambda:                 "annotated_lambda"
    of kotlinAnnotation:                      "annotation"
    of kotlinAnonymousFunction:               "anonymous_function"
    of kotlinAnonymousInitializer:            "anonymous_initializer"
    of kotlinAsExpression:                    "as_expression"
    of kotlinAssignment:                      "assignment"
    of kotlinBooleanLiteral:                  "boolean_literal"
    of kotlinCallExpression:                  "call_expression"
    of kotlinCallSuffix:                      "call_suffix"
    of kotlinCallableReference:               "callable_reference"
    of kotlinCatchBlock:                      "catch_block"
    of kotlinCharacterLiteral:                "character_literal"
    of kotlinCheckExpression:                 "check_expression"
    of kotlinClassBody:                       "class_body"
    of kotlinClassDeclaration:                "class_declaration"
    of kotlinClassModifier:                   "class_modifier"
    of kotlinClassParameter:                  "class_parameter"
    of kotlinCollectionLiteral:               "collection_literal"
    of kotlinCompanionObject:                 "companion_object"
    of kotlinComparisonExpression:            "comparison_expression"
    of kotlinConjunctionExpression:           "conjunction_expression"
    of kotlinConstructorDelegationCall:       "constructor_delegation_call"
    of kotlinConstructorInvocation:           "constructor_invocation"
    of kotlinControlStructureBody:            "control_structure_body"
    of kotlinDelegationSpecifier:             "delegation_specifier"
    of kotlinDirectlyAssignableExpression:    "directly_assignable_expression"
    of kotlinDisjunctionExpression:           "disjunction_expression"
    of kotlinDoWhileStatement:                "do_while_statement"
    of kotlinElvisExpression:                 "elvis_expression"
    of kotlinEnumClassBody:                   "enum_class_body"
    of kotlinEnumEntry:                       "enum_entry"
    of kotlinEqualityExpression:              "equality_expression"
    of kotlinExplicitDelegation:              "explicit_delegation"
    of kotlinFileAnnotation:                  "file_annotation"
    of kotlinFinallyBlock:                    "finally_block"
    of kotlinForStatement:                    "for_statement"
    of kotlinFunctionBody:                    "function_body"
    of kotlinFunctionDeclaration:             "function_declaration"
    of kotlinFunctionModifier:                "function_modifier"
    of kotlinFunctionType:                    "function_type"
    of kotlinFunctionTypeParameters:          "function_type_parameters"
    of kotlinGetter:                          "getter"
    of kotlinIdentifier:                      "identifier"
    of kotlinIfExpression:                    "if_expression"
    of kotlinImportAlias:                     "import_alias"
    of kotlinImportHeader:                    "import_header"
    of kotlinIndexingExpression:              "indexing_expression"
    of kotlinIndexingSuffix:                  "indexing_suffix"
    of kotlinInfixExpression:                 "infix_expression"
    of kotlinInheritanceModifier:             "inheritance_modifier"
    of kotlinInterpolatedExpression:          "interpolated_expression"
    of kotlinInterpolatedIdentifier:          "interpolated_identifier"
    of kotlinJumpExpression:                  "jump_expression"
    of kotlinLambdaLiteral:                   "lambda_literal"
    of kotlinLambdaParameters:                "lambda_parameters"
    of kotlinLineStringLiteral:               "line_string_literal"
    of kotlinLongLiteral:                     "long_literal"
    of kotlinMemberModifier:                  "member_modifier"
    of kotlinModifiers:                       "modifiers"
    of kotlinMultiLineStringLiteral:          "multi_line_string_literal"
    of kotlinMultiplicativeExpression:        "multiplicative_expression"
    of kotlinNavigationExpression:            "navigation_expression"
    of kotlinNavigationSuffix:                "navigation_suffix"
    of kotlinNullableType:                    "nullable_type"
    of kotlinObjectDeclaration:               "object_declaration"
    of kotlinObjectLiteral:                   "object_literal"
    of kotlinPackageHeader:                   "package_header"
    of kotlinParameter:                       "parameter"
    of kotlinParameterModifier:               "parameter_modifier"
    of kotlinParameterModifiers:              "parameter_modifiers"
    of kotlinParameterWithOptionalType:       "parameter_with_optional_type"
    of kotlinParenthesizedExpression:         "parenthesized_expression"
    of kotlinParenthesizedType:               "parenthesized_type"
    of kotlinParenthesizedUserType:           "parenthesized_user_type"
    of kotlinPlatformModifier:                "platform_modifier"
    of kotlinPostfixExpression:               "postfix_expression"
    of kotlinPrefixExpression:                "prefix_expression"
    of kotlinPrimaryConstructor:              "primary_constructor"
    of kotlinPropertyDeclaration:             "property_declaration"
    of kotlinPropertyDelegate:                "property_delegate"
    of kotlinRangeExpression:                 "range_expression"
    of kotlinRangeTest:                       "range_test"
    of kotlinSecondaryConstructor:            "secondary_constructor"
    of kotlinSetter:                          "setter"
    of kotlinShebangLine:                     "shebang_line"
    of kotlinSimpleIdentifier:                "simple_identifier"
    of kotlinSourceFile:                      "source_file"
    of kotlinSpreadExpression:                "spread_expression"
    of kotlinStatements:                      "statements"
    of kotlinSuperExpression:                 "super_expression"
    of kotlinThisExpression:                  "this_expression"
    of kotlinTryExpression:                   "try_expression"
    of kotlinTypeAlias:                       "type_alias"
    of kotlinTypeArguments:                   "type_arguments"
    of kotlinTypeConstraint:                  "type_constraint"
    of kotlinTypeConstraints:                 "type_constraints"
    of kotlinTypeIdentifier:                  "type_identifier"
    of kotlinTypeModifiers:                   "type_modifiers"
    of kotlinTypeParameter:                   "type_parameter"
    of kotlinTypeParameterModifiers:          "type_parameter_modifiers"
    of kotlinTypeParameters:                  "type_parameters"
    of kotlinTypeProjection:                  "type_projection"
    of kotlinTypeProjectionModifiers:         "type_projection_modifiers"
    of kotlinTypeTest:                        "type_test"
    of kotlinUnsignedLiteral:                 "unsigned_literal"
    of kotlinUseSiteTarget:                   "use_site_target"
    of kotlinUserType:                        "user_type"
    of kotlinValueArgument:                   "value_argument"
    of kotlinValueArguments:                  "value_arguments"
    of kotlinVariableDeclaration:             "variable_declaration"
    of kotlinVarianceModifier:                "variance_modifier"
    of kotlinVisibilityModifier:              "visibility_modifier"
    of kotlinWhenCondition:                   "when_condition"
    of kotlinWhenEntry:                       "when_entry"
    of kotlinWhenExpression:                  "when_expression"
    of kotlinWhenSubject:                     "when_subject"
    of kotlinWhileStatement:                  "while_statement"
    of kotlinExclamationTok:                  "!"
    of kotlinDoubleExclamationTok:            "!!"
    of kotlinExclamationEqualTok:             "!="
    of kotlinExclamationDoubleEqualTok:       "!=="
    of kotlinExclamationinTok:                "!in"
    of kotlinQuoteTok:                        "\""
    of kotlinTripleQuoteTok:                  "\"\"\""
    of kotlinHashExclamationTok:              "#!"
    of kotlinDollarTok:                       "$"
    of kotlinDollarLCurlyTok:                 "${"
    of kotlinPercentTok:                      "%"
    of kotlinPercentEqualTok:                 "%="
    of kotlinDoubleAmpersandTok:              "&&"
    of kotlinApostropheTok:                   "\'"
    of kotlinLParTok:                         "("
    of kotlinRParTok:                         ")"
    of kotlinAsteriskTok:                     "*"
    of kotlinAsteriskEqualTok:                "*="
    of kotlinPlusTok:                         "+"
    of kotlinDoublePlusTok:                   "++"
    of kotlinPlusEqualTok:                    "+="
    of kotlinCommaTok:                        ","
    of kotlinMinusTok:                        "-"
    of kotlinDoubleMinusTok:                  "--"
    of kotlinMinusEqualTok:                   "-="
    of kotlinMinusGreaterThanTok:             "->"
    of kotlinDotTok:                          "."
    of kotlinDotAsteriskTok:                  ".*"
    of kotlinDoubleDotTok:                    ".."
    of kotlinSlashTok:                        "/"
    of kotlinSlashEqualTok:                   "/="
    of kotlinColonTok:                        ":"
    of kotlinDoubleColonTok:                  "::"
    of kotlinSemicolonTok:                    ";"
    of kotlinLessThanTok:                     "<"
    of kotlinLessThanEqualTok:                "<="
    of kotlinEqualTok:                        "="
    of kotlinDoubleEqualTok:                  "=="
    of kotlinTripleEqualTok:                  "==="
    of kotlinGreaterThanTok:                  ">"
    of kotlinGreaterThanEqualTok:             ">="
    of kotlinQuestionColonTok:                "?:"
    of kotlinAtTok:                           "@"
    of kotlinLTok:                            "L"
    of kotlinLBrackTok:                       "["
    of kotlinBackslashTok:                    "\\"
    of kotlinRBrackTok:                       "]"
    of kotlinAbstractTok:                     "abstract"
    of kotlinActualTok:                       "actual"
    of kotlinAnnotationTok:                   "annotation"
    of kotlinAsTok:                           "as"
    of kotlinAsQuestionTok:                   "as?"
    of kotlinBinLiteral:                      "bin_literal"
    of kotlinBreakTok:                        "break"
    of kotlinBreakAtTok:                      "break@"
    of kotlinByTok:                           "by"
    of kotlinCatchTok:                        "catch"
    of kotlinClassTok:                        "class"
    of kotlinComment:                         "comment"
    of kotlinCompanionTok:                    "companion"
    of kotlinConstructorTok:                  "constructor"
    of kotlinContinueTok:                     "continue"
    of kotlinContinueAtTok:                   "continue@"
    of kotlinCrossinlineTok:                  "crossinline"
    of kotlinDataTok:                         "data"
    of kotlinDelegateTok:                     "delegate"
    of kotlinDoTok:                           "do"
    of kotlinDynamicTok:                      "dynamic"
    of kotlinElseTok:                         "else"
    of kotlinEnumTok:                         "enum"
    of kotlinExpectTok:                       "expect"
    of kotlinExternalTok:                     "external"
    of kotlinFalseTok:                        "false"
    of kotlinFieldTok:                        "field"
    of kotlinFileTok:                         "file"
    of kotlinFinalTok:                        "final"
    of kotlinFinallyTok:                      "finally"
    of kotlinForTok:                          "for"
    of kotlinFunTok:                          "fun"
    of kotlinGetTok:                          "get"
    of kotlinHexLiteral:                      "hex_literal"
    of kotlinIfTok:                           "if"
    of kotlinImportTok:                       "import"
    of kotlinInTok:                           "in"
    of kotlinInfixTok:                        "infix"
    of kotlinInitTok:                         "init"
    of kotlinInlineTok:                       "inline"
    of kotlinInnerTok:                        "inner"
    of kotlinIntegerLiteral:                  "integer_literal"
    of kotlinInterfaceTok:                    "interface"
    of kotlinInternalTok:                     "internal"
    of kotlinIsTok:                           "is"
    of kotlinLabel:                           "label"
    of kotlinLateinitTok:                     "lateinit"
    of kotlinNoinlineTok:                     "noinline"
    of kotlinNullTok:                         "null"
    of kotlinObjectTok:                       "object"
    of kotlinOpenTok:                         "open"
    of kotlinOperatorTok:                     "operator"
    of kotlinOutTok:                          "out"
    of kotlinOverrideTok:                     "override"
    of kotlinPackageTok:                      "package"
    of kotlinParamTok:                        "param"
    of kotlinPrivateTok:                      "private"
    of kotlinPropertyTok:                     "property"
    of kotlinPropertyModifier:                "property_modifier"
    of kotlinProtectedTok:                    "protected"
    of kotlinPublicTok:                       "public"
    of kotlinRealLiteral:                     "real_literal"
    of kotlinReceiverTok:                     "receiver"
    of kotlinReificationModifier:             "reification_modifier"
    of kotlinReturnTok:                       "return"
    of kotlinReturnAtTok:                     "return@"
    of kotlinSealedTok:                       "sealed"
    of kotlinSetTok:                          "set"
    of kotlinSetparamTok:                     "setparam"
    of kotlinSuperTok:                        "super"
    of kotlinSuperAtTok:                      "super@"
    of kotlinSuspendTok:                      "suspend"
    of kotlinTailrecTok:                      "tailrec"
    of kotlinThisTok:                         "this"
    of kotlinThisAtTok:                       "this@"
    of kotlinThrowTok:                        "throw"
    of kotlinTrueTok:                         "true"
    of kotlinTryTok:                          "try"
    of kotlinTypealiasTok:                    "typealias"
    of kotlinUTok:                            "u"
    of kotlinValTok:                          "val"
    of kotlinVarTok:                          "var"
    of kotlinVarargTok:                       "vararg"
    of kotlinWhenTok:                         "when"
    of kotlinWhereTok:                        "where"
    of kotlinWhileTok:                        "while"
    of kotlinLCurlyTok:                       "{"
    of kotlinDoublePipeTok:                   "||"
    of kotlinRCurlyTok:                       "}"
    of kotlinHidMultiplicativeOperator:       "_multiplicative_operator"
    of kotlinHidPostfixUnarySuffix:           "_postfix_unary_suffix"
    of kotlinHidReturnAt:                     "_return_at"
    of kotlinParametersWithOptionalType:      "parameters_with_optional_type"
    of kotlinHidInOperator:                   "_in_operator"
    of kotlinHidTypeProjectionModifier:       "_type_projection_modifier"
    of kotlinHidMultiLineStringContent:       "_multi_line_string_content"
    of kotlinHidLexicalIdentifier:            "_lexical_identifier"
    of kotlinHidType:                         "_type"
    of kotlinHidNotIn:                        "_not_in"
    of kotlinHidEqualityOperator:             "_equality_operator"
    of kotlinHidExpression:                   "_expression"
    of kotlinHidUniCharacterLiteral:          "_uni_character_literal"
    of kotlinHidSimpleUserType:               "_simple_user_type"
    of kotlinHidLiteralConstant:              "_literal_constant"
    of kotlinHidTypeParameterModifier:        "_type_parameter_modifier"
    of kotlinHidIsOperator:                   "_is_operator"
    of kotlinHidAnnotatedDelegationSpecifier: "_annotated_delegation_specifier"
    of kotlinHidBacktickIdentifier:           "_backtick_identifier"
    of kotlinHidPrimaryExpression:            "_primary_expression"
    of kotlinHidPostfixUnaryOperator:         "_postfix_unary_operator"
    of kotlinHidStringLiteral:                "_string_literal"
    of kotlinHidPrefixUnaryOperator:          "_prefix_unary_operator"
    of kotlinHidSafeNav:                      "_safe_nav"
    of kotlinHidModifier:                     "_modifier"
    of kotlinHidFunctionValueParameters:      "_function_value_parameters"
    of kotlinHidPostfixUnaryExpression:       "_postfix_unary_expression"
    of kotlinHidUnescapedAnnotation:          "_unescaped_annotation"
    of kotlinHidEscapeSeq:                    "_escape_seq"
    of kotlinHidUnaryExpression:              "_unary_expression"
    of kotlinHidLineStrEscapedChar:           "_line_str_escaped_char"
    of kotlinHidContinueAt:                   "_continue_at"
    of kotlinHidTypeModifier:                 "_type_modifier"
    of kotlinTopLevelObject:                  "top_level_object"
    of kotlinHidLambdaParameter:              "_lambda_parameter"
    of kotlinHidClassMemberDeclaration:       "_class_member_declaration"
    of kotlinHidThisAt:                       "_this_at"
    of kotlinHidAlphaIdentifier:              "_alpha_identifier"
    of kotlinHidBlock:                        "_block"
    of kotlinHidFunctionLiteral:              "_function_literal"
    of kotlinHidEscapedIdentifier:            "_escaped_identifier"
    of kotlinHidLoopStatement:                "_loop_statement"
    of kotlinHidAdditiveOperator:             "_additive_operator"
    of kotlinHidNotIs:                        "_not_is"
    of kotlinHidAssignmentAndOperator:        "_assignment_and_operator"
    of kotlinHidAsOperator:                   "_as_operator"
    of kotlinHidStatement:                    "_statement"
    of kotlinLineStringExpression:            "line_string_expression"
    of kotlinHidQuest:                        "_quest"
    of kotlinHidBreakAt:                      "_break_at"
    of kotlinHidMultiLineStrText:             "_multi_line_str_text"
    of kotlinHidBinaryExpression:             "_binary_expression"
    of kotlinHidEnumEntries:                  "_enum_entries"
    of kotlinHidDelegationSpecifiers:         "_delegation_specifiers"
    of kotlinHidLineStringContent:            "_line_string_content"
    of kotlinHidLineStrText:                  "_line_str_text"
    of kotlinHidComparisonOperator:           "_comparison_operator"
    of kotlinHidDeclaration:                  "_declaration"
    of kotlinHidSemi:                         "_semi"
    of kotlinHidTypeReference:                "_type_reference"
    of kotlinHidSemis:                        "_semis"
    of kotlinHidMemberAccessOperator:         "_member_access_operator"
    of kotlinHidFunctionValueParameter:       "_function_value_parameter"
    of kotlinHidSuperAt:                      "_super_at"
    of kotlinHidClassParameters:              "_class_parameters"
    of kotlinHidSingleAnnotation:             "_single_annotation"
    of kotlinHidIndexingSuffix:               "_indexing_suffix"
    of kotlinHidInterpolation:                "_interpolation"
    of kotlinHidClassMemberDeclarations:      "_class_member_declarations"
    of kotlinHidMultiAnnotation:              "_multi_annotation"
    of kotlinSyntaxError:                     "ERROR"

type
  TsKotlinNode* = distinct TSNode

type
  KotlinParser* = distinct PtsParser

const kotlinAllowedSubnodes*: array[KotlinNodeKind, set[KotlinNodeKind]] = block:
                                                                             var tmp: array[KotlinNodeKind, set[KotlinNodeKind]]
                                                                             tmp[kotlinAdditiveExpression] = {
                                                                                                               kotlinAdditiveExpression,
                                                                                                               kotlinAnonymousFunction,
                                                                                                               kotlinAsExpression,
                                                                                                               kotlinBinLiteral,
                                                                                                               kotlinBooleanLiteral,
                                                                                                               kotlinCallExpression,
                                                                                                               kotlinCallableReference,
                                                                                                               kotlinCharacterLiteral,
                                                                                                               kotlinCheckExpression,
                                                                                                               kotlinCollectionLiteral,
                                                                                                               kotlinComparisonExpression,
                                                                                                               kotlinConjunctionExpression,
                                                                                                               kotlinDisjunctionExpression,
                                                                                                               kotlinElvisExpression,
                                                                                                               kotlinEqualityExpression,
                                                                                                               kotlinHexLiteral,
                                                                                                               kotlinIfExpression,
                                                                                                               kotlinIndexingExpression,
                                                                                                               kotlinInfixExpression,
                                                                                                               kotlinIntegerLiteral,
                                                                                                               kotlinJumpExpression,
                                                                                                               kotlinLambdaLiteral,
                                                                                                               kotlinLineStringLiteral,
                                                                                                               kotlinLongLiteral,
                                                                                                               kotlinMultiLineStringLiteral,
                                                                                                               kotlinMultiplicativeExpression,
                                                                                                               kotlinNavigationExpression,
                                                                                                               kotlinObjectLiteral,
                                                                                                               kotlinParenthesizedExpression,
                                                                                                               kotlinPostfixExpression,
                                                                                                               kotlinPrefixExpression,
                                                                                                               kotlinRangeExpression,
                                                                                                               kotlinRealLiteral,
                                                                                                               kotlinSimpleIdentifier,
                                                                                                               kotlinSpreadExpression,
                                                                                                               kotlinSuperExpression,
                                                                                                               kotlinThisExpression,
                                                                                                               kotlinTryExpression,
                                                                                                               kotlinUnsignedLiteral,
                                                                                                               kotlinWhenExpression
                                                                                                             }
                                                                             tmp[kotlinAnnotatedLambda] = {kotlinLambdaLiteral}
                                                                             tmp[kotlinAnnotation] = {kotlinConstructorInvocation, kotlinUseSiteTarget, kotlinUserType}
                                                                             tmp[kotlinAnonymousFunction] = {kotlinFunctionBody, kotlinTypeArguments, kotlinTypeIdentifier}
                                                                             tmp[kotlinAnonymousInitializer] = {kotlinStatements}
                                                                             tmp[kotlinAsExpression] = {
                                                                                                         kotlinAdditiveExpression,
                                                                                                         kotlinAnonymousFunction,
                                                                                                         kotlinAsExpression,
                                                                                                         kotlinBinLiteral,
                                                                                                         kotlinBooleanLiteral,
                                                                                                         kotlinCallExpression,
                                                                                                         kotlinCallableReference,
                                                                                                         kotlinCharacterLiteral,
                                                                                                         kotlinCheckExpression,
                                                                                                         kotlinCollectionLiteral,
                                                                                                         kotlinComparisonExpression,
                                                                                                         kotlinConjunctionExpression,
                                                                                                         kotlinDisjunctionExpression,
                                                                                                         kotlinElvisExpression,
                                                                                                         kotlinEqualityExpression,
                                                                                                         kotlinFunctionType,
                                                                                                         kotlinHexLiteral,
                                                                                                         kotlinIfExpression,
                                                                                                         kotlinIndexingExpression,
                                                                                                         kotlinInfixExpression,
                                                                                                         kotlinIntegerLiteral,
                                                                                                         kotlinJumpExpression,
                                                                                                         kotlinLambdaLiteral,
                                                                                                         kotlinLineStringLiteral,
                                                                                                         kotlinLongLiteral,
                                                                                                         kotlinMultiLineStringLiteral,
                                                                                                         kotlinMultiplicativeExpression,
                                                                                                         kotlinNavigationExpression,
                                                                                                         kotlinNullableType,
                                                                                                         kotlinObjectLiteral,
                                                                                                         kotlinParenthesizedExpression,
                                                                                                         kotlinParenthesizedType,
                                                                                                         kotlinPostfixExpression,
                                                                                                         kotlinPrefixExpression,
                                                                                                         kotlinRangeExpression,
                                                                                                         kotlinRealLiteral,
                                                                                                         kotlinSimpleIdentifier,
                                                                                                         kotlinSpreadExpression,
                                                                                                         kotlinSuperExpression,
                                                                                                         kotlinThisExpression,
                                                                                                         kotlinTryExpression,
                                                                                                         kotlinTypeModifiers,
                                                                                                         kotlinUnsignedLiteral,
                                                                                                         kotlinUserType,
                                                                                                         kotlinWhenExpression
                                                                                                       }
                                                                             tmp[kotlinAssignment] = {
                                                                                                       kotlinAdditiveExpression,
                                                                                                       kotlinAnonymousFunction,
                                                                                                       kotlinAsExpression,
                                                                                                       kotlinBinLiteral,
                                                                                                       kotlinBooleanLiteral,
                                                                                                       kotlinCallExpression,
                                                                                                       kotlinCallableReference,
                                                                                                       kotlinCharacterLiteral,
                                                                                                       kotlinCheckExpression,
                                                                                                       kotlinCollectionLiteral,
                                                                                                       kotlinComparisonExpression,
                                                                                                       kotlinConjunctionExpression,
                                                                                                       kotlinDirectlyAssignableExpression,
                                                                                                       kotlinDisjunctionExpression,
                                                                                                       kotlinElvisExpression,
                                                                                                       kotlinEqualityExpression,
                                                                                                       kotlinHexLiteral,
                                                                                                       kotlinIfExpression,
                                                                                                       kotlinIndexingExpression,
                                                                                                       kotlinInfixExpression,
                                                                                                       kotlinIntegerLiteral,
                                                                                                       kotlinJumpExpression,
                                                                                                       kotlinLambdaLiteral,
                                                                                                       kotlinLineStringLiteral,
                                                                                                       kotlinLongLiteral,
                                                                                                       kotlinMultiLineStringLiteral,
                                                                                                       kotlinMultiplicativeExpression,
                                                                                                       kotlinNavigationExpression,
                                                                                                       kotlinObjectLiteral,
                                                                                                       kotlinParenthesizedExpression,
                                                                                                       kotlinPostfixExpression,
                                                                                                       kotlinPrefixExpression,
                                                                                                       kotlinRangeExpression,
                                                                                                       kotlinRealLiteral,
                                                                                                       kotlinSimpleIdentifier,
                                                                                                       kotlinSpreadExpression,
                                                                                                       kotlinSuperExpression,
                                                                                                       kotlinThisExpression,
                                                                                                       kotlinTryExpression,
                                                                                                       kotlinUnsignedLiteral,
                                                                                                       kotlinWhenExpression
                                                                                                     }
                                                                             tmp[kotlinCallExpression] = {
                                                                                                           kotlinAdditiveExpression,
                                                                                                           kotlinAnonymousFunction,
                                                                                                           kotlinAsExpression,
                                                                                                           kotlinBinLiteral,
                                                                                                           kotlinBooleanLiteral,
                                                                                                           kotlinCallExpression,
                                                                                                           kotlinCallSuffix,
                                                                                                           kotlinCallableReference,
                                                                                                           kotlinCharacterLiteral,
                                                                                                           kotlinCheckExpression,
                                                                                                           kotlinCollectionLiteral,
                                                                                                           kotlinComparisonExpression,
                                                                                                           kotlinConjunctionExpression,
                                                                                                           kotlinDisjunctionExpression,
                                                                                                           kotlinElvisExpression,
                                                                                                           kotlinEqualityExpression,
                                                                                                           kotlinHexLiteral,
                                                                                                           kotlinIfExpression,
                                                                                                           kotlinIndexingExpression,
                                                                                                           kotlinInfixExpression,
                                                                                                           kotlinIntegerLiteral,
                                                                                                           kotlinJumpExpression,
                                                                                                           kotlinLambdaLiteral,
                                                                                                           kotlinLineStringLiteral,
                                                                                                           kotlinLongLiteral,
                                                                                                           kotlinMultiLineStringLiteral,
                                                                                                           kotlinMultiplicativeExpression,
                                                                                                           kotlinNavigationExpression,
                                                                                                           kotlinObjectLiteral,
                                                                                                           kotlinParenthesizedExpression,
                                                                                                           kotlinPostfixExpression,
                                                                                                           kotlinPrefixExpression,
                                                                                                           kotlinRangeExpression,
                                                                                                           kotlinRealLiteral,
                                                                                                           kotlinSimpleIdentifier,
                                                                                                           kotlinSpreadExpression,
                                                                                                           kotlinSuperExpression,
                                                                                                           kotlinThisExpression,
                                                                                                           kotlinTryExpression,
                                                                                                           kotlinUnsignedLiteral,
                                                                                                           kotlinWhenExpression
                                                                                                         }
                                                                             tmp[kotlinCallSuffix] = {kotlinAnnotatedLambda, kotlinTypeArguments, kotlinValueArguments}
                                                                             tmp[kotlinCallableReference] = {kotlinSimpleIdentifier, kotlinTypeIdentifier}
                                                                             tmp[kotlinCatchBlock] = {
                                                                                                       kotlinAnnotation,
                                                                                                       kotlinFunctionType,
                                                                                                       kotlinNullableType,
                                                                                                       kotlinParenthesizedType,
                                                                                                       kotlinSimpleIdentifier,
                                                                                                       kotlinStatements,
                                                                                                       kotlinTypeModifiers,
                                                                                                       kotlinUserType
                                                                                                     }
                                                                             tmp[kotlinCheckExpression] = {
                                                                                                            kotlinAdditiveExpression,
                                                                                                            kotlinAnonymousFunction,
                                                                                                            kotlinAsExpression,
                                                                                                            kotlinBinLiteral,
                                                                                                            kotlinBooleanLiteral,
                                                                                                            kotlinCallExpression,
                                                                                                            kotlinCallableReference,
                                                                                                            kotlinCharacterLiteral,
                                                                                                            kotlinCheckExpression,
                                                                                                            kotlinCollectionLiteral,
                                                                                                            kotlinComparisonExpression,
                                                                                                            kotlinConjunctionExpression,
                                                                                                            kotlinDisjunctionExpression,
                                                                                                            kotlinElvisExpression,
                                                                                                            kotlinEqualityExpression,
                                                                                                            kotlinHexLiteral,
                                                                                                            kotlinIfExpression,
                                                                                                            kotlinIndexingExpression,
                                                                                                            kotlinInfixExpression,
                                                                                                            kotlinIntegerLiteral,
                                                                                                            kotlinJumpExpression,
                                                                                                            kotlinLambdaLiteral,
                                                                                                            kotlinLineStringLiteral,
                                                                                                            kotlinLongLiteral,
                                                                                                            kotlinMultiLineStringLiteral,
                                                                                                            kotlinMultiplicativeExpression,
                                                                                                            kotlinNavigationExpression,
                                                                                                            kotlinObjectLiteral,
                                                                                                            kotlinParenthesizedExpression,
                                                                                                            kotlinPostfixExpression,
                                                                                                            kotlinPrefixExpression,
                                                                                                            kotlinRangeExpression,
                                                                                                            kotlinRealLiteral,
                                                                                                            kotlinSimpleIdentifier,
                                                                                                            kotlinSpreadExpression,
                                                                                                            kotlinSuperExpression,
                                                                                                            kotlinThisExpression,
                                                                                                            kotlinTryExpression,
                                                                                                            kotlinUnsignedLiteral,
                                                                                                            kotlinWhenExpression
                                                                                                          }
                                                                             tmp[kotlinClassBody] = {
                                                                                                      kotlinAnonymousInitializer,
                                                                                                      kotlinClassDeclaration,
                                                                                                      kotlinCompanionObject,
                                                                                                      kotlinFunctionDeclaration,
                                                                                                      kotlinObjectDeclaration,
                                                                                                      kotlinPropertyDeclaration,
                                                                                                      kotlinSecondaryConstructor,
                                                                                                      kotlinTypeAlias
                                                                                                    }
                                                                             tmp[kotlinClassDeclaration] = {
                                                                                                             kotlinClassBody,
                                                                                                             kotlinDelegationSpecifier,
                                                                                                             kotlinEnumClassBody,
                                                                                                             kotlinModifiers,
                                                                                                             kotlinPrimaryConstructor,
                                                                                                             kotlinTypeConstraints,
                                                                                                             kotlinTypeIdentifier,
                                                                                                             kotlinTypeParameters
                                                                                                           }
                                                                             tmp[kotlinClassParameter] = {
                                                                                                           kotlinAdditiveExpression,
                                                                                                           kotlinAnonymousFunction,
                                                                                                           kotlinAsExpression,
                                                                                                           kotlinBinLiteral,
                                                                                                           kotlinBooleanLiteral,
                                                                                                           kotlinCallExpression,
                                                                                                           kotlinCallableReference,
                                                                                                           kotlinCharacterLiteral,
                                                                                                           kotlinCheckExpression,
                                                                                                           kotlinCollectionLiteral,
                                                                                                           kotlinComparisonExpression,
                                                                                                           kotlinConjunctionExpression,
                                                                                                           kotlinDisjunctionExpression,
                                                                                                           kotlinElvisExpression,
                                                                                                           kotlinEqualityExpression,
                                                                                                           kotlinFunctionType,
                                                                                                           kotlinHexLiteral,
                                                                                                           kotlinIfExpression,
                                                                                                           kotlinIndexingExpression,
                                                                                                           kotlinInfixExpression,
                                                                                                           kotlinIntegerLiteral,
                                                                                                           kotlinJumpExpression,
                                                                                                           kotlinLambdaLiteral,
                                                                                                           kotlinLineStringLiteral,
                                                                                                           kotlinLongLiteral,
                                                                                                           kotlinModifiers,
                                                                                                           kotlinMultiLineStringLiteral,
                                                                                                           kotlinMultiplicativeExpression,
                                                                                                           kotlinNavigationExpression,
                                                                                                           kotlinNullableType,
                                                                                                           kotlinObjectLiteral,
                                                                                                           kotlinParenthesizedExpression,
                                                                                                           kotlinParenthesizedType,
                                                                                                           kotlinPostfixExpression,
                                                                                                           kotlinPrefixExpression,
                                                                                                           kotlinRangeExpression,
                                                                                                           kotlinRealLiteral,
                                                                                                           kotlinSimpleIdentifier,
                                                                                                           kotlinSpreadExpression,
                                                                                                           kotlinSuperExpression,
                                                                                                           kotlinThisExpression,
                                                                                                           kotlinTryExpression,
                                                                                                           kotlinTypeModifiers,
                                                                                                           kotlinUnsignedLiteral,
                                                                                                           kotlinUserType,
                                                                                                           kotlinWhenExpression
                                                                                                         }
                                                                             tmp[kotlinCollectionLiteral] = {
                                                                                                              kotlinAdditiveExpression,
                                                                                                              kotlinAnonymousFunction,
                                                                                                              kotlinAsExpression,
                                                                                                              kotlinBinLiteral,
                                                                                                              kotlinBooleanLiteral,
                                                                                                              kotlinCallExpression,
                                                                                                              kotlinCallableReference,
                                                                                                              kotlinCharacterLiteral,
                                                                                                              kotlinCheckExpression,
                                                                                                              kotlinCollectionLiteral,
                                                                                                              kotlinComparisonExpression,
                                                                                                              kotlinConjunctionExpression,
                                                                                                              kotlinDisjunctionExpression,
                                                                                                              kotlinElvisExpression,
                                                                                                              kotlinEqualityExpression,
                                                                                                              kotlinHexLiteral,
                                                                                                              kotlinIfExpression,
                                                                                                              kotlinIndexingExpression,
                                                                                                              kotlinInfixExpression,
                                                                                                              kotlinIntegerLiteral,
                                                                                                              kotlinJumpExpression,
                                                                                                              kotlinLambdaLiteral,
                                                                                                              kotlinLineStringLiteral,
                                                                                                              kotlinLongLiteral,
                                                                                                              kotlinMultiLineStringLiteral,
                                                                                                              kotlinMultiplicativeExpression,
                                                                                                              kotlinNavigationExpression,
                                                                                                              kotlinObjectLiteral,
                                                                                                              kotlinParenthesizedExpression,
                                                                                                              kotlinPostfixExpression,
                                                                                                              kotlinPrefixExpression,
                                                                                                              kotlinRangeExpression,
                                                                                                              kotlinRealLiteral,
                                                                                                              kotlinSimpleIdentifier,
                                                                                                              kotlinSpreadExpression,
                                                                                                              kotlinSuperExpression,
                                                                                                              kotlinThisExpression,
                                                                                                              kotlinTryExpression,
                                                                                                              kotlinUnsignedLiteral,
                                                                                                              kotlinWhenExpression
                                                                                                            }
                                                                             tmp[kotlinCompanionObject] = {kotlinClassBody, kotlinDelegationSpecifier, kotlinModifiers, kotlinTypeIdentifier}
                                                                             tmp[kotlinComparisonExpression] = {
                                                                                                                 kotlinAdditiveExpression,
                                                                                                                 kotlinAnonymousFunction,
                                                                                                                 kotlinAsExpression,
                                                                                                                 kotlinBinLiteral,
                                                                                                                 kotlinBooleanLiteral,
                                                                                                                 kotlinCallExpression,
                                                                                                                 kotlinCallableReference,
                                                                                                                 kotlinCharacterLiteral,
                                                                                                                 kotlinCheckExpression,
                                                                                                                 kotlinCollectionLiteral,
                                                                                                                 kotlinComparisonExpression,
                                                                                                                 kotlinConjunctionExpression,
                                                                                                                 kotlinDisjunctionExpression,
                                                                                                                 kotlinElvisExpression,
                                                                                                                 kotlinEqualityExpression,
                                                                                                                 kotlinHexLiteral,
                                                                                                                 kotlinIfExpression,
                                                                                                                 kotlinIndexingExpression,
                                                                                                                 kotlinInfixExpression,
                                                                                                                 kotlinIntegerLiteral,
                                                                                                                 kotlinJumpExpression,
                                                                                                                 kotlinLambdaLiteral,
                                                                                                                 kotlinLineStringLiteral,
                                                                                                                 kotlinLongLiteral,
                                                                                                                 kotlinMultiLineStringLiteral,
                                                                                                                 kotlinMultiplicativeExpression,
                                                                                                                 kotlinNavigationExpression,
                                                                                                                 kotlinObjectLiteral,
                                                                                                                 kotlinParenthesizedExpression,
                                                                                                                 kotlinPostfixExpression,
                                                                                                                 kotlinPrefixExpression,
                                                                                                                 kotlinRangeExpression,
                                                                                                                 kotlinRealLiteral,
                                                                                                                 kotlinSimpleIdentifier,
                                                                                                                 kotlinSpreadExpression,
                                                                                                                 kotlinSuperExpression,
                                                                                                                 kotlinThisExpression,
                                                                                                                 kotlinTryExpression,
                                                                                                                 kotlinUnsignedLiteral,
                                                                                                                 kotlinWhenExpression
                                                                                                               }
                                                                             tmp[kotlinConjunctionExpression] = {
                                                                                                                  kotlinAdditiveExpression,
                                                                                                                  kotlinAnonymousFunction,
                                                                                                                  kotlinAsExpression,
                                                                                                                  kotlinBinLiteral,
                                                                                                                  kotlinBooleanLiteral,
                                                                                                                  kotlinCallExpression,
                                                                                                                  kotlinCallableReference,
                                                                                                                  kotlinCharacterLiteral,
                                                                                                                  kotlinCheckExpression,
                                                                                                                  kotlinCollectionLiteral,
                                                                                                                  kotlinComparisonExpression,
                                                                                                                  kotlinConjunctionExpression,
                                                                                                                  kotlinDisjunctionExpression,
                                                                                                                  kotlinElvisExpression,
                                                                                                                  kotlinEqualityExpression,
                                                                                                                  kotlinHexLiteral,
                                                                                                                  kotlinIfExpression,
                                                                                                                  kotlinIndexingExpression,
                                                                                                                  kotlinInfixExpression,
                                                                                                                  kotlinIntegerLiteral,
                                                                                                                  kotlinJumpExpression,
                                                                                                                  kotlinLambdaLiteral,
                                                                                                                  kotlinLineStringLiteral,
                                                                                                                  kotlinLongLiteral,
                                                                                                                  kotlinMultiLineStringLiteral,
                                                                                                                  kotlinMultiplicativeExpression,
                                                                                                                  kotlinNavigationExpression,
                                                                                                                  kotlinObjectLiteral,
                                                                                                                  kotlinParenthesizedExpression,
                                                                                                                  kotlinPostfixExpression,
                                                                                                                  kotlinPrefixExpression,
                                                                                                                  kotlinRangeExpression,
                                                                                                                  kotlinRealLiteral,
                                                                                                                  kotlinSimpleIdentifier,
                                                                                                                  kotlinSpreadExpression,
                                                                                                                  kotlinSuperExpression,
                                                                                                                  kotlinThisExpression,
                                                                                                                  kotlinTryExpression,
                                                                                                                  kotlinUnsignedLiteral,
                                                                                                                  kotlinWhenExpression
                                                                                                                }
                                                                             tmp[kotlinConstructorDelegationCall] = {kotlinValueArguments}
                                                                             tmp[kotlinConstructorInvocation] = {kotlinUserType, kotlinValueArguments}
                                                                             tmp[kotlinControlStructureBody] = {
                                                                                                                 kotlinAdditiveExpression,
                                                                                                                 kotlinAnnotation,
                                                                                                                 kotlinAnonymousFunction,
                                                                                                                 kotlinAsExpression,
                                                                                                                 kotlinAssignment,
                                                                                                                 kotlinBinLiteral,
                                                                                                                 kotlinBooleanLiteral,
                                                                                                                 kotlinCallExpression,
                                                                                                                 kotlinCallableReference,
                                                                                                                 kotlinCharacterLiteral,
                                                                                                                 kotlinCheckExpression,
                                                                                                                 kotlinClassDeclaration,
                                                                                                                 kotlinCollectionLiteral,
                                                                                                                 kotlinComparisonExpression,
                                                                                                                 kotlinConjunctionExpression,
                                                                                                                 kotlinDisjunctionExpression,
                                                                                                                 kotlinDoWhileStatement,
                                                                                                                 kotlinElvisExpression,
                                                                                                                 kotlinEqualityExpression,
                                                                                                                 kotlinForStatement,
                                                                                                                 kotlinFunctionDeclaration,
                                                                                                                 kotlinHexLiteral,
                                                                                                                 kotlinIfExpression,
                                                                                                                 kotlinIndexingExpression,
                                                                                                                 kotlinInfixExpression,
                                                                                                                 kotlinIntegerLiteral,
                                                                                                                 kotlinJumpExpression,
                                                                                                                 kotlinLabel,
                                                                                                                 kotlinLambdaLiteral,
                                                                                                                 kotlinLineStringLiteral,
                                                                                                                 kotlinLongLiteral,
                                                                                                                 kotlinMultiLineStringLiteral,
                                                                                                                 kotlinMultiplicativeExpression,
                                                                                                                 kotlinNavigationExpression,
                                                                                                                 kotlinObjectDeclaration,
                                                                                                                 kotlinObjectLiteral,
                                                                                                                 kotlinParenthesizedExpression,
                                                                                                                 kotlinPostfixExpression,
                                                                                                                 kotlinPrefixExpression,
                                                                                                                 kotlinPropertyDeclaration,
                                                                                                                 kotlinRangeExpression,
                                                                                                                 kotlinRealLiteral,
                                                                                                                 kotlinSimpleIdentifier,
                                                                                                                 kotlinSpreadExpression,
                                                                                                                 kotlinStatements,
                                                                                                                 kotlinSuperExpression,
                                                                                                                 kotlinThisExpression,
                                                                                                                 kotlinTryExpression,
                                                                                                                 kotlinTypeAlias,
                                                                                                                 kotlinUnsignedLiteral,
                                                                                                                 kotlinWhenExpression,
                                                                                                                 kotlinWhileStatement
                                                                                                               }
                                                                             tmp[kotlinDelegationSpecifier] = {kotlinConstructorInvocation, kotlinExplicitDelegation, kotlinFunctionType, kotlinUserType}
                                                                             tmp[kotlinDirectlyAssignableExpression] = {
                                                                                                                         kotlinAnonymousFunction,
                                                                                                                         kotlinBinLiteral,
                                                                                                                         kotlinBooleanLiteral,
                                                                                                                         kotlinCallableReference,
                                                                                                                         kotlinCharacterLiteral,
                                                                                                                         kotlinCollectionLiteral,
                                                                                                                         kotlinHexLiteral,
                                                                                                                         kotlinIfExpression,
                                                                                                                         kotlinIndexingSuffix,
                                                                                                                         kotlinIntegerLiteral,
                                                                                                                         kotlinJumpExpression,
                                                                                                                         kotlinLambdaLiteral,
                                                                                                                         kotlinLineStringLiteral,
                                                                                                                         kotlinLongLiteral,
                                                                                                                         kotlinMultiLineStringLiteral,
                                                                                                                         kotlinNavigationSuffix,
                                                                                                                         kotlinObjectLiteral,
                                                                                                                         kotlinParenthesizedExpression,
                                                                                                                         kotlinRealLiteral,
                                                                                                                         kotlinSimpleIdentifier,
                                                                                                                         kotlinSuperExpression,
                                                                                                                         kotlinThisExpression,
                                                                                                                         kotlinTryExpression,
                                                                                                                         kotlinUnsignedLiteral,
                                                                                                                         kotlinWhenExpression
                                                                                                                       }
                                                                             tmp[kotlinDisjunctionExpression] = {
                                                                                                                  kotlinAdditiveExpression,
                                                                                                                  kotlinAnonymousFunction,
                                                                                                                  kotlinAsExpression,
                                                                                                                  kotlinBinLiteral,
                                                                                                                  kotlinBooleanLiteral,
                                                                                                                  kotlinCallExpression,
                                                                                                                  kotlinCallableReference,
                                                                                                                  kotlinCharacterLiteral,
                                                                                                                  kotlinCheckExpression,
                                                                                                                  kotlinCollectionLiteral,
                                                                                                                  kotlinComparisonExpression,
                                                                                                                  kotlinConjunctionExpression,
                                                                                                                  kotlinDisjunctionExpression,
                                                                                                                  kotlinElvisExpression,
                                                                                                                  kotlinEqualityExpression,
                                                                                                                  kotlinHexLiteral,
                                                                                                                  kotlinIfExpression,
                                                                                                                  kotlinIndexingExpression,
                                                                                                                  kotlinInfixExpression,
                                                                                                                  kotlinIntegerLiteral,
                                                                                                                  kotlinJumpExpression,
                                                                                                                  kotlinLambdaLiteral,
                                                                                                                  kotlinLineStringLiteral,
                                                                                                                  kotlinLongLiteral,
                                                                                                                  kotlinMultiLineStringLiteral,
                                                                                                                  kotlinMultiplicativeExpression,
                                                                                                                  kotlinNavigationExpression,
                                                                                                                  kotlinObjectLiteral,
                                                                                                                  kotlinParenthesizedExpression,
                                                                                                                  kotlinPostfixExpression,
                                                                                                                  kotlinPrefixExpression,
                                                                                                                  kotlinRangeExpression,
                                                                                                                  kotlinRealLiteral,
                                                                                                                  kotlinSimpleIdentifier,
                                                                                                                  kotlinSpreadExpression,
                                                                                                                  kotlinSuperExpression,
                                                                                                                  kotlinThisExpression,
                                                                                                                  kotlinTryExpression,
                                                                                                                  kotlinUnsignedLiteral,
                                                                                                                  kotlinWhenExpression
                                                                                                                }
                                                                             tmp[kotlinDoWhileStatement] = {
                                                                                                             kotlinAdditiveExpression,
                                                                                                             kotlinAnonymousFunction,
                                                                                                             kotlinAsExpression,
                                                                                                             kotlinBinLiteral,
                                                                                                             kotlinBooleanLiteral,
                                                                                                             kotlinCallExpression,
                                                                                                             kotlinCallableReference,
                                                                                                             kotlinCharacterLiteral,
                                                                                                             kotlinCheckExpression,
                                                                                                             kotlinCollectionLiteral,
                                                                                                             kotlinComparisonExpression,
                                                                                                             kotlinConjunctionExpression,
                                                                                                             kotlinControlStructureBody,
                                                                                                             kotlinDisjunctionExpression,
                                                                                                             kotlinElvisExpression,
                                                                                                             kotlinEqualityExpression,
                                                                                                             kotlinHexLiteral,
                                                                                                             kotlinIfExpression,
                                                                                                             kotlinIndexingExpression,
                                                                                                             kotlinInfixExpression,
                                                                                                             kotlinIntegerLiteral,
                                                                                                             kotlinJumpExpression,
                                                                                                             kotlinLambdaLiteral,
                                                                                                             kotlinLineStringLiteral,
                                                                                                             kotlinLongLiteral,
                                                                                                             kotlinMultiLineStringLiteral,
                                                                                                             kotlinMultiplicativeExpression,
                                                                                                             kotlinNavigationExpression,
                                                                                                             kotlinObjectLiteral,
                                                                                                             kotlinParenthesizedExpression,
                                                                                                             kotlinPostfixExpression,
                                                                                                             kotlinPrefixExpression,
                                                                                                             kotlinRangeExpression,
                                                                                                             kotlinRealLiteral,
                                                                                                             kotlinSimpleIdentifier,
                                                                                                             kotlinSpreadExpression,
                                                                                                             kotlinSuperExpression,
                                                                                                             kotlinThisExpression,
                                                                                                             kotlinTryExpression,
                                                                                                             kotlinUnsignedLiteral,
                                                                                                             kotlinWhenExpression
                                                                                                           }
                                                                             tmp[kotlinElvisExpression] = {
                                                                                                            kotlinAdditiveExpression,
                                                                                                            kotlinAnonymousFunction,
                                                                                                            kotlinAsExpression,
                                                                                                            kotlinBinLiteral,
                                                                                                            kotlinBooleanLiteral,
                                                                                                            kotlinCallExpression,
                                                                                                            kotlinCallableReference,
                                                                                                            kotlinCharacterLiteral,
                                                                                                            kotlinCheckExpression,
                                                                                                            kotlinCollectionLiteral,
                                                                                                            kotlinComparisonExpression,
                                                                                                            kotlinConjunctionExpression,
                                                                                                            kotlinDisjunctionExpression,
                                                                                                            kotlinElvisExpression,
                                                                                                            kotlinEqualityExpression,
                                                                                                            kotlinHexLiteral,
                                                                                                            kotlinIfExpression,
                                                                                                            kotlinIndexingExpression,
                                                                                                            kotlinInfixExpression,
                                                                                                            kotlinIntegerLiteral,
                                                                                                            kotlinJumpExpression,
                                                                                                            kotlinLambdaLiteral,
                                                                                                            kotlinLineStringLiteral,
                                                                                                            kotlinLongLiteral,
                                                                                                            kotlinMultiLineStringLiteral,
                                                                                                            kotlinMultiplicativeExpression,
                                                                                                            kotlinNavigationExpression,
                                                                                                            kotlinObjectLiteral,
                                                                                                            kotlinParenthesizedExpression,
                                                                                                            kotlinPostfixExpression,
                                                                                                            kotlinPrefixExpression,
                                                                                                            kotlinRangeExpression,
                                                                                                            kotlinRealLiteral,
                                                                                                            kotlinSimpleIdentifier,
                                                                                                            kotlinSpreadExpression,
                                                                                                            kotlinSuperExpression,
                                                                                                            kotlinThisExpression,
                                                                                                            kotlinTryExpression,
                                                                                                            kotlinUnsignedLiteral,
                                                                                                            kotlinWhenExpression
                                                                                                          }
                                                                             tmp[kotlinEnumClassBody] = {
                                                                                                          kotlinAnonymousInitializer,
                                                                                                          kotlinClassDeclaration,
                                                                                                          kotlinCompanionObject,
                                                                                                          kotlinEnumEntry,
                                                                                                          kotlinFunctionDeclaration,
                                                                                                          kotlinObjectDeclaration,
                                                                                                          kotlinPropertyDeclaration,
                                                                                                          kotlinSecondaryConstructor,
                                                                                                          kotlinTypeAlias
                                                                                                        }
                                                                             tmp[kotlinEnumEntry] = {kotlinClassBody, kotlinModifiers, kotlinSimpleIdentifier, kotlinValueArguments}
                                                                             tmp[kotlinEqualityExpression] = {
                                                                                                               kotlinAdditiveExpression,
                                                                                                               kotlinAnonymousFunction,
                                                                                                               kotlinAsExpression,
                                                                                                               kotlinBinLiteral,
                                                                                                               kotlinBooleanLiteral,
                                                                                                               kotlinCallExpression,
                                                                                                               kotlinCallableReference,
                                                                                                               kotlinCharacterLiteral,
                                                                                                               kotlinCheckExpression,
                                                                                                               kotlinCollectionLiteral,
                                                                                                               kotlinComparisonExpression,
                                                                                                               kotlinConjunctionExpression,
                                                                                                               kotlinDisjunctionExpression,
                                                                                                               kotlinElvisExpression,
                                                                                                               kotlinEqualityExpression,
                                                                                                               kotlinHexLiteral,
                                                                                                               kotlinIfExpression,
                                                                                                               kotlinIndexingExpression,
                                                                                                               kotlinInfixExpression,
                                                                                                               kotlinIntegerLiteral,
                                                                                                               kotlinJumpExpression,
                                                                                                               kotlinLambdaLiteral,
                                                                                                               kotlinLineStringLiteral,
                                                                                                               kotlinLongLiteral,
                                                                                                               kotlinMultiLineStringLiteral,
                                                                                                               kotlinMultiplicativeExpression,
                                                                                                               kotlinNavigationExpression,
                                                                                                               kotlinObjectLiteral,
                                                                                                               kotlinParenthesizedExpression,
                                                                                                               kotlinPostfixExpression,
                                                                                                               kotlinPrefixExpression,
                                                                                                               kotlinRangeExpression,
                                                                                                               kotlinRealLiteral,
                                                                                                               kotlinSimpleIdentifier,
                                                                                                               kotlinSpreadExpression,
                                                                                                               kotlinSuperExpression,
                                                                                                               kotlinThisExpression,
                                                                                                               kotlinTryExpression,
                                                                                                               kotlinUnsignedLiteral,
                                                                                                               kotlinWhenExpression
                                                                                                             }
                                                                             tmp[kotlinExplicitDelegation] = {
                                                                                                               kotlinAdditiveExpression,
                                                                                                               kotlinAnonymousFunction,
                                                                                                               kotlinAsExpression,
                                                                                                               kotlinBinLiteral,
                                                                                                               kotlinBooleanLiteral,
                                                                                                               kotlinCallExpression,
                                                                                                               kotlinCallableReference,
                                                                                                               kotlinCharacterLiteral,
                                                                                                               kotlinCheckExpression,
                                                                                                               kotlinCollectionLiteral,
                                                                                                               kotlinComparisonExpression,
                                                                                                               kotlinConjunctionExpression,
                                                                                                               kotlinDisjunctionExpression,
                                                                                                               kotlinElvisExpression,
                                                                                                               kotlinEqualityExpression,
                                                                                                               kotlinFunctionType,
                                                                                                               kotlinHexLiteral,
                                                                                                               kotlinIfExpression,
                                                                                                               kotlinIndexingExpression,
                                                                                                               kotlinInfixExpression,
                                                                                                               kotlinIntegerLiteral,
                                                                                                               kotlinJumpExpression,
                                                                                                               kotlinLambdaLiteral,
                                                                                                               kotlinLineStringLiteral,
                                                                                                               kotlinLongLiteral,
                                                                                                               kotlinMultiLineStringLiteral,
                                                                                                               kotlinMultiplicativeExpression,
                                                                                                               kotlinNavigationExpression,
                                                                                                               kotlinObjectLiteral,
                                                                                                               kotlinParenthesizedExpression,
                                                                                                               kotlinPostfixExpression,
                                                                                                               kotlinPrefixExpression,
                                                                                                               kotlinRangeExpression,
                                                                                                               kotlinRealLiteral,
                                                                                                               kotlinSimpleIdentifier,
                                                                                                               kotlinSpreadExpression,
                                                                                                               kotlinSuperExpression,
                                                                                                               kotlinThisExpression,
                                                                                                               kotlinTryExpression,
                                                                                                               kotlinUnsignedLiteral,
                                                                                                               kotlinUserType,
                                                                                                               kotlinWhenExpression
                                                                                                             }
                                                                             tmp[kotlinFileAnnotation] = {kotlinConstructorInvocation, kotlinUserType}
                                                                             tmp[kotlinFinallyBlock] = {kotlinStatements}
                                                                             tmp[kotlinForStatement] = {
                                                                                                         kotlinAdditiveExpression,
                                                                                                         kotlinAnnotation,
                                                                                                         kotlinAnonymousFunction,
                                                                                                         kotlinAsExpression,
                                                                                                         kotlinBinLiteral,
                                                                                                         kotlinBooleanLiteral,
                                                                                                         kotlinCallExpression,
                                                                                                         kotlinCallableReference,
                                                                                                         kotlinCharacterLiteral,
                                                                                                         kotlinCheckExpression,
                                                                                                         kotlinCollectionLiteral,
                                                                                                         kotlinComparisonExpression,
                                                                                                         kotlinConjunctionExpression,
                                                                                                         kotlinControlStructureBody,
                                                                                                         kotlinDisjunctionExpression,
                                                                                                         kotlinElvisExpression,
                                                                                                         kotlinEqualityExpression,
                                                                                                         kotlinHexLiteral,
                                                                                                         kotlinIfExpression,
                                                                                                         kotlinIndexingExpression,
                                                                                                         kotlinInfixExpression,
                                                                                                         kotlinIntegerLiteral,
                                                                                                         kotlinJumpExpression,
                                                                                                         kotlinLambdaLiteral,
                                                                                                         kotlinLineStringLiteral,
                                                                                                         kotlinLongLiteral,
                                                                                                         kotlinMultiLineStringLiteral,
                                                                                                         kotlinMultiplicativeExpression,
                                                                                                         kotlinNavigationExpression,
                                                                                                         kotlinObjectLiteral,
                                                                                                         kotlinParenthesizedExpression,
                                                                                                         kotlinPostfixExpression,
                                                                                                         kotlinPrefixExpression,
                                                                                                         kotlinRangeExpression,
                                                                                                         kotlinRealLiteral,
                                                                                                         kotlinSimpleIdentifier,
                                                                                                         kotlinSpreadExpression,
                                                                                                         kotlinSuperExpression,
                                                                                                         kotlinThisExpression,
                                                                                                         kotlinTryExpression,
                                                                                                         kotlinUnsignedLiteral,
                                                                                                         kotlinVariableDeclaration,
                                                                                                         kotlinWhenExpression
                                                                                                       }
                                                                             tmp[kotlinFunctionBody] = {
                                                                                                         kotlinAdditiveExpression,
                                                                                                         kotlinAnonymousFunction,
                                                                                                         kotlinAsExpression,
                                                                                                         kotlinBinLiteral,
                                                                                                         kotlinBooleanLiteral,
                                                                                                         kotlinCallExpression,
                                                                                                         kotlinCallableReference,
                                                                                                         kotlinCharacterLiteral,
                                                                                                         kotlinCheckExpression,
                                                                                                         kotlinCollectionLiteral,
                                                                                                         kotlinComparisonExpression,
                                                                                                         kotlinConjunctionExpression,
                                                                                                         kotlinDisjunctionExpression,
                                                                                                         kotlinElvisExpression,
                                                                                                         kotlinEqualityExpression,
                                                                                                         kotlinHexLiteral,
                                                                                                         kotlinIfExpression,
                                                                                                         kotlinIndexingExpression,
                                                                                                         kotlinInfixExpression,
                                                                                                         kotlinIntegerLiteral,
                                                                                                         kotlinJumpExpression,
                                                                                                         kotlinLambdaLiteral,
                                                                                                         kotlinLineStringLiteral,
                                                                                                         kotlinLongLiteral,
                                                                                                         kotlinMultiLineStringLiteral,
                                                                                                         kotlinMultiplicativeExpression,
                                                                                                         kotlinNavigationExpression,
                                                                                                         kotlinObjectLiteral,
                                                                                                         kotlinParenthesizedExpression,
                                                                                                         kotlinPostfixExpression,
                                                                                                         kotlinPrefixExpression,
                                                                                                         kotlinRangeExpression,
                                                                                                         kotlinRealLiteral,
                                                                                                         kotlinSimpleIdentifier,
                                                                                                         kotlinSpreadExpression,
                                                                                                         kotlinStatements,
                                                                                                         kotlinSuperExpression,
                                                                                                         kotlinThisExpression,
                                                                                                         kotlinTryExpression,
                                                                                                         kotlinUnsignedLiteral,
                                                                                                         kotlinWhenExpression
                                                                                                       }
                                                                             tmp[kotlinFunctionDeclaration] = {
                                                                                                                kotlinAdditiveExpression,
                                                                                                                kotlinAnonymousFunction,
                                                                                                                kotlinAsExpression,
                                                                                                                kotlinBinLiteral,
                                                                                                                kotlinBooleanLiteral,
                                                                                                                kotlinCallExpression,
                                                                                                                kotlinCallableReference,
                                                                                                                kotlinCharacterLiteral,
                                                                                                                kotlinCheckExpression,
                                                                                                                kotlinCollectionLiteral,
                                                                                                                kotlinComparisonExpression,
                                                                                                                kotlinConjunctionExpression,
                                                                                                                kotlinDisjunctionExpression,
                                                                                                                kotlinElvisExpression,
                                                                                                                kotlinEqualityExpression,
                                                                                                                kotlinFunctionBody,
                                                                                                                kotlinFunctionType,
                                                                                                                kotlinHexLiteral,
                                                                                                                kotlinIfExpression,
                                                                                                                kotlinIndexingExpression,
                                                                                                                kotlinInfixExpression,
                                                                                                                kotlinIntegerLiteral,
                                                                                                                kotlinJumpExpression,
                                                                                                                kotlinLambdaLiteral,
                                                                                                                kotlinLineStringLiteral,
                                                                                                                kotlinLongLiteral,
                                                                                                                kotlinModifiers,
                                                                                                                kotlinMultiLineStringLiteral,
                                                                                                                kotlinMultiplicativeExpression,
                                                                                                                kotlinNavigationExpression,
                                                                                                                kotlinNullableType,
                                                                                                                kotlinObjectLiteral,
                                                                                                                kotlinParameter,
                                                                                                                kotlinParameterModifiers,
                                                                                                                kotlinParenthesizedExpression,
                                                                                                                kotlinParenthesizedType,
                                                                                                                kotlinPostfixExpression,
                                                                                                                kotlinPrefixExpression,
                                                                                                                kotlinRangeExpression,
                                                                                                                kotlinRealLiteral,
                                                                                                                kotlinSimpleIdentifier,
                                                                                                                kotlinSpreadExpression,
                                                                                                                kotlinSuperExpression,
                                                                                                                kotlinThisExpression,
                                                                                                                kotlinTryExpression,
                                                                                                                kotlinTypeConstraints,
                                                                                                                kotlinTypeModifiers,
                                                                                                                kotlinTypeParameters,
                                                                                                                kotlinUnsignedLiteral,
                                                                                                                kotlinUserType,
                                                                                                                kotlinWhenExpression
                                                                                                              }
                                                                             tmp[kotlinFunctionType] = {
                                                                                                         kotlinFunctionType,
                                                                                                         kotlinFunctionTypeParameters,
                                                                                                         kotlinNullableType,
                                                                                                         kotlinParenthesizedType,
                                                                                                         kotlinTypeArguments,
                                                                                                         kotlinTypeIdentifier,
                                                                                                         kotlinTypeModifiers,
                                                                                                         kotlinUserType
                                                                                                       }
                                                                             tmp[kotlinFunctionTypeParameters] = {kotlinFunctionType, kotlinNullableType, kotlinParameter, kotlinParenthesizedType, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinGetter] = {kotlinFunctionBody, kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinIdentifier] = {kotlinSimpleIdentifier}
                                                                             tmp[kotlinIfExpression] = {
                                                                                                         kotlinAdditiveExpression,
                                                                                                         kotlinAnonymousFunction,
                                                                                                         kotlinAsExpression,
                                                                                                         kotlinBinLiteral,
                                                                                                         kotlinBooleanLiteral,
                                                                                                         kotlinCallExpression,
                                                                                                         kotlinCallableReference,
                                                                                                         kotlinCharacterLiteral,
                                                                                                         kotlinCheckExpression,
                                                                                                         kotlinCollectionLiteral,
                                                                                                         kotlinComparisonExpression,
                                                                                                         kotlinConjunctionExpression,
                                                                                                         kotlinControlStructureBody,
                                                                                                         kotlinDisjunctionExpression,
                                                                                                         kotlinElvisExpression,
                                                                                                         kotlinEqualityExpression,
                                                                                                         kotlinHexLiteral,
                                                                                                         kotlinIfExpression,
                                                                                                         kotlinIndexingExpression,
                                                                                                         kotlinInfixExpression,
                                                                                                         kotlinIntegerLiteral,
                                                                                                         kotlinJumpExpression,
                                                                                                         kotlinLambdaLiteral,
                                                                                                         kotlinLineStringLiteral,
                                                                                                         kotlinLongLiteral,
                                                                                                         kotlinMultiLineStringLiteral,
                                                                                                         kotlinMultiplicativeExpression,
                                                                                                         kotlinNavigationExpression,
                                                                                                         kotlinObjectLiteral,
                                                                                                         kotlinParenthesizedExpression,
                                                                                                         kotlinPostfixExpression,
                                                                                                         kotlinPrefixExpression,
                                                                                                         kotlinRangeExpression,
                                                                                                         kotlinRealLiteral,
                                                                                                         kotlinSimpleIdentifier,
                                                                                                         kotlinSpreadExpression,
                                                                                                         kotlinSuperExpression,
                                                                                                         kotlinThisExpression,
                                                                                                         kotlinTryExpression,
                                                                                                         kotlinUnsignedLiteral,
                                                                                                         kotlinWhenExpression
                                                                                                       }
                                                                             tmp[kotlinImportAlias] = {kotlinTypeIdentifier}
                                                                             tmp[kotlinImportHeader] = {kotlinIdentifier, kotlinImportAlias}
                                                                             tmp[kotlinIndexingExpression] = {
                                                                                                               kotlinAdditiveExpression,
                                                                                                               kotlinAnonymousFunction,
                                                                                                               kotlinAsExpression,
                                                                                                               kotlinBinLiteral,
                                                                                                               kotlinBooleanLiteral,
                                                                                                               kotlinCallExpression,
                                                                                                               kotlinCallableReference,
                                                                                                               kotlinCharacterLiteral,
                                                                                                               kotlinCheckExpression,
                                                                                                               kotlinCollectionLiteral,
                                                                                                               kotlinComparisonExpression,
                                                                                                               kotlinConjunctionExpression,
                                                                                                               kotlinDisjunctionExpression,
                                                                                                               kotlinElvisExpression,
                                                                                                               kotlinEqualityExpression,
                                                                                                               kotlinHexLiteral,
                                                                                                               kotlinIfExpression,
                                                                                                               kotlinIndexingExpression,
                                                                                                               kotlinIndexingSuffix,
                                                                                                               kotlinInfixExpression,
                                                                                                               kotlinIntegerLiteral,
                                                                                                               kotlinJumpExpression,
                                                                                                               kotlinLambdaLiteral,
                                                                                                               kotlinLineStringLiteral,
                                                                                                               kotlinLongLiteral,
                                                                                                               kotlinMultiLineStringLiteral,
                                                                                                               kotlinMultiplicativeExpression,
                                                                                                               kotlinNavigationExpression,
                                                                                                               kotlinObjectLiteral,
                                                                                                               kotlinParenthesizedExpression,
                                                                                                               kotlinPostfixExpression,
                                                                                                               kotlinPrefixExpression,
                                                                                                               kotlinRangeExpression,
                                                                                                               kotlinRealLiteral,
                                                                                                               kotlinSimpleIdentifier,
                                                                                                               kotlinSpreadExpression,
                                                                                                               kotlinSuperExpression,
                                                                                                               kotlinThisExpression,
                                                                                                               kotlinTryExpression,
                                                                                                               kotlinUnsignedLiteral,
                                                                                                               kotlinWhenExpression
                                                                                                             }
                                                                             tmp[kotlinIndexingSuffix] = {
                                                                                                           kotlinAdditiveExpression,
                                                                                                           kotlinAnonymousFunction,
                                                                                                           kotlinAsExpression,
                                                                                                           kotlinBinLiteral,
                                                                                                           kotlinBooleanLiteral,
                                                                                                           kotlinCallExpression,
                                                                                                           kotlinCallableReference,
                                                                                                           kotlinCharacterLiteral,
                                                                                                           kotlinCheckExpression,
                                                                                                           kotlinCollectionLiteral,
                                                                                                           kotlinComparisonExpression,
                                                                                                           kotlinConjunctionExpression,
                                                                                                           kotlinDisjunctionExpression,
                                                                                                           kotlinElvisExpression,
                                                                                                           kotlinEqualityExpression,
                                                                                                           kotlinHexLiteral,
                                                                                                           kotlinIfExpression,
                                                                                                           kotlinIndexingExpression,
                                                                                                           kotlinInfixExpression,
                                                                                                           kotlinIntegerLiteral,
                                                                                                           kotlinJumpExpression,
                                                                                                           kotlinLambdaLiteral,
                                                                                                           kotlinLineStringLiteral,
                                                                                                           kotlinLongLiteral,
                                                                                                           kotlinMultiLineStringLiteral,
                                                                                                           kotlinMultiplicativeExpression,
                                                                                                           kotlinNavigationExpression,
                                                                                                           kotlinObjectLiteral,
                                                                                                           kotlinParenthesizedExpression,
                                                                                                           kotlinPostfixExpression,
                                                                                                           kotlinPrefixExpression,
                                                                                                           kotlinRangeExpression,
                                                                                                           kotlinRealLiteral,
                                                                                                           kotlinSimpleIdentifier,
                                                                                                           kotlinSpreadExpression,
                                                                                                           kotlinSuperExpression,
                                                                                                           kotlinThisExpression,
                                                                                                           kotlinTryExpression,
                                                                                                           kotlinUnsignedLiteral,
                                                                                                           kotlinWhenExpression
                                                                                                         }
                                                                             tmp[kotlinInfixExpression] = {
                                                                                                            kotlinAdditiveExpression,
                                                                                                            kotlinAnonymousFunction,
                                                                                                            kotlinAsExpression,
                                                                                                            kotlinBinLiteral,
                                                                                                            kotlinBooleanLiteral,
                                                                                                            kotlinCallExpression,
                                                                                                            kotlinCallableReference,
                                                                                                            kotlinCharacterLiteral,
                                                                                                            kotlinCheckExpression,
                                                                                                            kotlinCollectionLiteral,
                                                                                                            kotlinComparisonExpression,
                                                                                                            kotlinConjunctionExpression,
                                                                                                            kotlinDisjunctionExpression,
                                                                                                            kotlinElvisExpression,
                                                                                                            kotlinEqualityExpression,
                                                                                                            kotlinHexLiteral,
                                                                                                            kotlinIfExpression,
                                                                                                            kotlinIndexingExpression,
                                                                                                            kotlinInfixExpression,
                                                                                                            kotlinIntegerLiteral,
                                                                                                            kotlinJumpExpression,
                                                                                                            kotlinLambdaLiteral,
                                                                                                            kotlinLineStringLiteral,
                                                                                                            kotlinLongLiteral,
                                                                                                            kotlinMultiLineStringLiteral,
                                                                                                            kotlinMultiplicativeExpression,
                                                                                                            kotlinNavigationExpression,
                                                                                                            kotlinObjectLiteral,
                                                                                                            kotlinParenthesizedExpression,
                                                                                                            kotlinPostfixExpression,
                                                                                                            kotlinPrefixExpression,
                                                                                                            kotlinRangeExpression,
                                                                                                            kotlinRealLiteral,
                                                                                                            kotlinSimpleIdentifier,
                                                                                                            kotlinSpreadExpression,
                                                                                                            kotlinSuperExpression,
                                                                                                            kotlinThisExpression,
                                                                                                            kotlinTryExpression,
                                                                                                            kotlinUnsignedLiteral,
                                                                                                            kotlinWhenExpression
                                                                                                          }
                                                                             tmp[kotlinInterpolatedExpression] = {
                                                                                                                   kotlinAdditiveExpression,
                                                                                                                   kotlinAnonymousFunction,
                                                                                                                   kotlinAsExpression,
                                                                                                                   kotlinBinLiteral,
                                                                                                                   kotlinBooleanLiteral,
                                                                                                                   kotlinCallExpression,
                                                                                                                   kotlinCallableReference,
                                                                                                                   kotlinCharacterLiteral,
                                                                                                                   kotlinCheckExpression,
                                                                                                                   kotlinCollectionLiteral,
                                                                                                                   kotlinComparisonExpression,
                                                                                                                   kotlinConjunctionExpression,
                                                                                                                   kotlinDisjunctionExpression,
                                                                                                                   kotlinElvisExpression,
                                                                                                                   kotlinEqualityExpression,
                                                                                                                   kotlinHexLiteral,
                                                                                                                   kotlinIfExpression,
                                                                                                                   kotlinIndexingExpression,
                                                                                                                   kotlinInfixExpression,
                                                                                                                   kotlinIntegerLiteral,
                                                                                                                   kotlinJumpExpression,
                                                                                                                   kotlinLambdaLiteral,
                                                                                                                   kotlinLineStringLiteral,
                                                                                                                   kotlinLongLiteral,
                                                                                                                   kotlinMultiLineStringLiteral,
                                                                                                                   kotlinMultiplicativeExpression,
                                                                                                                   kotlinNavigationExpression,
                                                                                                                   kotlinObjectLiteral,
                                                                                                                   kotlinParenthesizedExpression,
                                                                                                                   kotlinPostfixExpression,
                                                                                                                   kotlinPrefixExpression,
                                                                                                                   kotlinRangeExpression,
                                                                                                                   kotlinRealLiteral,
                                                                                                                   kotlinSimpleIdentifier,
                                                                                                                   kotlinSpreadExpression,
                                                                                                                   kotlinSuperExpression,
                                                                                                                   kotlinThisExpression,
                                                                                                                   kotlinTryExpression,
                                                                                                                   kotlinUnsignedLiteral,
                                                                                                                   kotlinWhenExpression
                                                                                                                 }
                                                                             tmp[kotlinJumpExpression] = {
                                                                                                           kotlinAdditiveExpression,
                                                                                                           kotlinAnonymousFunction,
                                                                                                           kotlinAsExpression,
                                                                                                           kotlinBinLiteral,
                                                                                                           kotlinBooleanLiteral,
                                                                                                           kotlinCallExpression,
                                                                                                           kotlinCallableReference,
                                                                                                           kotlinCharacterLiteral,
                                                                                                           kotlinCheckExpression,
                                                                                                           kotlinCollectionLiteral,
                                                                                                           kotlinComparisonExpression,
                                                                                                           kotlinConjunctionExpression,
                                                                                                           kotlinDisjunctionExpression,
                                                                                                           kotlinElvisExpression,
                                                                                                           kotlinEqualityExpression,
                                                                                                           kotlinHexLiteral,
                                                                                                           kotlinIfExpression,
                                                                                                           kotlinIndexingExpression,
                                                                                                           kotlinInfixExpression,
                                                                                                           kotlinIntegerLiteral,
                                                                                                           kotlinJumpExpression,
                                                                                                           kotlinLambdaLiteral,
                                                                                                           kotlinLineStringLiteral,
                                                                                                           kotlinLongLiteral,
                                                                                                           kotlinMultiLineStringLiteral,
                                                                                                           kotlinMultiplicativeExpression,
                                                                                                           kotlinNavigationExpression,
                                                                                                           kotlinObjectLiteral,
                                                                                                           kotlinParenthesizedExpression,
                                                                                                           kotlinPostfixExpression,
                                                                                                           kotlinPrefixExpression,
                                                                                                           kotlinRangeExpression,
                                                                                                           kotlinRealLiteral,
                                                                                                           kotlinSimpleIdentifier,
                                                                                                           kotlinSpreadExpression,
                                                                                                           kotlinSuperExpression,
                                                                                                           kotlinThisExpression,
                                                                                                           kotlinTryExpression,
                                                                                                           kotlinUnsignedLiteral,
                                                                                                           kotlinWhenExpression
                                                                                                         }
                                                                             tmp[kotlinLambdaLiteral] = {kotlinLambdaParameters, kotlinStatements}
                                                                             tmp[kotlinLambdaParameters] = {kotlinVariableDeclaration}
                                                                             tmp[kotlinLineStringLiteral] = {kotlinInterpolatedExpression, kotlinInterpolatedIdentifier}
                                                                             tmp[kotlinLongLiteral] = {kotlinBinLiteral, kotlinHexLiteral, kotlinIntegerLiteral}
                                                                             tmp[kotlinModifiers] = {
                                                                                                      kotlinAnnotation,
                                                                                                      kotlinClassModifier,
                                                                                                      kotlinFunctionModifier,
                                                                                                      kotlinInheritanceModifier,
                                                                                                      kotlinMemberModifier,
                                                                                                      kotlinParameterModifier,
                                                                                                      kotlinPlatformModifier,
                                                                                                      kotlinPropertyModifier,
                                                                                                      kotlinVisibilityModifier
                                                                                                    }
                                                                             tmp[kotlinMultiLineStringLiteral] = {kotlinInterpolatedExpression, kotlinInterpolatedIdentifier}
                                                                             tmp[kotlinMultiplicativeExpression] = {
                                                                                                                     kotlinAdditiveExpression,
                                                                                                                     kotlinAnonymousFunction,
                                                                                                                     kotlinAsExpression,
                                                                                                                     kotlinBinLiteral,
                                                                                                                     kotlinBooleanLiteral,
                                                                                                                     kotlinCallExpression,
                                                                                                                     kotlinCallableReference,
                                                                                                                     kotlinCharacterLiteral,
                                                                                                                     kotlinCheckExpression,
                                                                                                                     kotlinCollectionLiteral,
                                                                                                                     kotlinComparisonExpression,
                                                                                                                     kotlinConjunctionExpression,
                                                                                                                     kotlinDisjunctionExpression,
                                                                                                                     kotlinElvisExpression,
                                                                                                                     kotlinEqualityExpression,
                                                                                                                     kotlinHexLiteral,
                                                                                                                     kotlinIfExpression,
                                                                                                                     kotlinIndexingExpression,
                                                                                                                     kotlinInfixExpression,
                                                                                                                     kotlinIntegerLiteral,
                                                                                                                     kotlinJumpExpression,
                                                                                                                     kotlinLambdaLiteral,
                                                                                                                     kotlinLineStringLiteral,
                                                                                                                     kotlinLongLiteral,
                                                                                                                     kotlinMultiLineStringLiteral,
                                                                                                                     kotlinMultiplicativeExpression,
                                                                                                                     kotlinNavigationExpression,
                                                                                                                     kotlinObjectLiteral,
                                                                                                                     kotlinParenthesizedExpression,
                                                                                                                     kotlinPostfixExpression,
                                                                                                                     kotlinPrefixExpression,
                                                                                                                     kotlinRangeExpression,
                                                                                                                     kotlinRealLiteral,
                                                                                                                     kotlinSimpleIdentifier,
                                                                                                                     kotlinSpreadExpression,
                                                                                                                     kotlinSuperExpression,
                                                                                                                     kotlinThisExpression,
                                                                                                                     kotlinTryExpression,
                                                                                                                     kotlinUnsignedLiteral,
                                                                                                                     kotlinWhenExpression
                                                                                                                   }
                                                                             tmp[kotlinNavigationExpression] = {
                                                                                                                 kotlinAdditiveExpression,
                                                                                                                 kotlinAnonymousFunction,
                                                                                                                 kotlinAsExpression,
                                                                                                                 kotlinBinLiteral,
                                                                                                                 kotlinBooleanLiteral,
                                                                                                                 kotlinCallExpression,
                                                                                                                 kotlinCallableReference,
                                                                                                                 kotlinCharacterLiteral,
                                                                                                                 kotlinCheckExpression,
                                                                                                                 kotlinCollectionLiteral,
                                                                                                                 kotlinComparisonExpression,
                                                                                                                 kotlinConjunctionExpression,
                                                                                                                 kotlinDisjunctionExpression,
                                                                                                                 kotlinElvisExpression,
                                                                                                                 kotlinEqualityExpression,
                                                                                                                 kotlinHexLiteral,
                                                                                                                 kotlinIfExpression,
                                                                                                                 kotlinIndexingExpression,
                                                                                                                 kotlinInfixExpression,
                                                                                                                 kotlinIntegerLiteral,
                                                                                                                 kotlinJumpExpression,
                                                                                                                 kotlinLambdaLiteral,
                                                                                                                 kotlinLineStringLiteral,
                                                                                                                 kotlinLongLiteral,
                                                                                                                 kotlinMultiLineStringLiteral,
                                                                                                                 kotlinMultiplicativeExpression,
                                                                                                                 kotlinNavigationExpression,
                                                                                                                 kotlinNavigationSuffix,
                                                                                                                 kotlinObjectLiteral,
                                                                                                                 kotlinParenthesizedExpression,
                                                                                                                 kotlinPostfixExpression,
                                                                                                                 kotlinPrefixExpression,
                                                                                                                 kotlinRangeExpression,
                                                                                                                 kotlinRealLiteral,
                                                                                                                 kotlinSimpleIdentifier,
                                                                                                                 kotlinSpreadExpression,
                                                                                                                 kotlinSuperExpression,
                                                                                                                 kotlinThisExpression,
                                                                                                                 kotlinTryExpression,
                                                                                                                 kotlinUnsignedLiteral,
                                                                                                                 kotlinWhenExpression
                                                                                                               }
                                                                             tmp[kotlinNavigationSuffix] = {kotlinParenthesizedExpression, kotlinSimpleIdentifier}
                                                                             tmp[kotlinNullableType] = {kotlinParenthesizedType, kotlinUserType}
                                                                             tmp[kotlinObjectDeclaration] = {kotlinClassBody, kotlinDelegationSpecifier, kotlinModifiers, kotlinTypeIdentifier}
                                                                             tmp[kotlinObjectLiteral] = {kotlinClassBody, kotlinDelegationSpecifier}
                                                                             tmp[kotlinPackageHeader] = {kotlinIdentifier}
                                                                             tmp[kotlinParameter] = {kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinSimpleIdentifier, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinParameterModifiers] = {kotlinAnnotation, kotlinParameterModifier}
                                                                             tmp[kotlinParameterWithOptionalType] = {
                                                                                                                      kotlinFunctionType,
                                                                                                                      kotlinNullableType,
                                                                                                                      kotlinParameterModifiers,
                                                                                                                      kotlinParenthesizedType,
                                                                                                                      kotlinSimpleIdentifier,
                                                                                                                      kotlinTypeModifiers,
                                                                                                                      kotlinUserType
                                                                                                                    }
                                                                             tmp[kotlinParenthesizedExpression] = {
                                                                                                                    kotlinAdditiveExpression,
                                                                                                                    kotlinAnonymousFunction,
                                                                                                                    kotlinAsExpression,
                                                                                                                    kotlinBinLiteral,
                                                                                                                    kotlinBooleanLiteral,
                                                                                                                    kotlinCallExpression,
                                                                                                                    kotlinCallableReference,
                                                                                                                    kotlinCharacterLiteral,
                                                                                                                    kotlinCheckExpression,
                                                                                                                    kotlinCollectionLiteral,
                                                                                                                    kotlinComparisonExpression,
                                                                                                                    kotlinConjunctionExpression,
                                                                                                                    kotlinDisjunctionExpression,
                                                                                                                    kotlinElvisExpression,
                                                                                                                    kotlinEqualityExpression,
                                                                                                                    kotlinHexLiteral,
                                                                                                                    kotlinIfExpression,
                                                                                                                    kotlinIndexingExpression,
                                                                                                                    kotlinInfixExpression,
                                                                                                                    kotlinIntegerLiteral,
                                                                                                                    kotlinJumpExpression,
                                                                                                                    kotlinLambdaLiteral,
                                                                                                                    kotlinLineStringLiteral,
                                                                                                                    kotlinLongLiteral,
                                                                                                                    kotlinMultiLineStringLiteral,
                                                                                                                    kotlinMultiplicativeExpression,
                                                                                                                    kotlinNavigationExpression,
                                                                                                                    kotlinObjectLiteral,
                                                                                                                    kotlinParenthesizedExpression,
                                                                                                                    kotlinPostfixExpression,
                                                                                                                    kotlinPrefixExpression,
                                                                                                                    kotlinRangeExpression,
                                                                                                                    kotlinRealLiteral,
                                                                                                                    kotlinSimpleIdentifier,
                                                                                                                    kotlinSpreadExpression,
                                                                                                                    kotlinSuperExpression,
                                                                                                                    kotlinThisExpression,
                                                                                                                    kotlinTryExpression,
                                                                                                                    kotlinUnsignedLiteral,
                                                                                                                    kotlinWhenExpression
                                                                                                                  }
                                                                             tmp[kotlinParenthesizedType] = {kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinParenthesizedUserType] = {kotlinParenthesizedUserType, kotlinUserType}
                                                                             tmp[kotlinPostfixExpression] = {
                                                                                                              kotlinAdditiveExpression,
                                                                                                              kotlinAnonymousFunction,
                                                                                                              kotlinAsExpression,
                                                                                                              kotlinBinLiteral,
                                                                                                              kotlinBooleanLiteral,
                                                                                                              kotlinCallExpression,
                                                                                                              kotlinCallableReference,
                                                                                                              kotlinCharacterLiteral,
                                                                                                              kotlinCheckExpression,
                                                                                                              kotlinCollectionLiteral,
                                                                                                              kotlinComparisonExpression,
                                                                                                              kotlinConjunctionExpression,
                                                                                                              kotlinDisjunctionExpression,
                                                                                                              kotlinElvisExpression,
                                                                                                              kotlinEqualityExpression,
                                                                                                              kotlinHexLiteral,
                                                                                                              kotlinIfExpression,
                                                                                                              kotlinIndexingExpression,
                                                                                                              kotlinInfixExpression,
                                                                                                              kotlinIntegerLiteral,
                                                                                                              kotlinJumpExpression,
                                                                                                              kotlinLambdaLiteral,
                                                                                                              kotlinLineStringLiteral,
                                                                                                              kotlinLongLiteral,
                                                                                                              kotlinMultiLineStringLiteral,
                                                                                                              kotlinMultiplicativeExpression,
                                                                                                              kotlinNavigationExpression,
                                                                                                              kotlinObjectLiteral,
                                                                                                              kotlinParenthesizedExpression,
                                                                                                              kotlinPostfixExpression,
                                                                                                              kotlinPrefixExpression,
                                                                                                              kotlinRangeExpression,
                                                                                                              kotlinRealLiteral,
                                                                                                              kotlinSimpleIdentifier,
                                                                                                              kotlinSpreadExpression,
                                                                                                              kotlinSuperExpression,
                                                                                                              kotlinThisExpression,
                                                                                                              kotlinTryExpression,
                                                                                                              kotlinUnsignedLiteral,
                                                                                                              kotlinWhenExpression
                                                                                                            }
                                                                             tmp[kotlinPrefixExpression] = {
                                                                                                             kotlinAdditiveExpression,
                                                                                                             kotlinAnnotation,
                                                                                                             kotlinAnonymousFunction,
                                                                                                             kotlinAsExpression,
                                                                                                             kotlinBinLiteral,
                                                                                                             kotlinBooleanLiteral,
                                                                                                             kotlinCallExpression,
                                                                                                             kotlinCallableReference,
                                                                                                             kotlinCharacterLiteral,
                                                                                                             kotlinCheckExpression,
                                                                                                             kotlinCollectionLiteral,
                                                                                                             kotlinComparisonExpression,
                                                                                                             kotlinConjunctionExpression,
                                                                                                             kotlinDisjunctionExpression,
                                                                                                             kotlinElvisExpression,
                                                                                                             kotlinEqualityExpression,
                                                                                                             kotlinHexLiteral,
                                                                                                             kotlinIfExpression,
                                                                                                             kotlinIndexingExpression,
                                                                                                             kotlinInfixExpression,
                                                                                                             kotlinIntegerLiteral,
                                                                                                             kotlinJumpExpression,
                                                                                                             kotlinLabel,
                                                                                                             kotlinLambdaLiteral,
                                                                                                             kotlinLineStringLiteral,
                                                                                                             kotlinLongLiteral,
                                                                                                             kotlinMultiLineStringLiteral,
                                                                                                             kotlinMultiplicativeExpression,
                                                                                                             kotlinNavigationExpression,
                                                                                                             kotlinObjectLiteral,
                                                                                                             kotlinParenthesizedExpression,
                                                                                                             kotlinPostfixExpression,
                                                                                                             kotlinPrefixExpression,
                                                                                                             kotlinRangeExpression,
                                                                                                             kotlinRealLiteral,
                                                                                                             kotlinSimpleIdentifier,
                                                                                                             kotlinSpreadExpression,
                                                                                                             kotlinSuperExpression,
                                                                                                             kotlinThisExpression,
                                                                                                             kotlinTryExpression,
                                                                                                             kotlinUnsignedLiteral,
                                                                                                             kotlinWhenExpression
                                                                                                           }
                                                                             tmp[kotlinPrimaryConstructor] = {kotlinClassParameter, kotlinModifiers}
                                                                             tmp[kotlinPropertyDeclaration] = {
                                                                                                                kotlinAdditiveExpression,
                                                                                                                kotlinAnonymousFunction,
                                                                                                                kotlinAsExpression,
                                                                                                                kotlinBinLiteral,
                                                                                                                kotlinBooleanLiteral,
                                                                                                                kotlinCallExpression,
                                                                                                                kotlinCallableReference,
                                                                                                                kotlinCharacterLiteral,
                                                                                                                kotlinCheckExpression,
                                                                                                                kotlinCollectionLiteral,
                                                                                                                kotlinComparisonExpression,
                                                                                                                kotlinConjunctionExpression,
                                                                                                                kotlinDisjunctionExpression,
                                                                                                                kotlinElvisExpression,
                                                                                                                kotlinEqualityExpression,
                                                                                                                kotlinGetter,
                                                                                                                kotlinHexLiteral,
                                                                                                                kotlinIfExpression,
                                                                                                                kotlinIndexingExpression,
                                                                                                                kotlinInfixExpression,
                                                                                                                kotlinIntegerLiteral,
                                                                                                                kotlinJumpExpression,
                                                                                                                kotlinLambdaLiteral,
                                                                                                                kotlinLineStringLiteral,
                                                                                                                kotlinLongLiteral,
                                                                                                                kotlinModifiers,
                                                                                                                kotlinMultiLineStringLiteral,
                                                                                                                kotlinMultiplicativeExpression,
                                                                                                                kotlinNavigationExpression,
                                                                                                                kotlinObjectLiteral,
                                                                                                                kotlinParenthesizedExpression,
                                                                                                                kotlinPostfixExpression,
                                                                                                                kotlinPrefixExpression,
                                                                                                                kotlinPropertyDelegate,
                                                                                                                kotlinRangeExpression,
                                                                                                                kotlinRealLiteral,
                                                                                                                kotlinSetter,
                                                                                                                kotlinSimpleIdentifier,
                                                                                                                kotlinSpreadExpression,
                                                                                                                kotlinSuperExpression,
                                                                                                                kotlinThisExpression,
                                                                                                                kotlinTryExpression,
                                                                                                                kotlinTypeConstraints,
                                                                                                                kotlinTypeParameters,
                                                                                                                kotlinUnsignedLiteral,
                                                                                                                kotlinVariableDeclaration,
                                                                                                                kotlinWhenExpression
                                                                                                              }
                                                                             tmp[kotlinPropertyDelegate] = {
                                                                                                             kotlinAdditiveExpression,
                                                                                                             kotlinAnonymousFunction,
                                                                                                             kotlinAsExpression,
                                                                                                             kotlinBinLiteral,
                                                                                                             kotlinBooleanLiteral,
                                                                                                             kotlinCallExpression,
                                                                                                             kotlinCallableReference,
                                                                                                             kotlinCharacterLiteral,
                                                                                                             kotlinCheckExpression,
                                                                                                             kotlinCollectionLiteral,
                                                                                                             kotlinComparisonExpression,
                                                                                                             kotlinConjunctionExpression,
                                                                                                             kotlinDisjunctionExpression,
                                                                                                             kotlinElvisExpression,
                                                                                                             kotlinEqualityExpression,
                                                                                                             kotlinHexLiteral,
                                                                                                             kotlinIfExpression,
                                                                                                             kotlinIndexingExpression,
                                                                                                             kotlinInfixExpression,
                                                                                                             kotlinIntegerLiteral,
                                                                                                             kotlinJumpExpression,
                                                                                                             kotlinLambdaLiteral,
                                                                                                             kotlinLineStringLiteral,
                                                                                                             kotlinLongLiteral,
                                                                                                             kotlinMultiLineStringLiteral,
                                                                                                             kotlinMultiplicativeExpression,
                                                                                                             kotlinNavigationExpression,
                                                                                                             kotlinObjectLiteral,
                                                                                                             kotlinParenthesizedExpression,
                                                                                                             kotlinPostfixExpression,
                                                                                                             kotlinPrefixExpression,
                                                                                                             kotlinRangeExpression,
                                                                                                             kotlinRealLiteral,
                                                                                                             kotlinSimpleIdentifier,
                                                                                                             kotlinSpreadExpression,
                                                                                                             kotlinSuperExpression,
                                                                                                             kotlinThisExpression,
                                                                                                             kotlinTryExpression,
                                                                                                             kotlinUnsignedLiteral,
                                                                                                             kotlinWhenExpression
                                                                                                           }
                                                                             tmp[kotlinRangeExpression] = {
                                                                                                            kotlinAdditiveExpression,
                                                                                                            kotlinAnonymousFunction,
                                                                                                            kotlinAsExpression,
                                                                                                            kotlinBinLiteral,
                                                                                                            kotlinBooleanLiteral,
                                                                                                            kotlinCallExpression,
                                                                                                            kotlinCallableReference,
                                                                                                            kotlinCharacterLiteral,
                                                                                                            kotlinCheckExpression,
                                                                                                            kotlinCollectionLiteral,
                                                                                                            kotlinComparisonExpression,
                                                                                                            kotlinConjunctionExpression,
                                                                                                            kotlinDisjunctionExpression,
                                                                                                            kotlinElvisExpression,
                                                                                                            kotlinEqualityExpression,
                                                                                                            kotlinHexLiteral,
                                                                                                            kotlinIfExpression,
                                                                                                            kotlinIndexingExpression,
                                                                                                            kotlinInfixExpression,
                                                                                                            kotlinIntegerLiteral,
                                                                                                            kotlinJumpExpression,
                                                                                                            kotlinLambdaLiteral,
                                                                                                            kotlinLineStringLiteral,
                                                                                                            kotlinLongLiteral,
                                                                                                            kotlinMultiLineStringLiteral,
                                                                                                            kotlinMultiplicativeExpression,
                                                                                                            kotlinNavigationExpression,
                                                                                                            kotlinObjectLiteral,
                                                                                                            kotlinParenthesizedExpression,
                                                                                                            kotlinPostfixExpression,
                                                                                                            kotlinPrefixExpression,
                                                                                                            kotlinRangeExpression,
                                                                                                            kotlinRealLiteral,
                                                                                                            kotlinSimpleIdentifier,
                                                                                                            kotlinSpreadExpression,
                                                                                                            kotlinSuperExpression,
                                                                                                            kotlinThisExpression,
                                                                                                            kotlinTryExpression,
                                                                                                            kotlinUnsignedLiteral,
                                                                                                            kotlinWhenExpression
                                                                                                          }
                                                                             tmp[kotlinRangeTest] = {
                                                                                                      kotlinAdditiveExpression,
                                                                                                      kotlinAnonymousFunction,
                                                                                                      kotlinAsExpression,
                                                                                                      kotlinBinLiteral,
                                                                                                      kotlinBooleanLiteral,
                                                                                                      kotlinCallExpression,
                                                                                                      kotlinCallableReference,
                                                                                                      kotlinCharacterLiteral,
                                                                                                      kotlinCheckExpression,
                                                                                                      kotlinCollectionLiteral,
                                                                                                      kotlinComparisonExpression,
                                                                                                      kotlinConjunctionExpression,
                                                                                                      kotlinDisjunctionExpression,
                                                                                                      kotlinElvisExpression,
                                                                                                      kotlinEqualityExpression,
                                                                                                      kotlinHexLiteral,
                                                                                                      kotlinIfExpression,
                                                                                                      kotlinIndexingExpression,
                                                                                                      kotlinInfixExpression,
                                                                                                      kotlinIntegerLiteral,
                                                                                                      kotlinJumpExpression,
                                                                                                      kotlinLambdaLiteral,
                                                                                                      kotlinLineStringLiteral,
                                                                                                      kotlinLongLiteral,
                                                                                                      kotlinMultiLineStringLiteral,
                                                                                                      kotlinMultiplicativeExpression,
                                                                                                      kotlinNavigationExpression,
                                                                                                      kotlinObjectLiteral,
                                                                                                      kotlinParenthesizedExpression,
                                                                                                      kotlinPostfixExpression,
                                                                                                      kotlinPrefixExpression,
                                                                                                      kotlinRangeExpression,
                                                                                                      kotlinRealLiteral,
                                                                                                      kotlinSimpleIdentifier,
                                                                                                      kotlinSpreadExpression,
                                                                                                      kotlinSuperExpression,
                                                                                                      kotlinThisExpression,
                                                                                                      kotlinTryExpression,
                                                                                                      kotlinUnsignedLiteral,
                                                                                                      kotlinWhenExpression
                                                                                                    }
                                                                             tmp[kotlinSecondaryConstructor] = {
                                                                                                                 kotlinAdditiveExpression,
                                                                                                                 kotlinAnonymousFunction,
                                                                                                                 kotlinAsExpression,
                                                                                                                 kotlinBinLiteral,
                                                                                                                 kotlinBooleanLiteral,
                                                                                                                 kotlinCallExpression,
                                                                                                                 kotlinCallableReference,
                                                                                                                 kotlinCharacterLiteral,
                                                                                                                 kotlinCheckExpression,
                                                                                                                 kotlinCollectionLiteral,
                                                                                                                 kotlinComparisonExpression,
                                                                                                                 kotlinConjunctionExpression,
                                                                                                                 kotlinConstructorDelegationCall,
                                                                                                                 kotlinDisjunctionExpression,
                                                                                                                 kotlinElvisExpression,
                                                                                                                 kotlinEqualityExpression,
                                                                                                                 kotlinHexLiteral,
                                                                                                                 kotlinIfExpression,
                                                                                                                 kotlinIndexingExpression,
                                                                                                                 kotlinInfixExpression,
                                                                                                                 kotlinIntegerLiteral,
                                                                                                                 kotlinJumpExpression,
                                                                                                                 kotlinLambdaLiteral,
                                                                                                                 kotlinLineStringLiteral,
                                                                                                                 kotlinLongLiteral,
                                                                                                                 kotlinModifiers,
                                                                                                                 kotlinMultiLineStringLiteral,
                                                                                                                 kotlinMultiplicativeExpression,
                                                                                                                 kotlinNavigationExpression,
                                                                                                                 kotlinObjectLiteral,
                                                                                                                 kotlinParameter,
                                                                                                                 kotlinParameterModifiers,
                                                                                                                 kotlinParenthesizedExpression,
                                                                                                                 kotlinPostfixExpression,
                                                                                                                 kotlinPrefixExpression,
                                                                                                                 kotlinRangeExpression,
                                                                                                                 kotlinRealLiteral,
                                                                                                                 kotlinSimpleIdentifier,
                                                                                                                 kotlinSpreadExpression,
                                                                                                                 kotlinStatements,
                                                                                                                 kotlinSuperExpression,
                                                                                                                 kotlinThisExpression,
                                                                                                                 kotlinTryExpression,
                                                                                                                 kotlinUnsignedLiteral,
                                                                                                                 kotlinWhenExpression
                                                                                                               }
                                                                             tmp[kotlinSetter] = {
                                                                                                   kotlinFunctionBody,
                                                                                                   kotlinFunctionType,
                                                                                                   kotlinNullableType,
                                                                                                   kotlinParameterWithOptionalType,
                                                                                                   kotlinParenthesizedType,
                                                                                                   kotlinTypeModifiers,
                                                                                                   kotlinUserType
                                                                                                 }
                                                                             tmp[kotlinSourceFile] = {
                                                                                                       kotlinAdditiveExpression,
                                                                                                       kotlinAnnotation,
                                                                                                       kotlinAnonymousFunction,
                                                                                                       kotlinAsExpression,
                                                                                                       kotlinAssignment,
                                                                                                       kotlinBinLiteral,
                                                                                                       kotlinBooleanLiteral,
                                                                                                       kotlinCallExpression,
                                                                                                       kotlinCallableReference,
                                                                                                       kotlinCharacterLiteral,
                                                                                                       kotlinCheckExpression,
                                                                                                       kotlinClassDeclaration,
                                                                                                       kotlinCollectionLiteral,
                                                                                                       kotlinComparisonExpression,
                                                                                                       kotlinConjunctionExpression,
                                                                                                       kotlinDisjunctionExpression,
                                                                                                       kotlinDoWhileStatement,
                                                                                                       kotlinElvisExpression,
                                                                                                       kotlinEqualityExpression,
                                                                                                       kotlinFileAnnotation,
                                                                                                       kotlinForStatement,
                                                                                                       kotlinFunctionDeclaration,
                                                                                                       kotlinHexLiteral,
                                                                                                       kotlinIfExpression,
                                                                                                       kotlinImportHeader,
                                                                                                       kotlinIndexingExpression,
                                                                                                       kotlinInfixExpression,
                                                                                                       kotlinIntegerLiteral,
                                                                                                       kotlinJumpExpression,
                                                                                                       kotlinLabel,
                                                                                                       kotlinLambdaLiteral,
                                                                                                       kotlinLineStringLiteral,
                                                                                                       kotlinLongLiteral,
                                                                                                       kotlinMultiLineStringLiteral,
                                                                                                       kotlinMultiplicativeExpression,
                                                                                                       kotlinNavigationExpression,
                                                                                                       kotlinObjectDeclaration,
                                                                                                       kotlinObjectLiteral,
                                                                                                       kotlinPackageHeader,
                                                                                                       kotlinParenthesizedExpression,
                                                                                                       kotlinPostfixExpression,
                                                                                                       kotlinPrefixExpression,
                                                                                                       kotlinPropertyDeclaration,
                                                                                                       kotlinRangeExpression,
                                                                                                       kotlinRealLiteral,
                                                                                                       kotlinShebangLine,
                                                                                                       kotlinSimpleIdentifier,
                                                                                                       kotlinSpreadExpression,
                                                                                                       kotlinSuperExpression,
                                                                                                       kotlinThisExpression,
                                                                                                       kotlinTryExpression,
                                                                                                       kotlinTypeAlias,
                                                                                                       kotlinUnsignedLiteral,
                                                                                                       kotlinWhenExpression,
                                                                                                       kotlinWhileStatement
                                                                                                     }
                                                                             tmp[kotlinSpreadExpression] = {
                                                                                                             kotlinAdditiveExpression,
                                                                                                             kotlinAnonymousFunction,
                                                                                                             kotlinAsExpression,
                                                                                                             kotlinBinLiteral,
                                                                                                             kotlinBooleanLiteral,
                                                                                                             kotlinCallExpression,
                                                                                                             kotlinCallableReference,
                                                                                                             kotlinCharacterLiteral,
                                                                                                             kotlinCheckExpression,
                                                                                                             kotlinCollectionLiteral,
                                                                                                             kotlinComparisonExpression,
                                                                                                             kotlinConjunctionExpression,
                                                                                                             kotlinDisjunctionExpression,
                                                                                                             kotlinElvisExpression,
                                                                                                             kotlinEqualityExpression,
                                                                                                             kotlinHexLiteral,
                                                                                                             kotlinIfExpression,
                                                                                                             kotlinIndexingExpression,
                                                                                                             kotlinInfixExpression,
                                                                                                             kotlinIntegerLiteral,
                                                                                                             kotlinJumpExpression,
                                                                                                             kotlinLambdaLiteral,
                                                                                                             kotlinLineStringLiteral,
                                                                                                             kotlinLongLiteral,
                                                                                                             kotlinMultiLineStringLiteral,
                                                                                                             kotlinMultiplicativeExpression,
                                                                                                             kotlinNavigationExpression,
                                                                                                             kotlinObjectLiteral,
                                                                                                             kotlinParenthesizedExpression,
                                                                                                             kotlinPostfixExpression,
                                                                                                             kotlinPrefixExpression,
                                                                                                             kotlinRangeExpression,
                                                                                                             kotlinRealLiteral,
                                                                                                             kotlinSimpleIdentifier,
                                                                                                             kotlinSpreadExpression,
                                                                                                             kotlinSuperExpression,
                                                                                                             kotlinThisExpression,
                                                                                                             kotlinTryExpression,
                                                                                                             kotlinUnsignedLiteral,
                                                                                                             kotlinWhenExpression
                                                                                                           }
                                                                             tmp[kotlinStatements] = {
                                                                                                       kotlinAdditiveExpression,
                                                                                                       kotlinAnnotation,
                                                                                                       kotlinAnonymousFunction,
                                                                                                       kotlinAsExpression,
                                                                                                       kotlinAssignment,
                                                                                                       kotlinBinLiteral,
                                                                                                       kotlinBooleanLiteral,
                                                                                                       kotlinCallExpression,
                                                                                                       kotlinCallableReference,
                                                                                                       kotlinCharacterLiteral,
                                                                                                       kotlinCheckExpression,
                                                                                                       kotlinClassDeclaration,
                                                                                                       kotlinCollectionLiteral,
                                                                                                       kotlinComparisonExpression,
                                                                                                       kotlinConjunctionExpression,
                                                                                                       kotlinDisjunctionExpression,
                                                                                                       kotlinDoWhileStatement,
                                                                                                       kotlinElvisExpression,
                                                                                                       kotlinEqualityExpression,
                                                                                                       kotlinForStatement,
                                                                                                       kotlinFunctionDeclaration,
                                                                                                       kotlinHexLiteral,
                                                                                                       kotlinIfExpression,
                                                                                                       kotlinIndexingExpression,
                                                                                                       kotlinInfixExpression,
                                                                                                       kotlinIntegerLiteral,
                                                                                                       kotlinJumpExpression,
                                                                                                       kotlinLabel,
                                                                                                       kotlinLambdaLiteral,
                                                                                                       kotlinLineStringLiteral,
                                                                                                       kotlinLongLiteral,
                                                                                                       kotlinMultiLineStringLiteral,
                                                                                                       kotlinMultiplicativeExpression,
                                                                                                       kotlinNavigationExpression,
                                                                                                       kotlinObjectDeclaration,
                                                                                                       kotlinObjectLiteral,
                                                                                                       kotlinParenthesizedExpression,
                                                                                                       kotlinPostfixExpression,
                                                                                                       kotlinPrefixExpression,
                                                                                                       kotlinPropertyDeclaration,
                                                                                                       kotlinRangeExpression,
                                                                                                       kotlinRealLiteral,
                                                                                                       kotlinSimpleIdentifier,
                                                                                                       kotlinSpreadExpression,
                                                                                                       kotlinSuperExpression,
                                                                                                       kotlinThisExpression,
                                                                                                       kotlinTryExpression,
                                                                                                       kotlinTypeAlias,
                                                                                                       kotlinUnsignedLiteral,
                                                                                                       kotlinWhenExpression,
                                                                                                       kotlinWhileStatement
                                                                                                     }
                                                                             tmp[kotlinTryExpression] = {kotlinCatchBlock, kotlinFinallyBlock, kotlinStatements}
                                                                             tmp[kotlinTypeAlias] = {kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinTypeIdentifier, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinTypeArguments] = {kotlinTypeProjection}
                                                                             tmp[kotlinTypeConstraint] = {
                                                                                                           kotlinAnnotation,
                                                                                                           kotlinFunctionType,
                                                                                                           kotlinNullableType,
                                                                                                           kotlinParenthesizedType,
                                                                                                           kotlinTypeIdentifier,
                                                                                                           kotlinTypeModifiers,
                                                                                                           kotlinUserType
                                                                                                         }
                                                                             tmp[kotlinTypeConstraints] = {kotlinTypeConstraint}
                                                                             tmp[kotlinTypeModifiers] = {kotlinAnnotation}
                                                                             tmp[kotlinTypeParameter] = {
                                                                                                          kotlinFunctionType,
                                                                                                          kotlinNullableType,
                                                                                                          kotlinParenthesizedType,
                                                                                                          kotlinTypeIdentifier,
                                                                                                          kotlinTypeModifiers,
                                                                                                          kotlinTypeParameterModifiers,
                                                                                                          kotlinUserType
                                                                                                        }
                                                                             tmp[kotlinTypeParameterModifiers] = {kotlinAnnotation, kotlinReificationModifier, kotlinVarianceModifier}
                                                                             tmp[kotlinTypeParameters] = {kotlinTypeParameter}
                                                                             tmp[kotlinTypeProjection] = {kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinTypeModifiers, kotlinTypeProjectionModifiers, kotlinUserType}
                                                                             tmp[kotlinTypeProjectionModifiers] = {kotlinVarianceModifier}
                                                                             tmp[kotlinTypeTest] = {
                                                                                                     kotlinAdditiveExpression,
                                                                                                     kotlinAnonymousFunction,
                                                                                                     kotlinAsExpression,
                                                                                                     kotlinBinLiteral,
                                                                                                     kotlinBooleanLiteral,
                                                                                                     kotlinCallExpression,
                                                                                                     kotlinCallableReference,
                                                                                                     kotlinCharacterLiteral,
                                                                                                     kotlinCheckExpression,
                                                                                                     kotlinCollectionLiteral,
                                                                                                     kotlinComparisonExpression,
                                                                                                     kotlinConjunctionExpression,
                                                                                                     kotlinDisjunctionExpression,
                                                                                                     kotlinElvisExpression,
                                                                                                     kotlinEqualityExpression,
                                                                                                     kotlinHexLiteral,
                                                                                                     kotlinIfExpression,
                                                                                                     kotlinIndexingExpression,
                                                                                                     kotlinInfixExpression,
                                                                                                     kotlinIntegerLiteral,
                                                                                                     kotlinJumpExpression,
                                                                                                     kotlinLambdaLiteral,
                                                                                                     kotlinLineStringLiteral,
                                                                                                     kotlinLongLiteral,
                                                                                                     kotlinMultiLineStringLiteral,
                                                                                                     kotlinMultiplicativeExpression,
                                                                                                     kotlinNavigationExpression,
                                                                                                     kotlinObjectLiteral,
                                                                                                     kotlinParenthesizedExpression,
                                                                                                     kotlinPostfixExpression,
                                                                                                     kotlinPrefixExpression,
                                                                                                     kotlinRangeExpression,
                                                                                                     kotlinRealLiteral,
                                                                                                     kotlinSimpleIdentifier,
                                                                                                     kotlinSpreadExpression,
                                                                                                     kotlinSuperExpression,
                                                                                                     kotlinThisExpression,
                                                                                                     kotlinTryExpression,
                                                                                                     kotlinUnsignedLiteral,
                                                                                                     kotlinWhenExpression
                                                                                                   }
                                                                             tmp[kotlinUnsignedLiteral] = {kotlinBinLiteral, kotlinHexLiteral, kotlinIntegerLiteral}
                                                                             tmp[kotlinUserType] = {kotlinTypeArguments, kotlinTypeIdentifier}
                                                                             tmp[kotlinValueArgument] = {
                                                                                                          kotlinAdditiveExpression,
                                                                                                          kotlinAnnotation,
                                                                                                          kotlinAnonymousFunction,
                                                                                                          kotlinAsExpression,
                                                                                                          kotlinBinLiteral,
                                                                                                          kotlinBooleanLiteral,
                                                                                                          kotlinCallExpression,
                                                                                                          kotlinCallableReference,
                                                                                                          kotlinCharacterLiteral,
                                                                                                          kotlinCheckExpression,
                                                                                                          kotlinCollectionLiteral,
                                                                                                          kotlinComparisonExpression,
                                                                                                          kotlinConjunctionExpression,
                                                                                                          kotlinDisjunctionExpression,
                                                                                                          kotlinElvisExpression,
                                                                                                          kotlinEqualityExpression,
                                                                                                          kotlinHexLiteral,
                                                                                                          kotlinIfExpression,
                                                                                                          kotlinIndexingExpression,
                                                                                                          kotlinInfixExpression,
                                                                                                          kotlinIntegerLiteral,
                                                                                                          kotlinJumpExpression,
                                                                                                          kotlinLambdaLiteral,
                                                                                                          kotlinLineStringLiteral,
                                                                                                          kotlinLongLiteral,
                                                                                                          kotlinMultiLineStringLiteral,
                                                                                                          kotlinMultiplicativeExpression,
                                                                                                          kotlinNavigationExpression,
                                                                                                          kotlinObjectLiteral,
                                                                                                          kotlinParenthesizedExpression,
                                                                                                          kotlinPostfixExpression,
                                                                                                          kotlinPrefixExpression,
                                                                                                          kotlinRangeExpression,
                                                                                                          kotlinRealLiteral,
                                                                                                          kotlinSimpleIdentifier,
                                                                                                          kotlinSpreadExpression,
                                                                                                          kotlinSuperExpression,
                                                                                                          kotlinThisExpression,
                                                                                                          kotlinTryExpression,
                                                                                                          kotlinUnsignedLiteral,
                                                                                                          kotlinWhenExpression
                                                                                                        }
                                                                             tmp[kotlinValueArguments] = {kotlinValueArgument}
                                                                             tmp[kotlinVariableDeclaration] = {kotlinFunctionType, kotlinNullableType, kotlinParenthesizedType, kotlinSimpleIdentifier, kotlinTypeModifiers, kotlinUserType}
                                                                             tmp[kotlinWhenCondition] = {
                                                                                                          kotlinAdditiveExpression,
                                                                                                          kotlinAnonymousFunction,
                                                                                                          kotlinAsExpression,
                                                                                                          kotlinBinLiteral,
                                                                                                          kotlinBooleanLiteral,
                                                                                                          kotlinCallExpression,
                                                                                                          kotlinCallableReference,
                                                                                                          kotlinCharacterLiteral,
                                                                                                          kotlinCheckExpression,
                                                                                                          kotlinCollectionLiteral,
                                                                                                          kotlinComparisonExpression,
                                                                                                          kotlinConjunctionExpression,
                                                                                                          kotlinDisjunctionExpression,
                                                                                                          kotlinElvisExpression,
                                                                                                          kotlinEqualityExpression,
                                                                                                          kotlinHexLiteral,
                                                                                                          kotlinIfExpression,
                                                                                                          kotlinIndexingExpression,
                                                                                                          kotlinInfixExpression,
                                                                                                          kotlinIntegerLiteral,
                                                                                                          kotlinJumpExpression,
                                                                                                          kotlinLambdaLiteral,
                                                                                                          kotlinLineStringLiteral,
                                                                                                          kotlinLongLiteral,
                                                                                                          kotlinMultiLineStringLiteral,
                                                                                                          kotlinMultiplicativeExpression,
                                                                                                          kotlinNavigationExpression,
                                                                                                          kotlinObjectLiteral,
                                                                                                          kotlinParenthesizedExpression,
                                                                                                          kotlinPostfixExpression,
                                                                                                          kotlinPrefixExpression,
                                                                                                          kotlinRangeExpression,
                                                                                                          kotlinRangeTest,
                                                                                                          kotlinRealLiteral,
                                                                                                          kotlinSimpleIdentifier,
                                                                                                          kotlinSpreadExpression,
                                                                                                          kotlinSuperExpression,
                                                                                                          kotlinThisExpression,
                                                                                                          kotlinTryExpression,
                                                                                                          kotlinTypeTest,
                                                                                                          kotlinUnsignedLiteral,
                                                                                                          kotlinWhenExpression
                                                                                                        }
                                                                             tmp[kotlinWhenEntry] = {kotlinControlStructureBody, kotlinWhenCondition}
                                                                             tmp[kotlinWhenExpression] = {kotlinWhenEntry, kotlinWhenSubject}
                                                                             tmp[kotlinWhenSubject] = {
                                                                                                        kotlinAdditiveExpression,
                                                                                                        kotlinAnnotation,
                                                                                                        kotlinAnonymousFunction,
                                                                                                        kotlinAsExpression,
                                                                                                        kotlinBinLiteral,
                                                                                                        kotlinBooleanLiteral,
                                                                                                        kotlinCallExpression,
                                                                                                        kotlinCallableReference,
                                                                                                        kotlinCharacterLiteral,
                                                                                                        kotlinCheckExpression,
                                                                                                        kotlinCollectionLiteral,
                                                                                                        kotlinComparisonExpression,
                                                                                                        kotlinConjunctionExpression,
                                                                                                        kotlinDisjunctionExpression,
                                                                                                        kotlinElvisExpression,
                                                                                                        kotlinEqualityExpression,
                                                                                                        kotlinHexLiteral,
                                                                                                        kotlinIfExpression,
                                                                                                        kotlinIndexingExpression,
                                                                                                        kotlinInfixExpression,
                                                                                                        kotlinIntegerLiteral,
                                                                                                        kotlinJumpExpression,
                                                                                                        kotlinLambdaLiteral,
                                                                                                        kotlinLineStringLiteral,
                                                                                                        kotlinLongLiteral,
                                                                                                        kotlinMultiLineStringLiteral,
                                                                                                        kotlinMultiplicativeExpression,
                                                                                                        kotlinNavigationExpression,
                                                                                                        kotlinObjectLiteral,
                                                                                                        kotlinParenthesizedExpression,
                                                                                                        kotlinPostfixExpression,
                                                                                                        kotlinPrefixExpression,
                                                                                                        kotlinRangeExpression,
                                                                                                        kotlinRealLiteral,
                                                                                                        kotlinSimpleIdentifier,
                                                                                                        kotlinSpreadExpression,
                                                                                                        kotlinSuperExpression,
                                                                                                        kotlinThisExpression,
                                                                                                        kotlinTryExpression,
                                                                                                        kotlinUnsignedLiteral,
                                                                                                        kotlinVariableDeclaration,
                                                                                                        kotlinWhenExpression
                                                                                                      }
                                                                             tmp[kotlinWhileStatement] = {
                                                                                                           kotlinAdditiveExpression,
                                                                                                           kotlinAnonymousFunction,
                                                                                                           kotlinAsExpression,
                                                                                                           kotlinBinLiteral,
                                                                                                           kotlinBooleanLiteral,
                                                                                                           kotlinCallExpression,
                                                                                                           kotlinCallableReference,
                                                                                                           kotlinCharacterLiteral,
                                                                                                           kotlinCheckExpression,
                                                                                                           kotlinCollectionLiteral,
                                                                                                           kotlinComparisonExpression,
                                                                                                           kotlinConjunctionExpression,
                                                                                                           kotlinControlStructureBody,
                                                                                                           kotlinDisjunctionExpression,
                                                                                                           kotlinElvisExpression,
                                                                                                           kotlinEqualityExpression,
                                                                                                           kotlinHexLiteral,
                                                                                                           kotlinIfExpression,
                                                                                                           kotlinIndexingExpression,
                                                                                                           kotlinInfixExpression,
                                                                                                           kotlinIntegerLiteral,
                                                                                                           kotlinJumpExpression,
                                                                                                           kotlinLambdaLiteral,
                                                                                                           kotlinLineStringLiteral,
                                                                                                           kotlinLongLiteral,
                                                                                                           kotlinMultiLineStringLiteral,
                                                                                                           kotlinMultiplicativeExpression,
                                                                                                           kotlinNavigationExpression,
                                                                                                           kotlinObjectLiteral,
                                                                                                           kotlinParenthesizedExpression,
                                                                                                           kotlinPostfixExpression,
                                                                                                           kotlinPrefixExpression,
                                                                                                           kotlinRangeExpression,
                                                                                                           kotlinRealLiteral,
                                                                                                           kotlinSimpleIdentifier,
                                                                                                           kotlinSpreadExpression,
                                                                                                           kotlinSuperExpression,
                                                                                                           kotlinThisExpression,
                                                                                                           kotlinTryExpression,
                                                                                                           kotlinUnsignedLiteral,
                                                                                                           kotlinWhenExpression
                                                                                                         }
                                                                             tmp
const kotlinTokenKinds*: set[KotlinNodeKind] = {
                                                 kotlinExclamationTok,
                                                 kotlinDoubleExclamationTok,
                                                 kotlinExclamationEqualTok,
                                                 kotlinExclamationDoubleEqualTok,
                                                 kotlinExclamationinTok,
                                                 kotlinQuoteTok,
                                                 kotlinTripleQuoteTok,
                                                 kotlinHashExclamationTok,
                                                 kotlinDollarTok,
                                                 kotlinDollarLCurlyTok,
                                                 kotlinPercentTok,
                                                 kotlinPercentEqualTok,
                                                 kotlinDoubleAmpersandTok,
                                                 kotlinApostropheTok,
                                                 kotlinLParTok,
                                                 kotlinRParTok,
                                                 kotlinAsteriskTok,
                                                 kotlinAsteriskEqualTok,
                                                 kotlinPlusTok,
                                                 kotlinDoublePlusTok,
                                                 kotlinPlusEqualTok,
                                                 kotlinCommaTok,
                                                 kotlinMinusTok,
                                                 kotlinDoubleMinusTok,
                                                 kotlinMinusEqualTok,
                                                 kotlinMinusGreaterThanTok,
                                                 kotlinDotTok,
                                                 kotlinDotAsteriskTok,
                                                 kotlinDoubleDotTok,
                                                 kotlinSlashTok,
                                                 kotlinSlashEqualTok,
                                                 kotlinColonTok,
                                                 kotlinDoubleColonTok,
                                                 kotlinSemicolonTok,
                                                 kotlinLessThanTok,
                                                 kotlinLessThanEqualTok,
                                                 kotlinEqualTok,
                                                 kotlinDoubleEqualTok,
                                                 kotlinTripleEqualTok,
                                                 kotlinGreaterThanTok,
                                                 kotlinGreaterThanEqualTok,
                                                 kotlinQuestionColonTok,
                                                 kotlinAtTok,
                                                 kotlinLTok,
                                                 kotlinLBrackTok,
                                                 kotlinBackslashTok,
                                                 kotlinRBrackTok,
                                                 kotlinAbstractTok,
                                                 kotlinActualTok,
                                                 kotlinAnnotationTok,
                                                 kotlinAsTok,
                                                 kotlinAsQuestionTok,
                                                 kotlinBreakTok,
                                                 kotlinBreakAtTok,
                                                 kotlinByTok,
                                                 kotlinCatchTok,
                                                 kotlinClassTok,
                                                 kotlinCompanionTok,
                                                 kotlinConstructorTok,
                                                 kotlinContinueTok,
                                                 kotlinContinueAtTok,
                                                 kotlinCrossinlineTok,
                                                 kotlinDataTok,
                                                 kotlinDelegateTok,
                                                 kotlinDoTok,
                                                 kotlinDynamicTok,
                                                 kotlinElseTok,
                                                 kotlinEnumTok,
                                                 kotlinExpectTok,
                                                 kotlinExternalTok,
                                                 kotlinFalseTok,
                                                 kotlinFieldTok,
                                                 kotlinFileTok,
                                                 kotlinFinalTok,
                                                 kotlinFinallyTok,
                                                 kotlinForTok,
                                                 kotlinFunTok,
                                                 kotlinGetTok,
                                                 kotlinIfTok,
                                                 kotlinImportTok,
                                                 kotlinInTok,
                                                 kotlinInfixTok,
                                                 kotlinInitTok,
                                                 kotlinInlineTok,
                                                 kotlinInnerTok,
                                                 kotlinInterfaceTok,
                                                 kotlinInternalTok,
                                                 kotlinIsTok,
                                                 kotlinLateinitTok,
                                                 kotlinNoinlineTok,
                                                 kotlinNullTok,
                                                 kotlinObjectTok,
                                                 kotlinOpenTok,
                                                 kotlinOperatorTok,
                                                 kotlinOutTok,
                                                 kotlinOverrideTok,
                                                 kotlinPackageTok,
                                                 kotlinParamTok,
                                                 kotlinPrivateTok,
                                                 kotlinPropertyTok,
                                                 kotlinProtectedTok,
                                                 kotlinPublicTok,
                                                 kotlinReceiverTok,
                                                 kotlinReturnTok,
                                                 kotlinReturnAtTok,
                                                 kotlinSealedTok,
                                                 kotlinSetTok,
                                                 kotlinSetparamTok,
                                                 kotlinSuperTok,
                                                 kotlinSuperAtTok,
                                                 kotlinSuspendTok,
                                                 kotlinTailrecTok,
                                                 kotlinThisTok,
                                                 kotlinThisAtTok,
                                                 kotlinThrowTok,
                                                 kotlinTrueTok,
                                                 kotlinTryTok,
                                                 kotlinTypealiasTok,
                                                 kotlinUTok,
                                                 kotlinValTok,
                                                 kotlinVarTok,
                                                 kotlinVarargTok,
                                                 kotlinWhenTok,
                                                 kotlinWhereTok,
                                                 kotlinWhileTok,
                                                 kotlinLCurlyTok,
                                                 kotlinDoublePipeTok,
                                                 kotlinRCurlyTok
                                               }
const kotlinHiddenKinds*: set[KotlinNodeKind] = {
                                                  kotlinHidMultiplicativeOperator,
                                                  kotlinHidPostfixUnarySuffix,
                                                  kotlinHidReturnAt,
                                                  kotlinParametersWithOptionalType,
                                                  kotlinHidInOperator,
                                                  kotlinHidTypeProjectionModifier,
                                                  kotlinHidMultiLineStringContent,
                                                  kotlinHidLexicalIdentifier,
                                                  kotlinHidType,
                                                  kotlinHidNotIn,
                                                  kotlinHidEqualityOperator,
                                                  kotlinHidExpression,
                                                  kotlinHidUniCharacterLiteral,
                                                  kotlinHidSimpleUserType,
                                                  kotlinHidLiteralConstant,
                                                  kotlinHidTypeParameterModifier,
                                                  kotlinHidIsOperator,
                                                  kotlinHidAnnotatedDelegationSpecifier,
                                                  kotlinHidBacktickIdentifier,
                                                  kotlinHidPrimaryExpression,
                                                  kotlinHidPostfixUnaryOperator,
                                                  kotlinHidStringLiteral,
                                                  kotlinHidPrefixUnaryOperator,
                                                  kotlinHidSafeNav,
                                                  kotlinHidModifier,
                                                  kotlinHidFunctionValueParameters,
                                                  kotlinHidPostfixUnaryExpression,
                                                  kotlinHidUnescapedAnnotation,
                                                  kotlinHidEscapeSeq,
                                                  kotlinHidUnaryExpression,
                                                  kotlinHidLineStrEscapedChar,
                                                  kotlinHidContinueAt,
                                                  kotlinHidTypeModifier,
                                                  kotlinTopLevelObject,
                                                  kotlinHidLambdaParameter,
                                                  kotlinHidClassMemberDeclaration,
                                                  kotlinHidThisAt,
                                                  kotlinHidAlphaIdentifier,
                                                  kotlinHidBlock,
                                                  kotlinHidFunctionLiteral,
                                                  kotlinHidEscapedIdentifier,
                                                  kotlinHidLoopStatement,
                                                  kotlinHidAdditiveOperator,
                                                  kotlinHidNotIs,
                                                  kotlinHidAssignmentAndOperator,
                                                  kotlinHidAsOperator,
                                                  kotlinHidStatement,
                                                  kotlinLineStringExpression,
                                                  kotlinHidQuest,
                                                  kotlinHidBreakAt,
                                                  kotlinHidMultiLineStrText,
                                                  kotlinHidBinaryExpression,
                                                  kotlinHidEnumEntries,
                                                  kotlinHidDelegationSpecifiers,
                                                  kotlinHidLineStringContent,
                                                  kotlinHidLineStrText,
                                                  kotlinHidComparisonOperator,
                                                  kotlinHidDeclaration,
                                                  kotlinHidSemi,
                                                  kotlinHidTypeReference,
                                                  kotlinHidSemis,
                                                  kotlinHidMemberAccessOperator,
                                                  kotlinHidFunctionValueParameter,
                                                  kotlinHidSuperAt,
                                                  kotlinHidClassParameters,
                                                  kotlinHidSingleAnnotation,
                                                  kotlinHidIndexingSuffix,
                                                  kotlinHidInterpolation,
                                                  kotlinHidClassMemberDeclarations,
                                                  kotlinHidMultiAnnotation
                                                }
proc tsNodeType*(node: TsKotlinNode): string


proc kind*(node: TsKotlinNode): KotlinNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "additive_expression":            kotlinAdditiveExpression
      of "annotated_lambda":               kotlinAnnotatedLambda
      of "annotation":                     kotlinAnnotation
      of "anonymous_function":             kotlinAnonymousFunction
      of "anonymous_initializer":          kotlinAnonymousInitializer
      of "as_expression":                  kotlinAsExpression
      of "assignment":                     kotlinAssignment
      of "boolean_literal":                kotlinBooleanLiteral
      of "call_expression":                kotlinCallExpression
      of "call_suffix":                    kotlinCallSuffix
      of "callable_reference":             kotlinCallableReference
      of "catch_block":                    kotlinCatchBlock
      of "character_literal":              kotlinCharacterLiteral
      of "check_expression":               kotlinCheckExpression
      of "class_body":                     kotlinClassBody
      of "class_declaration":              kotlinClassDeclaration
      of "class_modifier":                 kotlinClassModifier
      of "class_parameter":                kotlinClassParameter
      of "collection_literal":             kotlinCollectionLiteral
      of "companion_object":               kotlinCompanionObject
      of "comparison_expression":          kotlinComparisonExpression
      of "conjunction_expression":         kotlinConjunctionExpression
      of "constructor_delegation_call":    kotlinConstructorDelegationCall
      of "constructor_invocation":         kotlinConstructorInvocation
      of "control_structure_body":         kotlinControlStructureBody
      of "delegation_specifier":           kotlinDelegationSpecifier
      of "directly_assignable_expression": kotlinDirectlyAssignableExpression
      of "disjunction_expression":         kotlinDisjunctionExpression
      of "do_while_statement":             kotlinDoWhileStatement
      of "elvis_expression":               kotlinElvisExpression
      of "enum_class_body":                kotlinEnumClassBody
      of "enum_entry":                     kotlinEnumEntry
      of "equality_expression":            kotlinEqualityExpression
      of "explicit_delegation":            kotlinExplicitDelegation
      of "file_annotation":                kotlinFileAnnotation
      of "finally_block":                  kotlinFinallyBlock
      of "for_statement":                  kotlinForStatement
      of "function_body":                  kotlinFunctionBody
      of "function_declaration":           kotlinFunctionDeclaration
      of "function_modifier":              kotlinFunctionModifier
      of "function_type":                  kotlinFunctionType
      of "function_type_parameters":       kotlinFunctionTypeParameters
      of "getter":                         kotlinGetter
      of "identifier":                     kotlinIdentifier
      of "if_expression":                  kotlinIfExpression
      of "import_alias":                   kotlinImportAlias
      of "import_header":                  kotlinImportHeader
      of "indexing_expression":            kotlinIndexingExpression
      of "indexing_suffix":                kotlinIndexingSuffix
      of "infix_expression":               kotlinInfixExpression
      of "inheritance_modifier":           kotlinInheritanceModifier
      of "interpolated_expression":        kotlinInterpolatedExpression
      of "interpolated_identifier":        kotlinInterpolatedIdentifier
      of "jump_expression":                kotlinJumpExpression
      of "lambda_literal":                 kotlinLambdaLiteral
      of "lambda_parameters":              kotlinLambdaParameters
      of "line_string_literal":            kotlinLineStringLiteral
      of "long_literal":                   kotlinLongLiteral
      of "member_modifier":                kotlinMemberModifier
      of "modifiers":                      kotlinModifiers
      of "multi_line_string_literal":      kotlinMultiLineStringLiteral
      of "multiplicative_expression":      kotlinMultiplicativeExpression
      of "navigation_expression":          kotlinNavigationExpression
      of "navigation_suffix":              kotlinNavigationSuffix
      of "nullable_type":                  kotlinNullableType
      of "object_declaration":             kotlinObjectDeclaration
      of "object_literal":                 kotlinObjectLiteral
      of "package_header":                 kotlinPackageHeader
      of "parameter":                      kotlinParameter
      of "parameter_modifier":             kotlinParameterModifier
      of "parameter_modifiers":            kotlinParameterModifiers
      of "parameter_with_optional_type":   kotlinParameterWithOptionalType
      of "parenthesized_expression":       kotlinParenthesizedExpression
      of "parenthesized_type":             kotlinParenthesizedType
      of "parenthesized_user_type":        kotlinParenthesizedUserType
      of "platform_modifier":              kotlinPlatformModifier
      of "postfix_expression":             kotlinPostfixExpression
      of "prefix_expression":              kotlinPrefixExpression
      of "primary_constructor":            kotlinPrimaryConstructor
      of "property_declaration":           kotlinPropertyDeclaration
      of "property_delegate":              kotlinPropertyDelegate
      of "range_expression":               kotlinRangeExpression
      of "range_test":                     kotlinRangeTest
      of "secondary_constructor":          kotlinSecondaryConstructor
      of "setter":                         kotlinSetter
      of "shebang_line":                   kotlinShebangLine
      of "simple_identifier":              kotlinSimpleIdentifier
      of "source_file":                    kotlinSourceFile
      of "spread_expression":              kotlinSpreadExpression
      of "statements":                     kotlinStatements
      of "super_expression":               kotlinSuperExpression
      of "this_expression":                kotlinThisExpression
      of "try_expression":                 kotlinTryExpression
      of "type_alias":                     kotlinTypeAlias
      of "type_arguments":                 kotlinTypeArguments
      of "type_constraint":                kotlinTypeConstraint
      of "type_constraints":               kotlinTypeConstraints
      of "type_identifier":                kotlinTypeIdentifier
      of "type_modifiers":                 kotlinTypeModifiers
      of "type_parameter":                 kotlinTypeParameter
      of "type_parameter_modifiers":       kotlinTypeParameterModifiers
      of "type_parameters":                kotlinTypeParameters
      of "type_projection":                kotlinTypeProjection
      of "type_projection_modifiers":      kotlinTypeProjectionModifiers
      of "type_test":                      kotlinTypeTest
      of "unsigned_literal":               kotlinUnsignedLiteral
      of "use_site_target":                kotlinUseSiteTarget
      of "user_type":                      kotlinUserType
      of "value_argument":                 kotlinValueArgument
      of "value_arguments":                kotlinValueArguments
      of "variable_declaration":           kotlinVariableDeclaration
      of "variance_modifier":              kotlinVarianceModifier
      of "visibility_modifier":            kotlinVisibilityModifier
      of "when_condition":                 kotlinWhenCondition
      of "when_entry":                     kotlinWhenEntry
      of "when_expression":                kotlinWhenExpression
      of "when_subject":                   kotlinWhenSubject
      of "while_statement":                kotlinWhileStatement
      of "!":                              kotlinExclamationTok
      of "!!":                             kotlinDoubleExclamationTok
      of "!=":                             kotlinExclamationEqualTok
      of "!==":                            kotlinExclamationDoubleEqualTok
      of "!in":                            kotlinExclamationinTok
      of "\"":                             kotlinQuoteTok
      of "\"\"\"":                         kotlinTripleQuoteTok
      of "#!":                             kotlinHashExclamationTok
      of "$":                              kotlinDollarTok
      of "${":                             kotlinDollarLCurlyTok
      of "%":                              kotlinPercentTok
      of "%=":                             kotlinPercentEqualTok
      of "&&":                             kotlinDoubleAmpersandTok
      of "\'":                             kotlinApostropheTok
      of "(":                              kotlinLParTok
      of ")":                              kotlinRParTok
      of "*":                              kotlinAsteriskTok
      of "*=":                             kotlinAsteriskEqualTok
      of "+":                              kotlinPlusTok
      of "++":                             kotlinDoublePlusTok
      of "+=":                             kotlinPlusEqualTok
      of ",":                              kotlinCommaTok
      of "-":                              kotlinMinusTok
      of "--":                             kotlinDoubleMinusTok
      of "-=":                             kotlinMinusEqualTok
      of "->":                             kotlinMinusGreaterThanTok
      of ".":                              kotlinDotTok
      of ".*":                             kotlinDotAsteriskTok
      of "..":                             kotlinDoubleDotTok
      of "/":                              kotlinSlashTok
      of "/=":                             kotlinSlashEqualTok
      of ":":                              kotlinColonTok
      of "::":                             kotlinDoubleColonTok
      of ";":                              kotlinSemicolonTok
      of "<":                              kotlinLessThanTok
      of "<=":                             kotlinLessThanEqualTok
      of "=":                              kotlinEqualTok
      of "==":                             kotlinDoubleEqualTok
      of "===":                            kotlinTripleEqualTok
      of ">":                              kotlinGreaterThanTok
      of ">=":                             kotlinGreaterThanEqualTok
      of "?:":                             kotlinQuestionColonTok
      of "@":                              kotlinAtTok
      of "L":                              kotlinLTok
      of "[":                              kotlinLBrackTok
      of "\\":                             kotlinBackslashTok
      of "]":                              kotlinRBrackTok
      of "abstract":                       kotlinAbstractTok
      of "actual":                         kotlinActualTok
      of "as":                             kotlinAsTok
      of "as?":                            kotlinAsQuestionTok
      of "bin_literal":                    kotlinBinLiteral
      of "break":                          kotlinBreakTok
      of "break@":                         kotlinBreakAtTok
      of "by":                             kotlinByTok
      of "catch":                          kotlinCatchTok
      of "class":                          kotlinClassTok
      of "comment":                        kotlinComment
      of "companion":                      kotlinCompanionTok
      of "constructor":                    kotlinConstructorTok
      of "continue":                       kotlinContinueTok
      of "continue@":                      kotlinContinueAtTok
      of "crossinline":                    kotlinCrossinlineTok
      of "data":                           kotlinDataTok
      of "delegate":                       kotlinDelegateTok
      of "do":                             kotlinDoTok
      of "dynamic":                        kotlinDynamicTok
      of "else":                           kotlinElseTok
      of "enum":                           kotlinEnumTok
      of "expect":                         kotlinExpectTok
      of "external":                       kotlinExternalTok
      of "false":                          kotlinFalseTok
      of "field":                          kotlinFieldTok
      of "file":                           kotlinFileTok
      of "final":                          kotlinFinalTok
      of "finally":                        kotlinFinallyTok
      of "for":                            kotlinForTok
      of "fun":                            kotlinFunTok
      of "get":                            kotlinGetTok
      of "hex_literal":                    kotlinHexLiteral
      of "if":                             kotlinIfTok
      of "import":                         kotlinImportTok
      of "in":                             kotlinInTok
      of "infix":                          kotlinInfixTok
      of "init":                           kotlinInitTok
      of "inline":                         kotlinInlineTok
      of "inner":                          kotlinInnerTok
      of "integer_literal":                kotlinIntegerLiteral
      of "interface":                      kotlinInterfaceTok
      of "internal":                       kotlinInternalTok
      of "is":                             kotlinIsTok
      of "label":                          kotlinLabel
      of "lateinit":                       kotlinLateinitTok
      of "noinline":                       kotlinNoinlineTok
      of "null":                           kotlinNullTok
      of "object":                         kotlinObjectTok
      of "open":                           kotlinOpenTok
      of "operator":                       kotlinOperatorTok
      of "out":                            kotlinOutTok
      of "override":                       kotlinOverrideTok
      of "package":                        kotlinPackageTok
      of "param":                          kotlinParamTok
      of "private":                        kotlinPrivateTok
      of "property":                       kotlinPropertyTok
      of "property_modifier":              kotlinPropertyModifier
      of "protected":                      kotlinProtectedTok
      of "public":                         kotlinPublicTok
      of "real_literal":                   kotlinRealLiteral
      of "receiver":                       kotlinReceiverTok
      of "reification_modifier":           kotlinReificationModifier
      of "return":                         kotlinReturnTok
      of "return@":                        kotlinReturnAtTok
      of "sealed":                         kotlinSealedTok
      of "set":                            kotlinSetTok
      of "setparam":                       kotlinSetparamTok
      of "super":                          kotlinSuperTok
      of "super@":                         kotlinSuperAtTok
      of "suspend":                        kotlinSuspendTok
      of "tailrec":                        kotlinTailrecTok
      of "this":                           kotlinThisTok
      of "this@":                          kotlinThisAtTok
      of "throw":                          kotlinThrowTok
      of "true":                           kotlinTrueTok
      of "try":                            kotlinTryTok
      of "typealias":                      kotlinTypealiasTok
      of "u":                              kotlinUTok
      of "val":                            kotlinValTok
      of "var":                            kotlinVarTok
      of "vararg":                         kotlinVarargTok
      of "when":                           kotlinWhenTok
      of "where":                          kotlinWhereTok
      of "while":                          kotlinWhileTok
      of "{":                              kotlinLCurlyTok
      of "||":                             kotlinDoublePipeTok
      of "}":                              kotlinRCurlyTok
      of "ERROR":                          kotlinSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsKotlinNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsKotlinNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsKotlinNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_kotlin(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsKotlinNode): string =
  $ts_node_type(TSNode(node))

proc newTsKotlinParser*(): KotlinParser =
  result = KotlinParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_kotlin())

proc parseString*(parser: KotlinParser, str: string): TsKotlinNode =
  TsKotlinNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsKotlinString*(str: string): TsKotlinNode =
  let parser = newTsKotlinParser()
  return parseString(parser, str)

func `$`*(node: TsKotlinNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsKotlinNode, str: string): string =
  var res = addr result
  proc aux(node: TsKotlinNode, level: int) =
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
let kotlinGrammar*: array[KotlinNodeKind, HtsRule[KotlinNodeKind]] = block:
                                                                       var rules: array[KotlinNodeKind, HtsRule[KotlinNodeKind]]
                                                                       type
                                                                         K = KotlinNodeKind


                                                                       rules[kotlinHidPostfixUnarySuffix] = tsChoice[K](tsSymbol[K](kotlinHidPostfixUnaryOperator), tsSymbol[K](kotlinNavigationSuffix), tsSymbol[K](kotlinIndexingSuffix))
                                                                       rules[kotlinTypeParameters] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsSymbol[K](kotlinTypeParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinTypeParameter)))), tsString[K](">"))
                                                                       rules[kotlinHidInOperator] = tsChoice[K](tsString[K]("in"), tsString[K]("!in"))
                                                                       rules[kotlinConstructorDelegationCall] = tsSeq[K](tsChoice[K](tsString[K]("this"), tsString[K]("super")), tsSymbol[K](kotlinValueArguments))
                                                                       rules[kotlinCompanionObject] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsString[K]("companion"), tsString[K]("object"), tsChoice[K](tsSymbol[K](kotlinSimpleIdentifier), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidDelegationSpecifiers)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinClassBody), tsBlank[K]()))
                                                                       rules[kotlinValueArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](kotlinValueArgument), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinValueArgument)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[kotlinTypeParameterModifiers] = tsRepeat1[K](tsSymbol[K](kotlinHidTypeParameterModifier))
                                                                       rules[kotlinBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                       rules[kotlinHidEqualityOperator] = tsChoice[K](tsString[K]("!="), tsString[K]("!=="), tsString[K]("=="), tsString[K]("==="))
                                                                       rules[kotlinForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsRepeat[K](tsSymbol[K](kotlinAnnotation)), tsChoice[K](tsSymbol[K](kotlinVariableDeclaration)), tsString[K]("in"), tsSymbol[K](kotlinHidExpression), tsString[K](")"), tsChoice[K](tsSymbol[K](kotlinControlStructureBody), tsBlank[K]()))
                                                                       rules[kotlinHidLiteralConstant] = tsChoice[K](tsSymbol[K](kotlinBooleanLiteral), tsSymbol[K](kotlinIntegerLiteral), tsSymbol[K](kotlinHexLiteral), tsSymbol[K](kotlinBinLiteral), tsSymbol[K](kotlinCharacterLiteral), tsSymbol[K](kotlinRealLiteral), tsString[K]("null"), tsSymbol[K](kotlinLongLiteral), tsSymbol[K](kotlinUnsignedLiteral))
                                                                       rules[kotlinConjunctionExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsString[K]("&&"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinControlStructureBody] = tsChoice[K](tsSymbol[K](kotlinHidBlock), tsSymbol[K](kotlinHidStatement))
                                                                       rules[kotlinHidPrimaryExpression] = tsChoice[K](tsSymbol[K](kotlinParenthesizedExpression), tsSymbol[K](kotlinSimpleIdentifier), tsSymbol[K](kotlinHidLiteralConstant), tsSymbol[K](kotlinHidStringLiteral), tsSymbol[K](kotlinCallableReference), tsSymbol[K](kotlinHidFunctionLiteral), tsSymbol[K](kotlinObjectLiteral), tsSymbol[K](kotlinCollectionLiteral), tsSymbol[K](kotlinThisExpression), tsSymbol[K](kotlinSuperExpression), tsSymbol[K](kotlinIfExpression), tsSymbol[K](kotlinWhenExpression), tsSymbol[K](kotlinTryExpression), tsSymbol[K](kotlinJumpExpression))
                                                                       rules[kotlinHidSafeNav] = tsString[K]("?.")
                                                                       rules[kotlinEnumClassBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](kotlinHidEnumEntries), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](";"), tsChoice[K](tsSymbol[K](kotlinHidClassMemberDeclarations), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[kotlinLineStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsSymbol[K](kotlinHidLineStringContent), tsSymbol[K](kotlinHidInterpolation))), tsString[K]("\""))
                                                                       rules[kotlinHidUnescapedAnnotation] = tsChoice[K](tsSymbol[K](kotlinConstructorInvocation), tsSymbol[K](kotlinUserType))
                                                                       rules[kotlinHidEscapeSeq] = tsChoice[K](tsSymbol[K](kotlinHidUniCharacterLiteral), tsSymbol[K](kotlinHidEscapedIdentifier))
                                                                       rules[kotlinAnonymousFunction] = tsSeq[K](tsString[K]("fun"), tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](kotlinHidSimpleUserType), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](kotlinHidSimpleUserType)))), tsString[K](".")), tsBlank[K]()), tsString[K]("("), tsString[K](")"), tsChoice[K](tsSymbol[K](kotlinFunctionBody), tsBlank[K]()))
                                                                       rules[kotlinHidUnaryExpression] = tsChoice[K](tsSymbol[K](kotlinPostfixExpression), tsSymbol[K](kotlinCallExpression), tsSymbol[K](kotlinIndexingExpression), tsSymbol[K](kotlinNavigationExpression), tsSymbol[K](kotlinPrefixExpression), tsSymbol[K](kotlinAsExpression), tsSymbol[K](kotlinSpreadExpression))
                                                                       rules[kotlinFunctionType] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](kotlinHidSimpleUserType), tsString[K](".")), tsBlank[K]()), tsSymbol[K](kotlinFunctionTypeParameters), tsString[K]("->"), tsSymbol[K](kotlinHidType))
                                                                       rules[kotlinHidLambdaParameter] = tsChoice[K](tsSymbol[K](kotlinVariableDeclaration))
                                                                       rules[kotlinSourceFile] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinShebangLine), tsBlank[K]()), tsChoice[K](tsSeq[K](tsRepeat1[K](tsSymbol[K](kotlinFileAnnotation)), tsSymbol[K](kotlinHidSemi)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinPackageHeader), tsBlank[K]()), tsRepeat[K](tsSymbol[K](kotlinImportHeader)), tsRepeat[K](tsSeq[K](tsSymbol[K](kotlinHidStatement), tsSymbol[K](kotlinHidSemi))))
                                                                       rules[kotlinHidThisAt] = tsSeq[K](tsString[K]("this@"), tsSymbol[K](kotlinHidLexicalIdentifier))
                                                                       rules[kotlinLabel] = tsSeq[K](tsRegex[K]("[a-zA-Z_][a-zA-Z_0-9]*"), tsString[K]("@"))
                                                                       rules[kotlinComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                                       rules[kotlinSetter] = tsSeq[K](tsString[K]("set"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](kotlinParameterWithOptionalType), tsString[K](")"), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()), tsSymbol[K](kotlinFunctionBody)), tsBlank[K]()))
                                                                       rules[kotlinIndexingSuffix] = tsSeq[K](tsString[K]("["), tsSeq[K](tsSymbol[K](kotlinHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinHidExpression)))), tsString[K]("]"))
                                                                       rules[kotlinLineStringExpression] = tsSeq[K](tsString[K]("${"), tsSymbol[K](kotlinHidExpression), tsString[K]("}"))
                                                                       rules[kotlinElvisExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsString[K]("?:"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidQuest] = tsString[K]("?")
                                                                       rules[kotlinUserType] = tsSeq[K](tsSymbol[K](kotlinHidSimpleUserType), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](kotlinHidSimpleUserType))))
                                                                       rules[kotlinWhenCondition] = tsChoice[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinRangeTest), tsSymbol[K](kotlinTypeTest))
                                                                       rules[kotlinHidDelegationSpecifiers] = tsSeq[K](tsSymbol[K](kotlinDelegationSpecifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinDelegationSpecifier))))
                                                                       rules[kotlinHidLineStringContent] = tsChoice[K](tsSymbol[K](kotlinHidLineStrText), tsSymbol[K](kotlinHidLineStrEscapedChar))
                                                                       rules[kotlinHidDeclaration] = tsChoice[K](tsSymbol[K](kotlinClassDeclaration), tsSymbol[K](kotlinObjectDeclaration), tsSymbol[K](kotlinFunctionDeclaration), tsSymbol[K](kotlinPropertyDeclaration), tsSymbol[K](kotlinTypeAlias))
                                                                       rules[kotlinHidMemberAccessOperator] = tsChoice[K](tsString[K]("."), tsSymbol[K](kotlinHidSafeNav), tsString[K]("::"))
                                                                       rules[kotlinHidFunctionValueParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinParameterModifiers), tsBlank[K]()), tsSymbol[K](kotlinParameter), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](kotlinHidExpression)), tsBlank[K]()))
                                                                       rules[kotlinTypeParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinTypeParameterModifiers), tsBlank[K]()), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()))
                                                                       rules[kotlinClassModifier] = tsChoice[K](tsString[K]("sealed"), tsString[K]("annotation"), tsString[K]("data"), tsString[K]("inner"))
                                                                       rules[kotlinHidInterpolation] = tsChoice[K](tsSeq[K](tsString[K]("${"), tsSymbol[K](kotlinHidExpression), tsString[K]("}")), tsSeq[K](tsString[K]("$"), tsSymbol[K](kotlinSimpleIdentifier)))
                                                                       rules[kotlinImportHeader] = tsSeq[K](tsString[K]("import"), tsSymbol[K](kotlinIdentifier), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K](".*")), tsSymbol[K](kotlinImportAlias)), tsBlank[K]()), tsSymbol[K](kotlinHidSemi))
                                                                       rules[kotlinHidMultiAnnotation] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](kotlinUseSiteTarget), tsBlank[K]()), tsString[K]("["), tsRepeat1[K](tsSymbol[K](kotlinHidUnescapedAnnotation)), tsString[K]("]"))
                                                                       rules[kotlinEnumEntry] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSymbol[K](kotlinValueArguments), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinClassBody), tsBlank[K]()))
                                                                       rules[kotlinWhenSubject] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsRepeat[K](tsSymbol[K](kotlinAnnotation)), tsString[K]("val"), tsSymbol[K](kotlinVariableDeclaration), tsString[K]("=")), tsBlank[K]()), tsSymbol[K](kotlinHidExpression), tsString[K](")"))
                                                                       rules[kotlinTypeTest] = tsSeq[K](tsSymbol[K](kotlinHidIsOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinCallSuffix] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinTypeArguments), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinValueArguments), tsBlank[K]()), tsSymbol[K](kotlinAnnotatedLambda)), tsSymbol[K](kotlinValueArguments)))
                                                                       rules[kotlinAnonymousInitializer] = tsSeq[K](tsString[K]("init"), tsSymbol[K](kotlinHidBlock))
                                                                       rules[kotlinModifiers] = tsRepeat1[K](tsChoice[K](tsSymbol[K](kotlinAnnotation), tsSymbol[K](kotlinHidModifier)))
                                                                       rules[kotlinPropertyDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsChoice[K](tsString[K]("val"), tsString[K]("var")), tsChoice[K](tsSymbol[K](kotlinTypeParameters), tsBlank[K]()), tsSymbol[K](kotlinVariableDeclaration), tsChoice[K](tsSymbol[K](kotlinTypeConstraints), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](kotlinHidExpression)), tsSymbol[K](kotlinPropertyDelegate)), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](kotlinGetter), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinSetter), tsBlank[K]())))
                                                                       rules[kotlinDisjunctionExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsString[K]("||"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinVarianceModifier] = tsChoice[K](tsString[K]("in"), tsString[K]("out"))
                                                                       rules[kotlinWhenExpression] = tsSeq[K](tsString[K]("when"), tsChoice[K](tsSymbol[K](kotlinWhenSubject), tsBlank[K]()), tsString[K]("{"), tsRepeat[K](tsSymbol[K](kotlinWhenEntry)), tsString[K]("}"))
                                                                       rules[kotlinHidPostfixUnaryOperator] = tsChoice[K](tsString[K]("++"), tsString[K]("--"), tsString[K]("!!"))
                                                                       rules[kotlinHidStringLiteral] = tsChoice[K](tsSymbol[K](kotlinLineStringLiteral), tsSymbol[K](kotlinMultiLineStringLiteral))
                                                                       rules[kotlinHidPrefixUnaryOperator] = tsChoice[K](tsString[K]("++"), tsString[K]("--"), tsString[K]("-"), tsString[K]("+"), tsString[K]("!"))
                                                                       rules[kotlinAnnotation] = tsChoice[K](tsSymbol[K](kotlinHidSingleAnnotation), tsSymbol[K](kotlinHidMultiAnnotation))
                                                                       rules[kotlinCatchBlock] = tsSeq[K](tsString[K]("catch"), tsString[K]("("), tsRepeat[K](tsSymbol[K](kotlinAnnotation)), tsSymbol[K](kotlinSimpleIdentifier), tsString[K](":"), tsSymbol[K](kotlinHidType), tsString[K](")"), tsSymbol[K](kotlinHidBlock))
                                                                       rules[kotlinHidFunctionValueParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](kotlinHidFunctionValueParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinHidFunctionValueParameter)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[kotlinHidPostfixUnaryExpression] = tsSeq[K](tsSymbol[K](kotlinHidPrimaryExpression), tsRepeat[K](tsSymbol[K](kotlinHidPostfixUnarySuffix)))
                                                                       rules[kotlinParameterModifiers] = tsRepeat1[K](tsChoice[K](tsSymbol[K](kotlinAnnotation), tsSymbol[K](kotlinParameterModifier)))
                                                                       rules[kotlinNavigationExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinNavigationSuffix))
                                                                       rules[kotlinParameterModifier] = tsChoice[K](tsString[K]("vararg"), tsString[K]("noinline"), tsString[K]("crossinline"))
                                                                       rules[kotlinHidLineStrEscapedChar] = tsChoice[K](tsSymbol[K](kotlinHidEscapedIdentifier), tsSymbol[K](kotlinHidUniCharacterLiteral))
                                                                       rules[kotlinHidContinueAt] = tsSeq[K](tsString[K]("continue@"), tsSymbol[K](kotlinHidLexicalIdentifier))
                                                                       rules[kotlinTopLevelObject] = tsSeq[K](tsSymbol[K](kotlinHidDeclaration), tsChoice[K](tsSymbol[K](kotlinHidSemis), tsBlank[K]()))
                                                                       rules[kotlinHidLoopStatement] = tsChoice[K](tsSymbol[K](kotlinForStatement), tsSymbol[K](kotlinWhileStatement), tsSymbol[K](kotlinDoWhileStatement))
                                                                       rules[kotlinHidFunctionLiteral] = tsChoice[K](tsSymbol[K](kotlinLambdaLiteral), tsSymbol[K](kotlinAnonymousFunction))
                                                                       rules[kotlinFunctionModifier] = tsChoice[K](tsString[K]("tailrec"), tsString[K]("operator"), tsString[K]("infix"), tsString[K]("inline"), tsString[K]("external"), tsString[K]("suspend"))
                                                                       rules[kotlinHidAsOperator] = tsChoice[K](tsString[K]("as"), tsString[K]("as?"))
                                                                       rules[kotlinLambdaParameters] = tsSeq[K](tsSymbol[K](kotlinHidLambdaParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinHidLambdaParameter))))
                                                                       rules[kotlinMemberModifier] = tsChoice[K](tsString[K]("override"), tsString[K]("lateinit"))
                                                                       rules[kotlinMultiLineStringLiteral] = tsSeq[K](tsString[K]("\"\"\""), tsRepeat[K](tsChoice[K](tsSymbol[K](kotlinHidMultiLineStringContent), tsSymbol[K](kotlinHidInterpolation))), tsString[K]("\"\"\""))
                                                                       rules[kotlinStatements] = tsSeq[K](tsSymbol[K](kotlinHidStatement), tsRepeat[K](tsSeq[K](tsSymbol[K](kotlinHidSemis), tsSymbol[K](kotlinHidStatement))), tsChoice[K](tsSymbol[K](kotlinHidSemis), tsBlank[K]()))
                                                                       rules[kotlinObjectDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsString[K]("object"), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidDelegationSpecifiers)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinClassBody), tsBlank[K]()))
                                                                       rules[kotlinObjectLiteral] = tsSeq[K](tsString[K]("object"), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidDelegationSpecifiers)), tsBlank[K]()), tsSymbol[K](kotlinClassBody))
                                                                       rules[kotlinHidBreakAt] = tsSeq[K](tsString[K]("break@"), tsSymbol[K](kotlinHidLexicalIdentifier))
                                                                       rules[kotlinTypeConstraints] = tsSeq[K](tsString[K]("where"), tsSeq[K](tsSymbol[K](kotlinTypeConstraint), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinTypeConstraint)))))
                                                                       rules[kotlinAssignment] = tsChoice[K](tsSeq[K](tsSymbol[K](kotlinDirectlyAssignableExpression), tsSymbol[K](kotlinHidAssignmentAndOperator), tsSymbol[K](kotlinHidExpression)), tsSeq[K](tsSymbol[K](kotlinDirectlyAssignableExpression), tsString[K]("="), tsSymbol[K](kotlinHidExpression)))
                                                                       rules[kotlinHidMultiLineStrText] = tsRegex[K]("[^\"$]+")
                                                                       rules[kotlinTypeArguments] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsSymbol[K](kotlinTypeProjection), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinTypeProjection)))), tsString[K](">"))
                                                                       rules[kotlinShebangLine] = tsSeq[K](tsString[K]("#!"), tsRegex[K]("[^\\r\\n]*"))
                                                                       rules[kotlinHidComparisonOperator] = tsChoice[K](tsString[K]("<"), tsString[K](">"), tsString[K]("<="), tsString[K](">="))
                                                                       rules[kotlinHidTypeReference] = tsChoice[K](tsSymbol[K](kotlinUserType), tsString[K]("dynamic"))
                                                                       rules[kotlinCheckExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsChoice[K](tsSymbol[K](kotlinHidInOperator), tsSymbol[K](kotlinHidIsOperator)), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinDirectlyAssignableExpression] = tsChoice[K](tsSymbol[K](kotlinHidPostfixUnaryExpression), tsSymbol[K](kotlinSimpleIdentifier))
                                                                       rules[kotlinHidSuperAt] = tsSeq[K](tsString[K]("super@"), tsSymbol[K](kotlinHidLexicalIdentifier))
                                                                       rules[kotlinLongLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinIntegerLiteral), tsSymbol[K](kotlinHexLiteral), tsSymbol[K](kotlinBinLiteral)), tsString[K]("L"))
                                                                       rules[kotlinTypeModifiers] = tsRepeat1[K](tsSymbol[K](kotlinHidTypeModifier))
                                                                       rules[kotlinVariableDeclaration] = tsSeq[K](tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()))
                                                                       rules[kotlinHidClassMemberDeclarations] = tsRepeat1[K](tsSeq[K](tsSymbol[K](kotlinHidClassMemberDeclaration), tsSymbol[K](kotlinHidSemis)))
                                                                       rules[kotlinHidMultiplicativeOperator] = tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("%"))
                                                                       rules[kotlinWhenEntry] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](kotlinWhenCondition), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinWhenCondition)))), tsString[K]("else")), tsString[K]("->"), tsSymbol[K](kotlinControlStructureBody), tsChoice[K](tsSymbol[K](kotlinHidSemi), tsBlank[K]()))
                                                                       rules[kotlinCharacterLiteral] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsSymbol[K](kotlinHidEscapeSeq), tsRegex[K]("[^\\n\\r\'\\\\]")), tsString[K]("\'"))
                                                                       rules[kotlinTryExpression] = tsSeq[K](tsString[K]("try"), tsSymbol[K](kotlinHidBlock), tsChoice[K](tsSeq[K](tsRepeat1[K](tsSymbol[K](kotlinCatchBlock)), tsChoice[K](tsSymbol[K](kotlinFinallyBlock), tsBlank[K]())), tsSymbol[K](kotlinFinallyBlock)))
                                                                       rules[kotlinHidMultiLineStringContent] = tsChoice[K](tsSymbol[K](kotlinHidMultiLineStrText), tsString[K]("\""))
                                                                       rules[kotlinPropertyDelegate] = tsSeq[K](tsString[K]("by"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinFunctionBody] = tsChoice[K](tsSymbol[K](kotlinHidBlock), tsSeq[K](tsString[K]("="), tsSymbol[K](kotlinHidExpression)))
                                                                       rules[kotlinParenthesizedUserType] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](kotlinUserType), tsSymbol[K](kotlinParenthesizedUserType)), tsString[K](")"))
                                                                       rules[kotlinLambdaLiteral] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinLambdaParameters), tsBlank[K]()), tsString[K]("->")), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinStatements), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[kotlinFinallyBlock] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](kotlinHidBlock))
                                                                       rules[kotlinValueArgument] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinAnnotation), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](kotlinSimpleIdentifier), tsString[K]("=")), tsBlank[K]()), tsChoice[K](tsString[K]("*"), tsBlank[K]()), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinCallableReference] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinSimpleIdentifier), tsBlank[K]()), tsString[K]("::"), tsChoice[K](tsSymbol[K](kotlinSimpleIdentifier), tsString[K]("class")))
                                                                       rules[kotlinHidLexicalIdentifier] = tsChoice[K](tsSymbol[K](kotlinHidAlphaIdentifier), tsSymbol[K](kotlinHidBacktickIdentifier))
                                                                       rules[kotlinImportAlias] = tsSeq[K](tsString[K]("as"), tsSymbol[K](kotlinSimpleIdentifier))
                                                                       rules[kotlinHidExpression] = tsChoice[K](tsSymbol[K](kotlinHidUnaryExpression), tsSymbol[K](kotlinHidBinaryExpression), tsSymbol[K](kotlinHidPrimaryExpression))
                                                                       rules[kotlinHidUniCharacterLiteral] = tsSeq[K](tsString[K]("\\"), tsString[K]("u"), tsRegex[K]("[0-9a-fA-F]{4}"))
                                                                       rules[kotlinHidSimpleUserType] = tsSeq[K](tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSymbol[K](kotlinTypeArguments), tsBlank[K]()))
                                                                       rules[kotlinTypeProjection] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinTypeProjectionModifiers), tsBlank[K]()), tsSymbol[K](kotlinHidType)), tsString[K]("*"))
                                                                       rules[kotlinFileAnnotation] = tsSeq[K](tsString[K]("@"), tsString[K]("file"), tsString[K](":"), tsChoice[K](tsSeq[K](tsString[K]("["), tsRepeat1[K](tsSymbol[K](kotlinHidUnescapedAnnotation)), tsString[K]("]")), tsSymbol[K](kotlinHidUnescapedAnnotation)))
                                                                       rules[kotlinPrimaryConstructor] = tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsString[K]("constructor")), tsBlank[K]()), tsSymbol[K](kotlinHidClassParameters))
                                                                       rules[kotlinClassDeclaration] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsChoice[K](tsString[K]("class"), tsString[K]("interface")), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSymbol[K](kotlinTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinPrimaryConstructor), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidDelegationSpecifiers)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinTypeConstraints), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinClassBody), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsString[K]("enum"), tsString[K]("class"), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSymbol[K](kotlinTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinPrimaryConstructor), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidDelegationSpecifiers)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinTypeConstraints), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinEnumClassBody), tsBlank[K]())))
                                                                       rules[kotlinIfExpression] = tsSeq[K](tsString[K]("if"), tsString[K]("("), tsSymbol[K](kotlinHidExpression), tsString[K](")"), tsChoice[K](tsSymbol[K](kotlinControlStructureBody), tsString[K](";"), tsSeq[K](tsChoice[K](tsSymbol[K](kotlinControlStructureBody), tsBlank[K]()), tsChoice[K](tsString[K](";"), tsBlank[K]()), tsString[K]("else"), tsChoice[K](tsSymbol[K](kotlinControlStructureBody), tsString[K](";")))))
                                                                       rules[kotlinParenthesizedType] = tsSeq[K](tsString[K]("("), tsSymbol[K](kotlinHidType), tsString[K](")"))
                                                                       rules[kotlinHidBacktickIdentifier] = tsRegex[K]("`[^\\r\\n`]+`")
                                                                       rules[kotlinMultiplicativeExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidMultiplicativeOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidModifier] = tsChoice[K](tsSymbol[K](kotlinClassModifier), tsSymbol[K](kotlinMemberModifier), tsSymbol[K](kotlinVisibilityModifier), tsSymbol[K](kotlinFunctionModifier), tsSymbol[K](kotlinPropertyModifier), tsSymbol[K](kotlinInheritanceModifier), tsSymbol[K](kotlinParameterModifier), tsSymbol[K](kotlinPlatformModifier))
                                                                       rules[kotlinTypeConstraint] = tsSeq[K](tsRepeat[K](tsSymbol[K](kotlinAnnotation)), tsSymbol[K](kotlinSimpleIdentifier), tsString[K](":"), tsSymbol[K](kotlinHidType))
                                                                       rules[kotlinAdditiveExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidAdditiveOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinRangeExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsString[K](".."), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinNavigationSuffix] = tsSeq[K](tsSymbol[K](kotlinHidMemberAccessOperator), tsChoice[K](tsSymbol[K](kotlinSimpleIdentifier), tsSymbol[K](kotlinParenthesizedExpression), tsString[K]("class")))
                                                                       rules[kotlinHidClassMemberDeclaration] = tsChoice[K](tsSymbol[K](kotlinHidDeclaration), tsSymbol[K](kotlinCompanionObject), tsSymbol[K](kotlinAnonymousInitializer), tsSymbol[K](kotlinSecondaryConstructor))
                                                                       rules[kotlinHidAdditiveOperator] = tsChoice[K](tsString[K]("+"), tsString[K]("-"))
                                                                       rules[kotlinHidAlphaIdentifier] = tsRegex[K]("[a-zA-Z_][a-zA-Z_0-9]*")
                                                                       rules[kotlinHidBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](kotlinStatements), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[kotlinSimpleIdentifier] = tsChoice[K](tsSymbol[K](kotlinHidLexicalIdentifier), tsString[K]("expect"))
                                                                       rules[kotlinVisibilityModifier] = tsChoice[K](tsString[K]("public"), tsString[K]("private"), tsString[K]("internal"), tsString[K]("protected"))
                                                                       rules[kotlinPlatformModifier] = tsChoice[K](tsString[K]("expect"), tsString[K]("actual"))
                                                                       rules[kotlinUnsignedLiteral] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinIntegerLiteral), tsSymbol[K](kotlinHexLiteral), tsSymbol[K](kotlinBinLiteral)), tsRegex[K]("[uU]"), tsChoice[K](tsString[K]("L"), tsBlank[K]()))
                                                                       rules[kotlinHidAssignmentAndOperator] = tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="))
                                                                       rules[kotlinHidStatement] = tsChoice[K](tsSymbol[K](kotlinHidDeclaration), tsSeq[K](tsRepeat[K](tsChoice[K](tsSymbol[K](kotlinLabel), tsSymbol[K](kotlinAnnotation))), tsChoice[K](tsSymbol[K](kotlinAssignment), tsSymbol[K](kotlinHidLoopStatement), tsSymbol[K](kotlinHidExpression))))
                                                                       rules[kotlinIdentifier] = tsSeq[K](tsSymbol[K](kotlinSimpleIdentifier), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](kotlinSimpleIdentifier))))
                                                                       rules[kotlinReificationModifier] = tsString[K]("reified")
                                                                       rules[kotlinAnnotatedLambda] = tsSeq[K](tsSymbol[K](kotlinLambdaLiteral))
                                                                       rules[kotlinInheritanceModifier] = tsChoice[K](tsString[K]("abstract"), tsString[K]("final"), tsString[K]("open"))
                                                                       rules[kotlinClassBody] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](kotlinHidClassMemberDeclarations), tsBlank[K]()), tsString[K]("}"))
                                                                       rules[kotlinCollectionLiteral] = tsSeq[K](tsString[K]("["), tsSymbol[K](kotlinHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinHidExpression))), tsString[K]("]"))
                                                                       rules[kotlinHidLineStrText] = tsRegex[K]("[^\\\\\"$]+")
                                                                       rules[kotlinComparisonExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidComparisonOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinBinLiteral] = tsSeq[K](tsString[K]("0"), tsRegex[K]("[bB]"), tsSeq[K](tsRegex[K]("[01]"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[01]")))))
                                                                       rules[kotlinFunctionTypeParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](kotlinParameter), tsSymbol[K](kotlinHidType)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](kotlinParameter), tsSymbol[K](kotlinHidType))))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[kotlinParameterWithOptionalType] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinParameterModifiers), tsBlank[K]()), tsSymbol[K](kotlinSimpleIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()))
                                                                       rules[kotlinPostfixExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidPostfixUnaryOperator))
                                                                       rules[kotlinHidSingleAnnotation] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](kotlinUseSiteTarget), tsBlank[K]()), tsSymbol[K](kotlinHidUnescapedAnnotation))
                                                                       rules[kotlinHidReturnAt] = tsSeq[K](tsString[K]("return@"), tsSymbol[K](kotlinHidLexicalIdentifier))
                                                                       rules[kotlinParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](kotlinHidExpression), tsString[K](")"))
                                                                       rules[kotlinPropertyModifier] = tsString[K]("const")
                                                                       rules[kotlinAsExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidAsOperator), tsSymbol[K](kotlinHidType))
                                                                       rules[kotlinHidTypeProjectionModifier] = tsSymbol[K](kotlinVarianceModifier)
                                                                       rules[kotlinConstructorInvocation] = tsSeq[K](tsSymbol[K](kotlinUserType), tsSymbol[K](kotlinValueArguments))
                                                                       rules[kotlinDelegationSpecifier] = tsChoice[K](tsSymbol[K](kotlinConstructorInvocation), tsSymbol[K](kotlinExplicitDelegation), tsSymbol[K](kotlinUserType), tsSymbol[K](kotlinFunctionType))
                                                                       rules[kotlinFunctionDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinTypeParameters), tsBlank[K]()), tsString[K]("fun"), tsSymbol[K](kotlinSimpleIdentifier), tsSymbol[K](kotlinHidFunctionValueParameters), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinTypeConstraints), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinFunctionBody), tsBlank[K]()))
                                                                       rules[kotlinParameter] = tsSeq[K](tsSymbol[K](kotlinSimpleIdentifier), tsString[K](":"), tsSymbol[K](kotlinHidType))
                                                                       rules[kotlinWhileStatement] = tsSeq[K](tsString[K]("while"), tsString[K]("("), tsSymbol[K](kotlinHidExpression), tsString[K](")"), tsChoice[K](tsString[K](";"), tsSymbol[K](kotlinControlStructureBody)))
                                                                       rules[kotlinHidType] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinTypeModifiers), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinParenthesizedType), tsSymbol[K](kotlinNullableType), tsSymbol[K](kotlinHidTypeReference), tsSymbol[K](kotlinFunctionType)))
                                                                       rules[kotlinHidNotIn] = tsString[K]("!in")
                                                                       rules[kotlinCallExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinCallSuffix))
                                                                       rules[kotlinIndexingExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinIndexingSuffix))
                                                                       rules[kotlinHidAnnotatedDelegationSpecifier] = tsSeq[K](tsRepeat[K](tsSymbol[K](kotlinAnnotation)), tsSymbol[K](kotlinDelegationSpecifier))
                                                                       rules[kotlinHidIsOperator] = tsChoice[K](tsString[K]("is"), tsSymbol[K](kotlinHidNotIs))
                                                                       rules[kotlinHidTypeParameterModifier] = tsChoice[K](tsSymbol[K](kotlinReificationModifier), tsSymbol[K](kotlinVarianceModifier), tsSymbol[K](kotlinAnnotation))
                                                                       rules[kotlinRangeTest] = tsSeq[K](tsSymbol[K](kotlinHidInOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinGetter] = tsSeq[K](tsString[K]("get"), tsChoice[K](tsSeq[K](tsString[K]("("), tsString[K](")"), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinHidType)), tsBlank[K]()), tsSymbol[K](kotlinFunctionBody)), tsBlank[K]()))
                                                                       rules[kotlinThisExpression] = tsString[K]("this")
                                                                       rules[kotlinNullableType] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinHidTypeReference), tsSymbol[K](kotlinParenthesizedType)), tsRepeat1[K](tsSymbol[K](kotlinHidQuest)))
                                                                       rules[kotlinSuperExpression] = tsSeq[K](tsString[K]("super"))
                                                                       rules[kotlinUseSiteTarget] = tsSeq[K](tsChoice[K](tsString[K]("field"), tsString[K]("property"), tsString[K]("get"), tsString[K]("set"), tsString[K]("receiver"), tsString[K]("param"), tsString[K]("setparam"), tsString[K]("delegate")), tsString[K](":"))
                                                                       rules[kotlinIntegerLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[1-9]"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))))
                                                                       rules[kotlinPackageHeader] = tsSeq[K](tsString[K]("package"), tsSymbol[K](kotlinIdentifier), tsSymbol[K](kotlinHidSemi))
                                                                       rules[kotlinSpreadExpression] = tsSeq[K](tsString[K]("*"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidTypeModifier] = tsChoice[K](tsSymbol[K](kotlinAnnotation), tsString[K]("suspend"))
                                                                       rules[kotlinPrefixExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinAnnotation), tsSymbol[K](kotlinLabel), tsSymbol[K](kotlinHidPrefixUnaryOperator)), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidEscapedIdentifier] = tsRegex[K]("\\\\[tbrn\'\"\\\\$]")
                                                                       rules[kotlinHidNotIs] = tsString[K]("!is")
                                                                       rules[kotlinHexLiteral] = tsSeq[K](tsString[K]("0"), tsRegex[K]("[xX]"), tsSeq[K](tsRegex[K]("[0-9a-fA-F]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9a-fA-F]+")))))
                                                                       rules[kotlinJumpExpression] = tsChoice[K](tsSeq[K](tsString[K]("throw"), tsSymbol[K](kotlinHidExpression)), tsSeq[K](tsChoice[K](tsString[K]("return"), tsSymbol[K](kotlinHidReturnAt)), tsChoice[K](tsSymbol[K](kotlinHidExpression), tsBlank[K]())), tsString[K]("continue"), tsSymbol[K](kotlinHidContinueAt), tsString[K]("break"), tsSymbol[K](kotlinHidBreakAt))
                                                                       rules[kotlinExplicitDelegation] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinUserType), tsSymbol[K](kotlinFunctionType)), tsString[K]("by"), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinInfixExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinSimpleIdentifier), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidBinaryExpression] = tsChoice[K](tsSymbol[K](kotlinMultiplicativeExpression), tsSymbol[K](kotlinAdditiveExpression), tsSymbol[K](kotlinRangeExpression), tsSymbol[K](kotlinInfixExpression), tsSymbol[K](kotlinElvisExpression), tsSymbol[K](kotlinCheckExpression), tsSymbol[K](kotlinComparisonExpression), tsSymbol[K](kotlinEqualityExpression), tsSymbol[K](kotlinComparisonExpression), tsSymbol[K](kotlinEqualityExpression), tsSymbol[K](kotlinConjunctionExpression), tsSymbol[K](kotlinDisjunctionExpression))
                                                                       rules[kotlinHidEnumEntries] = tsSeq[K](tsSeq[K](tsSymbol[K](kotlinEnumEntry), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinEnumEntry)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                       rules[kotlinClassParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("val"), tsString[K]("var")), tsBlank[K]()), tsSymbol[K](kotlinSimpleIdentifier), tsString[K](":"), tsSymbol[K](kotlinHidType), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](kotlinHidExpression)), tsBlank[K]()))
                                                                       rules[kotlinSecondaryConstructor] = tsSeq[K](tsChoice[K](tsSymbol[K](kotlinModifiers), tsBlank[K]()), tsString[K]("constructor"), tsSymbol[K](kotlinHidFunctionValueParameters), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](kotlinConstructorDelegationCall)), tsBlank[K]()), tsChoice[K](tsSymbol[K](kotlinHidBlock), tsBlank[K]()))
                                                                       rules[kotlinTypeProjectionModifiers] = tsRepeat1[K](tsSymbol[K](kotlinHidTypeProjectionModifier))
                                                                       rules[kotlinRealLiteral] = tsChoice[K](tsSeq[K](tsChoice[K](tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsRegex[K]("[+-]"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))))), tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsBlank[K]()), tsString[K]("."), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsChoice[K](tsSeq[K](tsRegex[K]("[eE]"), tsChoice[K](tsRegex[K]("[+-]"), tsBlank[K]()), tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+"))))), tsBlank[K]()))), tsChoice[K](tsRegex[K]("[fF]"), tsBlank[K]())), tsSeq[K](tsSeq[K](tsRegex[K]("[0-9]+"), tsRepeat[K](tsSeq[K](tsRegex[K]("_+"), tsRegex[K]("[0-9]+")))), tsRegex[K]("[fF]")))
                                                                       rules[kotlinDoWhileStatement] = tsSeq[K](tsString[K]("do"), tsChoice[K](tsSymbol[K](kotlinControlStructureBody), tsBlank[K]()), tsString[K]("while"), tsString[K]("("), tsSymbol[K](kotlinHidExpression), tsString[K](")"))
                                                                       rules[kotlinHidSemi] = tsRegex[K]("[\\r\\n]+")
                                                                       rules[kotlinHidClassParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](kotlinClassParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinClassParameter)))), tsBlank[K]()), tsString[K](")"))
                                                                       rules[kotlinHidSemis] = tsRegex[K]("[\\r\\n]+")
                                                                       rules[kotlinEqualityExpression] = tsSeq[K](tsSymbol[K](kotlinHidExpression), tsSymbol[K](kotlinHidEqualityOperator), tsSymbol[K](kotlinHidExpression))
                                                                       rules[kotlinHidIndexingSuffix] = tsSeq[K](tsString[K]("["), tsSymbol[K](kotlinHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinHidExpression))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                       rules[kotlinTypeAlias] = tsSeq[K](tsString[K]("typealias"), tsSymbol[K](kotlinSimpleIdentifier), tsString[K]("="), tsSymbol[K](kotlinHidType))
                                                                       rules[kotlinParametersWithOptionalType] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](kotlinParameterWithOptionalType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](kotlinParameterWithOptionalType)))), tsString[K](")"))
                                                                       rules

