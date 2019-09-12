var tokenizer = argument0;
var value = argument1;

var valueLength = string_length(value);
if (tokenizer[DcfpTokenizer.Index] + valueLength > tokenizer[DcfpTokenizer.Length])
	return false;

for (var i = 0; i < valueLength; ++i) {
	var ch = tokenizer_peek_char(tokenizer, i);
	if (ch != string_char_at(value, i))
		return false;
}

return true;
