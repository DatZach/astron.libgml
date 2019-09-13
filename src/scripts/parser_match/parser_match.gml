var parser = argument[0];
var type = argument[1];
var offset = argument_count == 3 ? argument[2] : 0;

var token = parser_peek(parser, offset);
return token[DcfpToken.Type] == type;
