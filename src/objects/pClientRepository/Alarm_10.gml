/// @desc Heartbeat

var dg = dg_create();
	dg_write(dg, dg_type_u16, CLIENT_HEARTBEAT);
dg_send(dg, self.socket);

alarm[10] = ms_to_frames(heartbeatIntervalMs);
