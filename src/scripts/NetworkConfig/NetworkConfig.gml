gml_pragma("global", "NetworkConfig();");

//
//	Game Configuration
//	MODIFIABLE
//

#macro NETWORK_TIMEOUT 30*1000
#macro CLIENTAGENT_VERSION "FooGame v7.0"
#macro DCFILE_PATH "X:\\astron.libgml\\astron\\core.dc"

//
//	Astron Configuration
//	MODIFY ACCORDING TO ASTRON
//	astrond --version to query
//
#macro DGSIZE_T buffer_u16
#macro CHANNEL_T buffer_u64
#macro DOID_T buffer_u32
#macro ZONE_T buffer_u32

//
//	Internal Configuration
//	DO NOT MODIFY BELOW
//

// Reference
// https://github.com/Astron/panda3d/tree/master/direct/src/distributed
// https://github.com/TheCheapestPixels/astron_examples/tree/master/01_simple_example
// https://github.com/Astron/Astron

#macro ev_connected 0
#macro ev_disconnected 1
#macro ev_recieved_datagram 2
#macro ev_authenticate 3
#macro ev_ejected 4

// ClientAgent Messages
#macro CLIENT_HELLO 1
#macro CLIENT_HELLO_RESP 2
#macro CLIENT_DISCONNECT 3
#macro CLIENT_EJECT 4
#macro CLIENT_HEARTBEAT 5
#macro CLIENT_OBJECT_SET_FIELD 120
#macro CLIENT_OBJECT_SET_FIELDS 121
#macro CLIENT_OBJECT_LEAVING 132
#macro CLIENT_OBJECT_LOCATION 140
#macro CLIENT_ENTER_OBJECT_REQUIRED 142
#macro CLIENT_ENTER_OBJECT_REQUIRED_OTHER 143
#macro CLIENT_ENTER_OBJECT_REQUIRED_OWNER 172
#macro CLIENT_ENTER_OBJECT_REQUIRED_OTHER_OWNER 173
#macro CLIENT_ADD_INTEREST 200
#macro CLIENT_ADD_INTEREST_MULTIPLE 201
#macro CLIENT_REMOVE_INTEREST 203
#macro CLIENT_DONE_INTEREST_RESP 204

#macro CLIENT_DISCONNECT_GENERIC 1
#macro CLIENT_DISCONNECT_OVERSIZED_DATAGRAM 106
#macro CLIENT_DISCONNECT_NO_HELLO 107
#macro CLIENT_DISCONNECT_INVALID_MSGTYPE 108
#macro CLIENT_DISCONNECT_TRUNCATED_DATAGRAM 109
#macro CLIENT_DISCONNECT_ANONYMOUS_VIOLATION 113
#macro CLIENT_DISCONNECT_FORBIDDEN_INTEREST 115
#macro CLIENT_DISCONNECT_MISSING_OBJECT 117
#macro CLIENT_DISCONNECT_FORBIDDEN_FIELD 118
#macro CLIENT_DISCONNECT_FORBIDDEN_RELOCATE 119
#macro CLIENT_DISCONNECT_BAD_VERSION 124
#macro CLIENT_DISCONNECT_BAD_DCHASH 125
#macro CLIENT_DISCONNECT_FIELD_CONSTRAINT 127
#macro CLIENT_DISCONNECT_SESSION_OBJECT_DELETED 153
#macro CLIENT_DISCONNECT_NO_HEARTBEAT 345

// MessageDirector / Control Messages
#macro CHANNEL_INVALID 0
#macro CHANNEL_CONTROL 1
#macro CHANNEL_ALL_CLIENTS 10
#macro CHANNEL_ALL_STATESERVERS 12
#macro CHANNEL_ALL_DBSERVERS 13

#macro CONTROL_ADD_CHANNEL 9000
#macro CONTROL_REMOVE_CHANNEL 9001
#macro CONTROL_ADD_RANGE 9002
#macro CONTROL_REMOVE_RANGE 9003
#macro CONTROL_ADD_POST_REMOVE 9010
#macro CONTROL_CLEAR_POST_REMOVES 9011
#macro CONTROL_SET_CON_NAME 9012
#macro CONTROL_SET_CON_URL 9013
#macro CONTROL_LOG_MESSAGE 9014

// StateServer Control
#macro STATESERVER_CREATE_OBJECT_WITH_REQUIRED 2000
#macro STATESERVER_CREATE_OBJECT_WITH_REQUIRED_OTHER 2001

// Distributed Object Control
#macro STATESERVER_DELETE_AI_OBJECTS 2009
#macro STATESERVER_OBJECT_GET_FIELD 2010
#macro STATESERVER_OBJECT_GET_FIELD_RESP 2011
#macro STATESERVER_OBJECT_GET_FIELDS 2012
#macro STATESERVER_OBJECT_GET_FIELDS_RESP 2013
#macro STATESERVER_OBJECT_GET_ALL 2014
#macro STATESERVER_OBJECT_GET_ALL_RESP 2015
#macro STATESERVER_OBJECT_SET_FIELD 2020
#macro STATESERVER_OBJECT_SET_FIELDS 2021
#macro STATESERVER_OBJECT_DELETE_FIELD_RAM 2030
#macro STATESERVER_OBJECT_DELETE_FIELDS_RAM 2031
#macro STATESERVER_OBJECT_DELETE_RAM 2032

// Distributed Object Visibility
#macro STATESERVER_OBJECT_SET_LOCATION 2040
#macro STATESERVER_OBJECT_CHANGING_LOCATION 2041
#macro STATESERVER_OBJECT_ENTER_LOCATION_WITH_REQUIRED 2042
#macro STATESERVER_OBJECT_ENTER_LOCATION_WITH_REQUIRED_OTHER 2043
#macro STATESERVER_OBJECT_GET_LOCATION 2044
#macro STATESERVER_OBJECT_GET_LOCATION_RESP 2045
#macro STATESERVER_OBJECT_SET_AI 2050
#macro STATESERVER_OBJECT_CHANGING_AI 2051
#macro STATESERVER_OBJECT_ENTER_AI_WITH_REQUIRED 2052
#macro STATESERVER_OBJECT_ENTER_AI_WITH_REQUIRED_OTHER 2053
#macro STATESERVER_OBJECT_GET_AI 2054
#macro STATESERVER_OBJECT_GET_AI_RESP 2055
#macro STATESERVER_OBJECT_SET_OWNER 2060
#macro STATESERVER_OBJECT_CHANGING_OWNER 2061
#macro STATESERVER_OBJECT_ENTER_OWNER_WITH_REQUIRED 2062
#macro STATESERVER_OBJECT_ENTER_OWNER_WITH_REQUIRED_OTHER 2063
#macro STATESERVER_OBJECT_GET_OWNER 2064
#macro STATESERVER_OBJECT_GET_OWNER_RESP 2065

// Parent Object Queries
#macro STATESERVER_OBJECT_GET_ZONE_OBJECTS 2100
#macro STATESERVER_OBJECT_GET_ZONES_OBJECTS 2102
#macro STATESERVER_OBJECT_GET_CHILDREN 2104
#macro STATESERVER_OBJECT_GET_ZONE_COUNT 2110
#macro STATESERVER_OBJECT_GET_ZONE_COUNT_RESP 2111
#macro STATESERVER_OBJECT_GET_ZONES_COUNT 2112
#macro STATESERVER_OBJECT_GET_ZONES_COUNT_RESP 2113
#macro STATESERVER_OBJECT_GET_CHILD_COUNT 2114
#macro STATESERVER_OBJECT_GET_CHILD_COUNT_RESP 2115
#macro STATESERVER_OBJECT_DELETE_ZONE 2120
#macro STATESERVER_OBJECT_DELETE_ZONES 2122
#macro STATESERVER_OBJECT_DELETE_CHILDREN 2124

// DBSS-Backed Object Control
#macro DBSS_OBJECT_ACTIVATE_WITH_DEFAULTS 2200
#macro DBSS_OBJECT_ACTIVATE_WITH_DEFAULTS_OTHER 2201
#macro DBSS_OBJECT_GET_ACTIVATED 2207
#macro DBSS_OBJECT_GET_ACTIVATED_RESP 2208
#macro DBSS_OBJECT_DELETE_FIELD_DISK 2230
#macro DBSS_OBJECT_DELETE_FIELDS_DISK 2231
#macro DBSS_OBJECT_DELETE_DISK 2232

// Database Server Messages
#macro DBSERVER_CREATE_OBJECT 3000
#macro DBSERVER_CREATE_OBJECT_RESP 3001
#macro DBSERVER_OBJECT_GET_FIELD 3010
#macro DBSERVER_OBJECT_GET_FIELD_RESP 3011
#macro DBSERVER_OBJECT_GET_FIELDS 3012
#macro DBSERVER_OBJECT_GET_FIELDS_RESP 3013
#macro DBSERVER_OBJECT_GET_ALL 3014
#macro DBSERVER_OBJECT_GET_ALL_RESP 3015
#macro DBSERVER_OBJECT_SET_FIELD 3020
#macro DBSERVER_OBJECT_SET_FIELDS 3021
#macro DBSERVER_OBJECT_SET_FIELD_IF_EQUALS 3022
#macro DBSERVER_OBJECT_SET_FIELD_IF_EQUALS_RESP 3023
#macro DBSERVER_OBJECT_SET_FIELDS_IF_EQUALS 3024
#macro DBSERVER_OBJECT_SET_FIELDS_IF_EQUALS_RESP 3025
#macro DBSERVER_OBJECT_SET_FIELD_IF_EMPTY 3026
#macro DBSERVER_OBJECT_SET_FIELD_IF_EMPTY_RESP 3027
#macro DBSERVER_OBJECT_DELETE_FIELD 3030
#macro DBSERVER_OBJECT_DELETE_FIELDS 3031
#macro DBSERVER_OBJECT_DELETE 3032

// ClientAgent Messages
#macro CLIENTAGENT_SET_STATE 1000
#macro CLIENTAGENT_SET_CLIENT_ID 1001
#macro CLIENTAGENT_SEND_DATAGRAM 1002
#macro CLIENTAGENT_EJECT 1004
#macro CLIENTAGENT_DROP 1005
#macro CLIENTAGENT_DECLARE_OBJECT 1010
#macro CLIENTAGENT_UNDECLARE_OBJECT 1011
#macro CLIENTAGENT_ADD_SESSION_OBJECT 1012
#macro CLIENTAGENT_REMOVE_SESSION_OBJECT 1013
#macro CLIENTAGENT_SET_FIELDS_SENDABLE 1014
#macro CLIENTAGENT_OPEN_CHANNEL 1100
#macro CLIENTAGENT_CLOSE_CHANNEL 1101
#macro CLIENTAGENT_ADD_POST_REMOVE 1110
#macro CLIENTAGENT_CLEAR_POST_REMOVES 1111
#macro CLIENTAGENT_ADD_INTEREST 1200
#macro CLIENTAGENT_ADD_INTEREST_MULTIPLE 1201
#macro CLIENTAGENT_REMOVE_INTEREST 1203

enum ClientState {
    New,
    Anonymouse,
    Established
};

//
//	Global Initialization Logic
//

global.net_dcMod = dc_mod_load_from_file(DCFILE_PATH);

network_set_config(network_config_use_non_blocking_socket, true);
network_set_config(network_config_connect_timeout, NETWORK_TIMEOUT);
