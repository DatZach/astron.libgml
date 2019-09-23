/// @desc dc_struct_get_field_by_name(struct, fieldId);
/// Returns a DcField given a fieldId
/// @param struct DcStruct
/// @param fieldId real
/// @returns DcField | noone if error

var dcStruct = argument0;
var fieldName = argument1;

var fieldsByName = dcStruct[DcStruct.FieldsByName];
var field = fieldsByName[? fieldName];
return field == undefined ? noone : field;
