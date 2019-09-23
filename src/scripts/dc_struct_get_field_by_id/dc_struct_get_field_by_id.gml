/// @desc dc_struct_get_field_by_id(struct, fieldId);
/// Returns a DcField given a fieldId
/// @param struct DcStruct
/// @param fieldId real
/// @returns DcField | noone if error

var dcStruct = argument0;
var fieldId = argument1;

var fieldsById = dcStruct[DcStruct.FieldsById];
var field = fieldsById[? fieldId];
return field == undefined ? noone : field;
