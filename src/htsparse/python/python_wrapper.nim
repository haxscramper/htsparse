
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  PythonNodeKind* = enum
    pythonCompoundStatement, ## _compound_statement
    pythonSimpleStatement,  ## _simple_statement
    pythonExpression,       ## expression
    pythonParameter,        ## parameter
    pythonPattern,          ## pattern
    pythonPrimaryExpression, ## primary_expression
    pythonAliasedImport,    ## aliased_import
    pythonArgumentList,     ## argument_list
    pythonAssertStatement,  ## assert_statement
    pythonAssignment,       ## assignment
    pythonAttribute,        ## attribute
    pythonAugmentedAssignment, ## augmented_assignment
    pythonAwait,            ## await
    pythonBinaryOperator,   ## binary_operator
    pythonBlock,            ## block
    pythonBooleanOperator,  ## boolean_operator
    pythonBreakStatement,   ## break_statement
    pythonCall,             ## call
    pythonChevron,          ## chevron
    pythonClassDefinition,  ## class_definition
    pythonComparisonOperator, ## comparison_operator
    pythonConcatenatedString, ## concatenated_string
    pythonConditionalExpression, ## conditional_expression
    pythonContinueStatement, ## continue_statement
    pythonDecoratedDefinition, ## decorated_definition
    pythonDecorator,        ## decorator
    pythonDefaultParameter, ## default_parameter
    pythonDeleteStatement,  ## delete_statement
    pythonDictionary,       ## dictionary
    pythonDictionaryComprehension, ## dictionary_comprehension
    pythonDictionarySplat,  ## dictionary_splat
    pythonDictionarySplatPattern, ## dictionary_splat_pattern
    pythonDottedName,       ## dotted_name
    pythonElifClause,       ## elif_clause
    pythonElseClause,       ## else_clause
    pythonExceptClause,     ## except_clause
    pythonExecStatement,    ## exec_statement
    pythonExpressionList,   ## expression_list
    pythonExpressionStatement, ## expression_statement
    pythonFinallyClause,    ## finally_clause
    pythonForInClause,      ## for_in_clause
    pythonForStatement,     ## for_statement
    pythonFormatExpression, ## format_expression
    pythonFormatSpecifier,  ## format_specifier
    pythonFunctionDefinition, ## function_definition
    pythonFutureImportStatement, ## future_import_statement
    pythonGeneratorExpression, ## generator_expression
    pythonGlobalStatement,  ## global_statement
    pythonIfClause,         ## if_clause
    pythonIfStatement,      ## if_statement
    pythonImportFromStatement, ## import_from_statement
    pythonImportPrefix,     ## import_prefix
    pythonImportStatement,  ## import_statement
    pythonInterpolation,    ## interpolation
    pythonKeywordArgument,  ## keyword_argument
    pythonLambda,           ## lambda
    pythonLambdaParameters, ## lambda_parameters
    pythonList,             ## list
    pythonListComprehension, ## list_comprehension
    pythonListPattern,      ## list_pattern
    pythonListSplat,        ## list_splat
    pythonListSplatPattern, ## list_splat_pattern
    pythonModule,           ## module
    pythonNamedExpression,  ## named_expression
    pythonNonlocalStatement, ## nonlocal_statement
    pythonNotOperator,      ## not_operator
    pythonPair,             ## pair
    pythonParameters,       ## parameters
    pythonParenthesizedExpression, ## parenthesized_expression
    pythonParenthesizedListSplat, ## parenthesized_list_splat
    pythonPassStatement,    ## pass_statement
    pythonPatternList,      ## pattern_list
    pythonPrintStatement,   ## print_statement
    pythonRaiseStatement,   ## raise_statement
    pythonRelativeImport,   ## relative_import
    pythonReturnStatement,  ## return_statement
    pythonSet,              ## set
    pythonSetComprehension, ## set_comprehension
    pythonSlice,            ## slice
    pythonString,           ## string
    pythonSubscript,        ## subscript
    pythonTryStatement,     ## try_statement
    pythonTuple,            ## tuple
    pythonTuplePattern,     ## tuple_pattern
    pythonType,             ## type
    pythonTypedDefaultParameter, ## typed_default_parameter
    pythonTypedParameter,   ## typed_parameter
    pythonUnaryOperator,    ## unary_operator
    pythonWhileStatement,   ## while_statement
    pythonWildcardImport,   ## wildcard_import
    pythonWithItem,         ## with_item
    pythonWithStatement,    ## with_statement
    pythonYield,            ## yield
    pythonSingleExclamationSingleEqualTok, ## !=
    pythonSingleQuoteTok,   ## "
    pythonSinglePercentTok, ## %
    pythonSinglePercentSingleEqualTok, ## %=
    pythonSingleAmpersandTok, ## &
    pythonSingleAmpersandSingleEqualTok, ## &=
    pythonSingleLParTok,    ## (
    pythonSingleRParTok,    ## )
    pythonSingleAsteriskTok, ## *
    pythonDoubleAsteriskTok, ## **
    pythonDoubleAsteriskSingleEqualTok, ## **=
    pythonSingleAsteriskSingleEqualTok, ## *=
    pythonSinglePlusTok,    ## +
    pythonSinglePlusSingleEqualTok, ## +=
    pythonSingleCommaTok,   ## ,
    pythonSingleMinusTok,   ## -
    pythonSingleMinusSingleEqualTok, ## -=
    pythonSingleMinusSingleGreaterThanTok, ## ->
    pythonSingleDotTok,     ## .
    pythonSingleSlashTok,   ## /
    pythonDoubleSlashTok,   ## //
    pythonDoubleSlashSingleEqualTok, ## //=
    pythonSingleSlashSingleEqualTok, ## /=
    pythonSingleColonTok,   ## :
    pythonSingleColonSingleEqualTok, ## :=
    pythonSingleLessThanTok, ## <
    pythonDoubleLessThanTok, ## <<
    pythonDoubleLessThanSingleEqualTok, ## <<=
    pythonSingleLessThanSingleEqualTok, ## <=
    pythonSingleLessThanSingleGreaterThanTok, ## <>
    pythonSingleEqualTok,   ## =
    pythonDoubleEqualTok,   ## ==
    pythonSingleGreaterThanTok, ## >
    pythonSingleGreaterThanSingleEqualTok, ## >=
    pythonDoubleGreaterThanTok, ## >>
    pythonDoubleGreaterThanSingleEqualTok, ## >>=
    pythonSingleAtTok,      ## @
    pythonSingleAtSingleEqualTok, ## @=
    pythonSingleLBrackTok,  ## [
    pythonSingleRBrackTok,  ## ]
    pythonSingleAccentTok,  ## ^
    pythonSingleAccentSingleEqualTok, ## ^=
    pythonFutureTok,        ## __future__
    pythonAndTok,           ## and
    pythonAsTok,            ## as
    pythonAssertTok,        ## assert
    pythonAsyncTok,         ## async
    pythonAwaitTok,         ## await
    pythonBreakTok,         ## break
    pythonClassTok,         ## class
    pythonComment,          ## comment
    pythonContinueTok,      ## continue
    pythonDefTok,           ## def
    pythonDelTok,           ## del
    pythonElifTok,          ## elif
    pythonEllipsis,         ## ellipsis
    pythonElseTok,          ## else
    pythonEscapeSequence,   ## escape_sequence
    pythonExceptTok,        ## except
    pythonExecTok,          ## exec
    pythonFalse,            ## false
    pythonFinallyTok,       ## finally
    pythonFloat,            ## float
    pythonForTok,           ## for
    pythonFromTok,          ## from
    pythonGlobalTok,        ## global
    pythonIdentifier,       ## identifier
    pythonIfTok,            ## if
    pythonImportTok,        ## import
    pythonInTok,            ## in
    pythonInteger,          ## integer
    pythonIsTok,            ## is
    pythonLambdaTok,        ## lambda
    pythonNone,             ## none
    pythonNonlocalTok,      ## nonlocal
    pythonNotTok,           ## not
    pythonOrTok,            ## or
    pythonPassTok,          ## pass
    pythonPrintTok,         ## print
    pythonRaiseTok,         ## raise
    pythonReturnTok,        ## return
    pythonTrue,             ## true
    pythonTryTok,           ## try
    pythonTypeConversion,   ## type_conversion
    pythonWhileTok,         ## while
    pythonWithTok,          ## with
    pythonYieldTok,         ## yield
    pythonSingleLCurlyTok,  ## {
    pythonSinglePipeTok,    ## |
    pythonSinglePipeSingleEqualTok, ## |=
    pythonSingleRCurlyTok,  ## }
    pythonSingleTildeTok,   ## ~
    pythonSyntaxError        ## Tree-sitter parser syntax error
type
  PythonExternalTok* = enum
    pythonExtern_newline,   ## _newline
    pythonExtern_indent,    ## _indent
    pythonExtern_dedent,    ## _dedent
    pythonExtern_string_start, ## _string_start
    pythonExtern_string_content, ## _string_content
    pythonExtern_string_end  ## _string_end
type
  PythonNode* = distinct TSNode
type
  PythonParser* = distinct PtsParser
proc tsNodeType*(node: PythonNode): string
proc kind*(node: PythonNode): PythonNodeKind =
  case node.tsNodeType
  of "_compound_statement":
    pythonCompoundStatement
  of "_simple_statement":
    pythonSimpleStatement
  of "expression":
    pythonExpression
  of "parameter":
    pythonParameter
  of "pattern":
    pythonPattern
  of "primary_expression":
    pythonPrimaryExpression
  of "aliased_import":
    pythonAliasedImport
  of "argument_list":
    pythonArgumentList
  of "assert_statement":
    pythonAssertStatement
  of "assignment":
    pythonAssignment
  of "attribute":
    pythonAttribute
  of "augmented_assignment":
    pythonAugmentedAssignment
  of "await":
    pythonAwait
  of "binary_operator":
    pythonBinaryOperator
  of "block":
    pythonBlock
  of "boolean_operator":
    pythonBooleanOperator
  of "break_statement":
    pythonBreakStatement
  of "call":
    pythonCall
  of "chevron":
    pythonChevron
  of "class_definition":
    pythonClassDefinition
  of "comparison_operator":
    pythonComparisonOperator
  of "concatenated_string":
    pythonConcatenatedString
  of "conditional_expression":
    pythonConditionalExpression
  of "continue_statement":
    pythonContinueStatement
  of "decorated_definition":
    pythonDecoratedDefinition
  of "decorator":
    pythonDecorator
  of "default_parameter":
    pythonDefaultParameter
  of "delete_statement":
    pythonDeleteStatement
  of "dictionary":
    pythonDictionary
  of "dictionary_comprehension":
    pythonDictionaryComprehension
  of "dictionary_splat":
    pythonDictionarySplat
  of "dictionary_splat_pattern":
    pythonDictionarySplatPattern
  of "dotted_name":
    pythonDottedName
  of "elif_clause":
    pythonElifClause
  of "else_clause":
    pythonElseClause
  of "except_clause":
    pythonExceptClause
  of "exec_statement":
    pythonExecStatement
  of "expression_list":
    pythonExpressionList
  of "expression_statement":
    pythonExpressionStatement
  of "finally_clause":
    pythonFinallyClause
  of "for_in_clause":
    pythonForInClause
  of "for_statement":
    pythonForStatement
  of "format_expression":
    pythonFormatExpression
  of "format_specifier":
    pythonFormatSpecifier
  of "function_definition":
    pythonFunctionDefinition
  of "future_import_statement":
    pythonFutureImportStatement
  of "generator_expression":
    pythonGeneratorExpression
  of "global_statement":
    pythonGlobalStatement
  of "if_clause":
    pythonIfClause
  of "if_statement":
    pythonIfStatement
  of "import_from_statement":
    pythonImportFromStatement
  of "import_prefix":
    pythonImportPrefix
  of "import_statement":
    pythonImportStatement
  of "interpolation":
    pythonInterpolation
  of "keyword_argument":
    pythonKeywordArgument
  of "lambda":
    pythonLambda
  of "lambda_parameters":
    pythonLambdaParameters
  of "list":
    pythonList
  of "list_comprehension":
    pythonListComprehension
  of "list_pattern":
    pythonListPattern
  of "list_splat":
    pythonListSplat
  of "list_splat_pattern":
    pythonListSplatPattern
  of "module":
    pythonModule
  of "named_expression":
    pythonNamedExpression
  of "nonlocal_statement":
    pythonNonlocalStatement
  of "not_operator":
    pythonNotOperator
  of "pair":
    pythonPair
  of "parameters":
    pythonParameters
  of "parenthesized_expression":
    pythonParenthesizedExpression
  of "parenthesized_list_splat":
    pythonParenthesizedListSplat
  of "pass_statement":
    pythonPassStatement
  of "pattern_list":
    pythonPatternList
  of "print_statement":
    pythonPrintStatement
  of "raise_statement":
    pythonRaiseStatement
  of "relative_import":
    pythonRelativeImport
  of "return_statement":
    pythonReturnStatement
  of "set":
    pythonSet
  of "set_comprehension":
    pythonSetComprehension
  of "slice":
    pythonSlice
  of "string":
    pythonString
  of "subscript":
    pythonSubscript
  of "try_statement":
    pythonTryStatement
  of "tuple":
    pythonTuple
  of "tuple_pattern":
    pythonTuplePattern
  of "type":
    pythonType
  of "typed_default_parameter":
    pythonTypedDefaultParameter
  of "typed_parameter":
    pythonTypedParameter
  of "unary_operator":
    pythonUnaryOperator
  of "while_statement":
    pythonWhileStatement
  of "wildcard_import":
    pythonWildcardImport
  of "with_item":
    pythonWithItem
  of "with_statement":
    pythonWithStatement
  of "yield":
    pythonYield
  of "!=":
    pythonSingleExclamationSingleEqualTok
  of "\"":
    pythonSingleQuoteTok
  of "%":
    pythonSinglePercentTok
  of "%=":
    pythonSinglePercentSingleEqualTok
  of "&":
    pythonSingleAmpersandTok
  of "&=":
    pythonSingleAmpersandSingleEqualTok
  of "(":
    pythonSingleLParTok
  of ")":
    pythonSingleRParTok
  of "*":
    pythonSingleAsteriskTok
  of "**":
    pythonDoubleAsteriskTok
  of "**=":
    pythonDoubleAsteriskSingleEqualTok
  of "*=":
    pythonSingleAsteriskSingleEqualTok
  of "+":
    pythonSinglePlusTok
  of "+=":
    pythonSinglePlusSingleEqualTok
  of ",":
    pythonSingleCommaTok
  of "-":
    pythonSingleMinusTok
  of "-=":
    pythonSingleMinusSingleEqualTok
  of "->":
    pythonSingleMinusSingleGreaterThanTok
  of ".":
    pythonSingleDotTok
  of "/":
    pythonSingleSlashTok
  of "//":
    pythonDoubleSlashTok
  of "//=":
    pythonDoubleSlashSingleEqualTok
  of "/=":
    pythonSingleSlashSingleEqualTok
  of ":":
    pythonSingleColonTok
  of ":=":
    pythonSingleColonSingleEqualTok
  of "<":
    pythonSingleLessThanTok
  of "<<":
    pythonDoubleLessThanTok
  of "<<=":
    pythonDoubleLessThanSingleEqualTok
  of "<=":
    pythonSingleLessThanSingleEqualTok
  of "<>":
    pythonSingleLessThanSingleGreaterThanTok
  of "=":
    pythonSingleEqualTok
  of "==":
    pythonDoubleEqualTok
  of ">":
    pythonSingleGreaterThanTok
  of ">=":
    pythonSingleGreaterThanSingleEqualTok
  of ">>":
    pythonDoubleGreaterThanTok
  of ">>=":
    pythonDoubleGreaterThanSingleEqualTok
  of "@":
    pythonSingleAtTok
  of "@=":
    pythonSingleAtSingleEqualTok
  of "[":
    pythonSingleLBrackTok
  of "]":
    pythonSingleRBrackTok
  of "^":
    pythonSingleAccentTok
  of "^=":
    pythonSingleAccentSingleEqualTok
  of "__future__":
    pythonFutureTok
  of "and":
    pythonAndTok
  of "as":
    pythonAsTok
  of "assert":
    pythonAssertTok
  of "async":
    pythonAsyncTok
  of "break":
    pythonBreakTok
  of "class":
    pythonClassTok
  of "comment":
    pythonComment
  of "continue":
    pythonContinueTok
  of "def":
    pythonDefTok
  of "del":
    pythonDelTok
  of "elif":
    pythonElifTok
  of "ellipsis":
    pythonEllipsis
  of "else":
    pythonElseTok
  of "escape_sequence":
    pythonEscapeSequence
  of "except":
    pythonExceptTok
  of "exec":
    pythonExecTok
  of "false":
    pythonFalse
  of "finally":
    pythonFinallyTok
  of "float":
    pythonFloat
  of "for":
    pythonForTok
  of "from":
    pythonFromTok
  of "global":
    pythonGlobalTok
  of "identifier":
    pythonIdentifier
  of "if":
    pythonIfTok
  of "import":
    pythonImportTok
  of "in":
    pythonInTok
  of "integer":
    pythonInteger
  of "is":
    pythonIsTok
  of "none":
    pythonNone
  of "nonlocal":
    pythonNonlocalTok
  of "not":
    pythonNotTok
  of "or":
    pythonOrTok
  of "pass":
    pythonPassTok
  of "print":
    pythonPrintTok
  of "raise":
    pythonRaiseTok
  of "return":
    pythonReturnTok
  of "true":
    pythonTrue
  of "try":
    pythonTryTok
  of "type_conversion":
    pythonTypeConversion
  of "while":
    pythonWhileTok
  of "with":
    pythonWithTok
  of "{":
    pythonSingleLCurlyTok
  of "|":
    pythonSinglePipeTok
  of "|=":
    pythonSinglePipeSingleEqualTok
  of "}":
    pythonSingleRCurlyTok
  of "~":
    pythonSingleTildeTok
  of "ERROR":
    pythonSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_python(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: PythonNode): string =
  $ts_node_type(TSNode(node))

proc newPythonParser*(): PythonParser =
  result = PythonParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_python())

proc parseString*(parser: PythonParser; str: string): PythonNode =
  PythonNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: PythonNode; idx: int; withUnnamed: bool = false): PythonNode =
  if withUnnamed:
    PythonNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    PythonNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: PythonNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: PythonNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: PythonNode; withUnnamed: bool = false): PythonNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: PythonNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: PythonNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: PythonNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[6 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
