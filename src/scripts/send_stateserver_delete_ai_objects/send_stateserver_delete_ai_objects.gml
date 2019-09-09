/// @desc send_stateserver_delete_ai_objects();
/// TODO DOCUMENT ME
/// @context pInternalRepository

var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_DELETE_AI_OBJECTS, self.aiChannel, self.stateServer);
	dg_write(dg, dg_type_channel, self.aiChannel);
return dg_send(dg, self.socket);
