/// @desc do_raise_interest_do_enter(view, doId, parentId, zoneId);
/// Notifies a DO that a DO it specified interest in has entered a location

var view = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

var objectName = object_get_name(self.object_index);
var scriptName = objectName + "_interest_do_enter";
var scriptIdx = asset_get_index(scriptName);
if (scriptIdx == -1) {
	warn(scriptName + " is not overridden");
	return;
}

return script_execute_va(
	scriptIdx,
	[view, doId, parentId, zoneId]
);
