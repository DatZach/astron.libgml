var sender = argument0;
var clientChannel = argument1;
var username = argument2;
var password = argument3;

trace("LoginServiceAI ", doId, " recieved login request for ", doId);

if (username == "guest" && password == "guest") {
	trace("Successful login!");
	with(repo)
		send_clientagent_set_state(clientChannel, 2, other.doId);
}
else {
	trace("Bad credentials");
	send_clientagent_eject(clientChannel, 122, "Bad credentials", self.doId);
}
