/// @desc send_control_clear_post_removes(sender);
/// Clears queue of messages to send after `sender` has been removed from the
/// visibility graph.
/// @context pObjectRepository
/// @param sender real Channel ID

var channel = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_CLEAR_POST_REMOVES);
	dg_write(dg, dg_type_channel, channel);
return dg_send(dg, self.socket);
