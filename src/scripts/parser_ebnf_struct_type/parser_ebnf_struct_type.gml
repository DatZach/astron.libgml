var parser = argument0;
var dcFile = argument1;

if (!parser_match_and_take(parser, DcfpTokenType.Struct))
	return false;

var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
var dcStruct = dc_struct_create(dcFile, tkIdent[DcfpToken.Value]);

parser_take(parser, DcfpTokenType.LeftBrace);

do {
	var field = parser_ebnf_field(parser, dcFile, false);
	parser_take(parser, DcfpTokenType.Semicolon);
	
	dc_struct_add_field(dcStruct, field);
} until (parser_match_and_take(parser, DcfpTokenType.RightBrace));

dc_file_add_struct(dcFile, dcStruct);

return true;