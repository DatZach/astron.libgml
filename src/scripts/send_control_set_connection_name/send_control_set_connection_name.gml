/// @desc send_control_set_connection_name(name);
/// Sets this connection's name in the upstream MessageDirector. For Debugging.
/// @param name string Connection Name

var name = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_SET_CON_NAME);
	dg_write(dg, dg_type_string, name);
dg_send(dg);
