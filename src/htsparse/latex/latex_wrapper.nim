import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter
type
  LatexNodeKind* = enum
    latexAt                          ## At
    latexCheckCommand                ## CheckCommand
    latexDeclareOption               ## DeclareOption
    latexDeleteShortVerb             ## DeleteShortVerb
    latexDoNotIndex                  ## DoNotIndex
    latexError                       ## Error
    latexExecuteOptions              ## ExecuteOptions
    latexExplSyntaxOff               ## ExplSyntaxOff
    latexExplSyntaxOn                ## ExplSyntaxOn
    latexIfFileExists                ## IfFileExists
    latexMakeShortVerb               ## MakeShortVerb
    latexNeedsTeXFOrmat              ## NeedsTeXFormat
    latexPassOptionsTo               ## PassOptionsTo
    latexProcessOptions              ## ProcessOptions
    latexProvides                    ## Provides
    latexProvidesExpl                ## ProvidesExpl
    latexVerbatimEnv                 ## Verbatim_env
    latexWarningInfo                 ## WarningInfo
    latexAddvspace                   ## addvspace
    latexAlignatEnv                  ## alignat_env
    latexArrayEnv                    ## array_env
    latexAtIfpackagelater            ## at_ifpackagelater
    latexAuthor                      ## author
    latexBegin                       ## begin
    latexBegingroup                  ## begingroup
    latexBibitem                     ## bibitem
    latexBrackGroup                  ## brack_group
    latexCharcode                    ## charcode
    latexCite                        ## cite
    latexCites                       ## cites
    latexCline                       ## cline
    latexCode                        ## code
    latexCommentEnv                  ## comment_env
    latexCsname                      ## csname
    latexCsnameGroup                 ## csname_group
    latexDate                        ## date
    latexDef                         ## def
    latexDelimiterGroup              ## delimiter_group
    latexDimension                   ## dimension
    latexDiscretionary               ## discretionary
    latexDisplayMathEnv              ## display_math_env
    latexDmathEnv                    ## dmath_env
    latexDocument                    ## document
    latexDocumentEnv                 ## document_env
    latexDseriesEnv                  ## dseries_env
    latexEmph                        ## emph
    latexEnd                         ## end
    latexEndcsname                   ## endcsname
    latexEndgroup                    ## endgroup
    latexEndinput                    ## endinput
    latexEnlargethispage             ## enlargethispage
    latexEnsuremath                  ## ensuremath
    latexExpandafter                 ## expandafter
    latexFigureEnv                   ## figure_env
    latexFilecontentsEnv             ## filecontents_env
    latexFootnote                    ## footnote
    latexFootnotemark                ## footnotemark
    latexFrac                        ## frac
    latexFref                        ## fref
    latexGlsAcr                      ## gls_acr
    latexGlsdisp                     ## glsdisp
    latexGlsentry                    ## glsentry
    latexGlssee                      ## glssee
    latexGlue                        ## glue
    latexGnuplotEnv                  ## gnuplot_env
    latexGroup                       ## group
    latexHref                        ## href
    latexHyperbaseurl                ## hyperbaseurl
    latexHyperimage                  ## hyperimage
    latexHyperref                    ## hyperref
    latexHyphenation                 ## hyphenation
    latexInlineMathEnv               ## inline_math_env
    latexInput                       ## input
    latexItem                        ## item
    latexItemizeEnv                  ## itemize_env
    latexLabel                       ## label
    latexLatexDisplayMath            ## latex_display_math
    latexLatexInlineMath             ## latex_inline_math
    latexLeft                        ## left
    latexLet                         ## let
    latexLinebreak                   ## linebreak
    latexLongnewglossaryentry        ## longnewglossaryentry
    latexLrboxEnv                    ## lrbox_env
    latexLstinline                   ## lstinline
    latexLstlistingEnv               ## lstlisting_env
    latexLua                         ## lua
    latexLuacode                     ## luacode
    latexLuacodeEnv                  ## luacode_env
    latexLuacodestarEnv              ## luacodestar_env
    latexMakeatletter                ## makeatletter
    latexMakeatother                 ## makeatother
    latexMakebox                     ## makebox
    latexMarginpar                   ## marginpar
    latexMathEnv                     ## math_env
    latexMathaccent                  ## mathaccent
    latexMathstyle                   ## mathstyle
    latexMbox                        ## mbox
    latexMinipageEnv                 ## minipage_env
    latexMint                        ## mint
    latexMintedEnv                   ## minted_env
    latexMintinline                  ## mintinline
    latexMulticolumn                 ## multicolumn
    latexNewacronym                  ## newacronym
    latexNewcommand                  ## newcommand
    latexNewcounter                  ## newcounter
    latexNewenvironment              ## newenvironment
    latexNewfont                     ## newfont
    latexNewglossaryentry            ## newglossaryentry
    latexNewlength                   ## newlength
    latexNewline                     ## newline
    latexNewsavebox                  ## newsavebox
    latexNewtheorem                  ## newtheorem
    latexNocite                      ## nocite
    latexObeycr                      ## obeycr
    latexPagebreak                   ## pagebreak
    latexPagenumbering               ## pagenumbering
    latexPagestyle                   ## pagestyle
    latexPar                         ## par
    latexParbox                      ## parbox
    latexParenGroup                  ## paren_group
    latexPhantomSmash                ## phantom_smash
    latexPictureEnv                  ## picture_env
    latexPrintcounter                ## printcounter
    latexProtect                     ## protect
    latexRaisebox                    ## raisebox
    latexRef                         ## ref
    latexRefrange                    ## refrange
    latexRegexp                      ## regexp
    latexRelax                       ## relax
    latexRestorecr                   ## restorecr
    latexRight                       ## right
    latexSavebox                     ## savebox
    latexSbox                        ## sbox
    latexSection                     ## section
    latexSemiSimpleGroup             ## semi_simple_group
    latexSetcounter                  ## setcounter
    latexSetlength                   ## setlength
    latexSetto                       ## setto
    latexShortVerb                   ## short_verb
    latexSpace                       ## space
    latexSqrt                        ## sqrt
    latexStackrel                    ## stackrel
    latexStepcounter                 ## stepcounter
    latexString                      ## string
    latexTableEnv                    ## table_env
    latexTabuEnv                     ## tabu_env
    latexTabularEnv                  ## tabular_env
    latexTabularstarEnv              ## tabularstar_env
    latexTag                         ## tag
    latexTexDisplayMath              ## tex_display_math
    latexTexInlineMath               ## tex_inline_math
    latexTextCmd                     ## text_cmd
    latexTextEnv                     ## text_env
    latexTextstyle                   ## textstyle
    latexThanks                      ## thanks
    latexThebibliographyEnv          ## thebibliography_env
    latexTheoremEnv                  ## theorem_env
    latexTikzpictureEnv              ## tikzpicture_env
    latexTitle                       ## title
    latexUrl                         ## url
    latexUse                         ## use
    latexUse209                      ## use_209
    latexUsebox                      ## usebox
    latexValue                       ## value
    latexVerb                        ## verb
    latexVolcite                     ## volcite
    latexVolcites                    ## volcites
    latexActiveChar                  ## active_char
    latexAlignmentTab                ## alignment_tab
    latexBacktick                    ## backtick
    latexCharRefInvalid              ## char_ref_invalid
    latexComma                       ## comma
    latexComment                     ## comment
    latexCommentArara                ## comment_arara
    latexCommentBib                  ## comment_bib
    latexCommentBlock                ## comment_block
    latexCommentTag                  ## comment_tag
    latexCommentTex                  ## comment_tex
    latexCs                          ## cs
    latexDecimal                     ## decimal
    latexDisplayMathShift            ## display_math_shift
    latexEol                         ## eol
    latexEquals                      ## equals
    latexExit                        ## exit
    latexFixed                       ## fixed
    latexHexadecimal                 ## hexadecimal
    latexIgnored                     ## ignored
    latexInvalid                     ## invalid
    latexL                           ## l
    latexLbrack                      ## lbrack
    latexLparen                      ## lparen
    latexMath                        ## math
    latexMathShift                   ## math_shift
    latexMinus                       ## minus
    latexName                        ## name
    latexOctal                       ## octal
    latexParameterRef                ## parameter_ref
    latexPlus                        ## plus
    latexPlusSym                     ## plus_sym
    latexR                           ## r
    latexRbrack                      ## rbrack
    latexRparen                      ## rparen
    latexSpread                      ## spread
    latexStar                        ## star
    latexSubscript                   ## subscript
    latexSuperscript                 ## superscript
    latexText                        ## text
    latexTo                          ## to
    latexUnit                        ## unit
    latexVerbDelim                   ## verb_delim
    latexVerbatim                    ## verbatim
    latexHidSpace                    ## _space
    latexCsSetcounter                ## cs_setcounter
    latexHidMathToken                ## _math_token
    latexCsProtect                   ## cs_protect
    latexHidMathMode                 ## _math_mode
    latexFigureBegin                 ## figure_begin
    latexEnvNameLuacodestar          ## env_name_luacodestar
    latexTabularstarBegin            ## tabularstar_begin
    latexHidEnvEnd                   ## _env_end
    latexThebibliographyNameGroup    ## thebibliography_name_group
    latexEnvNameTabularstar          ## env_name_tabularstar
    latexCsNewsavebox                ## cs_newsavebox
    latexHidDimensionParameter       ## _dimension_parameter
    latexTableNameGroup              ## table_name_group
    latexLuacodestarNameGroup        ## luacodestar_name_group
    latexCsTag                       ## cs_tag
    latexEnvNameMinted               ## env_name_minted
    latexItemizeNameGroup            ## itemize_name_group
    latexCsSbox                      ## cs_sbox
    latexCsMakeShortVerb             ## cs_MakeShortVerb
    latexCsBibitem                   ## cs_bibitem
    latexCsSetlength                 ## cs_setlength
    latexTabuNameGroup               ## tabu_name_group
    latexCsHyperref                  ## cs_hyperref
    latexTabuEnd                     ## tabu_end
    latexCsFootnote                  ## cs_footnote
    latexEnvNameVerbatim             ## env_name_Verbatim
    latexHidNumber                   ## _number
    latexHidNilToken                 ## _nil_token
    latexCsStackrel                  ## cs_stackrel
    latexAlignatBegin                ## alignat_begin
    latexCsEndgroup                  ## cs_endgroup
    latexCsAtIfpackagelater          ## cs_at_ifpackagelater
    latexCsHyperimage                ## cs_hyperimage
    latexCsLet                       ## cs_let
    latexEnvNameTikzpicture          ## env_name_tikzpicture
    latexCsUse209                    ## cs_use_209
    latexCsMint                      ## cs_mint
    latexCsEndcsname                 ## cs_endcsname
    latexVerbBody                    ## verb_body
    latexCsDiscretionary             ## cs_discretionary
    latexPictureEnd                  ## picture_end
    latexEnvNameThebibliography      ## env_name_thebibliography
    latexCsDeclareOption             ## cs_DeclareOption
    latexEnvNameFigure               ## env_name_figure
    latexCsEndinput                  ## cs_endinput
    latexCsNewcommand                ## cs_newcommand
    latexMathBrackGroup              ## math_brack_group
    latexCsBgroup                    ## cs_bgroup
    latexEnvNameDisplayMath          ## env_name_display_math
    latexEnvNameGnuplot              ## env_name_gnuplot
    latexMinipageNameGroup           ## minipage_name_group
    latexCsDeleteShortVerb           ## cs_DeleteShortVerb
    latexTikzpictureNameGroup        ## tikzpicture_name_group
    latexDimensionGroup              ## dimension_group
    latexFigureNameGroup             ## figure_name_group
    latexEnvNameTabular              ## env_name_tabular
    latexCsHref                      ## cs_href
    latexEnvNameTable                ## env_name_table
    latexHidEnvBegin                 ## _env_begin
    latexCsMakeatother               ## cs_makeatother
    latexCsLeft                      ## cs_left
    latexNamesGroup                  ## names_group
    latexCsPrintcounter              ## cs_printcounter
    latexHidCmd                      ## _cmd
    latexDisplayMathBegin            ## display_math_begin
    latexLrboxEnd                    ## lrbox_end
    latexArrayBegin                  ## array_begin
    latexEnvNameComment              ## env_name_comment
    latexCsCode                      ## cs_code
    latexFilecontentsNameGroup       ## filecontents_name_group
    latexVerbDelimNoLbrack           ## verb_delim_no_lbrack
    latexItemizeBegin                ## itemize_begin
    latexItemizeEnd                  ## itemize_end
    latexTheoremNameGroup            ## theorem_name_group
    latexCsString                    ## cs_string
    latexCsParbox                    ## cs_parbox
    latexEnvNameItemize              ## env_name_itemize
    latexCsDef                       ## cs_def
    latexAlignatEnd                  ## alignat_end
    latexHidMathExpandedParameter    ## _math_expanded_parameter
    latexDmathNameGroup              ## dmath_name_group
    latexLstlistingBegin             ## lstlisting_begin
    latexLstlistingEnd               ## lstlisting_end
    latexMintedBegin                 ## minted_begin
    latexCsProvides                  ## cs_Provides
    latexCsUrl                       ## cs_url
    latexCsNocite                    ## cs_nocite
    latexCsMathaccent                ## cs_mathaccent
    latexCsFrac                      ## cs_frac
    latexTabularstarEnd              ## tabularstar_end
    latexVerbatimBegin               ## verbatim_begin
    latexCsCites                     ## cs_cites
    latexGnuplotBegin                ## gnuplot_begin
    latexTextNameGroup               ## text_name_group
    latexHidGlueParameter            ## _glue_parameter
    latexVerbatimNameGroup           ## verbatim_name_group
    latexHidNamesGroup               ## _names_group
    latexGlueGroup                   ## glue_group
    latexCsError                     ## cs_Error
    latexVerbEndDelim                ## verb_end_delim
    latexCsThanks                    ## cs_thanks
    latexThebibliographyEnd          ## thebibliography_end
    latexLstlistingNameGroup         ## lstlisting_name_group
    latexCsNewline                   ## cs_newline
    latexEnvNamePicture              ## env_name_picture
    latexMathEnd                     ## math_end
    latexHidNumberParameter          ## _number_parameter
    latexCsEnd                       ## cs_end
    latexHidCsParameter              ## _cs_parameter
    latexIgnoredLine                 ## ignored_line
    latexCsCheckCommand              ## cs_CheckCommand
    latexCommentNameGroup            ## comment_name_group
    latexTikzpictureTextEnv          ## tikzpicture_text_env
    latexHidTextExpandedParameter    ## _text_expanded_parameter
    latexHidCommonExpandedParameter  ## _common_expanded_parameter
    latexCsSqrt                      ## cs_sqrt
    latexHidCmdApply                 ## _cmd_apply
    latexCsWarningInfo               ## cs_WarningInfo
    latexCsMakeVerbDelim             ## cs_make_verb_delim
    latexHidDeleteVerbDelimParameter ## _delete_verb_delim_parameter
    latexCsNewlength                 ## cs_newlength
    latexTheoremBegin                ## theorem_begin
    latexThebibliographyBegin        ## thebibliography_begin
    latexCsRefrange                  ## cs_refrange
    latexDseriesEnd                  ## dseries_end
    latexCsFootnotemark              ## cs_footnotemark
    latexDimensionBrackGroup         ## dimension_brack_group
    latexCsRestorecr                 ## cs_restorecr
    latexCsPagestyle                 ## cs_pagestyle
    latexHidDimensionBrackGroup      ## _dimension_brack_group
    latexCsProvidesExpl              ## cs_ProvidesExpl
    latexMintedEnd                   ## minted_end
    latexCsDeleteVerbDelim           ## cs_delete_verb_delim
    latexCsGroup                     ## cs_group
    latexTextMulticolumn             ## text_multicolumn
    latexDisplayMathEnd              ## display_math_end
    latexArrayNameGroup              ## array_name_group
    latexCsInput                     ## cs_input
    latexCsTitle                     ## cs_title
    latexCsGlsentry                  ## cs_glsentry
    latexCsAddvspace                 ## cs_addvspace
    latexCsVolcites                  ## cs_volcites
    latexFilecontentsEnd             ## filecontents_end
    latexMinipageEnd                 ## minipage_end
    latexFixedPair                   ## fixed_pair
    latexLuacodeEnd                  ## luacode_end
    latexHidApplyParameter           ## _apply_parameter
    latexCsExplSyntaxOn              ## cs_ExplSyntaxOn
    latexTextNonEscape               ## text_non_escape
    latexCsIfFileExists              ## cs_IfFileExists
    latexCsPassOptionsTo             ## cs_PassOptionsTo
    latexCsNewcounter                ## cs_newcounter
    latexInlineMathEnd               ## inline_math_end
    latexCsHyperbaseurl              ## cs_hyperbaseurl
    latexMathBegin                   ## math_begin
    latexInlineMathNameGroup         ## inline_math_name_group
    latexDocumentNameGroup           ## document_name_group
    latexHidTextToken                ## _text_token
    latexApplyGroup                  ## apply_group
    latexCsVolcite                   ## cs_volcite
    latexCsNeedsTeXFOrmat            ## cs_NeedsTeXFormat
    latexDmathBegin                  ## dmath_begin
    latexEnvNameTabu                 ## env_name_tabu
    latexMakeVerbDelimGroup          ## make_verb_delim_group
    latexCsPar                       ## cs_par
    latexTabularstarNameGroup        ## tabularstar_name_group
    latexHidNameParameter            ## _name_parameter
    latexShortVerbDelim              ## short_verb_delim
    latexPictureNameGroup            ## picture_name_group
    latexCsNewacronym                ## cs_newacronym
    latexCsAt                        ## cs_At
    latexCsRight                     ## cs_right
    latexCsFref                      ## cs_fref
    latexCsNewtheorem                ## cs_newtheorem
    latexCsTextstyle                 ## cs_textstyle
    latexLrboxNameGroup              ## lrbox_name_group
    latexTabuBegin                   ## tabu_begin
    latexLuacodestarBegin            ## luacodestar_begin
    latexCsEnsuremath                ## cs_ensuremath
    latexDocumentBegin               ## document_begin
    latexCsGlsdisp                   ## cs_glsdisp
    latexCsLongnewglossaryentry      ## cs_longnewglossaryentry
    latexEnvNameLrbox                ## env_name_lrbox
    latexHidGlueBrackParameter       ## _glue_brack_parameter
    latexCsNewfont                   ## cs_newfont
    latexCsPagenumbering             ## cs_pagenumbering
    latexCsItem                      ## cs_item
    latexGnuplotNameGroup            ## gnuplot_name_group
    latexHidTextGroup                ## _text_group
    latexCsDate                      ## cs_date
    latexFilecontentsBegin           ## filecontents_begin
    latexTikzpictureBegin            ## tikzpicture_begin
    latexCsLua                       ## cs_lua
    latexCsLstinline                 ## cs_lstinline
    latexTextSingle                  ## text_single
    latexMathNameGroup               ## math_name_group
    latexHidDimension                ## _dimension
    latexCsMakebox                   ## cs_makebox
    latexCsExecuteOptions            ## cs_ExecuteOptions
    latexArrayEnd                    ## array_end
    latexCsLuacode                   ## cs_luacode
    latexHidScopeEnd                 ## _scope_end
    latexTabularNameGroup            ## tabular_name_group
    latexCsNewenvironment            ## cs_newenvironment
    latexEnvNameAlignat              ## env_name_alignat
    latexCsRaisebox                  ## cs_raisebox
    latexAlignatNameGroup            ## alignat_name_group
    latexCsExplSyntaxOff             ## cs_ExplSyntaxOff
    latexHidNameGroup                ## _name_group
    latexTextExpandafter             ## text_expandafter
    latexCommentBegin                ## comment_begin
    latexMathShiftEnd                ## math_shift_end
    latexHidTextMode                 ## _text_mode
    latexVerbatimEnd                 ## Verbatim_end
    latexCsSetto                     ## cs_setto
    latexLuacodeBegin                ## luacode_begin
    latexNameGroup                   ## name_group
    latexCsCsname                    ## cs_csname
    latexTabularBegin                ## tabular_begin
    latexCsCline                     ## cs_cline
    latexTikzpictureEnd              ## tikzpicture_end
    latexEnvName                     ## env_name
    latexTabuTextEnv                 ## tabu_text_env
    latexHidScopeBegin               ## _scope_begin
    latexCsMbox                      ## cs_mbox
    latexCsObeycr                    ## cs_obeycr
    latexInlineMathBegin             ## inline_math_begin
    latexCsGlssee                    ## cs_glssee
    latexEnvNameArray                ## env_name_array
    latexCsExpandafter               ## cs_expandafter
    latexEgroup                      ## egroup
    latexCsMathstyle                 ## cs_mathstyle
    latexBgroup                      ## bgroup
    latexCsText                      ## cs_text
    latexCsDoNotIndex                ## cs_DoNotIndex
    latexCsSection                   ## cs_section
    latexCsDisplayMathEnd            ## cs_display_math_end
    latexEnvNameMinipage             ## env_name_minipage
    latexDocumentEnd                 ## document_end
    latexLuacodestarEnd              ## luacodestar_end
    latexCsGlsAcr                    ## cs_gls_acr
    latexTableBegin                  ## table_begin
    latexCsRegexp                    ## cs_regexp
    latexEnvNameDocument             ## env_name_document
    latexEnvNameInlineMath           ## env_name_inline_math
    latexPictureBegin                ## picture_begin
    latexLuacodeNameGroup            ## luacode_name_group
    latexMintedNameGroup             ## minted_name_group
    latexCsPhantomSmash              ## cs_phantom_smash
    latexEnvNameLstlisting           ## env_name_lstlisting
    latexCsSavebox                   ## cs_savebox
    latexExitMath                    ## exit_math
    latexHidMathGroup                ## _math_group
    latexEnvNameFilecontents         ## env_name_filecontents
    latexNilGroup                    ## nil_group
    latexDisplayMathShiftEnd         ## display_math_shift_end
    latexCsRef                       ## cs_ref
    latexEnvNameDseries              ## env_name_dseries
    latexDseriesNameGroup            ## dseries_name_group
    latexCsCite                      ## cs_cite
    latexMinipageBegin               ## minipage_begin
    latexCsSpace                     ## cs_space
    latexTextProtect                 ## text_protect
    latexCsMakeatletter              ## cs_makeatletter
    latexDseriesBegin                ## dseries_begin
    latexCsEnlargethispage           ## cs_enlargethispage
    latexTextBegin                   ## text_begin
    latexCsUsebox                    ## cs_usebox
    latexTikzpictureMathEnv          ## tikzpicture_math_env
    latexTextGroup                   ## text_group
    latexCsLinebreak                 ## cs_linebreak
    latexCsMarginpar                 ## cs_marginpar
    latexCsValue                     ## cs_value
    latexCsEmph                      ## cs_emph
    latexDisplayMathNameGroup        ## display_math_name_group
    latexEnvNameLuacode              ## env_name_luacode
    latexDeleteVerbDelimGroup        ## delete_verb_delim_group
    latexCsVerb                      ## cs_verb
    latexGnuplotEnd                  ## gnuplot_end
    latexLrboxBegin                  ## lrbox_begin
    latexCsAuthor                    ## cs_author
    latexTextEnd                     ## text_end
    latexTabularEnd                  ## tabular_end
    latexCsProcessOptions            ## cs_ProcessOptions
    latexCsEgroup                    ## cs_egroup
    latexCsInlineMathEnd             ## cs_inline_math_end
    latexCsHyphenation               ## cs_hyphenation
    latexParEol                      ## par_eol
    latexMathGroup                   ## math_group
    latexCsInlineMathBegin           ## cs_inline_math_begin
    latexDmathEnd                    ## dmath_end
    latexTableEnd                    ## table_end
    latexCsMintinline                ## cs_mintinline
    latexTabuMathEnv                 ## tabu_math_env
    latexHidNilMode                  ## _nil_mode
    latexCsNewglossaryentry          ## cs_newglossaryentry
    latexEnvNameTheorem              ## env_name_theorem
    latexCsRelax                     ## cs_relax
    latexCsPagebreak                 ## cs_pagebreak
    latexCsBegingroup                ## cs_begingroup
    latexHidNilGroup                 ## _nil_group
    latexCommentEnd                  ## comment_end
    latexCsUse                       ## cs_use
    latexTheoremEnd                  ## theorem_end
    latexHidCommon                   ## _common
    latexCsDisplayMathBegin          ## cs_display_math_begin
    latexCsMulticolumn               ## cs_multicolumn
    latexIgnoredRest                 ## ignored_rest
    latexGlueBrackGroup              ## glue_brack_group
    latexCsStepcounter               ## cs_stepcounter
    latexCsLabel                     ## cs_label
    latexEnvNameDmath                ## env_name_dmath
    latexHidMakeVerbDelimParameter   ## _make_verb_delim_parameter
    latexFigureEnd                   ## figure_end
    latexCsBegin                     ## cs_begin
    latexSyntaxError                 ## Tree-sitter parser syntax error

proc strRepr*(kind: LatexNodeKind): string =
  case kind:
    of latexAt:                          "At"
    of latexCheckCommand:                "CheckCommand"
    of latexDeclareOption:               "DeclareOption"
    of latexDeleteShortVerb:             "DeleteShortVerb"
    of latexDoNotIndex:                  "DoNotIndex"
    of latexError:                       "Error"
    of latexExecuteOptions:              "ExecuteOptions"
    of latexExplSyntaxOff:               "ExplSyntaxOff"
    of latexExplSyntaxOn:                "ExplSyntaxOn"
    of latexIfFileExists:                "IfFileExists"
    of latexMakeShortVerb:               "MakeShortVerb"
    of latexNeedsTeXFOrmat:              "NeedsTeXFormat"
    of latexPassOptionsTo:               "PassOptionsTo"
    of latexProcessOptions:              "ProcessOptions"
    of latexProvides:                    "Provides"
    of latexProvidesExpl:                "ProvidesExpl"
    of latexVerbatimEnv:                 "Verbatim_env"
    of latexWarningInfo:                 "WarningInfo"
    of latexAddvspace:                   "addvspace"
    of latexAlignatEnv:                  "alignat_env"
    of latexArrayEnv:                    "array_env"
    of latexAtIfpackagelater:            "at_ifpackagelater"
    of latexAuthor:                      "author"
    of latexBegin:                       "begin"
    of latexBegingroup:                  "begingroup"
    of latexBibitem:                     "bibitem"
    of latexBrackGroup:                  "brack_group"
    of latexCharcode:                    "charcode"
    of latexCite:                        "cite"
    of latexCites:                       "cites"
    of latexCline:                       "cline"
    of latexCode:                        "code"
    of latexCommentEnv:                  "comment_env"
    of latexCsname:                      "csname"
    of latexCsnameGroup:                 "csname_group"
    of latexDate:                        "date"
    of latexDef:                         "def"
    of latexDelimiterGroup:              "delimiter_group"
    of latexDimension:                   "dimension"
    of latexDiscretionary:               "discretionary"
    of latexDisplayMathEnv:              "display_math_env"
    of latexDmathEnv:                    "dmath_env"
    of latexDocument:                    "document"
    of latexDocumentEnv:                 "document_env"
    of latexDseriesEnv:                  "dseries_env"
    of latexEmph:                        "emph"
    of latexEnd:                         "end"
    of latexEndcsname:                   "endcsname"
    of latexEndgroup:                    "endgroup"
    of latexEndinput:                    "endinput"
    of latexEnlargethispage:             "enlargethispage"
    of latexEnsuremath:                  "ensuremath"
    of latexExpandafter:                 "expandafter"
    of latexFigureEnv:                   "figure_env"
    of latexFilecontentsEnv:             "filecontents_env"
    of latexFootnote:                    "footnote"
    of latexFootnotemark:                "footnotemark"
    of latexFrac:                        "frac"
    of latexFref:                        "fref"
    of latexGlsAcr:                      "gls_acr"
    of latexGlsdisp:                     "glsdisp"
    of latexGlsentry:                    "glsentry"
    of latexGlssee:                      "glssee"
    of latexGlue:                        "glue"
    of latexGnuplotEnv:                  "gnuplot_env"
    of latexGroup:                       "group"
    of latexHref:                        "href"
    of latexHyperbaseurl:                "hyperbaseurl"
    of latexHyperimage:                  "hyperimage"
    of latexHyperref:                    "hyperref"
    of latexHyphenation:                 "hyphenation"
    of latexInlineMathEnv:               "inline_math_env"
    of latexInput:                       "input"
    of latexItem:                        "item"
    of latexItemizeEnv:                  "itemize_env"
    of latexLabel:                       "label"
    of latexLatexDisplayMath:            "latex_display_math"
    of latexLatexInlineMath:             "latex_inline_math"
    of latexLeft:                        "left"
    of latexLet:                         "let"
    of latexLinebreak:                   "linebreak"
    of latexLongnewglossaryentry:        "longnewglossaryentry"
    of latexLrboxEnv:                    "lrbox_env"
    of latexLstinline:                   "lstinline"
    of latexLstlistingEnv:               "lstlisting_env"
    of latexLua:                         "lua"
    of latexLuacode:                     "luacode"
    of latexLuacodeEnv:                  "luacode_env"
    of latexLuacodestarEnv:              "luacodestar_env"
    of latexMakeatletter:                "makeatletter"
    of latexMakeatother:                 "makeatother"
    of latexMakebox:                     "makebox"
    of latexMarginpar:                   "marginpar"
    of latexMathEnv:                     "math_env"
    of latexMathaccent:                  "mathaccent"
    of latexMathstyle:                   "mathstyle"
    of latexMbox:                        "mbox"
    of latexMinipageEnv:                 "minipage_env"
    of latexMint:                        "mint"
    of latexMintedEnv:                   "minted_env"
    of latexMintinline:                  "mintinline"
    of latexMulticolumn:                 "multicolumn"
    of latexNewacronym:                  "newacronym"
    of latexNewcommand:                  "newcommand"
    of latexNewcounter:                  "newcounter"
    of latexNewenvironment:              "newenvironment"
    of latexNewfont:                     "newfont"
    of latexNewglossaryentry:            "newglossaryentry"
    of latexNewlength:                   "newlength"
    of latexNewline:                     "newline"
    of latexNewsavebox:                  "newsavebox"
    of latexNewtheorem:                  "newtheorem"
    of latexNocite:                      "nocite"
    of latexObeycr:                      "obeycr"
    of latexPagebreak:                   "pagebreak"
    of latexPagenumbering:               "pagenumbering"
    of latexPagestyle:                   "pagestyle"
    of latexPar:                         "par"
    of latexParbox:                      "parbox"
    of latexParenGroup:                  "paren_group"
    of latexPhantomSmash:                "phantom_smash"
    of latexPictureEnv:                  "picture_env"
    of latexPrintcounter:                "printcounter"
    of latexProtect:                     "protect"
    of latexRaisebox:                    "raisebox"
    of latexRef:                         "ref"
    of latexRefrange:                    "refrange"
    of latexRegexp:                      "regexp"
    of latexRelax:                       "relax"
    of latexRestorecr:                   "restorecr"
    of latexRight:                       "right"
    of latexSavebox:                     "savebox"
    of latexSbox:                        "sbox"
    of latexSection:                     "section"
    of latexSemiSimpleGroup:             "semi_simple_group"
    of latexSetcounter:                  "setcounter"
    of latexSetlength:                   "setlength"
    of latexSetto:                       "setto"
    of latexShortVerb:                   "short_verb"
    of latexSpace:                       "space"
    of latexSqrt:                        "sqrt"
    of latexStackrel:                    "stackrel"
    of latexStepcounter:                 "stepcounter"
    of latexString:                      "string"
    of latexTableEnv:                    "table_env"
    of latexTabuEnv:                     "tabu_env"
    of latexTabularEnv:                  "tabular_env"
    of latexTabularstarEnv:              "tabularstar_env"
    of latexTag:                         "tag"
    of latexTexDisplayMath:              "tex_display_math"
    of latexTexInlineMath:               "tex_inline_math"
    of latexTextCmd:                     "text_cmd"
    of latexTextEnv:                     "text_env"
    of latexTextstyle:                   "textstyle"
    of latexThanks:                      "thanks"
    of latexThebibliographyEnv:          "thebibliography_env"
    of latexTheoremEnv:                  "theorem_env"
    of latexTikzpictureEnv:              "tikzpicture_env"
    of latexTitle:                       "title"
    of latexUrl:                         "url"
    of latexUse:                         "use"
    of latexUse209:                      "use_209"
    of latexUsebox:                      "usebox"
    of latexValue:                       "value"
    of latexVerb:                        "verb"
    of latexVolcite:                     "volcite"
    of latexVolcites:                    "volcites"
    of latexActiveChar:                  "active_char"
    of latexAlignmentTab:                "alignment_tab"
    of latexBacktick:                    "backtick"
    of latexCharRefInvalid:              "char_ref_invalid"
    of latexComma:                       "comma"
    of latexComment:                     "comment"
    of latexCommentArara:                "comment_arara"
    of latexCommentBib:                  "comment_bib"
    of latexCommentBlock:                "comment_block"
    of latexCommentTag:                  "comment_tag"
    of latexCommentTex:                  "comment_tex"
    of latexCs:                          "cs"
    of latexDecimal:                     "decimal"
    of latexDisplayMathShift:            "display_math_shift"
    of latexEol:                         "eol"
    of latexEquals:                      "equals"
    of latexExit:                        "exit"
    of latexFixed:                       "fixed"
    of latexHexadecimal:                 "hexadecimal"
    of latexIgnored:                     "ignored"
    of latexInvalid:                     "invalid"
    of latexL:                           "l"
    of latexLbrack:                      "lbrack"
    of latexLparen:                      "lparen"
    of latexMath:                        "math"
    of latexMathShift:                   "math_shift"
    of latexMinus:                       "minus"
    of latexName:                        "name"
    of latexOctal:                       "octal"
    of latexParameterRef:                "parameter_ref"
    of latexPlus:                        "plus"
    of latexPlusSym:                     "plus_sym"
    of latexR:                           "r"
    of latexRbrack:                      "rbrack"
    of latexRparen:                      "rparen"
    of latexSpread:                      "spread"
    of latexStar:                        "star"
    of latexSubscript:                   "subscript"
    of latexSuperscript:                 "superscript"
    of latexText:                        "text"
    of latexTo:                          "to"
    of latexUnit:                        "unit"
    of latexVerbDelim:                   "verb_delim"
    of latexVerbatim:                    "verbatim"
    of latexHidSpace:                    "_space"
    of latexCsSetcounter:                "cs_setcounter"
    of latexHidMathToken:                "_math_token"
    of latexCsProtect:                   "cs_protect"
    of latexHidMathMode:                 "_math_mode"
    of latexFigureBegin:                 "figure_begin"
    of latexEnvNameLuacodestar:          "env_name_luacodestar"
    of latexTabularstarBegin:            "tabularstar_begin"
    of latexHidEnvEnd:                   "_env_end"
    of latexThebibliographyNameGroup:    "thebibliography_name_group"
    of latexEnvNameTabularstar:          "env_name_tabularstar"
    of latexCsNewsavebox:                "cs_newsavebox"
    of latexHidDimensionParameter:       "_dimension_parameter"
    of latexTableNameGroup:              "table_name_group"
    of latexLuacodestarNameGroup:        "luacodestar_name_group"
    of latexCsTag:                       "cs_tag"
    of latexEnvNameMinted:               "env_name_minted"
    of latexItemizeNameGroup:            "itemize_name_group"
    of latexCsSbox:                      "cs_sbox"
    of latexCsMakeShortVerb:             "cs_MakeShortVerb"
    of latexCsBibitem:                   "cs_bibitem"
    of latexCsSetlength:                 "cs_setlength"
    of latexTabuNameGroup:               "tabu_name_group"
    of latexCsHyperref:                  "cs_hyperref"
    of latexTabuEnd:                     "tabu_end"
    of latexCsFootnote:                  "cs_footnote"
    of latexEnvNameVerbatim:             "env_name_Verbatim"
    of latexHidNumber:                   "_number"
    of latexHidNilToken:                 "_nil_token"
    of latexCsStackrel:                  "cs_stackrel"
    of latexAlignatBegin:                "alignat_begin"
    of latexCsEndgroup:                  "cs_endgroup"
    of latexCsAtIfpackagelater:          "cs_at_ifpackagelater"
    of latexCsHyperimage:                "cs_hyperimage"
    of latexCsLet:                       "cs_let"
    of latexEnvNameTikzpicture:          "env_name_tikzpicture"
    of latexCsUse209:                    "cs_use_209"
    of latexCsMint:                      "cs_mint"
    of latexCsEndcsname:                 "cs_endcsname"
    of latexVerbBody:                    "verb_body"
    of latexCsDiscretionary:             "cs_discretionary"
    of latexPictureEnd:                  "picture_end"
    of latexEnvNameThebibliography:      "env_name_thebibliography"
    of latexCsDeclareOption:             "cs_DeclareOption"
    of latexEnvNameFigure:               "env_name_figure"
    of latexCsEndinput:                  "cs_endinput"
    of latexCsNewcommand:                "cs_newcommand"
    of latexMathBrackGroup:              "math_brack_group"
    of latexCsBgroup:                    "cs_bgroup"
    of latexEnvNameDisplayMath:          "env_name_display_math"
    of latexEnvNameGnuplot:              "env_name_gnuplot"
    of latexMinipageNameGroup:           "minipage_name_group"
    of latexCsDeleteShortVerb:           "cs_DeleteShortVerb"
    of latexTikzpictureNameGroup:        "tikzpicture_name_group"
    of latexDimensionGroup:              "dimension_group"
    of latexFigureNameGroup:             "figure_name_group"
    of latexEnvNameTabular:              "env_name_tabular"
    of latexCsHref:                      "cs_href"
    of latexEnvNameTable:                "env_name_table"
    of latexHidEnvBegin:                 "_env_begin"
    of latexCsMakeatother:               "cs_makeatother"
    of latexCsLeft:                      "cs_left"
    of latexNamesGroup:                  "names_group"
    of latexCsPrintcounter:              "cs_printcounter"
    of latexHidCmd:                      "_cmd"
    of latexDisplayMathBegin:            "display_math_begin"
    of latexLrboxEnd:                    "lrbox_end"
    of latexArrayBegin:                  "array_begin"
    of latexEnvNameComment:              "env_name_comment"
    of latexCsCode:                      "cs_code"
    of latexFilecontentsNameGroup:       "filecontents_name_group"
    of latexVerbDelimNoLbrack:           "verb_delim_no_lbrack"
    of latexItemizeBegin:                "itemize_begin"
    of latexItemizeEnd:                  "itemize_end"
    of latexTheoremNameGroup:            "theorem_name_group"
    of latexCsString:                    "cs_string"
    of latexCsParbox:                    "cs_parbox"
    of latexEnvNameItemize:              "env_name_itemize"
    of latexCsDef:                       "cs_def"
    of latexAlignatEnd:                  "alignat_end"
    of latexHidMathExpandedParameter:    "_math_expanded_parameter"
    of latexDmathNameGroup:              "dmath_name_group"
    of latexLstlistingBegin:             "lstlisting_begin"
    of latexLstlistingEnd:               "lstlisting_end"
    of latexMintedBegin:                 "minted_begin"
    of latexCsProvides:                  "cs_Provides"
    of latexCsUrl:                       "cs_url"
    of latexCsNocite:                    "cs_nocite"
    of latexCsMathaccent:                "cs_mathaccent"
    of latexCsFrac:                      "cs_frac"
    of latexTabularstarEnd:              "tabularstar_end"
    of latexVerbatimBegin:               "verbatim_begin"
    of latexCsCites:                     "cs_cites"
    of latexGnuplotBegin:                "gnuplot_begin"
    of latexTextNameGroup:               "text_name_group"
    of latexHidGlueParameter:            "_glue_parameter"
    of latexVerbatimNameGroup:           "verbatim_name_group"
    of latexHidNamesGroup:               "_names_group"
    of latexGlueGroup:                   "glue_group"
    of latexCsError:                     "cs_Error"
    of latexVerbEndDelim:                "verb_end_delim"
    of latexCsThanks:                    "cs_thanks"
    of latexThebibliographyEnd:          "thebibliography_end"
    of latexLstlistingNameGroup:         "lstlisting_name_group"
    of latexCsNewline:                   "cs_newline"
    of latexEnvNamePicture:              "env_name_picture"
    of latexMathEnd:                     "math_end"
    of latexHidNumberParameter:          "_number_parameter"
    of latexCsEnd:                       "cs_end"
    of latexHidCsParameter:              "_cs_parameter"
    of latexIgnoredLine:                 "ignored_line"
    of latexCsCheckCommand:              "cs_CheckCommand"
    of latexCommentNameGroup:            "comment_name_group"
    of latexTikzpictureTextEnv:          "tikzpicture_text_env"
    of latexHidTextExpandedParameter:    "_text_expanded_parameter"
    of latexHidCommonExpandedParameter:  "_common_expanded_parameter"
    of latexCsSqrt:                      "cs_sqrt"
    of latexHidCmdApply:                 "_cmd_apply"
    of latexCsWarningInfo:               "cs_WarningInfo"
    of latexCsMakeVerbDelim:             "cs_make_verb_delim"
    of latexHidDeleteVerbDelimParameter: "_delete_verb_delim_parameter"
    of latexCsNewlength:                 "cs_newlength"
    of latexTheoremBegin:                "theorem_begin"
    of latexThebibliographyBegin:        "thebibliography_begin"
    of latexCsRefrange:                  "cs_refrange"
    of latexDseriesEnd:                  "dseries_end"
    of latexCsFootnotemark:              "cs_footnotemark"
    of latexDimensionBrackGroup:         "dimension_brack_group"
    of latexCsRestorecr:                 "cs_restorecr"
    of latexCsPagestyle:                 "cs_pagestyle"
    of latexHidDimensionBrackGroup:      "_dimension_brack_group"
    of latexCsProvidesExpl:              "cs_ProvidesExpl"
    of latexMintedEnd:                   "minted_end"
    of latexCsDeleteVerbDelim:           "cs_delete_verb_delim"
    of latexCsGroup:                     "cs_group"
    of latexTextMulticolumn:             "text_multicolumn"
    of latexDisplayMathEnd:              "display_math_end"
    of latexArrayNameGroup:              "array_name_group"
    of latexCsInput:                     "cs_input"
    of latexCsTitle:                     "cs_title"
    of latexCsGlsentry:                  "cs_glsentry"
    of latexCsAddvspace:                 "cs_addvspace"
    of latexCsVolcites:                  "cs_volcites"
    of latexFilecontentsEnd:             "filecontents_end"
    of latexMinipageEnd:                 "minipage_end"
    of latexFixedPair:                   "fixed_pair"
    of latexLuacodeEnd:                  "luacode_end"
    of latexHidApplyParameter:           "_apply_parameter"
    of latexCsExplSyntaxOn:              "cs_ExplSyntaxOn"
    of latexTextNonEscape:               "text_non_escape"
    of latexCsIfFileExists:              "cs_IfFileExists"
    of latexCsPassOptionsTo:             "cs_PassOptionsTo"
    of latexCsNewcounter:                "cs_newcounter"
    of latexInlineMathEnd:               "inline_math_end"
    of latexCsHyperbaseurl:              "cs_hyperbaseurl"
    of latexMathBegin:                   "math_begin"
    of latexInlineMathNameGroup:         "inline_math_name_group"
    of latexDocumentNameGroup:           "document_name_group"
    of latexHidTextToken:                "_text_token"
    of latexApplyGroup:                  "apply_group"
    of latexCsVolcite:                   "cs_volcite"
    of latexCsNeedsTeXFOrmat:            "cs_NeedsTeXFormat"
    of latexDmathBegin:                  "dmath_begin"
    of latexEnvNameTabu:                 "env_name_tabu"
    of latexMakeVerbDelimGroup:          "make_verb_delim_group"
    of latexCsPar:                       "cs_par"
    of latexTabularstarNameGroup:        "tabularstar_name_group"
    of latexHidNameParameter:            "_name_parameter"
    of latexShortVerbDelim:              "short_verb_delim"
    of latexPictureNameGroup:            "picture_name_group"
    of latexCsNewacronym:                "cs_newacronym"
    of latexCsAt:                        "cs_At"
    of latexCsRight:                     "cs_right"
    of latexCsFref:                      "cs_fref"
    of latexCsNewtheorem:                "cs_newtheorem"
    of latexCsTextstyle:                 "cs_textstyle"
    of latexLrboxNameGroup:              "lrbox_name_group"
    of latexTabuBegin:                   "tabu_begin"
    of latexLuacodestarBegin:            "luacodestar_begin"
    of latexCsEnsuremath:                "cs_ensuremath"
    of latexDocumentBegin:               "document_begin"
    of latexCsGlsdisp:                   "cs_glsdisp"
    of latexCsLongnewglossaryentry:      "cs_longnewglossaryentry"
    of latexEnvNameLrbox:                "env_name_lrbox"
    of latexHidGlueBrackParameter:       "_glue_brack_parameter"
    of latexCsNewfont:                   "cs_newfont"
    of latexCsPagenumbering:             "cs_pagenumbering"
    of latexCsItem:                      "cs_item"
    of latexGnuplotNameGroup:            "gnuplot_name_group"
    of latexHidTextGroup:                "_text_group"
    of latexCsDate:                      "cs_date"
    of latexFilecontentsBegin:           "filecontents_begin"
    of latexTikzpictureBegin:            "tikzpicture_begin"
    of latexCsLua:                       "cs_lua"
    of latexCsLstinline:                 "cs_lstinline"
    of latexTextSingle:                  "text_single"
    of latexMathNameGroup:               "math_name_group"
    of latexHidDimension:                "_dimension"
    of latexCsMakebox:                   "cs_makebox"
    of latexCsExecuteOptions:            "cs_ExecuteOptions"
    of latexArrayEnd:                    "array_end"
    of latexCsLuacode:                   "cs_luacode"
    of latexHidScopeEnd:                 "_scope_end"
    of latexTabularNameGroup:            "tabular_name_group"
    of latexCsNewenvironment:            "cs_newenvironment"
    of latexEnvNameAlignat:              "env_name_alignat"
    of latexCsRaisebox:                  "cs_raisebox"
    of latexAlignatNameGroup:            "alignat_name_group"
    of latexCsExplSyntaxOff:             "cs_ExplSyntaxOff"
    of latexHidNameGroup:                "_name_group"
    of latexTextExpandafter:             "text_expandafter"
    of latexCommentBegin:                "comment_begin"
    of latexMathShiftEnd:                "math_shift_end"
    of latexHidTextMode:                 "_text_mode"
    of latexVerbatimEnd:                 "Verbatim_end"
    of latexCsSetto:                     "cs_setto"
    of latexLuacodeBegin:                "luacode_begin"
    of latexNameGroup:                   "name_group"
    of latexCsCsname:                    "cs_csname"
    of latexTabularBegin:                "tabular_begin"
    of latexCsCline:                     "cs_cline"
    of latexTikzpictureEnd:              "tikzpicture_end"
    of latexEnvName:                     "env_name"
    of latexTabuTextEnv:                 "tabu_text_env"
    of latexHidScopeBegin:               "_scope_begin"
    of latexCsMbox:                      "cs_mbox"
    of latexCsObeycr:                    "cs_obeycr"
    of latexInlineMathBegin:             "inline_math_begin"
    of latexCsGlssee:                    "cs_glssee"
    of latexEnvNameArray:                "env_name_array"
    of latexCsExpandafter:               "cs_expandafter"
    of latexEgroup:                      "egroup"
    of latexCsMathstyle:                 "cs_mathstyle"
    of latexBgroup:                      "bgroup"
    of latexCsText:                      "cs_text"
    of latexCsDoNotIndex:                "cs_DoNotIndex"
    of latexCsSection:                   "cs_section"
    of latexCsDisplayMathEnd:            "cs_display_math_end"
    of latexEnvNameMinipage:             "env_name_minipage"
    of latexDocumentEnd:                 "document_end"
    of latexLuacodestarEnd:              "luacodestar_end"
    of latexCsGlsAcr:                    "cs_gls_acr"
    of latexTableBegin:                  "table_begin"
    of latexCsRegexp:                    "cs_regexp"
    of latexEnvNameDocument:             "env_name_document"
    of latexEnvNameInlineMath:           "env_name_inline_math"
    of latexPictureBegin:                "picture_begin"
    of latexLuacodeNameGroup:            "luacode_name_group"
    of latexMintedNameGroup:             "minted_name_group"
    of latexCsPhantomSmash:              "cs_phantom_smash"
    of latexEnvNameLstlisting:           "env_name_lstlisting"
    of latexCsSavebox:                   "cs_savebox"
    of latexExitMath:                    "exit_math"
    of latexHidMathGroup:                "_math_group"
    of latexEnvNameFilecontents:         "env_name_filecontents"
    of latexNilGroup:                    "nil_group"
    of latexDisplayMathShiftEnd:         "display_math_shift_end"
    of latexCsRef:                       "cs_ref"
    of latexEnvNameDseries:              "env_name_dseries"
    of latexDseriesNameGroup:            "dseries_name_group"
    of latexCsCite:                      "cs_cite"
    of latexMinipageBegin:               "minipage_begin"
    of latexCsSpace:                     "cs_space"
    of latexTextProtect:                 "text_protect"
    of latexCsMakeatletter:              "cs_makeatletter"
    of latexDseriesBegin:                "dseries_begin"
    of latexCsEnlargethispage:           "cs_enlargethispage"
    of latexTextBegin:                   "text_begin"
    of latexCsUsebox:                    "cs_usebox"
    of latexTikzpictureMathEnv:          "tikzpicture_math_env"
    of latexTextGroup:                   "text_group"
    of latexCsLinebreak:                 "cs_linebreak"
    of latexCsMarginpar:                 "cs_marginpar"
    of latexCsValue:                     "cs_value"
    of latexCsEmph:                      "cs_emph"
    of latexDisplayMathNameGroup:        "display_math_name_group"
    of latexEnvNameLuacode:              "env_name_luacode"
    of latexDeleteVerbDelimGroup:        "delete_verb_delim_group"
    of latexCsVerb:                      "cs_verb"
    of latexGnuplotEnd:                  "gnuplot_end"
    of latexLrboxBegin:                  "lrbox_begin"
    of latexCsAuthor:                    "cs_author"
    of latexTextEnd:                     "text_end"
    of latexTabularEnd:                  "tabular_end"
    of latexCsProcessOptions:            "cs_ProcessOptions"
    of latexCsEgroup:                    "cs_egroup"
    of latexCsInlineMathEnd:             "cs_inline_math_end"
    of latexCsHyphenation:               "cs_hyphenation"
    of latexParEol:                      "par_eol"
    of latexMathGroup:                   "math_group"
    of latexCsInlineMathBegin:           "cs_inline_math_begin"
    of latexDmathEnd:                    "dmath_end"
    of latexTableEnd:                    "table_end"
    of latexCsMintinline:                "cs_mintinline"
    of latexTabuMathEnv:                 "tabu_math_env"
    of latexHidNilMode:                  "_nil_mode"
    of latexCsNewglossaryentry:          "cs_newglossaryentry"
    of latexEnvNameTheorem:              "env_name_theorem"
    of latexCsRelax:                     "cs_relax"
    of latexCsPagebreak:                 "cs_pagebreak"
    of latexCsBegingroup:                "cs_begingroup"
    of latexHidNilGroup:                 "_nil_group"
    of latexCommentEnd:                  "comment_end"
    of latexCsUse:                       "cs_use"
    of latexTheoremEnd:                  "theorem_end"
    of latexHidCommon:                   "_common"
    of latexCsDisplayMathBegin:          "cs_display_math_begin"
    of latexCsMulticolumn:               "cs_multicolumn"
    of latexIgnoredRest:                 "ignored_rest"
    of latexGlueBrackGroup:              "glue_brack_group"
    of latexCsStepcounter:               "cs_stepcounter"
    of latexCsLabel:                     "cs_label"
    of latexEnvNameDmath:                "env_name_dmath"
    of latexHidMakeVerbDelimParameter:   "_make_verb_delim_parameter"
    of latexFigureEnd:                   "figure_end"
    of latexCsBegin:                     "cs_begin"
    of latexSyntaxError:                 "ERROR"

type
  LatexExternalTok* = enum
    latexExtern_cmd_apply               ## _cmd_apply
    latexExtern_env_begin               ## _env_begin
    latexExtern_env_end                 ## _env_end
    latexExtern_scope_begin             ## _scope_begin
    latexExtern_scope_end               ## _scope_end
    latexExtern_space                   ## _space
    latexExternActive_char              ## active_char
    latexExternAlignment_tab            ## alignment_tab
    latexExternBacktick                 ## backtick
    latexExternChar_ref_invalid         ## char_ref_invalid
    latexExternComma                    ## comma
    latexExternComment_arara            ## comment_arara
    latexExternComment_bib              ## comment_bib
    latexExternComment_tag              ## comment_tag
    latexExternComment_tex              ## comment_tex
    latexExternComment                  ## comment
    latexExternCs_addvspace             ## cs_addvspace
    latexExternCs_at_ifpackagelater     ## cs_at_ifpackagelater
    latexExternCs_At                    ## cs_At
    latexExternCs_author                ## cs_author
    latexExternCs_begin                 ## cs_begin
    latexExternCs_begingroup            ## cs_begingroup
    latexExternCs_bgroup                ## cs_bgroup
    latexExternCs_bibitem               ## cs_bibitem
    latexExternCs_CheckCommand          ## cs_CheckCommand
    latexExternCs_cite                  ## cs_cite
    latexExternCs_cites                 ## cs_cites
    latexExternCs_cline                 ## cs_cline
    latexExternCs_code                  ## cs_code
    latexExternCs_csname                ## cs_csname
    latexExternCs_date                  ## cs_date
    latexExternCs_DeclareOption         ## cs_DeclareOption
    latexExternCs_def                   ## cs_def
    latexExternCs_delete_verb_delim     ## cs_delete_verb_delim
    latexExternCs_DeleteShortVerb       ## cs_DeleteShortVerb
    latexExternCs_discretionary         ## cs_discretionary
    latexExternCs_display_math_begin    ## cs_display_math_begin
    latexExternCs_display_math_end      ## cs_display_math_end
    latexExternCs_DoNotIndex            ## cs_DoNotIndex
    latexExternCs_egroup                ## cs_egroup
    latexExternCs_emph                  ## cs_emph
    latexExternCs_end                   ## cs_end
    latexExternCs_endcsname             ## cs_endcsname
    latexExternCs_endgroup              ## cs_endgroup
    latexExternCs_endinput              ## cs_endinput
    latexExternCs_enlargethispage       ## cs_enlargethispage
    latexExternCs_ensuremath            ## cs_ensuremath
    latexExternCs_Error                 ## cs_Error
    latexExternCs_ExecuteOptions        ## cs_ExecuteOptions
    latexExternCs_expandafter           ## cs_expandafter
    latexExternCs_ExplSyntaxOff         ## cs_ExplSyntaxOff
    latexExternCs_ExplSyntaxOn          ## cs_ExplSyntaxOn
    latexExternCs_footnote              ## cs_footnote
    latexExternCs_footnotemark          ## cs_footnotemark
    latexExternCs_frac                  ## cs_frac
    latexExternCs_fref                  ## cs_fref
    latexExternCs_gls_acr               ## cs_gls_acr
    latexExternCs_glsdisp               ## cs_glsdisp
    latexExternCs_glsentry              ## cs_glsentry
    latexExternCs_glssee                ## cs_glssee
    latexExternCs_href                  ## cs_href
    latexExternCs_hyperbaseurl          ## cs_hyperbaseurl
    latexExternCs_hyperimage            ## cs_hyperimage
    latexExternCs_hyperref              ## cs_hyperref
    latexExternCs_hyphenation           ## cs_hyphenation
    latexExternCs_IfFileExists          ## cs_IfFileExists
    latexExternCs_inline_math_begin     ## cs_inline_math_begin
    latexExternCs_inline_math_end       ## cs_inline_math_end
    latexExternCs_input                 ## cs_input
    latexExternCs_item                  ## cs_item
    latexExternCs_label                 ## cs_label
    latexExternCs_left                  ## cs_left
    latexExternCs_let                   ## cs_let
    latexExternCs_linebreak             ## cs_linebreak
    latexExternCs_longnewglossaryentry  ## cs_longnewglossaryentry
    latexExternCs_lstinline             ## cs_lstinline
    latexExternCs_lua                   ## cs_lua
    latexExternCs_luacode               ## cs_luacode
    latexExternCs_make_verb_delim       ## cs_make_verb_delim
    latexExternCs_makeatletter          ## cs_makeatletter
    latexExternCs_makeatother           ## cs_makeatother
    latexExternCs_makebox               ## cs_makebox
    latexExternCs_MakeShortVerb         ## cs_MakeShortVerb
    latexExternCs_marginpar             ## cs_marginpar
    latexExternCs_mathaccent            ## cs_mathaccent
    latexExternCs_mathstyle             ## cs_mathstyle
    latexExternCs_mbox                  ## cs_mbox
    latexExternCs_mint                  ## cs_mint
    latexExternCs_mintinline            ## cs_mintinline
    latexExternCs_multicolumn           ## cs_multicolumn
    latexExternCs_NeedsTeXFormat        ## cs_NeedsTeXFormat
    latexExternCs_newacronym            ## cs_newacronym
    latexExternCs_newcommand            ## cs_newcommand
    latexExternCs_newcounter            ## cs_newcounter
    latexExternCs_newenvironment        ## cs_newenvironment
    latexExternCs_newfont               ## cs_newfont
    latexExternCs_newglossaryentry      ## cs_newglossaryentry
    latexExternCs_newlength             ## cs_newlength
    latexExternCs_newline               ## cs_newline
    latexExternCs_newsavebox            ## cs_newsavebox
    latexExternCs_newtheorem            ## cs_newtheorem
    latexExternCs_nocite                ## cs_nocite
    latexExternCs_obeycr                ## cs_obeycr
    latexExternCs_pagebreak             ## cs_pagebreak
    latexExternCs_pagenumbering         ## cs_pagenumbering
    latexExternCs_pagestyle             ## cs_pagestyle
    latexExternCs_par                   ## cs_par
    latexExternCs_parbox                ## cs_parbox
    latexExternCs_PassOptionsTo         ## cs_PassOptionsTo
    latexExternCs_phantom_smash         ## cs_phantom_smash
    latexExternCs_printcounter          ## cs_printcounter
    latexExternCs_ProcessOptions        ## cs_ProcessOptions
    latexExternCs_protect               ## cs_protect
    latexExternCs_Provides              ## cs_Provides
    latexExternCs_ProvidesExpl          ## cs_ProvidesExpl
    latexExternCs_raisebox              ## cs_raisebox
    latexExternCs_ref                   ## cs_ref
    latexExternCs_refrange              ## cs_refrange
    latexExternCs_regexp                ## cs_regexp
    latexExternCs_relax                 ## cs_relax
    latexExternCs_restorecr             ## cs_restorecr
    latexExternCs_right                 ## cs_right
    latexExternCs_savebox               ## cs_savebox
    latexExternCs_sbox                  ## cs_sbox
    latexExternCs_section               ## cs_section
    latexExternCs_setcounter            ## cs_setcounter
    latexExternCs_setlength             ## cs_setlength
    latexExternCs_setto                 ## cs_setto
    latexExternCs_space                 ## cs_space
    latexExternCs_sqrt                  ## cs_sqrt
    latexExternCs_stackrel              ## cs_stackrel
    latexExternCs_stepcounter           ## cs_stepcounter
    latexExternCs_string                ## cs_string
    latexExternCs_tag                   ## cs_tag
    latexExternCs_text                  ## cs_text
    latexExternCs_textstyle             ## cs_textstyle
    latexExternCs_thanks                ## cs_thanks
    latexExternCs_title                 ## cs_title
    latexExternCs_url                   ## cs_url
    latexExternCs_use_209               ## cs_use_209
    latexExternCs_use                   ## cs_use
    latexExternCs_usebox                ## cs_usebox
    latexExternCs_value                 ## cs_value
    latexExternCs_verb                  ## cs_verb
    latexExternCs_volcite               ## cs_volcite
    latexExternCs_volcites              ## cs_volcites
    latexExternCs_WarningInfo           ## cs_WarningInfo
    latexExternCs                       ## cs
    latexExternDecimal                  ## decimal
    latexExternDisplay_math_shift_end   ## display_math_shift_end
    latexExternDisplay_math_shift       ## display_math_shift
    latexExternEnv_name_alignat         ## env_name_alignat
    latexExternEnv_name_array           ## env_name_array
    latexExternEnv_name_comment         ## env_name_comment
    latexExternEnv_name_display_math    ## env_name_display_math
    latexExternEnv_name_dmath           ## env_name_dmath
    latexExternEnv_name_document        ## env_name_document
    latexExternEnv_name_dseries         ## env_name_dseries
    latexExternEnv_name_figure          ## env_name_figure
    latexExternEnv_name_filecontents    ## env_name_filecontents
    latexExternEnv_name_gnuplot         ## env_name_gnuplot
    latexExternEnv_name_inline_math     ## env_name_inline_math
    latexExternEnv_name_itemize         ## env_name_itemize
    latexExternEnv_name_lrbox           ## env_name_lrbox
    latexExternEnv_name_lstlisting      ## env_name_lstlisting
    latexExternEnv_name_luacode         ## env_name_luacode
    latexExternEnv_name_luacodestar     ## env_name_luacodestar
    latexExternEnv_name_math            ## env_name_math
    latexExternEnv_name_minipage        ## env_name_minipage
    latexExternEnv_name_minted          ## env_name_minted
    latexExternEnv_name_picture         ## env_name_picture
    latexExternEnv_name_table           ## env_name_table
    latexExternEnv_name_tabu            ## env_name_tabu
    latexExternEnv_name_tabular         ## env_name_tabular
    latexExternEnv_name_tabularstar     ## env_name_tabularstar
    latexExternEnv_name_text            ## env_name_text
    latexExternEnv_name_thebibliography ## env_name_thebibliography
    latexExternEnv_name_theorem         ## env_name_theorem
    latexExternEnv_name_tikzpicture     ## env_name_tikzpicture
    latexExternEnv_name_verbatim        ## env_name_verbatim
    latexExternEnv_name_Verbatim_2      ## env_name_Verbatim
    latexExternEnv_name                 ## env_name
    latexExternEol                      ## eol
    latexExternEquals                   ## equals
    latexExternExit_math                ## exit_math
    latexExternExit                     ## exit
    latexExternFixed                    ## fixed
    latexExternHexadecimal              ## hexadecimal
    latexExternIgnored_line             ## ignored_line
    latexExternIgnored_rest             ## ignored_rest
    latexExternIgnored                  ## ignored
    latexExternInvalid                  ## invalid
    latexExternL                        ## l
    latexExternLbrack                   ## lbrack
    latexExternLparen                   ## lparen
    latexExternMath_shift_end           ## math_shift_end
    latexExternMath_shift               ## math_shift
    latexExternMinus                    ## minus
    latexExternName                     ## name
    latexExternOctal                    ## octal
    latexExternPar_eol                  ## par_eol
    latexExternParameter_ref            ## parameter_ref
    latexExternPlus_sym                 ## plus_sym
    latexExternPlus                     ## plus
    latexExternR                        ## r
    latexExternRbrack                   ## rbrack
    latexExternRparen                   ## rparen
    latexExternShort_verb_delim         ## short_verb_delim
    latexExternSpread                   ## spread
    latexExternStar                     ## star
    latexExternSubscript                ## subscript
    latexExternSuperscript              ## superscript
    latexExternText_non_escape          ## text_non_escape
    latexExternText_single              ## text_single
    latexExternText                     ## text
    latexExternTo                       ## to
    latexExternUnit                     ## unit
    latexExternVerb_body                ## verb_body
    latexExternVerb_delim_no_lbrack     ## verb_delim_no_lbrack
    latexExternVerb_delim               ## verb_delim
    latexExternVerb_end_delim           ## verb_end_delim
    latexExternVerbatim                 ## verbatim

type
  TsLatexNode* = distinct TSNode

type
  LatexParser* = distinct PtsParser

const latexAllowedSubnodes*: array[LatexNodeKind, set[LatexNodeKind]] = block:
                                                                          var tmp: array[LatexNodeKind, set[LatexNodeKind]]
                                                                          tmp[latexAt] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexCheckCommand] = {
                                                                                                     latexBrackGroup,
                                                                                                     latexCs,
                                                                                                     latexExit,
                                                                                                     latexGroup,
                                                                                                     latexPar,
                                                                                                     latexParameterRef,
                                                                                                     latexStar,
                                                                                                     latexText
                                                                                                   }
                                                                          tmp[latexDeclareOption] = {
                                                                                                      latexCs,
                                                                                                      latexExit,
                                                                                                      latexGroup,
                                                                                                      latexPar,
                                                                                                      latexParameterRef,
                                                                                                      latexStar,
                                                                                                      latexText
                                                                                                    }
                                                                          tmp[latexDeleteShortVerb] = {latexCs, latexExit, latexGroup, latexPar, latexStar}
                                                                          tmp[latexDoNotIndex] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexError] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexExecuteOptions] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexExplSyntaxOff] = {latexCs}
                                                                          tmp[latexExplSyntaxOn] = {latexCs}
                                                                          tmp[latexIfFileExists] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexMakeShortVerb] = {latexCs, latexExit, latexGroup, latexPar, latexStar}
                                                                          tmp[latexNeedsTeXFOrmat] = {
                                                                                                       latexBrackGroup,
                                                                                                       latexCs,
                                                                                                       latexExit,
                                                                                                       latexGroup,
                                                                                                       latexPar,
                                                                                                       latexParameterRef,
                                                                                                       latexText
                                                                                                     }
                                                                          tmp[latexPassOptionsTo] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexProcessOptions] = {latexCs, latexStar}
                                                                          tmp[latexProvides] = {latexBrackGroup, latexCs, latexExit, latexGroup, latexPar, latexParameterRef}
                                                                          tmp[latexProvidesExpl] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexVerbatimEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexWarningInfo] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexAddvspace] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexAlignatEnv] = {
                                                                                                   latexCheckCommand,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexError,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignmentTab,
                                                                                                   latexArrayEnv,
                                                                                                   latexBegin,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDef,
                                                                                                   latexDelimiterGroup,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFrac,
                                                                                                   latexFref,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexIgnored,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexLabel,
                                                                                                   latexLet,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMath,
                                                                                                   latexMathEnv,
                                                                                                   latexMathaccent,
                                                                                                   latexMathstyle,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewlength,
                                                                                                   latexNewsavebox,
                                                                                                   latexParameterRef,
                                                                                                   latexPhantomSmash,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRelax,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexSqrt,
                                                                                                   latexStackrel,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexSubscript,
                                                                                                   latexSuperscript,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTag,
                                                                                                   latexTextCmd,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexUrl,
                                                                                                   latexValue,
                                                                                                   latexVerb
                                                                                                 }
                                                                          tmp[latexArrayEnv] = {
                                                                                                 latexCheckCommand,
                                                                                                 latexDeleteShortVerb,
                                                                                                 latexError,
                                                                                                 latexExplSyntaxOff,
                                                                                                 latexExplSyntaxOn,
                                                                                                 latexIfFileExists,
                                                                                                 latexMakeShortVerb,
                                                                                                 latexWarningInfo,
                                                                                                 latexActiveChar,
                                                                                                 latexAddvspace,
                                                                                                 latexAlignmentTab,
                                                                                                 latexArrayEnv,
                                                                                                 latexBegin,
                                                                                                 latexCharRefInvalid,
                                                                                                 latexCline,
                                                                                                 latexCode,
                                                                                                 latexCs,
                                                                                                 latexCsnameGroup,
                                                                                                 latexDef,
                                                                                                 latexDelimiterGroup,
                                                                                                 latexEnd,
                                                                                                 latexEndinput,
                                                                                                 latexEnsuremath,
                                                                                                 latexExit,
                                                                                                 latexExpandafter,
                                                                                                 latexFrac,
                                                                                                 latexFref,
                                                                                                 latexGroup,
                                                                                                 latexHref,
                                                                                                 latexHyperbaseurl,
                                                                                                 latexHyperimage,
                                                                                                 latexHyperref,
                                                                                                 latexIgnored,
                                                                                                 latexInput,
                                                                                                 latexInvalid,
                                                                                                 latexLabel,
                                                                                                 latexLet,
                                                                                                 latexLua,
                                                                                                 latexLuacode,
                                                                                                 latexLuacodeEnv,
                                                                                                 latexLuacodestarEnv,
                                                                                                 latexMakeatletter,
                                                                                                 latexMakeatother,
                                                                                                 latexMath,
                                                                                                 latexMathEnv,
                                                                                                 latexMathaccent,
                                                                                                 latexMathstyle,
                                                                                                 latexMulticolumn,
                                                                                                 latexNewcommand,
                                                                                                 latexNewcounter,
                                                                                                 latexNewenvironment,
                                                                                                 latexNewfont,
                                                                                                 latexNewlength,
                                                                                                 latexNewsavebox,
                                                                                                 latexParameterRef,
                                                                                                 latexPhantomSmash,
                                                                                                 latexPrintcounter,
                                                                                                 latexProtect,
                                                                                                 latexRef,
                                                                                                 latexRefrange,
                                                                                                 latexRelax,
                                                                                                 latexSetcounter,
                                                                                                 latexSetlength,
                                                                                                 latexSetto,
                                                                                                 latexShortVerb,
                                                                                                 latexSpace,
                                                                                                 latexSqrt,
                                                                                                 latexStackrel,
                                                                                                 latexStepcounter,
                                                                                                 latexString,
                                                                                                 latexSubscript,
                                                                                                 latexSuperscript,
                                                                                                 latexTabuEnv,
                                                                                                 latexTabularEnv,
                                                                                                 latexTabularstarEnv,
                                                                                                 latexTag,
                                                                                                 latexTextCmd,
                                                                                                 latexTikzpictureEnv,
                                                                                                 latexUrl,
                                                                                                 latexValue,
                                                                                                 latexVerb
                                                                                               }
                                                                          tmp[latexAtIfpackagelater] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexAuthor] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexBegin] = {
                                                                                              latexBrackGroup,
                                                                                              latexCs,
                                                                                              latexDimension,
                                                                                              latexEol,
                                                                                              latexFixed,
                                                                                              latexGroup,
                                                                                              latexParameterRef,
                                                                                              latexParenGroup,
                                                                                              latexSpread,
                                                                                              latexText,
                                                                                              latexTo
                                                                                            }
                                                                          tmp[latexBegingroup] = {latexCs}
                                                                          tmp[latexBibitem] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexBrackGroup] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexArrayEnv,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDelimiterGroup,
                                                                                                   latexDimension,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFixed,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFrac,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGlue,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLbrack,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMath,
                                                                                                   latexMathEnv,
                                                                                                   latexMathaccent,
                                                                                                   latexMathstyle,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPhantomSmash,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRbrack,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexSqrt,
                                                                                                   latexStackrel,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexSubscript,
                                                                                                   latexSuperscript,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTag,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextCmd,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexCharcode] = {latexBacktick, latexCs, latexText}
                                                                          tmp[latexCite] = {
                                                                                             latexBrackGroup,
                                                                                             latexCs,
                                                                                             latexExit,
                                                                                             latexGroup,
                                                                                             latexPar,
                                                                                             latexParameterRef,
                                                                                             latexStar,
                                                                                             latexText
                                                                                           }
                                                                          tmp[latexCites] = {
                                                                                              latexBrackGroup,
                                                                                              latexCs,
                                                                                              latexExit,
                                                                                              latexGroup,
                                                                                              latexPar,
                                                                                              latexParameterRef,
                                                                                              latexText
                                                                                            }
                                                                          tmp[latexCline] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexCode] = {
                                                                                             latexCharcode,
                                                                                             latexCs,
                                                                                             latexDecimal,
                                                                                             latexEquals,
                                                                                             latexExit,
                                                                                             latexHexadecimal,
                                                                                             latexOctal,
                                                                                             latexPar,
                                                                                             latexParameterRef
                                                                                           }
                                                                          tmp[latexCommentEnv] = {latexBegin, latexCommentBlock, latexEnd, latexExit}
                                                                          tmp[latexCsname] = {latexCs}
                                                                          tmp[latexCsnameGroup] = {latexCs, latexCsname, latexEndcsname, latexGroup, latexParameterRef, latexText}
                                                                          tmp[latexDate] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexDef] = {
                                                                                            latexActiveChar,
                                                                                            latexCs,
                                                                                            latexExit,
                                                                                            latexGroup,
                                                                                            latexPar,
                                                                                            latexParameterRef,
                                                                                            latexText
                                                                                          }
                                                                          tmp[latexDelimiterGroup] = {
                                                                                                       latexCheckCommand,
                                                                                                       latexDeleteShortVerb,
                                                                                                       latexError,
                                                                                                       latexExplSyntaxOff,
                                                                                                       latexExplSyntaxOn,
                                                                                                       latexIfFileExists,
                                                                                                       latexMakeShortVerb,
                                                                                                       latexWarningInfo,
                                                                                                       latexActiveChar,
                                                                                                       latexAddvspace,
                                                                                                       latexAlignmentTab,
                                                                                                       latexArrayEnv,
                                                                                                       latexCharRefInvalid,
                                                                                                       latexCline,
                                                                                                       latexCode,
                                                                                                       latexCs,
                                                                                                       latexCsnameGroup,
                                                                                                       latexDef,
                                                                                                       latexDelimiterGroup,
                                                                                                       latexEndinput,
                                                                                                       latexEnsuremath,
                                                                                                       latexExit,
                                                                                                       latexExpandafter,
                                                                                                       latexFrac,
                                                                                                       latexFref,
                                                                                                       latexGroup,
                                                                                                       latexHref,
                                                                                                       latexHyperbaseurl,
                                                                                                       latexHyperimage,
                                                                                                       latexHyperref,
                                                                                                       latexIgnored,
                                                                                                       latexInput,
                                                                                                       latexInvalid,
                                                                                                       latexLabel,
                                                                                                       latexLeft,
                                                                                                       latexLet,
                                                                                                       latexLua,
                                                                                                       latexLuacode,
                                                                                                       latexLuacodeEnv,
                                                                                                       latexLuacodestarEnv,
                                                                                                       latexMakeatletter,
                                                                                                       latexMakeatother,
                                                                                                       latexMath,
                                                                                                       latexMathEnv,
                                                                                                       latexMathaccent,
                                                                                                       latexMathstyle,
                                                                                                       latexMulticolumn,
                                                                                                       latexNewcommand,
                                                                                                       latexNewcounter,
                                                                                                       latexNewenvironment,
                                                                                                       latexNewfont,
                                                                                                       latexNewlength,
                                                                                                       latexNewsavebox,
                                                                                                       latexParameterRef,
                                                                                                       latexPhantomSmash,
                                                                                                       latexPrintcounter,
                                                                                                       latexProtect,
                                                                                                       latexRef,
                                                                                                       latexRefrange,
                                                                                                       latexRelax,
                                                                                                       latexRight,
                                                                                                       latexSetcounter,
                                                                                                       latexSetlength,
                                                                                                       latexSetto,
                                                                                                       latexShortVerb,
                                                                                                       latexSpace,
                                                                                                       latexSqrt,
                                                                                                       latexStackrel,
                                                                                                       latexStepcounter,
                                                                                                       latexString,
                                                                                                       latexSubscript,
                                                                                                       latexSuperscript,
                                                                                                       latexTabuEnv,
                                                                                                       latexTabularEnv,
                                                                                                       latexTabularstarEnv,
                                                                                                       latexTag,
                                                                                                       latexTextCmd,
                                                                                                       latexTikzpictureEnv,
                                                                                                       latexUrl,
                                                                                                       latexValue,
                                                                                                       latexVerb
                                                                                                     }
                                                                          tmp[latexDimension] = {latexFixed, latexUnit}
                                                                          tmp[latexDiscretionary] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexDisplayMathEnv] = {
                                                                                                       latexCheckCommand,
                                                                                                       latexDeleteShortVerb,
                                                                                                       latexError,
                                                                                                       latexExplSyntaxOff,
                                                                                                       latexExplSyntaxOn,
                                                                                                       latexIfFileExists,
                                                                                                       latexMakeShortVerb,
                                                                                                       latexWarningInfo,
                                                                                                       latexActiveChar,
                                                                                                       latexAddvspace,
                                                                                                       latexAlignmentTab,
                                                                                                       latexArrayEnv,
                                                                                                       latexBegin,
                                                                                                       latexCharRefInvalid,
                                                                                                       latexCline,
                                                                                                       latexCode,
                                                                                                       latexCs,
                                                                                                       latexCsnameGroup,
                                                                                                       latexDef,
                                                                                                       latexDelimiterGroup,
                                                                                                       latexEnd,
                                                                                                       latexEndinput,
                                                                                                       latexEnsuremath,
                                                                                                       latexExit,
                                                                                                       latexExpandafter,
                                                                                                       latexFrac,
                                                                                                       latexFref,
                                                                                                       latexGroup,
                                                                                                       latexHref,
                                                                                                       latexHyperbaseurl,
                                                                                                       latexHyperimage,
                                                                                                       latexHyperref,
                                                                                                       latexIgnored,
                                                                                                       latexInput,
                                                                                                       latexInvalid,
                                                                                                       latexLabel,
                                                                                                       latexLet,
                                                                                                       latexLua,
                                                                                                       latexLuacode,
                                                                                                       latexLuacodeEnv,
                                                                                                       latexLuacodestarEnv,
                                                                                                       latexMakeatletter,
                                                                                                       latexMakeatother,
                                                                                                       latexMath,
                                                                                                       latexMathEnv,
                                                                                                       latexMathaccent,
                                                                                                       latexMathstyle,
                                                                                                       latexMulticolumn,
                                                                                                       latexNewcommand,
                                                                                                       latexNewcounter,
                                                                                                       latexNewenvironment,
                                                                                                       latexNewfont,
                                                                                                       latexNewlength,
                                                                                                       latexNewsavebox,
                                                                                                       latexParameterRef,
                                                                                                       latexPhantomSmash,
                                                                                                       latexPrintcounter,
                                                                                                       latexProtect,
                                                                                                       latexRef,
                                                                                                       latexRefrange,
                                                                                                       latexRelax,
                                                                                                       latexSetcounter,
                                                                                                       latexSetlength,
                                                                                                       latexSetto,
                                                                                                       latexShortVerb,
                                                                                                       latexSpace,
                                                                                                       latexSqrt,
                                                                                                       latexStackrel,
                                                                                                       latexStepcounter,
                                                                                                       latexString,
                                                                                                       latexSubscript,
                                                                                                       latexSuperscript,
                                                                                                       latexTabuEnv,
                                                                                                       latexTabularEnv,
                                                                                                       latexTabularstarEnv,
                                                                                                       latexTag,
                                                                                                       latexTextCmd,
                                                                                                       latexTikzpictureEnv,
                                                                                                       latexUrl,
                                                                                                       latexValue,
                                                                                                       latexVerb
                                                                                                     }
                                                                          tmp[latexDmathEnv] = {
                                                                                                 latexCheckCommand,
                                                                                                 latexDeleteShortVerb,
                                                                                                 latexError,
                                                                                                 latexExplSyntaxOff,
                                                                                                 latexExplSyntaxOn,
                                                                                                 latexIfFileExists,
                                                                                                 latexMakeShortVerb,
                                                                                                 latexWarningInfo,
                                                                                                 latexActiveChar,
                                                                                                 latexAddvspace,
                                                                                                 latexAlignmentTab,
                                                                                                 latexArrayEnv,
                                                                                                 latexBegin,
                                                                                                 latexCharRefInvalid,
                                                                                                 latexCline,
                                                                                                 latexCode,
                                                                                                 latexCs,
                                                                                                 latexCsnameGroup,
                                                                                                 latexDef,
                                                                                                 latexDelimiterGroup,
                                                                                                 latexEnd,
                                                                                                 latexEndinput,
                                                                                                 latexEnsuremath,
                                                                                                 latexExit,
                                                                                                 latexExpandafter,
                                                                                                 latexFrac,
                                                                                                 latexFref,
                                                                                                 latexGroup,
                                                                                                 latexHref,
                                                                                                 latexHyperbaseurl,
                                                                                                 latexHyperimage,
                                                                                                 latexHyperref,
                                                                                                 latexIgnored,
                                                                                                 latexInput,
                                                                                                 latexInvalid,
                                                                                                 latexLabel,
                                                                                                 latexLet,
                                                                                                 latexLua,
                                                                                                 latexLuacode,
                                                                                                 latexLuacodeEnv,
                                                                                                 latexLuacodestarEnv,
                                                                                                 latexMakeatletter,
                                                                                                 latexMakeatother,
                                                                                                 latexMath,
                                                                                                 latexMathEnv,
                                                                                                 latexMathaccent,
                                                                                                 latexMathstyle,
                                                                                                 latexMulticolumn,
                                                                                                 latexNewcommand,
                                                                                                 latexNewcounter,
                                                                                                 latexNewenvironment,
                                                                                                 latexNewfont,
                                                                                                 latexNewlength,
                                                                                                 latexNewsavebox,
                                                                                                 latexParameterRef,
                                                                                                 latexPhantomSmash,
                                                                                                 latexPrintcounter,
                                                                                                 latexProtect,
                                                                                                 latexRef,
                                                                                                 latexRefrange,
                                                                                                 latexRelax,
                                                                                                 latexSetcounter,
                                                                                                 latexSetlength,
                                                                                                 latexSetto,
                                                                                                 latexShortVerb,
                                                                                                 latexSpace,
                                                                                                 latexSqrt,
                                                                                                 latexStackrel,
                                                                                                 latexStepcounter,
                                                                                                 latexString,
                                                                                                 latexSubscript,
                                                                                                 latexSuperscript,
                                                                                                 latexTabuEnv,
                                                                                                 latexTabularEnv,
                                                                                                 latexTabularstarEnv,
                                                                                                 latexTag,
                                                                                                 latexTextCmd,
                                                                                                 latexTikzpictureEnv,
                                                                                                 latexUrl,
                                                                                                 latexValue,
                                                                                                 latexVerb
                                                                                               }
                                                                          tmp[latexDocument] = {
                                                                                                 latexAt,
                                                                                                 latexCheckCommand,
                                                                                                 latexDeclareOption,
                                                                                                 latexDeleteShortVerb,
                                                                                                 latexDoNotIndex,
                                                                                                 latexError,
                                                                                                 latexExecuteOptions,
                                                                                                 latexExplSyntaxOff,
                                                                                                 latexExplSyntaxOn,
                                                                                                 latexIfFileExists,
                                                                                                 latexMakeShortVerb,
                                                                                                 latexNeedsTeXFOrmat,
                                                                                                 latexPassOptionsTo,
                                                                                                 latexProcessOptions,
                                                                                                 latexProvides,
                                                                                                 latexProvidesExpl,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexWarningInfo,
                                                                                                 latexActiveChar,
                                                                                                 latexAddvspace,
                                                                                                 latexAlignatEnv,
                                                                                                 latexAlignmentTab,
                                                                                                 latexAtIfpackagelater,
                                                                                                 latexAuthor,
                                                                                                 latexBibitem,
                                                                                                 latexCharRefInvalid,
                                                                                                 latexCite,
                                                                                                 latexCites,
                                                                                                 latexCline,
                                                                                                 latexCode,
                                                                                                 latexCommentEnv,
                                                                                                 latexCs,
                                                                                                 latexCsnameGroup,
                                                                                                 latexDate,
                                                                                                 latexDef,
                                                                                                 latexDiscretionary,
                                                                                                 latexDisplayMathEnv,
                                                                                                 latexDmathEnv,
                                                                                                 latexDocumentEnv,
                                                                                                 latexDseriesEnv,
                                                                                                 latexEmph,
                                                                                                 latexEndinput,
                                                                                                 latexEnlargethispage,
                                                                                                 latexEnsuremath,
                                                                                                 latexExpandafter,
                                                                                                 latexFigureEnv,
                                                                                                 latexFilecontentsEnv,
                                                                                                 latexFootnote,
                                                                                                 latexFootnotemark,
                                                                                                 latexFref,
                                                                                                 latexGlsAcr,
                                                                                                 latexGlsdisp,
                                                                                                 latexGlsentry,
                                                                                                 latexGlssee,
                                                                                                 latexGnuplotEnv,
                                                                                                 latexGroup,
                                                                                                 latexHref,
                                                                                                 latexHyperbaseurl,
                                                                                                 latexHyperimage,
                                                                                                 latexHyperref,
                                                                                                 latexHyphenation,
                                                                                                 latexIgnored,
                                                                                                 latexInlineMathEnv,
                                                                                                 latexInput,
                                                                                                 latexInvalid,
                                                                                                 latexItem,
                                                                                                 latexItemizeEnv,
                                                                                                 latexLabel,
                                                                                                 latexLatexDisplayMath,
                                                                                                 latexLatexInlineMath,
                                                                                                 latexLet,
                                                                                                 latexLinebreak,
                                                                                                 latexLongnewglossaryentry,
                                                                                                 latexLrboxEnv,
                                                                                                 latexLstinline,
                                                                                                 latexLstlistingEnv,
                                                                                                 latexLua,
                                                                                                 latexLuacode,
                                                                                                 latexLuacodeEnv,
                                                                                                 latexLuacodestarEnv,
                                                                                                 latexMakeatletter,
                                                                                                 latexMakeatother,
                                                                                                 latexMakebox,
                                                                                                 latexMarginpar,
                                                                                                 latexMbox,
                                                                                                 latexMinipageEnv,
                                                                                                 latexMint,
                                                                                                 latexMintedEnv,
                                                                                                 latexMintinline,
                                                                                                 latexMulticolumn,
                                                                                                 latexNewacronym,
                                                                                                 latexNewcommand,
                                                                                                 latexNewcounter,
                                                                                                 latexNewenvironment,
                                                                                                 latexNewfont,
                                                                                                 latexNewglossaryentry,
                                                                                                 latexNewlength,
                                                                                                 latexNewline,
                                                                                                 latexNewsavebox,
                                                                                                 latexNewtheorem,
                                                                                                 latexNocite,
                                                                                                 latexObeycr,
                                                                                                 latexPagebreak,
                                                                                                 latexPagenumbering,
                                                                                                 latexPagestyle,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexParbox,
                                                                                                 latexPictureEnv,
                                                                                                 latexPrintcounter,
                                                                                                 latexProtect,
                                                                                                 latexRaisebox,
                                                                                                 latexRef,
                                                                                                 latexRefrange,
                                                                                                 latexRegexp,
                                                                                                 latexRelax,
                                                                                                 latexRestorecr,
                                                                                                 latexSavebox,
                                                                                                 latexSbox,
                                                                                                 latexSection,
                                                                                                 latexSemiSimpleGroup,
                                                                                                 latexSetcounter,
                                                                                                 latexSetlength,
                                                                                                 latexSetto,
                                                                                                 latexShortVerb,
                                                                                                 latexSpace,
                                                                                                 latexStepcounter,
                                                                                                 latexString,
                                                                                                 latexTableEnv,
                                                                                                 latexTabuEnv,
                                                                                                 latexTabularEnv,
                                                                                                 latexTabularstarEnv,
                                                                                                 latexTexDisplayMath,
                                                                                                 latexTexInlineMath,
                                                                                                 latexText,
                                                                                                 latexTextEnv,
                                                                                                 latexTextstyle,
                                                                                                 latexThanks,
                                                                                                 latexThebibliographyEnv,
                                                                                                 latexTheoremEnv,
                                                                                                 latexTikzpictureEnv,
                                                                                                 latexTitle,
                                                                                                 latexUrl,
                                                                                                 latexUse,
                                                                                                 latexUse209,
                                                                                                 latexUsebox,
                                                                                                 latexValue,
                                                                                                 latexVerb,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexVolcite,
                                                                                                 latexVolcites
                                                                                               }
                                                                          tmp[latexDocumentEnv] = {
                                                                                                    latexAt,
                                                                                                    latexCheckCommand,
                                                                                                    latexDeclareOption,
                                                                                                    latexDeleteShortVerb,
                                                                                                    latexDoNotIndex,
                                                                                                    latexError,
                                                                                                    latexExecuteOptions,
                                                                                                    latexExplSyntaxOff,
                                                                                                    latexExplSyntaxOn,
                                                                                                    latexIfFileExists,
                                                                                                    latexMakeShortVerb,
                                                                                                    latexNeedsTeXFOrmat,
                                                                                                    latexPassOptionsTo,
                                                                                                    latexProcessOptions,
                                                                                                    latexProvides,
                                                                                                    latexProvidesExpl,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexWarningInfo,
                                                                                                    latexActiveChar,
                                                                                                    latexAddvspace,
                                                                                                    latexAlignatEnv,
                                                                                                    latexAlignmentTab,
                                                                                                    latexAtIfpackagelater,
                                                                                                    latexAuthor,
                                                                                                    latexBegin,
                                                                                                    latexBibitem,
                                                                                                    latexCharRefInvalid,
                                                                                                    latexCite,
                                                                                                    latexCites,
                                                                                                    latexCline,
                                                                                                    latexCode,
                                                                                                    latexCommentEnv,
                                                                                                    latexCs,
                                                                                                    latexCsnameGroup,
                                                                                                    latexDate,
                                                                                                    latexDef,
                                                                                                    latexDiscretionary,
                                                                                                    latexDisplayMathEnv,
                                                                                                    latexDmathEnv,
                                                                                                    latexDocumentEnv,
                                                                                                    latexDseriesEnv,
                                                                                                    latexEmph,
                                                                                                    latexEnd,
                                                                                                    latexEndinput,
                                                                                                    latexEnlargethispage,
                                                                                                    latexEnsuremath,
                                                                                                    latexExit,
                                                                                                    latexExpandafter,
                                                                                                    latexFigureEnv,
                                                                                                    latexFilecontentsEnv,
                                                                                                    latexFootnote,
                                                                                                    latexFootnotemark,
                                                                                                    latexFref,
                                                                                                    latexGlsAcr,
                                                                                                    latexGlsdisp,
                                                                                                    latexGlsentry,
                                                                                                    latexGlssee,
                                                                                                    latexGnuplotEnv,
                                                                                                    latexGroup,
                                                                                                    latexHref,
                                                                                                    latexHyperbaseurl,
                                                                                                    latexHyperimage,
                                                                                                    latexHyperref,
                                                                                                    latexHyphenation,
                                                                                                    latexIgnored,
                                                                                                    latexInlineMathEnv,
                                                                                                    latexInput,
                                                                                                    latexInvalid,
                                                                                                    latexItem,
                                                                                                    latexItemizeEnv,
                                                                                                    latexLabel,
                                                                                                    latexLatexDisplayMath,
                                                                                                    latexLatexInlineMath,
                                                                                                    latexLet,
                                                                                                    latexLinebreak,
                                                                                                    latexLongnewglossaryentry,
                                                                                                    latexLrboxEnv,
                                                                                                    latexLstinline,
                                                                                                    latexLstlistingEnv,
                                                                                                    latexLua,
                                                                                                    latexLuacode,
                                                                                                    latexLuacodeEnv,
                                                                                                    latexLuacodestarEnv,
                                                                                                    latexMakeatletter,
                                                                                                    latexMakeatother,
                                                                                                    latexMakebox,
                                                                                                    latexMarginpar,
                                                                                                    latexMbox,
                                                                                                    latexMinipageEnv,
                                                                                                    latexMint,
                                                                                                    latexMintedEnv,
                                                                                                    latexMintinline,
                                                                                                    latexMulticolumn,
                                                                                                    latexNewacronym,
                                                                                                    latexNewcommand,
                                                                                                    latexNewcounter,
                                                                                                    latexNewenvironment,
                                                                                                    latexNewfont,
                                                                                                    latexNewglossaryentry,
                                                                                                    latexNewlength,
                                                                                                    latexNewline,
                                                                                                    latexNewsavebox,
                                                                                                    latexNewtheorem,
                                                                                                    latexNocite,
                                                                                                    latexObeycr,
                                                                                                    latexPagebreak,
                                                                                                    latexPagenumbering,
                                                                                                    latexPagestyle,
                                                                                                    latexPar,
                                                                                                    latexParameterRef,
                                                                                                    latexParbox,
                                                                                                    latexPictureEnv,
                                                                                                    latexPrintcounter,
                                                                                                    latexProtect,
                                                                                                    latexRaisebox,
                                                                                                    latexRef,
                                                                                                    latexRefrange,
                                                                                                    latexRegexp,
                                                                                                    latexRelax,
                                                                                                    latexRestorecr,
                                                                                                    latexSavebox,
                                                                                                    latexSbox,
                                                                                                    latexSection,
                                                                                                    latexSemiSimpleGroup,
                                                                                                    latexSetcounter,
                                                                                                    latexSetlength,
                                                                                                    latexSetto,
                                                                                                    latexShortVerb,
                                                                                                    latexSpace,
                                                                                                    latexStepcounter,
                                                                                                    latexString,
                                                                                                    latexTableEnv,
                                                                                                    latexTabuEnv,
                                                                                                    latexTabularEnv,
                                                                                                    latexTabularstarEnv,
                                                                                                    latexTexDisplayMath,
                                                                                                    latexTexInlineMath,
                                                                                                    latexText,
                                                                                                    latexTextEnv,
                                                                                                    latexTextstyle,
                                                                                                    latexThanks,
                                                                                                    latexThebibliographyEnv,
                                                                                                    latexTheoremEnv,
                                                                                                    latexTikzpictureEnv,
                                                                                                    latexTitle,
                                                                                                    latexUrl,
                                                                                                    latexUse,
                                                                                                    latexUse209,
                                                                                                    latexUsebox,
                                                                                                    latexValue,
                                                                                                    latexVerb,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexVolcite,
                                                                                                    latexVolcites
                                                                                                  }
                                                                          tmp[latexDseriesEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexEmph] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexEnd] = {latexCs, latexGroup, latexIgnored}
                                                                          tmp[latexEndcsname] = {latexCs}
                                                                          tmp[latexEndgroup] = {latexCs}
                                                                          tmp[latexEndinput] = {latexCs, latexExit, latexIgnored, latexPar}
                                                                          tmp[latexEnlargethispage] = {latexCs, latexExit, latexGroup, latexPar, latexStar}
                                                                          tmp[latexEnsuremath] = {latexCs, latexExit, latexGroup, latexMath, latexPar, latexParameterRef}
                                                                          tmp[latexExpandafter] = {
                                                                                                    latexAt,
                                                                                                    latexCheckCommand,
                                                                                                    latexDeclareOption,
                                                                                                    latexDeleteShortVerb,
                                                                                                    latexDoNotIndex,
                                                                                                    latexError,
                                                                                                    latexExecuteOptions,
                                                                                                    latexExplSyntaxOff,
                                                                                                    latexExplSyntaxOn,
                                                                                                    latexIfFileExists,
                                                                                                    latexMakeShortVerb,
                                                                                                    latexNeedsTeXFOrmat,
                                                                                                    latexPassOptionsTo,
                                                                                                    latexProcessOptions,
                                                                                                    latexProvides,
                                                                                                    latexProvidesExpl,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexWarningInfo,
                                                                                                    latexAddvspace,
                                                                                                    latexAlignatEnv,
                                                                                                    latexArrayEnv,
                                                                                                    latexAtIfpackagelater,
                                                                                                    latexAuthor,
                                                                                                    latexBibitem,
                                                                                                    latexCite,
                                                                                                    latexCites,
                                                                                                    latexCline,
                                                                                                    latexCode,
                                                                                                    latexCommentEnv,
                                                                                                    latexCs,
                                                                                                    latexCsnameGroup,
                                                                                                    latexDate,
                                                                                                    latexDef,
                                                                                                    latexDelimiterGroup,
                                                                                                    latexDiscretionary,
                                                                                                    latexDisplayMathEnv,
                                                                                                    latexDmathEnv,
                                                                                                    latexDocumentEnv,
                                                                                                    latexDseriesEnv,
                                                                                                    latexEmph,
                                                                                                    latexEndinput,
                                                                                                    latexEnlargethispage,
                                                                                                    latexEnsuremath,
                                                                                                    latexExit,
                                                                                                    latexExpandafter,
                                                                                                    latexFigureEnv,
                                                                                                    latexFilecontentsEnv,
                                                                                                    latexFootnote,
                                                                                                    latexFootnotemark,
                                                                                                    latexFrac,
                                                                                                    latexFref,
                                                                                                    latexGlsAcr,
                                                                                                    latexGlsdisp,
                                                                                                    latexGlsentry,
                                                                                                    latexGlssee,
                                                                                                    latexGnuplotEnv,
                                                                                                    latexGroup,
                                                                                                    latexHref,
                                                                                                    latexHyperbaseurl,
                                                                                                    latexHyperimage,
                                                                                                    latexHyperref,
                                                                                                    latexHyphenation,
                                                                                                    latexInlineMathEnv,
                                                                                                    latexInput,
                                                                                                    latexItem,
                                                                                                    latexItemizeEnv,
                                                                                                    latexLabel,
                                                                                                    latexLatexDisplayMath,
                                                                                                    latexLatexInlineMath,
                                                                                                    latexLet,
                                                                                                    latexLinebreak,
                                                                                                    latexLongnewglossaryentry,
                                                                                                    latexLrboxEnv,
                                                                                                    latexLstinline,
                                                                                                    latexLstlistingEnv,
                                                                                                    latexLua,
                                                                                                    latexLuacode,
                                                                                                    latexLuacodeEnv,
                                                                                                    latexLuacodestarEnv,
                                                                                                    latexMakeatletter,
                                                                                                    latexMakeatother,
                                                                                                    latexMakebox,
                                                                                                    latexMarginpar,
                                                                                                    latexMath,
                                                                                                    latexMathEnv,
                                                                                                    latexMathaccent,
                                                                                                    latexMathstyle,
                                                                                                    latexMbox,
                                                                                                    latexMinipageEnv,
                                                                                                    latexMint,
                                                                                                    latexMintedEnv,
                                                                                                    latexMintinline,
                                                                                                    latexMulticolumn,
                                                                                                    latexNewacronym,
                                                                                                    latexNewcommand,
                                                                                                    latexNewcounter,
                                                                                                    latexNewenvironment,
                                                                                                    latexNewfont,
                                                                                                    latexNewglossaryentry,
                                                                                                    latexNewlength,
                                                                                                    latexNewline,
                                                                                                    latexNewsavebox,
                                                                                                    latexNewtheorem,
                                                                                                    latexNocite,
                                                                                                    latexObeycr,
                                                                                                    latexPagebreak,
                                                                                                    latexPagenumbering,
                                                                                                    latexPagestyle,
                                                                                                    latexPar,
                                                                                                    latexParameterRef,
                                                                                                    latexParbox,
                                                                                                    latexPhantomSmash,
                                                                                                    latexPictureEnv,
                                                                                                    latexPrintcounter,
                                                                                                    latexProtect,
                                                                                                    latexRaisebox,
                                                                                                    latexRef,
                                                                                                    latexRefrange,
                                                                                                    latexRegexp,
                                                                                                    latexRelax,
                                                                                                    latexRestorecr,
                                                                                                    latexSavebox,
                                                                                                    latexSbox,
                                                                                                    latexSection,
                                                                                                    latexSetcounter,
                                                                                                    latexSetlength,
                                                                                                    latexSetto,
                                                                                                    latexShortVerb,
                                                                                                    latexSpace,
                                                                                                    latexSqrt,
                                                                                                    latexStackrel,
                                                                                                    latexStepcounter,
                                                                                                    latexString,
                                                                                                    latexTableEnv,
                                                                                                    latexTabuEnv,
                                                                                                    latexTabularEnv,
                                                                                                    latexTabularstarEnv,
                                                                                                    latexTag,
                                                                                                    latexTexDisplayMath,
                                                                                                    latexTexInlineMath,
                                                                                                    latexText,
                                                                                                    latexTextCmd,
                                                                                                    latexTextEnv,
                                                                                                    latexTextstyle,
                                                                                                    latexThanks,
                                                                                                    latexThebibliographyEnv,
                                                                                                    latexTheoremEnv,
                                                                                                    latexTikzpictureEnv,
                                                                                                    latexTitle,
                                                                                                    latexUrl,
                                                                                                    latexUse,
                                                                                                    latexUse209,
                                                                                                    latexUsebox,
                                                                                                    latexValue,
                                                                                                    latexVerb,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexVolcite,
                                                                                                    latexVolcites
                                                                                                  }
                                                                          tmp[latexFigureEnv] = {
                                                                                                  latexAt,
                                                                                                  latexCheckCommand,
                                                                                                  latexDeclareOption,
                                                                                                  latexDeleteShortVerb,
                                                                                                  latexDoNotIndex,
                                                                                                  latexError,
                                                                                                  latexExecuteOptions,
                                                                                                  latexExplSyntaxOff,
                                                                                                  latexExplSyntaxOn,
                                                                                                  latexIfFileExists,
                                                                                                  latexMakeShortVerb,
                                                                                                  latexNeedsTeXFOrmat,
                                                                                                  latexPassOptionsTo,
                                                                                                  latexProcessOptions,
                                                                                                  latexProvides,
                                                                                                  latexProvidesExpl,
                                                                                                  latexVerbatimEnv,
                                                                                                  latexWarningInfo,
                                                                                                  latexActiveChar,
                                                                                                  latexAddvspace,
                                                                                                  latexAlignatEnv,
                                                                                                  latexAlignmentTab,
                                                                                                  latexAtIfpackagelater,
                                                                                                  latexAuthor,
                                                                                                  latexBegin,
                                                                                                  latexBibitem,
                                                                                                  latexCharRefInvalid,
                                                                                                  latexCite,
                                                                                                  latexCites,
                                                                                                  latexCline,
                                                                                                  latexCode,
                                                                                                  latexCommentEnv,
                                                                                                  latexCs,
                                                                                                  latexCsnameGroup,
                                                                                                  latexDate,
                                                                                                  latexDef,
                                                                                                  latexDiscretionary,
                                                                                                  latexDisplayMathEnv,
                                                                                                  latexDmathEnv,
                                                                                                  latexDocumentEnv,
                                                                                                  latexDseriesEnv,
                                                                                                  latexEmph,
                                                                                                  latexEnd,
                                                                                                  latexEndinput,
                                                                                                  latexEnlargethispage,
                                                                                                  latexEnsuremath,
                                                                                                  latexExit,
                                                                                                  latexExpandafter,
                                                                                                  latexFigureEnv,
                                                                                                  latexFilecontentsEnv,
                                                                                                  latexFootnote,
                                                                                                  latexFootnotemark,
                                                                                                  latexFref,
                                                                                                  latexGlsAcr,
                                                                                                  latexGlsdisp,
                                                                                                  latexGlsentry,
                                                                                                  latexGlssee,
                                                                                                  latexGnuplotEnv,
                                                                                                  latexGroup,
                                                                                                  latexHref,
                                                                                                  latexHyperbaseurl,
                                                                                                  latexHyperimage,
                                                                                                  latexHyperref,
                                                                                                  latexHyphenation,
                                                                                                  latexIgnored,
                                                                                                  latexInlineMathEnv,
                                                                                                  latexInput,
                                                                                                  latexInvalid,
                                                                                                  latexItem,
                                                                                                  latexItemizeEnv,
                                                                                                  latexLabel,
                                                                                                  latexLatexDisplayMath,
                                                                                                  latexLatexInlineMath,
                                                                                                  latexLet,
                                                                                                  latexLinebreak,
                                                                                                  latexLongnewglossaryentry,
                                                                                                  latexLrboxEnv,
                                                                                                  latexLstinline,
                                                                                                  latexLstlistingEnv,
                                                                                                  latexLua,
                                                                                                  latexLuacode,
                                                                                                  latexLuacodeEnv,
                                                                                                  latexLuacodestarEnv,
                                                                                                  latexMakeatletter,
                                                                                                  latexMakeatother,
                                                                                                  latexMakebox,
                                                                                                  latexMarginpar,
                                                                                                  latexMbox,
                                                                                                  latexMinipageEnv,
                                                                                                  latexMint,
                                                                                                  latexMintedEnv,
                                                                                                  latexMintinline,
                                                                                                  latexMulticolumn,
                                                                                                  latexNewacronym,
                                                                                                  latexNewcommand,
                                                                                                  latexNewcounter,
                                                                                                  latexNewenvironment,
                                                                                                  latexNewfont,
                                                                                                  latexNewglossaryentry,
                                                                                                  latexNewlength,
                                                                                                  latexNewline,
                                                                                                  latexNewsavebox,
                                                                                                  latexNewtheorem,
                                                                                                  latexNocite,
                                                                                                  latexObeycr,
                                                                                                  latexPagebreak,
                                                                                                  latexPagenumbering,
                                                                                                  latexPagestyle,
                                                                                                  latexPar,
                                                                                                  latexParameterRef,
                                                                                                  latexParbox,
                                                                                                  latexPictureEnv,
                                                                                                  latexPrintcounter,
                                                                                                  latexProtect,
                                                                                                  latexRaisebox,
                                                                                                  latexRef,
                                                                                                  latexRefrange,
                                                                                                  latexRegexp,
                                                                                                  latexRelax,
                                                                                                  latexRestorecr,
                                                                                                  latexSavebox,
                                                                                                  latexSbox,
                                                                                                  latexSection,
                                                                                                  latexSemiSimpleGroup,
                                                                                                  latexSetcounter,
                                                                                                  latexSetlength,
                                                                                                  latexSetto,
                                                                                                  latexShortVerb,
                                                                                                  latexSpace,
                                                                                                  latexStepcounter,
                                                                                                  latexString,
                                                                                                  latexTableEnv,
                                                                                                  latexTabuEnv,
                                                                                                  latexTabularEnv,
                                                                                                  latexTabularstarEnv,
                                                                                                  latexTexDisplayMath,
                                                                                                  latexTexInlineMath,
                                                                                                  latexText,
                                                                                                  latexTextEnv,
                                                                                                  latexTextstyle,
                                                                                                  latexThanks,
                                                                                                  latexThebibliographyEnv,
                                                                                                  latexTheoremEnv,
                                                                                                  latexTikzpictureEnv,
                                                                                                  latexTitle,
                                                                                                  latexUrl,
                                                                                                  latexUse,
                                                                                                  latexUse209,
                                                                                                  latexUsebox,
                                                                                                  latexValue,
                                                                                                  latexVerb,
                                                                                                  latexVerbatimEnv,
                                                                                                  latexVolcite,
                                                                                                  latexVolcites
                                                                                                }
                                                                          tmp[latexFilecontentsEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexFootnote] = {
                                                                                                 latexBrackGroup,
                                                                                                 latexCs,
                                                                                                 latexExit,
                                                                                                 latexGroup,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexText
                                                                                               }
                                                                          tmp[latexFootnotemark] = {latexBrackGroup, latexCs}
                                                                          tmp[latexFrac] = {latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexFref] = {
                                                                                             latexBrackGroup,
                                                                                             latexCs,
                                                                                             latexExit,
                                                                                             latexGroup,
                                                                                             latexPar,
                                                                                             latexParameterRef,
                                                                                             latexText
                                                                                           }
                                                                          tmp[latexGlsAcr] = {
                                                                                               latexBrackGroup,
                                                                                               latexCs,
                                                                                               latexExit,
                                                                                               latexGroup,
                                                                                               latexPar,
                                                                                               latexParameterRef,
                                                                                               latexPlusSym,
                                                                                               latexStar,
                                                                                               latexText
                                                                                             }
                                                                          tmp[latexGlsdisp] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexGlsentry] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexGlssee] = {
                                                                                               latexBrackGroup,
                                                                                               latexCs,
                                                                                               latexExit,
                                                                                               latexGroup,
                                                                                               latexPar,
                                                                                               latexParameterRef,
                                                                                               latexText
                                                                                             }
                                                                          tmp[latexGlue] = {latexCs, latexDimension, latexFixed, latexMinus, latexPlus}
                                                                          tmp[latexGnuplotEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexGroup] = {
                                                                                              latexAt,
                                                                                              latexCheckCommand,
                                                                                              latexDeclareOption,
                                                                                              latexDeleteShortVerb,
                                                                                              latexDoNotIndex,
                                                                                              latexError,
                                                                                              latexExecuteOptions,
                                                                                              latexExplSyntaxOff,
                                                                                              latexExplSyntaxOn,
                                                                                              latexIfFileExists,
                                                                                              latexMakeShortVerb,
                                                                                              latexNeedsTeXFOrmat,
                                                                                              latexPassOptionsTo,
                                                                                              latexProcessOptions,
                                                                                              latexProvides,
                                                                                              latexProvidesExpl,
                                                                                              latexVerbatimEnv,
                                                                                              latexWarningInfo,
                                                                                              latexActiveChar,
                                                                                              latexAddvspace,
                                                                                              latexAlignatEnv,
                                                                                              latexAlignmentTab,
                                                                                              latexArrayEnv,
                                                                                              latexAtIfpackagelater,
                                                                                              latexAuthor,
                                                                                              latexBibitem,
                                                                                              latexCharRefInvalid,
                                                                                              latexCite,
                                                                                              latexCites,
                                                                                              latexCline,
                                                                                              latexCode,
                                                                                              latexComma,
                                                                                              latexCommentEnv,
                                                                                              latexCs,
                                                                                              latexCsnameGroup,
                                                                                              latexDate,
                                                                                              latexDef,
                                                                                              latexDelimiterGroup,
                                                                                              latexDimension,
                                                                                              latexDiscretionary,
                                                                                              latexDisplayMathEnv,
                                                                                              latexDisplayMathShift,
                                                                                              latexDmathEnv,
                                                                                              latexDocumentEnv,
                                                                                              latexDseriesEnv,
                                                                                              latexEmph,
                                                                                              latexEndinput,
                                                                                              latexEnlargethispage,
                                                                                              latexEnsuremath,
                                                                                              latexExpandafter,
                                                                                              latexFigureEnv,
                                                                                              latexFilecontentsEnv,
                                                                                              latexFixed,
                                                                                              latexFootnote,
                                                                                              latexFootnotemark,
                                                                                              latexFrac,
                                                                                              latexFref,
                                                                                              latexGlsAcr,
                                                                                              latexGlsdisp,
                                                                                              latexGlsentry,
                                                                                              latexGlssee,
                                                                                              latexGlue,
                                                                                              latexGnuplotEnv,
                                                                                              latexGroup,
                                                                                              latexHref,
                                                                                              latexHyperbaseurl,
                                                                                              latexHyperimage,
                                                                                              latexHyperref,
                                                                                              latexHyphenation,
                                                                                              latexIgnored,
                                                                                              latexInlineMathEnv,
                                                                                              latexInput,
                                                                                              latexInvalid,
                                                                                              latexItem,
                                                                                              latexItemizeEnv,
                                                                                              latexL,
                                                                                              latexLabel,
                                                                                              latexLatexDisplayMath,
                                                                                              latexLatexInlineMath,
                                                                                              latexLet,
                                                                                              latexLinebreak,
                                                                                              latexLongnewglossaryentry,
                                                                                              latexLrboxEnv,
                                                                                              latexLstinline,
                                                                                              latexLstlistingEnv,
                                                                                              latexLua,
                                                                                              latexLuacode,
                                                                                              latexLuacodeEnv,
                                                                                              latexLuacodestarEnv,
                                                                                              latexMakeatletter,
                                                                                              latexMakeatother,
                                                                                              latexMakebox,
                                                                                              latexMarginpar,
                                                                                              latexMath,
                                                                                              latexMathEnv,
                                                                                              latexMathShift,
                                                                                              latexMathaccent,
                                                                                              latexMathstyle,
                                                                                              latexMbox,
                                                                                              latexMinipageEnv,
                                                                                              latexMint,
                                                                                              latexMintedEnv,
                                                                                              latexMintinline,
                                                                                              latexMulticolumn,
                                                                                              latexName,
                                                                                              latexNewacronym,
                                                                                              latexNewcommand,
                                                                                              latexNewcounter,
                                                                                              latexNewenvironment,
                                                                                              latexNewfont,
                                                                                              latexNewglossaryentry,
                                                                                              latexNewlength,
                                                                                              latexNewline,
                                                                                              latexNewsavebox,
                                                                                              latexNewtheorem,
                                                                                              latexNocite,
                                                                                              latexObeycr,
                                                                                              latexPagebreak,
                                                                                              latexPagenumbering,
                                                                                              latexPagestyle,
                                                                                              latexPar,
                                                                                              latexParameterRef,
                                                                                              latexParbox,
                                                                                              latexPhantomSmash,
                                                                                              latexPictureEnv,
                                                                                              latexPrintcounter,
                                                                                              latexProtect,
                                                                                              latexR,
                                                                                              latexRaisebox,
                                                                                              latexRef,
                                                                                              latexRefrange,
                                                                                              latexRegexp,
                                                                                              latexRelax,
                                                                                              latexRestorecr,
                                                                                              latexSavebox,
                                                                                              latexSbox,
                                                                                              latexSection,
                                                                                              latexSemiSimpleGroup,
                                                                                              latexSetcounter,
                                                                                              latexSetlength,
                                                                                              latexSetto,
                                                                                              latexShortVerb,
                                                                                              latexSpace,
                                                                                              latexSqrt,
                                                                                              latexStackrel,
                                                                                              latexStepcounter,
                                                                                              latexString,
                                                                                              latexSubscript,
                                                                                              latexSuperscript,
                                                                                              latexTableEnv,
                                                                                              latexTabuEnv,
                                                                                              latexTabularEnv,
                                                                                              latexTabularstarEnv,
                                                                                              latexTag,
                                                                                              latexTexDisplayMath,
                                                                                              latexTexInlineMath,
                                                                                              latexText,
                                                                                              latexTextCmd,
                                                                                              latexTextEnv,
                                                                                              latexTextstyle,
                                                                                              latexThanks,
                                                                                              latexThebibliographyEnv,
                                                                                              latexTheoremEnv,
                                                                                              latexTikzpictureEnv,
                                                                                              latexTitle,
                                                                                              latexUrl,
                                                                                              latexUse,
                                                                                              latexUse209,
                                                                                              latexUsebox,
                                                                                              latexValue,
                                                                                              latexVerb,
                                                                                              latexVerbatimEnv,
                                                                                              latexVolcite,
                                                                                              latexVolcites
                                                                                            }
                                                                          tmp[latexHref] = {
                                                                                             latexBrackGroup,
                                                                                             latexCs,
                                                                                             latexExit,
                                                                                             latexGroup,
                                                                                             latexPar,
                                                                                             latexParameterRef,
                                                                                             latexText
                                                                                           }
                                                                          tmp[latexHyperbaseurl] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexHyperimage] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexHyperref] = {
                                                                                                 latexBrackGroup,
                                                                                                 latexCs,
                                                                                                 latexExit,
                                                                                                 latexGroup,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexText
                                                                                               }
                                                                          tmp[latexHyphenation] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexInlineMathEnv] = {
                                                                                                      latexCheckCommand,
                                                                                                      latexDeleteShortVerb,
                                                                                                      latexError,
                                                                                                      latexExplSyntaxOff,
                                                                                                      latexExplSyntaxOn,
                                                                                                      latexIfFileExists,
                                                                                                      latexMakeShortVerb,
                                                                                                      latexWarningInfo,
                                                                                                      latexActiveChar,
                                                                                                      latexAddvspace,
                                                                                                      latexAlignmentTab,
                                                                                                      latexArrayEnv,
                                                                                                      latexBegin,
                                                                                                      latexCharRefInvalid,
                                                                                                      latexCline,
                                                                                                      latexCode,
                                                                                                      latexCs,
                                                                                                      latexCsnameGroup,
                                                                                                      latexDef,
                                                                                                      latexDelimiterGroup,
                                                                                                      latexEnd,
                                                                                                      latexEndinput,
                                                                                                      latexEnsuremath,
                                                                                                      latexExit,
                                                                                                      latexExpandafter,
                                                                                                      latexFrac,
                                                                                                      latexFref,
                                                                                                      latexGroup,
                                                                                                      latexHref,
                                                                                                      latexHyperbaseurl,
                                                                                                      latexHyperimage,
                                                                                                      latexHyperref,
                                                                                                      latexIgnored,
                                                                                                      latexInput,
                                                                                                      latexInvalid,
                                                                                                      latexLabel,
                                                                                                      latexLet,
                                                                                                      latexLua,
                                                                                                      latexLuacode,
                                                                                                      latexLuacodeEnv,
                                                                                                      latexLuacodestarEnv,
                                                                                                      latexMakeatletter,
                                                                                                      latexMakeatother,
                                                                                                      latexMath,
                                                                                                      latexMathEnv,
                                                                                                      latexMathaccent,
                                                                                                      latexMathstyle,
                                                                                                      latexMulticolumn,
                                                                                                      latexNewcommand,
                                                                                                      latexNewcounter,
                                                                                                      latexNewenvironment,
                                                                                                      latexNewfont,
                                                                                                      latexNewlength,
                                                                                                      latexNewsavebox,
                                                                                                      latexParameterRef,
                                                                                                      latexPhantomSmash,
                                                                                                      latexPrintcounter,
                                                                                                      latexProtect,
                                                                                                      latexRef,
                                                                                                      latexRefrange,
                                                                                                      latexRelax,
                                                                                                      latexSetcounter,
                                                                                                      latexSetlength,
                                                                                                      latexSetto,
                                                                                                      latexShortVerb,
                                                                                                      latexSpace,
                                                                                                      latexSqrt,
                                                                                                      latexStackrel,
                                                                                                      latexStepcounter,
                                                                                                      latexString,
                                                                                                      latexSubscript,
                                                                                                      latexSuperscript,
                                                                                                      latexTabuEnv,
                                                                                                      latexTabularEnv,
                                                                                                      latexTabularstarEnv,
                                                                                                      latexTag,
                                                                                                      latexTextCmd,
                                                                                                      latexTikzpictureEnv,
                                                                                                      latexUrl,
                                                                                                      latexValue,
                                                                                                      latexVerb
                                                                                                    }
                                                                          tmp[latexInput] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexItem] = {latexBrackGroup, latexCs}
                                                                          tmp[latexItemizeEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexLabel] = {
                                                                                              latexBrackGroup,
                                                                                              latexCs,
                                                                                              latexExit,
                                                                                              latexGroup,
                                                                                              latexPar,
                                                                                              latexParameterRef,
                                                                                              latexText
                                                                                            }
                                                                          tmp[latexLatexDisplayMath] = {
                                                                                                         latexCheckCommand,
                                                                                                         latexDeleteShortVerb,
                                                                                                         latexError,
                                                                                                         latexExplSyntaxOff,
                                                                                                         latexExplSyntaxOn,
                                                                                                         latexIfFileExists,
                                                                                                         latexMakeShortVerb,
                                                                                                         latexWarningInfo,
                                                                                                         latexActiveChar,
                                                                                                         latexAddvspace,
                                                                                                         latexAlignmentTab,
                                                                                                         latexArrayEnv,
                                                                                                         latexCharRefInvalid,
                                                                                                         latexCline,
                                                                                                         latexCode,
                                                                                                         latexCs,
                                                                                                         latexCsnameGroup,
                                                                                                         latexDef,
                                                                                                         latexDelimiterGroup,
                                                                                                         latexEndinput,
                                                                                                         latexEnsuremath,
                                                                                                         latexExit,
                                                                                                         latexExpandafter,
                                                                                                         latexFrac,
                                                                                                         latexFref,
                                                                                                         latexGroup,
                                                                                                         latexHref,
                                                                                                         latexHyperbaseurl,
                                                                                                         latexHyperimage,
                                                                                                         latexHyperref,
                                                                                                         latexIgnored,
                                                                                                         latexInput,
                                                                                                         latexInvalid,
                                                                                                         latexLabel,
                                                                                                         latexLet,
                                                                                                         latexLua,
                                                                                                         latexLuacode,
                                                                                                         latexLuacodeEnv,
                                                                                                         latexLuacodestarEnv,
                                                                                                         latexMakeatletter,
                                                                                                         latexMakeatother,
                                                                                                         latexMath,
                                                                                                         latexMathEnv,
                                                                                                         latexMathaccent,
                                                                                                         latexMathstyle,
                                                                                                         latexMulticolumn,
                                                                                                         latexNewcommand,
                                                                                                         latexNewcounter,
                                                                                                         latexNewenvironment,
                                                                                                         latexNewfont,
                                                                                                         latexNewlength,
                                                                                                         latexNewsavebox,
                                                                                                         latexParameterRef,
                                                                                                         latexPhantomSmash,
                                                                                                         latexPrintcounter,
                                                                                                         latexProtect,
                                                                                                         latexRef,
                                                                                                         latexRefrange,
                                                                                                         latexRelax,
                                                                                                         latexSetcounter,
                                                                                                         latexSetlength,
                                                                                                         latexSetto,
                                                                                                         latexShortVerb,
                                                                                                         latexSpace,
                                                                                                         latexSqrt,
                                                                                                         latexStackrel,
                                                                                                         latexStepcounter,
                                                                                                         latexString,
                                                                                                         latexSubscript,
                                                                                                         latexSuperscript,
                                                                                                         latexTabuEnv,
                                                                                                         latexTabularEnv,
                                                                                                         latexTabularstarEnv,
                                                                                                         latexTag,
                                                                                                         latexTextCmd,
                                                                                                         latexTikzpictureEnv,
                                                                                                         latexUrl,
                                                                                                         latexValue,
                                                                                                         latexVerb
                                                                                                       }
                                                                          tmp[latexLatexInlineMath] = {
                                                                                                        latexCheckCommand,
                                                                                                        latexDeleteShortVerb,
                                                                                                        latexError,
                                                                                                        latexExplSyntaxOff,
                                                                                                        latexExplSyntaxOn,
                                                                                                        latexIfFileExists,
                                                                                                        latexMakeShortVerb,
                                                                                                        latexWarningInfo,
                                                                                                        latexActiveChar,
                                                                                                        latexAddvspace,
                                                                                                        latexAlignmentTab,
                                                                                                        latexArrayEnv,
                                                                                                        latexCharRefInvalid,
                                                                                                        latexCline,
                                                                                                        latexCode,
                                                                                                        latexCs,
                                                                                                        latexCsnameGroup,
                                                                                                        latexDef,
                                                                                                        latexDelimiterGroup,
                                                                                                        latexEndinput,
                                                                                                        latexEnsuremath,
                                                                                                        latexExit,
                                                                                                        latexExpandafter,
                                                                                                        latexFrac,
                                                                                                        latexFref,
                                                                                                        latexGroup,
                                                                                                        latexHref,
                                                                                                        latexHyperbaseurl,
                                                                                                        latexHyperimage,
                                                                                                        latexHyperref,
                                                                                                        latexIgnored,
                                                                                                        latexInput,
                                                                                                        latexInvalid,
                                                                                                        latexLabel,
                                                                                                        latexLet,
                                                                                                        latexLua,
                                                                                                        latexLuacode,
                                                                                                        latexLuacodeEnv,
                                                                                                        latexLuacodestarEnv,
                                                                                                        latexMakeatletter,
                                                                                                        latexMakeatother,
                                                                                                        latexMath,
                                                                                                        latexMathEnv,
                                                                                                        latexMathaccent,
                                                                                                        latexMathstyle,
                                                                                                        latexMulticolumn,
                                                                                                        latexNewcommand,
                                                                                                        latexNewcounter,
                                                                                                        latexNewenvironment,
                                                                                                        latexNewfont,
                                                                                                        latexNewlength,
                                                                                                        latexNewsavebox,
                                                                                                        latexParameterRef,
                                                                                                        latexPhantomSmash,
                                                                                                        latexPrintcounter,
                                                                                                        latexProtect,
                                                                                                        latexRef,
                                                                                                        latexRefrange,
                                                                                                        latexRelax,
                                                                                                        latexSetcounter,
                                                                                                        latexSetlength,
                                                                                                        latexSetto,
                                                                                                        latexShortVerb,
                                                                                                        latexSpace,
                                                                                                        latexSqrt,
                                                                                                        latexStackrel,
                                                                                                        latexStepcounter,
                                                                                                        latexString,
                                                                                                        latexSubscript,
                                                                                                        latexSuperscript,
                                                                                                        latexTabuEnv,
                                                                                                        latexTabularEnv,
                                                                                                        latexTabularstarEnv,
                                                                                                        latexTag,
                                                                                                        latexTextCmd,
                                                                                                        latexTikzpictureEnv,
                                                                                                        latexUrl,
                                                                                                        latexValue,
                                                                                                        latexVerb
                                                                                                      }
                                                                          tmp[latexLeft] = {latexCs, latexExit, latexGroup, latexMath, latexPar, latexParameterRef}
                                                                          tmp[latexLet] = {latexCs, latexEquals, latexExit, latexPar}
                                                                          tmp[latexLinebreak] = {latexBrackGroup, latexCs}
                                                                          tmp[latexLongnewglossaryentry] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexLrboxEnv] = {
                                                                                                 latexAt,
                                                                                                 latexCheckCommand,
                                                                                                 latexDeclareOption,
                                                                                                 latexDeleteShortVerb,
                                                                                                 latexDoNotIndex,
                                                                                                 latexError,
                                                                                                 latexExecuteOptions,
                                                                                                 latexExplSyntaxOff,
                                                                                                 latexExplSyntaxOn,
                                                                                                 latexIfFileExists,
                                                                                                 latexMakeShortVerb,
                                                                                                 latexNeedsTeXFOrmat,
                                                                                                 latexPassOptionsTo,
                                                                                                 latexProcessOptions,
                                                                                                 latexProvides,
                                                                                                 latexProvidesExpl,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexWarningInfo,
                                                                                                 latexActiveChar,
                                                                                                 latexAddvspace,
                                                                                                 latexAlignatEnv,
                                                                                                 latexAlignmentTab,
                                                                                                 latexAtIfpackagelater,
                                                                                                 latexAuthor,
                                                                                                 latexBegin,
                                                                                                 latexBibitem,
                                                                                                 latexCharRefInvalid,
                                                                                                 latexCite,
                                                                                                 latexCites,
                                                                                                 latexCline,
                                                                                                 latexCode,
                                                                                                 latexCommentEnv,
                                                                                                 latexCs,
                                                                                                 latexCsnameGroup,
                                                                                                 latexDate,
                                                                                                 latexDef,
                                                                                                 latexDiscretionary,
                                                                                                 latexDisplayMathEnv,
                                                                                                 latexDmathEnv,
                                                                                                 latexDocumentEnv,
                                                                                                 latexDseriesEnv,
                                                                                                 latexEmph,
                                                                                                 latexEnd,
                                                                                                 latexEndinput,
                                                                                                 latexEnlargethispage,
                                                                                                 latexEnsuremath,
                                                                                                 latexExit,
                                                                                                 latexExpandafter,
                                                                                                 latexFigureEnv,
                                                                                                 latexFilecontentsEnv,
                                                                                                 latexFootnote,
                                                                                                 latexFootnotemark,
                                                                                                 latexFref,
                                                                                                 latexGlsAcr,
                                                                                                 latexGlsdisp,
                                                                                                 latexGlsentry,
                                                                                                 latexGlssee,
                                                                                                 latexGnuplotEnv,
                                                                                                 latexGroup,
                                                                                                 latexHref,
                                                                                                 latexHyperbaseurl,
                                                                                                 latexHyperimage,
                                                                                                 latexHyperref,
                                                                                                 latexHyphenation,
                                                                                                 latexIgnored,
                                                                                                 latexInlineMathEnv,
                                                                                                 latexInput,
                                                                                                 latexInvalid,
                                                                                                 latexItem,
                                                                                                 latexItemizeEnv,
                                                                                                 latexLabel,
                                                                                                 latexLatexDisplayMath,
                                                                                                 latexLatexInlineMath,
                                                                                                 latexLet,
                                                                                                 latexLinebreak,
                                                                                                 latexLongnewglossaryentry,
                                                                                                 latexLrboxEnv,
                                                                                                 latexLstinline,
                                                                                                 latexLstlistingEnv,
                                                                                                 latexLua,
                                                                                                 latexLuacode,
                                                                                                 latexLuacodeEnv,
                                                                                                 latexLuacodestarEnv,
                                                                                                 latexMakeatletter,
                                                                                                 latexMakeatother,
                                                                                                 latexMakebox,
                                                                                                 latexMarginpar,
                                                                                                 latexMbox,
                                                                                                 latexMinipageEnv,
                                                                                                 latexMint,
                                                                                                 latexMintedEnv,
                                                                                                 latexMintinline,
                                                                                                 latexMulticolumn,
                                                                                                 latexNewacronym,
                                                                                                 latexNewcommand,
                                                                                                 latexNewcounter,
                                                                                                 latexNewenvironment,
                                                                                                 latexNewfont,
                                                                                                 latexNewglossaryentry,
                                                                                                 latexNewlength,
                                                                                                 latexNewline,
                                                                                                 latexNewsavebox,
                                                                                                 latexNewtheorem,
                                                                                                 latexNocite,
                                                                                                 latexObeycr,
                                                                                                 latexPagebreak,
                                                                                                 latexPagenumbering,
                                                                                                 latexPagestyle,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexParbox,
                                                                                                 latexPictureEnv,
                                                                                                 latexPrintcounter,
                                                                                                 latexProtect,
                                                                                                 latexRaisebox,
                                                                                                 latexRef,
                                                                                                 latexRefrange,
                                                                                                 latexRegexp,
                                                                                                 latexRelax,
                                                                                                 latexRestorecr,
                                                                                                 latexSavebox,
                                                                                                 latexSbox,
                                                                                                 latexSection,
                                                                                                 latexSemiSimpleGroup,
                                                                                                 latexSetcounter,
                                                                                                 latexSetlength,
                                                                                                 latexSetto,
                                                                                                 latexShortVerb,
                                                                                                 latexSpace,
                                                                                                 latexStepcounter,
                                                                                                 latexString,
                                                                                                 latexTableEnv,
                                                                                                 latexTabuEnv,
                                                                                                 latexTabularEnv,
                                                                                                 latexTabularstarEnv,
                                                                                                 latexTexDisplayMath,
                                                                                                 latexTexInlineMath,
                                                                                                 latexText,
                                                                                                 latexTextEnv,
                                                                                                 latexTextstyle,
                                                                                                 latexThanks,
                                                                                                 latexThebibliographyEnv,
                                                                                                 latexTheoremEnv,
                                                                                                 latexTikzpictureEnv,
                                                                                                 latexTitle,
                                                                                                 latexUrl,
                                                                                                 latexUse,
                                                                                                 latexUse209,
                                                                                                 latexUsebox,
                                                                                                 latexValue,
                                                                                                 latexVerb,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexVolcite,
                                                                                                 latexVolcites
                                                                                               }
                                                                          tmp[latexLstinline] = {latexBrackGroup, latexCs, latexExit, latexPar, latexVerbDelim, latexVerbatim}
                                                                          tmp[latexLstlistingEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexLua] = {
                                                                                            latexCharcode,
                                                                                            latexCs,
                                                                                            latexDecimal,
                                                                                            latexExit,
                                                                                            latexGroup,
                                                                                            latexHexadecimal,
                                                                                            latexOctal,
                                                                                            latexPar
                                                                                          }
                                                                          tmp[latexLuacode] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexLuacodeEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexLuacodestarEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexMakeatletter] = {latexCs}
                                                                          tmp[latexMakeatother] = {latexCs}
                                                                          tmp[latexMakebox] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexMarginpar] = {
                                                                                                  latexBrackGroup,
                                                                                                  latexCs,
                                                                                                  latexExit,
                                                                                                  latexGroup,
                                                                                                  latexPar,
                                                                                                  latexParameterRef,
                                                                                                  latexText
                                                                                                }
                                                                          tmp[latexMathEnv] = {
                                                                                                latexCheckCommand,
                                                                                                latexDeleteShortVerb,
                                                                                                latexError,
                                                                                                latexExplSyntaxOff,
                                                                                                latexExplSyntaxOn,
                                                                                                latexIfFileExists,
                                                                                                latexMakeShortVerb,
                                                                                                latexWarningInfo,
                                                                                                latexActiveChar,
                                                                                                latexAddvspace,
                                                                                                latexAlignmentTab,
                                                                                                latexArrayEnv,
                                                                                                latexBegin,
                                                                                                latexCharRefInvalid,
                                                                                                latexCline,
                                                                                                latexCode,
                                                                                                latexCs,
                                                                                                latexCsnameGroup,
                                                                                                latexDef,
                                                                                                latexDelimiterGroup,
                                                                                                latexEnd,
                                                                                                latexEndinput,
                                                                                                latexEnsuremath,
                                                                                                latexExit,
                                                                                                latexExpandafter,
                                                                                                latexFrac,
                                                                                                latexFref,
                                                                                                latexGroup,
                                                                                                latexHref,
                                                                                                latexHyperbaseurl,
                                                                                                latexHyperimage,
                                                                                                latexHyperref,
                                                                                                latexIgnored,
                                                                                                latexInput,
                                                                                                latexInvalid,
                                                                                                latexLabel,
                                                                                                latexLet,
                                                                                                latexLua,
                                                                                                latexLuacode,
                                                                                                latexLuacodeEnv,
                                                                                                latexLuacodestarEnv,
                                                                                                latexMakeatletter,
                                                                                                latexMakeatother,
                                                                                                latexMath,
                                                                                                latexMathEnv,
                                                                                                latexMathaccent,
                                                                                                latexMathstyle,
                                                                                                latexMulticolumn,
                                                                                                latexNewcommand,
                                                                                                latexNewcounter,
                                                                                                latexNewenvironment,
                                                                                                latexNewfont,
                                                                                                latexNewlength,
                                                                                                latexNewsavebox,
                                                                                                latexParameterRef,
                                                                                                latexPhantomSmash,
                                                                                                latexPrintcounter,
                                                                                                latexProtect,
                                                                                                latexRef,
                                                                                                latexRefrange,
                                                                                                latexRelax,
                                                                                                latexSetcounter,
                                                                                                latexSetlength,
                                                                                                latexSetto,
                                                                                                latexShortVerb,
                                                                                                latexSpace,
                                                                                                latexSqrt,
                                                                                                latexStackrel,
                                                                                                latexStepcounter,
                                                                                                latexString,
                                                                                                latexSubscript,
                                                                                                latexSuperscript,
                                                                                                latexTabuEnv,
                                                                                                latexTabularEnv,
                                                                                                latexTabularstarEnv,
                                                                                                latexTag,
                                                                                                latexTextCmd,
                                                                                                latexTikzpictureEnv,
                                                                                                latexUrl,
                                                                                                latexValue,
                                                                                                latexVerb
                                                                                              }
                                                                          tmp[latexMathaccent] = {latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexMathstyle] = {latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexMbox] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexMinipageEnv] = {
                                                                                                    latexAt,
                                                                                                    latexCheckCommand,
                                                                                                    latexDeclareOption,
                                                                                                    latexDeleteShortVerb,
                                                                                                    latexDoNotIndex,
                                                                                                    latexError,
                                                                                                    latexExecuteOptions,
                                                                                                    latexExplSyntaxOff,
                                                                                                    latexExplSyntaxOn,
                                                                                                    latexIfFileExists,
                                                                                                    latexMakeShortVerb,
                                                                                                    latexNeedsTeXFOrmat,
                                                                                                    latexPassOptionsTo,
                                                                                                    latexProcessOptions,
                                                                                                    latexProvides,
                                                                                                    latexProvidesExpl,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexWarningInfo,
                                                                                                    latexActiveChar,
                                                                                                    latexAddvspace,
                                                                                                    latexAlignatEnv,
                                                                                                    latexAlignmentTab,
                                                                                                    latexAtIfpackagelater,
                                                                                                    latexAuthor,
                                                                                                    latexBegin,
                                                                                                    latexBibitem,
                                                                                                    latexCharRefInvalid,
                                                                                                    latexCite,
                                                                                                    latexCites,
                                                                                                    latexCline,
                                                                                                    latexCode,
                                                                                                    latexCommentEnv,
                                                                                                    latexCs,
                                                                                                    latexCsnameGroup,
                                                                                                    latexDate,
                                                                                                    latexDef,
                                                                                                    latexDiscretionary,
                                                                                                    latexDisplayMathEnv,
                                                                                                    latexDmathEnv,
                                                                                                    latexDocumentEnv,
                                                                                                    latexDseriesEnv,
                                                                                                    latexEmph,
                                                                                                    latexEnd,
                                                                                                    latexEndinput,
                                                                                                    latexEnlargethispage,
                                                                                                    latexEnsuremath,
                                                                                                    latexExit,
                                                                                                    latexExpandafter,
                                                                                                    latexFigureEnv,
                                                                                                    latexFilecontentsEnv,
                                                                                                    latexFootnote,
                                                                                                    latexFootnotemark,
                                                                                                    latexFref,
                                                                                                    latexGlsAcr,
                                                                                                    latexGlsdisp,
                                                                                                    latexGlsentry,
                                                                                                    latexGlssee,
                                                                                                    latexGnuplotEnv,
                                                                                                    latexGroup,
                                                                                                    latexHref,
                                                                                                    latexHyperbaseurl,
                                                                                                    latexHyperimage,
                                                                                                    latexHyperref,
                                                                                                    latexHyphenation,
                                                                                                    latexIgnored,
                                                                                                    latexInlineMathEnv,
                                                                                                    latexInput,
                                                                                                    latexInvalid,
                                                                                                    latexItem,
                                                                                                    latexItemizeEnv,
                                                                                                    latexLabel,
                                                                                                    latexLatexDisplayMath,
                                                                                                    latexLatexInlineMath,
                                                                                                    latexLet,
                                                                                                    latexLinebreak,
                                                                                                    latexLongnewglossaryentry,
                                                                                                    latexLrboxEnv,
                                                                                                    latexLstinline,
                                                                                                    latexLstlistingEnv,
                                                                                                    latexLua,
                                                                                                    latexLuacode,
                                                                                                    latexLuacodeEnv,
                                                                                                    latexLuacodestarEnv,
                                                                                                    latexMakeatletter,
                                                                                                    latexMakeatother,
                                                                                                    latexMakebox,
                                                                                                    latexMarginpar,
                                                                                                    latexMbox,
                                                                                                    latexMinipageEnv,
                                                                                                    latexMint,
                                                                                                    latexMintedEnv,
                                                                                                    latexMintinline,
                                                                                                    latexMulticolumn,
                                                                                                    latexNewacronym,
                                                                                                    latexNewcommand,
                                                                                                    latexNewcounter,
                                                                                                    latexNewenvironment,
                                                                                                    latexNewfont,
                                                                                                    latexNewglossaryentry,
                                                                                                    latexNewlength,
                                                                                                    latexNewline,
                                                                                                    latexNewsavebox,
                                                                                                    latexNewtheorem,
                                                                                                    latexNocite,
                                                                                                    latexObeycr,
                                                                                                    latexPagebreak,
                                                                                                    latexPagenumbering,
                                                                                                    latexPagestyle,
                                                                                                    latexPar,
                                                                                                    latexParameterRef,
                                                                                                    latexParbox,
                                                                                                    latexPictureEnv,
                                                                                                    latexPrintcounter,
                                                                                                    latexProtect,
                                                                                                    latexRaisebox,
                                                                                                    latexRef,
                                                                                                    latexRefrange,
                                                                                                    latexRegexp,
                                                                                                    latexRelax,
                                                                                                    latexRestorecr,
                                                                                                    latexSavebox,
                                                                                                    latexSbox,
                                                                                                    latexSection,
                                                                                                    latexSemiSimpleGroup,
                                                                                                    latexSetcounter,
                                                                                                    latexSetlength,
                                                                                                    latexSetto,
                                                                                                    latexShortVerb,
                                                                                                    latexSpace,
                                                                                                    latexStepcounter,
                                                                                                    latexString,
                                                                                                    latexTableEnv,
                                                                                                    latexTabuEnv,
                                                                                                    latexTabularEnv,
                                                                                                    latexTabularstarEnv,
                                                                                                    latexTexDisplayMath,
                                                                                                    latexTexInlineMath,
                                                                                                    latexText,
                                                                                                    latexTextEnv,
                                                                                                    latexTextstyle,
                                                                                                    latexThanks,
                                                                                                    latexThebibliographyEnv,
                                                                                                    latexTheoremEnv,
                                                                                                    latexTikzpictureEnv,
                                                                                                    latexTitle,
                                                                                                    latexUrl,
                                                                                                    latexUse,
                                                                                                    latexUse209,
                                                                                                    latexUsebox,
                                                                                                    latexValue,
                                                                                                    latexVerb,
                                                                                                    latexVerbatimEnv,
                                                                                                    latexVolcite,
                                                                                                    latexVolcites
                                                                                                  }
                                                                          tmp[latexMint] = {
                                                                                             latexBrackGroup,
                                                                                             latexCs,
                                                                                             latexExit,
                                                                                             latexGroup,
                                                                                             latexPar,
                                                                                             latexParameterRef,
                                                                                             latexText,
                                                                                             latexVerbDelim,
                                                                                             latexVerbatim
                                                                                           }
                                                                          tmp[latexMintedEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexMintinline] = {
                                                                                                   latexBrackGroup,
                                                                                                   latexCs,
                                                                                                   latexExit,
                                                                                                   latexGroup,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexText,
                                                                                                   latexVerbDelim,
                                                                                                   latexVerbatim
                                                                                                 }
                                                                          tmp[latexMulticolumn] = {
                                                                                                    latexCs,
                                                                                                    latexExit,
                                                                                                    latexGroup,
                                                                                                    latexMath,
                                                                                                    latexPar,
                                                                                                    latexParameterRef,
                                                                                                    latexText
                                                                                                  }
                                                                          tmp[latexNewacronym] = {
                                                                                                   latexBrackGroup,
                                                                                                   latexCs,
                                                                                                   latexExit,
                                                                                                   latexGroup,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexText
                                                                                                 }
                                                                          tmp[latexNewcommand] = {
                                                                                                   latexBrackGroup,
                                                                                                   latexCs,
                                                                                                   latexExit,
                                                                                                   latexGroup,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexStar,
                                                                                                   latexText
                                                                                                 }
                                                                          tmp[latexNewcounter] = {
                                                                                                   latexBrackGroup,
                                                                                                   latexCs,
                                                                                                   latexExit,
                                                                                                   latexGroup,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexText
                                                                                                 }
                                                                          tmp[latexNewenvironment] = {
                                                                                                       latexBrackGroup,
                                                                                                       latexCs,
                                                                                                       latexExit,
                                                                                                       latexGroup,
                                                                                                       latexPar,
                                                                                                       latexParameterRef,
                                                                                                       latexStar,
                                                                                                       latexText
                                                                                                     }
                                                                          tmp[latexNewfont] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexNewglossaryentry] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexNewlength] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexNewline] = {latexBrackGroup, latexCs, latexStar}
                                                                          tmp[latexNewsavebox] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexNewtheorem] = {
                                                                                                   latexBrackGroup,
                                                                                                   latexCs,
                                                                                                   latexExit,
                                                                                                   latexGroup,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexStar,
                                                                                                   latexText
                                                                                                 }
                                                                          tmp[latexNocite] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexObeycr] = {latexCs}
                                                                          tmp[latexPagebreak] = {latexBrackGroup, latexCs}
                                                                          tmp[latexPagenumbering] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexPagestyle] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexPar] = {latexCs, latexEol}
                                                                          tmp[latexParbox] = {
                                                                                               latexBrackGroup,
                                                                                               latexCs,
                                                                                               latexExit,
                                                                                               latexGroup,
                                                                                               latexPar,
                                                                                               latexParameterRef,
                                                                                               latexText
                                                                                             }
                                                                          tmp[latexParenGroup] = {latexComma, latexFixed, latexLparen, latexRparen}
                                                                          tmp[latexPhantomSmash] = {latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexPictureEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexPrintcounter] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexProtect] = {
                                                                                                latexAt,
                                                                                                latexCheckCommand,
                                                                                                latexDeclareOption,
                                                                                                latexDeleteShortVerb,
                                                                                                latexDoNotIndex,
                                                                                                latexError,
                                                                                                latexExecuteOptions,
                                                                                                latexExplSyntaxOff,
                                                                                                latexExplSyntaxOn,
                                                                                                latexIfFileExists,
                                                                                                latexMakeShortVerb,
                                                                                                latexNeedsTeXFOrmat,
                                                                                                latexPassOptionsTo,
                                                                                                latexProcessOptions,
                                                                                                latexProvides,
                                                                                                latexProvidesExpl,
                                                                                                latexVerbatimEnv,
                                                                                                latexWarningInfo,
                                                                                                latexAddvspace,
                                                                                                latexAlignatEnv,
                                                                                                latexArrayEnv,
                                                                                                latexAtIfpackagelater,
                                                                                                latexAuthor,
                                                                                                latexBibitem,
                                                                                                latexCite,
                                                                                                latexCites,
                                                                                                latexCline,
                                                                                                latexCode,
                                                                                                latexCommentEnv,
                                                                                                latexCs,
                                                                                                latexCsnameGroup,
                                                                                                latexDate,
                                                                                                latexDef,
                                                                                                latexDelimiterGroup,
                                                                                                latexDiscretionary,
                                                                                                latexDisplayMathEnv,
                                                                                                latexDmathEnv,
                                                                                                latexDocumentEnv,
                                                                                                latexDseriesEnv,
                                                                                                latexEmph,
                                                                                                latexEndinput,
                                                                                                latexEnlargethispage,
                                                                                                latexEnsuremath,
                                                                                                latexExit,
                                                                                                latexExpandafter,
                                                                                                latexFigureEnv,
                                                                                                latexFilecontentsEnv,
                                                                                                latexFootnote,
                                                                                                latexFootnotemark,
                                                                                                latexFrac,
                                                                                                latexFref,
                                                                                                latexGlsAcr,
                                                                                                latexGlsdisp,
                                                                                                latexGlsentry,
                                                                                                latexGlssee,
                                                                                                latexGnuplotEnv,
                                                                                                latexGroup,
                                                                                                latexHref,
                                                                                                latexHyperbaseurl,
                                                                                                latexHyperimage,
                                                                                                latexHyperref,
                                                                                                latexHyphenation,
                                                                                                latexInlineMathEnv,
                                                                                                latexInput,
                                                                                                latexItem,
                                                                                                latexItemizeEnv,
                                                                                                latexLabel,
                                                                                                latexLatexDisplayMath,
                                                                                                latexLatexInlineMath,
                                                                                                latexLet,
                                                                                                latexLinebreak,
                                                                                                latexLongnewglossaryentry,
                                                                                                latexLrboxEnv,
                                                                                                latexLstinline,
                                                                                                latexLstlistingEnv,
                                                                                                latexLua,
                                                                                                latexLuacode,
                                                                                                latexLuacodeEnv,
                                                                                                latexLuacodestarEnv,
                                                                                                latexMakeatletter,
                                                                                                latexMakeatother,
                                                                                                latexMakebox,
                                                                                                latexMarginpar,
                                                                                                latexMath,
                                                                                                latexMathEnv,
                                                                                                latexMathaccent,
                                                                                                latexMathstyle,
                                                                                                latexMbox,
                                                                                                latexMinipageEnv,
                                                                                                latexMint,
                                                                                                latexMintedEnv,
                                                                                                latexMintinline,
                                                                                                latexMulticolumn,
                                                                                                latexNewacronym,
                                                                                                latexNewcommand,
                                                                                                latexNewcounter,
                                                                                                latexNewenvironment,
                                                                                                latexNewfont,
                                                                                                latexNewglossaryentry,
                                                                                                latexNewlength,
                                                                                                latexNewline,
                                                                                                latexNewsavebox,
                                                                                                latexNewtheorem,
                                                                                                latexNocite,
                                                                                                latexObeycr,
                                                                                                latexPagebreak,
                                                                                                latexPagenumbering,
                                                                                                latexPagestyle,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexParbox,
                                                                                                latexPhantomSmash,
                                                                                                latexPictureEnv,
                                                                                                latexPrintcounter,
                                                                                                latexProtect,
                                                                                                latexRaisebox,
                                                                                                latexRef,
                                                                                                latexRefrange,
                                                                                                latexRegexp,
                                                                                                latexRelax,
                                                                                                latexRestorecr,
                                                                                                latexSavebox,
                                                                                                latexSbox,
                                                                                                latexSection,
                                                                                                latexSetcounter,
                                                                                                latexSetlength,
                                                                                                latexSetto,
                                                                                                latexShortVerb,
                                                                                                latexSpace,
                                                                                                latexSqrt,
                                                                                                latexStackrel,
                                                                                                latexStepcounter,
                                                                                                latexString,
                                                                                                latexTableEnv,
                                                                                                latexTabuEnv,
                                                                                                latexTabularEnv,
                                                                                                latexTabularstarEnv,
                                                                                                latexTag,
                                                                                                latexTexDisplayMath,
                                                                                                latexTexInlineMath,
                                                                                                latexText,
                                                                                                latexTextCmd,
                                                                                                latexTextEnv,
                                                                                                latexTextstyle,
                                                                                                latexThanks,
                                                                                                latexThebibliographyEnv,
                                                                                                latexTheoremEnv,
                                                                                                latexTikzpictureEnv,
                                                                                                latexTitle,
                                                                                                latexUrl,
                                                                                                latexUse,
                                                                                                latexUse209,
                                                                                                latexUsebox,
                                                                                                latexValue,
                                                                                                latexVerb,
                                                                                                latexVerbatimEnv,
                                                                                                latexVolcite,
                                                                                                latexVolcites
                                                                                              }
                                                                          tmp[latexRaisebox] = {
                                                                                                 latexBrackGroup,
                                                                                                 latexCs,
                                                                                                 latexExit,
                                                                                                 latexGroup,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexText
                                                                                               }
                                                                          tmp[latexRef] = {
                                                                                            latexCs,
                                                                                            latexExit,
                                                                                            latexGroup,
                                                                                            latexPar,
                                                                                            latexParameterRef,
                                                                                            latexStar,
                                                                                            latexText
                                                                                          }
                                                                          tmp[latexRefrange] = {
                                                                                                 latexCs,
                                                                                                 latexExit,
                                                                                                 latexGroup,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexStar,
                                                                                                 latexText
                                                                                               }
                                                                          tmp[latexRegexp] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexRelax] = {latexCs}
                                                                          tmp[latexRestorecr] = {latexCs}
                                                                          tmp[latexRight] = {latexCs, latexExit, latexGroup, latexMath, latexPar, latexParameterRef}
                                                                          tmp[latexSavebox] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexSbox] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexSection] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexStar,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexSemiSimpleGroup] = {
                                                                                                        latexAt,
                                                                                                        latexCheckCommand,
                                                                                                        latexDeclareOption,
                                                                                                        latexDeleteShortVerb,
                                                                                                        latexDoNotIndex,
                                                                                                        latexError,
                                                                                                        latexExecuteOptions,
                                                                                                        latexExplSyntaxOff,
                                                                                                        latexExplSyntaxOn,
                                                                                                        latexIfFileExists,
                                                                                                        latexMakeShortVerb,
                                                                                                        latexNeedsTeXFOrmat,
                                                                                                        latexPassOptionsTo,
                                                                                                        latexProcessOptions,
                                                                                                        latexProvides,
                                                                                                        latexProvidesExpl,
                                                                                                        latexVerbatimEnv,
                                                                                                        latexWarningInfo,
                                                                                                        latexActiveChar,
                                                                                                        latexAddvspace,
                                                                                                        latexAlignatEnv,
                                                                                                        latexAlignmentTab,
                                                                                                        latexAtIfpackagelater,
                                                                                                        latexAuthor,
                                                                                                        latexBegingroup,
                                                                                                        latexBibitem,
                                                                                                        latexCharRefInvalid,
                                                                                                        latexCite,
                                                                                                        latexCites,
                                                                                                        latexCline,
                                                                                                        latexCode,
                                                                                                        latexCommentEnv,
                                                                                                        latexCs,
                                                                                                        latexCsnameGroup,
                                                                                                        latexDate,
                                                                                                        latexDef,
                                                                                                        latexDiscretionary,
                                                                                                        latexDisplayMathEnv,
                                                                                                        latexDmathEnv,
                                                                                                        latexDocumentEnv,
                                                                                                        latexDseriesEnv,
                                                                                                        latexEmph,
                                                                                                        latexEndgroup,
                                                                                                        latexEndinput,
                                                                                                        latexEnlargethispage,
                                                                                                        latexEnsuremath,
                                                                                                        latexExit,
                                                                                                        latexExpandafter,
                                                                                                        latexFigureEnv,
                                                                                                        latexFilecontentsEnv,
                                                                                                        latexFootnote,
                                                                                                        latexFootnotemark,
                                                                                                        latexFref,
                                                                                                        latexGlsAcr,
                                                                                                        latexGlsdisp,
                                                                                                        latexGlsentry,
                                                                                                        latexGlssee,
                                                                                                        latexGnuplotEnv,
                                                                                                        latexGroup,
                                                                                                        latexHref,
                                                                                                        latexHyperbaseurl,
                                                                                                        latexHyperimage,
                                                                                                        latexHyperref,
                                                                                                        latexHyphenation,
                                                                                                        latexIgnored,
                                                                                                        latexInlineMathEnv,
                                                                                                        latexInput,
                                                                                                        latexInvalid,
                                                                                                        latexItem,
                                                                                                        latexItemizeEnv,
                                                                                                        latexLabel,
                                                                                                        latexLatexDisplayMath,
                                                                                                        latexLatexInlineMath,
                                                                                                        latexLet,
                                                                                                        latexLinebreak,
                                                                                                        latexLongnewglossaryentry,
                                                                                                        latexLrboxEnv,
                                                                                                        latexLstinline,
                                                                                                        latexLstlistingEnv,
                                                                                                        latexLua,
                                                                                                        latexLuacode,
                                                                                                        latexLuacodeEnv,
                                                                                                        latexLuacodestarEnv,
                                                                                                        latexMakeatletter,
                                                                                                        latexMakeatother,
                                                                                                        latexMakebox,
                                                                                                        latexMarginpar,
                                                                                                        latexMbox,
                                                                                                        latexMinipageEnv,
                                                                                                        latexMint,
                                                                                                        latexMintedEnv,
                                                                                                        latexMintinline,
                                                                                                        latexMulticolumn,
                                                                                                        latexNewacronym,
                                                                                                        latexNewcommand,
                                                                                                        latexNewcounter,
                                                                                                        latexNewenvironment,
                                                                                                        latexNewfont,
                                                                                                        latexNewglossaryentry,
                                                                                                        latexNewlength,
                                                                                                        latexNewline,
                                                                                                        latexNewsavebox,
                                                                                                        latexNewtheorem,
                                                                                                        latexNocite,
                                                                                                        latexObeycr,
                                                                                                        latexPagebreak,
                                                                                                        latexPagenumbering,
                                                                                                        latexPagestyle,
                                                                                                        latexPar,
                                                                                                        latexParameterRef,
                                                                                                        latexParbox,
                                                                                                        latexPictureEnv,
                                                                                                        latexPrintcounter,
                                                                                                        latexProtect,
                                                                                                        latexRaisebox,
                                                                                                        latexRef,
                                                                                                        latexRefrange,
                                                                                                        latexRegexp,
                                                                                                        latexRelax,
                                                                                                        latexRestorecr,
                                                                                                        latexSavebox,
                                                                                                        latexSbox,
                                                                                                        latexSection,
                                                                                                        latexSemiSimpleGroup,
                                                                                                        latexSetcounter,
                                                                                                        latexSetlength,
                                                                                                        latexSetto,
                                                                                                        latexShortVerb,
                                                                                                        latexSpace,
                                                                                                        latexStepcounter,
                                                                                                        latexString,
                                                                                                        latexTableEnv,
                                                                                                        latexTabuEnv,
                                                                                                        latexTabularEnv,
                                                                                                        latexTabularstarEnv,
                                                                                                        latexTexDisplayMath,
                                                                                                        latexTexInlineMath,
                                                                                                        latexText,
                                                                                                        latexTextEnv,
                                                                                                        latexTextstyle,
                                                                                                        latexThanks,
                                                                                                        latexThebibliographyEnv,
                                                                                                        latexTheoremEnv,
                                                                                                        latexTikzpictureEnv,
                                                                                                        latexTitle,
                                                                                                        latexUrl,
                                                                                                        latexUse,
                                                                                                        latexUse209,
                                                                                                        latexUsebox,
                                                                                                        latexValue,
                                                                                                        latexVerb,
                                                                                                        latexVerbatimEnv,
                                                                                                        latexVolcite,
                                                                                                        latexVolcites
                                                                                                      }
                                                                          tmp[latexSetcounter] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexSetlength] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexSetto] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexShortVerb] = {latexExit, latexVerbDelim, latexVerbatim}
                                                                          tmp[latexSpace] = {latexCs, latexExit, latexGroup, latexPar, latexStar}
                                                                          tmp[latexSqrt] = {latexBrackGroup, latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexStackrel] = {latexCs, latexExit, latexGroup, latexMath, latexParameterRef}
                                                                          tmp[latexStepcounter] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexString] = {latexCs, latexExit, latexPar, latexText}
                                                                          tmp[latexTableEnv] = {
                                                                                                 latexAt,
                                                                                                 latexCheckCommand,
                                                                                                 latexDeclareOption,
                                                                                                 latexDeleteShortVerb,
                                                                                                 latexDoNotIndex,
                                                                                                 latexError,
                                                                                                 latexExecuteOptions,
                                                                                                 latexExplSyntaxOff,
                                                                                                 latexExplSyntaxOn,
                                                                                                 latexIfFileExists,
                                                                                                 latexMakeShortVerb,
                                                                                                 latexNeedsTeXFOrmat,
                                                                                                 latexPassOptionsTo,
                                                                                                 latexProcessOptions,
                                                                                                 latexProvides,
                                                                                                 latexProvidesExpl,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexWarningInfo,
                                                                                                 latexActiveChar,
                                                                                                 latexAddvspace,
                                                                                                 latexAlignatEnv,
                                                                                                 latexAlignmentTab,
                                                                                                 latexAtIfpackagelater,
                                                                                                 latexAuthor,
                                                                                                 latexBegin,
                                                                                                 latexBibitem,
                                                                                                 latexCharRefInvalid,
                                                                                                 latexCite,
                                                                                                 latexCites,
                                                                                                 latexCline,
                                                                                                 latexCode,
                                                                                                 latexCommentEnv,
                                                                                                 latexCs,
                                                                                                 latexCsnameGroup,
                                                                                                 latexDate,
                                                                                                 latexDef,
                                                                                                 latexDiscretionary,
                                                                                                 latexDisplayMathEnv,
                                                                                                 latexDmathEnv,
                                                                                                 latexDocumentEnv,
                                                                                                 latexDseriesEnv,
                                                                                                 latexEmph,
                                                                                                 latexEnd,
                                                                                                 latexEndinput,
                                                                                                 latexEnlargethispage,
                                                                                                 latexEnsuremath,
                                                                                                 latexExit,
                                                                                                 latexExpandafter,
                                                                                                 latexFigureEnv,
                                                                                                 latexFilecontentsEnv,
                                                                                                 latexFootnote,
                                                                                                 latexFootnotemark,
                                                                                                 latexFref,
                                                                                                 latexGlsAcr,
                                                                                                 latexGlsdisp,
                                                                                                 latexGlsentry,
                                                                                                 latexGlssee,
                                                                                                 latexGnuplotEnv,
                                                                                                 latexGroup,
                                                                                                 latexHref,
                                                                                                 latexHyperbaseurl,
                                                                                                 latexHyperimage,
                                                                                                 latexHyperref,
                                                                                                 latexHyphenation,
                                                                                                 latexIgnored,
                                                                                                 latexInlineMathEnv,
                                                                                                 latexInput,
                                                                                                 latexInvalid,
                                                                                                 latexItem,
                                                                                                 latexItemizeEnv,
                                                                                                 latexLabel,
                                                                                                 latexLatexDisplayMath,
                                                                                                 latexLatexInlineMath,
                                                                                                 latexLet,
                                                                                                 latexLinebreak,
                                                                                                 latexLongnewglossaryentry,
                                                                                                 latexLrboxEnv,
                                                                                                 latexLstinline,
                                                                                                 latexLstlistingEnv,
                                                                                                 latexLua,
                                                                                                 latexLuacode,
                                                                                                 latexLuacodeEnv,
                                                                                                 latexLuacodestarEnv,
                                                                                                 latexMakeatletter,
                                                                                                 latexMakeatother,
                                                                                                 latexMakebox,
                                                                                                 latexMarginpar,
                                                                                                 latexMbox,
                                                                                                 latexMinipageEnv,
                                                                                                 latexMint,
                                                                                                 latexMintedEnv,
                                                                                                 latexMintinline,
                                                                                                 latexMulticolumn,
                                                                                                 latexNewacronym,
                                                                                                 latexNewcommand,
                                                                                                 latexNewcounter,
                                                                                                 latexNewenvironment,
                                                                                                 latexNewfont,
                                                                                                 latexNewglossaryentry,
                                                                                                 latexNewlength,
                                                                                                 latexNewline,
                                                                                                 latexNewsavebox,
                                                                                                 latexNewtheorem,
                                                                                                 latexNocite,
                                                                                                 latexObeycr,
                                                                                                 latexPagebreak,
                                                                                                 latexPagenumbering,
                                                                                                 latexPagestyle,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexParbox,
                                                                                                 latexPictureEnv,
                                                                                                 latexPrintcounter,
                                                                                                 latexProtect,
                                                                                                 latexRaisebox,
                                                                                                 latexRef,
                                                                                                 latexRefrange,
                                                                                                 latexRegexp,
                                                                                                 latexRelax,
                                                                                                 latexRestorecr,
                                                                                                 latexSavebox,
                                                                                                 latexSbox,
                                                                                                 latexSection,
                                                                                                 latexSemiSimpleGroup,
                                                                                                 latexSetcounter,
                                                                                                 latexSetlength,
                                                                                                 latexSetto,
                                                                                                 latexShortVerb,
                                                                                                 latexSpace,
                                                                                                 latexStepcounter,
                                                                                                 latexString,
                                                                                                 latexTableEnv,
                                                                                                 latexTabuEnv,
                                                                                                 latexTabularEnv,
                                                                                                 latexTabularstarEnv,
                                                                                                 latexTexDisplayMath,
                                                                                                 latexTexInlineMath,
                                                                                                 latexText,
                                                                                                 latexTextEnv,
                                                                                                 latexTextstyle,
                                                                                                 latexThanks,
                                                                                                 latexThebibliographyEnv,
                                                                                                 latexTheoremEnv,
                                                                                                 latexTikzpictureEnv,
                                                                                                 latexTitle,
                                                                                                 latexUrl,
                                                                                                 latexUse,
                                                                                                 latexUse209,
                                                                                                 latexUsebox,
                                                                                                 latexValue,
                                                                                                 latexVerb,
                                                                                                 latexVerbatimEnv,
                                                                                                 latexVolcite,
                                                                                                 latexVolcites
                                                                                               }
                                                                          tmp[latexTabuEnv] = {
                                                                                                latexAt,
                                                                                                latexCheckCommand,
                                                                                                latexDeclareOption,
                                                                                                latexDeleteShortVerb,
                                                                                                latexDoNotIndex,
                                                                                                latexError,
                                                                                                latexExecuteOptions,
                                                                                                latexExplSyntaxOff,
                                                                                                latexExplSyntaxOn,
                                                                                                latexIfFileExists,
                                                                                                latexMakeShortVerb,
                                                                                                latexNeedsTeXFOrmat,
                                                                                                latexPassOptionsTo,
                                                                                                latexProcessOptions,
                                                                                                latexProvides,
                                                                                                latexProvidesExpl,
                                                                                                latexVerbatimEnv,
                                                                                                latexWarningInfo,
                                                                                                latexActiveChar,
                                                                                                latexAddvspace,
                                                                                                latexAlignatEnv,
                                                                                                latexAlignmentTab,
                                                                                                latexArrayEnv,
                                                                                                latexAtIfpackagelater,
                                                                                                latexAuthor,
                                                                                                latexBegin,
                                                                                                latexBibitem,
                                                                                                latexCharRefInvalid,
                                                                                                latexCite,
                                                                                                latexCites,
                                                                                                latexCline,
                                                                                                latexCode,
                                                                                                latexCommentEnv,
                                                                                                latexCs,
                                                                                                latexCsnameGroup,
                                                                                                latexDate,
                                                                                                latexDef,
                                                                                                latexDelimiterGroup,
                                                                                                latexDiscretionary,
                                                                                                latexDisplayMathEnv,
                                                                                                latexDmathEnv,
                                                                                                latexDocumentEnv,
                                                                                                latexDseriesEnv,
                                                                                                latexEmph,
                                                                                                latexEnd,
                                                                                                latexEndinput,
                                                                                                latexEnlargethispage,
                                                                                                latexEnsuremath,
                                                                                                latexExit,
                                                                                                latexExpandafter,
                                                                                                latexFigureEnv,
                                                                                                latexFilecontentsEnv,
                                                                                                latexFootnote,
                                                                                                latexFootnotemark,
                                                                                                latexFrac,
                                                                                                latexFref,
                                                                                                latexGlsAcr,
                                                                                                latexGlsdisp,
                                                                                                latexGlsentry,
                                                                                                latexGlssee,
                                                                                                latexGnuplotEnv,
                                                                                                latexGroup,
                                                                                                latexHref,
                                                                                                latexHyperbaseurl,
                                                                                                latexHyperimage,
                                                                                                latexHyperref,
                                                                                                latexHyphenation,
                                                                                                latexIgnored,
                                                                                                latexInlineMathEnv,
                                                                                                latexInput,
                                                                                                latexInvalid,
                                                                                                latexItem,
                                                                                                latexItemizeEnv,
                                                                                                latexLabel,
                                                                                                latexLatexDisplayMath,
                                                                                                latexLatexInlineMath,
                                                                                                latexLet,
                                                                                                latexLinebreak,
                                                                                                latexLongnewglossaryentry,
                                                                                                latexLrboxEnv,
                                                                                                latexLstinline,
                                                                                                latexLstlistingEnv,
                                                                                                latexLua,
                                                                                                latexLuacode,
                                                                                                latexLuacodeEnv,
                                                                                                latexLuacodestarEnv,
                                                                                                latexMakeatletter,
                                                                                                latexMakeatother,
                                                                                                latexMakebox,
                                                                                                latexMarginpar,
                                                                                                latexMath,
                                                                                                latexMathEnv,
                                                                                                latexMathaccent,
                                                                                                latexMathstyle,
                                                                                                latexMbox,
                                                                                                latexMinipageEnv,
                                                                                                latexMint,
                                                                                                latexMintedEnv,
                                                                                                latexMintinline,
                                                                                                latexMulticolumn,
                                                                                                latexNewacronym,
                                                                                                latexNewcommand,
                                                                                                latexNewcounter,
                                                                                                latexNewenvironment,
                                                                                                latexNewfont,
                                                                                                latexNewglossaryentry,
                                                                                                latexNewlength,
                                                                                                latexNewline,
                                                                                                latexNewsavebox,
                                                                                                latexNewtheorem,
                                                                                                latexNocite,
                                                                                                latexObeycr,
                                                                                                latexPagebreak,
                                                                                                latexPagenumbering,
                                                                                                latexPagestyle,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexParbox,
                                                                                                latexPhantomSmash,
                                                                                                latexPictureEnv,
                                                                                                latexPrintcounter,
                                                                                                latexProtect,
                                                                                                latexRaisebox,
                                                                                                latexRef,
                                                                                                latexRefrange,
                                                                                                latexRegexp,
                                                                                                latexRelax,
                                                                                                latexRestorecr,
                                                                                                latexSavebox,
                                                                                                latexSbox,
                                                                                                latexSection,
                                                                                                latexSemiSimpleGroup,
                                                                                                latexSetcounter,
                                                                                                latexSetlength,
                                                                                                latexSetto,
                                                                                                latexShortVerb,
                                                                                                latexSpace,
                                                                                                latexSqrt,
                                                                                                latexStackrel,
                                                                                                latexStepcounter,
                                                                                                latexString,
                                                                                                latexSubscript,
                                                                                                latexSuperscript,
                                                                                                latexTableEnv,
                                                                                                latexTabuEnv,
                                                                                                latexTabularEnv,
                                                                                                latexTabularstarEnv,
                                                                                                latexTag,
                                                                                                latexTexDisplayMath,
                                                                                                latexTexInlineMath,
                                                                                                latexText,
                                                                                                latexTextCmd,
                                                                                                latexTextEnv,
                                                                                                latexTextstyle,
                                                                                                latexThanks,
                                                                                                latexThebibliographyEnv,
                                                                                                latexTheoremEnv,
                                                                                                latexTikzpictureEnv,
                                                                                                latexTitle,
                                                                                                latexUrl,
                                                                                                latexUse,
                                                                                                latexUse209,
                                                                                                latexUsebox,
                                                                                                latexValue,
                                                                                                latexVerb,
                                                                                                latexVerbatimEnv,
                                                                                                latexVolcite,
                                                                                                latexVolcites
                                                                                              }
                                                                          tmp[latexTabularEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexTabularstarEnv] = {
                                                                                                       latexAt,
                                                                                                       latexCheckCommand,
                                                                                                       latexDeclareOption,
                                                                                                       latexDeleteShortVerb,
                                                                                                       latexDoNotIndex,
                                                                                                       latexError,
                                                                                                       latexExecuteOptions,
                                                                                                       latexExplSyntaxOff,
                                                                                                       latexExplSyntaxOn,
                                                                                                       latexIfFileExists,
                                                                                                       latexMakeShortVerb,
                                                                                                       latexNeedsTeXFOrmat,
                                                                                                       latexPassOptionsTo,
                                                                                                       latexProcessOptions,
                                                                                                       latexProvides,
                                                                                                       latexProvidesExpl,
                                                                                                       latexVerbatimEnv,
                                                                                                       latexWarningInfo,
                                                                                                       latexActiveChar,
                                                                                                       latexAddvspace,
                                                                                                       latexAlignatEnv,
                                                                                                       latexAlignmentTab,
                                                                                                       latexAtIfpackagelater,
                                                                                                       latexAuthor,
                                                                                                       latexBegin,
                                                                                                       latexBibitem,
                                                                                                       latexCharRefInvalid,
                                                                                                       latexCite,
                                                                                                       latexCites,
                                                                                                       latexCline,
                                                                                                       latexCode,
                                                                                                       latexCommentEnv,
                                                                                                       latexCs,
                                                                                                       latexCsnameGroup,
                                                                                                       latexDate,
                                                                                                       latexDef,
                                                                                                       latexDiscretionary,
                                                                                                       latexDisplayMathEnv,
                                                                                                       latexDmathEnv,
                                                                                                       latexDocumentEnv,
                                                                                                       latexDseriesEnv,
                                                                                                       latexEmph,
                                                                                                       latexEnd,
                                                                                                       latexEndinput,
                                                                                                       latexEnlargethispage,
                                                                                                       latexEnsuremath,
                                                                                                       latexExit,
                                                                                                       latexExpandafter,
                                                                                                       latexFigureEnv,
                                                                                                       latexFilecontentsEnv,
                                                                                                       latexFootnote,
                                                                                                       latexFootnotemark,
                                                                                                       latexFref,
                                                                                                       latexGlsAcr,
                                                                                                       latexGlsdisp,
                                                                                                       latexGlsentry,
                                                                                                       latexGlssee,
                                                                                                       latexGnuplotEnv,
                                                                                                       latexGroup,
                                                                                                       latexHref,
                                                                                                       latexHyperbaseurl,
                                                                                                       latexHyperimage,
                                                                                                       latexHyperref,
                                                                                                       latexHyphenation,
                                                                                                       latexIgnored,
                                                                                                       latexInlineMathEnv,
                                                                                                       latexInput,
                                                                                                       latexInvalid,
                                                                                                       latexItem,
                                                                                                       latexItemizeEnv,
                                                                                                       latexLabel,
                                                                                                       latexLatexDisplayMath,
                                                                                                       latexLatexInlineMath,
                                                                                                       latexLet,
                                                                                                       latexLinebreak,
                                                                                                       latexLongnewglossaryentry,
                                                                                                       latexLrboxEnv,
                                                                                                       latexLstinline,
                                                                                                       latexLstlistingEnv,
                                                                                                       latexLua,
                                                                                                       latexLuacode,
                                                                                                       latexLuacodeEnv,
                                                                                                       latexLuacodestarEnv,
                                                                                                       latexMakeatletter,
                                                                                                       latexMakeatother,
                                                                                                       latexMakebox,
                                                                                                       latexMarginpar,
                                                                                                       latexMbox,
                                                                                                       latexMinipageEnv,
                                                                                                       latexMint,
                                                                                                       latexMintedEnv,
                                                                                                       latexMintinline,
                                                                                                       latexMulticolumn,
                                                                                                       latexNewacronym,
                                                                                                       latexNewcommand,
                                                                                                       latexNewcounter,
                                                                                                       latexNewenvironment,
                                                                                                       latexNewfont,
                                                                                                       latexNewglossaryentry,
                                                                                                       latexNewlength,
                                                                                                       latexNewline,
                                                                                                       latexNewsavebox,
                                                                                                       latexNewtheorem,
                                                                                                       latexNocite,
                                                                                                       latexObeycr,
                                                                                                       latexPagebreak,
                                                                                                       latexPagenumbering,
                                                                                                       latexPagestyle,
                                                                                                       latexPar,
                                                                                                       latexParameterRef,
                                                                                                       latexParbox,
                                                                                                       latexPictureEnv,
                                                                                                       latexPrintcounter,
                                                                                                       latexProtect,
                                                                                                       latexRaisebox,
                                                                                                       latexRef,
                                                                                                       latexRefrange,
                                                                                                       latexRegexp,
                                                                                                       latexRelax,
                                                                                                       latexRestorecr,
                                                                                                       latexSavebox,
                                                                                                       latexSbox,
                                                                                                       latexSection,
                                                                                                       latexSemiSimpleGroup,
                                                                                                       latexSetcounter,
                                                                                                       latexSetlength,
                                                                                                       latexSetto,
                                                                                                       latexShortVerb,
                                                                                                       latexSpace,
                                                                                                       latexStepcounter,
                                                                                                       latexString,
                                                                                                       latexTableEnv,
                                                                                                       latexTabuEnv,
                                                                                                       latexTabularEnv,
                                                                                                       latexTabularstarEnv,
                                                                                                       latexTexDisplayMath,
                                                                                                       latexTexInlineMath,
                                                                                                       latexText,
                                                                                                       latexTextEnv,
                                                                                                       latexTextstyle,
                                                                                                       latexThanks,
                                                                                                       latexThebibliographyEnv,
                                                                                                       latexTheoremEnv,
                                                                                                       latexTikzpictureEnv,
                                                                                                       latexTitle,
                                                                                                       latexUrl,
                                                                                                       latexUse,
                                                                                                       latexUse209,
                                                                                                       latexUsebox,
                                                                                                       latexValue,
                                                                                                       latexVerb,
                                                                                                       latexVerbatimEnv,
                                                                                                       latexVolcite,
                                                                                                       latexVolcites
                                                                                                     }
                                                                          tmp[latexTag] = {latexCs, latexExit, latexGroup, latexParameterRef, latexText}
                                                                          tmp[latexTexDisplayMath] = {
                                                                                                       latexCheckCommand,
                                                                                                       latexDeleteShortVerb,
                                                                                                       latexError,
                                                                                                       latexExplSyntaxOff,
                                                                                                       latexExplSyntaxOn,
                                                                                                       latexIfFileExists,
                                                                                                       latexMakeShortVerb,
                                                                                                       latexWarningInfo,
                                                                                                       latexActiveChar,
                                                                                                       latexAddvspace,
                                                                                                       latexAlignmentTab,
                                                                                                       latexArrayEnv,
                                                                                                       latexCharRefInvalid,
                                                                                                       latexCline,
                                                                                                       latexCode,
                                                                                                       latexCs,
                                                                                                       latexCsnameGroup,
                                                                                                       latexDef,
                                                                                                       latexDelimiterGroup,
                                                                                                       latexDisplayMathShift,
                                                                                                       latexEndinput,
                                                                                                       latexEnsuremath,
                                                                                                       latexExit,
                                                                                                       latexExpandafter,
                                                                                                       latexFrac,
                                                                                                       latexFref,
                                                                                                       latexGroup,
                                                                                                       latexHref,
                                                                                                       latexHyperbaseurl,
                                                                                                       latexHyperimage,
                                                                                                       latexHyperref,
                                                                                                       latexIgnored,
                                                                                                       latexInput,
                                                                                                       latexInvalid,
                                                                                                       latexLabel,
                                                                                                       latexLet,
                                                                                                       latexLua,
                                                                                                       latexLuacode,
                                                                                                       latexLuacodeEnv,
                                                                                                       latexLuacodestarEnv,
                                                                                                       latexMakeatletter,
                                                                                                       latexMakeatother,
                                                                                                       latexMath,
                                                                                                       latexMathEnv,
                                                                                                       latexMathShift,
                                                                                                       latexMathaccent,
                                                                                                       latexMathstyle,
                                                                                                       latexMulticolumn,
                                                                                                       latexNewcommand,
                                                                                                       latexNewcounter,
                                                                                                       latexNewenvironment,
                                                                                                       latexNewfont,
                                                                                                       latexNewlength,
                                                                                                       latexNewsavebox,
                                                                                                       latexParameterRef,
                                                                                                       latexPhantomSmash,
                                                                                                       latexPrintcounter,
                                                                                                       latexProtect,
                                                                                                       latexRef,
                                                                                                       latexRefrange,
                                                                                                       latexRelax,
                                                                                                       latexSetcounter,
                                                                                                       latexSetlength,
                                                                                                       latexSetto,
                                                                                                       latexShortVerb,
                                                                                                       latexSpace,
                                                                                                       latexSqrt,
                                                                                                       latexStackrel,
                                                                                                       latexStepcounter,
                                                                                                       latexString,
                                                                                                       latexSubscript,
                                                                                                       latexSuperscript,
                                                                                                       latexTabuEnv,
                                                                                                       latexTabularEnv,
                                                                                                       latexTabularstarEnv,
                                                                                                       latexTag,
                                                                                                       latexTextCmd,
                                                                                                       latexTikzpictureEnv,
                                                                                                       latexUrl,
                                                                                                       latexValue,
                                                                                                       latexVerb
                                                                                                     }
                                                                          tmp[latexTexInlineMath] = {
                                                                                                      latexCheckCommand,
                                                                                                      latexDeleteShortVerb,
                                                                                                      latexError,
                                                                                                      latexExplSyntaxOff,
                                                                                                      latexExplSyntaxOn,
                                                                                                      latexIfFileExists,
                                                                                                      latexMakeShortVerb,
                                                                                                      latexWarningInfo,
                                                                                                      latexActiveChar,
                                                                                                      latexAddvspace,
                                                                                                      latexAlignmentTab,
                                                                                                      latexArrayEnv,
                                                                                                      latexCharRefInvalid,
                                                                                                      latexCline,
                                                                                                      latexCode,
                                                                                                      latexCs,
                                                                                                      latexCsnameGroup,
                                                                                                      latexDef,
                                                                                                      latexDelimiterGroup,
                                                                                                      latexEndinput,
                                                                                                      latexEnsuremath,
                                                                                                      latexExit,
                                                                                                      latexExpandafter,
                                                                                                      latexFrac,
                                                                                                      latexFref,
                                                                                                      latexGroup,
                                                                                                      latexHref,
                                                                                                      latexHyperbaseurl,
                                                                                                      latexHyperimage,
                                                                                                      latexHyperref,
                                                                                                      latexIgnored,
                                                                                                      latexInput,
                                                                                                      latexInvalid,
                                                                                                      latexLabel,
                                                                                                      latexLet,
                                                                                                      latexLua,
                                                                                                      latexLuacode,
                                                                                                      latexLuacodeEnv,
                                                                                                      latexLuacodestarEnv,
                                                                                                      latexMakeatletter,
                                                                                                      latexMakeatother,
                                                                                                      latexMath,
                                                                                                      latexMathEnv,
                                                                                                      latexMathShift,
                                                                                                      latexMathaccent,
                                                                                                      latexMathstyle,
                                                                                                      latexMulticolumn,
                                                                                                      latexNewcommand,
                                                                                                      latexNewcounter,
                                                                                                      latexNewenvironment,
                                                                                                      latexNewfont,
                                                                                                      latexNewlength,
                                                                                                      latexNewsavebox,
                                                                                                      latexParameterRef,
                                                                                                      latexPhantomSmash,
                                                                                                      latexPrintcounter,
                                                                                                      latexProtect,
                                                                                                      latexRef,
                                                                                                      latexRefrange,
                                                                                                      latexRelax,
                                                                                                      latexSetcounter,
                                                                                                      latexSetlength,
                                                                                                      latexSetto,
                                                                                                      latexShortVerb,
                                                                                                      latexSpace,
                                                                                                      latexSqrt,
                                                                                                      latexStackrel,
                                                                                                      latexStepcounter,
                                                                                                      latexString,
                                                                                                      latexSubscript,
                                                                                                      latexSuperscript,
                                                                                                      latexTabuEnv,
                                                                                                      latexTabularEnv,
                                                                                                      latexTabularstarEnv,
                                                                                                      latexTag,
                                                                                                      latexTextCmd,
                                                                                                      latexTikzpictureEnv,
                                                                                                      latexUrl,
                                                                                                      latexValue,
                                                                                                      latexVerb
                                                                                                    }
                                                                          tmp[latexTextCmd] = {latexCs, latexExit, latexGroup, latexParameterRef, latexText}
                                                                          tmp[latexTextEnv] = {
                                                                                                latexAt,
                                                                                                latexCheckCommand,
                                                                                                latexDeclareOption,
                                                                                                latexDeleteShortVerb,
                                                                                                latexDoNotIndex,
                                                                                                latexError,
                                                                                                latexExecuteOptions,
                                                                                                latexExplSyntaxOff,
                                                                                                latexExplSyntaxOn,
                                                                                                latexIfFileExists,
                                                                                                latexMakeShortVerb,
                                                                                                latexNeedsTeXFOrmat,
                                                                                                latexPassOptionsTo,
                                                                                                latexProcessOptions,
                                                                                                latexProvides,
                                                                                                latexProvidesExpl,
                                                                                                latexVerbatimEnv,
                                                                                                latexWarningInfo,
                                                                                                latexActiveChar,
                                                                                                latexAddvspace,
                                                                                                latexAlignatEnv,
                                                                                                latexAlignmentTab,
                                                                                                latexAtIfpackagelater,
                                                                                                latexAuthor,
                                                                                                latexBegin,
                                                                                                latexBibitem,
                                                                                                latexCharRefInvalid,
                                                                                                latexCite,
                                                                                                latexCites,
                                                                                                latexCline,
                                                                                                latexCode,
                                                                                                latexCommentEnv,
                                                                                                latexCs,
                                                                                                latexCsnameGroup,
                                                                                                latexDate,
                                                                                                latexDef,
                                                                                                latexDiscretionary,
                                                                                                latexDisplayMathEnv,
                                                                                                latexDmathEnv,
                                                                                                latexDocumentEnv,
                                                                                                latexDseriesEnv,
                                                                                                latexEmph,
                                                                                                latexEnd,
                                                                                                latexEndinput,
                                                                                                latexEnlargethispage,
                                                                                                latexEnsuremath,
                                                                                                latexExit,
                                                                                                latexExpandafter,
                                                                                                latexFigureEnv,
                                                                                                latexFilecontentsEnv,
                                                                                                latexFootnote,
                                                                                                latexFootnotemark,
                                                                                                latexFref,
                                                                                                latexGlsAcr,
                                                                                                latexGlsdisp,
                                                                                                latexGlsentry,
                                                                                                latexGlssee,
                                                                                                latexGnuplotEnv,
                                                                                                latexGroup,
                                                                                                latexHref,
                                                                                                latexHyperbaseurl,
                                                                                                latexHyperimage,
                                                                                                latexHyperref,
                                                                                                latexHyphenation,
                                                                                                latexIgnored,
                                                                                                latexInlineMathEnv,
                                                                                                latexInput,
                                                                                                latexInvalid,
                                                                                                latexItem,
                                                                                                latexItemizeEnv,
                                                                                                latexLabel,
                                                                                                latexLatexDisplayMath,
                                                                                                latexLatexInlineMath,
                                                                                                latexLet,
                                                                                                latexLinebreak,
                                                                                                latexLongnewglossaryentry,
                                                                                                latexLrboxEnv,
                                                                                                latexLstinline,
                                                                                                latexLstlistingEnv,
                                                                                                latexLua,
                                                                                                latexLuacode,
                                                                                                latexLuacodeEnv,
                                                                                                latexLuacodestarEnv,
                                                                                                latexMakeatletter,
                                                                                                latexMakeatother,
                                                                                                latexMakebox,
                                                                                                latexMarginpar,
                                                                                                latexMbox,
                                                                                                latexMinipageEnv,
                                                                                                latexMint,
                                                                                                latexMintedEnv,
                                                                                                latexMintinline,
                                                                                                latexMulticolumn,
                                                                                                latexNewacronym,
                                                                                                latexNewcommand,
                                                                                                latexNewcounter,
                                                                                                latexNewenvironment,
                                                                                                latexNewfont,
                                                                                                latexNewglossaryentry,
                                                                                                latexNewlength,
                                                                                                latexNewline,
                                                                                                latexNewsavebox,
                                                                                                latexNewtheorem,
                                                                                                latexNocite,
                                                                                                latexObeycr,
                                                                                                latexPagebreak,
                                                                                                latexPagenumbering,
                                                                                                latexPagestyle,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexParbox,
                                                                                                latexPictureEnv,
                                                                                                latexPrintcounter,
                                                                                                latexProtect,
                                                                                                latexRaisebox,
                                                                                                latexRef,
                                                                                                latexRefrange,
                                                                                                latexRegexp,
                                                                                                latexRelax,
                                                                                                latexRestorecr,
                                                                                                latexSavebox,
                                                                                                latexSbox,
                                                                                                latexSection,
                                                                                                latexSemiSimpleGroup,
                                                                                                latexSetcounter,
                                                                                                latexSetlength,
                                                                                                latexSetto,
                                                                                                latexShortVerb,
                                                                                                latexSpace,
                                                                                                latexStepcounter,
                                                                                                latexString,
                                                                                                latexTableEnv,
                                                                                                latexTabuEnv,
                                                                                                latexTabularEnv,
                                                                                                latexTabularstarEnv,
                                                                                                latexTexDisplayMath,
                                                                                                latexTexInlineMath,
                                                                                                latexText,
                                                                                                latexTextEnv,
                                                                                                latexTextstyle,
                                                                                                latexThanks,
                                                                                                latexThebibliographyEnv,
                                                                                                latexTheoremEnv,
                                                                                                latexTikzpictureEnv,
                                                                                                latexTitle,
                                                                                                latexUrl,
                                                                                                latexUse,
                                                                                                latexUse209,
                                                                                                latexUsebox,
                                                                                                latexValue,
                                                                                                latexVerb,
                                                                                                latexVerbatimEnv,
                                                                                                latexVolcite,
                                                                                                latexVolcites
                                                                                              }
                                                                          tmp[latexTextstyle] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexThanks] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexThebibliographyEnv] = {
                                                                                                           latexAt,
                                                                                                           latexCheckCommand,
                                                                                                           latexDeclareOption,
                                                                                                           latexDeleteShortVerb,
                                                                                                           latexDoNotIndex,
                                                                                                           latexError,
                                                                                                           latexExecuteOptions,
                                                                                                           latexExplSyntaxOff,
                                                                                                           latexExplSyntaxOn,
                                                                                                           latexIfFileExists,
                                                                                                           latexMakeShortVerb,
                                                                                                           latexNeedsTeXFOrmat,
                                                                                                           latexPassOptionsTo,
                                                                                                           latexProcessOptions,
                                                                                                           latexProvides,
                                                                                                           latexProvidesExpl,
                                                                                                           latexVerbatimEnv,
                                                                                                           latexWarningInfo,
                                                                                                           latexActiveChar,
                                                                                                           latexAddvspace,
                                                                                                           latexAlignatEnv,
                                                                                                           latexAlignmentTab,
                                                                                                           latexAtIfpackagelater,
                                                                                                           latexAuthor,
                                                                                                           latexBegin,
                                                                                                           latexBibitem,
                                                                                                           latexCharRefInvalid,
                                                                                                           latexCite,
                                                                                                           latexCites,
                                                                                                           latexCline,
                                                                                                           latexCode,
                                                                                                           latexCommentEnv,
                                                                                                           latexCs,
                                                                                                           latexCsnameGroup,
                                                                                                           latexDate,
                                                                                                           latexDef,
                                                                                                           latexDiscretionary,
                                                                                                           latexDisplayMathEnv,
                                                                                                           latexDmathEnv,
                                                                                                           latexDocumentEnv,
                                                                                                           latexDseriesEnv,
                                                                                                           latexEmph,
                                                                                                           latexEnd,
                                                                                                           latexEndinput,
                                                                                                           latexEnlargethispage,
                                                                                                           latexEnsuremath,
                                                                                                           latexExit,
                                                                                                           latexExpandafter,
                                                                                                           latexFigureEnv,
                                                                                                           latexFilecontentsEnv,
                                                                                                           latexFootnote,
                                                                                                           latexFootnotemark,
                                                                                                           latexFref,
                                                                                                           latexGlsAcr,
                                                                                                           latexGlsdisp,
                                                                                                           latexGlsentry,
                                                                                                           latexGlssee,
                                                                                                           latexGnuplotEnv,
                                                                                                           latexGroup,
                                                                                                           latexHref,
                                                                                                           latexHyperbaseurl,
                                                                                                           latexHyperimage,
                                                                                                           latexHyperref,
                                                                                                           latexHyphenation,
                                                                                                           latexIgnored,
                                                                                                           latexInlineMathEnv,
                                                                                                           latexInput,
                                                                                                           latexInvalid,
                                                                                                           latexItem,
                                                                                                           latexItemizeEnv,
                                                                                                           latexLabel,
                                                                                                           latexLatexDisplayMath,
                                                                                                           latexLatexInlineMath,
                                                                                                           latexLet,
                                                                                                           latexLinebreak,
                                                                                                           latexLongnewglossaryentry,
                                                                                                           latexLrboxEnv,
                                                                                                           latexLstinline,
                                                                                                           latexLstlistingEnv,
                                                                                                           latexLua,
                                                                                                           latexLuacode,
                                                                                                           latexLuacodeEnv,
                                                                                                           latexLuacodestarEnv,
                                                                                                           latexMakeatletter,
                                                                                                           latexMakeatother,
                                                                                                           latexMakebox,
                                                                                                           latexMarginpar,
                                                                                                           latexMbox,
                                                                                                           latexMinipageEnv,
                                                                                                           latexMint,
                                                                                                           latexMintedEnv,
                                                                                                           latexMintinline,
                                                                                                           latexMulticolumn,
                                                                                                           latexNewacronym,
                                                                                                           latexNewcommand,
                                                                                                           latexNewcounter,
                                                                                                           latexNewenvironment,
                                                                                                           latexNewfont,
                                                                                                           latexNewglossaryentry,
                                                                                                           latexNewlength,
                                                                                                           latexNewline,
                                                                                                           latexNewsavebox,
                                                                                                           latexNewtheorem,
                                                                                                           latexNocite,
                                                                                                           latexObeycr,
                                                                                                           latexPagebreak,
                                                                                                           latexPagenumbering,
                                                                                                           latexPagestyle,
                                                                                                           latexPar,
                                                                                                           latexParameterRef,
                                                                                                           latexParbox,
                                                                                                           latexPictureEnv,
                                                                                                           latexPrintcounter,
                                                                                                           latexProtect,
                                                                                                           latexRaisebox,
                                                                                                           latexRef,
                                                                                                           latexRefrange,
                                                                                                           latexRegexp,
                                                                                                           latexRelax,
                                                                                                           latexRestorecr,
                                                                                                           latexSavebox,
                                                                                                           latexSbox,
                                                                                                           latexSection,
                                                                                                           latexSemiSimpleGroup,
                                                                                                           latexSetcounter,
                                                                                                           latexSetlength,
                                                                                                           latexSetto,
                                                                                                           latexShortVerb,
                                                                                                           latexSpace,
                                                                                                           latexStepcounter,
                                                                                                           latexString,
                                                                                                           latexTableEnv,
                                                                                                           latexTabuEnv,
                                                                                                           latexTabularEnv,
                                                                                                           latexTabularstarEnv,
                                                                                                           latexTexDisplayMath,
                                                                                                           latexTexInlineMath,
                                                                                                           latexText,
                                                                                                           latexTextEnv,
                                                                                                           latexTextstyle,
                                                                                                           latexThanks,
                                                                                                           latexThebibliographyEnv,
                                                                                                           latexTheoremEnv,
                                                                                                           latexTikzpictureEnv,
                                                                                                           latexTitle,
                                                                                                           latexUrl,
                                                                                                           latexUse,
                                                                                                           latexUse209,
                                                                                                           latexUsebox,
                                                                                                           latexValue,
                                                                                                           latexVerb,
                                                                                                           latexVerbatimEnv,
                                                                                                           latexVolcite,
                                                                                                           latexVolcites
                                                                                                         }
                                                                          tmp[latexTheoremEnv] = {
                                                                                                   latexAt,
                                                                                                   latexCheckCommand,
                                                                                                   latexDeclareOption,
                                                                                                   latexDeleteShortVerb,
                                                                                                   latexDoNotIndex,
                                                                                                   latexError,
                                                                                                   latexExecuteOptions,
                                                                                                   latexExplSyntaxOff,
                                                                                                   latexExplSyntaxOn,
                                                                                                   latexIfFileExists,
                                                                                                   latexMakeShortVerb,
                                                                                                   latexNeedsTeXFOrmat,
                                                                                                   latexPassOptionsTo,
                                                                                                   latexProcessOptions,
                                                                                                   latexProvides,
                                                                                                   latexProvidesExpl,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexWarningInfo,
                                                                                                   latexActiveChar,
                                                                                                   latexAddvspace,
                                                                                                   latexAlignatEnv,
                                                                                                   latexAlignmentTab,
                                                                                                   latexAtIfpackagelater,
                                                                                                   latexAuthor,
                                                                                                   latexBegin,
                                                                                                   latexBibitem,
                                                                                                   latexCharRefInvalid,
                                                                                                   latexCite,
                                                                                                   latexCites,
                                                                                                   latexCline,
                                                                                                   latexCode,
                                                                                                   latexCommentEnv,
                                                                                                   latexCs,
                                                                                                   latexCsnameGroup,
                                                                                                   latexDate,
                                                                                                   latexDef,
                                                                                                   latexDiscretionary,
                                                                                                   latexDisplayMathEnv,
                                                                                                   latexDmathEnv,
                                                                                                   latexDocumentEnv,
                                                                                                   latexDseriesEnv,
                                                                                                   latexEmph,
                                                                                                   latexEnd,
                                                                                                   latexEndinput,
                                                                                                   latexEnlargethispage,
                                                                                                   latexEnsuremath,
                                                                                                   latexExit,
                                                                                                   latexExpandafter,
                                                                                                   latexFigureEnv,
                                                                                                   latexFilecontentsEnv,
                                                                                                   latexFootnote,
                                                                                                   latexFootnotemark,
                                                                                                   latexFref,
                                                                                                   latexGlsAcr,
                                                                                                   latexGlsdisp,
                                                                                                   latexGlsentry,
                                                                                                   latexGlssee,
                                                                                                   latexGnuplotEnv,
                                                                                                   latexGroup,
                                                                                                   latexHref,
                                                                                                   latexHyperbaseurl,
                                                                                                   latexHyperimage,
                                                                                                   latexHyperref,
                                                                                                   latexHyphenation,
                                                                                                   latexIgnored,
                                                                                                   latexInlineMathEnv,
                                                                                                   latexInput,
                                                                                                   latexInvalid,
                                                                                                   latexItem,
                                                                                                   latexItemizeEnv,
                                                                                                   latexLabel,
                                                                                                   latexLatexDisplayMath,
                                                                                                   latexLatexInlineMath,
                                                                                                   latexLet,
                                                                                                   latexLinebreak,
                                                                                                   latexLongnewglossaryentry,
                                                                                                   latexLrboxEnv,
                                                                                                   latexLstinline,
                                                                                                   latexLstlistingEnv,
                                                                                                   latexLua,
                                                                                                   latexLuacode,
                                                                                                   latexLuacodeEnv,
                                                                                                   latexLuacodestarEnv,
                                                                                                   latexMakeatletter,
                                                                                                   latexMakeatother,
                                                                                                   latexMakebox,
                                                                                                   latexMarginpar,
                                                                                                   latexMbox,
                                                                                                   latexMinipageEnv,
                                                                                                   latexMint,
                                                                                                   latexMintedEnv,
                                                                                                   latexMintinline,
                                                                                                   latexMulticolumn,
                                                                                                   latexNewacronym,
                                                                                                   latexNewcommand,
                                                                                                   latexNewcounter,
                                                                                                   latexNewenvironment,
                                                                                                   latexNewfont,
                                                                                                   latexNewglossaryentry,
                                                                                                   latexNewlength,
                                                                                                   latexNewline,
                                                                                                   latexNewsavebox,
                                                                                                   latexNewtheorem,
                                                                                                   latexNocite,
                                                                                                   latexObeycr,
                                                                                                   latexPagebreak,
                                                                                                   latexPagenumbering,
                                                                                                   latexPagestyle,
                                                                                                   latexPar,
                                                                                                   latexParameterRef,
                                                                                                   latexParbox,
                                                                                                   latexPictureEnv,
                                                                                                   latexPrintcounter,
                                                                                                   latexProtect,
                                                                                                   latexRaisebox,
                                                                                                   latexRef,
                                                                                                   latexRefrange,
                                                                                                   latexRegexp,
                                                                                                   latexRelax,
                                                                                                   latexRestorecr,
                                                                                                   latexSavebox,
                                                                                                   latexSbox,
                                                                                                   latexSection,
                                                                                                   latexSemiSimpleGroup,
                                                                                                   latexSetcounter,
                                                                                                   latexSetlength,
                                                                                                   latexSetto,
                                                                                                   latexShortVerb,
                                                                                                   latexSpace,
                                                                                                   latexStepcounter,
                                                                                                   latexString,
                                                                                                   latexTableEnv,
                                                                                                   latexTabuEnv,
                                                                                                   latexTabularEnv,
                                                                                                   latexTabularstarEnv,
                                                                                                   latexTexDisplayMath,
                                                                                                   latexTexInlineMath,
                                                                                                   latexText,
                                                                                                   latexTextEnv,
                                                                                                   latexTextstyle,
                                                                                                   latexThanks,
                                                                                                   latexThebibliographyEnv,
                                                                                                   latexTheoremEnv,
                                                                                                   latexTikzpictureEnv,
                                                                                                   latexTitle,
                                                                                                   latexUrl,
                                                                                                   latexUse,
                                                                                                   latexUse209,
                                                                                                   latexUsebox,
                                                                                                   latexValue,
                                                                                                   latexVerb,
                                                                                                   latexVerbatimEnv,
                                                                                                   latexVolcite,
                                                                                                   latexVolcites
                                                                                                 }
                                                                          tmp[latexTikzpictureEnv] = {
                                                                                                       latexAt,
                                                                                                       latexCheckCommand,
                                                                                                       latexDeclareOption,
                                                                                                       latexDeleteShortVerb,
                                                                                                       latexDoNotIndex,
                                                                                                       latexError,
                                                                                                       latexExecuteOptions,
                                                                                                       latexExplSyntaxOff,
                                                                                                       latexExplSyntaxOn,
                                                                                                       latexIfFileExists,
                                                                                                       latexMakeShortVerb,
                                                                                                       latexNeedsTeXFOrmat,
                                                                                                       latexPassOptionsTo,
                                                                                                       latexProcessOptions,
                                                                                                       latexProvides,
                                                                                                       latexProvidesExpl,
                                                                                                       latexVerbatimEnv,
                                                                                                       latexWarningInfo,
                                                                                                       latexActiveChar,
                                                                                                       latexAddvspace,
                                                                                                       latexAlignatEnv,
                                                                                                       latexAlignmentTab,
                                                                                                       latexArrayEnv,
                                                                                                       latexAtIfpackagelater,
                                                                                                       latexAuthor,
                                                                                                       latexBegin,
                                                                                                       latexBibitem,
                                                                                                       latexCharRefInvalid,
                                                                                                       latexCite,
                                                                                                       latexCites,
                                                                                                       latexCline,
                                                                                                       latexCode,
                                                                                                       latexCommentEnv,
                                                                                                       latexCs,
                                                                                                       latexCsnameGroup,
                                                                                                       latexDate,
                                                                                                       latexDef,
                                                                                                       latexDelimiterGroup,
                                                                                                       latexDiscretionary,
                                                                                                       latexDisplayMathEnv,
                                                                                                       latexDmathEnv,
                                                                                                       latexDocumentEnv,
                                                                                                       latexDseriesEnv,
                                                                                                       latexEmph,
                                                                                                       latexEnd,
                                                                                                       latexEndinput,
                                                                                                       latexEnlargethispage,
                                                                                                       latexEnsuremath,
                                                                                                       latexExit,
                                                                                                       latexExpandafter,
                                                                                                       latexFigureEnv,
                                                                                                       latexFilecontentsEnv,
                                                                                                       latexFootnote,
                                                                                                       latexFootnotemark,
                                                                                                       latexFrac,
                                                                                                       latexFref,
                                                                                                       latexGlsAcr,
                                                                                                       latexGlsdisp,
                                                                                                       latexGlsentry,
                                                                                                       latexGlssee,
                                                                                                       latexGnuplotEnv,
                                                                                                       latexGroup,
                                                                                                       latexHref,
                                                                                                       latexHyperbaseurl,
                                                                                                       latexHyperimage,
                                                                                                       latexHyperref,
                                                                                                       latexHyphenation,
                                                                                                       latexIgnored,
                                                                                                       latexInlineMathEnv,
                                                                                                       latexInput,
                                                                                                       latexInvalid,
                                                                                                       latexItem,
                                                                                                       latexItemizeEnv,
                                                                                                       latexLabel,
                                                                                                       latexLatexDisplayMath,
                                                                                                       latexLatexInlineMath,
                                                                                                       latexLet,
                                                                                                       latexLinebreak,
                                                                                                       latexLongnewglossaryentry,
                                                                                                       latexLrboxEnv,
                                                                                                       latexLstinline,
                                                                                                       latexLstlistingEnv,
                                                                                                       latexLua,
                                                                                                       latexLuacode,
                                                                                                       latexLuacodeEnv,
                                                                                                       latexLuacodestarEnv,
                                                                                                       latexMakeatletter,
                                                                                                       latexMakeatother,
                                                                                                       latexMakebox,
                                                                                                       latexMarginpar,
                                                                                                       latexMath,
                                                                                                       latexMathEnv,
                                                                                                       latexMathaccent,
                                                                                                       latexMathstyle,
                                                                                                       latexMbox,
                                                                                                       latexMinipageEnv,
                                                                                                       latexMint,
                                                                                                       latexMintedEnv,
                                                                                                       latexMintinline,
                                                                                                       latexMulticolumn,
                                                                                                       latexNewacronym,
                                                                                                       latexNewcommand,
                                                                                                       latexNewcounter,
                                                                                                       latexNewenvironment,
                                                                                                       latexNewfont,
                                                                                                       latexNewglossaryentry,
                                                                                                       latexNewlength,
                                                                                                       latexNewline,
                                                                                                       latexNewsavebox,
                                                                                                       latexNewtheorem,
                                                                                                       latexNocite,
                                                                                                       latexObeycr,
                                                                                                       latexPagebreak,
                                                                                                       latexPagenumbering,
                                                                                                       latexPagestyle,
                                                                                                       latexPar,
                                                                                                       latexParameterRef,
                                                                                                       latexParbox,
                                                                                                       latexPhantomSmash,
                                                                                                       latexPictureEnv,
                                                                                                       latexPrintcounter,
                                                                                                       latexProtect,
                                                                                                       latexRaisebox,
                                                                                                       latexRef,
                                                                                                       latexRefrange,
                                                                                                       latexRegexp,
                                                                                                       latexRelax,
                                                                                                       latexRestorecr,
                                                                                                       latexSavebox,
                                                                                                       latexSbox,
                                                                                                       latexSection,
                                                                                                       latexSemiSimpleGroup,
                                                                                                       latexSetcounter,
                                                                                                       latexSetlength,
                                                                                                       latexSetto,
                                                                                                       latexShortVerb,
                                                                                                       latexSpace,
                                                                                                       latexSqrt,
                                                                                                       latexStackrel,
                                                                                                       latexStepcounter,
                                                                                                       latexString,
                                                                                                       latexSubscript,
                                                                                                       latexSuperscript,
                                                                                                       latexTableEnv,
                                                                                                       latexTabuEnv,
                                                                                                       latexTabularEnv,
                                                                                                       latexTabularstarEnv,
                                                                                                       latexTag,
                                                                                                       latexTexDisplayMath,
                                                                                                       latexTexInlineMath,
                                                                                                       latexText,
                                                                                                       latexTextCmd,
                                                                                                       latexTextEnv,
                                                                                                       latexTextstyle,
                                                                                                       latexThanks,
                                                                                                       latexThebibliographyEnv,
                                                                                                       latexTheoremEnv,
                                                                                                       latexTikzpictureEnv,
                                                                                                       latexTitle,
                                                                                                       latexUrl,
                                                                                                       latexUse,
                                                                                                       latexUse209,
                                                                                                       latexUsebox,
                                                                                                       latexValue,
                                                                                                       latexVerb,
                                                                                                       latexVerbatimEnv,
                                                                                                       latexVolcite,
                                                                                                       latexVolcites
                                                                                                     }
                                                                          tmp[latexTitle] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexUrl] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexUse] = {latexBrackGroup, latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexUse209] = {latexBrackGroup, latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexUsebox] = {latexCs, latexExit, latexGroup, latexPar}
                                                                          tmp[latexValue] = {latexCs, latexExit, latexGroup, latexPar, latexParameterRef, latexText}
                                                                          tmp[latexVerb] = {latexCs, latexExit, latexPar, latexStar, latexVerbDelim, latexVerbatim}
                                                                          tmp[latexVerbatimEnv] = {latexBegin, latexEnd, latexExit, latexVerbatim}
                                                                          tmp[latexVolcite] = {
                                                                                                latexBrackGroup,
                                                                                                latexCs,
                                                                                                latexExit,
                                                                                                latexGroup,
                                                                                                latexPar,
                                                                                                latexParameterRef,
                                                                                                latexStar,
                                                                                                latexText
                                                                                              }
                                                                          tmp[latexVolcites] = {
                                                                                                 latexBrackGroup,
                                                                                                 latexCs,
                                                                                                 latexExit,
                                                                                                 latexGroup,
                                                                                                 latexPar,
                                                                                                 latexParameterRef,
                                                                                                 latexText
                                                                                               }
                                                                          tmp
const latexTokenKinds*: set[LatexNodeKind] = {}
const latexHiddenKinds*: set[LatexNodeKind] = {
                                                latexCsSetcounter,
                                                latexHidMathToken,
                                                latexCsProtect,
                                                latexHidMathMode,
                                                latexFigureBegin,
                                                latexEnvNameLuacodestar,
                                                latexTabularstarBegin,
                                                latexHidEnvEnd,
                                                latexThebibliographyNameGroup,
                                                latexEnvNameTabularstar,
                                                latexCsNewsavebox,
                                                latexHidDimensionParameter,
                                                latexTableNameGroup,
                                                latexLuacodestarNameGroup,
                                                latexCsTag,
                                                latexEnvNameMinted,
                                                latexItemizeNameGroup,
                                                latexCsSbox,
                                                latexCsMakeShortVerb,
                                                latexCsBibitem,
                                                latexCsSetlength,
                                                latexTabuNameGroup,
                                                latexCsHyperref,
                                                latexTabuEnd,
                                                latexCsFootnote,
                                                latexEnvNameVerbatim,
                                                latexHidNumber,
                                                latexHidNilToken,
                                                latexCsStackrel,
                                                latexAlignatBegin,
                                                latexCsEndgroup,
                                                latexCsAtIfpackagelater,
                                                latexCsHyperimage,
                                                latexCsLet,
                                                latexEnvNameTikzpicture,
                                                latexCsUse209,
                                                latexCsMint,
                                                latexCsEndcsname,
                                                latexVerbBody,
                                                latexCsDiscretionary,
                                                latexPictureEnd,
                                                latexEnvNameThebibliography,
                                                latexCsDeclareOption,
                                                latexEnvNameFigure,
                                                latexEnvNameVerbatim,
                                                latexCsEndinput,
                                                latexCsNewcommand,
                                                latexMathBrackGroup,
                                                latexCsBgroup,
                                                latexEnvNameDisplayMath,
                                                latexEnvNameGnuplot,
                                                latexMinipageNameGroup,
                                                latexCsDeleteShortVerb,
                                                latexTikzpictureNameGroup,
                                                latexDimensionGroup,
                                                latexFigureNameGroup,
                                                latexEnvNameTabular,
                                                latexCsHref,
                                                latexEnvNameTable,
                                                latexHidEnvBegin,
                                                latexCsMakeatother,
                                                latexCsLeft,
                                                latexNamesGroup,
                                                latexCsPrintcounter,
                                                latexHidCmd,
                                                latexDisplayMathBegin,
                                                latexLrboxEnd,
                                                latexArrayBegin,
                                                latexEnvNameComment,
                                                latexCsCode,
                                                latexFilecontentsNameGroup,
                                                latexVerbDelimNoLbrack,
                                                latexItemizeBegin,
                                                latexItemizeEnd,
                                                latexTheoremNameGroup,
                                                latexCsString,
                                                latexCsParbox,
                                                latexEnvNameItemize,
                                                latexCsDef,
                                                latexAlignatEnd,
                                                latexHidMathExpandedParameter,
                                                latexDmathNameGroup,
                                                latexLstlistingBegin,
                                                latexLstlistingEnd,
                                                latexMintedBegin,
                                                latexCsProvides,
                                                latexCsUrl,
                                                latexCsNocite,
                                                latexCsMathaccent,
                                                latexCsFrac,
                                                latexTabularstarEnd,
                                                latexVerbatimBegin,
                                                latexCsCites,
                                                latexGnuplotBegin,
                                                latexTextNameGroup,
                                                latexHidGlueParameter,
                                                latexVerbatimNameGroup,
                                                latexHidNamesGroup,
                                                latexGlueGroup,
                                                latexCsError,
                                                latexVerbEndDelim,
                                                latexCsThanks,
                                                latexThebibliographyEnd,
                                                latexLstlistingNameGroup,
                                                latexCsNewline,
                                                latexEnvNamePicture,
                                                latexMathEnd,
                                                latexHidNumberParameter,
                                                latexCsEnd,
                                                latexHidCsParameter,
                                                latexIgnoredLine,
                                                latexCsCheckCommand,
                                                latexCommentNameGroup,
                                                latexTikzpictureTextEnv,
                                                latexHidTextExpandedParameter,
                                                latexHidCommonExpandedParameter,
                                                latexCsSqrt,
                                                latexHidCmdApply,
                                                latexCsWarningInfo,
                                                latexCsMakeVerbDelim,
                                                latexHidDeleteVerbDelimParameter,
                                                latexCsNewlength,
                                                latexTheoremBegin,
                                                latexThebibliographyBegin,
                                                latexCsRefrange,
                                                latexDseriesEnd,
                                                latexCsFootnotemark,
                                                latexDimensionBrackGroup,
                                                latexCsRestorecr,
                                                latexVerbatimNameGroup,
                                                latexCsPagestyle,
                                                latexHidDimensionBrackGroup,
                                                latexCsProvidesExpl,
                                                latexMintedEnd,
                                                latexCsDeleteVerbDelim,
                                                latexCsGroup,
                                                latexTextMulticolumn,
                                                latexDisplayMathEnd,
                                                latexArrayNameGroup,
                                                latexCsInput,
                                                latexCsTitle,
                                                latexCsGlsentry,
                                                latexCsAddvspace,
                                                latexCsVolcites,
                                                latexFilecontentsEnd,
                                                latexMinipageEnd,
                                                latexFixedPair,
                                                latexLuacodeEnd,
                                                latexHidApplyParameter,
                                                latexCsExplSyntaxOn,
                                                latexTextNonEscape,
                                                latexCsIfFileExists,
                                                latexCsPassOptionsTo,
                                                latexCsNewcounter,
                                                latexInlineMathEnd,
                                                latexCsHyperbaseurl,
                                                latexMathBegin,
                                                latexInlineMathNameGroup,
                                                latexDocumentNameGroup,
                                                latexHidTextToken,
                                                latexApplyGroup,
                                                latexCsVolcite,
                                                latexCsNeedsTeXFOrmat,
                                                latexDmathBegin,
                                                latexEnvNameTabu,
                                                latexMakeVerbDelimGroup,
                                                latexCsPar,
                                                latexTabularstarNameGroup,
                                                latexHidNameParameter,
                                                latexShortVerbDelim,
                                                latexPictureNameGroup,
                                                latexCsNewacronym,
                                                latexCsAt,
                                                latexCsRight,
                                                latexCsFref,
                                                latexCsNewtheorem,
                                                latexCsTextstyle,
                                                latexLrboxNameGroup,
                                                latexTabuBegin,
                                                latexLuacodestarBegin,
                                                latexCsEnsuremath,
                                                latexDocumentBegin,
                                                latexCsGlsdisp,
                                                latexCsLongnewglossaryentry,
                                                latexEnvNameLrbox,
                                                latexHidGlueBrackParameter,
                                                latexCsNewfont,
                                                latexCsPagenumbering,
                                                latexCsItem,
                                                latexGnuplotNameGroup,
                                                latexHidTextGroup,
                                                latexCsDate,
                                                latexFilecontentsBegin,
                                                latexTikzpictureBegin,
                                                latexCsLua,
                                                latexCsLstinline,
                                                latexTextSingle,
                                                latexMathNameGroup,
                                                latexHidDimension,
                                                latexCsMakebox,
                                                latexCsExecuteOptions,
                                                latexArrayEnd,
                                                latexCsLuacode,
                                                latexHidScopeEnd,
                                                latexTabularNameGroup,
                                                latexCsNewenvironment,
                                                latexEnvNameAlignat,
                                                latexCsRaisebox,
                                                latexAlignatNameGroup,
                                                latexCsExplSyntaxOff,
                                                latexHidNameGroup,
                                                latexTextExpandafter,
                                                latexCommentBegin,
                                                latexMathShiftEnd,
                                                latexHidTextMode,
                                                latexVerbatimEnd,
                                                latexCsSetto,
                                                latexLuacodeBegin,
                                                latexNameGroup,
                                                latexCsCsname,
                                                latexTabularBegin,
                                                latexCsCline,
                                                latexTikzpictureEnd,
                                                latexEnvName,
                                                latexTabuTextEnv,
                                                latexHidScopeBegin,
                                                latexCsMbox,
                                                latexCsObeycr,
                                                latexInlineMathBegin,
                                                latexCsGlssee,
                                                latexEnvNameArray,
                                                latexCsExpandafter,
                                                latexEgroup,
                                                latexCsMathstyle,
                                                latexBgroup,
                                                latexCsText,
                                                latexCsDoNotIndex,
                                                latexCsSection,
                                                latexCsDisplayMathEnd,
                                                latexEnvNameMinipage,
                                                latexDocumentEnd,
                                                latexLuacodestarEnd,
                                                latexCsGlsAcr,
                                                latexTableBegin,
                                                latexCsRegexp,
                                                latexEnvNameDocument,
                                                latexEnvNameInlineMath,
                                                latexPictureBegin,
                                                latexLuacodeNameGroup,
                                                latexMintedNameGroup,
                                                latexCsPhantomSmash,
                                                latexEnvNameLstlisting,
                                                latexCsSavebox,
                                                latexExitMath,
                                                latexHidMathGroup,
                                                latexEnvNameFilecontents,
                                                latexNilGroup,
                                                latexDisplayMathShiftEnd,
                                                latexCsRef,
                                                latexEnvNameDseries,
                                                latexDseriesNameGroup,
                                                latexCsCite,
                                                latexMinipageBegin,
                                                latexCsSpace,
                                                latexTextProtect,
                                                latexCsMakeatletter,
                                                latexDseriesBegin,
                                                latexCsEnlargethispage,
                                                latexTextBegin,
                                                latexCsUsebox,
                                                latexTikzpictureMathEnv,
                                                latexTextGroup,
                                                latexVerbatimEnd,
                                                latexCsLinebreak,
                                                latexCsMarginpar,
                                                latexCsValue,
                                                latexCsEmph,
                                                latexDisplayMathNameGroup,
                                                latexVerbatimBegin,
                                                latexEnvNameLuacode,
                                                latexDeleteVerbDelimGroup,
                                                latexCsVerb,
                                                latexGnuplotEnd,
                                                latexLrboxBegin,
                                                latexCsAuthor,
                                                latexTextEnd,
                                                latexTabularEnd,
                                                latexCsProcessOptions,
                                                latexCsEgroup,
                                                latexCsInlineMathEnd,
                                                latexCsHyphenation,
                                                latexParEol,
                                                latexMathGroup,
                                                latexCsInlineMathBegin,
                                                latexDmathEnd,
                                                latexTableEnd,
                                                latexCsMintinline,
                                                latexTabuMathEnv,
                                                latexHidNilMode,
                                                latexCsNewglossaryentry,
                                                latexEnvNameTheorem,
                                                latexCsRelax,
                                                latexCsPagebreak,
                                                latexCsBegingroup,
                                                latexHidNilGroup,
                                                latexCommentEnd,
                                                latexCsUse,
                                                latexTheoremEnd,
                                                latexHidCommon,
                                                latexCsDisplayMathBegin,
                                                latexCsMulticolumn,
                                                latexIgnoredRest,
                                                latexGlueBrackGroup,
                                                latexCsStepcounter,
                                                latexCsLabel,
                                                latexEnvNameDmath,
                                                latexHidMakeVerbDelimParameter,
                                                latexFigureEnd,
                                                latexCsBegin
                                              }
proc tsNodeType*(node: TsLatexNode): string


proc kind*(node: TsLatexNode): LatexNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "At":                   latexAt
      of "CheckCommand":         latexCheckCommand
      of "DeclareOption":        latexDeclareOption
      of "DeleteShortVerb":      latexDeleteShortVerb
      of "DoNotIndex":           latexDoNotIndex
      of "Error":                latexError
      of "ExecuteOptions":       latexExecuteOptions
      of "ExplSyntaxOff":        latexExplSyntaxOff
      of "ExplSyntaxOn":         latexExplSyntaxOn
      of "IfFileExists":         latexIfFileExists
      of "MakeShortVerb":        latexMakeShortVerb
      of "NeedsTeXFormat":       latexNeedsTeXFOrmat
      of "PassOptionsTo":        latexPassOptionsTo
      of "ProcessOptions":       latexProcessOptions
      of "Provides":             latexProvides
      of "ProvidesExpl":         latexProvidesExpl
      of "Verbatim_env":         latexVerbatimEnv
      of "WarningInfo":          latexWarningInfo
      of "addvspace":            latexAddvspace
      of "alignat_env":          latexAlignatEnv
      of "array_env":            latexArrayEnv
      of "at_ifpackagelater":    latexAtIfpackagelater
      of "author":               latexAuthor
      of "begin":                latexBegin
      of "begingroup":           latexBegingroup
      of "bibitem":              latexBibitem
      of "brack_group":          latexBrackGroup
      of "charcode":             latexCharcode
      of "cite":                 latexCite
      of "cites":                latexCites
      of "cline":                latexCline
      of "code":                 latexCode
      of "comment_env":          latexCommentEnv
      of "csname":               latexCsname
      of "csname_group":         latexCsnameGroup
      of "date":                 latexDate
      of "def":                  latexDef
      of "delimiter_group":      latexDelimiterGroup
      of "dimension":            latexDimension
      of "discretionary":        latexDiscretionary
      of "display_math_env":     latexDisplayMathEnv
      of "dmath_env":            latexDmathEnv
      of "document":             latexDocument
      of "document_env":         latexDocumentEnv
      of "dseries_env":          latexDseriesEnv
      of "emph":                 latexEmph
      of "end":                  latexEnd
      of "endcsname":            latexEndcsname
      of "endgroup":             latexEndgroup
      of "endinput":             latexEndinput
      of "enlargethispage":      latexEnlargethispage
      of "ensuremath":           latexEnsuremath
      of "expandafter":          latexExpandafter
      of "figure_env":           latexFigureEnv
      of "filecontents_env":     latexFilecontentsEnv
      of "footnote":             latexFootnote
      of "footnotemark":         latexFootnotemark
      of "frac":                 latexFrac
      of "fref":                 latexFref
      of "gls_acr":              latexGlsAcr
      of "glsdisp":              latexGlsdisp
      of "glsentry":             latexGlsentry
      of "glssee":               latexGlssee
      of "glue":                 latexGlue
      of "gnuplot_env":          latexGnuplotEnv
      of "group":                latexGroup
      of "href":                 latexHref
      of "hyperbaseurl":         latexHyperbaseurl
      of "hyperimage":           latexHyperimage
      of "hyperref":             latexHyperref
      of "hyphenation":          latexHyphenation
      of "inline_math_env":      latexInlineMathEnv
      of "input":                latexInput
      of "item":                 latexItem
      of "itemize_env":          latexItemizeEnv
      of "label":                latexLabel
      of "latex_display_math":   latexLatexDisplayMath
      of "latex_inline_math":    latexLatexInlineMath
      of "left":                 latexLeft
      of "let":                  latexLet
      of "linebreak":            latexLinebreak
      of "longnewglossaryentry": latexLongnewglossaryentry
      of "lrbox_env":            latexLrboxEnv
      of "lstinline":            latexLstinline
      of "lstlisting_env":       latexLstlistingEnv
      of "lua":                  latexLua
      of "luacode":              latexLuacode
      of "luacode_env":          latexLuacodeEnv
      of "luacodestar_env":      latexLuacodestarEnv
      of "makeatletter":         latexMakeatletter
      of "makeatother":          latexMakeatother
      of "makebox":              latexMakebox
      of "marginpar":            latexMarginpar
      of "math_env":             latexMathEnv
      of "mathaccent":           latexMathaccent
      of "mathstyle":            latexMathstyle
      of "mbox":                 latexMbox
      of "minipage_env":         latexMinipageEnv
      of "mint":                 latexMint
      of "minted_env":           latexMintedEnv
      of "mintinline":           latexMintinline
      of "multicolumn":          latexMulticolumn
      of "newacronym":           latexNewacronym
      of "newcommand":           latexNewcommand
      of "newcounter":           latexNewcounter
      of "newenvironment":       latexNewenvironment
      of "newfont":              latexNewfont
      of "newglossaryentry":     latexNewglossaryentry
      of "newlength":            latexNewlength
      of "newline":              latexNewline
      of "newsavebox":           latexNewsavebox
      of "newtheorem":           latexNewtheorem
      of "nocite":               latexNocite
      of "obeycr":               latexObeycr
      of "pagebreak":            latexPagebreak
      of "pagenumbering":        latexPagenumbering
      of "pagestyle":            latexPagestyle
      of "par":                  latexPar
      of "parbox":               latexParbox
      of "paren_group":          latexParenGroup
      of "phantom_smash":        latexPhantomSmash
      of "picture_env":          latexPictureEnv
      of "printcounter":         latexPrintcounter
      of "protect":              latexProtect
      of "raisebox":             latexRaisebox
      of "ref":                  latexRef
      of "refrange":             latexRefrange
      of "regexp":               latexRegexp
      of "relax":                latexRelax
      of "restorecr":            latexRestorecr
      of "right":                latexRight
      of "savebox":              latexSavebox
      of "sbox":                 latexSbox
      of "section":              latexSection
      of "semi_simple_group":    latexSemiSimpleGroup
      of "setcounter":           latexSetcounter
      of "setlength":            latexSetlength
      of "setto":                latexSetto
      of "short_verb":           latexShortVerb
      of "space":                latexSpace
      of "sqrt":                 latexSqrt
      of "stackrel":             latexStackrel
      of "stepcounter":          latexStepcounter
      of "string":               latexString
      of "table_env":            latexTableEnv
      of "tabu_env":             latexTabuEnv
      of "tabular_env":          latexTabularEnv
      of "tabularstar_env":      latexTabularstarEnv
      of "tag":                  latexTag
      of "tex_display_math":     latexTexDisplayMath
      of "tex_inline_math":      latexTexInlineMath
      of "text_cmd":             latexTextCmd
      of "text_env":             latexTextEnv
      of "textstyle":            latexTextstyle
      of "thanks":               latexThanks
      of "thebibliography_env":  latexThebibliographyEnv
      of "theorem_env":          latexTheoremEnv
      of "tikzpicture_env":      latexTikzpictureEnv
      of "title":                latexTitle
      of "url":                  latexUrl
      of "use":                  latexUse
      of "use_209":              latexUse209
      of "usebox":               latexUsebox
      of "value":                latexValue
      of "verb":                 latexVerb
      of "verbatim_env":         latexVerbatimEnv
      of "volcite":              latexVolcite
      of "volcites":             latexVolcites
      of "active_char":          latexActiveChar
      of "alignment_tab":        latexAlignmentTab
      of "backtick":             latexBacktick
      of "char_ref_invalid":     latexCharRefInvalid
      of "comma":                latexComma
      of "comment":              latexComment
      of "comment_arara":        latexCommentArara
      of "comment_bib":          latexCommentBib
      of "comment_block":        latexCommentBlock
      of "comment_tag":          latexCommentTag
      of "comment_tex":          latexCommentTex
      of "cs":                   latexCs
      of "decimal":              latexDecimal
      of "display_math_shift":   latexDisplayMathShift
      of "eol":                  latexEol
      of "equals":               latexEquals
      of "exit":                 latexExit
      of "fixed":                latexFixed
      of "hexadecimal":          latexHexadecimal
      of "ignored":              latexIgnored
      of "invalid":              latexInvalid
      of "l":                    latexL
      of "lbrack":               latexLbrack
      of "lparen":               latexLparen
      of "math":                 latexMath
      of "math_shift":           latexMathShift
      of "minus":                latexMinus
      of "name":                 latexName
      of "octal":                latexOctal
      of "parameter_ref":        latexParameterRef
      of "plus":                 latexPlus
      of "plus_sym":             latexPlusSym
      of "r":                    latexR
      of "rbrack":               latexRbrack
      of "rparen":               latexRparen
      of "spread":               latexSpread
      of "star":                 latexStar
      of "subscript":            latexSubscript
      of "superscript":          latexSuperscript
      of "text":                 latexText
      of "to":                   latexTo
      of "unit":                 latexUnit
      of "verb_delim":           latexVerbDelim
      of "verbatim":             latexVerbatim
      of "_space":               latexHidSpace
      of "ERROR":                latexSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")

func isNil*(node: TsLatexNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsLatexNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsLatexNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_latex(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsLatexNode): string =
  $ts_node_type(TSNode(node))

proc newTsLatexParser*(): LatexParser =
  result = LatexParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_latex())

proc parseString*(parser: LatexParser, str: string): TsLatexNode =
  TsLatexNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsLatexString*(str: string): TsLatexNode =
  let parser = newTsLatexParser()
  return parseString(parser, str)

func `$`*(node: TsLatexNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsLatexNode,
    idx:  int,
    kind: LatexNodeKind | set[LatexNodeKind]
  ): TsLatexNode =
  assert 0 <= idx and idx < node.len
  result = TsLatexNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  LatexNode* = HtsNode[TsLatexNode, LatexNodeKind]


proc treeReprTsLatex*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsLatexNode, LatexNodeKind](parseTsLatexString(str), str, 5, unnamed = unnamed)

proc toHtsNode*(
    node: TsLatexNode,
    str:  ptr string
  ): HtsNode[TsLatexNode, LatexNodeKind] =
  toHtsNode[TsLatexNode, LatexNodeKind](node, str)

proc toHtsTree*(node: TsLatexNode, str: ptr string): LatexNode =
  toHtsNode[TsLatexNode, LatexNodeKind](node, str)

proc parseLatexString*(str: ptr string, unnamed: bool = false): LatexNode =
  let parser = newTsLatexParser()
  return toHtsTree[TsLatexNode, LatexNodeKind](parseString(parser, str[]), str)

proc parseLatexString*(str: string, unnamed: bool = false): LatexNode =
  let parser = newTsLatexParser()
  return toHtsTree[TsLatexNode, LatexNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


import
  hmisc / wrappers/treesitter_core
let latexGrammar*: array[LatexNodeKind, HtsRule[LatexNodeKind]] = block:
                                                                    var rules: array[LatexNodeKind, HtsRule[LatexNodeKind]]
                                                                    type
                                                                      K = LatexNodeKind


                                                                    rules[latexThebibliographyNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameThebibliography), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexDeleteShortVerb] = tsSeq[K](tsSymbol[K](latexCsDeleteShortVerb), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidDeleteVerbDelimParameter)))
                                                                    rules[latexHyperref] = tsSeq[K](tsSymbol[K](latexCsHyperref), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsChoice[K](tsSeq[K](tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidTextToken)), tsSeq[K](tsSymbol[K](latexBrackGroup), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexHidMathMode] = tsChoice[K](tsSymbol[K](latexHidCommon), tsSymbol[K](latexHidMathGroup), tsSymbol[K](latexSubscript), tsSymbol[K](latexSuperscript), tsSymbol[K](latexText), tsSymbol[K](latexExpandafter), tsSymbol[K](latexPhantomSmash), tsSymbol[K](latexDelimiterGroup), tsSymbol[K](latexTag), tsSymbol[K](latexTextCmd), tsSymbol[K](latexFrac), tsSymbol[K](latexMathaccent), tsSymbol[K](latexMathstyle), tsSymbol[K](latexMulticolumn), tsSymbol[K](latexProtect), tsSymbol[K](latexStackrel), tsSymbol[K](latexSqrt), tsSymbol[K](latexArrayEnv), tsSymbol[K](latexMathEnv), tsSymbol[K](latexTabuMathEnv), tsSymbol[K](latexTikzpictureMathEnv))
                                                                    rules[latexFigureBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexFigureNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexTabularstarBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTabularstarNameGroup), tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexAlignatEnv] = tsSeq[K](tsSymbol[K](latexAlignatBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexAlignatEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexHidDimensionParameter] = tsChoice[K](tsSymbol[K](latexDimensionGroup), tsSymbol[K](latexCs))
                                                                    rules[latexMulticolumn] = tsSeq[K](tsSymbol[K](latexCsMulticolumn), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidMathToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidMathToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))))))
                                                                    rules[latexTextstyle] = tsSeq[K](tsSymbol[K](latexCsTextstyle), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexTableNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTable), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLuacodestarNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameLuacodestar), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexAtIfpackagelater] = tsSeq[K](tsSymbol[K](latexCsAtIfpackagelater), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidNilToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidNilToken)))))))))
                                                                    rules[latexItemizeNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameItemize), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMinipageEnv] = tsSeq[K](tsSymbol[K](latexMinipageBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexMinipageEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexGlsentry] = tsSeq[K](tsSymbol[K](latexCsGlsentry), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexTabuNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTabu), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTabuEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTabuNameGroup))
                                                                    rules[latexSemiSimpleGroup] = tsSeq[K](tsSymbol[K](latexBegingroup), tsSymbol[K](latexHidScopeBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexEndgroup), tsSymbol[K](latexExit), tsSymbol[K](latexExitMath)), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidNumber] = tsChoice[K](tsSymbol[K](latexDecimal), tsSymbol[K](latexOctal), tsSymbol[K](latexHexadecimal), tsSymbol[K](latexCharcode))
                                                                    rules[latexHidNilToken] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexHidNilGroup), tsSymbol[K](latexParameterRef), tsSymbol[K](latexTextSingle))
                                                                    rules[latexPrintcounter] = tsSeq[K](tsSymbol[K](latexCsPrintcounter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexEmph] = tsSeq[K](tsSymbol[K](latexCsEmph), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexAlignatBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexAlignatNameGroup), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexFrac] = tsSeq[K](tsSymbol[K](latexCsFrac), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidMathToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))))
                                                                    rules[latexNewacronym] = tsSeq[K](tsSymbol[K](latexCsNewacronym), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexProtect] = tsSeq[K](tsSymbol[K](latexCsProtect), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathExpandedParameter)))
                                                                    rules[latexDseriesEnv] = tsSeq[K](tsSymbol[K](latexDseriesBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexDseriesEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexTexInlineMath] = tsSeq[K](tsSymbol[K](latexMathShift), tsRepeat1[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexMathShiftEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexNewcounter] = tsSeq[K](tsSymbol[K](latexCsNewcounter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))))
                                                                    rules[latexTabularstarEnv] = tsSeq[K](tsSymbol[K](latexTabularstarBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTabularstarEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexPagebreak] = tsSeq[K](tsSymbol[K](latexCsPagebreak), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexMakeatother] = tsSeq[K](tsSymbol[K](latexCsMakeatother), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexFootnotemark] = tsSeq[K](tsSymbol[K](latexCsFootnotemark), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexStepcounter] = tsSeq[K](tsSymbol[K](latexCsStepcounter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexPictureEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexPictureNameGroup))
                                                                    rules[latexVerb] = tsSeq[K](tsSymbol[K](latexCsVerb), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexVerbDelim), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexVerbBody), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsChoice[K](tsSymbol[K](latexVerbEndDelim), tsSymbol[K](latexExit))))))))
                                                                    rules[latexHyperbaseurl] = tsSeq[K](tsSymbol[K](latexCsHyperbaseurl), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexError] = tsSeq[K](tsSymbol[K](latexCsError), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexDimension] = tsSeq[K](tsSymbol[K](latexFixed), tsSymbol[K](latexUnit))
                                                                    rules[latexMakeShortVerb] = tsSeq[K](tsSymbol[K](latexCsMakeShortVerb), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMakeVerbDelimParameter)))
                                                                    rules[latexMathBrackGroup] = tsSeq[K](tsSymbol[K](latexLbrack), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsSymbol[K](latexRbrack))
                                                                    rules[latexLabel] = tsSeq[K](tsSymbol[K](latexCsLabel), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexNewcommand] = tsSeq[K](tsSymbol[K](latexCsNewcommand), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidNilToken)))))))))
                                                                    rules[latexMinipageNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameMinipage), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexDocument] = tsRepeat[K](tsSymbol[K](latexHidTextMode))
                                                                    rules[latexSpace] = tsSeq[K](tsSymbol[K](latexCsSpace), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidGlueParameter)))
                                                                    rules[latexDimensionGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexHidDimension), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexFigureNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameFigure), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTikzpictureNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTikzpicture), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexProvidesExpl] = tsSeq[K](tsSymbol[K](latexCsProvidesExpl), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidCmdApply))))))))))
                                                                    rules[latexDocumentEnv] = tsSeq[K](tsSymbol[K](latexDocumentBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexDocumentEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexCheckCommand] = tsSeq[K](tsSymbol[K](latexCsCheckCommand), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidNilToken)))))))))
                                                                    rules[latexUrl] = tsSeq[K](tsSymbol[K](latexCsUrl), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexNamesGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexName), tsRepeat[K](tsSeq[K](tsSymbol[K](latexComma), tsSymbol[K](latexName))), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidCmd] = tsSymbol[K](latexCs)
                                                                    rules[latexDisplayMathBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexDisplayMathNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexLrboxEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexLrboxNameGroup))
                                                                    rules[latexArrayBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexArrayNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexFilecontentsNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameFilecontents), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLatexDisplayMath] = tsSeq[K](tsSymbol[K](latexCsDisplayMathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexCsDisplayMathEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexItemizeBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexItemizeNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexExpandafter] = tsSeq[K](tsSymbol[K](latexCsExpandafter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidMathToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathExpandedParameter)))))
                                                                    rules[latexBrackGroup] = tsSeq[K](tsSymbol[K](latexLbrack), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsSymbol[K](latexRbrack))
                                                                    rules[latexItemizeEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexItemizeNameGroup))
                                                                    rules[latexTheoremNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTheorem), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMathEnv] = tsSeq[K](tsSymbol[K](latexMathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexMathEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexFilecontentsEnv] = tsSeq[K](tsSymbol[K](latexFilecontentsBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexFilecontentsEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexInput] = tsSeq[K](tsSymbol[K](latexCsInput), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexLrboxEnv] = tsSeq[K](tsSymbol[K](latexLrboxBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexLrboxEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexHidMathExpandedParameter] = tsChoice[K](tsSymbol[K](latexHidCommonExpandedParameter), tsSymbol[K](latexHidMathGroup), tsSymbol[K](latexTextSingle), tsSymbol[K](latexExpandafter), tsSymbol[K](latexPhantomSmash), tsSymbol[K](latexDelimiterGroup), tsSymbol[K](latexTag), tsSymbol[K](latexTextCmd), tsSymbol[K](latexFrac), tsSymbol[K](latexMathaccent), tsSymbol[K](latexMathstyle), tsSymbol[K](latexMulticolumn), tsSymbol[K](latexProtect), tsSymbol[K](latexStackrel), tsSymbol[K](latexSqrt), tsSymbol[K](latexArrayEnv), tsSymbol[K](latexMathEnv), tsSymbol[K](latexTabuMathEnv), tsSymbol[K](latexTikzpictureMathEnv))
                                                                    rules[latexAlignatEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexAlignatNameGroup))
                                                                    rules[latexDmathNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameDmath), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTitle] = tsSeq[K](tsSymbol[K](latexCsTitle), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexLstlistingBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexLstlistingNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexEol))
                                                                    rules[latexMathaccent] = tsSeq[K](tsSymbol[K](latexCsMathaccent), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexLstlistingEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexLstlistingNameGroup))
                                                                    rules[latexMintedBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexMintedNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexHidTextToken), tsBlank[K]()), tsSymbol[K](latexEol))
                                                                    rules[latexNewenvironment] = tsSeq[K](tsSymbol[K](latexCsNewenvironment), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidNameGroup), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidNilToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidNilToken)))))))))))
                                                                    rules[latexGlsdisp] = tsSeq[K](tsSymbol[K](latexCsGlsdisp), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexFigureEnv] = tsSeq[K](tsSymbol[K](latexFigureBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexFigureEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexTabularstarEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTabularstarNameGroup))
                                                                    rules[latexVerbatimBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexVerbatimNameGroup))
                                                                    rules[latexDeclareOption] = tsSeq[K](tsSymbol[K](latexCsDeclareOption), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexStar), tsSymbol[K](latexHidTextToken)), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexGnuplotBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexGnuplotNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexEol))
                                                                    rules[latexCsname] = tsSymbol[K](latexCsCsname)
                                                                    rules[latexTextNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvName), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexDmathEnv] = tsSeq[K](tsSymbol[K](latexDmathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexDmathEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexThanks] = tsSeq[K](tsSymbol[K](latexCsThanks), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexHidGlueParameter] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexGlueGroup))
                                                                    rules[latexVerbatimNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameVerbatim), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidNamesGroup] = tsSymbol[K](latexNamesGroup)
                                                                    rules[latexGlueGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexGlue), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexGnuplotEnv] = tsSeq[K](tsSymbol[K](latexGnuplotBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexGnuplotEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexGlsAcr] = tsSeq[K](tsSymbol[K](latexCsGlsAcr), tsChoice[K](tsChoice[K](tsSymbol[K](latexStar), tsSymbol[K](latexPlusSym)), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))))
                                                                    rules[latexSetcounter] = tsSeq[K](tsSymbol[K](latexCsSetcounter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexThebibliographyEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexThebibliographyNameGroup))
                                                                    rules[latexNewline] = tsSeq[K](tsSymbol[K](latexCsNewline), tsSeq[K](tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexHidGlueBrackParameter), tsBlank[K]())))
                                                                    rules[latexLstlistingNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameLstlisting), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMathEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexMathNameGroup))
                                                                    rules[latexHidNumberParameter] = tsChoice[K](tsSymbol[K](latexHidNumber), tsSymbol[K](latexParameterRef), tsSymbol[K](latexCs))
                                                                    rules[latexHidCsParameter] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexCsGroup))
                                                                    rules[latexString] = tsSeq[K](tsSymbol[K](latexCsString), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexTextNonEscape))))
                                                                    rules[latexNeedsTeXFOrmat] = tsSeq[K](tsSymbol[K](latexCsNeedsTeXFOrmat), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))))
                                                                    rules[latexCommentNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameComment), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidTextExpandedParameter] = tsChoice[K](tsSymbol[K](latexHidCommonExpandedParameter), tsSymbol[K](latexHidTextGroup), tsSymbol[K](latexTextSingle), tsSymbol[K](latexTextExpandafter), tsSymbol[K](latexTexDisplayMath), tsSymbol[K](latexTexInlineMath), tsSymbol[K](latexAlignatEnv), tsSymbol[K](latexDoNotIndex), tsSymbol[K](latexAtIfpackagelater), tsSymbol[K](latexAt), tsSymbol[K](latexAuthor), tsSymbol[K](latexBibitem), tsSymbol[K](latexDeclareOption), tsSymbol[K](latexDate), tsSymbol[K](latexDiscretionary), tsSymbol[K](latexEmph), tsSymbol[K](latexEnlargethispage), tsSymbol[K](latexFootnote), tsSymbol[K](latexFootnotemark), tsSymbol[K](latexExecuteOptions), tsSymbol[K](latexHyphenation), tsSymbol[K](latexItem), tsSymbol[K](latexLinebreak), tsSymbol[K](latexMakebox), tsSymbol[K](latexMarginpar), tsSymbol[K](latexMbox), tsSymbol[K](latexTextMulticolumn), tsSymbol[K](latexNeedsTeXFOrmat), tsSymbol[K](latexNewline), tsSymbol[K](latexNewtheorem), tsSymbol[K](latexObeycr), tsSymbol[K](latexPagebreak), tsSymbol[K](latexPagenumbering), tsSymbol[K](latexPagestyle), tsSymbol[K](latexParbox), tsSymbol[K](latexPassOptionsTo), tsSymbol[K](latexProcessOptions), tsSymbol[K](latexTextProtect), tsSymbol[K](latexProvides), tsSymbol[K](latexRaisebox), tsSymbol[K](latexRestorecr), tsSymbol[K](latexSavebox), tsSymbol[K](latexSbox), tsSymbol[K](latexSection), tsSymbol[K](latexThanks), tsSymbol[K](latexTitle), tsSymbol[K](latexUse209), tsSymbol[K](latexTextstyle), tsSymbol[K](latexUse), tsSymbol[K](latexUsebox), tsSymbol[K](latexDisplayMathEnv), tsSymbol[K](latexDocumentEnv), tsSymbol[K](latexFigureEnv), tsSymbol[K](latexInlineMathEnv), tsSymbol[K](latexItemizeEnv), tsSymbol[K](latexLrboxEnv), tsSymbol[K](latexMinipageEnv), tsSymbol[K](latexPictureEnv), tsSymbol[K](latexTableEnv), tsSymbol[K](latexTextEnv), tsSymbol[K](latexThebibliographyEnv), tsSymbol[K](latexTheoremEnv), tsSymbol[K](latexLatexDisplayMath), tsSymbol[K](latexLatexInlineMath), tsSymbol[K](latexCite), tsSymbol[K](latexCites), tsSymbol[K](latexNocite), tsSymbol[K](latexRegexp), tsSymbol[K](latexVolcite), tsSymbol[K](latexVolcites), tsSymbol[K](latexDmathEnv), tsSymbol[K](latexDseriesEnv), tsSymbol[K](latexVerbatimEnv), tsSymbol[K](latexFilecontentsEnv), tsSymbol[K](latexGnuplotEnv), tsSymbol[K](latexProvidesExpl), tsSymbol[K](latexLstinline), tsSymbol[K](latexLstlistingEnv), tsSymbol[K](latexMint), tsSymbol[K](latexMintinline), tsSymbol[K](latexMintedEnv), tsSymbol[K](latexTabuTextEnv), tsSymbol[K](latexCommentEnv), tsSymbol[K](latexVerbatimEnv), tsSymbol[K](latexLongnewglossaryentry), tsSymbol[K](latexNewglossaryentry), tsSymbol[K](latexGlsAcr), tsSymbol[K](latexGlsdisp), tsSymbol[K](latexGlsentry), tsSymbol[K](latexGlssee), tsSymbol[K](latexNewacronym), tsSymbol[K](latexTikzpictureTextEnv))
                                                                    rules[latexTableEnv] = tsSeq[K](tsSymbol[K](latexTableBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTableEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexHidCommonExpandedParameter] = tsChoice[K](tsSymbol[K](latexParameterRef), tsSymbol[K](latexCode), tsSymbol[K](latexDef), tsSymbol[K](latexInput), tsSymbol[K](latexLet), tsSymbol[K](latexRelax), tsSymbol[K](latexString), tsSymbol[K](latexHidCmd), tsSymbol[K](latexCsnameGroup), tsSymbol[K](latexAddvspace), tsSymbol[K](latexCheckCommand), tsSymbol[K](latexCline), tsSymbol[K](latexEndinput), tsSymbol[K](latexEnsuremath), tsSymbol[K](latexError), tsSymbol[K](latexIfFileExists), tsSymbol[K](latexLabel), tsSymbol[K](latexMakeatletter), tsSymbol[K](latexMakeatother), tsSymbol[K](latexNewcommand), tsSymbol[K](latexNewcounter), tsSymbol[K](latexNewenvironment), tsSymbol[K](latexNewfont), tsSymbol[K](latexNewlength), tsSymbol[K](latexNewsavebox), tsSymbol[K](latexPrintcounter), tsSymbol[K](latexRef), tsSymbol[K](latexSetcounter), tsSymbol[K](latexSetlength), tsSymbol[K](latexSpace), tsSymbol[K](latexSetto), tsSymbol[K](latexStepcounter), tsSymbol[K](latexValue), tsSymbol[K](latexVerb), tsSymbol[K](latexWarningInfo), tsSymbol[K](latexTabularEnv), tsSymbol[K](latexTabularstarEnv), tsSymbol[K](latexDeleteShortVerb), tsSymbol[K](latexMakeShortVerb), tsSymbol[K](latexShortVerb), tsSymbol[K](latexFref), tsSymbol[K](latexHref), tsSymbol[K](latexUrl), tsSymbol[K](latexHyperbaseurl), tsSymbol[K](latexHyperimage), tsSymbol[K](latexHyperref), tsSymbol[K](latexExplSyntaxOff), tsSymbol[K](latexExplSyntaxOn), tsSymbol[K](latexRefrange), tsSymbol[K](latexLuacode), tsSymbol[K](latexLuacodeEnv), tsSymbol[K](latexLuacodestarEnv), tsSymbol[K](latexLua))
                                                                    rules[latexMakebox] = tsSeq[K](tsSymbol[K](latexCsMakebox), tsChoice[K](tsSymbol[K](latexHidDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexRestorecr] = tsSeq[K](tsSymbol[K](latexCsRestorecr), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexFref] = tsSeq[K](tsSymbol[K](latexCsFref), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexTikzpictureTextEnv] = tsSeq[K](tsSymbol[K](latexTikzpictureBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTikzpictureEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexLet] = tsSeq[K](tsSymbol[K](latexCsLet), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexCs), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexEquals), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexCs)))))))
                                                                    rules[latexHidDeleteVerbDelimParameter] = tsChoice[K](tsSymbol[K](latexCsDeleteVerbDelim), tsSymbol[K](latexCs), tsSymbol[K](latexDeleteVerbDelimGroup))
                                                                    rules[latexCsnameGroup] = tsSeq[K](tsSymbol[K](latexCsname), tsRepeat[K](tsSymbol[K](latexHidTextToken)), tsSymbol[K](latexEndcsname))
                                                                    rules[latexParbox] = tsSeq[K](tsSymbol[K](latexCsParbox), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexHidDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidDimensionParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexTheoremBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTheoremNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexMintedEnv] = tsSeq[K](tsSymbol[K](latexMintedBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexMintedEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexMbox] = tsSeq[K](tsSymbol[K](latexCsMbox), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexSavebox] = tsSeq[K](tsSymbol[K](latexCsSavebox), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexHidDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))))
                                                                    rules[latexThebibliographyBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexThebibliographyNameGroup), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexLuacodeEnv] = tsSeq[K](tsSymbol[K](latexLuacodeBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexLuacodeEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexLua] = tsSeq[K](tsSymbol[K](latexCsLua), tsChoice[K](tsSymbol[K](latexHidNumber), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidApplyParameter)))
                                                                    rules[latexDseriesEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexDseriesNameGroup))
                                                                    rules[latexDimensionBrackGroup] = tsSeq[K](tsSymbol[K](latexLbrack), tsSymbol[K](latexHidDimension), tsSymbol[K](latexRbrack))
                                                                    rules[latexIfFileExists] = tsSeq[K](tsSymbol[K](latexCsIfFileExists), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexVerbatimNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameVerbatim), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLstinline] = tsSeq[K](tsSymbol[K](latexCsLstinline), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSeq[K](tsSymbol[K](latexBrackGroup), tsSymbol[K](latexVerbDelim)), tsSymbol[K](latexVerbDelimNoLbrack)), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexVerbBody), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsChoice[K](tsSymbol[K](latexVerbEndDelim), tsSymbol[K](latexExit))))))))
                                                                    rules[latexPagestyle] = tsSeq[K](tsSymbol[K](latexCsPagestyle), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexHidDimensionBrackGroup] = tsSymbol[K](latexDimensionBrackGroup)
                                                                    rules[latexTheoremEnv] = tsSeq[K](tsSymbol[K](latexTheoremBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTheoremEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexRegexp] = tsSeq[K](tsSymbol[K](latexCsRegexp), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexVerbatimEnv] = tsSeq[K](tsSymbol[K](latexVerbatimBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexVerbatimEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexMintedEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexMintedNameGroup))
                                                                    rules[latexExecuteOptions] = tsSeq[K](tsSymbol[K](latexCsExecuteOptions), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexCsGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexCs), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTextMulticolumn] = tsSeq[K](tsSymbol[K](latexCsMulticolumn), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexCline] = tsSeq[K](tsSymbol[K](latexCsCline), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexUse209] = tsSeq[K](tsSymbol[K](latexCsUse209), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexNamesGroup)))
                                                                    rules[latexDisplayMathEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexDisplayMathNameGroup))
                                                                    rules[latexArrayNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameArray), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexBegingroup] = tsSymbol[K](latexCsBegingroup)
                                                                    rules[latexThebibliographyEnv] = tsSeq[K](tsSymbol[K](latexThebibliographyBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexThebibliographyEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexNewlength] = tsSeq[K](tsSymbol[K](latexCsNewlength), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidCsParameter)))
                                                                    rules[latexObeycr] = tsSeq[K](tsSymbol[K](latexCsObeycr), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexHyperimage] = tsSeq[K](tsSymbol[K](latexCsHyperimage), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexProvides] = tsSeq[K](tsSymbol[K](latexCsProvides), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidNameParameter), tsSeq[K](tsSymbol[K](latexHidCmdApply), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]())))))
                                                                    rules[latexEndcsname] = tsSymbol[K](latexCsEndcsname)
                                                                    rules[latexFilecontentsEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexFilecontentsNameGroup))
                                                                    rules[latexMintinline] = tsSeq[K](tsSymbol[K](latexCsMintinline), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexVerbDelim), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexVerbBody), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsChoice[K](tsSymbol[K](latexVerbEndDelim), tsSymbol[K](latexExit))))))))))
                                                                    rules[latexMinipageEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexMinipageNameGroup))
                                                                    rules[latexFixedPair] = tsSeq[K](tsSymbol[K](latexLparen), tsSymbol[K](latexFixed), tsSymbol[K](latexComma), tsSymbol[K](latexFixed), tsSymbol[K](latexRparen))
                                                                    rules[latexEndgroup] = tsSymbol[K](latexCsEndgroup)
                                                                    rules[latexHidApplyParameter] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexApplyGroup))
                                                                    rules[latexTag] = tsSeq[K](tsSymbol[K](latexCsTag), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexLuacodeEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexLuacodeNameGroup))
                                                                    rules[latexLinebreak] = tsSeq[K](tsSymbol[K](latexCsLinebreak), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexInlineMathEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexInlineMathNameGroup))
                                                                    rules[latexInlineMathNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameInlineMath), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMathBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexMathNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexInlineMathEnv] = tsSeq[K](tsSymbol[K](latexInlineMathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexInlineMathEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexCommentEnv] = tsSeq[K](tsSymbol[K](latexCommentBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexCommentEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexArrayEnv] = tsSeq[K](tsSymbol[K](latexArrayBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexArrayEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexDocumentNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameDocument), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexItem] = tsSeq[K](tsSymbol[K](latexCsItem), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexBibitem] = tsSeq[K](tsSymbol[K](latexCsBibitem), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexApplyGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexHidCmdApply), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTexDisplayMath] = tsSeq[K](tsSymbol[K](latexDisplayMathShift), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexDisplayMathShiftEnd), tsSeq[K](tsSymbol[K](latexMathShift), tsSymbol[K](latexExit)), tsSymbol[K](latexExit)))
                                                                    rules[latexDiscretionary] = tsSeq[K](tsSymbol[K](latexCsDiscretionary), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexPassOptionsTo] = tsSeq[K](tsSymbol[K](latexCsPassOptionsTo), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidNameGroup)))))
                                                                    rules[latexHidTextToken] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexHidTextGroup), tsSymbol[K](latexParameterRef), tsSymbol[K](latexTextSingle))
                                                                    rules[latexDmathBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexDmathNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexMakeVerbDelimGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsChoice[K](tsSymbol[K](latexCsMakeVerbDelim), tsRepeat[K](tsSymbol[K](latexHidTextMode))), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexCode] = tsSeq[K](tsSymbol[K](latexCsCode), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidNumberParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexEquals), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidNumberParameter)))))))
                                                                    rules[latexSetlength] = tsSeq[K](tsSymbol[K](latexCsSetlength), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidGlueParameter)))))
                                                                    rules[latexHidNameParameter] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexHidNameGroup), tsSymbol[K](latexParameterRef))
                                                                    rules[latexTabularstarNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTabularstar), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexProcessOptions] = tsSeq[K](tsSymbol[K](latexCsProcessOptions), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()))
                                                                    rules[latexUsebox] = tsSeq[K](tsSymbol[K](latexCsUsebox), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidCsParameter)))
                                                                    rules[latexPictureNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNamePicture), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexVerbatimEnv] = tsSeq[K](tsSymbol[K](latexVerbatimBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexVerbatimEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexLongnewglossaryentry] = tsSeq[K](tsSymbol[K](latexCsLongnewglossaryentry), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexLrboxNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameLrbox), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLeft] = tsSeq[K](tsSymbol[K](latexCsLeft), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexTabuBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTabuNameGroup), tsChoice[K](tsSeq[K](tsChoice[K](tsSymbol[K](latexTo), tsSymbol[K](latexSpread)), tsSymbol[K](latexHidDimension)), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexPar] = tsChoice[K](tsSymbol[K](latexParEol), tsSymbol[K](latexCsPar))
                                                                    rules[latexDate] = tsSeq[K](tsSymbol[K](latexCsDate), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexDocumentBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexDocumentNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexLuacodestarBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexLuacodestarNameGroup))
                                                                    rules[latexHidGlueBrackParameter] = tsSymbol[K](latexGlueBrackGroup)
                                                                    rules[latexCharcode] = tsSeq[K](tsSymbol[K](latexBacktick), tsChoice[K](tsSymbol[K](latexTextSingle), tsSymbol[K](latexCs)))
                                                                    rules[latexGnuplotNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameGnuplot), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidTextGroup] = tsSymbol[K](latexTextGroup)
                                                                    rules[latexLuacode] = tsSeq[K](tsSymbol[K](latexCsLuacode), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidApplyParameter)))
                                                                    rules[latexNewsavebox] = tsSeq[K](tsSymbol[K](latexCsNewsavebox), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidCsParameter)))
                                                                    rules[latexSqrt] = tsSeq[K](tsSymbol[K](latexCsSqrt), tsChoice[K](tsSymbol[K](latexMathBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexRef] = tsSeq[K](tsSymbol[K](latexCsRef), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexFilecontentsBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexFilecontentsNameGroup), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexEol))
                                                                    rules[latexHref] = tsSeq[K](tsSymbol[K](latexCsHref), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexTikzpictureBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTikzpictureNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexArrayEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexArrayNameGroup))
                                                                    rules[latexMathNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvName), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexHidDimension] = tsChoice[K](tsSymbol[K](latexDimension), tsSeq[K](tsSymbol[K](latexFixed), tsSymbol[K](latexCs)))
                                                                    rules[latexMarginpar] = tsSeq[K](tsSymbol[K](latexCsMarginpar), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexTabularNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameTabular), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexPictureEnv] = tsSeq[K](tsSymbol[K](latexPictureBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexPictureEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexExplSyntaxOff] = tsSeq[K](tsSymbol[K](latexCsExplSyntaxOff), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexUse] = tsSeq[K](tsSymbol[K](latexCsUse), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexNamesGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))))
                                                                    rules[latexAuthor] = tsSeq[K](tsSymbol[K](latexCsAuthor), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexAlignatNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameAlignat), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexExplSyntaxOn] = tsSeq[K](tsSymbol[K](latexCsExplSyntaxOn), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexHidNameGroup] = tsSymbol[K](latexNameGroup)
                                                                    rules[latexDelimiterGroup] = tsSeq[K](tsSymbol[K](latexLeft), tsSymbol[K](latexHidScopeBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexRight), tsSymbol[K](latexExit), tsSymbol[K](latexExitMath)), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTextExpandafter] = tsSeq[K](tsSymbol[K](latexCsExpandafter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextExpandedParameter)))))
                                                                    rules[latexCommentBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexCommentNameGroup))
                                                                    rules[latexVerbatimEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexVerbatimNameGroup))
                                                                    rules[latexHidTextMode] = tsChoice[K](tsSymbol[K](latexHidCommon), tsSymbol[K](latexHidTextGroup), tsSymbol[K](latexPar), tsSymbol[K](latexSemiSimpleGroup), tsSymbol[K](latexText), tsSymbol[K](latexSubscript), tsSymbol[K](latexSuperscript), tsSymbol[K](latexTextExpandafter), tsSymbol[K](latexTexDisplayMath), tsSymbol[K](latexTexInlineMath), tsSymbol[K](latexAlignatEnv), tsSymbol[K](latexDoNotIndex), tsSymbol[K](latexAtIfpackagelater), tsSymbol[K](latexAt), tsSymbol[K](latexAuthor), tsSymbol[K](latexBibitem), tsSymbol[K](latexDeclareOption), tsSymbol[K](latexDate), tsSymbol[K](latexDiscretionary), tsSymbol[K](latexEmph), tsSymbol[K](latexEnlargethispage), tsSymbol[K](latexFootnote), tsSymbol[K](latexFootnotemark), tsSymbol[K](latexExecuteOptions), tsSymbol[K](latexHyphenation), tsSymbol[K](latexItem), tsSymbol[K](latexLinebreak), tsSymbol[K](latexMakebox), tsSymbol[K](latexMarginpar), tsSymbol[K](latexMbox), tsSymbol[K](latexTextMulticolumn), tsSymbol[K](latexNeedsTeXFOrmat), tsSymbol[K](latexNewline), tsSymbol[K](latexNewtheorem), tsSymbol[K](latexObeycr), tsSymbol[K](latexPagebreak), tsSymbol[K](latexPagenumbering), tsSymbol[K](latexPagestyle), tsSymbol[K](latexParbox), tsSymbol[K](latexPassOptionsTo), tsSymbol[K](latexProcessOptions), tsSymbol[K](latexTextProtect), tsSymbol[K](latexProvides), tsSymbol[K](latexRaisebox), tsSymbol[K](latexRestorecr), tsSymbol[K](latexSavebox), tsSymbol[K](latexSbox), tsSymbol[K](latexSection), tsSymbol[K](latexThanks), tsSymbol[K](latexTitle), tsSymbol[K](latexUse209), tsSymbol[K](latexTextstyle), tsSymbol[K](latexUse), tsSymbol[K](latexUsebox), tsSymbol[K](latexDisplayMathEnv), tsSymbol[K](latexDocumentEnv), tsSymbol[K](latexFigureEnv), tsSymbol[K](latexInlineMathEnv), tsSymbol[K](latexItemizeEnv), tsSymbol[K](latexLrboxEnv), tsSymbol[K](latexMinipageEnv), tsSymbol[K](latexPictureEnv), tsSymbol[K](latexTableEnv), tsSymbol[K](latexTextEnv), tsSymbol[K](latexThebibliographyEnv), tsSymbol[K](latexTheoremEnv), tsSymbol[K](latexLatexDisplayMath), tsSymbol[K](latexLatexInlineMath), tsSymbol[K](latexCite), tsSymbol[K](latexCites), tsSymbol[K](latexNocite), tsSymbol[K](latexRegexp), tsSymbol[K](latexVolcite), tsSymbol[K](latexVolcites), tsSymbol[K](latexDmathEnv), tsSymbol[K](latexDseriesEnv), tsSymbol[K](latexVerbatimEnv), tsSymbol[K](latexFilecontentsEnv), tsSymbol[K](latexGnuplotEnv), tsSymbol[K](latexProvidesExpl), tsSymbol[K](latexLstinline), tsSymbol[K](latexLstlistingEnv), tsSymbol[K](latexMint), tsSymbol[K](latexMintinline), tsSymbol[K](latexMintedEnv), tsSymbol[K](latexTabuTextEnv), tsSymbol[K](latexCommentEnv), tsSymbol[K](latexVerbatimEnv), tsSymbol[K](latexLongnewglossaryentry), tsSymbol[K](latexNewglossaryentry), tsSymbol[K](latexGlsAcr), tsSymbol[K](latexGlsdisp), tsSymbol[K](latexGlsentry), tsSymbol[K](latexGlssee), tsSymbol[K](latexNewacronym), tsSymbol[K](latexTikzpictureTextEnv))
                                                                    rules[latexNewglossaryentry] = tsSeq[K](tsSymbol[K](latexCsNewglossaryentry), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexTabularBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTabularNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexName), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLuacodeBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexLuacodeNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexGlssee] = tsSeq[K](tsSymbol[K](latexCsGlssee), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexSetto] = tsSeq[K](tsSymbol[K](latexCsSetto), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexShortVerb] = tsSeq[K](tsSymbol[K](latexShortVerbDelim), tsChoice[K](tsSymbol[K](latexVerbBody), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexVerbEndDelim), tsSymbol[K](latexExit)))
                                                                    rules[latexAddvspace] = tsSeq[K](tsSymbol[K](latexCsAddvspace), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidGlueParameter)))
                                                                    rules[latexTikzpictureEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTikzpictureNameGroup))
                                                                    rules[latexTabuTextEnv] = tsSeq[K](tsSymbol[K](latexTabuBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTabuEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexEgroup] = tsSymbol[K](latexCsEgroup)
                                                                    rules[latexInlineMathBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexInlineMathNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexEnsuremath] = tsSeq[K](tsSymbol[K](latexCsEnsuremath), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexDisplayMathEnv] = tsSeq[K](tsSymbol[K](latexDisplayMathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexDisplayMathEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexBgroup] = tsSymbol[K](latexCsBgroup)
                                                                    rules[latexGlue] = tsSeq[K](tsSymbol[K](latexHidDimension), tsChoice[K](tsSeq[K](tsSymbol[K](latexMinus), tsSymbol[K](latexHidDimension)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsSymbol[K](latexPlus), tsSymbol[K](latexHidDimension)), tsBlank[K]()))
                                                                    rules[latexValue] = tsSeq[K](tsSymbol[K](latexCsValue), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexTabularEnv] = tsSeq[K](tsSymbol[K](latexTabularBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTabularEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexLuacodestarEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexLuacodestarNameGroup))
                                                                    rules[latexDocumentEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexDocumentNameGroup), tsSymbol[K](latexIgnoredRest))
                                                                    rules[latexPictureBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexPictureNameGroup), tsSymbol[K](latexFixedPair), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexFixedPair), tsBlank[K]()))
                                                                    rules[latexTableBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTableNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexLuacodeNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameLuacode), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMintedNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameMinted), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLatexInlineMath] = tsSeq[K](tsSymbol[K](latexCsInlineMathBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexCsInlineMathEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexHidMathGroup] = tsSymbol[K](latexMathGroup)
                                                                    rules[latexMint] = tsSeq[K](tsSymbol[K](latexCsMint), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexVerbDelim), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexVerbBody), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsChoice[K](tsSymbol[K](latexVerbEndDelim), tsSymbol[K](latexExit))))))))))
                                                                    rules[latexNewfont] = tsSeq[K](tsSymbol[K](latexCsNewfont), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexNilGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsRepeat[K](tsSymbol[K](latexHidNilMode)), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexMakeatletter] = tsSeq[K](tsSymbol[K](latexCsMakeatletter), tsSymbol[K](latexHidCmdApply))
                                                                    rules[latexDseriesNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameDseries), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTextProtect] = tsSeq[K](tsSymbol[K](latexCsProtect), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextExpandedParameter)))
                                                                    rules[latexMinipageBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexMinipageNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidDimensionParameter), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexWarningInfo] = tsSeq[K](tsSymbol[K](latexCsWarningInfo), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexPhantomSmash] = tsSeq[K](tsSymbol[K](latexCsPhantomSmash), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexHyphenation] = tsSeq[K](tsSymbol[K](latexCsHyphenation), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexDseriesBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexDseriesNameGroup), tsSymbol[K](latexHidEnvBegin), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()))
                                                                    rules[latexTextBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexTextNameGroup), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexVolcite] = tsSeq[K](tsSymbol[K](latexCsVolcite), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))))
                                                                    rules[latexTikzpictureMathEnv] = tsSeq[K](tsSymbol[K](latexTikzpictureBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexTikzpictureEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexTextGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexAt] = tsSeq[K](tsSymbol[K](latexCsAt), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexStackrel] = tsSeq[K](tsSymbol[K](latexCsStackrel), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidMathToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))))
                                                                    rules[latexVerbatimEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexVerbatimNameGroup), tsChoice[K](tsSymbol[K](latexIgnoredLine), tsBlank[K]()))
                                                                    rules[latexPagenumbering] = tsSeq[K](tsSymbol[K](latexCsPagenumbering), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexNewtheorem] = tsSeq[K](tsSymbol[K](latexCsNewtheorem), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsChoice[K](tsSeq[K](tsSymbol[K](latexBrackGroup), tsSymbol[K](latexHidTextToken)), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]())))))))
                                                                    rules[latexDisplayMathNameGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsSymbol[K](latexEnvNameDisplayMath), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexTextEnv] = tsSeq[K](tsSymbol[K](latexTextBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexTextEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexVerbatimBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexVerbatimNameGroup), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexEol))
                                                                    rules[latexDeleteVerbDelimGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsChoice[K](tsSymbol[K](latexCsDeleteVerbDelim), tsRepeat[K](tsSymbol[K](latexHidTextMode))), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexLstlistingEnv] = tsSeq[K](tsSymbol[K](latexLstlistingBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexLstlistingEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexGnuplotEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexGnuplotNameGroup))
                                                                    rules[latexLrboxBegin] = tsSeq[K](tsSymbol[K](latexCsBegin), tsSymbol[K](latexLrboxNameGroup), tsSymbol[K](latexHidCsParameter), tsSymbol[K](latexHidEnvBegin))
                                                                    rules[latexTextEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTextNameGroup))
                                                                    rules[latexTabularEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTabularNameGroup))
                                                                    rules[latexRefrange] = tsSeq[K](tsSymbol[K](latexCsRefrange), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexRelax] = tsSymbol[K](latexCsRelax)
                                                                    rules[latexSection] = tsSeq[K](tsSymbol[K](latexCsSection), tsChoice[K](tsChoice[K](tsSymbol[K](latexStar), tsSymbol[K](latexBrackGroup)), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexCite] = tsSeq[K](tsSymbol[K](latexCsCite), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexLuacodestarEnv] = tsSeq[K](tsSymbol[K](latexLuacodestarBegin), tsSymbol[K](latexVerbatim), tsChoice[K](tsSymbol[K](latexLuacodestarEnd), tsSymbol[K](latexExit)))
                                                                    rules[latexDoNotIndex] = tsSeq[K](tsSymbol[K](latexCsDoNotIndex), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidNilToken)))
                                                                    rules[latexEndinput] = tsSeq[K](tsSymbol[K](latexCsEndinput), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexIgnoredRest)))
                                                                    rules[latexEnlargethispage] = tsSeq[K](tsSymbol[K](latexCsEnlargethispage), tsChoice[K](tsSymbol[K](latexStar), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidDimensionParameter)))
                                                                    rules[latexFootnote] = tsSeq[K](tsSymbol[K](latexCsFootnote), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexMathGroup] = tsSeq[K](tsSymbol[K](latexL), tsSymbol[K](latexHidScopeBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsSymbol[K](latexR), tsSymbol[K](latexHidScopeEnd))
                                                                    rules[latexSbox] = tsSeq[K](tsSymbol[K](latexCsSbox), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidCsParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexItemizeEnv] = tsSeq[K](tsSymbol[K](latexItemizeBegin), tsRepeat[K](tsSymbol[K](latexHidTextMode)), tsChoice[K](tsSymbol[K](latexItemizeEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexNocite] = tsSeq[K](tsSymbol[K](latexCsNocite), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexMathstyle] = tsSeq[K](tsSymbol[K](latexCsMathstyle), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules[latexTableEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTableNameGroup))
                                                                    rules[latexTextCmd] = tsSeq[K](tsSymbol[K](latexCsText), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidTextToken)))
                                                                    rules[latexHidNilMode] = tsChoice[K](tsSymbol[K](latexHidNilGroup), tsSymbol[K](latexActiveChar), tsSymbol[K](latexAlignmentTab), tsSymbol[K](latexCharRefInvalid), tsSymbol[K](latexCs), tsSymbol[K](latexDisplayMathShift), tsSymbol[K](latexIgnored), tsSymbol[K](latexInvalid), tsSymbol[K](latexMathShift), tsSymbol[K](latexParameterRef), tsSymbol[K](latexSubscript), tsSymbol[K](latexSuperscript), tsSymbol[K](latexText))
                                                                    rules[latexDef] = tsSeq[K](tsSymbol[K](latexCsDef), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsChoice[K](tsSymbol[K](latexActiveChar), tsSymbol[K](latexCs)), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSeq[K](tsRepeat[K](tsChoice[K](tsSymbol[K](latexParameterRef), tsSymbol[K](latexText), tsSymbol[K](latexCs))), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidNilGroup)))))))
                                                                    rules[latexCites] = tsSeq[K](tsSymbol[K](latexCsCites), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsRepeat1[K](tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexVolcites] = tsSeq[K](tsSymbol[K](latexCsVolcites), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsRepeat1[K](tsSeq[K](tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken), tsChoice[K](tsSymbol[K](latexBrackGroup), tsBlank[K]()), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexDmathEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexDmathNameGroup))
                                                                    rules[latexTabuMathEnv] = tsSeq[K](tsSymbol[K](latexTabuBegin), tsRepeat[K](tsSymbol[K](latexHidMathMode)), tsChoice[K](tsSymbol[K](latexTabuEnd), tsSymbol[K](latexExit)), tsSymbol[K](latexHidEnvEnd))
                                                                    rules[latexCommentEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexCommentNameGroup), tsChoice[K](tsSymbol[K](latexIgnoredLine), tsBlank[K]()))
                                                                    rules[latexHidNilGroup] = tsSymbol[K](latexNilGroup)
                                                                    rules[latexTheoremEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexTheoremNameGroup))
                                                                    rules[latexHidCommon] = tsChoice[K](tsSymbol[K](latexActiveChar), tsSymbol[K](latexAlignmentTab), tsSymbol[K](latexCharRefInvalid), tsSymbol[K](latexIgnored), tsSymbol[K](latexInvalid), tsSymbol[K](latexParameterRef), tsSymbol[K](latexCode), tsSymbol[K](latexDef), tsSymbol[K](latexInput), tsSymbol[K](latexLet), tsSymbol[K](latexRelax), tsSymbol[K](latexString), tsSymbol[K](latexHidCmd), tsSymbol[K](latexCsnameGroup), tsSymbol[K](latexAddvspace), tsSymbol[K](latexCheckCommand), tsSymbol[K](latexCline), tsSymbol[K](latexEndinput), tsSymbol[K](latexEnsuremath), tsSymbol[K](latexError), tsSymbol[K](latexIfFileExists), tsSymbol[K](latexLabel), tsSymbol[K](latexMakeatletter), tsSymbol[K](latexMakeatother), tsSymbol[K](latexNewcommand), tsSymbol[K](latexNewcounter), tsSymbol[K](latexNewenvironment), tsSymbol[K](latexNewfont), tsSymbol[K](latexNewlength), tsSymbol[K](latexNewsavebox), tsSymbol[K](latexPrintcounter), tsSymbol[K](latexRef), tsSymbol[K](latexSetcounter), tsSymbol[K](latexSetlength), tsSymbol[K](latexSpace), tsSymbol[K](latexSetto), tsSymbol[K](latexStepcounter), tsSymbol[K](latexValue), tsSymbol[K](latexVerb), tsSymbol[K](latexWarningInfo), tsSymbol[K](latexTabularEnv), tsSymbol[K](latexTabularstarEnv), tsSymbol[K](latexDeleteShortVerb), tsSymbol[K](latexMakeShortVerb), tsSymbol[K](latexShortVerb), tsSymbol[K](latexFref), tsSymbol[K](latexHref), tsSymbol[K](latexUrl), tsSymbol[K](latexHyperbaseurl), tsSymbol[K](latexHyperimage), tsSymbol[K](latexHyperref), tsSymbol[K](latexExplSyntaxOff), tsSymbol[K](latexExplSyntaxOn), tsSymbol[K](latexRefrange), tsSymbol[K](latexLuacode), tsSymbol[K](latexLuacodeEnv), tsSymbol[K](latexLuacodestarEnv), tsSymbol[K](latexLua))
                                                                    rules[latexRaisebox] = tsSeq[K](tsSymbol[K](latexCsRaisebox), tsChoice[K](tsSymbol[K](latexHidDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexHidDimensionBrackGroup), tsBlank[K]()), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSeq[K](tsSymbol[K](latexHidDimensionParameter), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexHidTextToken)))))
                                                                    rules[latexGlueBrackGroup] = tsSeq[K](tsSymbol[K](latexLbrack), tsSymbol[K](latexGlue), tsSymbol[K](latexRbrack))
                                                                    rules[latexHidMakeVerbDelimParameter] = tsChoice[K](tsSymbol[K](latexCsMakeVerbDelim), tsSymbol[K](latexCs), tsSymbol[K](latexMakeVerbDelimGroup))
                                                                    rules[latexHidMathToken] = tsChoice[K](tsSymbol[K](latexCs), tsSymbol[K](latexHidMathGroup), tsSymbol[K](latexParameterRef), tsSymbol[K](latexTextSingle))
                                                                    rules[latexFigureEnd] = tsSeq[K](tsSymbol[K](latexCsEnd), tsSymbol[K](latexFigureNameGroup))
                                                                    rules[latexRight] = tsSeq[K](tsSymbol[K](latexCsRight), tsChoice[K](tsSymbol[K](latexExit), tsSymbol[K](latexPar), tsSymbol[K](latexExitMath), tsSymbol[K](latexHidMathToken)))
                                                                    rules

