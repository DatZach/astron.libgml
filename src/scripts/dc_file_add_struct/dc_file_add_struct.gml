/// @desc dc_file_add_struct(dcFile, dcStruct);
/// Adds a struct to the DcFile
/// @param dcFile DcFile
/// @param dcStruct DcStruct

var dcFile = argument0;
var dcStruct = argument1;

var typesByName = dcFile[DcFile.TypesByName];
var typesById = dcFile[DcFile.TypesById];

var inserted = ds_map_add(typesByName, dcStruct[DcStruct.Name], dcStruct);
if (!inserted)
	return false;

dcStruct[@ DcStruct.Id] = ds_list_size(typesById);
ds_list_add(typesById, dcStruct);

ds_list_add(dcFile[DcFile.Structs], dcStruct);
