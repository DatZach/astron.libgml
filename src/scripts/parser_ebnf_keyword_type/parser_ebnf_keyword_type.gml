var parser = argument0;
var dcFile = argument1;

// KeywordType ::= "keyword" identifier
// KeywordList ::= identifier { "," identifier }

if (parser_match_and_take(parser, DcfpTokenType.Keyword)) {
	do {
		var keyword = parser_take(parser, DcfpTokenType.Identifier);
		ds_list_add(dcFile[DcFile.Keywords], keyword[DcfpToken.Value]);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
	
	return true;
}

return false;