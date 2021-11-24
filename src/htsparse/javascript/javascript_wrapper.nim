import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  JavascriptNodeKind* = enum
    javascriptDeclaration                        ## declaration
    javascriptExpression                         ## expression
    javascriptPattern                            ## pattern
    javascriptPrimaryExpression                  ## primary_expression
    javascriptStatement                          ## statement
    javascriptArguments                          ## arguments
    javascriptArray                              ## array
    javascriptArrayPattern                       ## array_pattern
    javascriptArrowFunction                      ## arrow_function
    javascriptAssignmentExpression               ## assignment_expression
    javascriptAssignmentPattern                  ## assignment_pattern
    javascriptAugmentedAssignmentExpression      ## augmented_assignment_expression
    javascriptAwaitExpression                    ## await_expression
    javascriptBinaryExpression                   ## binary_expression
    javascriptBreakStatement                     ## break_statement
    javascriptCallExpression                     ## call_expression
    javascriptCatchClause                        ## catch_clause
    javascriptClass                              ## class
    javascriptClassBody                          ## class_body
    javascriptClassDeclaration                   ## class_declaration
    javascriptClassHeritage                      ## class_heritage
    javascriptComputedPropertyName               ## computed_property_name
    javascriptContinueStatement                  ## continue_statement
    javascriptDebuggerStatement                  ## debugger_statement
    javascriptDecorator                          ## decorator
    javascriptDoStatement                        ## do_statement
    javascriptElseClause                         ## else_clause
    javascriptEmptyStatement                     ## empty_statement
    javascriptExportClause                       ## export_clause
    javascriptExportSpecifier                    ## export_specifier
    javascriptExportStatement                    ## export_statement
    javascriptExpressionStatement                ## expression_statement
    javascriptFinallyClause                      ## finally_clause
    javascriptForInStatement                     ## for_in_statement
    javascriptForStatement                       ## for_statement
    javascriptFormalParameters                   ## formal_parameters
    javascriptFunction                           ## function
    javascriptFunctionDeclaration                ## function_declaration
    javascriptGeneratorFunction                  ## generator_function
    javascriptGeneratorFunctionDeclaration       ## generator_function_declaration
    javascriptIfStatement                        ## if_statement
    javascriptImport                             ## import
    javascriptImportClause                       ## import_clause
    javascriptImportSpecifier                    ## import_specifier
    javascriptImportStatement                    ## import_statement
    javascriptJsxAttribute                       ## jsx_attribute
    javascriptJsxClosingElement                  ## jsx_closing_element
    javascriptJsxElement                         ## jsx_element
    javascriptJsxExpression                      ## jsx_expression
    javascriptJsxFragment                        ## jsx_fragment
    javascriptJsxNamespaceName                   ## jsx_namespace_name
    javascriptJsxOpeningElement                  ## jsx_opening_element
    javascriptJsxSelfClosingElement              ## jsx_self_closing_element
    javascriptLabeledStatement                   ## labeled_statement
    javascriptLexicalDeclaration                 ## lexical_declaration
    javascriptMemberExpression                   ## member_expression
    javascriptMetaProperty                       ## meta_property
    javascriptMethodDefinition                   ## method_definition
    javascriptNamedImports                       ## named_imports
    javascriptNamespaceImport                    ## namespace_import
    javascriptNestedIdentifier                   ## nested_identifier
    javascriptNewExpression                      ## new_expression
    javascriptObject                             ## object
    javascriptObjectAssignmentPattern            ## object_assignment_pattern
    javascriptObjectPattern                      ## object_pattern
    javascriptPair                               ## pair
    javascriptPairPattern                        ## pair_pattern
    javascriptParenthesizedExpression            ## parenthesized_expression
    javascriptProgram                            ## program
    javascriptPublicFieldDefinition              ## public_field_definition
    javascriptRegex                              ## regex
    javascriptRestPattern                        ## rest_pattern
    javascriptReturnStatement                    ## return_statement
    javascriptSequenceExpression                 ## sequence_expression
    javascriptSpreadElement                      ## spread_element
    javascriptStatementBlock                     ## statement_block
    javascriptString                             ## string
    javascriptSubscriptExpression                ## subscript_expression
    javascriptSwitchBody                         ## switch_body
    javascriptSwitchCase                         ## switch_case
    javascriptSwitchDefault                      ## switch_default
    javascriptSwitchStatement                    ## switch_statement
    javascriptTemplateString                     ## template_string
    javascriptTemplateSubstitution               ## template_substitution
    javascriptTernaryExpression                  ## ternary_expression
    javascriptThrowStatement                     ## throw_statement
    javascriptTryStatement                       ## try_statement
    javascriptUnaryExpression                    ## unary_expression
    javascriptUpdateExpression                   ## update_expression
    javascriptVariableDeclaration                ## variable_declaration
    javascriptVariableDeclarator                 ## variable_declarator
    javascriptWhileStatement                     ## while_statement
    javascriptWithStatement                      ## with_statement
    javascriptYieldExpression                    ## yield_expression
    javascriptExclamationTok                     ## !
    javascriptExclamationEqualTok                ## !=
    javascriptExclamationDoubleEqualTok          ## !==
    javascriptQuoteTok                           ## "
    javascriptDollarLCurlyTok                    ## ${
    javascriptPercentTok                         ## %
    javascriptPercentEqualTok                    ## %=
    javascriptAmpersandTok                       ## &
    javascriptDoubleAmpersandTok                 ## &&
    javascriptDoubleAmpersandEqualTok            ## &&=
    javascriptAmpersandEqualTok                  ## &=
    javascriptApostropheTok                      ## '
    javascriptLParTok                            ## (
    javascriptRParTok                            ## )
    javascriptAsteriskTok                        ## *
    javascriptDoubleAsteriskTok                  ## **
    javascriptDoubleAsteriskEqualTok             ## **=
    javascriptAsteriskEqualTok                   ## *=
    javascriptPlusTok                            ## +
    javascriptDoublePlusTok                      ## ++
    javascriptPlusEqualTok                       ## +=
    javascriptCommaTok                           ## ,
    javascriptMinusTok                           ## -
    javascriptDoubleMinusTok                     ## --
    javascriptMinusEqualTok                      ## -=
    javascriptDotTok                             ## .
    javascriptTripleDotTok                       ## ...
    javascriptSlashTok                           ## /
    javascriptSlashEqualTok                      ## /=
    javascriptColonTok                           ## :
    javascriptSemicolonTok                       ## ;
    javascriptLessThanTok                        ## <
    javascriptDoubleLessThanTok                  ## <<
    javascriptDoubleLessThanEqualTok             ## <<=
    javascriptLessThanEqualTok                   ## <=
    javascriptEqualTok                           ## =
    javascriptDoubleEqualTok                     ## ==
    javascriptTripleEqualTok                     ## ===
    javascriptEqualGreaterThanTok                ## =>
    javascriptGreaterThanTok                     ## >
    javascriptGreaterThanEqualTok                ## >=
    javascriptDoubleGreaterThanTok               ## >>
    javascriptDoubleGreaterThanEqualTok          ## >>=
    javascriptTripleGreaterThanTok               ## >>>
    javascriptTripleGreaterThanEqualTok          ## >>>=
    javascriptQuestionTok                        ## ?
    javascriptQuestionDotTok                     ## ?.
    javascriptDoubleQuestionTok                  ## ??
    javascriptDoubleQuestionEqualTok             ## ??=
    javascriptAtTok                              ## @
    javascriptLBrackTok                          ## [
    javascriptRBrackTok                          ## ]
    javascriptAccentTok                          ## ^
    javascriptAccentEqualTok                     ## ^=
    javascriptBacktickTok                        ## `
    javascriptAsTok                              ## as
    javascriptAsyncTok                           ## async
    javascriptAwaitTok                           ## await
    javascriptBreakTok                           ## break
    javascriptCaseTok                            ## case
    javascriptCatchTok                           ## catch
    javascriptClassTok                           ## class
    javascriptComment                            ## comment
    javascriptConstTok                           ## const
    javascriptContinueTok                        ## continue
    javascriptDebuggerTok                        ## debugger
    javascriptDefaultTok                         ## default
    javascriptDeleteTok                          ## delete
    javascriptDoTok                              ## do
    javascriptElseTok                            ## else
    javascriptEscapeSequence                     ## escape_sequence
    javascriptExportTok                          ## export
    javascriptExtendsTok                         ## extends
    javascriptFalse                              ## false
    javascriptFinallyTok                         ## finally
    javascriptForTok                             ## for
    javascriptFromTok                            ## from
    javascriptFunctionTok                        ## function
    javascriptGetTok                             ## get
    javascriptHashBangLine                       ## hash_bang_line
    javascriptIdentifier                         ## identifier
    javascriptIfTok                              ## if
    javascriptImportTok                          ## import
    javascriptInTok                              ## in
    javascriptInstanceofTok                      ## instanceof
    javascriptJsxText                            ## jsx_text
    javascriptLetTok                             ## let
    javascriptNewTok                             ## new
    javascriptNull                               ## null
    javascriptNumber                             ## number
    javascriptOfTok                              ## of
    javascriptPropertyIdentifier                 ## property_identifier
    javascriptRegexFlags                         ## regex_flags
    javascriptRegexPattern                       ## regex_pattern
    javascriptReturnTok                          ## return
    javascriptSetTok                             ## set
    javascriptShorthandPropertyIdentifier        ## shorthand_property_identifier
    javascriptShorthandPropertyIdentifierPattern ## shorthand_property_identifier_pattern
    javascriptStatementIdentifier                ## statement_identifier
    javascriptStaticTok                          ## static
    javascriptSuper                              ## super
    javascriptSwitchTok                          ## switch
    javascriptTargetTok                          ## target
    javascriptThis                               ## this
    javascriptThrowTok                           ## throw
    javascriptTrue                               ## true
    javascriptTryTok                             ## try
    javascriptTypeofTok                          ## typeof
    javascriptUndefined                          ## undefined
    javascriptVarTok                             ## var
    javascriptVoidTok                            ## void
    javascriptWhileTok                           ## while
    javascriptWithTok                            ## with
    javascriptYieldTok                           ## yield
    javascriptLCurlyTok                          ## {
    javascriptPipeTok                            ## |
    javascriptPipeEqualTok                       ## |=
    javascriptDoublePipeTok                      ## ||
    javascriptDoublePipeEqualTok                 ## ||=
    javascriptRCurlyTok                          ## }
    javascriptTildeTok                           ## ~
    javascriptSyntaxError                        ## Tree-sitter parser syntax error


proc strRepr*(kind: JavascriptNodeKind): string =
  case kind:
    of javascriptDeclaration:                        "declaration"
    of javascriptExpression:                         "expression"
    of javascriptPattern:                            "pattern"
    of javascriptPrimaryExpression:                  "primary_expression"
    of javascriptStatement:                          "statement"
    of javascriptArguments:                          "arguments"
    of javascriptArray:                              "array"
    of javascriptArrayPattern:                       "array_pattern"
    of javascriptArrowFunction:                      "arrow_function"
    of javascriptAssignmentExpression:               "assignment_expression"
    of javascriptAssignmentPattern:                  "assignment_pattern"
    of javascriptAugmentedAssignmentExpression:      "augmented_assignment_expression"
    of javascriptAwaitExpression:                    "await_expression"
    of javascriptBinaryExpression:                   "binary_expression"
    of javascriptBreakStatement:                     "break_statement"
    of javascriptCallExpression:                     "call_expression"
    of javascriptCatchClause:                        "catch_clause"
    of javascriptClass:                              "class"
    of javascriptClassBody:                          "class_body"
    of javascriptClassDeclaration:                   "class_declaration"
    of javascriptClassHeritage:                      "class_heritage"
    of javascriptComputedPropertyName:               "computed_property_name"
    of javascriptContinueStatement:                  "continue_statement"
    of javascriptDebuggerStatement:                  "debugger_statement"
    of javascriptDecorator:                          "decorator"
    of javascriptDoStatement:                        "do_statement"
    of javascriptElseClause:                         "else_clause"
    of javascriptEmptyStatement:                     "empty_statement"
    of javascriptExportClause:                       "export_clause"
    of javascriptExportSpecifier:                    "export_specifier"
    of javascriptExportStatement:                    "export_statement"
    of javascriptExpressionStatement:                "expression_statement"
    of javascriptFinallyClause:                      "finally_clause"
    of javascriptForInStatement:                     "for_in_statement"
    of javascriptForStatement:                       "for_statement"
    of javascriptFormalParameters:                   "formal_parameters"
    of javascriptFunction:                           "function"
    of javascriptFunctionDeclaration:                "function_declaration"
    of javascriptGeneratorFunction:                  "generator_function"
    of javascriptGeneratorFunctionDeclaration:       "generator_function_declaration"
    of javascriptIfStatement:                        "if_statement"
    of javascriptImport:                             "import"
    of javascriptImportClause:                       "import_clause"
    of javascriptImportSpecifier:                    "import_specifier"
    of javascriptImportStatement:                    "import_statement"
    of javascriptJsxAttribute:                       "jsx_attribute"
    of javascriptJsxClosingElement:                  "jsx_closing_element"
    of javascriptJsxElement:                         "jsx_element"
    of javascriptJsxExpression:                      "jsx_expression"
    of javascriptJsxFragment:                        "jsx_fragment"
    of javascriptJsxNamespaceName:                   "jsx_namespace_name"
    of javascriptJsxOpeningElement:                  "jsx_opening_element"
    of javascriptJsxSelfClosingElement:              "jsx_self_closing_element"
    of javascriptLabeledStatement:                   "labeled_statement"
    of javascriptLexicalDeclaration:                 "lexical_declaration"
    of javascriptMemberExpression:                   "member_expression"
    of javascriptMetaProperty:                       "meta_property"
    of javascriptMethodDefinition:                   "method_definition"
    of javascriptNamedImports:                       "named_imports"
    of javascriptNamespaceImport:                    "namespace_import"
    of javascriptNestedIdentifier:                   "nested_identifier"
    of javascriptNewExpression:                      "new_expression"
    of javascriptObject:                             "object"
    of javascriptObjectAssignmentPattern:            "object_assignment_pattern"
    of javascriptObjectPattern:                      "object_pattern"
    of javascriptPair:                               "pair"
    of javascriptPairPattern:                        "pair_pattern"
    of javascriptParenthesizedExpression:            "parenthesized_expression"
    of javascriptProgram:                            "program"
    of javascriptPublicFieldDefinition:              "public_field_definition"
    of javascriptRegex:                              "regex"
    of javascriptRestPattern:                        "rest_pattern"
    of javascriptReturnStatement:                    "return_statement"
    of javascriptSequenceExpression:                 "sequence_expression"
    of javascriptSpreadElement:                      "spread_element"
    of javascriptStatementBlock:                     "statement_block"
    of javascriptString:                             "string"
    of javascriptSubscriptExpression:                "subscript_expression"
    of javascriptSwitchBody:                         "switch_body"
    of javascriptSwitchCase:                         "switch_case"
    of javascriptSwitchDefault:                      "switch_default"
    of javascriptSwitchStatement:                    "switch_statement"
    of javascriptTemplateString:                     "template_string"
    of javascriptTemplateSubstitution:               "template_substitution"
    of javascriptTernaryExpression:                  "ternary_expression"
    of javascriptThrowStatement:                     "throw_statement"
    of javascriptTryStatement:                       "try_statement"
    of javascriptUnaryExpression:                    "unary_expression"
    of javascriptUpdateExpression:                   "update_expression"
    of javascriptVariableDeclaration:                "variable_declaration"
    of javascriptVariableDeclarator:                 "variable_declarator"
    of javascriptWhileStatement:                     "while_statement"
    of javascriptWithStatement:                      "with_statement"
    of javascriptYieldExpression:                    "yield_expression"
    of javascriptExclamationTok:                     "!"
    of javascriptExclamationEqualTok:                "!="
    of javascriptExclamationDoubleEqualTok:          "!=="
    of javascriptQuoteTok:                           "\""
    of javascriptDollarLCurlyTok:                    "${"
    of javascriptPercentTok:                         "%"
    of javascriptPercentEqualTok:                    "%="
    of javascriptAmpersandTok:                       "&"
    of javascriptDoubleAmpersandTok:                 "&&"
    of javascriptDoubleAmpersandEqualTok:            "&&="
    of javascriptAmpersandEqualTok:                  "&="
    of javascriptApostropheTok:                      "\'"
    of javascriptLParTok:                            "("
    of javascriptRParTok:                            ")"
    of javascriptAsteriskTok:                        "*"
    of javascriptDoubleAsteriskTok:                  "**"
    of javascriptDoubleAsteriskEqualTok:             "**="
    of javascriptAsteriskEqualTok:                   "*="
    of javascriptPlusTok:                            "+"
    of javascriptDoublePlusTok:                      "++"
    of javascriptPlusEqualTok:                       "+="
    of javascriptCommaTok:                           ","
    of javascriptMinusTok:                           "-"
    of javascriptDoubleMinusTok:                     "--"
    of javascriptMinusEqualTok:                      "-="
    of javascriptDotTok:                             "."
    of javascriptTripleDotTok:                       "..."
    of javascriptSlashTok:                           "/"
    of javascriptSlashEqualTok:                      "/="
    of javascriptColonTok:                           ":"
    of javascriptSemicolonTok:                       ";"
    of javascriptLessThanTok:                        "<"
    of javascriptDoubleLessThanTok:                  "<<"
    of javascriptDoubleLessThanEqualTok:             "<<="
    of javascriptLessThanEqualTok:                   "<="
    of javascriptEqualTok:                           "="
    of javascriptDoubleEqualTok:                     "=="
    of javascriptTripleEqualTok:                     "==="
    of javascriptEqualGreaterThanTok:                "=>"
    of javascriptGreaterThanTok:                     ">"
    of javascriptGreaterThanEqualTok:                ">="
    of javascriptDoubleGreaterThanTok:               ">>"
    of javascriptDoubleGreaterThanEqualTok:          ">>="
    of javascriptTripleGreaterThanTok:               ">>>"
    of javascriptTripleGreaterThanEqualTok:          ">>>="
    of javascriptQuestionTok:                        "?"
    of javascriptQuestionDotTok:                     "?."
    of javascriptDoubleQuestionTok:                  "??"
    of javascriptDoubleQuestionEqualTok:             "??="
    of javascriptAtTok:                              "@"
    of javascriptLBrackTok:                          "["
    of javascriptRBrackTok:                          "]"
    of javascriptAccentTok:                          "^"
    of javascriptAccentEqualTok:                     "^="
    of javascriptBacktickTok:                        "`"
    of javascriptAsTok:                              "as"
    of javascriptAsyncTok:                           "async"
    of javascriptAwaitTok:                           "await"
    of javascriptBreakTok:                           "break"
    of javascriptCaseTok:                            "case"
    of javascriptCatchTok:                           "catch"
    of javascriptClassTok:                           "class"
    of javascriptComment:                            "comment"
    of javascriptConstTok:                           "const"
    of javascriptContinueTok:                        "continue"
    of javascriptDebuggerTok:                        "debugger"
    of javascriptDefaultTok:                         "default"
    of javascriptDeleteTok:                          "delete"
    of javascriptDoTok:                              "do"
    of javascriptElseTok:                            "else"
    of javascriptEscapeSequence:                     "escape_sequence"
    of javascriptExportTok:                          "export"
    of javascriptExtendsTok:                         "extends"
    of javascriptFalse:                              "false"
    of javascriptFinallyTok:                         "finally"
    of javascriptForTok:                             "for"
    of javascriptFromTok:                            "from"
    of javascriptFunctionTok:                        "function"
    of javascriptGetTok:                             "get"
    of javascriptHashBangLine:                       "hash_bang_line"
    of javascriptIdentifier:                         "identifier"
    of javascriptIfTok:                              "if"
    of javascriptImportTok:                          "import"
    of javascriptInTok:                              "in"
    of javascriptInstanceofTok:                      "instanceof"
    of javascriptJsxText:                            "jsx_text"
    of javascriptLetTok:                             "let"
    of javascriptNewTok:                             "new"
    of javascriptNull:                               "null"
    of javascriptNumber:                             "number"
    of javascriptOfTok:                              "of"
    of javascriptPropertyIdentifier:                 "property_identifier"
    of javascriptRegexFlags:                         "regex_flags"
    of javascriptRegexPattern:                       "regex_pattern"
    of javascriptReturnTok:                          "return"
    of javascriptSetTok:                             "set"
    of javascriptShorthandPropertyIdentifier:        "shorthand_property_identifier"
    of javascriptShorthandPropertyIdentifierPattern: "shorthand_property_identifier_pattern"
    of javascriptStatementIdentifier:                "statement_identifier"
    of javascriptStaticTok:                          "static"
    of javascriptSuper:                              "super"
    of javascriptSwitchTok:                          "switch"
    of javascriptTargetTok:                          "target"
    of javascriptThis:                               "this"
    of javascriptThrowTok:                           "throw"
    of javascriptTrue:                               "true"
    of javascriptTryTok:                             "try"
    of javascriptTypeofTok:                          "typeof"
    of javascriptUndefined:                          "undefined"
    of javascriptVarTok:                             "var"
    of javascriptVoidTok:                            "void"
    of javascriptWhileTok:                           "while"
    of javascriptWithTok:                            "with"
    of javascriptYieldTok:                           "yield"
    of javascriptLCurlyTok:                          "{"
    of javascriptPipeTok:                            "|"
    of javascriptPipeEqualTok:                       "|="
    of javascriptDoublePipeTok:                      "||"
    of javascriptDoublePipeEqualTok:                 "||="
    of javascriptRCurlyTok:                          "}"
    of javascriptTildeTok:                           "~"
    of javascriptSyntaxError:                        "ERROR"


type
  JavascriptExternalTok* = enum
    javascriptExtern_automatic_semicolon ## _automatic_semicolon
    javascriptExtern_template_chars      ## _template_chars


type
  TsJavascriptNode* = distinct TSNode


type
  JavascriptParser* = distinct PtsParser


const javascriptAllowedSubnodes*: array[JavascriptNodeKind, set[JavascriptNodeKind]] = block:
                                                                                         var tmp: array[JavascriptNodeKind, set[JavascriptNodeKind]]
                                                                                         tmp[javascriptArguments] = {javascriptExpression, javascriptSpreadElement}
                                                                                         tmp[javascriptArray] = {javascriptExpression, javascriptSpreadElement}
                                                                                         tmp[javascriptArrayPattern] = {javascriptAssignmentPattern, javascriptPattern}
                                                                                         tmp[javascriptAwaitExpression] = {javascriptExpression}
                                                                                         tmp[javascriptClass] = {javascriptClassHeritage}
                                                                                         tmp[javascriptClassDeclaration] = {javascriptClassHeritage}
                                                                                         tmp[javascriptClassHeritage] = {javascriptExpression}
                                                                                         tmp[javascriptComputedPropertyName] = {javascriptExpression}
                                                                                         tmp[javascriptDecorator] = {javascriptCallExpression, javascriptIdentifier, javascriptMemberExpression}
                                                                                         tmp[javascriptElseClause] = {javascriptStatement}
                                                                                         tmp[javascriptExportClause] = {javascriptExportSpecifier}
                                                                                         tmp[javascriptExportStatement] = {javascriptExportClause}
                                                                                         tmp[javascriptExpressionStatement] = {javascriptExpression, javascriptSequenceExpression}
                                                                                         tmp[javascriptFormalParameters] = {javascriptAssignmentPattern, javascriptPattern}
                                                                                         tmp[javascriptImportClause] = {javascriptIdentifier, javascriptNamedImports, javascriptNamespaceImport}
                                                                                         tmp[javascriptImportStatement] = {javascriptImportClause}
                                                                                         tmp[javascriptJsxAttribute] = {
                                                                                                                         javascriptJsxElement,
                                                                                                                         javascriptJsxExpression,
                                                                                                                         javascriptJsxFragment,
                                                                                                                         javascriptJsxNamespaceName,
                                                                                                                         javascriptJsxSelfClosingElement,
                                                                                                                         javascriptPropertyIdentifier,
                                                                                                                         javascriptString
                                                                                                                       }
                                                                                         tmp[javascriptJsxElement] = {javascriptJsxElement, javascriptJsxExpression, javascriptJsxFragment, javascriptJsxSelfClosingElement, javascriptJsxText}
                                                                                         tmp[javascriptJsxExpression] = {javascriptExpression, javascriptSequenceExpression, javascriptSpreadElement}
                                                                                         tmp[javascriptJsxFragment] = {javascriptJsxElement, javascriptJsxExpression, javascriptJsxFragment, javascriptJsxSelfClosingElement, javascriptJsxText}
                                                                                         tmp[javascriptJsxNamespaceName] = {javascriptIdentifier}
                                                                                         tmp[javascriptLabeledStatement] = {javascriptStatement}
                                                                                         tmp[javascriptLexicalDeclaration] = {javascriptVariableDeclarator}
                                                                                         tmp[javascriptNamedImports] = {javascriptImportSpecifier}
                                                                                         tmp[javascriptNamespaceImport] = {javascriptIdentifier}
                                                                                         tmp[javascriptNestedIdentifier] = {javascriptIdentifier, javascriptNestedIdentifier}
                                                                                         tmp[javascriptObject] = {javascriptMethodDefinition, javascriptPair, javascriptShorthandPropertyIdentifier, javascriptSpreadElement}
                                                                                         tmp[javascriptObjectPattern] = {javascriptObjectAssignmentPattern, javascriptPairPattern, javascriptRestPattern, javascriptShorthandPropertyIdentifierPattern}
                                                                                         tmp[javascriptParenthesizedExpression] = {javascriptExpression, javascriptSequenceExpression}
                                                                                         tmp[javascriptProgram] = {javascriptHashBangLine, javascriptStatement}
                                                                                         tmp[javascriptRestPattern] = {javascriptArrayPattern, javascriptIdentifier, javascriptObjectPattern}
                                                                                         tmp[javascriptReturnStatement] = {javascriptExpression, javascriptSequenceExpression}
                                                                                         tmp[javascriptSpreadElement] = {javascriptExpression}
                                                                                         tmp[javascriptStatementBlock] = {javascriptStatement}
                                                                                         tmp[javascriptString] = {javascriptEscapeSequence}
                                                                                         tmp[javascriptSwitchBody] = {javascriptSwitchCase, javascriptSwitchDefault}
                                                                                         tmp[javascriptSwitchCase] = {javascriptStatement}
                                                                                         tmp[javascriptSwitchDefault] = {javascriptStatement}
                                                                                         tmp[javascriptTemplateString] = {javascriptEscapeSequence, javascriptTemplateSubstitution}
                                                                                         tmp[javascriptTemplateSubstitution] = {javascriptExpression, javascriptSequenceExpression}
                                                                                         tmp[javascriptThrowStatement] = {javascriptExpression, javascriptSequenceExpression}
                                                                                         tmp[javascriptVariableDeclaration] = {javascriptVariableDeclarator}
                                                                                         tmp[javascriptYieldExpression] = {javascriptExpression}
                                                                                         tmp
const javascriptTokenKinds*: set[JavascriptNodeKind] = {
                                                         javascriptExclamationTok,
                                                         javascriptExclamationEqualTok,
                                                         javascriptExclamationDoubleEqualTok,
                                                         javascriptQuoteTok,
                                                         javascriptDollarLCurlyTok,
                                                         javascriptPercentTok,
                                                         javascriptPercentEqualTok,
                                                         javascriptAmpersandTok,
                                                         javascriptDoubleAmpersandTok,
                                                         javascriptDoubleAmpersandEqualTok,
                                                         javascriptAmpersandEqualTok,
                                                         javascriptApostropheTok,
                                                         javascriptLParTok,
                                                         javascriptRParTok,
                                                         javascriptAsteriskTok,
                                                         javascriptDoubleAsteriskTok,
                                                         javascriptDoubleAsteriskEqualTok,
                                                         javascriptAsteriskEqualTok,
                                                         javascriptPlusTok,
                                                         javascriptDoublePlusTok,
                                                         javascriptPlusEqualTok,
                                                         javascriptCommaTok,
                                                         javascriptMinusTok,
                                                         javascriptDoubleMinusTok,
                                                         javascriptMinusEqualTok,
                                                         javascriptDotTok,
                                                         javascriptTripleDotTok,
                                                         javascriptSlashTok,
                                                         javascriptSlashEqualTok,
                                                         javascriptColonTok,
                                                         javascriptSemicolonTok,
                                                         javascriptLessThanTok,
                                                         javascriptDoubleLessThanTok,
                                                         javascriptDoubleLessThanEqualTok,
                                                         javascriptLessThanEqualTok,
                                                         javascriptEqualTok,
                                                         javascriptDoubleEqualTok,
                                                         javascriptTripleEqualTok,
                                                         javascriptEqualGreaterThanTok,
                                                         javascriptGreaterThanTok,
                                                         javascriptGreaterThanEqualTok,
                                                         javascriptDoubleGreaterThanTok,
                                                         javascriptDoubleGreaterThanEqualTok,
                                                         javascriptTripleGreaterThanTok,
                                                         javascriptTripleGreaterThanEqualTok,
                                                         javascriptQuestionTok,
                                                         javascriptQuestionDotTok,
                                                         javascriptDoubleQuestionTok,
                                                         javascriptDoubleQuestionEqualTok,
                                                         javascriptAtTok,
                                                         javascriptLBrackTok,
                                                         javascriptRBrackTok,
                                                         javascriptAccentTok,
                                                         javascriptAccentEqualTok,
                                                         javascriptBacktickTok,
                                                         javascriptAsTok,
                                                         javascriptAsyncTok,
                                                         javascriptAwaitTok,
                                                         javascriptBreakTok,
                                                         javascriptCaseTok,
                                                         javascriptCatchTok,
                                                         javascriptClassTok,
                                                         javascriptConstTok,
                                                         javascriptContinueTok,
                                                         javascriptDebuggerTok,
                                                         javascriptDefaultTok,
                                                         javascriptDeleteTok,
                                                         javascriptDoTok,
                                                         javascriptElseTok,
                                                         javascriptExportTok,
                                                         javascriptExtendsTok,
                                                         javascriptFinallyTok,
                                                         javascriptForTok,
                                                         javascriptFromTok,
                                                         javascriptFunctionTok,
                                                         javascriptGetTok,
                                                         javascriptIfTok,
                                                         javascriptImportTok,
                                                         javascriptInTok,
                                                         javascriptInstanceofTok,
                                                         javascriptLetTok,
                                                         javascriptNewTok,
                                                         javascriptOfTok,
                                                         javascriptReturnTok,
                                                         javascriptSetTok,
                                                         javascriptStaticTok,
                                                         javascriptSwitchTok,
                                                         javascriptTargetTok,
                                                         javascriptThrowTok,
                                                         javascriptTryTok,
                                                         javascriptTypeofTok,
                                                         javascriptVarTok,
                                                         javascriptVoidTok,
                                                         javascriptWhileTok,
                                                         javascriptWithTok,
                                                         javascriptYieldTok,
                                                         javascriptLCurlyTok,
                                                         javascriptPipeTok,
                                                         javascriptPipeEqualTok,
                                                         javascriptDoublePipeTok,
                                                         javascriptDoublePipeEqualTok,
                                                         javascriptRCurlyTok,
                                                         javascriptTildeTok
                                                       }

proc tsNodeType*(node: TsJavascriptNode): string



proc kind*(node: TsJavascriptNode): JavascriptNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "declaration":                           javascriptDeclaration
      of "expression":                            javascriptExpression
      of "pattern":                               javascriptPattern
      of "primary_expression":                    javascriptPrimaryExpression
      of "statement":                             javascriptStatement
      of "arguments":                             javascriptArguments
      of "array":                                 javascriptArray
      of "array_pattern":                         javascriptArrayPattern
      of "arrow_function":                        javascriptArrowFunction
      of "assignment_expression":                 javascriptAssignmentExpression
      of "assignment_pattern":                    javascriptAssignmentPattern
      of "augmented_assignment_expression":       javascriptAugmentedAssignmentExpression
      of "await_expression":                      javascriptAwaitExpression
      of "binary_expression":                     javascriptBinaryExpression
      of "break_statement":                       javascriptBreakStatement
      of "call_expression":                       javascriptCallExpression
      of "catch_clause":                          javascriptCatchClause
      of "class":                                 javascriptClass
      of "class_body":                            javascriptClassBody
      of "class_declaration":                     javascriptClassDeclaration
      of "class_heritage":                        javascriptClassHeritage
      of "computed_property_name":                javascriptComputedPropertyName
      of "continue_statement":                    javascriptContinueStatement
      of "debugger_statement":                    javascriptDebuggerStatement
      of "decorator":                             javascriptDecorator
      of "do_statement":                          javascriptDoStatement
      of "else_clause":                           javascriptElseClause
      of "empty_statement":                       javascriptEmptyStatement
      of "export_clause":                         javascriptExportClause
      of "export_specifier":                      javascriptExportSpecifier
      of "export_statement":                      javascriptExportStatement
      of "expression_statement":                  javascriptExpressionStatement
      of "finally_clause":                        javascriptFinallyClause
      of "for_in_statement":                      javascriptForInStatement
      of "for_statement":                         javascriptForStatement
      of "formal_parameters":                     javascriptFormalParameters
      of "function":                              javascriptFunction
      of "function_declaration":                  javascriptFunctionDeclaration
      of "generator_function":                    javascriptGeneratorFunction
      of "generator_function_declaration":        javascriptGeneratorFunctionDeclaration
      of "if_statement":                          javascriptIfStatement
      of "import":                                javascriptImport
      of "import_clause":                         javascriptImportClause
      of "import_specifier":                      javascriptImportSpecifier
      of "import_statement":                      javascriptImportStatement
      of "jsx_attribute":                         javascriptJsxAttribute
      of "jsx_closing_element":                   javascriptJsxClosingElement
      of "jsx_element":                           javascriptJsxElement
      of "jsx_expression":                        javascriptJsxExpression
      of "jsx_fragment":                          javascriptJsxFragment
      of "jsx_namespace_name":                    javascriptJsxNamespaceName
      of "jsx_opening_element":                   javascriptJsxOpeningElement
      of "jsx_self_closing_element":              javascriptJsxSelfClosingElement
      of "labeled_statement":                     javascriptLabeledStatement
      of "lexical_declaration":                   javascriptLexicalDeclaration
      of "member_expression":                     javascriptMemberExpression
      of "meta_property":                         javascriptMetaProperty
      of "method_definition":                     javascriptMethodDefinition
      of "named_imports":                         javascriptNamedImports
      of "namespace_import":                      javascriptNamespaceImport
      of "nested_identifier":                     javascriptNestedIdentifier
      of "new_expression":                        javascriptNewExpression
      of "object":                                javascriptObject
      of "object_assignment_pattern":             javascriptObjectAssignmentPattern
      of "object_pattern":                        javascriptObjectPattern
      of "pair":                                  javascriptPair
      of "pair_pattern":                          javascriptPairPattern
      of "parenthesized_expression":              javascriptParenthesizedExpression
      of "program":                               javascriptProgram
      of "public_field_definition":               javascriptPublicFieldDefinition
      of "regex":                                 javascriptRegex
      of "rest_pattern":                          javascriptRestPattern
      of "return_statement":                      javascriptReturnStatement
      of "sequence_expression":                   javascriptSequenceExpression
      of "spread_element":                        javascriptSpreadElement
      of "statement_block":                       javascriptStatementBlock
      of "string":                                javascriptString
      of "subscript_expression":                  javascriptSubscriptExpression
      of "switch_body":                           javascriptSwitchBody
      of "switch_case":                           javascriptSwitchCase
      of "switch_default":                        javascriptSwitchDefault
      of "switch_statement":                      javascriptSwitchStatement
      of "template_string":                       javascriptTemplateString
      of "template_substitution":                 javascriptTemplateSubstitution
      of "ternary_expression":                    javascriptTernaryExpression
      of "throw_statement":                       javascriptThrowStatement
      of "try_statement":                         javascriptTryStatement
      of "unary_expression":                      javascriptUnaryExpression
      of "update_expression":                     javascriptUpdateExpression
      of "variable_declaration":                  javascriptVariableDeclaration
      of "variable_declarator":                   javascriptVariableDeclarator
      of "while_statement":                       javascriptWhileStatement
      of "with_statement":                        javascriptWithStatement
      of "yield_expression":                      javascriptYieldExpression
      of "!":                                     javascriptExclamationTok
      of "!=":                                    javascriptExclamationEqualTok
      of "!==":                                   javascriptExclamationDoubleEqualTok
      of "\"":                                    javascriptQuoteTok
      of "${":                                    javascriptDollarLCurlyTok
      of "%":                                     javascriptPercentTok
      of "%=":                                    javascriptPercentEqualTok
      of "&":                                     javascriptAmpersandTok
      of "&&":                                    javascriptDoubleAmpersandTok
      of "&&=":                                   javascriptDoubleAmpersandEqualTok
      of "&=":                                    javascriptAmpersandEqualTok
      of "\'":                                    javascriptApostropheTok
      of "(":                                     javascriptLParTok
      of ")":                                     javascriptRParTok
      of "*":                                     javascriptAsteriskTok
      of "**":                                    javascriptDoubleAsteriskTok
      of "**=":                                   javascriptDoubleAsteriskEqualTok
      of "*=":                                    javascriptAsteriskEqualTok
      of "+":                                     javascriptPlusTok
      of "++":                                    javascriptDoublePlusTok
      of "+=":                                    javascriptPlusEqualTok
      of ",":                                     javascriptCommaTok
      of "-":                                     javascriptMinusTok
      of "--":                                    javascriptDoubleMinusTok
      of "-=":                                    javascriptMinusEqualTok
      of ".":                                     javascriptDotTok
      of "...":                                   javascriptTripleDotTok
      of "/":                                     javascriptSlashTok
      of "/=":                                    javascriptSlashEqualTok
      of ":":                                     javascriptColonTok
      of ";":                                     javascriptSemicolonTok
      of "<":                                     javascriptLessThanTok
      of "<<":                                    javascriptDoubleLessThanTok
      of "<<=":                                   javascriptDoubleLessThanEqualTok
      of "<=":                                    javascriptLessThanEqualTok
      of "=":                                     javascriptEqualTok
      of "==":                                    javascriptDoubleEqualTok
      of "===":                                   javascriptTripleEqualTok
      of "=>":                                    javascriptEqualGreaterThanTok
      of ">":                                     javascriptGreaterThanTok
      of ">=":                                    javascriptGreaterThanEqualTok
      of ">>":                                    javascriptDoubleGreaterThanTok
      of ">>=":                                   javascriptDoubleGreaterThanEqualTok
      of ">>>":                                   javascriptTripleGreaterThanTok
      of ">>>=":                                  javascriptTripleGreaterThanEqualTok
      of "?":                                     javascriptQuestionTok
      of "?.":                                    javascriptQuestionDotTok
      of "??":                                    javascriptDoubleQuestionTok
      of "??=":                                   javascriptDoubleQuestionEqualTok
      of "@":                                     javascriptAtTok
      of "[":                                     javascriptLBrackTok
      of "]":                                     javascriptRBrackTok
      of "^":                                     javascriptAccentTok
      of "^=":                                    javascriptAccentEqualTok
      of "`":                                     javascriptBacktickTok
      of "as":                                    javascriptAsTok
      of "async":                                 javascriptAsyncTok
      of "await":                                 javascriptAwaitTok
      of "break":                                 javascriptBreakTok
      of "case":                                  javascriptCaseTok
      of "catch":                                 javascriptCatchTok
      of "comment":                               javascriptComment
      of "const":                                 javascriptConstTok
      of "continue":                              javascriptContinueTok
      of "debugger":                              javascriptDebuggerTok
      of "default":                               javascriptDefaultTok
      of "delete":                                javascriptDeleteTok
      of "do":                                    javascriptDoTok
      of "else":                                  javascriptElseTok
      of "escape_sequence":                       javascriptEscapeSequence
      of "export":                                javascriptExportTok
      of "extends":                               javascriptExtendsTok
      of "false":                                 javascriptFalse
      of "finally":                               javascriptFinallyTok
      of "for":                                   javascriptForTok
      of "from":                                  javascriptFromTok
      of "get":                                   javascriptGetTok
      of "hash_bang_line":                        javascriptHashBangLine
      of "identifier":                            javascriptIdentifier
      of "if":                                    javascriptIfTok
      of "in":                                    javascriptInTok
      of "instanceof":                            javascriptInstanceofTok
      of "jsx_text":                              javascriptJsxText
      of "let":                                   javascriptLetTok
      of "new":                                   javascriptNewTok
      of "null":                                  javascriptNull
      of "number":                                javascriptNumber
      of "of":                                    javascriptOfTok
      of "property_identifier":                   javascriptPropertyIdentifier
      of "regex_flags":                           javascriptRegexFlags
      of "regex_pattern":                         javascriptRegexPattern
      of "return":                                javascriptReturnTok
      of "set":                                   javascriptSetTok
      of "shorthand_property_identifier":         javascriptShorthandPropertyIdentifier
      of "shorthand_property_identifier_pattern": javascriptShorthandPropertyIdentifierPattern
      of "statement_identifier":                  javascriptStatementIdentifier
      of "static":                                javascriptStaticTok
      of "super":                                 javascriptSuper
      of "switch":                                javascriptSwitchTok
      of "target":                                javascriptTargetTok
      of "this":                                  javascriptThis
      of "throw":                                 javascriptThrowTok
      of "true":                                  javascriptTrue
      of "try":                                   javascriptTryTok
      of "typeof":                                javascriptTypeofTok
      of "undefined":                             javascriptUndefined
      of "var":                                   javascriptVarTok
      of "void":                                  javascriptVoidTok
      of "while":                                 javascriptWhileTok
      of "with":                                  javascriptWithTok
      of "yield":                                 javascriptYieldTok
      of "{":                                     javascriptLCurlyTok
      of "|":                                     javascriptPipeTok
      of "|=":                                    javascriptPipeEqualTok
      of "||":                                    javascriptDoublePipeTok
      of "||=":                                   javascriptDoublePipeEqualTok
      of "}":                                     javascriptRCurlyTok
      of "~":                                     javascriptTildeTok
      of "ERROR":                                 javascriptSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsJavascriptNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsJavascriptNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsJavascriptNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_javascript(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsJavascriptNode): string =
  $ts_node_type(TSNode(node))

proc newTsJavascriptParser*(): JavascriptParser =
  result = JavascriptParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_javascript())

proc parseString*(parser: JavascriptParser, str: string): TsJavascriptNode =
  TsJavascriptNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsJavascriptString*(str: string): TsJavascriptNode =
  let parser = newTsJavascriptParser()
  return parseString(parser, str)

func `$`*(node: TsJavascriptNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsJavascriptNode,
    idx:  int,
    kind: JavascriptNodeKind | set[JavascriptNodeKind]
  ): TsJavascriptNode =
  assert 0 <= idx and idx < node.len
  result = TsJavascriptNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  JavascriptNode* = HtsNode[TsJavascriptNode, JavascriptNodeKind]


proc treeReprTsJavascript*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsJavascriptNode, JavascriptNodeKind](parseTsJavascriptString(str), str, 10, unnamed = unnamed)

proc toHtsNode*(
    node: TsJavascriptNode,
    str:  ptr string
  ): HtsNode[TsJavascriptNode, JavascriptNodeKind] =
  toHtsNode[TsJavascriptNode, JavascriptNodeKind](node, str)

proc toHtsTree*(node: TsJavascriptNode, str: ptr string): JavascriptNode =
  toHtsNode[TsJavascriptNode, JavascriptNodeKind](node, str)

proc parseJavascriptString*(
    str:     ptr string,
    unnamed: bool = false
  ): JavascriptNode =
  let parser = newTsJavascriptParser()
  return toHtsTree[TsJavascriptNode, JavascriptNodeKind](parseString(parser, str[]), str)

proc parseJavascriptString*(
    str:     string,
    unnamed: bool = false
  ): JavascriptNode =
  let parser = newTsJavascriptParser()
  return toHtsTree[TsJavascriptNode, JavascriptNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


