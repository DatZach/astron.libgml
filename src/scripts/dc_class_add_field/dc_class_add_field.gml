/// @func dc_class_add_field(dcClass, field);
/// Adds a field
/// @param dcClass DcClass
/// @param field DcField

var dcClass = argument0;
var field = argument1;

var baseFields = dcClass[DcClass.BaseFields];
var fieldsById = dcClass[DcStruct.FieldsById];
var fieldsByName = dcClass[DcStruct.FieldsByName];

if (field[DcField.Struct] != undefined && field[DcField.Struct] != dcClass)
	return false;

var fieldName = field[DcField.Name];
if (fieldName == "")
	return false;

// Constructor
if (fieldName == dcClass[DcStruct.Name]) {
	if (dcClass[DcClass.Constructor] != noone)
		return false;
	
	if (dc_field_is_molecular(field))
		return false;
	
	// Ctor must be first, because its ID must be 0
	if (ds_list_size(baseFields) > 0)
		return false;
	
	field[@ DcField.Struct] = dcClass;
	dcClass[@ DcClass.Constructor] = field;
	
	dc_file_add_field(dcClass[DcStruct.File], field);
	ds_map_add(fieldsById, field[DcField.Id], field);
	ds_map_add(fieldsByName, field[DcField.Name], field);
	
	return true;
}

// Ordinary Field
var inserted = ds_map_add(dcClass[DcClass.BaseFieldsByName], fieldName, field);
if (!inserted)
	return false;

ds_list_add(baseFields, field);

// Shadow parent fields with the same name
var prevField = fieldsByName[? fieldName];
if (prevField != undefined)
	dc_class_shadow_field(dcClass, field);

var fields = dcClass[DcStruct.Fields];
field[@ DcField.Struct] = dcClass;
ds_list_add(fields, field);
dc_file_add_field(dcClass[DcStruct.File], field);
ds_map_add(fieldsById, field[DcField.Id], field);
ds_map_add(fieldsByName, field[DcField.Name], field);

// Update size
if (!dc_field_is_molecular(field) &&
	(dcClass[DcDistributedType.Size] != 0 || ds_list_size(fields) == 1)) {
	var fieldType = field[DcField.Type];
	dcClass[@ DcDistributedType.Size] += fieldType[DcDistributedType.Size];
}

// Notify children of new field
var children = dcClass[DcClass.Children];
for (var i = 0, isize = ds_list_size(children); i < isize; ++i) {
	var child = children[| i];
	dc_class_add_inherited_field(child, dcClass, field);
}

return true;
