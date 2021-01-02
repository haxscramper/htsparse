
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  CppNodeKind* = enum
    cppAbstractDeclarator,  ## _abstract_declarator
    cppDeclarator,          ## _declarator
    cppExpression,          ## _expression
    cppFieldDeclarator,     ## _field_declarator
    cppStatement,           ## _statement
    cppTypeDeclarator,      ## _type_declarator
    cppTypeSpecifier,       ## _type_specifier
    cppAbstractArrayDeclarator, ## abstract_array_declarator
    cppAbstractFunctionDeclarator, ## abstract_function_declarator
    cppAbstractParenthesizedDeclarator, ## abstract_parenthesized_declarator
    cppAbstractPointerDeclarator, ## abstract_pointer_declarator
    cppAbstractReferenceDeclarator, ## abstract_reference_declarator
    cppAccessSpecifier,     ## access_specifier
    cppAliasDeclaration,    ## alias_declaration
    cppArgumentList,        ## argument_list
    cppArrayDeclarator,     ## array_declarator
    cppAssignmentExpression, ## assignment_expression
    cppAttribute,           ## attribute
    cppAttributeSpecifier,  ## attribute_specifier
    cppBaseClassClause,     ## base_class_clause
    cppBinaryExpression,    ## binary_expression
    cppBitfieldClause,      ## bitfield_clause
    cppBreakStatement,      ## break_statement
    cppCallExpression,      ## call_expression
    cppCaseStatement,       ## case_statement
    cppCastExpression,      ## cast_expression
    cppCatchClause,         ## catch_clause
    cppCharLiteral,         ## char_literal
    cppClassSpecifier,      ## class_specifier
    cppCommaExpression,     ## comma_expression
    cppCompoundLiteralExpression, ## compound_literal_expression
    cppCompoundStatement,   ## compound_statement
    cppConcatenatedString,  ## concatenated_string
    cppConditionClause,     ## condition_clause
    cppConditionalExpression, ## conditional_expression
    cppContinueStatement,   ## continue_statement
    cppDeclaration,         ## declaration
    cppDeclarationList,     ## declaration_list
    cppDecltype,            ## decltype
    cppDefaultMethodClause, ## default_method_clause
    cppDeleteExpression,    ## delete_expression
    cppDeleteMethodClause,  ## delete_method_clause
    cppDependentType,       ## dependent_type
    cppDestructorName,      ## destructor_name
    cppDoStatement,         ## do_statement
    cppEnumSpecifier,       ## enum_specifier
    cppEnumerator,          ## enumerator
    cppEnumeratorList,      ## enumerator_list
    cppExplicitFunctionSpecifier, ## explicit_function_specifier
    cppExpressionStatement, ## expression_statement
    cppFieldDeclaration,    ## field_declaration
    cppFieldDeclarationList, ## field_declaration_list
    cppFieldDesignator,     ## field_designator
    cppFieldExpression,     ## field_expression
    cppFieldInitializer,    ## field_initializer
    cppFieldInitializerList, ## field_initializer_list
    cppForRangeLoop,        ## for_range_loop
    cppForStatement,        ## for_statement
    cppFriendDeclaration,   ## friend_declaration
    cppFunctionDeclarator,  ## function_declarator
    cppFunctionDefinition,  ## function_definition
    cppGotoStatement,       ## goto_statement
    cppIfStatement,         ## if_statement
    cppInitDeclarator,      ## init_declarator
    cppInitializerList,     ## initializer_list
    cppInitializerPair,     ## initializer_pair
    cppLabeledStatement,    ## labeled_statement
    cppLambdaCaptureSpecifier, ## lambda_capture_specifier
    cppLambdaDefaultCapture, ## lambda_default_capture
    cppLambdaExpression,    ## lambda_expression
    cppLinkageSpecification, ## linkage_specification
    cppMsBasedModifier,     ## ms_based_modifier
    cppMsCallModifier,      ## ms_call_modifier
    cppMsDeclspecModifier,  ## ms_declspec_modifier
    cppMsPointerModifier,   ## ms_pointer_modifier
    cppMsUnalignedPtrModifier, ## ms_unaligned_ptr_modifier
    cppNamespaceDefinition, ## namespace_definition
    cppNewDeclarator,       ## new_declarator
    cppNewExpression,       ## new_expression
    cppNoexcept,            ## noexcept
    cppOperatorCast,        ## operator_cast
    cppOptionalParameterDeclaration, ## optional_parameter_declaration
    cppOptionalTypeParameterDeclaration, ## optional_type_parameter_declaration
    cppParameterDeclaration, ## parameter_declaration
    cppParameterList,       ## parameter_list
    cppParameterPackExpansion, ## parameter_pack_expansion
    cppParenthesizedDeclarator, ## parenthesized_declarator
    cppParenthesizedExpression, ## parenthesized_expression
    cppPointerDeclarator,   ## pointer_declarator
    cppPointerExpression,   ## pointer_expression
    cppPreprocCall,         ## preproc_call
    cppPreprocDef,          ## preproc_def
    cppPreprocDefined,      ## preproc_defined
    cppPreprocElif,         ## preproc_elif
    cppPreprocElse,         ## preproc_else
    cppPreprocFunctionDef,  ## preproc_function_def
    cppPreprocIf,           ## preproc_if
    cppPreprocIfdef,        ## preproc_ifdef
    cppPreprocInclude,      ## preproc_include
    cppPreprocParams,       ## preproc_params
    cppReferenceDeclarator, ## reference_declarator
    cppReturnStatement,     ## return_statement
    cppScopedFieldIdentifier, ## scoped_field_identifier
    cppScopedIdentifier,    ## scoped_identifier
    cppScopedNamespaceIdentifier, ## scoped_namespace_identifier
    cppScopedTypeIdentifier, ## scoped_type_identifier
    cppSizedTypeSpecifier,  ## sized_type_specifier
    cppSizeofExpression,    ## sizeof_expression
    cppStaticAssertDeclaration, ## static_assert_declaration
    cppStorageClassSpecifier, ## storage_class_specifier
    cppStringLiteral,       ## string_literal
    cppStructSpecifier,     ## struct_specifier
    cppStructuredBindingDeclarator, ## structured_binding_declarator
    cppSubscriptDesignator, ## subscript_designator
    cppSubscriptExpression, ## subscript_expression
    cppSwitchStatement,     ## switch_statement
    cppTemplateArgumentList, ## template_argument_list
    cppTemplateDeclaration, ## template_declaration
    cppTemplateFunction,    ## template_function
    cppTemplateInstantiation, ## template_instantiation
    cppTemplateMethod,      ## template_method
    cppTemplateParameterList, ## template_parameter_list
    cppTemplateTemplateParameterDeclaration, ## template_template_parameter_declaration
    cppTemplateType,        ## template_type
    cppThrowSpecifier,      ## throw_specifier
    cppThrowStatement,      ## throw_statement
    cppTrailingReturnType,  ## trailing_return_type
    cppTranslationUnit,     ## translation_unit
    cppTryStatement,        ## try_statement
    cppTypeDefinition,      ## type_definition
    cppTypeDescriptor,      ## type_descriptor
    cppTypeParameterDeclaration, ## type_parameter_declaration
    cppTypeQualifier,       ## type_qualifier
    cppUnaryExpression,     ## unary_expression
    cppUnionSpecifier,      ## union_specifier
    cppUpdateExpression,    ## update_expression
    cppUsingDeclaration,    ## using_declaration
    cppVariadicDeclarator,  ## variadic_declarator
    cppVariadicParameterDeclaration, ## variadic_parameter_declaration
    cppVariadicTypeParameterDeclaration, ## variadic_type_parameter_declaration
    cppVirtualFunctionSpecifier, ## virtual_function_specifier
    cppVirtualSpecifier,    ## virtual_specifier
    cppWhileStatement,      ## while_statement
    cppNewlineTok,          ## 
                             ## 
    cppExclamationTok,      ## !
    cppExclamationEqualTok, ## !=
    cppQuoteTok,            ## "
    cppHashdefineTok,       ## #define
    cppHashelifTok,         ## #elif
    cppHashelseTok,         ## #else
    cppHashendifTok,        ## #endif
    cppHashifTok,           ## #if
    cppHashifdefTok,        ## #ifdef
    cppHashifndefTok,       ## #ifndef
    cppHashincludeTok,      ## #include
    cppPercentTok,          ## %
    cppPercentEqualTok,     ## %=
    cppAmpersandTok,        ## &
    cppDoubleAmpersandTok,  ## &&
    cppAmpersandEqualTok,   ## &=
    cppApostropheTok,       ## '
    cppLParTok,             ## (
    cppRParTok,             ## )
    cppAsteriskTok,         ## *
    cppAsteriskEqualTok,    ## *=
    cppPlusTok,             ## +
    cppDoublePlusTok,       ## ++
    cppPlusEqualTok,        ## +=
    cppCommaTok,            ## ,
    cppMinusTok,            ## -
    cppDoubleMinusTok,      ## --
    cppMinusEqualTok,       ## -=
    cppMinusGreaterThanTok, ## ->
    cppDotTok,              ## .
    cppTripleDotTok,        ## ...
    cppSlashTok,            ## /
    cppSlashEqualTok,       ## /=
    cppColonTok,            ## :
    cppDoubleColonTok,      ## ::
    cppSemicolonTok,        ## ;
    cppLessThanTok,         ## <
    cppDoubleLessThanTok,   ## <<
    cppDoubleLessThanEqualTok, ## <<=
    cppLessThanEqualTok,    ## <=
    cppEqualTok,            ## =
    cppDoubleEqualTok,      ## ==
    cppGreaterThanTok,      ## >
    cppGreaterThanEqualTok, ## >=
    cppDoubleGreaterThanTok, ## >>
    cppDoubleGreaterThanEqualTok, ## >>=
    cppQuestionTok,         ## ?
    cppLQuoteTok,           ## L"
    cppLApostropheTok,      ## L'
    cppUQuoteTok,           ## U"
    cppUApostropheTok,      ## U'
    cppLBrackTok,           ## [
    cppDoubleLBrackTok,     ## [[
    cppRBrackTok,           ## ]
    cppDoubleRBrackTok,     ## ]]
    cppAccentTok,           ## ^
    cppAccentEqualTok,      ## ^=
    cppAtomicTok,           ## _Atomic
    cppAttributeTok,        ## __attribute__
    cppBasedTok,            ## __based
    cppCdeclTok,            ## __cdecl
    cppClrcallTok,          ## __clrcall
    cppDeclspecTok,         ## __declspec
    cppFastcallTok,         ## __fastcall
    cppStdcallTok,          ## __stdcall
    cppThiscallTok,         ## __thiscall
    cppUnalignedTok,        ## __unaligned
    cppVectorcallTok,       ## __vectorcall
    cppUnalignedTok2,       ## _unaligned
    cppAuto,                ## auto
    cppBreakTok,            ## break
    cppCaseTok,             ## case
    cppCatchTok,            ## catch
    cppClassTok,            ## class
    cppComment,             ## comment
    cppConstTok,            ## const
    cppConstexprTok,        ## constexpr
    cppContinueTok,         ## continue
    cppDecltypeTok,         ## decltype
    cppDefaultTok,          ## default
    cppDefinedTok,          ## defined
    cppDeleteTok,           ## delete
    cppDoTok,               ## do
    cppElseTok,             ## else
    cppEnumTok,             ## enum
    cppEscapeSequence,      ## escape_sequence
    cppExplicitTok,         ## explicit
    cppExternTok,           ## extern
    cppFalse,               ## false
    cppFieldIdentifier,     ## field_identifier
    cppFinalTok,            ## final
    cppForTok,              ## for
    cppFriendTok,           ## friend
    cppGotoTok,             ## goto
    cppIdentifier,          ## identifier
    cppIfTok,               ## if
    cppInlineTok,           ## inline
    cppLongTok,             ## long
    cppMsRestrictModifier,  ## ms_restrict_modifier
    cppMsSignedPtrModifier, ## ms_signed_ptr_modifier
    cppMsUnsignedPtrModifier, ## ms_unsigned_ptr_modifier
    cppMutableTok,          ## mutable
    cppNamespaceTok,        ## namespace
    cppNamespaceIdentifier, ## namespace_identifier
    cppNewTok,              ## new
    cppNoexceptTok,         ## noexcept
    cppNull,                ## null
    cppNullptr,             ## nullptr
    cppNumberLiteral,       ## number_literal
    cppOperatorTok,         ## operator
    cppOperatorName,        ## operator_name
    cppOverrideTok,         ## override
    cppPreprocArg,          ## preproc_arg
    cppPreprocDirective,    ## preproc_directive
    cppPrimitiveType,       ## primitive_type
    cppPrivateTok,          ## private
    cppProtectedTok,        ## protected
    cppPublicTok,           ## public
    cppRawStringLiteral,    ## raw_string_literal
    cppRegisterTok,         ## register
    cppRestrictTok,         ## restrict
    cppReturnTok,           ## return
    cppShortTok,            ## short
    cppSignedTok,           ## signed
    cppSizeofTok,           ## sizeof
    cppStatementIdentifier, ## statement_identifier
    cppStaticTok,           ## static
    cppStaticAssertTok,     ## static_assert
    cppStructTok,           ## struct
    cppSwitchTok,           ## switch
    cppSystemLibString,     ## system_lib_string
    cppTemplateTok,         ## template
    cppThis,                ## this
    cppThrowTok,            ## throw
    cppTrue,                ## true
    cppTryTok,              ## try
    cppTypeIdentifier,      ## type_identifier
    cppTypedefTok,          ## typedef
    cppTypenameTok,         ## typename
    cppUQuoteTok2,          ## u"
    cppUApostropheTok2,     ## u'
    cppU8QuoteTok,          ## u8"
    cppU8ApostropheTok,     ## u8'
    cppUnionTok,            ## union
    cppUnsignedTok,         ## unsigned
    cppUsingTok,            ## using
    cppVirtualTok,          ## virtual
    cppVolatileTok,         ## volatile
    cppWhileTok,            ## while
    cppLCurlyTok,           ## {
    cppPipeTok,             ## |
    cppPipeEqualTok,        ## |=
    cppDoublePipeTok,       ## ||
    cppRCurlyTok,           ## }
    cppTildeTok,            ## ~
    cppComment2,            ## comment
    cppSyntaxError           ## Tree-sitter parser syntax error
type
  CppExternalTok* = enum
    cppExternRaw_string_literal ## raw_string_literal
type
  CppNode* = distinct TSNode
type
  CppParser* = distinct PtsParser
proc tsNodeType*(node: CppNode): string
proc kind*(node: CppNode): CppNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_abstract_declarator":
      cppAbstractDeclarator
    of "_declarator":
      cppDeclarator
    of "_expression":
      cppExpression
    of "_field_declarator":
      cppFieldDeclarator
    of "_statement":
      cppStatement
    of "_type_declarator":
      cppTypeDeclarator
    of "_type_specifier":
      cppTypeSpecifier
    of "abstract_array_declarator":
      cppAbstractArrayDeclarator
    of "abstract_function_declarator":
      cppAbstractFunctionDeclarator
    of "abstract_parenthesized_declarator":
      cppAbstractParenthesizedDeclarator
    of "abstract_pointer_declarator":
      cppAbstractPointerDeclarator
    of "abstract_reference_declarator":
      cppAbstractReferenceDeclarator
    of "access_specifier":
      cppAccessSpecifier
    of "alias_declaration":
      cppAliasDeclaration
    of "argument_list":
      cppArgumentList
    of "array_declarator":
      cppArrayDeclarator
    of "assignment_expression":
      cppAssignmentExpression
    of "attribute":
      cppAttribute
    of "attribute_specifier":
      cppAttributeSpecifier
    of "base_class_clause":
      cppBaseClassClause
    of "binary_expression":
      cppBinaryExpression
    of "bitfield_clause":
      cppBitfieldClause
    of "break_statement":
      cppBreakStatement
    of "call_expression":
      cppCallExpression
    of "case_statement":
      cppCaseStatement
    of "cast_expression":
      cppCastExpression
    of "catch_clause":
      cppCatchClause
    of "char_literal":
      cppCharLiteral
    of "class_specifier":
      cppClassSpecifier
    of "comma_expression":
      cppCommaExpression
    of "compound_literal_expression":
      cppCompoundLiteralExpression
    of "compound_statement":
      cppCompoundStatement
    of "concatenated_string":
      cppConcatenatedString
    of "condition_clause":
      cppConditionClause
    of "conditional_expression":
      cppConditionalExpression
    of "continue_statement":
      cppContinueStatement
    of "declaration":
      cppDeclaration
    of "declaration_list":
      cppDeclarationList
    of "decltype":
      cppDecltype
    of "default_method_clause":
      cppDefaultMethodClause
    of "delete_expression":
      cppDeleteExpression
    of "delete_method_clause":
      cppDeleteMethodClause
    of "dependent_type":
      cppDependentType
    of "destructor_name":
      cppDestructorName
    of "do_statement":
      cppDoStatement
    of "enum_specifier":
      cppEnumSpecifier
    of "enumerator":
      cppEnumerator
    of "enumerator_list":
      cppEnumeratorList
    of "explicit_function_specifier":
      cppExplicitFunctionSpecifier
    of "expression_statement":
      cppExpressionStatement
    of "field_declaration":
      cppFieldDeclaration
    of "field_declaration_list":
      cppFieldDeclarationList
    of "field_designator":
      cppFieldDesignator
    of "field_expression":
      cppFieldExpression
    of "field_initializer":
      cppFieldInitializer
    of "field_initializer_list":
      cppFieldInitializerList
    of "for_range_loop":
      cppForRangeLoop
    of "for_statement":
      cppForStatement
    of "friend_declaration":
      cppFriendDeclaration
    of "function_declarator":
      cppFunctionDeclarator
    of "function_definition":
      cppFunctionDefinition
    of "goto_statement":
      cppGotoStatement
    of "if_statement":
      cppIfStatement
    of "init_declarator":
      cppInitDeclarator
    of "initializer_list":
      cppInitializerList
    of "initializer_pair":
      cppInitializerPair
    of "labeled_statement":
      cppLabeledStatement
    of "lambda_capture_specifier":
      cppLambdaCaptureSpecifier
    of "lambda_default_capture":
      cppLambdaDefaultCapture
    of "lambda_expression":
      cppLambdaExpression
    of "linkage_specification":
      cppLinkageSpecification
    of "ms_based_modifier":
      cppMsBasedModifier
    of "ms_call_modifier":
      cppMsCallModifier
    of "ms_declspec_modifier":
      cppMsDeclspecModifier
    of "ms_pointer_modifier":
      cppMsPointerModifier
    of "ms_unaligned_ptr_modifier":
      cppMsUnalignedPtrModifier
    of "namespace_definition":
      cppNamespaceDefinition
    of "new_declarator":
      cppNewDeclarator
    of "new_expression":
      cppNewExpression
    of "noexcept":
      cppNoexcept
    of "operator_cast":
      cppOperatorCast
    of "optional_parameter_declaration":
      cppOptionalParameterDeclaration
    of "optional_type_parameter_declaration":
      cppOptionalTypeParameterDeclaration
    of "parameter_declaration":
      cppParameterDeclaration
    of "parameter_list":
      cppParameterList
    of "parameter_pack_expansion":
      cppParameterPackExpansion
    of "parenthesized_declarator":
      cppParenthesizedDeclarator
    of "parenthesized_expression":
      cppParenthesizedExpression
    of "pointer_declarator":
      cppPointerDeclarator
    of "pointer_expression":
      cppPointerExpression
    of "preproc_call":
      cppPreprocCall
    of "preproc_def":
      cppPreprocDef
    of "preproc_defined":
      cppPreprocDefined
    of "preproc_elif":
      cppPreprocElif
    of "preproc_else":
      cppPreprocElse
    of "preproc_function_def":
      cppPreprocFunctionDef
    of "preproc_if":
      cppPreprocIf
    of "preproc_ifdef":
      cppPreprocIfdef
    of "preproc_include":
      cppPreprocInclude
    of "preproc_params":
      cppPreprocParams
    of "reference_declarator":
      cppReferenceDeclarator
    of "return_statement":
      cppReturnStatement
    of "scoped_field_identifier":
      cppScopedFieldIdentifier
    of "scoped_identifier":
      cppScopedIdentifier
    of "scoped_namespace_identifier":
      cppScopedNamespaceIdentifier
    of "scoped_type_identifier":
      cppScopedTypeIdentifier
    of "sized_type_specifier":
      cppSizedTypeSpecifier
    of "sizeof_expression":
      cppSizeofExpression
    of "static_assert_declaration":
      cppStaticAssertDeclaration
    of "storage_class_specifier":
      cppStorageClassSpecifier
    of "string_literal":
      cppStringLiteral
    of "struct_specifier":
      cppStructSpecifier
    of "structured_binding_declarator":
      cppStructuredBindingDeclarator
    of "subscript_designator":
      cppSubscriptDesignator
    of "subscript_expression":
      cppSubscriptExpression
    of "switch_statement":
      cppSwitchStatement
    of "template_argument_list":
      cppTemplateArgumentList
    of "template_declaration":
      cppTemplateDeclaration
    of "template_function":
      cppTemplateFunction
    of "template_instantiation":
      cppTemplateInstantiation
    of "template_method":
      cppTemplateMethod
    of "template_parameter_list":
      cppTemplateParameterList
    of "template_template_parameter_declaration":
      cppTemplateTemplateParameterDeclaration
    of "template_type":
      cppTemplateType
    of "throw_specifier":
      cppThrowSpecifier
    of "throw_statement":
      cppThrowStatement
    of "trailing_return_type":
      cppTrailingReturnType
    of "translation_unit":
      cppTranslationUnit
    of "try_statement":
      cppTryStatement
    of "type_definition":
      cppTypeDefinition
    of "type_descriptor":
      cppTypeDescriptor
    of "type_parameter_declaration":
      cppTypeParameterDeclaration
    of "type_qualifier":
      cppTypeQualifier
    of "unary_expression":
      cppUnaryExpression
    of "union_specifier":
      cppUnionSpecifier
    of "update_expression":
      cppUpdateExpression
    of "using_declaration":
      cppUsingDeclaration
    of "variadic_declarator":
      cppVariadicDeclarator
    of "variadic_parameter_declaration":
      cppVariadicParameterDeclaration
    of "variadic_type_parameter_declaration":
      cppVariadicTypeParameterDeclaration
    of "virtual_function_specifier":
      cppVirtualFunctionSpecifier
    of "virtual_specifier":
      cppVirtualSpecifier
    of "while_statement":
      cppWhileStatement
    of "\n":
      cppNewlineTok
    of "!":
      cppExclamationTok
    of "!=":
      cppExclamationEqualTok
    of "\"":
      cppQuoteTok
    of "#define":
      cppHashdefineTok
    of "#elif":
      cppHashelifTok
    of "#else":
      cppHashelseTok
    of "#endif":
      cppHashendifTok
    of "#if":
      cppHashifTok
    of "#ifdef":
      cppHashifdefTok
    of "#ifndef":
      cppHashifndefTok
    of "#include":
      cppHashincludeTok
    of "%":
      cppPercentTok
    of "%=":
      cppPercentEqualTok
    of "&":
      cppAmpersandTok
    of "&&":
      cppDoubleAmpersandTok
    of "&=":
      cppAmpersandEqualTok
    of "\'":
      cppApostropheTok
    of "(":
      cppLParTok
    of ")":
      cppRParTok
    of "*":
      cppAsteriskTok
    of "*=":
      cppAsteriskEqualTok
    of "+":
      cppPlusTok
    of "++":
      cppDoublePlusTok
    of "+=":
      cppPlusEqualTok
    of ",":
      cppCommaTok
    of "-":
      cppMinusTok
    of "--":
      cppDoubleMinusTok
    of "-=":
      cppMinusEqualTok
    of "->":
      cppMinusGreaterThanTok
    of ".":
      cppDotTok
    of "...":
      cppTripleDotTok
    of "/":
      cppSlashTok
    of "/=":
      cppSlashEqualTok
    of ":":
      cppColonTok
    of "::":
      cppDoubleColonTok
    of ";":
      cppSemicolonTok
    of "<":
      cppLessThanTok
    of "<<":
      cppDoubleLessThanTok
    of "<<=":
      cppDoubleLessThanEqualTok
    of "<=":
      cppLessThanEqualTok
    of "=":
      cppEqualTok
    of "==":
      cppDoubleEqualTok
    of ">":
      cppGreaterThanTok
    of ">=":
      cppGreaterThanEqualTok
    of ">>":
      cppDoubleGreaterThanTok
    of ">>=":
      cppDoubleGreaterThanEqualTok
    of "?":
      cppQuestionTok
    of "L\"":
      cppLQuoteTok
    of "L\'":
      cppLApostropheTok
    of "U\"":
      cppUQuoteTok2
    of "U\'":
      cppUApostropheTok2
    of "[":
      cppLBrackTok
    of "[[":
      cppDoubleLBrackTok
    of "]":
      cppRBrackTok
    of "]]":
      cppDoubleRBrackTok
    of "^":
      cppAccentTok
    of "^=":
      cppAccentEqualTok
    of "_Atomic":
      cppAtomicTok
    of "__attribute__":
      cppAttributeTok
    of "__based":
      cppBasedTok
    of "__cdecl":
      cppCdeclTok
    of "__clrcall":
      cppClrcallTok
    of "__declspec":
      cppDeclspecTok
    of "__fastcall":
      cppFastcallTok
    of "__stdcall":
      cppStdcallTok
    of "__thiscall":
      cppThiscallTok
    of "__unaligned":
      cppUnalignedTok2
    of "__vectorcall":
      cppVectorcallTok
    of "_unaligned":
      cppUnalignedTok2
    of "auto":
      cppAuto
    of "break":
      cppBreakTok
    of "case":
      cppCaseTok
    of "catch":
      cppCatchTok
    of "class":
      cppClassTok
    of "comment":
      cppComment2
    of "const":
      cppConstTok
    of "constexpr":
      cppConstexprTok
    of "continue":
      cppContinueTok
    of "default":
      cppDefaultTok
    of "defined":
      cppDefinedTok
    of "delete":
      cppDeleteTok
    of "do":
      cppDoTok
    of "else":
      cppElseTok
    of "enum":
      cppEnumTok
    of "escape_sequence":
      cppEscapeSequence
    of "explicit":
      cppExplicitTok
    of "extern":
      cppExternTok
    of "false":
      cppFalse
    of "field_identifier":
      cppFieldIdentifier
    of "final":
      cppFinalTok
    of "for":
      cppForTok
    of "friend":
      cppFriendTok
    of "goto":
      cppGotoTok
    of "identifier":
      cppIdentifier
    of "if":
      cppIfTok
    of "inline":
      cppInlineTok
    of "long":
      cppLongTok
    of "ms_restrict_modifier":
      cppMsRestrictModifier
    of "ms_signed_ptr_modifier":
      cppMsSignedPtrModifier
    of "ms_unsigned_ptr_modifier":
      cppMsUnsignedPtrModifier
    of "mutable":
      cppMutableTok
    of "namespace":
      cppNamespaceTok
    of "namespace_identifier":
      cppNamespaceIdentifier
    of "new":
      cppNewTok
    of "null":
      cppNull
    of "nullptr":
      cppNullptr
    of "number_literal":
      cppNumberLiteral
    of "operator":
      cppOperatorTok
    of "operator_name":
      cppOperatorName
    of "override":
      cppOverrideTok
    of "preproc_arg":
      cppPreprocArg
    of "preproc_directive":
      cppPreprocDirective
    of "primitive_type":
      cppPrimitiveType
    of "private":
      cppPrivateTok
    of "protected":
      cppProtectedTok
    of "public":
      cppPublicTok
    of "raw_string_literal":
      cppRawStringLiteral
    of "register":
      cppRegisterTok
    of "restrict":
      cppRestrictTok
    of "return":
      cppReturnTok
    of "short":
      cppShortTok
    of "signed":
      cppSignedTok
    of "sizeof":
      cppSizeofTok
    of "statement_identifier":
      cppStatementIdentifier
    of "static":
      cppStaticTok
    of "static_assert":
      cppStaticAssertTok
    of "struct":
      cppStructTok
    of "switch":
      cppSwitchTok
    of "system_lib_string":
      cppSystemLibString
    of "template":
      cppTemplateTok
    of "this":
      cppThis
    of "throw":
      cppThrowTok
    of "true":
      cppTrue
    of "try":
      cppTryTok
    of "type_identifier":
      cppTypeIdentifier
    of "typedef":
      cppTypedefTok
    of "typename":
      cppTypenameTok
    of "u\"":
      cppUQuoteTok2
    of "u\'":
      cppUApostropheTok2
    of "u8\"":
      cppU8QuoteTok
    of "u8\'":
      cppU8ApostropheTok
    of "union":
      cppUnionTok
    of "unsigned":
      cppUnsignedTok
    of "using":
      cppUsingTok
    of "virtual":
      cppVirtualTok
    of "volatile":
      cppVolatileTok
    of "while":
      cppWhileTok
    of "{":
      cppLCurlyTok
    of "|":
      cppPipeTok
    of "|=":
      cppPipeEqualTok
    of "||":
      cppDoublePipeTok
    of "}":
      cppRCurlyTok
    of "~":
      cppTildeTok
    of "ERROR":
      cppSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_cpp(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: CppNode): string =
  $ts_node_type(TSNode(node))

proc newCppParser*(): CppParser =
  result = CppParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_cpp())

proc parseString*(parser: CppParser; str: string): CppNode =
  CppNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseCppString*(str: string): CppNode =
  let parser = newCppParser()
  return parseString(parser, str)

func `[]`*(node: CppNode; idx: int; withUnnamed: bool = false): CppNode =
  if withUnnamed:
    CppNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    CppNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: CppNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: CppNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: CppNode; withUnnamed: bool = false): CppNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: CppNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: CppNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: CppNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
