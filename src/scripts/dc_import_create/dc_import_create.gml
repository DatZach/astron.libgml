/// @func dc_import_create(moduleName);
/// Creates a new DcImport
/// @param moduleName string
/// @returns DcImport

enum DcImport {
	Module,				// string
	Symbols,			// list<string>
	
	sizeof
}

var moduleName = argument0;

var value = array_create(DcImport.sizeof);
	value[DcImport.Module] = moduleName;
	value[DcImport.Symbols] = ds_list_create();
return value;
