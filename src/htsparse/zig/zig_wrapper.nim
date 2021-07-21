
import
  hmisc / wrappers / treesitter

import
  hmisc / base_errors

import
  strutils

type
  ZigNodeKind* = enum
    zigAnonymousArrayExpr,  ## anonymous_array_expr
    zigAnonymousStructEnum, ## anonymous_struct_enum
    zigArguments,           ## arguments
    zigArrayExpression,     ## array_expression
    zigArrayType,           ## array_type
    zigArrayValues,         ## array_values
    zigAssignmentExpression, ## assignment_expression
    zigAssignmentOperator,  ## assignment_operator
    zigAssignmentStatement, ## assignment_statement
    zigAwaitExpression,     ## await_expression
    zigBinaryExpression,    ## binary_expression
    zigBlock,               ## block
    zigBooleanLiteral,      ## boolean_literal
    zigBreakExpression,     ## break_expression
    zigBuildInCallExpr,     ## build_in_call_expr
    zigCallExpression,      ## call_expression
    zigCharLiteral,         ## char_literal
    zigCompoundAssignmentExpr, ## compound_assignment_expr
    zigComptimeBlock,       ## comptime_block
    zigContinueExpression,  ## continue_expression
    zigDeferBlock,          ## defer_block
    zigDeferExpression,     ## defer_expression
    zigDereferenceExpression, ## dereference_expression
    zigEmptyStatement,      ## empty_statement
    zigEnumExpression,      ## enum_expression
    zigEnumIdentifier,      ## enum_identifier
    zigEnumLiteral,         ## enum_literal
    zigErrorExpression,     ## error_expression
    zigErrorIdentifier,     ## error_identifier
    zigErrorType,           ## error_type
    zigExternModifier,      ## extern_modifier
    zigFieldDeclaration,    ## field_declaration
    zigFieldExpression,     ## field_expression
    zigFieldIdentifier,     ## field_identifier
    zigFieldInit,           ## field_init
    zigFieldPattern,        ## field_pattern
    zigForExpression,       ## for_expression
    zigFunctionDeclaration, ## function_declaration
    zigFunctionModifiers,   ## function_modifiers
    zigFunctionSignature,   ## function_signature
    zigIdentifier,          ## identifier
    zigIfExpression,        ## if_expression
    zigIndexExpression,     ## index_expression
    zigLabelIdentifier,     ## label_identifier
    zigLiteralPattern,      ## literal_pattern
    zigLoopLabel,           ## loop_label
    zigLoopLabelInverse,    ## loop_label_inverse
    zigMultilineStringLiteral, ## multiline_string_literal
    zigNullLiteral,         ## null_literal
    zigOptionalType,        ## optional_type
    zigOrelsePostfixExpression, ## orelse_postfix_expression
    zigParameter,           ## parameter
    zigParameters,          ## parameters
    zigPayload,             ## payload
    zigPayloadExpression,   ## payload_expression
    zigPayloadIdentifier,   ## payload_identifier
    zigPointerType,         ## pointer_type
    zigPrimitiveType,       ## primitive_type
    zigRangePattern,        ## range_pattern
    zigReferenceExpression, ## reference_expression
    zigResumeBlock,         ## resume_block
    zigResumeExpression,    ## resume_expression
    zigReturnExpression,    ## return_expression
    zigSlicePattern,        ## slice_pattern
    zigSourceFile,          ## source_file
    zigStringLiteral,       ## string_literal
    zigStructConstruction,  ## struct_construction
    zigStructExpression,    ## struct_expression
    zigSuspendBlock,        ## suspend_block
    zigSuspendExpression,   ## suspend_expression
    zigSwitchArm,           ## switch_arm
    zigSwitchBlock,         ## switch_block
    zigSwitchExpression,    ## switch_expression
    zigSwitchLastArm,       ## switch_last_arm
    zigSwitchPattern,       ## switch_pattern
    zigTestExpression,      ## test_expression
    zigTryExpression,       ## try_expression
    zigTypeIdentifier,      ## type_identifier
    zigTypePrefix,          ## type_prefix
    zigUnaryExpression,     ## unary_expression
    zigUnaryOperator,       ## unary_operator
    zigUnionExpression,     ## union_expression
    zigUnionFieldVariant,   ## union_field_variant
    zigUnionIdentifier,     ## union_identifier
    zigUsingnamespaceExpression, ## usingnamespace_expression
    zigVariadicParameter,   ## variadic_parameter
    zigVariantDeclaration,  ## variant_declaration
    zigVisibilityModifier,  ## visibility_modifier
    zigWhileExpression,     ## while_expression
    zigExclamationTok,      ## !
    zigQuoteTok,            ## "
    zigPercentEqualTok,     ## %=
    zigAmpersandTok,        ## &
    zigAmpersandEqualTok,   ## &=
    zigApostropheTok,       ## '
    zigLParTok,             ## (
    zigRParTok,             ## )
    zigAsteriskTok,         ## *
    zigAsteriskPercentEqualTok, ## *%=
    zigAsteriskEqualTok,    ## *=
    zigPlusPercentEqualTok, ## +%=
    zigPlusEqualTok,        ## +=
    zigCommaTok,            ## ,
    zigMinusTok,            ## -
    zigMinusPercentTok,     ## -%
    zigMinusPercentEqualTok, ## -%=
    zigMinusEqualTok,       ## -=
    zigDotTok,              ## .
    zigDotAsteriskTok,      ## .*
    zigDoubleDotTok,        ## ..
    zigTripleDotTok,        ## ...
    zigDotQuestionTok,      ## .?
    zigDotLCurlyTok,        ## .{
    zigSlashEqualTok,       ## /=
    zigColonTok,            ## :
    zigSemicolonTok,        ## ;
    zigDoubleLessThanEqualTok, ## <<=
    zigEqualTok,            ## =
    zigEqualGreaterThanTok, ## =>
    zigDoubleGreaterThanEqualTok, ## >>=
    zigQuestionTok,         ## ?
    zigAtQuoteTok,          ## @"
    zigLBrackTok,           ## [
    zigDoubleBackslashTok,  ## \\
    zigRBrackTok,           ## ]
    zigAccentEqualTok,      ## ^=
    zigAlignTok,            ## align
    zigAllowzeroTok,        ## allowzero
    zigAnyerrorTok,         ## anyerror
    zigAssignmentModifier,  ## assignment_modifier
    zigAwaitTok,            ## await
    zigBinaryOperator,      ## binary_operator
    zigBoolTok,             ## bool
    zigBreakTok,            ## break
    zigCIntTok,             ## c_int
    zigCLongTok,            ## c_long
    zigCLongdoubleTok,      ## c_longdouble
    zigCLonglongTok,        ## c_longlong
    zigCShortTok,           ## c_short
    zigCUintTok,            ## c_uint
    zigCUlongTok,           ## c_ulong
    zigCUlonglongTok,       ## c_ulonglong
    zigCUshortTok,          ## c_ushort
    zigCVoidTok,            ## c_void
    zigCallModifier,        ## call_modifier
    zigComptimeTok,         ## comptime
    zigComptimeFloatTok,    ## comptime_float
    zigComptimeIntTok,      ## comptime_int
    zigConstTok,            ## const
    zigContinueTok,         ## continue
    zigCustomNumberType,    ## custom_number_type
    zigDeferTok,            ## defer
    zigDocComment,          ## doc_comment
    zigElseTok,             ## else
    zigElseSwitch,          ## else_switch
    zigEnumTok,             ## enum
    zigEnumModifier,        ## enum_modifier
    zigErrdeferTok,         ## errdefer
    zigErrorTok,            ## error
    zigEscapeSequence,      ## escape_sequence
    zigExportTok,           ## export
    zigExternTok,           ## extern
    zigF128Tok,             ## f128
    zigF16Tok,              ## f16
    zigF32Tok,              ## f32
    zigF64Tok,              ## f64
    zigFalseTok,            ## false
    zigFloatLiteral,        ## float_literal
    zigFnTok,               ## fn
    zigForTok,              ## for
    zigI128Tok,             ## i128
    zigI16Tok,              ## i16
    zigI32Tok,              ## i32
    zigI64Tok,              ## i64
    zigI8Tok,               ## i8
    zigIfTok,               ## if
    zigInferenceType,       ## inference_type
    zigInlineTok,           ## inline
    zigIntegerLiteral,      ## integer_literal
    zigIsizeTok,            ## isize
    zigLineComment,         ## line_comment
    zigLoopModifier,        ## loop_modifier
    zigNakedccTok,          ## nakedcc
    zigNoreturnTok,         ## noreturn
    zigNullTok,             ## null
    zigPointer,             ## pointer
    zigPromiseTok,          ## promise
    zigPubTok,              ## pub
    zigResumeTok,           ## resume
    zigReturnTok,           ## return
    zigStdcallccTok,        ## stdcallcc
    zigStructTok,           ## struct
    zigStructModifier,      ## struct_modifier
    zigSuspendTok,          ## suspend
    zigSwitchTok,           ## switch
    zigTestTok,             ## test
    zigTrueTok,             ## true
    zigTryTok,              ## try
    zigTypeTok,             ## type
    zigU128Tok,             ## u128
    zigU16Tok,              ## u16
    zigU32Tok,              ## u32
    zigU64Tok,              ## u64
    zigU8Tok,               ## u8
    zigUndefinedLiteral,    ## undefined_literal
    zigUnionTok,            ## union
    zigUnionModifier,       ## union_modifier
    zigUnreachableExpression, ## unreachable_expression
    zigUsingnamespaceTok,   ## usingnamespace
    zigUsizeTok,            ## usize
    zigVarTok,              ## var
    zigVoidTok,             ## void
    zigVolatileTok,         ## volatile
    zigWhileTok,            ## while
    zigLCurlyTok,           ## {
    zigPipeTok,             ## |
    zigPipeEqualTok,        ## |=
    zigRCurlyTok,           ## }
    zigTildeTok,            ## ~
    zigSyntaxError           ## Tree-sitter parser syntax error
type
  TsZigNode* = distinct TSNode
type
  ZigParser* = distinct PtsParser
proc tsNodeType*(node: TsZigNode): string
proc kind*(node: TsZigNode): ZigNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "anonymous_array_expr":
      zigAnonymousArrayExpr
    of "anonymous_struct_enum":
      zigAnonymousStructEnum
    of "arguments":
      zigArguments
    of "array_expression":
      zigArrayExpression
    of "array_type":
      zigArrayType
    of "array_values":
      zigArrayValues
    of "assignment_expression":
      zigAssignmentExpression
    of "assignment_operator":
      zigAssignmentOperator
    of "assignment_statement":
      zigAssignmentStatement
    of "await_expression":
      zigAwaitExpression
    of "binary_expression":
      zigBinaryExpression
    of "block":
      zigBlock
    of "boolean_literal":
      zigBooleanLiteral
    of "break_expression":
      zigBreakExpression
    of "build_in_call_expr":
      zigBuildInCallExpr
    of "call_expression":
      zigCallExpression
    of "char_literal":
      zigCharLiteral
    of "compound_assignment_expr":
      zigCompoundAssignmentExpr
    of "comptime_block":
      zigComptimeBlock
    of "continue_expression":
      zigContinueExpression
    of "defer_block":
      zigDeferBlock
    of "defer_expression":
      zigDeferExpression
    of "dereference_expression":
      zigDereferenceExpression
    of "empty_statement":
      zigEmptyStatement
    of "enum_expression":
      zigEnumExpression
    of "enum_identifier":
      zigEnumIdentifier
    of "enum_literal":
      zigEnumLiteral
    of "error_expression":
      zigErrorExpression
    of "error_identifier":
      zigErrorIdentifier
    of "error_type":
      zigErrorType
    of "extern_modifier":
      zigExternModifier
    of "field_declaration":
      zigFieldDeclaration
    of "field_expression":
      zigFieldExpression
    of "field_identifier":
      zigFieldIdentifier
    of "field_init":
      zigFieldInit
    of "field_pattern":
      zigFieldPattern
    of "for_expression":
      zigForExpression
    of "function_declaration":
      zigFunctionDeclaration
    of "function_modifiers":
      zigFunctionModifiers
    of "function_signature":
      zigFunctionSignature
    of "identifier":
      zigIdentifier
    of "if_expression":
      zigIfExpression
    of "index_expression":
      zigIndexExpression
    of "label_identifier":
      zigLabelIdentifier
    of "literal_pattern":
      zigLiteralPattern
    of "loop_label":
      zigLoopLabel
    of "loop_label_inverse":
      zigLoopLabelInverse
    of "multiline_string_literal":
      zigMultilineStringLiteral
    of "null_literal":
      zigNullLiteral
    of "optional_type":
      zigOptionalType
    of "orelse_postfix_expression":
      zigOrelsePostfixExpression
    of "parameter":
      zigParameter
    of "parameters":
      zigParameters
    of "payload":
      zigPayload
    of "payload_expression":
      zigPayloadExpression
    of "payload_identifier":
      zigPayloadIdentifier
    of "pointer_type":
      zigPointerType
    of "primitive_type":
      zigPrimitiveType
    of "range_pattern":
      zigRangePattern
    of "reference_expression":
      zigReferenceExpression
    of "resume_block":
      zigResumeBlock
    of "resume_expression":
      zigResumeExpression
    of "return_expression":
      zigReturnExpression
    of "slice_pattern":
      zigSlicePattern
    of "source_file":
      zigSourceFile
    of "string_literal":
      zigStringLiteral
    of "struct_construction":
      zigStructConstruction
    of "struct_expression":
      zigStructExpression
    of "suspend_block":
      zigSuspendBlock
    of "suspend_expression":
      zigSuspendExpression
    of "switch_arm":
      zigSwitchArm
    of "switch_block":
      zigSwitchBlock
    of "switch_expression":
      zigSwitchExpression
    of "switch_last_arm":
      zigSwitchLastArm
    of "switch_pattern":
      zigSwitchPattern
    of "test_expression":
      zigTestExpression
    of "try_expression":
      zigTryExpression
    of "type_identifier":
      zigTypeIdentifier
    of "type_prefix":
      zigTypePrefix
    of "unary_expression":
      zigUnaryExpression
    of "unary_operator":
      zigUnaryOperator
    of "union_expression":
      zigUnionExpression
    of "union_field_variant":
      zigUnionFieldVariant
    of "union_identifier":
      zigUnionIdentifier
    of "usingnamespace_expression":
      zigUsingnamespaceExpression
    of "variadic_parameter":
      zigVariadicParameter
    of "variant_declaration":
      zigVariantDeclaration
    of "visibility_modifier":
      zigVisibilityModifier
    of "while_expression":
      zigWhileExpression
    of "!":
      zigExclamationTok
    of "\"":
      zigQuoteTok
    of "%=":
      zigPercentEqualTok
    of "&":
      zigAmpersandTok
    of "&=":
      zigAmpersandEqualTok
    of "\'":
      zigApostropheTok
    of "(":
      zigLParTok
    of ")":
      zigRParTok
    of "*":
      zigAsteriskTok
    of "*%=":
      zigAsteriskPercentEqualTok
    of "*=":
      zigAsteriskEqualTok
    of "+%=":
      zigPlusPercentEqualTok
    of "+=":
      zigPlusEqualTok
    of ",":
      zigCommaTok
    of "-":
      zigMinusTok
    of "-%":
      zigMinusPercentTok
    of "-%=":
      zigMinusPercentEqualTok
    of "-=":
      zigMinusEqualTok
    of ".":
      zigDotTok
    of ".*":
      zigDotAsteriskTok
    of "..":
      zigDoubleDotTok
    of "...":
      zigTripleDotTok
    of ".?":
      zigDotQuestionTok
    of ".{":
      zigDotLCurlyTok
    of "/=":
      zigSlashEqualTok
    of ":":
      zigColonTok
    of ";":
      zigSemicolonTok
    of "<<=":
      zigDoubleLessThanEqualTok
    of "=":
      zigEqualTok
    of "=>":
      zigEqualGreaterThanTok
    of ">>=":
      zigDoubleGreaterThanEqualTok
    of "?":
      zigQuestionTok
    of "@\"":
      zigAtQuoteTok
    of "[":
      zigLBrackTok
    of "\\\\":
      zigDoubleBackslashTok
    of "]":
      zigRBrackTok
    of "^=":
      zigAccentEqualTok
    of "align":
      zigAlignTok
    of "allowzero":
      zigAllowzeroTok
    of "anyerror":
      zigAnyerrorTok
    of "assignment_modifier":
      zigAssignmentModifier
    of "await":
      zigAwaitTok
    of "binary_operator":
      zigBinaryOperator
    of "bool":
      zigBoolTok
    of "break":
      zigBreakTok
    of "c_int":
      zigCIntTok
    of "c_long":
      zigCLongTok
    of "c_longdouble":
      zigCLongdoubleTok
    of "c_longlong":
      zigCLonglongTok
    of "c_short":
      zigCShortTok
    of "c_uint":
      zigCUintTok
    of "c_ulong":
      zigCUlongTok
    of "c_ulonglong":
      zigCUlonglongTok
    of "c_ushort":
      zigCUshortTok
    of "c_void":
      zigCVoidTok
    of "call_modifier":
      zigCallModifier
    of "comptime":
      zigComptimeTok
    of "comptime_float":
      zigComptimeFloatTok
    of "comptime_int":
      zigComptimeIntTok
    of "const":
      zigConstTok
    of "continue":
      zigContinueTok
    of "custom_number_type":
      zigCustomNumberType
    of "defer":
      zigDeferTok
    of "doc_comment":
      zigDocComment
    of "else":
      zigElseTok
    of "else_switch":
      zigElseSwitch
    of "enum":
      zigEnumTok
    of "enum_modifier":
      zigEnumModifier
    of "errdefer":
      zigErrdeferTok
    of "error":
      zigErrorTok
    of "escape_sequence":
      zigEscapeSequence
    of "export":
      zigExportTok
    of "extern":
      zigExternTok
    of "f128":
      zigF128Tok
    of "f16":
      zigF16Tok
    of "f32":
      zigF32Tok
    of "f64":
      zigF64Tok
    of "false":
      zigFalseTok
    of "float_literal":
      zigFloatLiteral
    of "fn":
      zigFnTok
    of "for":
      zigForTok
    of "i128":
      zigI128Tok
    of "i16":
      zigI16Tok
    of "i32":
      zigI32Tok
    of "i64":
      zigI64Tok
    of "i8":
      zigI8Tok
    of "if":
      zigIfTok
    of "inference_type":
      zigInferenceType
    of "inline":
      zigInlineTok
    of "integer_literal":
      zigIntegerLiteral
    of "isize":
      zigIsizeTok
    of "line_comment":
      zigLineComment
    of "loop_modifier":
      zigLoopModifier
    of "nakedcc":
      zigNakedccTok
    of "noreturn":
      zigNoreturnTok
    of "null":
      zigNullTok
    of "pointer":
      zigPointer
    of "promise":
      zigPromiseTok
    of "pub":
      zigPubTok
    of "resume":
      zigResumeTok
    of "return":
      zigReturnTok
    of "stdcallcc":
      zigStdcallccTok
    of "struct":
      zigStructTok
    of "struct_modifier":
      zigStructModifier
    of "suspend":
      zigSuspendTok
    of "switch":
      zigSwitchTok
    of "test":
      zigTestTok
    of "true":
      zigTrueTok
    of "try":
      zigTryTok
    of "type":
      zigTypeTok
    of "u128":
      zigU128Tok
    of "u16":
      zigU16Tok
    of "u32":
      zigU32Tok
    of "u64":
      zigU64Tok
    of "u8":
      zigU8Tok
    of "undefined_literal":
      zigUndefinedLiteral
    of "union":
      zigUnionTok
    of "union_modifier":
      zigUnionModifier
    of "unreachable_expression":
      zigUnreachableExpression
    of "usingnamespace":
      zigUsingnamespaceTok
    of "usize":
      zigUsizeTok
    of "var":
      zigVarTok
    of "void":
      zigVoidTok
    of "volatile":
      zigVolatileTok
    of "while":
      zigWhileTok
    of "{":
      zigLCurlyTok
    of "|":
      zigPipeTok
    of "|=":
      zigPipeEqualTok
    of "}":
      zigRCurlyTok
    of "~":
      zigTildeTok
    of "ERROR":
      zigSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

type
  ZigNode* = HtsNode[TsZigNode, ZigNodeKind]
func isNil*(node: TsZigNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsZigNode; unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

func has*(node: TsZigNode; idx: int; unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_zig(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: TsZigNode): string =
  $ts_node_type(TSNode(node))

proc newTsZigParser*(): ZigParser =
  result = ZigParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_zig())

proc parseString*(parser: ZigParser; str: string): TsZigNode =
  TsZigNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseTsZigString*(str: string): TsZigNode =
  let parser = newTsZigParser()
  return parseString(parser, str)

func `$`*(node: TsZigNode): string =
  if isNil(node):
    "<nil tree>"
  else:
    $node.kind

func `[]`*(node: TsZigNode; idx: int; kind: ZigNodeKind | set[ZigNodeKind]): TsZigNode =
  assert 0 <= idx and idx < node.len
  result = TsZigNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind,
             "Child node at index " & $idx & " for node kind " & $node.kind)

proc treeReprTsZig*(str: string; unnamed: bool = false): string =
  treeRepr[TsZigNode, ZigNodeKind](parseTsZigString(str), str, 3,
                                   unnamed = unnamed)

proc toHtsNode*(node: TsZigNode; str: ptr string): HtsNode[TsZigNode,
    ZigNodeKind] =
  toHtsNode[TsZigNode, ZigNodeKind](node, str)

proc toHtsTree*(node: TsZigNode; str: ptr string): ZigNode =
  toHtsNode[TsZigNode, ZigNodeKind](node, str)

proc parseZigString*(str: ptr string; unnamed: bool = false): ZigNode =
  let parser = newTsZigParser()
  return toHtsTree[TsZigNode, ZigNodeKind](parseString(parser, str[]), str)

proc parseZigString*(str: string; unnamed: bool = false): ZigNode =
  let parser = newTsZigParser()
  return toHtsTree[TsZigNode, ZigNodeKind](parseString(parser, str),
      unsafeAddr str, storePtr = false)
