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
		
		dc_class_add_parent(dcClass, definedClass);
	} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
}

parser_take(parser, DcfpTokenType.LeftBrace);

while (!parser_match_and_take(parser, DcfpTokenType.RightBrace)) {
	// | molecule
	if (parser_match(parser, DcfpTokenType.Colon, 1)) {
		var tkIdent = parser_take(parser, DcfpTokenType.Identifier);
		var identValue = tkIdent[DcfpToken.Value];
		parser_take(parser, DcfpTokenType.Colon);
		
		var field = dc_molecular_field_create(dcClass, identValue);
		
		do {
			tkIdent = parser_take(parser, DcfpTokenType.Identifier);
			identValue = tkIdent[DcfpToken.Value];
			var atomicField = dc_class_get_field_by_name(dcClass, identValue);
			if (atomicField == noone)
				parser_error(parser, "No previously declared field: " + identValue);
			
			dc_molecular_field_add_field(field, atomicField);
		} until (!parser_match_and_take(parser, DcfpTokenType.Comma));
		
		parser_match_and_take(parser, DcfpTokenType.Semicolon);
		
		dc_class_add_field(dcClass, field);
		continue;
	}
	
	// | named_field
	var field = parser_ebnf_field(parser, dcFile, true);
	
	while (parser_match(parser, DcfpTokenType.Identifier)) {
		var tkKeyword = parser_take(parser, DcfpTokenType.Identifier);
		var keyword = tkKeyword[DcfpToken.Value];
		if (!dc_file_has_keyword(dcFile, keyword))
			parser_error(parser, "Keyword '" + keyword + "' has not been declared.");
		
		dc_field_add_keyword(field, keyword);
	}
	
	parser_match_and_take(parser, DcfpTokenType.Semicolon);
	
	var fieldAdded = dc_class_add_field(dcClass, field);
	if (!fieldAdded) // TODO Be more descriptive
		parser_error(parser, "Cannot add field.");
}

dc_file_add_class(dcFile, dcClass);

return true;
