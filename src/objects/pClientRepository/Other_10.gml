/// @desc Connected

var dcHash = dc_file_get_hash(global.net_dcFile);
var dg = dg_create();
	dg_write(dg, dg_type_u16, CLIENT_HELLO);
	dg_write(dg, dg_type_u32, dcHash);
	dg_write(dg, dg_type_string, CLIENTAGENT_VERSION);
dg_send(dg, self.socket);
