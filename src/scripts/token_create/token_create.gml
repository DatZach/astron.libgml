/// @desc token_create(type, value, tokenizer)
/// Creates a new DcfpToken
/// @param type DcfpTokenType
/// @param value string
/// @param tokenizer DcfpTokenizer
/// @returns DcfpToken

enum DcfpTokenType {
	Identifier,
	Number,
	String,
	
		Keyword,
		Struct,
		Class,
		Import,
		From,
		Typedef,
	
		TypeInt8,
		TypeInt16,
		TypeInt32,
		TypeInt64,
		TypeUInt8,
		TypeUInt16,
		TypeUInt32,
		TypeUInt64,
		TypeFloat32,
		TypeFloat64,
		TypeString,
		TypeBlob,
		TypeChar,
	
	Semicolon,
	Comma,
	Dot,
	Colon,
	
	EndOfStream
}

enum DcfpToken {
	Type,
	Value,
	Line,
	Column,
	Position,
	
	sizeof
}

var type = argument0;
var value = argument1;
var tokenizer = argument2;

var value = array_create(DcfpToken.sizeof);
	value[DcfpToken.Type] = type;
	value[DcfpToken.Value] = value;
	value[DcfpToken.Line] = tokenizer[DcfpTokenizer.CurrentLine];
	value[DcfpToken.Column] = tokenizer[DcfpTokenizer.Index] - tokenizer[DcfpTokenizer.CurrentLineStartIndex] + 1;
	value[DcfpToken.Position] = tokenizer[DcfpTokenizer.Index];
return value;
