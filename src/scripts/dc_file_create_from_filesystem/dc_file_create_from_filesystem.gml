/// @desc dc_file_create_from_filesystem(path);
/// Load a *.dc file from disk and parse it into a DcFile
/// @param path DC File Path
/// @returns DcFile

// https://github.com/Astron/Astron/blob/master/docs/dclass-ebnf.md

var path = argument0;

var source = "";
var f = file_text_open_read(path);
if (f == -1) {
	show_error("DC File cannot be opened\nPath: \"" + string(path) + "\"", true);
	return noone;
}

while (!file_text_eof(f)) {
	source += file_text_read_string(f);
	source += "\r\n";
	file_text_readln(f);
}

file_text_close(f);

var tokenizer = tokenizer_create(source);
var parser = parser_create(tokenizer);
var dcFile = parser_parse_file(parser);
parser_destroy(parser);

return dcFile;

//var token;
//do {
//	token = tokenizer_get_token(tokenizer);
//	show_debug_message(
//		"L" + string(token[DcfpToken.Line]) + "P" + string(token[DcfpToken.Column]) + " " +
//		string(token[DcfpToken.Type]) + " " + token[DcfpToken.Value]
//	);
//} until (token[DcfpToken.Type] == DcfpTokenType.EndOfStream);
