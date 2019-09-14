var parser = argument0;

var numericBackingType;
if (!parser_match_and_take(parser, DcfpTokenType.TypeString))
	numericBackingType = DcType.Char;
else if (!parser_match_and_take(parser, DcfpTokenType.TypeBlob))
	numericBackingType = DcfpTokenType.TypeBlob;
else
	return noone;

var range = noone;
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
	
	range = [lo, hi];
}

var numericType = dc_type_numeric_create(numericBackingType);
var type = dc_type_array_create(numericType, range);
if (numericBackingType == DcType.Char)
	type[@ DcDistributedType.Alias] = "string";
else if (numericBackingType == DcType.Blob)
	type[@ DcDistributedType.Alias] = "blob";
else
	parser_error(parser, "Unhandled ArrayType.");

return type;
