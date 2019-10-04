/// @desc dc_field_has_keyword(field, keyword);
/// Returns if a keyword is assigned to a field
/// @param field DcField
/// @param keyword string
/// @returns bool

var field = argument0;
var keyword = argument1;

var keywords = field[DcField.Keywords];
return ds_list_find_index(keywords, keyword) != -1;
