/// @desc Connected

event_inherited();
trace("mServer: Connected!");

send_control_set_connection_name("Point of Contact");
or_create_dog_view("PointOfContactUD", POINT_OF_CONTACT_DO_ID, true);
//add_ai_interest(GAME_ROOT_DO_ID, LOGIN_SERVICE_ZONE, false);
