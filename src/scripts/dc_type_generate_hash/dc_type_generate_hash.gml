var dcDistType = argument0;
var hashGenerator = argument1;

dc_hashgen_add_int(hashGenerator, dcDistType[DcDistributedType.Type]);
if (dcDistType[DcDistributedType.Alias] != "")
	dc_hashgen_add_string(hashGenerator, dcDistType[DcDistributedType.Alias]);

if (dcDistType[DcDistributedType.SCR_GenerateHash] != undefined)
	script_execute(dcDistType[DcDistributedType.SCR_GenerateHash], dcDistType, hashGenerator);
