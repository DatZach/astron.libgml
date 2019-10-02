/// @func ir_create_do_db(dclassName, parentId, zoneAi, setAi, creationCallback, callbackArgs);
/// Registers a callback for *_RESP messages
/// @context pObjectRepository
/// @param dclassName string
/// @param parentId channel
/// @param zoneAi zone
/// @param setAi bool
/// @params creationCallback script|noone
/// @params callbackArgs array|noone

assert_ancestor(pObjectRepository);

var dclassName = argument[0];
var parentId = argument[1];
var zoneAi = argument[2];
var setAi = argument[3];

var dclassId = dc_file_get_class_by_name(global.net_dcFile, dclassName);
assert(dclassId != noone, "Unable to find class: " + string(dclassName));

if (argument_count > 4) {
	var creationCallback = argument[4];
	var callbackArgs = argument[5];
	var context = or_register_callback(
		DBSERVER_CREATE_OBJECT,
		ir_create_do_db_callback,
		[parentId, zoneAi, setAi, creationCallback, callbackArgs]
	);
}

send_dbserver_create_object(dclassId, context);
