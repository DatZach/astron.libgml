/// @desc dc_struct_get_field_by_name(struct, fieldId);
/// Returns a DcField given a fieldId
/// @param struct DcStruct
/// @param fieldId real
/// @returns DcField | noone if error

// TODO Optimize me pl0x

var struct = argument0;
var fieldName = argument1;

var fields = struct[@ DcStruct.Fields];

for (var i = 0, size = ds_list_size(fields); i < size; ++i) {
	var field = fields[| i];
	if (field[@ DcField.Name] == fieldName)
		return field;
}

return noone;
