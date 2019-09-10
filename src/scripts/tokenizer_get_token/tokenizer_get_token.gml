/// @desc tokenizer_get_token(tokenizer);
/// Yields the next token in the specified tokenizer
/// @param tokenizer DcfpTokenizer
/// @returns DcfpToken

var tokenizer = argument0;

if (tokenizer[DcfpTokenizer.Index] >= tokenizer[DcfpTokenizer.Length])
	return token_create(DcfpTokenType.EndOfStream, noone, tokenizer);

while(true) {
	if (tokenizer_ignore_whitespace(tokenizer))
		break;
	
	if (tokenizer_ignore_comments(tokenizer))
		continue;
	
	var startLine = tokenizer[DcfpTokenizer.CurrentLine];
	var startIndex = tokenizer[DcfpTokenizer.Index];
	var ch = tokenizer_peek_char(tokenizer);
	
	// String
	if (ch == "\"") {
		
	}
}
