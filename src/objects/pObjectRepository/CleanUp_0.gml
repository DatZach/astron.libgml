if (ds_exists(distributedObjects, ds_type_map)) {
	ds_map_destroy(distributedObjects);
	distributedObjects = noone;
}

if (ds_exists(callbacks, ds_type_map)) {
	ds_map_destroy(callbacks);
	callbacks = noone;
}

if (ds_exists(contextCounters, ds_type_map)) {
	ds_map_destroy(contextCounters);
	contextCounters = noone;
}

if (socket != noone) {
	network_destroy(socket);
	socket = noone;
}