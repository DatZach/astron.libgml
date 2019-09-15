var parser = argument0;
var dcFile = argument1;

// TypeDefType ::= "typedef" nonmethod_type_no_array identifier
// nonmethod_type_no_array ::= defined_type | numeric_type | builtin_array_type
// numeric_type ::= numeric_token_only | numeric_with_modulus
//				  | numeric_with_divisor | numeric_with_range

if (!parser_match_and_take(parser, DcfpTokenType.Typedef))
	return false;

var type = parser_ebnf_type(parser, dcFile);
if (type == noone)
	parser_error(parser, "Expected valid type.");

var ident = parser_take(parser, DcfpTokenType.Identifier);
var name = ident[DcfpToken.Value];

type[@ DcDistributedType.Alias] = name;
if (!dc_file_add_typedef(dcFile, name, type))
	parser_error(parser, "Cannot add typedef '" + string(name) + "' because a type of that name has already been declared.");

return true;
