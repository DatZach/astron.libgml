/// @desc send_stateserver_create_object_with_required_other();
/// TODO DOCUMENT ME
/// @context pInternalRepository

// aiChannel = sender
var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_CREATE_OBJECT_WITH_REQUIRED_OTHER, doId, stateServer);
	dg_write(dg, dg_type_doid, doId);
	dg_write(dg, dg_type_doid, parentId);
	dg_write(dg, dg_type_doid, zoneId);
	dg_write(dg, dg_type_u16, dclassId);
	// TODO Add REQUIRED fields
	// TODO Add OTHER fields
dg_send(dg);
