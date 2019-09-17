/// @desc dc_struct_add_field(dcStruct, field);
/// Adds a field to the DcStruct
/// @param dcStruct DcStruct
/// @param field DcField

var dcStruct = argument0;
var field = argument1;

if (field[DcField.Struct] == dcStruct)
	return false;

// TODO Check if molecule
if (field[DcField.Type] == DcType.Method)
	return false;

if (field[DcField.Name] != "") {
	if (field[DcField.Name] == dcStruct[DcStruct.Name])
		return false;
	
	var fieldsByName = dcStruct[DcStruct.FieldsByName];
	var inserted = ds_map_add(fieldsByName, field[DcField.Name], field);
	if (!inserted)
		return false;
}

var dcFile = dcStruct[DcStruct.File];
dc_file_add_field(dcFile, field);
var fieldsById = dcStruct[DcStruct.FieldsById];
ds_map_add(fieldsById, field[DcField.Id], field);

var fields = dcStruct[DcStruct.Fields];
ds_list_add(fields, field);

var fieldType = field[DcField.Type];
if (dcStruct[DcDistributedType.Size] != 0 || ds_list_size(fields) == 1)
	dcStruct[@ DcDistributedType.Size] += fieldType[DcDistributedType.Size];

if (!dcStruct[DcStruct.HasConstraint] && fieldType[DcDistributedType.Range] != noone)
	dcStruct[@ DcStruct.HasConstraint] = true;
	
return true;
