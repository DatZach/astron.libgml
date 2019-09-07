/// @desc dg_create()
/// Creates a new datagram

var headerSize = buffer_sizeof(DGSIZE_T);
var dg = buffer_create(headerSize, buffer_grow, 1);
buffer_seek(dg, buffer_seek_start, headerSize);

return dg;
