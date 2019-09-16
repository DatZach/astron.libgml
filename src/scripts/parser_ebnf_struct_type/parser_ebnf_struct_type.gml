var parser = argument0;
var dcFile = argument1;

if (!parser_match_and_take(parser, DcfpTokenType.Struct))
	return false;

var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
var dcStruct = dc_struct_create(dcFile, tkIdent[DcfpTokenType.Value]);

parser_take(parser, DcfpTokenType.LeftBrace);

do {
	// named_field
	var type = parser_ebnf_type(parser, dcFile);
	var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
	var field = dc_field_create(type, tkIdent[DcfpToken.Value]);
	
	if (parser_match_and_take(parser, DcfpTokenType.Assign)) {
		var value = parser_ebnf_value(parser, dcFile);
		// TODO Validate consumed type_value matches type
		dc_field_set_default_value(field, value);
	}
	
	// TODO method_as_field
	
	dc_struct_add_field(dcStruct, field);
} until (parser_match_and_take(parser, DcfpTokenType.RightBrace));

dc_file_add_struct(dcFile, dcStruct);

return true;