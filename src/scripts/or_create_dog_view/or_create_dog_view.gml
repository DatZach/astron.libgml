/// @desc or_create_dog_view(className, doId, setAi);
/// Creates a new view to a DO of a specified DOID
/// @context pObjectRepository
/// @param className string Name of dclass
/// @param doId real
/// @param setAi bool
/// @return pDistributedObject

assert_ancestor(pObjectRepository);

var className = argument0;
var doId = argument1;
var setAi = argument2;

var distObj = do_create(className, doId, 0, 0);
self.distributedObjects[? doId] = distObj;

if (setAi)
	send_control_add_channel(doId);

return distObj;
