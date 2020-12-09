
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  CNodeKind* = enum
    cAbstractDeclarator,    ## _abstract_declarator
    cDeclarator,            ## _declarator
    cExpression,            ## _expression
    cFieldDeclarator,       ## _field_declarator
    cStatement,             ## _statement
    cTypeDeclarator,        ## _type_declarator
    cTypeSpecifier,         ## _type_specifier
    cAbstractArrayDeclarator, ## abstract_array_declarator
    cAbstractFunctionDeclarator, ## abstract_function_declarator
    cAbstractParenthesizedDeclarator, ## abstract_parenthesized_declarator
    cAbstractPointerDeclarator, ## abstract_pointer_declarator
    cArgumentList,          ## argument_list
    cArrayDeclarator,       ## array_declarator
    cAssignmentExpression,  ## assignment_expression
    cAttributeSpecifier,    ## attribute_specifier
    cBinaryExpression,      ## binary_expression
    cBitfieldClause,        ## bitfield_clause
    cBreakStatement,        ## break_statement
    cCallExpression,        ## call_expression
    cCaseStatement,         ## case_statement
    cCastExpression,        ## cast_expression
    cCharLiteral,           ## char_literal
    cCommaExpression,       ## comma_expression
    cCompoundLiteralExpression, ## compound_literal_expression
    cCompoundStatement,     ## compound_statement
    cConcatenatedString,    ## concatenated_string
    cConditionalExpression, ## conditional_expression
    cContinueStatement,     ## continue_statement
    cDeclaration,           ## declaration
    cDeclarationList,       ## declaration_list
    cDoStatement,           ## do_statement
    cEnumSpecifier,         ## enum_specifier
    cEnumerator,            ## enumerator
    cEnumeratorList,        ## enumerator_list
    cExpressionStatement,   ## expression_statement
    cFieldDeclaration,      ## field_declaration
    cFieldDeclarationList,  ## field_declaration_list
    cFieldDesignator,       ## field_designator
    cFieldExpression,       ## field_expression
    cForStatement,          ## for_statement
    cFunctionDeclarator,    ## function_declarator
    cFunctionDefinition,    ## function_definition
    cGotoStatement,         ## goto_statement
    cIfStatement,           ## if_statement
    cInitDeclarator,        ## init_declarator
    cInitializerList,       ## initializer_list
    cInitializerPair,       ## initializer_pair
    cLabeledStatement,      ## labeled_statement
    cLinkageSpecification,  ## linkage_specification
    cMacroTypeSpecifier,    ## macro_type_specifier
    cMsBasedModifier,       ## ms_based_modifier
    cMsCallModifier,        ## ms_call_modifier
    cMsDeclspecModifier,    ## ms_declspec_modifier
    cMsPointerModifier,     ## ms_pointer_modifier
    cMsUnalignedPtrModifier, ## ms_unaligned_ptr_modifier
    cParameterDeclaration,  ## parameter_declaration
    cParameterList,         ## parameter_list
    cParenthesizedDeclarator, ## parenthesized_declarator
    cParenthesizedExpression, ## parenthesized_expression
    cPointerDeclarator,     ## pointer_declarator
    cPointerExpression,     ## pointer_expression
    cPreprocCall,           ## preproc_call
    cPreprocDef,            ## preproc_def
    cPreprocDefined,        ## preproc_defined
    cPreprocElif,           ## preproc_elif
    cPreprocElse,           ## preproc_else
    cPreprocFunctionDef,    ## preproc_function_def
    cPreprocIf,             ## preproc_if
    cPreprocIfdef,          ## preproc_ifdef
    cPreprocInclude,        ## preproc_include
    cPreprocParams,         ## preproc_params
    cReturnStatement,       ## return_statement
    cSizedTypeSpecifier,    ## sized_type_specifier
    cSizeofExpression,      ## sizeof_expression
    cStorageClassSpecifier, ## storage_class_specifier
    cStringLiteral,         ## string_literal
    cStructSpecifier,       ## struct_specifier
    cSubscriptDesignator,   ## subscript_designator
    cSubscriptExpression,   ## subscript_expression
    cSwitchStatement,       ## switch_statement
    cTranslationUnit,       ## translation_unit
    cTypeDefinition,        ## type_definition
    cTypeDescriptor,        ## type_descriptor
    cTypeQualifier,         ## type_qualifier
    cUnaryExpression,       ## unary_expression
    cUnionSpecifier,        ## union_specifier
    cUpdateExpression,      ## update_expression
    cWhileStatement,        ## while_statement
    cSingleNewlineTok,      ## 
                             ## 
    cSingleExclamationTok,  ## !
    cSingleExclamationSingleEqualTok, ## !=
    cSingleQuoteTok,        ## "
    cSingleHashdefineTok,   ## #define
    cSingleHashelifTok,     ## #elif
    cSingleHashelseTok,     ## #else
    cSingleHashendifTok,    ## #endif
    cSingleHashifTok,       ## #if
    cSingleHashifdefTok,    ## #ifdef
    cSingleHashifndefTok,   ## #ifndef
    cSingleHashincludeTok,  ## #include
    cSinglePercentTok,      ## %
    cSinglePercentSingleEqualTok, ## %=
    cSingleAmpersandTok,    ## &
    cDoubleAmpersandTok,    ## &&
    cSingleAmpersandSingleEqualTok, ## &=
    cSingleApostropheTok,   ## '
    cSingleLParTok,         ## (
    cSingleRParTok,         ## )
    cSingleAsteriskTok,     ## *
    cSingleAsteriskSingleEqualTok, ## *=
    cSinglePlusTok,         ## +
    cDoublePlusTok,         ## ++
    cSinglePlusSingleEqualTok, ## +=
    cSingleCommaTok,        ## ,
    cSingleMinusTok,        ## -
    cDoubleMinusTok,        ## --
    cSingleMinusSingleEqualTok, ## -=
    cSingleMinusSingleGreaterThanTok, ## ->
    cSingleDotTok,          ## .
    cTripleDotTok,          ## ...
    cSingleSlashTok,        ## /
    cSingleSlashSingleEqualTok, ## /=
    cSingleColonTok,        ## :
    cSingleSemicolonTok,    ## ;
    cSingleLessThanTok,     ## <
    cDoubleLessThanTok,     ## <<
    cDoubleLessThanSingleEqualTok, ## <<=
    cSingleLessThanSingleEqualTok, ## <=
    cSingleEqualTok,        ## =
    cDoubleEqualTok,        ## ==
    cSingleGreaterThanTok,  ## >
    cSingleGreaterThanSingleEqualTok, ## >=
    cDoubleGreaterThanTok,  ## >>
    cDoubleGreaterThanSingleEqualTok, ## >>=
    cSingleQuestionTok,     ## ?
    cLSingleQuoteTok,       ## L"
    cLSingleApostropheTok,  ## L'
    cUSingleQuoteTok,       ## U"
    cUSingleApostropheTok,  ## U'
    cSingleLBrackTok,       ## [
    cSingleRBrackTok,       ## ]
    cSingleAccentTok,       ## ^
    cSingleAccentSingleEqualTok, ## ^=
    cAtomicTok,             ## _Atomic
    cAttributeTok,          ## __attribute__
    cBasedTok,              ## __based
    cCdeclTok,              ## __cdecl
    cClrcallTok,            ## __clrcall
    cDeclspecTok,           ## __declspec
    cFastcallTok,           ## __fastcall
    cStdcallTok,            ## __stdcall
    cThiscallTok,           ## __thiscall
    cUnalignedTok,          ## __unaligned
    cVectorcallTok,         ## __vectorcall
    cAutoTok,               ## auto
    cBreakTok,              ## break
    cCaseTok,               ## case
    cComment,               ## comment
    cConstTok,              ## const
    cContinueTok,           ## continue
    cDefaultTok,            ## default
    cDefinedTok,            ## defined
    cDoTok,                 ## do
    cElseTok,               ## else
    cEnumTok,               ## enum
    cEscapeSequence,        ## escape_sequence
    cExternTok,             ## extern
    cFalse,                 ## false
    cFieldIdentifier,       ## field_identifier
    cForTok,                ## for
    cGotoTok,               ## goto
    cIdentifier,            ## identifier
    cIfTok,                 ## if
    cInlineTok,             ## inline
    cLongTok,               ## long
    cMsRestrictModifier,    ## ms_restrict_modifier
    cMsSignedPtrModifier,   ## ms_signed_ptr_modifier
    cMsUnsignedPtrModifier, ## ms_unsigned_ptr_modifier
    cNull,                  ## null
    cNumberLiteral,         ## number_literal
    cPreprocArg,            ## preproc_arg
    cPreprocDirective,      ## preproc_directive
    cPrimitiveType,         ## primitive_type
    cRegisterTok,           ## register
    cRestrictTok,           ## restrict
    cReturnTok,             ## return
    cShortTok,              ## short
    cSignedTok,             ## signed
    cSizeofTok,             ## sizeof
    cStatementIdentifier,   ## statement_identifier
    cStaticTok,             ## static
    cStructTok,             ## struct
    cSwitchTok,             ## switch
    cSystemLibString,       ## system_lib_string
    cTrue,                  ## true
    cTypeIdentifier,        ## type_identifier
    cTypedefTok,            ## typedef
    cU8SingleQuoteTok,      ## u8"
    cU8SingleApostropheTok, ## u8'
    cUnionTok,              ## union
    cUnsignedTok,           ## unsigned
    cVolatileTok,           ## volatile
    cWhileTok,              ## while
    cSingleLCurlyTok,       ## {
    cSinglePipeTok,         ## |
    cSinglePipeSingleEqualTok, ## |=
    cDoublePipeTok,         ## ||
    cSingleRCurlyTok,       ## }
    cSingleTildeTok,        ## ~
    cSyntaxError             ## Tree-sitter parser syntax error
type
  CExternalTok* = enum
type
  CNode* = distinct TSNode
type
  CParser* = distinct PtsParser
proc tsNodeType*(node: CNode): string
proc kind*(node: CNode): CNodeKind =
  case node.tsNodeType
  of "_abstract_declarator":
    cAbstractDeclarator
  of "_declarator":
    cDeclarator
  of "_expression":
    cExpression
  of "_field_declarator":
    cFieldDeclarator
  of "_statement":
    cStatement
  of "_type_declarator":
    cTypeDeclarator
  of "_type_specifier":
    cTypeSpecifier
  of "abstract_array_declarator":
    cAbstractArrayDeclarator
  of "abstract_function_declarator":
    cAbstractFunctionDeclarator
  of "abstract_parenthesized_declarator":
    cAbstractParenthesizedDeclarator
  of "abstract_pointer_declarator":
    cAbstractPointerDeclarator
  of "argument_list":
    cArgumentList
  of "array_declarator":
    cArrayDeclarator
  of "assignment_expression":
    cAssignmentExpression
  of "attribute_specifier":
    cAttributeSpecifier
  of "binary_expression":
    cBinaryExpression
  of "bitfield_clause":
    cBitfieldClause
  of "break_statement":
    cBreakStatement
  of "call_expression":
    cCallExpression
  of "case_statement":
    cCaseStatement
  of "cast_expression":
    cCastExpression
  of "char_literal":
    cCharLiteral
  of "comma_expression":
    cCommaExpression
  of "compound_literal_expression":
    cCompoundLiteralExpression
  of "compound_statement":
    cCompoundStatement
  of "concatenated_string":
    cConcatenatedString
  of "conditional_expression":
    cConditionalExpression
  of "continue_statement":
    cContinueStatement
  of "declaration":
    cDeclaration
  of "declaration_list":
    cDeclarationList
  of "do_statement":
    cDoStatement
  of "enum_specifier":
    cEnumSpecifier
  of "enumerator":
    cEnumerator
  of "enumerator_list":
    cEnumeratorList
  of "expression_statement":
    cExpressionStatement
  of "field_declaration":
    cFieldDeclaration
  of "field_declaration_list":
    cFieldDeclarationList
  of "field_designator":
    cFieldDesignator
  of "field_expression":
    cFieldExpression
  of "for_statement":
    cForStatement
  of "function_declarator":
    cFunctionDeclarator
  of "function_definition":
    cFunctionDefinition
  of "goto_statement":
    cGotoStatement
  of "if_statement":
    cIfStatement
  of "init_declarator":
    cInitDeclarator
  of "initializer_list":
    cInitializerList
  of "initializer_pair":
    cInitializerPair
  of "labeled_statement":
    cLabeledStatement
  of "linkage_specification":
    cLinkageSpecification
  of "macro_type_specifier":
    cMacroTypeSpecifier
  of "ms_based_modifier":
    cMsBasedModifier
  of "ms_call_modifier":
    cMsCallModifier
  of "ms_declspec_modifier":
    cMsDeclspecModifier
  of "ms_pointer_modifier":
    cMsPointerModifier
  of "ms_unaligned_ptr_modifier":
    cMsUnalignedPtrModifier
  of "parameter_declaration":
    cParameterDeclaration
  of "parameter_list":
    cParameterList
  of "parenthesized_declarator":
    cParenthesizedDeclarator
  of "parenthesized_expression":
    cParenthesizedExpression
  of "pointer_declarator":
    cPointerDeclarator
  of "pointer_expression":
    cPointerExpression
  of "preproc_call":
    cPreprocCall
  of "preproc_def":
    cPreprocDef
  of "preproc_defined":
    cPreprocDefined
  of "preproc_elif":
    cPreprocElif
  of "preproc_else":
    cPreprocElse
  of "preproc_function_def":
    cPreprocFunctionDef
  of "preproc_if":
    cPreprocIf
  of "preproc_ifdef":
    cPreprocIfdef
  of "preproc_include":
    cPreprocInclude
  of "preproc_params":
    cPreprocParams
  of "return_statement":
    cReturnStatement
  of "sized_type_specifier":
    cSizedTypeSpecifier
  of "sizeof_expression":
    cSizeofExpression
  of "storage_class_specifier":
    cStorageClassSpecifier
  of "string_literal":
    cStringLiteral
  of "struct_specifier":
    cStructSpecifier
  of "subscript_designator":
    cSubscriptDesignator
  of "subscript_expression":
    cSubscriptExpression
  of "switch_statement":
    cSwitchStatement
  of "translation_unit":
    cTranslationUnit
  of "type_definition":
    cTypeDefinition
  of "type_descriptor":
    cTypeDescriptor
  of "type_qualifier":
    cTypeQualifier
  of "unary_expression":
    cUnaryExpression
  of "union_specifier":
    cUnionSpecifier
  of "update_expression":
    cUpdateExpression
  of "while_statement":
    cWhileStatement
  of "\n":
    cSingleNewlineTok
  of "!":
    cSingleExclamationTok
  of "!=":
    cSingleExclamationSingleEqualTok
  of "\"":
    cSingleQuoteTok
  of "#define":
    cSingleHashdefineTok
  of "#elif":
    cSingleHashelifTok
  of "#else":
    cSingleHashelseTok
  of "#endif":
    cSingleHashendifTok
  of "#if":
    cSingleHashifTok
  of "#ifdef":
    cSingleHashifdefTok
  of "#ifndef":
    cSingleHashifndefTok
  of "#include":
    cSingleHashincludeTok
  of "%":
    cSinglePercentTok
  of "%=":
    cSinglePercentSingleEqualTok
  of "&":
    cSingleAmpersandTok
  of "&&":
    cDoubleAmpersandTok
  of "&=":
    cSingleAmpersandSingleEqualTok
  of "\'":
    cSingleApostropheTok
  of "(":
    cSingleLParTok
  of ")":
    cSingleRParTok
  of "*":
    cSingleAsteriskTok
  of "*=":
    cSingleAsteriskSingleEqualTok
  of "+":
    cSinglePlusTok
  of "++":
    cDoublePlusTok
  of "+=":
    cSinglePlusSingleEqualTok
  of ",":
    cSingleCommaTok
  of "-":
    cSingleMinusTok
  of "--":
    cDoubleMinusTok
  of "-=":
    cSingleMinusSingleEqualTok
  of "->":
    cSingleMinusSingleGreaterThanTok
  of ".":
    cSingleDotTok
  of "...":
    cTripleDotTok
  of "/":
    cSingleSlashTok
  of "/=":
    cSingleSlashSingleEqualTok
  of ":":
    cSingleColonTok
  of ";":
    cSingleSemicolonTok
  of "<":
    cSingleLessThanTok
  of "<<":
    cDoubleLessThanTok
  of "<<=":
    cDoubleLessThanSingleEqualTok
  of "<=":
    cSingleLessThanSingleEqualTok
  of "=":
    cSingleEqualTok
  of "==":
    cDoubleEqualTok
  of ">":
    cSingleGreaterThanTok
  of ">=":
    cSingleGreaterThanSingleEqualTok
  of ">>":
    cDoubleGreaterThanTok
  of ">>=":
    cDoubleGreaterThanSingleEqualTok
  of "?":
    cSingleQuestionTok
  of "L\"":
    cLSingleQuoteTok
  of "L\'":
    cLSingleApostropheTok
  of "U\"":
    cUSingleQuoteTok
  of "U\'":
    cUSingleApostropheTok
  of "[":
    cSingleLBrackTok
  of "]":
    cSingleRBrackTok
  of "^":
    cSingleAccentTok
  of "^=":
    cSingleAccentSingleEqualTok
  of "_Atomic":
    cAtomicTok
  of "__attribute__":
    cAttributeTok
  of "__based":
    cBasedTok
  of "__cdecl":
    cCdeclTok
  of "__clrcall":
    cClrcallTok
  of "__declspec":
    cDeclspecTok
  of "__fastcall":
    cFastcallTok
  of "__stdcall":
    cStdcallTok
  of "__thiscall":
    cThiscallTok
  of "__unaligned":
    cUnalignedTok
  of "__vectorcall":
    cVectorcallTok
  of "_unaligned":
    cUnalignedTok
  of "auto":
    cAutoTok
  of "break":
    cBreakTok
  of "case":
    cCaseTok
  of "comment":
    cComment
  of "const":
    cConstTok
  of "continue":
    cContinueTok
  of "default":
    cDefaultTok
  of "defined":
    cDefinedTok
  of "do":
    cDoTok
  of "else":
    cElseTok
  of "enum":
    cEnumTok
  of "escape_sequence":
    cEscapeSequence
  of "extern":
    cExternTok
  of "false":
    cFalse
  of "field_identifier":
    cFieldIdentifier
  of "for":
    cForTok
  of "goto":
    cGotoTok
  of "identifier":
    cIdentifier
  of "if":
    cIfTok
  of "inline":
    cInlineTok
  of "long":
    cLongTok
  of "ms_restrict_modifier":
    cMsRestrictModifier
  of "ms_signed_ptr_modifier":
    cMsSignedPtrModifier
  of "ms_unsigned_ptr_modifier":
    cMsUnsignedPtrModifier
  of "null":
    cNull
  of "number_literal":
    cNumberLiteral
  of "preproc_arg":
    cPreprocArg
  of "preproc_directive":
    cPreprocDirective
  of "primitive_type":
    cPrimitiveType
  of "register":
    cRegisterTok
  of "restrict":
    cRestrictTok
  of "return":
    cReturnTok
  of "short":
    cShortTok
  of "signed":
    cSignedTok
  of "sizeof":
    cSizeofTok
  of "statement_identifier":
    cStatementIdentifier
  of "static":
    cStaticTok
  of "struct":
    cStructTok
  of "switch":
    cSwitchTok
  of "system_lib_string":
    cSystemLibString
  of "true":
    cTrue
  of "type_identifier":
    cTypeIdentifier
  of "typedef":
    cTypedefTok
  of "u\"":
    cUSingleQuoteTok
  of "u\'":
    cUSingleApostropheTok
  of "u8\"":
    cU8SingleQuoteTok
  of "u8\'":
    cU8SingleApostropheTok
  of "union":
    cUnionTok
  of "unsigned":
    cUnsignedTok
  of "volatile":
    cVolatileTok
  of "while":
    cWhileTok
  of "{":
    cSingleLCurlyTok
  of "|":
    cSinglePipeTok
  of "|=":
    cSinglePipeSingleEqualTok
  of "||":
    cDoublePipeTok
  of "}":
    cSingleRCurlyTok
  of "~":
    cSingleTildeTok
  of "ERROR":
    cSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_c(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: CNode): string =
  $ts_node_type(TSNode(node))

proc newCParser*(): CParser =
  result = CParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_c())

proc parseString*(parser: CParser; str: string): CNode =
  CNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: CNode; idx: int; withUnnamed: bool = false): CNode =
  if withUnnamed:
    CNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    CNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: CNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: CNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: CNode; withUnnamed: bool = false): CNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: CNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: CNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: CNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[1 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
