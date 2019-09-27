var parser = argument0;
var dcFile = argument1;

var isFrom = parser_match_and_take(parser, DcfpTokenType.From);
if (!isFrom && !parser_match_and_take(parser, DcfpTokenType.Import))
	return false;

var module = "";
var symbols = [];

while (true) {
	var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
	module += tkIdent[DcfpToken.Value];
	
	if (parser_match_and_take(parser, DcfpTokenType.Dot))
		module += ".";
	else if (parser_match_and_take(parser, DcfpTokenType.Divide))
		module += "/";
	else
		break;
}

if (isFrom) {
	parser_take(parser, DcfpTokenType.Import);
	
	var i = 0;
	do {
		if (parser_match_and_take(parser, DcfpTokenType.Multiply)) {
			symbols[i++] = "*";
			continue;
		}
		
		//while (true) {
		//	if (parser_match(parser, DcfpTokenType.Identifier
		//	var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
		//	symbols[i++] = tkIdent[DcfpToken.Value];
		//}
		
		var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
		symbols[i++] = tkIdent[DcfpToken.Value];
		
		while (parser_match_and_take(parser, DcfpTokenType.Divide)) {
			var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
			symbols[i++] = symbols[0] + tkIdent[DcfpToken.Value];
		}
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
}

var import = dc_import_create(module, symbols);
dc_file_add_import(dcFile, import);

return true;
