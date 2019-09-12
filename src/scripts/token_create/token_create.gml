/// @desc token_create(type, value, tokenizer)
/// Creates a new DcfpToken
/// @param type DcfpTokenType
/// @param value string
/// @param tokenizer DcfpTokenizer
/// @returns DcfpToken

enum DcfpTokenType {
	Invalid,
	
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
	
	Add,
	Subtract,
	Multiply,
	Divide,
	Modulo,
	
	LeftParen,
	RightParen,
	LeftBrace,
	RightBrace,
	LeftSquare,
	RightSquare,
	Comma,
	Semicolon,
	Assign,
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

var obj = array_create(DcfpToken.sizeof);
	obj[DcfpToken.Type] = type;
	obj[DcfpToken.Value] = value;
	obj[DcfpToken.Line] = tokenizer[DcfpTokenizer.CurrentLine];
	obj[DcfpToken.Column] = tokenizer[DcfpTokenizer.Index] - tokenizer[DcfpTokenizer.CurrentLineStartIndex] + 1;
	obj[DcfpToken.Position] = tokenizer[DcfpTokenizer.Index];
return obj;
