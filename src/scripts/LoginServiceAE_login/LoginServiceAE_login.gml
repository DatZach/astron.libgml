var clientChannel = argument0;
var username = argument1;
var password = argument2;

assert_ancestor(doPointOfContact);

trace("LoginServiceAE ", doId, " received login request for ", clientChannel);

do_send_update("login", clientChannel, username, password);
