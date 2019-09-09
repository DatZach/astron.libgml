/// @desc send_stateserver_object_set_ai(doId);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param doId doid DOCUMENT ME

var doId = argument0;

var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_OBJECT_SET_AI, self.aiChannel, doId);
	dg_write(dg, dg_type_channel, self.aiChannel);
return dg_send(dg, self.socket);
