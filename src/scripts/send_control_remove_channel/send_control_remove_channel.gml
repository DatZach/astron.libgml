/// @desc send_control_remove_channel(channel);
/// Unsubscribes to a channel, so that we stop recieving messages from upstream
/// @context pObjectRepository
/// @param channel real Channel ID

var channel = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_REMOVE_CHANNEL);
	dg_write(dg, dg_type_channel, channel);
return dg_send(dg, self.socket);
