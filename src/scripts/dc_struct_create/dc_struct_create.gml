/// @func dc_struct_create(dcFile, name);
/// Creates a new DcStruct
/// @param dcFile DcFile
/// @param name string
/// @returns DcStruct

enum DcStruct {
	File = DcDistributedType.sizeof,	// DcFile
	Id,						// real
	Name,					// string
	Fields,					// list<DcField>
	FieldsByName,			// map<string, DcField>
	FieldsById,				// map<real, DcField>
	HasConstraint,			// bool
	
	sizeof
}

var dcFile = argument0;
var name = argument1;

var value = array_create(DcStruct.sizeof);
	value[DcDistributedType.Type] = DcType.Struct;
	value[DcDistributedType.Size] = 0;
	value[DcDistributedType.Alias] = "";
	value[DcStruct.File] = dcFile;
	value[DcStruct.Id] = 0;
	value[DcStruct.Name] = name;
	value[DcStruct.Fields] = ds_list_create();
	value[DcStruct.FieldsByName] = ds_map_create();
	value[DcStruct.FieldsById] = ds_map_create();
	value[DcStruct.HasConstraint] = false;
return value;
