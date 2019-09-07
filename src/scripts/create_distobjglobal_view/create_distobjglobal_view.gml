/// @desc create_distobjglobal_view(className, doId, setAi);
/// Creates a new DO given a DOID
/// @context pObjectRepositor
/// @param className string Name of dclass
/// @param doId real
/// @param setAi bool
/// @return pDistributedObject

// TODO Rename or_create_dog_view

assert_ancestor(pObjectRepository);

var className = argument0;
var doId = argument1;
var setAi = argument2;

var class = dc_class_find_name(global.net_dcMod, className);
assert(class != noone, "Unknown class " + className);

var distObj = do_create(class, doId, 0, 0);
self.distributedObjects[? doId] = distObj;

if (setAi)
	send_control_add_channel(doId);

return distObj;
