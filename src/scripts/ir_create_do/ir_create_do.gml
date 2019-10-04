/// @func ir_create_do(dclassName, doId, parentId, zoneId, setAi);
/// Registers a callback for *_RESP messages
/// @context pObjectRepository
/// @param dclassName string
/// @param doId doid
/// @param parentId channel
/// @param zoneId zone
/// @param setAi bool

assert_ancestor(pObjectRepository);

var dclassName = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;
var setAi = argument4;

var dclass = dc_file_get_class_by_name(global.net_dcFile, dclassName);
assert(dclass != noone, "Unable to find class: " + string(dclassName));

// TODO Does this need to create a DO instance?
send_stateserver_create_object_with_required(dclass, doId, parentId, zoneId);
if (setAi)
	send_stateserver_object_set_ai(doId);
