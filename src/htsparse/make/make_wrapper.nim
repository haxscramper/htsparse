import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  MakeNodeKind* = enum
    makeRECIPEPREFIXAssignment       ## RECIPEPREFIX_assignment
    makeVPATHAssignment              ## VPATH_assignment
    makeArchive                      ## archive
    makeArguments                    ## arguments
    makeAutomaticVariable            ## automatic_variable
    makeConcatenation                ## concatenation
    makeConditional                  ## conditional
    makeDefineDirective              ## define_directive
    makeElseDirective                ## else_directive
    makeElsifDirective               ## elsif_directive
    makeExportDirective              ## export_directive
    makeFunctionCall                 ## function_call
    makeIfdefDirective               ## ifdef_directive
    makeIfeqDirective                ## ifeq_directive
    makeIfndefDirective              ## ifndef_directive
    makeIfneqDirective               ## ifneq_directive
    makeIncludeDirective             ## include_directive
    makeList                         ## list
    makeMakefile                     ## makefile
    makeOverrideDirective            ## override_directive
    makePaths                        ## paths
    makePatternList                  ## pattern_list
    makePrerequisites                ## prerequisites
    makePrivateDirective             ## private_directive
    makeRawText                      ## raw_text
    makeRecipe                       ## recipe
    makeRecipeLine                   ## recipe_line
    makeRule                         ## rule
    makeShellAssignment              ## shell_assignment
    makeShellCommand                 ## shell_command
    makeShellFunction                ## shell_function
    makeShellText                    ## shell_text
    makeSubstitutionReference        ## substitution_reference
    makeTargets                      ## targets
    makeText                         ## text
    makeUndefineDirective            ## undefine_directive
    makeUnexportDirective            ## unexport_directive
    makeVariableAssignment           ## variable_assignment
    makeVariableReference            ## variable_reference
    makeVpathDirective               ## vpath_directive
    makeExclamationEqualTok          ## !=
    makeQuoteTok                     ## "
    makeDollarTok                    ## $
    makeDoubleDollarTok              ## $$
    makePercentTok                   ## %
    makeAmpersandColonTok            ## &:
    makeApostropheTok                ## '
    makeLParTok                      ## (
    makeRParTok                      ## )
    makeAsteriskTok                  ## *
    makePlusTok                      ## +
    makePlusEqualTok                 ## +=
    makeCommaTok                     ## ,
    makeMinusTok                     ## -
    makeMinusincludeTok              ## -include
    makeDotRECIPEPREFIXTok           ## .RECIPEPREFIX
    makeSlashTok                     ## /
    makeColonTok                     ## :
    makeDoubleColonTok               ## ::
    makeDoubleColonEqualTok          ## ::=
    makeColonEqualTok                ## :=
    makeSemicolonTok                 ## ;
    makeLessThanTok                  ## <
    makeEqualTok                     ## =
    makeQuestionTok                  ## ?
    makeQuestionEqualTok             ## ?=
    makeAtTok                        ## @
    makeDTok                         ## D
    makeFTok                         ## F
    makeVPATHTok                     ## VPATH
    makeBackslashTok                 ## \
    makeAccentTok                    ## ^
    makeAbspathTok                   ## abspath
    makeAddprefixTok                 ## addprefix
    makeAddsuffixTok                 ## addsuffix
    makeAndTok                       ## and
    makeBasenameTok                  ## basename
    makeCallTok                      ## call
    makeComment                      ## comment
    makeDefineTok                    ## define
    makeDirTok                       ## dir
    makeElseTok                      ## else
    makeEndefTok                     ## endef
    makeEndifTok                     ## endif
    makeErrorTok                     ## error
    makeEscape                       ## escape
    makeEvalTok                      ## eval
    makeExportTok                    ## export
    makeFileTok                      ## file
    makeFilterTok                    ## filter
    makeFilterMinusoutTok            ## filter-out
    makeFindstringTok                ## findstring
    makeFirstwordTok                 ## firstword
    makeFlavorTok                    ## flavor
    makeForeachTok                   ## foreach
    makeIfTok                        ## if
    makeIfdefTok                     ## ifdef
    makeIfeqTok                      ## ifeq
    makeIfndefTok                    ## ifndef
    makeIfneqTok                     ## ifneq
    makeIncludeTok                   ## include
    makeInfoTok                      ## info
    makeJoinTok                      ## join
    makeLastwordTok                  ## lastword
    makeNotdirTok                    ## notdir
    makeOrTok                        ## or
    makeOriginTok                    ## origin
    makeOverrideTok                  ## override
    makePatsubstTok                  ## patsubst
    makePrivateTok                   ## private
    makeRealpathTok                  ## realpath
    makeShellTok                     ## shell
    makeSincludeTok                  ## sinclude
    makeSortTok                      ## sort
    makeStripTok                     ## strip
    makeSubstTok                     ## subst
    makeSuffixTok                    ## suffix
    makeUndefineTok                  ## undefine
    makeUnexportTok                  ## unexport
    makeValueTok                     ## value
    makeVpathTok1                    ## vpath
    makeWarningTok                   ## warning
    makeWildcardTok                  ## wildcard
    makeWordTok                      ## word
    makeWord                         ## word
    makeWordlistTok                  ## wordlist
    makeWordsTok                     ## words
    makeLCurlyTok                    ## {
    makePipeTok                      ## |
    makeRCurlyTok                    ## }
    makeHidConditionalArgsCmp        ## _conditional_args_cmp
    makeHidPrefixedRecipeLine        ## _prefixed_recipe_line
    makeHidOrdinaryRule              ## _ordinary_rule
    makeShellTextWithSplit           ## shell_text_with_split
    makeHidStaticPatternRule         ## _static_pattern_rule
    makeHidFunction                  ## _function
    makeHidRecipeprefix              ## _recipeprefix
    makeHidPrerequisites             ## _prerequisites
    makeHidConditionalDirectives     ## _conditional_directives
    makeHidTargets                   ## _targets
    makeHidRawline                   ## _rawline
    makeHidShellCommand              ## _shell_command
    makeHidTargetOrPatternAssignment ## _target_or_pattern_assignment
    makeHidShellTextWithoutSplit     ## _shell_text_without_split
    makeHidAttachedRecipeLine        ## _attached_recipe_line
    makeHidThing                     ## _thing
    makeHidTargetPattern             ## _target_pattern
    makeHidName                      ## _name
    makeHidVariableDefinition        ## _variable_definition
    makeHidNormalPrerequisites       ## _normal_prerequisites
    makeHidConditionalConsequence    ## _conditional_consequence
    makeHidDirective                 ## _directive
    makeHidPrerequisitesPattern      ## _prerequisites_pattern
    makeHidVariable                  ## _variable
    makeHidOrderOnlyPrerequisites    ## _order_only_prerequisites
    makeHidConditionalArgCmp         ## _conditional_arg_cmp
    makeHidPrimary                   ## _primary
    makeSyntaxError                  ## Tree-sitter parser syntax error

proc strRepr*(kind: MakeNodeKind): string =
  case kind:
    of makeRECIPEPREFIXAssignment:       "RECIPEPREFIX_assignment"
    of makeVPATHAssignment:              "VPATH_assignment"
    of makeArchive:                      "archive"
    of makeArguments:                    "arguments"
    of makeAutomaticVariable:            "automatic_variable"
    of makeConcatenation:                "concatenation"
    of makeConditional:                  "conditional"
    of makeDefineDirective:              "define_directive"
    of makeElseDirective:                "else_directive"
    of makeElsifDirective:               "elsif_directive"
    of makeExportDirective:              "export_directive"
    of makeFunctionCall:                 "function_call"
    of makeIfdefDirective:               "ifdef_directive"
    of makeIfeqDirective:                "ifeq_directive"
    of makeIfndefDirective:              "ifndef_directive"
    of makeIfneqDirective:               "ifneq_directive"
    of makeIncludeDirective:             "include_directive"
    of makeList:                         "list"
    of makeMakefile:                     "makefile"
    of makeOverrideDirective:            "override_directive"
    of makePaths:                        "paths"
    of makePatternList:                  "pattern_list"
    of makePrerequisites:                "prerequisites"
    of makePrivateDirective:             "private_directive"
    of makeRawText:                      "raw_text"
    of makeRecipe:                       "recipe"
    of makeRecipeLine:                   "recipe_line"
    of makeRule:                         "rule"
    of makeShellAssignment:              "shell_assignment"
    of makeShellCommand:                 "shell_command"
    of makeShellFunction:                "shell_function"
    of makeShellText:                    "shell_text"
    of makeSubstitutionReference:        "substitution_reference"
    of makeTargets:                      "targets"
    of makeText:                         "text"
    of makeUndefineDirective:            "undefine_directive"
    of makeUnexportDirective:            "unexport_directive"
    of makeVariableAssignment:           "variable_assignment"
    of makeVariableReference:            "variable_reference"
    of makeVpathDirective:               "vpath_directive"
    of makeExclamationEqualTok:          "!="
    of makeQuoteTok:                     "\""
    of makeDollarTok:                    "$"
    of makeDoubleDollarTok:              "$$"
    of makePercentTok:                   "%"
    of makeAmpersandColonTok:            "&:"
    of makeApostropheTok:                "\'"
    of makeLParTok:                      "("
    of makeRParTok:                      ")"
    of makeAsteriskTok:                  "*"
    of makePlusTok:                      "+"
    of makePlusEqualTok:                 "+="
    of makeCommaTok:                     ","
    of makeMinusTok:                     "-"
    of makeMinusincludeTok:              "-include"
    of makeDotRECIPEPREFIXTok:           ".RECIPEPREFIX"
    of makeSlashTok:                     "/"
    of makeColonTok:                     ":"
    of makeDoubleColonTok:               "::"
    of makeDoubleColonEqualTok:          "::="
    of makeColonEqualTok:                ":="
    of makeSemicolonTok:                 ";"
    of makeLessThanTok:                  "<"
    of makeEqualTok:                     "="
    of makeQuestionTok:                  "?"
    of makeQuestionEqualTok:             "?="
    of makeAtTok:                        "@"
    of makeDTok:                         "D"
    of makeFTok:                         "F"
    of makeVPATHTok:                     "VPATH"
    of makeBackslashTok:                 "\\"
    of makeAccentTok:                    "^"
    of makeAbspathTok:                   "abspath"
    of makeAddprefixTok:                 "addprefix"
    of makeAddsuffixTok:                 "addsuffix"
    of makeAndTok:                       "and"
    of makeBasenameTok:                  "basename"
    of makeCallTok:                      "call"
    of makeComment:                      "comment"
    of makeDefineTok:                    "define"
    of makeDirTok:                       "dir"
    of makeElseTok:                      "else"
    of makeEndefTok:                     "endef"
    of makeEndifTok:                     "endif"
    of makeErrorTok:                     "error"
    of makeEscape:                       "escape"
    of makeEvalTok:                      "eval"
    of makeExportTok:                    "export"
    of makeFileTok:                      "file"
    of makeFilterTok:                    "filter"
    of makeFilterMinusoutTok:            "filter-out"
    of makeFindstringTok:                "findstring"
    of makeFirstwordTok:                 "firstword"
    of makeFlavorTok:                    "flavor"
    of makeForeachTok:                   "foreach"
    of makeIfTok:                        "if"
    of makeIfdefTok:                     "ifdef"
    of makeIfeqTok:                      "ifeq"
    of makeIfndefTok:                    "ifndef"
    of makeIfneqTok:                     "ifneq"
    of makeIncludeTok:                   "include"
    of makeInfoTok:                      "info"
    of makeJoinTok:                      "join"
    of makeLastwordTok:                  "lastword"
    of makeNotdirTok:                    "notdir"
    of makeOrTok:                        "or"
    of makeOriginTok:                    "origin"
    of makeOverrideTok:                  "override"
    of makePatsubstTok:                  "patsubst"
    of makePrivateTok:                   "private"
    of makeRealpathTok:                  "realpath"
    of makeShellTok:                     "shell"
    of makeSincludeTok:                  "sinclude"
    of makeSortTok:                      "sort"
    of makeStripTok:                     "strip"
    of makeSubstTok:                     "subst"
    of makeSuffixTok:                    "suffix"
    of makeUndefineTok:                  "undefine"
    of makeUnexportTok:                  "unexport"
    of makeValueTok:                     "value"
    of makeVpathTok1:                    "vpath"
    of makeWarningTok:                   "warning"
    of makeWildcardTok:                  "wildcard"
    of makeWordTok:                      "word"
    of makeWord:                         "word"
    of makeWordlistTok:                  "wordlist"
    of makeWordsTok:                     "words"
    of makeLCurlyTok:                    "{"
    of makePipeTok:                      "|"
    of makeRCurlyTok:                    "}"
    of makeHidConditionalArgsCmp:        "_conditional_args_cmp"
    of makeHidPrefixedRecipeLine:        "_prefixed_recipe_line"
    of makeHidOrdinaryRule:              "_ordinary_rule"
    of makeShellTextWithSplit:           "shell_text_with_split"
    of makeHidStaticPatternRule:         "_static_pattern_rule"
    of makeHidFunction:                  "_function"
    of makeHidRecipeprefix:              "_recipeprefix"
    of makeHidPrerequisites:             "_prerequisites"
    of makeHidConditionalDirectives:     "_conditional_directives"
    of makeHidTargets:                   "_targets"
    of makeHidRawline:                   "_rawline"
    of makeHidShellCommand:              "_shell_command"
    of makeHidTargetOrPatternAssignment: "_target_or_pattern_assignment"
    of makeHidShellTextWithoutSplit:     "_shell_text_without_split"
    of makeHidAttachedRecipeLine:        "_attached_recipe_line"
    of makeHidThing:                     "_thing"
    of makeHidTargetPattern:             "_target_pattern"
    of makeHidName:                      "_name"
    of makeHidVariableDefinition:        "_variable_definition"
    of makeHidNormalPrerequisites:       "_normal_prerequisites"
    of makeHidConditionalConsequence:    "_conditional_consequence"
    of makeHidDirective:                 "_directive"
    of makeHidPrerequisitesPattern:      "_prerequisites_pattern"
    of makeHidVariable:                  "_variable"
    of makeHidOrderOnlyPrerequisites:    "_order_only_prerequisites"
    of makeHidConditionalArgCmp:         "_conditional_arg_cmp"
    of makeHidPrimary:                   "_primary"
    of makeSyntaxError:                  "ERROR"

type
  TsMakeNode* = distinct TSNode

type
  MakeParser* = distinct PtsParser

const makeAllowedSubnodes*: array[MakeNodeKind, set[MakeNodeKind]] = block:
                                                                       var tmp: array[MakeNodeKind, set[MakeNodeKind]]
                                                                       tmp[makeConcatenation] = {
                                                                                                  makeArchive,
                                                                                                  makeAutomaticVariable,
                                                                                                  makeConcatenation,
                                                                                                  makeFunctionCall,
                                                                                                  makeShellFunction,
                                                                                                  makeSubstitutionReference,
                                                                                                  makeVariableReference,
                                                                                                  makeWord
                                                                                                }
                                                                       tmp[makeConditional] = {makeElseDirective, makeElsifDirective}
                                                                       tmp[makeExportDirective] = {makeVariableAssignment}
                                                                       tmp[makeFunctionCall] = {makeArguments}
                                                                       tmp[makeList] = {
                                                                                         makeArchive,
                                                                                         makeAutomaticVariable,
                                                                                         makeConcatenation,
                                                                                         makeFunctionCall,
                                                                                         makeShellFunction,
                                                                                         makeSubstitutionReference,
                                                                                         makeVariableReference,
                                                                                         makeWord
                                                                                       }
                                                                       tmp[makeMakefile] = {
                                                                                             makeRECIPEPREFIXAssignment,
                                                                                             makeVPATHAssignment,
                                                                                             makeConditional,
                                                                                             makeDefineDirective,
                                                                                             makeExportDirective,
                                                                                             makeFunctionCall,
                                                                                             makeIncludeDirective,
                                                                                             makeOverrideDirective,
                                                                                             makePrivateDirective,
                                                                                             makeRule,
                                                                                             makeShellAssignment,
                                                                                             makeShellFunction,
                                                                                             makeUndefineDirective,
                                                                                             makeUnexportDirective,
                                                                                             makeVariableAssignment,
                                                                                             makeVpathDirective
                                                                                           }
                                                                       tmp[makeOverrideDirective] = {makeDefineDirective, makeUndefineDirective, makeVariableAssignment}
                                                                       tmp[makePaths] = {
                                                                                          makeArchive,
                                                                                          makeAutomaticVariable,
                                                                                          makeConcatenation,
                                                                                          makeFunctionCall,
                                                                                          makeShellFunction,
                                                                                          makeSubstitutionReference,
                                                                                          makeVariableReference,
                                                                                          makeWord
                                                                                        }
                                                                       tmp[makePatternList] = {
                                                                                                makeArchive,
                                                                                                makeAutomaticVariable,
                                                                                                makeConcatenation,
                                                                                                makeFunctionCall,
                                                                                                makeShellFunction,
                                                                                                makeSubstitutionReference,
                                                                                                makeVariableReference,
                                                                                                makeWord
                                                                                              }
                                                                       tmp[makePrerequisites] = {
                                                                                                  makeArchive,
                                                                                                  makeAutomaticVariable,
                                                                                                  makeConcatenation,
                                                                                                  makeFunctionCall,
                                                                                                  makeShellFunction,
                                                                                                  makeSubstitutionReference,
                                                                                                  makeVariableReference,
                                                                                                  makeWord
                                                                                                }
                                                                       tmp[makePrivateDirective] = {makeVariableAssignment}
                                                                       tmp[makeRecipe] = {makeConditional, makeRecipeLine}
                                                                       tmp[makeRecipeLine] = {makeShellText}
                                                                       tmp[makeRule] = {makeRecipe, makeTargets}
                                                                       tmp[makeShellCommand] = {makeAutomaticVariable, makeEscape, makeFunctionCall, makeShellFunction, makeSubstitutionReference, makeVariableReference}
                                                                       tmp[makeShellFunction] = {makeShellCommand}
                                                                       tmp[makeShellText] = {makeAutomaticVariable, makeEscape, makeFunctionCall, makeShellFunction, makeSubstitutionReference, makeVariableReference}
                                                                       tmp[makeTargets] = {
                                                                                            makeArchive,
                                                                                            makeAutomaticVariable,
                                                                                            makeConcatenation,
                                                                                            makeFunctionCall,
                                                                                            makeShellFunction,
                                                                                            makeSubstitutionReference,
                                                                                            makeVariableReference,
                                                                                            makeWord
                                                                                          }
                                                                       tmp[makeText] = {makeAutomaticVariable, makeEscape, makeFunctionCall, makeShellFunction, makeSubstitutionReference, makeVariableReference}
                                                                       tmp[makeVariableReference] = {
                                                                                                      makeArchive,
                                                                                                      makeAutomaticVariable,
                                                                                                      makeConcatenation,
                                                                                                      makeFunctionCall,
                                                                                                      makeShellFunction,
                                                                                                      makeSubstitutionReference,
                                                                                                      makeVariableReference,
                                                                                                      makeWord
                                                                                                    }
                                                                       tmp
const makeTokenKinds*: set[MakeNodeKind] = {
                                             makeExclamationEqualTok,
                                             makeQuoteTok,
                                             makeDollarTok,
                                             makeDoubleDollarTok,
                                             makePercentTok,
                                             makeAmpersandColonTok,
                                             makeApostropheTok,
                                             makeLParTok,
                                             makeRParTok,
                                             makeAsteriskTok,
                                             makePlusTok,
                                             makePlusEqualTok,
                                             makeCommaTok,
                                             makeMinusTok,
                                             makeMinusincludeTok,
                                             makeDotRECIPEPREFIXTok,
                                             makeSlashTok,
                                             makeColonTok,
                                             makeDoubleColonTok,
                                             makeDoubleColonEqualTok,
                                             makeColonEqualTok,
                                             makeSemicolonTok,
                                             makeLessThanTok,
                                             makeEqualTok,
                                             makeQuestionTok,
                                             makeQuestionEqualTok,
                                             makeAtTok,
                                             makeDTok,
                                             makeFTok,
                                             makeVPATHTok,
                                             makeBackslashTok,
                                             makeAccentTok,
                                             makeAbspathTok,
                                             makeAddprefixTok,
                                             makeAddsuffixTok,
                                             makeAndTok,
                                             makeBasenameTok,
                                             makeCallTok,
                                             makeDefineTok,
                                             makeDirTok,
                                             makeElseTok,
                                             makeEndefTok,
                                             makeEndifTok,
                                             makeErrorTok,
                                             makeEvalTok,
                                             makeExportTok,
                                             makeFileTok,
                                             makeFilterTok,
                                             makeFilterMinusoutTok,
                                             makeFindstringTok,
                                             makeFirstwordTok,
                                             makeFlavorTok,
                                             makeForeachTok,
                                             makeIfTok,
                                             makeIfdefTok,
                                             makeIfeqTok,
                                             makeIfndefTok,
                                             makeIfneqTok,
                                             makeIncludeTok,
                                             makeInfoTok,
                                             makeJoinTok,
                                             makeLastwordTok,
                                             makeNotdirTok,
                                             makeOrTok,
                                             makeOriginTok,
                                             makeOverrideTok,
                                             makePatsubstTok,
                                             makePrivateTok,
                                             makeRealpathTok,
                                             makeShellTok,
                                             makeSincludeTok,
                                             makeSortTok,
                                             makeStripTok,
                                             makeSubstTok,
                                             makeSuffixTok,
                                             makeUndefineTok,
                                             makeUnexportTok,
                                             makeValueTok,
                                             makeVpathTok1,
                                             makeWarningTok,
                                             makeWildcardTok,
                                             makeWordTok,
                                             makeWordlistTok,
                                             makeWordsTok,
                                             makeLCurlyTok,
                                             makePipeTok,
                                             makeRCurlyTok
                                           }
const makeHiddenKinds*: set[MakeNodeKind] = {
                                              makeHidConditionalArgsCmp,
                                              makeHidPrefixedRecipeLine,
                                              makeHidOrdinaryRule,
                                              makeShellTextWithSplit,
                                              makeHidStaticPatternRule,
                                              makeHidFunction,
                                              makeHidRecipeprefix,
                                              makeHidPrerequisites,
                                              makeHidConditionalDirectives,
                                              makeHidTargets,
                                              makeHidRawline,
                                              makeHidShellCommand,
                                              makeHidTargetOrPatternAssignment,
                                              makeHidShellTextWithoutSplit,
                                              makeHidAttachedRecipeLine,
                                              makeHidThing,
                                              makeHidTargetPattern,
                                              makeHidName,
                                              makeHidVariableDefinition,
                                              makeHidNormalPrerequisites,
                                              makeHidConditionalConsequence,
                                              makeHidDirective,
                                              makeHidPrerequisitesPattern,
                                              makeHidVariable,
                                              makeHidOrderOnlyPrerequisites,
                                              makeHidConditionalArgCmp,
                                              makeHidPrimary
                                            }
proc tsNodeType*(node: TsMakeNode): string


proc kind*(node: TsMakeNode): MakeNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "RECIPEPREFIX_assignment": makeRECIPEPREFIXAssignment
      of "VPATH_assignment":        makeVPATHAssignment
      of "archive":                 makeArchive
      of "arguments":               makeArguments
      of "automatic_variable":      makeAutomaticVariable
      of "concatenation":           makeConcatenation
      of "conditional":             makeConditional
      of "define_directive":        makeDefineDirective
      of "else_directive":          makeElseDirective
      of "elsif_directive":         makeElsifDirective
      of "export_directive":        makeExportDirective
      of "function_call":           makeFunctionCall
      of "ifdef_directive":         makeIfdefDirective
      of "ifeq_directive":          makeIfeqDirective
      of "ifndef_directive":        makeIfndefDirective
      of "ifneq_directive":         makeIfneqDirective
      of "include_directive":       makeIncludeDirective
      of "list":                    makeList
      of "makefile":                makeMakefile
      of "override_directive":      makeOverrideDirective
      of "paths":                   makePaths
      of "pattern_list":            makePatternList
      of "prerequisites":           makePrerequisites
      of "private_directive":       makePrivateDirective
      of "raw_text":                makeRawText
      of "recipe":                  makeRecipe
      of "recipe_line":             makeRecipeLine
      of "rule":                    makeRule
      of "shell_assignment":        makeShellAssignment
      of "shell_command":           makeShellCommand
      of "shell_function":          makeShellFunction
      of "shell_text":              makeShellText
      of "substitution_reference":  makeSubstitutionReference
      of "targets":                 makeTargets
      of "text":                    makeText
      of "undefine_directive":      makeUndefineDirective
      of "unexport_directive":      makeUnexportDirective
      of "variable_assignment":     makeVariableAssignment
      of "variable_reference":      makeVariableReference
      of "vpath_directive":         makeVpathDirective
      of "!=":                      makeExclamationEqualTok
      of "\"":                      makeQuoteTok
      of "$":                       makeDollarTok
      of "$$":                      makeDoubleDollarTok
      of "%":                       makePercentTok
      of "&:":                      makeAmpersandColonTok
      of "\'":                      makeApostropheTok
      of "(":                       makeLParTok
      of ")":                       makeRParTok
      of "*":                       makeAsteriskTok
      of "+":                       makePlusTok
      of "+=":                      makePlusEqualTok
      of ",":                       makeCommaTok
      of "-":                       makeMinusTok
      of "-include":                makeMinusincludeTok
      of ".RECIPEPREFIX":           makeDotRECIPEPREFIXTok
      of "/":                       makeSlashTok
      of ":":                       makeColonTok
      of "::":                      makeDoubleColonTok
      of "::=":                     makeDoubleColonEqualTok
      of ":=":                      makeColonEqualTok
      of ";":                       makeSemicolonTok
      of "<":                       makeLessThanTok
      of "=":                       makeEqualTok
      of "?":                       makeQuestionTok
      of "?=":                      makeQuestionEqualTok
      of "@":                       makeAtTok
      of "D":                       makeDTok
      of "F":                       makeFTok
      of "VPATH":                   makeVPATHTok
      of "\\":                      makeBackslashTok
      of "^":                       makeAccentTok
      of "abspath":                 makeAbspathTok
      of "addprefix":               makeAddprefixTok
      of "addsuffix":               makeAddsuffixTok
      of "and":                     makeAndTok
      of "basename":                makeBasenameTok
      of "call":                    makeCallTok
      of "comment":                 makeComment
      of "define":                  makeDefineTok
      of "dir":                     makeDirTok
      of "else":                    makeElseTok
      of "endef":                   makeEndefTok
      of "endif":                   makeEndifTok
      of "error":                   makeErrorTok
      of "escape":                  makeEscape
      of "eval":                    makeEvalTok
      of "export":                  makeExportTok
      of "file":                    makeFileTok
      of "filter":                  makeFilterTok
      of "filter-out":              makeFilterMinusoutTok
      of "findstring":              makeFindstringTok
      of "firstword":               makeFirstwordTok
      of "flavor":                  makeFlavorTok
      of "foreach":                 makeForeachTok
      of "if":                      makeIfTok
      of "ifdef":                   makeIfdefTok
      of "ifeq":                    makeIfeqTok
      of "ifndef":                  makeIfndefTok
      of "ifneq":                   makeIfneqTok
      of "include":                 makeIncludeTok
      of "info":                    makeInfoTok
      of "join":                    makeJoinTok
      of "lastword":                makeLastwordTok
      of "notdir":                  makeNotdirTok
      of "or":                      makeOrTok
      of "origin":                  makeOriginTok
      of "override":                makeOverrideTok
      of "patsubst":                makePatsubstTok
      of "private":                 makePrivateTok
      of "realpath":                makeRealpathTok
      of "shell":                   makeShellTok
      of "sinclude":                makeSincludeTok
      of "sort":                    makeSortTok
      of "strip":                   makeStripTok
      of "subst":                   makeSubstTok
      of "suffix":                  makeSuffixTok
      of "undefine":                makeUndefineTok
      of "unexport":                makeUnexportTok
      of "value":                   makeValueTok
      of "vpath":                   makeVpathTok1
      of "warning":                 makeWarningTok
      of "wildcard":                makeWildcardTok
      of "word":                    makeWordTok
      of "wordlist":                makeWordlistTok
      of "words":                   makeWordsTok
      of "{":                       makeLCurlyTok
      of "|":                       makePipeTok
      of "}":                       makeRCurlyTok
      of "ERROR":                   makeSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsMakeNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsMakeNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsMakeNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_make(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsMakeNode): string =
  $ts_node_type(TSNode(node))

proc newTsMakeParser*(): MakeParser =
  result = MakeParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_make())

proc parseString*(parser: MakeParser, str: string): TsMakeNode =
  TsMakeNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsMakeString*(str: string): TsMakeNode =
  let parser = newTsMakeParser()
  return parseString(parser, str)

func `$`*(node: TsMakeNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsMakeNode,
    idx:  int,
    kind: MakeNodeKind | set[MakeNodeKind]
  ): TsMakeNode =
  assert 0 <= idx and idx < node.len
  result = TsMakeNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  MakeNode* = HtsNode[TsMakeNode, MakeNodeKind]


proc treeReprTsMake*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsMakeNode, MakeNodeKind](parseTsMakeString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsMakeNode,
    str:  ptr string
  ): HtsNode[TsMakeNode, MakeNodeKind] =
  toHtsNode[TsMakeNode, MakeNodeKind](node, str)

proc toHtsTree*(node: TsMakeNode, str: ptr string): MakeNode =
  toHtsNode[TsMakeNode, MakeNodeKind](node, str)

proc parseMakeString*(str: ptr string, unnamed: bool = false): MakeNode =
  let parser = newTsMakeParser()
  return toHtsTree[TsMakeNode, MakeNodeKind](parseString(parser, str[]), str)

proc parseMakeString*(str: string, unnamed: bool = false): MakeNode =
  let parser = newTsMakeParser()
  return toHtsTree[TsMakeNode, MakeNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let makeGrammar*: array[MakeNodeKind, HtsRule[MakeNodeKind]] = block:
                                                                 var rules: array[MakeNodeKind, HtsRule[MakeNodeKind]]
                                                                 type
                                                                   K = MakeNodeKind


                                                                 rules[makeVpathDirective] = tsChoice[K](tsSeq[K](tsString[K]("vpath"), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("vpath"), tsSymbol[K](makeWord), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("vpath"), tsSymbol[K](makeWord), tsSymbol[K](makePaths), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeConcatenation] = tsSeq[K](tsSymbol[K](makeHidPrimary), tsRepeat1[K](tsSymbol[K](makeHidPrimary)))
                                                                 rules[makeIfdefDirective] = tsSeq[K](tsString[K]("ifdef"), tsSymbol[K](makeHidPrimary), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeHidConditionalArgsCmp] = tsChoice[K](tsSeq[K](tsString[K]("("), tsChoice[K](tsSymbol[K](makeHidPrimary), tsBlank[K]()), tsString[K](","), tsChoice[K](tsSymbol[K](makeHidPrimary), tsBlank[K]()), tsString[K](")")), tsSeq[K](tsSymbol[K](makeHidConditionalArgCmp), tsSymbol[K](makeHidConditionalArgCmp)))
                                                                 rules[makeHidPrefixedRecipeLine] = tsSeq[K](tsSymbol[K](makeHidRecipeprefix), tsChoice[K](tsSymbol[K](makeRecipeLine), tsBlank[K]()), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeHidOrdinaryRule] = tsSeq[K](tsSymbol[K](makeHidTargets), tsChoice[K](tsString[K](":"), tsString[K]("&:"), tsString[K]("::")), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeHidPrerequisites), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeRecipe), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeVariableAssignment] = tsSeq[K](tsChoice[K](tsSymbol[K](makeHidTargetOrPatternAssignment), tsBlank[K]()), tsSymbol[K](makeHidName), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsString[K]("="), tsString[K](":="), tsString[K]("::="), tsString[K]("?="), tsString[K]("+=")), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeText), tsBlank[K]()), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeOverrideDirective] = tsChoice[K](tsSeq[K](tsString[K]("override"), tsSymbol[K](makeDefineDirective)), tsSeq[K](tsString[K]("override"), tsSymbol[K](makeVariableAssignment)), tsSeq[K](tsString[K]("override"), tsSymbol[K](makeUndefineDirective)))
                                                                 rules[makeShellTextWithSplit] = tsSeq[K](tsSymbol[K](makeHidShellTextWithoutSplit), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r")))
                                                                 rules[makeHidStaticPatternRule] = tsSeq[K](tsSymbol[K](makeHidTargets), tsString[K](":"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsSymbol[K](makeHidTargetPattern), tsString[K](":"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeHidPrerequisitesPattern), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeRecipe), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeElsifDirective] = tsSeq[K](tsString[K]("else"), tsSymbol[K](makeHidConditionalDirectives), tsChoice[K](tsSymbol[K](makeHidConditionalConsequence), tsBlank[K]()))
                                                                 rules[makeHidFunction] = tsChoice[K](tsSymbol[K](makeFunctionCall), tsSymbol[K](makeShellFunction))
                                                                 rules[makeWord] = tsRepeat1[K](tsChoice[K](tsRegex[K]("[a-zA-Z0-9%\\+\\-\\.@_\\*\\?\\/]"), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}")))
                                                                 rules[makeHidRecipeprefix] = tsString[K]("\x09")
                                                                 rules[makeHidPrerequisites] = tsChoice[K](tsSymbol[K](makeHidNormalPrerequisites), tsSeq[K](tsChoice[K](tsSymbol[K](makeHidNormalPrerequisites), tsBlank[K]()), tsString[K]("|"), tsSymbol[K](makeHidOrderOnlyPrerequisites)))
                                                                 rules[makeConditional] = tsSeq[K](tsSymbol[K](makeHidConditionalDirectives), tsChoice[K](tsSymbol[K](makeHidConditionalConsequence), tsBlank[K]()), tsRepeat[K](tsSymbol[K](makeElsifDirective)), tsChoice[K](tsSymbol[K](makeElseDirective), tsBlank[K]()), tsString[K]("endif"), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeIfneqDirective] = tsSeq[K](tsString[K]("ifneq"), tsSymbol[K](makeHidConditionalArgsCmp), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeText] = tsChoice[K](tsSeq[K](tsRepeat1[K](tsChoice[K](tsChoice[K](tsRegex[K]("[^\\$\\(\\)\\n\\r\\\\]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r"))), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")), tsChoice[K](tsRepeat1[K](tsChoice[K](tsChoice[K](tsRegex[K]("[^\\$\\(\\)\\n\\r\\\\]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r"))), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]())))), tsSeq[K](tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")), tsRepeat[K](tsSeq[K](tsChoice[K](tsRepeat1[K](tsChoice[K](tsChoice[K](tsRegex[K]("[^\\$\\(\\)\\n\\r\\\\]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r"))), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")))), tsChoice[K](tsRepeat1[K](tsChoice[K](tsChoice[K](tsRegex[K]("[^\\$\\(\\)\\n\\r\\\\]"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r"))), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]())))
                                                                 rules[makeHidConditionalDirectives] = tsChoice[K](tsSymbol[K](makeIfeqDirective), tsSymbol[K](makeIfneqDirective), tsSymbol[K](makeIfdefDirective), tsSymbol[K](makeIfndefDirective))
                                                                 rules[makeShellFunction] = tsSeq[K](tsChoice[K](tsString[K]("$"), tsString[K]("$$")), tsString[K]("("), tsString[K]("shell"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsSymbol[K](makeHidShellCommand), tsString[K](")"))
                                                                 rules[makeHidTargets] = tsSymbol[K](makeList)
                                                                 rules[makeHidRawline] = tsRegex[K](".*[\\r\\n]+")
                                                                 rules[makeHidShellCommand] = tsSymbol[K](makeText)
                                                                 rules[makeHidTargetOrPatternAssignment] = tsSeq[K](tsSymbol[K](makeList), tsString[K](":"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()))
                                                                 rules[makeHidAttachedRecipeLine] = tsSeq[K](tsString[K](";"), tsChoice[K](tsSymbol[K](makeRecipeLine), tsBlank[K]()))
                                                                 rules[makeHidShellTextWithoutSplit] = tsChoice[K](tsSeq[K](tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\\$\\r\\n\\\\]"), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")), tsChoice[K](tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\\$\\r\\n\\\\]"), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]())))), tsSeq[K](tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")), tsRepeat[K](tsSeq[K](tsChoice[K](tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\\$\\r\\n\\\\]"), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]()), tsChoice[K](tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsString[K]("$$"), tsString[K]("//")))), tsChoice[K](tsRepeat1[K](tsChoice[K](tsRegex[K]("[^\\$\\r\\n\\\\]"), tsRegex[K]("\\\\[abtnvfrE!\"#\\$&\'\\(\\)\\*,;<>\\?\\[\\\\\\]^`{\\|}~]"), tsRegex[K]("\\\\[0-9]{3}"), tsRegex[K]("\\\\[^\\n\\r]"))), tsBlank[K]())))
                                                                 rules[makeDefineDirective] = tsSeq[K](tsString[K]("define"), tsSymbol[K](makeWord), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsChoice[K](tsString[K]("="), tsString[K](":="), tsString[K]("::="), tsString[K]("?="), tsString[K]("+=")), tsBlank[K]()), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsRegex[K]("[\\r\\n]+"), tsChoice[K](tsRepeat1[K](tsSymbol[K](makeHidRawline)), tsBlank[K]()), tsString[K]("endef"), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeUndefineDirective] = tsSeq[K](tsString[K]("undefine"), tsSymbol[K](makeWord), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeUnexportDirective] = tsChoice[K](tsSeq[K](tsString[K]("unexport"), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("unexport"), tsSymbol[K](makeList), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeHidThing] = tsChoice[K](tsSymbol[K](makeRule), tsSymbol[K](makeHidVariableDefinition), tsSymbol[K](makeHidDirective), tsSeq[K](tsSymbol[K](makeHidFunction), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeRecipe] = tsChoice[K](tsSeq[K](tsSymbol[K](makeHidAttachedRecipeLine), tsRegex[K]("[\\r\\n]+"), tsRepeat[K](tsChoice[K](tsSymbol[K](makeConditional), tsSymbol[K](makeHidPrefixedRecipeLine)))), tsSeq[K](tsRegex[K]("[\\r\\n]+"), tsRepeat1[K](tsChoice[K](tsSymbol[K](makeConditional), tsSymbol[K](makeHidPrefixedRecipeLine)))))
                                                                 rules[makeIfeqDirective] = tsSeq[K](tsString[K]("ifeq"), tsSymbol[K](makeHidConditionalArgsCmp), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeVariableReference] = tsSeq[K](tsChoice[K](tsString[K]("$"), tsString[K]("$$")), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("("), tsSymbol[K](makeHidPrimary), tsString[K](")")), tsSeq[K](tsString[K]("{"), tsSymbol[K](makeHidPrimary), tsString[K]("}"))), tsRegex[K](".")))
                                                                 rules[makeIncludeDirective] = tsChoice[K](tsSeq[K](tsString[K]("include"), tsSymbol[K](makeList), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("sinclude"), tsSymbol[K](makeList), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("-include"), tsSymbol[K](makeList), tsRegex[K]("[\\r\\n]+")))
                                                                 rules[makeComment] = tsRegex[K]("#.*")
                                                                 rules[makeHidTargetPattern] = tsSymbol[K](makeList)
                                                                 rules[makeRECIPEPREFIXAssignment] = tsSeq[K](tsString[K](".RECIPEPREFIX"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsString[K]("="), tsString[K](":="), tsString[K]("::="), tsString[K]("?="), tsString[K]("+=")), tsSymbol[K](makeText), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeElseDirective] = tsSeq[K](tsString[K]("else"), tsRegex[K]("[\\r\\n]+"), tsChoice[K](tsSymbol[K](makeHidConditionalConsequence), tsBlank[K]()))
                                                                 rules[makePaths] = tsSeq[K](tsSymbol[K](makeHidPrimary), tsRepeat[K](tsSeq[K](tsChoice[K](tsString[K](":"), tsString[K](";")), tsSymbol[K](makeHidPrimary))))
                                                                 rules[makeArchive] = tsSeq[K](tsSymbol[K](makeWord), tsString[K]("("), tsSymbol[K](makeList), tsString[K](")"))
                                                                 rules[makeHidName] = tsSymbol[K](makeWord)
                                                                 rules[makeHidVariableDefinition] = tsChoice[K](tsSymbol[K](makeVPATHAssignment), tsSymbol[K](makeRECIPEPREFIXAssignment), tsSymbol[K](makeVariableAssignment), tsSymbol[K](makeShellAssignment), tsSymbol[K](makeDefineDirective))
                                                                 rules[makeIfndefDirective] = tsSeq[K](tsString[K]("ifndef"), tsSymbol[K](makeHidPrimary), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeFunctionCall] = tsSeq[K](tsChoice[K](tsString[K]("$"), tsString[K]("$$")), tsString[K]("("), tsChoice[K](tsString[K]("subst"), tsString[K]("patsubst"), tsString[K]("strip"), tsString[K]("findstring"), tsString[K]("filter"), tsString[K]("filter-out"), tsString[K]("sort"), tsString[K]("word"), tsString[K]("words"), tsString[K]("wordlist"), tsString[K]("firstword"), tsString[K]("lastword"), tsString[K]("dir"), tsString[K]("notdir"), tsString[K]("suffix"), tsString[K]("basename"), tsString[K]("addsuffix"), tsString[K]("addprefix"), tsString[K]("join"), tsString[K]("wildcard"), tsString[K]("realpath"), tsString[K]("abspath"), tsString[K]("error"), tsString[K]("warning"), tsString[K]("info"), tsString[K]("origin"), tsString[K]("flavor"), tsString[K]("foreach"), tsString[K]("if"), tsString[K]("or"), tsString[K]("and"), tsString[K]("call"), tsString[K]("eval"), tsString[K]("file"), tsString[K]("value")), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsSymbol[K](makeArguments), tsString[K](")"))
                                                                 rules[makeArguments] = tsSeq[K](tsSymbol[K](makeText), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](makeText))))
                                                                 rules[makeHidNormalPrerequisites] = tsSymbol[K](makeList)
                                                                 rules[makeSubstitutionReference] = tsSeq[K](tsChoice[K](tsString[K]("$"), tsString[K]("$$")), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](makeHidPrimary), tsString[K](":"), tsSymbol[K](makeHidPrimary), tsString[K]("="), tsSymbol[K](makeHidPrimary)), tsString[K](")")), tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](makeHidPrimary), tsString[K](":"), tsSymbol[K](makeHidPrimary), tsString[K]("="), tsSymbol[K](makeHidPrimary)), tsString[K]("}"))))
                                                                 rules[makeMakefile] = tsRepeat[K](tsSymbol[K](makeHidThing))
                                                                 rules[makeHidDirective] = tsChoice[K](tsSymbol[K](makeIncludeDirective), tsSymbol[K](makeVpathDirective), tsSymbol[K](makeExportDirective), tsSymbol[K](makeUnexportDirective), tsSymbol[K](makeOverrideDirective), tsSymbol[K](makeUndefineDirective), tsSymbol[K](makePrivateDirective), tsSymbol[K](makeConditional))
                                                                 rules[makeHidConditionalConsequence] = tsRepeat1[K](tsChoice[K](tsSymbol[K](makeHidThing), tsSymbol[K](makeHidPrefixedRecipeLine)))
                                                                 rules[makeVPATHAssignment] = tsSeq[K](tsString[K]("VPATH"), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsChoice[K](tsString[K]("="), tsString[K](":="), tsString[K]("::="), tsString[K]("?="), tsString[K]("+=")), tsSymbol[K](makePaths), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeRule] = tsChoice[K](tsSymbol[K](makeHidOrdinaryRule), tsSymbol[K](makeHidStaticPatternRule))
                                                                 rules[makeHidPrerequisitesPattern] = tsSymbol[K](makeList)
                                                                 rules[makeHidVariable] = tsChoice[K](tsSymbol[K](makeVariableReference), tsSymbol[K](makeSubstitutionReference), tsSymbol[K](makeAutomaticVariable))
                                                                 rules[makeHidOrderOnlyPrerequisites] = tsSymbol[K](makeList)
                                                                 rules[makePrivateDirective] = tsSeq[K](tsString[K]("private"), tsSymbol[K](makeVariableAssignment))
                                                                 rules[makeHidConditionalArgCmp] = tsChoice[K](tsSeq[K](tsString[K]("\""), tsChoice[K](tsSymbol[K](makeHidPrimary), tsBlank[K]()), tsString[K]("\"")), tsSeq[K](tsString[K]("\'"), tsChoice[K](tsSymbol[K](makeHidPrimary), tsBlank[K]()), tsString[K]("\'")))
                                                                 rules[makeHidPrimary] = tsChoice[K](tsSymbol[K](makeWord), tsSymbol[K](makeArchive), tsSymbol[K](makeHidVariable), tsSymbol[K](makeHidFunction), tsSymbol[K](makeConcatenation))
                                                                 rules[makeList] = tsSeq[K](tsSymbol[K](makeHidPrimary), tsRepeat[K](tsSeq[K](tsChoice[K](tsRegex[K]("[\\t ]+"), tsSeq[K](tsString[K]("\\"), tsRegex[K]("\\r?\\n|\\r"))), tsSymbol[K](makeHidPrimary))), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()))
                                                                 rules[makeRecipeLine] = tsSeq[K](tsChoice[K](tsChoice[K](tsString[K]("@"), tsString[K]("-"), tsString[K]("+")), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](makeShellTextWithSplit), tsRepeat[K](tsSeq[K](tsChoice[K](tsSymbol[K](makeHidRecipeprefix), tsBlank[K]()), tsSymbol[K](makeShellTextWithSplit))), tsChoice[K](tsSymbol[K](makeHidRecipeprefix), tsBlank[K]())), tsBlank[K]()), tsSymbol[K](makeHidShellTextWithoutSplit))
                                                                 rules[makeAutomaticVariable] = tsSeq[K](tsChoice[K](tsString[K]("$"), tsString[K]("$$")), tsChoice[K](tsChoice[K](tsString[K]("@"), tsString[K]("%"), tsString[K]("<"), tsString[K]("?"), tsString[K]("^"), tsString[K]("+"), tsString[K]("/"), tsString[K]("*")), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsChoice[K](tsString[K]("@"), tsString[K]("%"), tsString[K]("<"), tsString[K]("?"), tsString[K]("^"), tsString[K]("+"), tsString[K]("/"), tsString[K]("*")), tsChoice[K](tsChoice[K](tsString[K]("D"), tsString[K]("F")), tsBlank[K]())), tsString[K](")")), tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsString[K]("@"), tsString[K]("%"), tsString[K]("<"), tsString[K]("?"), tsString[K]("^"), tsString[K]("+"), tsString[K]("/"), tsString[K]("*")), tsChoice[K](tsChoice[K](tsString[K]("D"), tsString[K]("F")), tsBlank[K]())), tsString[K]("}")))))
                                                                 rules[makeShellAssignment] = tsSeq[K](tsSymbol[K](makeWord), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsString[K]("!="), tsChoice[K](tsRegex[K]("[\\t ]+"), tsBlank[K]()), tsSymbol[K](makeHidShellCommand), tsRegex[K]("[\\r\\n]+"))
                                                                 rules[makeExportDirective] = tsChoice[K](tsSeq[K](tsString[K]("export"), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("export"), tsSymbol[K](makeList), tsRegex[K]("[\\r\\n]+")), tsSeq[K](tsString[K]("export"), tsSymbol[K](makeVariableAssignment)))
                                                                 rules

