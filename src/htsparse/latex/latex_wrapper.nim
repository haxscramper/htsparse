import
  hmisc / wrappers/treesitter
import
  hmisc / core/all
import
  hmisc / types/colorstring
import
  strutils

type
  LatexNodeKind* = enum
    latexAt                   ## At                             
    latexCheckCommand         ## CheckCommand                   
    latexDeclareOption        ## DeclareOption                  
    latexDeleteShortVerb      ## DeleteShortVerb                
    latexDoNotIndex           ## DoNotIndex                     
    latexError                ## Error                          
    latexExecuteOptions       ## ExecuteOptions                 
    latexExplSyntaxOff        ## ExplSyntaxOff                  
    latexExplSyntaxOn         ## ExplSyntaxOn                   
    latexIfFileExists         ## IfFileExists                   
    latexMakeShortVerb        ## MakeShortVerb                  
    latexNeedsTeXFOrmat       ## NeedsTeXFormat                 
    latexPassOptionsTo        ## PassOptionsTo                  
    latexProcessOptions       ## ProcessOptions                 
    latexProvides             ## Provides                       
    latexProvidesExpl         ## ProvidesExpl                   
    latexVerbatimEnv          ## Verbatim_env                   
    latexWarningInfo          ## WarningInfo                    
    latexAddvspace            ## addvspace                      
    latexAlignatEnv           ## alignat_env                    
    latexArrayEnv             ## array_env                      
    latexAtIfpackagelater     ## at_ifpackagelater              
    latexAuthor               ## author                         
    latexBegin                ## begin                          
    latexBegingroup           ## begingroup                     
    latexBibitem              ## bibitem                        
    latexBrackGroup           ## brack_group                    
    latexCharcode             ## charcode                       
    latexCite                 ## cite                           
    latexCites                ## cites                          
    latexCline                ## cline                          
    latexCode                 ## code                           
    latexCommentEnv           ## comment_env                    
    latexCsname               ## csname                         
    latexCsnameGroup          ## csname_group                   
    latexDate                 ## date                           
    latexDef                  ## def                            
    latexDelimiterGroup       ## delimiter_group                
    latexDimension            ## dimension                      
    latexDiscretionary        ## discretionary                  
    latexDisplayMathEnv       ## display_math_env               
    latexDmathEnv             ## dmath_env                      
    latexDocument             ## document                       
    latexDocumentEnv          ## document_env                   
    latexDseriesEnv           ## dseries_env                    
    latexEmph                 ## emph                           
    latexEnd                  ## end                            
    latexEndcsname            ## endcsname                      
    latexEndgroup             ## endgroup                       
    latexEndinput             ## endinput                       
    latexEnlargethispage      ## enlargethispage                
    latexEnsuremath           ## ensuremath                     
    latexExpandafter          ## expandafter                    
    latexFigureEnv            ## figure_env                     
    latexFilecontentsEnv      ## filecontents_env               
    latexFootnote             ## footnote                       
    latexFootnotemark         ## footnotemark                   
    latexFrac                 ## frac                           
    latexFref                 ## fref                           
    latexGlsAcr               ## gls_acr                        
    latexGlsdisp              ## glsdisp                        
    latexGlsentry             ## glsentry                       
    latexGlssee               ## glssee                         
    latexGlue                 ## glue                           
    latexGnuplotEnv           ## gnuplot_env                    
    latexGroup                ## group                          
    latexHref                 ## href                           
    latexHyperbaseurl         ## hyperbaseurl                   
    latexHyperimage           ## hyperimage                     
    latexHyperref             ## hyperref                       
    latexHyphenation          ## hyphenation                    
    latexInlineMathEnv        ## inline_math_env                
    latexInput                ## input                          
    latexItem                 ## item                           
    latexItemizeEnv           ## itemize_env                    
    latexLabel                ## label                          
    latexLatexDisplayMath     ## latex_display_math             
    latexLatexInlineMath      ## latex_inline_math              
    latexLeft                 ## left                           
    latexLet                  ## let                            
    latexLinebreak            ## linebreak                      
    latexLongnewglossaryentry ## longnewglossaryentry           
    latexLrboxEnv             ## lrbox_env                      
    latexLstinline            ## lstinline                      
    latexLstlistingEnv        ## lstlisting_env                 
    latexLua                  ## lua                            
    latexLuacode              ## luacode                        
    latexLuacodeEnv           ## luacode_env                    
    latexLuacodestarEnv       ## luacodestar_env                
    latexMakeatletter         ## makeatletter                   
    latexMakeatother          ## makeatother                    
    latexMakebox              ## makebox                        
    latexMarginpar            ## marginpar                      
    latexMathEnv              ## math_env                       
    latexMathaccent           ## mathaccent                     
    latexMathstyle            ## mathstyle                      
    latexMbox                 ## mbox                           
    latexMinipageEnv          ## minipage_env                   
    latexMint                 ## mint                           
    latexMintedEnv            ## minted_env                     
    latexMintinline           ## mintinline                     
    latexMulticolumn          ## multicolumn                    
    latexNewacronym           ## newacronym                     
    latexNewcommand           ## newcommand                     
    latexNewcounter           ## newcounter                     
    latexNewenvironment       ## newenvironment                 
    latexNewfont              ## newfont                        
    latexNewglossaryentry     ## newglossaryentry               
    latexNewlength            ## newlength                      
    latexNewline              ## newline                        
    latexNewsavebox           ## newsavebox                     
    latexNewtheorem           ## newtheorem                     
    latexNocite               ## nocite                         
    latexObeycr               ## obeycr                         
    latexPagebreak            ## pagebreak                      
    latexPagenumbering        ## pagenumbering                  
    latexPagestyle            ## pagestyle                      
    latexPar                  ## par                            
    latexParbox               ## parbox                         
    latexParenGroup           ## paren_group                    
    latexPhantomSmash         ## phantom_smash                  
    latexPictureEnv           ## picture_env                    
    latexPrintcounter         ## printcounter                   
    latexProtect              ## protect                        
    latexRaisebox             ## raisebox                       
    latexRef                  ## ref                            
    latexRefrange             ## refrange                       
    latexRegexp               ## regexp                         
    latexRelax                ## relax                          
    latexRestorecr            ## restorecr                      
    latexRight                ## right                          
    latexSavebox              ## savebox                        
    latexSbox                 ## sbox                           
    latexSection              ## section                        
    latexSemiSimpleGroup      ## semi_simple_group              
    latexSetcounter           ## setcounter                     
    latexSetlength            ## setlength                      
    latexSetto                ## setto                          
    latexShortVerb            ## short_verb                     
    latexSpace                ## space                          
    latexSqrt                 ## sqrt                           
    latexStackrel             ## stackrel                       
    latexStepcounter          ## stepcounter                    
    latexString               ## string                         
    latexTableEnv             ## table_env                      
    latexTabuEnv              ## tabu_env                       
    latexTabularEnv           ## tabular_env                    
    latexTabularstarEnv       ## tabularstar_env                
    latexTag                  ## tag                            
    latexTexDisplayMath       ## tex_display_math               
    latexTexInlineMath        ## tex_inline_math                
    latexTextCmd              ## text_cmd                       
    latexTextEnv              ## text_env                       
    latexTextstyle            ## textstyle                      
    latexThanks               ## thanks                         
    latexThebibliographyEnv   ## thebibliography_env            
    latexTheoremEnv           ## theorem_env                    
    latexTikzpictureEnv       ## tikzpicture_env                
    latexTitle                ## title                          
    latexUrl                  ## url                            
    latexUse                  ## use                            
    latexUse209               ## use_209                        
    latexUsebox               ## usebox                         
    latexValue                ## value                          
    latexVerb                 ## verb                           
    latexVolcite              ## volcite                        
    latexVolcites             ## volcites                       
    latexActiveChar           ## active_char                    
    latexAlignmentTab         ## alignment_tab                  
    latexBacktick             ## backtick                       
    latexCharRefInvalid       ## char_ref_invalid               
    latexComma                ## comma                          
    latexComment              ## comment                        
    latexCommentArara         ## comment_arara                  
    latexCommentBib           ## comment_bib                    
    latexCommentBlock         ## comment_block                  
    latexCommentTag           ## comment_tag                    
    latexCommentTex           ## comment_tex                    
    latexCs                   ## cs                             
    latexDecimal              ## decimal                        
    latexDisplayMathShift     ## display_math_shift             
    latexEol                  ## eol                            
    latexEquals               ## equals                         
    latexExit                 ## exit                           
    latexFixed                ## fixed                          
    latexHexadecimal          ## hexadecimal                    
    latexIgnored              ## ignored                        
    latexInvalid              ## invalid                        
    latexL                    ## l                              
    latexLbrack               ## lbrack                         
    latexLparen               ## lparen                         
    latexMath                 ## math                           
    latexMathShift            ## math_shift                     
    latexMinus                ## minus                          
    latexName                 ## name                           
    latexOctal                ## octal                          
    latexParameterRef         ## parameter_ref                  
    latexPlus                 ## plus                           
    latexPlusSym              ## plus_sym                       
    latexR                    ## r                              
    latexRbrack               ## rbrack                         
    latexRparen               ## rparen                         
    latexSpread               ## spread                         
    latexStar                 ## star                           
    latexSubscript            ## subscript                      
    latexSuperscript          ## superscript                    
    latexText                 ## text                           
    latexTo                   ## to                             
    latexUnit                 ## unit                           
    latexVerbDelim            ## verb_delim                     
    latexVerbatim             ## verbatim                       
    latexSyntaxError          ## Tree-sitter parser syntax error
   

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
      of "_space":               latexSpace               
      of "ERROR":                latexSyntaxError         
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")
 

type
  LatexNode* = HtsNode[TsLatexNode, LatexNodeKind]
   
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
 

