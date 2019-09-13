/// @desc parser_create(tokenizer);
/// Creates a new DC File Parser
/// @param tokenizer DcfpTokenizer
/// @returns DcfpParser

enum DcfpParser {
	Tokenizer,
	Read,
	
	sizeof
}

var tokenizer = argument0;

var obj = array_create(DcfpParser.sizeof);
	obj[DcfpParser.Tokenizer] = tokenizer;
	obj[DcfpParser.Read] = ds_list_create();
return obj;
