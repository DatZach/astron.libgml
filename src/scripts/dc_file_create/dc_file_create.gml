/// @desc dc_file_create();
/// @returns DcFile
/// Creates a new DistributedClass File

enum DcFile {
	Structs,			// list<DcStruct>
	Classes,			// list<DcClass>
	Imports,			// list<DcImport>
	Keywords,			// list<string>
	
	sizeof
}

var value = array_create(DcFile.sizeof);
	value[DcFile.Structs] = ds_list_create();
	value[DcFile.Classes] = ds_list_create();
	value[DcFile.Imports] = ds_list_create();
	value[DcFile.Keywords] = ds_list_create();
return value;
