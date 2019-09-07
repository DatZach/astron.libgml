/// @desc send_clientagent_set_state(clientAgent, state, [sender]);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param clientAgent channel ClientAgent to set state of
/// @param state ClientState State be set
/// @param sender channel Who's setting the state

var clientAgent = argument[0];
var state = argument[1];
var sender = argument_count == 3 ? argument[2] : self.aiChannel;

assert(object_is_ancestor(self.object_index, pInternalRepository), "Self must be pInternalRepository");

var dg = dg_create();
	dg_write_server_header(dg, CLIENTAGENT_SET_STATE, sender, clientAgent);
	dg_write(dg, dg_type_u16, state);
dg_send(dg);
