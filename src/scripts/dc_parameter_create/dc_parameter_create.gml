/// @func dc_parameter_create(type, name);
/// Creates a new DcParameter
/// @param type DcDistributedType
/// @param name string
/// @returns DcParameter

enum DcParameter {
	Name,				// string
	Alias,				// string
	Type,				// DcDistributedType
	Method,				// DcMethod
	HasDefaultValue,	// bool
	DefaultValue,		// string
	
	sizeof
};

var type = argument0;
var name = argument1;

var obj = array_create(DcParameter.sizeof);
	obj[DcParameter.Name] = name;
	obj[DcParameter.Alias] = "";
	obj[DcParameter.Type] = type;
	obj[DcParameter.Method] = noone;
	obj[DcParameter.HasDefaultValue] = false;
	obj[DcParameter.DefaultValue] = ""; // TODO Implicit defaults
return obj;
