/// @desc tokenizer_create(source);
/// Creates a new tokenizer for a given source
/// @param source string
/// @returns DcfpTokenizer

enum DcfpTokenizer {
	Source,
	Length,
	Index,
	CurrentLine,
	CurrentLineStartIndex,
	
	sizeof
}

var source = argument0;

var value = array_create(DcfpTokenizer.sizeof);
	value[DcfpTokenizer.Source] = source;
	value[DcfpTokenizer.Length] = string_length(source);
	value[DcfpTokenizer.Length] = 0;
	value[DcfpTokenizer.CurrentLine] = 1;
	value[DcfpTokenizer.CurrentLineStartIndex] = 0;
return value;
