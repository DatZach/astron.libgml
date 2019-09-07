/// @desc dc_field_create(name, type);

var name = argument0;
var type = argument1;

var field = ds_map_create();
field[? "id"] = noone;
field[? "name"] = name;
field[? "type"] = type;
field[? "default-value"] = undefined;
field[? "keywords"] = ds_list_create();

return field;
