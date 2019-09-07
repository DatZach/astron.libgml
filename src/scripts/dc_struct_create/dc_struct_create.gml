/// @func dc_struct_create();

var name = argument0;

var struct_ = ds_map_create();
struct_[? "name"] = name;
struct_[? "fields"] = ds_list_create();

return struct_;
