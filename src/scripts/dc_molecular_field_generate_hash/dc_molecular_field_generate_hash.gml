var this = argument0;
var hashGenerator = argument1;

dc_hashgen_add_string(hashGenerator, this[DcField.Name]);
dc_hashgen_add_int(hashGenerator, this[DcField.Id]);

var thisStruct = this[DcField.Type];
var fields = thisStruct[DcStruct.Fields];
var fieldsSize = ds_list_size(fields);
dc_hashgen_add_int(hashGenerator, fieldsSize);
for (var i = 0; i < fieldsSize; ++i) {
	var field = fields[| i];
	dc_field_generate_hash(field, hashGenerator);
}
