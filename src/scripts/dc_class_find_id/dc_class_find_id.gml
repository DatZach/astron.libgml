/// @desc dc_class_find_id(module, classId, [postfix]);
/// Returns a dc_class in a dc_module given an class id
/// @param module dc_mod
/// @param classId real
/// @returns dc_class | noone if error

// TODO Optimize me pl0x

var module = argument0;
var classId = argument1;

var classes = module[? "classes"];

var class = ds_map_find_first(classes);
for (var i = 0, len = ds_map_size(classes); i < len; ++i) {
	if (class[? "id"] == classId)
		return class;
	
	class = ds_map_find_next(class, classes);
}

return noone;
