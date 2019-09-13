var parser = argument0;
var type = argument1;

var isMatch = parser_match(parser, type);
if (isMatch)
	parser_take(parser);

return isMatch;
