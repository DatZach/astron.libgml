/// @desc dc_file_get_class_by_id(file, classId);
/// Returns a DcClass given an ID
/// @param file DcFile
/// @param classId real
/// @returns dc_class | noone if error

// TODO Optimize me pl0x

var file = argument0;
var classId = argument1;

var classes = file[@ DcFile.Classes];

for (var i = 0, size = ds_list_size(classes); i < size; ++i) {
	var class = classes[| i];
	if (class[@ DcStruct.Id] == classId)
		return class;
}

return noone;
