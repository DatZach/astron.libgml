/// @desc send_stateserver_create_object_with_required_other();
/// TODO DOCUMENT ME
/// @context pInternalRepository

var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_CREATE_OBJECT_WITH_REQUIRED_OTHER, self.doId, self.stateServer);
	dg_write(dg, dg_type_doid, self.doId);
	dg_write(dg, dg_type_doid, self.parentId);
	dg_write(dg, dg_type_doid, self.zoneId);
	dg_write(dg, dg_type_u16, self.dclass[? "id"]);
	// TODO Add REQUIRED fields
	// TODO Add OTHER fields
return dg_send(dg, self.socket);
