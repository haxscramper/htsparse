import
  hmisc / wrappers/treesitter_core
export treesitter_core

type
  GraphqlNodeKind* = enum
    graphqlAlias                       ## alias
    graphqlArgument                    ## argument
    graphqlArguments                   ## arguments
    graphqlArgumentsDefinition         ## arguments_definition
    graphqlBooleanValue                ## boolean_value
    graphqlDefaultValue                ## default_value
    graphqlDefinition                  ## definition
    graphqlDescription                 ## description
    graphqlDirective                   ## directive
    graphqlDirectiveDefinition         ## directive_definition
    graphqlDirectiveLocation           ## directive_location
    graphqlDirectiveLocations          ## directive_locations
    graphqlDirectives                  ## directives
    graphqlDocument                    ## document
    graphqlEnumTypeDefinition          ## enum_type_definition
    graphqlEnumTypeExtension           ## enum_type_extension
    graphqlEnumValue                   ## enum_value
    graphqlEnumValueDefinition         ## enum_value_definition
    graphqlEnumValuesDefinition        ## enum_values_definition
    graphqlExecutableDefinition        ## executable_definition
    graphqlExecutableDirectiveLocation ## executable_directive_location
    graphqlField                       ## field
    graphqlFieldDefinition             ## field_definition
    graphqlFieldsDefinition            ## fields_definition
    graphqlFragmentDefinition          ## fragment_definition
    graphqlFragmentName                ## fragment_name
    graphqlFragmentSpread              ## fragment_spread
    graphqlImplementsInterfaces        ## implements_interfaces
    graphqlInlineFragment              ## inline_fragment
    graphqlInputFieldsDefinition       ## input_fields_definition
    graphqlInputObjectTypeDefinition   ## input_object_type_definition
    graphqlInputObjectTypeExtension    ## input_object_type_extension
    graphqlInputValueDefinition        ## input_value_definition
    graphqlInterfaceTypeDefinition     ## interface_type_definition
    graphqlInterfaceTypeExtension      ## interface_type_extension
    graphqlListType                    ## list_type
    graphqlListValue                   ## list_value
    graphqlNamedType                   ## named_type
    graphqlNonNullType                 ## non_null_type
    graphqlObjectField                 ## object_field
    graphqlObjectTypeDefinition        ## object_type_definition
    graphqlObjectTypeExtension         ## object_type_extension
    graphqlObjectValue                 ## object_value
    graphqlOperationDefinition         ## operation_definition
    graphqlOperationType               ## operation_type
    graphqlRootOperationTypeDefinition ## root_operation_type_definition
    graphqlScalarTypeDefinition        ## scalar_type_definition
    graphqlScalarTypeExtension         ## scalar_type_extension
    graphqlSchemaDefinition            ## schema_definition
    graphqlSchemaExtension             ## schema_extension
    graphqlSelection                   ## selection
    graphqlSelectionSet                ## selection_set
    graphqlSourceFile                  ## source_file
    graphqlStringValue                 ## string_value
    graphqlType                        ## type
    graphqlTypeCondition               ## type_condition
    graphqlTypeDefinition              ## type_definition
    graphqlTypeExtension               ## type_extension
    graphqlTypeSystemDefinition        ## type_system_definition
    graphqlTypeSystemDirectiveLocation ## type_system_directive_location
    graphqlTypeSystemExtension         ## type_system_extension
    graphqlUnionMemberTypes            ## union_member_types
    graphqlUnionTypeDefinition         ## union_type_definition
    graphqlUnionTypeExtension          ## union_type_extension
    graphqlValue                       ## value
    graphqlVariable                    ## variable
    graphqlVariableDefinition          ## variable_definition
    graphqlVariableDefinitions         ## variable_definitions
    graphqlExclamationTok              ## !
    graphqlQuoteTok                    ## "
    graphqlTripleQuoteTok              ## """
    graphqlDollarTok                   ## $
    graphqlAmpersandTok                ## &
    graphqlLParTok                     ## (
    graphqlRParTok                     ## )
    graphqlTripleDotTok                ## ...
    graphqlColonTok                    ## :
    graphqlEqualTok                    ## =
    graphqlAtTok                       ## @
    graphqlARGUMENTDEFINITIONTok       ## ARGUMENT_DEFINITION
    graphqlENUMTok                     ## ENUM
    graphqlENUMVALUETok                ## ENUM_VALUE
    graphqlFIELDTok                    ## FIELD
    graphqlFIELDDEFINITIONTok          ## FIELD_DEFINITION
    graphqlFRAGMENTDEFINITIONTok       ## FRAGMENT_DEFINITION
    graphqlFRAGMENTSPREADTok           ## FRAGMENT_SPREAD
    graphqlINLINEFRAGMENTTok           ## INLINE_FRAGMENT
    graphqlINPUTFIELDDEFINITIONTok     ## INPUT_FIELD_DEFINITION
    graphqlINPUTOBJECTTok              ## INPUT_OBJECT
    graphqlINTERFACETok                ## INTERFACE
    graphqlMUTATIONTok                 ## MUTATION
    graphqlOBJECTTok                   ## OBJECT
    graphqlQUERYTok                    ## QUERY
    graphqlSCALARTok                   ## SCALAR
    graphqlSCHEMATok                   ## SCHEMA
    graphqlSUBSCRIPTIONTok             ## SUBSCRIPTION
    graphqlUNIONTok                    ## UNION
    graphqlVARIABLEDEFINITIONTok       ## VARIABLE_DEFINITION
    graphqlLBrackTok                   ## [
    graphqlRBrackTok                   ## ]
    graphqlComma                       ## comma
    graphqlComment                     ## comment
    graphqlDirectiveTok                ## directive
    graphqlEnumTok1                    ## enum
    graphqlExtendTok                   ## extend
    graphqlFalseTok                    ## false
    graphqlFloatValue                  ## float_value
    graphqlFragmentTok                 ## fragment
    graphqlImplementsTok               ## implements
    graphqlInputTok                    ## input
    graphqlIntValue                    ## int_value
    graphqlInterfaceTok1               ## interface
    graphqlMutationTok1                ## mutation
    graphqlName                        ## name
    graphqlNullValue                   ## null_value
    graphqlOnTok                       ## on
    graphqlQueryTok1                   ## query
    graphqlRepeatableTok               ## repeatable
    graphqlScalarTok1                  ## scalar
    graphqlSchemaTok1                  ## schema
    graphqlSubscriptionTok1            ## subscription
    graphqlTrueTok                     ## true
    graphqlTypeTok                     ## type
    graphqlUnionTok1                   ## union
    graphqlLCurlyTok                   ## {
    graphqlPipeTok                     ## |
    graphqlRCurlyTok                   ## }
    graphqlSyntaxError                 ## Tree-sitter parser syntax error


proc strRepr*(kind: GraphqlNodeKind): string =
  case kind:
    of graphqlAlias:                       "alias"
    of graphqlArgument:                    "argument"
    of graphqlArguments:                   "arguments"
    of graphqlArgumentsDefinition:         "arguments_definition"
    of graphqlBooleanValue:                "boolean_value"
    of graphqlDefaultValue:                "default_value"
    of graphqlDefinition:                  "definition"
    of graphqlDescription:                 "description"
    of graphqlDirective:                   "directive"
    of graphqlDirectiveDefinition:         "directive_definition"
    of graphqlDirectiveLocation:           "directive_location"
    of graphqlDirectiveLocations:          "directive_locations"
    of graphqlDirectives:                  "directives"
    of graphqlDocument:                    "document"
    of graphqlEnumTypeDefinition:          "enum_type_definition"
    of graphqlEnumTypeExtension:           "enum_type_extension"
    of graphqlEnumValue:                   "enum_value"
    of graphqlEnumValueDefinition:         "enum_value_definition"
    of graphqlEnumValuesDefinition:        "enum_values_definition"
    of graphqlExecutableDefinition:        "executable_definition"
    of graphqlExecutableDirectiveLocation: "executable_directive_location"
    of graphqlField:                       "field"
    of graphqlFieldDefinition:             "field_definition"
    of graphqlFieldsDefinition:            "fields_definition"
    of graphqlFragmentDefinition:          "fragment_definition"
    of graphqlFragmentName:                "fragment_name"
    of graphqlFragmentSpread:              "fragment_spread"
    of graphqlImplementsInterfaces:        "implements_interfaces"
    of graphqlInlineFragment:              "inline_fragment"
    of graphqlInputFieldsDefinition:       "input_fields_definition"
    of graphqlInputObjectTypeDefinition:   "input_object_type_definition"
    of graphqlInputObjectTypeExtension:    "input_object_type_extension"
    of graphqlInputValueDefinition:        "input_value_definition"
    of graphqlInterfaceTypeDefinition:     "interface_type_definition"
    of graphqlInterfaceTypeExtension:      "interface_type_extension"
    of graphqlListType:                    "list_type"
    of graphqlListValue:                   "list_value"
    of graphqlNamedType:                   "named_type"
    of graphqlNonNullType:                 "non_null_type"
    of graphqlObjectField:                 "object_field"
    of graphqlObjectTypeDefinition:        "object_type_definition"
    of graphqlObjectTypeExtension:         "object_type_extension"
    of graphqlObjectValue:                 "object_value"
    of graphqlOperationDefinition:         "operation_definition"
    of graphqlOperationType:               "operation_type"
    of graphqlRootOperationTypeDefinition: "root_operation_type_definition"
    of graphqlScalarTypeDefinition:        "scalar_type_definition"
    of graphqlScalarTypeExtension:         "scalar_type_extension"
    of graphqlSchemaDefinition:            "schema_definition"
    of graphqlSchemaExtension:             "schema_extension"
    of graphqlSelection:                   "selection"
    of graphqlSelectionSet:                "selection_set"
    of graphqlSourceFile:                  "source_file"
    of graphqlStringValue:                 "string_value"
    of graphqlType:                        "type"
    of graphqlTypeCondition:               "type_condition"
    of graphqlTypeDefinition:              "type_definition"
    of graphqlTypeExtension:               "type_extension"
    of graphqlTypeSystemDefinition:        "type_system_definition"
    of graphqlTypeSystemDirectiveLocation: "type_system_directive_location"
    of graphqlTypeSystemExtension:         "type_system_extension"
    of graphqlUnionMemberTypes:            "union_member_types"
    of graphqlUnionTypeDefinition:         "union_type_definition"
    of graphqlUnionTypeExtension:          "union_type_extension"
    of graphqlValue:                       "value"
    of graphqlVariable:                    "variable"
    of graphqlVariableDefinition:          "variable_definition"
    of graphqlVariableDefinitions:         "variable_definitions"
    of graphqlExclamationTok:              "!"
    of graphqlQuoteTok:                    "\""
    of graphqlTripleQuoteTok:              "\"\"\""
    of graphqlDollarTok:                   "$"
    of graphqlAmpersandTok:                "&"
    of graphqlLParTok:                     "("
    of graphqlRParTok:                     ")"
    of graphqlTripleDotTok:                "..."
    of graphqlColonTok:                    ":"
    of graphqlEqualTok:                    "="
    of graphqlAtTok:                       "@"
    of graphqlARGUMENTDEFINITIONTok:       "ARGUMENT_DEFINITION"
    of graphqlENUMTok:                     "ENUM"
    of graphqlENUMVALUETok:                "ENUM_VALUE"
    of graphqlFIELDTok:                    "FIELD"
    of graphqlFIELDDEFINITIONTok:          "FIELD_DEFINITION"
    of graphqlFRAGMENTDEFINITIONTok:       "FRAGMENT_DEFINITION"
    of graphqlFRAGMENTSPREADTok:           "FRAGMENT_SPREAD"
    of graphqlINLINEFRAGMENTTok:           "INLINE_FRAGMENT"
    of graphqlINPUTFIELDDEFINITIONTok:     "INPUT_FIELD_DEFINITION"
    of graphqlINPUTOBJECTTok:              "INPUT_OBJECT"
    of graphqlINTERFACETok:                "INTERFACE"
    of graphqlMUTATIONTok:                 "MUTATION"
    of graphqlOBJECTTok:                   "OBJECT"
    of graphqlQUERYTok:                    "QUERY"
    of graphqlSCALARTok:                   "SCALAR"
    of graphqlSCHEMATok:                   "SCHEMA"
    of graphqlSUBSCRIPTIONTok:             "SUBSCRIPTION"
    of graphqlUNIONTok:                    "UNION"
    of graphqlVARIABLEDEFINITIONTok:       "VARIABLE_DEFINITION"
    of graphqlLBrackTok:                   "["
    of graphqlRBrackTok:                   "]"
    of graphqlComma:                       "comma"
    of graphqlComment:                     "comment"
    of graphqlDirectiveTok:                "directive"
    of graphqlEnumTok1:                    "enum"
    of graphqlExtendTok:                   "extend"
    of graphqlFalseTok:                    "false"
    of graphqlFloatValue:                  "float_value"
    of graphqlFragmentTok:                 "fragment"
    of graphqlImplementsTok:               "implements"
    of graphqlInputTok:                    "input"
    of graphqlIntValue:                    "int_value"
    of graphqlInterfaceTok1:               "interface"
    of graphqlMutationTok1:                "mutation"
    of graphqlName:                        "name"
    of graphqlNullValue:                   "null_value"
    of graphqlOnTok:                       "on"
    of graphqlQueryTok1:                   "query"
    of graphqlRepeatableTok:               "repeatable"
    of graphqlScalarTok1:                  "scalar"
    of graphqlSchemaTok1:                  "schema"
    of graphqlSubscriptionTok1:            "subscription"
    of graphqlTrueTok:                     "true"
    of graphqlTypeTok:                     "type"
    of graphqlUnionTok1:                   "union"
    of graphqlLCurlyTok:                   "{"
    of graphqlPipeTok:                     "|"
    of graphqlRCurlyTok:                   "}"
    of graphqlSyntaxError:                 "ERROR"


type
  TsGraphqlNode* = distinct TSNode


type
  GraphqlParser* = distinct PtsParser


const graphqlAllowedSubnodes*: array[GraphqlNodeKind, set[GraphqlNodeKind]] = block:
                                                                                var tmp: array[GraphqlNodeKind, set[GraphqlNodeKind]]
                                                                                tmp[graphqlAlias] = {graphqlName}
                                                                                tmp[graphqlArgument] = {graphqlName, graphqlValue}
                                                                                tmp[graphqlArguments] = {graphqlArgument}
                                                                                tmp[graphqlArgumentsDefinition] = {graphqlInputValueDefinition}
                                                                                tmp[graphqlDefaultValue] = {graphqlValue}
                                                                                tmp[graphqlDefinition] = {graphqlExecutableDefinition, graphqlTypeSystemDefinition, graphqlTypeSystemExtension}
                                                                                tmp[graphqlDescription] = {graphqlStringValue}
                                                                                tmp[graphqlDirective] = {graphqlArguments, graphqlName}
                                                                                tmp[graphqlDirectiveDefinition] = {graphqlArgumentsDefinition, graphqlDescription, graphqlDirectiveLocations, graphqlName}
                                                                                tmp[graphqlDirectiveLocation] = {graphqlExecutableDirectiveLocation, graphqlTypeSystemDirectiveLocation}
                                                                                tmp[graphqlDirectiveLocations] = {graphqlDirectiveLocation, graphqlDirectiveLocations}
                                                                                tmp[graphqlDirectives] = {graphqlDirective}
                                                                                tmp[graphqlDocument] = {graphqlDefinition}
                                                                                tmp[graphqlEnumTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlEnumValuesDefinition, graphqlName}
                                                                                tmp[graphqlEnumTypeExtension] = {graphqlDirectives, graphqlEnumValuesDefinition, graphqlName}
                                                                                tmp[graphqlEnumValue] = {graphqlName}
                                                                                tmp[graphqlEnumValueDefinition] = {graphqlDescription, graphqlDirectives, graphqlEnumValue}
                                                                                tmp[graphqlEnumValuesDefinition] = {graphqlEnumValueDefinition}
                                                                                tmp[graphqlExecutableDefinition] = {graphqlFragmentDefinition, graphqlOperationDefinition}
                                                                                tmp[graphqlField] = {graphqlAlias, graphqlArguments, graphqlDirective, graphqlName, graphqlSelectionSet}
                                                                                tmp[graphqlFieldDefinition] = {graphqlArgumentsDefinition, graphqlDescription, graphqlDirectives, graphqlName, graphqlType}
                                                                                tmp[graphqlFieldsDefinition] = {graphqlFieldDefinition}
                                                                                tmp[graphqlFragmentDefinition] = {graphqlDirectives, graphqlFragmentName, graphqlSelectionSet, graphqlTypeCondition}
                                                                                tmp[graphqlFragmentName] = {graphqlName}
                                                                                tmp[graphqlFragmentSpread] = {graphqlDirectives, graphqlFragmentName}
                                                                                tmp[graphqlImplementsInterfaces] = {graphqlImplementsInterfaces, graphqlNamedType}
                                                                                tmp[graphqlInlineFragment] = {graphqlDirectives, graphqlSelectionSet, graphqlTypeCondition}
                                                                                tmp[graphqlInputFieldsDefinition] = {graphqlInputValueDefinition}
                                                                                tmp[graphqlInputObjectTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlInputFieldsDefinition, graphqlName}
                                                                                tmp[graphqlInputObjectTypeExtension] = {graphqlDirectives, graphqlInputFieldsDefinition, graphqlName}
                                                                                tmp[graphqlInputValueDefinition] = {graphqlDefaultValue, graphqlDescription, graphqlDirectives, graphqlName, graphqlType}
                                                                                tmp[graphqlInterfaceTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlFieldsDefinition, graphqlImplementsInterfaces, graphqlName}
                                                                                tmp[graphqlInterfaceTypeExtension] = {graphqlDirectives, graphqlFieldsDefinition, graphqlImplementsInterfaces, graphqlName}
                                                                                tmp[graphqlListType] = {graphqlType}
                                                                                tmp[graphqlListValue] = {graphqlValue}
                                                                                tmp[graphqlNamedType] = {graphqlName}
                                                                                tmp[graphqlNonNullType] = {graphqlListType, graphqlNamedType}
                                                                                tmp[graphqlObjectField] = {graphqlComma, graphqlName, graphqlValue}
                                                                                tmp[graphqlObjectTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlFieldsDefinition, graphqlImplementsInterfaces, graphqlName}
                                                                                tmp[graphqlObjectTypeExtension] = {graphqlDirectives, graphqlFieldsDefinition, graphqlImplementsInterfaces, graphqlName}
                                                                                tmp[graphqlObjectValue] = {graphqlObjectField}
                                                                                tmp[graphqlOperationDefinition] = {graphqlDirectives, graphqlName, graphqlOperationType, graphqlSelectionSet, graphqlVariableDefinitions}
                                                                                tmp[graphqlRootOperationTypeDefinition] = {graphqlNamedType, graphqlOperationType}
                                                                                tmp[graphqlScalarTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlName}
                                                                                tmp[graphqlScalarTypeExtension] = {graphqlDirectives, graphqlName}
                                                                                tmp[graphqlSchemaDefinition] = {graphqlDescription, graphqlDirectives, graphqlRootOperationTypeDefinition}
                                                                                tmp[graphqlSchemaExtension] = {graphqlDirectives, graphqlRootOperationTypeDefinition}
                                                                                tmp[graphqlSelection] = {graphqlField, graphqlFragmentSpread, graphqlInlineFragment}
                                                                                tmp[graphqlSelectionSet] = {graphqlSelection}
                                                                                tmp[graphqlSourceFile] = {graphqlDocument}
                                                                                tmp[graphqlType] = {graphqlListType, graphqlNamedType, graphqlNonNullType}
                                                                                tmp[graphqlTypeCondition] = {graphqlNamedType}
                                                                                tmp[graphqlTypeDefinition] = {graphqlEnumTypeDefinition, graphqlInputObjectTypeDefinition, graphqlInterfaceTypeDefinition, graphqlObjectTypeDefinition, graphqlScalarTypeDefinition, graphqlUnionTypeDefinition}
                                                                                tmp[graphqlTypeExtension] = {graphqlEnumTypeExtension, graphqlInputObjectTypeExtension, graphqlInterfaceTypeExtension, graphqlObjectTypeExtension, graphqlScalarTypeExtension, graphqlUnionTypeExtension}
                                                                                tmp[graphqlTypeSystemDefinition] = {graphqlDirectiveDefinition, graphqlSchemaDefinition, graphqlTypeDefinition}
                                                                                tmp[graphqlTypeSystemExtension] = {graphqlSchemaExtension, graphqlTypeExtension}
                                                                                tmp[graphqlUnionMemberTypes] = {graphqlNamedType, graphqlUnionMemberTypes}
                                                                                tmp[graphqlUnionTypeDefinition] = {graphqlDescription, graphqlDirectives, graphqlName, graphqlUnionMemberTypes}
                                                                                tmp[graphqlUnionTypeExtension] = {graphqlDirectives, graphqlName, graphqlUnionMemberTypes}
                                                                                tmp[graphqlValue] = {
                                                                                                      graphqlBooleanValue,
                                                                                                      graphqlEnumValue,
                                                                                                      graphqlFloatValue,
                                                                                                      graphqlIntValue,
                                                                                                      graphqlListValue,
                                                                                                      graphqlNullValue,
                                                                                                      graphqlObjectValue,
                                                                                                      graphqlStringValue,
                                                                                                      graphqlVariable
                                                                                                    }
                                                                                tmp[graphqlVariable] = {graphqlName}
                                                                                tmp[graphqlVariableDefinition] = {graphqlComma, graphqlDefaultValue, graphqlDirectives, graphqlType, graphqlVariable}
                                                                                tmp[graphqlVariableDefinitions] = {graphqlVariableDefinition}
                                                                                tmp
const graphqlTokenKinds*: set[GraphqlNodeKind] = {
                                                   graphqlExclamationTok,
                                                   graphqlQuoteTok,
                                                   graphqlTripleQuoteTok,
                                                   graphqlDollarTok,
                                                   graphqlAmpersandTok,
                                                   graphqlLParTok,
                                                   graphqlRParTok,
                                                   graphqlTripleDotTok,
                                                   graphqlColonTok,
                                                   graphqlEqualTok,
                                                   graphqlAtTok,
                                                   graphqlARGUMENTDEFINITIONTok,
                                                   graphqlENUMTok,
                                                   graphqlENUMVALUETok,
                                                   graphqlFIELDTok,
                                                   graphqlFIELDDEFINITIONTok,
                                                   graphqlFRAGMENTDEFINITIONTok,
                                                   graphqlFRAGMENTSPREADTok,
                                                   graphqlINLINEFRAGMENTTok,
                                                   graphqlINPUTFIELDDEFINITIONTok,
                                                   graphqlINPUTOBJECTTok,
                                                   graphqlINTERFACETok,
                                                   graphqlMUTATIONTok,
                                                   graphqlOBJECTTok,
                                                   graphqlQUERYTok,
                                                   graphqlSCALARTok,
                                                   graphqlSCHEMATok,
                                                   graphqlSUBSCRIPTIONTok,
                                                   graphqlUNIONTok,
                                                   graphqlVARIABLEDEFINITIONTok,
                                                   graphqlLBrackTok,
                                                   graphqlRBrackTok,
                                                   graphqlDirectiveTok,
                                                   graphqlEnumTok1,
                                                   graphqlExtendTok,
                                                   graphqlFalseTok,
                                                   graphqlFragmentTok,
                                                   graphqlImplementsTok,
                                                   graphqlInputTok,
                                                   graphqlInterfaceTok1,
                                                   graphqlMutationTok1,
                                                   graphqlOnTok,
                                                   graphqlQueryTok1,
                                                   graphqlRepeatableTok,
                                                   graphqlScalarTok1,
                                                   graphqlSchemaTok1,
                                                   graphqlSubscriptionTok1,
                                                   graphqlTrueTok,
                                                   graphqlTypeTok,
                                                   graphqlUnionTok1,
                                                   graphqlLCurlyTok,
                                                   graphqlPipeTok,
                                                   graphqlRCurlyTok
                                                 }

proc tsNodeType*(node: TsGraphqlNode): string



proc kind*(node: TsGraphqlNode): GraphqlNodeKind {.noSideEffect.} =
  {.cast(noSideEffect).}:
    case node.tsNodeType:
      of "alias":                          graphqlAlias
      of "argument":                       graphqlArgument
      of "arguments":                      graphqlArguments
      of "arguments_definition":           graphqlArgumentsDefinition
      of "boolean_value":                  graphqlBooleanValue
      of "default_value":                  graphqlDefaultValue
      of "definition":                     graphqlDefinition
      of "description":                    graphqlDescription
      of "directive":                      graphqlDirective
      of "directive_definition":           graphqlDirectiveDefinition
      of "directive_location":             graphqlDirectiveLocation
      of "directive_locations":            graphqlDirectiveLocations
      of "directives":                     graphqlDirectives
      of "document":                       graphqlDocument
      of "enum_type_definition":           graphqlEnumTypeDefinition
      of "enum_type_extension":            graphqlEnumTypeExtension
      of "enum_value":                     graphqlEnumValue
      of "enum_value_definition":          graphqlEnumValueDefinition
      of "enum_values_definition":         graphqlEnumValuesDefinition
      of "executable_definition":          graphqlExecutableDefinition
      of "executable_directive_location":  graphqlExecutableDirectiveLocation
      of "field":                          graphqlField
      of "field_definition":               graphqlFieldDefinition
      of "fields_definition":              graphqlFieldsDefinition
      of "fragment_definition":            graphqlFragmentDefinition
      of "fragment_name":                  graphqlFragmentName
      of "fragment_spread":                graphqlFragmentSpread
      of "implements_interfaces":          graphqlImplementsInterfaces
      of "inline_fragment":                graphqlInlineFragment
      of "input_fields_definition":        graphqlInputFieldsDefinition
      of "input_object_type_definition":   graphqlInputObjectTypeDefinition
      of "input_object_type_extension":    graphqlInputObjectTypeExtension
      of "input_value_definition":         graphqlInputValueDefinition
      of "interface_type_definition":      graphqlInterfaceTypeDefinition
      of "interface_type_extension":       graphqlInterfaceTypeExtension
      of "list_type":                      graphqlListType
      of "list_value":                     graphqlListValue
      of "named_type":                     graphqlNamedType
      of "non_null_type":                  graphqlNonNullType
      of "object_field":                   graphqlObjectField
      of "object_type_definition":         graphqlObjectTypeDefinition
      of "object_type_extension":          graphqlObjectTypeExtension
      of "object_value":                   graphqlObjectValue
      of "operation_definition":           graphqlOperationDefinition
      of "operation_type":                 graphqlOperationType
      of "root_operation_type_definition": graphqlRootOperationTypeDefinition
      of "scalar_type_definition":         graphqlScalarTypeDefinition
      of "scalar_type_extension":          graphqlScalarTypeExtension
      of "schema_definition":              graphqlSchemaDefinition
      of "schema_extension":               graphqlSchemaExtension
      of "selection":                      graphqlSelection
      of "selection_set":                  graphqlSelectionSet
      of "source_file":                    graphqlSourceFile
      of "string_value":                   graphqlStringValue
      of "type":                           graphqlType
      of "type_condition":                 graphqlTypeCondition
      of "type_definition":                graphqlTypeDefinition
      of "type_extension":                 graphqlTypeExtension
      of "type_system_definition":         graphqlTypeSystemDefinition
      of "type_system_directive_location": graphqlTypeSystemDirectiveLocation
      of "type_system_extension":          graphqlTypeSystemExtension
      of "union_member_types":             graphqlUnionMemberTypes
      of "union_type_definition":          graphqlUnionTypeDefinition
      of "union_type_extension":           graphqlUnionTypeExtension
      of "value":                          graphqlValue
      of "variable":                       graphqlVariable
      of "variable_definition":            graphqlVariableDefinition
      of "variable_definitions":           graphqlVariableDefinitions
      of "!":                              graphqlExclamationTok
      of "\"":                             graphqlQuoteTok
      of "\"\"\"":                         graphqlTripleQuoteTok
      of "$":                              graphqlDollarTok
      of "&":                              graphqlAmpersandTok
      of "(":                              graphqlLParTok
      of ")":                              graphqlRParTok
      of "...":                            graphqlTripleDotTok
      of ":":                              graphqlColonTok
      of "=":                              graphqlEqualTok
      of "@":                              graphqlAtTok
      of "ARGUMENT_DEFINITION":            graphqlARGUMENTDEFINITIONTok
      of "ENUM":                           graphqlENUMTok
      of "ENUM_VALUE":                     graphqlENUMVALUETok
      of "FIELD":                          graphqlFIELDTok
      of "FIELD_DEFINITION":               graphqlFIELDDEFINITIONTok
      of "FRAGMENT_DEFINITION":            graphqlFRAGMENTDEFINITIONTok
      of "FRAGMENT_SPREAD":                graphqlFRAGMENTSPREADTok
      of "INLINE_FRAGMENT":                graphqlINLINEFRAGMENTTok
      of "INPUT_FIELD_DEFINITION":         graphqlINPUTFIELDDEFINITIONTok
      of "INPUT_OBJECT":                   graphqlINPUTOBJECTTok
      of "INTERFACE":                      graphqlINTERFACETok
      of "MUTATION":                       graphqlMUTATIONTok
      of "OBJECT":                         graphqlOBJECTTok
      of "QUERY":                          graphqlQUERYTok
      of "SCALAR":                         graphqlSCALARTok
      of "SCHEMA":                         graphqlSCHEMATok
      of "SUBSCRIPTION":                   graphqlSUBSCRIPTIONTok
      of "UNION":                          graphqlUNIONTok
      of "VARIABLE_DEFINITION":            graphqlVARIABLEDEFINITIONTok
      of "[":                              graphqlLBrackTok
      of "]":                              graphqlRBrackTok
      of "comma":                          graphqlComma
      of "comment":                        graphqlComment
      of "enum":                           graphqlEnumTok1
      of "extend":                         graphqlExtendTok
      of "false":                          graphqlFalseTok
      of "float_value":                    graphqlFloatValue
      of "fragment":                       graphqlFragmentTok
      of "implements":                     graphqlImplementsTok
      of "input":                          graphqlInputTok
      of "int_value":                      graphqlIntValue
      of "interface":                      graphqlInterfaceTok1
      of "mutation":                       graphqlMutationTok1
      of "name":                           graphqlName
      of "null_value":                     graphqlNullValue
      of "on":                             graphqlOnTok
      of "query":                          graphqlQueryTok1
      of "repeatable":                     graphqlRepeatableTok
      of "scalar":                         graphqlScalarTok1
      of "schema":                         graphqlSchemaTok1
      of "subscription":                   graphqlSubscriptionTok1
      of "true":                           graphqlTrueTok
      of "union":                          graphqlUnionTok1
      of "{":                              graphqlLCurlyTok
      of "|":                              graphqlPipeTok
      of "}":                              graphqlRCurlyTok
      of "ERROR":                          graphqlSyntaxError
      else:
        raiseAssert("Invalid element name \'" & node.tsNodeType & "\'")


func isNil*(node: TsGraphqlNode): bool =
  ts_node_is_null(TSNode(node))

func len*(node: TsGraphqlNode, unnamed: bool = false): int =
  if unnamed:
    int(ts_node_child_count(TSNode(node)))

  else:
    int(ts_node_named_child_count(TSNode(node)))


func has*(node: TsGraphqlNode, idx: int, unnamed: bool = false): bool =
  0 <= idx and idx < node.len(unnamed)

proc tree_sitter_graphql(): PtsLanguage {.importc, cdecl.}


proc tsNodeType*(node: TsGraphqlNode): string =
  $ts_node_type(TSNode(node))

proc newTsGraphqlParser*(): GraphqlParser =
  result = GraphqlParser(ts_parser_new())
  discard ts_parser_set_language(PtsParser(result), tree_sitter_graphql())

proc parseString*(parser: GraphqlParser, str: string): TsGraphqlNode =
  TsGraphqlNode(ts_tree_root_node(ts_parser_parse_string(PtsParser(parser), nil, str.cstring, uint32(len(str)))))

proc parseTsGraphqlString*(str: string): TsGraphqlNode =
  let parser = newTsGraphqlParser()
  return parseString(parser, str)

func `$`*(node: TsGraphqlNode): string =
  if isNil(node):
    "<nil tree>"

  else:
    $node.kind


proc treeRepr*(node: TsGraphqlNode, str: string): string =
  var res = addr result
  proc aux(node: TsGraphqlNode, level: int) =
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


