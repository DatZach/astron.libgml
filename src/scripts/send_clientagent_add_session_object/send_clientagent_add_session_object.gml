/// @desc send_clientagent_add_session_object(doId, clientChannel);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param doId doid DOCUMENT ME
/// @param clientChannel channel DOCUMENT ME

var doId = argument0;
var clientChannel = argument1;

var dg = dg_create();
	dg_write_server_header(dg, CLIENTAGENT_ADD_SESSION_OBJECT, aiChannel, clientChannel);
	dg_write(dg, dg_type_doid, doId);
dg_send(dg);
