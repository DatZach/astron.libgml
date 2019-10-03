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
var creationCallback = argument_count > 4 ? argument[4] : undefined;
var callbackArgs = argument_count > 5 ? argument[5] : undefined;

var dclass = dc_file_get_class_by_name(global.net_dcFile, dclassName);
assert(dclass != noone, "Unable to find class: " + string(dclassName));
var dclassId = dclass[DcStruct.Id];

var context = or_register_callback(
	DBSERVER_CREATE_OBJECT,
	ir_create_do_db_callback,
	[parentId, zoneAi, setAi, creationCallback, callbackArgs]
);

send_dbserver_create_object(dclassId, context);
