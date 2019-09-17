/// @desc dc_file_add_field(dcFile, field);
/// Adds a field to the DcFile
/// @param dcFile DcFile
/// @param field DcField

var dcFile = argument0;
var field = argument1;

var fieldsById = dcFile[DcFile.FieldsById];
field[@ DcField.Id] = ds_list_size(fieldsById);
ds_list_add(fieldsById, field);
