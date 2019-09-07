/// @desc Connected

var dg = dg_create();
	dg_write(dg, dg_type_u16, CLIENT_HELLO);
	dg_write(dg, dg_type_u32, $6bcab4); // dc hash
	dg_write(dg, dg_type_string, CLIENTAGENT_VERSION);
dg_send(dg);
