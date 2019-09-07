/// @desc send_control_remove_channel_range(channelLo, channelHi);
/// Unsubscribes from a range of channels, so that we recieve
/// messages from upstream
/// @param channelLo real Lower Inclusive Channel ID
/// @param channelHi real Upper Inclusive Channel ID

var channelLo = argument0;
var channelHi = argument1;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_REMOVE_RANGE);
	dg_write(dg, dg_type_channel, channelLo);
	dg_write(dg, dg_type_channel, channelHi);
dg_send(dg);
