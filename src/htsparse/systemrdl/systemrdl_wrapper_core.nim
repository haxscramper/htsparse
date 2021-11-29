import
  hmisc / wrappers/treesitter_core
export treesitter_core
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

proc strRepr*(kind: SystemrdlNodeKind): string =
  case kind:
    of systemrdlAccesstypeLiteral:               "accesstype_literal"
    of systemrdlAddressingtypeLiteral:           "addressingtype_literal"
    of systemrdlArray:                           "array"
    of systemrdlArrayLiteral:                    "array_literal"
    of systemrdlArrayType:                       "array_type"
    of systemrdlBasicDataType:                   "basic_data_type"
    of systemrdlBinaryOperator:                  "binary_operator"
    of systemrdlBooleanLiteral:                  "boolean_literal"
    of systemrdlCastingType:                     "casting_type"
    of systemrdlComponentAnonDef:                "component_anon_def"
    of systemrdlComponentBody:                   "component_body"
    of systemrdlComponentBodyElem:               "component_body_elem"
    of systemrdlComponentDef:                    "component_def"
    of systemrdlComponentInst:                   "component_inst"
    of systemrdlComponentInstAlias:              "component_inst_alias"
    of systemrdlComponentInstArrayOrRange:       "component_inst_array_or_range"
    of systemrdlComponentInstType:               "component_inst_type"
    of systemrdlComponentInsts:                  "component_insts"
    of systemrdlComponentNamedDef:               "component_named_def"
    of systemrdlComponentPrimaryType:            "component_primary_type"
    of systemrdlComponentType:                   "component_type"
    of systemrdlConstantCast:                    "constant_cast"
    of systemrdlConstantConcatenation:           "constant_concatenation"
    of systemrdlConstantExpression:              "constant_expression"
    of systemrdlConstantMultipleConcatenation:   "constant_multiple_concatenation"
    of systemrdlConstantPrimary:                 "constant_primary"
    of systemrdlConstraintBody:                  "constraint_body"
    of systemrdlConstraintDef:                   "constraint_def"
    of systemrdlConstraintDefAnon:               "constraint_def_anon"
    of systemrdlConstraintDefExp:                "constraint_def_exp"
    of systemrdlConstraintElem:                  "constraint_elem"
    of systemrdlConstraintInsts:                 "constraint_insts"
    of systemrdlConstraintLhs:                   "constraint_lhs"
    of systemrdlConstraintPropAssignment:        "constraint_prop_assignment"
    of systemrdlConstraintValue:                 "constraint_value"
    of systemrdlConstraintValues:                "constraint_values"
    of systemrdlDataType:                        "data_type"
    of systemrdlDescription:                     "description"
    of systemrdlEnumBody:                        "enum_body"
    of systemrdlEnumDef:                         "enum_def"
    of systemrdlEnumEntry:                       "enum_entry"
    of systemrdlEnumPropertyAssignment:          "enum_property_assignment"
    of systemrdlEnumeratorLiteral:               "enumerator_literal"
    of systemrdlExplicitComponentInst:           "explicit_component_inst"
    of systemrdlExplicitEncodeAssignment:        "explicit_encode_assignment"
    of systemrdlExplicitOrDefaultPropAssignment: "explicit_or_default_prop_assignment"
    of systemrdlExplicitPropAssignment:          "explicit_prop_assignment"
    of systemrdlExplicitPropModifier:            "explicit_prop_modifier"
    of systemrdlInstanceOrPropRef:               "instance_or_prop_ref"
    of systemrdlInstanceRef:                     "instance_ref"
    of systemrdlInstanceRefElement:              "instance_ref_element"
    of systemrdlIntegerType:                     "integer_type"
    of systemrdlNumber:                          "number"
    of systemrdlOnreadtypeLiteral:               "onreadtype_literal"
    of systemrdlOnwritetypeLiteral:              "onwritetype_literal"
    of systemrdlParamDef:                        "param_def"
    of systemrdlParamDefElem:                    "param_def_elem"
    of systemrdlParamElem:                       "param_elem"
    of systemrdlParamInst:                       "param_inst"
    of systemrdlParamValue:                      "param_value"
    of systemrdlPostEncodeAssignment:            "post_encode_assignment"
    of systemrdlPostPropAssignment:              "post_prop_assignment"
    of systemrdlPrecedencetypeLiteral:           "precedencetype_literal"
    of systemrdlPrimaryLiteral:                  "primary_literal"
    of systemrdlPropAssignmentLhs:               "prop_assignment_lhs"
    of systemrdlPropAssignmentRhs:               "prop_assignment_rhs"
    of systemrdlPropKeyword:                     "prop_keyword"
    of systemrdlPropMod:                         "prop_mod"
    of systemrdlPropRef:                         "prop_ref"
    of systemrdlPropertyAssignment:              "property_assignment"
    of systemrdlPropertyAttribute:               "property_attribute"
    of systemrdlPropertyBody:                    "property_body"
    of systemrdlPropertyCompType:                "property_comp_type"
    of systemrdlPropertyCompTypes:               "property_comp_types"
    of systemrdlPropertyConstraint:              "property_constraint"
    of systemrdlPropertyDataType:                "property_data_type"
    of systemrdlPropertyDefault:                 "property_default"
    of systemrdlPropertyDefinition:              "property_definition"
    of systemrdlPropertyType:                    "property_type"
    of systemrdlPropertyUsage:                   "property_usage"
    of systemrdlRange:                           "range"
    of systemrdlSimpleType:                      "simple_type"
    of systemrdlSourceFile:                      "source_file"
    of systemrdlStringLiteral:                   "string_literal"
    of systemrdlStructBody:                      "struct_body"
    of systemrdlStructDef:                       "struct_def"
    of systemrdlStructElem:                      "struct_elem"
    of systemrdlStructLiteral:                   "struct_literal"
    of systemrdlStructLiteralElem:               "struct_literal_elem"
    of systemrdlStructType:                      "struct_type"
    of systemrdlUnaryOperator:                   "unary_operator"
    of systemrdlExclamationTok:                  "!"
    of systemrdlExclamationEqualTok:             "!="
    of systemrdlQuoteTok:                        "\""
    of systemrdlHashTok:                         "#"
    of systemrdlPercentTok:                      "%"
    of systemrdlPercentEqualTok:                 "%="
    of systemrdlAmpersandTok:                    "&"
    of systemrdlDoubleAmpersandTok:              "&&"
    of systemrdlApostropheTok:                   "\'"
    of systemrdlApostropheLCurlyTok:             "\'{"
    of systemrdlLParTok:                         "("
    of systemrdlRParTok:                         ")"
    of systemrdlAsteriskTok:                     "*"
    of systemrdlDoubleAsteriskTok:               "**"
    of systemrdlPlusTok:                         "+"
    of systemrdlPlusEqualTok:                    "+="
    of systemrdlCommaTok:                        ","
    of systemrdlMinusTok:                        "-"
    of systemrdlMinusGreaterThanTok:             "->"
    of systemrdlDotTok:                          "."
    of systemrdlSlashTok:                        "/"
    of systemrdlColonTok:                        ":"
    of systemrdlDoubleColonTok:                  "::"
    of systemrdlSemicolonTok:                    ";"
    of systemrdlLessThanTok:                     "<"
    of systemrdlDoubleLessThanTok:               "<<"
    of systemrdlLessThanEqualTok:                "<="
    of systemrdlEqualTok:                        "="
    of systemrdlDoubleEqualTok:                  "=="
    of systemrdlGreaterThanTok:                  ">"
    of systemrdlGreaterThanEqualTok:             ">="
    of systemrdlDoubleGreaterThanTok:            ">>"
    of systemrdlQuestionTok:                     "?"
    of systemrdlAtTok:                           "@"
    of systemrdlLBrackTok:                       "["
    of systemrdlRBrackTok:                       "]"
    of systemrdlAccentTok:                       "^"
    of systemrdlAccentTildeTok:                  "^~"
    of systemrdlAbstractTok:                     "abstract"
    of systemrdlAccesstypeTok:                   "accesstype"
    of systemrdlAddressingtypeTok:               "addressingtype"
    of systemrdlAddrmapTok:                      "addrmap"
    of systemrdlAliasTok:                        "alias"
    of systemrdlAllTok:                          "all"
    of systemrdlBooleanTok:                      "boolean"
    of systemrdlBothedgeTok:                     "bothedge"
    of systemrdlClrTok:                          "clr"
    of systemrdlComment:                         "comment"
    of systemrdlCompactTok:                      "compact"
    of systemrdlComponentTok:                    "component"
    of systemrdlConstraintTok:                   "constraint"
    of systemrdlDefaultTok:                      "default"
    of systemrdlEncodeTok:                       "encode"
    of systemrdlEnumTok:                         "enum"
    of systemrdlExternalTok:                     "external"
    of systemrdlFalseTok:                        "false"
    of systemrdlFieldTok:                        "field"
    of systemrdlFullalignTok:                    "fullalign"
    of systemrdlHwTok:                           "hw"
    of systemrdlId:                              "id"
    of systemrdlInsideTok:                       "inside"
    of systemrdlIntegerAtomType:                 "integer_atom_type"
    of systemrdlIntegerVectorType:               "integer_vector_type"
    of systemrdlInternalTok:                     "internal"
    of systemrdlLevelTok:                        "level"
    of systemrdlMemTok:                          "mem"
    of systemrdlNaTok:                           "na"
    of systemrdlNegedgeTok:                      "negedge"
    of systemrdlNonstickyTok:                    "nonsticky"
    of systemrdlNumberTok:                       "number"
    of systemrdlOnreadtypeTok:                   "onreadtype"
    of systemrdlOnwritetypeTok:                  "onwritetype"
    of systemrdlPosedgeTok:                      "posedge"
    of systemrdlPropertyTok:                     "property"
    of systemrdlPropertyConstraintType:          "property_constraint_type"
    of systemrdlRTok:                            "r"
    of systemrdlRclrTok:                         "rclr"
    of systemrdlRefTok:                          "ref"
    of systemrdlRegTok:                          "reg"
    of systemrdlRegalignTok:                     "regalign"
    of systemrdlRegfileTok:                      "regfile"
    of systemrdlRsetTok:                         "rset"
    of systemrdlRuserTok:                        "ruser"
    of systemrdlRwTok:                           "rw"
    of systemrdlRw1Tok:                          "rw1"
    of systemrdlSignalTok:                       "signal"
    of systemrdlSigning:                         "signing"
    of systemrdlStringTok:                       "string"
    of systemrdlStructTok:                       "struct"
    of systemrdlSwTok:                           "sw"
    of systemrdlTemplate:                        "template"
    of systemrdlThisTok:                         "this"
    of systemrdlTrueTok:                         "true"
    of systemrdlTypeTok:                         "type"
    of systemrdlWTok:                            "w"
    of systemrdlW1Tok:                           "w1"
    of systemrdlWclrTok:                         "wclr"
    of systemrdlWoclrTok:                        "woclr"
    of systemrdlWosetTok:                        "woset"
    of systemrdlWotTok:                          "wot"
    of systemrdlWrTok:                           "wr"
    of systemrdlWsetTok:                         "wset"
    of systemrdlWuserTok:                        "wuser"
    of systemrdlWzcTok:                          "wzc"
    of systemrdlWzsTok:                          "wzs"
    of systemrdlWztTok:                          "wzt"
    of systemrdlLCurlyTok:                       "{"
    of systemrdlPipeTok:                         "|"
    of systemrdlDoublePipeTok:                   "||"
    of systemrdlRCurlyTok:                       "}"
    of systemrdlTildeTok:                        "~"
    of systemrdlTildeAmpersandTok:               "~&"
    of systemrdlTildeAccentTok:                  "~^"
    of systemrdlTildePipeTok:                    "~|"
    of systemrdlSyntaxError:                     "ERROR"

type
  TsSystemrdlNode* = distinct TSNode

type
  SystemrdlParser* = distinct PtsParser

const systemrdlAllowedSubnodes*: array[SystemrdlNodeKind, set[SystemrdlNodeKind]] = block:
                                                                                      var tmp: array[SystemrdlNodeKind, set[SystemrdlNodeKind]]
                                                                                      tmp[systemrdlArray] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlArrayLiteral] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlBasicDataType] = {systemrdlId, systemrdlSigning, systemrdlSimpleType}
                                                                                      tmp[systemrdlCastingType] = {systemrdlConstantPrimary, systemrdlSimpleType}
                                                                                      tmp[systemrdlComponentAnonDef] = {systemrdlComponentBody, systemrdlComponentType}
                                                                                      tmp[systemrdlComponentBody] = {systemrdlComponentBodyElem}
                                                                                      tmp[systemrdlComponentBodyElem] = {systemrdlComponentDef, systemrdlConstraintDef, systemrdlEnumDef, systemrdlExplicitComponentInst, systemrdlPropertyAssignment, systemrdlStructDef}
                                                                                      tmp[systemrdlComponentDef] = {systemrdlComponentAnonDef, systemrdlComponentInstType, systemrdlComponentInsts, systemrdlComponentNamedDef}
                                                                                      tmp[systemrdlComponentInst] = {systemrdlComponentInstArrayOrRange, systemrdlConstantExpression, systemrdlId}
                                                                                      tmp[systemrdlComponentInstAlias] = {systemrdlId}
                                                                                      tmp[systemrdlComponentInstArrayOrRange] = {systemrdlArray, systemrdlRange}
                                                                                      tmp[systemrdlComponentInsts] = {systemrdlComponentInst, systemrdlParamInst}
                                                                                      tmp[systemrdlComponentNamedDef] = {systemrdlComponentBody, systemrdlComponentType, systemrdlId, systemrdlParamDef}
                                                                                      tmp[systemrdlComponentType] = {systemrdlComponentPrimaryType}
                                                                                      tmp[systemrdlConstantCast] = {systemrdlCastingType, systemrdlConstantExpression}
                                                                                      tmp[systemrdlConstantConcatenation] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlConstantExpression] = {systemrdlBinaryOperator, systemrdlConstantExpression, systemrdlConstantPrimary, systemrdlUnaryOperator}
                                                                                      tmp[systemrdlConstantMultipleConcatenation] = {systemrdlConstantConcatenation, systemrdlConstantExpression}
                                                                                      tmp[systemrdlConstantPrimary] = {
                                                                                                                        systemrdlArrayLiteral,
                                                                                                                        systemrdlConstantCast,
                                                                                                                        systemrdlConstantConcatenation,
                                                                                                                        systemrdlConstantExpression,
                                                                                                                        systemrdlConstantMultipleConcatenation,
                                                                                                                        systemrdlInstanceOrPropRef,
                                                                                                                        systemrdlPrimaryLiteral,
                                                                                                                        systemrdlStructLiteral
                                                                                                                      }
                                                                                      tmp[systemrdlConstraintBody] = {systemrdlConstraintElem}
                                                                                      tmp[systemrdlConstraintDef] = {systemrdlConstraintDefAnon, systemrdlConstraintDefExp}
                                                                                      tmp[systemrdlConstraintDefAnon] = {systemrdlConstraintBody, systemrdlConstraintInsts}
                                                                                      tmp[systemrdlConstraintDefExp] = {systemrdlConstraintBody, systemrdlConstraintInsts, systemrdlId}
                                                                                      tmp[systemrdlConstraintElem] = {systemrdlConstantExpression, systemrdlConstraintLhs, systemrdlConstraintPropAssignment, systemrdlConstraintValues, systemrdlId}
                                                                                      tmp[systemrdlConstraintInsts] = {systemrdlId}
                                                                                      tmp[systemrdlConstraintLhs] = {systemrdlInstanceRef}
                                                                                      tmp[systemrdlConstraintPropAssignment] = {systemrdlConstantExpression, systemrdlId}
                                                                                      tmp[systemrdlConstraintValue] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlConstraintValues] = {systemrdlConstraintValue}
                                                                                      tmp[systemrdlDataType] = {systemrdlBasicDataType}
                                                                                      tmp[systemrdlDescription] = {
                                                                                                                    systemrdlComponentDef,
                                                                                                                    systemrdlConstraintDef,
                                                                                                                    systemrdlEnumDef,
                                                                                                                    systemrdlExplicitComponentInst,
                                                                                                                    systemrdlPropertyAssignment,
                                                                                                                    systemrdlPropertyDefinition,
                                                                                                                    systemrdlStructDef
                                                                                                                  }
                                                                                      tmp[systemrdlEnumBody] = {systemrdlEnumEntry}
                                                                                      tmp[systemrdlEnumDef] = {systemrdlEnumBody, systemrdlId}
                                                                                      tmp[systemrdlEnumEntry] = {systemrdlConstantExpression, systemrdlEnumPropertyAssignment, systemrdlId}
                                                                                      tmp[systemrdlEnumPropertyAssignment] = {systemrdlExplicitPropAssignment}
                                                                                      tmp[systemrdlEnumeratorLiteral] = {systemrdlId}
                                                                                      tmp[systemrdlExplicitComponentInst] = {systemrdlComponentInstAlias, systemrdlComponentInstType, systemrdlComponentInsts, systemrdlId}
                                                                                      tmp[systemrdlExplicitEncodeAssignment] = {systemrdlId}
                                                                                      tmp[systemrdlExplicitOrDefaultPropAssignment] = {systemrdlExplicitPropAssignment, systemrdlExplicitPropModifier}
                                                                                      tmp[systemrdlExplicitPropAssignment] = {systemrdlExplicitEncodeAssignment, systemrdlPropAssignmentLhs, systemrdlPropAssignmentRhs}
                                                                                      tmp[systemrdlExplicitPropModifier] = {systemrdlId, systemrdlPropMod}
                                                                                      tmp[systemrdlInstanceOrPropRef] = {systemrdlId, systemrdlInstanceRef, systemrdlPropKeyword}
                                                                                      tmp[systemrdlInstanceRef] = {systemrdlInstanceRefElement}
                                                                                      tmp[systemrdlInstanceRefElement] = {systemrdlArray, systemrdlId}
                                                                                      tmp[systemrdlIntegerType] = {systemrdlIntegerAtomType, systemrdlIntegerVectorType}
                                                                                      tmp[systemrdlParamDef] = {systemrdlParamDefElem}
                                                                                      tmp[systemrdlParamDefElem] = {systemrdlArrayType, systemrdlConstantExpression, systemrdlDataType, systemrdlId}
                                                                                      tmp[systemrdlParamElem] = {systemrdlId, systemrdlParamValue}
                                                                                      tmp[systemrdlParamInst] = {systemrdlParamElem}
                                                                                      tmp[systemrdlParamValue] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlPostEncodeAssignment] = {systemrdlId, systemrdlInstanceRef}
                                                                                      tmp[systemrdlPostPropAssignment] = {systemrdlPostEncodeAssignment, systemrdlPropAssignmentRhs, systemrdlPropRef}
                                                                                      tmp[systemrdlPrimaryLiteral] = {
                                                                                                                       systemrdlAccesstypeLiteral,
                                                                                                                       systemrdlAddressingtypeLiteral,
                                                                                                                       systemrdlBooleanLiteral,
                                                                                                                       systemrdlEnumeratorLiteral,
                                                                                                                       systemrdlNumber,
                                                                                                                       systemrdlOnreadtypeLiteral,
                                                                                                                       systemrdlOnwritetypeLiteral,
                                                                                                                       systemrdlStringLiteral
                                                                                                                     }
                                                                                      tmp[systemrdlPropAssignmentLhs] = {systemrdlId, systemrdlPropKeyword}
                                                                                      tmp[systemrdlPropAssignmentRhs] = {systemrdlConstantExpression, systemrdlPrecedencetypeLiteral}
                                                                                      tmp[systemrdlPropRef] = {systemrdlId, systemrdlInstanceRef, systemrdlPropKeyword}
                                                                                      tmp[systemrdlPropertyAssignment] = {systemrdlExplicitOrDefaultPropAssignment, systemrdlPostPropAssignment}
                                                                                      tmp[systemrdlPropertyAttribute] = {systemrdlPropertyConstraint, systemrdlPropertyDefault, systemrdlPropertyType, systemrdlPropertyUsage}
                                                                                      tmp[systemrdlPropertyBody] = {systemrdlPropertyAttribute}
                                                                                      tmp[systemrdlPropertyCompType] = {systemrdlComponentType}
                                                                                      tmp[systemrdlPropertyCompTypes] = {systemrdlPropertyCompType}
                                                                                      tmp[systemrdlPropertyConstraint] = {systemrdlPropertyConstraintType}
                                                                                      tmp[systemrdlPropertyDataType] = {systemrdlBasicDataType, systemrdlComponentPrimaryType}
                                                                                      tmp[systemrdlPropertyDefault] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlPropertyDefinition] = {systemrdlId, systemrdlPropertyBody}
                                                                                      tmp[systemrdlPropertyType] = {systemrdlArrayType, systemrdlPropertyDataType}
                                                                                      tmp[systemrdlPropertyUsage] = {systemrdlPropertyCompTypes}
                                                                                      tmp[systemrdlRange] = {systemrdlConstantExpression}
                                                                                      tmp[systemrdlSimpleType] = {systemrdlIntegerType}
                                                                                      tmp[systemrdlSourceFile] = {systemrdlDescription}
                                                                                      tmp[systemrdlStructBody] = {systemrdlStructElem}
                                                                                      tmp[systemrdlStructDef] = {systemrdlId, systemrdlStructBody}
                                                                                      tmp[systemrdlStructElem] = {systemrdlArrayType, systemrdlId, systemrdlStructType}
                                                                                      tmp[systemrdlStructLiteral] = {systemrdlId, systemrdlStructLiteralElem}
                                                                                      tmp[systemrdlStructLiteralElem] = {systemrdlConstantExpression, systemrdlId}
                                                                                      tmp[systemrdlStructType] = {systemrdlComponentType, systemrdlDataType}
                                                                                      tmp
const systemrdlTokenKinds*: set[SystemrdlNodeKind] = {
                                                       systemrdlExclamationTok,
                                                       systemrdlExclamationEqualTok,
                                                       systemrdlQuoteTok,
                                                       systemrdlHashTok,
                                                       systemrdlPercentTok,
                                                       systemrdlPercentEqualTok,
                                                       systemrdlAmpersandTok,
                                                       systemrdlDoubleAmpersandTok,
                                                       systemrdlApostropheTok,
                                                       systemrdlApostropheLCurlyTok,
                                                       systemrdlLParTok,
                                                       systemrdlRParTok,
                                                       systemrdlAsteriskTok,
                                                       systemrdlDoubleAsteriskTok,
                                                       systemrdlPlusTok,
                                                       systemrdlPlusEqualTok,
                                                       systemrdlCommaTok,
                                                       systemrdlMinusTok,
                                                       systemrdlMinusGreaterThanTok,
                                                       systemrdlDotTok,
                                                       systemrdlSlashTok,
                                                       systemrdlColonTok,
                                                       systemrdlDoubleColonTok,
                                                       systemrdlSemicolonTok,
                                                       systemrdlLessThanTok,
                                                       systemrdlDoubleLessThanTok,
                                                       systemrdlLessThanEqualTok,
                                                       systemrdlEqualTok,
                                                       systemrdlDoubleEqualTok,
                                                       systemrdlGreaterThanTok,
                                                       systemrdlGreaterThanEqualTok,
                                                       systemrdlDoubleGreaterThanTok,
                                                       systemrdlQuestionTok,
                                                       systemrdlAtTok,
                                                       systemrdlLBrackTok,
                                                       systemrdlRBrackTok,
                                                       systemrdlAccentTok,
                                                       systemrdlAccentTildeTok,
                                                       systemrdlAbstractTok,
                                                       systemrdlAccesstypeTok,
                                                       systemrdlAddressingtypeTok,
                                                       systemrdlAddrmapTok,
                                                       systemrdlAliasTok,
                                                       systemrdlAllTok,
                                                       systemrdlBooleanTok,
                                                       systemrdlBothedgeTok,
                                                       systemrdlClrTok,
                                                       systemrdlCompactTok,
                                                       systemrdlComponentTok,
                                                       systemrdlConstraintTok,
                                                       systemrdlDefaultTok,
                                                       systemrdlEncodeTok,
                                                       systemrdlEnumTok,
                                                       systemrdlExternalTok,
                                                       systemrdlFalseTok,
                                                       systemrdlFieldTok,
                                                       systemrdlFullalignTok,
                                                       systemrdlHwTok,
                                                       systemrdlInsideTok,
                                                       systemrdlInternalTok,
                                                       systemrdlLevelTok,
                                                       systemrdlMemTok,
                                                       systemrdlNaTok,
                                                       systemrdlNegedgeTok,
                                                       systemrdlNonstickyTok,
                                                       systemrdlNumberTok,
                                                       systemrdlOnreadtypeTok,
                                                       systemrdlOnwritetypeTok,
                                                       systemrdlPosedgeTok,
                                                       systemrdlPropertyTok,
                                                       systemrdlRTok,
                                                       systemrdlRclrTok,
                                                       systemrdlRefTok,
                                                       systemrdlRegTok,
                                                       systemrdlRegalignTok,
                                                       systemrdlRegfileTok,
                                                       systemrdlRsetTok,
                                                       systemrdlRuserTok,
                                                       systemrdlRwTok,
                                                       systemrdlRw1Tok,
                                                       systemrdlSignalTok,
                                                       systemrdlStringTok,
                                                       systemrdlStructTok,
                                                       systemrdlSwTok,
                                                       systemrdlThisTok,
                                                       systemrdlTrueTok,
                                                       systemrdlTypeTok,
                                                       systemrdlWTok,
                                                       systemrdlW1Tok,
                                                       systemrdlWclrTok,
                                                       systemrdlWoclrTok,
                                                       systemrdlWosetTok,
                                                       systemrdlWotTok,
                                                       systemrdlWrTok,
                                                       systemrdlWsetTok,
                                                       systemrdlWuserTok,
                                                       systemrdlWzcTok,
                                                       systemrdlWzsTok,
                                                       systemrdlWztTok,
                                                       systemrdlLCurlyTok,
                                                       systemrdlPipeTok,
                                                       systemrdlDoublePipeTok,
                                                       systemrdlRCurlyTok,
                                                       systemrdlTildeTok,
                                                       systemrdlTildeAmpersandTok,
                                                       systemrdlTildeAccentTok,
                                                       systemrdlTildePipeTok
                                                     }
const systemrdlHiddenKinds*: set[SystemrdlNodeKind] = {}
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


proc treeRepr*(node: TsSystemrdlNode, str: string): string =
  var res = addr result
  proc aux(node: TsSystemrdlNode, level: int) =
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


import
  hmisc / wrappers/treesitter_core
let systemrdlGrammar*: array[SystemrdlNodeKind, HtsRule[SystemrdlNodeKind]] = block:
                                                                                var rules: array[SystemrdlNodeKind, HtsRule[SystemrdlNodeKind]]
                                                                                type
                                                                                  K = SystemrdlNodeKind


                                                                                rules[systemrdlComponentPrimaryType] = tsChoice[K](tsString[K]("addrmap"), tsString[K]("regfile"), tsString[K]("reg"), tsString[K]("field"), tsString[K]("mem"))
                                                                                rules[systemrdlArrayLiteral] = tsSeq[K](tsString[K]("\'{"), tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlConstantExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlConstantExpression)))), tsBlank[K]()), tsString[K]("}"))
                                                                                rules[systemrdlConstraintDefExp] = tsSeq[K](tsSymbol[K](systemrdlId), tsSymbol[K](systemrdlConstraintBody), tsChoice[K](tsSymbol[K](systemrdlConstraintInsts), tsBlank[K]()))
                                                                                rules[systemrdlComponentAnonDef] = tsSeq[K](tsSymbol[K](systemrdlComponentType), tsSymbol[K](systemrdlComponentBody))
                                                                                rules[systemrdlPropertyConstraint] = tsSeq[K](tsString[K]("constraint"), tsString[K]("="), tsSymbol[K](systemrdlPropertyConstraintType), tsString[K](";"))
                                                                                rules[systemrdlStructBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](systemrdlStructElem)), tsString[K]("}"))
                                                                                rules[systemrdlParamInst] = tsSeq[K](tsString[K]("#"), tsString[K]("("), tsSeq[K](tsSymbol[K](systemrdlParamElem), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlParamElem)))), tsString[K](")"))
                                                                                rules[systemrdlStructLiteral] = tsSeq[K](tsSymbol[K](systemrdlId), tsString[K]("\'{"), tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlStructLiteralElem), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlStructLiteralElem)))), tsBlank[K]()), tsString[K]("}"))
                                                                                rules[systemrdlEnumeratorLiteral] = tsSeq[K](tsSymbol[K](systemrdlId), tsString[K]("::"), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlStructType] = tsChoice[K](tsSymbol[K](systemrdlDataType), tsSymbol[K](systemrdlComponentType))
                                                                                rules[systemrdlPropertyType] = tsSeq[K](tsString[K]("type"), tsString[K]("="), tsSymbol[K](systemrdlPropertyDataType), tsChoice[K](tsSymbol[K](systemrdlArrayType), tsBlank[K]()), tsString[K](";"))
                                                                                rules[systemrdlPropertyDefault] = tsSeq[K](tsString[K]("default"), tsString[K]("="), tsSymbol[K](systemrdlConstantExpression), tsString[K](";"))
                                                                                rules[systemrdlPropAssignmentLhs] = tsChoice[K](tsSymbol[K](systemrdlPropKeyword), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlBooleanLiteral] = tsChoice[K](tsString[K]("true"), tsString[K]("false"))
                                                                                rules[systemrdlPropertyAttribute] = tsChoice[K](tsSymbol[K](systemrdlPropertyType), tsSymbol[K](systemrdlPropertyUsage), tsSymbol[K](systemrdlPropertyDefault), tsSymbol[K](systemrdlPropertyConstraint))
                                                                                rules[systemrdlComponentBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](systemrdlComponentBodyElem)), tsString[K]("}"))
                                                                                rules[systemrdlStructLiteralElem] = tsSeq[K](tsSymbol[K](systemrdlId), tsString[K](":"), tsSymbol[K](systemrdlConstantExpression))
                                                                                rules[systemrdlExplicitPropAssignment] = tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlPropAssignmentLhs), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](systemrdlPropAssignmentRhs)), tsBlank[K]())), tsSymbol[K](systemrdlExplicitEncodeAssignment))
                                                                                rules[systemrdlPropertyBody] = tsRepeat1[K](tsSymbol[K](systemrdlPropertyAttribute))
                                                                                rules[systemrdlConstraintInsts] = tsSeq[K](tsSymbol[K](systemrdlId), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlId))))
                                                                                rules[systemrdlPropRef] = tsSeq[K](tsSymbol[K](systemrdlInstanceRef), tsString[K]("->"), tsChoice[K](tsSymbol[K](systemrdlPropKeyword), tsSymbol[K](systemrdlId)))
                                                                                rules[systemrdlBasicDataType] = tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlSimpleType), tsChoice[K](tsSymbol[K](systemrdlSigning), tsBlank[K]())), tsString[K]("string"), tsString[K]("boolean"), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlPostEncodeAssignment] = tsSeq[K](tsSymbol[K](systemrdlInstanceRef), tsString[K]("->"), tsString[K]("encode"), tsString[K]("="), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlDataType] = tsChoice[K](tsSymbol[K](systemrdlBasicDataType), tsString[K]("accesstype"), tsString[K]("addressingtype"), tsString[K]("onreadtype"), tsString[K]("onwritetype"))
                                                                                rules[systemrdlConstraintElem] = tsChoice[K](tsSymbol[K](systemrdlConstantExpression), tsSymbol[K](systemrdlConstraintPropAssignment), tsSeq[K](tsSymbol[K](systemrdlConstraintLhs), tsString[K]("inside"), tsString[K]("{"), tsSymbol[K](systemrdlConstraintValues), tsString[K]("}")), tsSeq[K](tsSymbol[K](systemrdlConstraintLhs), tsString[K]("inside"), tsSymbol[K](systemrdlId)))
                                                                                rules[systemrdlExplicitPropModifier] = tsSeq[K](tsSymbol[K](systemrdlPropMod), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlComponentInstArrayOrRange] = tsChoice[K](tsRepeat1[K](tsSymbol[K](systemrdlArray)), tsSymbol[K](systemrdlRange))
                                                                                rules[systemrdlEnumPropertyAssignment] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSeq[K](tsSymbol[K](systemrdlExplicitPropAssignment), tsString[K](";"))), tsString[K]("}"))
                                                                                rules[systemrdlSourceFile] = tsRepeat[K](tsSymbol[K](systemrdlDescription))
                                                                                rules[systemrdlParamElem] = tsSeq[K](tsString[K]("."), tsSymbol[K](systemrdlId), tsString[K]("("), tsSymbol[K](systemrdlParamValue), tsString[K](")"))
                                                                                rules[systemrdlArrayType] = tsSeq[K](tsString[K]("["), tsString[K]("]"))
                                                                                rules[systemrdlComment] = tsChoice[K](tsSeq[K](tsString[K]("//"), tsRegex[K](".*")), tsSeq[K](tsString[K]("/*"), tsRegex[K]("[^*]*\\*+([^/*][^*]*\\*+)*"), tsString[K]("/")))
                                                                                rules[systemrdlPropertyDataType] = tsChoice[K](tsSymbol[K](systemrdlComponentPrimaryType), tsString[K]("ref"), tsString[K]("number"), tsSymbol[K](systemrdlBasicDataType))
                                                                                rules[systemrdlSigning] = tsString[K]("unsigned")
                                                                                rules[systemrdlConstraintDef] = tsChoice[K](tsSeq[K](tsString[K]("constraint"), tsSymbol[K](systemrdlConstraintDefExp), tsString[K](";")), tsSeq[K](tsString[K]("constraint"), tsSymbol[K](systemrdlConstraintDefAnon), tsString[K](";")))
                                                                                rules[systemrdlPropertyDefinition] = tsSeq[K](tsString[K]("property"), tsSymbol[K](systemrdlId), tsString[K]("{"), tsSymbol[K](systemrdlPropertyBody), tsString[K]("}"), tsString[K](";"))
                                                                                rules[systemrdlComponentInst] = tsSeq[K](tsSymbol[K](systemrdlId), tsChoice[K](tsSymbol[K](systemrdlComponentInstArrayOrRange), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("@"), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("+="), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("%="), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()))
                                                                                rules[systemrdlStructElem] = tsSeq[K](tsSymbol[K](systemrdlStructType), tsSymbol[K](systemrdlId), tsChoice[K](tsSymbol[K](systemrdlArrayType), tsBlank[K]()), tsString[K](";"))
                                                                                rules[systemrdlConstantExpression] = tsChoice[K](tsSymbol[K](systemrdlConstantPrimary), tsSeq[K](tsSymbol[K](systemrdlUnaryOperator), tsSymbol[K](systemrdlConstantPrimary)), tsSeq[K](tsSymbol[K](systemrdlConstantExpression), tsSymbol[K](systemrdlBinaryOperator), tsSymbol[K](systemrdlConstantExpression)), tsSeq[K](tsSymbol[K](systemrdlConstantExpression), tsString[K]("?"), tsSymbol[K](systemrdlConstantExpression), tsString[K](":"), tsSymbol[K](systemrdlConstantExpression)))
                                                                                rules[systemrdlExplicitEncodeAssignment] = tsSeq[K](tsString[K]("encode"), tsString[K]("="), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlDescription] = tsChoice[K](tsSymbol[K](systemrdlComponentDef), tsSymbol[K](systemrdlEnumDef), tsSymbol[K](systemrdlPropertyDefinition), tsSymbol[K](systemrdlStructDef), tsSymbol[K](systemrdlConstraintDef), tsSymbol[K](systemrdlExplicitComponentInst), tsSymbol[K](systemrdlPropertyAssignment))
                                                                                rules[systemrdlPropMod] = tsChoice[K](tsString[K]("posedge"), tsString[K]("negedge"), tsString[K]("bothedge"), tsString[K]("level"), tsString[K]("nonsticky"))
                                                                                rules[systemrdlInstanceRefElement] = tsSeq[K](tsSymbol[K](systemrdlId), tsRepeat[K](tsSymbol[K](systemrdlArray)))
                                                                                rules[systemrdlComponentInstType] = tsChoice[K](tsString[K]("external"), tsString[K]("internal"))
                                                                                rules[systemrdlBinaryOperator] = tsChoice[K](tsString[K]("&&"), tsString[K]("||"), tsString[K]("<"), tsString[K](">"), tsString[K]("<="), tsString[K](">="), tsString[K]("=="), tsString[K]("!="), tsString[K](">>"), tsString[K]("<<"), tsString[K]("&"), tsString[K]("|"), tsString[K]("^"), tsString[K]("~^"), tsString[K]("^~"), tsString[K]("*"), tsString[K]("/"), tsString[K]("%"), tsString[K]("+"), tsString[K]("-"), tsString[K]("**"))
                                                                                rules[systemrdlComponentDef] = tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlComponentNamedDef), tsSymbol[K](systemrdlComponentInstType), tsSymbol[K](systemrdlComponentInsts), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlComponentAnonDef), tsSymbol[K](systemrdlComponentInstType), tsSymbol[K](systemrdlComponentInsts), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlComponentNamedDef), tsChoice[K](tsSymbol[K](systemrdlComponentInsts), tsBlank[K]()), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlComponentAnonDef), tsSymbol[K](systemrdlComponentInsts), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlComponentInstType), tsSymbol[K](systemrdlComponentNamedDef), tsSymbol[K](systemrdlComponentInsts), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlComponentInstType), tsSymbol[K](systemrdlComponentAnonDef), tsSymbol[K](systemrdlComponentInsts), tsString[K](";")))
                                                                                rules[systemrdlPropertyCompType] = tsChoice[K](tsSymbol[K](systemrdlComponentType), tsString[K]("constraint"), tsString[K]("all"))
                                                                                rules[systemrdlEnumEntry] = tsSeq[K](tsSymbol[K](systemrdlId), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()), tsChoice[K](tsSymbol[K](systemrdlEnumPropertyAssignment), tsBlank[K]()), tsString[K](";"))
                                                                                rules[systemrdlParamDefElem] = tsSeq[K](tsSymbol[K](systemrdlDataType), tsSymbol[K](systemrdlId), tsChoice[K](tsSymbol[K](systemrdlArrayType), tsBlank[K]()), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](systemrdlConstantExpression)), tsBlank[K]()))
                                                                                rules[systemrdlInstanceOrPropRef] = tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlInstanceRef), tsString[K]("->"), tsSymbol[K](systemrdlPropKeyword)), tsSeq[K](tsSymbol[K](systemrdlInstanceRef), tsString[K]("->"), tsSymbol[K](systemrdlId)), tsSymbol[K](systemrdlInstanceRef))
                                                                                rules[systemrdlPropertyUsage] = tsSeq[K](tsString[K]("component"), tsString[K]("="), tsSymbol[K](systemrdlPropertyCompTypes), tsString[K](";"))
                                                                                rules[systemrdlOnreadtypeLiteral] = tsChoice[K](tsString[K]("clr"), tsString[K]("rset"), tsString[K]("ruser"))
                                                                                rules[systemrdlConstraintPropAssignment] = tsSeq[K](tsSymbol[K](systemrdlId), tsString[K]("="), tsSymbol[K](systemrdlConstantExpression))
                                                                                rules[systemrdlPrimaryLiteral] = tsChoice[K](tsSymbol[K](systemrdlNumber), tsSymbol[K](systemrdlStringLiteral), tsSymbol[K](systemrdlBooleanLiteral), tsSymbol[K](systemrdlAccesstypeLiteral), tsSymbol[K](systemrdlOnreadtypeLiteral), tsSymbol[K](systemrdlOnwritetypeLiteral), tsSymbol[K](systemrdlAddressingtypeLiteral), tsSymbol[K](systemrdlEnumeratorLiteral), tsString[K]("this"))
                                                                                rules[systemrdlAccesstypeLiteral] = tsChoice[K](tsString[K]("na"), tsString[K]("rw"), tsString[K]("wr"), tsString[K]("r"), tsString[K]("w"), tsString[K]("rw1"), tsString[K]("w1"))
                                                                                rules[systemrdlConstraintValue] = tsChoice[K](tsSymbol[K](systemrdlConstantExpression), tsSeq[K](tsString[K]("["), tsSymbol[K](systemrdlConstantExpression), tsString[K](":"), tsSymbol[K](systemrdlConstantExpression), tsString[K]("]")))
                                                                                rules[systemrdlRange] = tsSeq[K](tsString[K]("["), tsSymbol[K](systemrdlConstantExpression), tsString[K](":"), tsSymbol[K](systemrdlConstantExpression), tsString[K]("]"))
                                                                                rules[systemrdlStringLiteral] = tsSeq[K](tsString[K]("\""), tsRepeat[K](tsChoice[K](tsRegex[K]("[^\\\\\"]+"), tsSeq[K](tsString[K]("\\"), tsRegex[K](".")))), tsString[K]("\""))
                                                                                rules[systemrdlExplicitOrDefaultPropAssignment] = tsChoice[K](tsSeq[K](tsChoice[K](tsString[K]("default"), tsBlank[K]()), tsSymbol[K](systemrdlExplicitPropModifier), tsString[K](";")), tsSeq[K](tsChoice[K](tsString[K]("default"), tsBlank[K]()), tsSymbol[K](systemrdlExplicitPropAssignment), tsString[K](";")))
                                                                                rules[systemrdlSimpleType] = tsSymbol[K](systemrdlIntegerType)
                                                                                rules[systemrdlTemplate] = tsSeq[K](tsString[K]("<%"), tsRegex[K]("[^%]+"), tsString[K]("%>"))
                                                                                rules[systemrdlComponentInstAlias] = tsSeq[K](tsString[K]("alias"), tsSymbol[K](systemrdlId))
                                                                                rules[systemrdlExplicitComponentInst] = tsSeq[K](tsChoice[K](tsSymbol[K](systemrdlComponentInstType), tsBlank[K]()), tsChoice[K](tsSymbol[K](systemrdlComponentInstAlias), tsBlank[K]()), tsSymbol[K](systemrdlId), tsSymbol[K](systemrdlComponentInsts), tsString[K](";"))
                                                                                rules[systemrdlPropAssignmentRhs] = tsChoice[K](tsSymbol[K](systemrdlConstantExpression), tsSymbol[K](systemrdlPrecedencetypeLiteral))
                                                                                rules[systemrdlConstraintBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSeq[K](tsSymbol[K](systemrdlConstraintElem), tsString[K](";"))), tsString[K]("}"))
                                                                                rules[systemrdlConstraintLhs] = tsChoice[K](tsString[K]("this"), tsSymbol[K](systemrdlInstanceRef))
                                                                                rules[systemrdlIntegerType] = tsChoice[K](tsSymbol[K](systemrdlIntegerVectorType), tsSymbol[K](systemrdlIntegerAtomType))
                                                                                rules[systemrdlPropertyConstraintType] = tsString[K]("componentwidth")
                                                                                rules[systemrdlInstanceRef] = tsSeq[K](tsSymbol[K](systemrdlInstanceRefElement), tsRepeat[K](tsSeq[K](tsString[K]("."), tsSymbol[K](systemrdlInstanceRefElement))))
                                                                                rules[systemrdlParamValue] = tsSymbol[K](systemrdlConstantExpression)
                                                                                rules[systemrdlParamDef] = tsSeq[K](tsString[K]("#"), tsString[K]("("), tsSeq[K](tsSymbol[K](systemrdlParamDefElem), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlParamDefElem)))), tsString[K](")"))
                                                                                rules[systemrdlPrecedencetypeLiteral] = tsChoice[K](tsString[K]("hw"), tsString[K]("sw"))
                                                                                rules[systemrdlComponentType] = tsChoice[K](tsSymbol[K](systemrdlComponentPrimaryType), tsString[K]("signal"))
                                                                                rules[systemrdlEnumBody] = tsSeq[K](tsString[K]("{"), tsRepeat[K](tsSymbol[K](systemrdlEnumEntry)), tsString[K]("}"))
                                                                                rules[systemrdlComponentInsts] = tsSeq[K](tsChoice[K](tsSymbol[K](systemrdlParamInst), tsBlank[K]()), tsSeq[K](tsSymbol[K](systemrdlComponentInst), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlComponentInst)))))
                                                                                rules[systemrdlConstraintDefAnon] = tsSeq[K](tsSymbol[K](systemrdlConstraintBody), tsSymbol[K](systemrdlConstraintInsts))
                                                                                rules[systemrdlComponentNamedDef] = tsSeq[K](tsSymbol[K](systemrdlComponentType), tsSymbol[K](systemrdlId), tsChoice[K](tsSymbol[K](systemrdlParamDef), tsBlank[K]()), tsSymbol[K](systemrdlComponentBody))
                                                                                rules[systemrdlAddressingtypeLiteral] = tsChoice[K](tsString[K]("compact"), tsString[K]("regalign"), tsString[K]("fullalign"))
                                                                                rules[systemrdlConstantCast] = tsSeq[K](tsSymbol[K](systemrdlCastingType), tsString[K]("\'"), tsString[K]("("), tsSymbol[K](systemrdlConstantExpression), tsString[K](")"))
                                                                                rules[systemrdlConstantPrimary] = tsChoice[K](tsSymbol[K](systemrdlPrimaryLiteral), tsSymbol[K](systemrdlConstantConcatenation), tsSymbol[K](systemrdlConstantMultipleConcatenation), tsSeq[K](tsString[K]("("), tsSymbol[K](systemrdlConstantExpression), tsString[K](")")), tsSymbol[K](systemrdlConstantCast), tsSymbol[K](systemrdlInstanceOrPropRef), tsSymbol[K](systemrdlStructLiteral), tsSymbol[K](systemrdlArrayLiteral))
                                                                                rules[systemrdlPropertyCompTypes] = tsSeq[K](tsSymbol[K](systemrdlPropertyCompType), tsRepeat[K](tsSeq[K](tsString[K]("|"), tsSymbol[K](systemrdlPropertyCompType))))
                                                                                rules[systemrdlEnumDef] = tsSeq[K](tsString[K]("enum"), tsSymbol[K](systemrdlId), tsSymbol[K](systemrdlEnumBody), tsString[K](";"))
                                                                                rules[systemrdlIntegerAtomType] = tsString[K]("longint")
                                                                                rules[systemrdlPostPropAssignment] = tsChoice[K](tsSeq[K](tsSymbol[K](systemrdlPropRef), tsChoice[K](tsSeq[K](tsString[K]("="), tsSymbol[K](systemrdlPropAssignmentRhs)), tsBlank[K]()), tsString[K](";")), tsSeq[K](tsSymbol[K](systemrdlPostEncodeAssignment), tsString[K](";")))
                                                                                rules[systemrdlUnaryOperator] = tsChoice[K](tsString[K]("!"), tsString[K]("+"), tsString[K]("-"), tsString[K]("~"), tsString[K]("&"), tsString[K]("~&"), tsString[K]("|"), tsString[K]("~|"), tsString[K]("^"), tsString[K]("~^"), tsString[K]("^~"))
                                                                                rules[systemrdlNumber] = tsChoice[K](tsRegex[K]("\\d+"), tsRegex[K]("0[xX][0-9a-fA-f]+"), tsRegex[K]("[0-9]+\'[bB][01_]+"), tsRegex[K]("[0-9]+\'[dD][0-9_]+"), tsRegex[K]("[0-9]+\'[hH][0-9a-fA-f_]+"))
                                                                                rules[systemrdlOnwritetypeLiteral] = tsChoice[K](tsString[K]("woset"), tsString[K]("woclr"), tsString[K]("wot"), tsString[K]("wzs"), tsString[K]("wzc"), tsString[K]("wzt"), tsString[K]("wclr"), tsString[K]("wset"), tsString[K]("wuser"))
                                                                                rules[systemrdlCastingType] = tsChoice[K](tsSymbol[K](systemrdlSimpleType), tsSymbol[K](systemrdlConstantPrimary), tsString[K]("boolean"))
                                                                                rules[systemrdlConstantConcatenation] = tsSeq[K](tsString[K]("{"), tsSeq[K](tsSymbol[K](systemrdlConstantExpression), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlConstantExpression)))), tsString[K]("}"))
                                                                                rules[systemrdlId] = tsRegex[K]("[a-zA-Z_]\\w*")
                                                                                rules[systemrdlStructDef] = tsSeq[K](tsChoice[K](tsString[K]("abstract"), tsBlank[K]()), tsString[K]("struct"), tsSymbol[K](systemrdlId), tsChoice[K](tsSeq[K](tsString[K](":"), tsSymbol[K](systemrdlId)), tsBlank[K]()), tsSymbol[K](systemrdlStructBody), tsString[K](";"))
                                                                                rules[systemrdlConstraintValues] = tsSeq[K](tsSymbol[K](systemrdlConstraintValue), tsRepeat[K](tsSeq[K](tsString[K](","), tsSymbol[K](systemrdlConstraintValue))))
                                                                                rules[systemrdlComponentBodyElem] = tsChoice[K](tsSymbol[K](systemrdlComponentDef), tsSymbol[K](systemrdlEnumDef), tsSymbol[K](systemrdlStructDef), tsSymbol[K](systemrdlConstraintDef), tsSymbol[K](systemrdlExplicitComponentInst), tsSymbol[K](systemrdlPropertyAssignment))
                                                                                rules[systemrdlArray] = tsSeq[K](tsString[K]("["), tsSymbol[K](systemrdlConstantExpression), tsString[K]("]"))
                                                                                rules[systemrdlConstantMultipleConcatenation] = tsSeq[K](tsString[K]("{"), tsSymbol[K](systemrdlConstantExpression), tsSymbol[K](systemrdlConstantConcatenation), tsString[K]("}"))
                                                                                rules[systemrdlIntegerVectorType] = tsString[K]("bit")
                                                                                rules[systemrdlPropertyAssignment] = tsChoice[K](tsSymbol[K](systemrdlExplicitOrDefaultPropAssignment), tsSymbol[K](systemrdlPostPropAssignment))
                                                                                rules[systemrdlPropKeyword] = tsChoice[K](tsString[K]("sw"), tsString[K]("hw"), tsString[K]("rclr"), tsString[K]("rset"), tsString[K]("woclr"), tsString[K]("woset"))
                                                                                rules

