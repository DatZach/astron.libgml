/// @desc dc_file_get_hash(dcFile);
/// Calculates a hashcode for the DcFile
/// @param dcFile DcFile
/// @returns real

var dcFile = argument0;

var hg = dc_hashgen_create();

var classes = dcFile[DcFile.Classes];
var classesLength = ds_list_size(classes);
dc_hashgen_add_int(hg, classesLength);
for (var i = 0; i < classesLength; ++i)
	dc_class_generate_hash(classes[| i], hg);

var structs = dcFile[DcFile.Structs];
var structsLength = ds_list_size(structs);
dc_hashgen_add_int(hg, structsLength);
for (var i = 0; i < structsLength; ++i)
	dc_struct_generate_hash(structs[| i], hg);

var keywords = dcFile[DcFile.Keywords];
var keywordsLength = ds_list_size(structs);
dc_hashgen_add_int(hg, keywordsLength);
for (var i = 0; i < keywordsLength; ++i)
	dc_hashgen_add_string(hg, keywords[| i]);

var hash = dc_hashgen_get_hash(hg);
dc_hashgen_destroy(hg);

return hash;
