/// @func location_to_parent_zone(location);
/// Returns parent:zone given location
/// @param location real

gml_pragma("forceinline");

var location = argument0;

return [
	location >> 32,
	location % (2 << 32)
];
