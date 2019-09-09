/// @desc dg_send(datagram, socket)
/// Sends a message on the wire. Will free datagram resource.
/// @param message Datagram
/// @param socket socket
/// @returns real Number of bytes sent over the wire or < 0 on error

var datagram = argument0;
var socket = argument1;

assert(buffer_exists(datagram), "Cannot send disposed datagram");

var datagramLength = buffer_tell(datagram);
var payloadLength = datagramLength - buffer_sizeof(DGSIZE_T);
buffer_seek(datagram, buffer_seek_start, 0);
buffer_write(datagram, DGSIZE_T, payloadLength);

var result = network_send_raw(socket, datagram, datagramLength);
dg_destroy(datagram);

return result;
