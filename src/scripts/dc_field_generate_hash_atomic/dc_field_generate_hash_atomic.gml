var dcField = argument0;
var hashGenerator = argument1;

var fieldType = dcField[DcField.Type];
if (fieldType[DcDistributedType.Type] == DcType.Method) {
	dc_hashgen_add_string(hashGenerator, dcField[DcField.Name]);
	dc_hashgen_add_int(hashGenerator, dcField[DcField.Id]);
	
	var parameters = fieldType[DcMethodType.Parameters];
	var parametersSize = ds_list_size(parameters);
	dc_hashgen_add_int(hashGenerator, parametersSize);
	for (var i = 0; i < parametersSize; ++i) {
		var parameter = parameters[| i];
		dc_parameter_generate_hash(parameter, hashGenerator);
	}
	
	dc_field_keywords_generate_hash(dcField, hashGenerator);
	return;
}

if (ds_list_size(dcField[DcField.Keywords]) != 0)
	dc_field_keywords_generate_hash(dcField, hashGenerator);

dc_type_generate_hash(dcField[DcField.Type], hashGenerator);
