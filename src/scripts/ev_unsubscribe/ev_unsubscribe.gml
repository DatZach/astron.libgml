var key = argument0;
var handler = argument1;

var handlers = ds_map_find_value(global.__events, key);
if (is_undefined(handlers))
	return false;

var index = ds_list_find_index(handlers, handler);
if (index < 0)
	return false;
	
ds_list_delete(handlers, index);

return true;