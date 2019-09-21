/// @desc dc_file_has_keyword(dcFile, keyword);
/// Returns if DcFile has a keyword
/// @param dcFile DcFile
/// @param keyword string
/// @returns bool

var dcFile = argument0;
var keyword = argument1;

var keywords = dcFile[DcFile.Keywords];
return ds_list_find_index(keywords, keyword) != -1;
