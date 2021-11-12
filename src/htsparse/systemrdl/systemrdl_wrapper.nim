import
  hmisc / wrappers/treesitter,
  hmisc / core/all,
  hmisc / types/colorstring,
  std/strutils
export treesitter

type
  SystemrdlNodeKind* = enum
    systemrdlAccesstypeLiteral               ## accesstype_literal
    systemrdlAddressingtypeLiteral           ## addressingtype_literal
    systemrdlArray                           ## array
    systemrdlArrayLiteral                    ## array_literal
    systemrdlArrayType                       ## array_type
    systemrdlBasicDataType                   ## basic_data_type
    systemrdlBinaryOperator                  ## binary_operator
    systemrdlBooleanLiteral                  ## boolean_literal
    systemrdlCastingType                     ## casting_type
    systemrdlComponentAnonDef                ## component_anon_def
    systemrdlComponentBody                   ## component_body
    systemrdlComponentBodyElem               ## component_body_elem
    systemrdlComponentDef                    ## component_def
    systemrdlComponentInst                   ## component_inst
    systemrdlComponentInstAlias              ## component_inst_alias
    systemrdlComponentInstArrayOrRange       ## component_inst_array_or_range
    systemrdlComponentInstType               ## component_inst_type
    systemrdlComponentInsts                  ## component_insts
    systemrdlComponentNamedDef               ## component_named_def
    systemrdlComponentPrimaryType            ## component_primary_type
    systemrdlComponentType                   ## component_type
    systemrdlConstantCast                    ## constant_cast
    systemrdlConstantConcatenation           ## constant_concatenation
    systemrdlConstantExpression              ## constant_expression
    systemrdlConstantMultipleConcatenation   ## constant_multiple_concatenation
    systemrdlConstantPrimary                 ## constant_primary
    systemrdlConstraintBody                  ## constraint_body
    systemrdlConstraintDef                   ## constraint_def
    systemrdlConstraintDefAnon               ## constraint_def_anon
    systemrdlConstraintDefExp                ## constraint_def_exp
    systemrdlConstraintElem                  ## constraint_elem
    systemrdlConstraintInsts                 ## constraint_insts
    systemrdlConstraintLhs                   ## constraint_lhs
    systemrdlConstraintPropAssignment        ## constraint_prop_assignment
    systemrdlConstraintValue                 ## constraint_value
    systemrdlConstraintValues                ## constraint_values
    systemrdlDataType                        ## data_type
    systemrdlDescription                     ## description
    systemrdlEnumBody                        ## enum_body
    systemrdlEnumDef                         ## enum_def
    systemrdlEnumEntry                       ## enum_entry
    systemrdlEnumPropertyAssignment          ## enum_property_assignment
    systemrdlEnumeratorLiteral               ## enumerator_literal
    systemrdlExplicitComponentInst           ## explicit_component_inst
    systemrdlExplicitEncodeAssignment        ## explicit_encode_assignment
    systemrdlExplicitOrDefaultPropAssignment ## explicit_or_default_prop_assignment
    systemrdlExplicitPropAssignment          ## explicit_prop_assignment
    systemrdlExplicitPropModifier            ## explicit_prop_modifier
    systemrdlInstanceOrPropRef               ## instance_or_prop_ref
    systemrdlInstanceRef                     ## instance_ref
    systemrdlInstanceRefElement              ## instance_ref_element
    systemrdlIntegerType                     ## integer_type
    systemrdlNumber                          ## number
    systemrdlOnreadtypeLiteral               ## onreadtype_literal
    systemrdlOnwritetypeLiteral              ## onwritetype_literal
    systemrdlParamDef                        ## param_def
    systemrdlParamDefElem                    ## param_def_elem
    systemrdlParamElem                       ## param_elem
    systemrdlParamInst                       ## param_inst
    systemrdlParamValue                      ## param_value
    systemrdlPostEncodeAssignment            ## post_encode_assignment
    systemrdlPostPropAssignment              ## post_prop_assignment
    systemrdlPrecedencetypeLiteral           ## precedencetype_literal
    systemrdlPrimaryLiteral                  ## primary_literal
    systemrdlPropAssignmentLhs               ## prop_assignment_lhs
    systemrdlPropAssignmentRhs               ## prop_assignment_rhs
    systemrdlPropKeyword                     ## prop_keyword
    systemrdlPropMod                         ## prop_mod
    systemrdlPropRef                         ## prop_ref
    systemrdlPropertyAssignment              ## property_assignment
    systemrdlPropertyAttribute               ## property_attribute
    systemrdlPropertyBody                    ## property_body
    systemrdlPropertyCompType                ## property_comp_type
    systemrdlPropertyCompTypes               ## property_comp_types
    systemrdlPropertyConstraint              ## property_constraint
    systemrdlPropertyDataType                ## property_data_type
    systemrdlPropertyDefault                 ## property_default
    systemrdlPropertyDefinition              ## property_definition
    systemrdlPropertyType                    ## property_type
    systemrdlPropertyUsage                   ## property_usage
    systemrdlRange                           ## range
    systemrdlSimpleType                      ## simple_type
    systemrdlSourceFile                      ## source_file
    systemrdlStringLiteral                   ## string_literal
    systemrdlStructBody                      ## struct_body
    systemrdlStructDef                       ## struct_def
    systemrdlStructElem                      ## struct_elem
    systemrdlStructLiteral                   ## struct_literal
    systemrdlStructLiteralElem               ## struct_literal_elem
    systemrdlStructType                      ## struct_type
    systemrdlUnaryOperator                   ## unary_operator
    systemrdlExclamationTok                  ## !
    systemrdlExclamationEqualTok             ## !=
    systemrdlQuoteTok                        ## "
    systemrdlHashTok                         ## #
    systemrdlPercentTok                      ## %
    systemrdlPercentEqualTok                 ## %=
    systemrdlAmpersandTok                    ## &
    systemrdlDoubleAmpersandTok              ## &&
    systemrdlApostropheTok                   ## '
    systemrdlApostropheLCurlyTok             ## '{
    systemrdlLParTok                         ## (
    systemrdlRParTok                         ## )
    systemrdlAsteriskTok                     ## *
    systemrdlDoubleAsteriskTok               ## **
    systemrdlPlusTok                         ## +
    systemrdlPlusEqualTok                    ## +=
    systemrdlCommaTok                        ## ,
    systemrdlMinusTok                        ## -
    systemrdlMinusGreaterThanTok             ## ->
    systemrdlDotTok                          ## .
    systemrdlSlashTok                        ## /
    systemrdlColonTok                        ## :
    systemrdlDoubleColonTok                  ## ::
    systemrdlSemicolonTok                    ## ;
    systemrdlLessThanTok                     ## <
    systemrdlDoubleLessThanTok               ## <<
    systemrdlLessThanEqualTok                ## <=
    systemrdlEqualTok                        ## =
    systemrdlDoubleEqualTok                  ## ==
    systemrdlGreaterThanTok                  ## >
    systemrdlGreaterThanEqualTok             ## >=
    systemrdlDoubleGreaterThanTok            ## >>
    systemrdlQuestionTok                     ## ?
    systemrdlAtTok                           ## @
    systemrdlLBrackTok                       ## [
    systemrdlRBrackTok                       ## ]
    systemrdlAccentTok                       ## ^
    systemrdlAccentTildeTok                  ## ^~
    systemrdlAbstractTok                     ## abstract
    systemrdlAccesstypeTok                   ## accesstype
    systemrdlAddressingtypeTok               ## addressingtype
    systemrdlAddrmapTok                      ## addrmap
    systemrdlAliasTok                        ## alias
    systemrdlAllTok                          ## all
    systemrdlBooleanTok                      ## boolean
    systemrdlBothedgeTok                     ## bothedge
    systemrdlClrTok                          ## clr
    systemrdlComment                         ## comment
    systemrdlCompactTok                      ## compact
    systemrdlComponentTok                    ## component
    systemrdlConstraintTok                   ## constraint
    systemrdlDefaultTok                      ## default
    systemrdlEncodeTok                       ## encode
    systemrdlEnumTok                         ## enum
    systemrdlExternalTok                     ## external
    systemrdlFalseTok                        ## false
    systemrdlFieldTok                        ## field
    systemrdlFullalignTok                    ## fullalign
    systemrdlHwTok                           ## hw
    systemrdlId                              ## id
    systemrdlInsideTok                       ## inside
    systemrdlIntegerAtomType                 ## integer_atom_type
    systemrdlIntegerVectorType               ## integer_vector_type
    systemrdlInternalTok                     ## internal
    systemrdlLevelTok                        ## level
    systemrdlMemTok                          ## mem
    systemrdlNaTok                           ## na
    systemrdlNegedgeTok                      ## negedge
    systemrdlNonstickyTok                    ## nonsticky
    systemrdlNumberTok                       ## number
    systemrdlOnreadtypeTok                   ## onreadtype
    systemrdlOnwritetypeTok                  ## onwritetype
    systemrdlPosedgeTok                      ## posedge
    systemrdlPropertyTok                     ## property
    systemrdlPropertyConstraintType          ## property_constraint_type
    systemrdlRTok                            ## r
    systemrdlRclrTok                         ## rclr
    systemrdlRefTok                          ## ref
    systemrdlRegTok                          ## reg
    systemrdlRegalignTok                     ## regalign
    systemrdlRegfileTok                      ## regfile
    systemrdlRsetTok                         ## rset
    systemrdlRuserTok                        ## ruser
    systemrdlRwTok                           ## rw
    systemrdlRw1Tok                          ## rw1
    systemrdlSignalTok                       ## signal
    systemrdlSigning                         ## signing
    systemrdlStringTok                       ## string
    systemrdlStructTok                       ## struct
    systemrdlSwTok                           ## sw
    systemrdlTemplate                        ## template
    systemrdlThisTok                         ## this
    systemrdlTrueTok                         ## true
    systemrdlTypeTok                         ## type
    systemrdlWTok                            ## w
    systemrdlW1Tok                           ## w1
    systemrdlWclrTok                         ## wclr
    systemrdlWoclrTok                        ## woclr
    systemrdlWosetTok                        ## woset
    systemrdlWotTok                          ## wot
    systemrdlWrTok                           ## wr
    systemrdlWsetTok                         ## wset
    systemrdlWuserTok                        ## wuser
    systemrdlWzcTok                          ## wzc
    systemrdlWzsTok                          ## wzs
    systemrdlWztTok                          ## wzt
    systemrdlLCurlyTok                       ## {
    systemrdlPipeTok                         ## |
    systemrdlDoublePipeTok                   ## ||
    systemrdlRCurlyTok                       ## }
    systemrdlTildeTok                        ## ~
    systemrdlTildeAmpersandTok               ## ~&
    systemrdlTildeAccentTok                  ## ~^
    systemrdlTildePipeTok                    ## ~|
    systemrdlSyntaxError                     ## Tree-sitter parser syntax error


type
  TsSystemrdlNode* = distinct TSNode


type
  SystemrdlParser* = distinct PtsParser


proc tsNodeType*(node: TsSystemrdlNode): string



proc kind*(node: TsSystemrdlNode): SystemrdlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "accesstype_literal":                  systemrdlAccesstypeLiteral
      of "addressingtype_literal":              systemrdlAddressingtypeLiteral
      of "array":                               systemrdlArray
      of "array_literal":                       systemrdlArrayLiteral
      of "array_type":                          systemrdlArrayType
      of "basic_data_type":                     systemrdlBasicDataType
      of "binary_operator":                     systemrdlBinaryOperator
      of "boolean_literal":                     systemrdlBooleanLiteral
      of "casting_type":                        systemrdlCastingType
      of "component_anon_def":                  systemrdlComponentAnonDef
      of "component_body":                      systemrdlComponentBody
      of "component_body_elem":                 systemrdlComponentBodyElem
      of "component_def":                       systemrdlComponentDef
      of "component_inst":                      systemrdlComponentInst
      of "component_inst_alias":                systemrdlComponentInstAlias
      of "component_inst_array_or_range":       systemrdlComponentInstArrayOrRange
      of "component_inst_type":                 systemrdlComponentInstType
      of "component_insts":                     systemrdlComponentInsts
      of "component_named_def":                 systemrdlComponentNamedDef
      of "component_primary_type":              systemrdlComponentPrimaryType
      of "component_type":                      systemrdlComponentType
      of "constant_cast":                       systemrdlConstantCast
      of "constant_concatenation":              systemrdlConstantConcatenation
      of "constant_expression":                 systemrdlConstantExpression
      of "constant_multiple_concatenation":     systemrdlConstantMultipleConcatenation
      of "constant_primary":                    systemrdlConstantPrimary
      of "constraint_body":                     systemrdlConstraintBody
      of "constraint_def":                      systemrdlConstraintDef
      of "constraint_def_anon":                 systemrdlConstraintDefAnon
      of "constraint_def_exp":                  systemrdlConstraintDefExp
      of "constraint_elem":                     systemrdlConstraintElem
      of "constraint_insts":                    systemrdlConstraintInsts
      of "constraint_lhs":                      systemrdlConstraintLhs
      of "constraint_prop_assignment":          systemrdlConstraintPropAssignment
      of "constraint_value":                    systemrdlConstraintValue
      of "constraint_values":                   systemrdlConstraintValues
      of "data_type":                           systemrdlDataType
      of "description":                         systemrdlDescription
      of "enum_body":                           systemrdlEnumBody
      of "enum_def":                            systemrdlEnumDef
      of "enum_entry":                          systemrdlEnumEntry
      of "enum_property_assignment":            systemrdlEnumPropertyAssignment
      of "enumerator_literal":                  systemrdlEnumeratorLiteral
      of "explicit_component_inst":             systemrdlExplicitComponentInst
      of "explicit_encode_assignment":          systemrdlExplicitEncodeAssignment
      of "explicit_or_default_prop_assignment": systemrdlExplicitOrDefaultPropAssignment
      of "explicit_prop_assignment":            systemrdlExplicitPropAssignment
      of "explicit_prop_modifier":              systemrdlExplicitPropModifier
      of "instance_or_prop_ref":                systemrdlInstanceOrPropRef
      of "instance_ref":                        systemrdlInstanceRef
      of "instance_ref_element":                systemrdlInstanceRefElement
      of "integer_type":                        systemrdlIntegerType
      of "number":                              systemrdlNumber
      of "onreadtype_literal":                  systemrdlOnreadtypeLiteral
      of "onwritetype_literal":                 systemrdlOnwritetypeLiteral
      of "param_def":                           systemrdlParamDef
      of "param_def_elem":                      systemrdlParamDefElem
      of "param_elem":                          systemrdlParamElem
      of "param_inst":                          systemrdlParamInst
      of "param_value":                         systemrdlParamValue
      of "post_encode_assignment":              systemrdlPostEncodeAssignment
      of "post_prop_assignment":                systemrdlPostPropAssignment
      of "precedencetype_literal":              systemrdlPrecedencetypeLiteral
      of "primary_literal":                     systemrdlPrimaryLiteral
      of "prop_assignment_lhs":                 systemrdlPropAssignmentLhs
      of "prop_assignment_rhs":                 systemrdlPropAssignmentRhs
      of "prop_keyword":                        systemrdlPropKeyword
      of "prop_mod":                            systemrdlPropMod
      of "prop_ref":                            systemrdlPropRef
      of "property_assignment":                 systemrdlPropertyAssignment
      of "property_attribute":                  systemrdlPropertyAttribute
      of "property_body":                       systemrdlPropertyBody
      of "property_comp_type":                  systemrdlPropertyCompType
      of "property_comp_types":                 systemrdlPropertyCompTypes
      of "property_constraint":                 systemrdlPropertyConstraint
      of "property_data_type":                  systemrdlPropertyDataType
      of "property_default":                    systemrdlPropertyDefault
      of "property_definition":                 systemrdlPropertyDefinition
      of "property_type":                       systemrdlPropertyType
      of "property_usage":                      systemrdlPropertyUsage
      of "range":                               systemrdlRange
      of "simple_type":                         systemrdlSimpleType
      of "source_file":                         systemrdlSourceFile
      of "string_literal":                      systemrdlStringLiteral
      of "struct_body":                         systemrdlStructBody
      of "struct_def":                          systemrdlStructDef
      of "struct_elem":                         systemrdlStructElem
      of "struct_literal":                      systemrdlStructLiteral
      of "struct_literal_elem":                 systemrdlStructLiteralElem
      of "struct_type":                         systemrdlStructType
      of "unary_operator":                      systemrdlUnaryOperator
      of "!":                                   systemrdlExclamationTok
      of "!=":                                  systemrdlExclamationEqualTok
      of "\"":                                  systemrdlQuoteTok
      of "#":                                   systemrdlHashTok
      of "%":                                   systemrdlPercentTok
      of "%=":                                  systemrdlPercentEqualTok
      of "&":                                   systemrdlAmpersandTok
      of "&&":                                  systemrdlDoubleAmpersandTok
      of "\'":                                  systemrdlApostropheTok
      of "\'{":                                 systemrdlApostropheLCurlyTok
      of "(":                                   systemrdlLParTok
      of ")":                                   systemrdlRParTok
      of "*":                                   systemrdlAsteriskTok
      of "**":                                  systemrdlDoubleAsteriskTok
      of "+":                                   systemrdlPlusTok
      of "+=":                                  systemrdlPlusEqualTok
      of ",":                                   systemrdlCommaTok
      of "-":                                   systemrdlMinusTok
      of "->":                                  systemrdlMinusGreaterThanTok
      of ".":                                   systemrdlDotTok
      of "/":                                   systemrdlSlashTok
      of ":":                                   systemrdlColonTok
      of "::":                                  systemrdlDoubleColonTok
      of ";":                                   systemrdlSemicolonTok
      of "<":                                   systemrdlLessThanTok
      of "<<":                                  systemrdlDoubleLessThanTok
      of "<=":                                  systemrdlLessThanEqualTok
      of "=":                                   systemrdlEqualTok
      of "==":                                  systemrdlDoubleEqualTok
      of ">":                                   systemrdlGreaterThanTok
      of ">=":                                  systemrdlGreaterThanEqualTok
      of ">>":                                  systemrdlDoubleGreaterThanTok
      of "?":                                   systemrdlQuestionTok
      of "@":                                   systemrdlAtTok
      of "[":                                   systemrdlLBrackTok
      of "]":                                   systemrdlRBrackTok
      of "^":                                   systemrdlAccentTok
      of "^~":                                  systemrdlAccentTildeTok
      of "abstract":                            systemrdlAbstractTok
      of "accesstype":                          systemrdlAccesstypeTok
      of "addressingtype":                      systemrdlAddressingtypeTok
      of "addrmap":                             systemrdlAddrmapTok
      of "alias":                               systemrdlAliasTok
      of "all":                                 systemrdlAllTok
      of "boolean":                             systemrdlBooleanTok
      of "bothedge":                            systemrdlBothedgeTok
      of "clr":                                 systemrdlClrTok
      of "comment":                             systemrdlComment
      of "compact":                             systemrdlCompactTok
      of "component":                           systemrdlComponentTok
      of "constraint":                          systemrdlConstraintTok
      of "default":                             systemrdlDefaultTok
      of "encode":                              systemrdlEncodeTok
      of "enum":                                systemrdlEnumTok
      of "external":                            systemrdlExternalTok
      of "false":                               systemrdlFalseTok
      of "field":                               systemrdlFieldTok
      of "fullalign":                           systemrdlFullalignTok
      of "hw":                                  systemrdlHwTok
      of "id":                                  systemrdlId
      of "inside":                              systemrdlInsideTok
      of "integer_atom_type":                   systemrdlIntegerAtomType
      of "integer_vector_type":                 systemrdlIntegerVectorType
      of "internal":                            systemrdlInternalTok
      of "level":                               systemrdlLevelTok
      of "mem":                                 systemrdlMemTok
      of "na":                                  systemrdlNaTok
      of "negedge":                             systemrdlNegedgeTok
      of "nonsticky":                           systemrdlNonstickyTok
      of "onreadtype":                          systemrdlOnreadtypeTok
      of "onwritetype":                         systemrdlOnwritetypeTok
      of "posedge":                             systemrdlPosedgeTok
      of "property":                            systemrdlPropertyTok
      of "property_constraint_type":            systemrdlPropertyConstraintType
      of "r":                                   systemrdlRTok
      of "rclr":                                systemrdlRclrTok
      of "ref":                                 systemrdlRefTok
      of "reg":                                 systemrdlRegTok
      of "regalign":                            systemrdlRegalignTok
      of "regfile":                             systemrdlRegfileTok
      of "rset":                                systemrdlRsetTok
      of "ruser":                               systemrdlRuserTok
      of "rw":                                  systemrdlRwTok
      of "rw1":                                 systemrdlRw1Tok
      of "signal":                              systemrdlSignalTok
      of "signing":                             systemrdlSigning
      of "string":                              systemrdlStringTok
      of "struct":                              systemrdlStructTok
      of "sw":                                  systemrdlSwTok
      of "template":                            systemrdlTemplate
      of "this":                                systemrdlThisTok
      of "true":                                systemrdlTrueTok
      of "type":                                systemrdlTypeTok
      of "w":                                   systemrdlWTok
      of "w1":                                  systemrdlW1Tok
      of "wclr":                                systemrdlWclrTok
      of "woclr":                               systemrdlWoclrTok
      of "woset":                               systemrdlWosetTok
      of "wot":                                 systemrdlWotTok
      of "wr":                                  systemrdlWrTok
      of "wset":                                systemrdlWsetTok
      of "wuser":                               systemrdlWuserTok
      of "wzc":                                 systemrdlWzcTok
      of "wzs":                                 systemrdlWzsTok
      of "wzt":                                 systemrdlWztTok
      of "{":                                   systemrdlLCurlyTok
      of "|":                                   systemrdlPipeTok
      of "||":                                  systemrdlDoublePipeTok
      of "}":                                   systemrdlRCurlyTok
      of "~":                                   systemrdlTildeTok
      of "~&":                                  systemrdlTildeAmpersandTok
      of "~^":                                  systemrdlTildeAccentTok
      of "~|":                                  systemrdlTildePipeTok
      of "ERROR":                               systemrdlSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsSystemrdlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsSystemrdlNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsSystemrdlNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_systemrdl(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsSystemrdlNode): string =
  $ts_node_type(TSNode(node))

proc newTsSystemrdlParser*(): SystemrdlParser =
  result = SystemrdlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_systemrdl())

proc parseString*(parser: SystemrdlParser, str: string): TsSystemrdlNode =
  TsSystemrdlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsSystemrdlString*(str: string): TsSystemrdlNode =
  let parser = newTsSystemrdlParser()
  return parseString(parser, str)

func `$`*(node: TsSystemrdlNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


func `[]`*(
    node: TsSystemrdlNode,
    idx:  int,
    kind: SystemrdlNodeKind | set[SystemrdlNodeKind]
  ): TsSystemrdlNode =
  assert 0 <= idx and idx < node.len
  result = TsSystemrdlNode(ts_node_named_child(TSNode(node), uint32(idx)))
  assertKind(result, kind, "Child node at index " & $idx & " for node kind " & $node.kind)

type
  SystemrdlNode* = HtsNode[TsSystemrdlNode, SystemrdlNodeKind]

proc treeReprTsSystemrdl*(str: string, unnamed: bool = false): ColoredText =
  treeRepr[TsSystemrdlNode, SystemrdlNodeKind](parseTsSystemrdlString(str), str, 9, unnamed = unnamed)

proc toHtsNode*(
    node: TsSystemrdlNode,
    str:  ptr string
  ): HtsNode[TsSystemrdlNode, SystemrdlNodeKind] =
  toHtsNode[TsSystemrdlNode, SystemrdlNodeKind](node, str)

proc toHtsTree*(node: TsSystemrdlNode, str: ptr string): SystemrdlNode =
  toHtsNode[TsSystemrdlNode, SystemrdlNodeKind](node, str)

proc parseSystemrdlString*(
    str:     ptr string,
    unnamed: bool = false
  ): SystemrdlNode =
  let parser = newTsSystemrdlParser()
  return toHtsTree[TsSystemrdlNode, SystemrdlNodeKind](parseString(parser, str[]), str)

proc parseSystemrdlString*(str: string, unnamed: bool = false): SystemrdlNode =
  let parser = newTsSystemrdlParser()
  return toHtsTree[TsSystemrdlNode, SystemrdlNodeKind](parseString(parser, str), unsafeAddr str, storePtr = false)


