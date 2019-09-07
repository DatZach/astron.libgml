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

var dclassId = dc_class_find_name(global.net_dcMod, dclassName);
assert(dclassId != noone, "Unable to find class: " + string(dclassName));

send_stateserver_create_object_with_required(dclassId, doId, parentId, zoneId);
if (setAi)
	send_stateserver_object_set_ai(doId);
