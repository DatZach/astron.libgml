/// @func dc_type_method_create();
/// Creates a new DcMethodType
/// @returns DcMethodType

enum DcMethodType {
	Parameters = DcDistributedType.sizeof,	// list<DcParameter>
	ParametersByName,						// map<string, DcParameter>
	HasConstraint,
	
	sizeof
}

var obj = array_create(DcMethodType.sizeof);
	obj[DcDistributedType.Type] = DcType.Method;
	obj[DcDistributedType.Size] = 0;
	obj[DcDistributedType.Alias] = "";
	obj[DcDistributedType.Range] = noone;
	obj[DcDistributedType.SCR_GenerateHash] = dc_type_method_generate_hash;
	obj[DcMethodType.Parameters] = ds_list_create();
	obj[DcMethodType.ParametersByName] = ds_map_create();
	obj[DcMethodType.HasConstraint] = false;
return obj;
