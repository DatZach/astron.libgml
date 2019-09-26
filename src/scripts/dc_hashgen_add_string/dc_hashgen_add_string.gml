/// @func dc_hashgen_add_string(hashGenerator, num);
/// Adds a string to the hash generator
/// @param hashGenerator DcHashGenerator
/// @param str string

var hashGenerator = argument0;
var str = argument1;

var length = string_length(str);
dc_hashgen_add_int(hashGenerator, length);
for (var i = 0; i < length; ++i)
	dc_hashgen_add_int(hashGenerator, string_ord_at(str, i));
