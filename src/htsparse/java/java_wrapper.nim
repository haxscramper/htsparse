
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  JavaNodeKind* = enum
    javaLiteral,            ## _literal
    javaSimpleType,         ## _simple_type
    javaType,               ## _type
    javaUnannotatedType,    ## _unannotated_type
    javaDeclaration,        ## declaration
    javaExpression,         ## expression
    javaPrimaryExpression,  ## primary_expression
    javaStatement,          ## statement
    javaAnnotatedType,      ## annotated_type
    javaAnnotation,         ## annotation
    javaAnnotationArgumentList, ## annotation_argument_list
    javaAnnotationTypeBody, ## annotation_type_body
    javaAnnotationTypeDeclaration, ## annotation_type_declaration
    javaAnnotationTypeElementDeclaration, ## annotation_type_element_declaration
    javaArgumentList,       ## argument_list
    javaArrayAccess,        ## array_access
    javaArrayCreationExpression, ## array_creation_expression
    javaArrayInitializer,   ## array_initializer
    javaArrayType,          ## array_type
    javaAssertStatement,    ## assert_statement
    javaAssignmentExpression, ## assignment_expression
    javaAsterisk,           ## asterisk
    javaBinaryExpression,   ## binary_expression
    javaBlock,              ## block
    javaBreakStatement,     ## break_statement
    javaCastExpression,     ## cast_expression
    javaCatchClause,        ## catch_clause
    javaCatchFormalParameter, ## catch_formal_parameter
    javaCatchType,          ## catch_type
    javaClassBody,          ## class_body
    javaClassDeclaration,   ## class_declaration
    javaClassLiteral,       ## class_literal
    javaConstantDeclaration, ## constant_declaration
    javaConstructorBody,    ## constructor_body
    javaConstructorDeclaration, ## constructor_declaration
    javaContinueStatement,  ## continue_statement
    javaDimensions,         ## dimensions
    javaDimensionsExpr,     ## dimensions_expr
    javaDoStatement,        ## do_statement
    javaElementValueArrayInitializer, ## element_value_array_initializer
    javaElementValuePair,   ## element_value_pair
    javaEnhancedForStatement, ## enhanced_for_statement
    javaEnumBody,           ## enum_body
    javaEnumBodyDeclarations, ## enum_body_declarations
    javaEnumConstant,       ## enum_constant
    javaEnumDeclaration,    ## enum_declaration
    javaExplicitConstructorInvocation, ## explicit_constructor_invocation
    javaExpressionStatement, ## expression_statement
    javaExtendsInterfaces,  ## extends_interfaces
    javaFieldAccess,        ## field_access
    javaFieldDeclaration,   ## field_declaration
    javaFinallyClause,      ## finally_clause
    javaFloatingPointType,  ## floating_point_type
    javaForStatement,       ## for_statement
    javaFormalParameter,    ## formal_parameter
    javaFormalParameters,   ## formal_parameters
    javaGenericType,        ## generic_type
    javaIfStatement,        ## if_statement
    javaImportDeclaration,  ## import_declaration
    javaInferredParameters, ## inferred_parameters
    javaInstanceofExpression, ## instanceof_expression
    javaIntegralType,       ## integral_type
    javaInterfaceBody,      ## interface_body
    javaInterfaceDeclaration, ## interface_declaration
    javaInterfaceTypeList,  ## interface_type_list
    javaLabeledStatement,   ## labeled_statement
    javaLambdaExpression,   ## lambda_expression
    javaLocalVariableDeclaration, ## local_variable_declaration
    javaMarkerAnnotation,   ## marker_annotation
    javaMethodDeclaration,  ## method_declaration
    javaMethodInvocation,   ## method_invocation
    javaMethodReference,    ## method_reference
    javaModifiers,          ## modifiers
    javaModuleBody,         ## module_body
    javaModuleDeclaration,  ## module_declaration
    javaModuleDirective,    ## module_directive
    javaObjectCreationExpression, ## object_creation_expression
    javaPackageDeclaration, ## package_declaration
    javaParenthesizedExpression, ## parenthesized_expression
    javaProgram,            ## program
    javaReceiverParameter,  ## receiver_parameter
    javaRequiresModifier,   ## requires_modifier
    javaResource,           ## resource
    javaResourceSpecification, ## resource_specification
    javaReturnStatement,    ## return_statement
    javaScopedIdentifier,   ## scoped_identifier
    javaScopedTypeIdentifier, ## scoped_type_identifier
    javaSpreadParameter,    ## spread_parameter
    javaStaticInitializer,  ## static_initializer
    javaSuperInterfaces,    ## super_interfaces
    javaSuperclass,         ## superclass
    javaSwitchBlock,        ## switch_block
    javaSwitchLabel,        ## switch_label
    javaSwitchStatement,    ## switch_statement
    javaSynchronizedStatement, ## synchronized_statement
    javaTernaryExpression,  ## ternary_expression
    javaThrowStatement,     ## throw_statement
    javaThrows,             ## throws
    javaTryStatement,       ## try_statement
    javaTryWithResourcesStatement, ## try_with_resources_statement
    javaTypeArguments,      ## type_arguments
    javaTypeBound,          ## type_bound
    javaTypeParameter,      ## type_parameter
    javaTypeParameters,     ## type_parameters
    javaUnaryExpression,    ## unary_expression
    javaUpdateExpression,   ## update_expression
    javaVariableDeclarator, ## variable_declarator
    javaWhileStatement,     ## while_statement
    javaWildcard,           ## wildcard
    javaExclamationTok,     ## !
    javaExclamationEqualTok, ## !=
    javaPercentTok,         ## %
    javaPercentEqualTok,    ## %=
    javaAmpersandTok,       ## &
    javaDoubleAmpersandTok, ## &&
    javaAmpersandEqualTok,  ## &=
    javaLParTok,            ## (
    javaRParTok,            ## )
    javaAsteriskTok,        ## *
    javaAsteriskEqualTok,   ## *=
    javaPlusTok,            ## +
    javaDoublePlusTok,      ## ++
    javaPlusEqualTok,       ## +=
    javaCommaTok,           ## ,
    javaMinusTok,           ## -
    javaDoubleMinusTok,     ## --
    javaMinusEqualTok,      ## -=
    javaMinusGreaterThanTok, ## ->
    javaDotTok,             ## .
    javaTripleDotTok,       ## ...
    javaSlashTok,           ## /
    javaSlashEqualTok,      ## /=
    javaColonTok,           ## :
    javaDoubleColonTok,     ## ::
    javaSemicolonTok,       ## ;
    javaLessThanTok,        ## <
    javaDoubleLessThanTok,  ## <<
    javaDoubleLessThanEqualTok, ## <<=
    javaLessThanEqualTok,   ## <=
    javaEqualTok,           ## =
    javaDoubleEqualTok,     ## ==
    javaGreaterThanTok,     ## >
    javaGreaterThanEqualTok, ## >=
    javaDoubleGreaterThanTok, ## >>
    javaDoubleGreaterThanEqualTok, ## >>=
    javaTripleGreaterThanTok, ## >>>
    javaTripleGreaterThanEqualTok, ## >>>=
    javaQuestionTok,        ## ?
    javaAtTok,              ## @
    javaAtinterfaceTok,     ## @interface
    javaLBrackTok,          ## [
    javaRBrackTok,          ## ]
    javaAccentTok,          ## ^
    javaAccentEqualTok,     ## ^=
    javaAbstractTok,        ## abstract
    javaAssertTok,          ## assert
    javaBinaryIntegerLiteral, ## binary_integer_literal
    javaBooleanType,        ## boolean_type
    javaBreakTok,           ## break
    javaByteTok,            ## byte
    javaCaseTok,            ## case
    javaCatchTok,           ## catch
    javaCharTok,            ## char
    javaCharacterLiteral,   ## character_literal
    javaClassTok,           ## class
    javaComment,            ## comment
    javaContinueTok,        ## continue
    javaDecimalFloatingPointLiteral, ## decimal_floating_point_literal
    javaDecimalIntegerLiteral, ## decimal_integer_literal
    javaDefaultTok,         ## default
    javaDoTok,              ## do
    javaDoubleTok,          ## double
    javaElseTok,            ## else
    javaEnumTok,            ## enum
    javaExportsTok,         ## exports
    javaExtendsTok,         ## extends
    javaFalse,              ## false
    javaFinalTok,           ## final
    javaFinallyTok,         ## finally
    javaFloatTok,           ## float
    javaForTok,             ## for
    javaHexFloatingPointLiteral, ## hex_floating_point_literal
    javaHexIntegerLiteral,  ## hex_integer_literal
    javaIdentifier,         ## identifier
    javaIfTok,              ## if
    javaImplementsTok,      ## implements
    javaImportTok,          ## import
    javaInstanceofTok,      ## instanceof
    javaIntTok,             ## int
    javaInterfaceTok,       ## interface
    javaLongTok,            ## long
    javaModuleTok,          ## module
    javaNativeTok,          ## native
    javaNewTok,             ## new
    javaNullLiteral,        ## null_literal
    javaOctalIntegerLiteral, ## octal_integer_literal
    javaOpenTok,            ## open
    javaOpensTok,           ## opens
    javaPackageTok,         ## package
    javaPrivateTok,         ## private
    javaProtectedTok,       ## protected
    javaProvidesTok,        ## provides
    javaPublicTok,          ## public
    javaRequiresTok,        ## requires
    javaReturnTok,          ## return
    javaShortTok,           ## short
    javaStaticTok,          ## static
    javaStrictfpTok,        ## strictfp
    javaStringLiteral,      ## string_literal
    javaSuper,              ## super
    javaSwitchTok,          ## switch
    javaSynchronizedTok,    ## synchronized
    javaThis,               ## this
    javaThrowTok,           ## throw
    javaThrowsTok,          ## throws
    javaToTok,              ## to
    javaTransientTok,       ## transient
    javaTransitiveTok,      ## transitive
    javaTrue,               ## true
    javaTryTok,             ## try
    javaTypeIdentifier,     ## type_identifier
    javaUsesTok,            ## uses
    javaVoidType,           ## void_type
    javaVolatileTok,        ## volatile
    javaWhileTok,           ## while
    javaWithTok,            ## with
    javaLCurlyTok,          ## {
    javaPipeTok,            ## |
    javaPipeEqualTok,       ## |=
    javaDoublePipeTok,      ## ||
    javaRCurlyTok,          ## }
    javaTildeTok,           ## ~
    javaSyntaxError          ## Tree-sitter parser syntax error
type
  JavaNode* = distinct TSNode
type
  JavaParser* = distinct PtsParser
proc tsNodeType*(node: JavaNode): string
proc kind*(node: JavaNode): JavaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_literal":
      javaLiteral
    of "_simple_type":
      javaSimpleType
    of "_type":
      javaType
    of "_unannotated_type":
      javaUnannotatedType
    of "declaration":
      javaDeclaration
    of "expression":
      javaExpression
    of "primary_expression":
      javaPrimaryExpression
    of "statement":
      javaStatement
    of "annotated_type":
      javaAnnotatedType
    of "annotation":
      javaAnnotation
    of "annotation_argument_list":
      javaAnnotationArgumentList
    of "annotation_type_body":
      javaAnnotationTypeBody
    of "annotation_type_declaration":
      javaAnnotationTypeDeclaration
    of "annotation_type_element_declaration":
      javaAnnotationTypeElementDeclaration
    of "argument_list":
      javaArgumentList
    of "array_access":
      javaArrayAccess
    of "array_creation_expression":
      javaArrayCreationExpression
    of "array_initializer":
      javaArrayInitializer
    of "array_type":
      javaArrayType
    of "assert_statement":
      javaAssertStatement
    of "assignment_expression":
      javaAssignmentExpression
    of "asterisk":
      javaAsterisk
    of "binary_expression":
      javaBinaryExpression
    of "block":
      javaBlock
    of "break_statement":
      javaBreakStatement
    of "cast_expression":
      javaCastExpression
    of "catch_clause":
      javaCatchClause
    of "catch_formal_parameter":
      javaCatchFormalParameter
    of "catch_type":
      javaCatchType
    of "class_body":
      javaClassBody
    of "class_declaration":
      javaClassDeclaration
    of "class_literal":
      javaClassLiteral
    of "constant_declaration":
      javaConstantDeclaration
    of "constructor_body":
      javaConstructorBody
    of "constructor_declaration":
      javaConstructorDeclaration
    of "continue_statement":
      javaContinueStatement
    of "dimensions":
      javaDimensions
    of "dimensions_expr":
      javaDimensionsExpr
    of "do_statement":
      javaDoStatement
    of "element_value_array_initializer":
      javaElementValueArrayInitializer
    of "element_value_pair":
      javaElementValuePair
    of "enhanced_for_statement":
      javaEnhancedForStatement
    of "enum_body":
      javaEnumBody
    of "enum_body_declarations":
      javaEnumBodyDeclarations
    of "enum_constant":
      javaEnumConstant
    of "enum_declaration":
      javaEnumDeclaration
    of "explicit_constructor_invocation":
      javaExplicitConstructorInvocation
    of "expression_statement":
      javaExpressionStatement
    of "extends_interfaces":
      javaExtendsInterfaces
    of "field_access":
      javaFieldAccess
    of "field_declaration":
      javaFieldDeclaration
    of "finally_clause":
      javaFinallyClause
    of "floating_point_type":
      javaFloatingPointType
    of "for_statement":
      javaForStatement
    of "formal_parameter":
      javaFormalParameter
    of "formal_parameters":
      javaFormalParameters
    of "generic_type":
      javaGenericType
    of "if_statement":
      javaIfStatement
    of "import_declaration":
      javaImportDeclaration
    of "inferred_parameters":
      javaInferredParameters
    of "instanceof_expression":
      javaInstanceofExpression
    of "integral_type":
      javaIntegralType
    of "interface_body":
      javaInterfaceBody
    of "interface_declaration":
      javaInterfaceDeclaration
    of "interface_type_list":
      javaInterfaceTypeList
    of "labeled_statement":
      javaLabeledStatement
    of "lambda_expression":
      javaLambdaExpression
    of "local_variable_declaration":
      javaLocalVariableDeclaration
    of "marker_annotation":
      javaMarkerAnnotation
    of "method_declaration":
      javaMethodDeclaration
    of "method_invocation":
      javaMethodInvocation
    of "method_reference":
      javaMethodReference
    of "modifiers":
      javaModifiers
    of "module_body":
      javaModuleBody
    of "module_declaration":
      javaModuleDeclaration
    of "module_directive":
      javaModuleDirective
    of "object_creation_expression":
      javaObjectCreationExpression
    of "package_declaration":
      javaPackageDeclaration
    of "parenthesized_expression":
      javaParenthesizedExpression
    of "program":
      javaProgram
    of "receiver_parameter":
      javaReceiverParameter
    of "requires_modifier":
      javaRequiresModifier
    of "resource":
      javaResource
    of "resource_specification":
      javaResourceSpecification
    of "return_statement":
      javaReturnStatement
    of "scoped_identifier":
      javaScopedIdentifier
    of "scoped_type_identifier":
      javaScopedTypeIdentifier
    of "spread_parameter":
      javaSpreadParameter
    of "static_initializer":
      javaStaticInitializer
    of "super_interfaces":
      javaSuperInterfaces
    of "superclass":
      javaSuperclass
    of "switch_block":
      javaSwitchBlock
    of "switch_label":
      javaSwitchLabel
    of "switch_statement":
      javaSwitchStatement
    of "synchronized_statement":
      javaSynchronizedStatement
    of "ternary_expression":
      javaTernaryExpression
    of "throw_statement":
      javaThrowStatement
    of "throws":
      javaThrows
    of "try_statement":
      javaTryStatement
    of "try_with_resources_statement":
      javaTryWithResourcesStatement
    of "type_arguments":
      javaTypeArguments
    of "type_bound":
      javaTypeBound
    of "type_parameter":
      javaTypeParameter
    of "type_parameters":
      javaTypeParameters
    of "unary_expression":
      javaUnaryExpression
    of "update_expression":
      javaUpdateExpression
    of "variable_declarator":
      javaVariableDeclarator
    of "while_statement":
      javaWhileStatement
    of "wildcard":
      javaWildcard
    of "!":
      javaExclamationTok
    of "!=":
      javaExclamationEqualTok
    of "%":
      javaPercentTok
    of "%=":
      javaPercentEqualTok
    of "&":
      javaAmpersandTok
    of "&&":
      javaDoubleAmpersandTok
    of "&=":
      javaAmpersandEqualTok
    of "(":
      javaLParTok
    of ")":
      javaRParTok
    of "*":
      javaAsteriskTok
    of "*=":
      javaAsteriskEqualTok
    of "+":
      javaPlusTok
    of "++":
      javaDoublePlusTok
    of "+=":
      javaPlusEqualTok
    of ",":
      javaCommaTok
    of "-":
      javaMinusTok
    of "--":
      javaDoubleMinusTok
    of "-=":
      javaMinusEqualTok
    of "->":
      javaMinusGreaterThanTok
    of ".":
      javaDotTok
    of "...":
      javaTripleDotTok
    of "/":
      javaSlashTok
    of "/=":
      javaSlashEqualTok
    of ":":
      javaColonTok
    of "::":
      javaDoubleColonTok
    of ";":
      javaSemicolonTok
    of "<":
      javaLessThanTok
    of "<<":
      javaDoubleLessThanTok
    of "<<=":
      javaDoubleLessThanEqualTok
    of "<=":
      javaLessThanEqualTok
    of "=":
      javaEqualTok
    of "==":
      javaDoubleEqualTok
    of ">":
      javaGreaterThanTok
    of ">=":
      javaGreaterThanEqualTok
    of ">>":
      javaDoubleGreaterThanTok
    of ">>=":
      javaDoubleGreaterThanEqualTok
    of ">>>":
      javaTripleGreaterThanTok
    of ">>>=":
      javaTripleGreaterThanEqualTok
    of "?":
      javaQuestionTok
    of "@":
      javaAtTok
    of "@interface":
      javaAtinterfaceTok
    of "[":
      javaLBrackTok
    of "]":
      javaRBrackTok
    of "^":
      javaAccentTok
    of "^=":
      javaAccentEqualTok
    of "abstract":
      javaAbstractTok
    of "assert":
      javaAssertTok
    of "binary_integer_literal":
      javaBinaryIntegerLiteral
    of "boolean_type":
      javaBooleanType
    of "break":
      javaBreakTok
    of "byte":
      javaByteTok
    of "case":
      javaCaseTok
    of "catch":
      javaCatchTok
    of "char":
      javaCharTok
    of "character_literal":
      javaCharacterLiteral
    of "class":
      javaClassTok
    of "comment":
      javaComment
    of "continue":
      javaContinueTok
    of "decimal_floating_point_literal":
      javaDecimalFloatingPointLiteral
    of "decimal_integer_literal":
      javaDecimalIntegerLiteral
    of "default":
      javaDefaultTok
    of "do":
      javaDoTok
    of "double":
      javaDoubleTok
    of "else":
      javaElseTok
    of "enum":
      javaEnumTok
    of "exports":
      javaExportsTok
    of "extends":
      javaExtendsTok
    of "false":
      javaFalse
    of "final":
      javaFinalTok
    of "finally":
      javaFinallyTok
    of "float":
      javaFloatTok
    of "for":
      javaForTok
    of "hex_floating_point_literal":
      javaHexFloatingPointLiteral
    of "hex_integer_literal":
      javaHexIntegerLiteral
    of "identifier":
      javaIdentifier
    of "if":
      javaIfTok
    of "implements":
      javaImplementsTok
    of "import":
      javaImportTok
    of "instanceof":
      javaInstanceofTok
    of "int":
      javaIntTok
    of "interface":
      javaInterfaceTok
    of "long":
      javaLongTok
    of "module":
      javaModuleTok
    of "native":
      javaNativeTok
    of "new":
      javaNewTok
    of "null_literal":
      javaNullLiteral
    of "octal_integer_literal":
      javaOctalIntegerLiteral
    of "open":
      javaOpenTok
    of "opens":
      javaOpensTok
    of "package":
      javaPackageTok
    of "private":
      javaPrivateTok
    of "protected":
      javaProtectedTok
    of "provides":
      javaProvidesTok
    of "public":
      javaPublicTok
    of "requires":
      javaRequiresTok
    of "return":
      javaReturnTok
    of "short":
      javaShortTok
    of "static":
      javaStaticTok
    of "strictfp":
      javaStrictfpTok
    of "string_literal":
      javaStringLiteral
    of "super":
      javaSuper
    of "switch":
      javaSwitchTok
    of "synchronized":
      javaSynchronizedTok
    of "this":
      javaThis
    of "throw":
      javaThrowTok
    of "to":
      javaToTok
    of "transient":
      javaTransientTok
    of "transitive":
      javaTransitiveTok
    of "true":
      javaTrue
    of "try":
      javaTryTok
    of "type_identifier":
      javaTypeIdentifier
    of "uses":
      javaUsesTok
    of "void_type":
      javaVoidType
    of "volatile":
      javaVolatileTok
    of "while":
      javaWhileTok
    of "with":
      javaWithTok
    of "{":
      javaLCurlyTok
    of "|":
      javaPipeTok
    of "|=":
      javaPipeEqualTok
    of "||":
      javaDoublePipeTok
    of "}":
      javaRCurlyTok
    of "~":
      javaTildeTok
    of "ERROR":
      javaSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_java(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: JavaNode): string =
  $ts_node_type(TSNode(node))

proc newJavaParser*(): JavaParser =
  result = JavaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_java())

proc parseString*(parser: JavaParser; str: string): JavaNode =
  JavaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseJavaString*(str: string): JavaNode =
  let parser = newJavaParser()
  return parseString(parser, str)

func `[]`*(node: JavaNode; idx: int; withUnnamed: bool = false): JavaNode =
  if withUnnamed:
    JavaNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    JavaNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: JavaNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: JavaNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: JavaNode; withUnnamed: bool = false): JavaNode =
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: JavaNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: JavaNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: JavaNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: JavaNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: JavaNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: JavaNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: JavaNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: JavaNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: JavaNode): JavaNode =
  JavaNode(ts_node_parent(TSNode(node)))

func child*(node: JavaNode; a2: int): JavaNode =
  JavaNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: JavaNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: JavaNode; a2: int): JavaNode =
  JavaNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: JavaNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: JavaNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: JavaNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: JavaNode): int =
  node.startPoint().row.int

func endLine*(node: JavaNode): int =
  node.endPoint().row.int

func startColumn*(node: JavaNode): int =
  node.startPoint().column.int

func endColumn*(node: JavaNode): int =
  node.endPoint().column.int

func childByFieldName*(self: JavaNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)

proc treeRepr*(mainNode: JavaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: JavaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
