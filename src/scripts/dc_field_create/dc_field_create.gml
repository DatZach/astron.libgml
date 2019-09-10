/// @desc dc_field_create(type, name);
/// Creates a new DcField
/// @param type DcDistributedType
/// @param string name
/// @returns DcField

enum DcField {
	Keywords,				// list<string>
	Struct,					// DcStruct
	Id,						// real
	Name,					// string
	Type,					// DcDistributedType
	HasDefaultValue,		// bool
	DefaultValue,			// string
	
	sizeof
}

var type = argument0;
var name = argument1;

var value = array_create(DcField.sizeof);
	value[DcField.Keywords] = ds_list_create();
	value[DcField.Struct] = noone;
	value[DcField.Id] = 0;
	value[DcField.Name] = name;
	value[DcField.Type] = type;
	value[DcField.HasDefaultValue] = false;
	value[DcField.DefaultValue] = "";
return value;
