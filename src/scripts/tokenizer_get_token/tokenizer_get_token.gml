/// @desc tokenizer_get_token(tokenizer);
/// Yields the next token in the specified tokenizer
/// @param tokenizer DcfpTokenizer
/// @returns DcfpToken

var tokenizer = argument0;

if (tokenizer[DcfpTokenizer.Index] >= tokenizer[DcfpTokenizer.Length]) {
	// TODO Lol
	return token_create(DcfpTokenType.EndOfStream, noone,
		tokenizer[DcfpTokenizer.CurrentLine],
		tokenizer[DcfpTokenizer.Index] - tokenizer[DcfpTokenizer.CurrentLineStartIndex] + 1,
		tokenizer[DcfpTokenizer.Index]);
}

while(true) {
	if (tokenizer_ignore_whitespace(tokenizer))
		break;
}
