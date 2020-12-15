
import
  hparse / htreesitter / htreesitter, sequtils, strutils

type
  RubyNodeKind* = enum
    rubyArg,                ## _arg
    rubyLhs,                ## _lhs
    rubyMethodName,         ## _method_name
    rubyPrimary,            ## _primary
    rubyStatement,          ## _statement
    rubyVariable,           ## _variable
    rubyAlias,              ## alias
    rubyArgumentList,       ## argument_list
    rubyArray,              ## array
    rubyAssignment,         ## assignment
    rubyBareString,         ## bare_string
    rubyBareSymbol,         ## bare_symbol
    rubyBegin,              ## begin
    rubyBeginBlock,         ## begin_block
    rubyBinary,             ## binary
    rubyBlock,              ## block
    rubyBlockArgument,      ## block_argument
    rubyBlockParameter,     ## block_parameter
    rubyBlockParameters,    ## block_parameters
    rubyBreak,              ## break
    rubyCall,               ## call
    rubyCase,               ## case
    rubyChainedString,      ## chained_string
    rubyClass,              ## class
    rubyConditional,        ## conditional
    rubyDestructuredLeftAssignment, ## destructured_left_assignment
    rubyDestructuredParameter, ## destructured_parameter
    rubyDo,                 ## do
    rubyDoBlock,            ## do_block
    rubyElementReference,   ## element_reference
    rubyElse,               ## else
    rubyElsif,              ## elsif
    rubyEmptyStatement,     ## empty_statement
    rubyEndBlock,           ## end_block
    rubyEnsure,             ## ensure
    rubyExceptionVariable,  ## exception_variable
    rubyExceptions,         ## exceptions
    rubyFor,                ## for
    rubyHash,               ## hash
    rubyHashSplatArgument,  ## hash_splat_argument
    rubyHashSplatParameter, ## hash_splat_parameter
    rubyHeredocBody,        ## heredoc_body
    rubyIf,                 ## if
    rubyIfModifier,         ## if_modifier
    rubyIn,                 ## in
    rubyInterpolation,      ## interpolation
    rubyKeywordParameter,   ## keyword_parameter
    rubyLambda,             ## lambda
    rubyLambdaParameters,   ## lambda_parameters
    rubyLeftAssignmentList, ## left_assignment_list
    rubyMethod,             ## method
    rubyMethodCall,         ## method_call
    rubyMethodParameters,   ## method_parameters
    rubyModule,             ## module
    rubyNext,               ## next
    rubyOperator,           ## operator
    rubyOperatorAssignment, ## operator_assignment
    rubyOptionalParameter,  ## optional_parameter
    rubyPair,               ## pair
    rubyParenthesizedStatements, ## parenthesized_statements
    rubyPattern,            ## pattern
    rubyProgram,            ## program
    rubyRange,              ## range
    rubyRational,           ## rational
    rubyRedo,               ## redo
    rubyRegex,              ## regex
    rubyRescue,             ## rescue
    rubyRescueModifier,     ## rescue_modifier
    rubyRestAssignment,     ## rest_assignment
    rubyRetry,              ## retry
    rubyReturn,             ## return
    rubyRightAssignmentList, ## right_assignment_list
    rubyScopeResolution,    ## scope_resolution
    rubySetter,             ## setter
    rubySingletonClass,     ## singleton_class
    rubySingletonMethod,    ## singleton_method
    rubySplatArgument,      ## splat_argument
    rubySplatParameter,     ## splat_parameter
    rubyString,             ## string
    rubyStringArray,        ## string_array
    rubySubshell,           ## subshell
    rubySuperclass,         ## superclass
    rubySymbol,             ## symbol
    rubySymbolArray,        ## symbol_array
    rubyThen,               ## then
    rubyUnary,              ## unary
    rubyUndef,              ## undef
    rubyUnless,             ## unless
    rubyUnlessModifier,     ## unless_modifier
    rubyUntil,              ## until
    rubyUntilModifier,      ## until_modifier
    rubyWhen,               ## when
    rubyWhile,              ## while
    rubyWhileModifier,      ## while_modifier
    rubyYield,              ## yield
    rubyExclamationTok,     ## !
    rubyExclamationEqualTok, ## !=
    rubyExclamationTildeTok, ## !~
    rubyQuoteTok,           ## "
    rubyHashLCurlyTok,      ## #{
    rubyPercentTok,         ## %
    rubyPercentEqualTok,    ## %=
    rubyPercentiLParTok,    ## %i(
    rubyPercentwLParTok,    ## %w(
    rubyAmpersandTok,       ## &
    rubyDoubleAmpersandTok, ## &&
    rubyDoubleAmpersandEqualTok, ## &&=
    rubyAmpersandDotTok,    ## &.
    rubyAmpersandEqualTok,  ## &=
    rubyLParTok,            ## (
    rubyRParTok,            ## )
    rubyAsteriskTok,        ## *
    rubyDoubleAsteriskTok,  ## **
    rubyDoubleAsteriskEqualTok, ## **=
    rubyAsteriskEqualTok,   ## *=
    rubyPlusTok,            ## +
    rubyPlusEqualTok,       ## +=
    rubyPlusAtTok,          ## +@
    rubyCommaTok,           ## ,
    rubyMinusTok,           ## -
    rubyMinusEqualTok,      ## -=
    rubyMinusGreaterThanTok, ## ->
    rubyMinusAtTok,         ## -@
    rubyDotTok,             ## .
    rubyDoubleDotTok,       ## ..
    rubyTripleDotTok,       ## ...
    rubySlashTok,           ## /
    rubySlashEqualTok,      ## /=
    rubyColonTok,           ## :
    rubyColonQuoteTok,      ## :"
    rubyDoubleColonTok,     ## ::
    rubySemicolonTok,       ## ;
    rubyLessThanTok,        ## <
    rubyDoubleLessThanTok,  ## <<
    rubyDoubleLessThanEqualTok, ## <<=
    rubyLessThanEqualTok,   ## <=
    rubyLessThanEqualGreaterThanTok, ## <=>
    rubyEqualTok,           ## =
    rubyDoubleEqualTok,     ## ==
    rubyTripleEqualTok,     ## ===
    rubyEqualGreaterThanTok, ## =>
    rubyEqualTildeTok,      ## =~
    rubyGreaterThanTok,     ## >
    rubyGreaterThanEqualTok, ## >=
    rubyDoubleGreaterThanTok, ## >>
    rubyDoubleGreaterThanEqualTok, ## >>=
    rubyQuestionTok,        ## ?
    rubyBEGINTok,           ## BEGIN
    rubyENDTok,             ## END
    rubyLBrackTok,          ## [
    rubyLBrackRBrackTok,    ## []
    rubyLBrackRBrackEqualTok, ## []=
    rubyRBrackTok,          ## ]
    rubyAccentTok,          ## ^
    rubyAccentEqualTok,     ## ^=
    rubyBacktickTok,        ## `
    rubyAliasTok,           ## alias
    rubyAndTok,             ## and
    rubyBeginTok,           ## begin
    rubyBreakTok,           ## break
    rubyCaseTok,            ## case
    rubyCharacter,          ## character
    rubyClassTok,           ## class
    rubyClassVariable,      ## class_variable
    rubyComment,            ## comment
    rubyComplex,            ## complex
    rubyConstant,           ## constant
    rubyDefTok,             ## def
    rubyDefinedQuestionTok, ## defined?
    rubyDoTok,              ## do
    rubyElseTok,            ## else
    rubyElsifTok,           ## elsif
    rubyEndTok,             ## end
    rubyEnsureTok,          ## ensure
    rubyEscapeSequence,     ## escape_sequence
    rubyFalse,              ## false
    rubyFloat,              ## float
    rubyForTok,             ## for
    rubyGlobalVariable,     ## global_variable
    rubyHeredocBeginning,   ## heredoc_beginning
    rubyHeredocContent,     ## heredoc_content
    rubyHeredocEnd,         ## heredoc_end
    rubyIdentifier,         ## identifier
    rubyIfTok,              ## if
    rubyInTok,              ## in
    rubyInstanceVariable,   ## instance_variable
    rubyInteger,            ## integer
    rubyModuleTok,          ## module
    rubyNextTok,            ## next
    rubyNil,                ## nil
    rubyNotTok,             ## not
    rubyOrTok,              ## or
    rubyRTok,               ## r
    rubyRedoTok,            ## redo
    rubyRescueTok,          ## rescue
    rubyRetryTok,           ## retry
    rubyReturnTok,          ## return
    rubySelf,               ## self
    rubyStringContent,      ## string_content
    rubySuper,              ## super
    rubyThenTok,            ## then
    rubyTrue,               ## true
    rubyUndefTok,           ## undef
    rubyUninterpreted,      ## uninterpreted
    rubyUnlessTok,          ## unless
    rubyUntilTok,           ## until
    rubyWhenTok,            ## when
    rubyWhileTok,           ## while
    rubyYieldTok,           ## yield
    rubyLCurlyTok,          ## {
    rubyPipeTok,            ## |
    rubyPipeEqualTok,       ## |=
    rubyDoublePipeTok,      ## ||
    rubyDoublePipeEqualTok, ## ||=
    rubyRCurlyTok,          ## }
    rubyTildeTok,           ## ~
    rubySyntaxError          ## Tree-sitter parser syntax error
type
  RubyExternalTok* = enum
    rubyExtern_line_break,  ## _line_break
    rubyExtern_simple_symbol, ## _simple_symbol
    rubyExtern_string_start, ## _string_start
    rubyExtern_symbol_start, ## _symbol_start
    rubyExtern_subshell_start, ## _subshell_start
    rubyExtern_regex_start, ## _regex_start
    rubyExtern_string_array_start, ## _string_array_start
    rubyExtern_symbol_array_start, ## _symbol_array_start
    rubyExtern_heredoc_body_start, ## _heredoc_body_start
    rubyExternString_content, ## string_content
    rubyExternHeredoc_content, ## heredoc_content
    rubyExtern_string_end,  ## _string_end
    rubyExternHeredoc_end,  ## heredoc_end
    rubyExternHeredoc_beginning, ## heredoc_beginning
    rubyExtern_block_ampersand, ## _block_ampersand
    rubyExtern_splat_star,  ## _splat_star
    rubyExtern_unary_minus, ## _unary_minus
    rubyExtern_binary_minus, ## _binary_minus
    rubyExtern_binary_star, ## _binary_star
    rubyExtern_singleton_class_left_angle_left_langle, ## _singleton_class_left_angle_left_langle
    rubyExtern_identifier_hash_key ## _identifier_hash_key
type
  RubyNode* = distinct TSNode
type
  RubyParser* = distinct PtsParser
proc tsNodeType*(node: RubyNode): string
proc kind*(node: RubyNode): RubyNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "_arg":
      rubyArg
    of "_lhs":
      rubyLhs
    of "_method_name":
      rubyMethodName
    of "_primary":
      rubyPrimary
    of "_statement":
      rubyStatement
    of "_variable":
      rubyVariable
    of "alias":
      rubyAlias
    of "argument_list":
      rubyArgumentList
    of "array":
      rubyArray
    of "assignment":
      rubyAssignment
    of "bare_string":
      rubyBareString
    of "bare_symbol":
      rubyBareSymbol
    of "begin":
      rubyBegin
    of "begin_block":
      rubyBeginBlock
    of "binary":
      rubyBinary
    of "block":
      rubyBlock
    of "block_argument":
      rubyBlockArgument
    of "block_parameter":
      rubyBlockParameter
    of "block_parameters":
      rubyBlockParameters
    of "break":
      rubyBreak
    of "call":
      rubyCall
    of "case":
      rubyCase
    of "chained_string":
      rubyChainedString
    of "class":
      rubyClass
    of "conditional":
      rubyConditional
    of "destructured_left_assignment":
      rubyDestructuredLeftAssignment
    of "destructured_parameter":
      rubyDestructuredParameter
    of "do":
      rubyDo
    of "do_block":
      rubyDoBlock
    of "element_reference":
      rubyElementReference
    of "else":
      rubyElse
    of "elsif":
      rubyElsif
    of "empty_statement":
      rubyEmptyStatement
    of "end_block":
      rubyEndBlock
    of "ensure":
      rubyEnsure
    of "exception_variable":
      rubyExceptionVariable
    of "exceptions":
      rubyExceptions
    of "for":
      rubyFor
    of "hash":
      rubyHash
    of "hash_splat_argument":
      rubyHashSplatArgument
    of "hash_splat_parameter":
      rubyHashSplatParameter
    of "heredoc_body":
      rubyHeredocBody
    of "if":
      rubyIf
    of "if_modifier":
      rubyIfModifier
    of "in":
      rubyIn
    of "interpolation":
      rubyInterpolation
    of "keyword_parameter":
      rubyKeywordParameter
    of "lambda":
      rubyLambda
    of "lambda_parameters":
      rubyLambdaParameters
    of "left_assignment_list":
      rubyLeftAssignmentList
    of "method":
      rubyMethod
    of "method_call":
      rubyMethodCall
    of "method_parameters":
      rubyMethodParameters
    of "module":
      rubyModule
    of "next":
      rubyNext
    of "operator":
      rubyOperator
    of "operator_assignment":
      rubyOperatorAssignment
    of "optional_parameter":
      rubyOptionalParameter
    of "pair":
      rubyPair
    of "parenthesized_statements":
      rubyParenthesizedStatements
    of "pattern":
      rubyPattern
    of "program":
      rubyProgram
    of "range":
      rubyRange
    of "rational":
      rubyRational
    of "redo":
      rubyRedo
    of "regex":
      rubyRegex
    of "rescue":
      rubyRescue
    of "rescue_modifier":
      rubyRescueModifier
    of "rest_assignment":
      rubyRestAssignment
    of "retry":
      rubyRetry
    of "return":
      rubyReturn
    of "right_assignment_list":
      rubyRightAssignmentList
    of "scope_resolution":
      rubyScopeResolution
    of "setter":
      rubySetter
    of "singleton_class":
      rubySingletonClass
    of "singleton_method":
      rubySingletonMethod
    of "splat_argument":
      rubySplatArgument
    of "splat_parameter":
      rubySplatParameter
    of "string":
      rubyString
    of "string_array":
      rubyStringArray
    of "subshell":
      rubySubshell
    of "superclass":
      rubySuperclass
    of "symbol":
      rubySymbol
    of "symbol_array":
      rubySymbolArray
    of "then":
      rubyThen
    of "unary":
      rubyUnary
    of "undef":
      rubyUndef
    of "unless":
      rubyUnless
    of "unless_modifier":
      rubyUnlessModifier
    of "until":
      rubyUntil
    of "until_modifier":
      rubyUntilModifier
    of "when":
      rubyWhen
    of "while":
      rubyWhile
    of "while_modifier":
      rubyWhileModifier
    of "yield":
      rubyYield
    of "!":
      rubyExclamationTok
    of "!=":
      rubyExclamationEqualTok
    of "!~":
      rubyExclamationTildeTok
    of "\"":
      rubyQuoteTok
    of "#{":
      rubyHashLCurlyTok
    of "%":
      rubyPercentTok
    of "%=":
      rubyPercentEqualTok
    of "%i(":
      rubyPercentiLParTok
    of "%w(":
      rubyPercentwLParTok
    of "&":
      rubyAmpersandTok
    of "&&":
      rubyDoubleAmpersandTok
    of "&&=":
      rubyDoubleAmpersandEqualTok
    of "&.":
      rubyAmpersandDotTok
    of "&=":
      rubyAmpersandEqualTok
    of "(":
      rubyLParTok
    of ")":
      rubyRParTok
    of "*":
      rubyAsteriskTok
    of "**":
      rubyDoubleAsteriskTok
    of "**=":
      rubyDoubleAsteriskEqualTok
    of "*=":
      rubyAsteriskEqualTok
    of "+":
      rubyPlusTok
    of "+=":
      rubyPlusEqualTok
    of "+@":
      rubyPlusAtTok
    of ",":
      rubyCommaTok
    of "-":
      rubyMinusTok
    of "-=":
      rubyMinusEqualTok
    of "->":
      rubyMinusGreaterThanTok
    of "-@":
      rubyMinusAtTok
    of ".":
      rubyDotTok
    of "..":
      rubyDoubleDotTok
    of "...":
      rubyTripleDotTok
    of "/":
      rubySlashTok
    of "/=":
      rubySlashEqualTok
    of ":":
      rubyColonTok
    of ":\"":
      rubyColonQuoteTok
    of "::":
      rubyDoubleColonTok
    of ";":
      rubySemicolonTok
    of "<":
      rubyLessThanTok
    of "<<":
      rubyDoubleLessThanTok
    of "<<=":
      rubyDoubleLessThanEqualTok
    of "<=":
      rubyLessThanEqualTok
    of "<=>":
      rubyLessThanEqualGreaterThanTok
    of "=":
      rubyEqualTok
    of "==":
      rubyDoubleEqualTok
    of "===":
      rubyTripleEqualTok
    of "=>":
      rubyEqualGreaterThanTok
    of "=~":
      rubyEqualTildeTok
    of ">":
      rubyGreaterThanTok
    of ">=":
      rubyGreaterThanEqualTok
    of ">>":
      rubyDoubleGreaterThanTok
    of ">>=":
      rubyDoubleGreaterThanEqualTok
    of "?":
      rubyQuestionTok
    of "BEGIN":
      rubyBEGINTok
    of "END":
      rubyENDTok
    of "[":
      rubyLBrackTok
    of "[]":
      rubyLBrackRBrackTok
    of "[]=":
      rubyLBrackRBrackEqualTok
    of "]":
      rubyRBrackTok
    of "^":
      rubyAccentTok
    of "^=":
      rubyAccentEqualTok
    of "__END__":
      rubyENDTok
    of "`":
      rubyBacktickTok
    of "and":
      rubyAndTok
    of "character":
      rubyCharacter
    of "class_variable":
      rubyClassVariable
    of "comment":
      rubyComment
    of "complex":
      rubyComplex
    of "constant":
      rubyConstant
    of "def":
      rubyDefTok
    of "defined?":
      rubyDefinedQuestionTok
    of "end":
      rubyEndTok
    of "escape_sequence":
      rubyEscapeSequence
    of "false":
      rubyFalse
    of "float":
      rubyFloat
    of "global_variable":
      rubyGlobalVariable
    of "heredoc_beginning":
      rubyHeredocBeginning
    of "heredoc_content":
      rubyHeredocContent
    of "heredoc_end":
      rubyHeredocEnd
    of "identifier":
      rubyIdentifier
    of "instance_variable":
      rubyInstanceVariable
    of "integer":
      rubyInteger
    of "nil":
      rubyNil
    of "not":
      rubyNotTok
    of "or":
      rubyOrTok
    of "r":
      rubyRTok
    of "self":
      rubySelf
    of "string_content":
      rubyStringContent
    of "super":
      rubySuper
    of "true":
      rubyTrue
    of "uninterpreted":
      rubyUninterpreted
    of "{":
      rubyLCurlyTok
    of "|":
      rubyPipeTok
    of "|=":
      rubyPipeEqualTok
    of "||":
      rubyDoublePipeTok
    of "||=":
      rubyDoublePipeEqualTok
    of "}":
      rubyRCurlyTok
    of "~":
      rubyTildeTok
    of "ERROR":
      rubySyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_ruby(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: RubyNode): string =
  $ts_node_type(TSNode(node))

proc newRubyParser*(): RubyParser =
  result = RubyParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_ruby())

proc parseString*(parser: RubyParser; str: string): RubyNode =
  RubyNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseRubyString*(str: string): RubyNode =
  let parser = newRubyParser()
  return parseString(parser, str)

func `[]`*(node: RubyNode; idx: int; withUnnamed: bool = false): RubyNode =
  if withUnnamed:
    RubyNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    RubyNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: RubyNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: RubyNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: RubyNode; withUnnamed: bool = false): RubyNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

func slice*(node: RubyNode): Slice[int] =
  {.cast(noSideEffect).}:
    ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: RubyNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: RubyNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[4 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
