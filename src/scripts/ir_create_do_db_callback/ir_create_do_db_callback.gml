/// @func ir_create_do_db_callback(doId, parentId, zoneId, setAi, creationCallback, additionalArgs);
/// For internal use only. Activates DB object after creation.
/// @context pObjectRepository private
/// @param dclassName string
/// @param parentId channel
/// @param zoneAi zone
/// @param setAi bool
/// @params creationCallback script|noone
/// @params callbackArgs array|noone

assert_ancestor(pObjectRepository);

var doId = argument0;
var parentId = argument1;
var zoneId = argument2;
var setAi = argument3;
var creationCallback = argument4;
var additionalArgs = argument5;

trace("DB distobj ", doId, " created, now moving into (", parentId, " ", zoneId, "), setting AI? ", setAi);

if (setAi)
	send_stateserver_object_set_ai(doId);

// TODO STATESERVER_OBJECT_SET_LOCATION not required?
// TODO Do SET_AI if requested

if (creationCallback != undefined) {
	var args = [doId, parentId, zoneId, setAi];
	array_copy(args, 4, additionalArgs, 0, array_length_1d(additionalArgs));
	script_execute_va(creationCallback, args);
}
