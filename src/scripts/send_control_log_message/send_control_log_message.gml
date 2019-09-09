/// @desc send_control_log_message(message);
/// Logs a message in the upstream event logger. For Debugging.
/// @context pObjectRepository
/// @param message string Message

// TODO Need to JSON.stringy + msgpack to blob in order for Astron to
//		accept this.

var message = argument0;

var dg = dg_create();
	dg_write_control_header(dg, CONTROL_LOG_MESSAGE);
	dg_write(dg, dg_type_string, message); // dg_type_blob
return dg_send(dg, self.socket);
