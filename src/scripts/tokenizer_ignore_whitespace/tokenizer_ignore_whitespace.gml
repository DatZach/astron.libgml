var tokenizer = argument0;

while (tokenizer[DcfpTokenizer.Index] < tokenizer[DcfpTokenizer.Length]) {
	var ch = tokenizer_peek_char(tokenizer);
	if (!char_is_whitespace(ch))
		break;
	
	tokenizer_take_char(tokenizer);
}

return tokenizer[DcfpTokenizer.Index] >= tokenizer[DcfpTokenizer.Length];
