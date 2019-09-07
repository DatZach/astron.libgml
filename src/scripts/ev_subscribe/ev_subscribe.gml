var key = argument0;
var handler = argument1;

var handlers = ds_map_find_value(global.__events, key);
if (is_undefined(handlers)) {
	handlers = ds_list_create();
	ds_map_add(global.__events, key, handlers);
}

if (ds_list_find_index(handlers, handler) < 0) {
	ds_list_add(handlers, handler);
	return true;
}

return false;
