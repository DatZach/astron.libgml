var tokenizer = argument0;

while (tokenizer[DcfpTokenizer.Index] < tokenizer[DcfpTokenizer.Length]) {
	var ch = ord(tokenizer_peek_char(tokenizer));
	var isWhiteSpace = ch == ord(" ") || ch >= ord("\t") && ch <= ord("\r") || ch == $85;
	if (!isWhiteSpace)
		break;
	
	// TODO Maybe ++index
	tokenizer_take_char(tokenizer);
}

return tokenizer[DcfpTokenizer.Index] >= tokenizer[DcfpTokenizer.Length];