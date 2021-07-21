
import
  hmisc / wrappers / treesitter

import
  hmisc / base_errors

import
  strutils

type
  RustNodeKind* = enum
    rustDeclarationStatement, ## _declaration_statement
    rustExpression,         ## _expression
    rustLiteral,            ## _literal
    rustLiteralPattern,     ## _literal_pattern
    rustPattern,            ## _pattern
    rustType,               ## _type
    rustAbstractType,       ## abstract_type
    rustArguments,          ## arguments
    rustArrayExpression,    ## array_expression
    rustArrayType,          ## array_type
    rustAssignmentExpression, ## assignment_expression
    rustAssociatedType,     ## associated_type
    rustAsyncBlock,         ## async_block
    rustAttributeItem,      ## attribute_item
    rustAwaitExpression,    ## await_expression
    rustBaseFieldInitializer, ## base_field_initializer
    rustBinaryExpression,   ## binary_expression
    rustBlock,              ## block
    rustBooleanLiteral,     ## boolean_literal
    rustBoundedType,        ## bounded_type
    rustBracketedType,      ## bracketed_type
    rustBreakExpression,    ## break_expression
    rustCallExpression,     ## call_expression
    rustCapturedPattern,    ## captured_pattern
    rustClosureExpression,  ## closure_expression
    rustClosureParameters,  ## closure_parameters
    rustCompoundAssignmentExpr, ## compound_assignment_expr
    rustConstBlock,         ## const_block
    rustConstItem,          ## const_item
    rustConstParameter,     ## const_parameter
    rustConstrainedTypeParameter, ## constrained_type_parameter
    rustContinueExpression, ## continue_expression
    rustDeclarationList,    ## declaration_list
    rustDynamicType,        ## dynamic_type
    rustElseClause,         ## else_clause
    rustEmptyStatement,     ## empty_statement
    rustEmptyType,          ## empty_type
    rustEnumItem,           ## enum_item
    rustEnumVariant,        ## enum_variant
    rustEnumVariantList,    ## enum_variant_list
    rustExternCrateDeclaration, ## extern_crate_declaration
    rustExternModifier,     ## extern_modifier
    rustFieldDeclaration,   ## field_declaration
    rustFieldDeclarationList, ## field_declaration_list
    rustFieldExpression,    ## field_expression
    rustFieldInitializer,   ## field_initializer
    rustFieldInitializerList, ## field_initializer_list
    rustFieldPattern,       ## field_pattern
    rustForExpression,      ## for_expression
    rustForLifetimes,       ## for_lifetimes
    rustForeignModItem,     ## foreign_mod_item
    rustFragmentSpecifier,  ## fragment_specifier
    rustFunctionItem,       ## function_item
    rustFunctionModifiers,  ## function_modifiers
    rustFunctionSignatureItem, ## function_signature_item
    rustFunctionType,       ## function_type
    rustGenericFunction,    ## generic_function
    rustGenericType,        ## generic_type
    rustGenericTypeWithTurbofish, ## generic_type_with_turbofish
    rustHigherRankedTraitBound, ## higher_ranked_trait_bound
    rustIfExpression,       ## if_expression
    rustIfLetExpression,    ## if_let_expression
    rustImplItem,           ## impl_item
    rustIndexExpression,    ## index_expression
    rustInnerAttributeItem, ## inner_attribute_item
    rustLetDeclaration,     ## let_declaration
    rustLifetime,           ## lifetime
    rustLoopExpression,     ## loop_expression
    rustLoopLabel,          ## loop_label
    rustMacroDefinition,    ## macro_definition
    rustMacroInvocation,    ## macro_invocation
    rustMacroRule,          ## macro_rule
    rustMatchArm,           ## match_arm
    rustMatchBlock,         ## match_block
    rustMatchExpression,    ## match_expression
    rustMatchPattern,       ## match_pattern
    rustMetaArguments,      ## meta_arguments
    rustMetaItem,           ## meta_item
    rustModItem,            ## mod_item
    rustMutPattern,         ## mut_pattern
    rustNegativeLiteral,    ## negative_literal
    rustOptionalTypeParameter, ## optional_type_parameter
    rustOrPattern,          ## or_pattern
    rustOrderedFieldDeclarationList, ## ordered_field_declaration_list
    rustParameter,          ## parameter
    rustParameters,         ## parameters
    rustParenthesizedExpression, ## parenthesized_expression
    rustPointerType,        ## pointer_type
    rustQualifiedType,      ## qualified_type
    rustRangeExpression,    ## range_expression
    rustRangePattern,       ## range_pattern
    rustRefPattern,         ## ref_pattern
    rustReferenceExpression, ## reference_expression
    rustReferencePattern,   ## reference_pattern
    rustReferenceType,      ## reference_type
    rustRemainingFieldPattern, ## remaining_field_pattern
    rustRemovedTraitBound,  ## removed_trait_bound
    rustReturnExpression,   ## return_expression
    rustScopedIdentifier,   ## scoped_identifier
    rustScopedTypeIdentifier, ## scoped_type_identifier
    rustScopedUseList,      ## scoped_use_list
    rustSelfParameter,      ## self_parameter
    rustShorthandFieldInitializer, ## shorthand_field_initializer
    rustSlicePattern,       ## slice_pattern
    rustSourceFile,         ## source_file
    rustStaticItem,         ## static_item
    rustStringLiteral,      ## string_literal
    rustStructExpression,   ## struct_expression
    rustStructItem,         ## struct_item
    rustStructPattern,      ## struct_pattern
    rustTokenBindingPattern, ## token_binding_pattern
    rustTokenRepetition,    ## token_repetition
    rustTokenRepetitionPattern, ## token_repetition_pattern
    rustTokenTree,          ## token_tree
    rustTokenTreePattern,   ## token_tree_pattern
    rustTraitBounds,        ## trait_bounds
    rustTraitItem,          ## trait_item
    rustTryExpression,      ## try_expression
    rustTupleExpression,    ## tuple_expression
    rustTuplePattern,       ## tuple_pattern
    rustTupleStructPattern, ## tuple_struct_pattern
    rustTupleType,          ## tuple_type
    rustTypeArguments,      ## type_arguments
    rustTypeBinding,        ## type_binding
    rustTypeCastExpression, ## type_cast_expression
    rustTypeItem,           ## type_item
    rustTypeParameters,     ## type_parameters
    rustUnaryExpression,    ## unary_expression
    rustUnionItem,          ## union_item
    rustUnitExpression,     ## unit_expression
    rustUnitType,           ## unit_type
    rustUnsafeBlock,        ## unsafe_block
    rustUseAsClause,        ## use_as_clause
    rustUseDeclaration,     ## use_declaration
    rustUseList,            ## use_list
    rustUseWildcard,        ## use_wildcard
    rustVariadicParameter,  ## variadic_parameter
    rustVisibilityModifier, ## visibility_modifier
    rustWhereClause,        ## where_clause
    rustWherePredicate,     ## where_predicate
    rustWhileExpression,    ## while_expression
    rustWhileLetExpression, ## while_let_expression
    rustExclamationTok,     ## !
    rustExclamationEqualTok, ## !=
    rustQuoteTok,           ## "
    rustHashTok,            ## #
    rustDollarTok,          ## $
    rustPercentTok,         ## %
    rustPercentEqualTok,    ## %=
    rustAmpersandTok,       ## &
    rustDoubleAmpersandTok, ## &&
    rustAmpersandEqualTok,  ## &=
    rustApostropheTok,      ## '
    rustLParTok,            ## (
    rustRParTok,            ## )
    rustAsteriskTok,        ## *
    rustAsteriskEqualTok,   ## *=
    rustPlusTok,            ## +
    rustPlusEqualTok,       ## +=
    rustCommaTok,           ## ,
    rustMinusTok,           ## -
    rustMinusEqualTok,      ## -=
    rustMinusGreaterThanTok, ## ->
    rustDotTok,             ## .
    rustDoubleDotTok,       ## ..
    rustTripleDotTok,       ## ...
    rustDoubleDotEqualTok,  ## ..=
    rustSlashTok,           ## /
    rustSlashEqualTok,      ## /=
    rustColonTok,           ## :
    rustDoubleColonTok,     ## ::
    rustSemicolonTok,       ## ;
    rustLessThanTok,        ## <
    rustDoubleLessThanTok,  ## <<
    rustDoubleLessThanEqualTok, ## <<=
    rustLessThanEqualTok,   ## <=
    rustEqualTok,           ## =
    rustDoubleEqualTok,     ## ==
    rustEqualGreaterThanTok, ## =>
    rustGreaterThanTok,     ## >
    rustGreaterThanEqualTok, ## >=
    rustDoubleGreaterThanTok, ## >>
    rustDoubleGreaterThanEqualTok, ## >>=
    rustQuestionTok,        ## ?
    rustAtTok,              ## @
    rustLBrackTok,          ## [
    rustRBrackTok,          ## ]
    rustAccentTok,          ## ^
    rustAccentEqualTok,     ## ^=
    rustUnderscoreTok,      ## _
    rustAsTok,              ## as
    rustAsyncTok,           ## async
    rustAwaitTok,           ## await
    rustBlockTok,           ## block
    rustBlockComment,       ## block_comment
    rustBreakTok,           ## break
    rustCharLiteral,        ## char_literal
    rustConstTok,           ## const
    rustContinueTok,        ## continue
    rustCrate,              ## crate
    rustDefaultTok,         ## default
    rustDynTok,             ## dyn
    rustElseTok,            ## else
    rustEnumTok,            ## enum
    rustEscapeSequence,     ## escape_sequence
    rustExprTok,            ## expr
    rustExternTok,          ## extern
    rustFalseTok,           ## false
    rustFieldIdentifier,    ## field_identifier
    rustFloatLiteral,       ## float_literal
    rustFnTok,              ## fn
    rustForTok,             ## for
    rustIdentTok,           ## ident
    rustIdentifier,         ## identifier
    rustIfTok,              ## if
    rustImplTok,            ## impl
    rustInTok,              ## in
    rustIntegerLiteral,     ## integer_literal
    rustItemTok,            ## item
    rustLetTok,             ## let
    rustLifetimeTok,        ## lifetime
    rustLineComment,        ## line_comment
    rustLiteralTok,         ## literal
    rustLoopTok,            ## loop
    rustMacroUnderscorerulesExclamationTok, ## macro_rules!
    rustMatchTok,           ## match
    rustMetaTok,            ## meta
    rustMetavariable,       ## metavariable
    rustModTok,             ## mod
    rustMoveTok,            ## move
    rustMutableSpecifier,   ## mutable_specifier
    rustPatTok,             ## pat
    rustPathTok,            ## path
    rustPrimitiveType,      ## primitive_type
    rustPubTok,             ## pub
    rustRawStringLiteral,   ## raw_string_literal
    rustRefTok,             ## ref
    rustReturnTok,          ## return
    rustSelf,               ## self
    rustShorthandFieldIdentifier, ## shorthand_field_identifier
    rustStaticTok,          ## static
    rustStmtTok,            ## stmt
    rustStructTok,          ## struct
    rustSuper,              ## super
    rustTraitTok,           ## trait
    rustTrueTok,            ## true
    rustTtTok,              ## tt
    rustTyTok,              ## ty
    rustTypeTok,            ## type
    rustTypeIdentifier,     ## type_identifier
    rustUnionTok,           ## union
    rustUnsafeTok,          ## unsafe
    rustUseTok,             ## use
    rustVisTok,             ## vis
    rustWhereTok,           ## where
    rustWhileTok,           ## while
    rustLCurlyTok,          ## {
    rustPipeTok,            ## |
    rustPipeEqualTok,       ## |=
    rustDoublePipeTok,      ## ||
    rustRCurlyTok,          ## }
    rustSyntaxError          ## Tree-sitter parser syntax error
type
  RustExternalTok* = enum
    rustExtern_string_content, ## _string_content
    rustExternRaw_string_literal, ## raw_string_literal
    rustExternFloat_literal, ## float_literal
    rustExternBlock_comment  ## block_comment
type
  TsRustNode* = distinct TSNode
type
  RustParser* = distinct PtsParser
proc tsNodeType*(node: TsRustNode): string
proc kind*(node: TsRustNode): RustNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_declaration_statement":
      rustDeclarationStatement
    of "_expression":
      rustExpression
    of "_literal":
      rustLiteral
    of "_literal_pattern":
      rustLiteralPattern
    of "_pattern":
      rustPattern
    of "_type":
      rustType
    of "abstract_type":
      rustAbstractType
    of "arguments":
      rustArguments
    of "array_expression":
      rustArrayExpression
    of "array_type":
      rustArrayType
    of "assignment_expression":
      rustAssignmentExpression
    of "associated_type":
      rustAssociatedType
    of "async_block":
      rustAsyncBlock
    of "attribute_item":
      rustAttributeItem
    of "await_expression":
      rustAwaitExpression
    of "base_field_initializer":
      rustBaseFieldInitializer
    of "binary_expression":
      rustBinaryExpression
    of "block":
      rustBlock
    of "boolean_literal":
      rustBooleanLiteral
    of "bounded_type":
      rustBoundedType
    of "bracketed_type":
      rustBracketedType
    of "break_expression":
      rustBreakExpression
    of "call_expression":
      rustCallExpression
    of "captured_pattern":
      rustCapturedPattern
    of "closure_expression":
      rustClosureExpression
    of "closure_parameters":
      rustClosureParameters
    of "compound_assignment_expr":
      rustCompoundAssignmentExpr
    of "const_block":
      rustConstBlock
    of "const_item":
      rustConstItem
    of "const_parameter":
      rustConstParameter
    of "constrained_type_parameter":
      rustConstrainedTypeParameter
    of "continue_expression":
      rustContinueExpression
    of "declaration_list":
      rustDeclarationList
    of "dynamic_type":
      rustDynamicType
    of "else_clause":
      rustElseClause
    of "empty_statement":
      rustEmptyStatement
    of "empty_type":
      rustEmptyType
    of "enum_item":
      rustEnumItem
    of "enum_variant":
      rustEnumVariant
    of "enum_variant_list":
      rustEnumVariantList
    of "extern_crate_declaration":
      rustExternCrateDeclaration
    of "extern_modifier":
      rustExternModifier
    of "field_declaration":
      rustFieldDeclaration
    of "field_declaration_list":
      rustFieldDeclarationList
    of "field_expression":
      rustFieldExpression
    of "field_initializer":
      rustFieldInitializer
    of "field_initializer_list":
      rustFieldInitializerList
    of "field_pattern":
      rustFieldPattern
    of "for_expression":
      rustForExpression
    of "for_lifetimes":
      rustForLifetimes
    of "foreign_mod_item":
      rustForeignModItem
    of "fragment_specifier":
      rustFragmentSpecifier
    of "function_item":
      rustFunctionItem
    of "function_modifiers":
      rustFunctionModifiers
    of "function_signature_item":
      rustFunctionSignatureItem
    of "function_type":
      rustFunctionType
    of "generic_function":
      rustGenericFunction
    of "generic_type":
      rustGenericType
    of "generic_type_with_turbofish":
      rustGenericTypeWithTurbofish
    of "higher_ranked_trait_bound":
      rustHigherRankedTraitBound
    of "if_expression":
      rustIfExpression
    of "if_let_expression":
      rustIfLetExpression
    of "impl_item":
      rustImplItem
    of "index_expression":
      rustIndexExpression
    of "inner_attribute_item":
      rustInnerAttributeItem
    of "let_declaration":
      rustLetDeclaration
    of "lifetime":
      rustLifetime
    of "loop_expression":
      rustLoopExpression
    of "loop_label":
      rustLoopLabel
    of "macro_definition":
      rustMacroDefinition
    of "macro_invocation":
      rustMacroInvocation
    of "macro_rule":
      rustMacroRule
    of "match_arm":
      rustMatchArm
    of "match_block":
      rustMatchBlock
    of "match_expression":
      rustMatchExpression
    of "match_pattern":
      rustMatchPattern
    of "meta_arguments":
      rustMetaArguments
    of "meta_item":
      rustMetaItem
    of "mod_item":
      rustModItem
    of "mut_pattern":
      rustMutPattern
    of "negative_literal":
      rustNegativeLiteral
    of "optional_type_parameter":
      rustOptionalTypeParameter
    of "or_pattern":
      rustOrPattern
    of "ordered_field_declaration_list":
      rustOrderedFieldDeclarationList
    of "parameter":
      rustParameter
    of "parameters":
      rustParameters
    of "parenthesized_expression":
      rustParenthesizedExpression
    of "pointer_type":
      rustPointerType
    of "qualified_type":
      rustQualifiedType
    of "range_expression":
      rustRangeExpression
    of "range_pattern":
      rustRangePattern
    of "ref_pattern":
      rustRefPattern
    of "reference_expression":
      rustReferenceExpression
    of "reference_pattern":
      rustReferencePattern
    of "reference_type":
      rustReferenceType
    of "remaining_field_pattern":
      rustRemainingFieldPattern
    of "removed_trait_bound":
      rustRemovedTraitBound
    of "return_expression":
      rustReturnExpression
    of "scoped_identifier":
      rustScopedIdentifier
    of "scoped_type_identifier":
      rustScopedTypeIdentifier
    of "scoped_use_list":
      rustScopedUseList
    of "self_parameter":
      rustSelfParameter
    of "shorthand_field_initializer":
      rustShorthandFieldInitializer
    of "slice_pattern":
      rustSlicePattern
    of "source_file":
      rustSourceFile
    of "static_item":
      rustStaticItem
    of "string_literal":
      rustStringLiteral
    of "struct_expression":
      rustStructExpression
    of "struct_item":
      rustStructItem
    of "struct_pattern":
      rustStructPattern
    of "token_binding_pattern":
      rustTokenBindingPattern
    of "token_repetition":
      rustTokenRepetition
    of "token_repetition_pattern":
      rustTokenRepetitionPattern
    of "token_tree":
      rustTokenTree
    of "token_tree_pattern":
      rustTokenTreePattern
    of "trait_bounds":
      rustTraitBounds
    of "trait_item":
      rustTraitItem
    of "try_expression":
      rustTryExpression
    of "tuple_expression":
      rustTupleExpression
    of "tuple_pattern":
      rustTuplePattern
    of "tuple_struct_pattern":
      rustTupleStructPattern
    of "tuple_type":
      rustTupleType
    of "type_arguments":
      rustTypeArguments
    of "type_binding":
      rustTypeBinding
    of "type_cast_expression":
      rustTypeCastExpression
    of "type_item":
      rustTypeItem
    of "type_parameters":
      rustTypeParameters
    of "unary_expression":
      rustUnaryExpression
    of "union_item":
      rustUnionItem
    of "unit_expression":
      rustUnitExpression
    of "unit_type":
      rustUnitType
    of "unsafe_block":
      rustUnsafeBlock
    of "use_as_clause":
      rustUseAsClause
    of "use_declaration":
      rustUseDeclaration
    of "use_list":
      rustUseList
    of "use_wildcard":
      rustUseWildcard
    of "variadic_parameter":
      rustVariadicParameter
    of "visibility_modifier":
      rustVisibilityModifier
    of "where_clause":
      rustWhereClause
    of "where_predicate":
      rustWherePredicate
    of "while_expression":
      rustWhileExpression
    of "while_let_expression":
      rustWhileLetExpression
    of "!":
      rustExclamationTok
    of "!=":
      rustExclamationEqualTok
    of "\"":
      rustQuoteTok
    of "#":
      rustHashTok
    of "$":
      rustDollarTok
    of "%":
      rustPercentTok
    of "%=":
      rustPercentEqualTok
    of "&":
      rustAmpersandTok
    of "&&":
      rustDoubleAmpersandTok
    of "&=":
      rustAmpersandEqualTok
    of "\'":
      rustApostropheTok
    of "(":
      rustLParTok
    of ")":
      rustRParTok
    of "*":
      rustAsteriskTok
    of "*=":
      rustAsteriskEqualTok
    of "+":
      rustPlusTok
    of "+=":
      rustPlusEqualTok
    of ",":
      rustCommaTok
    of "-":
      rustMinusTok
    of "-=":
      rustMinusEqualTok
    of "->":
      rustMinusGreaterThanTok
    of ".":
      rustDotTok
    of "..":
      rustDoubleDotTok
    of "...":
      rustTripleDotTok
    of "..=":
      rustDoubleDotEqualTok
    of "/":
      rustSlashTok
    of "/=":
      rustSlashEqualTok
    of ":":
      rustColonTok
    of "::":
      rustDoubleColonTok
    of ";":
      rustSemicolonTok
    of "<":
      rustLessThanTok
    of "<<":
      rustDoubleLessThanTok
    of "<<=":
      rustDoubleLessThanEqualTok
    of "<=":
      rustLessThanEqualTok
    of "=":
      rustEqualTok
    of "==":
      rustDoubleEqualTok
    of "=>":
      rustEqualGreaterThanTok
    of ">":
      rustGreaterThanTok
    of ">=":
      rustGreaterThanEqualTok
    of ">>":
      rustDoubleGreaterThanTok
    of ">>=":
      rustDoubleGreaterThanEqualTok
    of "?":
      rustQuestionTok
    of "@":
      rustAtTok
    of "[":
      rustLBrackTok
    of "]":
      rustRBrackTok
    of "^":
      rustAccentTok
    of "^=":
      rustAccentEqualTok
    of "_":
      rustUnderscoreTok
    of "as":
      rustAsTok
    of "async":
      rustAsyncTok
    of "await":
      rustAwaitTok
    of "block_comment":
      rustBlockComment
    of "break":
      rustBreakTok
    of "char_literal":
      rustCharLiteral
    of "const":
      rustConstTok
    of "continue":
      rustContinueTok
    of "crate":
      rustCrate
    of "default":
      rustDefaultTok
    of "dyn":
      rustDynTok
    of "else":
      rustElseTok
    of "enum":
      rustEnumTok
    of "escape_sequence":
      rustEscapeSequence
    of "expr":
      rustExprTok
    of "extern":
      rustExternTok
    of "false":
      rustFalseTok
    of "field_identifier":
      rustFieldIdentifier
    of "float_literal":
      rustFloatLiteral
    of "fn":
      rustFnTok
    of "for":
      rustForTok
    of "ident":
      rustIdentTok
    of "identifier":
      rustIdentifier
    of "if":
      rustIfTok
    of "impl":
      rustImplTok
    of "in":
      rustInTok
    of "integer_literal":
      rustIntegerLiteral
    of "item":
      rustItemTok
    of "let":
      rustLetTok
    of "line_comment":
      rustLineComment
    of "literal":
      rustLiteralTok
    of "loop":
      rustLoopTok
    of "macro_rules!":
      rustMacroUnderscorerulesExclamationTok
    of "match":
      rustMatchTok
    of "meta":
      rustMetaTok
    of "metavariable":
      rustMetavariable
    of "mod":
      rustModTok
    of "move":
      rustMoveTok
    of "mutable_specifier":
      rustMutableSpecifier
    of "pat":
      rustPatTok
    of "path":
      rustPathTok
    of "primitive_type":
      rustPrimitiveType
    of "pub":
      rustPubTok
    of "raw_string_literal":
      rustRawStringLiteral
    of "ref":
      rustRefTok
    of "return":
      rustReturnTok
    of "self":
      rustSelf
    of "shorthand_field_identifier":
      rustShorthandFieldIdentifier
    of "static":
      rustStaticTok
    of "stmt":
      rustStmtTok
    of "struct":
      rustStructTok
    of "super":
      rustSuper
    of "trait":
      rustTraitTok
    of "true":
      rustTrueTok
    of "tt":
      rustTtTok
    of "ty":
      rustTyTok
    of "type":
      rustTypeTok
    of "type_identifier":
      rustTypeIdentifier
    of "union":
      rustUnionTok
    of "unsafe":
      rustUnsafeTok
    of "use":
      rustUseTok
    of "vis":
      rustVisTok
    of "where":
      rustWhereTok
    of "while":
      rustWhileTok
    of "{":
      rustLCurlyTok
    of "|":
      rustPipeTok
    of "|=":
      rustPipeEqualTok
    of "||":
      rustDoublePipeTok
    of "}":
      rustRCurlyTok
    of "ERROR":
      rustSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

type
  RustNode* = HtsNode[TsRustNode, RustNodeKind]
func isNil*(node: TsRustNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsRustNode; unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

func has*(node: TsRustNode; idx: int; unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_rust(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: TsRustNode): string =
  $ts_node_type(TSNode(node))

proc newTsRustParser*(): RustParser =
  result = RustParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_rust())

proc parseString*(parser: RustParser; str: string): TsRustNode =
  TsRustNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseTsRustString*(str: string): TsRustNode =
  let parser = newTsRustParser()
  return parseString(parser, str)

func `$`*(node: TsRustNode): string =
  if isNil(node):
    "<nil tree>"
  else:
    $node.kind

func `[]`*(node: TsRustNode; idx: int; kind: RustNodeKind | set[RustNodeKind]): TsRustNode =
  assert 0 <= idx and idx < node.len
  result = TsRustNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind,
             "Child node at index " & $idx & " for node kind " & $node.kind)

proc treeReprTsRust*(str: string; unnamed: bool = false): string =
  treeRepr[TsRustNode, RustNodeKind](parseTsRustString(str), str, 4,
                                     unnamed = unnamed)

proc toHtsNode*(node: TsRustNode; str: ptr string): HtsNode[TsRustNode,
    RustNodeKind] =
  toHtsNode[TsRustNode, RustNodeKind](node, str)

proc toHtsTree*(node: TsRustNode; str: ptr string): RustNode =
  toHtsNode[TsRustNode, RustNodeKind](node, str)

proc parseRustString*(str: ptr string; unnamed: bool = false): RustNode =
  let parser = newTsRustParser()
  return toHtsTree[TsRustNode, RustNodeKind](parseString(parser, str[]), str)

proc parseRustString*(str: string; unnamed: bool = false): RustNode =
  let parser = newTsRustParser()
  return toHtsTree[TsRustNode, RustNodeKind](parseString(parser, str),
      unsafeAddr str, storePtr = false)
