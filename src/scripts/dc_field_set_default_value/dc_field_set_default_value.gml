/// @desc dc_field_set_default_value(type, value);
/// Sets the default value of a DcField
/// @param type DcDistributedType
/// @returns DcField

var type = argument0;
var value = argument1;

type[@ DcField.HasDefaultValue] = true;
type[@ DcField.DefaultValue] = value;
