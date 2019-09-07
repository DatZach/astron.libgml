/// dc_field_add_keyword(field, keyword);
/// Adds a keyword to a field
/// @param field dc_field
/// @param keyword Keyword

var field = argument0;
var keyword = argument1;

var keywords = field[? "keywords"];
if (ds_list_find_index(keywords, keyword) < 0)
	ds_list_add(keywords, keyword);
