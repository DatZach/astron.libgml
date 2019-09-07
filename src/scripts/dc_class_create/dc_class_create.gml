/// @desc dc_class_create(name);
/// Creates a new dc_class
/// @param name string

// TODO macros for field keys

var name = argument0;

var class = dc_struct_create(name);
class[? "id"] = noone;
class[? "object-index"] = noone;
class[? "object-layer"] = "";
class[? "parents"] = ds_list_create();

return class;