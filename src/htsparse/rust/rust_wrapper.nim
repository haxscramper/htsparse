import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  RustNodeKind* = enum
    rustDeclarationStatement               ## _declaration_statement
    rustExpression                         ## _expression
    rustLiteral                            ## _literal
    rustLiteralPattern                     ## _literal_pattern
    rustPattern                            ## _pattern
    rustType                               ## _type
    rustAbstractType                       ## abstract_type
    rustArguments                          ## arguments
    rustArrayExpression                    ## array_expression
    rustArrayType                          ## array_type
    rustAssignmentExpression               ## assignment_expression
    rustAssociatedType                     ## associated_type
    rustAsyncBlock                         ## async_block
    rustAttributeItem                      ## attribute_item
    rustAwaitExpression                    ## await_expression
    rustBaseFieldInitializer               ## base_field_initializer
    rustBinaryExpression                   ## binary_expression
    rustBlock                              ## block
    rustBooleanLiteral                     ## boolean_literal
    rustBoundedType                        ## bounded_type
    rustBracketedType                      ## bracketed_type
    rustBreakExpression                    ## break_expression
    rustCallExpression                     ## call_expression
    rustCapturedPattern                    ## captured_pattern
    rustClosureExpression                  ## closure_expression
    rustClosureParameters                  ## closure_parameters
    rustCompoundAssignmentExpr             ## compound_assignment_expr
    rustConstBlock                         ## const_block
    rustConstItem                          ## const_item
    rustConstParameter                     ## const_parameter
    rustConstrainedTypeParameter           ## constrained_type_parameter
    rustContinueExpression                 ## continue_expression
    rustDeclarationList                    ## declaration_list
    rustDynamicType                        ## dynamic_type
    rustElseClause                         ## else_clause
    rustEmptyStatement                     ## empty_statement
    rustEmptyType                          ## empty_type
    rustEnumItem                           ## enum_item
    rustEnumVariant                        ## enum_variant
    rustEnumVariantList                    ## enum_variant_list
    rustExternCrateDeclaration             ## extern_crate_declaration
    rustExternModifier                     ## extern_modifier
    rustFieldDeclaration                   ## field_declaration
    rustFieldDeclarationList               ## field_declaration_list
    rustFieldExpression                    ## field_expression
    rustFieldInitializer                   ## field_initializer
    rustFieldInitializerList               ## field_initializer_list
    rustFieldPattern                       ## field_pattern
    rustForExpression                      ## for_expression
    rustForLifetimes                       ## for_lifetimes
    rustForeignModItem                     ## foreign_mod_item
    rustFragmentSpecifier                  ## fragment_specifier
    rustFunctionItem                       ## function_item
    rustFunctionModifiers                  ## function_modifiers
    rustFunctionSignatureItem              ## function_signature_item
    rustFunctionType                       ## function_type
    rustGenericFunction                    ## generic_function
    rustGenericType                        ## generic_type
    rustGenericTypeWithTurbofish           ## generic_type_with_turbofish
    rustHigherRankedTraitBound             ## higher_ranked_trait_bound
    rustIfExpression                       ## if_expression
    rustIfLetExpression                    ## if_let_expression
    rustImplItem                           ## impl_item
    rustIndexExpression                    ## index_expression
    rustInnerAttributeItem                 ## inner_attribute_item
    rustLetDeclaration                     ## let_declaration
    rustLifetime                           ## lifetime
    rustLoopExpression                     ## loop_expression
    rustLoopLabel                          ## loop_label
    rustMacroDefinition                    ## macro_definition
    rustMacroInvocation                    ## macro_invocation
    rustMacroRule                          ## macro_rule
    rustMatchArm                           ## match_arm
    rustMatchBlock                         ## match_block
    rustMatchExpression                    ## match_expression
    rustMatchPattern                       ## match_pattern
    rustMetaArguments                      ## meta_arguments
    rustMetaItem                           ## meta_item
    rustModItem                            ## mod_item
    rustMutPattern                         ## mut_pattern
    rustNegativeLiteral                    ## negative_literal
    rustOptionalTypeParameter              ## optional_type_parameter
    rustOrPattern                          ## or_pattern
    rustOrderedFieldDeclarationList        ## ordered_field_declaration_list
    rustParameter                          ## parameter
    rustParameters                         ## parameters
    rustParenthesizedExpression            ## parenthesized_expression
    rustPointerType                        ## pointer_type
    rustQualifiedType                      ## qualified_type
    rustRangeExpression                    ## range_expression
    rustRangePattern                       ## range_pattern
    rustRefPattern                         ## ref_pattern
    rustReferenceExpression                ## reference_expression
    rustReferencePattern                   ## reference_pattern
    rustReferenceType                      ## reference_type
    rustRemainingFieldPattern              ## remaining_field_pattern
    rustRemovedTraitBound                  ## removed_trait_bound
    rustReturnExpression                   ## return_expression
    rustScopedIdentifier                   ## scoped_identifier
    rustScopedTypeIdentifier               ## scoped_type_identifier
    rustScopedUseList                      ## scoped_use_list
    rustSelfParameter                      ## self_parameter
    rustShorthandFieldInitializer          ## shorthand_field_initializer
    rustSlicePattern                       ## slice_pattern
    rustSourceFile                         ## source_file
    rustStaticItem                         ## static_item
    rustStringLiteral                      ## string_literal
    rustStructExpression                   ## struct_expression
    rustStructItem                         ## struct_item
    rustStructPattern                      ## struct_pattern
    rustTokenBindingPattern                ## token_binding_pattern
    rustTokenRepetition                    ## token_repetition
    rustTokenRepetitionPattern             ## token_repetition_pattern
    rustTokenTree                          ## token_tree
    rustTokenTreePattern                   ## token_tree_pattern
    rustTraitBounds                        ## trait_bounds
    rustTraitItem                          ## trait_item
    rustTryExpression                      ## try_expression
    rustTupleExpression                    ## tuple_expression
    rustTuplePattern                       ## tuple_pattern
    rustTupleStructPattern                 ## tuple_struct_pattern
    rustTupleType                          ## tuple_type
    rustTypeArguments                      ## type_arguments
    rustTypeBinding                        ## type_binding
    rustTypeCastExpression                 ## type_cast_expression
    rustTypeItem                           ## type_item
    rustTypeParameters                     ## type_parameters
    rustUnaryExpression                    ## unary_expression
    rustUnionItem                          ## union_item
    rustUnitExpression                     ## unit_expression
    rustUnitType                           ## unit_type
    rustUnsafeBlock                        ## unsafe_block
    rustUseAsClause                        ## use_as_clause
    rustUseDeclaration                     ## use_declaration
    rustUseList                            ## use_list
    rustUseWildcard                        ## use_wildcard
    rustVariadicParameter                  ## variadic_parameter
    rustVisibilityModifier                 ## visibility_modifier
    rustWhereClause                        ## where_clause
    rustWherePredicate                     ## where_predicate
    rustWhileExpression                    ## while_expression
    rustWhileLetExpression                 ## while_let_expression
    rustExclamationTok                     ## !
    rustExclamationEqualTok                ## !=
    rustQuoteTok                           ## "
    rustHashTok                            ## #
    rustDollarTok                          ## $
    rustPercentTok                         ## %
    rustPercentEqualTok                    ## %=
    rustAmpersandTok                       ## &
    rustDoubleAmpersandTok                 ## &&
    rustAmpersandEqualTok                  ## &=
    rustApostropheTok                      ## '
    rustLParTok                            ## (
    rustRParTok                            ## )
    rustAsteriskTok                        ## *
    rustAsteriskEqualTok                   ## *=
    rustPlusTok                            ## +
    rustPlusEqualTok                       ## +=
    rustCommaTok                           ## ,
    rustMinusTok                           ## -
    rustMinusEqualTok                      ## -=
    rustMinusGreaterThanTok                ## ->
    rustDotTok                             ## .
    rustDoubleDotTok                       ## ..
    rustTripleDotTok                       ## ...
    rustDoubleDotEqualTok                  ## ..=
    rustSlashTok                           ## /
    rustSlashEqualTok                      ## /=
    rustColonTok                           ## :
    rustDoubleColonTok                     ## ::
    rustSemicolonTok                       ## ;
    rustLessThanTok                        ## <
    rustDoubleLessThanTok                  ## <<
    rustDoubleLessThanEqualTok             ## <<=
    rustLessThanEqualTok                   ## <=
    rustEqualTok                           ## =
    rustDoubleEqualTok                     ## ==
    rustEqualGreaterThanTok                ## =>
    rustGreaterThanTok                     ## >
    rustGreaterThanEqualTok                ## >=
    rustDoubleGreaterThanTok               ## >>
    rustDoubleGreaterThanEqualTok          ## >>=
    rustQuestionTok                        ## ?
    rustAtTok                              ## @
    rustLBrackTok                          ## [
    rustRBrackTok                          ## ]
    rustAccentTok                          ## ^
    rustAccentEqualTok                     ## ^=
    rustUnderscoreTok                      ## _
    rustAsTok                              ## as
    rustAsyncTok                           ## async
    rustAwaitTok                           ## await
    rustBlockTok                           ## block
    rustBlockComment                       ## block_comment
    rustBreakTok                           ## break
    rustCharLiteral                        ## char_literal
    rustConstTok                           ## const
    rustContinueTok                        ## continue
    rustCrate                              ## crate
    rustDefaultTok                         ## default
    rustDynTok                             ## dyn
    rustElseTok                            ## else
    rustEnumTok                            ## enum
    rustEscapeSequence                     ## escape_sequence
    rustExprTok                            ## expr
    rustExternTok                          ## extern
    rustFalseTok                           ## false
    rustFieldIdentifier                    ## field_identifier
    rustFloatLiteral                       ## float_literal
    rustFnTok                              ## fn
    rustForTok                             ## for
    rustIdentTok                           ## ident
    rustIdentifier                         ## identifier
    rustIfTok                              ## if
    rustImplTok                            ## impl
    rustInTok                              ## in
    rustIntegerLiteral                     ## integer_literal
    rustItemTok                            ## item
    rustLetTok                             ## let
    rustLifetimeTok                        ## lifetime
    rustLineComment                        ## line_comment
    rustLiteralTok                         ## literal
    rustLoopTok                            ## loop
    rustMacroUnderscorerulesExclamationTok ## macro_rules!
    rustMatchTok                           ## match
    rustMetaTok                            ## meta
    rustMetavariable                       ## metavariable
    rustModTok                             ## mod
    rustMoveTok                            ## move
    rustMutableSpecifier                   ## mutable_specifier
    rustPatTok                             ## pat
    rustPathTok                            ## path
    rustPrimitiveType                      ## primitive_type
    rustPubTok                             ## pub
    rustRawStringLiteral                   ## raw_string_literal
    rustRefTok                             ## ref
    rustReturnTok                          ## return
    rustSelf                               ## self
    rustShorthandFieldIdentifier           ## shorthand_field_identifier
    rustStaticTok                          ## static
    rustStmtTok                            ## stmt
    rustStructTok                          ## struct
    rustSuper                              ## super
    rustTraitTok                           ## trait
    rustTrueTok                            ## true
    rustTtTok                              ## tt
    rustTyTok                              ## ty
    rustTypeTok                            ## type
    rustTypeIdentifier                     ## type_identifier
    rustUnionTok                           ## union
    rustUnsafeTok                          ## unsafe
    rustUseTok                             ## use
    rustVisTok                             ## vis
    rustWhereTok                           ## where
    rustWhileTok                           ## while
    rustLCurlyTok                          ## {
    rustPipeTok                            ## |
    rustPipeEqualTok                       ## |=
    rustDoublePipeTok                      ## ||
    rustRCurlyTok                          ## }
    rustSyntaxError                        ## Tree-sitter parser syntax error


proc strRepr*(kind: RustNodeKind): string =
  case kind:
    of rustDeclarationStatement:               "_declaration_statement"
    of rustExpression:                         "_expression"
    of rustLiteral:                            "_literal"
    of rustLiteralPattern:                     "_literal_pattern"
    of rustPattern:                            "_pattern"
    of rustType:                               "_type"
    of rustAbstractType:                       "abstract_type"
    of rustArguments:                          "arguments"
    of rustArrayExpression:                    "array_expression"
    of rustArrayType:                          "array_type"
    of rustAssignmentExpression:               "assignment_expression"
    of rustAssociatedType:                     "associated_type"
    of rustAsyncBlock:                         "async_block"
    of rustAttributeItem:                      "attribute_item"
    of rustAwaitExpression:                    "await_expression"
    of rustBaseFieldInitializer:               "base_field_initializer"
    of rustBinaryExpression:                   "binary_expression"
    of rustBlock:                              "block"
    of rustBooleanLiteral:                     "boolean_literal"
    of rustBoundedType:                        "bounded_type"
    of rustBracketedType:                      "bracketed_type"
    of rustBreakExpression:                    "break_expression"
    of rustCallExpression:                     "call_expression"
    of rustCapturedPattern:                    "captured_pattern"
    of rustClosureExpression:                  "closure_expression"
    of rustClosureParameters:                  "closure_parameters"
    of rustCompoundAssignmentExpr:             "compound_assignment_expr"
    of rustConstBlock:                         "const_block"
    of rustConstItem:                          "const_item"
    of rustConstParameter:                     "const_parameter"
    of rustConstrainedTypeParameter:           "constrained_type_parameter"
    of rustContinueExpression:                 "continue_expression"
    of rustDeclarationList:                    "declaration_list"
    of rustDynamicType:                        "dynamic_type"
    of rustElseClause:                         "else_clause"
    of rustEmptyStatement:                     "empty_statement"
    of rustEmptyType:                          "empty_type"
    of rustEnumItem:                           "enum_item"
    of rustEnumVariant:                        "enum_variant"
    of rustEnumVariantList:                    "enum_variant_list"
    of rustExternCrateDeclaration:             "extern_crate_declaration"
    of rustExternModifier:                     "extern_modifier"
    of rustFieldDeclaration:                   "field_declaration"
    of rustFieldDeclarationList:               "field_declaration_list"
    of rustFieldExpression:                    "field_expression"
    of rustFieldInitializer:                   "field_initializer"
    of rustFieldInitializerList:               "field_initializer_list"
    of rustFieldPattern:                       "field_pattern"
    of rustForExpression:                      "for_expression"
    of rustForLifetimes:                       "for_lifetimes"
    of rustForeignModItem:                     "foreign_mod_item"
    of rustFragmentSpecifier:                  "fragment_specifier"
    of rustFunctionItem:                       "function_item"
    of rustFunctionModifiers:                  "function_modifiers"
    of rustFunctionSignatureItem:              "function_signature_item"
    of rustFunctionType:                       "function_type"
    of rustGenericFunction:                    "generic_function"
    of rustGenericType:                        "generic_type"
    of rustGenericTypeWithTurbofish:           "generic_type_with_turbofish"
    of rustHigherRankedTraitBound:             "higher_ranked_trait_bound"
    of rustIfExpression:                       "if_expression"
    of rustIfLetExpression:                    "if_let_expression"
    of rustImplItem:                           "impl_item"
    of rustIndexExpression:                    "index_expression"
    of rustInnerAttributeItem:                 "inner_attribute_item"
    of rustLetDeclaration:                     "let_declaration"
    of rustLifetime:                           "lifetime"
    of rustLoopExpression:                     "loop_expression"
    of rustLoopLabel:                          "loop_label"
    of rustMacroDefinition:                    "macro_definition"
    of rustMacroInvocation:                    "macro_invocation"
    of rustMacroRule:                          "macro_rule"
    of rustMatchArm:                           "match_arm"
    of rustMatchBlock:                         "match_block"
    of rustMatchExpression:                    "match_expression"
    of rustMatchPattern:                       "match_pattern"
    of rustMetaArguments:                      "meta_arguments"
    of rustMetaItem:                           "meta_item"
    of rustModItem:                            "mod_item"
    of rustMutPattern:                         "mut_pattern"
    of rustNegativeLiteral:                    "negative_literal"
    of rustOptionalTypeParameter:              "optional_type_parameter"
    of rustOrPattern:                          "or_pattern"
    of rustOrderedFieldDeclarationList:        "ordered_field_declaration_list"
    of rustParameter:                          "parameter"
    of rustParameters:                         "parameters"
    of rustParenthesizedExpression:            "parenthesized_expression"
    of rustPointerType:                        "pointer_type"
    of rustQualifiedType:                      "qualified_type"
    of rustRangeExpression:                    "range_expression"
    of rustRangePattern:                       "range_pattern"
    of rustRefPattern:                         "ref_pattern"
    of rustReferenceExpression:                "reference_expression"
    of rustReferencePattern:                   "reference_pattern"
    of rustReferenceType:                      "reference_type"
    of rustRemainingFieldPattern:              "remaining_field_pattern"
    of rustRemovedTraitBound:                  "removed_trait_bound"
    of rustReturnExpression:                   "return_expression"
    of rustScopedIdentifier:                   "scoped_identifier"
    of rustScopedTypeIdentifier:               "scoped_type_identifier"
    of rustScopedUseList:                      "scoped_use_list"
    of rustSelfParameter:                      "self_parameter"
    of rustShorthandFieldInitializer:          "shorthand_field_initializer"
    of rustSlicePattern:                       "slice_pattern"
    of rustSourceFile:                         "source_file"
    of rustStaticItem:                         "static_item"
    of rustStringLiteral:                      "string_literal"
    of rustStructExpression:                   "struct_expression"
    of rustStructItem:                         "struct_item"
    of rustStructPattern:                      "struct_pattern"
    of rustTokenBindingPattern:                "token_binding_pattern"
    of rustTokenRepetition:                    "token_repetition"
    of rustTokenRepetitionPattern:             "token_repetition_pattern"
    of rustTokenTree:                          "token_tree"
    of rustTokenTreePattern:                   "token_tree_pattern"
    of rustTraitBounds:                        "trait_bounds"
    of rustTraitItem:                          "trait_item"
    of rustTryExpression:                      "try_expression"
    of rustTupleExpression:                    "tuple_expression"
    of rustTuplePattern:                       "tuple_pattern"
    of rustTupleStructPattern:                 "tuple_struct_pattern"
    of rustTupleType:                          "tuple_type"
    of rustTypeArguments:                      "type_arguments"
    of rustTypeBinding:                        "type_binding"
    of rustTypeCastExpression:                 "type_cast_expression"
    of rustTypeItem:                           "type_item"
    of rustTypeParameters:                     "type_parameters"
    of rustUnaryExpression:                    "unary_expression"
    of rustUnionItem:                          "union_item"
    of rustUnitExpression:                     "unit_expression"
    of rustUnitType:                           "unit_type"
    of rustUnsafeBlock:                        "unsafe_block"
    of rustUseAsClause:                        "use_as_clause"
    of rustUseDeclaration:                     "use_declaration"
    of rustUseList:                            "use_list"
    of rustUseWildcard:                        "use_wildcard"
    of rustVariadicParameter:                  "variadic_parameter"
    of rustVisibilityModifier:                 "visibility_modifier"
    of rustWhereClause:                        "where_clause"
    of rustWherePredicate:                     "where_predicate"
    of rustWhileExpression:                    "while_expression"
    of rustWhileLetExpression:                 "while_let_expression"
    of rustExclamationTok:                     "!"
    of rustExclamationEqualTok:                "!="
    of rustQuoteTok:                           "\""
    of rustHashTok:                            "#"
    of rustDollarTok:                          "$"
    of rustPercentTok:                         "%"
    of rustPercentEqualTok:                    "%="
    of rustAmpersandTok:                       "&"
    of rustDoubleAmpersandTok:                 "&&"
    of rustAmpersandEqualTok:                  "&="
    of rustApostropheTok:                      "\'"
    of rustLParTok:                            "("
    of rustRParTok:                            ")"
    of rustAsteriskTok:                        "*"
    of rustAsteriskEqualTok:                   "*="
    of rustPlusTok:                            "+"
    of rustPlusEqualTok:                       "+="
    of rustCommaTok:                           ","
    of rustMinusTok:                           "-"
    of rustMinusEqualTok:                      "-="
    of rustMinusGreaterThanTok:                "->"
    of rustDotTok:                             "."
    of rustDoubleDotTok:                       ".."
    of rustTripleDotTok:                       "..."
    of rustDoubleDotEqualTok:                  "..="
    of rustSlashTok:                           "/"
    of rustSlashEqualTok:                      "/="
    of rustColonTok:                           ":"
    of rustDoubleColonTok:                     "::"
    of rustSemicolonTok:                       ";"
    of rustLessThanTok:                        "<"
    of rustDoubleLessThanTok:                  "<<"
    of rustDoubleLessThanEqualTok:             "<<="
    of rustLessThanEqualTok:                   "<="
    of rustEqualTok:                           "="
    of rustDoubleEqualTok:                     "=="
    of rustEqualGreaterThanTok:                "=>"
    of rustGreaterThanTok:                     ">"
    of rustGreaterThanEqualTok:                ">="
    of rustDoubleGreaterThanTok:               ">>"
    of rustDoubleGreaterThanEqualTok:          ">>="
    of rustQuestionTok:                        "?"
    of rustAtTok:                              "@"
    of rustLBrackTok:                          "["
    of rustRBrackTok:                          "]"
    of rustAccentTok:                          "^"
    of rustAccentEqualTok:                     "^="
    of rustUnderscoreTok:                      "_"
    of rustAsTok:                              "as"
    of rustAsyncTok:                           "async"
    of rustAwaitTok:                           "await"
    of rustBlockTok:                           "block"
    of rustBlockComment:                       "block_comment"
    of rustBreakTok:                           "break"
    of rustCharLiteral:                        "char_literal"
    of rustConstTok:                           "const"
    of rustContinueTok:                        "continue"
    of rustCrate:                              "crate"
    of rustDefaultTok:                         "default"
    of rustDynTok:                             "dyn"
    of rustElseTok:                            "else"
    of rustEnumTok:                            "enum"
    of rustEscapeSequence:                     "escape_sequence"
    of rustExprTok:                            "expr"
    of rustExternTok:                          "extern"
    of rustFalseTok:                           "false"
    of rustFieldIdentifier:                    "field_identifier"
    of rustFloatLiteral:                       "float_literal"
    of rustFnTok:                              "fn"
    of rustForTok:                             "for"
    of rustIdentTok:                           "ident"
    of rustIdentifier:                         "identifier"
    of rustIfTok:                              "if"
    of rustImplTok:                            "impl"
    of rustInTok:                              "in"
    of rustIntegerLiteral:                     "integer_literal"
    of rustItemTok:                            "item"
    of rustLetTok:                             "let"
    of rustLifetimeTok:                        "lifetime"
    of rustLineComment:                        "line_comment"
    of rustLiteralTok:                         "literal"
    of rustLoopTok:                            "loop"
    of rustMacroUnderscorerulesExclamationTok: "macro_rules!"
    of rustMatchTok:                           "match"
    of rustMetaTok:                            "meta"
    of rustMetavariable:                       "metavariable"
    of rustModTok:                             "mod"
    of rustMoveTok:                            "move"
    of rustMutableSpecifier:                   "mutable_specifier"
    of rustPatTok:                             "pat"
    of rustPathTok:                            "path"
    of rustPrimitiveType:                      "primitive_type"
    of rustPubTok:                             "pub"
    of rustRawStringLiteral:                   "raw_string_literal"
    of rustRefTok:                             "ref"
    of rustReturnTok:                          "return"
    of rustSelf:                               "self"
    of rustShorthandFieldIdentifier:           "shorthand_field_identifier"
    of rustStaticTok:                          "static"
    of rustStmtTok:                            "stmt"
    of rustStructTok:                          "struct"
    of rustSuper:                              "super"
    of rustTraitTok:                           "trait"
    of rustTrueTok:                            "true"
    of rustTtTok:                              "tt"
    of rustTyTok:                              "ty"
    of rustTypeTok:                            "type"
    of rustTypeIdentifier:                     "type_identifier"
    of rustUnionTok:                           "union"
    of rustUnsafeTok:                          "unsafe"
    of rustUseTok:                             "use"
    of rustVisTok:                             "vis"
    of rustWhereTok:                           "where"
    of rustWhileTok:                           "while"
    of rustLCurlyTok:                          "{"
    of rustPipeTok:                            "|"
    of rustPipeEqualTok:                       "|="
    of rustDoublePipeTok:                      "||"
    of rustRCurlyTok:                          "}"
    of rustSyntaxError:                        "ERROR"


type
  RustExternalTok* = enum
    rustExtern_string_content    ## _string_content
    rustExternRaw_string_literal ## raw_string_literal
    rustExternFloat_literal      ## float_literal
    rustExternBlock_comment      ## block_comment


type
  TsRustNode* = distinct TSNode


type
  RustParser* = distinct PtsParser


const rustAllowedSubnodes*: array[RustNodeKind, set[RustNodeKind]] = block:
                                                                       var tmp: array[RustNodeKind, set[RustNodeKind]]
                                                                       tmp[rustArguments] = {rustExpression, rustAttributeItem}
                                                                       tmp[rustArrayExpression] = {rustExpression, rustAttributeItem}
                                                                       tmp[rustAsyncBlock] = {rustBlock}
                                                                       tmp[rustAttributeItem] = {rustMetaItem}
                                                                       tmp[rustAwaitExpression] = {rustExpression}
                                                                       tmp[rustBaseFieldInitializer] = {rustExpression}
                                                                       tmp[rustBlock] = {rustDeclarationStatement, rustExpression}
                                                                       tmp[rustBoundedType] = {rustType, rustLifetime}
                                                                       tmp[rustBracketedType] = {rustType, rustQualifiedType}
                                                                       tmp[rustBreakExpression] = {rustExpression, rustLoopLabel}
                                                                       tmp[rustCapturedPattern] = {rustPattern}
                                                                       tmp[rustClosureParameters] = {rustPattern, rustParameter}
                                                                       tmp[rustConstItem] = {rustVisibilityModifier}
                                                                       tmp[rustContinueExpression] = {rustLoopLabel}
                                                                       tmp[rustDeclarationList] = {rustDeclarationStatement}
                                                                       tmp[rustElseClause] = {rustBlock, rustIfExpression, rustIfLetExpression}
                                                                       tmp[rustEnumItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustEnumVariant] = {rustVisibilityModifier}
                                                                       tmp[rustEnumVariantList] = {rustAttributeItem, rustEnumVariant}
                                                                       tmp[rustExternCrateDeclaration] = {rustCrate, rustVisibilityModifier}
                                                                       tmp[rustExternModifier] = {rustStringLiteral}
                                                                       tmp[rustFieldDeclaration] = {rustVisibilityModifier}
                                                                       tmp[rustFieldDeclarationList] = {rustAttributeItem, rustFieldDeclaration}
                                                                       tmp[rustFieldInitializer] = {rustAttributeItem}
                                                                       tmp[rustFieldInitializerList] = {rustBaseFieldInitializer, rustFieldInitializer, rustShorthandFieldInitializer}
                                                                       tmp[rustFieldPattern] = {rustMutableSpecifier}
                                                                       tmp[rustForExpression] = {rustLoopLabel}
                                                                       tmp[rustForLifetimes] = {rustLifetime}
                                                                       tmp[rustForeignModItem] = {rustExternModifier, rustVisibilityModifier}
                                                                       tmp[rustFunctionItem] = {rustFunctionModifiers, rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustFunctionModifiers] = {rustExternModifier}
                                                                       tmp[rustFunctionSignatureItem] = {rustFunctionModifiers, rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustFunctionType] = {rustForLifetimes, rustFunctionModifiers}
                                                                       tmp[rustImplItem] = {rustWhereClause}
                                                                       tmp[rustIndexExpression] = {rustExpression}
                                                                       tmp[rustInnerAttributeItem] = {rustMetaItem}
                                                                       tmp[rustLetDeclaration] = {rustMutableSpecifier}
                                                                       tmp[rustLifetime] = {rustIdentifier}
                                                                       tmp[rustLoopExpression] = {rustLoopLabel}
                                                                       tmp[rustLoopLabel] = {rustIdentifier}
                                                                       tmp[rustMacroDefinition] = {rustMacroRule}
                                                                       tmp[rustMacroInvocation] = {rustTokenTree}
                                                                       tmp[rustMatchArm] = {rustAttributeItem}
                                                                       tmp[rustMatchBlock] = {rustMatchArm}
                                                                       tmp[rustMatchPattern] = {rustPattern}
                                                                       tmp[rustMetaArguments] = {rustLiteral, rustMetaItem}
                                                                       tmp[rustMetaItem] = {rustCrate, rustIdentifier, rustMetavariable, rustScopedIdentifier, rustSelf, rustSuper}
                                                                       tmp[rustModItem] = {rustVisibilityModifier}
                                                                       tmp[rustMutPattern] = {rustPattern, rustMutableSpecifier}
                                                                       tmp[rustNegativeLiteral] = {rustFloatLiteral, rustIntegerLiteral}
                                                                       tmp[rustOrPattern] = {rustPattern}
                                                                       tmp[rustOrderedFieldDeclarationList] = {rustAttributeItem, rustVisibilityModifier}
                                                                       tmp[rustParameter] = {rustMutableSpecifier}
                                                                       tmp[rustParameters] = {rustType, rustAttributeItem, rustParameter, rustSelfParameter, rustVariadicParameter}
                                                                       tmp[rustParenthesizedExpression] = {rustExpression}
                                                                       tmp[rustPointerType] = {rustMutableSpecifier}
                                                                       tmp[rustRangeExpression] = {rustExpression}
                                                                       tmp[rustRangePattern] = {
                                                                                                 rustLiteralPattern,
                                                                                                 rustCrate,
                                                                                                 rustIdentifier,
                                                                                                 rustMetavariable,
                                                                                                 rustScopedIdentifier,
                                                                                                 rustSelf,
                                                                                                 rustSuper
                                                                                               }
                                                                       tmp[rustRefPattern] = {rustPattern}
                                                                       tmp[rustReferenceExpression] = {rustMutableSpecifier}
                                                                       tmp[rustReferencePattern] = {rustPattern, rustMutableSpecifier}
                                                                       tmp[rustReferenceType] = {rustLifetime, rustMutableSpecifier}
                                                                       tmp[rustRemovedTraitBound] = {rustType}
                                                                       tmp[rustReturnExpression] = {rustExpression}
                                                                       tmp[rustSelfParameter] = {rustLifetime, rustMutableSpecifier, rustSelf}
                                                                       tmp[rustShorthandFieldInitializer] = {rustAttributeItem, rustIdentifier}
                                                                       tmp[rustSlicePattern] = {rustPattern}
                                                                       tmp[rustSourceFile] = {rustDeclarationStatement, rustExpression}
                                                                       tmp[rustStaticItem] = {rustMutableSpecifier, rustVisibilityModifier}
                                                                       tmp[rustStringLiteral] = {rustEscapeSequence}
                                                                       tmp[rustStructItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustStructPattern] = {rustFieldPattern, rustRemainingFieldPattern}
                                                                       tmp[rustTokenRepetition] = {
                                                                                                    rustLiteral,
                                                                                                    rustCrate,
                                                                                                    rustIdentifier,
                                                                                                    rustMetavariable,
                                                                                                    rustMutableSpecifier,
                                                                                                    rustPrimitiveType,
                                                                                                    rustSelf,
                                                                                                    rustSuper,
                                                                                                    rustTokenRepetition,
                                                                                                    rustTokenTree
                                                                                                  }
                                                                       tmp[rustTokenRepetitionPattern] = {
                                                                                                           rustLiteral,
                                                                                                           rustCrate,
                                                                                                           rustIdentifier,
                                                                                                           rustMetavariable,
                                                                                                           rustMutableSpecifier,
                                                                                                           rustPrimitiveType,
                                                                                                           rustSelf,
                                                                                                           rustSuper,
                                                                                                           rustTokenBindingPattern,
                                                                                                           rustTokenRepetitionPattern,
                                                                                                           rustTokenTreePattern
                                                                                                         }
                                                                       tmp[rustTokenTree] = {
                                                                                              rustLiteral,
                                                                                              rustCrate,
                                                                                              rustIdentifier,
                                                                                              rustMetavariable,
                                                                                              rustMutableSpecifier,
                                                                                              rustPrimitiveType,
                                                                                              rustSelf,
                                                                                              rustSuper,
                                                                                              rustTokenRepetition,
                                                                                              rustTokenTree
                                                                                            }
                                                                       tmp[rustTokenTreePattern] = {
                                                                                                     rustLiteral,
                                                                                                     rustCrate,
                                                                                                     rustIdentifier,
                                                                                                     rustMetavariable,
                                                                                                     rustMutableSpecifier,
                                                                                                     rustPrimitiveType,
                                                                                                     rustSelf,
                                                                                                     rustSuper,
                                                                                                     rustTokenBindingPattern,
                                                                                                     rustTokenRepetitionPattern,
                                                                                                     rustTokenTreePattern
                                                                                                   }
                                                                       tmp[rustTraitBounds] = {rustType, rustHigherRankedTraitBound, rustLifetime, rustRemovedTraitBound}
                                                                       tmp[rustTraitItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustTryExpression] = {rustExpression}
                                                                       tmp[rustTupleExpression] = {rustExpression, rustAttributeItem}
                                                                       tmp[rustTuplePattern] = {rustPattern}
                                                                       tmp[rustTupleStructPattern] = {rustPattern}
                                                                       tmp[rustTupleType] = {rustType}
                                                                       tmp[rustTypeArguments] = {rustLiteral, rustType, rustBlock, rustLifetime, rustTypeBinding}
                                                                       tmp[rustTypeItem] = {rustVisibilityModifier}
                                                                       tmp[rustTypeParameters] = {rustConstParameter, rustConstrainedTypeParameter, rustLifetime, rustMetavariable, rustOptionalTypeParameter, rustTypeIdentifier}
                                                                       tmp[rustUnaryExpression] = {rustExpression}
                                                                       tmp[rustUnionItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustUnsafeBlock] = {rustBlock}
                                                                       tmp[rustUseDeclaration] = {rustVisibilityModifier}
                                                                       tmp[rustUseList] = {
                                                                                            rustCrate,
                                                                                            rustIdentifier,
                                                                                            rustMetavariable,
                                                                                            rustScopedIdentifier,
                                                                                            rustScopedUseList,
                                                                                            rustSelf,
                                                                                            rustSuper,
                                                                                            rustUseAsClause,
                                                                                            rustUseList,
                                                                                            rustUseWildcard
                                                                                          }
                                                                       tmp[rustUseWildcard] = {rustCrate, rustIdentifier, rustMetavariable, rustScopedIdentifier, rustSelf, rustSuper}
                                                                       tmp[rustVisibilityModifier] = {rustCrate, rustIdentifier, rustMetavariable, rustScopedIdentifier, rustSelf, rustSuper}
                                                                       tmp[rustWhereClause] = {rustWherePredicate}
                                                                       tmp[rustWhileExpression] = {rustLoopLabel}
                                                                       tmp[rustWhileLetExpression] = {rustLoopLabel}
                                                                       tmp
const rustTokenKinds*: set[RustNodeKind] = {
                                             rustExclamationTok,
                                             rustExclamationEqualTok,
                                             rustQuoteTok,
                                             rustHashTok,
                                             rustDollarTok,
                                             rustPercentTok,
                                             rustPercentEqualTok,
                                             rustAmpersandTok,
                                             rustDoubleAmpersandTok,
                                             rustAmpersandEqualTok,
                                             rustApostropheTok,
                                             rustLParTok,
                                             rustRParTok,
                                             rustAsteriskTok,
                                             rustAsteriskEqualTok,
                                             rustPlusTok,
                                             rustPlusEqualTok,
                                             rustCommaTok,
                                             rustMinusTok,
                                             rustMinusEqualTok,
                                             rustMinusGreaterThanTok,
                                             rustDotTok,
                                             rustDoubleDotTok,
                                             rustTripleDotTok,
                                             rustDoubleDotEqualTok,
                                             rustSlashTok,
                                             rustSlashEqualTok,
                                             rustColonTok,
                                             rustDoubleColonTok,
                                             rustSemicolonTok,
                                             rustLessThanTok,
                                             rustDoubleLessThanTok,
                                             rustDoubleLessThanEqualTok,
                                             rustLessThanEqualTok,
                                             rustEqualTok,
                                             rustDoubleEqualTok,
                                             rustEqualGreaterThanTok,
                                             rustGreaterThanTok,
                                             rustGreaterThanEqualTok,
                                             rustDoubleGreaterThanTok,
                                             rustDoubleGreaterThanEqualTok,
                                             rustQuestionTok,
                                             rustAtTok,
                                             rustLBrackTok,
                                             rustRBrackTok,
                                             rustAccentTok,
                                             rustAccentEqualTok,
                                             rustUnderscoreTok,
                                             rustAsTok,
                                             rustAsyncTok,
                                             rustAwaitTok,
                                             rustBlockTok,
                                             rustBreakTok,
                                             rustConstTok,
                                             rustContinueTok,
                                             rustDefaultTok,
                                             rustDynTok,
                                             rustElseTok,
                                             rustEnumTok,
                                             rustExprTok,
                                             rustExternTok,
                                             rustFalseTok,
                                             rustFnTok,
                                             rustForTok,
                                             rustIdentTok,
                                             rustIfTok,
                                             rustImplTok,
                                             rustInTok,
                                             rustItemTok,
                                             rustLetTok,
                                             rustLifetimeTok,
                                             rustLiteralTok,
                                             rustLoopTok,
                                             rustMacroUnderscorerulesExclamationTok,
                                             rustMatchTok,
                                             rustMetaTok,
                                             rustModTok,
                                             rustMoveTok,
                                             rustPatTok,
                                             rustPathTok,
                                             rustPubTok,
                                             rustRefTok,
                                             rustReturnTok,
                                             rustStaticTok,
                                             rustStmtTok,
                                             rustStructTok,
                                             rustTraitTok,
                                             rustTrueTok,
                                             rustTtTok,
                                             rustTyTok,
                                             rustTypeTok,
                                             rustUnionTok,
                                             rustUnsafeTok,
                                             rustUseTok,
                                             rustVisTok,
                                             rustWhereTok,
                                             rustWhileTok,
                                             rustLCurlyTok,
                                             rustPipeTok,
                                             rustPipeEqualTok,
                                             rustDoublePipeTok,
                                             rustRCurlyTok
                                           }

proc tsNodeType*(node: TsRustNode): string



proc kind*(node: TsRustNode): RustNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration_statement":         rustDeclarationStatement
      of "_expression":                    rustExpression
      of "_literal":                       rustLiteral
      of "_literal_pattern":               rustLiteralPattern
      of "_pattern":                       rustPattern
      of "_type":                          rustType
      of "abstract_type":                  rustAbstractType
      of "arguments":                      rustArguments
      of "array_expression":               rustArrayExpression
      of "array_type":                     rustArrayType
      of "assignment_expression":          rustAssignmentExpression
      of "associated_type":                rustAssociatedType
      of "async_block":                    rustAsyncBlock
      of "attribute_item":                 rustAttributeItem
      of "await_expression":               rustAwaitExpression
      of "base_field_initializer":         rustBaseFieldInitializer
      of "binary_expression":              rustBinaryExpression
      of "block":                          rustBlock
      of "boolean_literal":                rustBooleanLiteral
      of "bounded_type":                   rustBoundedType
      of "bracketed_type":                 rustBracketedType
      of "break_expression":               rustBreakExpression
      of "call_expression":                rustCallExpression
      of "captured_pattern":               rustCapturedPattern
      of "closure_expression":             rustClosureExpression
      of "closure_parameters":             rustClosureParameters
      of "compound_assignment_expr":       rustCompoundAssignmentExpr
      of "const_block":                    rustConstBlock
      of "const_item":                     rustConstItem
      of "const_parameter":                rustConstParameter
      of "constrained_type_parameter":     rustConstrainedTypeParameter
      of "continue_expression":            rustContinueExpression
      of "declaration_list":               rustDeclarationList
      of "dynamic_type":                   rustDynamicType
      of "else_clause":                    rustElseClause
      of "empty_statement":                rustEmptyStatement
      of "empty_type":                     rustEmptyType
      of "enum_item":                      rustEnumItem
      of "enum_variant":                   rustEnumVariant
      of "enum_variant_list":              rustEnumVariantList
      of "extern_crate_declaration":       rustExternCrateDeclaration
      of "extern_modifier":                rustExternModifier
      of "field_declaration":              rustFieldDeclaration
      of "field_declaration_list":         rustFieldDeclarationList
      of "field_expression":               rustFieldExpression
      of "field_initializer":              rustFieldInitializer
      of "field_initializer_list":         rustFieldInitializerList
      of "field_pattern":                  rustFieldPattern
      of "for_expression":                 rustForExpression
      of "for_lifetimes":                  rustForLifetimes
      of "foreign_mod_item":               rustForeignModItem
      of "fragment_specifier":             rustFragmentSpecifier
      of "function_item":                  rustFunctionItem
      of "function_modifiers":             rustFunctionModifiers
      of "function_signature_item":        rustFunctionSignatureItem
      of "function_type":                  rustFunctionType
      of "generic_function":               rustGenericFunction
      of "generic_type":                   rustGenericType
      of "generic_type_with_turbofish":    rustGenericTypeWithTurbofish
      of "higher_ranked_trait_bound":      rustHigherRankedTraitBound
      of "if_expression":                  rustIfExpression
      of "if_let_expression":              rustIfLetExpression
      of "impl_item":                      rustImplItem
      of "index_expression":               rustIndexExpression
      of "inner_attribute_item":           rustInnerAttributeItem
      of "let_declaration":                rustLetDeclaration
      of "lifetime":                       rustLifetime
      of "loop_expression":                rustLoopExpression
      of "loop_label":                     rustLoopLabel
      of "macro_definition":               rustMacroDefinition
      of "macro_invocation":               rustMacroInvocation
      of "macro_rule":                     rustMacroRule
      of "match_arm":                      rustMatchArm
      of "match_block":                    rustMatchBlock
      of "match_expression":               rustMatchExpression
      of "match_pattern":                  rustMatchPattern
      of "meta_arguments":                 rustMetaArguments
      of "meta_item":                      rustMetaItem
      of "mod_item":                       rustModItem
      of "mut_pattern":                    rustMutPattern
      of "negative_literal":               rustNegativeLiteral
      of "optional_type_parameter":        rustOptionalTypeParameter
      of "or_pattern":                     rustOrPattern
      of "ordered_field_declaration_list": rustOrderedFieldDeclarationList
      of "parameter":                      rustParameter
      of "parameters":                     rustParameters
      of "parenthesized_expression":       rustParenthesizedExpression
      of "pointer_type":                   rustPointerType
      of "qualified_type":                 rustQualifiedType
      of "range_expression":               rustRangeExpression
      of "range_pattern":                  rustRangePattern
      of "ref_pattern":                    rustRefPattern
      of "reference_expression":           rustReferenceExpression
      of "reference_pattern":              rustReferencePattern
      of "reference_type":                 rustReferenceType
      of "remaining_field_pattern":        rustRemainingFieldPattern
      of "removed_trait_bound":            rustRemovedTraitBound
      of "return_expression":              rustReturnExpression
      of "scoped_identifier":              rustScopedIdentifier
      of "scoped_type_identifier":         rustScopedTypeIdentifier
      of "scoped_use_list":                rustScopedUseList
      of "self_parameter":                 rustSelfParameter
      of "shorthand_field_initializer":    rustShorthandFieldInitializer
      of "slice_pattern":                  rustSlicePattern
      of "source_file":                    rustSourceFile
      of "static_item":                    rustStaticItem
      of "string_literal":                 rustStringLiteral
      of "struct_expression":              rustStructExpression
      of "struct_item":                    rustStructItem
      of "struct_pattern":                 rustStructPattern
      of "token_binding_pattern":          rustTokenBindingPattern
      of "token_repetition":               rustTokenRepetition
      of "token_repetition_pattern":       rustTokenRepetitionPattern
      of "token_tree":                     rustTokenTree
      of "token_tree_pattern":             rustTokenTreePattern
      of "trait_bounds":                   rustTraitBounds
      of "trait_item":                     rustTraitItem
      of "try_expression":                 rustTryExpression
      of "tuple_expression":               rustTupleExpression
      of "tuple_pattern":                  rustTuplePattern
      of "tuple_struct_pattern":           rustTupleStructPattern
      of "tuple_type":                     rustTupleType
      of "type_arguments":                 rustTypeArguments
      of "type_binding":                   rustTypeBinding
      of "type_cast_expression":           rustTypeCastExpression
      of "type_item":                      rustTypeItem
      of "type_parameters":                rustTypeParameters
      of "unary_expression":               rustUnaryExpression
      of "union_item":                     rustUnionItem
      of "unit_expression":                rustUnitExpression
      of "unit_type":                      rustUnitType
      of "unsafe_block":                   rustUnsafeBlock
      of "use_as_clause":                  rustUseAsClause
      of "use_declaration":                rustUseDeclaration
      of "use_list":                       rustUseList
      of "use_wildcard":                   rustUseWildcard
      of "variadic_parameter":             rustVariadicParameter
      of "visibility_modifier":            rustVisibilityModifier
      of "where_clause":                   rustWhereClause
      of "where_predicate":                rustWherePredicate
      of "while_expression":               rustWhileExpression
      of "while_let_expression":           rustWhileLetExpression
      of "!":                              rustExclamationTok
      of "!=":                             rustExclamationEqualTok
      of "\"":                             rustQuoteTok
      of "#":                              rustHashTok
      of "$":                              rustDollarTok
      of "%":                              rustPercentTok
      of "%=":                             rustPercentEqualTok
      of "&":                              rustAmpersandTok
      of "&&":                             rustDoubleAmpersandTok
      of "&=":                             rustAmpersandEqualTok
      of "\'":                             rustApostropheTok
      of "(":                              rustLParTok
      of ")":                              rustRParTok
      of "*":                              rustAsteriskTok
      of "*=":                             rustAsteriskEqualTok
      of "+":                              rustPlusTok
      of "+=":                             rustPlusEqualTok
      of ",":                              rustCommaTok
      of "-":                              rustMinusTok
      of "-=":                             rustMinusEqualTok
      of "->":                             rustMinusGreaterThanTok
      of ".":                              rustDotTok
      of "..":                             rustDoubleDotTok
      of "...":                            rustTripleDotTok
      of "..=":                            rustDoubleDotEqualTok
      of "/":                              rustSlashTok
      of "/=":                             rustSlashEqualTok
      of ":":                              rustColonTok
      of "::":                             rustDoubleColonTok
      of ";":                              rustSemicolonTok
      of "<":                              rustLessThanTok
      of "<<":                             rustDoubleLessThanTok
      of "<<=":                            rustDoubleLessThanEqualTok
      of "<=":                             rustLessThanEqualTok
      of "=":                              rustEqualTok
      of "==":                             rustDoubleEqualTok
      of "=>":                             rustEqualGreaterThanTok
      of ">":                              rustGreaterThanTok
      of ">=":                             rustGreaterThanEqualTok
      of ">>":                             rustDoubleGreaterThanTok
      of ">>=":                            rustDoubleGreaterThanEqualTok
      of "?":                              rustQuestionTok
      of "@":                              rustAtTok
      of "[":                              rustLBrackTok
      of "]":                              rustRBrackTok
      of "^":                              rustAccentTok
      of "^=":                             rustAccentEqualTok
      of "_":                              rustUnderscoreTok
      of "as":                             rustAsTok
      of "async":                          rustAsyncTok
      of "await":                          rustAwaitTok
      of "block_comment":                  rustBlockComment
      of "break":                          rustBreakTok
      of "char_literal":                   rustCharLiteral
      of "const":                          rustConstTok
      of "continue":                       rustContinueTok
      of "crate":                          rustCrate
      of "default":                        rustDefaultTok
      of "dyn":                            rustDynTok
      of "else":                           rustElseTok
      of "enum":                           rustEnumTok
      of "escape_sequence":                rustEscapeSequence
      of "expr":                           rustExprTok
      of "extern":                         rustExternTok
      of "false":                          rustFalseTok
      of "field_identifier":               rustFieldIdentifier
      of "float_literal":                  rustFloatLiteral
      of "fn":                             rustFnTok
      of "for":                            rustForTok
      of "ident":                          rustIdentTok
      of "identifier":                     rustIdentifier
      of "if":                             rustIfTok
      of "impl":                           rustImplTok
      of "in":                             rustInTok
      of "integer_literal":                rustIntegerLiteral
      of "item":                           rustItemTok
      of "let":                            rustLetTok
      of "line_comment":                   rustLineComment
      of "literal":                        rustLiteralTok
      of "loop":                           rustLoopTok
      of "macro_rules!":                   rustMacroUnderscorerulesExclamationTok
      of "match":                          rustMatchTok
      of "meta":                           rustMetaTok
      of "metavariable":                   rustMetavariable
      of "mod":                            rustModTok
      of "move":                           rustMoveTok
      of "mutable_specifier":              rustMutableSpecifier
      of "pat":                            rustPatTok
      of "path":                           rustPathTok
      of "primitive_type":                 rustPrimitiveType
      of "pub":                            rustPubTok
      of "raw_string_literal":             rustRawStringLiteral
      of "ref":                            rustRefTok
      of "return":                         rustReturnTok
      of "self":                           rustSelf
      of "shorthand_field_identifier":     rustShorthandFieldIdentifier
      of "static":                         rustStaticTok
      of "stmt":                           rustStmtTok
      of "struct":                         rustStructTok
      of "super":                          rustSuper
      of "trait":                          rustTraitTok
      of "true":                           rustTrueTok
      of "tt":                             rustTtTok
      of "ty":                             rustTyTok
      of "type":                           rustTypeTok
      of "type_identifier":                rustTypeIdentifier
      of "union":                          rustUnionTok
      of "unsafe":                         rustUnsafeTok
      of "use":                            rustUseTok
      of "vis":                            rustVisTok
      of "where":                          rustWhereTok
      of "while":                          rustWhileTok
      of "{":                              rustLCurlyTok
      of "|":                              rustPipeTok
      of "|=":                             rustPipeEqualTok
      of "||":                             rustDoublePipeTok
      of "}":                              rustRCurlyTok
      of "ERROR":                          rustSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsRustNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsRustNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsRustNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_rust(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsRustNode): string =
  $ts_node_type(TSNode(node))

proc newTsRustParser*(): RustParser =
  result = RustParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_rust())

proc parseString*(parser: RustParser, str: string): TsRustNode =
  TsRustNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsRustString*(str: string): TsRustNode =
  let parser = newTsRustParser()
  return parseString(parser, str)

func `$`*(node: TsRustNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsRustNode,
    idx:  int,
    kind: RustNodeKind | set[RustNodeKind]
  ): TsRustNode =
  assert 0 <= idx and idx < node.len
  result = TsRustNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  RustNode* = HtsNode[TsRustNode, RustNodeKind]


proc treeReprTsRust*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsRustNode, RustNodeKind](parseTsRustString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsRustNode,
    str:  ptr string
  ): HtsNode[TsRustNode, RustNodeKind] =
  toHtsNode[TsRustNode, RustNodeKind](node, str)

proc toHtsTree*(node: TsRustNode, str: ptr string): RustNode =
  toHtsNode[TsRustNode, RustNodeKind](node, str)

proc parseRustString*(str: ptr string, unnamed: bool = false): RustNode =
  let parser = newTsRustParser()
  return toHtsTree[TsRustNode, RustNodeKind](parseString(parser, str[]), str)

proc parseRustString*(str: string, unnamed: bool = false): RustNode =
  let parser = newTsRustParser()
  return toHtsTree[TsRustNode, RustNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


