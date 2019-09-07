/// @desc send_control_add_post_remove(sender, datagram);
/// Queues a datagram to be sent by a `sender` when they're removed from
/// the visibility graph. This will free the datagram resource passed in.
/// @param sender real Channel ID
/// @param datagram Datagram Datagram to forward

var sender = argument0;
var datagram = argument1;

// TODO dg_get_payload()?
var datagramLength = buffer_tell(datagram);
var payloadLength = datagramLength - buffer_sizeof(DGSIZE_T);
var payload = buffer_create(payloadLength, buffer_fixed, 1);
buffer_copy(datagram, buffer_sizeof(DGSIZE_T), payloadLength, payload, 0);

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_ADD_POST_REMOVE);
	dg_write(dg, dg_type_channel, sender);
	dg_write(dg, dg_type_blob, payload);
dg_send(dg);
buffer_delete(payload);
