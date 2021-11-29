import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  RustNodeKind* = enum
    rustHidDeclarationStatement                  ## _declaration_statement
    rustHidExpression                            ## _expression
    rustHidLiteral                               ## _literal
    rustHidLiteralPattern                        ## _literal_pattern
    rustHidPattern                               ## _pattern
    rustHidType                                  ## _type
    rustAbstractType                             ## abstract_type
    rustArguments                                ## arguments
    rustArrayExpression                          ## array_expression
    rustArrayType                                ## array_type
    rustAssignmentExpression                     ## assignment_expression
    rustAssociatedType                           ## associated_type
    rustAsyncBlock                               ## async_block
    rustAttributeItem                            ## attribute_item
    rustAwaitExpression                          ## await_expression
    rustBaseFieldInitializer                     ## base_field_initializer
    rustBinaryExpression                         ## binary_expression
    rustBlock                                    ## block
    rustBooleanLiteral                           ## boolean_literal
    rustBoundedType                              ## bounded_type
    rustBracketedType                            ## bracketed_type
    rustBreakExpression                          ## break_expression
    rustCallExpression                           ## call_expression
    rustCapturedPattern                          ## captured_pattern
    rustClosureExpression                        ## closure_expression
    rustClosureParameters                        ## closure_parameters
    rustCompoundAssignmentExpr                   ## compound_assignment_expr
    rustConstBlock                               ## const_block
    rustConstItem                                ## const_item
    rustConstParameter                           ## const_parameter
    rustConstrainedTypeParameter                 ## constrained_type_parameter
    rustContinueExpression                       ## continue_expression
    rustDeclarationList                          ## declaration_list
    rustDynamicType                              ## dynamic_type
    rustElseClause                               ## else_clause
    rustEmptyStatement                           ## empty_statement
    rustEmptyType                                ## empty_type
    rustEnumItem                                 ## enum_item
    rustEnumVariant                              ## enum_variant
    rustEnumVariantList                          ## enum_variant_list
    rustExternCrateDeclaration                   ## extern_crate_declaration
    rustExternModifier                           ## extern_modifier
    rustFieldDeclaration                         ## field_declaration
    rustFieldDeclarationList                     ## field_declaration_list
    rustFieldExpression                          ## field_expression
    rustFieldInitializer                         ## field_initializer
    rustFieldInitializerList                     ## field_initializer_list
    rustFieldPattern                             ## field_pattern
    rustForExpression                            ## for_expression
    rustForLifetimes                             ## for_lifetimes
    rustForeignModItem                           ## foreign_mod_item
    rustFragmentSpecifier                        ## fragment_specifier
    rustFunctionItem                             ## function_item
    rustFunctionModifiers                        ## function_modifiers
    rustFunctionSignatureItem                    ## function_signature_item
    rustFunctionType                             ## function_type
    rustGenericFunction                          ## generic_function
    rustGenericType                              ## generic_type
    rustGenericTypeWithTurbofish                 ## generic_type_with_turbofish
    rustHigherRankedTraitBound                   ## higher_ranked_trait_bound
    rustIfExpression                             ## if_expression
    rustIfLetExpression                          ## if_let_expression
    rustImplItem                                 ## impl_item
    rustIndexExpression                          ## index_expression
    rustInnerAttributeItem                       ## inner_attribute_item
    rustLetDeclaration                           ## let_declaration
    rustLifetime                                 ## lifetime
    rustLoopExpression                           ## loop_expression
    rustLoopLabel                                ## loop_label
    rustMacroDefinition                          ## macro_definition
    rustMacroInvocation                          ## macro_invocation
    rustMacroRule                                ## macro_rule
    rustMatchArm                                 ## match_arm
    rustMatchBlock                               ## match_block
    rustMatchExpression                          ## match_expression
    rustMatchPattern                             ## match_pattern
    rustMetaArguments                            ## meta_arguments
    rustMetaItem                                 ## meta_item
    rustModItem                                  ## mod_item
    rustMutPattern                               ## mut_pattern
    rustNegativeLiteral                          ## negative_literal
    rustOptionalTypeParameter                    ## optional_type_parameter
    rustOrPattern                                ## or_pattern
    rustOrderedFieldDeclarationList              ## ordered_field_declaration_list
    rustParameter                                ## parameter
    rustParameters                               ## parameters
    rustParenthesizedExpression                  ## parenthesized_expression
    rustPointerType                              ## pointer_type
    rustQualifiedType                            ## qualified_type
    rustRangeExpression                          ## range_expression
    rustRangePattern                             ## range_pattern
    rustRefPattern                               ## ref_pattern
    rustReferenceExpression                      ## reference_expression
    rustReferencePattern                         ## reference_pattern
    rustReferenceType                            ## reference_type
    rustRemainingFieldPattern                    ## remaining_field_pattern
    rustRemovedTraitBound                        ## removed_trait_bound
    rustReturnExpression                         ## return_expression
    rustScopedIdentifier                         ## scoped_identifier
    rustScopedTypeIdentifier                     ## scoped_type_identifier
    rustScopedUseList                            ## scoped_use_list
    rustSelfParameter                            ## self_parameter
    rustShorthandFieldInitializer                ## shorthand_field_initializer
    rustSlicePattern                             ## slice_pattern
    rustSourceFile                               ## source_file
    rustStaticItem                               ## static_item
    rustStringLiteral                            ## string_literal
    rustStructExpression                         ## struct_expression
    rustStructItem                               ## struct_item
    rustStructPattern                            ## struct_pattern
    rustTokenBindingPattern                      ## token_binding_pattern
    rustTokenRepetition                          ## token_repetition
    rustTokenRepetitionPattern                   ## token_repetition_pattern
    rustTokenTree                                ## token_tree
    rustTokenTreePattern                         ## token_tree_pattern
    rustTraitBounds                              ## trait_bounds
    rustTraitItem                                ## trait_item
    rustTryExpression                            ## try_expression
    rustTupleExpression                          ## tuple_expression
    rustTuplePattern                             ## tuple_pattern
    rustTupleStructPattern                       ## tuple_struct_pattern
    rustTupleType                                ## tuple_type
    rustTypeArguments                            ## type_arguments
    rustTypeBinding                              ## type_binding
    rustTypeCastExpression                       ## type_cast_expression
    rustTypeItem                                 ## type_item
    rustTypeParameters                           ## type_parameters
    rustUnaryExpression                          ## unary_expression
    rustUnionItem                                ## union_item
    rustUnitExpression                           ## unit_expression
    rustUnitType                                 ## unit_type
    rustUnsafeBlock                              ## unsafe_block
    rustUseAsClause                              ## use_as_clause
    rustUseDeclaration                           ## use_declaration
    rustUseList                                  ## use_list
    rustUseWildcard                              ## use_wildcard
    rustVariadicParameter                        ## variadic_parameter
    rustVisibilityModifier                       ## visibility_modifier
    rustWhereClause                              ## where_clause
    rustWherePredicate                           ## where_predicate
    rustWhileExpression                          ## while_expression
    rustWhileLetExpression                       ## while_let_expression
    rustExclamationTok                           ## !
    rustExclamationEqualTok                      ## !=
    rustQuoteTok                                 ## "
    rustHashTok                                  ## #
    rustDollarTok                                ## $
    rustPercentTok                               ## %
    rustPercentEqualTok                          ## %=
    rustAmpersandTok                             ## &
    rustDoubleAmpersandTok                       ## &&
    rustAmpersandEqualTok                        ## &=
    rustApostropheTok                            ## '
    rustLParTok                                  ## (
    rustRParTok                                  ## )
    rustAsteriskTok                              ## *
    rustAsteriskEqualTok                         ## *=
    rustPlusTok                                  ## +
    rustPlusEqualTok                             ## +=
    rustCommaTok                                 ## ,
    rustMinusTok                                 ## -
    rustMinusEqualTok                            ## -=
    rustMinusGreaterThanTok                      ## ->
    rustDotTok                                   ## .
    rustDoubleDotTok                             ## ..
    rustTripleDotTok                             ## ...
    rustDoubleDotEqualTok                        ## ..=
    rustSlashTok                                 ## /
    rustSlashEqualTok                            ## /=
    rustColonTok                                 ## :
    rustDoubleColonTok                           ## ::
    rustSemicolonTok                             ## ;
    rustLessThanTok                              ## <
    rustDoubleLessThanTok                        ## <<
    rustDoubleLessThanEqualTok                   ## <<=
    rustLessThanEqualTok                         ## <=
    rustEqualTok                                 ## =
    rustDoubleEqualTok                           ## ==
    rustEqualGreaterThanTok                      ## =>
    rustGreaterThanTok                           ## >
    rustGreaterThanEqualTok                      ## >=
    rustDoubleGreaterThanTok                     ## >>
    rustDoubleGreaterThanEqualTok                ## >>=
    rustQuestionTok                              ## ?
    rustAtTok                                    ## @
    rustLBrackTok                                ## [
    rustRBrackTok                                ## ]
    rustAccentTok                                ## ^
    rustAccentEqualTok                           ## ^=
    rustHidUnderscoreTok                         ## _
    rustAsTok                                    ## as
    rustAsyncTok                                 ## async
    rustAwaitTok                                 ## await
    rustBlockTok                                 ## block
    rustBlockComment                             ## block_comment
    rustBreakTok                                 ## break
    rustCharLiteral                              ## char_literal
    rustConstTok                                 ## const
    rustContinueTok                              ## continue
    rustCrate                                    ## crate
    rustDefaultTok                               ## default
    rustDynTok                                   ## dyn
    rustElseTok                                  ## else
    rustEnumTok                                  ## enum
    rustEscapeSequence                           ## escape_sequence
    rustExprTok                                  ## expr
    rustExternTok                                ## extern
    rustFalseTok                                 ## false
    rustFieldIdentifier                          ## field_identifier
    rustFloatLiteral                             ## float_literal
    rustFnTok                                    ## fn
    rustForTok                                   ## for
    rustIdentTok                                 ## ident
    rustIdentifier                               ## identifier
    rustIfTok                                    ## if
    rustImplTok                                  ## impl
    rustInTok                                    ## in
    rustIntegerLiteral                           ## integer_literal
    rustItemTok                                  ## item
    rustLetTok                                   ## let
    rustLifetimeTok                              ## lifetime
    rustLineComment                              ## line_comment
    rustLiteralTok                               ## literal
    rustLoopTok                                  ## loop
    rustMacroUnderscorerulesExclamationTok       ## macro_rules!
    rustMatchTok                                 ## match
    rustMetaTok                                  ## meta
    rustMetavariable                             ## metavariable
    rustModTok                                   ## mod
    rustMoveTok                                  ## move
    rustMutableSpecifier                         ## mutable_specifier
    rustPatTok                                   ## pat
    rustPathTok                                  ## path
    rustPrimitiveType                            ## primitive_type
    rustPubTok                                   ## pub
    rustRawStringLiteral                         ## raw_string_literal
    rustRefTok                                   ## ref
    rustReturnTok                                ## return
    rustSelf                                     ## self
    rustShorthandFieldIdentifier                 ## shorthand_field_identifier
    rustStaticTok                                ## static
    rustStmtTok                                  ## stmt
    rustStructTok                                ## struct
    rustSuper                                    ## super
    rustTraitTok                                 ## trait
    rustTrueTok                                  ## true
    rustTtTok                                    ## tt
    rustTyTok                                    ## ty
    rustTypeTok                                  ## type
    rustTypeIdentifier                           ## type_identifier
    rustUnionTok                                 ## union
    rustUnsafeTok                                ## unsafe
    rustUseTok                                   ## use
    rustVisTok                                   ## vis
    rustWhereTok                                 ## where
    rustWhileTok                                 ## while
    rustLCurlyTok                                ## {
    rustPipeTok                                  ## |
    rustPipeEqualTok                             ## |=
    rustDoublePipeTok                            ## ||
    rustRCurlyTok                                ## }
    rustHidPath                                  ## _path
    rustHidUseClause                             ## _use_clause
    rustHidFieldIdentifier                       ## _field_identifier
    rustHidTokenPattern                          ## _token_pattern
    rustHidExpressionEndingWithBlock             ## _expression_ending_with_block
    rustHidReservedIdentifier                    ## _reserved_identifier
    rustHidStringContent                         ## _string_content
    rustHidTokens                                ## _tokens
    rustHidExpressionStatement                   ## _expression_statement
    rustHidTypeIdentifier                        ## _type_identifier
    rustComment                                  ## comment
    rustHidStatement                             ## _statement
    rustHidNonSpecialToken                       ## _non_special_token
    rustLastMatchArm                             ## last_match_arm
    rustScopedTypeIdentifierInExpressionPosition ## scoped_type_identifier_in_expression_position
    rustSyntaxError                              ## Tree-sitter parser syntax error

proc strRepr*(kind: RustNodeKind): string =
  case kind:
    of rustHidDeclarationStatement:                  "_declaration_statement"
    of rustHidExpression:                            "_expression"
    of rustHidLiteral:                               "_literal"
    of rustHidLiteralPattern:                        "_literal_pattern"
    of rustHidPattern:                               "_pattern"
    of rustHidType:                                  "_type"
    of rustAbstractType:                             "abstract_type"
    of rustArguments:                                "arguments"
    of rustArrayExpression:                          "array_expression"
    of rustArrayType:                                "array_type"
    of rustAssignmentExpression:                     "assignment_expression"
    of rustAssociatedType:                           "associated_type"
    of rustAsyncBlock:                               "async_block"
    of rustAttributeItem:                            "attribute_item"
    of rustAwaitExpression:                          "await_expression"
    of rustBaseFieldInitializer:                     "base_field_initializer"
    of rustBinaryExpression:                         "binary_expression"
    of rustBlock:                                    "block"
    of rustBooleanLiteral:                           "boolean_literal"
    of rustBoundedType:                              "bounded_type"
    of rustBracketedType:                            "bracketed_type"
    of rustBreakExpression:                          "break_expression"
    of rustCallExpression:                           "call_expression"
    of rustCapturedPattern:                          "captured_pattern"
    of rustClosureExpression:                        "closure_expression"
    of rustClosureParameters:                        "closure_parameters"
    of rustCompoundAssignmentExpr:                   "compound_assignment_expr"
    of rustConstBlock:                               "const_block"
    of rustConstItem:                                "const_item"
    of rustConstParameter:                           "const_parameter"
    of rustConstrainedTypeParameter:                 "constrained_type_parameter"
    of rustContinueExpression:                       "continue_expression"
    of rustDeclarationList:                          "declaration_list"
    of rustDynamicType:                              "dynamic_type"
    of rustElseClause:                               "else_clause"
    of rustEmptyStatement:                           "empty_statement"
    of rustEmptyType:                                "empty_type"
    of rustEnumItem:                                 "enum_item"
    of rustEnumVariant:                              "enum_variant"
    of rustEnumVariantList:                          "enum_variant_list"
    of rustExternCrateDeclaration:                   "extern_crate_declaration"
    of rustExternModifier:                           "extern_modifier"
    of rustFieldDeclaration:                         "field_declaration"
    of rustFieldDeclarationList:                     "field_declaration_list"
    of rustFieldExpression:                          "field_expression"
    of rustFieldInitializer:                         "field_initializer"
    of rustFieldInitializerList:                     "field_initializer_list"
    of rustFieldPattern:                             "field_pattern"
    of rustForExpression:                            "for_expression"
    of rustForLifetimes:                             "for_lifetimes"
    of rustForeignModItem:                           "foreign_mod_item"
    of rustFragmentSpecifier:                        "fragment_specifier"
    of rustFunctionItem:                             "function_item"
    of rustFunctionModifiers:                        "function_modifiers"
    of rustFunctionSignatureItem:                    "function_signature_item"
    of rustFunctionType:                             "function_type"
    of rustGenericFunction:                          "generic_function"
    of rustGenericType:                              "generic_type"
    of rustGenericTypeWithTurbofish:                 "generic_type_with_turbofish"
    of rustHigherRankedTraitBound:                   "higher_ranked_trait_bound"
    of rustIfExpression:                             "if_expression"
    of rustIfLetExpression:                          "if_let_expression"
    of rustImplItem:                                 "impl_item"
    of rustIndexExpression:                          "index_expression"
    of rustInnerAttributeItem:                       "inner_attribute_item"
    of rustLetDeclaration:                           "let_declaration"
    of rustLifetime:                                 "lifetime"
    of rustLoopExpression:                           "loop_expression"
    of rustLoopLabel:                                "loop_label"
    of rustMacroDefinition:                          "macro_definition"
    of rustMacroInvocation:                          "macro_invocation"
    of rustMacroRule:                                "macro_rule"
    of rustMatchArm:                                 "match_arm"
    of rustMatchBlock:                               "match_block"
    of rustMatchExpression:                          "match_expression"
    of rustMatchPattern:                             "match_pattern"
    of rustMetaArguments:                            "meta_arguments"
    of rustMetaItem:                                 "meta_item"
    of rustModItem:                                  "mod_item"
    of rustMutPattern:                               "mut_pattern"
    of rustNegativeLiteral:                          "negative_literal"
    of rustOptionalTypeParameter:                    "optional_type_parameter"
    of rustOrPattern:                                "or_pattern"
    of rustOrderedFieldDeclarationList:              "ordered_field_declaration_list"
    of rustParameter:                                "parameter"
    of rustParameters:                               "parameters"
    of rustParenthesizedExpression:                  "parenthesized_expression"
    of rustPointerType:                              "pointer_type"
    of rustQualifiedType:                            "qualified_type"
    of rustRangeExpression:                          "range_expression"
    of rustRangePattern:                             "range_pattern"
    of rustRefPattern:                               "ref_pattern"
    of rustReferenceExpression:                      "reference_expression"
    of rustReferencePattern:                         "reference_pattern"
    of rustReferenceType:                            "reference_type"
    of rustRemainingFieldPattern:                    "remaining_field_pattern"
    of rustRemovedTraitBound:                        "removed_trait_bound"
    of rustReturnExpression:                         "return_expression"
    of rustScopedIdentifier:                         "scoped_identifier"
    of rustScopedTypeIdentifier:                     "scoped_type_identifier"
    of rustScopedUseList:                            "scoped_use_list"
    of rustSelfParameter:                            "self_parameter"
    of rustShorthandFieldInitializer:                "shorthand_field_initializer"
    of rustSlicePattern:                             "slice_pattern"
    of rustSourceFile:                               "source_file"
    of rustStaticItem:                               "static_item"
    of rustStringLiteral:                            "string_literal"
    of rustStructExpression:                         "struct_expression"
    of rustStructItem:                               "struct_item"
    of rustStructPattern:                            "struct_pattern"
    of rustTokenBindingPattern:                      "token_binding_pattern"
    of rustTokenRepetition:                          "token_repetition"
    of rustTokenRepetitionPattern:                   "token_repetition_pattern"
    of rustTokenTree:                                "token_tree"
    of rustTokenTreePattern:                         "token_tree_pattern"
    of rustTraitBounds:                              "trait_bounds"
    of rustTraitItem:                                "trait_item"
    of rustTryExpression:                            "try_expression"
    of rustTupleExpression:                          "tuple_expression"
    of rustTuplePattern:                             "tuple_pattern"
    of rustTupleStructPattern:                       "tuple_struct_pattern"
    of rustTupleType:                                "tuple_type"
    of rustTypeArguments:                            "type_arguments"
    of rustTypeBinding:                              "type_binding"
    of rustTypeCastExpression:                       "type_cast_expression"
    of rustTypeItem:                                 "type_item"
    of rustTypeParameters:                           "type_parameters"
    of rustUnaryExpression:                          "unary_expression"
    of rustUnionItem:                                "union_item"
    of rustUnitExpression:                           "unit_expression"
    of rustUnitType:                                 "unit_type"
    of rustUnsafeBlock:                              "unsafe_block"
    of rustUseAsClause:                              "use_as_clause"
    of rustUseDeclaration:                           "use_declaration"
    of rustUseList:                                  "use_list"
    of rustUseWildcard:                              "use_wildcard"
    of rustVariadicParameter:                        "variadic_parameter"
    of rustVisibilityModifier:                       "visibility_modifier"
    of rustWhereClause:                              "where_clause"
    of rustWherePredicate:                           "where_predicate"
    of rustWhileExpression:                          "while_expression"
    of rustWhileLetExpression:                       "while_let_expression"
    of rustExclamationTok:                           "!"
    of rustExclamationEqualTok:                      "!="
    of rustQuoteTok:                                 "\""
    of rustHashTok:                                  "#"
    of rustDollarTok:                                "$"
    of rustPercentTok:                               "%"
    of rustPercentEqualTok:                          "%="
    of rustAmpersandTok:                             "&"
    of rustDoubleAmpersandTok:                       "&&"
    of rustAmpersandEqualTok:                        "&="
    of rustApostropheTok:                            "\'"
    of rustLParTok:                                  "("
    of rustRParTok:                                  ")"
    of rustAsteriskTok:                              "*"
    of rustAsteriskEqualTok:                         "*="
    of rustPlusTok:                                  "+"
    of rustPlusEqualTok:                             "+="
    of rustCommaTok:                                 ","
    of rustMinusTok:                                 "-"
    of rustMinusEqualTok:                            "-="
    of rustMinusGreaterThanTok:                      "->"
    of rustDotTok:                                   "."
    of rustDoubleDotTok:                             ".."
    of rustTripleDotTok:                             "..."
    of rustDoubleDotEqualTok:                        "..="
    of rustSlashTok:                                 "/"
    of rustSlashEqualTok:                            "/="
    of rustColonTok:                                 ":"
    of rustDoubleColonTok:                           "::"
    of rustSemicolonTok:                             ";"
    of rustLessThanTok:                              "<"
    of rustDoubleLessThanTok:                        "<<"
    of rustDoubleLessThanEqualTok:                   "<<="
    of rustLessThanEqualTok:                         "<="
    of rustEqualTok:                                 "="
    of rustDoubleEqualTok:                           "=="
    of rustEqualGreaterThanTok:                      "=>"
    of rustGreaterThanTok:                           ">"
    of rustGreaterThanEqualTok:                      ">="
    of rustDoubleGreaterThanTok:                     ">>"
    of rustDoubleGreaterThanEqualTok:                ">>="
    of rustQuestionTok:                              "?"
    of rustAtTok:                                    "@"
    of rustLBrackTok:                                "["
    of rustRBrackTok:                                "]"
    of rustAccentTok:                                "^"
    of rustAccentEqualTok:                           "^="
    of rustHidUnderscoreTok:                         "_"
    of rustAsTok:                                    "as"
    of rustAsyncTok:                                 "async"
    of rustAwaitTok:                                 "await"
    of rustBlockTok:                                 "block"
    of rustBlockComment:                             "block_comment"
    of rustBreakTok:                                 "break"
    of rustCharLiteral:                              "char_literal"
    of rustConstTok:                                 "const"
    of rustContinueTok:                              "continue"
    of rustCrate:                                    "crate"
    of rustDefaultTok:                               "default"
    of rustDynTok:                                   "dyn"
    of rustElseTok:                                  "else"
    of rustEnumTok:                                  "enum"
    of rustEscapeSequence:                           "escape_sequence"
    of rustExprTok:                                  "expr"
    of rustExternTok:                                "extern"
    of rustFalseTok:                                 "false"
    of rustFieldIdentifier:                          "field_identifier"
    of rustFloatLiteral:                             "float_literal"
    of rustFnTok:                                    "fn"
    of rustForTok:                                   "for"
    of rustIdentTok:                                 "ident"
    of rustIdentifier:                               "identifier"
    of rustIfTok:                                    "if"
    of rustImplTok:                                  "impl"
    of rustInTok:                                    "in"
    of rustIntegerLiteral:                           "integer_literal"
    of rustItemTok:                                  "item"
    of rustLetTok:                                   "let"
    of rustLifetimeTok:                              "lifetime"
    of rustLineComment:                              "line_comment"
    of rustLiteralTok:                               "literal"
    of rustLoopTok:                                  "loop"
    of rustMacroUnderscorerulesExclamationTok:       "macro_rules!"
    of rustMatchTok:                                 "match"
    of rustMetaTok:                                  "meta"
    of rustMetavariable:                             "metavariable"
    of rustModTok:                                   "mod"
    of rustMoveTok:                                  "move"
    of rustMutableSpecifier:                         "mutable_specifier"
    of rustPatTok:                                   "pat"
    of rustPathTok:                                  "path"
    of rustPrimitiveType:                            "primitive_type"
    of rustPubTok:                                   "pub"
    of rustRawStringLiteral:                         "raw_string_literal"
    of rustRefTok:                                   "ref"
    of rustReturnTok:                                "return"
    of rustSelf:                                     "self"
    of rustShorthandFieldIdentifier:                 "shorthand_field_identifier"
    of rustStaticTok:                                "static"
    of rustStmtTok:                                  "stmt"
    of rustStructTok:                                "struct"
    of rustSuper:                                    "super"
    of rustTraitTok:                                 "trait"
    of rustTrueTok:                                  "true"
    of rustTtTok:                                    "tt"
    of rustTyTok:                                    "ty"
    of rustTypeTok:                                  "type"
    of rustTypeIdentifier:                           "type_identifier"
    of rustUnionTok:                                 "union"
    of rustUnsafeTok:                                "unsafe"
    of rustUseTok:                                   "use"
    of rustVisTok:                                   "vis"
    of rustWhereTok:                                 "where"
    of rustWhileTok:                                 "while"
    of rustLCurlyTok:                                "{"
    of rustPipeTok:                                  "|"
    of rustPipeEqualTok:                             "|="
    of rustDoublePipeTok:                            "||"
    of rustRCurlyTok:                                "}"
    of rustHidPath:                                  "_path"
    of rustHidUseClause:                             "_use_clause"
    of rustHidFieldIdentifier:                       "_field_identifier"
    of rustHidTokenPattern:                          "_token_pattern"
    of rustHidExpressionEndingWithBlock:             "_expression_ending_with_block"
    of rustHidReservedIdentifier:                    "_reserved_identifier"
    of rustHidStringContent:                         "_string_content"
    of rustHidTokens:                                "_tokens"
    of rustHidExpressionStatement:                   "_expression_statement"
    of rustHidTypeIdentifier:                        "_type_identifier"
    of rustComment:                                  "comment"
    of rustHidStatement:                             "_statement"
    of rustHidNonSpecialToken:                       "_non_special_token"
    of rustLastMatchArm:                             "last_match_arm"
    of rustScopedTypeIdentifierInExpressionPosition: "scoped_type_identifier_in_expression_position"
    of rustSyntaxError:                              "ERROR"

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
                                                                       tmp[rustArguments] = {rustHidExpression, rustAttributeItem}
                                                                       tmp[rustArrayExpression] = {rustHidExpression, rustAttributeItem}
                                                                       tmp[rustAsyncBlock] = {rustBlock}
                                                                       tmp[rustAttributeItem] = {rustMetaItem}
                                                                       tmp[rustAwaitExpression] = {rustHidExpression}
                                                                       tmp[rustBaseFieldInitializer] = {rustHidExpression}
                                                                       tmp[rustBlock] = {rustHidDeclarationStatement, rustHidExpression}
                                                                       tmp[rustBoundedType] = {rustHidType, rustLifetime}
                                                                       tmp[rustBracketedType] = {rustHidType, rustQualifiedType}
                                                                       tmp[rustBreakExpression] = {rustHidExpression, rustLoopLabel}
                                                                       tmp[rustCapturedPattern] = {rustHidPattern}
                                                                       tmp[rustClosureParameters] = {rustHidPattern, rustParameter}
                                                                       tmp[rustConstItem] = {rustVisibilityModifier}
                                                                       tmp[rustContinueExpression] = {rustLoopLabel}
                                                                       tmp[rustDeclarationList] = {rustHidDeclarationStatement}
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
                                                                       tmp[rustIndexExpression] = {rustHidExpression}
                                                                       tmp[rustInnerAttributeItem] = {rustMetaItem}
                                                                       tmp[rustLetDeclaration] = {rustMutableSpecifier}
                                                                       tmp[rustLifetime] = {rustIdentifier}
                                                                       tmp[rustLoopExpression] = {rustLoopLabel}
                                                                       tmp[rustLoopLabel] = {rustIdentifier}
                                                                       tmp[rustMacroDefinition] = {rustMacroRule}
                                                                       tmp[rustMacroInvocation] = {rustTokenTree}
                                                                       tmp[rustMatchArm] = {rustAttributeItem}
                                                                       tmp[rustMatchBlock] = {rustMatchArm}
                                                                       tmp[rustMatchPattern] = {rustHidPattern}
                                                                       tmp[rustMetaArguments] = {rustHidLiteral, rustMetaItem}
                                                                       tmp[rustMetaItem] = {rustCrate, rustIdentifier, rustMetavariable, rustScopedIdentifier, rustSelf, rustSuper}
                                                                       tmp[rustModItem] = {rustVisibilityModifier}
                                                                       tmp[rustMutPattern] = {rustHidPattern, rustMutableSpecifier}
                                                                       tmp[rustNegativeLiteral] = {rustFloatLiteral, rustIntegerLiteral}
                                                                       tmp[rustOrPattern] = {rustHidPattern}
                                                                       tmp[rustOrderedFieldDeclarationList] = {rustAttributeItem, rustVisibilityModifier}
                                                                       tmp[rustParameter] = {rustMutableSpecifier}
                                                                       tmp[rustParameters] = {rustHidType, rustAttributeItem, rustParameter, rustSelfParameter, rustVariadicParameter}
                                                                       tmp[rustParenthesizedExpression] = {rustHidExpression}
                                                                       tmp[rustPointerType] = {rustMutableSpecifier}
                                                                       tmp[rustRangeExpression] = {rustHidExpression}
                                                                       tmp[rustRangePattern] = {
                                                                                                 rustHidLiteralPattern,
                                                                                                 rustCrate,
                                                                                                 rustIdentifier,
                                                                                                 rustMetavariable,
                                                                                                 rustScopedIdentifier,
                                                                                                 rustSelf,
                                                                                                 rustSuper
                                                                                               }
                                                                       tmp[rustRefPattern] = {rustHidPattern}
                                                                       tmp[rustReferenceExpression] = {rustMutableSpecifier}
                                                                       tmp[rustReferencePattern] = {rustHidPattern, rustMutableSpecifier}
                                                                       tmp[rustReferenceType] = {rustLifetime, rustMutableSpecifier}
                                                                       tmp[rustRemovedTraitBound] = {rustHidType}
                                                                       tmp[rustReturnExpression] = {rustHidExpression}
                                                                       tmp[rustSelfParameter] = {rustLifetime, rustMutableSpecifier, rustSelf}
                                                                       tmp[rustShorthandFieldInitializer] = {rustAttributeItem, rustIdentifier}
                                                                       tmp[rustSlicePattern] = {rustHidPattern}
                                                                       tmp[rustSourceFile] = {rustHidDeclarationStatement, rustHidExpression}
                                                                       tmp[rustStaticItem] = {rustMutableSpecifier, rustVisibilityModifier}
                                                                       tmp[rustStringLiteral] = {rustEscapeSequence}
                                                                       tmp[rustStructItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustStructPattern] = {rustFieldPattern, rustRemainingFieldPattern}
                                                                       tmp[rustTokenRepetition] = {
                                                                                                    rustHidLiteral,
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
                                                                                                           rustHidLiteral,
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
                                                                                              rustHidLiteral,
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
                                                                                                     rustHidLiteral,
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
                                                                       tmp[rustTraitBounds] = {rustHidType, rustHigherRankedTraitBound, rustLifetime, rustRemovedTraitBound}
                                                                       tmp[rustTraitItem] = {rustVisibilityModifier, rustWhereClause}
                                                                       tmp[rustTryExpression] = {rustHidExpression}
                                                                       tmp[rustTupleExpression] = {rustHidExpression, rustAttributeItem}
                                                                       tmp[rustTuplePattern] = {rustHidPattern}
                                                                       tmp[rustTupleStructPattern] = {rustHidPattern}
                                                                       tmp[rustTupleType] = {rustHidType}
                                                                       tmp[rustTypeArguments] = {rustHidLiteral, rustHidType, rustBlock, rustLifetime, rustTypeBinding}
                                                                       tmp[rustTypeItem] = {rustVisibilityModifier}
                                                                       tmp[rustTypeParameters] = {rustConstParameter, rustConstrainedTypeParameter, rustLifetime, rustMetavariable, rustOptionalTypeParameter, rustTypeIdentifier}
                                                                       tmp[rustUnaryExpression] = {rustHidExpression}
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
                                             rustHidUnderscoreTok,
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
const rustHiddenKinds*: set[RustNodeKind] = {
                                              rustHidLiteral,
                                              rustHidType,
                                              rustHidPath,
                                              rustHidExpression,
                                              rustHidUseClause,
                                              rustHidDeclarationStatement,
                                              rustHidLiteralPattern,
                                              rustHidFieldIdentifier,
                                              rustHidTokenPattern,
                                              rustHidExpressionEndingWithBlock,
                                              rustHidReservedIdentifier,
                                              rustHidStringContent,
                                              rustHidTokens,
                                              rustHidExpressionStatement,
                                              rustHidTypeIdentifier,
                                              rustComment,
                                              rustHidStatement,
                                              rustHidNonSpecialToken,
                                              rustLastMatchArm,
                                              rustHidPattern,
                                              rustScopedTypeIdentifierInExpressionPosition
                                            }
proc tsNodeType*(node: TsRustNode): string


proc kind*(node: TsRustNode): RustNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_declaration_statement":         rustHidDeclarationStatement
      of "_expression":                    rustHidExpression
      of "_literal":                       rustHidLiteral
      of "_literal_pattern":               rustHidLiteralPattern
      of "_pattern":                       rustHidPattern
      of "_type":                          rustHidType
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
      of "_":                              rustHidUnderscoreTok
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


proc treeRepr*(node: TsRustNode, str: string): string =
  var res = addr result
  proc aux(node: TsRustNode, level: int) =
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
let rustGrammar*: array[RustNodeKind, HtsRule[RustNodeKind]] = block:
                                                                 var rules: array[RustNodeKind, HtsRule[RustNodeKind]]
                                                                 type
                                                                   K = RustNodeKind


                                                                 rules[rustFunctionItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustFunctionModifiers), tsBlank[K]()), tsString[K]("fn"), tsChoice[K](tsSymbol[K](rustIdentifier), tsSymbol[K](rustMetavariable)), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsSymbol[K](rustParameters), tsChoice[K](tsSeq[K](tsString[K]("->"), tsSymbol[K](rustHidType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustBlock))
                                                                 rules[rustRefPattern] = tsSeq[K](tsString[K]("ref"), tsSymbol[K](rustHidPattern))
                                                                 rules[rustLetDeclaration] = tsSeq[K](tsString[K]("let"), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustHidPattern), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](rustHidType)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](rustHidExpression)), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustTypeParameters] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsChoice[K](tsSymbol[K](rustLifetime), tsSymbol[K](rustMetavariable), tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustConstrainedTypeParameter), tsSymbol[K](rustOptionalTypeParameter), tsSymbol[K](rustConstParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustLifetime), tsSymbol[K](rustMetavariable), tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustConstrainedTypeParameter), tsSymbol[K](rustOptionalTypeParameter), tsSymbol[K](rustConstParameter))))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](">"))
                                                                 rules[rustUnitType] = tsSeq[K](tsString[K]("("), tsString[K](")"))
                                                                 rules[rustOrderedFieldDeclarationList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsSymbol[K](rustHidType)), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsSymbol[K](rustHidType))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustTryExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("?"))
                                                                 rules[rustNegativeLiteral] = tsSeq[K](tsString[K]("-"), tsChoice[K](tsSymbol[K](rustIntegerLiteral), tsSymbol[K](rustFloatLiteral)))
                                                                 rules[rustDynamicType] = tsSeq[K](tsString[K]("dyn"), tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier), tsSymbol[K](rustGenericType), tsSymbol[K](rustFunctionType)))
                                                                 rules[rustScopedTypeIdentifier] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](rustHidPath), tsSymbol[K](rustGenericTypeWithTurbofish), tsSymbol[K](rustBracketedType), tsSymbol[K](rustGenericType)), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](rustHidTypeIdentifier))
                                                                 rules[rustUseList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustHidUseClause)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustHidUseClause))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustOrPattern] = tsSeq[K](tsSymbol[K](rustHidPattern), tsString[K]("|"), tsSymbol[K](rustHidPattern))
                                                                 rules[rustRemovedTraitBound] = tsSeq[K](tsString[K]("?"), tsSymbol[K](rustHidType))
                                                                 rules[rustMetaArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustMetaItem), tsSymbol[K](rustHidLiteral)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustMetaItem), tsSymbol[K](rustHidLiteral))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustEnumVariant] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsSymbol[K](rustIdentifier), tsChoice[K](tsChoice[K](tsSymbol[K](rustFieldDeclarationList), tsSymbol[K](rustOrderedFieldDeclarationList)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](rustHidExpression)), tsBlank[K]()))
                                                                 rules[rustFunctionSignatureItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustFunctionModifiers), tsBlank[K]()), tsString[K]("fn"), tsChoice[K](tsSymbol[K](rustIdentifier), tsSymbol[K](rustMetavariable)), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsSymbol[K](rustParameters), tsChoice[K](tsSeq[K](tsString[K]("->"), tsSymbol[K](rustHidType)), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustExternModifier] = tsSeq[K](tsString[K]("extern"), tsChoice[K](tsSymbol[K](rustStringLiteral), tsBlank[K]()))
                                                                 rules[rustLoopLabel] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](rustIdentifier))
                                                                 rules[rustTypeBinding] = tsSeq[K](tsSymbol[K](rustHidTypeIdentifier), tsString[K]("="), tsSymbol[K](rustHidType))
                                                                 rules[rustHidExpression] = tsChoice[K](tsSymbol[K](rustUnaryExpression), tsSymbol[K](rustReferenceExpression), tsSymbol[K](rustTryExpression), tsSymbol[K](rustBinaryExpression), tsSymbol[K](rustAssignmentExpression), tsSymbol[K](rustCompoundAssignmentExpr), tsSymbol[K](rustTypeCastExpression), tsSymbol[K](rustRangeExpression), tsSymbol[K](rustCallExpression), tsSymbol[K](rustReturnExpression), tsSymbol[K](rustHidLiteral), tsSymbol[K](rustIdentifier), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char")), tsSymbol[K](rustHidReservedIdentifier), tsSymbol[K](rustSelf), tsSymbol[K](rustScopedIdentifier), tsSymbol[K](rustGenericFunction), tsSymbol[K](rustAwaitExpression), tsSymbol[K](rustFieldExpression), tsSymbol[K](rustArrayExpression), tsSymbol[K](rustTupleExpression), tsSymbol[K](rustMacroInvocation), tsSymbol[K](rustUnitExpression), tsSymbol[K](rustHidExpressionEndingWithBlock), tsSymbol[K](rustBreakExpression), tsSymbol[K](rustContinueExpression), tsSymbol[K](rustIndexExpression), tsSymbol[K](rustMetavariable), tsSymbol[K](rustClosureExpression), tsSymbol[K](rustParenthesizedExpression), tsSymbol[K](rustStructExpression))
                                                                 rules[rustTokenRepetitionPattern] = tsSeq[K](tsString[K]("$"), tsString[K]("("), tsRepeat[K](tsSymbol[K](rustHidTokenPattern)), tsString[K](")"), tsChoice[K](tsRegex[K]("[^+*?]+"), tsBlank[K]()), tsChoice[K](tsString[K]("+"), tsString[K]("*"), tsString[K]("?")))
                                                                 rules[rustHigherRankedTraitBound] = tsSeq[K](tsString[K]("for"), tsSymbol[K](rustTypeParameters), tsSymbol[K](rustHidType))
                                                                 rules[rustCompoundAssignmentExpr] = tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("&="), tsString[K]("|="), tsString[K]("^="), tsString[K]("<<="), tsString[K](">>=")), tsSymbol[K](rustHidExpression))
                                                                 rules[rustHidDeclarationStatement] = tsChoice[K](tsSymbol[K](rustConstItem), tsSymbol[K](rustMacroInvocation), tsSymbol[K](rustMacroDefinition), tsSymbol[K](rustEmptyStatement), tsSymbol[K](rustAttributeItem), tsSymbol[K](rustInnerAttributeItem), tsSymbol[K](rustModItem), tsSymbol[K](rustForeignModItem), tsSymbol[K](rustStructItem), tsSymbol[K](rustUnionItem), tsSymbol[K](rustEnumItem), tsSymbol[K](rustTypeItem), tsSymbol[K](rustFunctionItem), tsSymbol[K](rustFunctionSignatureItem), tsSymbol[K](rustImplItem), tsSymbol[K](rustTraitItem), tsSymbol[K](rustAssociatedType), tsSymbol[K](rustLetDeclaration), tsSymbol[K](rustUseDeclaration), tsSymbol[K](rustExternCrateDeclaration), tsSymbol[K](rustStaticItem))
                                                                 rules[rustTupleExpression] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K](",")), tsRepeat[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K](","))), tsChoice[K](tsSymbol[K](rustHidExpression), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustStructExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifierInExpressionPosition), tsSymbol[K](rustGenericTypeWithTurbofish)), tsSymbol[K](rustFieldInitializerList))
                                                                 rules[rustImplItem] = tsSeq[K](tsChoice[K](tsString[K]("unsafe"), tsBlank[K]()), tsString[K]("impl"), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier), tsSymbol[K](rustGenericType)), tsString[K]("for")), tsBlank[K]()), tsSymbol[K](rustHidType), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustDeclarationList))
                                                                 rules[rustBaseFieldInitializer] = tsSeq[K](tsString[K](".."), tsSymbol[K](rustHidExpression))
                                                                 rules[rustIfExpression] = tsSeq[K](tsString[K]("if"), tsSymbol[K](rustHidExpression), tsSymbol[K](rustBlock), tsChoice[K](tsSymbol[K](rustElseClause), tsBlank[K]()))
                                                                 rules[rustCharLiteral] = tsSeq[K](tsChoice[K](tsString[K]("b"), tsBlank[K]()), tsString[K]("\'"), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu]"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}"), tsRegex[K]("x[0-9a-fA-F]{2}"))), tsRegex[K]("[^\\\\\']")), tsBlank[K]()), tsString[K]("\'"))
                                                                 rules[rustBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                 rules[rustTuplePattern] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](rustHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustHidPattern)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustHidFieldIdentifier] = tsSymbol[K](rustIdentifier)
                                                                 rules[rustCrate] = tsString[K]("crate")
                                                                 rules[rustForExpression] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustLoopLabel), tsString[K](":")), tsBlank[K]()), tsString[K]("for"), tsSymbol[K](rustHidPattern), tsString[K]("in"), tsSymbol[K](rustHidExpression), tsSymbol[K](rustBlock))
                                                                 rules[rustClosureExpression] = tsSeq[K](tsChoice[K](tsString[K]("move"), tsBlank[K]()), tsSymbol[K](rustClosureParameters), tsChoice[K](tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("->"), tsSymbol[K](rustHidType)), tsBlank[K]()), tsSymbol[K](rustBlock)), tsSymbol[K](rustHidExpression)))
                                                                 rules[rustBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](rustHidStatement)), tsChoice[K](tsSymbol[K](rustHidExpression), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustAwaitExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("."), tsString[K]("await"))
                                                                 rules[rustConstBlock] = tsSeq[K](tsString[K]("const"), tsSymbol[K](rustBlock))
                                                                 rules[rustTypeItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("type"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsString[K]("="), tsSymbol[K](rustHidType), tsString[K](";"))
                                                                 rules[rustTraitBounds] = tsSeq[K](tsString[K](":"), tsSeq[K](tsChoice[K](tsSymbol[K](rustHidType), tsSymbol[K](rustLifetime), tsSymbol[K](rustHigherRankedTraitBound), tsSymbol[K](rustRemovedTraitBound)), tsRepeat[K](tsSeq[K](tsString[K]("+"), tsChoice[K](tsSymbol[K](rustHidType), tsSymbol[K](rustLifetime), tsSymbol[K](rustHigherRankedTraitBound), tsSymbol[K](rustRemovedTraitBound))))))
                                                                 rules[rustContinueExpression] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](rustLoopLabel), tsBlank[K]()))
                                                                 rules[rustHidExpressionEndingWithBlock] = tsChoice[K](tsSymbol[K](rustUnsafeBlock), tsSymbol[K](rustAsyncBlock), tsSymbol[K](rustBlock), tsSymbol[K](rustIfExpression), tsSymbol[K](rustIfLetExpression), tsSymbol[K](rustMatchExpression), tsSymbol[K](rustWhileExpression), tsSymbol[K](rustWhileLetExpression), tsSymbol[K](rustLoopExpression), tsSymbol[K](rustForExpression), tsSymbol[K](rustConstBlock))
                                                                 rules[rustHidTokens] = tsChoice[K](tsSymbol[K](rustTokenTree), tsSymbol[K](rustTokenRepetition), tsSymbol[K](rustHidNonSpecialToken))
                                                                 rules[rustScopedIdentifier] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](rustHidPath), tsSymbol[K](rustBracketedType), tsSymbol[K](rustGenericTypeWithTurbofish)), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](rustIdentifier))
                                                                 rules[rustRangeExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K](".."), tsString[K]("..."), tsString[K]("..=")), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("..")), tsSeq[K](tsString[K](".."), tsSymbol[K](rustHidExpression)), tsString[K](".."))
                                                                 rules[rustHidExpressionStatement] = tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K](";")), tsSymbol[K](rustHidExpressionEndingWithBlock))
                                                                 rules[rustFunctionType] = tsSeq[K](tsChoice[K](tsSymbol[K](rustForLifetimes), tsBlank[K]()), tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier)), tsSeq[K](tsChoice[K](tsSymbol[K](rustFunctionModifiers), tsBlank[K]()), tsString[K]("fn"))), tsSymbol[K](rustParameters)), tsChoice[K](tsSeq[K](tsString[K]("->"), tsSymbol[K](rustHidType)), tsBlank[K]()))
                                                                 rules[rustUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("-"), tsString[K]("*"), tsString[K]("!")), tsSymbol[K](rustHidExpression))
                                                                 rules[rustSourceFile] = tsRepeat[K](tsSymbol[K](rustHidStatement))
                                                                 rules[rustFieldExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("."), tsChoice[K](tsSymbol[K](rustHidFieldIdentifier), tsSymbol[K](rustIntegerLiteral)))
                                                                 rules[rustArrayType] = tsSeq[K](tsString[K]("["), tsSymbol[K](rustHidType), tsChoice[K](tsSeq[K](tsString[K](";"), tsSymbol[K](rustHidExpression)), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[rustIfLetExpression] = tsSeq[K](tsString[K]("if"), tsString[K]("let"), tsSymbol[K](rustHidPattern), tsString[K]("="), tsSymbol[K](rustHidExpression), tsSymbol[K](rustBlock), tsChoice[K](tsSymbol[K](rustElseClause), tsBlank[K]()))
                                                                 rules[rustComment] = tsChoice[K](tsSymbol[K](rustLineComment), tsSymbol[K](rustBlockComment))
                                                                 rules[rustHidTypeIdentifier] = tsSymbol[K](rustIdentifier)
                                                                 rules[rustVisibilityModifier] = tsChoice[K](tsSymbol[K](rustCrate), tsSeq[K](tsString[K]("pub"), tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](rustSelf), tsSymbol[K](rustSuper), tsSymbol[K](rustCrate), tsSeq[K](tsString[K]("in"), tsSymbol[K](rustHidPath))), tsString[K](")")), tsBlank[K]())))
                                                                 rules[rustElseClause] = tsSeq[K](tsString[K]("else"), tsChoice[K](tsSymbol[K](rustBlock), tsSymbol[K](rustIfExpression), tsSymbol[K](rustIfLetExpression)))
                                                                 rules[rustVariadicParameter] = tsString[K]("...")
                                                                 rules[rustEnumVariantList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustEnumVariant)), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustEnumVariant))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustHidStatement] = tsChoice[K](tsSymbol[K](rustHidExpressionStatement), tsSymbol[K](rustHidDeclarationStatement))
                                                                 rules[rustReferencePattern] = tsSeq[K](tsString[K]("&"), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustHidPattern))
                                                                 rules[rustIdentifier] = tsRegex[K]("(r#)?[_\\p{XID_Start}][_\\p{XID_Continue}]*")
                                                                 rules[rustHidNonSpecialToken] = tsChoice[K](tsSymbol[K](rustHidLiteral), tsSymbol[K](rustIdentifier), tsSymbol[K](rustMetavariable), tsSymbol[K](rustMutableSpecifier), tsSymbol[K](rustSelf), tsSymbol[K](rustSuper), tsSymbol[K](rustCrate), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char")), tsRegex[K]("[/_\\-=->,;:::!=?.@*&#%^+<>|~]+"), tsString[K]("\'"), tsString[K]("as"), tsString[K]("async"), tsString[K]("await"), tsString[K]("break"), tsString[K]("const"), tsString[K]("continue"), tsString[K]("default"), tsString[K]("enum"), tsString[K]("fn"), tsString[K]("for"), tsString[K]("if"), tsString[K]("impl"), tsString[K]("let"), tsString[K]("loop"), tsString[K]("match"), tsString[K]("mod"), tsString[K]("pub"), tsString[K]("return"), tsString[K]("static"), tsString[K]("struct"), tsString[K]("trait"), tsString[K]("type"), tsString[K]("union"), tsString[K]("unsafe"), tsString[K]("use"), tsString[K]("where"), tsString[K]("while"))
                                                                 rules[rustTokenTreePattern] = tsChoice[K](tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](rustHidTokenPattern)), tsString[K](")")), tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](rustHidTokenPattern)), tsString[K]("]")), tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](rustHidTokenPattern)), tsString[K]("}")))
                                                                 rules[rustArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustHidExpression)), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustHidExpression))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustSelfParameter] = tsSeq[K](tsChoice[K](tsString[K]("&"), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustLifetime), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustSelf))
                                                                 rules[rustHidPattern] = tsChoice[K](tsSymbol[K](rustHidLiteralPattern), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char")), tsSymbol[K](rustIdentifier), tsSymbol[K](rustScopedIdentifier), tsSymbol[K](rustTuplePattern), tsSymbol[K](rustTupleStructPattern), tsSymbol[K](rustStructPattern), tsSymbol[K](rustRefPattern), tsSymbol[K](rustSlicePattern), tsSymbol[K](rustCapturedPattern), tsSymbol[K](rustReferencePattern), tsSymbol[K](rustRemainingFieldPattern), tsSymbol[K](rustMutPattern), tsSymbol[K](rustRangePattern), tsSymbol[K](rustOrPattern), tsSymbol[K](rustConstBlock), tsString[K]("_"))
                                                                 rules[rustWherePredicate] = tsSeq[K](tsChoice[K](tsSymbol[K](rustLifetime), tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier), tsSymbol[K](rustGenericType), tsSymbol[K](rustReferenceType), tsSymbol[K](rustPointerType), tsSymbol[K](rustTupleType), tsSymbol[K](rustHigherRankedTraitBound), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char"))), tsSymbol[K](rustTraitBounds))
                                                                 rules[rustForLifetimes] = tsSeq[K](tsString[K]("for"), tsString[K]("<"), tsSeq[K](tsSymbol[K](rustLifetime), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustLifetime)))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](">"))
                                                                 rules[rustFieldDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsSymbol[K](rustHidFieldIdentifier), tsString[K](":"), tsSymbol[K](rustHidType))
                                                                 rules[rustTokenTree] = tsChoice[K](tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](rustHidTokens)), tsString[K](")")), tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](rustHidTokens)), tsString[K]("]")), tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](rustHidTokens)), tsString[K]("}")))
                                                                 rules[rustOptionalTypeParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustConstrainedTypeParameter)), tsString[K]("="), tsSymbol[K](rustHidType))
                                                                 rules[rustPointerType] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsString[K]("const"), tsSymbol[K](rustMutableSpecifier)), tsSymbol[K](rustHidType))
                                                                 rules[rustStructItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("struct"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustFieldDeclarationList)), tsSeq[K](tsSymbol[K](rustOrderedFieldDeclarationList), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsString[K](";")), tsString[K](";")))
                                                                 rules[rustLifetime] = tsSeq[K](tsString[K]("\'"), tsSymbol[K](rustIdentifier))
                                                                 rules[rustScopedTypeIdentifierInExpressionPosition] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](rustHidPath), tsSymbol[K](rustGenericTypeWithTurbofish)), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](rustHidTypeIdentifier))
                                                                 rules[rustConstParameter] = tsSeq[K](tsString[K]("const"), tsSymbol[K](rustIdentifier), tsString[K](":"), tsSymbol[K](rustHidType))
                                                                 rules[rustFieldDeclarationList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustFieldDeclaration)), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustFieldDeclaration))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustWhileExpression] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustLoopLabel), tsString[K](":")), tsBlank[K]()), tsString[K]("while"), tsSymbol[K](rustHidExpression), tsSymbol[K](rustBlock))
                                                                 rules[rustAttributeItem] = tsSeq[K](tsString[K]("#"), tsString[K]("["), tsSymbol[K](rustMetaItem), tsString[K]("]"))
                                                                 rules[rustParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](rustHidExpression), tsString[K](")"))
                                                                 rules[rustFieldPattern] = tsSeq[K](tsChoice[K](tsString[K]("ref"), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustIdentifier), tsSeq[K](tsSymbol[K](rustHidFieldIdentifier), tsString[K](":"), tsSymbol[K](rustHidPattern))))
                                                                 rules[rustReferenceType] = tsSeq[K](tsString[K]("&"), tsChoice[K](tsSymbol[K](rustLifetime), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustHidType))
                                                                 rules[rustUseWildcard] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustHidPath), tsString[K]("::")), tsBlank[K]()), tsString[K]("*"))
                                                                 rules[rustTokenBindingPattern] = tsSeq[K](tsSymbol[K](rustMetavariable), tsString[K](":"), tsSymbol[K](rustFragmentSpecifier))
                                                                 rules[rustBracketedType] = tsSeq[K](tsString[K]("<"), tsChoice[K](tsSymbol[K](rustHidType), tsSymbol[K](rustQualifiedType)), tsString[K](">"))
                                                                 rules[rustQualifiedType] = tsSeq[K](tsSymbol[K](rustHidType), tsString[K]("as"), tsSymbol[K](rustHidType))
                                                                 rules[rustMatchBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsRepeat[K](tsSymbol[K](rustMatchArm)), tsSymbol[K](rustLastMatchArm)), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustAssociatedType] = tsSeq[K](tsString[K]("type"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTraitBounds), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustHidLiteral] = tsChoice[K](tsSymbol[K](rustStringLiteral), tsSymbol[K](rustRawStringLiteral), tsSymbol[K](rustCharLiteral), tsSymbol[K](rustBooleanLiteral), tsSymbol[K](rustIntegerLiteral), tsSymbol[K](rustFloatLiteral))
                                                                 rules[rustUseAsClause] = tsSeq[K](tsSymbol[K](rustHidPath), tsString[K]("as"), tsSymbol[K](rustIdentifier))
                                                                 rules[rustParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustHidPattern), tsSymbol[K](rustSelf), tsSymbol[K](rustHidReservedIdentifier)), tsString[K](":"), tsSymbol[K](rustHidType))
                                                                 rules[rustFunctionModifiers] = tsRepeat1[K](tsChoice[K](tsString[K]("async"), tsString[K]("default"), tsString[K]("const"), tsString[K]("unsafe"), tsSymbol[K](rustExternModifier)))
                                                                 rules[rustTypeCastExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("as"), tsSymbol[K](rustHidType))
                                                                 rules[rustIndexExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("["), tsSymbol[K](rustHidExpression), tsString[K]("]"))
                                                                 rules[rustHidType] = tsChoice[K](tsSymbol[K](rustAbstractType), tsSymbol[K](rustReferenceType), tsSymbol[K](rustMetavariable), tsSymbol[K](rustPointerType), tsSymbol[K](rustGenericType), tsSymbol[K](rustScopedTypeIdentifier), tsSymbol[K](rustTupleType), tsSymbol[K](rustUnitType), tsSymbol[K](rustArrayType), tsSymbol[K](rustFunctionType), tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustMacroInvocation), tsSymbol[K](rustEmptyType), tsSymbol[K](rustDynamicType), tsSymbol[K](rustBoundedType), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char")))
                                                                 rules[rustArrayExpression] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K](";"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustHidExpression)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()))), tsString[K]("]"))
                                                                 rules[rustMacroRule] = tsSeq[K](tsSymbol[K](rustTokenTreePattern), tsString[K]("=>"), tsSymbol[K](rustTokenTree))
                                                                 rules[rustStringLiteral] = tsSeq[K](tsRegex[K]("b?\""), tsRepeat[K](tsChoice[K](tsSymbol[K](rustEscapeSequence), tsSymbol[K](rustHidStringContent))), tsString[K]("\""))
                                                                 rules[rustCallExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsSymbol[K](rustArguments))
                                                                 rules[rustHidPath] = tsChoice[K](tsSymbol[K](rustSelf), tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("bool"), tsString[K]("str"), tsString[K]("char")), tsSymbol[K](rustMetavariable), tsSymbol[K](rustSuper), tsSymbol[K](rustCrate), tsSymbol[K](rustIdentifier), tsSymbol[K](rustScopedIdentifier), tsSymbol[K](rustHidReservedIdentifier))
                                                                 rules[rustEnumItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("enum"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustEnumVariantList))
                                                                 rules[rustTupleStructPattern] = tsSeq[K](tsChoice[K](tsSymbol[K](rustIdentifier), tsSymbol[K](rustScopedIdentifier)), tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](rustHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustHidPattern)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustUseDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("use"), tsSymbol[K](rustHidUseClause), tsString[K](";"))
                                                                 rules[rustFieldInitializerList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustShorthandFieldInitializer), tsSymbol[K](rustFieldInitializer), tsSymbol[K](rustBaseFieldInitializer)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustShorthandFieldInitializer), tsSymbol[K](rustFieldInitializer), tsSymbol[K](rustBaseFieldInitializer))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustHidUseClause] = tsChoice[K](tsSymbol[K](rustHidPath), tsSymbol[K](rustUseAsClause), tsSymbol[K](rustUseList), tsSymbol[K](rustScopedUseList), tsSymbol[K](rustUseWildcard))
                                                                 rules[rustInnerAttributeItem] = tsSeq[K](tsString[K]("#"), tsString[K]("!"), tsString[K]("["), tsSymbol[K](rustMetaItem), tsString[K]("]"))
                                                                 rules[rustShorthandFieldInitializer] = tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustIdentifier))
                                                                 rules[rustHidLiteralPattern] = tsChoice[K](tsSymbol[K](rustStringLiteral), tsSymbol[K](rustRawStringLiteral), tsSymbol[K](rustCharLiteral), tsSymbol[K](rustBooleanLiteral), tsSymbol[K](rustIntegerLiteral), tsSymbol[K](rustFloatLiteral), tsSymbol[K](rustNegativeLiteral))
                                                                 rules[rustBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("&&"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("||"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("&"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("|"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("^"), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K]("=="), tsString[K]("!="), tsString[K]("<"), tsString[K]("<="), tsString[K](">"), tsString[K](">=")), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K]("<<"), tsString[K](">>")), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K]("+"), tsString[K]("-")), tsSymbol[K](rustHidExpression)), tsSeq[K](tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("%")), tsSymbol[K](rustHidExpression)))
                                                                 rules[rustWhereClause] = tsSeq[K](tsString[K]("where"), tsSeq[K](tsSymbol[K](rustWherePredicate), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustWherePredicate)))), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                 rules[rustUnitExpression] = tsSeq[K](tsString[K]("("), tsString[K](")"))
                                                                 rules[rustConstrainedTypeParameter] = tsSeq[K](tsChoice[K](tsSymbol[K](rustLifetime), tsSymbol[K](rustHidTypeIdentifier)), tsSymbol[K](rustTraitBounds))
                                                                 rules[rustStructPattern] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier)), tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustFieldPattern), tsSymbol[K](rustRemainingFieldPattern)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustFieldPattern), tsSymbol[K](rustRemainingFieldPattern))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[rustCapturedPattern] = tsSeq[K](tsSymbol[K](rustIdentifier), tsString[K]("@"), tsSymbol[K](rustHidPattern))
                                                                 rules[rustConstItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("const"), tsSymbol[K](rustIdentifier), tsString[K](":"), tsSymbol[K](rustHidType), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](rustHidExpression)), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustHidTokenPattern] = tsChoice[K](tsSymbol[K](rustTokenTreePattern), tsSymbol[K](rustTokenRepetitionPattern), tsSymbol[K](rustTokenBindingPattern), tsSymbol[K](rustHidNonSpecialToken))
                                                                 rules[rustUnsafeBlock] = tsSeq[K](tsString[K]("unsafe"), tsSymbol[K](rustBlock))
                                                                 rules[rustMatchExpression] = tsSeq[K](tsString[K]("match"), tsSymbol[K](rustHidExpression), tsSymbol[K](rustMatchBlock))
                                                                 rules[rustAsyncBlock] = tsSeq[K](tsString[K]("async"), tsChoice[K](tsString[K]("move"), tsBlank[K]()), tsSymbol[K](rustBlock))
                                                                 rules[rustIntegerLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9][0-9_]*"), tsRegex[K]("0x[0-9a-fA-F_]+"), tsRegex[K]("0b[01_]+"), tsRegex[K]("0o[0-7_]+")), tsChoice[K](tsChoice[K](tsString[K]("u8"), tsString[K]("i8"), tsString[K]("u16"), tsString[K]("i16"), tsString[K]("u32"), tsString[K]("i32"), tsString[K]("u64"), tsString[K]("i64"), tsString[K]("u128"), tsString[K]("i128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("f32"), tsString[K]("f64")), tsBlank[K]()))
                                                                 rules[rustMatchArm] = tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsChoice[K](tsSymbol[K](rustMacroInvocation), tsSymbol[K](rustMatchPattern)), tsString[K]("=>"), tsChoice[K](tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K](",")), tsSymbol[K](rustHidExpressionEndingWithBlock)))
                                                                 rules[rustEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu]"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}"), tsRegex[K]("x[0-9a-fA-F]{2}")))
                                                                 rules[rustDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](rustHidDeclarationStatement)), tsString[K]("}"))
                                                                 rules[rustHidReservedIdentifier] = tsChoice[K](tsString[K]("default"), tsString[K]("union"))
                                                                 rules[rustForeignModItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsSymbol[K](rustExternModifier), tsChoice[K](tsString[K](";"), tsSymbol[K](rustDeclarationList)))
                                                                 rules[rustSelf] = tsString[K]("self")
                                                                 rules[rustBreakExpression] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](rustLoopLabel), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustHidExpression), tsBlank[K]()))
                                                                 rules[rustLineComment] = tsSeq[K](tsString[K]("//"), tsRegex[K](".*"))
                                                                 rules[rustMatchPattern] = tsSeq[K](tsSymbol[K](rustHidPattern), tsChoice[K](tsSeq[K](tsString[K]("if"), tsSymbol[K](rustHidExpression)), tsBlank[K]()))
                                                                 rules[rustEmptyType] = tsString[K]("!")
                                                                 rules[rustMutPattern] = tsSeq[K](tsSymbol[K](rustMutableSpecifier), tsSymbol[K](rustHidPattern))
                                                                 rules[rustTupleType] = tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](rustHidType), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustHidType)))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustSlicePattern] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsSymbol[K](rustHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](rustHidPattern)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("]"))
                                                                 rules[rustStaticItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("static"), tsChoice[K](tsString[K]("ref"), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustIdentifier), tsString[K](":"), tsSymbol[K](rustHidType), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](rustHidExpression)), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustGenericFunction] = tsSeq[K](tsChoice[K](tsSymbol[K](rustIdentifier), tsSymbol[K](rustScopedIdentifier), tsSymbol[K](rustFieldExpression)), tsString[K]("::"), tsSymbol[K](rustTypeArguments))
                                                                 rules[rustModItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("mod"), tsSymbol[K](rustIdentifier), tsChoice[K](tsString[K](";"), tsSymbol[K](rustDeclarationList)))
                                                                 rules[rustParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustAttributeItem), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustParameter), tsSymbol[K](rustSelfParameter), tsSymbol[K](rustVariadicParameter), tsString[K]("_"), tsSymbol[K](rustHidType))), tsRepeat[K](tsSeq[K](tsString[K](","), tsSeq[K](tsChoice[K](tsSymbol[K](rustAttributeItem), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustParameter), tsSymbol[K](rustSelfParameter), tsSymbol[K](rustVariadicParameter), tsString[K]("_"), tsSymbol[K](rustHidType)))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](")"))
                                                                 rules[rustMacroInvocation] = tsSeq[K](tsChoice[K](tsSymbol[K](rustScopedIdentifier), tsSymbol[K](rustIdentifier), tsSymbol[K](rustHidReservedIdentifier)), tsString[K]("!"), tsSymbol[K](rustTokenTree))
                                                                 rules[rustFragmentSpecifier] = tsChoice[K](tsString[K]("block"), tsString[K]("expr"), tsString[K]("ident"), tsString[K]("item"), tsString[K]("lifetime"), tsString[K]("literal"), tsString[K]("meta"), tsString[K]("pat"), tsString[K]("path"), tsString[K]("stmt"), tsString[K]("tt"), tsString[K]("ty"), tsString[K]("vis"))
                                                                 rules[rustFieldInitializer] = tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustHidFieldIdentifier), tsString[K](":"), tsSymbol[K](rustHidExpression))
                                                                 rules[rustLoopExpression] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustLoopLabel), tsString[K](":")), tsBlank[K]()), tsString[K]("loop"), tsSymbol[K](rustBlock))
                                                                 rules[rustMacroDefinition] = tsSeq[K](tsString[K]("macro_rules!"), tsChoice[K](tsSymbol[K](rustIdentifier), tsSymbol[K](rustHidReservedIdentifier)), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](rustMacroRule), tsString[K](";"))), tsChoice[K](tsSymbol[K](rustMacroRule), tsBlank[K]())), tsString[K](")"), tsString[K](";")), tsSeq[K](tsString[K]("{"), tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](rustMacroRule), tsString[K](";"))), tsChoice[K](tsSymbol[K](rustMacroRule), tsBlank[K]())), tsString[K]("}"))))
                                                                 rules[rustMetaItem] = tsSeq[K](tsSymbol[K](rustHidPath), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](rustHidLiteral)), tsSymbol[K](rustMetaArguments)), tsBlank[K]()))
                                                                 rules[rustScopedUseList] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidPath), tsBlank[K]()), tsString[K]("::"), tsSymbol[K](rustUseList))
                                                                 rules[rustReferenceExpression] = tsSeq[K](tsString[K]("&"), tsChoice[K](tsSymbol[K](rustMutableSpecifier), tsBlank[K]()), tsSymbol[K](rustHidExpression))
                                                                 rules[rustLastMatchArm] = tsSeq[K](tsRepeat[K](tsSymbol[K](rustAttributeItem)), tsSymbol[K](rustMatchPattern), tsString[K]("=>"), tsSymbol[K](rustHidExpression), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                                 rules[rustWhileLetExpression] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](rustLoopLabel), tsString[K](":")), tsBlank[K]()), tsString[K]("while"), tsString[K]("let"), tsSymbol[K](rustHidPattern), tsString[K]("="), tsSymbol[K](rustHidExpression), tsSymbol[K](rustBlock))
                                                                 rules[rustClosureParameters] = tsSeq[K](tsString[K]("|"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](rustHidPattern), tsSymbol[K](rustParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustHidPattern), tsSymbol[K](rustParameter))))), tsBlank[K]()), tsString[K]("|"))
                                                                 rules[rustRangePattern] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidLiteralPattern), tsSymbol[K](rustHidPath)), tsChoice[K](tsString[K]("..."), tsString[K]("..=")), tsChoice[K](tsSymbol[K](rustHidLiteralPattern), tsSymbol[K](rustHidPath)))
                                                                 rules[rustSuper] = tsString[K]("super")
                                                                 rules[rustEmptyStatement] = tsString[K](";")
                                                                 rules[rustTypeArguments] = tsSeq[K](tsString[K]("<"), tsSeq[K](tsChoice[K](tsSymbol[K](rustHidType), tsSymbol[K](rustTypeBinding), tsSymbol[K](rustLifetime), tsSymbol[K](rustHidLiteral), tsSymbol[K](rustBlock)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](rustHidType), tsSymbol[K](rustTypeBinding), tsSymbol[K](rustLifetime), tsSymbol[K](rustHidLiteral), tsSymbol[K](rustBlock))))), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K](">"))
                                                                 rules[rustExternCrateDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("extern"), tsSymbol[K](rustCrate), tsSymbol[K](rustIdentifier), tsChoice[K](tsSeq[K](tsString[K]("as"), tsSymbol[K](rustIdentifier)), tsBlank[K]()), tsString[K](";"))
                                                                 rules[rustBoundedType] = tsChoice[K](tsSeq[K](tsSymbol[K](rustLifetime), tsString[K]("+"), tsSymbol[K](rustHidType)), tsSeq[K](tsSymbol[K](rustHidType), tsString[K]("+"), tsSymbol[K](rustHidType)), tsSeq[K](tsSymbol[K](rustHidType), tsString[K]("+"), tsSymbol[K](rustLifetime)))
                                                                 rules[rustAssignmentExpression] = tsSeq[K](tsSymbol[K](rustHidExpression), tsString[K]("="), tsSymbol[K](rustHidExpression))
                                                                 rules[rustTokenRepetition] = tsSeq[K](tsString[K]("$"), tsString[K]("("), tsRepeat[K](tsSymbol[K](rustHidTokens)), tsString[K](")"), tsChoice[K](tsRegex[K]("[^+*?]+"), tsBlank[K]()), tsChoice[K](tsString[K]("+"), tsString[K]("*"), tsString[K]("?")))
                                                                 rules[rustGenericTypeWithTurbofish] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedIdentifier)), tsString[K]("::"), tsSymbol[K](rustTypeArguments))
                                                                 rules[rustTraitItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsChoice[K](tsString[K]("unsafe"), tsBlank[K]()), tsString[K]("trait"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustTraitBounds), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustDeclarationList))
                                                                 rules[rustAbstractType] = tsSeq[K](tsString[K]("impl"), tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier), tsSymbol[K](rustGenericType), tsSymbol[K](rustFunctionType)))
                                                                 rules[rustReturnExpression] = tsChoice[K](tsSeq[K](tsString[K]("return"), tsSymbol[K](rustHidExpression)), tsString[K]("return"))
                                                                 rules[rustMetavariable] = tsRegex[K]("\\$[a-zA-Z_]\\w*")
                                                                 rules[rustMutableSpecifier] = tsString[K]("mut")
                                                                 rules[rustGenericType] = tsSeq[K](tsChoice[K](tsSymbol[K](rustHidTypeIdentifier), tsSymbol[K](rustScopedTypeIdentifier)), tsSymbol[K](rustTypeArguments))
                                                                 rules[rustRemainingFieldPattern] = tsString[K]("..")
                                                                 rules[rustUnionItem] = tsSeq[K](tsChoice[K](tsSymbol[K](rustVisibilityModifier), tsBlank[K]()), tsString[K]("union"), tsSymbol[K](rustHidTypeIdentifier), tsChoice[K](tsSymbol[K](rustTypeParameters), tsBlank[K]()), tsChoice[K](tsSymbol[K](rustWhereClause), tsBlank[K]()), tsSymbol[K](rustFieldDeclarationList))
                                                                 rules

