import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  ElispNodeKind* = enum
    elispBytecode                     ## bytecode
    elispChar                         ## char
    elispFloat                        ## float
    elispFunctionDefinition           ## function_definition
    elispHashTable                    ## hash_table
    elispInteger                      ## integer
    elispList                         ## list
    elispMacroDefinition              ## macro_definition
    elispQuote                        ## quote
    elispSourceFile                   ## source_file
    elispSpecialForm                  ## special_form
    elispStringTextProperties         ## string_text_properties
    elispSymbol                       ## symbol
    elispUnquote                      ## unquote
    elispUnquoteSplice                ## unquote_splice
    elispVector                       ## vector
    elispDoubleHashTok                ## ##
    elispHashApostropheTok            ## #'
    elispHashLParTok                  ## #(
    elispHashLBrackTok                ## #[
    elispHashsLParhashMinustableTok   ## #s(hash-table
    elispApostropheTok                ## '
    elispLParTok                      ## (
    elispRParTok                      ## )
    elispCommaTok                     ## ,
    elispCommaAtTok                   ## ,@
    elispLBrackTok                    ## [
    elispRBrackTok                    ## ]
    elispBacktickTok                  ## `
    elispAndTok                       ## and
    elispByteCompiledFileName         ## byte_compiled_file_name
    elispCatchTok                     ## catch
    elispComment                      ## comment
    elispCondTok                      ## cond
    elispConditionMinuscaseTok        ## condition-case
    elispDefconstTok                  ## defconst
    elispDefmacroTok                  ## defmacro
    elispDefsubstTok                  ## defsubst
    elispDefunTok                     ## defun
    elispDefvarTok                    ## defvar
    elispFunctionTok                  ## function
    elispIfTok                        ## if
    elispInteractiveTok               ## interactive
    elispLambdaTok                    ## lambda
    elispLetTok                       ## let
    elispLetAsteriskTok               ## let*
    elispNilTok                       ## nil
    elispOrTok                        ## or
    elispProg1Tok                     ## prog1
    elispProg2Tok                     ## prog2
    elispPrognTok                     ## progn
    elispQuoteTok                     ## quote
    elispSaveMinuscurentMinusbuferTok ## save-current-buffer
    elispSaveMinusexcursionTok        ## save-excursion
    elispSaveMinusrestrictionTok      ## save-restriction
    elispSetqTok                      ## setq
    elispSetqMinusdefaultTok          ## setq-default
    elispString                       ## string
    elispTTok                         ## t
    elispUnwindMinusprotectTok        ## unwind-protect
    elispWhileTok                     ## while
    elispHidAtom                      ## _atom
    elispHidSexp                      ## _sexp
    elispDot                          ## dot
    elispSyntaxError                  ## Tree-sitter parser syntax error

proc strRepr*(kind: ElispNodeKind): string =
  case kind:
    of elispBytecode:                     "bytecode"
    of elispChar:                         "char"
    of elispFloat:                        "float"
    of elispFunctionDefinition:           "function_definition"
    of elispHashTable:                    "hash_table"
    of elispInteger:                      "integer"
    of elispList:                         "list"
    of elispMacroDefinition:              "macro_definition"
    of elispQuote:                        "quote"
    of elispSourceFile:                   "source_file"
    of elispSpecialForm:                  "special_form"
    of elispStringTextProperties:         "string_text_properties"
    of elispSymbol:                       "symbol"
    of elispUnquote:                      "unquote"
    of elispUnquoteSplice:                "unquote_splice"
    of elispVector:                       "vector"
    of elispDoubleHashTok:                "##"
    of elispHashApostropheTok:            "#\'"
    of elispHashLParTok:                  "#("
    of elispHashLBrackTok:                "#["
    of elispHashsLParhashMinustableTok:   "#s(hash-table"
    of elispApostropheTok:                "\'"
    of elispLParTok:                      "("
    of elispRParTok:                      ")"
    of elispCommaTok:                     ","
    of elispCommaAtTok:                   ",@"
    of elispLBrackTok:                    "["
    of elispRBrackTok:                    "]"
    of elispBacktickTok:                  "`"
    of elispAndTok:                       "and"
    of elispByteCompiledFileName:         "byte_compiled_file_name"
    of elispCatchTok:                     "catch"
    of elispComment:                      "comment"
    of elispCondTok:                      "cond"
    of elispConditionMinuscaseTok:        "condition-case"
    of elispDefconstTok:                  "defconst"
    of elispDefmacroTok:                  "defmacro"
    of elispDefsubstTok:                  "defsubst"
    of elispDefunTok:                     "defun"
    of elispDefvarTok:                    "defvar"
    of elispFunctionTok:                  "function"
    of elispIfTok:                        "if"
    of elispInteractiveTok:               "interactive"
    of elispLambdaTok:                    "lambda"
    of elispLetTok:                       "let"
    of elispLetAsteriskTok:               "let*"
    of elispNilTok:                       "nil"
    of elispOrTok:                        "or"
    of elispProg1Tok:                     "prog1"
    of elispProg2Tok:                     "prog2"
    of elispPrognTok:                     "progn"
    of elispQuoteTok:                     "quote"
    of elispSaveMinuscurentMinusbuferTok: "save-current-buffer"
    of elispSaveMinusexcursionTok:        "save-excursion"
    of elispSaveMinusrestrictionTok:      "save-restriction"
    of elispSetqTok:                      "setq"
    of elispSetqMinusdefaultTok:          "setq-default"
    of elispString:                       "string"
    of elispTTok:                         "t"
    of elispUnwindMinusprotectTok:        "unwind-protect"
    of elispWhileTok:                     "while"
    of elispHidAtom:                      "_atom"
    of elispHidSexp:                      "_sexp"
    of elispDot:                          "dot"
    of elispSyntaxError:                  "ERROR"

type
  TsElispNode* = distinct TSNode

type
  ElispParser* = distinct PtsParser

const elispAllowedSubnodes*: array[ElispNodeKind, set[ElispNodeKind]] = block:
                                                                          var tmp: array[ElispNodeKind, set[ElispNodeKind]]
                                                                          tmp[elispBytecode] = {
                                                                                                 elispByteCompiledFileName,
                                                                                                 elispBytecode,
                                                                                                 elispChar,
                                                                                                 elispFloat,
                                                                                                 elispFunctionDefinition,
                                                                                                 elispHashTable,
                                                                                                 elispInteger,
                                                                                                 elispList,
                                                                                                 elispMacroDefinition,
                                                                                                 elispQuote,
                                                                                                 elispSpecialForm,
                                                                                                 elispString,
                                                                                                 elispStringTextProperties,
                                                                                                 elispSymbol,
                                                                                                 elispUnquote,
                                                                                                 elispUnquoteSplice,
                                                                                                 elispVector
                                                                                               }
                                                                          tmp[elispFunctionDefinition] = {
                                                                                                           elispByteCompiledFileName,
                                                                                                           elispBytecode,
                                                                                                           elispChar,
                                                                                                           elispFloat,
                                                                                                           elispFunctionDefinition,
                                                                                                           elispHashTable,
                                                                                                           elispInteger,
                                                                                                           elispList,
                                                                                                           elispMacroDefinition,
                                                                                                           elispQuote,
                                                                                                           elispSpecialForm,
                                                                                                           elispString,
                                                                                                           elispStringTextProperties,
                                                                                                           elispSymbol,
                                                                                                           elispUnquote,
                                                                                                           elispUnquoteSplice,
                                                                                                           elispVector
                                                                                                         }
                                                                          tmp[elispHashTable] = {
                                                                                                  elispByteCompiledFileName,
                                                                                                  elispBytecode,
                                                                                                  elispChar,
                                                                                                  elispFloat,
                                                                                                  elispFunctionDefinition,
                                                                                                  elispHashTable,
                                                                                                  elispInteger,
                                                                                                  elispList,
                                                                                                  elispMacroDefinition,
                                                                                                  elispQuote,
                                                                                                  elispSpecialForm,
                                                                                                  elispString,
                                                                                                  elispStringTextProperties,
                                                                                                  elispSymbol,
                                                                                                  elispUnquote,
                                                                                                  elispUnquoteSplice,
                                                                                                  elispVector
                                                                                                }
                                                                          tmp[elispList] = {
                                                                                             elispByteCompiledFileName,
                                                                                             elispBytecode,
                                                                                             elispChar,
                                                                                             elispFloat,
                                                                                             elispFunctionDefinition,
                                                                                             elispHashTable,
                                                                                             elispInteger,
                                                                                             elispList,
                                                                                             elispMacroDefinition,
                                                                                             elispQuote,
                                                                                             elispSpecialForm,
                                                                                             elispString,
                                                                                             elispStringTextProperties,
                                                                                             elispSymbol,
                                                                                             elispUnquote,
                                                                                             elispUnquoteSplice,
                                                                                             elispVector
                                                                                           }
                                                                          tmp[elispMacroDefinition] = {
                                                                                                        elispByteCompiledFileName,
                                                                                                        elispBytecode,
                                                                                                        elispChar,
                                                                                                        elispFloat,
                                                                                                        elispFunctionDefinition,
                                                                                                        elispHashTable,
                                                                                                        elispInteger,
                                                                                                        elispList,
                                                                                                        elispMacroDefinition,
                                                                                                        elispQuote,
                                                                                                        elispSpecialForm,
                                                                                                        elispString,
                                                                                                        elispStringTextProperties,
                                                                                                        elispSymbol,
                                                                                                        elispUnquote,
                                                                                                        elispUnquoteSplice,
                                                                                                        elispVector
                                                                                                      }
                                                                          tmp[elispQuote] = {
                                                                                              elispByteCompiledFileName,
                                                                                              elispBytecode,
                                                                                              elispChar,
                                                                                              elispFloat,
                                                                                              elispFunctionDefinition,
                                                                                              elispHashTable,
                                                                                              elispInteger,
                                                                                              elispList,
                                                                                              elispMacroDefinition,
                                                                                              elispQuote,
                                                                                              elispSpecialForm,
                                                                                              elispString,
                                                                                              elispStringTextProperties,
                                                                                              elispSymbol,
                                                                                              elispUnquote,
                                                                                              elispUnquoteSplice,
                                                                                              elispVector
                                                                                            }
                                                                          tmp[elispSourceFile] = {
                                                                                                   elispByteCompiledFileName,
                                                                                                   elispBytecode,
                                                                                                   elispChar,
                                                                                                   elispFloat,
                                                                                                   elispFunctionDefinition,
                                                                                                   elispHashTable,
                                                                                                   elispInteger,
                                                                                                   elispList,
                                                                                                   elispMacroDefinition,
                                                                                                   elispQuote,
                                                                                                   elispSpecialForm,
                                                                                                   elispString,
                                                                                                   elispStringTextProperties,
                                                                                                   elispSymbol,
                                                                                                   elispUnquote,
                                                                                                   elispUnquoteSplice,
                                                                                                   elispVector
                                                                                                 }
                                                                          tmp[elispSpecialForm] = {
                                                                                                    elispByteCompiledFileName,
                                                                                                    elispBytecode,
                                                                                                    elispChar,
                                                                                                    elispFloat,
                                                                                                    elispFunctionDefinition,
                                                                                                    elispHashTable,
                                                                                                    elispInteger,
                                                                                                    elispList,
                                                                                                    elispMacroDefinition,
                                                                                                    elispQuote,
                                                                                                    elispSpecialForm,
                                                                                                    elispString,
                                                                                                    elispStringTextProperties,
                                                                                                    elispSymbol,
                                                                                                    elispUnquote,
                                                                                                    elispUnquoteSplice,
                                                                                                    elispVector
                                                                                                  }
                                                                          tmp[elispStringTextProperties] = {
                                                                                                             elispByteCompiledFileName,
                                                                                                             elispBytecode,
                                                                                                             elispChar,
                                                                                                             elispFloat,
                                                                                                             elispFunctionDefinition,
                                                                                                             elispHashTable,
                                                                                                             elispInteger,
                                                                                                             elispList,
                                                                                                             elispMacroDefinition,
                                                                                                             elispQuote,
                                                                                                             elispSpecialForm,
                                                                                                             elispString,
                                                                                                             elispStringTextProperties,
                                                                                                             elispSymbol,
                                                                                                             elispUnquote,
                                                                                                             elispUnquoteSplice,
                                                                                                             elispVector
                                                                                                           }
                                                                          tmp[elispUnquote] = {
                                                                                                elispByteCompiledFileName,
                                                                                                elispBytecode,
                                                                                                elispChar,
                                                                                                elispFloat,
                                                                                                elispFunctionDefinition,
                                                                                                elispHashTable,
                                                                                                elispInteger,
                                                                                                elispList,
                                                                                                elispMacroDefinition,
                                                                                                elispQuote,
                                                                                                elispSpecialForm,
                                                                                                elispString,
                                                                                                elispStringTextProperties,
                                                                                                elispSymbol,
                                                                                                elispUnquote,
                                                                                                elispUnquoteSplice,
                                                                                                elispVector
                                                                                              }
                                                                          tmp[elispUnquoteSplice] = {
                                                                                                      elispByteCompiledFileName,
                                                                                                      elispBytecode,
                                                                                                      elispChar,
                                                                                                      elispFloat,
                                                                                                      elispFunctionDefinition,
                                                                                                      elispHashTable,
                                                                                                      elispInteger,
                                                                                                      elispList,
                                                                                                      elispMacroDefinition,
                                                                                                      elispQuote,
                                                                                                      elispSpecialForm,
                                                                                                      elispString,
                                                                                                      elispStringTextProperties,
                                                                                                      elispSymbol,
                                                                                                      elispUnquote,
                                                                                                      elispUnquoteSplice,
                                                                                                      elispVector
                                                                                                    }
                                                                          tmp[elispVector] = {
                                                                                               elispByteCompiledFileName,
                                                                                               elispBytecode,
                                                                                               elispChar,
                                                                                               elispFloat,
                                                                                               elispFunctionDefinition,
                                                                                               elispHashTable,
                                                                                               elispInteger,
                                                                                               elispList,
                                                                                               elispMacroDefinition,
                                                                                               elispQuote,
                                                                                               elispSpecialForm,
                                                                                               elispString,
                                                                                               elispStringTextProperties,
                                                                                               elispSymbol,
                                                                                               elispUnquote,
                                                                                               elispUnquoteSplice,
                                                                                               elispVector
                                                                                             }
                                                                          tmp
const elispTokenKinds*: set[ElispNodeKind] = {
                                               elispDoubleHashTok,
                                               elispHashApostropheTok,
                                               elispHashLParTok,
                                               elispHashLBrackTok,
                                               elispHashsLParhashMinustableTok,
                                               elispApostropheTok,
                                               elispLParTok,
                                               elispRParTok,
                                               elispCommaTok,
                                               elispCommaAtTok,
                                               elispLBrackTok,
                                               elispRBrackTok,
                                               elispBacktickTok,
                                               elispAndTok,
                                               elispCatchTok,
                                               elispCondTok,
                                               elispConditionMinuscaseTok,
                                               elispDefconstTok,
                                               elispDefmacroTok,
                                               elispDefsubstTok,
                                               elispDefunTok,
                                               elispDefvarTok,
                                               elispFunctionTok,
                                               elispIfTok,
                                               elispInteractiveTok,
                                               elispLambdaTok,
                                               elispLetTok,
                                               elispLetAsteriskTok,
                                               elispNilTok,
                                               elispOrTok,
                                               elispProg1Tok,
                                               elispProg2Tok,
                                               elispPrognTok,
                                               elispQuoteTok,
                                               elispSaveMinuscurentMinusbuferTok,
                                               elispSaveMinusexcursionTok,
                                               elispSaveMinusrestrictionTok,
                                               elispSetqTok,
                                               elispSetqMinusdefaultTok,
                                               elispTTok,
                                               elispUnwindMinusprotectTok,
                                               elispWhileTok
                                             }
const elispHiddenKinds*: set[ElispNodeKind] = {elispHidAtom, elispHidSexp, elispDot}
proc tsNodeType*(node: TsElispNode): string


proc kind*(node: TsElispNode): ElispNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "bytecode":                elispBytecode
      of "char":                    elispChar
      of "float":                   elispFloat
      of "function_definition":     elispFunctionDefinition
      of "hash_table":              elispHashTable
      of "integer":                 elispInteger
      of "list":                    elispList
      of "macro_definition":        elispMacroDefinition
      of "quote":                   elispQuote
      of "source_file":             elispSourceFile
      of "special_form":            elispSpecialForm
      of "string_text_properties":  elispStringTextProperties
      of "symbol":                  elispSymbol
      of "unquote":                 elispUnquote
      of "unquote_splice":          elispUnquoteSplice
      of "vector":                  elispVector
      of "##":                      elispDoubleHashTok
      of "#\'":                     elispHashApostropheTok
      of "#(":                      elispHashLParTok
      of "#[":                      elispHashLBrackTok
      of "#s(hash-table":           elispHashsLParhashMinustableTok
      of "\'":                      elispApostropheTok
      of "(":                       elispLParTok
      of ")":                       elispRParTok
      of ",":                       elispCommaTok
      of ",@":                      elispCommaAtTok
      of "[":                       elispLBrackTok
      of "]":                       elispRBrackTok
      of "`":                       elispBacktickTok
      of "and":                     elispAndTok
      of "byte_compiled_file_name": elispByteCompiledFileName
      of "catch":                   elispCatchTok
      of "comment":                 elispComment
      of "cond":                    elispCondTok
      of "condition-case":          elispConditionMinuscaseTok
      of "defconst":                elispDefconstTok
      of "defmacro":                elispDefmacroTok
      of "defsubst":                elispDefsubstTok
      of "defun":                   elispDefunTok
      of "defvar":                  elispDefvarTok
      of "function":                elispFunctionTok
      of "if":                      elispIfTok
      of "interactive":             elispInteractiveTok
      of "lambda":                  elispLambdaTok
      of "let":                     elispLetTok
      of "let*":                    elispLetAsteriskTok
      of "nil":                     elispNilTok
      of "or":                      elispOrTok
      of "prog1":                   elispProg1Tok
      of "prog2":                   elispProg2Tok
      of "progn":                   elispPrognTok
      of "save-current-buffer":     elispSaveMinuscurentMinusbuferTok
      of "save-excursion":          elispSaveMinusexcursionTok
      of "save-restriction":        elispSaveMinusrestrictionTok
      of "setq":                    elispSetqTok
      of "setq-default":            elispSetqMinusdefaultTok
      of "string":                  elispString
      of "t":                       elispTTok
      of "unwind-protect":          elispUnwindMinusprotectTok
      of "while":                   elispWhileTok
      of "ERROR":                   elispSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsElispNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsElispNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsElispNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_elisp(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsElispNode): string =
  $ts_node_type(TSNode(node))

proc newTsElispParser*(): ElispParser =
  result = ElispParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_elisp())

proc parseString*(parser: ElispParser, str: string): TsElispNode =
  TsElispNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsElispString*(str: string): TsElispNode =
  let parser = newTsElispParser()
  return parseString(parser, str)

func `$`*(node: TsElispNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsElispNode,
    idx:  int,
    kind: ElispNodeKind | set[ElispNodeKind]
  ): TsElispNode =
  assert 0 <= idx and idx < node.len
  result = TsElispNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  ElispNode* = HtsNode[TsElispNode, ElispNodeKind]


proc treeReprTsElisp*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsElispNode, ElispNodeKind](parseTsElispString(str), str, 5, unnamed = unnamed)

proc toHtsNode*(
    node: TsElispNode,
    str:  ptr string
  ): HtsNode[TsElispNode, ElispNodeKind] =
  toHtsNode[TsElispNode, ElispNodeKind](node, str)

proc toHtsTree*(node: TsElispNode, str: ptr string): ElispNode =
  toHtsNode[TsElispNode, ElispNodeKind](node, str)

proc parseElispString*(str: ptr string, unnamed: bool = false): ElispNode =
  let parser = newTsElispParser()
  return toHtsTree[TsElispNode, ElispNodeKind](parseString(parser, str[]), str)

proc parseElispString*(str: string, unnamed: bool = false): ElispNode =
  let parser = newTsElispParser()
  return toHtsTree[TsElispNode, ElispNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let elispGrammar*: array[ElispNodeKind, HtsRule[ElispNodeKind]] = block:
                                                                    var rules: array[ElispNodeKind, HtsRule[ElispNodeKind]]
                                                                    type
                                                                      K = ElispNodeKind


                                                                    rules[elispFunctionDefinition] = tsSeq[K](tsString[K]("("), tsChoice[K](tsString[K]("defun"), tsString[K]("defsubst")), tsSymbol[K](elispSymbol), tsChoice[K](tsSymbol[K](elispHidSexp), tsBlank[K]()), tsChoice[K](tsSymbol[K](elispString), tsBlank[K]()), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K](")"))
                                                                    rules[elispSourceFile] = tsRepeat[K](tsSymbol[K](elispHidSexp))
                                                                    rules[elispHidSexp] = tsChoice[K](tsSymbol[K](elispSpecialForm), tsSymbol[K](elispFunctionDefinition), tsSymbol[K](elispMacroDefinition), tsSymbol[K](elispList), tsSymbol[K](elispVector), tsSymbol[K](elispHashTable), tsSymbol[K](elispBytecode), tsSymbol[K](elispStringTextProperties), tsSymbol[K](elispHidAtom), tsSymbol[K](elispQuote), tsSymbol[K](elispUnquoteSplice), tsSymbol[K](elispUnquote))
                                                                    rules[elispChar] = tsChoice[K](tsRegex[K]("\\?(\\\\.|.)"), tsRegex[K]("\\?\\\\N\\{[^}]+\\}"), tsRegex[K]("\\?\\\\u[0-9a-fA-F]{4}"), tsRegex[K]("\\?\\\\U[0-9a-fA-F]{8}"), tsRegex[K]("\\?\\\\x[0-9a-fA-F]+"), tsRegex[K]("\\?\\\\[0-7]{1,3}"), tsRegex[K]("\\?(\\\\(([CMSHsA]-)|\\^))+(\\\\;|.)"), tsRegex[K]("\\?\\\\M-\\\\[0-9]{1,3}"))
                                                                    rules[elispSymbol] = tsChoice[K](tsString[K]("nil"), tsString[K]("t"), tsString[K]("defun"), tsString[K]("defsubst"), tsString[K]("defmacro"), tsRegex[K]("\\\\(`|\'|,)"), tsRegex[K]("([^?# \\n\\s\\f()\\[\\]\'`,\\\\\";]|\\\\.)([^# \\n\\s\\f()\\[\\]\'`,\\\\\";]|\\\\.)*"), tsString[K]("##"))
                                                                    rules[elispByteCompiledFileName] = tsString[K]("#$")
                                                                    rules[elispComment] = tsRegex[K](";.*")
                                                                    rules[elispMacroDefinition] = tsSeq[K](tsString[K]("("), tsString[K]("defmacro"), tsSymbol[K](elispSymbol), tsChoice[K](tsSymbol[K](elispHidSexp), tsBlank[K]()), tsChoice[K](tsSymbol[K](elispString), tsBlank[K]()), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K](")"))
                                                                    rules[elispHashTable] = tsSeq[K](tsString[K]("#s(hash-table"), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K](")"))
                                                                    rules[elispBytecode] = tsSeq[K](tsString[K]("#["), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K]("]"))
                                                                    rules[elispQuote] = tsSeq[K](tsChoice[K](tsString[K]("#\'"), tsString[K]("\'"), tsString[K]("`")), tsSymbol[K](elispHidSexp))
                                                                    rules[elispSpecialForm] = tsSeq[K](tsString[K]("("), tsChoice[K](tsString[K]("and"), tsString[K]("catch"), tsString[K]("cond"), tsString[K]("condition-case"), tsString[K]("defconst"), tsString[K]("defvar"), tsString[K]("function"), tsString[K]("if"), tsString[K]("interactive"), tsString[K]("lambda"), tsString[K]("let"), tsString[K]("let*"), tsString[K]("or"), tsString[K]("prog1"), tsString[K]("prog2"), tsString[K]("progn"), tsString[K]("quote"), tsString[K]("save-current-buffer"), tsString[K]("save-excursion"), tsString[K]("save-restriction"), tsString[K]("setq"), tsString[K]("setq-default"), tsString[K]("unwind-protect"), tsString[K]("while")), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K](")"))
                                                                    rules[elispDot] = tsString[K](".")
                                                                    rules[elispHidAtom] = tsChoice[K](tsSymbol[K](elispFloat), tsSymbol[K](elispInteger), tsSymbol[K](elispChar), tsSymbol[K](elispString), tsSymbol[K](elispByteCompiledFileName), tsSymbol[K](elispSymbol))
                                                                    rules[elispFloat] = tsChoice[K](tsRegex[K]("[+-]?[0-9]*\\.[0-9]+"), tsRegex[K]("[+-]?[0-9]+[eE][0-9]+"), tsRegex[K]("[+-]?[0-9]*\\.[0-9]+[eE][0-9]+"), tsRegex[K]("-?1.0[eE]\\+INF"), tsRegex[K]("-?0.0[eE]\\+NaN"))
                                                                    rules[elispInteger] = tsChoice[K](tsRegex[K]("[+-]?[0-9]+\\.?"), tsRegex[K]("#([box]|[0-9][0-9]?r)[0-9a-zA-Z]"))
                                                                    rules[elispUnquote] = tsSeq[K](tsString[K](","), tsSymbol[K](elispHidSexp))
                                                                    rules[elispString] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\"\\\\]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("(.|\\n)")))), tsString[K]("\""))
                                                                    rules[elispUnquoteSplice] = tsSeq[K](tsString[K](",@"), tsSymbol[K](elispHidSexp))
                                                                    rules[elispList] = tsSeq[K](tsString[K]("("), tsChoice[K](tsRepeat[K](tsSymbol[K](elispHidSexp))), tsString[K](")"))
                                                                    rules[elispStringTextProperties] = tsSeq[K](tsString[K]("#("), tsSymbol[K](elispString), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K](")"))
                                                                    rules[elispVector] = tsSeq[K](tsString[K]("["), tsRepeat[K](tsSymbol[K](elispHidSexp)), tsString[K]("]"))
                                                                    rules

