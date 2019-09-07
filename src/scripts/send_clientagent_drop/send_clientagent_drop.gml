/// @desc send_clientagent_drop(clientChannel, sender);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param clientChannel channel DOCUMENT ME
/// @param sender channel DOCUMENT ME

var clientChannel = argument0;
var sender = argument1;

var dg = dg_create();
	dg_write_server_header(dg, CLIENTAGENT_DROP, sender, clientChannel);
dg_send(dg);
