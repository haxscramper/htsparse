
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  JavascriptNodeKind* = enum
    javascriptDeclaration,  ## _declaration
    javascriptDestructuringPattern, ## _destructuring_pattern
    javascriptExpression,   ## _expression
    javascriptStatement,    ## _statement
    javascriptArguments,    ## arguments
    javascriptArray,        ## array
    javascriptArrayPattern, ## array_pattern
    javascriptArrowFunction, ## arrow_function
    javascriptAssignmentExpression, ## assignment_expression
    javascriptAssignmentPattern, ## assignment_pattern
    javascriptAugmentedAssignmentExpression, ## augmented_assignment_expression
    javascriptAwaitExpression, ## await_expression
    javascriptBinaryExpression, ## binary_expression
    javascriptBreakStatement, ## break_statement
    javascriptCallExpression, ## call_expression
    javascriptCatchClause,  ## catch_clause
    javascriptClass,        ## class
    javascriptClassBody,    ## class_body
    javascriptClassDeclaration, ## class_declaration
    javascriptClassHeritage, ## class_heritage
    javascriptComputedPropertyName, ## computed_property_name
    javascriptContinueStatement, ## continue_statement
    javascriptDebuggerStatement, ## debugger_statement
    javascriptDecorator,    ## decorator
    javascriptDoStatement,  ## do_statement
    javascriptElseClause,   ## else_clause
    javascriptEmptyStatement, ## empty_statement
    javascriptExportClause, ## export_clause
    javascriptExportSpecifier, ## export_specifier
    javascriptExportStatement, ## export_statement
    javascriptExpressionStatement, ## expression_statement
    javascriptFinallyClause, ## finally_clause
    javascriptForInStatement, ## for_in_statement
    javascriptForStatement, ## for_statement
    javascriptFormalParameters, ## formal_parameters
    javascriptFunction,     ## function
    javascriptFunctionDeclaration, ## function_declaration
    javascriptGeneratorFunction, ## generator_function
    javascriptGeneratorFunctionDeclaration, ## generator_function_declaration
    javascriptIfStatement,  ## if_statement
    javascriptImport,       ## import
    javascriptImportClause, ## import_clause
    javascriptImportSpecifier, ## import_specifier
    javascriptImportStatement, ## import_statement
    javascriptJsxAttribute, ## jsx_attribute
    javascriptJsxClosingElement, ## jsx_closing_element
    javascriptJsxElement,   ## jsx_element
    javascriptJsxExpression, ## jsx_expression
    javascriptJsxFragment,  ## jsx_fragment
    javascriptJsxNamespaceName, ## jsx_namespace_name
    javascriptJsxOpeningElement, ## jsx_opening_element
    javascriptJsxSelfClosingElement, ## jsx_self_closing_element
    javascriptLabeledStatement, ## labeled_statement
    javascriptLexicalDeclaration, ## lexical_declaration
    javascriptMemberExpression, ## member_expression
    javascriptMetaProperty, ## meta_property
    javascriptMethodDefinition, ## method_definition
    javascriptNamedImports, ## named_imports
    javascriptNamespaceImport, ## namespace_import
    javascriptNestedIdentifier, ## nested_identifier
    javascriptNewExpression, ## new_expression
    javascriptObject,       ## object
    javascriptObjectPattern, ## object_pattern
    javascriptPair,         ## pair
    javascriptParenthesizedExpression, ## parenthesized_expression
    javascriptProgram,      ## program
    javascriptPublicFieldDefinition, ## public_field_definition
    javascriptRegex,        ## regex
    javascriptRestParameter, ## rest_parameter
    javascriptReturnStatement, ## return_statement
    javascriptSequenceExpression, ## sequence_expression
    javascriptSpreadElement, ## spread_element
    javascriptStatementBlock, ## statement_block
    javascriptString,       ## string
    javascriptSubscriptExpression, ## subscript_expression
    javascriptSwitchBody,   ## switch_body
    javascriptSwitchCase,   ## switch_case
    javascriptSwitchDefault, ## switch_default
    javascriptSwitchStatement, ## switch_statement
    javascriptTemplateString, ## template_string
    javascriptTemplateSubstitution, ## template_substitution
    javascriptTernaryExpression, ## ternary_expression
    javascriptThrowStatement, ## throw_statement
    javascriptTryStatement, ## try_statement
    javascriptUnaryExpression, ## unary_expression
    javascriptUpdateExpression, ## update_expression
    javascriptVariableDeclaration, ## variable_declaration
    javascriptVariableDeclarator, ## variable_declarator
    javascriptWhileStatement, ## while_statement
    javascriptWithStatement, ## with_statement
    javascriptYieldExpression, ## yield_expression
    javascriptExclamationTok, ## !
    javascriptExclamationEqualTok, ## !=
    javascriptExclamationDoubleEqualTok, ## !==
    javascriptQuoteTok,     ## "
    javascriptDollarLCurlyTok, ## ${
    javascriptPercentTok,   ## %
    javascriptPercentEqualTok, ## %=
    javascriptAmpersandTok, ## &
    javascriptDoubleAmpersandTok, ## &&
    javascriptDoubleAmpersandEqualTok, ## &&=
    javascriptAmpersandEqualTok, ## &=
    javascriptApostropheTok, ## '
    javascriptLParTok,      ## (
    javascriptRParTok,      ## )
    javascriptAsteriskTok,  ## *
    javascriptDoubleAsteriskTok, ## **
    javascriptDoubleAsteriskEqualTok, ## **=
    javascriptAsteriskEqualTok, ## *=
    javascriptPlusTok,      ## +
    javascriptDoublePlusTok, ## ++
    javascriptPlusEqualTok, ## +=
    javascriptCommaTok,     ## ,
    javascriptMinusTok,     ## -
    javascriptDoubleMinusTok, ## --
    javascriptMinusEqualTok, ## -=
    javascriptDotTok,       ## .
    javascriptTripleDotTok, ## ...
    javascriptSlashTok,     ## /
    javascriptSlashEqualTok, ## /=
    javascriptColonTok,     ## :
    javascriptSemicolonTok, ## ;
    javascriptLessThanTok,  ## <
    javascriptDoubleLessThanTok, ## <<
    javascriptDoubleLessThanEqualTok, ## <<=
    javascriptLessThanEqualTok, ## <=
    javascriptEqualTok,     ## =
    javascriptDoubleEqualTok, ## ==
    javascriptTripleEqualTok, ## ===
    javascriptEqualGreaterThanTok, ## =>
    javascriptGreaterThanTok, ## >
    javascriptGreaterThanEqualTok, ## >=
    javascriptDoubleGreaterThanTok, ## >>
    javascriptDoubleGreaterThanEqualTok, ## >>=
    javascriptTripleGreaterThanTok, ## >>>
    javascriptTripleGreaterThanEqualTok, ## >>>=
    javascriptQuestionTok,  ## ?
    javascriptQuestionDotTok, ## ?.
    javascriptDoubleQuestionTok, ## ??
    javascriptDoubleQuestionEqualTok, ## ??=
    javascriptAtTok,        ## @
    javascriptLBrackTok,    ## [
    javascriptRBrackTok,    ## ]
    javascriptAccentTok,    ## ^
    javascriptAccentEqualTok, ## ^=
    javascriptBacktickTok,  ## `
    javascriptAsTok,        ## as
    javascriptAsyncTok,     ## async
    javascriptAwaitTok,     ## await
    javascriptBreakTok,     ## break
    javascriptCaseTok,      ## case
    javascriptCatchTok,     ## catch
    javascriptClassTok,     ## class
    javascriptComment,      ## comment
    javascriptConstTok,     ## const
    javascriptContinueTok,  ## continue
    javascriptDebuggerTok,  ## debugger
    javascriptDefaultTok,   ## default
    javascriptDeleteTok,    ## delete
    javascriptDoTok,        ## do
    javascriptElseTok,      ## else
    javascriptEscapeSequence, ## escape_sequence
    javascriptExportTok,    ## export
    javascriptExtendsTok,   ## extends
    javascriptFalse,        ## false
    javascriptFinallyTok,   ## finally
    javascriptForTok,       ## for
    javascriptFromTok,      ## from
    javascriptFunctionTok,  ## function
    javascriptGetTok,       ## get
    javascriptHashBangLine, ## hash_bang_line
    javascriptIdentifier,   ## identifier
    javascriptIfTok,        ## if
    javascriptImportTok,    ## import
    javascriptInTok,        ## in
    javascriptInstanceofTok, ## instanceof
    javascriptJsxText,      ## jsx_text
    javascriptLetTok,       ## let
    javascriptNewTok,       ## new
    javascriptNull,         ## null
    javascriptNumber,       ## number
    javascriptOfTok,        ## of
    javascriptPropertyIdentifier, ## property_identifier
    javascriptRegexFlags,   ## regex_flags
    javascriptRegexPattern, ## regex_pattern
    javascriptReturnTok,    ## return
    javascriptSetTok,       ## set
    javascriptShorthandPropertyIdentifier, ## shorthand_property_identifier
    javascriptStatementIdentifier, ## statement_identifier
    javascriptStaticTok,    ## static
    javascriptSuper,        ## super
    javascriptSwitchTok,    ## switch
    javascriptTargetTok,    ## target
    javascriptThis,         ## this
    javascriptThrowTok,     ## throw
    javascriptTrue,         ## true
    javascriptTryTok,       ## try
    javascriptTypeofTok,    ## typeof
    javascriptUndefined,    ## undefined
    javascriptVarTok,       ## var
    javascriptVoidTok,      ## void
    javascriptWhileTok,     ## while
    javascriptWithTok,      ## with
    javascriptYieldTok,     ## yield
    javascriptLCurlyTok,    ## {
    javascriptPipeTok,      ## |
    javascriptPipeEqualTok, ## |=
    javascriptDoublePipeTok, ## ||
    javascriptDoublePipeEqualTok, ## ||=
    javascriptRCurlyTok,    ## }
    javascriptTildeTok,     ## ~
    javascriptComment2,     ## comment
    javascriptSyntaxError    ## Tree-sitter parser syntax error
type
  JavascriptExternalTok* = enum
    javascriptExtern_automatic_semicolon, ## _automatic_semicolon
    javascriptExtern_template_chars ## _template_chars
type
  JavascriptNode* = distinct TSNode
type
  JavascriptParser* = distinct PtsParser
proc tsNodeType*(node: JavascriptNode): string
proc kind*(node: JavascriptNode): JavascriptNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_declaration":
      javascriptDeclaration
    of "_destructuring_pattern":
      javascriptDestructuringPattern
    of "_expression":
      javascriptExpression
    of "_statement":
      javascriptStatement
    of "arguments":
      javascriptArguments
    of "array":
      javascriptArray
    of "array_pattern":
      javascriptArrayPattern
    of "arrow_function":
      javascriptArrowFunction
    of "assignment_expression":
      javascriptAssignmentExpression
    of "assignment_pattern":
      javascriptAssignmentPattern
    of "augmented_assignment_expression":
      javascriptAugmentedAssignmentExpression
    of "await_expression":
      javascriptAwaitExpression
    of "binary_expression":
      javascriptBinaryExpression
    of "break_statement":
      javascriptBreakStatement
    of "call_expression":
      javascriptCallExpression
    of "catch_clause":
      javascriptCatchClause
    of "class":
      javascriptClass
    of "class_body":
      javascriptClassBody
    of "class_declaration":
      javascriptClassDeclaration
    of "class_heritage":
      javascriptClassHeritage
    of "computed_property_name":
      javascriptComputedPropertyName
    of "continue_statement":
      javascriptContinueStatement
    of "debugger_statement":
      javascriptDebuggerStatement
    of "decorator":
      javascriptDecorator
    of "do_statement":
      javascriptDoStatement
    of "else_clause":
      javascriptElseClause
    of "empty_statement":
      javascriptEmptyStatement
    of "export_clause":
      javascriptExportClause
    of "export_specifier":
      javascriptExportSpecifier
    of "export_statement":
      javascriptExportStatement
    of "expression_statement":
      javascriptExpressionStatement
    of "finally_clause":
      javascriptFinallyClause
    of "for_in_statement":
      javascriptForInStatement
    of "for_statement":
      javascriptForStatement
    of "formal_parameters":
      javascriptFormalParameters
    of "function":
      javascriptFunction
    of "function_declaration":
      javascriptFunctionDeclaration
    of "generator_function":
      javascriptGeneratorFunction
    of "generator_function_declaration":
      javascriptGeneratorFunctionDeclaration
    of "if_statement":
      javascriptIfStatement
    of "import":
      javascriptImport
    of "import_clause":
      javascriptImportClause
    of "import_specifier":
      javascriptImportSpecifier
    of "import_statement":
      javascriptImportStatement
    of "jsx_attribute":
      javascriptJsxAttribute
    of "jsx_closing_element":
      javascriptJsxClosingElement
    of "jsx_element":
      javascriptJsxElement
    of "jsx_expression":
      javascriptJsxExpression
    of "jsx_fragment":
      javascriptJsxFragment
    of "jsx_namespace_name":
      javascriptJsxNamespaceName
    of "jsx_opening_element":
      javascriptJsxOpeningElement
    of "jsx_self_closing_element":
      javascriptJsxSelfClosingElement
    of "labeled_statement":
      javascriptLabeledStatement
    of "lexical_declaration":
      javascriptLexicalDeclaration
    of "member_expression":
      javascriptMemberExpression
    of "meta_property":
      javascriptMetaProperty
    of "method_definition":
      javascriptMethodDefinition
    of "named_imports":
      javascriptNamedImports
    of "namespace_import":
      javascriptNamespaceImport
    of "nested_identifier":
      javascriptNestedIdentifier
    of "new_expression":
      javascriptNewExpression
    of "object":
      javascriptObject
    of "object_pattern":
      javascriptObjectPattern
    of "pair":
      javascriptPair
    of "parenthesized_expression":
      javascriptParenthesizedExpression
    of "program":
      javascriptProgram
    of "public_field_definition":
      javascriptPublicFieldDefinition
    of "regex":
      javascriptRegex
    of "rest_parameter":
      javascriptRestParameter
    of "return_statement":
      javascriptReturnStatement
    of "sequence_expression":
      javascriptSequenceExpression
    of "spread_element":
      javascriptSpreadElement
    of "statement_block":
      javascriptStatementBlock
    of "string":
      javascriptString
    of "subscript_expression":
      javascriptSubscriptExpression
    of "switch_body":
      javascriptSwitchBody
    of "switch_case":
      javascriptSwitchCase
    of "switch_default":
      javascriptSwitchDefault
    of "switch_statement":
      javascriptSwitchStatement
    of "template_string":
      javascriptTemplateString
    of "template_substitution":
      javascriptTemplateSubstitution
    of "ternary_expression":
      javascriptTernaryExpression
    of "throw_statement":
      javascriptThrowStatement
    of "try_statement":
      javascriptTryStatement
    of "unary_expression":
      javascriptUnaryExpression
    of "update_expression":
      javascriptUpdateExpression
    of "variable_declaration":
      javascriptVariableDeclaration
    of "variable_declarator":
      javascriptVariableDeclarator
    of "while_statement":
      javascriptWhileStatement
    of "with_statement":
      javascriptWithStatement
    of "yield_expression":
      javascriptYieldExpression
    of "!":
      javascriptExclamationTok
    of "!=":
      javascriptExclamationEqualTok
    of "!==":
      javascriptExclamationDoubleEqualTok
    of "\"":
      javascriptQuoteTok
    of "${":
      javascriptDollarLCurlyTok
    of "%":
      javascriptPercentTok
    of "%=":
      javascriptPercentEqualTok
    of "&":
      javascriptAmpersandTok
    of "&&":
      javascriptDoubleAmpersandTok
    of "&&=":
      javascriptDoubleAmpersandEqualTok
    of "&=":
      javascriptAmpersandEqualTok
    of "\'":
      javascriptApostropheTok
    of "(":
      javascriptLParTok
    of ")":
      javascriptRParTok
    of "*":
      javascriptAsteriskTok
    of "**":
      javascriptDoubleAsteriskTok
    of "**=":
      javascriptDoubleAsteriskEqualTok
    of "*=":
      javascriptAsteriskEqualTok
    of "+":
      javascriptPlusTok
    of "++":
      javascriptDoublePlusTok
    of "+=":
      javascriptPlusEqualTok
    of ",":
      javascriptCommaTok
    of "-":
      javascriptMinusTok
    of "--":
      javascriptDoubleMinusTok
    of "-=":
      javascriptMinusEqualTok
    of ".":
      javascriptDotTok
    of "...":
      javascriptTripleDotTok
    of "/":
      javascriptSlashTok
    of "/=":
      javascriptSlashEqualTok
    of ":":
      javascriptColonTok
    of ";":
      javascriptSemicolonTok
    of "<":
      javascriptLessThanTok
    of "<<":
      javascriptDoubleLessThanTok
    of "<<=":
      javascriptDoubleLessThanEqualTok
    of "<=":
      javascriptLessThanEqualTok
    of "=":
      javascriptEqualTok
    of "==":
      javascriptDoubleEqualTok
    of "===":
      javascriptTripleEqualTok
    of "=>":
      javascriptEqualGreaterThanTok
    of ">":
      javascriptGreaterThanTok
    of ">=":
      javascriptGreaterThanEqualTok
    of ">>":
      javascriptDoubleGreaterThanTok
    of ">>=":
      javascriptDoubleGreaterThanEqualTok
    of ">>>":
      javascriptTripleGreaterThanTok
    of ">>>=":
      javascriptTripleGreaterThanEqualTok
    of "?":
      javascriptQuestionTok
    of "?.":
      javascriptQuestionDotTok
    of "??":
      javascriptDoubleQuestionTok
    of "??=":
      javascriptDoubleQuestionEqualTok
    of "@":
      javascriptAtTok
    of "[":
      javascriptLBrackTok
    of "]":
      javascriptRBrackTok
    of "^":
      javascriptAccentTok
    of "^=":
      javascriptAccentEqualTok
    of "`":
      javascriptBacktickTok
    of "as":
      javascriptAsTok
    of "async":
      javascriptAsyncTok
    of "await":
      javascriptAwaitTok
    of "break":
      javascriptBreakTok
    of "case":
      javascriptCaseTok
    of "catch":
      javascriptCatchTok
    of "comment":
      javascriptComment2
    of "const":
      javascriptConstTok
    of "continue":
      javascriptContinueTok
    of "debugger":
      javascriptDebuggerTok
    of "default":
      javascriptDefaultTok
    of "delete":
      javascriptDeleteTok
    of "do":
      javascriptDoTok
    of "else":
      javascriptElseTok
    of "escape_sequence":
      javascriptEscapeSequence
    of "export":
      javascriptExportTok
    of "extends":
      javascriptExtendsTok
    of "false":
      javascriptFalse
    of "finally":
      javascriptFinallyTok
    of "for":
      javascriptForTok
    of "from":
      javascriptFromTok
    of "get":
      javascriptGetTok
    of "hash_bang_line":
      javascriptHashBangLine
    of "identifier":
      javascriptIdentifier
    of "if":
      javascriptIfTok
    of "in":
      javascriptInTok
    of "instanceof":
      javascriptInstanceofTok
    of "jsx_text":
      javascriptJsxText
    of "let":
      javascriptLetTok
    of "new":
      javascriptNewTok
    of "null":
      javascriptNull
    of "number":
      javascriptNumber
    of "of":
      javascriptOfTok
    of "property_identifier":
      javascriptPropertyIdentifier
    of "regex_flags":
      javascriptRegexFlags
    of "regex_pattern":
      javascriptRegexPattern
    of "return":
      javascriptReturnTok
    of "set":
      javascriptSetTok
    of "shorthand_property_identifier":
      javascriptShorthandPropertyIdentifier
    of "statement_identifier":
      javascriptStatementIdentifier
    of "static":
      javascriptStaticTok
    of "super":
      javascriptSuper
    of "switch":
      javascriptSwitchTok
    of "target":
      javascriptTargetTok
    of "this":
      javascriptThis
    of "throw":
      javascriptThrowTok
    of "true":
      javascriptTrue
    of "try":
      javascriptTryTok
    of "typeof":
      javascriptTypeofTok
    of "undefined":
      javascriptUndefined
    of "var":
      javascriptVarTok
    of "void":
      javascriptVoidTok
    of "while":
      javascriptWhileTok
    of "with":
      javascriptWithTok
    of "yield":
      javascriptYieldTok
    of "{":
      javascriptLCurlyTok
    of "|":
      javascriptPipeTok
    of "|=":
      javascriptPipeEqualTok
    of "||":
      javascriptDoublePipeTok
    of "||=":
      javascriptDoublePipeEqualTok
    of "}":
      javascriptRCurlyTok
    of "~":
      javascriptTildeTok
    of "ERROR":
      javascriptSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_javascript(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: JavascriptNode): string =
  $ts_node_type(TSNode(node))

proc newJavascriptParser*(): JavascriptParser =
  result = JavascriptParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_javascript())

proc parseString*(parser: JavascriptParser; str: string): JavascriptNode =
  JavascriptNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser),
      nil, str.cstring, uint32(len(str)))))

proc parseJavascriptString*(str: string): JavascriptNode =
  let parser = newJavascriptParser()
  return parseString(parser, str)

func `[]`*(node: JavascriptNode; idx: int; withUnnamed: bool = false): JavascriptNode =
  if withUnnamed:
    JavascriptNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    JavascriptNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: JavascriptNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: JavascriptNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: JavascriptNode; withUnnamed: bool = false): JavascriptNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: JavascriptNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: JavascriptNode; instr: string;
               withUnnamed: bool = false): string =
  proc aux(node: JavascriptNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[10 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
