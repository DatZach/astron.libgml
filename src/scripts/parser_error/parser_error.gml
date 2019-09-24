/// @desc parser_error(parser, errorMessage);
/// Displays a fatal error
/// @param parser DcParser
/// @param errorMessage string

var parser = argument0;
var errorMessage = argument1;

var token = parser_peek(parser);
show_error(
	errorMessage + "\n" +
	"Line " + string(token[DcfpToken.Line]) +
	"; Column " + string(token[DcfpToken.Column]),
	true
);
