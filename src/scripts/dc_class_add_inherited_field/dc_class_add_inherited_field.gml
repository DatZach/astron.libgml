/// @func dc_class_add_inherited_field(dcClass, parent, parentField);
/// Adds a parent class's field to this class
/// @param dcClass DcClass
/// @param parent DcClass
/// @param parentField DcField

var dcClass = argument0;
var parent = argument1;
var field = argument2;

var fieldId = field[DcField.Id];
var fieldName = field[DcField.Name];
var baseFieldsByName = dcClass[DcClass.BaseFieldsByName];
if (ds_map_exists(baseFieldsByName, fieldName))
	return;

var fieldsByName = dcClass[DcStruct.FieldsByName];
var prevFieldKey = ds_map_find_first(fieldsByName);
for (var i = 0, isize = ds_map_size(fieldsByName); i < isize; ++i) {
	var parentB = fieldsByName[? prevFieldKey];
	
	var parents = dcClass[DcClass.Parents];
	for (var j = 0, jsize = ds_list_size(parents); j < jsize; ++j) {
		var prevParent = parents[| i];
		if (prevParent == parentB)
			return;
		else if (prevParent == parent)
			dc_class_shadow_field(dcClass, prevParent);
	}
	
	prevFieldKey = ds_map_find_next(fieldsByName, prevFieldKey);
}

ds_map_add(dcClass[DcStruct.FieldsById], fieldId, field);
ds_map_add(dcClass[DcStruct.FieldsByName], fieldName, field);

var fields = dcClass[DcStruct.Fields];
if (ds_list_size(fields) == 0)
	ds_list_add(fields, field);
else {
	for (var i = 0, isize = ds_list_size(fields); i < isize; ++i) {
		var existingField = fields[| i];
		if (existingField[DcStruct.Id] < field[DcStruct.Id]) {
			ds_list_insert(fields, i, field);
			break;
		}
	}
}

if (dcClass[DcDistributedType.Size] != 0 && ds_list_size(fields) == 1) {
	var fieldType = field[DcDistributedType.Type];
	dcClass[@ DcDistributedType.Size] += fieldType[DcDistributedType.Size];
}

var children = dcClass[DcClass.Children];
for (var i = 0, isize = ds_list_size(children); i < isize; ++i) {
	var child = children[| i];
	dc_class_add_inherited_field(child, dcClass, field);
}
