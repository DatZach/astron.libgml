/// @desc send_stateserver_delete_ai_objects();
/// TODO DOCUMENT ME
/// @context pInternalRepository

// aiChannel = sender
var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_DELETE_AI_OBJECTS, aiChannel, stateServer);
	dg_write(dg, dg_type_channel, aiChannel);
dg_send(dg);
