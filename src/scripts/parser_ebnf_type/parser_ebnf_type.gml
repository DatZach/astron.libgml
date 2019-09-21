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

return type;
