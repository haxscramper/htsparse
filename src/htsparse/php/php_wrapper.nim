
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  PhpNodeKind* = enum
    phpExpression,          ## _expression
    phpLiteral,             ## _literal
    phpPrimaryExpression,   ## _primary_expression
    phpStatement,           ## _statement
    phpType,                ## _type
    phpAnonymousFunctionCreationExpression, ## anonymous_function_creation_expression
    phpAnonymousFunctionUseClause, ## anonymous_function_use_clause
    phpArguments,           ## arguments
    phpArrayCreationExpression, ## array_creation_expression
    phpArrayElementInitializer, ## array_element_initializer
    phpAssignmentExpression, ## assignment_expression
    phpAugmentedAssignmentExpression, ## augmented_assignment_expression
    phpBaseClause,          ## base_clause
    phpBinaryExpression,    ## binary_expression
    phpBreakStatement,      ## break_statement
    phpCaseStatement,       ## case_statement
    phpCastExpression,      ## cast_expression
    phpCastType,            ## cast_type
    phpCatchClause,         ## catch_clause
    phpClassConstantAccessExpression, ## class_constant_access_expression
    phpClassDeclaration,    ## class_declaration
    phpClassInterfaceClause, ## class_interface_clause
    phpClassModifier,       ## class_modifier
    phpCloneExpression,     ## clone_expression
    phpColonBlock,          ## colon_block
    phpCompoundStatement,   ## compound_statement
    phpConditionalExpression, ## conditional_expression
    phpConstDeclaration,    ## const_declaration
    phpConstElement,        ## const_element
    phpContinueStatement,   ## continue_statement
    phpDeclarationList,     ## declaration_list
    phpDeclareDirective,    ## declare_directive
    phpDeclareStatement,    ## declare_statement
    phpDefaultStatement,    ## default_statement
    phpDoStatement,         ## do_statement
    phpDynamicVariableName, ## dynamic_variable_name
    phpEchoStatement,       ## echo_statement
    phpElseClause,          ## else_clause
    phpElseIfClause,        ## else_if_clause
    phpEmptyStatement,      ## empty_statement
    phpExponentiationExpression, ## exponentiation_expression
    phpExpressionStatement, ## expression_statement
    phpFinallyClause,       ## finally_clause
    phpForStatement,        ## for_statement
    phpForeachStatement,    ## foreach_statement
    phpFormalParameters,    ## formal_parameters
    phpFunctionCallExpression, ## function_call_expression
    phpFunctionDefinition,  ## function_definition
    phpFunctionStaticDeclaration, ## function_static_declaration
    phpGlobalDeclaration,   ## global_declaration
    phpGotoStatement,       ## goto_statement
    phpIfStatement,         ## if_statement
    phpIncludeExpression,   ## include_expression
    phpIncludeOnceExpression, ## include_once_expression
    phpInterfaceDeclaration, ## interface_declaration
    phpListLiteral,         ## list_literal
    phpMemberAccessExpression, ## member_access_expression
    phpMemberCallExpression, ## member_call_expression
    phpMethodDeclaration,   ## method_declaration
    phpName,                ## name
    phpNamedLabelStatement, ## named_label_statement
    phpNamespaceAliasingClause, ## namespace_aliasing_clause
    phpNamespaceDefinition, ## namespace_definition
    phpNamespaceName,       ## namespace_name
    phpNamespaceNameAsPrefix, ## namespace_name_as_prefix
    phpNamespaceUseClause,  ## namespace_use_clause
    phpNamespaceUseDeclaration, ## namespace_use_declaration
    phpNamespaceUseGroup,   ## namespace_use_group
    phpNamespaceUseGroupClause, ## namespace_use_group_clause
    phpObjectCreationExpression, ## object_creation_expression
    phpOptionalType,        ## optional_type
    phpPair,                ## pair
    phpParenthesizedExpression, ## parenthesized_expression
    phpPrimitiveType,       ## primitive_type
    phpPrintIntrinsic,      ## print_intrinsic
    phpProgram,             ## program
    phpPropertyDeclaration, ## property_declaration
    phpPropertyElement,     ## property_element
    phpPropertyInitializer, ## property_initializer
    phpQualifiedName,       ## qualified_name
    phpRelativeScope,       ## relative_scope
    phpRequireExpression,   ## require_expression
    phpRequireOnceExpression, ## require_once_expression
    phpReturnStatement,     ## return_statement
    phpScopedCallExpression, ## scoped_call_expression
    phpScopedPropertyAccessExpression, ## scoped_property_access_expression
    phpSequenceExpression,  ## sequence_expression
    phpSimpleParameter,     ## simple_parameter
    phpStaticModifier,      ## static_modifier
    phpStaticVariableDeclaration, ## static_variable_declaration
    phpSubscriptExpression, ## subscript_expression
    phpSwitchBlock,         ## switch_block
    phpSwitchStatement,     ## switch_statement
    phpText,                ## text
    phpTextInterpolation,   ## text_interpolation
    phpThrowStatement,      ## throw_statement
    phpTraitDeclaration,    ## trait_declaration
    phpTryStatement,        ## try_statement
    phpTypeName,            ## type_name
    phpUnaryOpExpression,   ## unary_op_expression
    phpUnsetStatement,      ## unset_statement
    phpUpdateExpression,    ## update_expression
    phpUseAsClause,         ## use_as_clause
    phpUseDeclaration,      ## use_declaration
    phpUseInsteadOfClause,  ## use_instead_of_clause
    phpUseList,             ## use_list
    phpVariableName,        ## variable_name
    phpVariadicParameter,   ## variadic_parameter
    phpVariadicUnpacking,   ## variadic_unpacking
    phpVisibilityModifier,  ## visibility_modifier
    phpWhileStatement,      ## while_statement
    phpYieldExpression,     ## yield_expression
    phpSingleExclamationTok, ## !
    phpSingleExclamationSingleEqualTok, ## !=
    phpSingleExclamationDoubleEqualTok, ## !==
    phpSingleDollarTok,     ## $
    phpSinglePercentTok,    ## %
    phpSinglePercentSingleEqualTok, ## %=
    phpSingleAmpersandTok,  ## &
    phpDoubleAmpersandTok,  ## &&
    phpSingleAmpersandSingleEqualTok, ## &=
    phpSingleLParTok,       ## (
    phpSingleRParTok,       ## )
    phpSingleAsteriskTok,   ## *
    phpDoubleAsteriskTok,   ## **
    phpDoubleAsteriskSingleEqualTok, ## **=
    phpSingleAsteriskSingleEqualTok, ## *=
    phpSinglePlusTok,       ## +
    phpDoublePlusTok,       ## ++
    phpSinglePlusSingleEqualTok, ## +=
    phpSingleCommaTok,      ## ,
    phpSingleMinusTok,      ## -
    phpDoubleMinusTok,      ## --
    phpSingleMinusSingleEqualTok, ## -=
    phpSingleMinusSingleGreaterThanTok, ## ->
    phpSingleDotTok,        ## .
    phpTripleDotTok,        ## ...
    phpSingleDotSingleEqualTok, ## .=
    phpSingleSlashTok,      ## /
    phpSingleSlashSingleEqualTok, ## /=
    phpSingleColonTok,      ## :
    phpDoubleColonTok,      ## ::
    phpSingleSemicolonTok,  ## ;
    phpSingleLessThanTok,   ## <
    phpDoubleLessThanTok,   ## <<
    phpDoubleLessThanSingleEqualTok, ## <<=
    phpSingleLessThanSingleEqualTok, ## <=
    phpSingleLessThanSingleEqualSingleGreaterThanTok, ## <=>
    phpSingleLessThanSingleGreaterThanTok, ## <>
    phpSingleEqualTok,      ## =
    phpDoubleEqualTok,      ## ==
    phpTripleEqualTok,      ## ===
    phpSingleEqualSingleGreaterThanTok, ## =>
    phpSingleGreaterThanTok, ## >
    phpSingleGreaterThanSingleEqualTok, ## >=
    phpDoubleGreaterThanTok, ## >>
    phpDoubleGreaterThanSingleEqualTok, ## >>=
    phpSingleQuestionTok,   ## ?
    phpSingleQuestionSingleGreaterThanTok, ## ?>
    phpDoubleQuestionTok,   ## ??
    phpSingleAtTok,         ## @
    phpSingleLBrackTok,     ## [
    phpSingleBackslashTok,  ## \
    phpSingleRBrackTok,     ## ]
    phpSingleAccentTok,     ## ^
    phpSingleAccentSingleEqualTok, ## ^=
    phpAbstractTok,         ## abstract
    phpAndTok,              ## and
    phpArrayTok,            ## array
    phpAsTok,               ## as
    phpBinaryTok,           ## binary
    phpBoolTok,             ## bool
    phpBoolean,             ## boolean
    phpBooleanTok,          ## boolean
    phpBreakTok,            ## break
    phpCallableTok,         ## callable
    phpCaseTok,             ## case
    phpCatchTok,            ## catch
    phpClassTok,            ## class
    phpCloneTok,            ## clone
    phpComment,             ## comment
    phpConstTok,            ## const
    phpContinueTok,         ## continue
    phpDeclareTok,          ## declare
    phpDefaultTok,          ## default
    phpDoTok,               ## do
    phpDoubleTok,           ## double
    phpEchoTok,             ## echo
    phpElseTok,             ## else
    phpElseifTok,           ## elseif
    phpEncodingTok,         ## encoding
    phpEnddeclareTok,       ## enddeclare
    phpEndforTok,           ## endfor
    phpEndforeachTok,       ## endforeach
    phpEndifTok,            ## endif
    phpEndswitchTok,        ## endswitch
    phpEndwhileTok,         ## endwhile
    phpExtendsTok,          ## extends
    phpFinalTok,            ## final
    phpFinallyTok,          ## finally
    phpFloatTok,            ## float
    phpFloat,               ## float
    phpForTok,              ## for
    phpForeachTok,          ## foreach
    phpFromTok,             ## from
    phpFunctionTok,         ## function
    phpGlobalTok,           ## global
    phpGotoTok,             ## goto
    phpHeredoc,             ## heredoc
    phpIfTok,               ## if
    phpImplementsTok,       ## implements
    phpIncludeTok,          ## include
    phpIncludeOnceTok,      ## include_once
    phpInstanceofTok,       ## instanceof
    phpInsteadofTok,        ## insteadof
    phpIntTok,              ## int
    phpIntegerTok,          ## integer
    phpInteger,             ## integer
    phpInterfaceTok,        ## interface
    phpIterableTok,         ## iterable
    phpListTok,             ## list
    phpNamespaceTok,        ## namespace
    phpNewTok,              ## new
    phpNull,                ## null
    phpObjectTok,           ## object
    phpOrTok,               ## or
    phpParentTok,           ## parent
    phpPhpTag,              ## php_tag
    phpPrintTok,            ## print
    phpPrivateTok,          ## private
    phpProtectedTok,        ## protected
    phpPublicTok,           ## public
    phpRealTok,             ## real
    phpRequireTok,          ## require
    phpRequireOnceTok,      ## require_once
    phpReturnTok,           ## return
    phpSelfTok,             ## self
    phpShellCommandExpression, ## shell_command_expression
    phpStaticTok,           ## static
    phpStrictTypesTok,      ## strict_types
    phpStringTok,           ## string
    phpString,              ## string
    phpSwitchTok,           ## switch
    phpThrowTok,            ## throw
    phpTicksTok,            ## ticks
    phpTraitTok,            ## trait
    phpTryTok,              ## try
    phpUnsetTok,            ## unset
    phpUseTok,              ## use
    phpVarModifier,         ## var_modifier
    phpVoidTok,             ## void
    phpWhileTok,            ## while
    phpXorTok,              ## xor
    phpYieldTok,            ## yield
    phpSingleLCurlyTok,     ## {
    phpSinglePipeTok,       ## |
    phpSinglePipeSingleEqualTok, ## |=
    phpDoublePipeTok,       ## ||
    phpSingleRCurlyTok,     ## }
    phpSingleTildeTok,      ## ~
    phpSyntaxError           ## Tree-sitter parser syntax error
type
  PhpExternalTok* = enum
    phpExtern_automatic_semicolon, ## _automatic_semicolon
    phpExternHeredoc,       ## heredoc
    phpExtern_eof            ## _eof
type
  PhpNode* = distinct TSNode
type
  PhpParser* = distinct PtsParser
proc tsNodeType*(node: PhpNode): string
proc kind*(node: PhpNode): PhpNodeKind =
  case node.tsNodeType
  of "_expression":
    phpExpression
  of "_literal":
    phpLiteral
  of "_primary_expression":
    phpPrimaryExpression
  of "_statement":
    phpStatement
  of "_type":
    phpType
  of "anonymous_function_creation_expression":
    phpAnonymousFunctionCreationExpression
  of "anonymous_function_use_clause":
    phpAnonymousFunctionUseClause
  of "arguments":
    phpArguments
  of "array_creation_expression":
    phpArrayCreationExpression
  of "array_element_initializer":
    phpArrayElementInitializer
  of "assignment_expression":
    phpAssignmentExpression
  of "augmented_assignment_expression":
    phpAugmentedAssignmentExpression
  of "base_clause":
    phpBaseClause
  of "binary_expression":
    phpBinaryExpression
  of "break_statement":
    phpBreakStatement
  of "case_statement":
    phpCaseStatement
  of "cast_expression":
    phpCastExpression
  of "cast_type":
    phpCastType
  of "catch_clause":
    phpCatchClause
  of "class_constant_access_expression":
    phpClassConstantAccessExpression
  of "class_declaration":
    phpClassDeclaration
  of "class_interface_clause":
    phpClassInterfaceClause
  of "class_modifier":
    phpClassModifier
  of "clone_expression":
    phpCloneExpression
  of "colon_block":
    phpColonBlock
  of "compound_statement":
    phpCompoundStatement
  of "conditional_expression":
    phpConditionalExpression
  of "const_declaration":
    phpConstDeclaration
  of "const_element":
    phpConstElement
  of "continue_statement":
    phpContinueStatement
  of "declaration_list":
    phpDeclarationList
  of "declare_directive":
    phpDeclareDirective
  of "declare_statement":
    phpDeclareStatement
  of "default_statement":
    phpDefaultStatement
  of "do_statement":
    phpDoStatement
  of "dynamic_variable_name":
    phpDynamicVariableName
  of "echo_statement":
    phpEchoStatement
  of "else_clause":
    phpElseClause
  of "else_if_clause":
    phpElseIfClause
  of "empty_statement":
    phpEmptyStatement
  of "exponentiation_expression":
    phpExponentiationExpression
  of "expression_statement":
    phpExpressionStatement
  of "finally_clause":
    phpFinallyClause
  of "for_statement":
    phpForStatement
  of "foreach_statement":
    phpForeachStatement
  of "formal_parameters":
    phpFormalParameters
  of "function_call_expression":
    phpFunctionCallExpression
  of "function_definition":
    phpFunctionDefinition
  of "function_static_declaration":
    phpFunctionStaticDeclaration
  of "global_declaration":
    phpGlobalDeclaration
  of "goto_statement":
    phpGotoStatement
  of "if_statement":
    phpIfStatement
  of "include_expression":
    phpIncludeExpression
  of "include_once_expression":
    phpIncludeOnceExpression
  of "interface_declaration":
    phpInterfaceDeclaration
  of "list_literal":
    phpListLiteral
  of "member_access_expression":
    phpMemberAccessExpression
  of "member_call_expression":
    phpMemberCallExpression
  of "method_declaration":
    phpMethodDeclaration
  of "name":
    phpName
  of "named_label_statement":
    phpNamedLabelStatement
  of "namespace_aliasing_clause":
    phpNamespaceAliasingClause
  of "namespace_definition":
    phpNamespaceDefinition
  of "namespace_name":
    phpNamespaceName
  of "namespace_name_as_prefix":
    phpNamespaceNameAsPrefix
  of "namespace_use_clause":
    phpNamespaceUseClause
  of "namespace_use_declaration":
    phpNamespaceUseDeclaration
  of "namespace_use_group":
    phpNamespaceUseGroup
  of "namespace_use_group_clause":
    phpNamespaceUseGroupClause
  of "object_creation_expression":
    phpObjectCreationExpression
  of "optional_type":
    phpOptionalType
  of "pair":
    phpPair
  of "parenthesized_expression":
    phpParenthesizedExpression
  of "primitive_type":
    phpPrimitiveType
  of "print_intrinsic":
    phpPrintIntrinsic
  of "program":
    phpProgram
  of "property_declaration":
    phpPropertyDeclaration
  of "property_element":
    phpPropertyElement
  of "property_initializer":
    phpPropertyInitializer
  of "qualified_name":
    phpQualifiedName
  of "relative_scope":
    phpRelativeScope
  of "require_expression":
    phpRequireExpression
  of "require_once_expression":
    phpRequireOnceExpression
  of "return_statement":
    phpReturnStatement
  of "scoped_call_expression":
    phpScopedCallExpression
  of "scoped_property_access_expression":
    phpScopedPropertyAccessExpression
  of "sequence_expression":
    phpSequenceExpression
  of "simple_parameter":
    phpSimpleParameter
  of "static_modifier":
    phpStaticModifier
  of "static_variable_declaration":
    phpStaticVariableDeclaration
  of "subscript_expression":
    phpSubscriptExpression
  of "switch_block":
    phpSwitchBlock
  of "switch_statement":
    phpSwitchStatement
  of "text":
    phpText
  of "text_interpolation":
    phpTextInterpolation
  of "throw_statement":
    phpThrowStatement
  of "trait_declaration":
    phpTraitDeclaration
  of "try_statement":
    phpTryStatement
  of "type_name":
    phpTypeName
  of "unary_op_expression":
    phpUnaryOpExpression
  of "unset_statement":
    phpUnsetStatement
  of "update_expression":
    phpUpdateExpression
  of "use_as_clause":
    phpUseAsClause
  of "use_declaration":
    phpUseDeclaration
  of "use_instead_of_clause":
    phpUseInsteadOfClause
  of "use_list":
    phpUseList
  of "variable_name":
    phpVariableName
  of "variadic_parameter":
    phpVariadicParameter
  of "variadic_unpacking":
    phpVariadicUnpacking
  of "visibility_modifier":
    phpVisibilityModifier
  of "while_statement":
    phpWhileStatement
  of "yield_expression":
    phpYieldExpression
  of "!":
    phpSingleExclamationTok
  of "!=":
    phpSingleExclamationSingleEqualTok
  of "!==":
    phpSingleExclamationDoubleEqualTok
  of "$":
    phpSingleDollarTok
  of "%":
    phpSinglePercentTok
  of "%=":
    phpSinglePercentSingleEqualTok
  of "&":
    phpSingleAmpersandTok
  of "&&":
    phpDoubleAmpersandTok
  of "&=":
    phpSingleAmpersandSingleEqualTok
  of "(":
    phpSingleLParTok
  of ")":
    phpSingleRParTok
  of "*":
    phpSingleAsteriskTok
  of "**":
    phpDoubleAsteriskTok
  of "**=":
    phpDoubleAsteriskSingleEqualTok
  of "*=":
    phpSingleAsteriskSingleEqualTok
  of "+":
    phpSinglePlusTok
  of "++":
    phpDoublePlusTok
  of "+=":
    phpSinglePlusSingleEqualTok
  of ",":
    phpSingleCommaTok
  of "-":
    phpSingleMinusTok
  of "--":
    phpDoubleMinusTok
  of "-=":
    phpSingleMinusSingleEqualTok
  of "->":
    phpSingleMinusSingleGreaterThanTok
  of ".":
    phpSingleDotTok
  of "...":
    phpTripleDotTok
  of ".=":
    phpSingleDotSingleEqualTok
  of "/":
    phpSingleSlashTok
  of "/=":
    phpSingleSlashSingleEqualTok
  of ":":
    phpSingleColonTok
  of "::":
    phpDoubleColonTok
  of ";":
    phpSingleSemicolonTok
  of "<":
    phpSingleLessThanTok
  of "<<":
    phpDoubleLessThanTok
  of "<<=":
    phpDoubleLessThanSingleEqualTok
  of "<=":
    phpSingleLessThanSingleEqualTok
  of "<=>":
    phpSingleLessThanSingleEqualSingleGreaterThanTok
  of "<>":
    phpSingleLessThanSingleGreaterThanTok
  of "=":
    phpSingleEqualTok
  of "==":
    phpDoubleEqualTok
  of "===":
    phpTripleEqualTok
  of "=>":
    phpSingleEqualSingleGreaterThanTok
  of ">":
    phpSingleGreaterThanTok
  of ">=":
    phpSingleGreaterThanSingleEqualTok
  of ">>":
    phpDoubleGreaterThanTok
  of ">>=":
    phpDoubleGreaterThanSingleEqualTok
  of "?":
    phpSingleQuestionTok
  of "?>":
    phpSingleQuestionSingleGreaterThanTok
  of "??":
    phpDoubleQuestionTok
  of "@":
    phpSingleAtTok
  of "[":
    phpSingleLBrackTok
  of "\\":
    phpSingleBackslashTok
  of "]":
    phpSingleRBrackTok
  of "^":
    phpSingleAccentTok
  of "^=":
    phpSingleAccentSingleEqualTok
  of "abstract":
    phpAbstractTok
  of "and":
    phpAndTok
  of "array":
    phpArrayTok
  of "as":
    phpAsTok
  of "binary":
    phpBinaryTok
  of "bool":
    phpBoolTok
  of "boolean":
    phpBoolean
  of "break":
    phpBreakTok
  of "callable":
    phpCallableTok
  of "case":
    phpCaseTok
  of "catch":
    phpCatchTok
  of "class":
    phpClassTok
  of "clone":
    phpCloneTok
  of "comment":
    phpComment
  of "const":
    phpConstTok
  of "continue":
    phpContinueTok
  of "declare":
    phpDeclareTok
  of "default":
    phpDefaultTok
  of "do":
    phpDoTok
  of "double":
    phpDoubleTok
  of "echo":
    phpEchoTok
  of "else":
    phpElseTok
  of "elseif":
    phpElseifTok
  of "encoding":
    phpEncodingTok
  of "enddeclare":
    phpEnddeclareTok
  of "endfor":
    phpEndforTok
  of "endforeach":
    phpEndforeachTok
  of "endif":
    phpEndifTok
  of "endswitch":
    phpEndswitchTok
  of "endwhile":
    phpEndwhileTok
  of "extends":
    phpExtendsTok
  of "final":
    phpFinalTok
  of "finally":
    phpFinallyTok
  of "float":
    phpFloatTok
  of "for":
    phpForTok
  of "foreach":
    phpForeachTok
  of "from":
    phpFromTok
  of "function":
    phpFunctionTok
  of "global":
    phpGlobalTok
  of "goto":
    phpGotoTok
  of "heredoc":
    phpHeredoc
  of "if":
    phpIfTok
  of "implements":
    phpImplementsTok
  of "include":
    phpIncludeTok
  of "include_once":
    phpIncludeOnceTok
  of "instanceof":
    phpInstanceofTok
  of "insteadof":
    phpInsteadofTok
  of "int":
    phpIntTok
  of "integer":
    phpIntegerTok
  of "interface":
    phpInterfaceTok
  of "iterable":
    phpIterableTok
  of "list":
    phpListTok
  of "namespace":
    phpNamespaceTok
  of "new":
    phpNewTok
  of "null":
    phpNull
  of "object":
    phpObjectTok
  of "or":
    phpOrTok
  of "parent":
    phpParentTok
  of "php_tag":
    phpPhpTag
  of "print":
    phpPrintTok
  of "private":
    phpPrivateTok
  of "protected":
    phpProtectedTok
  of "public":
    phpPublicTok
  of "real":
    phpRealTok
  of "require":
    phpRequireTok
  of "require_once":
    phpRequireOnceTok
  of "return":
    phpReturnTok
  of "self":
    phpSelfTok
  of "shell_command_expression":
    phpShellCommandExpression
  of "static":
    phpStaticTok
  of "strict_types":
    phpStrictTypesTok
  of "string":
    phpStringTok
  of "switch":
    phpSwitchTok
  of "throw":
    phpThrowTok
  of "ticks":
    phpTicksTok
  of "trait":
    phpTraitTok
  of "try":
    phpTryTok
  of "unset":
    phpUnsetTok
  of "use":
    phpUseTok
  of "var_modifier":
    phpVarModifier
  of "void":
    phpVoidTok
  of "while":
    phpWhileTok
  of "xor":
    phpXorTok
  of "yield":
    phpYieldTok
  of "{":
    phpSingleLCurlyTok
  of "|":
    phpSinglePipeTok
  of "|=":
    phpSinglePipeSingleEqualTok
  of "||":
    phpDoublePipeTok
  of "}":
    phpSingleRCurlyTok
  of "~":
    phpSingleTildeTok
  of "ERROR":
    phpSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_php(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: PhpNode): string =
  $ts_node_type(TSNode(node))

proc newPhpParser*(): PhpParser =
  result = PhpParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_php())

proc parseString*(parser: PhpParser; str: string): PhpNode =
  PhpNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: PhpNode; idx: int; withUnnamed: bool = false): PhpNode =
  if withUnnamed:
    PhpNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    PhpNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: PhpNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: PhpNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: PhpNode; withUnnamed: bool = false): PhpNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: PhpNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: PhpNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: PhpNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[3 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
