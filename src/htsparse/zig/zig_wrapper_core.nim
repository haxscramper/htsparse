import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  ZigNodeKind* = enum
    zigAnonymousArrayExpr           ## anonymous_array_expr
    zigAnonymousStructEnum          ## anonymous_struct_enum
    zigArguments                    ## arguments
    zigArrayExpression              ## array_expression
    zigArrayType                    ## array_type
    zigArrayValues                  ## array_values
    zigAssignmentExpression         ## assignment_expression
    zigAssignmentOperator           ## assignment_operator
    zigAssignmentStatement          ## assignment_statement
    zigAwaitExpression              ## await_expression
    zigBinaryExpression             ## binary_expression
    zigBlock                        ## block
    zigBooleanLiteral               ## boolean_literal
    zigBreakExpression              ## break_expression
    zigBuildInCallExpr              ## build_in_call_expr
    zigCallExpression               ## call_expression
    zigCharLiteral                  ## char_literal
    zigCompoundAssignmentExpr       ## compound_assignment_expr
    zigComptimeBlock                ## comptime_block
    zigContinueExpression           ## continue_expression
    zigDeferBlock                   ## defer_block
    zigDeferExpression              ## defer_expression
    zigDereferenceExpression        ## dereference_expression
    zigEmptyStatement               ## empty_statement
    zigEnumExpression               ## enum_expression
    zigEnumIdentifier               ## enum_identifier
    zigEnumLiteral                  ## enum_literal
    zigErrorExpression              ## error_expression
    zigErrorIdentifier              ## error_identifier
    zigErrorType                    ## error_type
    zigExternModifier               ## extern_modifier
    zigFieldDeclaration             ## field_declaration
    zigFieldExpression              ## field_expression
    zigFieldIdentifier              ## field_identifier
    zigFieldInit                    ## field_init
    zigFieldPattern                 ## field_pattern
    zigForExpression                ## for_expression
    zigFunctionDeclaration          ## function_declaration
    zigFunctionModifiers            ## function_modifiers
    zigFunctionSignature            ## function_signature
    zigIdentifier                   ## identifier
    zigIfExpression                 ## if_expression
    zigIndexExpression              ## index_expression
    zigLabelIdentifier              ## label_identifier
    zigLiteralPattern               ## literal_pattern
    zigLoopLabel                    ## loop_label
    zigLoopLabelInverse             ## loop_label_inverse
    zigMultilineStringLiteral       ## multiline_string_literal
    zigNullLiteral                  ## null_literal
    zigOptionalType                 ## optional_type
    zigOrelsePostfixExpression      ## orelse_postfix_expression
    zigParameter                    ## parameter
    zigParameters                   ## parameters
    zigPayload                      ## payload
    zigPayloadExpression            ## payload_expression
    zigPayloadIdentifier            ## payload_identifier
    zigPointerType                  ## pointer_type
    zigPrimitiveType                ## primitive_type
    zigRangePattern                 ## range_pattern
    zigReferenceExpression          ## reference_expression
    zigResumeBlock                  ## resume_block
    zigResumeExpression             ## resume_expression
    zigReturnExpression             ## return_expression
    zigSlicePattern                 ## slice_pattern
    zigSourceFile                   ## source_file
    zigStringLiteral                ## string_literal
    zigStructConstruction           ## struct_construction
    zigStructExpression             ## struct_expression
    zigSuspendBlock                 ## suspend_block
    zigSuspendExpression            ## suspend_expression
    zigSwitchArm                    ## switch_arm
    zigSwitchBlock                  ## switch_block
    zigSwitchExpression             ## switch_expression
    zigSwitchLastArm                ## switch_last_arm
    zigSwitchPattern                ## switch_pattern
    zigTestExpression               ## test_expression
    zigTryExpression                ## try_expression
    zigTypeIdentifier               ## type_identifier
    zigTypePrefix                   ## type_prefix
    zigUnaryExpression              ## unary_expression
    zigUnaryOperator                ## unary_operator
    zigUnionExpression              ## union_expression
    zigUnionFieldVariant            ## union_field_variant
    zigUnionIdentifier              ## union_identifier
    zigUsingnamespaceExpression     ## usingnamespace_expression
    zigVariadicParameter            ## variadic_parameter
    zigVariantDeclaration           ## variant_declaration
    zigVisibilityModifier           ## visibility_modifier
    zigWhileExpression              ## while_expression
    zigExclamationTok               ## !
    zigQuoteTok                     ## "
    zigPercentEqualTok              ## %=
    zigAmpersandTok                 ## &
    zigAmpersandEqualTok            ## &=
    zigApostropheTok                ## '
    zigLParTok                      ## (
    zigRParTok                      ## )
    zigAsteriskTok                  ## *
    zigAsteriskPercentEqualTok      ## *%=
    zigAsteriskEqualTok             ## *=
    zigPlusPercentEqualTok          ## +%=
    zigPlusEqualTok                 ## +=
    zigCommaTok                     ## ,
    zigMinusTok                     ## -
    zigMinusPercentTok              ## -%
    zigMinusPercentEqualTok         ## -%=
    zigMinusEqualTok                ## -=
    zigDotTok                       ## .
    zigDotAsteriskTok               ## .*
    zigDoubleDotTok                 ## ..
    zigTripleDotTok                 ## ...
    zigDotQuestionTok               ## .?
    zigDotLCurlyTok                 ## .{
    zigSlashEqualTok                ## /=
    zigColonTok                     ## :
    zigSemicolonTok                 ## ;
    zigDoubleLessThanEqualTok       ## <<=
    zigEqualTok                     ## =
    zigEqualGreaterThanTok          ## =>
    zigDoubleGreaterThanEqualTok    ## >>=
    zigQuestionTok                  ## ?
    zigAtQuoteTok                   ## @"
    zigLBrackTok                    ## [
    zigDoubleBackslashTok           ## \\
    zigRBrackTok                    ## ]
    zigAccentEqualTok               ## ^=
    zigAlignTok                     ## align
    zigAllowzeroTok                 ## allowzero
    zigAnyerrorTok                  ## anyerror
    zigAssignmentModifier           ## assignment_modifier
    zigAwaitTok                     ## await
    zigBinaryOperator               ## binary_operator
    zigBoolTok                      ## bool
    zigBreakTok                     ## break
    zigCIntTok                      ## c_int
    zigCLongTok                     ## c_long
    zigCLongdoubleTok               ## c_longdouble
    zigCLonglongTok                 ## c_longlong
    zigCShortTok                    ## c_short
    zigCUintTok                     ## c_uint
    zigCUlongTok                    ## c_ulong
    zigCUlonglongTok                ## c_ulonglong
    zigCUshortTok                   ## c_ushort
    zigCVoidTok                     ## c_void
    zigCallModifier                 ## call_modifier
    zigComptimeTok                  ## comptime
    zigComptimeFloatTok             ## comptime_float
    zigComptimeIntTok               ## comptime_int
    zigConstTok                     ## const
    zigContinueTok                  ## continue
    zigCustomNumberType             ## custom_number_type
    zigDeferTok                     ## defer
    zigDocComment                   ## doc_comment
    zigElseTok                      ## else
    zigElseSwitch                   ## else_switch
    zigEnumTok                      ## enum
    zigEnumModifier                 ## enum_modifier
    zigErrdeferTok                  ## errdefer
    zigErrorTok                     ## error
    zigEscapeSequence               ## escape_sequence
    zigExportTok                    ## export
    zigExternTok                    ## extern
    zigF128Tok                      ## f128
    zigF16Tok                       ## f16
    zigF32Tok                       ## f32
    zigF64Tok                       ## f64
    zigFalseTok                     ## false
    zigFloatLiteral                 ## float_literal
    zigFnTok                        ## fn
    zigForTok                       ## for
    zigI128Tok                      ## i128
    zigI16Tok                       ## i16
    zigI32Tok                       ## i32
    zigI64Tok                       ## i64
    zigI8Tok                        ## i8
    zigIfTok                        ## if
    zigInferenceType                ## inference_type
    zigInlineTok                    ## inline
    zigIntegerLiteral               ## integer_literal
    zigIsizeTok                     ## isize
    zigLineComment                  ## line_comment
    zigLoopModifier                 ## loop_modifier
    zigNakedccTok                   ## nakedcc
    zigNoreturnTok                  ## noreturn
    zigNullTok                      ## null
    zigPointer                      ## pointer
    zigPromiseTok                   ## promise
    zigPubTok                       ## pub
    zigResumeTok                    ## resume
    zigReturnTok                    ## return
    zigStdcallccTok                 ## stdcallcc
    zigStructTok                    ## struct
    zigStructModifier               ## struct_modifier
    zigSuspendTok                   ## suspend
    zigSwitchTok                    ## switch
    zigTestTok                      ## test
    zigTrueTok                      ## true
    zigTryTok                       ## try
    zigTypeTok                      ## type
    zigU128Tok                      ## u128
    zigU16Tok                       ## u16
    zigU32Tok                       ## u32
    zigU64Tok                       ## u64
    zigU8Tok                        ## u8
    zigUndefinedLiteral             ## undefined_literal
    zigUnionTok                     ## union
    zigUnionModifier                ## union_modifier
    zigUnreachableExpression        ## unreachable_expression
    zigUsingnamespaceTok            ## usingnamespace
    zigUsizeTok                     ## usize
    zigVarTok                       ## var
    zigVoidTok                      ## void
    zigVolatileTok                  ## volatile
    zigWhileTok                     ## while
    zigLCurlyTok                    ## {
    zigPipeTok                      ## |
    zigPipeEqualTok                 ## |=
    zigRCurlyTok                    ## }
    zigTildeTok                     ## ~
    zigHidLiterals                  ## _literals
    zigHidElseTail                  ## _else_tail
    zigHidDefaultError              ## _default_error
    zigHidType                      ## _type
    zigHidExpression                ## _expression
    zigHidConditionWithContinue     ## _condition_with_continue
    zigHidDeclarationStatement      ## _declaration_statement
    zigHidErrorOneShorthand         ## _error_one_shorthand
    zigHidIdentifierText            ## _identifier_text
    zigHidStructStandalone          ## _struct_standalone
    zigHidExpressionEndingWithBlock ## _expression_ending_with_block
    zigHidExpressionStatement       ## _expression_statement
    zigHidElseCase                  ## _else_case
    zigHidStatement                 ## _statement
    zigHidPattern                   ## _pattern
    zigHidAny                       ## _any
    zigHidCondition                 ## _condition
    zigHidStrIdentifier             ## _str_identifier
    zigSyntaxError                  ## Tree-sitter parser syntax error

proc strRepr*(kind: ZigNodeKind): string =
  case kind:
    of zigAnonymousArrayExpr:           "anonymous_array_expr"
    of zigAnonymousStructEnum:          "anonymous_struct_enum"
    of zigArguments:                    "arguments"
    of zigArrayExpression:              "array_expression"
    of zigArrayType:                    "array_type"
    of zigArrayValues:                  "array_values"
    of zigAssignmentExpression:         "assignment_expression"
    of zigAssignmentOperator:           "assignment_operator"
    of zigAssignmentStatement:          "assignment_statement"
    of zigAwaitExpression:              "await_expression"
    of zigBinaryExpression:             "binary_expression"
    of zigBlock:                        "block"
    of zigBooleanLiteral:               "boolean_literal"
    of zigBreakExpression:              "break_expression"
    of zigBuildInCallExpr:              "build_in_call_expr"
    of zigCallExpression:               "call_expression"
    of zigCharLiteral:                  "char_literal"
    of zigCompoundAssignmentExpr:       "compound_assignment_expr"
    of zigComptimeBlock:                "comptime_block"
    of zigContinueExpression:           "continue_expression"
    of zigDeferBlock:                   "defer_block"
    of zigDeferExpression:              "defer_expression"
    of zigDereferenceExpression:        "dereference_expression"
    of zigEmptyStatement:               "empty_statement"
    of zigEnumExpression:               "enum_expression"
    of zigEnumIdentifier:               "enum_identifier"
    of zigEnumLiteral:                  "enum_literal"
    of zigErrorExpression:              "error_expression"
    of zigErrorIdentifier:              "error_identifier"
    of zigErrorType:                    "error_type"
    of zigExternModifier:               "extern_modifier"
    of zigFieldDeclaration:             "field_declaration"
    of zigFieldExpression:              "field_expression"
    of zigFieldIdentifier:              "field_identifier"
    of zigFieldInit:                    "field_init"
    of zigFieldPattern:                 "field_pattern"
    of zigForExpression:                "for_expression"
    of zigFunctionDeclaration:          "function_declaration"
    of zigFunctionModifiers:            "function_modifiers"
    of zigFunctionSignature:            "function_signature"
    of zigIdentifier:                   "identifier"
    of zigIfExpression:                 "if_expression"
    of zigIndexExpression:              "index_expression"
    of zigLabelIdentifier:              "label_identifier"
    of zigLiteralPattern:               "literal_pattern"
    of zigLoopLabel:                    "loop_label"
    of zigLoopLabelInverse:             "loop_label_inverse"
    of zigMultilineStringLiteral:       "multiline_string_literal"
    of zigNullLiteral:                  "null_literal"
    of zigOptionalType:                 "optional_type"
    of zigOrelsePostfixExpression:      "orelse_postfix_expression"
    of zigParameter:                    "parameter"
    of zigParameters:                   "parameters"
    of zigPayload:                      "payload"
    of zigPayloadExpression:            "payload_expression"
    of zigPayloadIdentifier:            "payload_identifier"
    of zigPointerType:                  "pointer_type"
    of zigPrimitiveType:                "primitive_type"
    of zigRangePattern:                 "range_pattern"
    of zigReferenceExpression:          "reference_expression"
    of zigResumeBlock:                  "resume_block"
    of zigResumeExpression:             "resume_expression"
    of zigReturnExpression:             "return_expression"
    of zigSlicePattern:                 "slice_pattern"
    of zigSourceFile:                   "source_file"
    of zigStringLiteral:                "string_literal"
    of zigStructConstruction:           "struct_construction"
    of zigStructExpression:             "struct_expression"
    of zigSuspendBlock:                 "suspend_block"
    of zigSuspendExpression:            "suspend_expression"
    of zigSwitchArm:                    "switch_arm"
    of zigSwitchBlock:                  "switch_block"
    of zigSwitchExpression:             "switch_expression"
    of zigSwitchLastArm:                "switch_last_arm"
    of zigSwitchPattern:                "switch_pattern"
    of zigTestExpression:               "test_expression"
    of zigTryExpression:                "try_expression"
    of zigTypeIdentifier:               "type_identifier"
    of zigTypePrefix:                   "type_prefix"
    of zigUnaryExpression:              "unary_expression"
    of zigUnaryOperator:                "unary_operator"
    of zigUnionExpression:              "union_expression"
    of zigUnionFieldVariant:            "union_field_variant"
    of zigUnionIdentifier:              "union_identifier"
    of zigUsingnamespaceExpression:     "usingnamespace_expression"
    of zigVariadicParameter:            "variadic_parameter"
    of zigVariantDeclaration:           "variant_declaration"
    of zigVisibilityModifier:           "visibility_modifier"
    of zigWhileExpression:              "while_expression"
    of zigExclamationTok:               "!"
    of zigQuoteTok:                     "\""
    of zigPercentEqualTok:              "%="
    of zigAmpersandTok:                 "&"
    of zigAmpersandEqualTok:            "&="
    of zigApostropheTok:                "\'"
    of zigLParTok:                      "("
    of zigRParTok:                      ")"
    of zigAsteriskTok:                  "*"
    of zigAsteriskPercentEqualTok:      "*%="
    of zigAsteriskEqualTok:             "*="
    of zigPlusPercentEqualTok:          "+%="
    of zigPlusEqualTok:                 "+="
    of zigCommaTok:                     ","
    of zigMinusTok:                     "-"
    of zigMinusPercentTok:              "-%"
    of zigMinusPercentEqualTok:         "-%="
    of zigMinusEqualTok:                "-="
    of zigDotTok:                       "."
    of zigDotAsteriskTok:               ".*"
    of zigDoubleDotTok:                 ".."
    of zigTripleDotTok:                 "..."
    of zigDotQuestionTok:               ".?"
    of zigDotLCurlyTok:                 ".{"
    of zigSlashEqualTok:                "/="
    of zigColonTok:                     ":"
    of zigSemicolonTok:                 ";"
    of zigDoubleLessThanEqualTok:       "<<="
    of zigEqualTok:                     "="
    of zigEqualGreaterThanTok:          "=>"
    of zigDoubleGreaterThanEqualTok:    ">>="
    of zigQuestionTok:                  "?"
    of zigAtQuoteTok:                   "@\""
    of zigLBrackTok:                    "["
    of zigDoubleBackslashTok:           "\\\\"
    of zigRBrackTok:                    "]"
    of zigAccentEqualTok:               "^="
    of zigAlignTok:                     "align"
    of zigAllowzeroTok:                 "allowzero"
    of zigAnyerrorTok:                  "anyerror"
    of zigAssignmentModifier:           "assignment_modifier"
    of zigAwaitTok:                     "await"
    of zigBinaryOperator:               "binary_operator"
    of zigBoolTok:                      "bool"
    of zigBreakTok:                     "break"
    of zigCIntTok:                      "c_int"
    of zigCLongTok:                     "c_long"
    of zigCLongdoubleTok:               "c_longdouble"
    of zigCLonglongTok:                 "c_longlong"
    of zigCShortTok:                    "c_short"
    of zigCUintTok:                     "c_uint"
    of zigCUlongTok:                    "c_ulong"
    of zigCUlonglongTok:                "c_ulonglong"
    of zigCUshortTok:                   "c_ushort"
    of zigCVoidTok:                     "c_void"
    of zigCallModifier:                 "call_modifier"
    of zigComptimeTok:                  "comptime"
    of zigComptimeFloatTok:             "comptime_float"
    of zigComptimeIntTok:               "comptime_int"
    of zigConstTok:                     "const"
    of zigContinueTok:                  "continue"
    of zigCustomNumberType:             "custom_number_type"
    of zigDeferTok:                     "defer"
    of zigDocComment:                   "doc_comment"
    of zigElseTok:                      "else"
    of zigElseSwitch:                   "else_switch"
    of zigEnumTok:                      "enum"
    of zigEnumModifier:                 "enum_modifier"
    of zigErrdeferTok:                  "errdefer"
    of zigErrorTok:                     "error"
    of zigEscapeSequence:               "escape_sequence"
    of zigExportTok:                    "export"
    of zigExternTok:                    "extern"
    of zigF128Tok:                      "f128"
    of zigF16Tok:                       "f16"
    of zigF32Tok:                       "f32"
    of zigF64Tok:                       "f64"
    of zigFalseTok:                     "false"
    of zigFloatLiteral:                 "float_literal"
    of zigFnTok:                        "fn"
    of zigForTok:                       "for"
    of zigI128Tok:                      "i128"
    of zigI16Tok:                       "i16"
    of zigI32Tok:                       "i32"
    of zigI64Tok:                       "i64"
    of zigI8Tok:                        "i8"
    of zigIfTok:                        "if"
    of zigInferenceType:                "inference_type"
    of zigInlineTok:                    "inline"
    of zigIntegerLiteral:               "integer_literal"
    of zigIsizeTok:                     "isize"
    of zigLineComment:                  "line_comment"
    of zigLoopModifier:                 "loop_modifier"
    of zigNakedccTok:                   "nakedcc"
    of zigNoreturnTok:                  "noreturn"
    of zigNullTok:                      "null"
    of zigPointer:                      "pointer"
    of zigPromiseTok:                   "promise"
    of zigPubTok:                       "pub"
    of zigResumeTok:                    "resume"
    of zigReturnTok:                    "return"
    of zigStdcallccTok:                 "stdcallcc"
    of zigStructTok:                    "struct"
    of zigStructModifier:               "struct_modifier"
    of zigSuspendTok:                   "suspend"
    of zigSwitchTok:                    "switch"
    of zigTestTok:                      "test"
    of zigTrueTok:                      "true"
    of zigTryTok:                       "try"
    of zigTypeTok:                      "type"
    of zigU128Tok:                      "u128"
    of zigU16Tok:                       "u16"
    of zigU32Tok:                       "u32"
    of zigU64Tok:                       "u64"
    of zigU8Tok:                        "u8"
    of zigUndefinedLiteral:             "undefined_literal"
    of zigUnionTok:                     "union"
    of zigUnionModifier:                "union_modifier"
    of zigUnreachableExpression:        "unreachable_expression"
    of zigUsingnamespaceTok:            "usingnamespace"
    of zigUsizeTok:                     "usize"
    of zigVarTok:                       "var"
    of zigVoidTok:                      "void"
    of zigVolatileTok:                  "volatile"
    of zigWhileTok:                     "while"
    of zigLCurlyTok:                    "{"
    of zigPipeTok:                      "|"
    of zigPipeEqualTok:                 "|="
    of zigRCurlyTok:                    "}"
    of zigTildeTok:                     "~"
    of zigHidLiterals:                  "_literals"
    of zigHidElseTail:                  "_else_tail"
    of zigHidDefaultError:              "_default_error"
    of zigHidType:                      "_type"
    of zigHidExpression:                "_expression"
    of zigHidConditionWithContinue:     "_condition_with_continue"
    of zigHidDeclarationStatement:      "_declaration_statement"
    of zigHidErrorOneShorthand:         "_error_one_shorthand"
    of zigHidIdentifierText:            "_identifier_text"
    of zigHidStructStandalone:          "_struct_standalone"
    of zigHidExpressionEndingWithBlock: "_expression_ending_with_block"
    of zigHidExpressionStatement:       "_expression_statement"
    of zigHidElseCase:                  "_else_case"
    of zigHidStatement:                 "_statement"
    of zigHidPattern:                   "_pattern"
    of zigHidAny:                       "_any"
    of zigHidCondition:                 "_condition"
    of zigHidStrIdentifier:             "_str_identifier"
    of zigSyntaxError:                  "ERROR"

type
  TsZigNode* = distinct TSNode

type
  ZigParser* = distinct PtsParser

const zigAllowedSubnodes*: array[ZigNodeKind, set[ZigNodeKind]] = block:
                                                                    var tmp: array[ZigNodeKind, set[ZigNodeKind]]
                                                                    tmp[zigArguments] = {
                                                                                          zigAnonymousArrayExpr,
                                                                                          zigAnonymousStructEnum,
                                                                                          zigArrayExpression,
                                                                                          zigArrayType,
                                                                                          zigAssignmentExpression,
                                                                                          zigAwaitExpression,
                                                                                          zigBinaryExpression,
                                                                                          zigBlock,
                                                                                          zigBooleanLiteral,
                                                                                          zigBreakExpression,
                                                                                          zigBuildInCallExpr,
                                                                                          zigCallExpression,
                                                                                          zigCharLiteral,
                                                                                          zigCompoundAssignmentExpr,
                                                                                          zigComptimeBlock,
                                                                                          zigContinueExpression,
                                                                                          zigCustomNumberType,
                                                                                          zigDeferBlock,
                                                                                          zigDeferExpression,
                                                                                          zigDereferenceExpression,
                                                                                          zigEnumExpression,
                                                                                          zigEnumLiteral,
                                                                                          zigErrorExpression,
                                                                                          zigErrorType,
                                                                                          zigFieldExpression,
                                                                                          zigFloatLiteral,
                                                                                          zigForExpression,
                                                                                          zigIdentifier,
                                                                                          zigIfExpression,
                                                                                          zigIndexExpression,
                                                                                          zigIntegerLiteral,
                                                                                          zigMultilineStringLiteral,
                                                                                          zigNullLiteral,
                                                                                          zigOptionalType,
                                                                                          zigOrelsePostfixExpression,
                                                                                          zigPayloadExpression,
                                                                                          zigPointerType,
                                                                                          zigPrimitiveType,
                                                                                          zigRangePattern,
                                                                                          zigReferenceExpression,
                                                                                          zigResumeBlock,
                                                                                          zigResumeExpression,
                                                                                          zigReturnExpression,
                                                                                          zigStringLiteral,
                                                                                          zigStructConstruction,
                                                                                          zigStructExpression,
                                                                                          zigSuspendBlock,
                                                                                          zigSuspendExpression,
                                                                                          zigSwitchExpression,
                                                                                          zigTestExpression,
                                                                                          zigTryExpression,
                                                                                          zigTypeIdentifier,
                                                                                          zigUnaryExpression,
                                                                                          zigUndefinedLiteral,
                                                                                          zigUnionExpression,
                                                                                          zigUnreachableExpression,
                                                                                          zigUsingnamespaceExpression,
                                                                                          zigWhileExpression
                                                                                        }
                                                                    tmp[zigArrayType] = {
                                                                                          zigCustomNumberType,
                                                                                          zigErrorType,
                                                                                          zigOptionalType,
                                                                                          zigPointerType,
                                                                                          zigPrimitiveType,
                                                                                          zigTypeIdentifier,
                                                                                          zigTypePrefix
                                                                                        }
                                                                    tmp[zigArrayValues] = {
                                                                                            zigAnonymousArrayExpr,
                                                                                            zigAnonymousStructEnum,
                                                                                            zigArrayExpression,
                                                                                            zigArrayType,
                                                                                            zigAssignmentExpression,
                                                                                            zigAwaitExpression,
                                                                                            zigBinaryExpression,
                                                                                            zigBlock,
                                                                                            zigBooleanLiteral,
                                                                                            zigBreakExpression,
                                                                                            zigBuildInCallExpr,
                                                                                            zigCallExpression,
                                                                                            zigCharLiteral,
                                                                                            zigCompoundAssignmentExpr,
                                                                                            zigComptimeBlock,
                                                                                            zigContinueExpression,
                                                                                            zigCustomNumberType,
                                                                                            zigDeferBlock,
                                                                                            zigDeferExpression,
                                                                                            zigDereferenceExpression,
                                                                                            zigEnumExpression,
                                                                                            zigEnumLiteral,
                                                                                            zigErrorExpression,
                                                                                            zigErrorType,
                                                                                            zigFieldExpression,
                                                                                            zigFloatLiteral,
                                                                                            zigForExpression,
                                                                                            zigIdentifier,
                                                                                            zigIfExpression,
                                                                                            zigIndexExpression,
                                                                                            zigIntegerLiteral,
                                                                                            zigMultilineStringLiteral,
                                                                                            zigNullLiteral,
                                                                                            zigOptionalType,
                                                                                            zigOrelsePostfixExpression,
                                                                                            zigPayloadExpression,
                                                                                            zigPointerType,
                                                                                            zigPrimitiveType,
                                                                                            zigRangePattern,
                                                                                            zigReferenceExpression,
                                                                                            zigResumeBlock,
                                                                                            zigResumeExpression,
                                                                                            zigReturnExpression,
                                                                                            zigStringLiteral,
                                                                                            zigStructConstruction,
                                                                                            zigStructExpression,
                                                                                            zigSuspendBlock,
                                                                                            zigSuspendExpression,
                                                                                            zigSwitchExpression,
                                                                                            zigTestExpression,
                                                                                            zigTryExpression,
                                                                                            zigTypeIdentifier,
                                                                                            zigUnaryExpression,
                                                                                            zigUndefinedLiteral,
                                                                                            zigUnionExpression,
                                                                                            zigUnreachableExpression,
                                                                                            zigUsingnamespaceExpression,
                                                                                            zigWhileExpression
                                                                                          }
                                                                    tmp[zigAssignmentStatement] = {zigAssignmentModifier, zigVisibilityModifier}
                                                                    tmp[zigAwaitExpression] = {
                                                                                                zigAnonymousArrayExpr,
                                                                                                zigAnonymousStructEnum,
                                                                                                zigArrayExpression,
                                                                                                zigArrayType,
                                                                                                zigAssignmentExpression,
                                                                                                zigAwaitExpression,
                                                                                                zigBinaryExpression,
                                                                                                zigBlock,
                                                                                                zigBooleanLiteral,
                                                                                                zigBreakExpression,
                                                                                                zigBuildInCallExpr,
                                                                                                zigCallExpression,
                                                                                                zigCharLiteral,
                                                                                                zigCompoundAssignmentExpr,
                                                                                                zigComptimeBlock,
                                                                                                zigContinueExpression,
                                                                                                zigCustomNumberType,
                                                                                                zigDeferBlock,
                                                                                                zigDeferExpression,
                                                                                                zigDereferenceExpression,
                                                                                                zigEnumExpression,
                                                                                                zigEnumLiteral,
                                                                                                zigErrorExpression,
                                                                                                zigErrorType,
                                                                                                zigFieldExpression,
                                                                                                zigFloatLiteral,
                                                                                                zigForExpression,
                                                                                                zigIdentifier,
                                                                                                zigIfExpression,
                                                                                                zigIndexExpression,
                                                                                                zigIntegerLiteral,
                                                                                                zigMultilineStringLiteral,
                                                                                                zigNullLiteral,
                                                                                                zigOptionalType,
                                                                                                zigOrelsePostfixExpression,
                                                                                                zigPayloadExpression,
                                                                                                zigPointerType,
                                                                                                zigPrimitiveType,
                                                                                                zigRangePattern,
                                                                                                zigReferenceExpression,
                                                                                                zigResumeBlock,
                                                                                                zigResumeExpression,
                                                                                                zigReturnExpression,
                                                                                                zigStringLiteral,
                                                                                                zigStructConstruction,
                                                                                                zigStructExpression,
                                                                                                zigSuspendBlock,
                                                                                                zigSuspendExpression,
                                                                                                zigSwitchExpression,
                                                                                                zigTestExpression,
                                                                                                zigTryExpression,
                                                                                                zigTypeIdentifier,
                                                                                                zigUnaryExpression,
                                                                                                zigUndefinedLiteral,
                                                                                                zigUnionExpression,
                                                                                                zigUnreachableExpression,
                                                                                                zigUsingnamespaceExpression,
                                                                                                zigWhileExpression
                                                                                              }
                                                                    tmp[zigBlock] = {
                                                                                      zigAnonymousArrayExpr,
                                                                                      zigAnonymousStructEnum,
                                                                                      zigArrayExpression,
                                                                                      zigArrayType,
                                                                                      zigAssignmentExpression,
                                                                                      zigAssignmentStatement,
                                                                                      zigAwaitExpression,
                                                                                      zigBinaryExpression,
                                                                                      zigBlock,
                                                                                      zigBooleanLiteral,
                                                                                      zigBreakExpression,
                                                                                      zigBuildInCallExpr,
                                                                                      zigCallExpression,
                                                                                      zigCharLiteral,
                                                                                      zigCompoundAssignmentExpr,
                                                                                      zigComptimeBlock,
                                                                                      zigContinueExpression,
                                                                                      zigCustomNumberType,
                                                                                      zigDeferBlock,
                                                                                      zigDeferExpression,
                                                                                      zigDereferenceExpression,
                                                                                      zigEmptyStatement,
                                                                                      zigEnumExpression,
                                                                                      zigEnumLiteral,
                                                                                      zigErrorExpression,
                                                                                      zigErrorType,
                                                                                      zigFieldExpression,
                                                                                      zigFloatLiteral,
                                                                                      zigForExpression,
                                                                                      zigFunctionDeclaration,
                                                                                      zigFunctionSignature,
                                                                                      zigIdentifier,
                                                                                      zigIfExpression,
                                                                                      zigIndexExpression,
                                                                                      zigIntegerLiteral,
                                                                                      zigMultilineStringLiteral,
                                                                                      zigNullLiteral,
                                                                                      zigOptionalType,
                                                                                      zigOrelsePostfixExpression,
                                                                                      zigPayloadExpression,
                                                                                      zigPointerType,
                                                                                      zigPrimitiveType,
                                                                                      zigRangePattern,
                                                                                      zigReferenceExpression,
                                                                                      zigResumeBlock,
                                                                                      zigResumeExpression,
                                                                                      zigReturnExpression,
                                                                                      zigStringLiteral,
                                                                                      zigStructConstruction,
                                                                                      zigStructExpression,
                                                                                      zigSuspendBlock,
                                                                                      zigSuspendExpression,
                                                                                      zigSwitchExpression,
                                                                                      zigTestExpression,
                                                                                      zigTryExpression,
                                                                                      zigTypeIdentifier,
                                                                                      zigUnaryExpression,
                                                                                      zigUndefinedLiteral,
                                                                                      zigUnionExpression,
                                                                                      zigUnreachableExpression,
                                                                                      zigUsingnamespaceExpression,
                                                                                      zigWhileExpression
                                                                                    }
                                                                    tmp[zigCallExpression] = {zigCallModifier}
                                                                    tmp[zigCharLiteral] = {zigEscapeSequence}
                                                                    tmp[zigComptimeBlock] = {zigBlock}
                                                                    tmp[zigDeferBlock] = {zigBlock}
                                                                    tmp[zigDeferExpression] = {
                                                                                                zigAnonymousArrayExpr,
                                                                                                zigAnonymousStructEnum,
                                                                                                zigArrayExpression,
                                                                                                zigArrayType,
                                                                                                zigAssignmentExpression,
                                                                                                zigAwaitExpression,
                                                                                                zigBinaryExpression,
                                                                                                zigBlock,
                                                                                                zigBooleanLiteral,
                                                                                                zigBreakExpression,
                                                                                                zigBuildInCallExpr,
                                                                                                zigCallExpression,
                                                                                                zigCharLiteral,
                                                                                                zigCompoundAssignmentExpr,
                                                                                                zigComptimeBlock,
                                                                                                zigContinueExpression,
                                                                                                zigCustomNumberType,
                                                                                                zigDeferBlock,
                                                                                                zigDeferExpression,
                                                                                                zigDereferenceExpression,
                                                                                                zigEnumExpression,
                                                                                                zigEnumLiteral,
                                                                                                zigErrorExpression,
                                                                                                zigErrorType,
                                                                                                zigFieldExpression,
                                                                                                zigFloatLiteral,
                                                                                                zigForExpression,
                                                                                                zigIdentifier,
                                                                                                zigIfExpression,
                                                                                                zigIndexExpression,
                                                                                                zigIntegerLiteral,
                                                                                                zigMultilineStringLiteral,
                                                                                                zigNullLiteral,
                                                                                                zigOptionalType,
                                                                                                zigOrelsePostfixExpression,
                                                                                                zigPayloadExpression,
                                                                                                zigPointerType,
                                                                                                zigPrimitiveType,
                                                                                                zigRangePattern,
                                                                                                zigReferenceExpression,
                                                                                                zigResumeBlock,
                                                                                                zigResumeExpression,
                                                                                                zigReturnExpression,
                                                                                                zigStringLiteral,
                                                                                                zigStructConstruction,
                                                                                                zigStructExpression,
                                                                                                zigSuspendBlock,
                                                                                                zigSuspendExpression,
                                                                                                zigSwitchExpression,
                                                                                                zigTestExpression,
                                                                                                zigTryExpression,
                                                                                                zigTypeIdentifier,
                                                                                                zigUnaryExpression,
                                                                                                zigUndefinedLiteral,
                                                                                                zigUnionExpression,
                                                                                                zigUnreachableExpression,
                                                                                                zigUsingnamespaceExpression,
                                                                                                zigWhileExpression
                                                                                              }
                                                                    tmp[zigEnumExpression] = {
                                                                                               zigAnonymousArrayExpr,
                                                                                               zigAnonymousStructEnum,
                                                                                               zigArrayExpression,
                                                                                               zigArrayType,
                                                                                               zigAssignmentExpression,
                                                                                               zigAssignmentStatement,
                                                                                               zigAwaitExpression,
                                                                                               zigBinaryExpression,
                                                                                               zigBlock,
                                                                                               zigBooleanLiteral,
                                                                                               zigBreakExpression,
                                                                                               zigBuildInCallExpr,
                                                                                               zigCallExpression,
                                                                                               zigCharLiteral,
                                                                                               zigCompoundAssignmentExpr,
                                                                                               zigComptimeBlock,
                                                                                               zigContinueExpression,
                                                                                               zigCustomNumberType,
                                                                                               zigDeferBlock,
                                                                                               zigDeferExpression,
                                                                                               zigDereferenceExpression,
                                                                                               zigEmptyStatement,
                                                                                               zigEnumExpression,
                                                                                               zigEnumLiteral,
                                                                                               zigEnumModifier,
                                                                                               zigErrorExpression,
                                                                                               zigErrorType,
                                                                                               zigFieldExpression,
                                                                                               zigFloatLiteral,
                                                                                               zigForExpression,
                                                                                               zigFunctionDeclaration,
                                                                                               zigFunctionSignature,
                                                                                               zigIdentifier,
                                                                                               zigIfExpression,
                                                                                               zigIndexExpression,
                                                                                               zigIntegerLiteral,
                                                                                               zigMultilineStringLiteral,
                                                                                               zigNullLiteral,
                                                                                               zigOptionalType,
                                                                                               zigOrelsePostfixExpression,
                                                                                               zigPayloadExpression,
                                                                                               zigPointerType,
                                                                                               zigPrimitiveType,
                                                                                               zigRangePattern,
                                                                                               zigReferenceExpression,
                                                                                               zigResumeBlock,
                                                                                               zigResumeExpression,
                                                                                               zigReturnExpression,
                                                                                               zigStringLiteral,
                                                                                               zigStructConstruction,
                                                                                               zigStructExpression,
                                                                                               zigSuspendBlock,
                                                                                               zigSuspendExpression,
                                                                                               zigSwitchExpression,
                                                                                               zigTestExpression,
                                                                                               zigTryExpression,
                                                                                               zigTypeIdentifier,
                                                                                               zigUnaryExpression,
                                                                                               zigUndefinedLiteral,
                                                                                               zigUnionExpression,
                                                                                               zigUnreachableExpression,
                                                                                               zigUsingnamespaceExpression,
                                                                                               zigWhileExpression
                                                                                             }
                                                                    tmp[zigEnumIdentifier] = {zigStringLiteral}
                                                                    tmp[zigErrorIdentifier] = {zigStringLiteral}
                                                                    tmp[zigExternModifier] = {zigStringLiteral}
                                                                    tmp[zigFieldDeclaration] = {zigVisibilityModifier}
                                                                    tmp[zigFieldIdentifier] = {zigStringLiteral}
                                                                    tmp[zigForExpression] = {zigLoopLabel, zigLoopModifier, zigPayload}
                                                                    tmp[zigFunctionDeclaration] = {zigFunctionModifiers, zigVisibilityModifier}
                                                                    tmp[zigFunctionModifiers] = {zigExternModifier}
                                                                    tmp[zigFunctionSignature] = {zigFunctionModifiers, zigVisibilityModifier}
                                                                    tmp[zigIdentifier] = {zigStringLiteral}
                                                                    tmp[zigIfExpression] = {zigPayload}
                                                                    tmp[zigIndexExpression] = {
                                                                                                zigAnonymousArrayExpr,
                                                                                                zigAnonymousStructEnum,
                                                                                                zigArrayExpression,
                                                                                                zigArrayType,
                                                                                                zigAssignmentExpression,
                                                                                                zigAwaitExpression,
                                                                                                zigBinaryExpression,
                                                                                                zigBlock,
                                                                                                zigBooleanLiteral,
                                                                                                zigBreakExpression,
                                                                                                zigBuildInCallExpr,
                                                                                                zigCallExpression,
                                                                                                zigCharLiteral,
                                                                                                zigCompoundAssignmentExpr,
                                                                                                zigComptimeBlock,
                                                                                                zigContinueExpression,
                                                                                                zigCustomNumberType,
                                                                                                zigDeferBlock,
                                                                                                zigDeferExpression,
                                                                                                zigDereferenceExpression,
                                                                                                zigEnumExpression,
                                                                                                zigEnumLiteral,
                                                                                                zigErrorExpression,
                                                                                                zigErrorType,
                                                                                                zigFieldExpression,
                                                                                                zigFloatLiteral,
                                                                                                zigForExpression,
                                                                                                zigIdentifier,
                                                                                                zigIfExpression,
                                                                                                zigIndexExpression,
                                                                                                zigIntegerLiteral,
                                                                                                zigMultilineStringLiteral,
                                                                                                zigNullLiteral,
                                                                                                zigOptionalType,
                                                                                                zigOrelsePostfixExpression,
                                                                                                zigPayloadExpression,
                                                                                                zigPointerType,
                                                                                                zigPrimitiveType,
                                                                                                zigRangePattern,
                                                                                                zigReferenceExpression,
                                                                                                zigResumeBlock,
                                                                                                zigResumeExpression,
                                                                                                zigReturnExpression,
                                                                                                zigSlicePattern,
                                                                                                zigStringLiteral,
                                                                                                zigStructConstruction,
                                                                                                zigStructExpression,
                                                                                                zigSuspendBlock,
                                                                                                zigSuspendExpression,
                                                                                                zigSwitchExpression,
                                                                                                zigTestExpression,
                                                                                                zigTryExpression,
                                                                                                zigTypeIdentifier,
                                                                                                zigUnaryExpression,
                                                                                                zigUndefinedLiteral,
                                                                                                zigUnionExpression,
                                                                                                zigUnreachableExpression,
                                                                                                zigUsingnamespaceExpression,
                                                                                                zigWhileExpression
                                                                                              }
                                                                    tmp[zigLabelIdentifier] = {zigStringLiteral}
                                                                    tmp[zigLiteralPattern] = {
                                                                                               zigBooleanLiteral,
                                                                                               zigCharLiteral,
                                                                                               zigEnumLiteral,
                                                                                               zigFloatLiteral,
                                                                                               zigIntegerLiteral,
                                                                                               zigMultilineStringLiteral,
                                                                                               zigNullLiteral,
                                                                                               zigStringLiteral,
                                                                                               zigUndefinedLiteral
                                                                                             }
                                                                    tmp[zigMultilineStringLiteral] = {zigStringLiteral}
                                                                    tmp[zigOptionalType] = {
                                                                                             zigArrayType,
                                                                                             zigCustomNumberType,
                                                                                             zigErrorType,
                                                                                             zigOptionalType,
                                                                                             zigPointerType,
                                                                                             zigPrimitiveType,
                                                                                             zigStructExpression,
                                                                                             zigTypeIdentifier
                                                                                           }
                                                                    tmp[zigParameters] = {zigParameter}
                                                                    tmp[zigPayloadExpression] = {
                                                                                                  zigAnonymousArrayExpr,
                                                                                                  zigAnonymousStructEnum,
                                                                                                  zigArrayExpression,
                                                                                                  zigArrayType,
                                                                                                  zigAssignmentExpression,
                                                                                                  zigAwaitExpression,
                                                                                                  zigBinaryExpression,
                                                                                                  zigBlock,
                                                                                                  zigBooleanLiteral,
                                                                                                  zigBreakExpression,
                                                                                                  zigBuildInCallExpr,
                                                                                                  zigCallExpression,
                                                                                                  zigCharLiteral,
                                                                                                  zigCompoundAssignmentExpr,
                                                                                                  zigComptimeBlock,
                                                                                                  zigContinueExpression,
                                                                                                  zigCustomNumberType,
                                                                                                  zigDeferBlock,
                                                                                                  zigDeferExpression,
                                                                                                  zigDereferenceExpression,
                                                                                                  zigEnumExpression,
                                                                                                  zigEnumLiteral,
                                                                                                  zigErrorExpression,
                                                                                                  zigErrorType,
                                                                                                  zigFieldExpression,
                                                                                                  zigFloatLiteral,
                                                                                                  zigForExpression,
                                                                                                  zigIdentifier,
                                                                                                  zigIfExpression,
                                                                                                  zigIndexExpression,
                                                                                                  zigIntegerLiteral,
                                                                                                  zigMultilineStringLiteral,
                                                                                                  zigNullLiteral,
                                                                                                  zigOptionalType,
                                                                                                  zigOrelsePostfixExpression,
                                                                                                  zigPayload,
                                                                                                  zigPayloadExpression,
                                                                                                  zigPointerType,
                                                                                                  zigPrimitiveType,
                                                                                                  zigRangePattern,
                                                                                                  zigReferenceExpression,
                                                                                                  zigResumeBlock,
                                                                                                  zigResumeExpression,
                                                                                                  zigReturnExpression,
                                                                                                  zigStringLiteral,
                                                                                                  zigStructConstruction,
                                                                                                  zigStructExpression,
                                                                                                  zigSuspendBlock,
                                                                                                  zigSuspendExpression,
                                                                                                  zigSwitchExpression,
                                                                                                  zigTestExpression,
                                                                                                  zigTryExpression,
                                                                                                  zigTypeIdentifier,
                                                                                                  zigUnaryExpression,
                                                                                                  zigUndefinedLiteral,
                                                                                                  zigUnionExpression,
                                                                                                  zigUnreachableExpression,
                                                                                                  zigUsingnamespaceExpression,
                                                                                                  zigWhileExpression
                                                                                                }
                                                                    tmp[zigPayloadIdentifier] = {zigStringLiteral}
                                                                    tmp[zigPointerType] = {
                                                                                            zigArrayType,
                                                                                            zigCustomNumberType,
                                                                                            zigErrorType,
                                                                                            zigOptionalType,
                                                                                            zigPointerType,
                                                                                            zigPrimitiveType,
                                                                                            zigStructExpression,
                                                                                            zigTypeIdentifier,
                                                                                            zigTypePrefix
                                                                                          }
                                                                    tmp[zigResumeBlock] = {zigBlock}
                                                                    tmp[zigResumeExpression] = {
                                                                                                 zigAnonymousArrayExpr,
                                                                                                 zigAnonymousStructEnum,
                                                                                                 zigArrayExpression,
                                                                                                 zigArrayType,
                                                                                                 zigAssignmentExpression,
                                                                                                 zigAwaitExpression,
                                                                                                 zigBinaryExpression,
                                                                                                 zigBlock,
                                                                                                 zigBooleanLiteral,
                                                                                                 zigBreakExpression,
                                                                                                 zigBuildInCallExpr,
                                                                                                 zigCallExpression,
                                                                                                 zigCharLiteral,
                                                                                                 zigCompoundAssignmentExpr,
                                                                                                 zigComptimeBlock,
                                                                                                 zigContinueExpression,
                                                                                                 zigCustomNumberType,
                                                                                                 zigDeferBlock,
                                                                                                 zigDeferExpression,
                                                                                                 zigDereferenceExpression,
                                                                                                 zigEnumExpression,
                                                                                                 zigEnumLiteral,
                                                                                                 zigErrorExpression,
                                                                                                 zigErrorType,
                                                                                                 zigFieldExpression,
                                                                                                 zigFloatLiteral,
                                                                                                 zigForExpression,
                                                                                                 zigIdentifier,
                                                                                                 zigIfExpression,
                                                                                                 zigIndexExpression,
                                                                                                 zigIntegerLiteral,
                                                                                                 zigMultilineStringLiteral,
                                                                                                 zigNullLiteral,
                                                                                                 zigOptionalType,
                                                                                                 zigOrelsePostfixExpression,
                                                                                                 zigPayloadExpression,
                                                                                                 zigPointerType,
                                                                                                 zigPrimitiveType,
                                                                                                 zigRangePattern,
                                                                                                 zigReferenceExpression,
                                                                                                 zigResumeBlock,
                                                                                                 zigResumeExpression,
                                                                                                 zigReturnExpression,
                                                                                                 zigStringLiteral,
                                                                                                 zigStructConstruction,
                                                                                                 zigStructExpression,
                                                                                                 zigSuspendBlock,
                                                                                                 zigSuspendExpression,
                                                                                                 zigSwitchExpression,
                                                                                                 zigTestExpression,
                                                                                                 zigTryExpression,
                                                                                                 zigTypeIdentifier,
                                                                                                 zigUnaryExpression,
                                                                                                 zigUndefinedLiteral,
                                                                                                 zigUnionExpression,
                                                                                                 zigUnreachableExpression,
                                                                                                 zigUsingnamespaceExpression,
                                                                                                 zigWhileExpression
                                                                                               }
                                                                    tmp[zigReturnExpression] = {
                                                                                                 zigAnonymousArrayExpr,
                                                                                                 zigAnonymousStructEnum,
                                                                                                 zigArrayExpression,
                                                                                                 zigArrayType,
                                                                                                 zigAssignmentExpression,
                                                                                                 zigAwaitExpression,
                                                                                                 zigBinaryExpression,
                                                                                                 zigBlock,
                                                                                                 zigBooleanLiteral,
                                                                                                 zigBreakExpression,
                                                                                                 zigBuildInCallExpr,
                                                                                                 zigCallExpression,
                                                                                                 zigCharLiteral,
                                                                                                 zigCompoundAssignmentExpr,
                                                                                                 zigComptimeBlock,
                                                                                                 zigContinueExpression,
                                                                                                 zigCustomNumberType,
                                                                                                 zigDeferBlock,
                                                                                                 zigDeferExpression,
                                                                                                 zigDereferenceExpression,
                                                                                                 zigEnumExpression,
                                                                                                 zigEnumLiteral,
                                                                                                 zigErrorExpression,
                                                                                                 zigErrorType,
                                                                                                 zigFieldExpression,
                                                                                                 zigFloatLiteral,
                                                                                                 zigForExpression,
                                                                                                 zigIdentifier,
                                                                                                 zigIfExpression,
                                                                                                 zigIndexExpression,
                                                                                                 zigIntegerLiteral,
                                                                                                 zigMultilineStringLiteral,
                                                                                                 zigNullLiteral,
                                                                                                 zigOptionalType,
                                                                                                 zigOrelsePostfixExpression,
                                                                                                 zigPayloadExpression,
                                                                                                 zigPointerType,
                                                                                                 zigPrimitiveType,
                                                                                                 zigRangePattern,
                                                                                                 zigReferenceExpression,
                                                                                                 zigResumeBlock,
                                                                                                 zigResumeExpression,
                                                                                                 zigReturnExpression,
                                                                                                 zigStringLiteral,
                                                                                                 zigStructConstruction,
                                                                                                 zigStructExpression,
                                                                                                 zigSuspendBlock,
                                                                                                 zigSuspendExpression,
                                                                                                 zigSwitchExpression,
                                                                                                 zigTestExpression,
                                                                                                 zigTryExpression,
                                                                                                 zigTypeIdentifier,
                                                                                                 zigUnaryExpression,
                                                                                                 zigUndefinedLiteral,
                                                                                                 zigUnionExpression,
                                                                                                 zigUnreachableExpression,
                                                                                                 zigUsingnamespaceExpression,
                                                                                                 zigWhileExpression
                                                                                               }
                                                                    tmp[zigSourceFile] = {
                                                                                           zigAnonymousArrayExpr,
                                                                                           zigAnonymousStructEnum,
                                                                                           zigArrayExpression,
                                                                                           zigArrayType,
                                                                                           zigAssignmentExpression,
                                                                                           zigAssignmentStatement,
                                                                                           zigAwaitExpression,
                                                                                           zigBinaryExpression,
                                                                                           zigBlock,
                                                                                           zigBooleanLiteral,
                                                                                           zigBreakExpression,
                                                                                           zigBuildInCallExpr,
                                                                                           zigCallExpression,
                                                                                           zigCharLiteral,
                                                                                           zigCompoundAssignmentExpr,
                                                                                           zigComptimeBlock,
                                                                                           zigContinueExpression,
                                                                                           zigCustomNumberType,
                                                                                           zigDeferBlock,
                                                                                           zigDeferExpression,
                                                                                           zigDereferenceExpression,
                                                                                           zigEmptyStatement,
                                                                                           zigEnumExpression,
                                                                                           zigEnumLiteral,
                                                                                           zigErrorExpression,
                                                                                           zigErrorType,
                                                                                           zigFieldExpression,
                                                                                           zigFloatLiteral,
                                                                                           zigForExpression,
                                                                                           zigFunctionDeclaration,
                                                                                           zigFunctionSignature,
                                                                                           zigIdentifier,
                                                                                           zigIfExpression,
                                                                                           zigIndexExpression,
                                                                                           zigIntegerLiteral,
                                                                                           zigMultilineStringLiteral,
                                                                                           zigNullLiteral,
                                                                                           zigOptionalType,
                                                                                           zigOrelsePostfixExpression,
                                                                                           zigPayloadExpression,
                                                                                           zigPointerType,
                                                                                           zigPrimitiveType,
                                                                                           zigRangePattern,
                                                                                           zigReferenceExpression,
                                                                                           zigResumeBlock,
                                                                                           zigResumeExpression,
                                                                                           zigReturnExpression,
                                                                                           zigStringLiteral,
                                                                                           zigStructConstruction,
                                                                                           zigStructExpression,
                                                                                           zigSuspendBlock,
                                                                                           zigSuspendExpression,
                                                                                           zigSwitchExpression,
                                                                                           zigTestExpression,
                                                                                           zigTryExpression,
                                                                                           zigTypeIdentifier,
                                                                                           zigUnaryExpression,
                                                                                           zigUndefinedLiteral,
                                                                                           zigUnionExpression,
                                                                                           zigUnreachableExpression,
                                                                                           zigUsingnamespaceExpression,
                                                                                           zigWhileExpression
                                                                                         }
                                                                    tmp[zigStringLiteral] = {zigEscapeSequence}
                                                                    tmp[zigStructConstruction] = {zigTypeIdentifier}
                                                                    tmp[zigStructExpression] = {
                                                                                                 zigAnonymousArrayExpr,
                                                                                                 zigAnonymousStructEnum,
                                                                                                 zigArrayExpression,
                                                                                                 zigArrayType,
                                                                                                 zigAssignmentExpression,
                                                                                                 zigAssignmentStatement,
                                                                                                 zigAwaitExpression,
                                                                                                 zigBinaryExpression,
                                                                                                 zigBlock,
                                                                                                 zigBooleanLiteral,
                                                                                                 zigBreakExpression,
                                                                                                 zigBuildInCallExpr,
                                                                                                 zigCallExpression,
                                                                                                 zigCharLiteral,
                                                                                                 zigCompoundAssignmentExpr,
                                                                                                 zigComptimeBlock,
                                                                                                 zigContinueExpression,
                                                                                                 zigCustomNumberType,
                                                                                                 zigDeferBlock,
                                                                                                 zigDeferExpression,
                                                                                                 zigDereferenceExpression,
                                                                                                 zigEmptyStatement,
                                                                                                 zigEnumExpression,
                                                                                                 zigEnumLiteral,
                                                                                                 zigErrorExpression,
                                                                                                 zigErrorType,
                                                                                                 zigFieldExpression,
                                                                                                 zigFloatLiteral,
                                                                                                 zigForExpression,
                                                                                                 zigFunctionDeclaration,
                                                                                                 zigFunctionSignature,
                                                                                                 zigIdentifier,
                                                                                                 zigIfExpression,
                                                                                                 zigIndexExpression,
                                                                                                 zigIntegerLiteral,
                                                                                                 zigMultilineStringLiteral,
                                                                                                 zigNullLiteral,
                                                                                                 zigOptionalType,
                                                                                                 zigOrelsePostfixExpression,
                                                                                                 zigPayloadExpression,
                                                                                                 zigPointerType,
                                                                                                 zigPrimitiveType,
                                                                                                 zigRangePattern,
                                                                                                 zigReferenceExpression,
                                                                                                 zigResumeBlock,
                                                                                                 zigResumeExpression,
                                                                                                 zigReturnExpression,
                                                                                                 zigStringLiteral,
                                                                                                 zigStructConstruction,
                                                                                                 zigStructExpression,
                                                                                                 zigStructModifier,
                                                                                                 zigSuspendBlock,
                                                                                                 zigSuspendExpression,
                                                                                                 zigSwitchExpression,
                                                                                                 zigTestExpression,
                                                                                                 zigTryExpression,
                                                                                                 zigTypeIdentifier,
                                                                                                 zigUnaryExpression,
                                                                                                 zigUndefinedLiteral,
                                                                                                 zigUnionExpression,
                                                                                                 zigUnreachableExpression,
                                                                                                 zigUsingnamespaceExpression,
                                                                                                 zigWhileExpression
                                                                                               }
                                                                    tmp[zigSuspendBlock] = {zigBlock}
                                                                    tmp[zigSuspendExpression] = {
                                                                                                  zigAnonymousArrayExpr,
                                                                                                  zigAnonymousStructEnum,
                                                                                                  zigArrayExpression,
                                                                                                  zigArrayType,
                                                                                                  zigAssignmentExpression,
                                                                                                  zigAwaitExpression,
                                                                                                  zigBinaryExpression,
                                                                                                  zigBlock,
                                                                                                  zigBooleanLiteral,
                                                                                                  zigBreakExpression,
                                                                                                  zigBuildInCallExpr,
                                                                                                  zigCallExpression,
                                                                                                  zigCharLiteral,
                                                                                                  zigCompoundAssignmentExpr,
                                                                                                  zigComptimeBlock,
                                                                                                  zigContinueExpression,
                                                                                                  zigCustomNumberType,
                                                                                                  zigDeferBlock,
                                                                                                  zigDeferExpression,
                                                                                                  zigDereferenceExpression,
                                                                                                  zigEnumExpression,
                                                                                                  zigEnumLiteral,
                                                                                                  zigErrorExpression,
                                                                                                  zigErrorType,
                                                                                                  zigFieldExpression,
                                                                                                  zigFloatLiteral,
                                                                                                  zigForExpression,
                                                                                                  zigIdentifier,
                                                                                                  zigIfExpression,
                                                                                                  zigIndexExpression,
                                                                                                  zigIntegerLiteral,
                                                                                                  zigMultilineStringLiteral,
                                                                                                  zigNullLiteral,
                                                                                                  zigOptionalType,
                                                                                                  zigOrelsePostfixExpression,
                                                                                                  zigPayloadExpression,
                                                                                                  zigPointerType,
                                                                                                  zigPrimitiveType,
                                                                                                  zigRangePattern,
                                                                                                  zigReferenceExpression,
                                                                                                  zigResumeBlock,
                                                                                                  zigResumeExpression,
                                                                                                  zigReturnExpression,
                                                                                                  zigStringLiteral,
                                                                                                  zigStructConstruction,
                                                                                                  zigStructExpression,
                                                                                                  zigSuspendBlock,
                                                                                                  zigSuspendExpression,
                                                                                                  zigSwitchExpression,
                                                                                                  zigTestExpression,
                                                                                                  zigTryExpression,
                                                                                                  zigTypeIdentifier,
                                                                                                  zigUnaryExpression,
                                                                                                  zigUndefinedLiteral,
                                                                                                  zigUnionExpression,
                                                                                                  zigUnreachableExpression,
                                                                                                  zigUsingnamespaceExpression,
                                                                                                  zigWhileExpression
                                                                                                }
                                                                    tmp[zigSwitchBlock] = {zigSwitchArm, zigSwitchLastArm}
                                                                    tmp[zigSwitchPattern] = {zigFieldPattern, zigLiteralPattern, zigRangePattern, zigSlicePattern}
                                                                    tmp[zigTypeIdentifier] = {zigStringLiteral}
                                                                    tmp[zigTypePrefix] = {
                                                                                           zigAnonymousArrayExpr,
                                                                                           zigAnonymousStructEnum,
                                                                                           zigArrayExpression,
                                                                                           zigArrayType,
                                                                                           zigAssignmentExpression,
                                                                                           zigAwaitExpression,
                                                                                           zigBinaryExpression,
                                                                                           zigBlock,
                                                                                           zigBooleanLiteral,
                                                                                           zigBreakExpression,
                                                                                           zigBuildInCallExpr,
                                                                                           zigCallExpression,
                                                                                           zigCharLiteral,
                                                                                           zigCompoundAssignmentExpr,
                                                                                           zigComptimeBlock,
                                                                                           zigContinueExpression,
                                                                                           zigCustomNumberType,
                                                                                           zigDeferBlock,
                                                                                           zigDeferExpression,
                                                                                           zigDereferenceExpression,
                                                                                           zigEnumExpression,
                                                                                           zigEnumLiteral,
                                                                                           zigErrorExpression,
                                                                                           zigErrorType,
                                                                                           zigFieldExpression,
                                                                                           zigFloatLiteral,
                                                                                           zigForExpression,
                                                                                           zigIdentifier,
                                                                                           zigIfExpression,
                                                                                           zigIndexExpression,
                                                                                           zigIntegerLiteral,
                                                                                           zigMultilineStringLiteral,
                                                                                           zigNullLiteral,
                                                                                           zigOptionalType,
                                                                                           zigOrelsePostfixExpression,
                                                                                           zigPayloadExpression,
                                                                                           zigPointerType,
                                                                                           zigPrimitiveType,
                                                                                           zigRangePattern,
                                                                                           zigReferenceExpression,
                                                                                           zigResumeBlock,
                                                                                           zigResumeExpression,
                                                                                           zigReturnExpression,
                                                                                           zigStringLiteral,
                                                                                           zigStructConstruction,
                                                                                           zigStructExpression,
                                                                                           zigSuspendBlock,
                                                                                           zigSuspendExpression,
                                                                                           zigSwitchExpression,
                                                                                           zigTestExpression,
                                                                                           zigTryExpression,
                                                                                           zigTypeIdentifier,
                                                                                           zigUnaryExpression,
                                                                                           zigUndefinedLiteral,
                                                                                           zigUnionExpression,
                                                                                           zigUnreachableExpression,
                                                                                           zigUsingnamespaceExpression,
                                                                                           zigWhileExpression
                                                                                         }
                                                                    tmp[zigUnionExpression] = {
                                                                                                zigAnonymousArrayExpr,
                                                                                                zigAnonymousStructEnum,
                                                                                                zigArrayExpression,
                                                                                                zigArrayType,
                                                                                                zigAssignmentExpression,
                                                                                                zigAssignmentStatement,
                                                                                                zigAwaitExpression,
                                                                                                zigBinaryExpression,
                                                                                                zigBlock,
                                                                                                zigBooleanLiteral,
                                                                                                zigBreakExpression,
                                                                                                zigBuildInCallExpr,
                                                                                                zigCallExpression,
                                                                                                zigCharLiteral,
                                                                                                zigCompoundAssignmentExpr,
                                                                                                zigComptimeBlock,
                                                                                                zigContinueExpression,
                                                                                                zigCustomNumberType,
                                                                                                zigDeferBlock,
                                                                                                zigDeferExpression,
                                                                                                zigDereferenceExpression,
                                                                                                zigEmptyStatement,
                                                                                                zigEnumExpression,
                                                                                                zigEnumLiteral,
                                                                                                zigErrorExpression,
                                                                                                zigErrorType,
                                                                                                zigFieldExpression,
                                                                                                zigFloatLiteral,
                                                                                                zigForExpression,
                                                                                                zigFunctionDeclaration,
                                                                                                zigFunctionSignature,
                                                                                                zigIdentifier,
                                                                                                zigIfExpression,
                                                                                                zigIndexExpression,
                                                                                                zigIntegerLiteral,
                                                                                                zigMultilineStringLiteral,
                                                                                                zigNullLiteral,
                                                                                                zigOptionalType,
                                                                                                zigOrelsePostfixExpression,
                                                                                                zigPayloadExpression,
                                                                                                zigPointerType,
                                                                                                zigPrimitiveType,
                                                                                                zigRangePattern,
                                                                                                zigReferenceExpression,
                                                                                                zigResumeBlock,
                                                                                                zigResumeExpression,
                                                                                                zigReturnExpression,
                                                                                                zigStringLiteral,
                                                                                                zigStructConstruction,
                                                                                                zigStructExpression,
                                                                                                zigSuspendBlock,
                                                                                                zigSuspendExpression,
                                                                                                zigSwitchExpression,
                                                                                                zigTestExpression,
                                                                                                zigTryExpression,
                                                                                                zigTypeIdentifier,
                                                                                                zigUnaryExpression,
                                                                                                zigUndefinedLiteral,
                                                                                                zigUnionExpression,
                                                                                                zigUnionModifier,
                                                                                                zigUnreachableExpression,
                                                                                                zigUsingnamespaceExpression,
                                                                                                zigWhileExpression
                                                                                              }
                                                                    tmp[zigUnionIdentifier] = {zigStringLiteral}
                                                                    tmp[zigUsingnamespaceExpression] = {zigVisibilityModifier}
                                                                    tmp[zigWhileExpression] = {zigLoopLabel, zigLoopModifier, zigPayload}
                                                                    tmp
const zigTokenKinds*: set[ZigNodeKind] = {
                                           zigExclamationTok,
                                           zigQuoteTok,
                                           zigPercentEqualTok,
                                           zigAmpersandTok,
                                           zigAmpersandEqualTok,
                                           zigApostropheTok,
                                           zigLParTok,
                                           zigRParTok,
                                           zigAsteriskTok,
                                           zigAsteriskPercentEqualTok,
                                           zigAsteriskEqualTok,
                                           zigPlusPercentEqualTok,
                                           zigPlusEqualTok,
                                           zigCommaTok,
                                           zigMinusTok,
                                           zigMinusPercentTok,
                                           zigMinusPercentEqualTok,
                                           zigMinusEqualTok,
                                           zigDotTok,
                                           zigDotAsteriskTok,
                                           zigDoubleDotTok,
                                           zigTripleDotTok,
                                           zigDotQuestionTok,
                                           zigDotLCurlyTok,
                                           zigSlashEqualTok,
                                           zigColonTok,
                                           zigSemicolonTok,
                                           zigDoubleLessThanEqualTok,
                                           zigEqualTok,
                                           zigEqualGreaterThanTok,
                                           zigDoubleGreaterThanEqualTok,
                                           zigQuestionTok,
                                           zigAtQuoteTok,
                                           zigLBrackTok,
                                           zigDoubleBackslashTok,
                                           zigRBrackTok,
                                           zigAccentEqualTok,
                                           zigAlignTok,
                                           zigAllowzeroTok,
                                           zigAnyerrorTok,
                                           zigAwaitTok,
                                           zigBoolTok,
                                           zigBreakTok,
                                           zigCIntTok,
                                           zigCLongTok,
                                           zigCLongdoubleTok,
                                           zigCLonglongTok,
                                           zigCShortTok,
                                           zigCUintTok,
                                           zigCUlongTok,
                                           zigCUlonglongTok,
                                           zigCUshortTok,
                                           zigCVoidTok,
                                           zigComptimeTok,
                                           zigComptimeFloatTok,
                                           zigComptimeIntTok,
                                           zigConstTok,
                                           zigContinueTok,
                                           zigDeferTok,
                                           zigElseTok,
                                           zigEnumTok,
                                           zigErrdeferTok,
                                           zigErrorTok,
                                           zigExportTok,
                                           zigExternTok,
                                           zigF128Tok,
                                           zigF16Tok,
                                           zigF32Tok,
                                           zigF64Tok,
                                           zigFalseTok,
                                           zigFnTok,
                                           zigForTok,
                                           zigI128Tok,
                                           zigI16Tok,
                                           zigI32Tok,
                                           zigI64Tok,
                                           zigI8Tok,
                                           zigIfTok,
                                           zigInlineTok,
                                           zigIsizeTok,
                                           zigNakedccTok,
                                           zigNoreturnTok,
                                           zigNullTok,
                                           zigPromiseTok,
                                           zigPubTok,
                                           zigResumeTok,
                                           zigReturnTok,
                                           zigStdcallccTok,
                                           zigStructTok,
                                           zigSuspendTok,
                                           zigSwitchTok,
                                           zigTestTok,
                                           zigTrueTok,
                                           zigTryTok,
                                           zigTypeTok,
                                           zigU128Tok,
                                           zigU16Tok,
                                           zigU32Tok,
                                           zigU64Tok,
                                           zigU8Tok,
                                           zigUnionTok,
                                           zigUsingnamespaceTok,
                                           zigUsizeTok,
                                           zigVarTok,
                                           zigVoidTok,
                                           zigVolatileTok,
                                           zigWhileTok,
                                           zigLCurlyTok,
                                           zigPipeTok,
                                           zigPipeEqualTok,
                                           zigRCurlyTok,
                                           zigTildeTok
                                         }
const zigHiddenKinds*: set[ZigNodeKind] = {
                                            zigHidLiterals,
                                            zigHidElseTail,
                                            zigHidDefaultError,
                                            zigHidType,
                                            zigHidExpression,
                                            zigHidConditionWithContinue,
                                            zigHidDeclarationStatement,
                                            zigHidErrorOneShorthand,
                                            zigHidIdentifierText,
                                            zigHidStructStandalone,
                                            zigHidExpressionEndingWithBlock,
                                            zigHidExpressionStatement,
                                            zigHidElseCase,
                                            zigHidStatement,
                                            zigHidPattern,
                                            zigHidAny,
                                            zigHidCondition,
                                            zigHidStrIdentifier
                                          }
proc tsNodeType*(node: TsZigNode): string


proc kind*(node: TsZigNode): ZigNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "anonymous_array_expr":      zigAnonymousArrayExpr
      of "anonymous_struct_enum":     zigAnonymousStructEnum
      of "arguments":                 zigArguments
      of "array_expression":          zigArrayExpression
      of "array_type":                zigArrayType
      of "array_values":              zigArrayValues
      of "assignment_expression":     zigAssignmentExpression
      of "assignment_operator":       zigAssignmentOperator
      of "assignment_statement":      zigAssignmentStatement
      of "await_expression":          zigAwaitExpression
      of "binary_expression":         zigBinaryExpression
      of "block":                     zigBlock
      of "boolean_literal":           zigBooleanLiteral
      of "break_expression":          zigBreakExpression
      of "build_in_call_expr":        zigBuildInCallExpr
      of "call_expression":           zigCallExpression
      of "char_literal":              zigCharLiteral
      of "compound_assignment_expr":  zigCompoundAssignmentExpr
      of "comptime_block":            zigComptimeBlock
      of "continue_expression":       zigContinueExpression
      of "defer_block":               zigDeferBlock
      of "defer_expression":          zigDeferExpression
      of "dereference_expression":    zigDereferenceExpression
      of "empty_statement":           zigEmptyStatement
      of "enum_expression":           zigEnumExpression
      of "enum_identifier":           zigEnumIdentifier
      of "enum_literal":              zigEnumLiteral
      of "error_expression":          zigErrorExpression
      of "error_identifier":          zigErrorIdentifier
      of "error_type":                zigErrorType
      of "extern_modifier":           zigExternModifier
      of "field_declaration":         zigFieldDeclaration
      of "field_expression":          zigFieldExpression
      of "field_identifier":          zigFieldIdentifier
      of "field_init":                zigFieldInit
      of "field_pattern":             zigFieldPattern
      of "for_expression":            zigForExpression
      of "function_declaration":      zigFunctionDeclaration
      of "function_modifiers":        zigFunctionModifiers
      of "function_signature":        zigFunctionSignature
      of "identifier":                zigIdentifier
      of "if_expression":             zigIfExpression
      of "index_expression":          zigIndexExpression
      of "label_identifier":          zigLabelIdentifier
      of "literal_pattern":           zigLiteralPattern
      of "loop_label":                zigLoopLabel
      of "loop_label_inverse":        zigLoopLabelInverse
      of "multiline_string_literal":  zigMultilineStringLiteral
      of "null_literal":              zigNullLiteral
      of "optional_type":             zigOptionalType
      of "orelse_postfix_expression": zigOrelsePostfixExpression
      of "parameter":                 zigParameter
      of "parameters":                zigParameters
      of "payload":                   zigPayload
      of "payload_expression":        zigPayloadExpression
      of "payload_identifier":        zigPayloadIdentifier
      of "pointer_type":              zigPointerType
      of "primitive_type":            zigPrimitiveType
      of "range_pattern":             zigRangePattern
      of "reference_expression":      zigReferenceExpression
      of "resume_block":              zigResumeBlock
      of "resume_expression":         zigResumeExpression
      of "return_expression":         zigReturnExpression
      of "slice_pattern":             zigSlicePattern
      of "source_file":               zigSourceFile
      of "string_literal":            zigStringLiteral
      of "struct_construction":       zigStructConstruction
      of "struct_expression":         zigStructExpression
      of "suspend_block":             zigSuspendBlock
      of "suspend_expression":        zigSuspendExpression
      of "switch_arm":                zigSwitchArm
      of "switch_block":              zigSwitchBlock
      of "switch_expression":         zigSwitchExpression
      of "switch_last_arm":           zigSwitchLastArm
      of "switch_pattern":            zigSwitchPattern
      of "test_expression":           zigTestExpression
      of "try_expression":            zigTryExpression
      of "type_identifier":           zigTypeIdentifier
      of "type_prefix":               zigTypePrefix
      of "unary_expression":          zigUnaryExpression
      of "unary_operator":            zigUnaryOperator
      of "union_expression":          zigUnionExpression
      of "union_field_variant":       zigUnionFieldVariant
      of "union_identifier":          zigUnionIdentifier
      of "usingnamespace_expression": zigUsingnamespaceExpression
      of "variadic_parameter":        zigVariadicParameter
      of "variant_declaration":       zigVariantDeclaration
      of "visibility_modifier":       zigVisibilityModifier
      of "while_expression":          zigWhileExpression
      of "!":                         zigExclamationTok
      of "\"":                        zigQuoteTok
      of "%=":                        zigPercentEqualTok
      of "&":                         zigAmpersandTok
      of "&=":                        zigAmpersandEqualTok
      of "\'":                        zigApostropheTok
      of "(":                         zigLParTok
      of ")":                         zigRParTok
      of "*":                         zigAsteriskTok
      of "*%=":                       zigAsteriskPercentEqualTok
      of "*=":                        zigAsteriskEqualTok
      of "+%=":                       zigPlusPercentEqualTok
      of "+=":                        zigPlusEqualTok
      of ",":                         zigCommaTok
      of "-":                         zigMinusTok
      of "-%":                        zigMinusPercentTok
      of "-%=":                       zigMinusPercentEqualTok
      of "-=":                        zigMinusEqualTok
      of ".":                         zigDotTok
      of ".*":                        zigDotAsteriskTok
      of "..":                        zigDoubleDotTok
      of "...":                       zigTripleDotTok
      of ".?":                        zigDotQuestionTok
      of ".{":                        zigDotLCurlyTok
      of "/=":                        zigSlashEqualTok
      of ":":                         zigColonTok
      of ";":                         zigSemicolonTok
      of "<<=":                       zigDoubleLessThanEqualTok
      of "=":                         zigEqualTok
      of "=>":                        zigEqualGreaterThanTok
      of ">>=":                       zigDoubleGreaterThanEqualTok
      of "?":                         zigQuestionTok
      of "@\"":                       zigAtQuoteTok
      of "[":                         zigLBrackTok
      of "\\\\":                      zigDoubleBackslashTok
      of "]":                         zigRBrackTok
      of "^=":                        zigAccentEqualTok
      of "align":                     zigAlignTok
      of "allowzero":                 zigAllowzeroTok
      of "anyerror":                  zigAnyerrorTok
      of "assignment_modifier":       zigAssignmentModifier
      of "await":                     zigAwaitTok
      of "binary_operator":           zigBinaryOperator
      of "bool":                      zigBoolTok
      of "break":                     zigBreakTok
      of "c_int":                     zigCIntTok
      of "c_long":                    zigCLongTok
      of "c_longdouble":              zigCLongdoubleTok
      of "c_longlong":                zigCLonglongTok
      of "c_short":                   zigCShortTok
      of "c_uint":                    zigCUintTok
      of "c_ulong":                   zigCUlongTok
      of "c_ulonglong":               zigCUlonglongTok
      of "c_ushort":                  zigCUshortTok
      of "c_void":                    zigCVoidTok
      of "call_modifier":             zigCallModifier
      of "comptime":                  zigComptimeTok
      of "comptime_float":            zigComptimeFloatTok
      of "comptime_int":              zigComptimeIntTok
      of "const":                     zigConstTok
      of "continue":                  zigContinueTok
      of "custom_number_type":        zigCustomNumberType
      of "defer":                     zigDeferTok
      of "doc_comment":               zigDocComment
      of "else":                      zigElseTok
      of "else_switch":               zigElseSwitch
      of "enum":                      zigEnumTok
      of "enum_modifier":             zigEnumModifier
      of "errdefer":                  zigErrdeferTok
      of "error":                     zigErrorTok
      of "escape_sequence":           zigEscapeSequence
      of "export":                    zigExportTok
      of "extern":                    zigExternTok
      of "f128":                      zigF128Tok
      of "f16":                       zigF16Tok
      of "f32":                       zigF32Tok
      of "f64":                       zigF64Tok
      of "false":                     zigFalseTok
      of "float_literal":             zigFloatLiteral
      of "fn":                        zigFnTok
      of "for":                       zigForTok
      of "i128":                      zigI128Tok
      of "i16":                       zigI16Tok
      of "i32":                       zigI32Tok
      of "i64":                       zigI64Tok
      of "i8":                        zigI8Tok
      of "if":                        zigIfTok
      of "inference_type":            zigInferenceType
      of "inline":                    zigInlineTok
      of "integer_literal":           zigIntegerLiteral
      of "isize":                     zigIsizeTok
      of "line_comment":              zigLineComment
      of "loop_modifier":             zigLoopModifier
      of "nakedcc":                   zigNakedccTok
      of "noreturn":                  zigNoreturnTok
      of "null":                      zigNullTok
      of "pointer":                   zigPointer
      of "promise":                   zigPromiseTok
      of "pub":                       zigPubTok
      of "resume":                    zigResumeTok
      of "return":                    zigReturnTok
      of "stdcallcc":                 zigStdcallccTok
      of "struct":                    zigStructTok
      of "struct_modifier":           zigStructModifier
      of "suspend":                   zigSuspendTok
      of "switch":                    zigSwitchTok
      of "test":                      zigTestTok
      of "true":                      zigTrueTok
      of "try":                       zigTryTok
      of "type":                      zigTypeTok
      of "u128":                      zigU128Tok
      of "u16":                       zigU16Tok
      of "u32":                       zigU32Tok
      of "u64":                       zigU64Tok
      of "u8":                        zigU8Tok
      of "undefined_literal":         zigUndefinedLiteral
      of "union":                     zigUnionTok
      of "union_modifier":            zigUnionModifier
      of "unreachable_expression":    zigUnreachableExpression
      of "usingnamespace":            zigUsingnamespaceTok
      of "usize":                     zigUsizeTok
      of "var":                       zigVarTok
      of "void":                      zigVoidTok
      of "volatile":                  zigVolatileTok
      of "while":                     zigWhileTok
      of "{":                         zigLCurlyTok
      of "|":                         zigPipeTok
      of "|=":                        zigPipeEqualTok
      of "}":                         zigRCurlyTok
      of "~":                         zigTildeTok
      of "ERROR":                     zigSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsZigNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsZigNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsZigNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_zig(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsZigNode): string =
  $ts_node_type(TSNode(node))

proc newTsZigParser*(): ZigParser =
  result = ZigParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_zig())

proc parseString*(parser: ZigParser, str: string): TsZigNode =
  TsZigNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsZigString*(str: string): TsZigNode =
  let parser = newTsZigParser()
  return parseString(parser, str)

func `$`*(node: TsZigNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsZigNode, str: string): string =
  var res = addr result
  proc aux(node: TsZigNode, level: int) =
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
let zigGrammar*: array[ZigNodeKind, HtsRule[ZigNodeKind]] = block:
                                                              var rules: array[ZigNodeKind, HtsRule[ZigNodeKind]]
                                                              type
                                                                K = ZigNodeKind


                                                              rules[zigLoopLabelInverse] = tsSeq[K](tsString[K](":"), tsSymbol[K](zigIdentifier))
                                                              rules[zigTestExpression] = tsSeq[K](tsString[K]("test"), tsSymbol[K](zigStringLiteral), tsSymbol[K](zigBlock))
                                                              rules[zigHidLiterals] = tsChoice[K](tsSymbol[K](zigIntegerLiteral), tsSymbol[K](zigFloatLiteral), tsSymbol[K](zigBooleanLiteral), tsSymbol[K](zigNullLiteral), tsSymbol[K](zigUndefinedLiteral), tsSymbol[K](zigCharLiteral), tsSymbol[K](zigStringLiteral), tsSymbol[K](zigMultilineStringLiteral), tsSymbol[K](zigEnumLiteral))
                                                              rules[zigTryExpression] = tsSeq[K](tsString[K]("try"), tsSymbol[K](zigHidExpression))
                                                              rules[zigEnumExpression] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("packed"), tsString[K]("extern")), tsBlank[K]()), tsString[K]("enum"), tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](zigHidType), tsString[K](")")), tsBlank[K]()), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigVariantDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigVariantDeclaration))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRepeat[K](tsSymbol[K](zigHidStatement)), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigAssignmentOperator] = tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("+%="), tsString[K]("-%="), tsString[K]("*%="), tsString[K]("%="), tsString[K]("&="), tsString[K]("|="), tsString[K]("^="), tsString[K]("<<="), tsString[K](">>="))
                                                              rules[zigHidDefaultError] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigIdentifier))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigExternModifier] = tsSeq[K](tsString[K]("extern"), tsChoice[K](tsSymbol[K](zigStringLiteral), tsBlank[K]()))
                                                              rules[zigLoopLabel] = tsSeq[K](tsSymbol[K](zigIdentifier), tsString[K](":"))
                                                              rules[zigCharLiteral] = tsSeq[K](tsString[K]("\'"), tsChoice[K](tsChoice[K](tsSymbol[K](zigEscapeSequence), tsRegex[K](".")), tsBlank[K]()), tsString[K]("\'"))
                                                              rules[zigHidExpression] = tsChoice[K](tsSymbol[K](zigBuildInCallExpr), tsSymbol[K](zigCallExpression), tsSymbol[K](zigAwaitExpression), tsSymbol[K](zigSuspendExpression), tsSymbol[K](zigResumeExpression), tsSymbol[K](zigIndexExpression), tsSymbol[K](zigFieldExpression), tsSymbol[K](zigHidExpressionEndingWithBlock), tsSymbol[K](zigStructExpression), tsSymbol[K](zigStructConstruction), tsSymbol[K](zigAnonymousStructEnum), tsSymbol[K](zigEnumExpression), tsSymbol[K](zigUnionExpression), tsSymbol[K](zigErrorExpression), tsSymbol[K](zigSwitchExpression), tsSymbol[K](zigContinueExpression), tsSymbol[K](zigBreakExpression), tsSymbol[K](zigReturnExpression), tsSymbol[K](zigAssignmentExpression), tsSymbol[K](zigArrayExpression), tsSymbol[K](zigAnonymousArrayExpr), tsSymbol[K](zigCompoundAssignmentExpr), tsSymbol[K](zigPayloadExpression), tsSymbol[K](zigUnaryExpression), tsSymbol[K](zigBinaryExpression), tsSymbol[K](zigReferenceExpression), tsSymbol[K](zigDereferenceExpression), tsSymbol[K](zigOrelsePostfixExpression), tsSymbol[K](zigTryExpression), tsSymbol[K](zigRangePattern), tsSymbol[K](zigUnreachableExpression), tsSymbol[K](zigUsingnamespaceExpression), tsSymbol[K](zigDeferExpression), tsSymbol[K](zigHidType), tsSymbol[K](zigHidLiterals), tsSymbol[K](zigIdentifier))
                                                              rules[zigHidConditionWithContinue] = tsSeq[K](tsString[K]("("), tsSymbol[K](zigHidExpression), tsString[K](")"), tsString[K](":"), tsString[K]("("), tsChoice[K](tsSymbol[K](zigHidExpression), tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](zigHidExpression), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](zigHidExpression))), tsChoice[K](tsString[K](";"), tsBlank[K]())), tsString[K]("}"))), tsString[K](")"))
                                                              rules[zigStructExpression] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("packed"), tsString[K]("extern")), tsBlank[K]()), tsSymbol[K](zigHidStructStandalone))
                                                              rules[zigBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                              rules[zigCompoundAssignmentExpr] = tsSeq[K](tsSymbol[K](zigHidExpression), tsSymbol[K](zigAssignmentOperator), tsSymbol[K](zigHidExpression))
                                                              rules[zigHidDeclarationStatement] = tsChoice[K](tsSymbol[K](zigEmptyStatement), tsSymbol[K](zigAssignmentStatement), tsSymbol[K](zigFunctionSignature), tsSymbol[K](zigFunctionDeclaration))
                                                              rules[zigUnreachableExpression] = tsString[K]("unreachable")
                                                              rules[zigUndefinedLiteral] = tsString[K]("undefined")
                                                              rules[zigSuspendExpression] = tsSeq[K](tsString[K]("suspend"), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()))
                                                              rules[zigIfExpression] = tsSeq[K](tsString[K]("if"), tsSymbol[K](zigHidCondition), tsChoice[K](tsSymbol[K](zigHidExpression), tsSymbol[K](zigBlock)), tsChoice[K](tsSymbol[K](zigHidElseTail), tsBlank[K]()))
                                                              rules[zigDeferExpression] = tsSeq[K](tsChoice[K](tsString[K]("defer"), tsString[K]("errdefer")), tsSymbol[K](zigHidExpression))
                                                              rules[zigArrayValues] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigHidExpression))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigForExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](zigLoopLabel), tsBlank[K]()), tsChoice[K](tsString[K]("inline"), tsBlank[K]()), tsString[K]("for"), tsSymbol[K](zigHidCondition), tsSymbol[K](zigBlock), tsChoice[K](tsSymbol[K](zigHidElseTail), tsBlank[K]()))
                                                              rules[zigSwitchLastArm] = tsSeq[K](tsChoice[K](tsString[K]("else"), tsSymbol[K](zigSwitchPattern)), tsString[K]("=>"), tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K](","), tsBlank[K]()))
                                                              rules[zigSwitchPattern] = tsChoice[K](tsSymbol[K](zigHidPattern), tsSeq[K](tsSymbol[K](zigHidPattern), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigHidPattern))), tsChoice[K](tsString[K](","), tsBlank[K]())))
                                                              rules[zigFunctionSignature] = tsSeq[K](tsChoice[K](tsSymbol[K](zigVisibilityModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](zigFunctionModifiers), tsBlank[K]()), tsString[K]("fn"), tsSymbol[K](zigIdentifier), tsSymbol[K](zigParameters), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()), tsString[K](";"))
                                                              rules[zigBlock] = tsSeq[K](tsChoice[K](tsSymbol[K](zigLoopLabel), tsBlank[K]()), tsString[K]("{"), tsChoice[K](tsRepeat[K](tsSymbol[K](zigHidStatement)), tsBlank[K]()), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigAwaitExpression] = tsSeq[K](tsString[K]("await"), tsSymbol[K](zigHidExpression))
                                                              rules[zigFieldInit] = tsSeq[K](tsString[K]("."), tsSymbol[K](zigIdentifier), tsString[K]("="), tsSymbol[K](zigHidExpression))
                                                              rules[zigBuildInCallExpr] = tsSeq[K](tsRegex[K]("@[a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5_][a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5\\d_]*"), tsSymbol[K](zigArguments))
                                                              rules[zigHidErrorOneShorthand] = tsSeq[K](tsString[K]("."), tsSymbol[K](zigIdentifier))
                                                              rules[zigContinueExpression] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](zigLoopLabelInverse), tsBlank[K]()))
                                                              rules[zigCustomNumberType] = tsRegex[K]("(i|u)[0-9]+")
                                                              rules[zigHidIdentifierText] = tsRegex[K]("[a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5_][a-zA-Z\xCE\xB1-\xCF\x89\xCE\x91-\xCE\xA9\xC2\xB5\\d_]*")
                                                              rules[zigHidExpressionEndingWithBlock] = tsChoice[K](tsSymbol[K](zigBlock), tsSymbol[K](zigComptimeBlock), tsSymbol[K](zigDeferBlock), tsSymbol[K](zigSuspendBlock), tsSymbol[K](zigResumeBlock), tsSymbol[K](zigIfExpression), tsSymbol[K](zigWhileExpression), tsSymbol[K](zigForExpression), tsSymbol[K](zigTestExpression))
                                                              rules[zigHidExpressionStatement] = tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K](";")), tsSymbol[K](zigHidExpressionEndingWithBlock))
                                                              rules[zigUnaryExpression] = tsSeq[K](tsSymbol[K](zigUnaryOperator), tsSymbol[K](zigHidExpression))
                                                              rules[zigOrelsePostfixExpression] = tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K](".?"))
                                                              rules[zigSourceFile] = tsRepeat[K](tsSymbol[K](zigHidStatement))
                                                              rules[zigFieldExpression] = tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("."), tsChoice[K](tsSymbol[K](zigIdentifier), tsSymbol[K](zigHidExpression)))
                                                              rules[zigArrayType] = tsSeq[K](tsRepeat[K](tsSeq[K](tsString[K]("["), tsChoice[K](tsChoice[K](tsSymbol[K](zigIntegerLiteral), tsSymbol[K](zigIdentifier), tsSeq[K](tsString[K]("*"), tsChoice[K](tsString[K]("c"), tsBlank[K]()))), tsBlank[K]()), tsString[K]("]"))), tsChoice[K](tsRepeat[K](tsSymbol[K](zigTypePrefix)), tsBlank[K]()), tsChoice[K](tsSymbol[K](zigPrimitiveType), tsSymbol[K](zigOptionalType), tsSymbol[K](zigPointerType), tsSymbol[K](zigErrorType), tsSymbol[K](zigCustomNumberType), tsSymbol[K](zigIdentifier)))
                                                              rules[zigVisibilityModifier] = tsChoice[K](tsString[K]("pub"))
                                                              rules[zigVariadicParameter] = tsString[K]("...")
                                                              rules[zigHidStatement] = tsChoice[K](tsSymbol[K](zigHidExpressionStatement), tsSymbol[K](zigHidDeclarationStatement))
                                                              rules[zigResumeExpression] = tsSeq[K](tsString[K]("resume"), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()))
                                                              rules[zigAnonymousArrayExpr] = tsSeq[K](tsString[K](".{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigHidExpression))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigHidExpression))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                              rules[zigIdentifier] = tsChoice[K](tsSymbol[K](zigHidStrIdentifier), tsSymbol[K](zigHidIdentifierText))
                                                              rules[zigHidPattern] = tsChoice[K](tsSymbol[K](zigSlicePattern), tsSymbol[K](zigRangePattern), tsSymbol[K](zigFieldExpression), tsSymbol[K](zigHidLiterals))
                                                              rules[zigPayload] = tsSeq[K](tsString[K]("|"), tsChoice[K](tsString[K]("*"), tsBlank[K]()), tsSeq[K](tsSymbol[K](zigIdentifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigIdentifier))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("|"))
                                                              rules[zigUnionFieldVariant] = tsSeq[K](tsSymbol[K](zigIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsChoice[K](tsSymbol[K](zigHidType), tsString[K]("var"))), tsBlank[K]()))
                                                              rules[zigHidCondition] = tsSeq[K](tsString[K]("("), tsSymbol[K](zigHidExpression), tsString[K](")"), tsChoice[K](tsSymbol[K](zigPayload), tsBlank[K]()))
                                                              rules[zigPointerType] = tsSeq[K](tsString[K]("*"), tsChoice[K](tsRepeat[K](tsSymbol[K](zigTypePrefix)), tsBlank[K]()), tsSymbol[K](zigHidType))
                                                              rules[zigFieldDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](zigVisibilityModifier), tsBlank[K]()), tsSymbol[K](zigIdentifier), tsString[K](":"), tsChoice[K](tsSymbol[K](zigHidType), tsString[K]("var")), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](zigHidExpression)), tsBlank[K]()))
                                                              rules[zigWhileExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](zigLoopLabel), tsBlank[K]()), tsChoice[K](tsString[K]("inline"), tsBlank[K]()), tsString[K]("while"), tsChoice[K](tsSymbol[K](zigHidCondition), tsSymbol[K](zigHidConditionWithContinue)), tsSymbol[K](zigBlock), tsChoice[K](tsSymbol[K](zigHidElseTail), tsBlank[K]()))
                                                              rules[zigHidStrIdentifier] = tsSeq[K](tsString[K]("@\""), tsRepeat[K](tsChoice[K](tsSymbol[K](zigEscapeSequence), tsRegex[K]("[^\"\\\\]+"))), tsString[K]("\""))
                                                              rules[zigTypePrefix] = tsChoice[K](tsString[K]("null"), tsString[K]("const"), tsString[K]("volatile"), tsString[K]("allowzero"), tsSeq[K](tsString[K]("align"), tsString[K]("("), tsSymbol[K](zigHidExpression), tsString[K](")")), tsSeq[K](tsString[K]("promise"), tsString[K]("-")))
                                                              rules[zigFunctionDeclaration] = tsSeq[K](tsChoice[K](tsSymbol[K](zigVisibilityModifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](zigFunctionModifiers), tsBlank[K]()), tsString[K]("fn"), tsSymbol[K](zigIdentifier), tsSymbol[K](zigParameters), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()), tsSymbol[K](zigBlock))
                                                              rules[zigParameter] = tsSeq[K](tsChoice[K](tsString[K]("comptime"), tsBlank[K]()), tsSymbol[K](zigIdentifier), tsString[K](":"), tsChoice[K](tsSymbol[K](zigHidType), tsString[K]("var"), tsSymbol[K](zigVariadicParameter)))
                                                              rules[zigHidElseTail] = tsSeq[K](tsString[K]("else"), tsSymbol[K](zigHidElseCase))
                                                              rules[zigFunctionModifiers] = tsChoice[K](tsString[K]("export"), tsString[K]("stdcallcc"), tsString[K]("nakedcc"), tsString[K]("inline"), tsSymbol[K](zigExternModifier))
                                                              rules[zigIndexExpression] = tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("["), tsChoice[K](tsSymbol[K](zigHidExpression), tsSymbol[K](zigSlicePattern)), tsString[K]("]"))
                                                              rules[zigDereferenceExpression] = tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K](".*"))
                                                              rules[zigHidType] = tsChoice[K](tsSymbol[K](zigPrimitiveType), tsSymbol[K](zigOptionalType), tsSymbol[K](zigPointerType), tsSymbol[K](zigErrorType), tsSymbol[K](zigArrayType), tsSymbol[K](zigCustomNumberType), tsSymbol[K](zigHidStructStandalone), tsSymbol[K](zigIdentifier))
                                                              rules[zigArrayExpression] = tsSeq[K](tsRepeat[K](tsSeq[K](tsString[K]("["), tsChoice[K](tsSymbol[K](zigIntegerLiteral), tsSymbol[K](zigIdentifier)), tsString[K]("]"))), tsSymbol[K](zigHidType), tsSymbol[K](zigArrayValues))
                                                              rules[zigNullLiteral] = tsString[K]("null")
                                                              rules[zigSwitchBlock] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsRepeat[K](tsSymbol[K](zigSwitchArm)), tsSymbol[K](zigSwitchLastArm)), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigCallExpression] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsSymbol[K](zigIdentifier), tsSymbol[K](zigArguments))
                                                              rules[zigUnionExpression] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("packed"), tsString[K]("extern")), tsBlank[K]()), tsString[K]("union"), tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](zigHidType), tsString[K]("enum")), tsString[K](")")), tsBlank[K]()), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigUnionFieldVariant), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigUnionFieldVariant))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRepeat[K](tsSymbol[K](zigHidStatement)), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigOptionalType] = tsSeq[K](tsString[K]("?"), tsSymbol[K](zigHidType))
                                                              rules[zigErrorExpression] = tsSeq[K](tsString[K]("error"), tsChoice[K](tsSymbol[K](zigHidErrorOneShorthand), tsSymbol[K](zigHidDefaultError)))
                                                              rules[zigStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsSymbol[K](zigEscapeSequence), tsRegex[K]("[^\"\\\\]+"))), tsString[K]("\""))
                                                              rules[zigErrorType] = tsSeq[K](tsSymbol[K](zigHidType), tsString[K]("!"), tsSymbol[K](zigHidType))
                                                              rules[zigVariantDeclaration] = tsSeq[K](tsSymbol[K](zigIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](zigHidExpression)), tsBlank[K]()))
                                                              rules[zigBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("and"), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("or"), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("&"), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("|"), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("^"), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K]("=="), tsString[K]("!="), tsString[K]("<"), tsString[K]("<="), tsString[K](">"), tsString[K](">=")), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K]("<<"), tsString[K](">>")), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K]("+"), tsString[K]("-"), tsString[K]("++"), tsString[K]("+%"), tsString[K]("-%")), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("**"), tsString[K]("*%"), tsString[K]("||")), tsSymbol[K](zigHidExpression)), tsSeq[K](tsSymbol[K](zigHidExpression), tsChoice[K](tsString[K]("orelse"), tsString[K]("catch")), tsSymbol[K](zigHidExpression)))
                                                              rules[zigAnonymousStructEnum] = tsSeq[K](tsString[K](".{"), tsSeq[K](tsSymbol[K](zigFieldInit), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigFieldInit))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsString[K]("}"))
                                                              rules[zigPrimitiveType] = tsChoice[K](tsString[K]("i8"), tsString[K]("u8"), tsString[K]("i16"), tsString[K]("u16"), tsString[K]("i32"), tsString[K]("u32"), tsString[K]("i64"), tsString[K]("u64"), tsString[K]("i128"), tsString[K]("u128"), tsString[K]("isize"), tsString[K]("usize"), tsString[K]("c_short"), tsString[K]("c_ushort"), tsString[K]("c_int"), tsString[K]("c_uint"), tsString[K]("c_long"), tsString[K]("c_ulong"), tsString[K]("c_longlong"), tsString[K]("c_ulonglong"), tsString[K]("c_longdouble"), tsString[K]("c_void"), tsString[K]("f16"), tsString[K]("f32"), tsString[K]("f64"), tsString[K]("f128"), tsString[K]("comptime_int"), tsString[K]("comptime_float"), tsString[K]("bool"), tsString[K]("void"), tsString[K]("noreturn"), tsString[K]("type"), tsString[K]("anyerror"))
                                                              rules[zigHidStructStandalone] = tsSeq[K](tsString[K]("struct"), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigFieldDeclaration), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigFieldDeclaration))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsChoice[K](tsRepeat[K](tsSymbol[K](zigHidStatement)), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigIntegerLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[0-9]+"), tsRegex[K]("0x[0-9a-fA-F]+"), tsRegex[K]("0b[01]+"), tsRegex[K]("0o[0-7]+")))
                                                              rules[zigUsingnamespaceExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](zigVisibilityModifier), tsBlank[K]()), tsString[K]("usingnamespace"), tsSymbol[K](zigHidExpression))
                                                              rules[zigFloatLiteral] = tsSeq[K](tsChoice[K](tsSeq[K](tsRegex[K]("0[xX]"), tsRegex[K]("[0-9a-fA-F][0-9a-fA-F_]*"), tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9a-fA-F][0-9a-fA-F_]*"), tsBlank[K]())), tsSeq[K](tsRegex[K]("[0-9][0-9_]*"), tsChoice[K](tsString[K]("."), tsBlank[K]()), tsChoice[K](tsRegex[K]("[0-9][0-9_]*"), tsBlank[K]()))), tsChoice[K](tsRegex[K]("[eEpP][+-]?\\d+"), tsBlank[K]()))
                                                              rules[zigEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu\\n]"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}"), tsRegex[K]("x[0-9a-fA-F]{2}")))
                                                              rules[zigStructConstruction] = tsSeq[K](tsSymbol[K](zigIdentifier), tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](zigFieldInit), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigFieldInit))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K]("}"))
                                                              rules[zigSwitchArm] = tsSeq[K](tsSymbol[K](zigSwitchPattern), tsString[K]("=>"), tsChoice[K](tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K](",")), tsSymbol[K](zigHidExpressionEndingWithBlock)))
                                                              rules[zigBreakExpression] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](zigLoopLabelInverse), tsBlank[K]()), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()))
                                                              rules[zigLineComment] = tsSeq[K](tsString[K]("//"), tsRegex[K](".*"))
                                                              rules[zigResumeBlock] = tsSeq[K](tsString[K]("resume"), tsSymbol[K](zigBlock))
                                                              rules[zigHidElseCase] = tsChoice[K](tsSymbol[K](zigHidExpression), tsSymbol[K](zigBlock), tsSymbol[K](zigIfExpression), tsSymbol[K](zigPayloadExpression))
                                                              rules[zigDocComment] = tsSeq[K](tsString[K]("///"), tsRegex[K](".*"))
                                                              rules[zigDeferBlock] = tsSeq[K](tsChoice[K](tsString[K]("defer"), tsString[K]("errdefer")), tsSymbol[K](zigBlock))
                                                              rules[zigSuspendBlock] = tsSeq[K](tsString[K]("suspend"), tsSymbol[K](zigBlock))
                                                              rules[zigSlicePattern] = tsSeq[K](tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()), tsString[K](".."), tsChoice[K](tsSymbol[K](zigHidExpression), tsBlank[K]()))
                                                              rules[zigUnaryOperator] = tsChoice[K](tsString[K]("~"), tsString[K]("!"), tsString[K]("-"), tsString[K]("-%"))
                                                              rules[zigAssignmentStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](zigVisibilityModifier), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("threadlocal"), tsString[K]("comptime")), tsBlank[K]()), tsChoice[K](tsString[K]("const"), tsString[K]("var")), tsSymbol[K](zigIdentifier), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](zigHidType)), tsBlank[K]()), tsString[K]("="), tsSymbol[K](zigHidExpression), tsString[K](";"))
                                                              rules[zigParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](zigParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](zigParameter))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                                                              rules[zigRangePattern] = tsSeq[K](tsSymbol[K](zigHidExpression), tsString[K]("..."), tsSymbol[K](zigHidExpression))
                                                              rules[zigMultilineStringLiteral] = tsRepeat1[K](tsSeq[K](tsString[K]("\\\\"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\r\\n]"), tsSymbol[K](zigEscapeSequence)))))
                                                              rules[zigReferenceExpression] = tsSeq[K](tsString[K]("&"), tsSymbol[K](zigHidExpression))
                                                              rules[zigHidAny] = tsChoice[K](tsSymbol[K](zigHidStatement), tsSymbol[K](zigHidExpression))
                                                              rules[zigComptimeBlock] = tsSeq[K](tsString[K]("comptime"), tsSymbol[K](zigBlock))
                                                              rules[zigEmptyStatement] = tsString[K](";")
                                                              rules[zigPayloadExpression] = tsSeq[K](tsSymbol[K](zigPayload), tsChoice[K](tsSymbol[K](zigHidExpression), tsSymbol[K](zigBlock)))
                                                              rules[zigAssignmentExpression] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("defer"), tsString[K]("errdefer")), tsBlank[K]()), tsSymbol[K](zigHidExpression), tsString[K]("="), tsSymbol[K](zigHidExpression))
                                                              rules[zigEnumLiteral] = tsSeq[K](tsString[K]("."), tsSymbol[K](zigIdentifier))
                                                              rules[zigReturnExpression] = tsChoice[K](tsSeq[K](tsString[K]("return"), tsSymbol[K](zigHidExpression)), tsString[K]("return"))
                                                              rules[zigSwitchExpression] = tsSeq[K](tsString[K]("switch"), tsString[K]("("), tsSymbol[K](zigHidExpression), tsString[K](")"), tsSymbol[K](zigSwitchBlock))
                                                              rules

