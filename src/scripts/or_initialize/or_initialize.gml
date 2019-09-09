/// @desc repo_initialize(ipaddress, port);
/// Initializes a repo
/// @param ipaddress string
/// @param port real

var ipAddress = argument0;
var port = argument1;

assert(object_is_ancestor(self.object_index, pObjectRepository), "Self must be pObjectRepository");
event_inherited();

self.socket = network_create_socket(network_socket_tcp);
if (network_connect_raw(self.socket, ipAddress, port) < 0) {
	event_user(ev_disconnected);
	instance_destroy();
	exit;
}
	
network_set_timeout(self.socket, NETWORK_TIMEOUT, NETWORK_TIMEOUT);
