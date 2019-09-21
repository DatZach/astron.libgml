/// @desc dc_field_add_keyword(field, keyword);
/// Adds a keyword to the field's keyword list
/// @param field DcField
/// @param keyword string

var field = argument0;
var keyword = argument1;

ds_list_add(field[DcField.Keywords], keyword);
