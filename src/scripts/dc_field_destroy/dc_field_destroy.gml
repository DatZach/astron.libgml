/// @desc dc_field_destroy(field);
/// Frees a DcField
/// @param field DcField

var this = argument0;

ds_list_destroy(this[DcField.Keywords]);
