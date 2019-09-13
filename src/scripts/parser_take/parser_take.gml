var parser = argument[0];
var type = argument_count == 2 ? argument[1] : undefined;

parser_peek(parser);

var read = parser[DcfpParser.Read];
var token = read[| 0];
ds_list_delete(read, 0);

if (!is_undefined(type) && token[DcfpToken.Type] != type) {
	show_error(
		"Expected " + token_type_to_string(type) + " but found " +
		token_to_string(token) + " instead.\n" +
		"Line " + string(token[DcfpToken.Line]) +
		"; Pos " + string(token[DcfpToken.Position]),
		true
	);
}

return token;
