
import
  hparse / htreesitter / htreesitter, sequtils, strutils

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
    scalaStringTransformExpression, ## string_transform_expression
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
    scalaSingleExclamationTok, ## !
    scalaSingleHashTok,     ## #
    scalaSingleDollarTok,   ## $
    scalaSingleLParTok,     ## (
    scalaSingleRParTok,     ## )
    scalaSingleAsteriskTok, ## *
    scalaSinglePlusTok,     ## +
    scalaSingleCommaTok,    ## ,
    scalaSingleMinusTok,    ## -
    scalaSingleDotTok,      ## .
    scalaSingleColonTok,    ## :
    scalaSingleSemicolonTok, ## ;
    scalaSingleLessThanSinglePercentTok, ## <%
    scalaSingleLessThanSingleColonTok, ## <:
    scalaSingleEqualTok,    ## =
    scalaSingleEqualSingleGreaterThanTok, ## =>
    scalaSingleGreaterThanSingleColonTok, ## >:
    scalaSingleAtTok,       ## @
    scalaSingleLBrackTok,   ## [
    scalaSingleRBrackTok,   ## ]
    scalaAbstractTok,       ## abstract
    scalaCaseTok,           ## case
    scalaCatchTok,          ## catch
    scalaClassTok,          ## class
    scalaComment,           ## comment
    scalaDefTok,            ## def
    scalaElseTok,           ## else
    scalaExtendsTok,        ## extends
    scalaFinalTok,          ## final
    scalaFinallyTok,        ## finally
    scalaIdentifier,        ## identifier
    scalaIfTok,             ## if
    scalaImplicitTok,       ## implicit
    scalaImportTok,         ## import
    scalaLazyTok,           ## lazy
    scalaMatchTok,          ## match
    scalaNewTok,            ## new
    scalaNumber,            ## number
    scalaObjectTok,         ## object
    scalaOperatorIdentifier, ## operator_identifier
    scalaOverrideTok,       ## override
    scalaPackageTok,        ## package
    scalaPrivateTok,        ## private
    scalaProtectedTok,      ## protected
    scalaSealedTok,         ## sealed
    scalaTraitTok,          ## trait
    scalaTryTok,            ## try
    scalaTypeTok,           ## type
    scalaTypeIdentifier,    ## type_identifier
    scalaValTok,            ## val
    scalaVarTok,            ## var
    scalaWildcard,          ## wildcard
    scalaWithTok,           ## with
    scalaSingleLCurlyTok,   ## {
    scalaSinglePipeTok,     ## |
    scalaSingleRCurlyTok,   ## }
    scalaSingleTildeTok,    ## ~
    scalaSyntaxError         ## Tree-sitter parser syntax error
type
  ScalaExternalTok* = enum
    scalaExtern_automatic_semicolon, ## _automatic_semicolon
    scalaExtern_simple_string, ## _simple_string
    scalaExtern_string_start, ## _string_start
    scalaExtern_string_middle, ## _string_middle
    scalaExtern_string_end, ## _string_end
    scalaExtern_multiline_string_start, ## _multiline_string_start
    scalaExtern_multiline_string_middle, ## _multiline_string_middle
    scalaExtern_multiline_string_end ## _multiline_string_end
type
  ScalaNode* = distinct TSNode
type
  ScalaParser* = distinct PtsParser
proc tsNodeType*(node: ScalaNode): string
proc kind*(node: ScalaNode): ScalaNodeKind =
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
  of "string_transform_expression":
    scalaStringTransformExpression
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
    scalaSingleExclamationTok
  of "#":
    scalaSingleHashTok
  of "$":
    scalaSingleDollarTok
  of "(":
    scalaSingleLParTok
  of ")":
    scalaSingleRParTok
  of "*":
    scalaSingleAsteriskTok
  of "+":
    scalaSinglePlusTok
  of ",":
    scalaSingleCommaTok
  of "-":
    scalaSingleMinusTok
  of ".":
    scalaSingleDotTok
  of ":":
    scalaSingleColonTok
  of ";":
    scalaSingleSemicolonTok
  of "<%":
    scalaSingleLessThanSinglePercentTok
  of "<:":
    scalaSingleLessThanSingleColonTok
  of "=":
    scalaSingleEqualTok
  of "=>":
    scalaSingleEqualSingleGreaterThanTok
  of ">:":
    scalaSingleGreaterThanSingleColonTok
  of "@":
    scalaSingleAtTok
  of "[":
    scalaSingleLBrackTok
  of "]":
    scalaSingleRBrackTok
  of "abstract":
    scalaAbstractTok
  of "case":
    scalaCaseTok
  of "catch":
    scalaCatchTok
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
  of "final":
    scalaFinalTok
  of "finally":
    scalaFinallyTok
  of "identifier":
    scalaIdentifier
  of "if":
    scalaIfTok
  of "implicit":
    scalaImplicitTok
  of "import":
    scalaImportTok
  of "lazy":
    scalaLazyTok
  of "match":
    scalaMatchTok
  of "new":
    scalaNewTok
  of "number":
    scalaNumber
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
  of "trait":
    scalaTraitTok
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
    scalaSingleLCurlyTok
  of "|":
    scalaSinglePipeTok
  of "}":
    scalaSingleRCurlyTok
  of "~":
    scalaSingleTildeTok
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
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: ScalaNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: ScalaNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: ScalaNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[5 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
