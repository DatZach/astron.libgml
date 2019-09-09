/// @func or_create_do_view_from_datagram(dg, [classPostfix]);
/// Creates a view encoded in a datagram
/// @context pObjectRepository
/// @param dg buffer
/// @param classPostfix string
/// @returns pDistributedObject

assert_ancestor(pObjectRepository);

var dg = argument[0];
var classPostfix = argument_count > 1 ? argument[1] : "";

var doId = dg_read(dg, dg_type_doid);
if (ds_map_exists(self.distributedObjects, doId))
	return noone;

var parentId = dg_read(dg, dg_type_doid);
var zoneId = dg_read(dg, dg_type_zone);
var dclassId = dg_read(dg, dg_type_u16);

var dclass = dc_class_find_id(global.net_dcMod, dclassId);
if (classPostfix != "")
	dclass = dc_class_find_name(global.net_dcMod, dclass[? "name"] + classPostfix);

var distObj = do_create(dclass, doId, parentId, zoneId);
self.distributedObjects[? doId] = distObj;

return distObj;
