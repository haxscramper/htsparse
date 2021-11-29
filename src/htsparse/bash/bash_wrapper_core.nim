import
  hmisc / wrappers/treesitter_core
export treesitter_core
type
  BashNodeKind* = enum
    bashHidExpression                 ## _expression
    bashHidPrimaryExpression          ## _primary_expression
    bashHidStatement                  ## _statement
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
    bashHidSimpleVariableName         ## _simple_variable_name
    bashHidLiteral                    ## _literal
    bashHidSpecialCharacter           ## _special_character
    bashHidEmptyValue                 ## _empty_value
    bashHidHeredocBodyBeginning       ## _heredoc_body_beginning
    bashHidHeredocBodyMiddle          ## _heredoc_body_middle
    bashHidStringContent              ## _string_content
    bashLastCaseItem                  ## last_case_item
    bashHidStatements2                ## _statements2
    bashHidStatements                 ## _statements
    bashHidTerminator                 ## _terminator
    bashHidSpecialVariableName        ## _special_variable_name
    bashHidConcat                     ## _concat
    bashHidSimpleHeredocBody          ## _simple_heredoc_body
    bashHidHeredocBodyEnd             ## _heredoc_body_end
    bashHidTerminatedStatement        ## _terminated_statement
    bashSyntaxError                   ## Tree-sitter parser syntax error

proc strRepr*(kind: BashNodeKind): string =
  case kind:
    of bashHidExpression:                 "_expression"
    of bashHidPrimaryExpression:          "_primary_expression"
    of bashHidStatement:                  "_statement"
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
    of bashHidSimpleVariableName:         "_simple_variable_name"
    of bashHidLiteral:                    "_literal"
    of bashHidSpecialCharacter:           "_special_character"
    of bashHidEmptyValue:                 "_empty_value"
    of bashHidHeredocBodyBeginning:       "_heredoc_body_beginning"
    of bashHidHeredocBodyMiddle:          "_heredoc_body_middle"
    of bashHidStringContent:              "_string_content"
    of bashLastCaseItem:                  "last_case_item"
    of bashHidStatements2:                "_statements2"
    of bashHidStatements:                 "_statements"
    of bashHidTerminator:                 "_terminator"
    of bashHidSpecialVariableName:        "_special_variable_name"
    of bashHidConcat:                     "_concat"
    of bashHidSimpleHeredocBody:          "_simple_heredoc_body"
    of bashHidHeredocBodyEnd:             "_heredoc_body_end"
    of bashHidTerminatedStatement:        "_terminated_statement"
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
                                                                       tmp[bashArray] = {bashHidPrimaryExpression, bashConcatenation}
                                                                       tmp[bashCaseItem] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashCaseStatement] = {bashCaseItem}
                                                                       tmp[bashCommand] = {bashFileRedirect, bashVariableAssignment}
                                                                       tmp[bashCommandName] = {bashHidPrimaryExpression, bashConcatenation}
                                                                       tmp[bashCommandSubstitution] = {bashHidStatement, bashFileRedirect, bashHeredocBody}
                                                                       tmp[bashCompoundStatement] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashConcatenation] = {bashHidPrimaryExpression}
                                                                       tmp[bashDeclarationCommand] = {bashHidPrimaryExpression, bashConcatenation, bashVariableAssignment, bashVariableName}
                                                                       tmp[bashDoGroup] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashElifClause] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashElseClause] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashExpansion] = {bashHidPrimaryExpression, bashConcatenation, bashRegex, bashSpecialVariableName, bashSubscript, bashVariableName}
                                                                       tmp[bashHeredocBody] = {bashCommandSubstitution, bashExpansion, bashSimpleExpansion}
                                                                       tmp[bashHeredocRedirect] = {bashHeredocStart}
                                                                       tmp[bashHerestringRedirect] = {bashHidPrimaryExpression, bashConcatenation}
                                                                       tmp[bashIfStatement] = {bashHidStatement, bashElifClause, bashElseClause, bashHeredocBody}
                                                                       tmp[bashList] = {bashHidStatement}
                                                                       tmp[bashNegatedCommand] = {bashCommand, bashSubshell, bashTestCommand}
                                                                       tmp[bashParenthesizedExpression] = {bashHidExpression}
                                                                       tmp[bashPipeline] = {bashHidStatement}
                                                                       tmp[bashPostfixExpression] = {bashHidExpression}
                                                                       tmp[bashProcessSubstitution] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashProgram] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashSimpleExpansion] = {bashSpecialVariableName, bashVariableName}
                                                                       tmp[bashString] = {bashCommandSubstitution, bashExpansion, bashSimpleExpansion}
                                                                       tmp[bashStringExpansion] = {bashRawString, bashString}
                                                                       tmp[bashSubshell] = {bashHidStatement, bashHeredocBody}
                                                                       tmp[bashTestCommand] = {bashHidExpression}
                                                                       tmp[bashUnaryExpression] = {bashHidExpression, bashTestOperator}
                                                                       tmp[bashUnsetCommand] = {bashHidPrimaryExpression, bashConcatenation, bashVariableName}
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
const bashHiddenKinds*: set[BashNodeKind] = {
                                              bashHidSimpleVariableName,
                                              bashHidLiteral,
                                              bashHidSpecialCharacter,
                                              bashHidEmptyValue,
                                              bashHidExpression,
                                              bashHidPrimaryExpression,
                                              bashHidHeredocBodyBeginning,
                                              bashHidHeredocBodyMiddle,
                                              bashHidStringContent,
                                              bashLastCaseItem,
                                              bashHidStatements2,
                                              bashHidStatements,
                                              bashHidStatement,
                                              bashHidTerminator,
                                              bashHidSpecialVariableName,
                                              bashHidConcat,
                                              bashHidSimpleHeredocBody,
                                              bashHidHeredocBodyEnd,
                                              bashHidTerminatedStatement
                                            }
proc tsNodeType*(node: TsBashNode): string


proc kind*(node: TsBashNode): BashNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "_expression":              bashHidExpression
      of "_primary_expression":      bashHidPrimaryExpression
      of "_statement":               bashHidStatement
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


import
  hmisc / wrappers/treesitter_core
let bashGrammar*: array[BashNodeKind, HtsRule[BashNodeKind]] = block:
                                                                 var rules: array[BashNodeKind, HtsRule[BashNodeKind]]
                                                                 type
                                                                   K = BashNodeKind


                                                                 rules[bashHidSimpleVariableName] = tsRegex[K]("\\w+")
                                                                 rules[bashConcatenation] = tsSeq[K](tsChoice[K](tsSymbol[K](bashHidPrimaryExpression), tsSymbol[K](bashHidSpecialCharacter)), tsRepeat1[K](tsSeq[K](tsSymbol[K](bashHidConcat), tsChoice[K](tsSymbol[K](bashHidPrimaryExpression), tsSymbol[K](bashHidSpecialCharacter)))), tsChoice[K](tsSeq[K](tsSymbol[K](bashHidConcat), tsString[K]("$")), tsBlank[K]()))
                                                                 rules[bashHidLiteral] = tsChoice[K](tsSymbol[K](bashConcatenation), tsSymbol[K](bashHidPrimaryExpression), tsRepeat1[K](tsSymbol[K](bashHidSpecialCharacter)))
                                                                 rules[bashWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](bashHidTerminatedStatement), tsSymbol[K](bashDoGroup))
                                                                 rules[bashCaseItem] = tsSeq[K](tsSymbol[K](bashHidLiteral), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](bashHidLiteral))), tsString[K](")"), tsChoice[K](tsSymbol[K](bashHidStatements), tsBlank[K]()), tsChoice[K](tsString[K](";;"), tsChoice[K](tsString[K](";&"), tsString[K](";;&"))))
                                                                 rules[bashCommand] = tsSeq[K](tsRepeat[K](tsChoice[K](tsSymbol[K](bashVariableAssignment), tsSymbol[K](bashFileRedirect))), tsSymbol[K](bashCommandName), tsRepeat[K](tsChoice[K](tsSymbol[K](bashHidLiteral), tsSeq[K](tsChoice[K](tsString[K]("=~"), tsString[K]("==")), tsChoice[K](tsSymbol[K](bashHidLiteral), tsSymbol[K](bashRegex))))))
                                                                 rules[bashVariableAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](bashVariableName), tsSymbol[K](bashSubscript)), tsChoice[K](tsString[K]("="), tsString[K]("+=")), tsChoice[K](tsSymbol[K](bashHidLiteral), tsSymbol[K](bashArray), tsSymbol[K](bashHidEmptyValue)))
                                                                 rules[bashPipeline] = tsSeq[K](tsSymbol[K](bashHidStatement), tsChoice[K](tsString[K]("|"), tsString[K]("|&")), tsSymbol[K](bashHidStatement))
                                                                 rules[bashStringExpansion] = tsSeq[K](tsString[K]("$"), tsChoice[K](tsSymbol[K](bashString), tsSymbol[K](bashRawString)))
                                                                 rules[bashProcessSubstitution] = tsSeq[K](tsChoice[K](tsString[K]("<("), tsString[K](">(")), tsSymbol[K](bashHidStatements), tsString[K](")"))
                                                                 rules[bashHeredocRedirect] = tsSeq[K](tsChoice[K](tsString[K]("<<"), tsString[K]("<<-")), tsSymbol[K](bashHeredocStart))
                                                                 rules[bashHidSpecialCharacter] = tsChoice[K](tsString[K]("{"), tsString[K]("}"), tsString[K]("["), tsString[K]("]"))
                                                                 rules[bashSimpleExpansion] = tsSeq[K](tsString[K]("$"), tsChoice[K](tsSymbol[K](bashHidSimpleVariableName), tsSymbol[K](bashHidSpecialVariableName), tsString[K]("!"), tsString[K]("#")))
                                                                 rules[bashHidExpression] = tsChoice[K](tsSymbol[K](bashHidLiteral), tsSymbol[K](bashUnaryExpression), tsSymbol[K](bashTernaryExpression), tsSymbol[K](bashBinaryExpression), tsSymbol[K](bashPostfixExpression), tsSymbol[K](bashParenthesizedExpression))
                                                                 rules[bashForStatement] = tsSeq[K](tsString[K]("for"), tsSymbol[K](bashHidSimpleVariableName), tsChoice[K](tsSeq[K](tsString[K]("in"), tsRepeat1[K](tsSymbol[K](bashHidLiteral))), tsBlank[K]()), tsSymbol[K](bashHidTerminator), tsSymbol[K](bashDoGroup))
                                                                 rules[bashTestOperator] = tsSeq[K](tsString[K]("-"), tsRegex[K]("[a-zA-Z]+"))
                                                                 rules[bashWord] = tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\'\"<>{}\\[\\]()`$|&;\\\\\\s#]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("[^\\s]"))))
                                                                 rules[bashNegatedCommand] = tsSeq[K](tsString[K]("!"), tsChoice[K](tsSymbol[K](bashCommand), tsSymbol[K](bashTestCommand), tsSymbol[K](bashSubshell)))
                                                                 rules[bashCaseStatement] = tsSeq[K](tsString[K]("case"), tsSymbol[K](bashHidLiteral), tsChoice[K](tsSymbol[K](bashHidTerminator), tsBlank[K]()), tsString[K]("in"), tsSymbol[K](bashHidTerminator), tsChoice[K](tsSeq[K](tsRepeat[K](tsSymbol[K](bashCaseItem)), tsSymbol[K](bashLastCaseItem)), tsBlank[K]()), tsString[K]("esac"))
                                                                 rules[bashElifClause] = tsSeq[K](tsString[K]("elif"), tsSymbol[K](bashHidTerminatedStatement), tsString[K]("then"), tsChoice[K](tsSymbol[K](bashHidStatements2), tsBlank[K]()))
                                                                 rules[bashDoGroup] = tsSeq[K](tsString[K]("do"), tsChoice[K](tsSymbol[K](bashHidStatements2), tsBlank[K]()), tsString[K]("done"))
                                                                 rules[bashBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](bashHidExpression), tsChoice[K](tsString[K]("="), tsString[K]("=="), tsString[K]("=~"), tsString[K]("!="), tsString[K]("+"), tsString[K]("-"), tsString[K]("+="), tsString[K]("-="), tsString[K]("<"), tsString[K](">"), tsString[K]("<="), tsString[K](">="), tsString[K]("||"), tsString[K]("&&"), tsSymbol[K](bashTestOperator)), tsSymbol[K](bashHidExpression)), tsSeq[K](tsSymbol[K](bashHidExpression), tsChoice[K](tsString[K]("=="), tsString[K]("=~")), tsSymbol[K](bashRegex)))
                                                                 rules[bashCompoundStatement] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSymbol[K](bashHidStatements2), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[bashString] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("$"), tsBlank[K]()), tsSymbol[K](bashHidStringContent)), tsSymbol[K](bashExpansion), tsSymbol[K](bashSimpleExpansion), tsSymbol[K](bashCommandSubstitution)), tsChoice[K](tsSymbol[K](bashHidConcat), tsBlank[K]()))), tsChoice[K](tsString[K]("$"), tsBlank[K]()), tsString[K]("\""))
                                                                 rules[bashHidPrimaryExpression] = tsChoice[K](tsSymbol[K](bashWord), tsSymbol[K](bashString), tsSymbol[K](bashRawString), tsSymbol[K](bashAnsiiCString), tsSymbol[K](bashExpansion), tsSymbol[K](bashSimpleExpansion), tsSymbol[K](bashStringExpansion), tsSymbol[K](bashCommandSubstitution), tsSymbol[K](bashProcessSubstitution))
                                                                 rules[bashFileRedirect] = tsSeq[K](tsChoice[K](tsSymbol[K](bashFileDescriptor), tsBlank[K]()), tsChoice[K](tsString[K]("<"), tsString[K](">"), tsString[K](">>"), tsString[K]("&>"), tsString[K]("&>>"), tsString[K]("<&"), tsString[K](">&"), tsString[K](">|")), tsSymbol[K](bashHidLiteral))
                                                                 rules[bashUnsetCommand] = tsSeq[K](tsChoice[K](tsString[K]("unset"), tsString[K]("unsetenv")), tsRepeat[K](tsChoice[K](tsSymbol[K](bashHidLiteral), tsSymbol[K](bashHidSimpleVariableName))))
                                                                 rules[bashIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](bashHidTerminatedStatement), tsString[K]("then"), tsChoice[K](tsSymbol[K](bashHidStatements2), tsBlank[K]()), tsRepeat[K](tsSymbol[K](bashElifClause)), tsChoice[K](tsSymbol[K](bashElseClause), tsBlank[K]()), tsString[K]("fi"))
                                                                 rules[bashHidStringContent] = tsRegex[K]("([^\"`$\\\\]|\\\\(.|\\n))+")
                                                                 rules[bashFunctionDefinition] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("function"), tsSymbol[K](bashWord), tsChoice[K](tsSeq[K](tsString[K]("("), tsString[K](")")), tsBlank[K]())), tsSeq[K](tsSymbol[K](bashWord), tsString[K]("("), tsString[K](")"))), tsChoice[K](tsSymbol[K](bashCompoundStatement), tsSymbol[K](bashSubshell), tsSymbol[K](bashTestCommand)))
                                                                 rules[bashRawString] = tsRegex[K]("\'[^\']*\'")
                                                                 rules[bashSubshell] = tsSeq[K](tsString[K]("("), tsSymbol[K](bashHidStatements), tsString[K](")"))
                                                                 rules[bashUnaryExpression] = tsSeq[K](tsChoice[K](tsString[K]("!"), tsSymbol[K](bashTestOperator)), tsSymbol[K](bashHidExpression))
                                                                 rules[bashHeredocBody] = tsChoice[K](tsSymbol[K](bashHidSimpleHeredocBody), tsSeq[K](tsSymbol[K](bashHidHeredocBodyBeginning), tsRepeat[K](tsChoice[K](tsSymbol[K](bashExpansion), tsSymbol[K](bashSimpleExpansion), tsSymbol[K](bashCommandSubstitution), tsSymbol[K](bashHidHeredocBodyMiddle))), tsSymbol[K](bashHidHeredocBodyEnd)))
                                                                 rules[bashLastCaseItem] = tsSeq[K](tsSymbol[K](bashHidLiteral), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](bashHidLiteral))), tsString[K](")"), tsChoice[K](tsSymbol[K](bashHidStatements), tsBlank[K]()), tsChoice[K](tsString[K](";;"), tsBlank[K]()))
                                                                 rules[bashHidStatements2] = tsRepeat1[K](tsSeq[K](tsSymbol[K](bashHidStatement), tsChoice[K](tsSeq[K](tsString[K]("\x0A"), tsSymbol[K](bashHeredocBody)), tsBlank[K]()), tsSymbol[K](bashHidTerminator)))
                                                                 rules[bashExpansion] = tsSeq[K](tsString[K]("${"), tsChoice[K](tsChoice[K](tsString[K]("#"), tsString[K]("!")), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSeq[K](tsSymbol[K](bashVariableName), tsString[K]("="), tsChoice[K](tsSymbol[K](bashHidLiteral), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSymbol[K](bashSubscript), tsSymbol[K](bashHidSimpleVariableName), tsSymbol[K](bashHidSpecialVariableName)), tsChoice[K](tsSeq[K](tsString[K]("/"), tsChoice[K](tsSymbol[K](bashRegex), tsBlank[K]())), tsBlank[K]()), tsRepeat[K](tsChoice[K](tsSymbol[K](bashHidLiteral), tsString[K](":"), tsString[K](":?"), tsString[K]("="), tsString[K](":-"), tsString[K]("%"), tsString[K]("-"), tsString[K]("#"))))), tsBlank[K]()), tsString[K]("}"))
                                                                 rules[bashComment] = tsRegex[K]("#.*")
                                                                 rules[bashHidStatements] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](bashHidStatement), tsChoice[K](tsSeq[K](tsString[K]("\x0A"), tsSymbol[K](bashHeredocBody)), tsBlank[K]()), tsSymbol[K](bashHidTerminator))), tsSymbol[K](bashHidStatement), tsChoice[K](tsSeq[K](tsString[K]("\x0A"), tsSymbol[K](bashHeredocBody)), tsBlank[K]()), tsChoice[K](tsSymbol[K](bashHidTerminator), tsBlank[K]()))
                                                                 rules[bashElseClause] = tsSeq[K](tsString[K]("else"), tsChoice[K](tsSymbol[K](bashHidStatements2), tsBlank[K]()))
                                                                 rules[bashCommandSubstitution] = tsChoice[K](tsSeq[K](tsString[K]("$("), tsSymbol[K](bashHidStatements), tsString[K](")")), tsSeq[K](tsString[K]("$("), tsSymbol[K](bashFileRedirect), tsString[K](")")), tsSeq[K](tsString[K]("`"), tsSymbol[K](bashHidStatements), tsString[K]("`")))
                                                                 rules[bashAnsiiCString] = tsRegex[K]("\\$\'([^\']|\\\\\')*\'")
                                                                 rules[bashHidStatement] = tsChoice[K](tsSymbol[K](bashRedirectedStatement), tsSymbol[K](bashVariableAssignment), tsSymbol[K](bashCommand), tsSymbol[K](bashDeclarationCommand), tsSymbol[K](bashUnsetCommand), tsSymbol[K](bashTestCommand), tsSymbol[K](bashNegatedCommand), tsSymbol[K](bashForStatement), tsSymbol[K](bashCStyleForStatement), tsSymbol[K](bashWhileStatement), tsSymbol[K](bashIfStatement), tsSymbol[K](bashCaseStatement), tsSymbol[K](bashPipeline), tsSymbol[K](bashList), tsSymbol[K](bashSubshell), tsSymbol[K](bashCompoundStatement), tsSymbol[K](bashFunctionDefinition))
                                                                 rules[bashRedirectedStatement] = tsSeq[K](tsSymbol[K](bashHidStatement), tsRepeat1[K](tsChoice[K](tsSymbol[K](bashFileRedirect), tsSymbol[K](bashHeredocRedirect), tsSymbol[K](bashHerestringRedirect))))
                                                                 rules[bashHidTerminator] = tsChoice[K](tsString[K](";"), tsString[K](";;"), tsString[K]("\x0A"), tsString[K]("&"))
                                                                 rules[bashHidSpecialVariableName] = tsChoice[K](tsString[K]("*"), tsString[K]("@"), tsString[K]("?"), tsString[K]("-"), tsString[K]("$"), tsString[K]("0"), tsString[K]("_"))
                                                                 rules[bashTernaryExpression] = tsSeq[K](tsSymbol[K](bashHidExpression), tsString[K]("?"), tsSymbol[K](bashHidExpression), tsString[K](":"), tsSymbol[K](bashHidExpression))
                                                                 rules[bashCommandName] = tsSymbol[K](bashHidLiteral)
                                                                 rules[bashProgram] = tsChoice[K](tsSymbol[K](bashHidStatements), tsBlank[K]())
                                                                 rules[bashSubscript] = tsSeq[K](tsSymbol[K](bashVariableName), tsString[K]("["), tsSymbol[K](bashHidLiteral), tsChoice[K](tsSymbol[K](bashHidConcat), tsBlank[K]()), tsString[K]("]"), tsChoice[K](tsSymbol[K](bashHidConcat), tsBlank[K]()))
                                                                 rules[bashArray] = tsSeq[K](tsString[K]("("), tsRepeat[K](tsSymbol[K](bashHidLiteral)), tsString[K](")"))
                                                                 rules[bashCStyleForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("(("), tsChoice[K](tsSymbol[K](bashHidExpression), tsBlank[K]()), tsSymbol[K](bashHidTerminator), tsChoice[K](tsSymbol[K](bashHidExpression), tsBlank[K]()), tsSymbol[K](bashHidTerminator), tsChoice[K](tsSymbol[K](bashHidExpression), tsBlank[K]()), tsString[K]("))"), tsChoice[K](tsString[K](";"), tsBlank[K]()), tsChoice[K](tsSymbol[K](bashDoGroup), tsSymbol[K](bashCompoundStatement)))
                                                                 rules[bashHerestringRedirect] = tsSeq[K](tsString[K]("<<<"), tsSymbol[K](bashHidLiteral))
                                                                 rules[bashPostfixExpression] = tsSeq[K](tsSymbol[K](bashHidExpression), tsChoice[K](tsString[K]("++"), tsString[K]("--")))
                                                                 rules[bashDeclarationCommand] = tsSeq[K](tsChoice[K](tsString[K]("declare"), tsString[K]("typeset"), tsString[K]("export"), tsString[K]("readonly"), tsString[K]("local")), tsRepeat[K](tsChoice[K](tsSymbol[K](bashHidLiteral), tsSymbol[K](bashHidSimpleVariableName), tsSymbol[K](bashVariableAssignment))))
                                                                 rules[bashList] = tsSeq[K](tsSymbol[K](bashHidStatement), tsChoice[K](tsString[K]("&&"), tsString[K]("||")), tsSymbol[K](bashHidStatement))
                                                                 rules[bashTestCommand] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("["), tsSymbol[K](bashHidExpression), tsString[K]("]")), tsSeq[K](tsString[K]("[["), tsSymbol[K](bashHidExpression), tsString[K]("]]")), tsSeq[K](tsString[K]("(("), tsSymbol[K](bashHidExpression), tsString[K]("))"))))
                                                                 rules[bashHidTerminatedStatement] = tsSeq[K](tsSymbol[K](bashHidStatement), tsSymbol[K](bashHidTerminator))
                                                                 rules[bashParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](bashHidExpression), tsString[K](")"))
                                                                 rules

