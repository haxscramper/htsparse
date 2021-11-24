import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  JsNodeKind* = enum
    jsDeclaration                        ## declaration
    jsExpression                         ## expression
    jsPattern                            ## pattern
    jsPrimaryExpression                  ## primary_expression
    jsStatement                          ## statement
    jsArguments                          ## arguments
    jsArray                              ## array
    jsArrayPattern                       ## array_pattern
    jsArrowFunction                      ## arrow_function
    jsAssignmentExpression               ## assignment_expression
    jsAssignmentPattern                  ## assignment_pattern
    jsAugmentedAssignmentExpression      ## augmented_assignment_expression
    jsAwaitExpression                    ## await_expression
    jsBinaryExpression                   ## binary_expression
    jsBreakStatement                     ## break_statement
    jsCallExpression                     ## call_expression
    jsCatchClause                        ## catch_clause
    jsClass                              ## class
    jsClassBody                          ## class_body
    jsClassDeclaration                   ## class_declaration
    jsClassHeritage                      ## class_heritage
    jsComputedPropertyName               ## computed_property_name
    jsContinueStatement                  ## continue_statement
    jsDebuggerStatement                  ## debugger_statement
    jsDecorator                          ## decorator
    jsDoStatement                        ## do_statement
    jsElseClause                         ## else_clause
    jsEmptyStatement                     ## empty_statement
    jsExportClause                       ## export_clause
    jsExportSpecifier                    ## export_specifier
    jsExportStatement                    ## export_statement
    jsExpressionStatement                ## expression_statement
    jsFinallyClause                      ## finally_clause
    jsForInStatement                     ## for_in_statement
    jsForStatement                       ## for_statement
    jsFormalParameters                   ## formal_parameters
    jsFunction                           ## function
    jsFunctionDeclaration                ## function_declaration
    jsGeneratorFunction                  ## generator_function
    jsGeneratorFunctionDeclaration       ## generator_function_declaration
    jsIfStatement                        ## if_statement
    jsImport                             ## import
    jsImportClause                       ## import_clause
    jsImportSpecifier                    ## import_specifier
    jsImportStatement                    ## import_statement
    jsJsxAttribute                       ## jsx_attribute
    jsJsxClosingElement                  ## jsx_closing_element
    jsJsxElement                         ## jsx_element
    jsJsxExpression                      ## jsx_expression
    jsJsxFragment                        ## jsx_fragment
    jsJsxNamespaceName                   ## jsx_namespace_name
    jsJsxOpeningElement                  ## jsx_opening_element
    jsJsxSelfClosingElement              ## jsx_self_closing_element
    jsLabeledStatement                   ## labeled_statement
    jsLexicalDeclaration                 ## lexical_declaration
    jsMemberExpression                   ## member_expression
    jsMetaProperty                       ## meta_property
    jsMethodDefinition                   ## method_definition
    jsNamedImports                       ## named_imports
    jsNamespaceImport                    ## namespace_import
    jsNestedIdentifier                   ## nested_identifier
    jsNewExpression                      ## new_expression
    jsObject                             ## object
    jsObjectAssignmentPattern            ## object_assignment_pattern
    jsObjectPattern                      ## object_pattern
    jsPair                               ## pair
    jsPairPattern                        ## pair_pattern
    jsParenthesizedExpression            ## parenthesized_expression
    jsProgram                            ## program
    jsPublicFieldDefinition              ## public_field_definition
    jsRegex                              ## regex
    jsRestPattern                        ## rest_pattern
    jsReturnStatement                    ## return_statement
    jsSequenceExpression                 ## sequence_expression
    jsSpreadElement                      ## spread_element
    jsStatementBlock                     ## statement_block
    jsString                             ## string
    jsSubscriptExpression                ## subscript_expression
    jsSwitchBody                         ## switch_body
    jsSwitchCase                         ## switch_case
    jsSwitchDefault                      ## switch_default
    jsSwitchStatement                    ## switch_statement
    jsTemplateString                     ## template_string
    jsTemplateSubstitution               ## template_substitution
    jsTernaryExpression                  ## ternary_expression
    jsThrowStatement                     ## throw_statement
    jsTryStatement                       ## try_statement
    jsUnaryExpression                    ## unary_expression
    jsUpdateExpression                   ## update_expression
    jsVariableDeclaration                ## variable_declaration
    jsVariableDeclarator                 ## variable_declarator
    jsWhileStatement                     ## while_statement
    jsWithStatement                      ## with_statement
    jsYieldExpression                    ## yield_expression
    jsExclamationTok                     ## !
    jsExclamationEqualTok                ## !=
    jsExclamationDoubleEqualTok          ## !==
    jsQuoteTok                           ## "
    jsDollarLCurlyTok                    ## ${
    jsPercentTok                         ## %
    jsPercentEqualTok                    ## %=
    jsAmpersandTok                       ## &
    jsDoubleAmpersandTok                 ## &&
    jsDoubleAmpersandEqualTok            ## &&=
    jsAmpersandEqualTok                  ## &=
    jsApostropheTok                      ## '
    jsLParTok                            ## (
    jsRParTok                            ## )
    jsAsteriskTok                        ## *
    jsDoubleAsteriskTok                  ## **
    jsDoubleAsteriskEqualTok             ## **=
    jsAsteriskEqualTok                   ## *=
    jsPlusTok                            ## +
    jsDoublePlusTok                      ## ++
    jsPlusEqualTok                       ## +=
    jsCommaTok                           ## ,
    jsMinusTok                           ## -
    jsDoubleMinusTok                     ## --
    jsMinusEqualTok                      ## -=
    jsDotTok                             ## .
    jsTripleDotTok                       ## ...
    jsSlashTok                           ## /
    jsSlashEqualTok                      ## /=
    jsColonTok                           ## :
    jsSemicolonTok                       ## ;
    jsLessThanTok                        ## <
    jsDoubleLessThanTok                  ## <<
    jsDoubleLessThanEqualTok             ## <<=
    jsLessThanEqualTok                   ## <=
    jsEqualTok                           ## =
    jsDoubleEqualTok                     ## ==
    jsTripleEqualTok                     ## ===
    jsEqualGreaterThanTok                ## =>
    jsGreaterThanTok                     ## >
    jsGreaterThanEqualTok                ## >=
    jsDoubleGreaterThanTok               ## >>
    jsDoubleGreaterThanEqualTok          ## >>=
    jsTripleGreaterThanTok               ## >>>
    jsTripleGreaterThanEqualTok          ## >>>=
    jsQuestionTok                        ## ?
    jsQuestionDotTok                     ## ?.
    jsDoubleQuestionTok                  ## ??
    jsDoubleQuestionEqualTok             ## ??=
    jsAtTok                              ## @
    jsLBrackTok                          ## [
    jsRBrackTok                          ## ]
    jsAccentTok                          ## ^
    jsAccentEqualTok                     ## ^=
    jsBacktickTok                        ## `
    jsAsTok                              ## as
    jsAsyncTok                           ## async
    jsAwaitTok                           ## await
    jsBreakTok                           ## break
    jsCaseTok                            ## case
    jsCatchTok                           ## catch
    jsClassTok                           ## class
    jsComment                            ## comment
    jsConstTok                           ## const
    jsContinueTok                        ## continue
    jsDebuggerTok                        ## debugger
    jsDefaultTok                         ## default
    jsDeleteTok                          ## delete
    jsDoTok                              ## do
    jsElseTok                            ## else
    jsEscapeSequence                     ## escape_sequence
    jsExportTok                          ## export
    jsExtendsTok                         ## extends
    jsFalse                              ## false
    jsFinallyTok                         ## finally
    jsForTok                             ## for
    jsFromTok                            ## from
    jsFunctionTok                        ## function
    jsGetTok                             ## get
    jsHashBangLine                       ## hash_bang_line
    jsIdentifier                         ## identifier
    jsIfTok                              ## if
    jsImportTok                          ## import
    jsInTok                              ## in
    jsInstanceofTok                      ## instanceof
    jsJsxText                            ## jsx_text
    jsLetTok                             ## let
    jsNewTok                             ## new
    jsNull                               ## null
    jsNumber                             ## number
    jsOfTok                              ## of
    jsPropertyIdentifier                 ## property_identifier
    jsRegexFlags                         ## regex_flags
    jsRegexPattern                       ## regex_pattern
    jsReturnTok                          ## return
    jsSetTok                             ## set
    jsShorthandPropertyIdentifier        ## shorthand_property_identifier
    jsShorthandPropertyIdentifierPattern ## shorthand_property_identifier_pattern
    jsStatementIdentifier                ## statement_identifier
    jsStaticTok                          ## static
    jsSuper                              ## super
    jsSwitchTok                          ## switch
    jsTargetTok                          ## target
    jsThis                               ## this
    jsThrowTok                           ## throw
    jsTrue                               ## true
    jsTryTok                             ## try
    jsTypeofTok                          ## typeof
    jsUndefined                          ## undefined
    jsVarTok                             ## var
    jsVoidTok                            ## void
    jsWhileTok                           ## while
    jsWithTok                            ## with
    jsYieldTok                           ## yield
    jsLCurlyTok                          ## {
    jsPipeTok                            ## |
    jsPipeEqualTok                       ## |=
    jsDoublePipeTok                      ## ||
    jsDoublePipeEqualTok                 ## ||=
    jsRCurlyTok                          ## }
    jsTildeTok                           ## ~
    jsSyntaxError                        ## Tree-sitter parser syntax error


proc strRepr*(kind: JsNodeKind): string =
  case kind:
    of jsDeclaration:                        "declaration"
    of jsExpression:                         "expression"
    of jsPattern:                            "pattern"
    of jsPrimaryExpression:                  "primary_expression"
    of jsStatement:                          "statement"
    of jsArguments:                          "arguments"
    of jsArray:                              "array"
    of jsArrayPattern:                       "array_pattern"
    of jsArrowFunction:                      "arrow_function"
    of jsAssignmentExpression:               "assignment_expression"
    of jsAssignmentPattern:                  "assignment_pattern"
    of jsAugmentedAssignmentExpression:      "augmented_assignment_expression"
    of jsAwaitExpression:                    "await_expression"
    of jsBinaryExpression:                   "binary_expression"
    of jsBreakStatement:                     "break_statement"
    of jsCallExpression:                     "call_expression"
    of jsCatchClause:                        "catch_clause"
    of jsClass:                              "class"
    of jsClassBody:                          "class_body"
    of jsClassDeclaration:                   "class_declaration"
    of jsClassHeritage:                      "class_heritage"
    of jsComputedPropertyName:               "computed_property_name"
    of jsContinueStatement:                  "continue_statement"
    of jsDebuggerStatement:                  "debugger_statement"
    of jsDecorator:                          "decorator"
    of jsDoStatement:                        "do_statement"
    of jsElseClause:                         "else_clause"
    of jsEmptyStatement:                     "empty_statement"
    of jsExportClause:                       "export_clause"
    of jsExportSpecifier:                    "export_specifier"
    of jsExportStatement:                    "export_statement"
    of jsExpressionStatement:                "expression_statement"
    of jsFinallyClause:                      "finally_clause"
    of jsForInStatement:                     "for_in_statement"
    of jsForStatement:                       "for_statement"
    of jsFormalParameters:                   "formal_parameters"
    of jsFunction:                           "function"
    of jsFunctionDeclaration:                "function_declaration"
    of jsGeneratorFunction:                  "generator_function"
    of jsGeneratorFunctionDeclaration:       "generator_function_declaration"
    of jsIfStatement:                        "if_statement"
    of jsImport:                             "import"
    of jsImportClause:                       "import_clause"
    of jsImportSpecifier:                    "import_specifier"
    of jsImportStatement:                    "import_statement"
    of jsJsxAttribute:                       "jsx_attribute"
    of jsJsxClosingElement:                  "jsx_closing_element"
    of jsJsxElement:                         "jsx_element"
    of jsJsxExpression:                      "jsx_expression"
    of jsJsxFragment:                        "jsx_fragment"
    of jsJsxNamespaceName:                   "jsx_namespace_name"
    of jsJsxOpeningElement:                  "jsx_opening_element"
    of jsJsxSelfClosingElement:              "jsx_self_closing_element"
    of jsLabeledStatement:                   "labeled_statement"
    of jsLexicalDeclaration:                 "lexical_declaration"
    of jsMemberExpression:                   "member_expression"
    of jsMetaProperty:                       "meta_property"
    of jsMethodDefinition:                   "method_definition"
    of jsNamedImports:                       "named_imports"
    of jsNamespaceImport:                    "namespace_import"
    of jsNestedIdentifier:                   "nested_identifier"
    of jsNewExpression:                      "new_expression"
    of jsObject:                             "object"
    of jsObjectAssignmentPattern:            "object_assignment_pattern"
    of jsObjectPattern:                      "object_pattern"
    of jsPair:                               "pair"
    of jsPairPattern:                        "pair_pattern"
    of jsParenthesizedExpression:            "parenthesized_expression"
    of jsProgram:                            "program"
    of jsPublicFieldDefinition:              "public_field_definition"
    of jsRegex:                              "regex"
    of jsRestPattern:                        "rest_pattern"
    of jsReturnStatement:                    "return_statement"
    of jsSequenceExpression:                 "sequence_expression"
    of jsSpreadElement:                      "spread_element"
    of jsStatementBlock:                     "statement_block"
    of jsString:                             "string"
    of jsSubscriptExpression:                "subscript_expression"
    of jsSwitchBody:                         "switch_body"
    of jsSwitchCase:                         "switch_case"
    of jsSwitchDefault:                      "switch_default"
    of jsSwitchStatement:                    "switch_statement"
    of jsTemplateString:                     "template_string"
    of jsTemplateSubstitution:               "template_substitution"
    of jsTernaryExpression:                  "ternary_expression"
    of jsThrowStatement:                     "throw_statement"
    of jsTryStatement:                       "try_statement"
    of jsUnaryExpression:                    "unary_expression"
    of jsUpdateExpression:                   "update_expression"
    of jsVariableDeclaration:                "variable_declaration"
    of jsVariableDeclarator:                 "variable_declarator"
    of jsWhileStatement:                     "while_statement"
    of jsWithStatement:                      "with_statement"
    of jsYieldExpression:                    "yield_expression"
    of jsExclamationTok:                     "!"
    of jsExclamationEqualTok:                "!="
    of jsExclamationDoubleEqualTok:          "!=="
    of jsQuoteTok:                           "\""
    of jsDollarLCurlyTok:                    "${"
    of jsPercentTok:                         "%"
    of jsPercentEqualTok:                    "%="
    of jsAmpersandTok:                       "&"
    of jsDoubleAmpersandTok:                 "&&"
    of jsDoubleAmpersandEqualTok:            "&&="
    of jsAmpersandEqualTok:                  "&="
    of jsApostropheTok:                      "\'"
    of jsLParTok:                            "("
    of jsRParTok:                            ")"
    of jsAsteriskTok:                        "*"
    of jsDoubleAsteriskTok:                  "**"
    of jsDoubleAsteriskEqualTok:             "**="
    of jsAsteriskEqualTok:                   "*="
    of jsPlusTok:                            "+"
    of jsDoublePlusTok:                      "++"
    of jsPlusEqualTok:                       "+="
    of jsCommaTok:                           ","
    of jsMinusTok:                           "-"
    of jsDoubleMinusTok:                     "--"
    of jsMinusEqualTok:                      "-="
    of jsDotTok:                             "."
    of jsTripleDotTok:                       "..."
    of jsSlashTok:                           "/"
    of jsSlashEqualTok:                      "/="
    of jsColonTok:                           ":"
    of jsSemicolonTok:                       ";"
    of jsLessThanTok:                        "<"
    of jsDoubleLessThanTok:                  "<<"
    of jsDoubleLessThanEqualTok:             "<<="
    of jsLessThanEqualTok:                   "<="
    of jsEqualTok:                           "="
    of jsDoubleEqualTok:                     "=="
    of jsTripleEqualTok:                     "==="
    of jsEqualGreaterThanTok:                "=>"
    of jsGreaterThanTok:                     ">"
    of jsGreaterThanEqualTok:                ">="
    of jsDoubleGreaterThanTok:               ">>"
    of jsDoubleGreaterThanEqualTok:          ">>="
    of jsTripleGreaterThanTok:               ">>>"
    of jsTripleGreaterThanEqualTok:          ">>>="
    of jsQuestionTok:                        "?"
    of jsQuestionDotTok:                     "?."
    of jsDoubleQuestionTok:                  "??"
    of jsDoubleQuestionEqualTok:             "??="
    of jsAtTok:                              "@"
    of jsLBrackTok:                          "["
    of jsRBrackTok:                          "]"
    of jsAccentTok:                          "^"
    of jsAccentEqualTok:                     "^="
    of jsBacktickTok:                        "`"
    of jsAsTok:                              "as"
    of jsAsyncTok:                           "async"
    of jsAwaitTok:                           "await"
    of jsBreakTok:                           "break"
    of jsCaseTok:                            "case"
    of jsCatchTok:                           "catch"
    of jsClassTok:                           "class"
    of jsComment:                            "comment"
    of jsConstTok:                           "const"
    of jsContinueTok:                        "continue"
    of jsDebuggerTok:                        "debugger"
    of jsDefaultTok:                         "default"
    of jsDeleteTok:                          "delete"
    of jsDoTok:                              "do"
    of jsElseTok:                            "else"
    of jsEscapeSequence:                     "escape_sequence"
    of jsExportTok:                          "export"
    of jsExtendsTok:                         "extends"
    of jsFalse:                              "false"
    of jsFinallyTok:                         "finally"
    of jsForTok:                             "for"
    of jsFromTok:                            "from"
    of jsFunctionTok:                        "function"
    of jsGetTok:                             "get"
    of jsHashBangLine:                       "hash_bang_line"
    of jsIdentifier:                         "identifier"
    of jsIfTok:                              "if"
    of jsImportTok:                          "import"
    of jsInTok:                              "in"
    of jsInstanceofTok:                      "instanceof"
    of jsJsxText:                            "jsx_text"
    of jsLetTok:                             "let"
    of jsNewTok:                             "new"
    of jsNull:                               "null"
    of jsNumber:                             "number"
    of jsOfTok:                              "of"
    of jsPropertyIdentifier:                 "property_identifier"
    of jsRegexFlags:                         "regex_flags"
    of jsRegexPattern:                       "regex_pattern"
    of jsReturnTok:                          "return"
    of jsSetTok:                             "set"
    of jsShorthandPropertyIdentifier:        "shorthand_property_identifier"
    of jsShorthandPropertyIdentifierPattern: "shorthand_property_identifier_pattern"
    of jsStatementIdentifier:                "statement_identifier"
    of jsStaticTok:                          "static"
    of jsSuper:                              "super"
    of jsSwitchTok:                          "switch"
    of jsTargetTok:                          "target"
    of jsThis:                               "this"
    of jsThrowTok:                           "throw"
    of jsTrue:                               "true"
    of jsTryTok:                             "try"
    of jsTypeofTok:                          "typeof"
    of jsUndefined:                          "undefined"
    of jsVarTok:                             "var"
    of jsVoidTok:                            "void"
    of jsWhileTok:                           "while"
    of jsWithTok:                            "with"
    of jsYieldTok:                           "yield"
    of jsLCurlyTok:                          "{"
    of jsPipeTok:                            "|"
    of jsPipeEqualTok:                       "|="
    of jsDoublePipeTok:                      "||"
    of jsDoublePipeEqualTok:                 "||="
    of jsRCurlyTok:                          "}"
    of jsTildeTok:                           "~"
    of jsSyntaxError:                        "ERROR"


type
  JsExternalTok* = enum
    jsExtern_automatic_semicolon ## _automatic_semicolon
    jsExtern_template_chars      ## _template_chars


type
  TsJsNode* = distinct TSNode


type
  JsParser* = distinct PtsParser


const jsAllowedSubnodes*: array[JsNodeKind, set[JsNodeKind]] = block:
                                                                 var tmp: array[JsNodeKind, set[JsNodeKind]]
                                                                 tmp[jsArguments] = {jsExpression, jsSpreadElement}
                                                                 tmp[jsArray] = {jsExpression, jsSpreadElement}
                                                                 tmp[jsArrayPattern] = {jsAssignmentPattern, jsPattern}
                                                                 tmp[jsAwaitExpression] = {jsExpression}
                                                                 tmp[jsClass] = {jsClassHeritage}
                                                                 tmp[jsClassDeclaration] = {jsClassHeritage}
                                                                 tmp[jsClassHeritage] = {jsExpression}
                                                                 tmp[jsComputedPropertyName] = {jsExpression}
                                                                 tmp[jsDecorator] = {jsCallExpression, jsIdentifier, jsMemberExpression}
                                                                 tmp[jsElseClause] = {jsStatement}
                                                                 tmp[jsExportClause] = {jsExportSpecifier}
                                                                 tmp[jsExportStatement] = {jsExportClause}
                                                                 tmp[jsExpressionStatement] = {jsExpression, jsSequenceExpression}
                                                                 tmp[jsFormalParameters] = {jsAssignmentPattern, jsPattern}
                                                                 tmp[jsImportClause] = {jsIdentifier, jsNamedImports, jsNamespaceImport}
                                                                 tmp[jsImportStatement] = {jsImportClause}
                                                                 tmp[jsJsxAttribute] = {
                                                                                         jsJsxElement,
                                                                                         jsJsxExpression,
                                                                                         jsJsxFragment,
                                                                                         jsJsxNamespaceName,
                                                                                         jsJsxSelfClosingElement,
                                                                                         jsPropertyIdentifier,
                                                                                         jsString
                                                                                       }
                                                                 tmp[jsJsxElement] = {jsJsxElement, jsJsxExpression, jsJsxFragment, jsJsxSelfClosingElement, jsJsxText}
                                                                 tmp[jsJsxExpression] = {jsExpression, jsSequenceExpression, jsSpreadElement}
                                                                 tmp[jsJsxFragment] = {jsJsxElement, jsJsxExpression, jsJsxFragment, jsJsxSelfClosingElement, jsJsxText}
                                                                 tmp[jsJsxNamespaceName] = {jsIdentifier}
                                                                 tmp[jsLabeledStatement] = {jsStatement}
                                                                 tmp[jsLexicalDeclaration] = {jsVariableDeclarator}
                                                                 tmp[jsNamedImports] = {jsImportSpecifier}
                                                                 tmp[jsNamespaceImport] = {jsIdentifier}
                                                                 tmp[jsNestedIdentifier] = {jsIdentifier, jsNestedIdentifier}
                                                                 tmp[jsObject] = {jsMethodDefinition, jsPair, jsShorthandPropertyIdentifier, jsSpreadElement}
                                                                 tmp[jsObjectPattern] = {jsObjectAssignmentPattern, jsPairPattern, jsRestPattern, jsShorthandPropertyIdentifierPattern}
                                                                 tmp[jsParenthesizedExpression] = {jsExpression, jsSequenceExpression}
                                                                 tmp[jsProgram] = {jsHashBangLine, jsStatement}
                                                                 tmp[jsRestPattern] = {jsArrayPattern, jsIdentifier, jsObjectPattern}
                                                                 tmp[jsReturnStatement] = {jsExpression, jsSequenceExpression}
                                                                 tmp[jsSpreadElement] = {jsExpression}
                                                                 tmp[jsStatementBlock] = {jsStatement}
                                                                 tmp[jsString] = {jsEscapeSequence}
                                                                 tmp[jsSwitchBody] = {jsSwitchCase, jsSwitchDefault}
                                                                 tmp[jsSwitchCase] = {jsStatement}
                                                                 tmp[jsSwitchDefault] = {jsStatement}
                                                                 tmp[jsTemplateString] = {jsEscapeSequence, jsTemplateSubstitution}
                                                                 tmp[jsTemplateSubstitution] = {jsExpression, jsSequenceExpression}
                                                                 tmp[jsThrowStatement] = {jsExpression, jsSequenceExpression}
                                                                 tmp[jsVariableDeclaration] = {jsVariableDeclarator}
                                                                 tmp[jsYieldExpression] = {jsExpression}
                                                                 tmp
const jsTokenKinds*: set[JsNodeKind] = {
                                         jsExclamationTok,
                                         jsExclamationEqualTok,
                                         jsExclamationDoubleEqualTok,
                                         jsQuoteTok,
                                         jsDollarLCurlyTok,
                                         jsPercentTok,
                                         jsPercentEqualTok,
                                         jsAmpersandTok,
                                         jsDoubleAmpersandTok,
                                         jsDoubleAmpersandEqualTok,
                                         jsAmpersandEqualTok,
                                         jsApostropheTok,
                                         jsLParTok,
                                         jsRParTok,
                                         jsAsteriskTok,
                                         jsDoubleAsteriskTok,
                                         jsDoubleAsteriskEqualTok,
                                         jsAsteriskEqualTok,
                                         jsPlusTok,
                                         jsDoublePlusTok,
                                         jsPlusEqualTok,
                                         jsCommaTok,
                                         jsMinusTok,
                                         jsDoubleMinusTok,
                                         jsMinusEqualTok,
                                         jsDotTok,
                                         jsTripleDotTok,
                                         jsSlashTok,
                                         jsSlashEqualTok,
                                         jsColonTok,
                                         jsSemicolonTok,
                                         jsLessThanTok,
                                         jsDoubleLessThanTok,
                                         jsDoubleLessThanEqualTok,
                                         jsLessThanEqualTok,
                                         jsEqualTok,
                                         jsDoubleEqualTok,
                                         jsTripleEqualTok,
                                         jsEqualGreaterThanTok,
                                         jsGreaterThanTok,
                                         jsGreaterThanEqualTok,
                                         jsDoubleGreaterThanTok,
                                         jsDoubleGreaterThanEqualTok,
                                         jsTripleGreaterThanTok,
                                         jsTripleGreaterThanEqualTok,
                                         jsQuestionTok,
                                         jsQuestionDotTok,
                                         jsDoubleQuestionTok,
                                         jsDoubleQuestionEqualTok,
                                         jsAtTok,
                                         jsLBrackTok,
                                         jsRBrackTok,
                                         jsAccentTok,
                                         jsAccentEqualTok,
                                         jsBacktickTok,
                                         jsAsTok,
                                         jsAsyncTok,
                                         jsAwaitTok,
                                         jsBreakTok,
                                         jsCaseTok,
                                         jsCatchTok,
                                         jsClassTok,
                                         jsConstTok,
                                         jsContinueTok,
                                         jsDebuggerTok,
                                         jsDefaultTok,
                                         jsDeleteTok,
                                         jsDoTok,
                                         jsElseTok,
                                         jsExportTok,
                                         jsExtendsTok,
                                         jsFinallyTok,
                                         jsForTok,
                                         jsFromTok,
                                         jsFunctionTok,
                                         jsGetTok,
                                         jsIfTok,
                                         jsImportTok,
                                         jsInTok,
                                         jsInstanceofTok,
                                         jsLetTok,
                                         jsNewTok,
                                         jsOfTok,
                                         jsReturnTok,
                                         jsSetTok,
                                         jsStaticTok,
                                         jsSwitchTok,
                                         jsTargetTok,
                                         jsThrowTok,
                                         jsTryTok,
                                         jsTypeofTok,
                                         jsVarTok,
                                         jsVoidTok,
                                         jsWhileTok,
                                         jsWithTok,
                                         jsYieldTok,
                                         jsLCurlyTok,
                                         jsPipeTok,
                                         jsPipeEqualTok,
                                         jsDoublePipeTok,
                                         jsDoublePipeEqualTok,
                                         jsRCurlyTok,
                                         jsTildeTok
                                       }

proc tsNodeType*(node: TsJsNode): string



proc kind*(node: TsJsNode): JsNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "declaration":                           jsDeclaration
      of "expression":                            jsExpression
      of "pattern":                               jsPattern
      of "primary_expression":                    jsPrimaryExpression
      of "statement":                             jsStatement
      of "arguments":                             jsArguments
      of "array":                                 jsArray
      of "array_pattern":                         jsArrayPattern
      of "arrow_function":                        jsArrowFunction
      of "assignment_expression":                 jsAssignmentExpression
      of "assignment_pattern":                    jsAssignmentPattern
      of "augmented_assignment_expression":       jsAugmentedAssignmentExpression
      of "await_expression":                      jsAwaitExpression
      of "binary_expression":                     jsBinaryExpression
      of "break_statement":                       jsBreakStatement
      of "call_expression":                       jsCallExpression
      of "catch_clause":                          jsCatchClause
      of "class":                                 jsClass
      of "class_body":                            jsClassBody
      of "class_declaration":                     jsClassDeclaration
      of "class_heritage":                        jsClassHeritage
      of "computed_property_name":                jsComputedPropertyName
      of "continue_statement":                    jsContinueStatement
      of "debugger_statement":                    jsDebuggerStatement
      of "decorator":                             jsDecorator
      of "do_statement":                          jsDoStatement
      of "else_clause":                           jsElseClause
      of "empty_statement":                       jsEmptyStatement
      of "export_clause":                         jsExportClause
      of "export_specifier":                      jsExportSpecifier
      of "export_statement":                      jsExportStatement
      of "expression_statement":                  jsExpressionStatement
      of "finally_clause":                        jsFinallyClause
      of "for_in_statement":                      jsForInStatement
      of "for_statement":                         jsForStatement
      of "formal_parameters":                     jsFormalParameters
      of "function":                              jsFunction
      of "function_declaration":                  jsFunctionDeclaration
      of "generator_function":                    jsGeneratorFunction
      of "generator_function_declaration":        jsGeneratorFunctionDeclaration
      of "if_statement":                          jsIfStatement
      of "import":                                jsImport
      of "import_clause":                         jsImportClause
      of "import_specifier":                      jsImportSpecifier
      of "import_statement":                      jsImportStatement
      of "jsx_attribute":                         jsJsxAttribute
      of "jsx_closing_element":                   jsJsxClosingElement
      of "jsx_element":                           jsJsxElement
      of "jsx_expression":                        jsJsxExpression
      of "jsx_fragment":                          jsJsxFragment
      of "jsx_namespace_name":                    jsJsxNamespaceName
      of "jsx_opening_element":                   jsJsxOpeningElement
      of "jsx_self_closing_element":              jsJsxSelfClosingElement
      of "labeled_statement":                     jsLabeledStatement
      of "lexical_declaration":                   jsLexicalDeclaration
      of "member_expression":                     jsMemberExpression
      of "meta_property":                         jsMetaProperty
      of "method_definition":                     jsMethodDefinition
      of "named_imports":                         jsNamedImports
      of "namespace_import":                      jsNamespaceImport
      of "nested_identifier":                     jsNestedIdentifier
      of "new_expression":                        jsNewExpression
      of "object":                                jsObject
      of "object_assignment_pattern":             jsObjectAssignmentPattern
      of "object_pattern":                        jsObjectPattern
      of "pair":                                  jsPair
      of "pair_pattern":                          jsPairPattern
      of "parenthesized_expression":              jsParenthesizedExpression
      of "program":                               jsProgram
      of "public_field_definition":               jsPublicFieldDefinition
      of "regex":                                 jsRegex
      of "rest_pattern":                          jsRestPattern
      of "return_statement":                      jsReturnStatement
      of "sequence_expression":                   jsSequenceExpression
      of "spread_element":                        jsSpreadElement
      of "statement_block":                       jsStatementBlock
      of "string":                                jsString
      of "subscript_expression":                  jsSubscriptExpression
      of "switch_body":                           jsSwitchBody
      of "switch_case":                           jsSwitchCase
      of "switch_default":                        jsSwitchDefault
      of "switch_statement":                      jsSwitchStatement
      of "template_string":                       jsTemplateString
      of "template_substitution":                 jsTemplateSubstitution
      of "ternary_expression":                    jsTernaryExpression
      of "throw_statement":                       jsThrowStatement
      of "try_statement":                         jsTryStatement
      of "unary_expression":                      jsUnaryExpression
      of "update_expression":                     jsUpdateExpression
      of "variable_declaration":                  jsVariableDeclaration
      of "variable_declarator":                   jsVariableDeclarator
      of "while_statement":                       jsWhileStatement
      of "with_statement":                        jsWithStatement
      of "yield_expression":                      jsYieldExpression
      of "!":                                     jsExclamationTok
      of "!=":                                    jsExclamationEqualTok
      of "!==":                                   jsExclamationDoubleEqualTok
      of "\"":                                    jsQuoteTok
      of "${":                                    jsDollarLCurlyTok
      of "%":                                     jsPercentTok
      of "%=":                                    jsPercentEqualTok
      of "&":                                     jsAmpersandTok
      of "&&":                                    jsDoubleAmpersandTok
      of "&&=":                                   jsDoubleAmpersandEqualTok
      of "&=":                                    jsAmpersandEqualTok
      of "\'":                                    jsApostropheTok
      of "(":                                     jsLParTok
      of ")":                                     jsRParTok
      of "*":                                     jsAsteriskTok
      of "**":                                    jsDoubleAsteriskTok
      of "**=":                                   jsDoubleAsteriskEqualTok
      of "*=":                                    jsAsteriskEqualTok
      of "+":                                     jsPlusTok
      of "++":                                    jsDoublePlusTok
      of "+=":                                    jsPlusEqualTok
      of ",":                                     jsCommaTok
      of "-":                                     jsMinusTok
      of "--":                                    jsDoubleMinusTok
      of "-=":                                    jsMinusEqualTok
      of ".":                                     jsDotTok
      of "...":                                   jsTripleDotTok
      of "/":                                     jsSlashTok
      of "/=":                                    jsSlashEqualTok
      of ":":                                     jsColonTok
      of ";":                                     jsSemicolonTok
      of "<":                                     jsLessThanTok
      of "<<":                                    jsDoubleLessThanTok
      of "<<=":                                   jsDoubleLessThanEqualTok
      of "<=":                                    jsLessThanEqualTok
      of "=":                                     jsEqualTok
      of "==":                                    jsDoubleEqualTok
      of "===":                                   jsTripleEqualTok
      of "=>":                                    jsEqualGreaterThanTok
      of ">":                                     jsGreaterThanTok
      of ">=":                                    jsGreaterThanEqualTok
      of ">>":                                    jsDoubleGreaterThanTok
      of ">>=":                                   jsDoubleGreaterThanEqualTok
      of ">>>":                                   jsTripleGreaterThanTok
      of ">>>=":                                  jsTripleGreaterThanEqualTok
      of "?":                                     jsQuestionTok
      of "?.":                                    jsQuestionDotTok
      of "??":                                    jsDoubleQuestionTok
      of "??=":                                   jsDoubleQuestionEqualTok
      of "@":                                     jsAtTok
      of "[":                                     jsLBrackTok
      of "]":                                     jsRBrackTok
      of "^":                                     jsAccentTok
      of "^=":                                    jsAccentEqualTok
      of "`":                                     jsBacktickTok
      of "as":                                    jsAsTok
      of "async":                                 jsAsyncTok
      of "await":                                 jsAwaitTok
      of "break":                                 jsBreakTok
      of "case":                                  jsCaseTok
      of "catch":                                 jsCatchTok
      of "comment":                               jsComment
      of "const":                                 jsConstTok
      of "continue":                              jsContinueTok
      of "debugger":                              jsDebuggerTok
      of "default":                               jsDefaultTok
      of "delete":                                jsDeleteTok
      of "do":                                    jsDoTok
      of "else":                                  jsElseTok
      of "escape_sequence":                       jsEscapeSequence
      of "export":                                jsExportTok
      of "extends":                               jsExtendsTok
      of "false":                                 jsFalse
      of "finally":                               jsFinallyTok
      of "for":                                   jsForTok
      of "from":                                  jsFromTok
      of "get":                                   jsGetTok
      of "hash_bang_line":                        jsHashBangLine
      of "identifier":                            jsIdentifier
      of "if":                                    jsIfTok
      of "in":                                    jsInTok
      of "instanceof":                            jsInstanceofTok
      of "jsx_text":                              jsJsxText
      of "let":                                   jsLetTok
      of "new":                                   jsNewTok
      of "null":                                  jsNull
      of "number":                                jsNumber
      of "of":                                    jsOfTok
      of "property_identifier":                   jsPropertyIdentifier
      of "regex_flags":                           jsRegexFlags
      of "regex_pattern":                         jsRegexPattern
      of "return":                                jsReturnTok
      of "set":                                   jsSetTok
      of "shorthand_property_identifier":         jsShorthandPropertyIdentifier
      of "shorthand_property_identifier_pattern": jsShorthandPropertyIdentifierPattern
      of "statement_identifier":                  jsStatementIdentifier
      of "static":                                jsStaticTok
      of "super":                                 jsSuper
      of "switch":                                jsSwitchTok
      of "target":                                jsTargetTok
      of "this":                                  jsThis
      of "throw":                                 jsThrowTok
      of "true":                                  jsTrue
      of "try":                                   jsTryTok
      of "typeof":                                jsTypeofTok
      of "undefined":                             jsUndefined
      of "var":                                   jsVarTok
      of "void":                                  jsVoidTok
      of "while":                                 jsWhileTok
      of "with":                                  jsWithTok
      of "yield":                                 jsYieldTok
      of "{":                                     jsLCurlyTok
      of "|":                                     jsPipeTok
      of "|=":                                    jsPipeEqualTok
      of "||":                                    jsDoublePipeTok
      of "||=":                                   jsDoublePipeEqualTok
      of "}":                                     jsRCurlyTok
      of "~":                                     jsTildeTok
      of "ERROR":                                 jsSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsJsNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsJsNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsJsNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_javascript(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsJsNode): string =
  $ts_node_type(TSNode(node))

proc newTsJsParser*(): JsParser =
  result = JsParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_javascript())

proc parseString*(parser: JsParser, str: string): TsJsNode =
  TsJsNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsJsString*(str: string): TsJsNode =
  let parser = newTsJsParser()
  return parseString(parser, str)

func `$`*(node: TsJsNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsJsNode,
    idx:  int,
    kind: JsNodeKind | set[JsNodeKind]
  ): TsJsNode =
  assert 0 <= idx and idx < node.len
  result = TsJsNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  JsNode* = HtsNode[TsJsNode, JsNodeKind]


proc treeReprTsJs*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsJsNode, JsNodeKind](parseTsJsString(str), str, 2, unnamed = unnamed)

proc toHtsNode*(
    node: TsJsNode,
    str:  ptr string
  ): HtsNode[TsJsNode, JsNodeKind] =
  toHtsNode[TsJsNode, JsNodeKind](node, str)

proc toHtsTree*(node: TsJsNode, str: ptr string): JsNode =
  toHtsNode[TsJsNode, JsNodeKind](node, str)

proc parseJsString*(str: ptr string, unnamed: bool = false): JsNode =
  let parser = newTsJsParser()
  return toHtsTree[TsJsNode, JsNodeKind](parseString(parser, str[]), str)

proc parseJsString*(str: string, unnamed: bool = false): JsNode =
  let parser = newTsJsParser()
  return toHtsTree[TsJsNode, JsNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


