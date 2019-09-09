/// @desc send_control_add_channel(channel);
/// Subscribes to a channel, so that we recieve messages from upstream
/// @context pObjectRepository
/// @param channel real Channel ID

var channel = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_ADD_CHANNEL);
	dg_write(dg, dg_type_channel, channel);
return dg_send(dg, self.socket);
