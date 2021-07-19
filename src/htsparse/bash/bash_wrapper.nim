
import
  hmisc / wrappers / treesitter

import
  strutils

type
  BashNodeKind* = enum
    bashExpression,         ## _expression
    bashPrimaryExpression,  ## _primary_expression
    bashStatement,          ## _statement
    bashArray,              ## array
    bashBinaryExpression,   ## binary_expression
    bashCStyleForStatement, ## c_style_for_statement
    bashCaseItem,           ## case_item
    bashCaseStatement,      ## case_statement
    bashCommand,            ## command
    bashCommandName,        ## command_name
    bashCommandSubstitution, ## command_substitution
    bashCompoundStatement,  ## compound_statement
    bashConcatenation,      ## concatenation
    bashDeclarationCommand, ## declaration_command
    bashDoGroup,            ## do_group
    bashElifClause,         ## elif_clause
    bashElseClause,         ## else_clause
    bashExpansion,          ## expansion
    bashFileRedirect,       ## file_redirect
    bashForStatement,       ## for_statement
    bashFunctionDefinition, ## function_definition
    bashHeredocBody,        ## heredoc_body
    bashHeredocRedirect,    ## heredoc_redirect
    bashHerestringRedirect, ## herestring_redirect
    bashIfStatement,        ## if_statement
    bashList,               ## list
    bashNegatedCommand,     ## negated_command
    bashParenthesizedExpression, ## parenthesized_expression
    bashPipeline,           ## pipeline
    bashPostfixExpression,  ## postfix_expression
    bashProcessSubstitution, ## process_substitution
    bashProgram,            ## program
    bashRedirectedStatement, ## redirected_statement
    bashSimpleExpansion,    ## simple_expansion
    bashString,             ## string
    bashStringExpansion,    ## string_expansion
    bashSubscript,          ## subscript
    bashSubshell,           ## subshell
    bashTernaryExpression,  ## ternary_expression
    bashTestCommand,        ## test_command
    bashUnaryExpression,    ## unary_expression
    bashUnsetCommand,       ## unset_command
    bashVariableAssignment, ## variable_assignment
    bashWhileStatement,     ## while_statement
    bashWord,               ## word
    bashNewlineTok,         ## 
                             ## 
    bashExclamationTok,     ## !
    bashExclamationEqualTok, ## !=
    bashQuoteTok,           ## "
    bashHashTok,            ## #
    bashDollarTok,          ## $
    bashDollarLParTok,      ## $(
    bashDollarLCurlyTok,    ## ${
    bashPercentTok,         ## %
    bashAmpersandTok,       ## &
    bashDoubleAmpersandTok, ## &&
    bashAmpersandGreaterThanTok, ## &>
    bashAmpersandDoubleGreaterThanTok, ## &>>
    bashLParTok,            ## (
    bashDoubleLParTok,      ## ((
    bashRParTok,            ## )
    bashDoubleRParTok,      ## ))
    bashPlusTok,            ## +
    bashDoublePlusTok,      ## ++
    bashPlusEqualTok,       ## +=
    bashMinusTok,           ## -
    bashDoubleMinusTok,     ## --
    bashMinusEqualTok,      ## -=
    bashSlashTok,           ## /
    bashColonTok,           ## :
    bashColonMinusTok,      ## :-
    bashColonQuestionTok,   ## :?
    bashSemicolonTok,       ## ;
    bashSemicolonAmpersandTok, ## ;&
    bashDoubleSemicolonTok, ## ;;
    bashDoubleSemicolonAmpersandTok, ## ;;&
    bashLessThanTok,        ## <
    bashLessThanAmpersandTok, ## <&
    bashLessThanLParTok,    ## <(
    bashDoubleLessThanTok,  ## <<
    bashDoubleLessThanMinusTok, ## <<-
    bashTripleLessThanTok,  ## <<<
    bashLessThanEqualTok,   ## <=
    bashEqualTok,           ## =
    bashDoubleEqualTok,     ## ==
    bashEqualTildeTok,      ## =~
    bashGreaterThanTok,     ## >
    bashGreaterThanAmpersandTok, ## >&
    bashGreaterThanLParTok, ## >(
    bashGreaterThanEqualTok, ## >=
    bashDoubleGreaterThanTok, ## >>
    bashGreaterThanPipeTok, ## >|
    bashQuestionTok,        ## ?
    bashLBrackTok,          ## [
    bashDoubleLBrackTok,    ## [[
    bashRBrackTok,          ## ]
    bashDoubleRBrackTok,    ## ]]
    bashBacktickTok,        ## `
    bashAnsiiCString,       ## ansii_c_string
    bashCaseTok,            ## case
    bashComment,            ## comment
    bashDeclareTok,         ## declare
    bashDoTok,              ## do
    bashDoneTok,            ## done
    bashElifTok,            ## elif
    bashElseTok,            ## else
    bashEsacTok,            ## esac
    bashExportTok,          ## export
    bashFiTok,              ## fi
    bashFileDescriptor,     ## file_descriptor
    bashForTok,             ## for
    bashFunctionTok,        ## function
    bashHeredocStart,       ## heredoc_start
    bashIfTok,              ## if
    bashInTok,              ## in
    bashLocalTok,           ## local
    bashRawString,          ## raw_string
    bashReadonlyTok,        ## readonly
    bashRegex,              ## regex
    bashSpecialVariableName, ## special_variable_name
    bashTestOperator,       ## test_operator
    bashThenTok,            ## then
    bashTypesetTok,         ## typeset
    bashUnsetTok,           ## unset
    bashUnsetenvTok,        ## unsetenv
    bashVariableName,       ## variable_name
    bashWhileTok,           ## while
    bashLCurlyTok,          ## {
    bashPipeTok,            ## |
    bashPipeAmpersandTok,   ## |&
    bashDoublePipeTok,      ## ||
    bashRCurlyTok,          ## }
    bashSyntaxError          ## Tree-sitter parser syntax error
type
  BashExternalTok* = enum
    bashExternHeredoc_start, ## heredoc_start
    bashExtern_simple_heredoc_body, ## _simple_heredoc_body
    bashExtern_heredoc_body_beginning, ## _heredoc_body_beginning
    bashExtern_heredoc_body_middle, ## _heredoc_body_middle
    bashExtern_heredoc_body_end, ## _heredoc_body_end
    bashExternFile_descriptor, ## file_descriptor
    bashExtern_empty_value, ## _empty_value
    bashExtern_concat,      ## _concat
    bashExternVariable_name, ## variable_name
    bashExternRegex          ## regex
type
  BashNode* = distinct TSNode
type
  BashParser* = distinct PtsParser
proc tsNodeType*(node: BashNode): string
proc kind*(node: BashNode): BashNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_expression":
      bashExpression
    of "_primary_expression":
      bashPrimaryExpression
    of "_statement":
      bashStatement
    of "array":
      bashArray
    of "binary_expression":
      bashBinaryExpression
    of "c_style_for_statement":
      bashCStyleForStatement
    of "case_item":
      bashCaseItem
    of "case_statement":
      bashCaseStatement
    of "command":
      bashCommand
    of "command_name":
      bashCommandName
    of "command_substitution":
      bashCommandSubstitution
    of "compound_statement":
      bashCompoundStatement
    of "concatenation":
      bashConcatenation
    of "declaration_command":
      bashDeclarationCommand
    of "do_group":
      bashDoGroup
    of "elif_clause":
      bashElifClause
    of "else_clause":
      bashElseClause
    of "expansion":
      bashExpansion
    of "file_redirect":
      bashFileRedirect
    of "for_statement":
      bashForStatement
    of "function_definition":
      bashFunctionDefinition
    of "heredoc_body":
      bashHeredocBody
    of "heredoc_redirect":
      bashHeredocRedirect
    of "herestring_redirect":
      bashHerestringRedirect
    of "if_statement":
      bashIfStatement
    of "list":
      bashList
    of "negated_command":
      bashNegatedCommand
    of "parenthesized_expression":
      bashParenthesizedExpression
    of "pipeline":
      bashPipeline
    of "postfix_expression":
      bashPostfixExpression
    of "process_substitution":
      bashProcessSubstitution
    of "program":
      bashProgram
    of "redirected_statement":
      bashRedirectedStatement
    of "simple_expansion":
      bashSimpleExpansion
    of "string":
      bashString
    of "string_expansion":
      bashStringExpansion
    of "subscript":
      bashSubscript
    of "subshell":
      bashSubshell
    of "ternary_expression":
      bashTernaryExpression
    of "test_command":
      bashTestCommand
    of "unary_expression":
      bashUnaryExpression
    of "unset_command":
      bashUnsetCommand
    of "variable_assignment":
      bashVariableAssignment
    of "while_statement":
      bashWhileStatement
    of "word":
      bashWord
    of "\n":
      bashNewlineTok
    of "!":
      bashExclamationTok
    of "!=":
      bashExclamationEqualTok
    of "\"":
      bashQuoteTok
    of "#":
      bashHashTok
    of "$":
      bashDollarTok
    of "$(":
      bashDollarLParTok
    of "${":
      bashDollarLCurlyTok
    of "%":
      bashPercentTok
    of "&":
      bashAmpersandTok
    of "&&":
      bashDoubleAmpersandTok
    of "&>":
      bashAmpersandGreaterThanTok
    of "&>>":
      bashAmpersandDoubleGreaterThanTok
    of "(":
      bashLParTok
    of "((":
      bashDoubleLParTok
    of ")":
      bashRParTok
    of "))":
      bashDoubleRParTok
    of "+":
      bashPlusTok
    of "++":
      bashDoublePlusTok
    of "+=":
      bashPlusEqualTok
    of "-":
      bashMinusTok
    of "--":
      bashDoubleMinusTok
    of "-=":
      bashMinusEqualTok
    of "/":
      bashSlashTok
    of ":":
      bashColonTok
    of ":-":
      bashColonMinusTok
    of ":?":
      bashColonQuestionTok
    of ";":
      bashSemicolonTok
    of ";&":
      bashSemicolonAmpersandTok
    of ";;":
      bashDoubleSemicolonTok
    of ";;&":
      bashDoubleSemicolonAmpersandTok
    of "<":
      bashLessThanTok
    of "<&":
      bashLessThanAmpersandTok
    of "<(":
      bashLessThanLParTok
    of "<<":
      bashDoubleLessThanTok
    of "<<-":
      bashDoubleLessThanMinusTok
    of "<<<":
      bashTripleLessThanTok
    of "<=":
      bashLessThanEqualTok
    of "=":
      bashEqualTok
    of "==":
      bashDoubleEqualTok
    of "=~":
      bashEqualTildeTok
    of ">":
      bashGreaterThanTok
    of ">&":
      bashGreaterThanAmpersandTok
    of ">(":
      bashGreaterThanLParTok
    of ">=":
      bashGreaterThanEqualTok
    of ">>":
      bashDoubleGreaterThanTok
    of ">|":
      bashGreaterThanPipeTok
    of "?":
      bashQuestionTok
    of "[":
      bashLBrackTok
    of "[[":
      bashDoubleLBrackTok
    of "]":
      bashRBrackTok
    of "]]":
      bashDoubleRBrackTok
    of "`":
      bashBacktickTok
    of "ansii_c_string":
      bashAnsiiCString
    of "case":
      bashCaseTok
    of "comment":
      bashComment
    of "declare":
      bashDeclareTok
    of "do":
      bashDoTok
    of "done":
      bashDoneTok
    of "elif":
      bashElifTok
    of "else":
      bashElseTok
    of "esac":
      bashEsacTok
    of "export":
      bashExportTok
    of "fi":
      bashFiTok
    of "file_descriptor":
      bashFileDescriptor
    of "for":
      bashForTok
    of "function":
      bashFunctionTok
    of "heredoc_start":
      bashHeredocStart
    of "if":
      bashIfTok
    of "in":
      bashInTok
    of "local":
      bashLocalTok
    of "raw_string":
      bashRawString
    of "readonly":
      bashReadonlyTok
    of "regex":
      bashRegex
    of "special_variable_name":
      bashSpecialVariableName
    of "test_operator":
      bashTestOperator
    of "then":
      bashThenTok
    of "typeset":
      bashTypesetTok
    of "unset":
      bashUnsetTok
    of "unsetenv":
      bashUnsetenvTok
    of "variable_name":
      bashVariableName
    of "while":
      bashWhileTok
    of "{":
      bashLCurlyTok
    of "|":
      bashPipeTok
    of "|&":
      bashPipeAmpersandTok
    of "||":
      bashDoublePipeTok
    of "}":
      bashRCurlyTok
    of "ERROR":
      bashSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_bash(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: BashNode): string =
  $ts_node_type(TSNode(node))

proc newBashParser*(): BashParser =
  result = BashParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_bash())

proc parseString*(parser: BashParser; str: string): BashNode =
  BashNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseBashString*(str: string): BashNode =
  let parser = newBashParser()
  return parseString(parser, str)

func `[]`*(node: BashNode; idx: int; withUnnamed: bool = false): BashNode =
  if withUnnamed:
    BashNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    BashNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: BashNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: BashNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: BashNode; withUnnamed: bool = false): BashNode =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                       ## nodes (usually things like punctuation, braces and so on).
  for i in 0 ..< node.len(withUnnamed):
    yield node[i, withUnnamed]

iterator pairs*(node: BashNode; withUnnamed: bool = false): (int, BashNode) =
  ## Iterate over subnodes. `withUnnamed` - also iterate over unnamed
                                                                              ## nodes.
  for i in 0 ..< node.len(withUnnamed):
    yield (i, node[i, withUnnamed])

func slice*(node: BashNode): Slice[int] =
  {.cast(noSideEffect).}:
    ## Get range of source code **bytes** for the node
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

func `[]`*(s: string; node: BashNode): string =
  s[node.slice()]

func nodeString*(node: BashNode): string =
  $ts_node_string(TSNode(node))

func isNull*(node: BashNode): bool =
  ts_node_is_null(TSNode(node))

func isNamed*(node: BashNode): bool =
  ts_node_is_named(TSNode(node))

func isMissing*(node: BashNode): bool =
  ts_node_is_missing(TSNode(node))

func isExtra*(node: BashNode): bool =
  ts_node_is_extra(TSNode(node))

func hasChanges*(node: BashNode): bool =
  ts_node_has_changes(TSNode(node))

func hasError*(node: BashNode): bool =
  ts_node_has_error(TSNode(node))

func parent*(node: BashNode): BashNode =
  BashNode(ts_node_parent(TSNode(node)))

func child*(node: BashNode; a2: int): BashNode =
  BashNode(ts_node_child(TSNode(node), a2.uint32))

func childCount*(node: BashNode): int =
  ts_node_child_count(TSNode(node)).int

func namedChild*(node: BashNode; a2: int): BashNode =
  BashNode(ts_node_named_child(TSNode(node), a2.uint32))

func namedChildCount*(node: BashNode): int =
  ts_node_named_child_count(TSNode(node)).int

func startPoint*(node: BashNode): TSPoint =
  ts_node_start_point(TSNode(node))

func endPoint*(node: BashNode): TSPoint =
  ts_node_end_point(TSNode(node))

func startLine*(node: BashNode): int =
  node.startPoint().row.int

func endLine*(node: BashNode): int =
  node.endPoint().row.int

func startColumn*(node: BashNode): int =
  node.startPoint().column.int

func endColumn*(node: BashNode): int =
  node.endPoint().column.int

func childByFieldName*(self: BashNode; fieldName: string; fieldNameLength: int): TSNode =
  ts_node_child_by_field_name(TSNode(self), fieldName.cstring,
                              fieldNameLength.uint32)
