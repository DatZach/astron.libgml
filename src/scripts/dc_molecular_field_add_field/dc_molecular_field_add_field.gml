/// @desc dc_molecular_field_add_field(molecularField, field);
/// Adds a new field or a MolecularField
/// @param molecularField DcField
/// @param field DcField

var thisField = argument0;
var field = argument1;

if (dc_field_is_molecular(field))
	return false;

// Copy our keywords from the first added field
var thisStruct = thisField[DcField.Type];
var fields = thisStruct[DcStruct.Fields];
if (ds_list_size(fields) == 0) {
	ds_list_destroy(thisField[DcField.Keywords]);
	thisField[@ DcField.Keywords] = field[DcField.Keywords];
}
else {
	// Otherwise, each field has to have the same keywords
	// order is not important
	var thisKeywords = thisField[DcField.Keywords];
	var otherKeywords = field[DcField.Keywords];
	var isize = ds_list_size(thisKeywords);
	var jsize = ds_list_size(otherKeywords);
	if (isize != jsize)
		return false;
	
	for (var i = 0; i < isize; ++i) {
		var found = false;
		for (var j = 0; j < jsize; ++j) {
			if (thisKeywords[| i] != otherKeywords[| j])
				continue;
				
			found = true;
			break;
		}
		
		if (!found)
			return false;
	}
}

ds_list_add(fields, field);

var fieldType = field[DcField.Type];
if (thisStruct[DcDistributedType.Size] != 0 || ds_list_size(fields) == 1)
	thisStruct[@ DcDistributedType.Size] += fieldType[DcDistributedType.Size];

if (thisField[DcField.HasDefaultValue] || ds_list_size(fields) == 1) {
	if (field[DcField.HasDefaultValue])
		thisField[@ DcField.HasDefaultValue] = true;
	
	thisField[@ DcField.DefaultValue] += field[DcField.DefaultValue];
}

return true;
