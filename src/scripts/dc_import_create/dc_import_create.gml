/// @func dc_import_create(moduleName);
/// Creates a new DcImport
/// @param module string
/// @param symbols string[]
/// @returns DcImport

enum DcImport {
	Module,				// string
	Symbols,			// string[]
	
	sizeof
}

var module = argument0;
var symbols = argument1;

var value = array_create(DcImport.sizeof);
	value[DcImport.Module] = module;
	value[DcImport.Symbols] = symbols;
return value;
