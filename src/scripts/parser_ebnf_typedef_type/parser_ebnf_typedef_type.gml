var parser = argument0;
var dcFile = argument1;

// TypeDefType ::= "typedef" nonmethod_type_no_array identifier
// nonmethod_type_no_array ::= defined_type | numeric_type | builtin_array_type
// numeric_type ::= numeric_token_only | numeric_with_modulus
//				  | numeric_with_divisor | numeric_with_range

if (!parser_match_and_take(parser, DcfpTokenType.Typedef))
	return false;



return true;
