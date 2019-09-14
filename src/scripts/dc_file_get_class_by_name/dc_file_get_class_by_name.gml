/// @desc dc_file_get_class_by_name(file, className);
/// Returns a DcClass given an name
/// @param file DcFile
/// @param className string
/// @returns DcClass | noone if error

// TODO Optimize me pl0x

var file = argument0;
var className = argument1;

var classes = file[@ DcFile.Classes];

for (var i = 0, size = ds_list_size(classes); i < size; ++i) {
	var class = classes[| i];
	if (class[@ DcStruct.Name] == className)
		return class;
}

return noone;
