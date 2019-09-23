/// @desc dc_field_is_molecular(field);
/// Returns if a field is a module or not
/// @param field DcField
/// @returns bool

var field = argument0;

var fieldType = field[DcField.Type];
return fieldType[DcDistributedType.Type] == DcType.Struct
	&& fieldType[DcStruct.Name] == field[DcField.Name];
