var username = argument0;
var password = argument1;

assert_ancestor(doPointOfContact);

do_send_update("login", username, password);
