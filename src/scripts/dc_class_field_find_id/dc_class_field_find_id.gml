/// @desc dc_class_field_find_id(class, fieldId);
/// Returns a dc_field in a dc_class given a field id
/// @param class dc_class
/// @param fieldId real
/// @returns dc_field | noone if error

var class = argument0;
var fieldId = argument1;

var fields = class[? "fields"];

for (var i = 0, len = ds_list_size(fields); i < len; ++i) {
	var field = fields[| i];
	if (field[? "id"] == fieldId)
		return field;
}

return noone;
