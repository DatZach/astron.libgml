
// 20,000 - 99,999: Fixed-ID Distributed Objects in StateServer
#macro POINT_OF_CONTACT_DO_ID 20000

#macro GAME_ROOT_DO_ID 30000
#macro GAME_ROOT_PARENT 0
#macro GAME_ROOT_ZONE 0
#macro LOGIN_SERVICE_ZONE 0
#macro WORLD_ZONE 1
#macro AI_SERVICES_ZONE 2

NetworkConfig();

instance_create_layer(0, 0, LAYER_INSTANCES, mServer);
instance_create_layer(0, 0, LAYER_INSTANCES, mClient);