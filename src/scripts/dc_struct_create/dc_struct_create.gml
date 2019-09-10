/// @func dc_struct_create(dcFile);
/// Creates a new DcStruct
/// @param dcFile DcFile
/// @returns DcStruct

enum DcStruct {
	File = DcType.sizeof,	// DcFile
	Id,						// real
	Name,					// string
	Fields,					// list<DcField>
	HasConstraint,			// bool
	
	sizeof
}

var dcFile = argument0;

var value = array_create(DcStruct.sizeof);
	value[DcDistributedType.Type] = DcType.Invalid;
	value[DcDistributedType.Size] = 0;
	value[DcDistributedType.Alias] = "";
	value[DcStruct.File] = dcFile;
	value[DcStruct.Id] = 0;
	value[DcStruct.Name] = "";
	value[DcStruct.Fields] = ds_list_create();
	value[DcStruct.HasConstraint] = false;
return value;
