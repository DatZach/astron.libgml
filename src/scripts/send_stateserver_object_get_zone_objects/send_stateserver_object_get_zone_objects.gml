/// @desc send_stateserver_object_get_zone_objects(context, parentId, zoneId);
/// Sends STATESERVER_OBJECT_GET_ZONE_OBJECTS message
/// @context pInternalRepository
/// @param context real
/// @param parentId real
/// @param zoneId real

var context = argument0;
var parentId = argument1;
var zoneId = argument2;

var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_OBJECT_GET_ZONE_OBJECTS, self.aiChannel, parentId);
	dg_write(dg, dg_type_u32, context);
	dg_write(dg, dg_type_u32, parentId);
	dg_write(dg, dg_type_u32, zoneId);
return dg_send(dg, self.socket);
