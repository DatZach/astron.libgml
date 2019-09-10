/// @desc tokenizer_take_char(tokenizer);
/// Returns the character at the current cursor index in the source
/// and advances the cursor by one
/// @param tokenizer DcfpTokenizer
/// @returns string Character or "" if EOS

gml_pragma("forceinline");

var tokenizer = argument0;

var result = tokenizer_peek_char(tokenizer);

++tokenizer[@ DcfpTokenizer.Index];
if (result == $0A /* \n */) {
	++tokenizer[@ DcfpTokenizer.CurrentLine];
	tokenizer[@ DcfpTokenizer.CurrentLineStartIndex] = tokenizer[DcfpTokenizer.Index];
}

return result;
