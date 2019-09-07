/// @desc dg_send(datagram)
/// Sends a message on the wire. Will free datagram resource.
/// @context pClientRepository, pInternalRepository
/// @param message Datagram

var datagram = argument0;

assert(buffer_exists(datagram), "Cannot send disposed datagram");

var datagramLength = buffer_tell(datagram);
var payloadLength = datagramLength - buffer_sizeof(DGSIZE_T);
buffer_seek(datagram, buffer_seek_start, 0);
buffer_write(datagram, DGSIZE_T, payloadLength);

network_send_raw(socket, datagram, datagramLength);
dg_destroy(datagram);
