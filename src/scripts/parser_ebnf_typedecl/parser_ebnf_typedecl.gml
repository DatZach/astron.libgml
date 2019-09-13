var parser = argument0;
var dcFile = argument1;

// TypeDecl ::= KeywordType | StructType | ClassType

return parser_ebnf_keyword_type(parser, dcFile)
	|| parser_ebnf_struct_type(parser, dcFile)
	|| parser_ebnf_class_type(parser, dcFile);