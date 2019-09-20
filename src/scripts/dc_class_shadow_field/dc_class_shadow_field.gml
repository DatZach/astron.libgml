/// @func dc_class_shadow_field(dcClass, field);
/// Removes a field 
/// @param dcClass DcClass
/// @param parent DcClass
/// @param parentField DcField

var dcClass = argument0;
var field = argument1;

if (dcClass[DcDistributedType.Size] != 0) {
	var fieldType = field[DcField.Type];
	dcClass[@ DcDistributedType.Size] -= fieldType[DcDistributedType.Size];
}

ds_map_delete(dcClass[DcStruct.FieldsById], field[DcField.Id]);
ds_map_delete(dcClass[DcStruct.FieldsByName], field[DcField.Name]);

var fields = dcClass[DcStruct.Fields];
for (var i = 0, isize = ds_list_size(fields); i < isize; ++i) {
	var existingField = fields[| i];
	if (existingField == field) {
		ds_list_delete(fields, i);
		break;
	}
}

var children = dcClass[DcClass.Children];
for (var i = 0, isize = ds_list_size(children); i < isize; ++i) {
	var child = children[| i];
	if (dc_class_get_field_by_id(child, field[DcField.Id]) == field)
		dc_class_shadow_field(child, field);
}
