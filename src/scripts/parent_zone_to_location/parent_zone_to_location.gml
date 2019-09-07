/// @func parent_zone_to_location(parentId, zoneId);
/// Returns location given parent:zone
/// @param parentId real
/// @param zoneId real

gml_pragma("forceinline");

var parentId = argument0;
var zoneId = argument1;

return parentId;
return (parentId << 32) | zoneId;
