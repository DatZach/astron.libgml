var this = argument0;
var hashGenerator = argument1;

var parameters = this[DcMethodType.Parameters];
var parametersSize = ds_list_size(parameters);
dc_hashgen_add_int(hashGenerator, parametersSize);
for (var i = 0; i < parametersSize; ++i) {
	var parameter = parameters[| i];
	dc_parameter_generate_hash(parameter, hashGenerator);
}
