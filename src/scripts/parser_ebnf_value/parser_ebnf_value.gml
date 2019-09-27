var parser = argument0;
var dcFile = argument1;

if (parser_match(parser, DcfpTokenType.Number) ||
	((parser_match(parser, DcfpTokenType.Subtract) || parser_match(parser, DcfpTokenType.Add)) && parser_match(parser, DcfpTokenType.Number, 1))) {
	var number = "";
	if (parser_match_and_take(parser, DcfpTokenType.Subtract))
		number += "-";
	else if (parser_match_and_take(parser, DcfpTokenType.Add))
		number += "";
	
	var tkNumber = parser_take(parser, DcfpTokenType.Number);
	number += tkNumber[DcfpToken.Value];
	
	return number;
}
else if (parser_match(parser, DcfpTokenType.Character)) {
	var tkCharacter = parser_take(parser, DcfpTokenType.Character);
	return tkCharacter[DcfpToken.Value];
}
else if (parser_match(parser, DcfpTokenType.String)) {
	var tkString = parser_take(parser, DcfpTokenType.String);
	return tkString[DcfpToken.Value];
}
// TODO Implement
//else if (parser_match(parser, DcfpTokenType.HexString)) {
//	
//}
else if (parser_match_and_take(parser, DcfpTokenType.LeftSquare)) {
	var value = "";
	do {
		value += parser_ebnf_value(parser, dcFile);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
	
	parser_take(parser, DcfpTokenType.RightSquare);
	
	return value;
}
else if (parser_match_and_take(parser, DcfpTokenType.LeftBrace)) {
	var value = "";
	do {
		value += parser_ebnf_value(parser, dcFile);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
	
	parser_take(parser, DcfpTokenType.RightBrace);
	
	return value;
}

parser_error(parser, "Unexpected value type.");
return undefined;