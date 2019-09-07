var sender = argument0;
var username = argument1;
var password = argument2;

trace("PointOfContactUD_login ", username, " ", password);

if (username == "guest" && password == "guest") {
	with (self.repo)
		send_clientagent_set_state(sender, ClientState.Established, other.doId);
}
else {
	with (self.repo)
		send_clientagent_eject(sender, 122, "Invalid credentials.", other.doId);
}