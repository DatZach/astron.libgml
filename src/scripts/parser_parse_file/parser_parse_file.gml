var parser = argument0;

var dcFile = dc_file_create();
while (parser_ebnf_typedecl(parser, dcFile)) {
	parser_match_and_take(parser, DcfpTokenType.Semicolon);
}

return dcFile;
