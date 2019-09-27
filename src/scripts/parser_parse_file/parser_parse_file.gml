var parser = argument0;

var dcFile = dc_file_create();
while (true) {
	var parsed = parser_ebnf_keyword_type(parser, dcFile)
		|| parser_ebnf_struct_type(parser, dcFile)
		|| parser_ebnf_class_type(parser, dcFile)
		|| parser_ebnf_typedef_type(parser, dcFile)
		|| parser_ebnf_import_type(parser, dcFile);
	
	parser_match_and_take(parser, DcfpTokenType.Semicolon);
	
	var isEos = parser_match_and_take(parser, DcfpTokenType.EndOfStream);
	if (!parsed && !isEos)
		parser_error(parser, "Token was unexpected at this point.");
	else if (isEos)
		break;
}

return dcFile;
