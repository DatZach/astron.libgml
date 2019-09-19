/// @func dc_class_add_inherited_field(dcClass, parent, parentField);
/// Adds a parent class's field to this class
/// @param dcClass DcClass
/// @param parent DcClass
/// @param parentField DcField

var dcClass = argument0;
var parent = argument1;
var parentField = argument2;

var fieldName = parentField[DcField.Name];
var baseFieldsByName = dcClass[DcClass.BaseFieldsByName];
if (ds_map_exists(baseFieldsByName, fieldName))
	return;

// TODO Finish implementation
