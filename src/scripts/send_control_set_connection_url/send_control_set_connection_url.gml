/// @desc send_control_set_connection_url(url);
/// Sets this connection's url in the upstream MessageDirector. For Debugging.
/// @context pObjectRepository
/// @param url string Connection URL

var url = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_SET_CON_URL);
	dg_write(dg, dg_type_string, url);
return dg_send(dg, self.socket);
