/// @desc dc_file_get_hash(dcFile);
/// Calculates a hashcode for the DcFile
/// @param dcFile DcFile
/// @returns real

var dcFile = argument0;

var hg = dc_hashgen_create();

var classes = dcFile[DcFile.Classes];
var classesLength = ds_list_size(classes);
var structs = dcFile[DcFile.Structs];
var structsLength = ds_list_size(structs);

dc_hashgen_add_int(hg, 1);
dc_hashgen_add_int(hg, structsLength + classesLength);

var typesById = dcFile[DcFile.TypesById];
for (var i = 0, isize = ds_list_size(typesById); i < isize; ++i) {
	var type = typesById[| i];
	if (dc_file_get_class_by_id(dcFile, i) != noone)
		dc_class_generate_hash(type, hg);
	else
		dc_struct_generate_hash(type, hg);
}

var hash = dc_hashgen_get_hash(hg);
dc_hashgen_destroy(hg);

return hash;
