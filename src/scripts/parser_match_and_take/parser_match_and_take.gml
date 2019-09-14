/// @desc parser_match_and_take(parser, type);
/// Returns if the peeked token matches the specified type. Additionally,
/// consumes successfully matched tokens.
/// @param parser DcParser
/// @param type DcTokenType
/// @returns bool

var parser = argument0;
var type = argument1;

var isMatch = parser_match(parser, type);
if (isMatch)
	parser_take(parser);

return isMatch;
