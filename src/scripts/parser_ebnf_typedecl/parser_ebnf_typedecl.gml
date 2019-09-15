var parser = argument0;
var dcFile = argument1;

// TypeDecl ::= KeywordType | StructType | ClassType | TypeDefType | ImportType

return parser_ebnf_keyword_type(parser, dcFile)
	|| parser_ebnf_struct_type(parser, dcFile)
	|| parser_ebnf_class_type(parser, dcFile)
	|| parser_ebnf_typedef_type(parser, dcFile)
	|| parser_ebnf_import_type(parser, dcFile);