import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  CNodeKind* = enum
    cAbstractDeclarator              ## _abstract_declarator
    cDeclarator                      ## _declarator
    cExpression                      ## _expression
    cFieldDeclarator                 ## _field_declarator
    cStatement                       ## _statement
    cTypeDeclarator                  ## _type_declarator
    cTypeSpecifier                   ## _type_specifier
    cAbstractArrayDeclarator         ## abstract_array_declarator
    cAbstractFunctionDeclarator      ## abstract_function_declarator
    cAbstractParenthesizedDeclarator ## abstract_parenthesized_declarator
    cAbstractPointerDeclarator       ## abstract_pointer_declarator
    cArgumentList                    ## argument_list
    cArrayDeclarator                 ## array_declarator
    cAssignmentExpression            ## assignment_expression
    cAttribute                       ## attribute
    cAttributeDeclaration            ## attribute_declaration
    cAttributeSpecifier              ## attribute_specifier
    cAttributedDeclarator            ## attributed_declarator
    cAttributedStatement             ## attributed_statement
    cBinaryExpression                ## binary_expression
    cBitfieldClause                  ## bitfield_clause
    cBreakStatement                  ## break_statement
    cCallExpression                  ## call_expression
    cCaseStatement                   ## case_statement
    cCastExpression                  ## cast_expression
    cCharLiteral                     ## char_literal
    cCommaExpression                 ## comma_expression
    cCompoundLiteralExpression       ## compound_literal_expression
    cCompoundStatement               ## compound_statement
    cConcatenatedString              ## concatenated_string
    cConditionalExpression           ## conditional_expression
    cContinueStatement               ## continue_statement
    cDeclaration                     ## declaration
    cDeclarationList                 ## declaration_list
    cDoStatement                     ## do_statement
    cEnumSpecifier                   ## enum_specifier
    cEnumerator                      ## enumerator
    cEnumeratorList                  ## enumerator_list
    cExpressionStatement             ## expression_statement
    cFieldDeclaration                ## field_declaration
    cFieldDeclarationList            ## field_declaration_list
    cFieldDesignator                 ## field_designator
    cFieldExpression                 ## field_expression
    cForStatement                    ## for_statement
    cFunctionDeclarator              ## function_declarator
    cFunctionDefinition              ## function_definition
    cGotoStatement                   ## goto_statement
    cIfStatement                     ## if_statement
    cInitDeclarator                  ## init_declarator
    cInitializerList                 ## initializer_list
    cInitializerPair                 ## initializer_pair
    cLabeledStatement                ## labeled_statement
    cLinkageSpecification            ## linkage_specification
    cMacroTypeSpecifier              ## macro_type_specifier
    cMsBasedModifier                 ## ms_based_modifier
    cMsCallModifier                  ## ms_call_modifier
    cMsDeclspecModifier              ## ms_declspec_modifier
    cMsPointerModifier               ## ms_pointer_modifier
    cMsUnalignedPtrModifier          ## ms_unaligned_ptr_modifier
    cParameterDeclaration            ## parameter_declaration
    cParameterList                   ## parameter_list
    cParenthesizedDeclarator         ## parenthesized_declarator
    cParenthesizedExpression         ## parenthesized_expression
    cPointerDeclarator               ## pointer_declarator
    cPointerExpression               ## pointer_expression
    cPreprocCall                     ## preproc_call
    cPreprocDef                      ## preproc_def
    cPreprocDefined                  ## preproc_defined
    cPreprocElif                     ## preproc_elif
    cPreprocElse                     ## preproc_else
    cPreprocFunctionDef              ## preproc_function_def
    cPreprocIf                       ## preproc_if
    cPreprocIfdef                    ## preproc_ifdef
    cPreprocInclude                  ## preproc_include
    cPreprocParams                   ## preproc_params
    cReturnStatement                 ## return_statement
    cSizedTypeSpecifier              ## sized_type_specifier
    cSizeofExpression                ## sizeof_expression
    cStorageClassSpecifier           ## storage_class_specifier
    cStringLiteral                   ## string_literal
    cStructSpecifier                 ## struct_specifier
    cSubscriptDesignator             ## subscript_designator
    cSubscriptExpression             ## subscript_expression
    cSwitchStatement                 ## switch_statement
    cTranslationUnit                 ## translation_unit
    cTypeDefinition                  ## type_definition
    cTypeDescriptor                  ## type_descriptor
    cTypeQualifier                   ## type_qualifier
    cUnaryExpression                 ## unary_expression
    cUnionSpecifier                  ## union_specifier
    cUpdateExpression                ## update_expression
    cVariadicParameter               ## variadic_parameter
    cWhileStatement                  ## while_statement
    cNewlineTok                      ##
                                     ##
    cExclamationTok                  ## !
    cExclamationEqualTok             ## !=
    cQuoteTok                        ## "
    cHashdefineTok                   ## #define
    cHashelifTok                     ## #elif
    cHashelseTok                     ## #else
    cHashendifTok                    ## #endif
    cHashifTok                       ## #if
    cHashifdefTok                    ## #ifdef
    cHashifndefTok                   ## #ifndef
    cHashincludeTok                  ## #include
    cPercentTok                      ## %
    cPercentEqualTok                 ## %=
    cAmpersandTok                    ## &
    cDoubleAmpersandTok              ## &&
    cAmpersandEqualTok               ## &=
    cApostropheTok                   ## '
    cLParTok                         ## (
    cRParTok                         ## )
    cAsteriskTok                     ## *
    cAsteriskEqualTok                ## *=
    cPlusTok                         ## +
    cDoublePlusTok                   ## ++
    cPlusEqualTok                    ## +=
    cCommaTok                        ## ,
    cMinusTok                        ## -
    cDoubleMinusTok                  ## --
    cMinusEqualTok                   ## -=
    cMinusGreaterThanTok             ## ->
    cDotTok                          ## .
    cTripleDotTok                    ## ...
    cSlashTok                        ## /
    cSlashEqualTok                   ## /=
    cColonTok                        ## :
    cDoubleColonTok                  ## ::
    cSemicolonTok                    ## ;
    cLessThanTok                     ## <
    cDoubleLessThanTok               ## <<
    cDoubleLessThanEqualTok          ## <<=
    cLessThanEqualTok                ## <=
    cEqualTok                        ## =
    cDoubleEqualTok                  ## ==
    cGreaterThanTok                  ## >
    cGreaterThanEqualTok             ## >=
    cDoubleGreaterThanTok            ## >>
    cDoubleGreaterThanEqualTok       ## >>=
    cQuestionTok                     ## ?
    cLQuoteTok                       ## L"
    cLApostropheTok                  ## L'
    cUQuoteTok                       ## U"
    cUApostropheTok                  ## U'
    cLBrackTok                       ## [
    cDoubleLBrackTok                 ## [[
    cRBrackTok                       ## ]
    cDoubleRBrackTok                 ## ]]
    cAccentTok                       ## ^
    cAccentEqualTok                  ## ^=
    cAtomicTok                       ## _Atomic
    cAttributeTok                    ## __attribute__
    cBasedTok                        ## __based
    cCdeclTok                        ## __cdecl
    cClrcallTok                      ## __clrcall
    cDeclspecTok                     ## __declspec
    cFastcallTok                     ## __fastcall
    cStdcallTok                      ## __stdcall
    cThiscallTok                     ## __thiscall
    cUnalignedTok                    ## __unaligned
    cVectorcallTok                   ## __vectorcall
    cAutoTok                         ## auto
    cBreakTok                        ## break
    cCaseTok                         ## case
    cComment                         ## comment
    cConstTok                        ## const
    cContinueTok                     ## continue
    cDefaultTok                      ## default
    cDefinedTok                      ## defined
    cDoTok                           ## do
    cElseTok                         ## else
    cEnumTok                         ## enum
    cEscapeSequence                  ## escape_sequence
    cExternTok                       ## extern
    cFalse                           ## false
    cFieldIdentifier                 ## field_identifier
    cForTok                          ## for
    cGotoTok                         ## goto
    cIdentifier                      ## identifier
    cIfTok                           ## if
    cInlineTok                       ## inline
    cLongTok                         ## long
    cMsRestrictModifier              ## ms_restrict_modifier
    cMsSignedPtrModifier             ## ms_signed_ptr_modifier
    cMsUnsignedPtrModifier           ## ms_unsigned_ptr_modifier
    cNull                            ## null
    cNumberLiteral                   ## number_literal
    cPreprocArg                      ## preproc_arg
    cPreprocDirective                ## preproc_directive
    cPrimitiveType                   ## primitive_type
    cRegisterTok                     ## register
    cRestrictTok                     ## restrict
    cReturnTok                       ## return
    cShortTok                        ## short
    cSignedTok                       ## signed
    cSizeofTok                       ## sizeof
    cStatementIdentifier             ## statement_identifier
    cStaticTok                       ## static
    cStructTok                       ## struct
    cSwitchTok                       ## switch
    cSystemLibString                 ## system_lib_string
    cTrue                            ## true
    cTypeIdentifier                  ## type_identifier
    cTypedefTok                      ## typedef
    cU8QuoteTok                      ## u8"
    cU8ApostropheTok                 ## u8'
    cUnionTok                        ## union
    cUnsignedTok                     ## unsigned
    cVolatileTok                     ## volatile
    cWhileTok                        ## while
    cLCurlyTok                       ## {
    cPipeTok                         ## |
    cPipeEqualTok                    ## |=
    cDoublePipeTok                   ## ||
    cRCurlyTok                       ## }
    cTildeTok                        ## ~
    cSyntaxError                     ## Tree-sitter parser syntax error


proc strRepr*(kind: CNodeKind): string =
  case kind:
    of cAbstractDeclarator:              "_abstract_declarator"
    of cDeclarator:                      "_declarator"
    of cExpression:                      "_expression"
    of cFieldDeclarator:                 "_field_declarator"
    of cStatement:                       "_statement"
    of cTypeDeclarator:                  "_type_declarator"
    of cTypeSpecifier:                   "_type_specifier"
    of cAbstractArrayDeclarator:         "abstract_array_declarator"
    of cAbstractFunctionDeclarator:      "abstract_function_declarator"
    of cAbstractParenthesizedDeclarator: "abstract_parenthesized_declarator"
    of cAbstractPointerDeclarator:       "abstract_pointer_declarator"
    of cArgumentList:                    "argument_list"
    of cArrayDeclarator:                 "array_declarator"
    of cAssignmentExpression:            "assignment_expression"
    of cAttribute:                       "attribute"
    of cAttributeDeclaration:            "attribute_declaration"
    of cAttributeSpecifier:              "attribute_specifier"
    of cAttributedDeclarator:            "attributed_declarator"
    of cAttributedStatement:             "attributed_statement"
    of cBinaryExpression:                "binary_expression"
    of cBitfieldClause:                  "bitfield_clause"
    of cBreakStatement:                  "break_statement"
    of cCallExpression:                  "call_expression"
    of cCaseStatement:                   "case_statement"
    of cCastExpression:                  "cast_expression"
    of cCharLiteral:                     "char_literal"
    of cCommaExpression:                 "comma_expression"
    of cCompoundLiteralExpression:       "compound_literal_expression"
    of cCompoundStatement:               "compound_statement"
    of cConcatenatedString:              "concatenated_string"
    of cConditionalExpression:           "conditional_expression"
    of cContinueStatement:               "continue_statement"
    of cDeclaration:                     "declaration"
    of cDeclarationList:                 "declaration_list"
    of cDoStatement:                     "do_statement"
    of cEnumSpecifier:                   "enum_specifier"
    of cEnumerator:                      "enumerator"
    of cEnumeratorList:                  "enumerator_list"
    of cExpressionStatement:             "expression_statement"
    of cFieldDeclaration:                "field_declaration"
    of cFieldDeclarationList:            "field_declaration_list"
    of cFieldDesignator:                 "field_designator"
    of cFieldExpression:                 "field_expression"
    of cForStatement:                    "for_statement"
    of cFunctionDeclarator:              "function_declarator"
    of cFunctionDefinition:              "function_definition"
    of cGotoStatement:                   "goto_statement"
    of cIfStatement:                     "if_statement"
    of cInitDeclarator:                  "init_declarator"
    of cInitializerList:                 "initializer_list"
    of cInitializerPair:                 "initializer_pair"
    of cLabeledStatement:                "labeled_statement"
    of cLinkageSpecification:            "linkage_specification"
    of cMacroTypeSpecifier:              "macro_type_specifier"
    of cMsBasedModifier:                 "ms_based_modifier"
    of cMsCallModifier:                  "ms_call_modifier"
    of cMsDeclspecModifier:              "ms_declspec_modifier"
    of cMsPointerModifier:               "ms_pointer_modifier"
    of cMsUnalignedPtrModifier:          "ms_unaligned_ptr_modifier"
    of cParameterDeclaration:            "parameter_declaration"
    of cParameterList:                   "parameter_list"
    of cParenthesizedDeclarator:         "parenthesized_declarator"
    of cParenthesizedExpression:         "parenthesized_expression"
    of cPointerDeclarator:               "pointer_declarator"
    of cPointerExpression:               "pointer_expression"
    of cPreprocCall:                     "preproc_call"
    of cPreprocDef:                      "preproc_def"
    of cPreprocDefined:                  "preproc_defined"
    of cPreprocElif:                     "preproc_elif"
    of cPreprocElse:                     "preproc_else"
    of cPreprocFunctionDef:              "preproc_function_def"
    of cPreprocIf:                       "preproc_if"
    of cPreprocIfdef:                    "preproc_ifdef"
    of cPreprocInclude:                  "preproc_include"
    of cPreprocParams:                   "preproc_params"
    of cReturnStatement:                 "return_statement"
    of cSizedTypeSpecifier:              "sized_type_specifier"
    of cSizeofExpression:                "sizeof_expression"
    of cStorageClassSpecifier:           "storage_class_specifier"
    of cStringLiteral:                   "string_literal"
    of cStructSpecifier:                 "struct_specifier"
    of cSubscriptDesignator:             "subscript_designator"
    of cSubscriptExpression:             "subscript_expression"
    of cSwitchStatement:                 "switch_statement"
    of cTranslationUnit:                 "translation_unit"
    of cTypeDefinition:                  "type_definition"
    of cTypeDescriptor:                  "type_descriptor"
    of cTypeQualifier:                   "type_qualifier"
    of cUnaryExpression:                 "unary_expression"
    of cUnionSpecifier:                  "union_specifier"
    of cUpdateExpression:                "update_expression"
    of cVariadicParameter:               "variadic_parameter"
    of cWhileStatement:                  "while_statement"
    of cNewlineTok:                      "\x0A"
    of cExclamationTok:                  "!"
    of cExclamationEqualTok:             "!="
    of cQuoteTok:                        "\""
    of cHashdefineTok:                   "#define"
    of cHashelifTok:                     "#elif"
    of cHashelseTok:                     "#else"
    of cHashendifTok:                    "#endif"
    of cHashifTok:                       "#if"
    of cHashifdefTok:                    "#ifdef"
    of cHashifndefTok:                   "#ifndef"
    of cHashincludeTok:                  "#include"
    of cPercentTok:                      "%"
    of cPercentEqualTok:                 "%="
    of cAmpersandTok:                    "&"
    of cDoubleAmpersandTok:              "&&"
    of cAmpersandEqualTok:               "&="
    of cApostropheTok:                   "\'"
    of cLParTok:                         "("
    of cRParTok:                         ")"
    of cAsteriskTok:                     "*"
    of cAsteriskEqualTok:                "*="
    of cPlusTok:                         "+"
    of cDoublePlusTok:                   "++"
    of cPlusEqualTok:                    "+="
    of cCommaTok:                        ","
    of cMinusTok:                        "-"
    of cDoubleMinusTok:                  "--"
    of cMinusEqualTok:                   "-="
    of cMinusGreaterThanTok:             "->"
    of cDotTok:                          "."
    of cTripleDotTok:                    "..."
    of cSlashTok:                        "/"
    of cSlashEqualTok:                   "/="
    of cColonTok:                        ":"
    of cDoubleColonTok:                  "::"
    of cSemicolonTok:                    ";"
    of cLessThanTok:                     "<"
    of cDoubleLessThanTok:               "<<"
    of cDoubleLessThanEqualTok:          "<<="
    of cLessThanEqualTok:                "<="
    of cEqualTok:                        "="
    of cDoubleEqualTok:                  "=="
    of cGreaterThanTok:                  ">"
    of cGreaterThanEqualTok:             ">="
    of cDoubleGreaterThanTok:            ">>"
    of cDoubleGreaterThanEqualTok:       ">>="
    of cQuestionTok:                     "?"
    of cLQuoteTok:                       "L\""
    of cLApostropheTok:                  "L\'"
    of cUQuoteTok:                       "U\""
    of cUApostropheTok:                  "U\'"
    of cLBrackTok:                       "["
    of cDoubleLBrackTok:                 "[["
    of cRBrackTok:                       "]"
    of cDoubleRBrackTok:                 "]]"
    of cAccentTok:                       "^"
    of cAccentEqualTok:                  "^="
    of cAtomicTok:                       "_Atomic"
    of cAttributeTok:                    "__attribute__"
    of cBasedTok:                        "__based"
    of cCdeclTok:                        "__cdecl"
    of cClrcallTok:                      "__clrcall"
    of cDeclspecTok:                     "__declspec"
    of cFastcallTok:                     "__fastcall"
    of cStdcallTok:                      "__stdcall"
    of cThiscallTok:                     "__thiscall"
    of cUnalignedTok:                    "__unaligned"
    of cVectorcallTok:                   "__vectorcall"
    of cAutoTok:                         "auto"
    of cBreakTok:                        "break"
    of cCaseTok:                         "case"
    of cComment:                         "comment"
    of cConstTok:                        "const"
    of cContinueTok:                     "continue"
    of cDefaultTok:                      "default"
    of cDefinedTok:                      "defined"
    of cDoTok:                           "do"
    of cElseTok:                         "else"
    of cEnumTok:                         "enum"
    of cEscapeSequence:                  "escape_sequence"
    of cExternTok:                       "extern"
    of cFalse:                           "false"
    of cFieldIdentifier:                 "field_identifier"
    of cForTok:                          "for"
    of cGotoTok:                         "goto"
    of cIdentifier:                      "identifier"
    of cIfTok:                           "if"
    of cInlineTok:                       "inline"
    of cLongTok:                         "long"
    of cMsRestrictModifier:              "ms_restrict_modifier"
    of cMsSignedPtrModifier:             "ms_signed_ptr_modifier"
    of cMsUnsignedPtrModifier:           "ms_unsigned_ptr_modifier"
    of cNull:                            "null"
    of cNumberLiteral:                   "number_literal"
    of cPreprocArg:                      "preproc_arg"
    of cPreprocDirective:                "preproc_directive"
    of cPrimitiveType:                   "primitive_type"
    of cRegisterTok:                     "register"
    of cRestrictTok:                     "restrict"
    of cReturnTok:                       "return"
    of cShortTok:                        "short"
    of cSignedTok:                       "signed"
    of cSizeofTok:                       "sizeof"
    of cStatementIdentifier:             "statement_identifier"
    of cStaticTok:                       "static"
    of cStructTok:                       "struct"
    of cSwitchTok:                       "switch"
    of cSystemLibString:                 "system_lib_string"
    of cTrue:                            "true"
    of cTypeIdentifier:                  "type_identifier"
    of cTypedefTok:                      "typedef"
    of cU8QuoteTok:                      "u8\""
    of cU8ApostropheTok:                 "u8\'"
    of cUnionTok:                        "union"
    of cUnsignedTok:                     "unsigned"
    of cVolatileTok:                     "volatile"
    of cWhileTok:                        "while"
    of cLCurlyTok:                       "{"
    of cPipeTok:                         "|"
    of cPipeEqualTok:                    "|="
    of cDoublePipeTok:                   "||"
    of cRCurlyTok:                       "}"
    of cTildeTok:                        "~"
    of cSyntaxError:                     "ERROR"


type
  TsCNode* = distinct TSNode


type
  CParser* = distinct PtsParser


const cAllowedSubnodes*: array[CNodeKind, set[CNodeKind]] = block:
                                                              var tmp: array[CNodeKind, set[CNodeKind]]
                                                              tmp[cAbstractArrayDeclarator] = {cTypeQualifier}
                                                              tmp[cAbstractParenthesizedDeclarator] = {cAbstractDeclarator}
                                                              tmp[cAbstractPointerDeclarator] = {cTypeQualifier}
                                                              tmp[cArgumentList] = {cExpression, cPreprocDefined}
                                                              tmp[cArrayDeclarator] = {cTypeQualifier}
                                                              tmp[cAttribute] = {cArgumentList}
                                                              tmp[cAttributeDeclaration] = {cAttribute}
                                                              tmp[cAttributeSpecifier] = {cArgumentList}
                                                              tmp[cAttributedDeclarator] = {cDeclarator, cFieldDeclarator, cTypeDeclarator, cAttributeDeclaration}
                                                              tmp[cAttributedStatement] = {cStatement, cAttributeDeclaration}
                                                              tmp[cBitfieldClause] = {cExpression}
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
                                                                                          cStatement,
                                                                                          cTypeSpecifier,
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
                                                                                        cStatement,
                                                                                        cTypeSpecifier,
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
                                                              tmp[cExpressionStatement] = {cExpression, cCommaExpression}
                                                              tmp[cFieldDeclaration] = {cAttributeDeclaration, cAttributeSpecifier, cBitfieldClause, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cFieldDeclarationList] = {cFieldDeclaration, cPreprocCall, cPreprocDef, cPreprocFunctionDef, cPreprocIf, cPreprocIfdef}
                                                              tmp[cFieldDesignator] = {cFieldIdentifier}
                                                              tmp[cForStatement] = {cStatement}
                                                              tmp[cFunctionDeclarator] = {cAttributeSpecifier}
                                                              tmp[cFunctionDefinition] = {cAttributeDeclaration, cAttributeSpecifier, cMsCallModifier, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cInitializerList] = {cExpression, cInitializerList, cInitializerPair}
                                                              tmp[cLabeledStatement] = {cStatement}
                                                              tmp[cMsBasedModifier] = {cArgumentList}
                                                              tmp[cMsDeclspecModifier] = {cIdentifier}
                                                              tmp[cMsPointerModifier] = {cMsRestrictModifier, cMsSignedPtrModifier, cMsUnalignedPtrModifier, cMsUnsignedPtrModifier}
                                                              tmp[cParameterDeclaration] = {cAttributeDeclaration, cAttributeSpecifier, cMsDeclspecModifier, cStorageClassSpecifier, cTypeQualifier}
                                                              tmp[cParameterList] = {cParameterDeclaration, cVariadicParameter}
                                                              tmp[cParenthesizedDeclarator] = {cDeclarator, cFieldDeclarator, cTypeDeclarator}
                                                              tmp[cParenthesizedExpression] = {cExpression, cCommaExpression, cPreprocDefined}
                                                              tmp[cPointerDeclarator] = {cMsBasedModifier, cMsPointerModifier, cTypeQualifier}
                                                              tmp[cPreprocDefined] = {cIdentifier}
                                                              tmp[cPreprocElif] = {
                                                                                    cStatement,
                                                                                    cTypeSpecifier,
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
                                                                                    cStatement,
                                                                                    cTypeSpecifier,
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
                                                                                  cStatement,
                                                                                  cTypeSpecifier,
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
                                                                                     cStatement,
                                                                                     cTypeSpecifier,
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
                                                              tmp[cReturnStatement] = {cExpression, cCommaExpression}
                                                              tmp[cStringLiteral] = {cEscapeSequence}
                                                              tmp[cStructSpecifier] = {cMsDeclspecModifier}
                                                              tmp[cSubscriptDesignator] = {cExpression}
                                                              tmp[cTranslationUnit] = {
                                                                                        cStatement,
                                                                                        cTypeSpecifier,
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
                                       cAtomicTok,
                                       cAttributeTok,
                                       cBasedTok,
                                       cCdeclTok,
                                       cClrcallTok,
                                       cDeclspecTok,
                                       cFastcallTok,
                                       cStdcallTok,
                                       cThiscallTok,
                                       cUnalignedTok,
                                       cVectorcallTok,
                                       cUnalignedTok,
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

proc tsNodeType*(node: TsCNode): string



proc kind*(node: TsCNode): CNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_abstract_declarator":              cAbstractDeclarator
      of "_declarator":                       cDeclarator
      of "_expression":                       cExpression
      of "_field_declarator":                 cFieldDeclarator
      of "_statement":                        cStatement
      of "_type_declarator":                  cTypeDeclarator
      of "_type_specifier":                   cTypeSpecifier
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
      of "_Atomic":                           cAtomicTok
      of "__attribute__":                     cAttributeTok
      of "__based":                           cBasedTok
      of "__cdecl":                           cCdeclTok
      of "__clrcall":                         cClrcallTok
      of "__declspec":                        cDeclspecTok
      of "__fastcall":                        cFastcallTok
      of "__stdcall":                         cStdcallTok
      of "__thiscall":                        cThiscallTok
      of "__unaligned":                       cUnalignedTok
      of "__vectorcall":                      cVectorcallTok
      of "_unaligned":                        cUnalignedTok
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


