/// @desc send_control_add_channel_range(channelLo, channelHi);
/// Subscribes to a range of channels, so that we recieve messages from upstream
/// @context pObjectRepository
/// @param channelLo real Lower Inclusive Channel ID
/// @param channelHi real Upper Inclusive Channel ID

var channelLo = argument0;
var channelHi = argument1;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_ADD_RANGE);
	dg_write(dg, dg_type_channel, channelLo);
	dg_write(dg, dg_type_channel, channelHi);
return dg_send(dg, self.socket);
