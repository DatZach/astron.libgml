/// @func create_view_from_datagram(dg, [classPostfix]);
/// Creates a view encoded in a datagram
/// @context pObjectRepository
/// @param dg buffer
/// @param classPostfix string

var dg = argument[0];
var classPostfix = argument_count > 1 ? argument[1] : "";

var doId = dg_read(dg, dg_type_doid);
if (ds_map_exists(distributedObjects, doId))
	return noone;

var parentId = dg_read(dg, dg_type_doid);
var zoneId = dg_read(dg, dg_type_zone);
var dclassId = dg_read(dg, dg_type_u16);

var dclass = dc_class_find_id(global.net_dcMod, dclassId); // TODO Postfix
var distObj = do_create(dclass, dOid, parentId, zoneId);
distributedObjects[? doId] = distObj;

return distObj;
