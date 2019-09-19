/// @func dc_class_add_parent(dcClass, parent);
/// Adds a parent DcClass to a DcClass
/// @param dcClass DcClass
/// @param parent DcClass

var dcClass = argument0;
var parent = argument1;

dc_class_add_child(parent, dcClass);

var parents = dcClass[DcClass.Parents];
ds_list_add(parents, parent);

var parentFields = parent[DcStruct.Fields];
for (var i = 0, size = ds_list_size(parentFields); i < size; ++i) {
	var parentField = parentFields[| i];
	dc_class_add_inherited_field(dcClass, parent, parentField);
}
