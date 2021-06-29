
import
  hmisc / wrappers / treesitter

import
  strutils

type
  ScalaNodeKind* = enum
    scalaDefinition,        ## _definition
    scalaExpression,        ## _expression
    scalaPattern,           ## _pattern
    scalaAlternativePattern, ## alternative_pattern
    scalaAnnotation,        ## annotation
    scalaArguments,         ## arguments
    scalaAssignmentExpression, ## assignment_expression
    scalaBlock,             ## block
    scalaBooleanLiteral,    ## boolean_literal
    scalaCallExpression,    ## call_expression
    scalaCapturePattern,    ## capture_pattern
    scalaCaseBlock,         ## case_block
    scalaCaseClassPattern,  ## case_class_pattern
    scalaCaseClause,        ## case_clause
    scalaCatchClause,       ## catch_clause
    scalaClassDefinition,   ## class_definition
    scalaClassParameter,    ## class_parameter
    scalaClassParameters,   ## class_parameters
    scalaCompilationUnit,   ## compilation_unit
    scalaCompoundType,      ## compound_type
    scalaContextBound,      ## context_bound
    scalaContravariantTypeParameter, ## contravariant_type_parameter
    scalaCovariantTypeParameter, ## covariant_type_parameter
    scalaExtendsClause,     ## extends_clause
    scalaFieldExpression,   ## field_expression
    scalaFinallyClause,     ## finally_clause
    scalaFunctionDeclaration, ## function_declaration
    scalaFunctionDefinition, ## function_definition
    scalaFunctionType,      ## function_type
    scalaGenericFunction,   ## generic_function
    scalaGenericType,       ## generic_type
    scalaGuard,             ## guard
    scalaIfExpression,      ## if_expression
    scalaImportDeclaration, ## import_declaration
    scalaImportSelectors,   ## import_selectors
    scalaInfixExpression,   ## infix_expression
    scalaInfixPattern,      ## infix_pattern
    scalaInfixType,         ## infix_type
    scalaInstanceExpression, ## instance_expression
    scalaInterpolatedString, ## interpolated_string
    scalaInterpolatedStringExpression, ## interpolated_string_expression
    scalaInterpolation,     ## interpolation
    scalaLazyParameterType, ## lazy_parameter_type
    scalaLowerBound,        ## lower_bound
    scalaMatchExpression,   ## match_expression
    scalaModifiers,         ## modifiers
    scalaObjectDefinition,  ## object_definition
    scalaPackageClause,     ## package_clause
    scalaPackageIdentifier, ## package_identifier
    scalaPackageObject,     ## package_object
    scalaParameter,         ## parameter
    scalaParameterTypes,    ## parameter_types
    scalaParameters,        ## parameters
    scalaParenthesizedExpression, ## parenthesized_expression
    scalaPrefixExpression,  ## prefix_expression
    scalaProjectedType,     ## projected_type
    scalaRenamedIdentifier, ## renamed_identifier
    scalaRepeatedParameterType, ## repeated_parameter_type
    scalaStableIdentifier,  ## stable_identifier
    scalaStableTypeIdentifier, ## stable_type_identifier
    scalaString,            ## string
    scalaTemplateBody,      ## template_body
    scalaTraitDefinition,   ## trait_definition
    scalaTryExpression,     ## try_expression
    scalaTupleExpression,   ## tuple_expression
    scalaTuplePattern,      ## tuple_pattern
    scalaTupleType,         ## tuple_type
    scalaTypeArguments,     ## type_arguments
    scalaTypeDefinition,    ## type_definition
    scalaTypeParameters,    ## type_parameters
    scalaTypedPattern,      ## typed_pattern
    scalaUpperBound,        ## upper_bound
    scalaValDeclaration,    ## val_declaration
    scalaValDefinition,     ## val_definition
    scalaVarDeclaration,    ## var_declaration
    scalaVarDefinition,     ## var_definition
    scalaViewBound,         ## view_bound
    scalaExclamationTok,    ## !
    scalaHashTok,           ## #
    scalaDollarTok,         ## $
    scalaLParTok,           ## (
    scalaRParTok,           ## )
    scalaAsteriskTok,       ## *
    scalaPlusTok,           ## +
    scalaCommaTok,          ## ,
    scalaMinusTok,          ## -
    scalaDotTok,            ## .
    scalaColonTok,          ## :
    scalaSemicolonTok,      ## ;
    scalaLessThanPercentTok, ## <%
    scalaLessThanColonTok,  ## <:
    scalaEqualTok,          ## =
    scalaEqualGreaterThanTok, ## =>
    scalaGreaterThanColonTok, ## >:
    scalaAtTok,             ## @
    scalaLBrackTok,         ## [
    scalaRBrackTok,         ## ]
    scalaAbstractTok,       ## abstract
    scalaCaseTok,           ## case
    scalaCatchTok,          ## catch
    scalaCharacterLiteral,  ## character_literal
    scalaClassTok,          ## class
    scalaComment,           ## comment
    scalaDefTok,            ## def
    scalaElseTok,           ## else
    scalaExtendsTok,        ## extends
    scalaFalseTok,          ## false
    scalaFinalTok,          ## final
    scalaFinallyTok,        ## finally
    scalaFloatingPointLiteral, ## floating_point_literal
    scalaIdentifier,        ## identifier
    scalaIfTok,             ## if
    scalaImplicitTok,       ## implicit
    scalaImportTok,         ## import
    scalaIntegerLiteral,    ## integer_literal
    scalaLazyTok,           ## lazy
    scalaMatchTok,          ## match
    scalaNewTok,            ## new
    scalaObjectTok,         ## object
    scalaOperatorIdentifier, ## operator_identifier
    scalaOverrideTok,       ## override
    scalaPackageTok,        ## package
    scalaPrivateTok,        ## private
    scalaProtectedTok,      ## protected
    scalaSealedTok,         ## sealed
    scalaSymbolLiteral,     ## symbol_literal
    scalaTraitTok,          ## trait
    scalaTrueTok,           ## true
    scalaTryTok,            ## try
    scalaTypeTok,           ## type
    scalaTypeIdentifier,    ## type_identifier
    scalaValTok,            ## val
    scalaVarTok,            ## var
    scalaWildcard,          ## wildcard
    scalaWithTok,           ## with
    scalaLCurlyTok,         ## {
    scalaPipeTok,           ## |
    scalaRCurlyTok,         ## }
    scalaTildeTok,          ## ~
    scalaSyntaxError         ## Tree-sitter parser syntax error
type
  ScalaExternalTok* = enum
    scalaExtern_automatic_semicolon, ## _automatic_semicolon
    scalaExtern_simple_string, ## _simple_string
    scalaExtern_simple_multiline_string, ## _simple_multiline_string
    scalaExtern_interpolated_string_middle, ## _interpolated_string_middle
    scalaExtern_interpolated_string_end, ## _interpolated_string_end
    scalaExtern_interpolated_multiline_string_middle, ## _interpolated_multiline_string_middle
    scalaExtern_interpolated_multiline_string_end ## _interpolated_multiline_string_end
type
  ScalaNode* = distinct TSNode
type
  ScalaParser* = distinct PtsParser
proc tsNodeType*(node: ScalaNode): string
proc kind*(node: ScalaNode): ScalaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_definition":
      scalaDefinition
    of "_expression":
      scalaExpression
    of "_pattern":
      scalaPattern
    of "alternative_pattern":
      scalaAlternativePattern
    of "annotation":
      scalaAnnotation
    of "arguments":
      scalaArguments
    of "assignment_expression":
      scalaAssignmentExpression
    of "block":
      scalaBlock
    of "boolean_literal":
      scalaBooleanLiteral
    of "call_expression":
      scalaCallExpression
    of "capture_pattern":
      scalaCapturePattern
    of "case_block":
      scalaCaseBlock
    of "case_class_pattern":
      scalaCaseClassPattern
    of "case_clause":
      scalaCaseClause
    of "catch_clause":
      scalaCatchClause
    of "class_definition":
      scalaClassDefinition
    of "class_parameter":
      scalaClassParameter
    of "class_parameters":
      scalaClassParameters
    of "compilation_unit":
      scalaCompilationUnit
    of "compound_type":
      scalaCompoundType
    of "context_bound":
      scalaContextBound
    of "contravariant_type_parameter":
      scalaContravariantTypeParameter
    of "covariant_type_parameter":
      scalaCovariantTypeParameter
    of "extends_clause":
      scalaExtendsClause
    of "field_expression":
      scalaFieldExpression
    of "finally_clause":
      scalaFinallyClause
    of "function_declaration":
      scalaFunctionDeclaration
    of "function_definition":
      scalaFunctionDefinition
    of "function_type":
      scalaFunctionType
    of "generic_function":
      scalaGenericFunction
    of "generic_type":
      scalaGenericType
    of "guard":
      scalaGuard
    of "if_expression":
      scalaIfExpression
    of "import_declaration":
      scalaImportDeclaration
    of "import_selectors":
      scalaImportSelectors
    of "infix_expression":
      scalaInfixExpression
    of "infix_pattern":
      scalaInfixPattern
    of "infix_type":
      scalaInfixType
    of "instance_expression":
      scalaInstanceExpression
    of "interpolated_string":
      scalaInterpolatedString
    of "interpolated_string_expression":
      scalaInterpolatedStringExpression
    of "interpolation":
      scalaInterpolation
    of "lazy_parameter_type":
      scalaLazyParameterType
    of "lower_bound":
      scalaLowerBound
    of "match_expression":
      scalaMatchExpression
    of "modifiers":
      scalaModifiers
    of "object_definition":
      scalaObjectDefinition
    of "package_clause":
      scalaPackageClause
    of "package_identifier":
      scalaPackageIdentifier
    of "package_object":
      scalaPackageObject
    of "parameter":
      scalaParameter
    of "parameter_types":
      scalaParameterTypes
    of "parameters":
      scalaParameters
    of "parenthesized_expression":
      scalaParenthesizedExpression
    of "prefix_expression":
      scalaPrefixExpression
    of "projected_type":
      scalaProjectedType
    of "renamed_identifier":
      scalaRenamedIdentifier
    of "repeated_parameter_type":
      scalaRepeatedParameterType
    of "stable_identifier":
      scalaStableIdentifier
    of "stable_type_identifier":
      scalaStableTypeIdentifier
    of "string":
      scalaString
    of "template_body":
      scalaTemplateBody
    of "trait_definition":
      scalaTraitDefinition
    of "try_expression":
      scalaTryExpression
    of "tuple_expression":
      scalaTupleExpression
    of "tuple_pattern":
      scalaTuplePattern
    of "tuple_type":
      scalaTupleType
    of "type_arguments":
      scalaTypeArguments
    of "type_definition":
      scalaTypeDefinition
    of "type_parameters":
      scalaTypeParameters
    of "typed_pattern":
      scalaTypedPattern
    of "upper_bound":
      scalaUpperBound
    of "val_declaration":
      scalaValDeclaration
    of "val_definition":
      scalaValDefinition
    of "var_declaration":
      scalaVarDeclaration
    of "var_definition":
      scalaVarDefinition
    of "view_bound":
      scalaViewBound
    of "!":
      scalaExclamationTok
    of "#":
      scalaHashTok
    of "$":
      scalaDollarTok
    of "(":
      scalaLParTok
    of ")":
      scalaRParTok
    of "*":
      scalaAsteriskTok
    of "+":
      scalaPlusTok
    of ",":
      scalaCommaTok
    of "-":
      scalaMinusTok
    of ".":
      scalaDotTok
    of ":":
      scalaColonTok
    of ";":
      scalaSemicolonTok
    of "<%":
      scalaLessThanPercentTok
    of "<:":
      scalaLessThanColonTok
    of "=":
      scalaEqualTok
    of "=>":
      scalaEqualGreaterThanTok
    of ">:":
      scalaGreaterThanColonTok
    of "@":
      scalaAtTok
    of "[":
      scalaLBrackTok
    of "]":
      scalaRBrackTok
    of "abstract":
      scalaAbstractTok
    of "case":
      scalaCaseTok
    of "catch":
      scalaCatchTok
    of "character_literal":
      scalaCharacterLiteral
    of "class":
      scalaClassTok
    of "comment":
      scalaComment
    of "def":
      scalaDefTok
    of "else":
      scalaElseTok
    of "extends":
      scalaExtendsTok
    of "false":
      scalaFalseTok
    of "final":
      scalaFinalTok
    of "finally":
      scalaFinallyTok
    of "floating_point_literal":
      scalaFloatingPointLiteral
    of "identifier":
      scalaIdentifier
    of "if":
      scalaIfTok
    of "implicit":
      scalaImplicitTok
    of "import":
      scalaImportTok
    of "integer_literal":
      scalaIntegerLiteral
    of "lazy":
      scalaLazyTok
    of "match":
      scalaMatchTok
    of "new":
      scalaNewTok
    of "object":
      scalaObjectTok
    of "operator_identifier":
      scalaOperatorIdentifier
    of "override":
      scalaOverrideTok
    of "package":
      scalaPackageTok
    of "private":
      scalaPrivateTok
    of "protected":
      scalaProtectedTok
    of "sealed":
      scalaSealedTok
    of "symbol_literal":
      scalaSymbolLiteral
    of "trait":
      scalaTraitTok
    of "true":
      scalaTrueTok
    of "try":
      scalaTryTok
    of "type":
      scalaTypeTok
    of "type_identifier":
      scalaTypeIdentifier
    of "val":
      scalaValTok
    of "var":
      scalaVarTok
    of "wildcard":
      scalaWildcard
    of "with":
      scalaWithTok
    of "{":
      scalaLCurlyTok
    of "|":
      scalaPipeTok
    of "}":
      scalaRCurlyTok
    of "~":
      scalaTildeTok
    of "ERROR":
      scalaSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_scala(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: ScalaNode): string =
  $ts_node_type(TSNode(node))

proc newScalaParser*(): ScalaParser =
  result = ScalaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_scala())

proc parseString*(parser: ScalaParser; str: string): ScalaNode =
  ScalaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseScalaString*(str: string): ScalaNode =
  let parser = newScalaParser()
  return parseString(parser, str)

func `[]`*(node: ScalaNode; idx: int; withUnnamed: bool = false): ScalaNode =
  if withUnnamed:
    ScalaNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    ScalaNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: ScalaNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: ScalaNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: ScalaNode; withUnnamed: bool = false): ScalaNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                         ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: ScalaNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func nodeString*(node: ScalaNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: ScalaNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: ScalaNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: ScalaNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: ScalaNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: ScalaNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: ScalaNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: ScalaNode): ScalaNode =
  ScalaNode(ts_node_parent(TSNode(node)))

func child*(node: ScalaNode; a2: int): ScalaNode =
  ScalaNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: ScalaNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: ScalaNode; a2: int): ScalaNode =
  ScalaNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: ScalaNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: ScalaNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: ScalaNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: ScalaNode): int =
  node.startPoint().row.int

func endLine*(node: ScalaNode): int =
  node.endPoint().row.int

func startColumn*(node: ScalaNode): int =
  node.startPoint().column.int

func endColumn*(node: ScalaNode): int =
  node.endPoint().column.int

func childByFieldName*(self: ScalaNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
