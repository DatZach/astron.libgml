/// @desc send_stateserver_object_set_owner(doId, owner);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param doId doid Target DistributedObject
/// @param owner channel New owner of target DO

var doId = argument0;
var owner = argument1;

var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_OBJECT_SET_OWNER, aiChannel, doId);
	dg_write(dg, dg_type_channel, owner);
dg_send(dg);
