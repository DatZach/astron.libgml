/// @desc do_create(class, doId, parentId, zoneId);
/// Creates a new Distributed Object and links a GM Object to it
/// @context pObjectRepository
/// @param class dc_class
/// @param doId real
/// @param parentId real
/// @param zoneId real

// TODO Might be better to pass in what repo is creating this DO instead of
//		requiring a with(...)

var class = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

assert(object_is_ancestor(self.object_index, pObjectRepository), "Self must be pObjectRepository");

var distObj = instance_create_layer(0, 0, class[? "object-layer"], class[? "object-index"]);
distObj.repo = self;
distObj.dclass = class;
distObj.doId = doId;
distObj.parentId = parentId;
distObj.zoneId = zoneId;

//var fields = class[? "fields"];
//for (var i = 0, len = ds_list_size(fields); i < len; ++i) {
//	var field = fields[| i];
//	variable_instance_set(distObj, field[? "name"], field[? "default-value"]);
//}

return distObj;
