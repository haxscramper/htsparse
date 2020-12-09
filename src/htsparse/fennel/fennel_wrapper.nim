
import
  hparse / htreesitter / htreesitter, sequtils, strutils

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
    fennelSingleQuoteTok,   ## "
    fennelSingleHashTok,    ## #
    fennelSinglePercentTok, ## %
    fennelSingleApostropheTok, ## '
    fennelSingleLParTok,    ## (
    fennelSingleRParTok,    ## )
    fennelSingleAsteriskTok, ## *
    fennelSinglePlusTok,    ## +
    fennelSingleCommaTok,   ## ,
    fennelSingleMinusTok,   ## -
    fennelSingleMinusSingleGreaterThanTok, ## ->
    fennelSingleMinusDoubleGreaterThanTok, ## ->>
    fennelSingleMinusSingleQuestionSingleGreaterThanTok, ## -?>
    fennelSingleMinusSingleQuestionDoubleGreaterThanTok, ## -?>>
    fennelSingleDotTok,     ## .
    fennelDoubleDotTok,     ## ..
    fennelTripleDotTok,     ## ...
    fennelSingleSlashTok,   ## /
    fennelDoubleSlashTok,   ## //
    fennelSingleLessThanTok, ## <
    fennelSingleLessThanSingleEqualTok, ## <=
    fennelSingleEqualTok,   ## =
    fennelSingleGreaterThanTok, ## >
    fennelSingleGreaterThanSingleEqualTok, ## >=
    fennelSingleLBrackTok,  ## [
    fennelSingleRBrackTok,  ## ]
    fennelSingleAccentTok,  ## ^
    fennelENVTok,           ## _ENV
    fennelGTok,             ## _G
    fennelVERSIONTok,       ## _VERSION
    fennelSingleBacktickTok, ## `
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
    fennelEvalSingleMinuscompilerTok, ## eval-compiler
    fennelFalseTok,         ## false
    fennelField,            ## field
    fennelFnTok,            ## fn
    fennelForTok,           ## for
    fennelGensymTok,        ## gensym
    fennelGetmetatableTok,  ## getmetatable
    fennelGlobalTok,        ## global
    fennelHashfnTok,        ## hashfn
    fennelIfTok,            ## if
    fennelImportSingleMinusmacrosTok, ## import-macros
    fennelInSingleMinusscopeSingleQuestionTok, ## in-scope?
    fennelIncludeTok,       ## include
    fennelIpairsTok,        ## ipairs
    fennelLambdaTok,        ## lambda
    fennelLetTok,           ## let
    fennelListTok,          ## list
    fennelListSingleQuestionTok, ## list?
    fennelLoadTok,          ## load
    fennelLoadfileTok,      ## loadfile
    fennelLoadstringTok,    ## loadstring
    fennelLocalTok,         ## local
    fennelMacroTok,         ## macro
    fennelMacrodebugTok,    ## macrodebug
    fennelMacroexpandTok,   ## macroexpand
    fennelMacrosTok,        ## macros
    fennelMatchTok,         ## match
    fennelMultiSingleMinussymSingleQuestionTok, ## multi-sym?
    fennelNextTok,          ## next
    fennelNilTok,           ## nil
    fennelNotTok,           ## not
    fennelNotSingleEqualTok, ## not=
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
    fennelRequireSingleMinusmacrosTok, ## require-macros
    fennelSelectTok,        ## select
    fennelSequenceSingleQuestionTok, ## sequence?
    fennelSetTok,           ## set
    fennelSetmetatableTok,  ## setmetatable
    fennelStringTok,        ## string
    fennelSymTok,           ## sym
    fennelSymSingleQuestionTok, ## sym?
    fennelTableTok,         ## table
    fennelTableSingleQuestionTok, ## table?
    fennelTonumberTok,      ## tonumber
    fennelTostringTok,      ## tostring
    fennelTrueTok,          ## true
    fennelTsetTok,          ## tset
    fennelTypeTok,          ## type
    fennelUnpackTok,        ## unpack
    fennelVarTok,           ## var
    fennelVargSingleQuestionTok, ## varg?
    fennelWhenTok,          ## when
    fennelWhileTok,         ## while
    fennelXpcallTok,        ## xpcall
    fennelSingleLCurlyTok,  ## {
    fennelSingleRCurlyTok,  ## }
    fennelSingleÎSingle»Tok, ## Î»
    fennelSyntaxError        ## Tree-sitter parser syntax error
type
  FennelExternalTok* = enum
    fennelExternField,      ## field
    fennelExternColon        ## colon
type
  FennelNode* = distinct TSNode
type
  FennelParser* = distinct PtsParser
proc tsNodeType*(node: FennelNode): string
proc kind*(node: FennelNode): FennelNodeKind =
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
    fennelSingleQuoteTok
  of "#":
    fennelSingleHashTok
  of "%":
    fennelSinglePercentTok
  of "\'":
    fennelSingleApostropheTok
  of "(":
    fennelSingleLParTok
  of ")":
    fennelSingleRParTok
  of "*":
    fennelSingleAsteriskTok
  of "+":
    fennelSinglePlusTok
  of ",":
    fennelSingleCommaTok
  of "-":
    fennelSingleMinusTok
  of "->":
    fennelSingleMinusSingleGreaterThanTok
  of "->>":
    fennelSingleMinusDoubleGreaterThanTok
  of "-?>":
    fennelSingleMinusSingleQuestionSingleGreaterThanTok
  of "-?>>":
    fennelSingleMinusSingleQuestionDoubleGreaterThanTok
  of ".":
    fennelSingleDotTok
  of "..":
    fennelDoubleDotTok
  of "...":
    fennelTripleDotTok
  of "/":
    fennelSingleSlashTok
  of "//":
    fennelDoubleSlashTok
  of "<":
    fennelSingleLessThanTok
  of "<=":
    fennelSingleLessThanSingleEqualTok
  of "=":
    fennelSingleEqualTok
  of ">":
    fennelSingleGreaterThanTok
  of ">=":
    fennelSingleGreaterThanSingleEqualTok
  of "[":
    fennelSingleLBrackTok
  of "]":
    fennelSingleRBrackTok
  of "^":
    fennelSingleAccentTok
  of "_ENV":
    fennelENVTok
  of "_G":
    fennelGTok
  of "_VERSION":
    fennelVERSIONTok
  of "`":
    fennelSingleBacktickTok
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
    fennelEvalSingleMinuscompilerTok
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
    fennelImportSingleMinusmacrosTok
  of "in-scope?":
    fennelInSingleMinusscopeSingleQuestionTok
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
    fennelListSingleQuestionTok
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
    fennelMultiSingleMinussymSingleQuestionTok
  of "next":
    fennelNextTok
  of "not":
    fennelNotTok
  of "not=":
    fennelNotSingleEqualTok
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
    fennelRequireSingleMinusmacrosTok
  of "select":
    fennelSelectTok
  of "sequence?":
    fennelSequenceSingleQuestionTok
  of "setmetatable":
    fennelSetmetatableTok
  of "sym":
    fennelSymTok
  of "sym?":
    fennelSymSingleQuestionTok
  of "table?":
    fennelTableSingleQuestionTok
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
    fennelVargSingleQuestionTok
  of "when":
    fennelWhenTok
  of "xpcall":
    fennelXpcallTok
  of "{":
    fennelSingleLCurlyTok
  of "}":
    fennelSingleRCurlyTok
  of "Î»":
    fennelSingleÎSingle»Tok
  of "ERROR":
    fennelSyntaxError
  else:
    raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

proc tree_sitter_fennel(): PtsLanguage {.importc, cdecl.}
proc tsNodeType*(node: FennelNode): string =
  $ts_node_type(TSNode(node))

proc newFennelParser*(): FennelParser =
  result = FennelParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_fennel())

proc parseString*(parser: FennelParser; str: string): FennelNode =
  FennelNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil,
      str.cstring, uint32(len(str)))))

func `[]`*(node: FennelNode; idx: int; withUnnamed: bool = false): FennelNode =
  if withUnnamed:
    FennelNode(ts_node_child(TSNode(node), uint32(idx)))
  else:
    FennelNode(ts_node_named_child(TSNode(node), uint32(idx)))

func len*(node: FennelNode; withUnnamed: bool = false): int =
  if withUnnamed:
    int(ts_node_child_count(TSNode(node)))
  else:
    int(ts_node_named_child_count(TSNode(node)))

proc isNil*(node: FennelNode): bool =
  ts_node_is_null(TsNode(node))

iterator items*(node: FennelNode; withUnnamed: bool = false): FennelNode =
  for i in 0 .. node.len(withUnnamed):
    yield node[i, withUnnamed]

proc slice*(node: FennelNode): Slice[int] =
  ts_node_start_byte(TsNode(node)).int ..< ts_node_end_byte(TsNode(node)).int

proc treeRepr*(mainNode: FennelNode; instr: string; withUnnamed: bool = false): string =
  proc aux(node: FennelNode; level: int): seq[string] =
    if not(node.isNil()):
      result = @["  ".repeat(level) & ($node.kind())[6 ..^ 1]]
      if node.len(withUnnamed) == 0:
        result[0] &= " " & instr[node.slice()]
      for subn in items(node, withUnnamed):
        result.add subn.aux(level + 1)

  return aux(mainNode, 0).join("\n")
