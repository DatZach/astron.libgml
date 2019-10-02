/// @desc do_create(className, doId, parentId, zoneId);
/// Creates a new Distributed Object and links a GM Object to it
/// @context pObjectRepository
/// @param className string
/// @param doId real
/// @param parentId real
/// @param zoneId real

// TODO Might be better to pass in what repo is creating this DO instead of
//		requiring a with(...)

var className = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

assert(object_is_ancestor(self.object_index, pObjectRepository),
	"Self must be pObjectRepository");

var class = dc_file_get_class_by_name(global.net_dcFile, className);
if (class == noone) {
	// HACK Should find this via the imports
	var baseClassName = string_copy(className, 1, string_length(className) - 2);
	class = dc_file_get_class_by_name(global.net_dcFile, baseClassName);
}

assert(class != noone, "Unknown class " + className);

var objectIndex = asset_get_index("do" + className);
var distObj = instance_create_layer(0, 0, LAYER_INSTANCES, objectIndex);
distObj.persistent = true;
distObj.repo = self;
distObj.dclass = class;
distObj.doId = doId;
distObj.parentId = parentId;
distObj.zoneId = zoneId;

// TODO Implement
//var fields = class[? "fields"];
//for (var i = 0, len = ds_list_size(fields); i < len; ++i) {
//	var field = fields[| i];
//	variable_instance_set(distObj, field[? "name"], field[? "default-value"]);
//}

return distObj;
