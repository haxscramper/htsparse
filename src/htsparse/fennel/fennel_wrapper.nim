
import
  hmisc / wrappers / treesitter

import
  hmisc / base_errors

import
  strutils

type
  FennelNodeKind* = enum
    fennelAssignment,       ## assignment
    fennelAssignments,      ## assignments
    fennelBoolean,          ## boolean
    fennelDoStatement,      ## do_statement
    fennelEach,             ## each
    fennelEachClause,       ## each_clause
    fennelFieldExpression,  ## field_expression
    fennelFor,              ## for
    fennelForClause,        ## for_clause
    fennelFunctionCall,     ## function_call
    fennelFunctionDefinition, ## function_definition
    fennelGlobalDefinition, ## global_definition
    fennelHashFunctionDefinition, ## hash_function_definition
    fennelIdentifier,       ## identifier
    fennelIfStatement,      ## if_statement
    fennelLambdaDefinition, ## lambda_definition
    fennelLetDefinition,    ## let_definition
    fennelLocalDefinition,  ## local_definition
    fennelMatchStatement,   ## match_statement
    fennelMultiValueAssignment, ## multi_value_assignment
    fennelNil,              ## nil
    fennelParameters,       ## parameters
    fennelProgram,          ## program
    fennelQuotedValue,      ## quoted_value
    fennelRequire,          ## require
    fennelSequentialTable,  ## sequential_table
    fennelSet,              ## set
    fennelString,           ## string
    fennelTable,            ## table
    fennelTset,             ## tset
    fennelUnquotedValue,    ## unquoted_value
    fennelValueList,        ## value_list
    fennelVarDefinition,    ## var_definition
    fennelWhenStatement,    ## when_statement
    fennelWhile,            ## while
    fennelQuoteTok,         ## "
    fennelHashTok,          ## #
    fennelPercentTok,       ## %
    fennelApostropheTok,    ## '
    fennelLParTok,          ## (
    fennelRParTok,          ## )
    fennelAsteriskTok,      ## *
    fennelPlusTok,          ## +
    fennelCommaTok,         ## ,
    fennelMinusTok,         ## -
    fennelMinusGreaterThanTok, ## ->
    fennelMinusDoubleGreaterThanTok, ## ->>
    fennelMinusQuestionGreaterThanTok, ## -?>
    fennelMinusQuestionDoubleGreaterThanTok, ## -?>>
    fennelDotTok,           ## .
    fennelDoubleDotTok,     ## ..
    fennelTripleDotTok,     ## ...
    fennelSlashTok,         ## /
    fennelDoubleSlashTok,   ## //
    fennelLessThanTok,      ## <
    fennelLessThanEqualTok, ## <=
    fennelEqualTok,         ## =
    fennelGreaterThanTok,   ## >
    fennelGreaterThanEqualTok, ## >=
    fennelLBrackTok,        ## [
    fennelRBrackTok,        ## ]
    fennelAccentTok,        ## ^
    fennelENVTok,           ## _ENV
    fennelGTok,             ## _G
    fennelVERSIONTok,       ## _VERSION
    fennelBacktickTok,      ## `
    fennelAndTok,           ## and
    fennelArgTok,           ## arg
    fennelAssertTok,        ## assert
    fennelCollectgarbageTok, ## collectgarbage
    fennelComment,          ## comment
    fennelCoroutineTok,     ## coroutine
    fennelDebugTok,         ## debug
    fennelDoTok,            ## do
    fennelDofileTok,        ## dofile
    fennelDotoTok,          ## doto
    fennelEachTok,          ## each
    fennelErrorTok,         ## error
    fennelEvalMinuscompilerTok, ## eval-compiler
    fennelFalseTok,         ## false
    fennelField,            ## field
    fennelFnTok,            ## fn
    fennelForTok,           ## for
    fennelGensymTok,        ## gensym
    fennelGetmetatableTok,  ## getmetatable
    fennelGlobalTok,        ## global
    fennelHashfnTok,        ## hashfn
    fennelIfTok,            ## if
    fennelImportMinusmacrosTok, ## import-macros
    fennelInMinusscopeQuestionTok, ## in-scope?
    fennelIncludeTok,       ## include
    fennelIpairsTok,        ## ipairs
    fennelLambdaTok,        ## lambda
    fennelLetTok,           ## let
    fennelListTok,          ## list
    fennelListQuestionTok,  ## list?
    fennelLoadTok,          ## load
    fennelLoadfileTok,      ## loadfile
    fennelLoadstringTok,    ## loadstring
    fennelLocalTok,         ## local
    fennelMacroTok,         ## macro
    fennelMacrodebugTok,    ## macrodebug
    fennelMacroexpandTok,   ## macroexpand
    fennelMacrosTok,        ## macros
    fennelMatchTok,         ## match
    fennelMultiMinussymQuestionTok, ## multi-sym?
    fennelNextTok,          ## next
    fennelNilTok,           ## nil
    fennelNotTok,           ## not
    fennelNotEqualTok,      ## not=
    fennelNumber,           ## number
    fennelOrTok,            ## or
    fennelPackageTok,       ## package
    fennelPairsTok,         ## pairs
    fennelPcallTok,         ## pcall
    fennelPrintTok,         ## print
    fennelRawequalTok,      ## rawequal
    fennelRawgetTok,        ## rawget
    fennelRawlenTok,        ## rawlen
    fennelRawsetTok,        ## rawset
    fennelRequireTok,       ## require
    fennelRequireMinusmacrosTok, ## require-macros
    fennelSelectTok,        ## select
    fennelSequenceQuestionTok, ## sequence?
    fennelSetTok,           ## set
    fennelSetmetatableTok,  ## setmetatable
    fennelStringTok,        ## string
    fennelSymTok,           ## sym
    fennelSymQuestionTok,   ## sym?
    fennelTableTok,         ## table
    fennelTableQuestionTok, ## table?
    fennelTonumberTok,      ## tonumber
    fennelTostringTok,      ## tostring
    fennelTrueTok,          ## true
    fennelTsetTok,          ## tset
    fennelTypeTok,          ## type
    fennelUnpackTok,        ## unpack
    fennelVarTok,           ## var
    fennelVargQuestionTok,  ## varg?
    fennelWhenTok,          ## when
    fennelWhileTok,         ## while
    fennelXpcallTok,        ## xpcall
    fennelLCurlyTok,        ## {
    fennelRCurlyTok,        ## }
    fennelλTok,            ## λ
    fennelSyntaxError        ## Tree-sitter parser syntax error
type
  FennelExternalTok* = enum
    fennelExternField,      ## field
    fennelExternColon        ## colon
type
  TsFennelNode* = distinct TSNode
type
  FennelParser* = distinct PtsParser
proc tsNodeType*(node: TsFennelNode): string
proc kind*(node: TsFennelNode): FennelNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType
    of "assignment":
      fennelAssignment
    of "assignments":
      fennelAssignments
    of "boolean":
      fennelBoolean
    of "do_statement":
      fennelDoStatement
    of "each":
      fennelEach
    of "each_clause":
      fennelEachClause
    of "field_expression":
      fennelFieldExpression
    of "for":
      fennelFor
    of "for_clause":
      fennelForClause
    of "function_call":
      fennelFunctionCall
    of "function_definition":
      fennelFunctionDefinition
    of "global_definition":
      fennelGlobalDefinition
    of "hash_function_definition":
      fennelHashFunctionDefinition
    of "identifier":
      fennelIdentifier
    of "if_statement":
      fennelIfStatement
    of "lambda_definition":
      fennelLambdaDefinition
    of "let_definition":
      fennelLetDefinition
    of "local_definition":
      fennelLocalDefinition
    of "match_statement":
      fennelMatchStatement
    of "multi_value_assignment":
      fennelMultiValueAssignment
    of "nil":
      fennelNil
    of "parameters":
      fennelParameters
    of "program":
      fennelProgram
    of "quoted_value":
      fennelQuotedValue
    of "require":
      fennelRequire
    of "sequential_table":
      fennelSequentialTable
    of "set":
      fennelSet
    of "string":
      fennelString
    of "table":
      fennelTable
    of "tset":
      fennelTset
    of "unquoted_value":
      fennelUnquotedValue
    of "value_list":
      fennelValueList
    of "var_definition":
      fennelVarDefinition
    of "when_statement":
      fennelWhenStatement
    of "while":
      fennelWhile
    of "\"":
      fennelQuoteTok
    of "#":
      fennelHashTok
    of "%":
      fennelPercentTok
    of "\'":
      fennelApostropheTok
    of "(":
      fennelLParTok
    of ")":
      fennelRParTok
    of "*":
      fennelAsteriskTok
    of "+":
      fennelPlusTok
    of ",":
      fennelCommaTok
    of "-":
      fennelMinusTok
    of "->":
      fennelMinusGreaterThanTok
    of "->>":
      fennelMinusDoubleGreaterThanTok
    of "-?>":
      fennelMinusQuestionGreaterThanTok
    of "-?>>":
      fennelMinusQuestionDoubleGreaterThanTok
    of ".":
      fennelDotTok
    of "..":
      fennelDoubleDotTok
    of "...":
      fennelTripleDotTok
    of "/":
      fennelSlashTok
    of "//":
      fennelDoubleSlashTok
    of "<":
      fennelLessThanTok
    of "<=":
      fennelLessThanEqualTok
    of "=":
      fennelEqualTok
    of ">":
      fennelGreaterThanTok
    of ">=":
      fennelGreaterThanEqualTok
    of "[":
      fennelLBrackTok
    of "]":
      fennelRBrackTok
    of "^":
      fennelAccentTok
    of "_ENV":
      fennelENVTok
    of "_G":
      fennelGTok
    of "_VERSION":
      fennelVERSIONTok
    of "`":
      fennelBacktickTok
    of "and":
      fennelAndTok
    of "arg":
      fennelArgTok
    of "assert":
      fennelAssertTok
    of "collectgarbage":
      fennelCollectgarbageTok
    of "comment":
      fennelComment
    of "coroutine":
      fennelCoroutineTok
    of "debug":
      fennelDebugTok
    of "do":
      fennelDoTok
    of "dofile":
      fennelDofileTok
    of "doto":
      fennelDotoTok
    of "error":
      fennelErrorTok
    of "eval-compiler":
      fennelEvalMinuscompilerTok
    of "false":
      fennelFalseTok
    of "field":
      fennelField
    of "fn":
      fennelFnTok
    of "gensym":
      fennelGensymTok
    of "getmetatable":
      fennelGetmetatableTok
    of "global":
      fennelGlobalTok
    of "hashfn":
      fennelHashfnTok
    of "if":
      fennelIfTok
    of "import-macros":
      fennelImportMinusmacrosTok
    of "in-scope?":
      fennelInMinusscopeQuestionTok
    of "include":
      fennelIncludeTok
    of "ipairs":
      fennelIpairsTok
    of "lambda":
      fennelLambdaTok
    of "let":
      fennelLetTok
    of "list":
      fennelListTok
    of "list?":
      fennelListQuestionTok
    of "load":
      fennelLoadTok
    of "loadfile":
      fennelLoadfileTok
    of "loadstring":
      fennelLoadstringTok
    of "local":
      fennelLocalTok
    of "macro":
      fennelMacroTok
    of "macrodebug":
      fennelMacrodebugTok
    of "macroexpand":
      fennelMacroexpandTok
    of "macros":
      fennelMacrosTok
    of "match":
      fennelMatchTok
    of "multi-sym?":
      fennelMultiMinussymQuestionTok
    of "next":
      fennelNextTok
    of "not":
      fennelNotTok
    of "not=":
      fennelNotEqualTok
    of "number":
      fennelNumber
    of "or":
      fennelOrTok
    of "package":
      fennelPackageTok
    of "pairs":
      fennelPairsTok
    of "pcall":
      fennelPcallTok
    of "print":
      fennelPrintTok
    of "rawequal":
      fennelRawequalTok
    of "rawget":
      fennelRawgetTok
    of "rawlen":
      fennelRawlenTok
    of "rawset":
      fennelRawsetTok
    of "require-macros":
      fennelRequireMinusmacrosTok
    of "select":
      fennelSelectTok
    of "sequence?":
      fennelSequenceQuestionTok
    of "setmetatable":
      fennelSetmetatableTok
    of "sym":
      fennelSymTok
    of "sym?":
      fennelSymQuestionTok
    of "table?":
      fennelTableQuestionTok
    of "tonumber":
      fennelTonumberTok
    of "tostring":
      fennelTostringTok
    of "true":
      fennelTrueTok
    of "type":
      fennelTypeTok
    of "unpack":
      fennelUnpackTok
    of "var":
      fennelVarTok
    of "varg?":
      fennelVargQuestionTok
    of "when":
      fennelWhenTok
    of "xpcall":
      fennelXpcallTok
    of "{":
      fennelLCurlyTok
    of "}":
      fennelRCurlyTok
    of "λ":
      fennelλTok
    of "ERROR":
      fennelSyntaxError
    else:
      raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

type
  FennelNode* = HtsNode[TsFennelNode, FennelNodeKind]
func isNil*(node: TsFennelNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsFennelNode; unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

func has*(node: TsFennelNode; idx: int; unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_fennel(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: TsFennelNode): string =
  $ts_node_type(TSNode(node))

proc newTsFennelParser*(): FennelParser =
  result = FennelParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_fennel())

proc parseString*(parser: FennelParser; str: string): TsFennelNode =
  TsFennelNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

proc parseTsFennelString*(str: string): TsFennelNode =
  let parser = newTsFennelParser()
  return parseString(parser, str)

func `$`*(node: TsFennelNode): string =
  if isNil(node):
    "<nil tree>"
  else:
    $node.kind

func `[]`*(node: TsFennelNode; idx: int;
           kind: FennelNodeKind | set[FennelNodeKind]): TsFennelNode =
  assert 0 <= idx and idx < node.len
  result = TsFennelNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind,
             "Child node at index " & $idx & " for node kind " & $node.kind)

proc treeReprTsFennel*(str: string; unnamed: bool = false): string =
  treeRepr[TsFennelNode, FennelNodeKind](parseTsFennelString(str), str, 6,
      unnamed = unnamed)

proc toHtsNode*(node: TsFennelNode; str: ptr string): HtsNode[TsFennelNode,
    FennelNodeKind] =
  toHtsNode[TsFennelNode, FennelNodeKind](node, str)

proc toHtsTree*(node: TsFennelNode; str: ptr string): FennelNode =
  toHtsNode[TsFennelNode, FennelNodeKind](node, str)

proc parseFennelString*(str: ptr string; unnamed: bool = false): FennelNode =
  let parser = newTsFennelParser()
  return toHtsTree[TsFennelNode, FennelNodeKind](parseString(parser, str[]), str)

proc parseFennelString*(str: string; unnamed: bool = false): FennelNode =
  let parser = newTsFennelParser()
  return toHtsTree[TsFennelNode, FennelNodeKind](parseString(parser, str),
      unsafeAddr str, storePtr = false)
