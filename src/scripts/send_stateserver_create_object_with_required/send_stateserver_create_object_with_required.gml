/// @desc send_stateserver_create_object_with_required(dclassId, doId, parentId, zoneId);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param dclassId real DClass ID
/// @param doId doid DOCUMENT ME
/// @param parentId doid DOCUMENT ME
/// @param zoneId doid DOCUMENT ME

var dclassId = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

// aiChannel = sender
var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_CREATE_OBJECT_WITH_REQUIRED, self.aiChannel, self.stateServer);
	dg_write(dg, dg_type_doid, doId);
	dg_write(dg, dg_type_doid, parentId);
	dg_write(dg, dg_type_doid, zoneId);
	dg_write(dg, dg_type_u16, dclassId);
	// TODO Add REQUIRED fields
return dg_send(dg, self.socket);
