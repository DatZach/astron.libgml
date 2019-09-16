/// @desc dc_file_create();
/// @returns DcFile
/// Creates a new DistributedClass File

enum DcFile {
	Structs,			// list<DcStruct>
	Classes,			// list<DcClass>
	Imports,			// list<DcImport>
	Keywords,			// list<string>
	TypesById,			// list<DcDistributedType>
	TypesByName,		// map<string, DcDistributedType>
	
	sizeof
}

var obj = array_create(DcFile.sizeof);
	obj[DcFile.Structs] = ds_list_create();
	obj[DcFile.Classes] = ds_list_create();
	obj[DcFile.Imports] = ds_list_create();
	obj[DcFile.Keywords] = ds_list_create();
	obj[DcFile.TypesById] = ds_list_create();
	obj[DcFile.TypesByName] = ds_map_create();
	
	dc_file_add_keyword(obj, "required");
	dc_file_add_keyword(obj, "ram");
	dc_file_add_keyword(obj, "db");
	dc_file_add_keyword(obj, "broadcast");
	dc_file_add_keyword(obj, "clrecv");
	dc_file_add_keyword(obj, "clsend");
	dc_file_add_keyword(obj, "ownsend");
	dc_file_add_keyword(obj, "ownrecv");
	dc_file_add_keyword(obj, "airecv");
return obj;
