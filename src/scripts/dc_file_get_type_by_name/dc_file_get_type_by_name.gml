var dcFile = argument0;
var typeName = argument1;

var value = ds_map_find_value(dcFile[DcFile.TypesByName], typeName)
return is_undefined(value) ? noone : value;
