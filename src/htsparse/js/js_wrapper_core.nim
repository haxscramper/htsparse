import
  hmisc / wrappers/treesitter_core
export treesitter_core
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
    jsHidFromClause                      ## _from_clause
    jsHidLhsExpression                   ## _lhs_expression
    jsHidExpressions                     ## _expressions
    jsHidJsxElement                      ## _jsx_element
    jsHidPropertyName                    ## _property_name
    jsHidJsxChild                        ## _jsx_child
    jsHidJsxElementName                  ## _jsx_element_name
    jsHidReservedIdentifier              ## _reserved_identifier
    jsHidJsxIdentifier                   ## _jsx_identifier
    jsHidSemicolon                       ## _semicolon
    jsHidCallSignature                   ## _call_signature
    jsHidDestructuringPattern            ## _destructuring_pattern
    jsHidJsxAttribute                    ## _jsx_attribute
    jsHidImportExportSpecifier           ## _import_export_specifier
    jsHidTemplateChars                   ## _template_chars
    jsDecoratorCallExpression            ## decorator_call_expression
    jsDecoratorMemberExpression          ## decorator_member_expression
    jsHidJsxAttributeValue               ## _jsx_attribute_value
    jsHidForHeader                       ## _for_header
    jsJsxIdentifier                      ## jsx_identifier
    jsHidAutomaticSemicolon              ## _automatic_semicolon
    jsHidInitializer                     ## _initializer
    jsHidFormalParameter                 ## _formal_parameter
    jsHidJsxAttributeName                ## _jsx_attribute_name
    jsHidAugmentedAssignmentLhs          ## _augmented_assignment_lhs
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
    of jsHidFromClause:                      "_from_clause"
    of jsHidLhsExpression:                   "_lhs_expression"
    of jsHidExpressions:                     "_expressions"
    of jsHidJsxElement:                      "_jsx_element"
    of jsHidPropertyName:                    "_property_name"
    of jsHidJsxChild:                        "_jsx_child"
    of jsHidJsxElementName:                  "_jsx_element_name"
    of jsHidReservedIdentifier:              "_reserved_identifier"
    of jsHidJsxIdentifier:                   "_jsx_identifier"
    of jsHidSemicolon:                       "_semicolon"
    of jsHidCallSignature:                   "_call_signature"
    of jsHidDestructuringPattern:            "_destructuring_pattern"
    of jsHidJsxAttribute:                    "_jsx_attribute"
    of jsHidImportExportSpecifier:           "_import_export_specifier"
    of jsHidTemplateChars:                   "_template_chars"
    of jsDecoratorCallExpression:            "decorator_call_expression"
    of jsDecoratorMemberExpression:          "decorator_member_expression"
    of jsHidJsxAttributeValue:               "_jsx_attribute_value"
    of jsHidForHeader:                       "_for_header"
    of jsJsxIdentifier:                      "jsx_identifier"
    of jsHidAutomaticSemicolon:              "_automatic_semicolon"
    of jsHidInitializer:                     "_initializer"
    of jsHidFormalParameter:                 "_formal_parameter"
    of jsHidJsxAttributeName:                "_jsx_attribute_name"
    of jsHidAugmentedAssignmentLhs:          "_augmented_assignment_lhs"
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
const jsHiddenKinds*: set[JsNodeKind] = {
                                          jsHidFromClause,
                                          jsHidLhsExpression,
                                          jsHidExpressions,
                                          jsHidJsxElement,
                                          jsHidPropertyName,
                                          jsHidJsxChild,
                                          jsHidJsxElementName,
                                          jsHidReservedIdentifier,
                                          jsHidJsxIdentifier,
                                          jsHidSemicolon,
                                          jsHidCallSignature,
                                          jsHidDestructuringPattern,
                                          jsHidJsxAttribute,
                                          jsHidImportExportSpecifier,
                                          jsHidTemplateChars,
                                          jsDecoratorCallExpression,
                                          jsDecoratorMemberExpression,
                                          jsHidJsxAttributeValue,
                                          jsHidForHeader,
                                          jsJsxIdentifier,
                                          jsHidAutomaticSemicolon,
                                          jsHidInitializer,
                                          jsHidFormalParameter,
                                          jsHidJsxAttributeName,
                                          jsHidAugmentedAssignmentLhs
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


proc treeRepr*(node: TsJsNode, str: string): string =
  var res = addr result
  proc aux(node: TsJsNode, level: int) =
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
  htsparse/describe_grammar
let jsGrammar = block:
                  var rules: array[JsNodeKind, HtsRule[JsNodeKind]]
                  type
                    K = JsNodeKind


                  rules[jsHidFromClause] = tsSeq[K](tsString[K]("from"), tsSymbol[K](jsString))
                  rules[jsYieldExpression] = tsSeq[K](tsString[K]("yield"), tsChoice[K](tsSeq[K](tsString[K]("*"), tsSymbol[K](jsExpression)), tsChoice[K](tsSymbol[K](jsExpression), tsBlank[K]())))
                  rules[jsGeneratorFunction] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("function"), tsString[K]("*"), tsChoice[K](tsSymbol[K](jsIdentifier), tsBlank[K]()), tsSymbol[K](jsHidCallSignature), tsSymbol[K](jsStatementBlock))
                  rules[jsMemberExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsPrimaryExpression)), tsChoice[K](tsString[K]("."), tsString[K]("?.")), tsSymbol[K](jsIdentifier))
                  rules[jsHidLhsExpression] = tsChoice[K](tsSymbol[K](jsMemberExpression), tsSymbol[K](jsSubscriptExpression), tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsHidDestructuringPattern))
                  rules[jsPrimaryExpression] = tsChoice[K](tsSymbol[K](jsSubscriptExpression), tsSymbol[K](jsMemberExpression), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsThis), tsSymbol[K](jsSuper), tsSymbol[K](jsNumber), tsSymbol[K](jsString), tsSymbol[K](jsTemplateString), tsSymbol[K](jsRegex), tsSymbol[K](jsTrue), tsSymbol[K](jsFalse), tsSymbol[K](jsNull), tsSymbol[K](jsUndefined), tsSymbol[K](jsImport), tsSymbol[K](jsObject), tsSymbol[K](jsArray), tsSymbol[K](jsFunction), tsSymbol[K](jsArrowFunction), tsSymbol[K](jsGeneratorFunction), tsSymbol[K](jsClass), tsSymbol[K](jsMetaProperty), tsSymbol[K](jsCallExpression))
                  rules[jsWithStatement] = tsSeq[K](tsString[K]("with"), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsStatement))
                  rules[jsReturnStatement] = tsSeq[K](tsString[K]("return"), tsChoice[K](tsSymbol[K](jsHidExpressions), tsBlank[K]()), tsSymbol[K](jsHidSemicolon))
                  rules[jsFalse] = tsString[K]("false")
                  rules[jsJsxSelfClosingElement] = tsSeq[K](tsString[K]("<"), tsSymbol[K](jsHidJsxElementName), tsRepeat[K](tsSymbol[K](jsHidJsxAttribute)), tsString[K]("/"), tsString[K](">"))
                  rules[jsExportClause] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](jsHidImportExportSpecifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](jsHidImportExportSpecifier)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                  rules[jsForStatement] = tsSeq[K](tsString[K]("for"), tsString[K]("("), tsChoice[K](tsSymbol[K](jsLexicalDeclaration), tsSymbol[K](jsVariableDeclaration), tsSymbol[K](jsExpressionStatement), tsSymbol[K](jsEmptyStatement)), tsChoice[K](tsSymbol[K](jsExpressionStatement), tsSymbol[K](jsEmptyStatement)), tsChoice[K](tsSymbol[K](jsHidExpressions), tsBlank[K]()), tsString[K](")"), tsSymbol[K](jsStatement))
                  rules[jsImport] = tsString[K]("import")
                  rules[jsArrowFunction] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsChoice[K](tsChoice[K](tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsIdentifier)), tsSymbol[K](jsHidCallSignature)), tsString[K]("=>"), tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsStatementBlock)))
                  rules[jsSwitchStatement] = tsSeq[K](tsString[K]("switch"), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsSwitchBody))
                  rules[jsNewExpression] = tsSeq[K](tsString[K]("new"), tsSymbol[K](jsPrimaryExpression), tsChoice[K](tsSymbol[K](jsArguments), tsBlank[K]()))
                  rules[jsHidJsxElement] = tsChoice[K](tsSymbol[K](jsJsxElement), tsSymbol[K](jsJsxSelfClosingElement))
                  rules[jsDebuggerStatement] = tsSeq[K](tsString[K]("debugger"), tsSymbol[K](jsHidSemicolon))
                  rules[jsClassHeritage] = tsSeq[K](tsString[K]("extends"), tsSymbol[K](jsExpression))
                  rules[jsClassDeclaration] = tsSeq[K](tsRepeat[K](tsSymbol[K](jsDecorator)), tsString[K]("class"), tsSymbol[K](jsIdentifier), tsChoice[K](tsSymbol[K](jsClassHeritage), tsBlank[K]()), tsSymbol[K](jsClassBody), tsChoice[K](tsSymbol[K](jsHidAutomaticSemicolon), tsBlank[K]()))
                  rules[jsRestPattern] = tsSeq[K](tsString[K]("..."), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidDestructuringPattern)))
                  rules[jsExportStatement] = tsChoice[K](tsSeq[K](tsString[K]("export"), tsChoice[K](tsSeq[K](tsString[K]("*"), tsSymbol[K](jsHidFromClause), tsSymbol[K](jsHidSemicolon)), tsSeq[K](tsSymbol[K](jsExportClause), tsSymbol[K](jsHidFromClause), tsSymbol[K](jsHidSemicolon)), tsSeq[K](tsSymbol[K](jsExportClause), tsSymbol[K](jsHidSemicolon)))), tsSeq[K](tsRepeat[K](tsSymbol[K](jsDecorator)), tsString[K]("export"), tsChoice[K](tsSymbol[K](jsDeclaration), tsSeq[K](tsString[K]("default"), tsSymbol[K](jsExpression), tsSymbol[K](jsHidSemicolon)))))
                  rules[jsThrowStatement] = tsSeq[K](tsString[K]("throw"), tsSymbol[K](jsHidExpressions), tsSymbol[K](jsHidSemicolon))
                  rules[jsAwaitExpression] = tsSeq[K](tsString[K]("await"), tsSymbol[K](jsExpression))
                  rules[jsObjectPattern] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsPairPattern), tsSymbol[K](jsRestPattern), tsSymbol[K](jsObjectAssignmentPattern), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier))), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsSymbol[K](jsPairPattern), tsSymbol[K](jsRestPattern), tsSymbol[K](jsObjectAssignmentPattern), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier))), tsBlank[K]())))), tsBlank[K]()), tsString[K]("}"))
                  rules[jsPattern] = tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsHidDestructuringPattern), tsSymbol[K](jsRestPattern))
                  rules[jsObjectAssignmentPattern] = tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsIdentifier)), tsSymbol[K](jsHidDestructuringPattern)), tsString[K]("="), tsSymbol[K](jsExpression))
                  rules[jsNamedImports] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsSymbol[K](jsHidImportExportSpecifier), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](jsHidImportExportSpecifier)))), tsBlank[K]()), tsChoice[K](tsString[K](","), tsBlank[K]()), tsString[K]("}"))
                  rules[jsVariableDeclarator] = tsSeq[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidDestructuringPattern)), tsChoice[K](tsSymbol[K](jsHidInitializer), tsBlank[K]()))
                  rules[jsObject] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsPair), tsSymbol[K](jsSpreadElement), tsSymbol[K](jsMethodDefinition), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier))), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsSymbol[K](jsPair), tsSymbol[K](jsSpreadElement), tsSymbol[K](jsMethodDefinition), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier))), tsBlank[K]())))), tsBlank[K]()), tsString[K]("}"))
                  rules[jsHidJsxElementName] = tsChoice[K](tsSymbol[K](jsHidJsxIdentifier), tsSymbol[K](jsNestedIdentifier), tsSymbol[K](jsJsxNamespaceName))
                  rules[jsPair] = tsSeq[K](tsSymbol[K](jsHidPropertyName), tsString[K](":"), tsSymbol[K](jsExpression))
                  rules[jsUnaryExpression] = tsChoice[K](tsSeq[K](tsString[K]("!"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("~"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("-"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("+"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("typeof"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("void"), tsSymbol[K](jsExpression)), tsSeq[K](tsString[K]("delete"), tsSymbol[K](jsExpression)))
                  rules[jsComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                  rules[jsImportStatement] = tsSeq[K](tsString[K]("import"), tsChoice[K](tsSeq[K](tsSymbol[K](jsImportClause), tsSymbol[K](jsHidFromClause)), tsSymbol[K](jsString)), tsSymbol[K](jsHidSemicolon))
                  rules[jsExpression] = tsChoice[K](tsSymbol[K](jsPrimaryExpression), tsSymbol[K](jsHidJsxElement), tsSymbol[K](jsJsxFragment), tsSymbol[K](jsAssignmentExpression), tsSymbol[K](jsAugmentedAssignmentExpression), tsSymbol[K](jsAwaitExpression), tsSymbol[K](jsUnaryExpression), tsSymbol[K](jsBinaryExpression), tsSymbol[K](jsTernaryExpression), tsSymbol[K](jsUpdateExpression), tsSymbol[K](jsNewExpression), tsSymbol[K](jsYieldExpression))
                  rules[jsElseClause] = tsSeq[K](tsString[K]("else"), tsSymbol[K](jsStatement))
                  rules[jsJsxClosingElement] = tsSeq[K](tsString[K]("<"), tsString[K]("/"), tsSymbol[K](jsHidJsxElementName), tsString[K](">"))
                  rules[jsHidJsxAttribute] = tsChoice[K](tsSymbol[K](jsJsxAttribute), tsSymbol[K](jsJsxExpression))
                  rules[jsHidDestructuringPattern] = tsChoice[K](tsSymbol[K](jsObjectPattern), tsSymbol[K](jsArrayPattern))
                  rules[jsThis] = tsString[K]("this")
                  rules[jsIdentifier] = tsSeq[K](tsRegex[K]("[^\\x00-\\x1F\\s0-9:;`\"\'@#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}\\uFEFF\\u2060\\u200B\\u00A0]|\\\\u[0-9a-fA-F]{4}|\\\\u\\{[0-9a-fA-F]+\\}"), tsRepeat[K](tsRegex[K]("[^\\x00-\\x1F\\s:;`\"\'@#.,|^&<=>+\\-*/\\\\%?!~()\\[\\]{}\\uFEFF\\u2060\\u200B\\u00A0]|\\\\u[0-9a-fA-F]{4}|\\\\u\\{[0-9a-fA-F]+\\}")))
                  rules[jsArguments] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSpreadElement)), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSpreadElement)), tsBlank[K]())))), tsBlank[K]()), tsString[K](")"))
                  rules[jsPublicFieldDefinition] = tsSeq[K](tsChoice[K](tsString[K]("static"), tsBlank[K]()), tsSymbol[K](jsHidPropertyName), tsChoice[K](tsSymbol[K](jsHidInitializer), tsBlank[K]()))
                  rules[jsNamespaceImport] = tsSeq[K](tsString[K]("*"), tsString[K]("as"), tsSymbol[K](jsIdentifier))
                  rules[jsDecoratorCallExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsDecoratorMemberExpression)), tsSymbol[K](jsArguments))
                  rules[jsHashBangLine] = tsRegex[K]("#!.*")
                  rules[jsAssignmentPattern] = tsSeq[K](tsSymbol[K](jsPattern), tsString[K]("="), tsSymbol[K](jsExpression))
                  rules[jsSubscriptExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsPrimaryExpression)), tsChoice[K](tsString[K]("?."), tsBlank[K]()), tsString[K]("["), tsSymbol[K](jsHidExpressions), tsString[K]("]"))
                  rules[jsTernaryExpression] = tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("?"), tsSymbol[K](jsExpression), tsString[K](":"), tsSymbol[K](jsExpression))
                  rules[jsClassBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSeq[K](tsSymbol[K](jsMethodDefinition), tsChoice[K](tsString[K](";"), tsBlank[K]())), tsSeq[K](tsSymbol[K](jsPublicFieldDefinition), tsSymbol[K](jsHidSemicolon)))), tsString[K]("}"))
                  rules[jsDecoratorMemberExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsDecoratorMemberExpression)), tsString[K]("."), tsSymbol[K](jsIdentifier))
                  rules[jsJsxExpression] = tsSeq[K](tsString[K]("{"), tsChoice[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSequenceExpression), tsSymbol[K](jsSpreadElement)), tsBlank[K]()), tsString[K]("}"))
                  rules[jsHidJsxAttributeValue] = tsChoice[K](tsSymbol[K](jsString), tsSymbol[K](jsJsxExpression), tsSymbol[K](jsHidJsxElement), tsSymbol[K](jsJsxFragment))
                  rules[jsTrue] = tsString[K]("true")
                  rules[jsFinallyClause] = tsSeq[K](tsString[K]("finally"), tsSymbol[K](jsStatementBlock))
                  rules[jsJsxFragment] = tsSeq[K](tsString[K]("<"), tsString[K](">"), tsRepeat[K](tsSymbol[K](jsHidJsxChild)), tsString[K]("<"), tsString[K]("/"), tsString[K](">"))
                  rules[jsHidForHeader] = tsSeq[K](tsString[K]("("), tsChoice[K](tsChoice[K](tsSymbol[K](jsHidLhsExpression), tsSymbol[K](jsParenthesizedExpression)), tsSeq[K](tsChoice[K](tsString[K]("var"), tsString[K]("let"), tsString[K]("const")), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidDestructuringPattern)))), tsChoice[K](tsString[K]("in"), tsString[K]("of")), tsSymbol[K](jsHidExpressions), tsString[K](")"))
                  rules[jsLabeledStatement] = tsSeq[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier)), tsString[K](":"), tsSymbol[K](jsStatement))
                  rules[jsFunction] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("function"), tsChoice[K](tsSymbol[K](jsIdentifier), tsBlank[K]()), tsSymbol[K](jsHidCallSignature), tsSymbol[K](jsStatementBlock))
                  rules[jsHidInitializer] = tsSeq[K](tsString[K]("="), tsSymbol[K](jsExpression))
                  rules[jsHidFormalParameter] = tsChoice[K](tsSymbol[K](jsPattern), tsSymbol[K](jsAssignmentPattern))
                  rules[jsParenthesizedExpression] = tsSeq[K](tsString[K]("("), tsSymbol[K](jsHidExpressions), tsString[K](")"))
                  rules[jsHidAugmentedAssignmentLhs] = tsChoice[K](tsSymbol[K](jsMemberExpression), tsSymbol[K](jsSubscriptExpression), tsSymbol[K](jsHidReservedIdentifier), tsSymbol[K](jsIdentifier), tsSymbol[K](jsParenthesizedExpression))
                  rules[jsSwitchCase] = tsSeq[K](tsString[K]("case"), tsSymbol[K](jsHidExpressions), tsString[K](":"), tsRepeat[K](tsSymbol[K](jsStatement)))
                  rules[jsRegex] = tsSeq[K](tsString[K]("/"), tsSymbol[K](jsRegexPattern), tsString[K]("/"), tsChoice[K](tsSymbol[K](jsRegexFlags), tsBlank[K]()))
                  rules[jsMetaProperty] = tsSeq[K](tsString[K]("new"), tsString[K]("."), tsString[K]("target"))
                  rules[jsFunctionDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("function"), tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidCallSignature), tsSymbol[K](jsStatementBlock), tsChoice[K](tsSymbol[K](jsHidAutomaticSemicolon), tsBlank[K]()))
                  rules[jsWhileStatement] = tsSeq[K](tsString[K]("while"), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsStatement))
                  rules[jsPairPattern] = tsSeq[K](tsSymbol[K](jsHidPropertyName), tsString[K](":"), tsSymbol[K](jsPattern))
                  rules[jsLexicalDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("let"), tsString[K]("const")), tsSeq[K](tsSymbol[K](jsVariableDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](jsVariableDeclarator)))), tsSymbol[K](jsHidSemicolon))
                  rules[jsTemplateString] = tsSeq[K](tsString[K]("`"), tsRepeat[K](tsChoice[K](tsSymbol[K](jsHidTemplateChars), tsSymbol[K](jsEscapeSequence), tsSymbol[K](jsTemplateSubstitution))), tsString[K]("`"))
                  rules[jsForInStatement] = tsSeq[K](tsString[K]("for"), tsChoice[K](tsString[K]("await"), tsBlank[K]()), tsSymbol[K](jsHidForHeader), tsSymbol[K](jsStatement))
                  rules[jsGeneratorFunctionDeclaration] = tsSeq[K](tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsString[K]("function"), tsString[K]("*"), tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidCallSignature), tsSymbol[K](jsStatementBlock), tsChoice[K](tsSymbol[K](jsHidAutomaticSemicolon), tsBlank[K]()))
                  rules[jsHidExpressions] = tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSequenceExpression))
                  rules[jsRegexPattern] = tsRepeat1[K](tsChoice[K](tsSeq[K](tsString[K]("["), tsRepeat[K](tsChoice[K](tsSeq[K](tsString[K]("\\"), tsRegex[K](".")), tsRegex[K]("[^\\]\\n\\\\]"))), tsString[K]("]")), tsSeq[K](tsString[K]("\\"), tsRegex[K](".")), tsRegex[K]("[^/\\\\\\[\\n]")))
                  rules[jsNull] = tsString[K]("null")
                  rules[jsSwitchDefault] = tsSeq[K](tsString[K]("default"), tsString[K](":"), tsRepeat[K](tsSymbol[K](jsStatement)))
                  rules[jsCallExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](jsExpression), tsChoice[K](tsSymbol[K](jsArguments), tsSymbol[K](jsTemplateString))), tsSeq[K](tsSymbol[K](jsPrimaryExpression), tsString[K]("?."), tsSymbol[K](jsArguments)))
                  rules[jsRegexFlags] = tsRegex[K]("[a-z]+")
                  rules[jsArrayPattern] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsPattern), tsSymbol[K](jsAssignmentPattern)), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsSymbol[K](jsPattern), tsSymbol[K](jsAssignmentPattern)), tsBlank[K]())))), tsBlank[K]()), tsString[K]("]"))
                  rules[jsClass] = tsSeq[K](tsRepeat[K](tsSymbol[K](jsDecorator)), tsString[K]("class"), tsChoice[K](tsSymbol[K](jsIdentifier), tsBlank[K]()), tsChoice[K](tsSymbol[K](jsClassHeritage), tsBlank[K]()), tsSymbol[K](jsClassBody))
                  rules[jsTryStatement] = tsSeq[K](tsString[K]("try"), tsSymbol[K](jsStatementBlock), tsChoice[K](tsSymbol[K](jsCatchClause), tsBlank[K]()), tsChoice[K](tsSymbol[K](jsFinallyClause), tsBlank[K]()))
                  rules[jsNestedIdentifier] = tsSeq[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsNestedIdentifier)), tsString[K]("."), tsSymbol[K](jsIdentifier))
                  rules[jsBinaryExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("&&"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("||"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K](">>"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K](">>>"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("<<"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("&"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("^"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("|"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("+"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("-"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("*"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("/"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("%"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("**"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("<"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("<="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("=="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("==="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("!="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("!=="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K](">="), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K](">"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("??"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("instanceof"), tsSymbol[K](jsExpression)), tsSeq[K](tsSymbol[K](jsExpression), tsString[K]("in"), tsSymbol[K](jsExpression)))
                  rules[jsUndefined] = tsString[K]("undefined")
                  rules[jsString] = tsChoice[K](tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"\\\\]+"), tsSymbol[K](jsEscapeSequence))), tsString[K]("\"")), tsSeq[K](tsString[K]("\'"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\'\\\\]+"), tsSymbol[K](jsEscapeSequence))), tsString[K]("\'")))
                  rules[jsDeclaration] = tsChoice[K](tsSymbol[K](jsFunctionDeclaration), tsSymbol[K](jsGeneratorFunctionDeclaration), tsSymbol[K](jsClassDeclaration), tsSymbol[K](jsLexicalDeclaration), tsSymbol[K](jsVariableDeclaration))
                  rules[jsJsxText] = tsRegex[K]("[^{}<>]+")
                  rules[jsHidPropertyName] = tsChoice[K](tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidReservedIdentifier)), tsSymbol[K](jsString), tsSymbol[K](jsNumber), tsSymbol[K](jsComputedPropertyName))
                  rules[jsBreakStatement] = tsSeq[K](tsString[K]("break"), tsChoice[K](tsSymbol[K](jsIdentifier), tsBlank[K]()), tsSymbol[K](jsHidSemicolon))
                  rules[jsHidJsxChild] = tsChoice[K](tsSymbol[K](jsJsxText), tsSymbol[K](jsHidJsxElement), tsSymbol[K](jsJsxFragment), tsSymbol[K](jsJsxExpression))
                  rules[jsSpreadElement] = tsSeq[K](tsString[K]("..."), tsSymbol[K](jsExpression))
                  rules[jsMethodDefinition] = tsSeq[K](tsRepeat[K](tsSymbol[K](jsDecorator)), tsChoice[K](tsString[K]("static"), tsBlank[K]()), tsChoice[K](tsString[K]("async"), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("get"), tsString[K]("set"), tsString[K]("*")), tsBlank[K]()), tsSymbol[K](jsHidPropertyName), tsSymbol[K](jsFormalParameters), tsSymbol[K](jsStatementBlock))
                  rules[jsEscapeSequence] = tsSeq[K](tsString[K]("\\"), tsChoice[K](tsRegex[K]("[^xu0-7]"), tsRegex[K]("[0-7]{1,3}"), tsRegex[K]("x[0-9a-fA-F]{2}"), tsRegex[K]("u[0-9a-fA-F]{4}"), tsRegex[K]("u{[0-9a-fA-F]+}")))
                  rules[jsHidReservedIdentifier] = tsChoice[K](tsString[K]("get"), tsString[K]("set"), tsString[K]("async"), tsString[K]("static"), tsString[K]("export"))
                  rules[jsIfStatement] = tsSeq[K](tsString[K]("if"), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsStatement), tsChoice[K](tsSymbol[K](jsElseClause), tsBlank[K]()))
                  rules[jsContinueStatement] = tsSeq[K](tsString[K]("continue"), tsChoice[K](tsSymbol[K](jsIdentifier), tsBlank[K]()), tsSymbol[K](jsHidSemicolon))
                  rules[jsHidJsxIdentifier] = tsChoice[K](tsSymbol[K](jsJsxIdentifier), tsSymbol[K](jsIdentifier))
                  rules[jsAugmentedAssignmentExpression] = tsSeq[K](tsSymbol[K](jsHidAugmentedAssignmentLhs), tsChoice[K](tsString[K]("+="), tsString[K]("-="), tsString[K]("*="), tsString[K]("/="), tsString[K]("%="), tsString[K]("^="), tsString[K]("&="), tsString[K]("|="), tsString[K](">>="), tsString[K](">>>="), tsString[K]("<<="), tsString[K]("**="), tsString[K]("&&="), tsString[K]("||="), tsString[K]("??=")), tsSymbol[K](jsExpression))
                  rules[jsHidSemicolon] = tsChoice[K](tsSymbol[K](jsHidAutomaticSemicolon), tsString[K](";"))
                  rules[jsSwitchBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsChoice[K](tsSymbol[K](jsSwitchCase), tsSymbol[K](jsSwitchDefault))), tsString[K]("}"))
                  rules[jsHidCallSignature] = tsSymbol[K](jsFormalParameters)
                  rules[jsUpdateExpression] = tsChoice[K](tsSeq[K](tsSymbol[K](jsExpression), tsChoice[K](tsString[K]("++"), tsString[K]("--"))), tsSeq[K](tsChoice[K](tsString[K]("++"), tsString[K]("--")), tsSymbol[K](jsExpression)))
                  rules[jsHidImportExportSpecifier] = tsSeq[K](tsSymbol[K](jsIdentifier), tsChoice[K](tsSeq[K](tsString[K]("as"), tsSymbol[K](jsIdentifier)), tsBlank[K]()))
                  rules[jsCatchClause] = tsSeq[K](tsString[K]("catch"), tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsHidDestructuringPattern)), tsString[K](")")), tsBlank[K]()), tsSymbol[K](jsStatementBlock))
                  rules[jsExpressionStatement] = tsSeq[K](tsSymbol[K](jsHidExpressions), tsSymbol[K](jsHidSemicolon))
                  rules[jsNumber] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsRegex[K]("[\\da-fA-F](_?[\\da-fA-F])*")), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("0"), tsSeq[K](tsChoice[K](tsString[K]("0"), tsBlank[K]()), tsRegex[K]("[1-9]"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("\\d(_?\\d)*")), tsBlank[K]()))), tsString[K]("."), tsChoice[K](tsRegex[K]("\\d(_?\\d)*"), tsBlank[K]()), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("\\d(_?\\d)*"))), tsBlank[K]())), tsSeq[K](tsString[K]("."), tsRegex[K]("\\d(_?\\d)*"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("\\d(_?\\d)*"))), tsBlank[K]())), tsSeq[K](tsChoice[K](tsString[K]("0"), tsSeq[K](tsChoice[K](tsString[K]("0"), tsBlank[K]()), tsRegex[K]("[1-9]"), tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("_"), tsBlank[K]()), tsRegex[K]("\\d(_?\\d)*")), tsBlank[K]()))), tsSeq[K](tsChoice[K](tsString[K]("e"), tsString[K]("E")), tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsRegex[K]("\\d(_?\\d)*")))), tsSeq[K](tsRegex[K]("\\d(_?\\d)*"))), tsSeq[K](tsChoice[K](tsString[K]("0b"), tsString[K]("0B")), tsRegex[K]("[0-1](_?[0-1])*")), tsSeq[K](tsChoice[K](tsString[K]("0o"), tsString[K]("0O")), tsRegex[K]("[0-7](_?[0-7])*")), tsSeq[K](tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("0x"), tsString[K]("0X")), tsRegex[K]("[\\da-fA-F](_?[\\da-fA-F])*")), tsSeq[K](tsChoice[K](tsString[K]("0b"), tsString[K]("0B")), tsRegex[K]("[0-1](_?[0-1])*")), tsSeq[K](tsChoice[K](tsString[K]("0o"), tsString[K]("0O")), tsRegex[K]("[0-7](_?[0-7])*")), tsRegex[K]("\\d(_?\\d)*")), tsString[K]("n")))
                  rules[jsFormalParameters] = tsSeq[K](tsString[K]("("), tsChoice[K](tsSeq[K](tsSeq[K](tsSymbol[K](jsHidFormalParameter), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](jsHidFormalParameter)))), tsChoice[K](tsString[K](","), tsBlank[K]())), tsBlank[K]()), tsString[K](")"))
                  rules[jsDecorator] = tsSeq[K](tsString[K]("@"), tsChoice[K](tsSymbol[K](jsIdentifier), tsSymbol[K](jsDecoratorMemberExpression), tsSymbol[K](jsDecoratorCallExpression)))
                  rules[jsSuper] = tsString[K]("super")
                  rules[jsEmptyStatement] = tsString[K](";")
                  rules[jsAssignmentExpression] = tsSeq[K](tsChoice[K](tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsHidLhsExpression)), tsString[K]("="), tsSymbol[K](jsExpression))
                  rules[jsJsxOpeningElement] = tsSeq[K](tsString[K]("<"), tsSymbol[K](jsHidJsxElementName), tsRepeat[K](tsSymbol[K](jsHidJsxAttribute)), tsString[K](">"))
                  rules[jsJsxAttribute] = tsSeq[K](tsSymbol[K](jsHidJsxAttributeName), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](jsHidJsxAttributeValue)), tsBlank[K]()))
                  rules[jsStatement] = tsChoice[K](tsSymbol[K](jsExportStatement), tsSymbol[K](jsImportStatement), tsSymbol[K](jsDebuggerStatement), tsSymbol[K](jsExpressionStatement), tsSymbol[K](jsDeclaration), tsSymbol[K](jsStatementBlock), tsSymbol[K](jsIfStatement), tsSymbol[K](jsSwitchStatement), tsSymbol[K](jsForStatement), tsSymbol[K](jsForInStatement), tsSymbol[K](jsWhileStatement), tsSymbol[K](jsDoStatement), tsSymbol[K](jsTryStatement), tsSymbol[K](jsWithStatement), tsSymbol[K](jsBreakStatement), tsSymbol[K](jsContinueStatement), tsSymbol[K](jsReturnStatement), tsSymbol[K](jsThrowStatement), tsSymbol[K](jsEmptyStatement), tsSymbol[K](jsLabeledStatement))
                  rules[jsProgram] = tsSeq[K](tsChoice[K](tsSymbol[K](jsHashBangLine), tsBlank[K]()), tsRepeat[K](tsSymbol[K](jsStatement)))
                  rules[jsDoStatement] = tsSeq[K](tsString[K]("do"), tsSymbol[K](jsStatement), tsString[K]("while"), tsSymbol[K](jsParenthesizedExpression), tsSymbol[K](jsHidSemicolon))
                  rules[jsJsxElement] = tsSeq[K](tsSymbol[K](jsJsxOpeningElement), tsRepeat[K](tsSymbol[K](jsHidJsxChild)), tsSymbol[K](jsJsxClosingElement))
                  rules[jsImportClause] = tsChoice[K](tsSymbol[K](jsNamespaceImport), tsSymbol[K](jsNamedImports), tsSeq[K](tsSymbol[K](jsIdentifier), tsChoice[K](tsSeq[K](tsString[K](","), tsChoice[K](tsSymbol[K](jsNamespaceImport), tsSymbol[K](jsNamedImports))), tsBlank[K]())))
                  rules[jsJsxNamespaceName] = tsSeq[K](tsSymbol[K](jsHidJsxIdentifier), tsString[K](":"), tsSymbol[K](jsHidJsxIdentifier))
                  rules[jsSequenceExpression] = tsSeq[K](tsSymbol[K](jsExpression), tsString[K](","), tsChoice[K](tsSymbol[K](jsSequenceExpression), tsSymbol[K](jsExpression)))
                  rules[jsArray] = tsSeq[K](tsString[K]("["), tsChoice[K](tsSeq[K](tsChoice[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSpreadElement)), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsString[K](","), tsChoice[K](tsChoice[K](tsSymbol[K](jsExpression), tsSymbol[K](jsSpreadElement)), tsBlank[K]())))), tsBlank[K]()), tsString[K]("]"))
                  rules[jsTemplateSubstitution] = tsSeq[K](tsString[K]("${"), tsSymbol[K](jsHidExpressions), tsString[K]("}"))
                  rules[jsStatementBlock] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](jsStatement)), tsString[K]("}"), tsChoice[K](tsSymbol[K](jsHidAutomaticSemicolon), tsBlank[K]()))
                  rules[jsJsxIdentifier] = tsRegex[K]("[a-zA-Z_$][a-zA-Z\\d_$]*-[a-zA-Z\\d_$\\-]*")
                  rules[jsVariableDeclaration] = tsSeq[K](tsString[K]("var"), tsSeq[K](tsSymbol[K](jsVariableDeclarator), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](jsVariableDeclarator)))), tsSymbol[K](jsHidSemicolon))
                  rules[jsComputedPropertyName] = tsSeq[K](tsString[K]("["), tsSymbol[K](jsExpression), tsString[K]("]"))
                  rules[jsHidJsxAttributeName] = tsChoice[K](tsSymbol[K](jsHidJsxIdentifier), tsSymbol[K](jsJsxNamespaceName))
                  rules

