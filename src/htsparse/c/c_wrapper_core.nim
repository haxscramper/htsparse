import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  CNodeKind* = enum
    cHidAbstractDeclarator              ## _abstract_declarator
    cHidDeclarator                      ## _declarator
    cHidExpression                      ## _expression
    cHidFieldDeclarator                 ## _field_declarator
    cHidStatement                       ## _statement
    cHidTypeDeclarator                  ## _type_declarator
    cHidTypeSpecifier                   ## _type_specifier
    cAbstractArrayDeclarator            ## abstract_array_declarator
    cAbstractFunctionDeclarator         ## abstract_function_declarator
    cAbstractParenthesizedDeclarator    ## abstract_parenthesized_declarator
    cAbstractPointerDeclarator          ## abstract_pointer_declarator
    cArgumentList                       ## argument_list
    cArrayDeclarator                    ## array_declarator
    cAssignmentExpression               ## assignment_expression
    cAttribute                          ## attribute
    cAttributeDeclaration               ## attribute_declaration
    cAttributeSpecifier                 ## attribute_specifier
    cAttributedDeclarator               ## attributed_declarator
    cAttributedStatement                ## attributed_statement
    cBinaryExpression                   ## binary_expression
    cBitfieldClause                     ## bitfield_clause
    cBreakStatement                     ## break_statement
    cCallExpression                     ## call_expression
    cCaseStatement                      ## case_statement
    cCastExpression                     ## cast_expression
    cCharLiteral                        ## char_literal
    cCommaExpression                    ## comma_expression
    cCompoundLiteralExpression          ## compound_literal_expression
    cCompoundStatement                  ## compound_statement
    cConcatenatedString                 ## concatenated_string
    cConditionalExpression              ## conditional_expression
    cContinueStatement                  ## continue_statement
    cDeclaration                        ## declaration
    cDeclarationList                    ## declaration_list
    cDoStatement                        ## do_statement
    cEnumSpecifier                      ## enum_specifier
    cEnumerator                         ## enumerator
    cEnumeratorList                     ## enumerator_list
    cExpressionStatement                ## expression_statement
    cFieldDeclaration                   ## field_declaration
    cFieldDeclarationList               ## field_declaration_list
    cFieldDesignator                    ## field_designator
    cFieldExpression                    ## field_expression
    cForStatement                       ## for_statement
    cFunctionDeclarator                 ## function_declarator
    cFunctionDefinition                 ## function_definition
    cGotoStatement                      ## goto_statement
    cIfStatement                        ## if_statement
    cInitDeclarator                     ## init_declarator
    cInitializerList                    ## initializer_list
    cInitializerPair                    ## initializer_pair
    cLabeledStatement                   ## labeled_statement
    cLinkageSpecification               ## linkage_specification
    cMacroTypeSpecifier                 ## macro_type_specifier
    cMsBasedModifier                    ## ms_based_modifier
    cMsCallModifier                     ## ms_call_modifier
    cMsDeclspecModifier                 ## ms_declspec_modifier
    cMsPointerModifier                  ## ms_pointer_modifier
    cMsUnalignedPtrModifier             ## ms_unaligned_ptr_modifier
    cParameterDeclaration               ## parameter_declaration
    cParameterList                      ## parameter_list
    cParenthesizedDeclarator            ## parenthesized_declarator
    cParenthesizedExpression            ## parenthesized_expression
    cPointerDeclarator                  ## pointer_declarator
    cPointerExpression                  ## pointer_expression
    cPreprocCall                        ## preproc_call
    cPreprocDef                         ## preproc_def
    cPreprocDefined                     ## preproc_defined
    cPreprocElif                        ## preproc_elif
    cPreprocElse                        ## preproc_else
    cPreprocFunctionDef                 ## preproc_function_def
    cPreprocIf                          ## preproc_if
    cPreprocIfdef                       ## preproc_ifdef
    cPreprocInclude                     ## preproc_include
    cPreprocParams                      ## preproc_params
    cReturnStatement                    ## return_statement
    cSizedTypeSpecifier                 ## sized_type_specifier
    cSizeofExpression                   ## sizeof_expression
    cStorageClassSpecifier              ## storage_class_specifier
    cStringLiteral                      ## string_literal
    cStructSpecifier                    ## struct_specifier
    cSubscriptDesignator                ## subscript_designator
    cSubscriptExpression                ## subscript_expression
    cSwitchStatement                    ## switch_statement
    cTranslationUnit                    ## translation_unit
    cTypeDefinition                     ## type_definition
    cTypeDescriptor                     ## type_descriptor
    cTypeQualifier                      ## type_qualifier
    cUnaryExpression                    ## unary_expression
    cUnionSpecifier                     ## union_specifier
    cUpdateExpression                   ## update_expression
    cVariadicParameter                  ## variadic_parameter
    cWhileStatement                     ## while_statement
    cNewlineTok                         ##
                                        ##
    cExclamationTok                     ## !
    cExclamationEqualTok                ## !=
    cQuoteTok                           ## "
    cHashdefineTok                      ## #define
    cHashelifTok                        ## #elif
    cHashelseTok                        ## #else
    cHashendifTok                       ## #endif
    cHashifTok                          ## #if
    cHashifdefTok                       ## #ifdef
    cHashifndefTok                      ## #ifndef
    cHashincludeTok                     ## #include
    cPercentTok                         ## %
    cPercentEqualTok                    ## %=
    cAmpersandTok                       ## &
    cDoubleAmpersandTok                 ## &&
    cAmpersandEqualTok                  ## &=
    cApostropheTok                      ## '
    cLParTok                            ## (
    cRParTok                            ## )
    cAsteriskTok                        ## *
    cAsteriskEqualTok                   ## *=
    cPlusTok                            ## +
    cDoublePlusTok                      ## ++
    cPlusEqualTok                       ## +=
    cCommaTok                           ## ,
    cMinusTok                           ## -
    cDoubleMinusTok                     ## --
    cMinusEqualTok                      ## -=
    cMinusGreaterThanTok                ## ->
    cDotTok                             ## .
    cTripleDotTok                       ## ...
    cSlashTok                           ## /
    cSlashEqualTok                      ## /=
    cColonTok                           ## :
    cDoubleColonTok                     ## ::
    cSemicolonTok                       ## ;
    cLessThanTok                        ## <
    cDoubleLessThanTok                  ## <<
    cDoubleLessThanEqualTok             ## <<=
    cLessThanEqualTok                   ## <=
    cEqualTok                           ## =
    cDoubleEqualTok                     ## ==
    cGreaterThanTok                     ## >
    cGreaterThanEqualTok                ## >=
    cDoubleGreaterThanTok               ## >>
    cDoubleGreaterThanEqualTok          ## >>=
    cQuestionTok                        ## ?
    cLQuoteTok                          ## L"
    cLApostropheTok                     ## L'
    cUQuoteTok                          ## U"
    cUApostropheTok                     ## U'
    cLBrackTok                          ## [
    cDoubleLBrackTok                    ## [[
    cRBrackTok                          ## ]
    cDoubleRBrackTok                    ## ]]
    cAccentTok                          ## ^
    cAccentEqualTok                     ## ^=
    cHidAtomicTok                       ## _Atomic
    cHidAttributeTok                    ## __attribute__
    cHidBasedTok                        ## __based
    cHidCdeclTok                        ## __cdecl
    cHidClrcallTok                      ## __clrcall
    cHidDeclspecTok                     ## __declspec
    cHidFastcallTok                     ## __fastcall
    cHidStdcallTok                      ## __stdcall
    cHidThiscallTok                     ## __thiscall
    cHidUnalignedTok                    ## __unaligned
    cHidVectorcallTok                   ## __vectorcall
    cAutoTok                            ## auto
    cBreakTok                           ## break
    cCaseTok                            ## case
    cComment                            ## comment
    cConstTok                           ## const
    cContinueTok                        ## continue
    cDefaultTok                         ## default
    cDefinedTok                         ## defined
    cDoTok                              ## do
    cElseTok                            ## else
    cEnumTok                            ## enum
    cEscapeSequence                     ## escape_sequence
    cExternTok                          ## extern
    cFalse                              ## false
    cFieldIdentifier                    ## field_identifier
    cForTok                             ## for
    cGotoTok                            ## goto
    cIdentifier                         ## identifier
    cIfTok                              ## if
    cInlineTok                          ## inline
    cLongTok                            ## long
    cMsRestrictModifier                 ## ms_restrict_modifier
    cMsSignedPtrModifier                ## ms_signed_ptr_modifier
    cMsUnsignedPtrModifier              ## ms_unsigned_ptr_modifier
    cNull                               ## null
    cNumberLiteral                      ## number_literal
    cPreprocArg                         ## preproc_arg
    cPreprocDirective                   ## preproc_directive
    cPrimitiveType                      ## primitive_type
    cRegisterTok                        ## register
    cRestrictTok                        ## restrict
    cReturnTok                          ## return
    cShortTok                           ## short
    cSignedTok                          ## signed
    cSizeofTok                          ## sizeof
    cStatementIdentifier                ## statement_identifier
    cStaticTok                          ## static
    cStructTok                          ## struct
    cSwitchTok                          ## switch
    cSystemLibString                    ## system_lib_string
    cTrue                               ## true
    cTypeIdentifier                     ## type_identifier
    cTypedefTok                         ## typedef
    cU8QuoteTok                         ## u8"
    cU8ApostropheTok                    ## u8'
    cUnionTok                           ## union
    cUnsignedTok                        ## unsigned
    cVolatileTok                        ## volatile
    cWhileTok                           ## while
    cLCurlyTok                          ## {
    cPipeTok                            ## |
    cPipeEqualTok                       ## |=
    cDoublePipeTok                      ## ||
    cRCurlyTok                          ## }
    cTildeTok                           ## ~
    cFunctionTypeDeclarator             ## function_type_declarator
    cPreprocArgumentList                ## preproc_argument_list
    cPreprocElseInFieldDeclarationList  ## preproc_else_in_field_declaration_list
    cAttributedFieldDeclarator          ## attributed_field_declarator
    cAttributedNonCaseStatement         ## attributed_non_case_statement
    cArrayTypeDeclarator                ## array_type_declarator
    cPreprocUnaryExpression             ## preproc_unary_expression
    cPointerFieldDeclarator             ## pointer_field_declarator
    cPreprocElifInFieldDeclarationList  ## preproc_elif_in_field_declaration_list
    cHidFieldIdentifier                 ## _field_identifier
    cPreprocParenthesizedExpression     ## preproc_parenthesized_expression
    cParenthesizedTypeDeclarator        ## parenthesized_type_declarator
    cHidDeclarationSpecifiers           ## _declaration_specifiers
    cPreprocIfdefInFieldDeclarationList ## preproc_ifdef_in_field_declaration_list
    cPreprocBinaryExpression            ## preproc_binary_expression
    cHidTopLevelItem                    ## _top_level_item
    cPointerTypeDeclarator              ## pointer_type_declarator
    cHidTypeIdentifier                  ## _type_identifier
    cPreprocIfInFieldDeclarationList    ## preproc_if_in_field_declaration_list
    cPreprocCallExpression              ## preproc_call_expression
    cHidFieldDeclarationListItem        ## _field_declaration_list_item
    cHidDeclarationModifiers            ## _declaration_modifiers
    cAttributedTypeDeclarator           ## attributed_type_declarator
    cHidStatementIdentifier             ## _statement_identifier
    cArrayFieldDeclarator               ## array_field_declarator
    cHidAssignmentLeftExpression        ## _assignment_left_expression
    cParenthesizedFieldDeclarator       ## parenthesized_field_declarator
    cHidPreprocExpression               ## _preproc_expression
    cHidNonCaseStatement                ## _non_case_statement
    cFunctionFieldDeclarator            ## function_field_declarator
    cHidEmptyDeclaration                ## _empty_declaration
    cSyntaxError                        ## Tree-sitter parser syntax error

proc strRepr*(kind: CNodeKind): string =
  case kind:
    of cHidAbstractDeclarator:              "_abstract_declarator"
    of cHidDeclarator:                      "_declarator"
    of cHidExpression:                      "_expression"
    of cHidFieldDeclarator:                 "_field_declarator"
    of cHidStatement:                       "_statement"
    of cHidTypeDeclarator:                  "_type_declarator"
    of cHidTypeSpecifier:                   "_type_specifier"
    of cAbstractArrayDeclarator:            "abstract_array_declarator"
    of cAbstractFunctionDeclarator:         "abstract_function_declarator"
    of cAbstractParenthesizedDeclarator:    "abstract_parenthesized_declarator"
    of cAbstractPointerDeclarator:          "abstract_pointer_declarator"
    of cArgumentList:                       "argument_list"
    of cArrayDeclarator:                    "array_declarator"
    of cAssignmentExpression:               "assignment_expression"
    of cAttribute:                          "attribute"
    of cAttributeDeclaration:               "attribute_declaration"
    of cAttributeSpecifier:                 "attribute_specifier"
    of cAttributedDeclarator:               "attributed_declarator"
    of cAttributedStatement:                "attributed_statement"
    of cBinaryExpression:                   "binary_expression"
    of cBitfieldClause:                     "bitfield_clause"
    of cBreakStatement:                     "break_statement"
    of cCallExpression:                     "call_expression"
    of cCaseStatement:                      "case_statement"
    of cCastExpression:                     "cast_expression"
    of cCharLiteral:                        "char_literal"
    of cCommaExpression:                    "comma_expression"
    of cCompoundLiteralExpression:          "compound_literal_expression"
    of cCompoundStatement:                  "compound_statement"
    of cConcatenatedString:                 "concatenated_string"
    of cConditionalExpression:              "conditional_expression"
    of cContinueStatement:                  "continue_statement"
    of cDeclaration:                        "declaration"
    of cDeclarationList:                    "declaration_list"
    of cDoStatement:                        "do_statement"
    of cEnumSpecifier:                      "enum_specifier"
    of cEnumerator:                         "enumerator"
    of cEnumeratorList:                     "enumerator_list"
    of cExpressionStatement:                "expression_statement"
    of cFieldDeclaration:                   "field_declaration"
    of cFieldDeclarationList:               "field_declaration_list"
    of cFieldDesignator:                    "field_designator"
    of cFieldExpression:                    "field_expression"
    of cForStatement:                       "for_statement"
    of cFunctionDeclarator:                 "function_declarator"
    of cFunctionDefinition:                 "function_definition"
    of cGotoStatement:                      "goto_statement"
    of cIfStatement:                        "if_statement"
    of cInitDeclarator:                     "init_declarator"
    of cInitializerList:                    "initializer_list"
    of cInitializerPair:                    "initializer_pair"
    of cLabeledStatement:                   "labeled_statement"
    of cLinkageSpecification:               "linkage_specification"
    of cMacroTypeSpecifier:                 "macro_type_specifier"
    of cMsBasedModifier:                    "ms_based_modifier"
    of cMsCallModifier:                     "ms_call_modifier"
    of cMsDeclspecModifier:                 "ms_declspec_modifier"
    of cMsPointerModifier:                  "ms_pointer_modifier"
    of cMsUnalignedPtrModifier:             "ms_unaligned_ptr_modifier"
    of cParameterDeclaration:               "parameter_declaration"
    of cParameterList:                      "parameter_list"
    of cParenthesizedDeclarator:            "parenthesized_declarator"
    of cParenthesizedExpression:            "parenthesized_expression"
    of cPointerDeclarator:                  "pointer_declarator"
    of cPointerExpression:                  "pointer_expression"
    of cPreprocCall:                        "preproc_call"
    of cPreprocDef:                         "preproc_def"
    of cPreprocDefined:                     "preproc_defined"
    of cPreprocElif:                        "preproc_elif"
    of cPreprocElse:                        "preproc_else"
    of cPreprocFunctionDef:                 "preproc_function_def"
    of cPreprocIf:                          "preproc_if"
    of cPreprocIfdef:                       "preproc_ifdef"
    of cPreprocInclude:                     "preproc_include"
    of cPreprocParams:                      "preproc_params"
    of cReturnStatement:                    "return_statement"
    of cSizedTypeSpecifier:                 "sized_type_specifier"
    of cSizeofExpression:                   "sizeof_expression"
    of cStorageClassSpecifier:              "storage_class_specifier"
    of cStringLiteral:                      "string_literal"
    of cStructSpecifier:                    "struct_specifier"
    of cSubscriptDesignator:                "subscript_designator"
    of cSubscriptExpression:                "subscript_expression"
    of cSwitchStatement:                    "switch_statement"
    of cTranslationUnit:                    "translation_unit"
    of cTypeDefinition:                     "type_definition"
    of cTypeDescriptor:                     "type_descriptor"
    of cTypeQualifier:                      "type_qualifier"
    of cUnaryExpression:                    "unary_expression"
    of cUnionSpecifier:                     "union_specifier"
    of cUpdateExpression:                   "update_expression"
    of cVariadicParameter:                  "variadic_parameter"
    of cWhileStatement:                     "while_statement"
    of cNewlineTok:                         "\x0A"
    of cExclamationTok:                     "!"
    of cExclamationEqualTok:                "!="
    of cQuoteTok:                           "\""
    of cHashdefineTok:                      "#define"
    of cHashelifTok:                        "#elif"
    of cHashelseTok:                        "#else"
    of cHashendifTok:                       "#endif"
    of cHashifTok:                          "#if"
    of cHashifdefTok:                       "#ifdef"
    of cHashifndefTok:                      "#ifndef"
    of cHashincludeTok:                     "#include"
    of cPercentTok:                         "%"
    of cPercentEqualTok:                    "%="
    of cAmpersandTok:                       "&"
    of cDoubleAmpersandTok:                 "&&"
    of cAmpersandEqualTok:                  "&="
    of cApostropheTok:                      "\'"
    of cLParTok:                            "("
    of cRParTok:                            ")"
    of cAsteriskTok:                        "*"
    of cAsteriskEqualTok:                   "*="
    of cPlusTok:                            "+"
    of cDoublePlusTok:                      "++"
    of cPlusEqualTok:                       "+="
    of cCommaTok:                           ","
    of cMinusTok:                           "-"
    of cDoubleMinusTok:                     "--"
    of cMinusEqualTok:                      "-="
    of cMinusGreaterThanTok:                "->"
    of cDotTok:                             "."
    of cTripleDotTok:                       "..."
    of cSlashTok:                           "/"
    of cSlashEqualTok:                      "/="
    of cColonTok:                           ":"
    of cDoubleColonTok:                     "::"
    of cSemicolonTok:                       ";"
    of cLessThanTok:                        "<"
    of cDoubleLessThanTok:                  "<<"
    of cDoubleLessThanEqualTok:             "<<="
    of cLessThanEqualTok:                   "<="
    of cEqualTok:                           "="
    of cDoubleEqualTok:                     "=="
    of cGreaterThanTok:                     ">"
    of cGreaterThanEqualTok:                ">="
    of cDoubleGreaterThanTok:               ">>"
    of cDoubleGreaterThanEqualTok:          ">>="
    of cQuestionTok:                        "?"
    of cLQuoteTok:                          "L\""
    of cLApostropheTok:                     "L\'"
    of cUQuoteTok:                          "U\""
    of cUApostropheTok:                     "U\'"
    of cLBrackTok:                          "["
    of cDoubleLBrackTok:                    "[["
    of cRBrackTok:                          "]"
    of cDoubleRBrackTok:                    "]]"
    of cAccentTok:                          "^"
    of cAccentEqualTok:                     "^="
    of cHidAtomicTok:                       "_Atomic"
    of cHidAttributeTok:                    "__attribute__"
    of cHidBasedTok:                        "__based"
    of cHidCdeclTok:                        "__cdecl"
    of cHidClrcallTok:                      "__clrcall"
    of cHidDeclspecTok:                     "__declspec"
    of cHidFastcallTok:                     "__fastcall"
    of cHidStdcallTok:                      "__stdcall"
    of cHidThiscallTok:                     "__thiscall"
    of cHidUnalignedTok:                    "__unaligned"
    of cHidVectorcallTok:                   "__vectorcall"
    of cAutoTok:                            "auto"
    of cBreakTok:                           "break"
    of cCaseTok:                            "case"
    of cComment:                            "comment"
    of cConstTok:                           "const"
    of cContinueTok:                        "continue"
    of cDefaultTok:                         "default"
    of cDefinedTok:                         "defined"
    of cDoTok:                              "do"
    of cElseTok:                            "else"
    of cEnumTok:                            "enum"
    of cEscapeSequence:                     "escape_sequence"
    of cExternTok:                          "extern"
    of cFalse:                              "false"
    of cFieldIdentifier:                    "field_identifier"
    of cForTok:                             "for"
    of cGotoTok:                            "goto"
    of cIdentifier:                         "identifier"
    of cIfTok:                              "if"
    of cInlineTok:                          "inline"
    of cLongTok:                            "long"
    of cMsRestrictModifier:                 "ms_restrict_modifier"
    of cMsSignedPtrModifier:                "ms_signed_ptr_modifier"
    of cMsUnsignedPtrModifier:              "ms_unsigned_ptr_modifier"
    of cNull:                               "null"
    of cNumberLiteral:                      "number_literal"
    of cPreprocArg:                         "preproc_arg"
    of cPreprocDirective:                   "preproc_directive"
    of cPrimitiveType:                      "primitive_type"
    of cRegisterTok:                        "register"
    of cRestrictTok:                        "restrict"
    of cReturnTok:                          "return"
    of cShortTok:                           "short"
    of cSignedTok:                          "signed"
    of cSizeofTok:                          "sizeof"
    of cStatementIdentifier:                "statement_identifier"
    of cStaticTok:                          "static"
    of cStructTok:                          "struct"
    of cSwitchTok:                          "switch"
    of cSystemLibString:                    "system_lib_string"
    of cTrue:                               "true"
    of cTypeIdentifier:                     "type_identifier"
    of cTypedefTok:                         "typedef"
    of cU8QuoteTok:                         "u8\""
    of cU8ApostropheTok:                    "u8\'"
    of cUnionTok:                           "union"
    of cUnsignedTok:                        "unsigned"
    of cVolatileTok:                        "volatile"
    of cWhileTok:                           "while"
    of cLCurlyTok:                          "{"
    of cPipeTok:                            "|"
    of cPipeEqualTok:                       "|="
    of cDoublePipeTok:                      "||"
    of cRCurlyTok:                          "}"
    of cTildeTok:                           "~"
    of cFunctionTypeDeclarator:             "function_type_declarator"
    of cPreprocArgumentList:                "preproc_argument_list"
    of cPreprocElseInFieldDeclarationList:  "preproc_else_in_field_declaration_list"
    of cAttributedFieldDeclarator:          "attributed_field_declarator"
    of cAttributedNonCaseStatement:         "attributed_non_case_statement"
    of cArrayTypeDeclarator:                "array_type_declarator"
    of cPreprocUnaryExpression:             "preproc_unary_expression"
    of cPointerFieldDeclarator:             "pointer_field_declarator"
    of cPreprocElifInFieldDeclarationList:  "preproc_elif_in_field_declaration_list"
    of cHidFieldIdentifier:                 "_field_identifier"
    of cPreprocParenthesizedExpression:     "preproc_parenthesized_expression"
    of cParenthesizedTypeDeclarator:        "parenthesized_type_declarator"
    of cHidDeclarationSpecifiers:           "_declaration_specifiers"
    of cPreprocIfdefInFieldDeclarationList: "preproc_ifdef_in_field_declaration_list"
    of cPreprocBinaryExpression:            "preproc_binary_expression"
    of cHidTopLevelItem:                    "_top_level_item"
    of cPointerTypeDeclarator:              "pointer_type_declarator"
    of cHidTypeIdentifier:                  "_type_identifier"
    of cPreprocIfInFieldDeclarationList:    "preproc_if_in_field_declaration_list"
    of cPreprocCallExpression:              "preproc_call_expression"
    of cHidFieldDeclarationListItem:        "_field_declaration_list_item"
    of cHidDeclarationModifiers:            "_declaration_modifiers"
    of cAttributedTypeDeclarator:           "attributed_type_declarator"
    of cHidStatementIdentifier:             "_statement_identifier"
    of cArrayFieldDeclarator:               "array_field_declarator"
    of cHidAssignmentLeftExpression:        "_assignment_left_expression"
    of cParenthesizedFieldDeclarator:       "parenthesized_field_declarator"
    of cHidPreprocExpression:               "_preproc_expression"
    of cHidNonCaseStatement:                "_non_case_statement"
    of cFunctionFieldDeclarator:            "function_field_declarator"
    of cHidEmptyDeclaration:                "_empty_declaration"
    of cSyntaxError:                        "ERROR"

type
  TsCNode* = distinct TSNode

type
  CParser* = distinct PtsParser

const cAllowedSubnodes*: array[CNodeKind, set[CNodeKind]] = block:
                                                              var tmp: array[CNodeKind, set[CNodeKind]]
                                                              tmp[cAbstractArrayDeclarator] = {cTypeQualifier}
                                                              tmp[cAbstractParenthesizedDeclarator] = {cHidAbstractDeclarator}
                                                              tmp[cAbstractPointerDeclarator] = {cTypeQualifier}
                                                              tmp[cArgumentList] = {cHidExpression, cPreprocDefined}
                                                              tmp[cArrayDeclarator] = {cTypeQualifier}
                                                              tmp[cAttribute] = {cArgumentList}
                                                              tmp[cAttributeDeclaration] = {cAttribute}
                                                              tmp[cAttributeSpecifier] = {cArgumentList}
                                                              tmp[cAttributedDeclarator] = {cHidDeclarator, cHidFieldDeclarator, cHidTypeDeclarator, cAttributeDeclaration}
                                                              tmp[cAttributedStatement] = {cHidStatement, cAttributeDeclaration}
                                                              tmp[cBitfieldClause] = {cHidExpression}
                                                              tmp[cCaseStatement] = {
                                                                                      cAttributedStatement,
                                                                                      cBreakStatement,
                                                                                      cCompoundStatement,
                                                                                      cContinueStatement,
                                                                                      cDeclaration,
                                                                                      cDoStatement,
                                                                                      cExpressionStatement,
                                                                                      cForStatement,
                                                                                      cGotoStatement,
                                                                                      cIfStatement,
                                                                                      cLabeledStatement,
                                                                                      cReturnStatement,
                                                                                      cSwitchStatement,
                                                                                      cTypeDefinition,
                                                                                      cWhileStatement
                                                                                    }
                                                              tmp[cCharLiteral] = {cEscapeSequence}
                                                              tmp[cCompoundStatement] = {
                                                                                          cHidStatement,
                                                                                          cHidTypeSpecifier,
                                                                                          cAttributedStatement,
                                                                                          cDeclaration,
                                                                                          cFunctionDefinition,
                                                                                          cLinkageSpecification,
                                                                                          cPreprocCall,
                                                                                          cPreprocDef,
                                                                                          cPreprocFunctionDef,
                                                                                          cPreprocIf,
                                                                                          cPreprocIfdef,
                                                                                          cPreprocInclude,
                                                                                          cTypeDefinition
                                                                                        }
                                                              tmp[cConcatenatedString] = {cStringLiteral}
                                                              tmp[cDeclaration] = {cAttributeDeclaration, cAttributeSpecifier, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cDeclarationList] = {
                                                                                        cHidStatement,
                                                                                        cHidTypeSpecifier,
                                                                                        cAttributedStatement,
                                                                                        cDeclaration,
                                                                                        cFunctionDefinition,
                                                                                        cLinkageSpecification,
                                                                                        cPreprocCall,
                                                                                        cPreprocDef,
                                                                                        cPreprocFunctionDef,
                                                                                        cPreprocIf,
                                                                                        cPreprocIfdef,
                                                                                        cPreprocInclude,
                                                                                        cTypeDefinition
                                                                                      }
                                                              tmp[cEnumeratorList] = {cEnumerator}
                                                              tmp[cExpressionStatement] = {cHidExpression, cCommaExpression}
                                                              tmp[cFieldDeclaration] = {cAttributeDeclaration, cAttributeSpecifier, cBitfieldClause, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cFieldDeclarationList] = {cFieldDeclaration, cPreprocCall, cPreprocDef, cPreprocFunctionDef, cPreprocIf, cPreprocIfdef}
                                                              tmp[cFieldDesignator] = {cFieldIdentifier}
                                                              tmp[cForStatement] = {cHidStatement}
                                                              tmp[cFunctionDeclarator] = {cAttributeSpecifier}
                                                              tmp[cFunctionDefinition] = {cAttributeDeclaration, cAttributeSpecifier, cMsCallModifier, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cInitializerList] = {cHidExpression, cInitializerList, cInitializerPair}
                                                              tmp[cLabeledStatement] = {cHidStatement}
                                                              tmp[cMsBasedModifier] = {cArgumentList}
                                                              tmp[cMsDeclspecModifier] = {cIdentifier}
                                                              tmp[cMsPointerModifier] = {cMsRestrictModifier, cMsSignedPtrModifier, cMsUnalignedPtrModifier, cMsUnsignedPtrModifier}
                                                              tmp[cParameterDeclaration] = {cAttributeDeclaration, cAttributeSpecifier, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cParameterList] = {cParameterDeclaration, cVariadicParameter}
                                                              tmp[cParenthesizedDeclarator] = {cHidDeclarator, cHidFieldDeclarator, cHidTypeDeclarator}
                                                              tmp[cParenthesizedExpression] = {cHidExpression, cCommaExpression, cPreprocDefined}
                                                              tmp[cPointerDeclarator] = {cMsBasedModifier, cMsPointerModifier, cTypeQualifier}
                                                              tmp[cPreprocDefined] = {cIdentifier}
                                                              tmp[cPreprocElif] = {
                                                                                    cHidStatement,
                                                                                    cHidTypeSpecifier,
                                                                                    cAttributedStatement,
                                                                                    cDeclaration,
                                                                                    cFieldDeclaration,
                                                                                    cFunctionDefinition,
                                                                                    cLinkageSpecification,
                                                                                    cPreprocCall,
                                                                                    cPreprocDef,
                                                                                    cPreprocFunctionDef,
                                                                                    cPreprocIf,
                                                                                    cPreprocIfdef,
                                                                                    cPreprocInclude,
                                                                                    cTypeDefinition
                                                                                  }
                                                              tmp[cPreprocElse] = {
                                                                                    cHidStatement,
                                                                                    cHidTypeSpecifier,
                                                                                    cAttributedStatement,
                                                                                    cDeclaration,
                                                                                    cFieldDeclaration,
                                                                                    cFunctionDefinition,
                                                                                    cLinkageSpecification,
                                                                                    cPreprocCall,
                                                                                    cPreprocDef,
                                                                                    cPreprocFunctionDef,
                                                                                    cPreprocIf,
                                                                                    cPreprocIfdef,
                                                                                    cPreprocInclude,
                                                                                    cTypeDefinition
                                                                                  }
                                                              tmp[cPreprocIf] = {
                                                                                  cHidStatement,
                                                                                  cHidTypeSpecifier,
                                                                                  cAttributedStatement,
                                                                                  cDeclaration,
                                                                                  cFieldDeclaration,
                                                                                  cFunctionDefinition,
                                                                                  cLinkageSpecification,
                                                                                  cPreprocCall,
                                                                                  cPreprocDef,
                                                                                  cPreprocFunctionDef,
                                                                                  cPreprocIf,
                                                                                  cPreprocIfdef,
                                                                                  cPreprocInclude,
                                                                                  cTypeDefinition
                                                                                }
                                                              tmp[cPreprocIfdef] = {
                                                                                     cHidStatement,
                                                                                     cHidTypeSpecifier,
                                                                                     cAttributedStatement,
                                                                                     cDeclaration,
                                                                                     cFieldDeclaration,
                                                                                     cFunctionDefinition,
                                                                                     cLinkageSpecification,
                                                                                     cPreprocCall,
                                                                                     cPreprocDef,
                                                                                     cPreprocFunctionDef,
                                                                                     cPreprocIf,
                                                                                     cPreprocIfdef,
                                                                                     cPreprocInclude,
                                                                                     cTypeDefinition
                                                                                   }
                                                              tmp[cPreprocParams] = {cIdentifier}
                                                              tmp[cReturnStatement] = {cHidExpression, cCommaExpression}
                                                              tmp[cStringLiteral] = {cEscapeSequence}
                                                              tmp[cStructSpecifier] = {cMsDeclspecModifier}
                                                              tmp[cSubscriptDesignator] = {cHidExpression}
                                                              tmp[cTranslationUnit] = {
                                                                                        cHidStatement,
                                                                                        cHidTypeSpecifier,
                                                                                        cAttributedStatement,
                                                                                        cDeclaration,
                                                                                        cFunctionDefinition,
                                                                                        cLinkageSpecification,
                                                                                        cPreprocCall,
                                                                                        cPreprocDef,
                                                                                        cPreprocFunctionDef,
                                                                                        cPreprocIf,
                                                                                        cPreprocIfdef,
                                                                                        cPreprocInclude,
                                                                                        cTypeDefinition
                                                                                      }
                                                              tmp[cTypeDefinition] = {cTypeQualifier}
                                                              tmp[cTypeDescriptor] = {cTypeQualifier}
                                                              tmp[cUnionSpecifier] = {cMsDeclspecModifier}
                                                              tmp
const cTokenKinds*: set[CNodeKind] = {
                                       cNewlineTok,
                                       cExclamationTok,
                                       cExclamationEqualTok,
                                       cQuoteTok,
                                       cHashdefineTok,
                                       cHashelifTok,
                                       cHashelseTok,
                                       cHashendifTok,
                                       cHashifTok,
                                       cHashifdefTok,
                                       cHashifndefTok,
                                       cHashincludeTok,
                                       cPercentTok,
                                       cPercentEqualTok,
                                       cAmpersandTok,
                                       cDoubleAmpersandTok,
                                       cAmpersandEqualTok,
                                       cApostropheTok,
                                       cLParTok,
                                       cRParTok,
                                       cAsteriskTok,
                                       cAsteriskEqualTok,
                                       cPlusTok,
                                       cDoublePlusTok,
                                       cPlusEqualTok,
                                       cCommaTok,
                                       cMinusTok,
                                       cDoubleMinusTok,
                                       cMinusEqualTok,
                                       cMinusGreaterThanTok,
                                       cDotTok,
                                       cTripleDotTok,
                                       cSlashTok,
                                       cSlashEqualTok,
                                       cColonTok,
                                       cDoubleColonTok,
                                       cSemicolonTok,
                                       cLessThanTok,
                                       cDoubleLessThanTok,
                                       cDoubleLessThanEqualTok,
                                       cLessThanEqualTok,
                                       cEqualTok,
                                       cDoubleEqualTok,
                                       cGreaterThanTok,
                                       cGreaterThanEqualTok,
                                       cDoubleGreaterThanTok,
                                       cDoubleGreaterThanEqualTok,
                                       cQuestionTok,
                                       cLQuoteTok,
                                       cLApostropheTok,
                                       cUQuoteTok,
                                       cUApostropheTok,
                                       cLBrackTok,
                                       cDoubleLBrackTok,
                                       cRBrackTok,
                                       cDoubleRBrackTok,
                                       cAccentTok,
                                       cAccentEqualTok,
                                       cHidAtomicTok,
                                       cHidAttributeTok,
                                       cHidBasedTok,
                                       cHidCdeclTok,
                                       cHidClrcallTok,
                                       cHidDeclspecTok,
                                       cHidFastcallTok,
                                       cHidStdcallTok,
                                       cHidThiscallTok,
                                       cHidUnalignedTok,
                                       cHidVectorcallTok,
                                       cHidUnalignedTok,
                                       cAutoTok,
                                       cBreakTok,
                                       cCaseTok,
                                       cConstTok,
                                       cContinueTok,
                                       cDefaultTok,
                                       cDefinedTok,
                                       cDoTok,
                                       cElseTok,
                                       cEnumTok,
                                       cExternTok,
                                       cForTok,
                                       cGotoTok,
                                       cIfTok,
                                       cInlineTok,
                                       cLongTok,
                                       cRegisterTok,
                                       cRestrictTok,
                                       cReturnTok,
                                       cShortTok,
                                       cSignedTok,
                                       cSizeofTok,
                                       cStaticTok,
                                       cStructTok,
                                       cSwitchTok,
                                       cTypedefTok,
                                       cUQuoteTok,
                                       cUApostropheTok,
                                       cU8QuoteTok,
                                       cU8ApostropheTok,
                                       cUnionTok,
                                       cUnsignedTok,
                                       cVolatileTok,
                                       cWhileTok,
                                       cLCurlyTok,
                                       cPipeTok,
                                       cPipeEqualTok,
                                       cDoublePipeTok,
                                       cRCurlyTok,
                                       cTildeTok
                                     }
const cHiddenKinds*: set[CNodeKind] = {
                                        cFunctionTypeDeclarator,
                                        cPreprocArgumentList,
                                        cHidAbstractDeclarator,
                                        cPreprocElseInFieldDeclarationList,
                                        cAttributedFieldDeclarator,
                                        cAttributedNonCaseStatement,
                                        cArrayTypeDeclarator,
                                        cHidExpression,
                                        cPreprocUnaryExpression,
                                        cPointerFieldDeclarator,
                                        cPreprocElifInFieldDeclarationList,
                                        cHidFieldIdentifier,
                                        cHidTypeSpecifier,
                                        cHidTypeDeclarator,
                                        cPreprocParenthesizedExpression,
                                        cParenthesizedTypeDeclarator,
                                        cHidDeclarationSpecifiers,
                                        cHidDeclarator,
                                        cPreprocIfdefInFieldDeclarationList,
                                        cPreprocBinaryExpression,
                                        cHidTopLevelItem,
                                        cPointerTypeDeclarator,
                                        cHidTypeIdentifier,
                                        cPreprocIfInFieldDeclarationList,
                                        cPreprocCallExpression,
                                        cHidStatement,
                                        cHidFieldDeclarationListItem,
                                        cHidDeclarationModifiers,
                                        cAttributedTypeDeclarator,
                                        cHidFieldDeclarator,
                                        cHidStatementIdentifier,
                                        cArrayFieldDeclarator,
                                        cHidAssignmentLeftExpression,
                                        cParenthesizedFieldDeclarator,
                                        cHidPreprocExpression,
                                        cHidNonCaseStatement,
                                        cFunctionFieldDeclarator,
                                        cHidEmptyDeclaration
                                      }
proc tsNodeType*(node: TsCNode): string


proc kind*(node: TsCNode): CNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_abstract_declarator":              cHidAbstractDeclarator
      of "_declarator":                       cHidDeclarator
      of "_expression":                       cHidExpression
      of "_field_declarator":                 cHidFieldDeclarator
      of "_statement":                        cHidStatement
      of "_type_declarator":                  cHidTypeDeclarator
      of "_type_specifier":                   cHidTypeSpecifier
      of "abstract_array_declarator":         cAbstractArrayDeclarator
      of "abstract_function_declarator":      cAbstractFunctionDeclarator
      of "abstract_parenthesized_declarator": cAbstractParenthesizedDeclarator
      of "abstract_pointer_declarator":       cAbstractPointerDeclarator
      of "argument_list":                     cArgumentList
      of "array_declarator":                  cArrayDeclarator
      of "assignment_expression":             cAssignmentExpression
      of "attribute":                         cAttribute
      of "attribute_declaration":             cAttributeDeclaration
      of "attribute_specifier":               cAttributeSpecifier
      of "attributed_declarator":             cAttributedDeclarator
      of "attributed_statement":              cAttributedStatement
      of "binary_expression":                 cBinaryExpression
      of "bitfield_clause":                   cBitfieldClause
      of "break_statement":                   cBreakStatement
      of "call_expression":                   cCallExpression
      of "case_statement":                    cCaseStatement
      of "cast_expression":                   cCastExpression
      of "char_literal":                      cCharLiteral
      of "comma_expression":                  cCommaExpression
      of "compound_literal_expression":       cCompoundLiteralExpression
      of "compound_statement":                cCompoundStatement
      of "concatenated_string":               cConcatenatedString
      of "conditional_expression":            cConditionalExpression
      of "continue_statement":                cContinueStatement
      of "declaration":                       cDeclaration
      of "declaration_list":                  cDeclarationList
      of "do_statement":                      cDoStatement
      of "enum_specifier":                    cEnumSpecifier
      of "enumerator":                        cEnumerator
      of "enumerator_list":                   cEnumeratorList
      of "expression_statement":              cExpressionStatement
      of "field_declaration":                 cFieldDeclaration
      of "field_declaration_list":            cFieldDeclarationList
      of "field_designator":                  cFieldDesignator
      of "field_expression":                  cFieldExpression
      of "for_statement":                     cForStatement
      of "function_declarator":               cFunctionDeclarator
      of "function_definition":               cFunctionDefinition
      of "goto_statement":                    cGotoStatement
      of "if_statement":                      cIfStatement
      of "init_declarator":                   cInitDeclarator
      of "initializer_list":                  cInitializerList
      of "initializer_pair":                  cInitializerPair
      of "labeled_statement":                 cLabeledStatement
      of "linkage_specification":             cLinkageSpecification
      of "macro_type_specifier":              cMacroTypeSpecifier
      of "ms_based_modifier":                 cMsBasedModifier
      of "ms_call_modifier":                  cMsCallModifier
      of "ms_declspec_modifier":              cMsDeclspecModifier
      of "ms_pointer_modifier":               cMsPointerModifier
      of "ms_unaligned_ptr_modifier":         cMsUnalignedPtrModifier
      of "parameter_declaration":             cParameterDeclaration
      of "parameter_list":                    cParameterList
      of "parenthesized_declarator":          cParenthesizedDeclarator
      of "parenthesized_expression":          cParenthesizedExpression
      of "pointer_declarator":                cPointerDeclarator
      of "pointer_expression":                cPointerExpression
      of "preproc_call":                      cPreprocCall
      of "preproc_def":                       cPreprocDef
      of "preproc_defined":                   cPreprocDefined
      of "preproc_elif":                      cPreprocElif
      of "preproc_else":                      cPreprocElse
      of "preproc_function_def":              cPreprocFunctionDef
      of "preproc_if":                        cPreprocIf
      of "preproc_ifdef":                     cPreprocIfdef
      of "preproc_include":                   cPreprocInclude
      of "preproc_params":                    cPreprocParams
      of "return_statement":                  cReturnStatement
      of "sized_type_specifier":              cSizedTypeSpecifier
      of "sizeof_expression":                 cSizeofExpression
      of "storage_class_specifier":           cStorageClassSpecifier
      of "string_literal":                    cStringLiteral
      of "struct_specifier":                  cStructSpecifier
      of "subscript_designator":              cSubscriptDesignator
      of "subscript_expression":              cSubscriptExpression
      of "switch_statement":                  cSwitchStatement
      of "translation_unit":                  cTranslationUnit
      of "type_definition":                   cTypeDefinition
      of "type_descriptor":                   cTypeDescriptor
      of "type_qualifier":                    cTypeQualifier
      of "unary_expression":                  cUnaryExpression
      of "union_specifier":                   cUnionSpecifier
      of "update_expression":                 cUpdateExpression
      of "variadic_parameter":                cVariadicParameter
      of "while_statement":                   cWhileStatement
      of "\x0A":                              cNewlineTok
      of "!":                                 cExclamationTok
      of "!=":                                cExclamationEqualTok
      of "\"":                                cQuoteTok
      of "#define":                           cHashdefineTok
      of "#elif":                             cHashelifTok
      of "#else":                             cHashelseTok
      of "#endif":                            cHashendifTok
      of "#if":                               cHashifTok
      of "#ifdef":                            cHashifdefTok
      of "#ifndef":                           cHashifndefTok
      of "#include":                          cHashincludeTok
      of "%":                                 cPercentTok
      of "%=":                                cPercentEqualTok
      of "&":                                 cAmpersandTok
      of "&&":                                cDoubleAmpersandTok
      of "&=":                                cAmpersandEqualTok
      of "\'":                                cApostropheTok
      of "(":                                 cLParTok
      of ")":                                 cRParTok
      of "*":                                 cAsteriskTok
      of "*=":                                cAsteriskEqualTok
      of "+":                                 cPlusTok
      of "++":                                cDoublePlusTok
      of "+=":                                cPlusEqualTok
      of ",":                                 cCommaTok
      of "-":                                 cMinusTok
      of "--":                                cDoubleMinusTok
      of "-=":                                cMinusEqualTok
      of "->":                                cMinusGreaterThanTok
      of ".":                                 cDotTok
      of "...":                               cTripleDotTok
      of "/":                                 cSlashTok
      of "/=":                                cSlashEqualTok
      of ":":                                 cColonTok
      of "::":                                cDoubleColonTok
      of ";":                                 cSemicolonTok
      of "<":                                 cLessThanTok
      of "<<":                                cDoubleLessThanTok
      of "<<=":                               cDoubleLessThanEqualTok
      of "<=":                                cLessThanEqualTok
      of "=":                                 cEqualTok
      of "==":                                cDoubleEqualTok
      of ">":                                 cGreaterThanTok
      of ">=":                                cGreaterThanEqualTok
      of ">>":                                cDoubleGreaterThanTok
      of ">>=":                               cDoubleGreaterThanEqualTok
      of "?":                                 cQuestionTok
      of "L\"":                               cLQuoteTok
      of "L\'":                               cLApostropheTok
      of "U\"":                               cUQuoteTok
      of "U\'":                               cUApostropheTok
      of "[":                                 cLBrackTok
      of "[[":                                cDoubleLBrackTok
      of "]":                                 cRBrackTok
      of "]]":                                cDoubleRBrackTok
      of "^":                                 cAccentTok
      of "^=":                                cAccentEqualTok
      of "_Atomic":                           cHidAtomicTok
      of "__attribute__":                     cHidAttributeTok
      of "__based":                           cHidBasedTok
      of "__cdecl":                           cHidCdeclTok
      of "__clrcall":                         cHidClrcallTok
      of "__declspec":                        cHidDeclspecTok
      of "__fastcall":                        cHidFastcallTok
      of "__stdcall":                         cHidStdcallTok
      of "__thiscall":                        cHidThiscallTok
      of "__unaligned":                       cHidUnalignedTok
      of "__vectorcall":                      cHidVectorcallTok
      of "_unaligned":                        cHidUnalignedTok
      of "auto":                              cAutoTok
      of "break":                             cBreakTok
      of "case":                              cCaseTok
      of "comment":                           cComment
      of "const":                             cConstTok
      of "continue":                          cContinueTok
      of "default":                           cDefaultTok
      of "defined":                           cDefinedTok
      of "do":                                cDoTok
      of "else":                              cElseTok
      of "enum":                              cEnumTok
      of "escape_sequence":                   cEscapeSequence
      of "extern":                            cExternTok
      of "false":                             cFalse
      of "field_identifier":                  cFieldIdentifier
      of "for":                               cForTok
      of "goto":                              cGotoTok
      of "identifier":                        cIdentifier
      of "if":                                cIfTok
      of "inline":                            cInlineTok
      of "long":                              cLongTok
      of "ms_restrict_modifier":              cMsRestrictModifier
      of "ms_signed_ptr_modifier":            cMsSignedPtrModifier
      of "ms_unsigned_ptr_modifier":          cMsUnsignedPtrModifier
      of "null":                              cNull
      of "number_literal":                    cNumberLiteral
      of "preproc_arg":                       cPreprocArg
      of "preproc_directive":                 cPreprocDirective
      of "primitive_type":                    cPrimitiveType
      of "register":                          cRegisterTok
      of "restrict":                          cRestrictTok
      of "return":                            cReturnTok
      of "short":                             cShortTok
      of "signed":                            cSignedTok
      of "sizeof":                            cSizeofTok
      of "statement_identifier":              cStatementIdentifier
      of "static":                            cStaticTok
      of "struct":                            cStructTok
      of "switch":                            cSwitchTok
      of "system_lib_string":                 cSystemLibString
      of "true":                              cTrue
      of "type_identifier":                   cTypeIdentifier
      of "typedef":                           cTypedefTok
      of "u\"":                               cUQuoteTok
      of "u\'":                               cUApostropheTok
      of "u8\"":                              cU8QuoteTok
      of "u8\'":                              cU8ApostropheTok
      of "union":                             cUnionTok
      of "unsigned":                          cUnsignedTok
      of "volatile":                          cVolatileTok
      of "while":                             cWhileTok
      of "{":                                 cLCurlyTok
      of "|":                                 cPipeTok
      of "|=":                                cPipeEqualTok
      of "||":                                cDoublePipeTok
      of "}":                                 cRCurlyTok
      of "~":                                 cTildeTok
      of "ERROR":                             cSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsCNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsCNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsCNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_c(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsCNode): string =
  $ts_node_type(TSNode(node))

proc newTsCParser*(): CParser =
  result = CParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_c())

proc parseString*(parser: CParser, str: string): TsCNode =
  TsCNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsCString*(str: string): TsCNode =
  let parser = newTsCParser()
  return parseString(parser, str)

func `$`*(node: TsCNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsCNode, str: string): string =
  var res = addr result
  proc aux(node: TsCNode, level: int) =
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
let cGrammar*: array[CNodeKind, HtsRule[CNodeKind]] = block:
                                                        var rules: array[CNodeKind, HtsRule[CNodeKind]]
                                                        type
                                                          K = CNodeKind


                                                        rules[cFunctionTypeDeclarator] = tsSeq[K](tsSymbol[K](cHidTypeDeclarator), tsSymbol[K](cParameterList))
                                                        rules[cPreprocElse] = tsSeq[K](tsRegex[K]("#[ \x09]*else"), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)))
                                                        rules[cPointerDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cMsPointerModifier)), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsSymbol[K](cHidDeclarator))
                                                        rules[cCompoundLiteralExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](cTypeDescriptor), tsString[K](")"), tsSymbol[K](cInitializerList))
                                                        rules[cTypeDefinition] = tsSeq[K](tsString[K]("typedef"), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsSymbol[K](cHidTypeSpecifier), tsSeq[K](tsSymbol[K](cHidTypeDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cHidTypeDeclarator)))), tsString[K](";"))
                                                        rules[cStructSpecifier] = tsSeq[K](tsString[K]("struct"), tsChoice[K](tsSymbol[K](cMsDeclspecModifier), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](cHidTypeIdentifier), tsChoice[K](tsSymbol[K](cFieldDeclarationList), tsBlank[K]())), tsSymbol[K](cFieldDeclarationList)))
                                                        rules[cHidAbstractDeclarator] = tsChoice[K](tsSymbol[K](cAbstractPointerDeclarator), tsSymbol[K](cAbstractFunctionDeclarator), tsSymbol[K](cAbstractArrayDeclarator), tsSymbol[K](cAbstractParenthesizedDeclarator))
                                                        rules[cPreprocElseInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*else"), tsRepeat[K](tsSymbol[K](cHidFieldDeclarationListItem)))
                                                        rules[cPreprocDefined] = tsChoice[K](tsSeq[K](tsString[K]("defined"), tsString[K]("("), tsSymbol[K](cIdentifier), tsString[K](")")), tsSeq[K](tsString[K]("defined"), tsSymbol[K](cIdentifier)))
                                                        rules[cReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)), tsBlank[K]()), tsString[K](";"))
                                                        rules[cGotoStatement] = tsSeq[K](tsString[K]("goto"), tsSymbol[K](cHidStatementIdentifier), tsString[K](";"))
                                                        rules[cFalse] = tsChoice[K](tsString[K]("FALSE"), tsString[K]("false"))
                                                        rules[cAttributedNonCaseStatement] = tsSeq[K](tsRepeat1[K](tsSymbol[K](cAttributeDeclaration)), tsSymbol[K](cHidNonCaseStatement))
                                                        rules[cCharLiteral] = tsSeq[K](tsChoice[K](tsString[K]("L\'"), tsString[K]("u\'"), tsString[K]("U\'"), tsString[K]("u8\'"), tsString[K]("\'")), tsChoice[K](tsSymbol[K](cEscapeSequence), tsRegex[K]("[^\\n\']")), tsString[K]("\'"))
                                                        rules[cArrayTypeDeclarator] = tsSeq[K](tsSymbol[K](cHidTypeDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                        rules[cAttributeDeclaration] = tsSeq[K](tsString[K]("[["), tsSeq[K](tsSymbol[K](cAttribute), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cAttribute)))), tsString[K]("]]"))
                                                        rules[cMsPointerModifier] = tsChoice[K](tsSymbol[K](cMsUnalignedPtrModifier), tsSymbol[K](cMsRestrictModifier), tsSymbol[K](cMsUnsignedPtrModifier), tsSymbol[K](cMsSignedPtrModifier))
                                                        rules[cForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsSymbol[K](cDeclaration), tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)), tsBlank[K]()), tsString[K](";"))), tsChoice[K](tsSymbol[K](cHidExpression), tsBlank[K]()), tsString[K](";"), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)), tsBlank[K]()), tsString[K](")"), tsSymbol[K](cHidStatement))
                                                        rules[cHidExpression] = tsChoice[K](tsSymbol[K](cConditionalExpression), tsSymbol[K](cAssignmentExpression), tsSymbol[K](cBinaryExpression), tsSymbol[K](cUnaryExpression), tsSymbol[K](cUpdateExpression), tsSymbol[K](cCastExpression), tsSymbol[K](cPointerExpression), tsSymbol[K](cSizeofExpression), tsSymbol[K](cSubscriptExpression), tsSymbol[K](cCallExpression), tsSymbol[K](cFieldExpression), tsSymbol[K](cCompoundLiteralExpression), tsSymbol[K](cIdentifier), tsSymbol[K](cNumberLiteral), tsSymbol[K](cStringLiteral), tsSymbol[K](cTrue), tsSymbol[K](cFalse), tsSymbol[K](cNull), tsSymbol[K](cConcatenatedString), tsSymbol[K](cCharLiteral), tsSymbol[K](cParenthesizedExpression))
                                                        rules[cSystemLibString] = tsSeq[K](tsString[K]("<"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^>\\n]"), tsString[K]("\\>"))), tsString[K](">"))
                                                        rules[cSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](cParenthesizedExpression), tsSymbol[K](cCompoundStatement))
                                                        rules[cPreprocUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~"), tsString[K]("-"), tsString[K]("+")), tsSymbol[K](cHidPreprocExpression))
                                                        rules[cCaseStatement] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("case"), tsSymbol[K](cHidExpression)), tsString[K]("default")), tsString[K](":"), tsRepeat[K](tsChoice[K](tsSymbol[K](cAttributedNonCaseStatement), tsSymbol[K](cHidNonCaseStatement), tsSymbol[K](cDeclaration), tsSymbol[K](cTypeDefinition))))
                                                        rules[cPreprocElifInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*elif"), tsSymbol[K](cHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElseInFieldDeclarationList), tsSymbol[K](cPreprocElifInFieldDeclarationList)), tsBlank[K]()))
                                                        rules[cHidFieldIdentifier] = tsSymbol[K](cIdentifier)
                                                        rules[cBitfieldClause] = tsSeq[K](tsString[K](":"), tsSymbol[K](cHidExpression))
                                                        rules[cPreprocParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](cHidPreprocExpression), tsString[K](")"))
                                                        rules[cMsUnsignedPtrModifier] = tsString[K]("__uptr")
                                                        rules[cHidTypeDeclarator] = tsChoice[K](tsSymbol[K](cAttributedTypeDeclarator), tsSymbol[K](cPointerTypeDeclarator), tsSymbol[K](cFunctionTypeDeclarator), tsSymbol[K](cArrayTypeDeclarator), tsSymbol[K](cParenthesizedTypeDeclarator), tsSymbol[K](cHidTypeIdentifier))
                                                        rules[cFunctionDeclarator] = tsSeq[K](tsSymbol[K](cHidDeclarator), tsSymbol[K](cParameterList), tsRepeat[K](tsSymbol[K](cAttributeSpecifier)))
                                                        rules[cPreprocDirective] = tsRegex[K]("#[ \\t]*[a-zA-Z]\\w*")
                                                        rules[cHidDeclarator] = tsChoice[K](tsSymbol[K](cAttributedDeclarator), tsSymbol[K](cPointerDeclarator), tsSymbol[K](cFunctionDeclarator), tsSymbol[K](cArrayDeclarator), tsSymbol[K](cParenthesizedDeclarator), tsSymbol[K](cIdentifier))
                                                        rules[cArrayDeclarator] = tsSeq[K](tsSymbol[K](cHidDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                        rules[cPreprocIfdefInFieldDeclarationList] = tsSeq[K](tsChoice[K](tsRegex[K]("#[ \x09]*ifdef"), tsRegex[K]("#[ \x09]*ifndef")), tsSymbol[K](cIdentifier), tsRepeat[K](tsSymbol[K](cHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElseInFieldDeclarationList), tsSymbol[K](cPreprocElifInFieldDeclarationList)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                        rules[cStorageClassSpecifier] = tsChoice[K](tsString[K]("extern"), tsString[K]("static"), tsString[K]("auto"), tsString[K]("register"), tsString[K]("inline"))
                                                        rules[cParenthesizedDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cHidDeclarator), tsString[K](")"))
                                                        rules[cEnumeratorList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](cEnumerator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cEnumerator)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                        rules[cUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("!"), tsString[K]("~"), tsString[K]("-"), tsString[K]("+")), tsSymbol[K](cHidExpression))
                                                        rules[cMacroTypeSpecifier] = tsSeq[K](tsSymbol[K](cIdentifier), tsString[K]("("), tsSymbol[K](cTypeDescriptor), tsString[K](")"))
                                                        rules[cFieldExpression] = tsSeq[K](tsSeq[K](tsSymbol[K](cHidExpression), tsChoice[K](tsString[K]("."), tsString[K]("->"))), tsSymbol[K](cHidFieldIdentifier))
                                                        rules[cPreprocIfdef] = tsSeq[K](tsChoice[K](tsRegex[K]("#[ \x09]*ifdef"), tsRegex[K]("#[ \x09]*ifndef")), tsSymbol[K](cIdentifier), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElse), tsSymbol[K](cPreprocElif)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                        rules[cHidTypeIdentifier] = tsSymbol[K](cIdentifier)
                                                        rules[cComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K]("(\\\\(.|\\r?\\n)|[^\\\\\\n])*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                        rules[cPreprocIfInFieldDeclarationList] = tsSeq[K](tsRegex[K]("#[ \x09]*if"), tsSymbol[K](cHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cHidFieldDeclarationListItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElseInFieldDeclarationList), tsSymbol[K](cPreprocElifInFieldDeclarationList)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                        rules[cPreprocCallExpression] = tsSeq[K](tsSymbol[K](cIdentifier), tsSymbol[K](cPreprocArgumentList))
                                                        rules[cTypeQualifier] = tsChoice[K](tsString[K]("const"), tsString[K]("volatile"), tsString[K]("restrict"), tsString[K]("_Atomic"))
                                                        rules[cEnumSpecifier] = tsSeq[K](tsString[K]("enum"), tsChoice[K](tsSeq[K](tsSymbol[K](cHidTypeIdentifier), tsChoice[K](tsSymbol[K](cEnumeratorList), tsBlank[K]())), tsSymbol[K](cEnumeratorList)))
                                                        rules[cVariadicParameter] = tsSeq[K](tsString[K]("..."))
                                                        rules[cPreprocDef] = tsSeq[K](tsRegex[K]("#[ \x09]*define"), tsSymbol[K](cIdentifier), tsChoice[K](tsSymbol[K](cPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                        rules[cHidStatement] = tsChoice[K](tsSymbol[K](cCaseStatement), tsSymbol[K](cHidNonCaseStatement))
                                                        rules[cIdentifier] = tsRegex[K]("[a-zA-Z_]\\w*")
                                                        rules[cAbstractPointerDeclarator] = tsSeq[K](tsString[K]("*"), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsSymbol[K](cHidAbstractDeclarator), tsBlank[K]()))
                                                        rules[cAbstractArrayDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cHidAbstractDeclarator), tsBlank[K]()), tsString[K]("["), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                        rules[cHidDeclarationModifiers] = tsChoice[K](tsSymbol[K](cStorageClassSpecifier), tsSymbol[K](cTypeQualifier), tsSymbol[K](cAttributeSpecifier), tsSymbol[K](cAttributeDeclaration), tsSymbol[K](cMsDeclspecModifier))
                                                        rules[cHidFieldDeclarationListItem] = tsChoice[K](tsSymbol[K](cFieldDeclaration), tsSymbol[K](cPreprocDef), tsSymbol[K](cPreprocFunctionDef), tsSymbol[K](cPreprocCall), tsSymbol[K](cPreprocIfInFieldDeclarationList), tsSymbol[K](cPreprocIfdefInFieldDeclarationList))
                                                        rules[cSubscriptExpression] = tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("["), tsSymbol[K](cHidExpression), tsString[K]("]"))
                                                        rules[cPreprocFunctionDef] = tsSeq[K](tsRegex[K]("#[ \x09]*define"), tsSymbol[K](cIdentifier), tsSymbol[K](cPreprocParams), tsChoice[K](tsSymbol[K](cPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                        rules[cFieldDeclaration] = tsSeq[K](tsSymbol[K](cHidDeclarationSpecifiers), tsChoice[K](tsSeq[K](tsSymbol[K](cHidFieldDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cHidFieldDeclarator)))), tsBlank[K]()), tsChoice[K](tsSymbol[K](cBitfieldClause), tsBlank[K]()), tsString[K](";"))
                                                        rules[cArrayFieldDeclarator] = tsSeq[K](tsSymbol[K](cHidFieldDeclarator), tsString[K]("["), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsString[K]("*")), tsBlank[K]()), tsString[K]("]"))
                                                        rules[cParameterList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cParameterDeclaration), tsSymbol[K](cVariadicParameter)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cParameterDeclaration), tsSymbol[K](cVariadicParameter))))), tsBlank[K]()), tsString[K](")"))
                                                        rules[cHidStatementIdentifier] = tsSymbol[K](cIdentifier)
                                                        rules[cPointerExpression] = tsSeq[K](tsChoice[K](tsString[K]("*"), tsString[K]("&")), tsSymbol[K](cHidExpression))
                                                        rules[cPreprocCall] = tsSeq[K](tsSymbol[K](cPreprocDirective), tsChoice[K](tsSymbol[K](cPreprocArg), tsBlank[K]()), tsString[K]("\x0A"))
                                                        rules[cMsSignedPtrModifier] = tsString[K]("__sptr")
                                                        rules[cSubscriptDesignator] = tsSeq[K](tsString[K]("["), tsSymbol[K](cHidExpression), tsString[K]("]"))
                                                        rules[cTrue] = tsChoice[K](tsString[K]("TRUE"), tsString[K]("true"))
                                                        rules[cFieldDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cHidFieldDeclarationListItem)), tsString[K]("}"))
                                                        rules[cAttributeSpecifier] = tsSeq[K](tsString[K]("__attribute__"), tsString[K]("("), tsSymbol[K](cArgumentList), tsString[K](")"))
                                                        rules[cParenthesizedFieldDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cHidFieldDeclarator), tsString[K](")"))
                                                        rules[cMsCallModifier] = tsChoice[K](tsString[K]("__cdecl"), tsString[K]("__clrcall"), tsString[K]("__stdcall"), tsString[K]("__fastcall"), tsString[K]("__thiscall"), tsString[K]("__vectorcall"))
                                                        rules[cParameterDeclaration] = tsSeq[K](tsSymbol[K](cHidDeclarationSpecifiers), tsChoice[K](tsChoice[K](tsSymbol[K](cHidDeclarator), tsSymbol[K](cHidAbstractDeclarator)), tsBlank[K]()))
                                                        rules[cLabeledStatement] = tsSeq[K](tsSymbol[K](cHidStatementIdentifier), tsString[K](":"), tsSymbol[K](cHidStatement))
                                                        rules[cCommaExpression] = tsSeq[K](tsSymbol[K](cHidExpression), tsString[K](","), tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)))
                                                        rules[cAttributedStatement] = tsSeq[K](tsRepeat1[K](tsSymbol[K](cAttributeDeclaration)), tsSymbol[K](cHidStatement))
                                                        rules[cHidAssignmentLeftExpression] = tsChoice[K](tsSymbol[K](cIdentifier), tsSymbol[K](cCallExpression), tsSymbol[K](cFieldExpression), tsSymbol[K](cPointerExpression), tsSymbol[K](cSubscriptExpression), tsSymbol[K](cParenthesizedExpression))
                                                        rules[cParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)), tsString[K](")"))
                                                        rules[cInitializerList] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cInitializerPair), tsSymbol[K](cHidExpression), tsSymbol[K](cInitializerList)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cInitializerPair), tsSymbol[K](cHidExpression), tsSymbol[K](cInitializerList))))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                                                        rules[cHidEmptyDeclaration] = tsSeq[K](tsSymbol[K](cHidTypeSpecifier), tsString[K](";"))
                                                        rules[cAbstractFunctionDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cHidAbstractDeclarator), tsBlank[K]()), tsSymbol[K](cParameterList))
                                                        rules[cUnionSpecifier] = tsSeq[K](tsString[K]("union"), tsChoice[K](tsSymbol[K](cMsDeclspecModifier), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](cHidTypeIdentifier), tsChoice[K](tsSymbol[K](cFieldDeclarationList), tsBlank[K]())), tsSymbol[K](cFieldDeclarationList)))
                                                        rules[cWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](cParenthesizedExpression), tsSymbol[K](cHidStatement))
                                                        rules[cTranslationUnit] = tsRepeat[K](tsSymbol[K](cHidTopLevelItem))
                                                        rules[cPreprocArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cHidPreprocExpression)))), tsBlank[K]()), tsString[K](")"))
                                                        rules[cMsUnalignedPtrModifier] = tsChoice[K](tsString[K]("_unaligned"), tsString[K]("__unaligned"))
                                                        rules[cAttributedFieldDeclarator] = tsSeq[K](tsSymbol[K](cHidFieldDeclarator), tsRepeat1[K](tsSymbol[K](cAttributeDeclaration)))
                                                        rules[cNull] = tsString[K]("NULL")
                                                        rules[cSizedTypeSpecifier] = tsSeq[K](tsRepeat1[K](tsChoice[K](tsString[K]("signed"), tsString[K]("unsigned"), tsString[K]("long"), tsString[K]("short"))), tsChoice[K](tsChoice[K](tsSymbol[K](cHidTypeIdentifier), tsSymbol[K](cPrimitiveType)), tsBlank[K]()))
                                                        rules[cStringLiteral] = tsSeq[K](tsChoice[K](tsString[K]("L\""), tsString[K]("u\""), tsString[K]("U\""), tsString[K]("u8\""), tsString[K]("\"")), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\\\\"\\n]+"), tsSymbol[K](cEscapeSequence))), tsString[K]("\""))
                                                        rules[cCallExpression] = tsSeq[K](tsSymbol[K](cHidExpression), tsSymbol[K](cArgumentList))
                                                        rules[cPreprocElif] = tsSeq[K](tsRegex[K]("#[ \x09]*elif"), tsSymbol[K](cHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElse), tsSymbol[K](cPreprocElif)), tsBlank[K]()))
                                                        rules[cMsRestrictModifier] = tsString[K]("__restrict")
                                                        rules[cPreprocArg] = tsRepeat1[K](tsRegex[K](".|\\\\\\r?\\n"))
                                                        rules[cAbstractParenthesizedDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cHidAbstractDeclarator), tsString[K](")"))
                                                        rules[cPointerFieldDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cMsPointerModifier)), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsSymbol[K](cHidFieldDeclarator))
                                                        rules[cTypeDescriptor] = tsSeq[K](tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsSymbol[K](cHidTypeSpecifier), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsChoice[K](tsSymbol[K](cHidAbstractDeclarator), tsBlank[K]()))
                                                        rules[cBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("+"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("-"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("*"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("/"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("%"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("||"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("&&"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("|"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("^"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("&"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("=="), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("!="), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K](">"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K](">="), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("<="), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("<"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("<<"), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsString[K](">>"), tsSymbol[K](cHidExpression)))
                                                        rules[cCompoundStatement] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)), tsString[K]("}"))
                                                        rules[cAttributedDeclarator] = tsSeq[K](tsSymbol[K](cHidDeclarator), tsRepeat1[K](tsSymbol[K](cAttributeDeclaration)))
                                                        rules[cInitDeclarator] = tsSeq[K](tsSymbol[K](cHidDeclarator), tsString[K]("="), tsChoice[K](tsSymbol[K](cInitializerList), tsSymbol[K](cHidExpression)))
                                                        rules[cParenthesizedTypeDeclarator] = tsSeq[K](tsString[K]("("), tsSymbol[K](cHidTypeDeclarator), tsString[K](")"))
                                                        rules[cDeclaration] = tsSeq[K](tsSymbol[K](cHidDeclarationSpecifiers), tsSeq[K](tsChoice[K](tsSymbol[K](cHidDeclarator), tsSymbol[K](cInitDeclarator)), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cHidDeclarator), tsSymbol[K](cInitDeclarator))))), tsString[K](";"))
                                                        rules[cHidTypeSpecifier] = tsChoice[K](tsSymbol[K](cStructSpecifier), tsSymbol[K](cUnionSpecifier), tsSymbol[K](cEnumSpecifier), tsSymbol[K](cMacroTypeSpecifier), tsSymbol[K](cSizedTypeSpecifier), tsSymbol[K](cPrimitiveType), tsSymbol[K](cHidTypeIdentifier))
                                                        rules[cConditionalExpression] = tsSeq[K](tsSymbol[K](cHidExpression), tsString[K]("?"), tsSymbol[K](cHidExpression), tsString[K](":"), tsSymbol[K](cHidExpression))
                                                        rules[cSizeofExpression] = tsSeq[K](tsString[K]("sizeof"), tsChoice[K](tsSymbol[K](cHidExpression), tsSeq[K](tsString[K]("("), tsSymbol[K](cTypeDescriptor), tsString[K](")"))))
                                                        rules[cNumberLiteral] = tsSeq[K](tsChoice[K](tsRegex[K]("[-\\+]"), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0b")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]"))))), tsSeq[K](tsString[K]("0b"), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]")))))), tsSeq[K](tsString[K]("0x"), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]"))))))), tsChoice[K](tsSeq[K](tsString[K]("."), tsChoice[K](tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]"))))), tsBlank[K]())), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9]"))))))), tsChoice[K](tsSeq[K](tsRegex[K]("[eEpP]"), tsChoice[K](tsSeq[K](tsChoice[K](tsRegex[K]("[-\\+]"), tsBlank[K]()), tsSeq[K](tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")), tsRepeat[K](tsSeq[K](tsString[K]("\'"), tsRepeat1[K](tsRegex[K]("[0-9a-fA-F]")))))), tsBlank[K]())), tsBlank[K]()), tsRepeat[K](tsChoice[K](tsString[K]("u"), tsString[K]("l"), tsString[K]("U"), tsString[K]("L"), tsString[K]("f"), tsString[K]("F"))))
                                                        rules[cHidDeclarationSpecifiers] = tsSeq[K](tsRepeat[K](tsSymbol[K](cHidDeclarationModifiers)), tsSymbol[K](cHidTypeSpecifier), tsRepeat[K](tsSymbol[K](cHidDeclarationModifiers)))
                                                        rules[cLinkageSpecification] = tsSeq[K](tsString[K]("extern"), tsSymbol[K](cStringLiteral), tsChoice[K](tsSymbol[K](cFunctionDefinition), tsSymbol[K](cDeclaration), tsSymbol[K](cDeclarationList)))
                                                        rules[cPrimitiveType] = tsChoice[K](tsString[K]("bool"), tsString[K]("char"), tsString[K]("int"), tsString[K]("float"), tsString[K]("double"), tsString[K]("void"), tsString[K]("size_t"), tsString[K]("ssize_t"), tsString[K]("intptr_t"), tsString[K]("uintptr_t"), tsString[K]("charptr_t"), tsString[K]("int8_t"), tsString[K]("int16_t"), tsString[K]("int32_t"), tsString[K]("int64_t"), tsString[K]("uint8_t"), tsString[K]("uint16_t"), tsString[K]("uint32_t"), tsString[K]("uint64_t"), tsString[K]("char8_t"), tsString[K]("char16_t"), tsString[K]("char32_t"), tsString[K]("char64_t"))
                                                        rules[cBreakStatement] = tsSeq[K](tsString[K]("break"), tsString[K](";"))
                                                        rules[cCastExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](cTypeDescriptor), tsString[K](")"), tsSymbol[K](cHidExpression))
                                                        rules[cPreprocBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("+"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("-"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("*"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("/"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("%"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("||"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("&&"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("|"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("^"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("&"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("=="), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("!="), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K](">"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K](">="), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("<="), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("<"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K]("<<"), tsSymbol[K](cHidPreprocExpression)), tsSeq[K](tsSymbol[K](cHidPreprocExpression), tsString[K](">>"), tsSymbol[K](cHidPreprocExpression)))
                                                        rules[cFieldDesignator] = tsSeq[K](tsString[K]("."), tsSymbol[K](cHidFieldIdentifier))
                                                        rules[cEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xuU]"), tsRegex[K]("\\d{2,3}"), tsRegex[K]("x[0-9a-fA-F]{2,}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("U[0-9a-fA-F]{8}")))
                                                        rules[cArgumentList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSymbol[K](cHidExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](cHidExpression)))), tsBlank[K]()), tsString[K](")"))
                                                        rules[cDeclarationList] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)), tsString[K]("}"))
                                                        rules[cHidTopLevelItem] = tsChoice[K](tsSymbol[K](cFunctionDefinition), tsSymbol[K](cLinkageSpecification), tsSymbol[K](cDeclaration), tsSymbol[K](cHidStatement), tsSymbol[K](cAttributedStatement), tsSymbol[K](cTypeDefinition), tsSymbol[K](cHidEmptyDeclaration), tsSymbol[K](cPreprocIf), tsSymbol[K](cPreprocIfdef), tsSymbol[K](cPreprocInclude), tsSymbol[K](cPreprocDef), tsSymbol[K](cPreprocFunctionDef), tsSymbol[K](cPreprocCall))
                                                        rules[cIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](cParenthesizedExpression), tsSymbol[K](cHidStatement), tsChoice[K](tsSeq[K](tsString[K]("else"), tsSymbol[K](cHidStatement)), tsBlank[K]()))
                                                        rules[cContinueStatement] = tsSeq[K](tsString[K]("continue"), tsString[K](";"))
                                                        rules[cFunctionDefinition] = tsSeq[K](tsChoice[K](tsSymbol[K](cMsCallModifier), tsBlank[K]()), tsSymbol[K](cHidDeclarationSpecifiers), tsSymbol[K](cHidDeclarator), tsSymbol[K](cCompoundStatement))
                                                        rules[cMsDeclspecModifier] = tsSeq[K](tsString[K]("__declspec"), tsString[K]("("), tsSymbol[K](cIdentifier), tsString[K](")"))
                                                        rules[cPointerTypeDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](cMsBasedModifier), tsBlank[K]()), tsString[K]("*"), tsRepeat[K](tsSymbol[K](cMsPointerModifier)), tsRepeat[K](tsSymbol[K](cTypeQualifier)), tsSymbol[K](cHidTypeDeclarator))
                                                        rules[cUpdateExpression] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("--"), tsString[K]("++")), tsSymbol[K](cHidExpression)), tsSeq[K](tsSymbol[K](cHidExpression), tsChoice[K](tsString[K]("--"), tsString[K]("++"))))
                                                        rules[cAttribute] = tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](cIdentifier), tsString[K]("::")), tsBlank[K]()), tsSymbol[K](cIdentifier), tsChoice[K](tsSymbol[K](cArgumentList), tsBlank[K]()))
                                                        rules[cEnumerator] = tsSeq[K](tsSymbol[K](cIdentifier), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](cHidExpression)), tsBlank[K]()))
                                                        rules[cMsBasedModifier] = tsSeq[K](tsString[K]("__based"), tsSymbol[K](cArgumentList))
                                                        rules[cExpressionStatement] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cCommaExpression)), tsBlank[K]()), tsString[K](";"))
                                                        rules[cPreprocParams] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](cIdentifier), tsString[K]("...")), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](cIdentifier), tsString[K]("..."))))), tsBlank[K]()), tsString[K](")"))
                                                        rules[cPreprocInclude] = tsSeq[K](tsRegex[K]("#[ \x09]*include"), tsChoice[K](tsSymbol[K](cStringLiteral), tsSymbol[K](cSystemLibString), tsSymbol[K](cIdentifier), tsSymbol[K](cPreprocCallExpression)), tsString[K]("\x0A"))
                                                        rules[cInitializerPair] = tsSeq[K](tsRepeat1[K](tsChoice[K](tsSymbol[K](cSubscriptDesignator), tsSymbol[K](cFieldDesignator))), tsString[K]("="), tsChoice[K](tsSymbol[K](cHidExpression), tsSymbol[K](cInitializerList)))
                                                        rules[cAttributedTypeDeclarator] = tsSeq[K](tsSymbol[K](cHidTypeDeclarator), tsRepeat1[K](tsSymbol[K](cAttributeDeclaration)))
                                                        rules[cHidFieldDeclarator] = tsChoice[K](tsSymbol[K](cAttributedFieldDeclarator), tsSymbol[K](cPointerFieldDeclarator), tsSymbol[K](cFunctionFieldDeclarator), tsSymbol[K](cArrayFieldDeclarator), tsSymbol[K](cParenthesizedFieldDeclarator), tsSymbol[K](cHidFieldIdentifier))
                                                        rules[cAssignmentExpression] = tsSeq[K](tsSymbol[K](cHidAssignmentLeftExpression), tsChoice[K](tsString[K]("="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("+="), tsString[K]("-="), tsString[K]("<<="), tsString[K](">>="), tsString[K]("&="), tsString[K]("^="), tsString[K]("|=")), tsSymbol[K](cHidExpression))
                                                        rules[cDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](cHidStatement), tsString[K]("while"), tsSymbol[K](cParenthesizedExpression), tsString[K](";"))
                                                        rules[cPreprocIf] = tsSeq[K](tsRegex[K]("#[ \x09]*if"), tsSymbol[K](cHidPreprocExpression), tsString[K]("\x0A"), tsRepeat[K](tsSymbol[K](cHidTopLevelItem)), tsChoice[K](tsChoice[K](tsSymbol[K](cPreprocElse), tsSymbol[K](cPreprocElif)), tsBlank[K]()), tsRegex[K]("#[ \x09]*endif"))
                                                        rules[cHidPreprocExpression] = tsChoice[K](tsSymbol[K](cIdentifier), tsSymbol[K](cPreprocCallExpression), tsSymbol[K](cNumberLiteral), tsSymbol[K](cCharLiteral), tsSymbol[K](cPreprocDefined), tsSymbol[K](cPreprocUnaryExpression), tsSymbol[K](cPreprocBinaryExpression), tsSymbol[K](cPreprocParenthesizedExpression))
                                                        rules[cHidNonCaseStatement] = tsChoice[K](tsSymbol[K](cLabeledStatement), tsSymbol[K](cCompoundStatement), tsSymbol[K](cExpressionStatement), tsSymbol[K](cIfStatement), tsSymbol[K](cSwitchStatement), tsSymbol[K](cDoStatement), tsSymbol[K](cWhileStatement), tsSymbol[K](cForStatement), tsSymbol[K](cReturnStatement), tsSymbol[K](cBreakStatement), tsSymbol[K](cContinueStatement), tsSymbol[K](cGotoStatement))
                                                        rules[cFunctionFieldDeclarator] = tsSeq[K](tsSymbol[K](cHidFieldDeclarator), tsSymbol[K](cParameterList))
                                                        rules[cConcatenatedString] = tsSeq[K](tsSymbol[K](cStringLiteral), tsRepeat1[K](tsSymbol[K](cStringLiteral)))
                                                        rules

