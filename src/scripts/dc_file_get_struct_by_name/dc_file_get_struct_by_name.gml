/// @desc dc_file_get_struct_by_name(file, structName);
/// Returns a DcStruct given an name
/// @param file DcFile
/// @param structName string
/// @returns DcStruct | noone if error

// TODO Optimize me pl0x

var file = argument0;
var structName = argument1;

var structs = file[@ DcFile.Structs];

for (var i = 0, size = ds_list_size(structs); i < size; ++i) {
	var dcStruct = structs[| i];
	if (dcStruct[@ DcStruct.Name] == structName)
		return dcStruct;
}

return noone;
