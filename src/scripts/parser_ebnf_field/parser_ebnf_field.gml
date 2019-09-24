var parser = argument0;
var dcFile = argument1;
var nameRequired = argument2;

var type = parser_ebnf_type(parser, dcFile);
var name = "";
if (parser_match(parser, DcfpTokenType.Identifier)) {
	var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
	name = tkIdent[DcfpToken.Value];
}
else if (nameRequired)
	parser_error(parser, "Expected field name.");

// TODO Not valid for structs
if (type == noone && parser_match_and_take(parser, DcfpTokenType.LeftParen)) {
	type = dc_type_method_create();
	do {
		var parameterField = parser_ebnf_field(parser, dcFile, true);
		var parameter = dc_parameter_create_from_field(parameterField);
		dc_field_destroy(parameterField);
		
		dc_type_method_add_parameter(type, parameter);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
	
	parser_take(parser, DcfpTokenType.RightParen);
}
else {
	while (parser_match_and_take(parser, DcfpTokenType.LeftSquare)) {
		// TODO Support chars
		var lo = 0, hi = 0;
		if (parser_match(parser, DcfpTokenType.Number))
			lo = parser_take(parser, DcfpTokenType.Number);
		if (parser_match_and_take(parser, DcfpTokenType.Subtract))
			hi = parser_take(parser, DcfpTokenType.Number);
		else
			hi = lo;
	
		parser_take(parser, DcfpTokenType.RightSquare);
	
		type = dc_type_array_create(type, [lo, hi]);
	}
}

// TODO Return back a tuple and instead build field/parameters
//		at a higher level
var field = dc_field_create(type, name);
	
if (parser_match_and_take(parser, DcfpTokenType.Assign)) {
	var value = parser_ebnf_value(parser, dcFile);
	// TODO Validate consumed type_value matches type
	dc_field_set_default_value(field, value);
}

return field;
