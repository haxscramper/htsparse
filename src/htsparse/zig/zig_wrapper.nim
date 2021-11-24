import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  ZigNodeKind* = enum
    zigAnonymousArrayExpr        ## anonymous_array_expr
    zigAnonymousStructEnum       ## anonymous_struct_enum
    zigArguments                 ## arguments
    zigArrayExpression           ## array_expression
    zigArrayType                 ## array_type
    zigArrayValues               ## array_values
    zigAssignmentExpression      ## assignment_expression
    zigAssignmentOperator        ## assignment_operator
    zigAssignmentStatement       ## assignment_statement
    zigAwaitExpression           ## await_expression
    zigBinaryExpression          ## binary_expression
    zigBlock                     ## block
    zigBooleanLiteral            ## boolean_literal
    zigBreakExpression           ## break_expression
    zigBuildInCallExpr           ## build_in_call_expr
    zigCallExpression            ## call_expression
    zigCharLiteral               ## char_literal
    zigCompoundAssignmentExpr    ## compound_assignment_expr
    zigComptimeBlock             ## comptime_block
    zigContinueExpression        ## continue_expression
    zigDeferBlock                ## defer_block
    zigDeferExpression           ## defer_expression
    zigDereferenceExpression     ## dereference_expression
    zigEmptyStatement            ## empty_statement
    zigEnumExpression            ## enum_expression
    zigEnumIdentifier            ## enum_identifier
    zigEnumLiteral               ## enum_literal
    zigErrorExpression           ## error_expression
    zigErrorIdentifier           ## error_identifier
    zigErrorType                 ## error_type
    zigExternModifier            ## extern_modifier
    zigFieldDeclaration          ## field_declaration
    zigFieldExpression           ## field_expression
    zigFieldIdentifier           ## field_identifier
    zigFieldInit                 ## field_init
    zigFieldPattern              ## field_pattern
    zigForExpression             ## for_expression
    zigFunctionDeclaration       ## function_declaration
    zigFunctionModifiers         ## function_modifiers
    zigFunctionSignature         ## function_signature
    zigIdentifier                ## identifier
    zigIfExpression              ## if_expression
    zigIndexExpression           ## index_expression
    zigLabelIdentifier           ## label_identifier
    zigLiteralPattern            ## literal_pattern
    zigLoopLabel                 ## loop_label
    zigLoopLabelInverse          ## loop_label_inverse
    zigMultilineStringLiteral    ## multiline_string_literal
    zigNullLiteral               ## null_literal
    zigOptionalType              ## optional_type
    zigOrelsePostfixExpression   ## orelse_postfix_expression
    zigParameter                 ## parameter
    zigParameters                ## parameters
    zigPayload                   ## payload
    zigPayloadExpression         ## payload_expression
    zigPayloadIdentifier         ## payload_identifier
    zigPointerType               ## pointer_type
    zigPrimitiveType             ## primitive_type
    zigRangePattern              ## range_pattern
    zigReferenceExpression       ## reference_expression
    zigResumeBlock               ## resume_block
    zigResumeExpression          ## resume_expression
    zigReturnExpression          ## return_expression
    zigSlicePattern              ## slice_pattern
    zigSourceFile                ## source_file
    zigStringLiteral             ## string_literal
    zigStructConstruction        ## struct_construction
    zigStructExpression          ## struct_expression
    zigSuspendBlock              ## suspend_block
    zigSuspendExpression         ## suspend_expression
    zigSwitchArm                 ## switch_arm
    zigSwitchBlock               ## switch_block
    zigSwitchExpression          ## switch_expression
    zigSwitchLastArm             ## switch_last_arm
    zigSwitchPattern             ## switch_pattern
    zigTestExpression            ## test_expression
    zigTryExpression             ## try_expression
    zigTypeIdentifier            ## type_identifier
    zigTypePrefix                ## type_prefix
    zigUnaryExpression           ## unary_expression
    zigUnaryOperator             ## unary_operator
    zigUnionExpression           ## union_expression
    zigUnionFieldVariant         ## union_field_variant
    zigUnionIdentifier           ## union_identifier
    zigUsingnamespaceExpression  ## usingnamespace_expression
    zigVariadicParameter         ## variadic_parameter
    zigVariantDeclaration        ## variant_declaration
    zigVisibilityModifier        ## visibility_modifier
    zigWhileExpression           ## while_expression
    zigExclamationTok            ## !
    zigQuoteTok                  ## "
    zigPercentEqualTok           ## %=
    zigAmpersandTok              ## &
    zigAmpersandEqualTok         ## &=
    zigApostropheTok             ## '
    zigLParTok                   ## (
    zigRParTok                   ## )
    zigAsteriskTok               ## *
    zigAsteriskPercentEqualTok   ## *%=
    zigAsteriskEqualTok          ## *=
    zigPlusPercentEqualTok       ## +%=
    zigPlusEqualTok              ## +=
    zigCommaTok                  ## ,
    zigMinusTok                  ## -
    zigMinusPercentTok           ## -%
    zigMinusPercentEqualTok      ## -%=
    zigMinusEqualTok             ## -=
    zigDotTok                    ## .
    zigDotAsteriskTok            ## .*
    zigDoubleDotTok              ## ..
    zigTripleDotTok              ## ...
    zigDotQuestionTok            ## .?
    zigDotLCurlyTok              ## .{
    zigSlashEqualTok             ## /=
    zigColonTok                  ## :
    zigSemicolonTok              ## ;
    zigDoubleLessThanEqualTok    ## <<=
    zigEqualTok                  ## =
    zigEqualGreaterThanTok       ## =>
    zigDoubleGreaterThanEqualTok ## >>=
    zigQuestionTok               ## ?
    zigAtQuoteTok                ## @"
    zigLBrackTok                 ## [
    zigDoubleBackslashTok        ## \\
    zigRBrackTok                 ## ]
    zigAccentEqualTok            ## ^=
    zigAlignTok                  ## align
    zigAllowzeroTok              ## allowzero
    zigAnyerrorTok               ## anyerror
    zigAssignmentModifier        ## assignment_modifier
    zigAwaitTok                  ## await
    zigBinaryOperator            ## binary_operator
    zigBoolTok                   ## bool
    zigBreakTok                  ## break
    zigCIntTok                   ## c_int
    zigCLongTok                  ## c_long
    zigCLongdoubleTok            ## c_longdouble
    zigCLonglongTok              ## c_longlong
    zigCShortTok                 ## c_short
    zigCUintTok                  ## c_uint
    zigCUlongTok                 ## c_ulong
    zigCUlonglongTok             ## c_ulonglong
    zigCUshortTok                ## c_ushort
    zigCVoidTok                  ## c_void
    zigCallModifier              ## call_modifier
    zigComptimeTok               ## comptime
    zigComptimeFloatTok          ## comptime_float
    zigComptimeIntTok            ## comptime_int
    zigConstTok                  ## const
    zigContinueTok               ## continue
    zigCustomNumberType          ## custom_number_type
    zigDeferTok                  ## defer
    zigDocComment                ## doc_comment
    zigElseTok                   ## else
    zigElseSwitch                ## else_switch
    zigEnumTok                   ## enum
    zigEnumModifier              ## enum_modifier
    zigErrdeferTok               ## errdefer
    zigErrorTok                  ## error
    zigEscapeSequence            ## escape_sequence
    zigExportTok                 ## export
    zigExternTok                 ## extern
    zigF128Tok                   ## f128
    zigF16Tok                    ## f16
    zigF32Tok                    ## f32
    zigF64Tok                    ## f64
    zigFalseTok                  ## false
    zigFloatLiteral              ## float_literal
    zigFnTok                     ## fn
    zigForTok                    ## for
    zigI128Tok                   ## i128
    zigI16Tok                    ## i16
    zigI32Tok                    ## i32
    zigI64Tok                    ## i64
    zigI8Tok                     ## i8
    zigIfTok                     ## if
    zigInferenceType             ## inference_type
    zigInlineTok                 ## inline
    zigIntegerLiteral            ## integer_literal
    zigIsizeTok                  ## isize
    zigLineComment               ## line_comment
    zigLoopModifier              ## loop_modifier
    zigNakedccTok                ## nakedcc
    zigNoreturnTok               ## noreturn
    zigNullTok                   ## null
    zigPointer                   ## pointer
    zigPromiseTok                ## promise
    zigPubTok                    ## pub
    zigResumeTok                 ## resume
    zigReturnTok                 ## return
    zigStdcallccTok              ## stdcallcc
    zigStructTok                 ## struct
    zigStructModifier            ## struct_modifier
    zigSuspendTok                ## suspend
    zigSwitchTok                 ## switch
    zigTestTok                   ## test
    zigTrueTok                   ## true
    zigTryTok                    ## try
    zigTypeTok                   ## type
    zigU128Tok                   ## u128
    zigU16Tok                    ## u16
    zigU32Tok                    ## u32
    zigU64Tok                    ## u64
    zigU8Tok                     ## u8
    zigUndefinedLiteral          ## undefined_literal
    zigUnionTok                  ## union
    zigUnionModifier             ## union_modifier
    zigUnreachableExpression     ## unreachable_expression
    zigUsingnamespaceTok         ## usingnamespace
    zigUsizeTok                  ## usize
    zigVarTok                    ## var
    zigVoidTok                   ## void
    zigVolatileTok               ## volatile
    zigWhileTok                  ## while
    zigLCurlyTok                 ## {
    zigPipeTok                   ## |
    zigPipeEqualTok              ## |=
    zigRCurlyTok                 ## }
    zigTildeTok                  ## ~
    zigSyntaxError               ## Tree-sitter parser syntax error


proc strRepr*(kind: ZigNodeKind): string =
  case kind:
    of zigAnonymousArrayExpr:        "anonymous_array_expr"
    of zigAnonymousStructEnum:       "anonymous_struct_enum"
    of zigArguments:                 "arguments"
    of zigArrayExpression:           "array_expression"
    of zigArrayType:                 "array_type"
    of zigArrayValues:               "array_values"
    of zigAssignmentExpression:      "assignment_expression"
    of zigAssignmentOperator:        "assignment_operator"
    of zigAssignmentStatement:       "assignment_statement"
    of zigAwaitExpression:           "await_expression"
    of zigBinaryExpression:          "binary_expression"
    of zigBlock:                     "block"
    of zigBooleanLiteral:            "boolean_literal"
    of zigBreakExpression:           "break_expression"
    of zigBuildInCallExpr:           "build_in_call_expr"
    of zigCallExpression:            "call_expression"
    of zigCharLiteral:               "char_literal"
    of zigCompoundAssignmentExpr:    "compound_assignment_expr"
    of zigComptimeBlock:             "comptime_block"
    of zigContinueExpression:        "continue_expression"
    of zigDeferBlock:                "defer_block"
    of zigDeferExpression:           "defer_expression"
    of zigDereferenceExpression:     "dereference_expression"
    of zigEmptyStatement:            "empty_statement"
    of zigEnumExpression:            "enum_expression"
    of zigEnumIdentifier:            "enum_identifier"
    of zigEnumLiteral:               "enum_literal"
    of zigErrorExpression:           "error_expression"
    of zigErrorIdentifier:           "error_identifier"
    of zigErrorType:                 "error_type"
    of zigExternModifier:            "extern_modifier"
    of zigFieldDeclaration:          "field_declaration"
    of zigFieldExpression:           "field_expression"
    of zigFieldIdentifier:           "field_identifier"
    of zigFieldInit:                 "field_init"
    of zigFieldPattern:              "field_pattern"
    of zigForExpression:             "for_expression"
    of zigFunctionDeclaration:       "function_declaration"
    of zigFunctionModifiers:         "function_modifiers"
    of zigFunctionSignature:         "function_signature"
    of zigIdentifier:                "identifier"
    of zigIfExpression:              "if_expression"
    of zigIndexExpression:           "index_expression"
    of zigLabelIdentifier:           "label_identifier"
    of zigLiteralPattern:            "literal_pattern"
    of zigLoopLabel:                 "loop_label"
    of zigLoopLabelInverse:          "loop_label_inverse"
    of zigMultilineStringLiteral:    "multiline_string_literal"
    of zigNullLiteral:               "null_literal"
    of zigOptionalType:              "optional_type"
    of zigOrelsePostfixExpression:   "orelse_postfix_expression"
    of zigParameter:                 "parameter"
    of zigParameters:                "parameters"
    of zigPayload:                   "payload"
    of zigPayloadExpression:         "payload_expression"
    of zigPayloadIdentifier:         "payload_identifier"
    of zigPointerType:               "pointer_type"
    of zigPrimitiveType:             "primitive_type"
    of zigRangePattern:              "range_pattern"
    of zigReferenceExpression:       "reference_expression"
    of zigResumeBlock:               "resume_block"
    of zigResumeExpression:          "resume_expression"
    of zigReturnExpression:          "return_expression"
    of zigSlicePattern:              "slice_pattern"
    of zigSourceFile:                "source_file"
    of zigStringLiteral:             "string_literal"
    of zigStructConstruction:        "struct_construction"
    of zigStructExpression:          "struct_expression"
    of zigSuspendBlock:              "suspend_block"
    of zigSuspendExpression:         "suspend_expression"
    of zigSwitchArm:                 "switch_arm"
    of zigSwitchBlock:               "switch_block"
    of zigSwitchExpression:          "switch_expression"
    of zigSwitchLastArm:             "switch_last_arm"
    of zigSwitchPattern:             "switch_pattern"
    of zigTestExpression:            "test_expression"
    of zigTryExpression:             "try_expression"
    of zigTypeIdentifier:            "type_identifier"
    of zigTypePrefix:                "type_prefix"
    of zigUnaryExpression:           "unary_expression"
    of zigUnaryOperator:             "unary_operator"
    of zigUnionExpression:           "union_expression"
    of zigUnionFieldVariant:         "union_field_variant"
    of zigUnionIdentifier:           "union_identifier"
    of zigUsingnamespaceExpression:  "usingnamespace_expression"
    of zigVariadicParameter:         "variadic_parameter"
    of zigVariantDeclaration:        "variant_declaration"
    of zigVisibilityModifier:        "visibility_modifier"
    of zigWhileExpression:           "while_expression"
    of zigExclamationTok:            "!"
    of zigQuoteTok:                  "\""
    of zigPercentEqualTok:           "%="
    of zigAmpersandTok:              "&"
    of zigAmpersandEqualTok:         "&="
    of zigApostropheTok:             "\'"
    of zigLParTok:                   "("
    of zigRParTok:                   ")"
    of zigAsteriskTok:               "*"
    of zigAsteriskPercentEqualTok:   "*%="
    of zigAsteriskEqualTok:          "*="
    of zigPlusPercentEqualTok:       "+%="
    of zigPlusEqualTok:              "+="
    of zigCommaTok:                  ","
    of zigMinusTok:                  "-"
    of zigMinusPercentTok:           "-%"
    of zigMinusPercentEqualTok:      "-%="
    of zigMinusEqualTok:             "-="
    of zigDotTok:                    "."
    of zigDotAsteriskTok:            ".*"
    of zigDoubleDotTok:              ".."
    of zigTripleDotTok:              "..."
    of zigDotQuestionTok:            ".?"
    of zigDotLCurlyTok:              ".{"
    of zigSlashEqualTok:             "/="
    of zigColonTok:                  ":"
    of zigSemicolonTok:              ";"
    of zigDoubleLessThanEqualTok:    "<<="
    of zigEqualTok:                  "="
    of zigEqualGreaterThanTok:       "=>"
    of zigDoubleGreaterThanEqualTok: ">>="
    of zigQuestionTok:               "?"
    of zigAtQuoteTok:                "@\""
    of zigLBrackTok:                 "["
    of zigDoubleBackslashTok:        "\\\\"
    of zigRBrackTok:                 "]"
    of zigAccentEqualTok:            "^="
    of zigAlignTok:                  "align"
    of zigAllowzeroTok:              "allowzero"
    of zigAnyerrorTok:               "anyerror"
    of zigAssignmentModifier:        "assignment_modifier"
    of zigAwaitTok:                  "await"
    of zigBinaryOperator:            "binary_operator"
    of zigBoolTok:                   "bool"
    of zigBreakTok:                  "break"
    of zigCIntTok:                   "c_int"
    of zigCLongTok:                  "c_long"
    of zigCLongdoubleTok:            "c_longdouble"
    of zigCLonglongTok:              "c_longlong"
    of zigCShortTok:                 "c_short"
    of zigCUintTok:                  "c_uint"
    of zigCUlongTok:                 "c_ulong"
    of zigCUlonglongTok:             "c_ulonglong"
    of zigCUshortTok:                "c_ushort"
    of zigCVoidTok:                  "c_void"
    of zigCallModifier:              "call_modifier"
    of zigComptimeTok:               "comptime"
    of zigComptimeFloatTok:          "comptime_float"
    of zigComptimeIntTok:            "comptime_int"
    of zigConstTok:                  "const"
    of zigContinueTok:               "continue"
    of zigCustomNumberType:          "custom_number_type"
    of zigDeferTok:                  "defer"
    of zigDocComment:                "doc_comment"
    of zigElseTok:                   "else"
    of zigElseSwitch:                "else_switch"
    of zigEnumTok:                   "enum"
    of zigEnumModifier:              "enum_modifier"
    of zigErrdeferTok:               "errdefer"
    of zigErrorTok:                  "error"
    of zigEscapeSequence:            "escape_sequence"
    of zigExportTok:                 "export"
    of zigExternTok:                 "extern"
    of zigF128Tok:                   "f128"
    of zigF16Tok:                    "f16"
    of zigF32Tok:                    "f32"
    of zigF64Tok:                    "f64"
    of zigFalseTok:                  "false"
    of zigFloatLiteral:              "float_literal"
    of zigFnTok:                     "fn"
    of zigForTok:                    "for"
    of zigI128Tok:                   "i128"
    of zigI16Tok:                    "i16"
    of zigI32Tok:                    "i32"
    of zigI64Tok:                    "i64"
    of zigI8Tok:                     "i8"
    of zigIfTok:                     "if"
    of zigInferenceType:             "inference_type"
    of zigInlineTok:                 "inline"
    of zigIntegerLiteral:            "integer_literal"
    of zigIsizeTok:                  "isize"
    of zigLineComment:               "line_comment"
    of zigLoopModifier:              "loop_modifier"
    of zigNakedccTok:                "nakedcc"
    of zigNoreturnTok:               "noreturn"
    of zigNullTok:                   "null"
    of zigPointer:                   "pointer"
    of zigPromiseTok:                "promise"
    of zigPubTok:                    "pub"
    of zigResumeTok:                 "resume"
    of zigReturnTok:                 "return"
    of zigStdcallccTok:              "stdcallcc"
    of zigStructTok:                 "struct"
    of zigStructModifier:            "struct_modifier"
    of zigSuspendTok:                "suspend"
    of zigSwitchTok:                 "switch"
    of zigTestTok:                   "test"
    of zigTrueTok:                   "true"
    of zigTryTok:                    "try"
    of zigTypeTok:                   "type"
    of zigU128Tok:                   "u128"
    of zigU16Tok:                    "u16"
    of zigU32Tok:                    "u32"
    of zigU64Tok:                    "u64"
    of zigU8Tok:                     "u8"
    of zigUndefinedLiteral:          "undefined_literal"
    of zigUnionTok:                  "union"
    of zigUnionModifier:             "union_modifier"
    of zigUnreachableExpression:     "unreachable_expression"
    of zigUsingnamespaceTok:         "usingnamespace"
    of zigUsizeTok:                  "usize"
    of zigVarTok:                    "var"
    of zigVoidTok:                   "void"
    of zigVolatileTok:               "volatile"
    of zigWhileTok:                  "while"
    of zigLCurlyTok:                 "{"
    of zigPipeTok:                   "|"
    of zigPipeEqualTok:              "|="
    of zigRCurlyTok:                 "}"
    of zigTildeTok:                  "~"
    of zigSyntaxError:               "ERROR"


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


func `[]`*(
    node: TsZigNode,
    idx:  int,
    kind: ZigNodeKind | set[ZigNodeKind]
  ): TsZigNode =
  assert 0 <= idx and idx < node.len
  result = TsZigNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  ZigNode* = HtsNode[TsZigNode, ZigNodeKind]


proc treeReprTsZig*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsZigNode, ZigNodeKind](parseTsZigString(str), str, 3, unnamed = unnamed)

proc toHtsNode*(
    node: TsZigNode,
    str:  ptr string
  ): HtsNode[TsZigNode, ZigNodeKind] =
  toHtsNode[TsZigNode, ZigNodeKind](node, str)

proc toHtsTree*(node: TsZigNode, str: ptr string): ZigNode =
  toHtsNode[TsZigNode, ZigNodeKind](node, str)

proc parseZigString*(str: ptr string, unnamed: bool = false): ZigNode =
  let parser = newTsZigParser()
  return toHtsTree[TsZigNode, ZigNodeKind](parseString(parser, str[]), str)

proc parseZigString*(str: string, unnamed: bool = false): ZigNode =
  let parser = newTsZigParser()
  return toHtsTree[TsZigNode, ZigNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


