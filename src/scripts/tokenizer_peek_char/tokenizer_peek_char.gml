/// @desc tokenizer_peek_char(tokenizer);
/// Returns the character at the current cursor index in the source
/// @param tokenizer DcfpTokenizer
/// @returns string Character or "" if out of range

gml_pragma("forceinline");

var tokenizer = argument[0];
var offset = argument_count == 2 ? argument[1] : 0;

return string_char_at(
	tokenizer[DcfpTokenizer.Source],
	tokenizer[DcfpTokenizer.Index] + offset + 1
);
