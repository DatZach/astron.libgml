var tokenizer = argument0;
var value = argument1;

if (!tokenizer_is_next(tokenizer, value))
	return false;

var valueLength = string_length(value);
for (var i = 0; i < valueLength; ++i)
	tokenizer_take_char(tokenizer);

return true;
