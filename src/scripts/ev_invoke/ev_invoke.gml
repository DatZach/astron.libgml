var key = argument[0];

var handlers = ds_map_find_value(global.__events, key);
if (is_undefined(handlers))
	exit;

var args = array_create(argument_count - 1);
for (var i = 1; i < argument_count - 1; ++i)
	args[i] = argument[i];

// "illegal access of argument, argument is not provided to script"
//array_copy(args, 0, argument, 0, argument_count - 1);

for (var i = 0, len = ds_list_size(handlers); i < len; ++i) {
	var handler = handlers[| i];
	var result = script_execute(handler, args);
	
	if (result == true)
		exit;
}
