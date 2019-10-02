var view = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

trace("PointOfContactUD learned of a new LoginService ", doId);

if (parentId == GAME_ROOT_DO_ID && zoneId == LOGIN_SERVICE_ZONE)
	loginServices[? doId] = view;
