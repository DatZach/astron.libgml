/// @desc Initialized

var username = "guest";
var password = "guest";

var poc = create_distobjglobal_view("PointOfContact", POINT_OF_CONTACT_DO_ID, false);
with(poc) PointOfContact_login(username, password);
