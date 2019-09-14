/// @desc parser_peek(parser, [offset]);
/// Returns the token at the cursor + offset without advancing stream
/// @param parser DcParser
/// @param offset real
/// @returns DcToken

var parser = argument[0];
var offset = argument_count == 2 ? argument[1] : 0;

var read = parser[DcfpParser.Read];
while (ds_list_size(read) <= offset) {
	var token = tokenizer_get_token(parser[DcfpParser.Tokenizer]);
	ds_list_add(read, token);
}

return read[| offset];
