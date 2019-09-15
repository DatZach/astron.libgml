/// @desc dc_file_add_import(dcFile, import);
/// Adds a import to the DcFile
/// @param dcFile DcFile
/// @param import DcImport

var dcFile = argument0;
var import = argument1;

var imports = dcFile[DcFile.Imports];
ds_list_add(imports, import);
