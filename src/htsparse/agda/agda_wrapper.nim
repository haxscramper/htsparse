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
    agdaHidUnderscoreTok           ## _
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
    agdaHidDoStmt                  ## _do_stmt
    agdaHidNewline                 ## _newline
    agdaHidDeclarationBlock        ## _declaration_block
    agdaHidWithExprs               ## _with_exprs
    agdaHidLambdaClauses           ## _lambda_clauses
    agdaHidModalArgIds             ## _modal_arg_ids
    agdaHidFieldName               ## _field_name
    agdaHidRecordDirective         ## _record_directive
    agdaHidAtomCurly               ## _atom_curly
    agdaHidFieldNames              ## _field_names
    agdaHidTypedBindings           ## _typed_bindings
    agdaHidApplicationStmt         ## _application_stmt
    agdaHidSignatureBlock          ## _signature_block
    agdaHidLambdaBindings          ## _lambda_bindings
    agdaHidArgIds                  ## _arg_ids
    agdaHidIndent                  ## _indent
    agdaLhsDecl                    ## lhs_decl
    agdaHidLetBody                 ## _let_body
    agdaHidDedent                  ## _dedent
    agdaHidRecordAssignments       ## _record_assignments
    agdaHidCommaImportNames        ## _comma_import_names
    agdaString                     ## string
    agdaHidSimpleHole              ## _simple_hole
    agdaLetInDo                    ## let_in_do
    agdaHidAtomNoCurly             ## _atom_no_curly
    agdaHidSimpleTopHole           ## _simple_top_hole
    agdaLhsDefn                    ## lhs_defn
    agdaHidTypeSignatureBlock      ## _type_signature_block
    agdaHidMaybeDottedIds          ## _maybe_dotted_ids
    agdaHidMaybeDottedId           ## _maybe_dotted_id
    agdaHidBindingIdsAndAbsurds    ## _binding_ids_and_absurds
    agdaHidApplication             ## _application
    agdaRhsDecl                    ## rhs_decl
    agdaHidTypedUntypedBindings    ## _typed_untyped_bindings
    agdaHidARROW                   ## _ARROW
    agdaHidExpr2Stmt               ## _expr2_stmt
    agdaHidImportDirectives        ## _import_directives
    agdaRhsDefn                    ## rhs_defn
    agdaHidAtoms                   ## _atoms
    agdaFieldAssignments           ## field_assignments
    agdaHidWithExprsStmt           ## _with_exprs_stmt
    agdaHidExprOrAttr              ## _expr_or_attr
    agdaHidLambdaClauseMaybeAbsurd ## _lambda_clause_maybe_absurd
    agdaHidArgId                   ## _arg_id
    agdaHidFORALL                  ## _FORALL
    agdaHidImportName              ## _import_name
    agdaHidTypedUntypedBinding     ## _typed_untyped_binding
    agdaHidIds                     ## _ids
    agdaLambdaExtendedOrAbsurd     ## lambda_extended_or_absurd
    agdaHidRecordAssignment        ## _record_assignment
    agdaHidLAMBDA                  ## _LAMBDA
    agdaHidFieldAssignments        ## _field_assignments
    agdaHidELLIPSIS                ## _ELLIPSIS
    agdaHidDeclaration             ## _declaration
    agdaHidExpr2                   ## _expr2
    agdaHidExpr2WithoutLet         ## _expr2_without_let
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
    of agdaHidUnderscoreTok:           "_"
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
    of agdaHidDoStmt:                  "_do_stmt"
    of agdaHidNewline:                 "_newline"
    of agdaHidDeclarationBlock:        "_declaration_block"
    of agdaHidWithExprs:               "_with_exprs"
    of agdaHidLambdaClauses:           "_lambda_clauses"
    of agdaHidModalArgIds:             "_modal_arg_ids"
    of agdaHidFieldName:               "_field_name"
    of agdaHidRecordDirective:         "_record_directive"
    of agdaHidAtomCurly:               "_atom_curly"
    of agdaHidFieldNames:              "_field_names"
    of agdaHidTypedBindings:           "_typed_bindings"
    of agdaHidApplicationStmt:         "_application_stmt"
    of agdaHidSignatureBlock:          "_signature_block"
    of agdaHidLambdaBindings:          "_lambda_bindings"
    of agdaHidArgIds:                  "_arg_ids"
    of agdaHidIndent:                  "_indent"
    of agdaLhsDecl:                    "lhs_decl"
    of agdaHidLetBody:                 "_let_body"
    of agdaHidDedent:                  "_dedent"
    of agdaHidRecordAssignments:       "_record_assignments"
    of agdaHidCommaImportNames:        "_comma_import_names"
    of agdaString:                     "string"
    of agdaHidSimpleHole:              "_simple_hole"
    of agdaLetInDo:                    "let_in_do"
    of agdaHidAtomNoCurly:             "_atom_no_curly"
    of agdaHidSimpleTopHole:           "_simple_top_hole"
    of agdaLhsDefn:                    "lhs_defn"
    of agdaHidTypeSignatureBlock:      "_type_signature_block"
    of agdaHidMaybeDottedIds:          "_maybe_dotted_ids"
    of agdaHidMaybeDottedId:           "_maybe_dotted_id"
    of agdaHidBindingIdsAndAbsurds:    "_binding_ids_and_absurds"
    of agdaHidApplication:             "_application"
    of agdaRhsDecl:                    "rhs_decl"
    of agdaHidTypedUntypedBindings:    "_typed_untyped_bindings"
    of agdaHidARROW:                   "_ARROW"
    of agdaHidExpr2Stmt:               "_expr2_stmt"
    of agdaHidImportDirectives:        "_import_directives"
    of agdaRhsDefn:                    "rhs_defn"
    of agdaHidAtoms:                   "_atoms"
    of agdaFieldAssignments:           "field_assignments"
    of agdaHidWithExprsStmt:           "_with_exprs_stmt"
    of agdaHidExprOrAttr:              "_expr_or_attr"
    of agdaHidLambdaClauseMaybeAbsurd: "_lambda_clause_maybe_absurd"
    of agdaHidArgId:                   "_arg_id"
    of agdaHidFORALL:                  "_FORALL"
    of agdaHidImportName:              "_import_name"
    of agdaHidTypedUntypedBinding:     "_typed_untyped_binding"
    of agdaHidIds:                     "_ids"
    of agdaLambdaExtendedOrAbsurd:     "lambda_extended_or_absurd"
    of agdaHidRecordAssignment:        "_record_assignment"
    of agdaHidLAMBDA:                  "_LAMBDA"
    of agdaHidFieldAssignments:        "_field_assignments"
    of agdaHidELLIPSIS:                "_ELLIPSIS"
    of agdaHidDeclaration:             "_declaration"
    of agdaHidExpr2:                   "_expr2"
    of agdaHidExpr2WithoutLet:         "_expr2_without_let"
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
                                             agdaHidUnderscoreTok,
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
const agdaHiddenKinds*: set[AgdaNodeKind] = {
                                              agdaHidDoStmt,
                                              agdaHidNewline,
                                              agdaHidDeclarationBlock,
                                              agdaHidWithExprs,
                                              agdaHidLambdaClauses,
                                              agdaHidModalArgIds,
                                              agdaHidFieldName,
                                              agdaHidRecordDirective,
                                              agdaHidAtomCurly,
                                              agdaHidFieldNames,
                                              agdaHidTypedBindings,
                                              agdaHidApplicationStmt,
                                              agdaHidSignatureBlock,
                                              agdaHidLambdaBindings,
                                              agdaHidArgIds,
                                              agdaHidIndent,
                                              agdaLhsDecl,
                                              agdaHidLetBody,
                                              agdaHidDedent,
                                              agdaHidRecordAssignments,
                                              agdaHidCommaImportNames,
                                              agdaString,
                                              agdaHidSimpleHole,
                                              agdaLetInDo,
                                              agdaHidAtomNoCurly,
                                              agdaHidSimpleTopHole,
                                              agdaLhsDefn,
                                              agdaHidTypeSignatureBlock,
                                              agdaHidMaybeDottedIds,
                                              agdaHidMaybeDottedId,
                                              agdaHidBindingIdsAndAbsurds,
                                              agdaHidApplication,
                                              agdaRhsDecl,
                                              agdaHidTypedUntypedBindings,
                                              agdaHidARROW,
                                              agdaHidExpr2Stmt,
                                              agdaHidImportDirectives,
                                              agdaRhsDefn,
                                              agdaHidAtoms,
                                              agdaFieldAssignments,
                                              agdaHidWithExprsStmt,
                                              agdaHidExprOrAttr,
                                              agdaHidLambdaClauseMaybeAbsurd,
                                              agdaHidArgId,
                                              agdaHidFORALL,
                                              agdaHidImportName,
                                              agdaHidTypedUntypedBinding,
                                              agdaHidIds,
                                              agdaLambdaExtendedOrAbsurd,
                                              agdaHidRecordAssignment,
                                              agdaHidLAMBDA,
                                              agdaHidFieldAssignments,
                                              agdaHidELLIPSIS,
                                              agdaHidDeclaration,
                                              agdaHidExpr2,
                                              agdaHidExpr2WithoutLet
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
      of "_":                           agdaHidUnderscoreTok
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


import
  hmisc / wrappers/treesitter_core
let agdaGrammar*: array[AgdaNodeKind, HtsRule[AgdaNodeKind]] = block:
                                                                 var rules: array[AgdaNodeKind, HtsRule[AgdaNodeKind]]
                                                                 type
                                                                   K = AgdaNodeKind


                                                                 rules[agdaRecord] = tsSeq[K](tsString[K]("record"), tsSymbol[K](agdaHidAtomNoCurly), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](agdaExpr)), tsBlank[K]()), tsSymbol[K](agdaRecordDeclarationsBlock))
                                                                 rules[agdaTypeSignature] = tsSeq[K](tsSymbol[K](agdaHidFieldNames), tsString[K](":"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaImportDirective] = tsChoice[K](tsString[K]("public"), tsSeq[K](tsString[K]("using"), tsString[K]("("), tsSymbol[K](agdaHidCommaImportNames), tsString[K](")")), tsSeq[K](tsString[K]("hiding"), tsString[K]("("), tsSymbol[K](agdaHidCommaImportNames), tsString[K](")")), tsSeq[K](tsString[K]("renaming"), tsString[K]("("), tsSeq[K](tsSymbol[K](agdaRenaming), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](agdaRenaming)))), tsString[K](")")), tsSeq[K](tsString[K]("using"), tsString[K]("("), tsString[K](")")), tsSeq[K](tsString[K]("hiding"), tsString[K]("("), tsString[K](")")), tsSeq[K](tsString[K]("renaming"), tsString[K]("("), tsString[K](")")))
                                                                 rules[agdaAttributes] = tsRepeat1[K](tsSymbol[K](agdaAttribute))
                                                                 rules[agdaHidModalArgIds] = tsSeq[K](tsRepeat[K](tsSymbol[K](agdaAttribute)), tsSymbol[K](agdaHidArgIds))
                                                                 rules[agdaHidFieldName] = tsSymbol[K](agdaId)
                                                                 rules[agdaUntypedBinding] = tsChoice[K](tsChoice[K](tsChoice[K](tsSymbol[K](agdaBid), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("\xE2\xA6\x84")))), tsSeq[K](tsString[K]("."), tsChoice[K](tsSymbol[K](agdaBid), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("\xE2\xA6\x84"))))), tsSeq[K](tsString[K](".."), tsChoice[K](tsSymbol[K](agdaBid), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("\xE2\xA6\x84")))))), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds)), tsString[K]("\xE2\xA6\x84"))))
                                                                 rules[agdaHidAtomCurly] = tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](agdaExpr), tsBlank[K]())), tsString[K]("}")))
                                                                 rules[agdaHidTypedBindings] = tsRepeat1[K](tsSymbol[K](agdaTypedBinding))
                                                                 rules[agdaHidApplicationStmt] = tsSeq[K](tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]()), tsSymbol[K](agdaHidExpr2Stmt))
                                                                 rules[agdaHidSignatureBlock] = tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat1[K](tsSeq[K](tsSymbol[K](agdaSignature), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent))
                                                                 rules[agdaRecordConstructorInstance] = tsSeq[K](tsString[K]("instance"), tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat1[K](tsSeq[K](tsSymbol[K](agdaRecordConstructor), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent)))
                                                                 rules[agdaPragma] = tsSeq[K](tsString[K]("{-#"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^#]"), tsRegex[K]("#[^-]"), tsRegex[K]("#\\-[^}]"))), tsString[K]("#-}"))
                                                                 rules[agdaLhsDecl] = tsSeq[K](tsSymbol[K](agdaHidWithExprs), tsChoice[K](tsSymbol[K](agdaRewriteEquations), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaWithExpressions), tsBlank[K]()))
                                                                 rules[agdaHidArgIds] = tsRepeat1[K](tsSymbol[K](agdaHidArgId))
                                                                 rules[agdaDataSignature] = tsSeq[K](tsString[K]("data"), tsSymbol[K](agdaDataName), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsString[K](":"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaHidLetBody] = tsSeq[K](tsString[K]("in"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaHidCommaImportNames] = tsSeq[K](tsSymbol[K](agdaHidImportName), tsRepeat[K](tsSeq[K](tsString[K](";"), tsSymbol[K](agdaHidImportName))))
                                                                 rules[agdaHidSimpleHole] = tsChoice[K](tsSymbol[K](agdaId), tsSeq[K](tsSymbol[K](agdaHidLAMBDA), tsSymbol[K](agdaBid), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaId)))
                                                                 rules[agdaGeneralize] = tsSeq[K](tsString[K]("variable"), tsChoice[K](tsSymbol[K](agdaHidSignatureBlock), tsBlank[K]()))
                                                                 rules[agdaStmt] = tsChoice[K](tsSeq[K](tsSymbol[K](agdaHidTypedBindings), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr)), tsSeq[K](tsChoice[K](tsSymbol[K](agdaAttributes), tsBlank[K]()), tsSymbol[K](agdaHidAtoms), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr)), tsSeq[K](tsSymbol[K](agdaHidWithExprs), tsString[K]("="), tsSymbol[K](agdaExpr)), tsSymbol[K](agdaHidWithExprsStmt))
                                                                 rules[agdaHidAtomNoCurly] = tsChoice[K](tsString[K]("_"), tsString[K]("Prop"), tsString[K]("Set"), tsString[K]("quote"), tsString[K]("quoteTerm"), tsString[K]("quoteContext"), tsString[K]("unquote"), tsSymbol[K](agdaSetN), tsSymbol[K](agdaPropN), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaExpr)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x84"))), tsChoice[K](tsSeq[K](tsString[K]("(|"), tsSeq[K](tsSymbol[K](agdaExpr)), tsString[K]("|)")), tsSeq[K](tsString[K]("\xE2\xA6\x87"), tsSeq[K](tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x88"))), tsSeq[K](tsString[K]("("), tsString[K](")")), tsSeq[K](tsString[K]("{{"), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsString[K]("\xE2\xA6\x84")), tsSeq[K](tsSymbol[K](agdaId), tsString[K]("@"), tsSymbol[K](agdaAtom)), tsSeq[K](tsString[K]("."), tsSymbol[K](agdaAtom)), tsSymbol[K](agdaRecordAssignments), tsSymbol[K](agdaFieldAssignments), tsSymbol[K](agdaHidELLIPSIS), tsSymbol[K](agdaHidExprOrAttr))
                                                                 rules[agdaPattern] = tsSeq[K](tsString[K]("pattern"), tsSymbol[K](agdaId), tsChoice[K](tsSymbol[K](agdaHidLambdaBindings), tsBlank[K]()), tsString[K]("="), tsSymbol[K](agdaExpr))
                                                                 rules[agdaLetInDo] = tsSeq[K](tsString[K]("let"), tsChoice[K](tsSymbol[K](agdaHidIndent), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidDeclaration), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDeclaration), tsChoice[K](tsSeq[K](tsSymbol[K](agdaHidNewline), tsSymbol[K](agdaHidDedent)), tsSeq[K](tsSymbol[K](agdaHidNewline), tsSymbol[K](agdaHidLetBody)), tsSymbol[K](agdaHidLetBody)))
                                                                 rules[agdaLhsDefn] = tsSeq[K](tsSymbol[K](agdaHidWithExprs), tsChoice[K](tsSymbol[K](agdaRewriteEquations), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaWithExpressions), tsBlank[K]()))
                                                                 rules[agdaHidTypeSignatureBlock] = tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat1[K](tsSeq[K](tsSymbol[K](agdaTypeSignature), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent))
                                                                 rules[agdaExpr] = tsChoice[K](tsSeq[K](tsSymbol[K](agdaHidTypedBindings), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr)), tsSeq[K](tsChoice[K](tsSymbol[K](agdaAttributes), tsBlank[K]()), tsSymbol[K](agdaHidAtoms), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr)), tsSeq[K](tsSymbol[K](agdaHidWithExprs), tsString[K]("="), tsSymbol[K](agdaExpr)), tsSymbol[K](agdaHidWithExprs))
                                                                 rules[agdaPostulate] = tsSeq[K](tsString[K]("postulate"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaPrimitive] = tsSeq[K](tsString[K]("primitive"), tsChoice[K](tsSymbol[K](agdaHidTypeSignatureBlock), tsBlank[K]()))
                                                                 rules[agdaTypedBinding] = tsChoice[K](tsChoice[K](tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaHidApplication), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x84")))), tsSeq[K](tsString[K]("."), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaHidApplication), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x84"))))), tsSeq[K](tsString[K](".."), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaHidApplication), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x84")))))), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidApplication), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaAttributes), tsSymbol[K](agdaHidBindingIdsAndAbsurds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsString[K]("\xE2\xA6\x84"))), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaOpen)), tsString[K](")"))), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsString[K]("let"), tsSymbol[K](agdaHidDeclarationBlock)), tsString[K](")"))))
                                                                 rules[agdaHidMaybeDottedId] = tsChoice[K](tsSymbol[K](agdaHidFieldName), tsSeq[K](tsString[K]("."), tsSymbol[K](agdaHidFieldName)), tsSeq[K](tsString[K](".."), tsSymbol[K](agdaHidFieldName)))
                                                                 rules[agdaRhsDecl] = tsSeq[K](tsString[K](":"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaPrivate] = tsSeq[K](tsString[K]("private"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaHidTypedUntypedBindings] = tsRepeat1[K](tsSymbol[K](agdaHidTypedUntypedBinding))
                                                                 rules[agdaHidARROW] = tsChoice[K](tsString[K]("->"), tsString[K]("\xE2\x86\x92"))
                                                                 rules[agdaHidExpr2Stmt] = tsChoice[K](tsSymbol[K](agdaHidExpr2WithoutLet), tsSymbol[K](agdaLetInDo))
                                                                 rules[agdaSourceFile] = tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidDeclaration), tsSymbol[K](agdaHidNewline)))
                                                                 rules[agdaRhsDefn] = tsSeq[K](tsString[K]("="), tsSymbol[K](agdaExpr))
                                                                 rules[agdaHidAtoms] = tsRepeat1[K](tsSymbol[K](agdaAtom))
                                                                 rules[agdaRenaming] = tsSeq[K](tsChoice[K](tsString[K]("module"), tsBlank[K]()), tsSymbol[K](agdaId), tsString[K]("to"), tsSymbol[K](agdaId))
                                                                 rules[agdaComment] = tsChoice[K](tsSeq[K](tsString[K]("--"), tsRegex[K](".*")), tsSeq[K](tsString[K]("{--}")), tsSeq[K](tsString[K]("{-"), tsRegex[K]("[^#]"), tsRepeat[K](tsChoice[K](tsRegex[K]("[^-]"), tsRegex[K]("-[^}]"))), tsRegex[K]("-}")))
                                                                 rules[agdaRecordSignature] = tsSeq[K](tsString[K]("record"), tsSymbol[K](agdaHidAtomNoCurly), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsString[K](":"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaFields] = tsSeq[K](tsString[K]("field"), tsSymbol[K](agdaHidSignatureBlock))
                                                                 rules[agdaHidExprOrAttr] = tsChoice[K](tsSymbol[K](agdaLiteral), tsSymbol[K](agdaQid), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaExpr)), tsString[K](")"))))
                                                                 rules[agdaHidLambdaClauseMaybeAbsurd] = tsChoice[K](tsSymbol[K](agdaLambdaClauseAbsurd), tsSymbol[K](agdaLambdaClause))
                                                                 rules[agdaWithExpressions] = tsSeq[K](tsString[K]("with"), tsSymbol[K](agdaExpr))
                                                                 rules[agdaUnquoteDecl] = tsChoice[K](tsSeq[K](tsString[K]("unquoteDecl"), tsString[K]("="), tsSymbol[K](agdaExpr)), tsSeq[K](tsString[K]("unquoteDecl"), tsSymbol[K](agdaHidIds), tsString[K]("="), tsSymbol[K](agdaExpr)), tsSeq[K](tsString[K]("unquoteDef"), tsSymbol[K](agdaHidIds), tsString[K]("="), tsSymbol[K](agdaExpr)))
                                                                 rules[agdaRewriteEquations] = tsSeq[K](tsString[K]("rewrite"), tsSymbol[K](agdaHidWithExprs))
                                                                 rules[agdaHoleNames] = tsRepeat1[K](tsSymbol[K](agdaHoleName))
                                                                 rules[agdaLambdaExtendedOrAbsurd] = tsSeq[K](tsSymbol[K](agdaHidLAMBDA), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaLambdaClause)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidLambdaClauses)), tsString[K]("}"))), tsSeq[K](tsString[K]("where"), tsSymbol[K](agdaHidLambdaClauses)), tsSymbol[K](agdaHidLambdaBindings)))
                                                                 rules[agdaHidRecordAssignment] = tsChoice[K](tsSymbol[K](agdaFieldAssignment), tsSymbol[K](agdaModuleAssignment))
                                                                 rules[agdaHidLAMBDA] = tsChoice[K](tsString[K]("\\"), tsString[K]("\xCE\xBB"))
                                                                 rules[agdaInteger] = tsRegex[K]("\\-?(0x[0-9a-fA-F]+|[0-9]+)")
                                                                 rules[agdaHidELLIPSIS] = tsChoice[K](tsString[K]("..."), tsString[K]("\xE2\x80\xA6"))
                                                                 rules[agdaSignature] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("overlap"), tsBlank[K]()), tsSymbol[K](agdaHidModalArgIds), tsString[K](":"), tsSymbol[K](agdaExpr)), tsSeq[K](tsString[K]("instance"), tsSymbol[K](agdaHidSignatureBlock)))
                                                                 rules[agdaCatchallPragma] = tsSeq[K](tsString[K]("{-#"), tsString[K]("CATCHALL"), tsString[K]("#-}"))
                                                                 rules[agdaHidDeclaration] = tsChoice[K](tsSymbol[K](agdaFields), tsSymbol[K](agdaFunction), tsSymbol[K](agdaData), tsSymbol[K](agdaDataSignature), tsSymbol[K](agdaRecord), tsSymbol[K](agdaRecordSignature), tsSymbol[K](agdaInfix), tsSymbol[K](agdaGeneralize), tsSymbol[K](agdaMutual), tsSymbol[K](agdaAbstract), tsSymbol[K](agdaPrivate), tsSymbol[K](agdaInstance), tsSymbol[K](agdaMacro), tsSymbol[K](agdaPostulate), tsSymbol[K](agdaPrimitive), tsSymbol[K](agdaOpen), tsSymbol[K](agdaModuleMacro), tsSymbol[K](agdaModule), tsSymbol[K](agdaPragma), tsSymbol[K](agdaSyntax), tsSymbol[K](agdaPattern), tsSymbol[K](agdaUnquoteDecl))
                                                                 rules[agdaRecordInduction] = tsChoice[K](tsString[K]("inductive"), tsString[K]("coinductive"))
                                                                 rules[agdaFunction] = tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](agdaAttributes), tsBlank[K]()), tsSymbol[K](agdaLhsDecl), tsChoice[K](tsSymbol[K](agdaRhsDecl), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaWhere), tsBlank[K]())), tsSeq[K](tsChoice[K](tsSymbol[K](agdaAttributes), tsBlank[K]()), tsSymbol[K](agdaLhsDefn), tsChoice[K](tsSymbol[K](agdaRhsDefn), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaWhere), tsBlank[K]())))
                                                                 rules[agdaHidExpr2WithoutLet] = tsChoice[K](tsSymbol[K](agdaLambda), tsSymbol[K](agdaLambdaExtendedOrAbsurd), tsSymbol[K](agdaForall), tsSymbol[K](agdaDo), tsSymbol[K](agdaAtom), tsSeq[K](tsString[K]("quoteGoal"), tsSymbol[K](agdaId), tsString[K]("in"), tsSymbol[K](agdaExpr)), tsSeq[K](tsString[K]("tactic"), tsSymbol[K](agdaHidAtoms)), tsSeq[K](tsString[K]("tactic"), tsSymbol[K](agdaHidAtoms), tsString[K]("|"), tsSymbol[K](agdaHidWithExprs)))
                                                                 rules[agdaHidDoStmt] = tsSeq[K](tsSymbol[K](agdaStmt), tsChoice[K](tsSymbol[K](agdaDoWhere), tsBlank[K]()))
                                                                 rules[agdaHidDeclarationBlock] = tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat1[K](tsSeq[K](tsSymbol[K](agdaHidDeclaration), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent))
                                                                 rules[agdaHidWithExprs] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidAtoms), tsString[K]("|"))), tsSymbol[K](agdaHidApplication))
                                                                 rules[agdaHidLambdaClauses] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidLambdaClauseMaybeAbsurd), tsString[K](";"))), tsSymbol[K](agdaHidLambdaClauseMaybeAbsurd))
                                                                 rules[agdaHidRecordDirective] = tsChoice[K](tsSymbol[K](agdaRecordConstructor), tsSymbol[K](agdaRecordConstructorInstance), tsSymbol[K](agdaRecordInduction), tsSymbol[K](agdaRecordEta))
                                                                 rules[agdaSyntax] = tsSeq[K](tsString[K]("syntax"), tsSymbol[K](agdaId), tsSymbol[K](agdaHoleNames), tsString[K]("="), tsRepeat1[K](tsSymbol[K](agdaId)))
                                                                 rules[agdaForall] = tsSeq[K](tsSymbol[K](agdaHidFORALL), tsSymbol[K](agdaHidTypedUntypedBindings), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr))
                                                                 rules[agdaRecordEta] = tsChoice[K](tsString[K]("eta-equality"), tsString[K]("no-eta-equality"))
                                                                 rules[agdaHidFieldNames] = tsRepeat1[K](tsSymbol[K](agdaHidFieldName))
                                                                 rules[agdaHidLambdaBindings] = tsSeq[K](tsRepeat[K](tsSymbol[K](agdaHidTypedUntypedBinding)), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBinding), tsSeq[K](tsString[K]("("), tsString[K](")")), tsSeq[K](tsString[K]("{"), tsString[K]("}")), tsSeq[K](tsString[K]("{{"), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsString[K]("\xE2\xA6\x84"))))
                                                                 rules[agdaDo] = tsSeq[K](tsString[K]("do"), tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat1[K](tsSeq[K](tsSymbol[K](agdaHidDoStmt), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent)))
                                                                 rules[agdaModule] = tsSeq[K](tsString[K]("module"), tsChoice[K](tsSymbol[K](agdaQid), tsString[K]("_")), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsString[K]("where"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaQid] = tsChoice[K](tsRegex[K]("(([^\\s;\\.\\\"\\(\\)\\{\\}@\\\'\\\\_]|\\\\[^\\sa-zA-Z]|_[^\\s;\\.\\\"\\(\\)\\{\\}@])[^\\s;\\.\\\"\\(\\)\\{\\}@]*\\.)*([^\\s;\\.\\\"\\(\\)\\{\\}@\\\'\\\\_]|\\\\[^\\sa-zA-Z]|_[^\\s;\\.\\\"\\(\\)\\{\\}@])[^\\s;\\.\\\"\\(\\)\\{\\}@]*"), tsSymbol[K](agdaId))
                                                                 rules[agdaDataName] = tsSymbol[K](agdaId)
                                                                 rules[agdaInstance] = tsSeq[K](tsString[K]("instance"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaHidRecordAssignments] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidRecordAssignment), tsString[K](";"))), tsSymbol[K](agdaHidRecordAssignment))
                                                                 rules[agdaRecordDeclarationsBlock] = tsSeq[K](tsString[K]("where"), tsSeq[K](tsSymbol[K](agdaHidIndent), tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidRecordDirective), tsSymbol[K](agdaHidNewline))), tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidDeclaration), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDedent)))
                                                                 rules[agdaString] = tsRegex[K]("\\\".*\\\"")
                                                                 rules[agdaModuleAssignment] = tsSeq[K](tsSymbol[K](agdaModuleName), tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaHidImportDirectives), tsBlank[K]()))
                                                                 rules[agdaLambdaClauseAbsurd] = tsSeq[K](tsChoice[K](tsSymbol[K](agdaCatchallPragma), tsBlank[K]()), tsSymbol[K](agdaHidApplication))
                                                                 rules[agdaHidSimpleTopHole] = tsChoice[K](tsSymbol[K](agdaId), tsChoice[K](tsSeq[K](tsString[K]("("), tsSeq[K](tsSymbol[K](agdaHidLAMBDA), tsSymbol[K](agdaBid), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaId)), tsString[K](")"))))
                                                                 rules[agdaLet] = tsSeq[K](tsString[K]("let"), tsChoice[K](tsSymbol[K](agdaHidIndent), tsBlank[K]()), tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidDeclaration), tsSymbol[K](agdaHidNewline))), tsSymbol[K](agdaHidDeclaration), tsChoice[K](tsSymbol[K](agdaHidNewline), tsBlank[K]()), tsSymbol[K](agdaHidLetBody))
                                                                 rules[agdaHoleName] = tsChoice[K](tsSymbol[K](agdaHidSimpleTopHole), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidSimpleHole)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidSimpleHole)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidSimpleHole)), tsString[K]("\xE2\xA6\x84"))), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaId), tsString[K]("="), tsSymbol[K](agdaHidSimpleHole)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaId), tsString[K]("="), tsSymbol[K](agdaHidSimpleHole)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaId), tsString[K]("="), tsSymbol[K](agdaHidSimpleHole)), tsString[K]("\xE2\xA6\x84"))))
                                                                 rules[agdaHidMaybeDottedIds] = tsRepeat1[K](tsSymbol[K](agdaHidMaybeDottedId))
                                                                 rules[agdaSetN] = tsString[K]("setN")
                                                                 rules[agdaHidBindingIdsAndAbsurds] = tsChoice[K](tsSymbol[K](agdaHidApplication), tsSeq[K](tsSymbol[K](agdaQid), tsString[K]("="), tsSymbol[K](agdaQid)), tsSeq[K](tsSymbol[K](agdaQid), tsString[K]("="), tsString[K]("_")), tsSeq[K](tsString[K]("-"), tsString[K]("="), tsSymbol[K](agdaQid)), tsSeq[K](tsString[K]("-"), tsString[K]("="), tsString[K]("_")))
                                                                 rules[agdaHidApplication] = tsSeq[K](tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]()), tsSymbol[K](agdaHidExpr2))
                                                                 rules[agdaDoWhere] = tsSeq[K](tsString[K]("where"), tsSymbol[K](agdaHidLambdaClauses))
                                                                 rules[agdaOpen] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("import")), tsSeq[K](tsString[K]("open"), tsString[K]("import")), tsSeq[K](tsString[K]("open"))), tsSymbol[K](agdaModuleName), tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaHidImportDirectives), tsBlank[K]()))
                                                                 rules[agdaPropN] = tsString[K]("propN")
                                                                 rules[agdaMutual] = tsSeq[K](tsString[K]("mutual"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaHidImportDirectives] = tsRepeat1[K](tsSymbol[K](agdaImportDirective))
                                                                 rules[agdaAttribute] = tsSeq[K](tsString[K]("@"), tsSymbol[K](agdaHidExprOrAttr))
                                                                 rules[agdaLiteral] = tsChoice[K](tsRegex[K]("\\-?(0x[0-9a-fA-F]+|[0-9]+)"), tsRegex[K]("\\\".*\\\""))
                                                                 rules[agdaModuleApplication] = tsSeq[K](tsSymbol[K](agdaModuleName), tsChoice[K](tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidELLIPSIS)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidELLIPSIS)), tsString[K]("\xE2\xA6\x84"))), tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]())))
                                                                 rules[agdaFieldAssignments] = tsSeq[K](tsString[K]("record"), tsSymbol[K](agdaHidAtomNoCurly), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](agdaHidFieldAssignments), tsBlank[K]())), tsString[K]("}"))))
                                                                 rules[agdaHidWithExprsStmt] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](agdaHidAtoms), tsString[K]("|"))), tsSymbol[K](agdaHidApplicationStmt))
                                                                 rules[agdaRecordConstructor] = tsSeq[K](tsString[K]("constructor"), tsSymbol[K](agdaId))
                                                                 rules[agdaMacro] = tsSeq[K](tsString[K]("macro"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaData] = tsSeq[K](tsChoice[K](tsString[K]("data"), tsString[K]("codata")), tsSymbol[K](agdaDataName), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](agdaExpr)), tsBlank[K]()), tsString[K]("where"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaAbstract] = tsSeq[K](tsString[K]("abstract"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaHidArgId] = tsChoice[K](tsSymbol[K](agdaHidMaybeDottedId), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidMaybeDottedIds)), tsString[K]("}"))), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidMaybeDottedIds)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidMaybeDottedIds)), tsString[K]("\xE2\xA6\x84"))), tsSeq[K](tsString[K]("."), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("}")))), tsSeq[K](tsString[K]("."), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("\xE2\xA6\x84")))), tsSeq[K](tsString[K](".."), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("}")))), tsSeq[K](tsString[K](".."), tsChoice[K](tsSeq[K](tsString[K]("{{"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("}}")), tsSeq[K](tsString[K]("\xE2\xA6\x83"), tsSeq[K](tsSymbol[K](agdaHidFieldNames)), tsString[K]("\xE2\xA6\x84")))))
                                                                 rules[agdaHidFORALL] = tsChoice[K](tsString[K]("forall"), tsString[K]("\xE2\x88\x80"))
                                                                 rules[agdaRecordAssignments] = tsSeq[K](tsString[K]("record"), tsChoice[K](tsSeq[K](tsString[K]("{"), tsSeq[K](tsChoice[K](tsSymbol[K](agdaHidRecordAssignments), tsBlank[K]())), tsString[K]("}"))))
                                                                 rules[agdaHidImportName] = tsSeq[K](tsChoice[K](tsString[K]("module"), tsBlank[K]()), tsSymbol[K](agdaId))
                                                                 rules[agdaHidIds] = tsRepeat1[K](tsSymbol[K](agdaId))
                                                                 rules[agdaHidTypedUntypedBinding] = tsChoice[K](tsSymbol[K](agdaUntypedBinding), tsSymbol[K](agdaTypedBinding))
                                                                 rules[agdaId] = tsRegex[K]("([^\\s\\\\.\\\"\\(\\)\\{\\}@\\\'\\\\_]|\\\\[^\\sa-zA-Z]|_[^\\s;\\.\\\"\\(\\)\\{\\}@])[^\\s;\\.\\\"\\(\\)\\{\\}@]*")
                                                                 rules[agdaFieldAssignment] = tsSeq[K](tsSymbol[K](agdaId), tsString[K]("="), tsSymbol[K](agdaExpr))
                                                                 rules[agdaInfix] = tsSeq[K](tsChoice[K](tsString[K]("infix"), tsString[K]("infixl"), tsString[K]("infixr")), tsSymbol[K](agdaInteger), tsRepeat1[K](tsSymbol[K](agdaBid)))
                                                                 rules[agdaLambdaClause] = tsSeq[K](tsChoice[K](tsSymbol[K](agdaCatchallPragma), tsBlank[K]()), tsChoice[K](tsSymbol[K](agdaHidAtoms), tsBlank[K]()), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr))
                                                                 rules[agdaLambda] = tsSeq[K](tsSymbol[K](agdaHidLAMBDA), tsSymbol[K](agdaHidLambdaBindings), tsSymbol[K](agdaHidARROW), tsSymbol[K](agdaExpr))
                                                                 rules[agdaHidFieldAssignments] = tsSeq[K](tsRepeat[K](tsSeq[K](tsSymbol[K](agdaFieldAssignment), tsString[K](";"))), tsSymbol[K](agdaFieldAssignment))
                                                                 rules[agdaWhere] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("module"), tsSymbol[K](agdaBid)), tsBlank[K]()), tsString[K]("where"), tsChoice[K](tsSymbol[K](agdaHidDeclarationBlock), tsBlank[K]()))
                                                                 rules[agdaAtom] = tsChoice[K](tsSymbol[K](agdaHidAtomCurly), tsSymbol[K](agdaHidAtomNoCurly))
                                                                 rules[agdaModuleMacro] = tsSeq[K](tsChoice[K](tsSeq[K](tsString[K]("module"), tsSymbol[K](agdaQid)), tsSeq[K](tsString[K]("open"), tsString[K]("module"), tsSymbol[K](agdaQid))), tsChoice[K](tsSymbol[K](agdaHidTypedUntypedBindings), tsBlank[K]()), tsString[K]("="), tsSymbol[K](agdaModuleApplication), tsRepeat[K](tsSymbol[K](agdaImportDirective)))
                                                                 rules[agdaHidExpr2] = tsChoice[K](tsSymbol[K](agdaHidExpr2WithoutLet), tsSymbol[K](agdaLet))
                                                                 rules[agdaModuleName] = tsSymbol[K](agdaQid)
                                                                 rules[agdaBid] = tsChoice[K](tsString[K]("_"), tsSymbol[K](agdaId))
                                                                 rules

