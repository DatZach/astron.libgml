/// @desc tokenizer_peek_char(tokenizer);
/// Returns the character at the current cursor index in the source
/// @param tokenizer DcfpTokenizer
/// @returns string Character or "" if out of range

gml_pragma("forceinline");

return string_char_at(
	argument0[DcfpTokenizer.Source],
	argument0[DcfpTokenizer.Index] + 1
);
