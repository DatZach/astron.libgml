var parser = argument0;

var numericType;
if (parser_match_and_take(parser, DcfpTokenType.TypeChar))
	numericType = DcType.Char;
else if (parser_match_and_take(parser, DcfpTokenType.TypeInt8))
	numericType = DcType.Int8;
else if (parser_match_and_take(parser, DcfpTokenType.TypeInt16))
	numericType = DcType.Int16;
else if (parser_match_and_take(parser, DcfpTokenType.TypeInt32))
	numericType = DcType.Int32;
else if (parser_match_and_take(parser, DcfpTokenType.TypeInt64))
	numericType = DcType.Int64;
else if (parser_match_and_take(parser, DcfpTokenType.TypeUInt8))
	numericType = DcType.UInt8;
else if (parser_match_and_take(parser, DcfpTokenType.TypeUInt16))
	numericType = DcType.UInt16;
else if (parser_match_and_take(parser, DcfpTokenType.TypeUInt32))
	numericType = DcType.UInt32;
else if (parser_match_and_take(parser, DcfpTokenType.TypeUInt64))
	numericType = DcType.UInt64;
else if (parser_match_and_take(parser, DcfpTokenType.TypeFloat32))
	numericType = DcType.Float32;
else if (parser_match_and_take(parser, DcfpTokenType.TypeFloat64))
	numericType = DcType.Float64;
else
	return noone;

var type = dc_type_numeric_create(numericType);
	
// | numeric_with_modulus ::= numeric_token_only '%' number
if (parser_match_and_take(parser, DcfpTokenType.Modulo)) {
	var number = parser_take(parser, DcfpTokenType.Number);
	if (!dc_type_numeric_set_modulus(type, real(number[DcfpToken.Value])))
		parser_error(parser, "Invalid modulus for type.");
}
// | numeric_with_divisor ::= numeric_token_only '/' small_unsigned_integer
else if (parser_match_and_take(parser, DcfpTokenType.Divide)) {
	var number = parser_take(parser, DcfpTokenType.Number);
	if (!dc_type_numeric_set_divisor(type, real(number[DcfpToken.Value])))
		parser_error(parser, "Invalid divisor for type.");
}
	
// | numeric_with_range
if (parser_match_and_take(parser, DcfpTokenType.LeftParen)) {
	// TODO Support chars
	var lo = 0, hi = 0;
	if (parser_match(parser, DcfpTokenType.Number))
		lo = parser_take(parser, DcfpTokenType.Number);
	if (parser_match_and_take(parser, DcfpTokenType.Subtract))
		hi = parser_take(parser, DcfpTokenType.Number);
	else
		hi = lo;
		
	parser_take(parser, DcfpTokenType.RightParen);
		
	var range = [lo, hi];
	if (!dc_type_numeric_set_range(type, range))
		parser_error(parser, "Invalid range for type.");
}

return type;
