/// @desc token_create(type, value, line, column, position)
/// Creates a new DcfpToken
/// @param type DcfpTokenType
/// @param value string
/// @param line real
/// @param column real
/// @param position real
/// @returns DcfpToken

enum DcfpTokenType {
	Identifier,
	Number,
	String,
	
	Keyword,
	Struct,
	
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
var line = argument2;
var column = argument3;
var position = argument4;

var value = array_create(DcfpToken.sizeof);
	value[DcfpToken.Type] = type;
	value[DcfpToken.Value] = value;
	value[DcfpToken.Line] = line;
	value[DcfpToken.Column] = column;
	value[DcfpToken.Position] = position;
return value;
