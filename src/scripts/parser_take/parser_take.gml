/// @desc parser_take(parser, [type]);
/// Returns the token at the cursor + offset and advances stream
/// If type is specified and the consumed token's type doesn't match
/// an error is raised
/// @param parser DcParser
/// @param type DcTokenType
/// @returns DcToken

var parser = argument[0];
var type = argument_count == 2 ? argument[1] : undefined;

parser_peek(parser);

var read = parser[DcfpParser.Read];
var token = read[| 0];
ds_list_delete(read, 0);

if (!is_undefined(type) && token[DcfpToken.Type] != type) {
	parser_error(parser,
		"Expected " + token_type_to_string(type) + " but found " +
		token_to_string(token) + " instead.\n"
	);
}

return token;
