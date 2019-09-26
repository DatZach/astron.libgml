var dcStruct = argument0;
var hashGenerator = argument1;

dc_type_generate_hash(dcStruct, hashGenerator);
dc_hashgen_add_string(hashGenerator, dcStruct[DcStruct.Name]);

var fields = dcStruct[DcStruct.Fields];
var fieldsSize = ds_list_size(fields);
dc_hashgen_add_int(hashGenerator, fieldsSize);
for (var i = 0; i < fieldsSize; ++i) {
	var field = fields[| i];
	dc_field_generate_hash(hashGenerator, field);
}
