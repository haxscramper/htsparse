import
  hmisc / wrappers/treesitter
import
  hmisc / core/all
import
  hmisc / types/colorstring
import
  strutils

type
  Embedded_templateNodeKind* = enum
    embedded_templateCode                            ## code                           
    embedded_templateComment                         ## comment                        
    embedded_templateCommentDirective                ## comment_directive              
    embedded_templateContent                         ## content                        
    embedded_templateDirective                       ## directive                      
    embedded_templateGraphqlDirective                ## graphql_directive              
    embedded_templateOutputDirective                 ## output_directive               
    embedded_templateTemplate                        ## template                       
    embedded_templateDoublePercentGreaterThanTok     ## %%>                            
    embedded_templatePercentGreaterThanTok           ## %>                             
    embedded_templateMinusPercentGreaterThanTok      ## -%>                            
    embedded_templateLessThanPercentTok              ## <%                             
    embedded_templateLessThanPercentHashTok          ## <%#                            
    embedded_templateLessThanDoublePercentTok        ## <%%                            
    embedded_templateLessThanPercentMinusTok         ## <%-                            
    embedded_templateLessThanPercentEqualTok         ## <%=                            
    embedded_templateLessThanPercentUnderscoreTok    ## <%_                            
    embedded_templateLessThanPercentgraphqlTok       ## <%graphql                      
    embedded_templateEqualPercentGreaterThanTok      ## =%>                            
    embedded_templateUnderscorePercentGreaterThanTok ## _%>                            
    embedded_templateSyntaxError                     ## Tree-sitter parser syntax error
   

type
  TsEmbedded_templateNode* = distinct TSNode
   

type
  Embedded_templateParser* = distinct PtsParser
   

proc tsNodeType*(node: TsEmbedded_templateNode): string
  
 

proc kind*(
    node: TsEmbedded_templateNode
  ): Embedded_templateNodeKind {.noSideEffect.} = 
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "code":              embedded_templateCode                           
      of "comment":           embedded_templateComment                        
      of "comment_directive": embedded_templateCommentDirective               
      of "content":           embedded_templateContent                        
      of "directive":         embedded_templateDirective                      
      of "graphql_directive": embedded_templateGraphqlDirective               
      of "output_directive":  embedded_templateOutputDirective                
      of "template":          embedded_templateTemplate                       
      of "%%>":               embedded_templateDoublePercentGreaterThanTok    
      of "%>":                embedded_templatePercentGreaterThanTok          
      of "-%>":               embedded_templateMinusPercentGreaterThanTok     
      of "<%":                embedded_templateLessThanPercentTok             
      of "<%#":               embedded_templateLessThanPercentHashTok         
      of "<%%":               embedded_templateLessThanDoublePercentTok       
      of "<%-":               embedded_templateLessThanPercentMinusTok        
      of "<%=":               embedded_templateLessThanPercentEqualTok        
      of "<%_":               embedded_templateLessThanPercentUnderscoreTok   
      of "<%graphql":         embedded_templateLessThanPercentgraphqlTok      
      of "=%>":               embedded_templateEqualPercentGreaterThanTok     
      of "_%>":               embedded_templateUnderscorePercentGreaterThanTok
      of "ERROR":             embedded_templateSyntaxError                    
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")
 

type
  Embedded_templateNode* = HtsNode[TsEmbedded_templateNode, Embedded_templateNodeKind]
   
func isNil*(node: TsEmbedded_templateNode): bool = 
  ts_node_is_null(TSNode(node))
 
func len*(node: TsEmbedded_templateNode, unnamed: bool = false): int = 
  if unnamed:
    int(ts_node_child_count(TSNode(node)))
  
  else:
    int(ts_node_named_child_count(TSNode(node)))
  
 
func has*(
    node:    TsEmbedded_templateNode,
    idx:     int,
    unnamed: bool = false
  ): bool = 
  0 <= idx and idx < node.len(unnamed)
 
proc tree_sitter_embedded_template(): PtsLanguage {.importc, cdecl.}
  
 
proc tsNodeType*(node: TsEmbedded_templateNode): string = 
  $ts_node_type(TSNode(node))
 
proc newTsEmbedded_templateParser*(): Embedded_templateParser = 
  result = Embedded_templateParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_embedded_template())
 
proc parseString*(
    parser: Embedded_templateParser,
    str:    string
  ): TsEmbedded_templateNode = 
  TsEmbedded_templateNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))
 
proc parseTsEmbedded_templateString*(str: string): TsEmbedded_templateNode = 
  let parser = newTsEmbedded_templateParser()
  return parseString(parser, str)
 
func `$`*(node: TsEmbedded_templateNode): string = 
  if isNil(node):
    "<nil tree>"
  
  else:
    $node.kind
  
 
func `[]`*(
    node: TsEmbedded_templateNode,
    idx:  int,
    kind: Embedded_templateNodeKind | set[Embedded_templateNodeKind]
  ): TsEmbedded_templateNode = 
  assert 0 <= idx and idx < node.len
  result = TsEmbedded_templateNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)
 
proc treeReprTsEmbedded_template*(
    str:     string,
    unnamed: bool = false
  ): ColoredText = 
  treeRepr[TsEmbedded_templateNode, Embedded_templateNodeKind](parseTsEmbedded_templateString(str), str, 17, unnamed = unnamed)
 
proc toHtsNode*(
    node: TsEmbedded_templateNode,
    str:  ptr string
  ): HtsNode[TsEmbedded_templateNode, Embedded_templateNodeKind] = 
  toHtsNode[TsEmbedded_templateNode, Embedded_templateNodeKind](node, str)
 
proc toHtsTree*(
    node: TsEmbedded_templateNode,
    str:  ptr string
  ): Embedded_templateNode = 
  toHtsNode[TsEmbedded_templateNode, Embedded_templateNodeKind](node, str)
 
proc parseEmbedded_templateString*(
    str:     ptr string,
    unnamed: bool = false
  ): Embedded_templateNode = 
  let parser = newTsEmbedded_templateParser()
  return toHtsTree[TsEmbedded_templateNode, Embedded_templateNodeKind](parseString(parser, str[]), str)
 
proc parseEmbedded_templateString*(
    str:     string,
    unnamed: bool = false
  ): Embedded_templateNode = 
  let parser = newTsEmbedded_templateParser()
  return toHtsTree[TsEmbedded_templateNode, Embedded_templateNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)
 

