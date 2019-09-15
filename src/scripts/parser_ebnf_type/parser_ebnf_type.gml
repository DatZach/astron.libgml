var parser = argument0;
var dcFile = argument1;

// TODO Flag for allow_array
// TODO Flag for allow_method

var type = parser_ebnf_defined_type(parser, dcFile);
if (type == noone)
	type = parser_ebnf_numeric_type(parser);
if (type == noone)
	type = parser_ebnf_builtin_array_type(parser);
if (type == noone)
	return noone;

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

return type;
