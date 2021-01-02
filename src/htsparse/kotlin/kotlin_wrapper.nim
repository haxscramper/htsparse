
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  KotlinNodeKind* = enum
    kotlinAdditiveExpression, ## additive_expression
    kotlinAnnotatedLambda,  ## annotated_lambda
    kotlinAnnotation,       ## annotation
    kotlinAnonymousFunction, ## anonymous_function
    kotlinAnonymousInitializer, ## anonymous_initializer
    kotlinAsExpression,     ## as_expression
    kotlinAssignment,       ## assignment
    kotlinBooleanLiteral,   ## boolean_literal
    kotlinCallExpression,   ## call_expression
    kotlinCallSuffix,       ## call_suffix
    kotlinCallableReference, ## callable_reference
    kotlinCatchBlock,       ## catch_block
    kotlinCharacterLiteral, ## character_literal
    kotlinCheckExpression,  ## check_expression
    kotlinClassBody,        ## class_body
    kotlinClassDeclaration, ## class_declaration
    kotlinClassModifier,    ## class_modifier
    kotlinClassParameter,   ## class_parameter
    kotlinCollectionLiteral, ## collection_literal
    kotlinCompanionObject,  ## companion_object
    kotlinComparisonExpression, ## comparison_expression
    kotlinConjunctionExpression, ## conjunction_expression
    kotlinConstructorDelegationCall, ## constructor_delegation_call
    kotlinConstructorInvocation, ## constructor_invocation
    kotlinControlStructureBody, ## control_structure_body
    kotlinDelegationSpecifier, ## delegation_specifier
    kotlinDirectlyAssignableExpression, ## directly_assignable_expression
    kotlinDisjunctionExpression, ## disjunction_expression
    kotlinDoWhileStatement, ## do_while_statement
    kotlinElvisExpression,  ## elvis_expression
    kotlinEnumClassBody,    ## enum_class_body
    kotlinEnumEntry,        ## enum_entry
    kotlinEqualityExpression, ## equality_expression
    kotlinExplicitDelegation, ## explicit_delegation
    kotlinFileAnnotation,   ## file_annotation
    kotlinFinallyBlock,     ## finally_block
    kotlinForStatement,     ## for_statement
    kotlinFunctionBody,     ## function_body
    kotlinFunctionDeclaration, ## function_declaration
    kotlinFunctionModifier, ## function_modifier
    kotlinFunctionType,     ## function_type
    kotlinFunctionTypeParameters, ## function_type_parameters
    kotlinGetter,           ## getter
    kotlinIdentifier,       ## identifier
    kotlinIfExpression,     ## if_expression
    kotlinImportAlias,      ## import_alias
    kotlinImportHeader,     ## import_header
    kotlinIndexingExpression, ## indexing_expression
    kotlinIndexingSuffix,   ## indexing_suffix
    kotlinInfixExpression,  ## infix_expression
    kotlinInheritanceModifier, ## inheritance_modifier
    kotlinInterpolatedExpression, ## interpolated_expression
    kotlinInterpolatedIdentifier, ## interpolated_identifier
    kotlinJumpExpression,   ## jump_expression
    kotlinLambdaLiteral,    ## lambda_literal
    kotlinLambdaParameters, ## lambda_parameters
    kotlinLineStringLiteral, ## line_string_literal
    kotlinLongLiteral,      ## long_literal
    kotlinMemberModifier,   ## member_modifier
    kotlinModifiers,        ## modifiers
    kotlinMultiLineStringLiteral, ## multi_line_string_literal
    kotlinMultiplicativeExpression, ## multiplicative_expression
    kotlinNavigationExpression, ## navigation_expression
    kotlinNavigationSuffix, ## navigation_suffix
    kotlinNullableType,     ## nullable_type
    kotlinObjectDeclaration, ## object_declaration
    kotlinObjectLiteral,    ## object_literal
    kotlinPackageHeader,    ## package_header
    kotlinParameter,        ## parameter
    kotlinParameterModifier, ## parameter_modifier
    kotlinParameterModifiers, ## parameter_modifiers
    kotlinParameterWithOptionalType, ## parameter_with_optional_type
    kotlinParenthesizedExpression, ## parenthesized_expression
    kotlinParenthesizedType, ## parenthesized_type
    kotlinParenthesizedUserType, ## parenthesized_user_type
    kotlinPlatformModifier, ## platform_modifier
    kotlinPostfixExpression, ## postfix_expression
    kotlinPrefixExpression, ## prefix_expression
    kotlinPrimaryConstructor, ## primary_constructor
    kotlinPropertyDeclaration, ## property_declaration
    kotlinPropertyDelegate, ## property_delegate
    kotlinRangeExpression,  ## range_expression
    kotlinRangeTest,        ## range_test
    kotlinSecondaryConstructor, ## secondary_constructor
    kotlinSetter,           ## setter
    kotlinShebangLine,      ## shebang_line
    kotlinSimpleIdentifier, ## simple_identifier
    kotlinSourceFile,       ## source_file
    kotlinSpreadExpression, ## spread_expression
    kotlinStatements,       ## statements
    kotlinSuperExpression,  ## super_expression
    kotlinThisExpression,   ## this_expression
    kotlinTryExpression,    ## try_expression
    kotlinTypeAlias,        ## type_alias
    kotlinTypeArguments,    ## type_arguments
    kotlinTypeConstraint,   ## type_constraint
    kotlinTypeConstraints,  ## type_constraints
    kotlinTypeIdentifier,   ## type_identifier
    kotlinTypeModifiers,    ## type_modifiers
    kotlinTypeParameter,    ## type_parameter
    kotlinTypeParameterModifiers, ## type_parameter_modifiers
    kotlinTypeParameters,   ## type_parameters
    kotlinTypeProjection,   ## type_projection
    kotlinTypeProjectionModifiers, ## type_projection_modifiers
    kotlinTypeTest,         ## type_test
    kotlinUnsignedLiteral,  ## unsigned_literal
    kotlinUseSiteTarget,    ## use_site_target
    kotlinUserType,         ## user_type
    kotlinValueArgument,    ## value_argument
    kotlinValueArguments,   ## value_arguments
    kotlinVariableDeclaration, ## variable_declaration
    kotlinVarianceModifier, ## variance_modifier
    kotlinVisibilityModifier, ## visibility_modifier
    kotlinWhenCondition,    ## when_condition
    kotlinWhenEntry,        ## when_entry
    kotlinWhenExpression,   ## when_expression
    kotlinWhenSubject,      ## when_subject
    kotlinWhileStatement,   ## while_statement
    kotlinExclamationTok,   ## !
    kotlinDoubleExclamationTok, ## !!
    kotlinExclamationEqualTok, ## !=
    kotlinExclamationDoubleEqualTok, ## !==
    kotlinExclamationinTok, ## !in
    kotlinQuoteTok,         ## "
    kotlinTripleQuoteTok,   ## """
    kotlinHashExclamationTok, ## #!
    kotlinDollarTok,        ## $
    kotlinDollarLCurlyTok,  ## ${
    kotlinPercentTok,       ## %
    kotlinPercentEqualTok,  ## %=
    kotlinDoubleAmpersandTok, ## &&
    kotlinApostropheTok,    ## '
    kotlinLParTok,          ## (
    kotlinRParTok,          ## )
    kotlinAsteriskTok,      ## *
    kotlinAsteriskEqualTok, ## *=
    kotlinPlusTok,          ## +
    kotlinDoublePlusTok,    ## ++
    kotlinPlusEqualTok,     ## +=
    kotlinCommaTok,         ## ,
    kotlinMinusTok,         ## -
    kotlinDoubleMinusTok,   ## --
    kotlinMinusEqualTok,    ## -=
    kotlinMinusGreaterThanTok, ## ->
    kotlinDotTok,           ## .
    kotlinDotAsteriskTok,   ## .*
    kotlinDoubleDotTok,     ## ..
    kotlinSlashTok,         ## /
    kotlinSlashEqualTok,    ## /=
    kotlinColonTok,         ## :
    kotlinDoubleColonTok,   ## ::
    kotlinSemicolonTok,     ## ;
    kotlinLessThanTok,      ## <
    kotlinLessThanEqualTok, ## <=
    kotlinEqualTok,         ## =
    kotlinDoubleEqualTok,   ## ==
    kotlinTripleEqualTok,   ## ===
    kotlinGreaterThanTok,   ## >
    kotlinGreaterThanEqualTok, ## >=
    kotlinQuestionColonTok, ## ?:
    kotlinAtTok,            ## @
    kotlinLTok,             ## L
    kotlinLBrackTok,        ## [
    kotlinBackslashTok,     ## \
    kotlinRBrackTok,        ## ]
    kotlinAbstractTok,      ## abstract
    kotlinActualTok,        ## actual
    kotlinAnnotationTok,    ## annotation
    kotlinAsTok,            ## as
    kotlinAsQuestionTok,    ## as?
    kotlinBinLiteral,       ## bin_literal
    kotlinBreakTok,         ## break
    kotlinBreakAtTok,       ## break@
    kotlinByTok,            ## by
    kotlinCatchTok,         ## catch
    kotlinClassTok,         ## class
    kotlinComment,          ## comment
    kotlinCompanionTok,     ## companion
    kotlinConstructorTok,   ## constructor
    kotlinContinueTok,      ## continue
    kotlinContinueAtTok,    ## continue@
    kotlinCrossinlineTok,   ## crossinline
    kotlinDataTok,          ## data
    kotlinDelegateTok,      ## delegate
    kotlinDoTok,            ## do
    kotlinDynamicTok,       ## dynamic
    kotlinElseTok,          ## else
    kotlinEnumTok,          ## enum
    kotlinExpectTok,        ## expect
    kotlinExternalTok,      ## external
    kotlinFalseTok,         ## false
    kotlinFieldTok,         ## field
    kotlinFileTok,          ## file
    kotlinFinalTok,         ## final
    kotlinFinallyTok,       ## finally
    kotlinForTok,           ## for
    kotlinFunTok,           ## fun
    kotlinGetTok,           ## get
    kotlinHexLiteral,       ## hex_literal
    kotlinIfTok,            ## if
    kotlinImportTok,        ## import
    kotlinInTok,            ## in
    kotlinInfixTok,         ## infix
    kotlinInitTok,          ## init
    kotlinInlineTok,        ## inline
    kotlinInnerTok,         ## inner
    kotlinIntegerLiteral,   ## integer_literal
    kotlinInterfaceTok,     ## interface
    kotlinInternalTok,      ## internal
    kotlinIsTok,            ## is
    kotlinLabel,            ## label
    kotlinLateinitTok,      ## lateinit
    kotlinNoinlineTok,      ## noinline
    kotlinNullTok,          ## null
    kotlinObjectTok,        ## object
    kotlinOpenTok,          ## open
    kotlinOperatorTok,      ## operator
    kotlinOutTok,           ## out
    kotlinOverrideTok,      ## override
    kotlinPackageTok,       ## package
    kotlinParamTok,         ## param
    kotlinPrivateTok,       ## private
    kotlinPropertyTok,      ## property
    kotlinPropertyModifier, ## property_modifier
    kotlinProtectedTok,     ## protected
    kotlinPublicTok,        ## public
    kotlinRealLiteral,      ## real_literal
    kotlinReceiverTok,      ## receiver
    kotlinReificationModifier, ## reification_modifier
    kotlinReturnTok,        ## return
    kotlinReturnAtTok,      ## return@
    kotlinSealedTok,        ## sealed
    kotlinSetTok,           ## set
    kotlinSetparamTok,      ## setparam
    kotlinSuperTok,         ## super
    kotlinSuperAtTok,       ## super@
    kotlinSuspendTok,       ## suspend
    kotlinTailrecTok,       ## tailrec
    kotlinThisTok,          ## this
    kotlinThisAtTok,        ## this@
    kotlinThrowTok,         ## throw
    kotlinTrueTok,          ## true
    kotlinTryTok,           ## try
    kotlinTypealiasTok,     ## typealias
    kotlinUTok,             ## u
    kotlinValTok,           ## val
    kotlinVarTok,           ## var
    kotlinVarargTok,        ## vararg
    kotlinWhenTok,          ## when
    kotlinWhereTok,         ## where
    kotlinWhileTok,         ## while
    kotlinLCurlyTok,        ## {
    kotlinDoublePipeTok,    ## ||
    kotlinRCurlyTok,        ## }
    kotlinComment2,         ## comment
    kotlinSyntaxError        ## Tree-sitter parser syntax error
type
  KotlinNode* = distinct TSNode
type
  KotlinParser* = distinct PtsParser
proc tsNodeType*(node: KotlinNode): string
proc kind*(node: KotlinNode): KotlinNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "additive_expression":
      kotlinAdditiveExpression
    of "annotated_lambda":
      kotlinAnnotatedLambda
    of "annotation":
      kotlinAnnotation
    of "anonymous_function":
      kotlinAnonymousFunction
    of "anonymous_initializer":
      kotlinAnonymousInitializer
    of "as_expression":
      kotlinAsExpression
    of "assignment":
      kotlinAssignment
    of "boolean_literal":
      kotlinBooleanLiteral
    of "call_expression":
      kotlinCallExpression
    of "call_suffix":
      kotlinCallSuffix
    of "callable_reference":
      kotlinCallableReference
    of "catch_block":
      kotlinCatchBlock
    of "character_literal":
      kotlinCharacterLiteral
    of "check_expression":
      kotlinCheckExpression
    of "class_body":
      kotlinClassBody
    of "class_declaration":
      kotlinClassDeclaration
    of "class_modifier":
      kotlinClassModifier
    of "class_parameter":
      kotlinClassParameter
    of "collection_literal":
      kotlinCollectionLiteral
    of "companion_object":
      kotlinCompanionObject
    of "comparison_expression":
      kotlinComparisonExpression
    of "conjunction_expression":
      kotlinConjunctionExpression
    of "constructor_delegation_call":
      kotlinConstructorDelegationCall
    of "constructor_invocation":
      kotlinConstructorInvocation
    of "control_structure_body":
      kotlinControlStructureBody
    of "delegation_specifier":
      kotlinDelegationSpecifier
    of "directly_assignable_expression":
      kotlinDirectlyAssignableExpression
    of "disjunction_expression":
      kotlinDisjunctionExpression
    of "do_while_statement":
      kotlinDoWhileStatement
    of "elvis_expression":
      kotlinElvisExpression
    of "enum_class_body":
      kotlinEnumClassBody
    of "enum_entry":
      kotlinEnumEntry
    of "equality_expression":
      kotlinEqualityExpression
    of "explicit_delegation":
      kotlinExplicitDelegation
    of "file_annotation":
      kotlinFileAnnotation
    of "finally_block":
      kotlinFinallyBlock
    of "for_statement":
      kotlinForStatement
    of "function_body":
      kotlinFunctionBody
    of "function_declaration":
      kotlinFunctionDeclaration
    of "function_modifier":
      kotlinFunctionModifier
    of "function_type":
      kotlinFunctionType
    of "function_type_parameters":
      kotlinFunctionTypeParameters
    of "getter":
      kotlinGetter
    of "identifier":
      kotlinIdentifier
    of "if_expression":
      kotlinIfExpression
    of "import_alias":
      kotlinImportAlias
    of "import_header":
      kotlinImportHeader
    of "indexing_expression":
      kotlinIndexingExpression
    of "indexing_suffix":
      kotlinIndexingSuffix
    of "infix_expression":
      kotlinInfixExpression
    of "inheritance_modifier":
      kotlinInheritanceModifier
    of "interpolated_expression":
      kotlinInterpolatedExpression
    of "interpolated_identifier":
      kotlinInterpolatedIdentifier
    of "jump_expression":
      kotlinJumpExpression
    of "lambda_literal":
      kotlinLambdaLiteral
    of "lambda_parameters":
      kotlinLambdaParameters
    of "line_string_literal":
      kotlinLineStringLiteral
    of "long_literal":
      kotlinLongLiteral
    of "member_modifier":
      kotlinMemberModifier
    of "modifiers":
      kotlinModifiers
    of "multi_line_string_literal":
      kotlinMultiLineStringLiteral
    of "multiplicative_expression":
      kotlinMultiplicativeExpression
    of "navigation_expression":
      kotlinNavigationExpression
    of "navigation_suffix":
      kotlinNavigationSuffix
    of "nullable_type":
      kotlinNullableType
    of "object_declaration":
      kotlinObjectDeclaration
    of "object_literal":
      kotlinObjectLiteral
    of "package_header":
      kotlinPackageHeader
    of "parameter":
      kotlinParameter
    of "parameter_modifier":
      kotlinParameterModifier
    of "parameter_modifiers":
      kotlinParameterModifiers
    of "parameter_with_optional_type":
      kotlinParameterWithOptionalType
    of "parenthesized_expression":
      kotlinParenthesizedExpression
    of "parenthesized_type":
      kotlinParenthesizedType
    of "parenthesized_user_type":
      kotlinParenthesizedUserType
    of "platform_modifier":
      kotlinPlatformModifier
    of "postfix_expression":
      kotlinPostfixExpression
    of "prefix_expression":
      kotlinPrefixExpression
    of "primary_constructor":
      kotlinPrimaryConstructor
    of "property_declaration":
      kotlinPropertyDeclaration
    of "property_delegate":
      kotlinPropertyDelegate
    of "range_expression":
      kotlinRangeExpression
    of "range_test":
      kotlinRangeTest
    of "secondary_constructor":
      kotlinSecondaryConstructor
    of "setter":
      kotlinSetter
    of "shebang_line":
      kotlinShebangLine
    of "simple_identifier":
      kotlinSimpleIdentifier
    of "source_file":
      kotlinSourceFile
    of "spread_expression":
      kotlinSpreadExpression
    of "statements":
      kotlinStatements
    of "super_expression":
      kotlinSuperExpression
    of "this_expression":
      kotlinThisExpression
    of "try_expression":
      kotlinTryExpression
    of "type_alias":
      kotlinTypeAlias
    of "type_arguments":
      kotlinTypeArguments
    of "type_constraint":
      kotlinTypeConstraint
    of "type_constraints":
      kotlinTypeConstraints
    of "type_identifier":
      kotlinTypeIdentifier
    of "type_modifiers":
      kotlinTypeModifiers
    of "type_parameter":
      kotlinTypeParameter
    of "type_parameter_modifiers":
      kotlinTypeParameterModifiers
    of "type_parameters":
      kotlinTypeParameters
    of "type_projection":
      kotlinTypeProjection
    of "type_projection_modifiers":
      kotlinTypeProjectionModifiers
    of "type_test":
      kotlinTypeTest
    of "unsigned_literal":
      kotlinUnsignedLiteral
    of "use_site_target":
      kotlinUseSiteTarget
    of "user_type":
      kotlinUserType
    of "value_argument":
      kotlinValueArgument
    of "value_arguments":
      kotlinValueArguments
    of "variable_declaration":
      kotlinVariableDeclaration
    of "variance_modifier":
      kotlinVarianceModifier
    of "visibility_modifier":
      kotlinVisibilityModifier
    of "when_condition":
      kotlinWhenCondition
    of "when_entry":
      kotlinWhenEntry
    of "when_expression":
      kotlinWhenExpression
    of "when_subject":
      kotlinWhenSubject
    of "while_statement":
      kotlinWhileStatement
    of "!":
      kotlinExclamationTok
    of "!!":
      kotlinDoubleExclamationTok
    of "!=":
      kotlinExclamationEqualTok
    of "!==":
      kotlinExclamationDoubleEqualTok
    of "!in":
      kotlinExclamationinTok
    of "\"":
      kotlinQuoteTok
    of "\"\"\"":
      kotlinTripleQuoteTok
    of "#!":
      kotlinHashExclamationTok
    of "$":
      kotlinDollarTok
    of "${":
      kotlinDollarLCurlyTok
    of "%":
      kotlinPercentTok
    of "%=":
      kotlinPercentEqualTok
    of "&&":
      kotlinDoubleAmpersandTok
    of "\'":
      kotlinApostropheTok
    of "(":
      kotlinLParTok
    of ")":
      kotlinRParTok
    of "*":
      kotlinAsteriskTok
    of "*=":
      kotlinAsteriskEqualTok
    of "+":
      kotlinPlusTok
    of "++":
      kotlinDoublePlusTok
    of "+=":
      kotlinPlusEqualTok
    of ",":
      kotlinCommaTok
    of "-":
      kotlinMinusTok
    of "--":
      kotlinDoubleMinusTok
    of "-=":
      kotlinMinusEqualTok
    of "->":
      kotlinMinusGreaterThanTok
    of ".":
      kotlinDotTok
    of ".*":
      kotlinDotAsteriskTok
    of "..":
      kotlinDoubleDotTok
    of "/":
      kotlinSlashTok
    of "/=":
      kotlinSlashEqualTok
    of ":":
      kotlinColonTok
    of "::":
      kotlinDoubleColonTok
    of ";":
      kotlinSemicolonTok
    of "<":
      kotlinLessThanTok
    of "<=":
      kotlinLessThanEqualTok
    of "=":
      kotlinEqualTok
    of "==":
      kotlinDoubleEqualTok
    of "===":
      kotlinTripleEqualTok
    of ">":
      kotlinGreaterThanTok
    of ">=":
      kotlinGreaterThanEqualTok
    of "?:":
      kotlinQuestionColonTok
    of "@":
      kotlinAtTok
    of "L":
      kotlinLTok
    of "[":
      kotlinLBrackTok
    of "\\":
      kotlinBackslashTok
    of "]":
      kotlinRBrackTok
    of "abstract":
      kotlinAbstractTok
    of "actual":
      kotlinActualTok
    of "as":
      kotlinAsTok
    of "as?":
      kotlinAsQuestionTok
    of "bin_literal":
      kotlinBinLiteral
    of "break":
      kotlinBreakTok
    of "break@":
      kotlinBreakAtTok
    of "by":
      kotlinByTok
    of "catch":
      kotlinCatchTok
    of "class":
      kotlinClassTok
    of "comment":
      kotlinComment2
    of "companion":
      kotlinCompanionTok
    of "constructor":
      kotlinConstructorTok
    of "continue":
      kotlinContinueTok
    of "continue@":
      kotlinContinueAtTok
    of "crossinline":
      kotlinCrossinlineTok
    of "data":
      kotlinDataTok
    of "delegate":
      kotlinDelegateTok
    of "do":
      kotlinDoTok
    of "dynamic":
      kotlinDynamicTok
    of "else":
      kotlinElseTok
    of "enum":
      kotlinEnumTok
    of "expect":
      kotlinExpectTok
    of "external":
      kotlinExternalTok
    of "false":
      kotlinFalseTok
    of "field":
      kotlinFieldTok
    of "file":
      kotlinFileTok
    of "final":
      kotlinFinalTok
    of "finally":
      kotlinFinallyTok
    of "for":
      kotlinForTok
    of "fun":
      kotlinFunTok
    of "get":
      kotlinGetTok
    of "hex_literal":
      kotlinHexLiteral
    of "if":
      kotlinIfTok
    of "import":
      kotlinImportTok
    of "in":
      kotlinInTok
    of "infix":
      kotlinInfixTok
    of "init":
      kotlinInitTok
    of "inline":
      kotlinInlineTok
    of "inner":
      kotlinInnerTok
    of "integer_literal":
      kotlinIntegerLiteral
    of "interface":
      kotlinInterfaceTok
    of "internal":
      kotlinInternalTok
    of "is":
      kotlinIsTok
    of "label":
      kotlinLabel
    of "lateinit":
      kotlinLateinitTok
    of "noinline":
      kotlinNoinlineTok
    of "null":
      kotlinNullTok
    of "object":
      kotlinObjectTok
    of "open":
      kotlinOpenTok
    of "operator":
      kotlinOperatorTok
    of "out":
      kotlinOutTok
    of "override":
      kotlinOverrideTok
    of "package":
      kotlinPackageTok
    of "param":
      kotlinParamTok
    of "private":
      kotlinPrivateTok
    of "property":
      kotlinPropertyTok
    of "property_modifier":
      kotlinPropertyModifier
    of "protected":
      kotlinProtectedTok
    of "public":
      kotlinPublicTok
    of "real_literal":
      kotlinRealLiteral
    of "receiver":
      kotlinReceiverTok
    of "reification_modifier":
      kotlinReificationModifier
    of "return":
      kotlinReturnTok
    of "return@":
      kotlinReturnAtTok
    of "sealed":
      kotlinSealedTok
    of "set":
      kotlinSetTok
    of "setparam":
      kotlinSetparamTok
    of "super":
      kotlinSuperTok
    of "super@":
      kotlinSuperAtTok
    of "suspend":
      kotlinSuspendTok
    of "tailrec":
      kotlinTailrecTok
    of "this":
      kotlinThisTok
    of "this@":
      kotlinThisAtTok
    of "throw":
      kotlinThrowTok
    of "true":
      kotlinTrueTok
    of "try":
      kotlinTryTok
    of "typealias":
      kotlinTypealiasTok
    of "u":
      kotlinUTok
    of "val":
      kotlinValTok
    of "var":
      kotlinVarTok
    of "vararg":
      kotlinVarargTok
    of "when":
      kotlinWhenTok
    of "where":
      kotlinWhereTok
    of "while":
      kotlinWhileTok
    of "{":
      kotlinLCurlyTok
    of "||":
      kotlinDoublePipeTok
    of "}":
      kotlinRCurlyTok
    of "ERROR":
      kotlinSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_kotlin(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: KotlinNode): string =
  $ts_node_type(TSNode(node))

proc newKotlinParser*(): KotlinParser =
  result = KotlinParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_kotlin())

proc parseString*(parser: KotlinParser; str: string): KotlinNode =
  KotlinNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseKotlinString*(str: string): KotlinNode =
  let parser = newKotlinParser()
  return parseString(parser, str)

func `[]`*(node: KotlinNode; idx: int; withUnnamed: bool = false): KotlinNode =
  if withUnnamed:
    KotlinNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    KotlinNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: KotlinNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: KotlinNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: KotlinNode; withUnnamed: bool = false): KotlinNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: KotlinNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: KotlinNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: KotlinNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[6 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
