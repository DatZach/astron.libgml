var parser = argument0;
var dcFile = argument1;

var tkIdent = parser_peek(parser);
if (tkIdent[DcfpToken.Type] != DcfpTokenType.Identifier)
	return noone;

var result = dc_file_get_type_by_name(dcFile, tkIdent[DcfpToken.Value]);
if (result != noone)
	parser_take(parser, DcfpTokenType.Identifier);

return result;
