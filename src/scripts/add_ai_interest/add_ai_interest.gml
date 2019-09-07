/// @func add_ai_interest(doId, zoneId, byDistObj);
/// Adds interest???
/// @context pInteralRepository
/// @param doId real
/// @param zoneId real
/// @param byDistObj bool

var doId = argument0;
var zoneId = argument1;
var byDistObj = argument2;

var location = parent_zone_to_location(doId, zoneId);

if (byDistObj) {
	// TODO Implement
	assert(false, "Not implemented");
}
else 
	ds_list_add(interests, location);

send_control_add_channel(location);
send_stateserver_object_get_zone_objects(0, doId, zoneId);

// TODO Messages for DOs that haven't entered yet may come over the control channel
