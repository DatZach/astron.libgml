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

var dclass = dc_file_get_class_by_id(global.net_dcFile, dclassId);
var className = dclass[DcStruct.Name] + classPostfix;

var distObj = do_create(className, doId, parentId, zoneId);
self.distributedObjects[? doId] = distObj;

return distObj;
