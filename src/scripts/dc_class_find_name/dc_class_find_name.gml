/// @desc dc_class_find_name(module, className);
/// Returns a dc_class in a dc_module given a name
/// @param module dc_mod
/// @param className string
/// @returns dc_class | noone if error

var module = argument0;
var className = argument1;

var classes = module[? "classes"];
var class = classes[? className];

return is_undefined(class) ? noone : class;
