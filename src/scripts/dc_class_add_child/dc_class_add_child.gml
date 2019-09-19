/// @func dc_class_add_child(dcClass, child);
/// Adds a child DcClass to a DcClass
/// @param dcClass DcClass
/// @param child DcClass

var dcClass = argument0;
var child = argument1;

var children = dcClass[DcClass.Children];
ds_list_add(children, child);
