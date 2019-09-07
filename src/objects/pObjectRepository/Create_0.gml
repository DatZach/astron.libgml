distributedObjects = ds_map_create();

// TODO Move into pInternalRepository because I don't think these
//		are used in any other kind of repo?
callbacks = ds_map_create();
contextCounters = ds_map_create();
contextCounters[? STATESERVER_OBJECT_GET_FIELD_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_FIELDS_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_ALL_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_LOCATION_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_AI_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_OWNER_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_ZONE_COUNT_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_ZONES_COUNT_RESP] = 0;
contextCounters[? STATESERVER_OBJECT_GET_CHILD_COUNT_RESP] = 0;
contextCounters[? DBSS_OBJECT_GET_ACTIVATED_RESP] = 0;
contextCounters[? DBSERVER_CREATE_OBJECT_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_GET_FIELD_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_GET_FIELDS_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_GET_ALL_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_SET_FIELD_IF_EQUALS_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_SET_FIELDS_IF_EQUALS_RESP] = 0;
contextCounters[? DBSERVER_OBJECT_SET_FIELD_IF_EMPTY_RESP] = 0;

socket = noone;
