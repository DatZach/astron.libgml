/// @func dc_class_create(dcFile, name);
/// Creates a new DcClass
/// @param dcFile DcFile
/// @param name string
/// @returns DcClass

enum DcClass {
	Constructor = DcStruct.sizeof,	// DcField
	BaseFields,						// list<DcField>
	BaseFieldsByName,				// map<string, DcFields>
	Parents,						// list<DcClass>
	Children,						// list<DcClass>
	
	sizeof
}

var dcFile = argument0;
var name = argument1;

var value = array_create(DcClass.sizeof);
	value[DcDistributedType.Type] = DcType.Struct;
	value[DcDistributedType.Size] = 0;
	value[DcDistributedType.Alias] = "";
	value[DcDistributedType.Range] = noone;
	value[DcStruct.File] = dcFile;
	value[DcStruct.Id] = 0;
	value[DcStruct.Name] = name;
	value[DcStruct.Fields] = ds_list_create();
	value[DcStruct.FieldsByName] = ds_map_create();
	value[DcStruct.FieldsById] = ds_map_create();
	value[DcStruct.HasConstraint] = false;
	value[DcClass.Constructor] = noone;
	value[DcClass.BaseFields] = ds_list_create();
	value[DcClass.BaseFieldsByName] = ds_map_create();
	value[DcClass.Parents] = ds_list_create();
	value[DcClass.Children] = ds_list_create();
return value;
