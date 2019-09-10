/// @desc dc_class_field_find_id(class, fieldId);
/// Returns a DcField in a DcClass given a name
/// @param class DcClass
/// @param fieldId real
/// @returns DcField | noone if error

gml_pragma("forceinline");
return dc_struct_get_field_by_id(argument0, argument1);
