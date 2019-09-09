/// @desc send_dbss_object_activate_with_defaults(doId, parentId, zoneId);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param doId doid DOCUMENT ME
/// @param parentId channel DOCUMENT ME
/// @param zoneId channel DOCUMENT ME

var doId = argument0;
var parentId = argument1;
var zoneId = argument2;

var dg = dg_create();
	dg_write_server_header(dg, DBSS_OBJECT_ACTIVATE_WITH_DEFAULTS, self.aiChannel, doId);
	dg_write(dg, dg_type_doid, doId);
	dg_write(dg, dg_type_channel, parentId);
	dg_write(dg, dg_type_channel, zoneId);
return dg_send(dg, self.socket);
