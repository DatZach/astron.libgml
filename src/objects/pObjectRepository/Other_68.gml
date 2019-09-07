if (async_load[? "id"] != socket) exit;

switch(async_load[? "type"]) {
	case network_type_non_blocking_connect:
	case network_type_connect: {
		if (!async_load[? "succeeded"]) {
			event_user(ev_disconnected);
			instance_destroy();
			exit;
		}
		
		event_user(ev_connected);
		break;
	}
		
	case network_type_disconnect:
		event_user(ev_disconnected);
		instance_destroy();
		break;
		
	case network_type_data:
		event_user(ev_recieved_datagram);
		break;
}