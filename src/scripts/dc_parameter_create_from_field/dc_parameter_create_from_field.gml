/// @func dc_parameter_create_from_field(field);
/// Creates a new DcParameter from a given DcField
/// @param field DcField
/// @returns DcParameter

var field = argument0;

var obj = array_create(DcParameter.sizeof);
	obj[DcParameter.Name] = field[DcField.Name];
	obj[DcParameter.Alias] = "";
	obj[DcParameter.Type] = field[DcField.Type];
	obj[DcParameter.Method] = noone;
	obj[DcParameter.HasDefaultValue] = field[DcField.HasDefaultValue];
	obj[DcParameter.DefaultValue] = field[DcField.DefaultValue];
return obj;
