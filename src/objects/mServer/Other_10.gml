/// @desc Connected

event_inherited();
trace("mServer: Connected!");

send_control_set_connection_name("Point of Contact");
or_create_dog_view("PointOfContactUD", POINT_OF_CONTACT_DO_ID, true);
ir_add_ai_interest(GAME_ROOT_DO_ID, LOGIN_SERVICE_ZONE, false);

ir_create_do("GameRoot", GAME_ROOT_DO_ID, 0, 0, true);

//ir_create_do_db("World", GAME_ROOT_DO_ID, WORLD_ZONE, true);

ir_create_do_db("LoginService", GAME_ROOT_DO_ID, LOGIN_SERVICE_ZONE, true);

//ir_create_do_db("AIServer", GAME_ROOT_DO_ID, AI_SERVICES_ZONE, true);

