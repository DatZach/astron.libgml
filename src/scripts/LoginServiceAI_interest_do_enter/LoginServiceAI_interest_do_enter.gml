var view = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

if (parentId == GAME_ROOT_DO_ID && zoneId == WORLD_ZONE) {
	trace("LoginServiceAI learned of new World ", doId);
	worlds[? doId] = view;
}
