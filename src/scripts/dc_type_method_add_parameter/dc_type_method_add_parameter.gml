/// @func dc_type_method_add_parameter(method, parameter);
/// Adds a DcParameter to a DcMethod
/// @param method DcMethod
/// @param parameter DcParameter

var method = argument0;
var parameter = argument1;

var parameterName = parameter[DcParameter.Name];
if (parameterName != "") {
	var parametersByName = method[DcMethodType.ParametersByName];
	var inserted = ds_map_add(parametersByName, parameterName, parameter);
	if (!inserted)
		return false;
}

parameter[@ DcParameter.Method] = method;
var parameters = method[DcMethodType.Parameters];
ds_list_add(parameters, parameter);

var parameterType = parameter[DcParameter.Type];
if (method[DcDistributedType.Size] != 0 || ds_list_size(parameters) == 1)
	method[@ DcDistributedType.Size] += parameterType[DcDistributedType.Size];

if (!method[DcStruct.HasConstraint] && parameterType[DcDistributedType.Range] != noone)
	method[@ DcStruct.HasConstraint] = true;

return true;
