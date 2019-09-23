/// @desc dc_molecular_field_create(dcClass, name);
/// Creates a new DcField as a Molecule
/// @param dcClass DcClass
/// @param name string
/// @returns DcField

var dcFile = argument0;
var name = argument1;

var type = dc_struct_create(dcFile, name);
var this = dc_field_create(dcFile, name)
	this[@ DcField.Type] = type;
return this;
