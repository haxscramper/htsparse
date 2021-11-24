import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  NodeKind* = enum
    Declaration                        ## declaration
    Expression                         ## expression
    Pattern                            ## pattern
    PrimaryExpression                  ## primary_expression
    Statement                          ## statement
    Arguments                          ## arguments
    Array                              ## array
    ArrayPattern                       ## array_pattern
    ArrowFunction                      ## arrow_function
    AssignmentExpression               ## assignment_expression
    AssignmentPattern                  ## assignment_pattern
    AugmentedAssignmentExpression      ## augmented_assignment_expression
    AwaitExpression                    ## await_expression
    BinaryExpression                   ## binary_expression
    BreakStatement                     ## break_statement
    CallExpression                     ## call_expression
    CatchClause                        ## catch_clause
    Class                              ## class
    ClassBody                          ## class_body
    ClassDeclaration                   ## class_declaration
    ClassHeritage                      ## class_heritage
    ComputedPropertyName               ## computed_property_name
    ContinueStatement                  ## continue_statement
    DebuggerStatement                  ## debugger_statement
    Decorator                          ## decorator
    DoStatement                        ## do_statement
    ElseClause                         ## else_clause
    EmptyStatement                     ## empty_statement
    ExportClause                       ## export_clause
    ExportSpecifier                    ## export_specifier
    ExportStatement                    ## export_statement
    ExpressionStatement                ## expression_statement
    FinallyClause                      ## finally_clause
    ForInStatement                     ## for_in_statement
    ForStatement                       ## for_statement
    FormalParameters                   ## formal_parameters
    Function                           ## function
    FunctionDeclaration                ## function_declaration
    GeneratorFunction                  ## generator_function
    GeneratorFunctionDeclaration       ## generator_function_declaration
    IfStatement                        ## if_statement
    Import                             ## import
    ImportClause                       ## import_clause
    ImportSpecifier                    ## import_specifier
    ImportStatement                    ## import_statement
    JsxAttribute                       ## jsx_attribute
    JsxClosingElement                  ## jsx_closing_element
    JsxElement                         ## jsx_element
    JsxExpression                      ## jsx_expression
    JsxFragment                        ## jsx_fragment
    JsxNamespaceName                   ## jsx_namespace_name
    JsxOpeningElement                  ## jsx_opening_element
    JsxSelfClosingElement              ## jsx_self_closing_element
    LabeledStatement                   ## labeled_statement
    LexicalDeclaration                 ## lexical_declaration
    MemberExpression                   ## member_expression
    MetaProperty                       ## meta_property
    MethodDefinition                   ## method_definition
    NamedImports                       ## named_imports
    NamespaceImport                    ## namespace_import
    NestedIdentifier                   ## nested_identifier
    NewExpression                      ## new_expression
    Object                             ## object
    ObjectAssignmentPattern            ## object_assignment_pattern
    ObjectPattern                      ## object_pattern
    Pair                               ## pair
    PairPattern                        ## pair_pattern
    ParenthesizedExpression            ## parenthesized_expression
    Program                            ## program
    PublicFieldDefinition              ## public_field_definition
    Regex                              ## regex
    RestPattern                        ## rest_pattern
    ReturnStatement                    ## return_statement
    SequenceExpression                 ## sequence_expression
    SpreadElement                      ## spread_element
    StatementBlock                     ## statement_block
    String                             ## string
    SubscriptExpression                ## subscript_expression
    SwitchBody                         ## switch_body
    SwitchCase                         ## switch_case
    SwitchDefault                      ## switch_default
    SwitchStatement                    ## switch_statement
    TemplateString                     ## template_string
    TemplateSubstitution               ## template_substitution
    TernaryExpression                  ## ternary_expression
    ThrowStatement                     ## throw_statement
    TryStatement                       ## try_statement
    UnaryExpression                    ## unary_expression
    UpdateExpression                   ## update_expression
    VariableDeclaration                ## variable_declaration
    VariableDeclarator                 ## variable_declarator
    WhileStatement                     ## while_statement
    WithStatement                      ## with_statement
    YieldExpression                    ## yield_expression
    ExclamationTok                     ## !
    ExclamationEqualTok                ## !=
    ExclamationDoubleEqualTok          ## !==
    QuoteTok                           ## "
    DollarLCurlyTok                    ## ${
    PercentTok                         ## %
    PercentEqualTok                    ## %=
    AmpersandTok                       ## &
    DoubleAmpersandTok                 ## &&
    DoubleAmpersandEqualTok            ## &&=
    AmpersandEqualTok                  ## &=
    ApostropheTok                      ## '
    LParTok                            ## (
    RParTok                            ## )
    AsteriskTok                        ## *
    DoubleAsteriskTok                  ## **
    DoubleAsteriskEqualTok             ## **=
    AsteriskEqualTok                   ## *=
    PlusTok                            ## +
    DoublePlusTok                      ## ++
    PlusEqualTok                       ## +=
    CommaTok                           ## ,
    MinusTok                           ## -
    DoubleMinusTok                     ## --
    MinusEqualTok                      ## -=
    DotTok                             ## .
    TripleDotTok                       ## ...
    SlashTok                           ## /
    SlashEqualTok                      ## /=
    ColonTok                           ## :
    SemicolonTok                       ## ;
    LessThanTok                        ## <
    DoubleLessThanTok                  ## <<
    DoubleLessThanEqualTok             ## <<=
    LessThanEqualTok                   ## <=
    EqualTok                           ## =
    DoubleEqualTok                     ## ==
    TripleEqualTok                     ## ===
    EqualGreaterThanTok                ## =>
    GreaterThanTok                     ## >
    GreaterThanEqualTok                ## >=
    DoubleGreaterThanTok               ## >>
    DoubleGreaterThanEqualTok          ## >>=
    TripleGreaterThanTok               ## >>>
    TripleGreaterThanEqualTok          ## >>>=
    QuestionTok                        ## ?
    QuestionDotTok                     ## ?.
    DoubleQuestionTok                  ## ??
    DoubleQuestionEqualTok             ## ??=
    AtTok                              ## @
    LBrackTok                          ## [
    RBrackTok                          ## ]
    AccentTok                          ## ^
    AccentEqualTok                     ## ^=
    BacktickTok                        ## `
    AsTok                              ## as
    AsyncTok                           ## async
    AwaitTok                           ## await
    BreakTok                           ## break
    CaseTok                            ## case
    CatchTok                           ## catch
    ClassTok                           ## class
    Comment                            ## comment
    ConstTok                           ## const
    ContinueTok                        ## continue
    DebuggerTok                        ## debugger
    DefaultTok                         ## default
    DeleteTok                          ## delete
    DoTok                              ## do
    ElseTok                            ## else
    EscapeSequence                     ## escape_sequence
    ExportTok                          ## export
    ExtendsTok                         ## extends
    False                              ## false
    FinallyTok                         ## finally
    ForTok                             ## for
    FromTok                            ## from
    FunctionTok                        ## function
    GetTok                             ## get
    HashBangLine                       ## hash_bang_line
    Identifier                         ## identifier
    IfTok                              ## if
    ImportTok                          ## import
    InTok                              ## in
    InstanceofTok                      ## instanceof
    JsxText                            ## jsx_text
    LetTok                             ## let
    NewTok                             ## new
    Null                               ## null
    Number                             ## number
    OfTok                              ## of
    PropertyIdentifier                 ## property_identifier
    RegexFlags                         ## regex_flags
    RegexPattern                       ## regex_pattern
    ReturnTok                          ## return
    SetTok                             ## set
    ShorthandPropertyIdentifier        ## shorthand_property_identifier
    ShorthandPropertyIdentifierPattern ## shorthand_property_identifier_pattern
    StatementIdentifier                ## statement_identifier
    StaticTok                          ## static
    Super                              ## super
    SwitchTok                          ## switch
    TargetTok                          ## target
    This                               ## this
    ThrowTok                           ## throw
    True                               ## true
    TryTok                             ## try
    TypeofTok                          ## typeof
    Undefined                          ## undefined
    VarTok                             ## var
    VoidTok                            ## void
    WhileTok                           ## while
    WithTok                            ## with
    YieldTok                           ## yield
    LCurlyTok                          ## {
    PipeTok                            ## |
    PipeEqualTok                       ## |=
    DoublePipeTok                      ## ||
    DoublePipeEqualTok                 ## ||=
    RCurlyTok                          ## }
    TildeTok                           ## ~
    SyntaxError                        ## Tree-sitter parser syntax error


proc strRepr*(kind: NodeKind): string =
  case kind:
    of Declaration:                        "declaration"
    of Expression:                         "expression"
    of Pattern:                            "pattern"
    of PrimaryExpression:                  "primary_expression"
    of Statement:                          "statement"
    of Arguments:                          "arguments"
    of Array:                              "array"
    of ArrayPattern:                       "array_pattern"
    of ArrowFunction:                      "arrow_function"
    of AssignmentExpression:               "assignment_expression"
    of AssignmentPattern:                  "assignment_pattern"
    of AugmentedAssignmentExpression:      "augmented_assignment_expression"
    of AwaitExpression:                    "await_expression"
    of BinaryExpression:                   "binary_expression"
    of BreakStatement:                     "break_statement"
    of CallExpression:                     "call_expression"
    of CatchClause:                        "catch_clause"
    of Class:                              "class"
    of ClassBody:                          "class_body"
    of ClassDeclaration:                   "class_declaration"
    of ClassHeritage:                      "class_heritage"
    of ComputedPropertyName:               "computed_property_name"
    of ContinueStatement:                  "continue_statement"
    of DebuggerStatement:                  "debugger_statement"
    of Decorator:                          "decorator"
    of DoStatement:                        "do_statement"
    of ElseClause:                         "else_clause"
    of EmptyStatement:                     "empty_statement"
    of ExportClause:                       "export_clause"
    of ExportSpecifier:                    "export_specifier"
    of ExportStatement:                    "export_statement"
    of ExpressionStatement:                "expression_statement"
    of FinallyClause:                      "finally_clause"
    of ForInStatement:                     "for_in_statement"
    of ForStatement:                       "for_statement"
    of FormalParameters:                   "formal_parameters"
    of Function:                           "function"
    of FunctionDeclaration:                "function_declaration"
    of GeneratorFunction:                  "generator_function"
    of GeneratorFunctionDeclaration:       "generator_function_declaration"
    of IfStatement:                        "if_statement"
    of Import:                             "import"
    of ImportClause:                       "import_clause"
    of ImportSpecifier:                    "import_specifier"
    of ImportStatement:                    "import_statement"
    of JsxAttribute:                       "jsx_attribute"
    of JsxClosingElement:                  "jsx_closing_element"
    of JsxElement:                         "jsx_element"
    of JsxExpression:                      "jsx_expression"
    of JsxFragment:                        "jsx_fragment"
    of JsxNamespaceName:                   "jsx_namespace_name"
    of JsxOpeningElement:                  "jsx_opening_element"
    of JsxSelfClosingElement:              "jsx_self_closing_element"
    of LabeledStatement:                   "labeled_statement"
    of LexicalDeclaration:                 "lexical_declaration"
    of MemberExpression:                   "member_expression"
    of MetaProperty:                       "meta_property"
    of MethodDefinition:                   "method_definition"
    of NamedImports:                       "named_imports"
    of NamespaceImport:                    "namespace_import"
    of NestedIdentifier:                   "nested_identifier"
    of NewExpression:                      "new_expression"
    of Object:                             "object"
    of ObjectAssignmentPattern:            "object_assignment_pattern"
    of ObjectPattern:                      "object_pattern"
    of Pair:                               "pair"
    of PairPattern:                        "pair_pattern"
    of ParenthesizedExpression:            "parenthesized_expression"
    of Program:                            "program"
    of PublicFieldDefinition:              "public_field_definition"
    of Regex:                              "regex"
    of RestPattern:                        "rest_pattern"
    of ReturnStatement:                    "return_statement"
    of SequenceExpression:                 "sequence_expression"
    of SpreadElement:                      "spread_element"
    of StatementBlock:                     "statement_block"
    of String:                             "string"
    of SubscriptExpression:                "subscript_expression"
    of SwitchBody:                         "switch_body"
    of SwitchCase:                         "switch_case"
    of SwitchDefault:                      "switch_default"
    of SwitchStatement:                    "switch_statement"
    of TemplateString:                     "template_string"
    of TemplateSubstitution:               "template_substitution"
    of TernaryExpression:                  "ternary_expression"
    of ThrowStatement:                     "throw_statement"
    of TryStatement:                       "try_statement"
    of UnaryExpression:                    "unary_expression"
    of UpdateExpression:                   "update_expression"
    of VariableDeclaration:                "variable_declaration"
    of VariableDeclarator:                 "variable_declarator"
    of WhileStatement:                     "while_statement"
    of WithStatement:                      "with_statement"
    of YieldExpression:                    "yield_expression"
    of ExclamationTok:                     "!"
    of ExclamationEqualTok:                "!="
    of ExclamationDoubleEqualTok:          "!=="
    of QuoteTok:                           "\""
    of DollarLCurlyTok:                    "${"
    of PercentTok:                         "%"
    of PercentEqualTok:                    "%="
    of AmpersandTok:                       "&"
    of DoubleAmpersandTok:                 "&&"
    of DoubleAmpersandEqualTok:            "&&="
    of AmpersandEqualTok:                  "&="
    of ApostropheTok:                      "\'"
    of LParTok:                            "("
    of RParTok:                            ")"
    of AsteriskTok:                        "*"
    of DoubleAsteriskTok:                  "**"
    of DoubleAsteriskEqualTok:             "**="
    of AsteriskEqualTok:                   "*="
    of PlusTok:                            "+"
    of DoublePlusTok:                      "++"
    of PlusEqualTok:                       "+="
    of CommaTok:                           ","
    of MinusTok:                           "-"
    of DoubleMinusTok:                     "--"
    of MinusEqualTok:                      "-="
    of DotTok:                             "."
    of TripleDotTok:                       "..."
    of SlashTok:                           "/"
    of SlashEqualTok:                      "/="
    of ColonTok:                           ":"
    of SemicolonTok:                       ";"
    of LessThanTok:                        "<"
    of DoubleLessThanTok:                  "<<"
    of DoubleLessThanEqualTok:             "<<="
    of LessThanEqualTok:                   "<="
    of EqualTok:                           "="
    of DoubleEqualTok:                     "=="
    of TripleEqualTok:                     "==="
    of EqualGreaterThanTok:                "=>"
    of GreaterThanTok:                     ">"
    of GreaterThanEqualTok:                ">="
    of DoubleGreaterThanTok:               ">>"
    of DoubleGreaterThanEqualTok:          ">>="
    of TripleGreaterThanTok:               ">>>"
    of TripleGreaterThanEqualTok:          ">>>="
    of QuestionTok:                        "?"
    of QuestionDotTok:                     "?."
    of DoubleQuestionTok:                  "??"
    of DoubleQuestionEqualTok:             "??="
    of AtTok:                              "@"
    of LBrackTok:                          "["
    of RBrackTok:                          "]"
    of AccentTok:                          "^"
    of AccentEqualTok:                     "^="
    of BacktickTok:                        "`"
    of AsTok:                              "as"
    of AsyncTok:                           "async"
    of AwaitTok:                           "await"
    of BreakTok:                           "break"
    of CaseTok:                            "case"
    of CatchTok:                           "catch"
    of ClassTok:                           "class"
    of Comment:                            "comment"
    of ConstTok:                           "const"
    of ContinueTok:                        "continue"
    of DebuggerTok:                        "debugger"
    of DefaultTok:                         "default"
    of DeleteTok:                          "delete"
    of DoTok:                              "do"
    of ElseTok:                            "else"
    of EscapeSequence:                     "escape_sequence"
    of ExportTok:                          "export"
    of ExtendsTok:                         "extends"
    of False:                              "false"
    of FinallyTok:                         "finally"
    of ForTok:                             "for"
    of FromTok:                            "from"
    of FunctionTok:                        "function"
    of GetTok:                             "get"
    of HashBangLine:                       "hash_bang_line"
    of Identifier:                         "identifier"
    of IfTok:                              "if"
    of ImportTok:                          "import"
    of InTok:                              "in"
    of InstanceofTok:                      "instanceof"
    of JsxText:                            "jsx_text"
    of LetTok:                             "let"
    of NewTok:                             "new"
    of Null:                               "null"
    of Number:                             "number"
    of OfTok:                              "of"
    of PropertyIdentifier:                 "property_identifier"
    of RegexFlags:                         "regex_flags"
    of RegexPattern:                       "regex_pattern"
    of ReturnTok:                          "return"
    of SetTok:                             "set"
    of ShorthandPropertyIdentifier:        "shorthand_property_identifier"
    of ShorthandPropertyIdentifierPattern: "shorthand_property_identifier_pattern"
    of StatementIdentifier:                "statement_identifier"
    of StaticTok:                          "static"
    of Super:                              "super"
    of SwitchTok:                          "switch"
    of TargetTok:                          "target"
    of This:                               "this"
    of ThrowTok:                           "throw"
    of True:                               "true"
    of TryTok:                             "try"
    of TypeofTok:                          "typeof"
    of Undefined:                          "undefined"
    of VarTok:                             "var"
    of VoidTok:                            "void"
    of WhileTok:                           "while"
    of WithTok:                            "with"
    of YieldTok:                           "yield"
    of LCurlyTok:                          "{"
    of PipeTok:                            "|"
    of PipeEqualTok:                       "|="
    of DoublePipeTok:                      "||"
    of DoublePipeEqualTok:                 "||="
    of RCurlyTok:                          "}"
    of TildeTok:                           "~"
    of SyntaxError:                        "ERROR"


type
  ExternalTok* = enum
    Extern_automatic_semicolon ## _automatic_semicolon
    Extern_template_chars      ## _template_chars


type
  TsNode* = distinct TSNode


type
  Parser* = distinct PtsParser


const AllowedSubnodes*: array[NodeKind, set[NodeKind]] = block:
                                                           var tmp: array[NodeKind, set[NodeKind]]
                                                           tmp[Arguments] = {Expression, SpreadElement}
                                                           tmp[Array] = {Expression, SpreadElement}
                                                           tmp[ArrayPattern] = {AssignmentPattern, Pattern}
                                                           tmp[AwaitExpression] = {Expression}
                                                           tmp[Class] = {ClassHeritage}
                                                           tmp[ClassDeclaration] = {ClassHeritage}
                                                           tmp[ClassHeritage] = {Expression}
                                                           tmp[ComputedPropertyName] = {Expression}
                                                           tmp[Decorator] = {CallExpression, Identifier, MemberExpression}
                                                           tmp[ElseClause] = {Statement}
                                                           tmp[ExportClause] = {ExportSpecifier}
                                                           tmp[ExportStatement] = {ExportClause}
                                                           tmp[ExpressionStatement] = {Expression, SequenceExpression}
                                                           tmp[FormalParameters] = {AssignmentPattern, Pattern}
                                                           tmp[ImportClause] = {Identifier, NamedImports, NamespaceImport}
                                                           tmp[ImportStatement] = {ImportClause}
                                                           tmp[JsxAttribute] = {
                                                                                 JsxElement,
                                                                                 JsxExpression,
                                                                                 JsxFragment,
                                                                                 JsxNamespaceName,
                                                                                 JsxSelfClosingElement,
                                                                                 PropertyIdentifier,
                                                                                 String
                                                                               }
                                                           tmp[JsxElement] = {JsxElement, JsxExpression, JsxFragment, JsxSelfClosingElement, JsxText}
                                                           tmp[JsxExpression] = {Expression, SequenceExpression, SpreadElement}
                                                           tmp[JsxFragment] = {JsxElement, JsxExpression, JsxFragment, JsxSelfClosingElement, JsxText}
                                                           tmp[JsxNamespaceName] = {Identifier}
                                                           tmp[LabeledStatement] = {Statement}
                                                           tmp[LexicalDeclaration] = {VariableDeclarator}
                                                           tmp[NamedImports] = {ImportSpecifier}
                                                           tmp[NamespaceImport] = {Identifier}
                                                           tmp[NestedIdentifier] = {Identifier, NestedIdentifier}
                                                           tmp[Object] = {MethodDefinition, Pair, ShorthandPropertyIdentifier, SpreadElement}
                                                           tmp[ObjectPattern] = {ObjectAssignmentPattern, PairPattern, RestPattern, ShorthandPropertyIdentifierPattern}
                                                           tmp[ParenthesizedExpression] = {Expression, SequenceExpression}
                                                           tmp[Program] = {HashBangLine, Statement}
                                                           tmp[RestPattern] = {ArrayPattern, Identifier, ObjectPattern}
                                                           tmp[ReturnStatement] = {Expression, SequenceExpression}
                                                           tmp[SpreadElement] = {Expression}
                                                           tmp[StatementBlock] = {Statement}
                                                           tmp[String] = {EscapeSequence}
                                                           tmp[SwitchBody] = {SwitchCase, SwitchDefault}
                                                           tmp[SwitchCase] = {Statement}
                                                           tmp[SwitchDefault] = {Statement}
                                                           tmp[TemplateString] = {EscapeSequence, TemplateSubstitution}
                                                           tmp[TemplateSubstitution] = {Expression, SequenceExpression}
                                                           tmp[ThrowStatement] = {Expression, SequenceExpression}
                                                           tmp[VariableDeclaration] = {VariableDeclarator}
                                                           tmp[YieldExpression] = {Expression}
                                                           tmp
const TokenKinds*: set[NodeKind] = {
                                     ExclamationTok,
                                     ExclamationEqualTok,
                                     ExclamationDoubleEqualTok,
                                     QuoteTok,
                                     DollarLCurlyTok,
                                     PercentTok,
                                     PercentEqualTok,
                                     AmpersandTok,
                                     DoubleAmpersandTok,
                                     DoubleAmpersandEqualTok,
                                     AmpersandEqualTok,
                                     ApostropheTok,
                                     LParTok,
                                     RParTok,
                                     AsteriskTok,
                                     DoubleAsteriskTok,
                                     DoubleAsteriskEqualTok,
                                     AsteriskEqualTok,
                                     PlusTok,
                                     DoublePlusTok,
                                     PlusEqualTok,
                                     CommaTok,
                                     MinusTok,
                                     DoubleMinusTok,
                                     MinusEqualTok,
                                     DotTok,
                                     TripleDotTok,
                                     SlashTok,
                                     SlashEqualTok,
                                     ColonTok,
                                     SemicolonTok,
                                     LessThanTok,
                                     DoubleLessThanTok,
                                     DoubleLessThanEqualTok,
                                     LessThanEqualTok,
                                     EqualTok,
                                     DoubleEqualTok,
                                     TripleEqualTok,
                                     EqualGreaterThanTok,
                                     GreaterThanTok,
                                     GreaterThanEqualTok,
                                     DoubleGreaterThanTok,
                                     DoubleGreaterThanEqualTok,
                                     TripleGreaterThanTok,
                                     TripleGreaterThanEqualTok,
                                     QuestionTok,
                                     QuestionDotTok,
                                     DoubleQuestionTok,
                                     DoubleQuestionEqualTok,
                                     AtTok,
                                     LBrackTok,
                                     RBrackTok,
                                     AccentTok,
                                     AccentEqualTok,
                                     BacktickTok,
                                     AsTok,
                                     AsyncTok,
                                     AwaitTok,
                                     BreakTok,
                                     CaseTok,
                                     CatchTok,
                                     ClassTok,
                                     ConstTok,
                                     ContinueTok,
                                     DebuggerTok,
                                     DefaultTok,
                                     DeleteTok,
                                     DoTok,
                                     ElseTok,
                                     ExportTok,
                                     ExtendsTok,
                                     FinallyTok,
                                     ForTok,
                                     FromTok,
                                     FunctionTok,
                                     GetTok,
                                     IfTok,
                                     ImportTok,
                                     InTok,
                                     InstanceofTok,
                                     LetTok,
                                     NewTok,
                                     OfTok,
                                     ReturnTok,
                                     SetTok,
                                     StaticTok,
                                     SwitchTok,
                                     TargetTok,
                                     ThrowTok,
                                     TryTok,
                                     TypeofTok,
                                     VarTok,
                                     VoidTok,
                                     WhileTok,
                                     WithTok,
                                     YieldTok,
                                     LCurlyTok,
                                     PipeTok,
                                     PipeEqualTok,
                                     DoublePipeTok,
                                     DoublePipeEqualTok,
                                     RCurlyTok,
                                     TildeTok
                                   }

proc tsNodeType*(node: TsNode): string



proc kind*(node: TsNode): NodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "declaration":                           Declaration
      of "expression":                            Expression
      of "pattern":                               Pattern
      of "primary_expression":                    PrimaryExpression
      of "statement":                             Statement
      of "arguments":                             Arguments
      of "array":                                 Array
      of "array_pattern":                         ArrayPattern
      of "arrow_function":                        ArrowFunction
      of "assignment_expression":                 AssignmentExpression
      of "assignment_pattern":                    AssignmentPattern
      of "augmented_assignment_expression":       AugmentedAssignmentExpression
      of "await_expression":                      AwaitExpression
      of "binary_expression":                     BinaryExpression
      of "break_statement":                       BreakStatement
      of "call_expression":                       CallExpression
      of "catch_clause":                          CatchClause
      of "class":                                 Class
      of "class_body":                            ClassBody
      of "class_declaration":                     ClassDeclaration
      of "class_heritage":                        ClassHeritage
      of "computed_property_name":                ComputedPropertyName
      of "continue_statement":                    ContinueStatement
      of "debugger_statement":                    DebuggerStatement
      of "decorator":                             Decorator
      of "do_statement":                          DoStatement
      of "else_clause":                           ElseClause
      of "empty_statement":                       EmptyStatement
      of "export_clause":                         ExportClause
      of "export_specifier":                      ExportSpecifier
      of "export_statement":                      ExportStatement
      of "expression_statement":                  ExpressionStatement
      of "finally_clause":                        FinallyClause
      of "for_in_statement":                      ForInStatement
      of "for_statement":                         ForStatement
      of "formal_parameters":                     FormalParameters
      of "function":                              Function
      of "function_declaration":                  FunctionDeclaration
      of "generator_function":                    GeneratorFunction
      of "generator_function_declaration":        GeneratorFunctionDeclaration
      of "if_statement":                          IfStatement
      of "import":                                Import
      of "import_clause":                         ImportClause
      of "import_specifier":                      ImportSpecifier
      of "import_statement":                      ImportStatement
      of "jsx_attribute":                         JsxAttribute
      of "jsx_closing_element":                   JsxClosingElement
      of "jsx_element":                           JsxElement
      of "jsx_expression":                        JsxExpression
      of "jsx_fragment":                          JsxFragment
      of "jsx_namespace_name":                    JsxNamespaceName
      of "jsx_opening_element":                   JsxOpeningElement
      of "jsx_self_closing_element":              JsxSelfClosingElement
      of "labeled_statement":                     LabeledStatement
      of "lexical_declaration":                   LexicalDeclaration
      of "member_expression":                     MemberExpression
      of "meta_property":                         MetaProperty
      of "method_definition":                     MethodDefinition
      of "named_imports":                         NamedImports
      of "namespace_import":                      NamespaceImport
      of "nested_identifier":                     NestedIdentifier
      of "new_expression":                        NewExpression
      of "object":                                Object
      of "object_assignment_pattern":             ObjectAssignmentPattern
      of "object_pattern":                        ObjectPattern
      of "pair":                                  Pair
      of "pair_pattern":                          PairPattern
      of "parenthesized_expression":              ParenthesizedExpression
      of "program":                               Program
      of "public_field_definition":               PublicFieldDefinition
      of "regex":                                 Regex
      of "rest_pattern":                          RestPattern
      of "return_statement":                      ReturnStatement
      of "sequence_expression":                   SequenceExpression
      of "spread_element":                        SpreadElement
      of "statement_block":                       StatementBlock
      of "string":                                String
      of "subscript_expression":                  SubscriptExpression
      of "switch_body":                           SwitchBody
      of "switch_case":                           SwitchCase
      of "switch_default":                        SwitchDefault
      of "switch_statement":                      SwitchStatement
      of "template_string":                       TemplateString
      of "template_substitution":                 TemplateSubstitution
      of "ternary_expression":                    TernaryExpression
      of "throw_statement":                       ThrowStatement
      of "try_statement":                         TryStatement
      of "unary_expression":                      UnaryExpression
      of "update_expression":                     UpdateExpression
      of "variable_declaration":                  VariableDeclaration
      of "variable_declarator":                   VariableDeclarator
      of "while_statement":                       WhileStatement
      of "with_statement":                        WithStatement
      of "yield_expression":                      YieldExpression
      of "!":                                     ExclamationTok
      of "!=":                                    ExclamationEqualTok
      of "!==":                                   ExclamationDoubleEqualTok
      of "\"":                                    QuoteTok
      of "${":                                    DollarLCurlyTok
      of "%":                                     PercentTok
      of "%=":                                    PercentEqualTok
      of "&":                                     AmpersandTok
      of "&&":                                    DoubleAmpersandTok
      of "&&=":                                   DoubleAmpersandEqualTok
      of "&=":                                    AmpersandEqualTok
      of "\'":                                    ApostropheTok
      of "(":                                     LParTok
      of ")":                                     RParTok
      of "*":                                     AsteriskTok
      of "**":                                    DoubleAsteriskTok
      of "**=":                                   DoubleAsteriskEqualTok
      of "*=":                                    AsteriskEqualTok
      of "+":                                     PlusTok
      of "++":                                    DoublePlusTok
      of "+=":                                    PlusEqualTok
      of ",":                                     CommaTok
      of "-":                                     MinusTok
      of "--":                                    DoubleMinusTok
      of "-=":                                    MinusEqualTok
      of ".":                                     DotTok
      of "...":                                   TripleDotTok
      of "/":                                     SlashTok
      of "/=":                                    SlashEqualTok
      of ":":                                     ColonTok
      of ";":                                     SemicolonTok
      of "<":                                     LessThanTok
      of "<<":                                    DoubleLessThanTok
      of "<<=":                                   DoubleLessThanEqualTok
      of "<=":                                    LessThanEqualTok
      of "=":                                     EqualTok
      of "==":                                    DoubleEqualTok
      of "===":                                   TripleEqualTok
      of "=>":                                    EqualGreaterThanTok
      of ">":                                     GreaterThanTok
      of ">=":                                    GreaterThanEqualTok
      of ">>":                                    DoubleGreaterThanTok
      of ">>=":                                   DoubleGreaterThanEqualTok
      of ">>>":                                   TripleGreaterThanTok
      of ">>>=":                                  TripleGreaterThanEqualTok
      of "?":                                     QuestionTok
      of "?.":                                    QuestionDotTok
      of "??":                                    DoubleQuestionTok
      of "??=":                                   DoubleQuestionEqualTok
      of "@":                                     AtTok
      of "[":                                     LBrackTok
      of "]":                                     RBrackTok
      of "^":                                     AccentTok
      of "^=":                                    AccentEqualTok
      of "`":                                     BacktickTok
      of "as":                                    AsTok
      of "async":                                 AsyncTok
      of "await":                                 AwaitTok
      of "break":                                 BreakTok
      of "case":                                  CaseTok
      of "catch":                                 CatchTok
      of "comment":                               Comment
      of "const":                                 ConstTok
      of "continue":                              ContinueTok
      of "debugger":                              DebuggerTok
      of "default":                               DefaultTok
      of "delete":                                DeleteTok
      of "do":                                    DoTok
      of "else":                                  ElseTok
      of "escape_sequence":                       EscapeSequence
      of "export":                                ExportTok
      of "extends":                               ExtendsTok
      of "false":                                 False
      of "finally":                               FinallyTok
      of "for":                                   ForTok
      of "from":                                  FromTok
      of "get":                                   GetTok
      of "hash_bang_line":                        HashBangLine
      of "identifier":                            Identifier
      of "if":                                    IfTok
      of "in":                                    InTok
      of "instanceof":                            InstanceofTok
      of "jsx_text":                              JsxText
      of "let":                                   LetTok
      of "new":                                   NewTok
      of "null":                                  Null
      of "number":                                Number
      of "of":                                    OfTok
      of "property_identifier":                   PropertyIdentifier
      of "regex_flags":                           RegexFlags
      of "regex_pattern":                         RegexPattern
      of "return":                                ReturnTok
      of "set":                                   SetTok
      of "shorthand_property_identifier":         ShorthandPropertyIdentifier
      of "shorthand_property_identifier_pattern": ShorthandPropertyIdentifierPattern
      of "statement_identifier":                  StatementIdentifier
      of "static":                                StaticTok
      of "super":                                 Super
      of "switch":                                SwitchTok
      of "target":                                TargetTok
      of "this":                                  This
      of "throw":                                 ThrowTok
      of "true":                                  True
      of "try":                                   TryTok
      of "typeof":                                TypeofTok
      of "undefined":                             Undefined
      of "var":                                   VarTok
      of "void":                                  VoidTok
      of "while":                                 WhileTok
      of "with":                                  WithTok
      of "yield":                                 YieldTok
      of "{":                                     LCurlyTok
      of "|":                                     PipeTok
      of "|=":                                    PipeEqualTok
      of "||":                                    DoublePipeTok
      of "||=":                                   DoublePipeEqualTok
      of "}":                                     RCurlyTok
      of "~":                                     TildeTok
      of "ERROR":                                 SyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsNode): string =
  $ts_node_type(TSNode(node))

proc newTsParser*(): Parser =
  result = Parser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_())

proc parseString*(parser: Parser, str: string): TsNode =
  TsNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsString*(str: string): TsNode =
  let parser = newTsParser()
  return parseString(parser, str)

func `$`*(node: TsNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(node: TsNode, idx: int, kind: NodeKind | set[NodeKind]): TsNode =
  assert 0 <= idx and idx < node.len
  result = TsNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  Node* = HtsNode[TsNode, NodeKind]


proc treeReprTs*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsNode, NodeKind](parseTsString(str), str, 0, unnamed = unnamed)

proc toHtsNode*(node: TsNode, str: ptr string): HtsNode[TsNode, NodeKind] =
  toHtsNode[TsNode, NodeKind](node, str)

proc toHtsTree*(node: TsNode, str: ptr string): Node =
  toHtsNode[TsNode, NodeKind](node, str)

proc parseString*(str: ptr string, unnamed: bool = false): Node =
  let parser = newTsParser()
  return toHtsTree[TsNode, NodeKind](parseString(parser, str[]), str)

proc parseString*(str: string, unnamed: bool = false): Node =
  let parser = newTsParser()
  return toHtsTree[TsNode, NodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


