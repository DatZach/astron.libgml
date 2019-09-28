var this = argument0; // DcDistType
var hashGenerator = argument1;

switch (this[DcDistributedType.Type]) {
	case DcType.Struct: {
		if (dc_file_get_class_by_id(this[DcStruct.File], this[DcStruct.Id]) != noone)
			dc_class_generate_hash(this, hashGenerator);
		else
			dc_struct_generate_hash(this, hashGenerator);
		break;
	}
	
	case DcType.Array:
	case DcType.VarArray: {
		dc_type_generate_hash(this[DcArrayType.ElementType], hashGenerator);
		if (this[DcArrayType.ArrayRange] != noone) {
			var range = this[DcArrayType.ArrayRange];
			dc_hashgen_add_int(hashGenerator, 1);
			dc_hashgen_add_int(hashGenerator, int64(range[0]));
			dc_hashgen_add_int(hashGenerator, int64(range[1]));
		}
		break;
	}
	
	case DcType.Blob:
	case DcType.VarBlob: {
		dc_hashgen_add_int(hashGenerator,
			this[DcDistributedType.Alias] == "blob" ? 10 : 4);
		dc_hashgen_add_int(hashGenerator, 1);
		
		if (this[DcArrayType.ArrayRange] != noone) {
			var range = this[DcArrayType.ArrayRange];
			dc_hashgen_add_int(hashGenerator, 1);
			dc_hashgen_add_int(hashGenerator, int64(range[0]));
			dc_hashgen_add_int(hashGenerator, int64(range[1]));
		}
		break;
	}
	
	case DcType.String:
	case DcType.VarString: {
		dc_hashgen_add_int(hashGenerator,
			this[DcDistributedType.Alias] == "string" ? 9 : 19);
		dc_hashgen_add_int(hashGenerator, 1);
		
		if (this[DcArrayType.ArrayRange] != noone) {
			var range = this[DcArrayType.ArrayRange];
			dc_hashgen_add_int(hashGenerator, 1);
			dc_hashgen_add_int(hashGenerator, int64(range[0]));
			dc_hashgen_add_int(hashGenerator, int64(range[1]));
		}
		break;
	}
	
	case DcType.Int8:
	case DcType.Int16:
	case DcType.Int32:
	case DcType.Int64:
	case DcType.UInt8:
	case DcType.UInt16:
	case DcType.UInt32:
	case DcType.UInt64:
	case DcType.Char: {
		dc_hashgen_add_int(hashGenerator,
			this[DcDistributedType.Type] == DcType.Char
			? 19 : this[DcDistributedType.Type]);
		dc_hashgen_add_int(hashGenerator, this[DcNumericType.Divisor]);
		
		if (this[DcNumericType.OrigModulus] != 0) {
			var modulus = int64(floor(this[DcNumericType.OrigModulus] * this[DcNumericType.Divisor] + 0.5));
			dc_hashgen_add_int(hashGenerator, modulus);
		}
		if (this[DcNumericType.OrigRange] != noone) {
			var range = this[DcNumericType.OrigRange];
			dc_hashgen_add_int(hashGenerator, 1);
			dc_hashgen_add_int(hashGenerator, int64(floor(range[0] * this[DcNumericType.Divisor] + 0.5)));
			dc_hashgen_add_int(hashGenerator, int64(floor(range[1] * this[DcNumericType.Divisor] + 0.5)));
		}
		break;
	}
	
	case DcType.Float64: {
		dc_hashgen_add_int(hashGenerator, 8);
		dc_hashgen_add_int(hashGenerator, this[DcNumericType.Divisor]);
		
		if (this[DcNumericType.OrigModulus] != 0) {
			var modulus = int64(this[DcNumericType.OrigModulus] * this[DcNumericType.Divisor]);
			dc_hashgen_add_int(hashGenerator, modulus);
		}
		if (this[DcNumericType.OrigRange] != noone) {
			var range = this[DcNumericType.OrigRange];
			dc_hashgen_add_int(hashGenerator, 1);
			dc_hashgen_add_int(hashGenerator, int64(range[0] * this[DcNumericType.Divisor]));
			dc_hashgen_add_int(hashGenerator, int64(range[1] * this[DcNumericType.Divisor]));
		}
		break;
	}
	default:
		show_error("Cannot hash type: " + string(this[DcDistributedType.Type]), true);
}

//dc_hashgen_add_int(hashGenerator, dcDistType[DcDistributedType.Type]);
//if (dcDistType[DcDistributedType.Alias] != "")
//	dc_hashgen_add_string(hashGenerator, dcDistType[DcDistributedType.Alias]);

//if (dcDistType[DcDistributedType.SCR_GenerateHash] != undefined)
//	script_execute(dcDistType[DcDistributedType.SCR_GenerateHash], dcDistType, hashGenerator);
