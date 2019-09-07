/// @desc Datagram

var dg = async_load[? "buffer"];
var dgLength = dg_read(dg, dg_type_size);
var messageType = dg_read(dg, dg_type_u16);

switch(messageType) {
	case CLIENT_HELLO_RESP:
		if (heartbeatIntervalMs > 0)
			alarm[alarm_heartbeat] = 1;
		
		event_user(ev_authenticate);
		break;
		
	case CLIENT_DISCONNECT:
		event_user(ev_disconnected);
		instance_destroy();
		break;
	
	case CLIENT_EJECT: {
		errorCode = dg_read(dg, dg_type_u16);
		reason = dg_read(dg, dg_type_string);
		event_user(ev_ejected);
		event_user(ev_disconnected);
		instance_destroy();
		break;
	}
	
	// TODO Implement other client messages
	
	default:
		warn("ClientRepository: Unhandled message type ", messageType);
		break;
}
