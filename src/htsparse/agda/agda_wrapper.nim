import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  AgdaNodeKind* = enum
    agdaAbstract                   ## abstract
    agdaAtom                       ## atom
    agdaAttribute                  ## attribute
    agdaAttributes                 ## attributes
    agdaBid                        ## bid
    agdaCatchallPragma             ## catchall_pragma
    agdaData                       ## data
    agdaDataName                   ## data_name
    agdaDataSignature              ## data_signature
    agdaDo                         ## do
    agdaDoWhere                    ## do_where
    agdaExpr                       ## expr
    agdaFieldAssignment            ## field_assignment
    agdaFields                     ## fields
    agdaForall                     ## forall
    agdaFunction                   ## function
    agdaFunctionName               ## function_name
    agdaGeneralize                 ## generalize
    agdaHoleName                   ## hole_name
    agdaHoleNames                  ## hole_names
    agdaImportDirective            ## import_directive
    agdaInfix                      ## infix
    agdaInstance                   ## instance
    agdaInteger                    ## integer
    agdaLambda                     ## lambda
    agdaLambdaClause               ## lambda_clause
    agdaLambdaClauseAbsurd         ## lambda_clause_absurd
    agdaLet                        ## let
    agdaLhs                        ## lhs
    agdaLiteral                    ## literal
    agdaMacro                      ## macro
    agdaModule                     ## module
    agdaModuleApplication          ## module_application
    agdaModuleAssignment           ## module_assignment
    agdaModuleMacro                ## module_macro
    agdaModuleName                 ## module_name
    agdaMutual                     ## mutual
    agdaOpen                       ## open
    agdaPattern                    ## pattern
    agdaPostulate                  ## postulate
    agdaPrimitive                  ## primitive
    agdaPrivate                    ## private
    agdaQid                        ## qid
    agdaRecord                     ## record
    agdaRecordAssignments          ## record_assignments
    agdaRecordConstructor          ## record_constructor
    agdaRecordConstructorInstance  ## record_constructor_instance
    agdaRecordDeclarationsBlock    ## record_declarations_block
    agdaRecordEta                  ## record_eta
    agdaRecordInduction            ## record_induction
    agdaRecordName                 ## record_name
    agdaRecordSignature            ## record_signature
    agdaRenaming                   ## renaming
    agdaRewriteEquations           ## rewrite_equations
    agdaRhs                        ## rhs
    agdaSignature                  ## signature
    agdaSourceFile                 ## source_file
    agdaStmt                       ## stmt
    agdaSyntax                     ## syntax
    agdaTypeSignature              ## type_signature
    agdaTypedBinding               ## typed_binding
    agdaUnquoteDecl                ## unquote_decl
    agdaUntypedBinding             ## untyped_binding
    agdaWhere                      ## where
    agdaWithExpressions            ## with_expressions
    agdaHashMinusRCurlyTok         ## #-}
    agdaLParTok                    ## (
    agdaLParPipeTok                ## (|
    agdaRParTok                    ## )
    agdaMinusTok                   ## -
    agdaDotTok                     ## .
    agdaDoubleDotTok               ## ..
    agdaColonTok                   ## :
    agdaSemicolonTok               ## ;
    agdaEqualTok                   ## =
    agdaAtTok                      ## @
    agdaCATCHALLTok                ## CATCHALL
    agdaPropTok                    ## Prop
    agdaPropN                      ## PropN
    agdaSetTok                     ## Set
    agdaSetN                       ## SetN
    agdaUnderscoreTok              ## _
    agdaAbstractTok                ## abstract
    agdaBidTok                     ## bid
    agdaCodataTok                  ## codata
    agdaCoinductiveTok             ## coinductive
    agdaComment                    ## comment
    agdaConstructorTok             ## constructor
    agdaDataTok                    ## data
    agdaDataNameTok                ## data_name
    agdaDoTok                      ## do
    agdaEtaMinusequalityTok        ## eta-equality
    agdaFieldTok                   ## field
    agdaFieldName                  ## field_name
    agdaHidingTok                  ## hiding
    agdaId                         ## id
    agdaImportTok                  ## import
    agdaInTok                      ## in
    agdaInductiveTok               ## inductive
    agdaInfixTok                   ## infix
    agdaInfixlTok                  ## infixl
    agdaInfixrTok                  ## infixr
    agdaInstanceTok                ## instance
    agdaLetTok                     ## let
    agdaMacroTok                   ## macro
    agdaModuleTok                  ## module
    agdaMutualTok                  ## mutual
    agdaNoMinusetaMinusequalityTok ## no-eta-equality
    agdaOpenTok                    ## open
    agdaOverlapTok                 ## overlap
    agdaPatternTok                 ## pattern
    agdaPostulateTok               ## postulate
    agdaPragma                     ## pragma
    agdaPrimitiveTok               ## primitive
    agdaPrivateTok                 ## private
    agdaPublicTok                  ## public
    agdaQidTok                     ## qid
    agdaQuoteTok                   ## quote
    agdaQuoteContextTok            ## quoteContext
    agdaQuoteGoalTok               ## quoteGoal
    agdaQuoteTermTok               ## quoteTerm
    agdaRecordTok                  ## record
    agdaRenamingTok                ## renaming
    agdaRewriteTok                 ## rewrite
    agdaSyntaxTok                  ## syntax
    agdaTacticTok                  ## tactic
    agdaToTok                      ## to
    agdaUnquoteTok                 ## unquote
    agdaUnquoteDeclTok             ## unquoteDecl
    agdaUnquoteDefTok              ## unquoteDef
    agdaUsingTok                   ## using
    agdaVariableTok                ## variable
    agdaWhereTok                   ## where
    agdaWithTok                    ## with
    agdaLCurlyTok                  ## {
    agdaLCurlyMinusHashTok         ## {-#
    agdaDoubleLCurlyTok            ## {{
    agdaPipeTok                    ## |
    agdaPipeRParTok                ## |)
    agdaRCurlyTok                  ## }
    agdaDoubleRCurlyTok            ## }}
    agda⦃Tok                     ## ⦃
    agda⦄Tok                     ## ⦄
    agda⦇Tok                     ## ⦇
    agda⦈Tok                     ## ⦈
    agdaSyntaxError                ## Tree-sitter parser syntax error


proc strRepr*(kind: AgdaNodeKind): string =
  case kind:
    of agdaAbstract:                   "abstract"
    of agdaAtom:                       "atom"
    of agdaAttribute:                  "attribute"
    of agdaAttributes:                 "attributes"
    of agdaBid:                        "bid"
    of agdaCatchallPragma:             "catchall_pragma"
    of agdaData:                       "data"
    of agdaDataName:                   "data_name"
    of agdaDataSignature:              "data_signature"
    of agdaDo:                         "do"
    of agdaDoWhere:                    "do_where"
    of agdaExpr:                       "expr"
    of agdaFieldAssignment:            "field_assignment"
    of agdaFields:                     "fields"
    of agdaForall:                     "forall"
    of agdaFunction:                   "function"
    of agdaFunctionName:               "function_name"
    of agdaGeneralize:                 "generalize"
    of agdaHoleName:                   "hole_name"
    of agdaHoleNames:                  "hole_names"
    of agdaImportDirective:            "import_directive"
    of agdaInfix:                      "infix"
    of agdaInstance:                   "instance"
    of agdaInteger:                    "integer"
    of agdaLambda:                     "lambda"
    of agdaLambdaClause:               "lambda_clause"
    of agdaLambdaClauseAbsurd:         "lambda_clause_absurd"
    of agdaLet:                        "let"
    of agdaLhs:                        "lhs"
    of agdaLiteral:                    "literal"
    of agdaMacro:                      "macro"
    of agdaModule:                     "module"
    of agdaModuleApplication:          "module_application"
    of agdaModuleAssignment:           "module_assignment"
    of agdaModuleMacro:                "module_macro"
    of agdaModuleName:                 "module_name"
    of agdaMutual:                     "mutual"
    of agdaOpen:                       "open"
    of agdaPattern:                    "pattern"
    of agdaPostulate:                  "postulate"
    of agdaPrimitive:                  "primitive"
    of agdaPrivate:                    "private"
    of agdaQid:                        "qid"
    of agdaRecord:                     "record"
    of agdaRecordAssignments:          "record_assignments"
    of agdaRecordConstructor:          "record_constructor"
    of agdaRecordConstructorInstance:  "record_constructor_instance"
    of agdaRecordDeclarationsBlock:    "record_declarations_block"
    of agdaRecordEta:                  "record_eta"
    of agdaRecordInduction:            "record_induction"
    of agdaRecordName:                 "record_name"
    of agdaRecordSignature:            "record_signature"
    of agdaRenaming:                   "renaming"
    of agdaRewriteEquations:           "rewrite_equations"
    of agdaRhs:                        "rhs"
    of agdaSignature:                  "signature"
    of agdaSourceFile:                 "source_file"
    of agdaStmt:                       "stmt"
    of agdaSyntax:                     "syntax"
    of agdaTypeSignature:              "type_signature"
    of agdaTypedBinding:               "typed_binding"
    of agdaUnquoteDecl:                "unquote_decl"
    of agdaUntypedBinding:             "untyped_binding"
    of agdaWhere:                      "where"
    of agdaWithExpressions:            "with_expressions"
    of agdaHashMinusRCurlyTok:         "#-}"
    of agdaLParTok:                    "("
    of agdaLParPipeTok:                "(|"
    of agdaRParTok:                    ")"
    of agdaMinusTok:                   "-"
    of agdaDotTok:                     "."
    of agdaDoubleDotTok:               ".."
    of agdaColonTok:                   ":"
    of agdaSemicolonTok:               ";"
    of agdaEqualTok:                   "="
    of agdaAtTok:                      "@"
    of agdaCATCHALLTok:                "CATCHALL"
    of agdaPropTok:                    "Prop"
    of agdaPropN:                      "PropN"
    of agdaSetTok:                     "Set"
    of agdaSetN:                       "SetN"
    of agdaUnderscoreTok:              "_"
    of agdaAbstractTok:                "abstract"
    of agdaBidTok:                     "bid"
    of agdaCodataTok:                  "codata"
    of agdaCoinductiveTok:             "coinductive"
    of agdaComment:                    "comment"
    of agdaConstructorTok:             "constructor"
    of agdaDataTok:                    "data"
    of agdaDataNameTok:                "data_name"
    of agdaDoTok:                      "do"
    of agdaEtaMinusequalityTok:        "eta-equality"
    of agdaFieldTok:                   "field"
    of agdaFieldName:                  "field_name"
    of agdaHidingTok:                  "hiding"
    of agdaId:                         "id"
    of agdaImportTok:                  "import"
    of agdaInTok:                      "in"
    of agdaInductiveTok:               "inductive"
    of agdaInfixTok:                   "infix"
    of agdaInfixlTok:                  "infixl"
    of agdaInfixrTok:                  "infixr"
    of agdaInstanceTok:                "instance"
    of agdaLetTok:                     "let"
    of agdaMacroTok:                   "macro"
    of agdaModuleTok:                  "module"
    of agdaMutualTok:                  "mutual"
    of agdaNoMinusetaMinusequalityTok: "no-eta-equality"
    of agdaOpenTok:                    "open"
    of agdaOverlapTok:                 "overlap"
    of agdaPatternTok:                 "pattern"
    of agdaPostulateTok:               "postulate"
    of agdaPragma:                     "pragma"
    of agdaPrimitiveTok:               "primitive"
    of agdaPrivateTok:                 "private"
    of agdaPublicTok:                  "public"
    of agdaQidTok:                     "qid"
    of agdaQuoteTok:                   "quote"
    of agdaQuoteContextTok:            "quoteContext"
    of agdaQuoteGoalTok:               "quoteGoal"
    of agdaQuoteTermTok:               "quoteTerm"
    of agdaRecordTok:                  "record"
    of agdaRenamingTok:                "renaming"
    of agdaRewriteTok:                 "rewrite"
    of agdaSyntaxTok:                  "syntax"
    of agdaTacticTok:                  "tactic"
    of agdaToTok:                      "to"
    of agdaUnquoteTok:                 "unquote"
    of agdaUnquoteDeclTok:             "unquoteDecl"
    of agdaUnquoteDefTok:              "unquoteDef"
    of agdaUsingTok:                   "using"
    of agdaVariableTok:                "variable"
    of agdaWhereTok:                   "where"
    of agdaWithTok:                    "with"
    of agdaLCurlyTok:                  "{"
    of agdaLCurlyMinusHashTok:         "{-#"
    of agdaDoubleLCurlyTok:            "{{"
    of agdaPipeTok:                    "|"
    of agdaPipeRParTok:                "|)"
    of agdaRCurlyTok:                  "}"
    of agdaDoubleRCurlyTok:            "}}"
    of agda⦃Tok:                       "\xE2\xA6\x83"
    of agda⦄Tok:                       "\xE2\xA6\x84"
    of agda⦇Tok:                       "\xE2\xA6\x87"
    of agda⦈Tok:                       "\xE2\xA6\x88"
    of agdaSyntaxError:                "ERROR"


type
  AgdaExternalTok* = enum
    agdaExtern_newline ## _newline
    agdaExtern_indent  ## _indent
    agdaExtern_dedent  ## _dedent


type
  TsAgdaNode* = distinct TSNode


type
  AgdaParser* = distinct PtsParser


const agdaAllowedSubnodes*: array[AgdaNodeKind, set[AgdaNodeKind]] = block:
                                                                       var tmp: array[AgdaNodeKind, set[AgdaNodeKind]]
                                                                       tmp[agdaAbstract] = {
                                                                                             agdaAbstract,
                                                                                             agdaData,
                                                                                             agdaDataSignature,
                                                                                             agdaFields,
                                                                                             agdaFunction,
                                                                                             agdaGeneralize,
                                                                                             agdaInfix,
                                                                                             agdaInstance,
                                                                                             agdaMacro,
                                                                                             agdaModule,
                                                                                             agdaModuleMacro,
                                                                                             agdaMutual,
                                                                                             agdaOpen,
                                                                                             agdaPattern,
                                                                                             agdaPostulate,
                                                                                             agdaPragma,
                                                                                             agdaPrimitive,
                                                                                             agdaPrivate,
                                                                                             agdaRecord,
                                                                                             agdaRecordSignature,
                                                                                             agdaSyntax,
                                                                                             agdaUnquoteDecl
                                                                                           }
                                                                       tmp[agdaAtom] = {
                                                                                         agdaPropN,
                                                                                         agdaSetN,
                                                                                         agdaAtom,
                                                                                         agdaExpr,
                                                                                         agdaId,
                                                                                         agdaLiteral,
                                                                                         agdaQid,
                                                                                         agdaRecordAssignments
                                                                                       }
                                                                       tmp[agdaAttribute] = {agdaExpr, agdaLiteral, agdaQid}
                                                                       tmp[agdaAttributes] = {agdaAttribute}
                                                                       tmp[agdaData] = {
                                                                                         agdaAbstract,
                                                                                         agdaData,
                                                                                         agdaDataName,
                                                                                         agdaDataSignature,
                                                                                         agdaExpr,
                                                                                         agdaFields,
                                                                                         agdaFunction,
                                                                                         agdaGeneralize,
                                                                                         agdaInfix,
                                                                                         agdaInstance,
                                                                                         agdaMacro,
                                                                                         agdaModule,
                                                                                         agdaModuleMacro,
                                                                                         agdaMutual,
                                                                                         agdaOpen,
                                                                                         agdaPattern,
                                                                                         agdaPostulate,
                                                                                         agdaPragma,
                                                                                         agdaPrimitive,
                                                                                         agdaPrivate,
                                                                                         agdaRecord,
                                                                                         agdaRecordSignature,
                                                                                         agdaSyntax,
                                                                                         agdaTypedBinding,
                                                                                         agdaUnquoteDecl,
                                                                                         agdaUntypedBinding
                                                                                       }
                                                                       tmp[agdaDataSignature] = {agdaDataName, agdaExpr, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaDo] = {agdaDoWhere, agdaStmt}
                                                                       tmp[agdaDoWhere] = {agdaLambdaClause, agdaLambdaClauseAbsurd}
                                                                       tmp[agdaExpr] = {
                                                                                         agdaAtom,
                                                                                         agdaAttributes,
                                                                                         agdaDo,
                                                                                         agdaExpr,
                                                                                         agdaForall,
                                                                                         agdaId,
                                                                                         agdaLambda,
                                                                                         agdaLet,
                                                                                         agdaTypedBinding
                                                                                       }
                                                                       tmp[agdaFieldAssignment] = {agdaExpr, agdaFieldName}
                                                                       tmp[agdaFields] = {agdaSignature}
                                                                       tmp[agdaForall] = {agdaExpr, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaFunction] = {agdaAttributes, agdaLhs, agdaRhs, agdaWhere}
                                                                       tmp[agdaFunctionName] = {
                                                                                                 agdaAtom,
                                                                                                 agdaDo,
                                                                                                 agdaExpr,
                                                                                                 agdaForall,
                                                                                                 agdaId,
                                                                                                 agdaLambda,
                                                                                                 agdaLet
                                                                                               }
                                                                       tmp[agdaGeneralize] = {agdaSignature}
                                                                       tmp[agdaHoleName] = {agdaBid, agdaId}
                                                                       tmp[agdaHoleNames] = {agdaHoleName}
                                                                       tmp[agdaImportDirective] = {agdaId, agdaRenaming}
                                                                       tmp[agdaInfix] = {agdaBid, agdaInteger}
                                                                       tmp[agdaInstance] = {
                                                                                             agdaAbstract,
                                                                                             agdaData,
                                                                                             agdaDataSignature,
                                                                                             agdaFields,
                                                                                             agdaFunction,
                                                                                             agdaGeneralize,
                                                                                             agdaInfix,
                                                                                             agdaInstance,
                                                                                             agdaMacro,
                                                                                             agdaModule,
                                                                                             agdaModuleMacro,
                                                                                             agdaMutual,
                                                                                             agdaOpen,
                                                                                             agdaPattern,
                                                                                             agdaPostulate,
                                                                                             agdaPragma,
                                                                                             agdaPrimitive,
                                                                                             agdaPrivate,
                                                                                             agdaRecord,
                                                                                             agdaRecordSignature,
                                                                                             agdaSyntax,
                                                                                             agdaUnquoteDecl
                                                                                           }
                                                                       tmp[agdaLambda] = {agdaExpr, agdaLambdaClause, agdaLambdaClauseAbsurd, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaLambdaClause] = {agdaAtom, agdaCatchallPragma, agdaExpr}
                                                                       tmp[agdaLambdaClauseAbsurd] = {
                                                                                                       agdaAtom,
                                                                                                       agdaCatchallPragma,
                                                                                                       agdaDo,
                                                                                                       agdaExpr,
                                                                                                       agdaForall,
                                                                                                       agdaId,
                                                                                                       agdaLambda,
                                                                                                       agdaLet
                                                                                                     }
                                                                       tmp[agdaLet] = {
                                                                                        agdaAbstract,
                                                                                        agdaData,
                                                                                        agdaDataSignature,
                                                                                        agdaExpr,
                                                                                        agdaFields,
                                                                                        agdaFunction,
                                                                                        agdaGeneralize,
                                                                                        agdaInfix,
                                                                                        agdaInstance,
                                                                                        agdaMacro,
                                                                                        agdaModule,
                                                                                        agdaModuleMacro,
                                                                                        agdaMutual,
                                                                                        agdaOpen,
                                                                                        agdaPattern,
                                                                                        agdaPostulate,
                                                                                        agdaPragma,
                                                                                        agdaPrimitive,
                                                                                        agdaPrivate,
                                                                                        agdaRecord,
                                                                                        agdaRecordSignature,
                                                                                        agdaSyntax,
                                                                                        agdaUnquoteDecl
                                                                                      }
                                                                       tmp[agdaLhs] = {
                                                                                        agdaAtom,
                                                                                        agdaDo,
                                                                                        agdaExpr,
                                                                                        agdaForall,
                                                                                        agdaFunctionName,
                                                                                        agdaId,
                                                                                        agdaLambda,
                                                                                        agdaLet,
                                                                                        agdaRewriteEquations,
                                                                                        agdaWithExpressions
                                                                                      }
                                                                       tmp[agdaMacro] = {
                                                                                          agdaAbstract,
                                                                                          agdaData,
                                                                                          agdaDataSignature,
                                                                                          agdaFields,
                                                                                          agdaFunction,
                                                                                          agdaGeneralize,
                                                                                          agdaInfix,
                                                                                          agdaInstance,
                                                                                          agdaMacro,
                                                                                          agdaModule,
                                                                                          agdaModuleMacro,
                                                                                          agdaMutual,
                                                                                          agdaOpen,
                                                                                          agdaPattern,
                                                                                          agdaPostulate,
                                                                                          agdaPragma,
                                                                                          agdaPrimitive,
                                                                                          agdaPrivate,
                                                                                          agdaRecord,
                                                                                          agdaRecordSignature,
                                                                                          agdaSyntax,
                                                                                          agdaUnquoteDecl
                                                                                        }
                                                                       tmp[agdaModule] = {
                                                                                           agdaAbstract,
                                                                                           agdaData,
                                                                                           agdaDataSignature,
                                                                                           agdaFields,
                                                                                           agdaFunction,
                                                                                           agdaGeneralize,
                                                                                           agdaInfix,
                                                                                           agdaInstance,
                                                                                           agdaMacro,
                                                                                           agdaModule,
                                                                                           agdaModuleMacro,
                                                                                           agdaModuleName,
                                                                                           agdaMutual,
                                                                                           agdaOpen,
                                                                                           agdaPattern,
                                                                                           agdaPostulate,
                                                                                           agdaPragma,
                                                                                           agdaPrimitive,
                                                                                           agdaPrivate,
                                                                                           agdaRecord,
                                                                                           agdaRecordSignature,
                                                                                           agdaSyntax,
                                                                                           agdaTypedBinding,
                                                                                           agdaUnquoteDecl,
                                                                                           agdaUntypedBinding
                                                                                         }
                                                                       tmp[agdaModuleApplication] = {agdaAtom, agdaModuleName}
                                                                       tmp[agdaModuleAssignment] = {agdaAtom, agdaImportDirective, agdaModuleName}
                                                                       tmp[agdaModuleMacro] = {agdaImportDirective, agdaModuleApplication, agdaModuleName, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaMutual] = {
                                                                                           agdaAbstract,
                                                                                           agdaData,
                                                                                           agdaDataSignature,
                                                                                           agdaFields,
                                                                                           agdaFunction,
                                                                                           agdaGeneralize,
                                                                                           agdaInfix,
                                                                                           agdaInstance,
                                                                                           agdaMacro,
                                                                                           agdaModule,
                                                                                           agdaModuleMacro,
                                                                                           agdaMutual,
                                                                                           agdaOpen,
                                                                                           agdaPattern,
                                                                                           agdaPostulate,
                                                                                           agdaPragma,
                                                                                           agdaPrimitive,
                                                                                           agdaPrivate,
                                                                                           agdaRecord,
                                                                                           agdaRecordSignature,
                                                                                           agdaSyntax,
                                                                                           agdaUnquoteDecl
                                                                                         }
                                                                       tmp[agdaOpen] = {agdaAtom, agdaImportDirective, agdaModuleName}
                                                                       tmp[agdaPattern] = {agdaExpr, agdaId, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaPostulate] = {
                                                                                              agdaAbstract,
                                                                                              agdaData,
                                                                                              agdaDataSignature,
                                                                                              agdaFields,
                                                                                              agdaFunction,
                                                                                              agdaGeneralize,
                                                                                              agdaInfix,
                                                                                              agdaInstance,
                                                                                              agdaMacro,
                                                                                              agdaModule,
                                                                                              agdaModuleMacro,
                                                                                              agdaMutual,
                                                                                              agdaOpen,
                                                                                              agdaPattern,
                                                                                              agdaPostulate,
                                                                                              agdaPragma,
                                                                                              agdaPrimitive,
                                                                                              agdaPrivate,
                                                                                              agdaRecord,
                                                                                              agdaRecordSignature,
                                                                                              agdaSyntax,
                                                                                              agdaUnquoteDecl
                                                                                            }
                                                                       tmp[agdaPrimitive] = {agdaTypeSignature}
                                                                       tmp[agdaPrivate] = {
                                                                                            agdaAbstract,
                                                                                            agdaData,
                                                                                            agdaDataSignature,
                                                                                            agdaFields,
                                                                                            agdaFunction,
                                                                                            agdaGeneralize,
                                                                                            agdaInfix,
                                                                                            agdaInstance,
                                                                                            agdaMacro,
                                                                                            agdaModule,
                                                                                            agdaModuleMacro,
                                                                                            agdaMutual,
                                                                                            agdaOpen,
                                                                                            agdaPattern,
                                                                                            agdaPostulate,
                                                                                            agdaPragma,
                                                                                            agdaPrimitive,
                                                                                            agdaPrivate,
                                                                                            agdaRecord,
                                                                                            agdaRecordSignature,
                                                                                            agdaSyntax,
                                                                                            agdaUnquoteDecl
                                                                                          }
                                                                       tmp[agdaRecord] = {agdaExpr, agdaRecordDeclarationsBlock, agdaRecordName, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaRecordAssignments] = {
                                                                                                      agdaPropN,
                                                                                                      agdaSetN,
                                                                                                      agdaAtom,
                                                                                                      agdaExpr,
                                                                                                      agdaFieldAssignment,
                                                                                                      agdaId,
                                                                                                      agdaLiteral,
                                                                                                      agdaModuleAssignment,
                                                                                                      agdaQid,
                                                                                                      agdaRecordAssignments
                                                                                                    }
                                                                       tmp[agdaRecordConstructor] = {agdaId}
                                                                       tmp[agdaRecordConstructorInstance] = {agdaRecordConstructor}
                                                                       tmp[agdaRecordDeclarationsBlock] = {
                                                                                                            agdaAbstract,
                                                                                                            agdaData,
                                                                                                            agdaDataSignature,
                                                                                                            agdaFields,
                                                                                                            agdaFunction,
                                                                                                            agdaGeneralize,
                                                                                                            agdaInfix,
                                                                                                            agdaInstance,
                                                                                                            agdaMacro,
                                                                                                            agdaModule,
                                                                                                            agdaModuleMacro,
                                                                                                            agdaMutual,
                                                                                                            agdaOpen,
                                                                                                            agdaPattern,
                                                                                                            agdaPostulate,
                                                                                                            agdaPragma,
                                                                                                            agdaPrimitive,
                                                                                                            agdaPrivate,
                                                                                                            agdaRecord,
                                                                                                            agdaRecordConstructor,
                                                                                                            agdaRecordConstructorInstance,
                                                                                                            agdaRecordEta,
                                                                                                            agdaRecordInduction,
                                                                                                            agdaRecordSignature,
                                                                                                            agdaSyntax,
                                                                                                            agdaUnquoteDecl
                                                                                                          }
                                                                       tmp[agdaRecordName] = {
                                                                                               agdaPropN,
                                                                                               agdaSetN,
                                                                                               agdaAtom,
                                                                                               agdaExpr,
                                                                                               agdaId,
                                                                                               agdaLiteral,
                                                                                               agdaQid,
                                                                                               agdaRecordAssignments
                                                                                             }
                                                                       tmp[agdaRecordSignature] = {agdaExpr, agdaRecordName, agdaTypedBinding, agdaUntypedBinding}
                                                                       tmp[agdaRenaming] = {agdaId}
                                                                       tmp[agdaRewriteEquations] = {
                                                                                                     agdaAtom,
                                                                                                     agdaDo,
                                                                                                     agdaExpr,
                                                                                                     agdaForall,
                                                                                                     agdaId,
                                                                                                     agdaLambda,
                                                                                                     agdaLet
                                                                                                   }
                                                                       tmp[agdaRhs] = {agdaExpr}
                                                                       tmp[agdaSignature] = {agdaAttribute, agdaExpr, agdaFieldName, agdaSignature}
                                                                       tmp[agdaSourceFile] = {
                                                                                               agdaAbstract,
                                                                                               agdaData,
                                                                                               agdaDataSignature,
                                                                                               agdaFields,
                                                                                               agdaFunction,
                                                                                               agdaGeneralize,
                                                                                               agdaInfix,
                                                                                               agdaInstance,
                                                                                               agdaMacro,
                                                                                               agdaModule,
                                                                                               agdaModuleMacro,
                                                                                               agdaMutual,
                                                                                               agdaOpen,
                                                                                               agdaPattern,
                                                                                               agdaPostulate,
                                                                                               agdaPragma,
                                                                                               agdaPrimitive,
                                                                                               agdaPrivate,
                                                                                               agdaRecord,
                                                                                               agdaRecordSignature,
                                                                                               agdaSyntax,
                                                                                               agdaUnquoteDecl
                                                                                             }
                                                                       tmp[agdaStmt] = {
                                                                                         agdaAtom,
                                                                                         agdaAttributes,
                                                                                         agdaDo,
                                                                                         agdaExpr,
                                                                                         agdaForall,
                                                                                         agdaId,
                                                                                         agdaLambda,
                                                                                         agdaLet,
                                                                                         agdaTypedBinding
                                                                                       }
                                                                       tmp[agdaSyntax] = {agdaHoleNames, agdaId}
                                                                       tmp[agdaTypeSignature] = {agdaExpr, agdaFieldName}
                                                                       tmp[agdaTypedBinding] = {
                                                                                                 agdaAbstract,
                                                                                                 agdaAtom,
                                                                                                 agdaAttributes,
                                                                                                 agdaData,
                                                                                                 agdaDataSignature,
                                                                                                 agdaDo,
                                                                                                 agdaExpr,
                                                                                                 agdaFields,
                                                                                                 agdaForall,
                                                                                                 agdaFunction,
                                                                                                 agdaGeneralize,
                                                                                                 agdaId,
                                                                                                 agdaInfix,
                                                                                                 agdaInstance,
                                                                                                 agdaLambda,
                                                                                                 agdaLet,
                                                                                                 agdaMacro,
                                                                                                 agdaModule,
                                                                                                 agdaModuleMacro,
                                                                                                 agdaMutual,
                                                                                                 agdaOpen,
                                                                                                 agdaPattern,
                                                                                                 agdaPostulate,
                                                                                                 agdaPragma,
                                                                                                 agdaPrimitive,
                                                                                                 agdaPrivate,
                                                                                                 agdaQid,
                                                                                                 agdaRecord,
                                                                                                 agdaRecordSignature,
                                                                                                 agdaSyntax,
                                                                                                 agdaUnquoteDecl
                                                                                               }
                                                                       tmp[agdaUnquoteDecl] = {agdaExpr, agdaId}
                                                                       tmp[agdaUntypedBinding] = {
                                                                                                   agdaAtom,
                                                                                                   agdaAttributes,
                                                                                                   agdaBid,
                                                                                                   agdaDo,
                                                                                                   agdaExpr,
                                                                                                   agdaForall,
                                                                                                   agdaId,
                                                                                                   agdaLambda,
                                                                                                   agdaLet,
                                                                                                   agdaQid
                                                                                                 }
                                                                       tmp[agdaWhere] = {
                                                                                          agdaAbstract,
                                                                                          agdaBid,
                                                                                          agdaData,
                                                                                          agdaDataSignature,
                                                                                          agdaFields,
                                                                                          agdaFunction,
                                                                                          agdaGeneralize,
                                                                                          agdaInfix,
                                                                                          agdaInstance,
                                                                                          agdaMacro,
                                                                                          agdaModule,
                                                                                          agdaModuleMacro,
                                                                                          agdaMutual,
                                                                                          agdaOpen,
                                                                                          agdaPattern,
                                                                                          agdaPostulate,
                                                                                          agdaPragma,
                                                                                          agdaPrimitive,
                                                                                          agdaPrivate,
                                                                                          agdaRecord,
                                                                                          agdaRecordSignature,
                                                                                          agdaSyntax,
                                                                                          agdaUnquoteDecl
                                                                                        }
                                                                       tmp[agdaWithExpressions] = {agdaExpr}
                                                                       tmp
const agdaTokenKinds*: set[AgdaNodeKind] = {
                                             agdaHashMinusRCurlyTok,
                                             agdaLParTok,
                                             agdaLParPipeTok,
                                             agdaRParTok,
                                             agdaMinusTok,
                                             agdaDotTok,
                                             agdaDoubleDotTok,
                                             agdaColonTok,
                                             agdaSemicolonTok,
                                             agdaEqualTok,
                                             agdaAtTok,
                                             agdaCATCHALLTok,
                                             agdaPropTok,
                                             agdaSetTok,
                                             agdaUnderscoreTok,
                                             agdaAbstractTok,
                                             agdaBidTok,
                                             agdaCodataTok,
                                             agdaCoinductiveTok,
                                             agdaConstructorTok,
                                             agdaDataTok,
                                             agdaDataNameTok,
                                             agdaDoTok,
                                             agdaEtaMinusequalityTok,
                                             agdaFieldTok,
                                             agdaHidingTok,
                                             agdaImportTok,
                                             agdaInTok,
                                             agdaInductiveTok,
                                             agdaInfixTok,
                                             agdaInfixlTok,
                                             agdaInfixrTok,
                                             agdaInstanceTok,
                                             agdaLetTok,
                                             agdaMacroTok,
                                             agdaModuleTok,
                                             agdaMutualTok,
                                             agdaNoMinusetaMinusequalityTok,
                                             agdaOpenTok,
                                             agdaOverlapTok,
                                             agdaPatternTok,
                                             agdaPostulateTok,
                                             agdaPrimitiveTok,
                                             agdaPrivateTok,
                                             agdaPublicTok,
                                             agdaQidTok,
                                             agdaQuoteTok,
                                             agdaQuoteContextTok,
                                             agdaQuoteGoalTok,
                                             agdaQuoteTermTok,
                                             agdaRecordTok,
                                             agdaRenamingTok,
                                             agdaRewriteTok,
                                             agdaSyntaxTok,
                                             agdaTacticTok,
                                             agdaToTok,
                                             agdaUnquoteTok,
                                             agdaUnquoteDeclTok,
                                             agdaUnquoteDefTok,
                                             agdaUsingTok,
                                             agdaVariableTok,
                                             agdaWhereTok,
                                             agdaWithTok,
                                             agdaLCurlyTok,
                                             agdaLCurlyMinusHashTok,
                                             agdaDoubleLCurlyTok,
                                             agdaPipeTok,
                                             agdaPipeRParTok,
                                             agdaRCurlyTok,
                                             agdaDoubleRCurlyTok,
                                             agda⦃Tok,
                                             agda⦄Tok,
                                             agda⦇Tok,
                                             agda⦈Tok
                                           }

proc tsNodeType*(node: TsAgdaNode): string



proc kind*(node: TsAgdaNode): AgdaNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "abstract":                    agdaAbstract
      of "atom":                        agdaAtom
      of "attribute":                   agdaAttribute
      of "attributes":                  agdaAttributes
      of "bid":                         agdaBid
      of "catchall_pragma":             agdaCatchallPragma
      of "data":                        agdaData
      of "data_name":                   agdaDataName
      of "data_signature":              agdaDataSignature
      of "do":                          agdaDo
      of "do_where":                    agdaDoWhere
      of "expr":                        agdaExpr
      of "field_assignment":            agdaFieldAssignment
      of "fields":                      agdaFields
      of "forall":                      agdaForall
      of "function":                    agdaFunction
      of "function_name":               agdaFunctionName
      of "generalize":                  agdaGeneralize
      of "hole_name":                   agdaHoleName
      of "hole_names":                  agdaHoleNames
      of "import_directive":            agdaImportDirective
      of "infix":                       agdaInfix
      of "instance":                    agdaInstance
      of "integer":                     agdaInteger
      of "lambda":                      agdaLambda
      of "lambda_clause":               agdaLambdaClause
      of "lambda_clause_absurd":        agdaLambdaClauseAbsurd
      of "let":                         agdaLet
      of "lhs":                         agdaLhs
      of "literal":                     agdaLiteral
      of "macro":                       agdaMacro
      of "module":                      agdaModule
      of "module_application":          agdaModuleApplication
      of "module_assignment":           agdaModuleAssignment
      of "module_macro":                agdaModuleMacro
      of "module_name":                 agdaModuleName
      of "mutual":                      agdaMutual
      of "open":                        agdaOpen
      of "pattern":                     agdaPattern
      of "postulate":                   agdaPostulate
      of "primitive":                   agdaPrimitive
      of "private":                     agdaPrivate
      of "qid":                         agdaQid
      of "record":                      agdaRecord
      of "record_assignments":          agdaRecordAssignments
      of "record_constructor":          agdaRecordConstructor
      of "record_constructor_instance": agdaRecordConstructorInstance
      of "record_declarations_block":   agdaRecordDeclarationsBlock
      of "record_eta":                  agdaRecordEta
      of "record_induction":            agdaRecordInduction
      of "record_name":                 agdaRecordName
      of "record_signature":            agdaRecordSignature
      of "renaming":                    agdaRenaming
      of "rewrite_equations":           agdaRewriteEquations
      of "rhs":                         agdaRhs
      of "signature":                   agdaSignature
      of "source_file":                 agdaSourceFile
      of "stmt":                        agdaStmt
      of "syntax":                      agdaSyntax
      of "type_signature":              agdaTypeSignature
      of "typed_binding":               agdaTypedBinding
      of "unquote_decl":                agdaUnquoteDecl
      of "untyped_binding":             agdaUntypedBinding
      of "where":                       agdaWhere
      of "with_expressions":            agdaWithExpressions
      of "#-}":                         agdaHashMinusRCurlyTok
      of "(":                           agdaLParTok
      of "(|":                          agdaLParPipeTok
      of ")":                           agdaRParTok
      of "-":                           agdaMinusTok
      of ".":                           agdaDotTok
      of "..":                          agdaDoubleDotTok
      of ":":                           agdaColonTok
      of ";":                           agdaSemicolonTok
      of "=":                           agdaEqualTok
      of "@":                           agdaAtTok
      of "CATCHALL":                    agdaCATCHALLTok
      of "Prop":                        agdaPropTok
      of "PropN":                       agdaPropN
      of "Set":                         agdaSetTok
      of "SetN":                        agdaSetN
      of "_":                           agdaUnderscoreTok
      of "codata":                      agdaCodataTok
      of "coinductive":                 agdaCoinductiveTok
      of "comment":                     agdaComment
      of "constructor":                 agdaConstructorTok
      of "eta-equality":                agdaEtaMinusequalityTok
      of "field":                       agdaFieldTok
      of "field_name":                  agdaFieldName
      of "hiding":                      agdaHidingTok
      of "id":                          agdaId
      of "import":                      agdaImportTok
      of "in":                          agdaInTok
      of "inductive":                   agdaInductiveTok
      of "infixl":                      agdaInfixlTok
      of "infixr":                      agdaInfixrTok
      of "no-eta-equality":             agdaNoMinusetaMinusequalityTok
      of "overlap":                     agdaOverlapTok
      of "pragma":                      agdaPragma
      of "public":                      agdaPublicTok
      of "quote":                       agdaQuoteTok
      of "quoteContext":                agdaQuoteContextTok
      of "quoteGoal":                   agdaQuoteGoalTok
      of "quoteTerm":                   agdaQuoteTermTok
      of "rewrite":                     agdaRewriteTok
      of "tactic":                      agdaTacticTok
      of "to":                          agdaToTok
      of "unquote":                     agdaUnquoteTok
      of "unquoteDecl":                 agdaUnquoteDeclTok
      of "unquoteDef":                  agdaUnquoteDefTok
      of "using":                       agdaUsingTok
      of "variable":                    agdaVariableTok
      of "with":                        agdaWithTok
      of "{":                           agdaLCurlyTok
      of "{-#":                         agdaLCurlyMinusHashTok
      of "{{":                          agdaDoubleLCurlyTok
      of "|":                           agdaPipeTok
      of "|)":                          agdaPipeRParTok
      of "}":                           agdaRCurlyTok
      of "}}":                          agdaDoubleRCurlyTok
      of "\xE2\xA6\x83":                agda⦃Tok
      of "\xE2\xA6\x84":                agda⦄Tok
      of "\xE2\xA6\x87":                agda⦇Tok
      of "\xE2\xA6\x88":                agda⦈Tok
      of "ERROR":                       agdaSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsAgdaNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsAgdaNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsAgdaNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_agda(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsAgdaNode): string =
  $ts_node_type(TSNode(node))

proc newTsAgdaParser*(): AgdaParser =
  result = AgdaParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_agda())

proc parseString*(parser: AgdaParser, str: string): TsAgdaNode =
  TsAgdaNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsAgdaString*(str: string): TsAgdaNode =
  let parser = newTsAgdaParser()
  return parseString(parser, str)

func `$`*(node: TsAgdaNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsAgdaNode,
    idx:  int,
    kind: AgdaNodeKind | set[AgdaNodeKind]
  ): TsAgdaNode =
  assert 0 <= idx and idx < node.len
  result = TsAgdaNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  AgdaNode* = HtsNode[TsAgdaNode, AgdaNodeKind]


proc treeReprTsAgda*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsAgdaNode, AgdaNodeKind](parseTsAgdaString(str), str, 4, unnamed = unnamed)

proc toHtsNode*(
    node: TsAgdaNode,
    str:  ptr string
  ): HtsNode[TsAgdaNode, AgdaNodeKind] =
  toHtsNode[TsAgdaNode, AgdaNodeKind](node, str)

proc toHtsTree*(node: TsAgdaNode, str: ptr string): AgdaNode =
  toHtsNode[TsAgdaNode, AgdaNodeKind](node, str)

proc parseAgdaString*(str: ptr string, unnamed: bool = false): AgdaNode =
  let parser = newTsAgdaParser()
  return toHtsTree[TsAgdaNode, AgdaNodeKind](parseString(parser, str[]), str)

proc parseAgdaString*(str: string, unnamed: bool = false): AgdaNode =
  let parser = newTsAgdaParser()
  return toHtsTree[TsAgdaNode, AgdaNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


