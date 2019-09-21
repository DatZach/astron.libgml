/// @desc dc_field_set_default_value(field, value);
/// Sets the default value of a DcField
/// @param field DcField
/// @param value string

var field = argument0;
var value = argument1;

field[@ DcField.HasDefaultValue] = true;
field[@ DcField.DefaultValue] = value;
