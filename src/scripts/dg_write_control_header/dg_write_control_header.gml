/// @desc dg_write_control_header(datagram, messageType)
/// @param datagram Datagram
/// @param messageType dg_type_u16
/// Writes a header for control messages that are handled by a MessageDirector

var datagram = argument0;
var messageType = argument1;

buffer_resize(datagram, buffer_tell(datagram) + 12);

dg_write(datagram, dg_type_u8, 1);
dg_write(datagram, dg_type_channel, CHANNEL_CONTROL);
dg_write(datagram, dg_type_u16, messageType);

return 0;
