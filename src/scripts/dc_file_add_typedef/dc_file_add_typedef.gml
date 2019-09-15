/// @desc dc_file_add_typedef(dcFile, name, type);
/// Adds a typedef to the DcFile
/// @param dcFile DcFile
/// @param name string
/// @param type DcDistributedType

var dcFile = argument0;
var name = argument1;
var type = argument2;

var types = dcFile[DcFile.TypesByName];
return ds_map_add(types, name, type);
