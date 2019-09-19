var parser = argument0;
var dcFile = argument1;

if (!parser_match_and_take(parser, DcfpTokenType.Class))
	return false;

var tkName = parser_take(parser, DcfpTokenType.Identifier);
var dcClass = dc_class_create(dcFile, tkName[DcfpToken.Value]);

if (parser_match_and_take(parser, DcfpTokenType.Colon)) {
	do {
		var tkName = parser_take(parser, DcfpTokenType.Identifier);
		var name = tkName[DcfpToken.Value];
		var definedClass = dc_file_get_class_by_name(dcFile, name);
		if (definedClass == noone)
			parser_error(parser, "Class '" + name + "' has not been declared.");
		
		dc_class_add_parent(definedClass);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
}

return true;
