/// @desc dc_create();
/// Creates a new Distributed Class Module

var module = ds_map_create();
module[? "classes"] = ds_map_create();
module[? "structs"] = ds_map_create();
module[? "imports"] = ds_list_create();

return module;