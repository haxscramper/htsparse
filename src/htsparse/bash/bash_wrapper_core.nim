import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  BashNodeKind* = enum
    bashUsExpression                  ## _expression
    bashUsPrimaryExpression           ## _primary_expression
    bashUsStatement                   ## _statement
    bashArray                         ## array
    bashBinaryExpression              ## binary_expression
    bashCStyleForStatement            ## c_style_for_statement
    bashCaseItem                      ## case_item
    bashCaseStatement                 ## case_statement
    bashCommand                       ## command
    bashCommandName                   ## command_name
    bashCommandSubstitution           ## command_substitution
    bashCompoundStatement             ## compound_statement
    bashConcatenation                 ## concatenation
    bashDeclarationCommand            ## declaration_command
    bashDoGroup                       ## do_group
    bashElifClause                    ## elif_clause
    bashElseClause                    ## else_clause
    bashExpansion                     ## expansion
    bashFileRedirect                  ## file_redirect
    bashForStatement                  ## for_statement
    bashFunctionDefinition            ## function_definition
    bashHeredocBody                   ## heredoc_body
    bashHeredocRedirect               ## heredoc_redirect
    bashHerestringRedirect            ## herestring_redirect
    bashIfStatement                   ## if_statement
    bashList                          ## list
    bashNegatedCommand                ## negated_command
    bashParenthesizedExpression       ## parenthesized_expression
    bashPipeline                      ## pipeline
    bashPostfixExpression             ## postfix_expression
    bashProcessSubstitution           ## process_substitution
    bashProgram                       ## program
    bashRedirectedStatement           ## redirected_statement
    bashSimpleExpansion               ## simple_expansion
    bashString                        ## string
    bashStringExpansion               ## string_expansion
    bashSubscript                     ## subscript
    bashSubshell                      ## subshell
    bashTernaryExpression             ## ternary_expression
    bashTestCommand                   ## test_command
    bashUnaryExpression               ## unary_expression
    bashUnsetCommand                  ## unset_command
    bashVariableAssignment            ## variable_assignment
    bashWhileStatement                ## while_statement
    bashWord                          ## word
    bashNewlineTok                    ##
                                      ##
    bashExclamationTok                ## !
    bashExclamationEqualTok           ## !=
    bashQuoteTok                      ## "
    bashHashTok                       ## #
    bashDollarTok                     ## $
    bashDollarLParTok                 ## $(
    bashDollarLCurlyTok               ## ${
    bashPercentTok                    ## %
    bashAmpersandTok                  ## &
    bashDoubleAmpersandTok            ## &&
    bashAmpersandGreaterThanTok       ## &>
    bashAmpersandDoubleGreaterThanTok ## &>>
    bashLParTok                       ## (
    bashDoubleLParTok                 ## ((
    bashRParTok                       ## )
    bashDoubleRParTok                 ## ))
    bashPlusTok                       ## +
    bashDoublePlusTok                 ## ++
    bashPlusEqualTok                  ## +=
    bashMinusTok                      ## -
    bashDoubleMinusTok                ## --
    bashMinusEqualTok                 ## -=
    bashSlashTok                      ## /
    bashColonTok                      ## :
    bashColonMinusTok                 ## :-
    bashColonQuestionTok              ## :?
    bashSemicolonTok                  ## ;
    bashSemicolonAmpersandTok         ## ;&
    bashDoubleSemicolonTok            ## ;;
    bashDoubleSemicolonAmpersandTok   ## ;;&
    bashLessThanTok                   ## <
    bashLessThanAmpersandTok          ## <&
    bashLessThanLParTok               ## <(
    bashDoubleLessThanTok             ## <<
    bashDoubleLessThanMinusTok        ## <<-
    bashTripleLessThanTok             ## <<<
    bashLessThanEqualTok              ## <=
    bashEqualTok                      ## =
    bashDoubleEqualTok                ## ==
    bashEqualTildeTok                 ## =~
    bashGreaterThanTok                ## >
    bashGreaterThanAmpersandTok       ## >&
    bashGreaterThanLParTok            ## >(
    bashGreaterThanEqualTok           ## >=
    bashDoubleGreaterThanTok          ## >>
    bashGreaterThanPipeTok            ## >|
    bashQuestionTok                   ## ?
    bashLBrackTok                     ## [
    bashDoubleLBrackTok               ## [[
    bashRBrackTok                     ## ]
    bashDoubleRBrackTok               ## ]]
    bashBacktickTok                   ## `
    bashAnsiiCString                  ## ansii_c_string
    bashCaseTok                       ## case
    bashComment                       ## comment
    bashDeclareTok                    ## declare
    bashDoTok                         ## do
    bashDoneTok                       ## done
    bashElifTok                       ## elif
    bashElseTok                       ## else
    bashEsacTok                       ## esac
    bashExportTok                     ## export
    bashFiTok                         ## fi
    bashFileDescriptor                ## file_descriptor
    bashForTok                        ## for
    bashFunctionTok                   ## function
    bashHeredocStart                  ## heredoc_start
    bashIfTok                         ## if
    bashInTok                         ## in
    bashLocalTok                      ## local
    bashRawString                     ## raw_string
    bashReadonlyTok                   ## readonly
    bashRegex                         ## regex
    bashSpecialVariableName           ## special_variable_name
    bashTestOperator                  ## test_operator
    bashThenTok                       ## then
    bashTypesetTok                    ## typeset
    bashUnsetTok                      ## unset
    bashUnsetenvTok                   ## unsetenv
    bashVariableName                  ## variable_name
    bashWhileTok                      ## while
    bashLCurlyTok                     ## {
    bashPipeTok                       ## |
    bashPipeAmpersandTok              ## |&
    bashDoublePipeTok                 ## ||
    bashRCurlyTok                     ## }
    bashSyntaxError                   ## Tree-sitter parser syntax error


proc strRepr*(kind: BashNodeKind): string =
  case kind:
    of bashUsExpression:                  "_expression"
    of bashUsPrimaryExpression:           "_primary_expression"
    of bashUsStatement:                   "_statement"
    of bashArray:                         "array"
    of bashBinaryExpression:              "binary_expression"
    of bashCStyleForStatement:            "c_style_for_statement"
    of bashCaseItem:                      "case_item"
    of bashCaseStatement:                 "case_statement"
    of bashCommand:                       "command"
    of bashCommandName:                   "command_name"
    of bashCommandSubstitution:           "command_substitution"
    of bashCompoundStatement:             "compound_statement"
    of bashConcatenation:                 "concatenation"
    of bashDeclarationCommand:            "declaration_command"
    of bashDoGroup:                       "do_group"
    of bashElifClause:                    "elif_clause"
    of bashElseClause:                    "else_clause"
    of bashExpansion:                     "expansion"
    of bashFileRedirect:                  "file_redirect"
    of bashForStatement:                  "for_statement"
    of bashFunctionDefinition:            "function_definition"
    of bashHeredocBody:                   "heredoc_body"
    of bashHeredocRedirect:               "heredoc_redirect"
    of bashHerestringRedirect:            "herestring_redirect"
    of bashIfStatement:                   "if_statement"
    of bashList:                          "list"
    of bashNegatedCommand:                "negated_command"
    of bashParenthesizedExpression:       "parenthesized_expression"
    of bashPipeline:                      "pipeline"
    of bashPostfixExpression:             "postfix_expression"
    of bashProcessSubstitution:           "process_substitution"
    of bashProgram:                       "program"
    of bashRedirectedStatement:           "redirected_statement"
    of bashSimpleExpansion:               "simple_expansion"
    of bashString:                        "string"
    of bashStringExpansion:               "string_expansion"
    of bashSubscript:                     "subscript"
    of bashSubshell:                      "subshell"
    of bashTernaryExpression:             "ternary_expression"
    of bashTestCommand:                   "test_command"
    of bashUnaryExpression:               "unary_expression"
    of bashUnsetCommand:                  "unset_command"
    of bashVariableAssignment:            "variable_assignment"
    of bashWhileStatement:                "while_statement"
    of bashWord:                          "word"
    of bashNewlineTok:                    "\x0A"
    of bashExclamationTok:                "!"
    of bashExclamationEqualTok:           "!="
    of bashQuoteTok:                      "\""
    of bashHashTok:                       "#"
    of bashDollarTok:                     "$"
    of bashDollarLParTok:                 "$("
    of bashDollarLCurlyTok:               "${"
    of bashPercentTok:                    "%"
    of bashAmpersandTok:                  "&"
    of bashDoubleAmpersandTok:            "&&"
    of bashAmpersandGreaterThanTok:       "&>"
    of bashAmpersandDoubleGreaterThanTok: "&>>"
    of bashLParTok:                       "("
    of bashDoubleLParTok:                 "(("
    of bashRParTok:                       ")"
    of bashDoubleRParTok:                 "))"
    of bashPlusTok:                       "+"
    of bashDoublePlusTok:                 "++"
    of bashPlusEqualTok:                  "+="
    of bashMinusTok:                      "-"
    of bashDoubleMinusTok:                "--"
    of bashMinusEqualTok:                 "-="
    of bashSlashTok:                      "/"
    of bashColonTok:                      ":"
    of bashColonMinusTok:                 ":-"
    of bashColonQuestionTok:              ":?"
    of bashSemicolonTok:                  ";"
    of bashSemicolonAmpersandTok:         ";&"
    of bashDoubleSemicolonTok:            ";;"
    of bashDoubleSemicolonAmpersandTok:   ";;&"
    of bashLessThanTok:                   "<"
    of bashLessThanAmpersandTok:          "<&"
    of bashLessThanLParTok:               "<("
    of bashDoubleLessThanTok:             "<<"
    of bashDoubleLessThanMinusTok:        "<<-"
    of bashTripleLessThanTok:             "<<<"
    of bashLessThanEqualTok:              "<="
    of bashEqualTok:                      "="
    of bashDoubleEqualTok:                "=="
    of bashEqualTildeTok:                 "=~"
    of bashGreaterThanTok:                ">"
    of bashGreaterThanAmpersandTok:       ">&"
    of bashGreaterThanLParTok:            ">("
    of bashGreaterThanEqualTok:           ">="
    of bashDoubleGreaterThanTok:          ">>"
    of bashGreaterThanPipeTok:            ">|"
    of bashQuestionTok:                   "?"
    of bashLBrackTok:                     "["
    of bashDoubleLBrackTok:               "[["
    of bashRBrackTok:                     "]"
    of bashDoubleRBrackTok:               "]]"
    of bashBacktickTok:                   "`"
    of bashAnsiiCString:                  "ansii_c_string"
    of bashCaseTok:                       "case"
    of bashComment:                       "comment"
    of bashDeclareTok:                    "declare"
    of bashDoTok:                         "do"
    of bashDoneTok:                       "done"
    of bashElifTok:                       "elif"
    of bashElseTok:                       "else"
    of bashEsacTok:                       "esac"
    of bashExportTok:                     "export"
    of bashFiTok:                         "fi"
    of bashFileDescriptor:                "file_descriptor"
    of bashForTok:                        "for"
    of bashFunctionTok:                   "function"
    of bashHeredocStart:                  "heredoc_start"
    of bashIfTok:                         "if"
    of bashInTok:                         "in"
    of bashLocalTok:                      "local"
    of bashRawString:                     "raw_string"
    of bashReadonlyTok:                   "readonly"
    of bashRegex:                         "regex"
    of bashSpecialVariableName:           "special_variable_name"
    of bashTestOperator:                  "test_operator"
    of bashThenTok:                       "then"
    of bashTypesetTok:                    "typeset"
    of bashUnsetTok:                      "unset"
    of bashUnsetenvTok:                   "unsetenv"
    of bashVariableName:                  "variable_name"
    of bashWhileTok:                      "while"
    of bashLCurlyTok:                     "{"
    of bashPipeTok:                       "|"
    of bashPipeAmpersandTok:              "|&"
    of bashDoublePipeTok:                 "||"
    of bashRCurlyTok:                     "}"
    of bashSyntaxError:                   "ERROR"


type
  BashExternalTok* = enum
    bashExternHeredoc_start           ## heredoc_start
    bashExtern_simple_heredoc_body    ## _simple_heredoc_body
    bashExtern_heredoc_body_beginning ## _heredoc_body_beginning
    bashExtern_heredoc_body_middle    ## _heredoc_body_middle
    bashExtern_heredoc_body_end       ## _heredoc_body_end
    bashExternFile_descriptor         ## file_descriptor
    bashExtern_empty_value            ## _empty_value
    bashExtern_concat                 ## _concat
    bashExternVariable_name           ## variable_name
    bashExternRegex                   ## regex


type
  TsBashNode* = distinct TSNode


type
  BashParser* = distinct PtsParser


const bashAllowedSubnodes*: array[BashNodeKind, set[BashNodeKind]] = block:
                                                                       var tmp: array[BashNodeKind, set[BashNodeKind]]
                                                                       tmp[bashArray] = {bashUsPrimaryExpression, bashConcatenation}
                                                                       tmp[bashCaseItem] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashCaseStatement] = {bashCaseItem}
                                                                       tmp[bashCommand] = {bashFileRedirect, bashVariableAssignment}
                                                                       tmp[bashCommandName] = {bashUsPrimaryExpression, bashConcatenation}
                                                                       tmp[bashCommandSubstitution] = {bashUsStatement, bashFileRedirect, bashHeredocBody}
                                                                       tmp[bashCompoundStatement] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashConcatenation] = {bashUsPrimaryExpression}
                                                                       tmp[bashDeclarationCommand] = {bashUsPrimaryExpression, bashConcatenation, bashVariableAssignment, bashVariableName}
                                                                       tmp[bashDoGroup] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashElifClause] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashElseClause] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashExpansion] = {bashUsPrimaryExpression, bashConcatenation, bashRegex, bashSpecialVariableName, bashSubscript, bashVariableName}
                                                                       tmp[bashHeredocBody] = {bashCommandSubstitution, bashExpansion, bashSimpleExpansion}
                                                                       tmp[bashHeredocRedirect] = {bashHeredocStart}
                                                                       tmp[bashHerestringRedirect] = {bashUsPrimaryExpression, bashConcatenation}
                                                                       tmp[bashIfStatement] = {bashUsStatement, bashElifClause, bashElseClause, bashHeredocBody}
                                                                       tmp[bashList] = {bashUsStatement}
                                                                       tmp[bashNegatedCommand] = {bashCommand, bashSubshell, bashTestCommand}
                                                                       tmp[bashParenthesizedExpression] = {bashUsExpression}
                                                                       tmp[bashPipeline] = {bashUsStatement}
                                                                       tmp[bashPostfixExpression] = {bashUsExpression}
                                                                       tmp[bashProcessSubstitution] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashProgram] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashSimpleExpansion] = {bashSpecialVariableName, bashVariableName}
                                                                       tmp[bashString] = {bashCommandSubstitution, bashExpansion, bashSimpleExpansion}
                                                                       tmp[bashStringExpansion] = {bashRawString, bashString}
                                                                       tmp[bashSubshell] = {bashUsStatement, bashHeredocBody}
                                                                       tmp[bashTestCommand] = {bashUsExpression}
                                                                       tmp[bashUnaryExpression] = {bashUsExpression, bashTestOperator}
                                                                       tmp[bashUnsetCommand] = {bashUsPrimaryExpression, bashConcatenation, bashVariableName}
                                                                       tmp
const bashTokenKinds*: set[BashNodeKind] = {
                                             bashNewlineTok,
                                             bashExclamationTok,
                                             bashExclamationEqualTok,
                                             bashQuoteTok,
                                             bashHashTok,
                                             bashDollarTok,
                                             bashDollarLParTok,
                                             bashDollarLCurlyTok,
                                             bashPercentTok,
                                             bashAmpersandTok,
                                             bashDoubleAmpersandTok,
                                             bashAmpersandGreaterThanTok,
                                             bashAmpersandDoubleGreaterThanTok,
                                             bashLParTok,
                                             bashDoubleLParTok,
                                             bashRParTok,
                                             bashDoubleRParTok,
                                             bashPlusTok,
                                             bashDoublePlusTok,
                                             bashPlusEqualTok,
                                             bashMinusTok,
                                             bashDoubleMinusTok,
                                             bashMinusEqualTok,
                                             bashSlashTok,
                                             bashColonTok,
                                             bashColonMinusTok,
                                             bashColonQuestionTok,
                                             bashSemicolonTok,
                                             bashSemicolonAmpersandTok,
                                             bashDoubleSemicolonTok,
                                             bashDoubleSemicolonAmpersandTok,
                                             bashLessThanTok,
                                             bashLessThanAmpersandTok,
                                             bashLessThanLParTok,
                                             bashDoubleLessThanTok,
                                             bashDoubleLessThanMinusTok,
                                             bashTripleLessThanTok,
                                             bashLessThanEqualTok,
                                             bashEqualTok,
                                             bashDoubleEqualTok,
                                             bashEqualTildeTok,
                                             bashGreaterThanTok,
                                             bashGreaterThanAmpersandTok,
                                             bashGreaterThanLParTok,
                                             bashGreaterThanEqualTok,
                                             bashDoubleGreaterThanTok,
                                             bashGreaterThanPipeTok,
                                             bashQuestionTok,
                                             bashLBrackTok,
                                             bashDoubleLBrackTok,
                                             bashRBrackTok,
                                             bashDoubleRBrackTok,
                                             bashBacktickTok,
                                             bashCaseTok,
                                             bashDeclareTok,
                                             bashDoTok,
                                             bashDoneTok,
                                             bashElifTok,
                                             bashElseTok,
                                             bashEsacTok,
                                             bashExportTok,
                                             bashFiTok,
                                             bashForTok,
                                             bashFunctionTok,
                                             bashIfTok,
                                             bashInTok,
                                             bashLocalTok,
                                             bashReadonlyTok,
                                             bashThenTok,
                                             bashTypesetTok,
                                             bashUnsetTok,
                                             bashUnsetenvTok,
                                             bashWhileTok,
                                             bashLCurlyTok,
                                             bashPipeTok,
                                             bashPipeAmpersandTok,
                                             bashDoublePipeTok,
                                             bashRCurlyTok
                                           }

proc tsNodeType*(node: TsBashNode): string



proc kind*(node: TsBashNode): BashNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":              bashUsExpression
      of "_primary_expression":      bashUsPrimaryExpression
      of "_statement":               bashUsStatement
      of "array":                    bashArray
      of "binary_expression":        bashBinaryExpression
      of "c_style_for_statement":    bashCStyleForStatement
      of "case_item":                bashCaseItem
      of "case_statement":           bashCaseStatement
      of "command":                  bashCommand
      of "command_name":             bashCommandName
      of "command_substitution":     bashCommandSubstitution
      of "compound_statement":       bashCompoundStatement
      of "concatenation":            bashConcatenation
      of "declaration_command":      bashDeclarationCommand
      of "do_group":                 bashDoGroup
      of "elif_clause":              bashElifClause
      of "else_clause":              bashElseClause
      of "expansion":                bashExpansion
      of "file_redirect":            bashFileRedirect
      of "for_statement":            bashForStatement
      of "function_definition":      bashFunctionDefinition
      of "heredoc_body":             bashHeredocBody
      of "heredoc_redirect":         bashHeredocRedirect
      of "herestring_redirect":      bashHerestringRedirect
      of "if_statement":             bashIfStatement
      of "list":                     bashList
      of "negated_command":          bashNegatedCommand
      of "parenthesized_expression": bashParenthesizedExpression
      of "pipeline":                 bashPipeline
      of "postfix_expression":       bashPostfixExpression
      of "process_substitution":     bashProcessSubstitution
      of "program":                  bashProgram
      of "redirected_statement":     bashRedirectedStatement
      of "simple_expansion":         bashSimpleExpansion
      of "string":                   bashString
      of "string_expansion":         bashStringExpansion
      of "subscript":                bashSubscript
      of "subshell":                 bashSubshell
      of "ternary_expression":       bashTernaryExpression
      of "test_command":             bashTestCommand
      of "unary_expression":         bashUnaryExpression
      of "unset_command":            bashUnsetCommand
      of "variable_assignment":      bashVariableAssignment
      of "while_statement":          bashWhileStatement
      of "word":                     bashWord
      of "\x0A":                     bashNewlineTok
      of "!":                        bashExclamationTok
      of "!=":                       bashExclamationEqualTok
      of "\"":                       bashQuoteTok
      of "#":                        bashHashTok
      of "$":                        bashDollarTok
      of "$(":                       bashDollarLParTok
      of "${":                       bashDollarLCurlyTok
      of "%":                        bashPercentTok
      of "&":                        bashAmpersandTok
      of "&&":                       bashDoubleAmpersandTok
      of "&>":                       bashAmpersandGreaterThanTok
      of "&>>":                      bashAmpersandDoubleGreaterThanTok
      of "(":                        bashLParTok
      of "((":                       bashDoubleLParTok
      of ")":                        bashRParTok
      of "))":                       bashDoubleRParTok
      of "+":                        bashPlusTok
      of "++":                       bashDoublePlusTok
      of "+=":                       bashPlusEqualTok
      of "-":                        bashMinusTok
      of "--":                       bashDoubleMinusTok
      of "-=":                       bashMinusEqualTok
      of "/":                        bashSlashTok
      of ":":                        bashColonTok
      of ":-":                       bashColonMinusTok
      of ":?":                       bashColonQuestionTok
      of ";":                        bashSemicolonTok
      of ";&":                       bashSemicolonAmpersandTok
      of ";;":                       bashDoubleSemicolonTok
      of ";;&":                      bashDoubleSemicolonAmpersandTok
      of "<":                        bashLessThanTok
      of "<&":                       bashLessThanAmpersandTok
      of "<(":                       bashLessThanLParTok
      of "<<":                       bashDoubleLessThanTok
      of "<<-":                      bashDoubleLessThanMinusTok
      of "<<<":                      bashTripleLessThanTok
      of "<=":                       bashLessThanEqualTok
      of "=":                        bashEqualTok
      of "==":                       bashDoubleEqualTok
      of "=~":                       bashEqualTildeTok
      of ">":                        bashGreaterThanTok
      of ">&":                       bashGreaterThanAmpersandTok
      of ">(":                       bashGreaterThanLParTok
      of ">=":                       bashGreaterThanEqualTok
      of ">>":                       bashDoubleGreaterThanTok
      of ">|":                       bashGreaterThanPipeTok
      of "?":                        bashQuestionTok
      of "[":                        bashLBrackTok
      of "[[":                       bashDoubleLBrackTok
      of "]":                        bashRBrackTok
      of "]]":                       bashDoubleRBrackTok
      of "`":                        bashBacktickTok
      of "ansii_c_string":           bashAnsiiCString
      of "case":                     bashCaseTok
      of "comment":                  bashComment
      of "declare":                  bashDeclareTok
      of "do":                       bashDoTok
      of "done":                     bashDoneTok
      of "elif":                     bashElifTok
      of "else":                     bashElseTok
      of "esac":                     bashEsacTok
      of "export":                   bashExportTok
      of "fi":                       bashFiTok
      of "file_descriptor":          bashFileDescriptor
      of "for":                      bashForTok
      of "function":                 bashFunctionTok
      of "heredoc_start":            bashHeredocStart
      of "if":                       bashIfTok
      of "in":                       bashInTok
      of "local":                    bashLocalTok
      of "raw_string":               bashRawString
      of "readonly":                 bashReadonlyTok
      of "regex":                    bashRegex
      of "special_variable_name":    bashSpecialVariableName
      of "test_operator":            bashTestOperator
      of "then":                     bashThenTok
      of "typeset":                  bashTypesetTok
      of "unset":                    bashUnsetTok
      of "unsetenv":                 bashUnsetenvTok
      of "variable_name":            bashVariableName
      of "while":                    bashWhileTok
      of "{":                        bashLCurlyTok
      of "|":                        bashPipeTok
      of "|&":                       bashPipeAmpersandTok
      of "||":                       bashDoublePipeTok
      of "}":                        bashRCurlyTok
      of "ERROR":                    bashSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsBashNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsBashNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsBashNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_bash(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsBashNode): string =
  $ts_node_type(TSNode(node))

proc newTsBashParser*(): BashParser =
  result = BashParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_bash())

proc parseString*(parser: BashParser, str: string): TsBashNode =
  TsBashNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsBashString*(str: string): TsBashNode =
  let parser = newTsBashParser()
  return parseString(parser, str)

func `$`*(node: TsBashNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsBashNode, str: string): string =
  var res = addr result
  proc aux(node: TsBashNode, level: int) =
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


