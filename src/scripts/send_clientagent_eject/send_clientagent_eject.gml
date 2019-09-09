/// @desc send_clientagent_eject(clientChannel, disconnectCode, reason, sender);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param clientChannel channel DOCUMENT ME
/// @param disconnectCode real DOCUMENT ME
/// @param reason string DOCUMENT ME
/// @param sender channel DOCUMENT ME

var clientChannel = argument0;
var disconnectCode = argument1;
var reason = argument2;
var sender = argument3;

var dg = dg_create();
	dg_write_server_header(dg, CLIENTAGENT_EJECT, sender, clientChannel);
	dg_write(dg, dg_type_u16, disconnectCode);
	dg_write(dg, dg_type_string, reason);
return dg_send(dg, self.socket);
