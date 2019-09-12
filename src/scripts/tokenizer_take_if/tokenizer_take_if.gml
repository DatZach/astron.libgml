var tokenizer = argument0;
var value = argument1;

if (!tokenizer_is_next(tokenizer, value))
	return false;

var valueLength = string_length(value);
repeat (valueLength)
	tokenizer_take_char(tokenizer);

return true;
