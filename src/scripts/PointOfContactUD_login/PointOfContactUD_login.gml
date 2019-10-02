var sender = argument0;
var username = argument1;
var password = argument2;

trace("Received login request for ", sender);

if (ds_map_size(loginServices) > 0) {
	var view = ds_map_find_first(loginServices);
	with (view)
		LoginServiceAE_login(sender, username, password);
}
else {
	trace("Dropping connection attempt due to missing LoginService");
	with (self.repo)
		send_clientagent_eject(sender, 999, "Server isn't ready for logins", other.doId);
}