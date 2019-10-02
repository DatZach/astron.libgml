var sender = argument0;
var doId = argument1;
var newParent = argument2;
var newZone = argument3;
var oldParent = argument4;
var oldZone = argument5;

var objectName = object_get_name(self.object_index);
var scriptName = objectName + "_interest_changing_location_enter";
var scriptIdx = asset_get_index(scriptName);
if (scriptIdx == -1) {
	warn(scriptName + " is not overridden");
	return;
}

return script_execute_va(
	scriptIdx,
	[sender, doId, newParent, newZone, oldParent, oldZone]
);
