/// @func ir_add_ai_interest(doId, zoneId, [byDistObj]);
/// Adds interest
/// @context pInteralRepository
/// @param doId doid
/// @param zoneId zone
/// @param byDistObj doid

assert_ancestor(pInternalRepository);

var doId = argument[0];
var zoneId = argument[1];
var byDistObj = argument_count > 2 ? argument[2] : undefined;

var location = parent_zone_to_location(doId, zoneId);

if (byDistObj != undefined) {
	if (!ds_map_exists(doiDoidToLocation, byDistObj))
		doiDoidToLocation[? byDistObj] = [location];
	else {
		var locations = doiDoidToLocation[? byDistObj];
		locations[@ array_length_1d(locations)] = location;
	}
	
	if (!ds_map_exists(doiLocationToDoid, location))
		doiLocationToDoid[? location] = [byDistObj];
	else {
		var doIds = doiLocationToDoid[? location];
		doIds[@ array_length_1d(doIds)] = byDistObj;
	}
}
else 
	ds_list_add(interests, location);

send_control_add_channel(location);
send_stateserver_object_get_zone_objects(0, doId, zoneId);

// TODO Messages for DOs that haven't entered yet may come over the control channel
