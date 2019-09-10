/// @desc dc_class_field_find_name(class, fieldName);
/// Returns a dc_field in a dc_class given a name
/// @param class dc_class
/// @param fieldName string
/// @returns DcField | noone if error

gml_pragma("forceinline");
return dc_struct_get_field_by_name(argument0, argument1);
