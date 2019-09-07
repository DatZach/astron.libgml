/// @desc send_clientagent_add_interest(clientChannel, interestId, parentId, zoneId);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param clientChannel channel DOCUMENT ME
/// @param interestId real DOCUMENT ME
/// @param parentId doid DOCUMENT ME
/// @param zoneId zone DOCUMENT ME

var clientChannel = argument0;
var interestId = argument1;
var parentId = argument2;
var zoneId = argument3;

var dg = dg_create();
	dg_write_server_header(dg, CLIENTAGENT_ADD_INTEREST, aiChannel, clientChannel);
	dg_write(dg, dg_type_u16, interestId);
	dg_write(dg, dg_type_doid, parentId);
	dg_write(dg, dg_type_zone, zoneId);
dg_send(dg);
