var dcField = argument0;
var hashGenerator = argument1;

dc_hashgen_add_int(hashGenerator, dcField[DcField.Id]);
dc_hashgen_add_string(hashGenerator, dcField[DcField.Name]);
dc_type_generate_hash(dcField[DcField.Type], hashGenerator);

var keywords = dcField[DcField.Keywords];
var keywordsSize = ds_list_size(keywords);
for (var i = 0; i < keywordsSize; ++i) {
	var keyword = keywords[| i];
	dc_hashgen_add_string(hashGenerator, keyword);
}
