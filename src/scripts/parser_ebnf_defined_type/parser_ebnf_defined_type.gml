var parser = argument0;
var dcFile = argument1;

var ident = parser_peek(parser);
if (ident[DcfpToken.Type] != DcfpTokenType.Identifier)
	return noone;

return dc_file_get_type_by_name(dcFile, ident);
