/// @desc dc_file_add_keyword(dcFile, keyword);
/// Adds a keyword to the DcFile
/// @param dcFile DcFile
/// @param keyword string

var dcFile = argument0;
var keyword = argument1;

if (!dc_file_has_keyword(dcFile, keyword)) {
	var keywords = dcFile[DcFile.Keywords];
	ds_list_add(keywords, keyword);
}
