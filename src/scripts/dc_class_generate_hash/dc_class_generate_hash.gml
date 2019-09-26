var dcClass = argument0;
var hashGenerator = argument1;

dc_type_generate_hash(dcClass, hashGenerator);
dc_hashgen_add_string(hashGenerator, dcClass[DcStruct.Name]);

var parents = dcClass[DcClass.Parents];
var parentsSize = ds_list_size(parents);
dc_hashgen_add_int(hashGenerator, parentsSize);
for (var i = 0; i < parentsSize; ++i) {
	var parent = parents[| i];
	dc_hashgen_add_int(hashGenerator, parent[DcStruct.Id]);
}

var constructor = dcClass[DcClass.Constructor];
if (constructor != noone)
	dc_field_generate_hash(constructor, hashGenerator);

var baseFields = dcClass[DcClass.BaseFields];
var baseFieldsSize = ds_list_size(baseFields);
dc_hashgen_add_int(hashGenerator, baseFieldsSize);
for (var i = 0; i < baseFieldsSize; ++i) {
	var baseField = baseFields[| i];
	dc_field_generate_hash(baseField, hashGenerator);
}
