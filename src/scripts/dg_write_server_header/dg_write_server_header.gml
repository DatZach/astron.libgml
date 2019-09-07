/// @desc dg_write_server_header(datagram, messageType, sender, ...recipient)
/// @param datagram Datagram
/// @param messageType dg_type_u16
/// @param sender CHANNEL_T
/// @param recipient CHANNEL_T
/// Writes a generic header for messages that are supposed to be routed
/// to one or more role instances within the server cluster

var datagram = argument[0];
var messageType = argument[1];
var sender = argument[2];
var recipientCount = argument_count - 3;

buffer_resize(datagram, buffer_tell(datagram) + 11 + recipientCount*8);

dg_write(datagram, dg_type_u8, recipientCount);
for (var i = 0; i < recipientCount; ++i)
	dg_write(datagram, dg_type_channel, argument[i + 3]);

dg_write(datagram, dg_type_channel, sender);
dg_write(datagram, dg_type_u16, messageType);

return 0;
