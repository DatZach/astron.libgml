var parser = argument0;
var dcFile = argument1;
var expectedType = argument2;

switch (expectedType) {
	case DcType.Int8:
	case DcType.Int16:
	case DcType.Int32:
	case DcType.Int64:
	case DcType.UInt8:
	case DcType.UInt16:
	case DcType.UInt32:
	case DcType.UInt64: {
		var tkValue = parser_take(parser, DcfpTokenType.Number);
		return dc_type_numeric_create(expectedType, tkValue[DcfpToken.Value]);
	}
}
if (parser_match(parser, DcfpTokenType.Number)) {
	
}