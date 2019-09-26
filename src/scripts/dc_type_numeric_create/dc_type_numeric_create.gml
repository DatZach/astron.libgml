/// @func dc_type_numeric_create(type);
/// Creates a new DcNumericType
/// @param type DcType
/// @returns DcNumericType

enum DcNumericType {
	Divisor = DcDistributedType.sizeof,	// real
	OrigModulus,						// real
	OrigRange,							// [real, real]
	Modulus,							// real
	
	sizeof
}

var type = argument0;

var obj = array_create(DcNumericType.sizeof);
	obj[DcDistributedType.Type] = type;
	obj[DcDistributedType.Size] = 0;
	obj[DcDistributedType.Alias] = "";
	obj[DcDistributedType.Range] = noone;
	obj[DcDistributedType.SCR_GenerateHash] = dc_type_numeric_generate_hash;
	obj[DcNumericType.Divisor] = 1;
	obj[DcNumericType.OrigModulus] = 0;
	obj[DcNumericType.OrigRange] = noone;
	obj[DcNumericType.Modulus] = 0;
	
	switch (type) {
		case DcType.Char:
		case DcType.Int8:
		case DcType.UInt8:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_u8);
			break;
		case DcType.Int16:
		case DcType.UInt16:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_u16);
			break;
		case DcType.Int32:
		case DcType.UInt32:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_u32);
			break;
		case DcType.Int64:
		case DcType.UInt64:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_u64);
			break;
		case DcType.Float32:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_f32);
			break;
		case DcType.Float64:
			obj[DcDistributedType.Size] = buffer_sizeof(buffer_f64);
			break;
		default:
			obj[DcDistributedType.Type] = DcType.Invalid;
	}
return obj;
