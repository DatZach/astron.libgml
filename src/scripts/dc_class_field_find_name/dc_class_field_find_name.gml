/// @desc dc_class_field_find_name(class, fieldName);
/// Returns a dc_field in a dc_class given a name
/// @param class dc_class
/// @param fieldName string
/// @returns dc_field | noone if error

var class = argument0;
var fieldName = argument1;

var fields = class[? "fields"];

for (var i = 0, len = ds_list_size(fields); i < len; ++i) {
	var field = fields[| i];
	if (field[? "name"] == fieldName)
		return field;
}

return noone;
