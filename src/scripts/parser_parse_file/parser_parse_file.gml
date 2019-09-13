var parser = argument0;

var dcFile = dc_file_create();
parser_ebnf_typedecl(parser, dcFile);

return dcFile;
