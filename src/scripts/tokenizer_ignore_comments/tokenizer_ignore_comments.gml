var tokenizer = argument0;

if (tokenizer_take_if(tokenizer, "//")) {
	while (tokenizer[DcfpTokenizer.Index] < tokenizer[DcfpTokenizer.Length] &&
		!tokenizer_is_next(tokenizer, "\n")) {
		tokenizer_take_char(tokenizer);
	}
}
else if (tokenizer_take_if(tokenizer, "/*")) {
	while (tokenizer[DcfpTokenizer.Index] < tokenizer[DcfpTokenizer.Length] &&
		!tokenizer_take_if(tokenizer, "*/")) {
		tokenizer_take_char(tokenizer);
	}
}
else
	return false;

return true;
