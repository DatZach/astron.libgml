var parser = argument0;

// nonmethod_type_with_name
var type = parser_ebnf_defined_type(parser);
if (type != noone)
	return type;

// | numeric_type_token
type = parser_ebnf_numeric_type(parser);
if (type != noone)
	return type;

// | builtin_array_type
type = parser_ebnf_builtin_array_type(parser);
if (type != noone)
	return type;

return noone;