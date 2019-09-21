/// @desc dc_file_add_class(dcFile, dcClass);
/// Adds a class to the DcFile
/// @param dcFile DcFile
/// @param dcClass DcClass

var dcFile = argument0;
var dcClass = argument1;

var className = dcClass[DcStruct.Name];
if (className == "")
	return false;

var typesByName = dcFile[DcFile.TypesByName];
var inserted = ds_map_add(typesByName, className, dcClass);
if (!inserted)
	return false;

var typesById = dcFile[DcFile.TypesById];
dcClass[@ DcStruct.Id] = ds_list_size(typesById);
ds_list_add(typesById, dcClass);
ds_list_add(dcFile[DcFile.Classes], dcClass);

return true;
