import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  FennelNodeKind* = enum
    fennelAssignment                ## assignment
    fennelBinding                   ## binding
    fennelBoolean                   ## boolean
    fennelEach                      ## each
    fennelEachClause                ## each_clause
    fennelFn                        ## fn
    fennelFor                       ## for
    fennelForClause                 ## for_clause
    fennelGlobal                    ## global
    fennelGuardPattern              ## guard_pattern
    fennelHashfn                    ## hashfn
    fennelLambda                    ## lambda
    fennelLet                       ## let
    fennelLetClause                 ## let_clause
    fennelList                      ## list
    fennelLocal                     ## local
    fennelMatch                     ## match
    fennelMultiSymbol               ## multi_symbol
    fennelMultiSymbolMethod         ## multi_symbol_method
    fennelMultiValueAssignment      ## multi_value_assignment
    fennelMultiValueBinding         ## multi_value_binding
    fennelMultiValuePattern         ## multi_value_pattern
    fennelParameters                ## parameters
    fennelProgram                   ## program
    fennelQuote                     ## quote
    fennelQuotedList                ## quoted_list
    fennelQuotedSequentialTable     ## quoted_sequential_table
    fennelQuotedTable               ## quoted_table
    fennelSequentialTable           ## sequential_table
    fennelSequentialTableAssignment ## sequential_table_assignment
    fennelSequentialTableBinding    ## sequential_table_binding
    fennelSequentialTablePattern    ## sequential_table_pattern
    fennelSet                       ## set
    fennelString                    ## string
    fennelTable                     ## table
    fennelTableAssignment           ## table_assignment
    fennelTableBinding              ## table_binding
    fennelTablePattern              ## table_pattern
    fennelUnquote                   ## unquote
    fennelVar                       ## var
    fennelWherePattern              ## where_pattern
    fennelQuoteTok                  ## "
    fennelHashTok                   ## #
    fennelAmpersandTok              ## &
    fennelAmpersandasTok            ## &as
    fennelApostropheTok             ## '
    fennelLParTok                   ## (
    fennelRParTok                   ## )
    fennelCommaTok                  ## ,
    fennelDotTok                    ## .
    fennelColonTok                  ## :
    fennelColonuntilTok             ## :until
    fennelQuestionTok               ## ?
    fennelLBrackTok                 ## [
    fennelRBrackTok                 ## ]
    fennelBacktickTok               ## `
    fennelComment                   ## comment
    fennelEachTok                   ## each
    fennelEscapeSequence            ## escape_sequence
    fennelFalseTok                  ## false
    fennelFnTok                     ## fn
    fennelForTok                    ## for
    fennelGlobalTok                 ## global
    fennelHashfnTok                 ## hashfn
    fennelLambdaTok                 ## lambda
    fennelLetTok                    ## let
    fennelLocalTok                  ## local
    fennelMatchTok                  ## match
    fennelNil                       ## nil
    fennelNumber                    ## number
    fennelOrTok                     ## or
    fennelSetTok                    ## set
    fennelSymbol                    ## symbol
    fennelTrueTok                   ## true
    fennelVarTok                    ## var
    fennelVararg                    ## vararg
    fennelWhereTok                  ## where
    fennelLCurlyTok                 ## {
    fennelRCurlyTok                 ## }
    fennelλTok                     ## λ
    fennelSyntaxError               ## Tree-sitter parser syntax error


type
  TsFennelNode* = distinct TSNode


type
  FennelParser* = distinct PtsParser


proc tsNodeType*(node: TsFennelNode): string



proc kind*(node: TsFennelNode): FennelNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "assignment":                  fennelAssignment
      of "binding":                     fennelBinding
      of "boolean":                     fennelBoolean
      of "each":                        fennelEach
      of "each_clause":                 fennelEachClause
      of "fn":                          fennelFn
      of "for":                         fennelFor
      of "for_clause":                  fennelForClause
      of "global":                      fennelGlobal
      of "guard_pattern":               fennelGuardPattern
      of "hashfn":                      fennelHashfn
      of "lambda":                      fennelLambda
      of "let":                         fennelLet
      of "let_clause":                  fennelLetClause
      of "list":                        fennelList
      of "local":                       fennelLocal
      of "match":                       fennelMatch
      of "multi_symbol":                fennelMultiSymbol
      of "multi_symbol_method":         fennelMultiSymbolMethod
      of "multi_value_assignment":      fennelMultiValueAssignment
      of "multi_value_binding":         fennelMultiValueBinding
      of "multi_value_pattern":         fennelMultiValuePattern
      of "parameters":                  fennelParameters
      of "program":                     fennelProgram
      of "quote":                       fennelQuote
      of "quoted_list":                 fennelQuotedList
      of "quoted_sequential_table":     fennelQuotedSequentialTable
      of "quoted_table":                fennelQuotedTable
      of "sequential_table":            fennelSequentialTable
      of "sequential_table_assignment": fennelSequentialTableAssignment
      of "sequential_table_binding":    fennelSequentialTableBinding
      of "sequential_table_pattern":    fennelSequentialTablePattern
      of "set":                         fennelSet
      of "string":                      fennelString
      of "table":                       fennelTable
      of "table_assignment":            fennelTableAssignment
      of "table_binding":               fennelTableBinding
      of "table_pattern":               fennelTablePattern
      of "unquote":                     fennelUnquote
      of "var":                         fennelVar
      of "where_pattern":               fennelWherePattern
      of "\"":                          fennelQuoteTok
      of "#":                           fennelHashTok
      of "&":                           fennelAmpersandTok
      of "&as":                         fennelAmpersandasTok
      of "\'":                          fennelApostropheTok
      of "(":                           fennelLParTok
      of ")":                           fennelRParTok
      of ",":                           fennelCommaTok
      of ".":                           fennelDotTok
      of ":":                           fennelColonTok
      of ":until":                      fennelColonuntilTok
      of "?":                           fennelQuestionTok
      of "[":                           fennelLBrackTok
      of "]":                           fennelRBrackTok
      of "`":                           fennelBacktickTok
      of "comment":                     fennelComment
      of "escape_sequence":             fennelEscapeSequence
      of "false":                       fennelFalseTok
      of "nil":                         fennelNil
      of "number":                      fennelNumber
      of "or":                          fennelOrTok
      of "symbol":                      fennelSymbol
      of "true":                        fennelTrueTok
      of "vararg":                      fennelVararg
      of "where":                       fennelWhereTok
      of "{":                           fennelLCurlyTok
      of "}":                           fennelRCurlyTok
      of "\xCE\xBB":                    fennelλTok
      of "ERROR":                       fennelSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsFennelNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsFennelNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsFennelNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_fennel(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsFennelNode): string =
  $ts_node_type(TSNode(node))

proc newTsFennelParser*(): FennelParser =
  result = FennelParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_fennel())

proc parseString*(parser: FennelParser, str: string): TsFennelNode =
  TsFennelNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsFennelString*(str: string): TsFennelNode =
  let parser = newTsFennelParser()
  return parseString(parser, str)

func `$`*(node: TsFennelNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsFennelNode, str: string): string =
  var res = addr result
  proc aux(node: TsFennelNode, level: int) =
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


