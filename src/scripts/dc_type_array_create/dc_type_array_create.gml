/// @func dc_type_array_create(elementType, [range]);
/// Creates a new DcArrayType
/// @param elementType DcDistributedType
/// @param range [real,real]
/// @returns DcNumericType

enum DcArrayType {
	ElementType = DcDistributedType.sizeof,	// real
	ArraySize,								// real
	ArrayRange,								// [real, real]
	
	sizeof
}

var elementType = argument[0];
var range = argument_count == 2 ? argument[1] : noone;

var obj = array_create(DcArrayType.sizeof);
	obj[DcDistributedType.Type] = DcType.Invalid;
	obj[DcDistributedType.Size] = 0;
	obj[DcDistributedType.Alias] = "";
	obj[DcDistributedType.Range] = range;
	obj[DcArrayType.ElementType] = elementType;
	obj[DcArrayType.ArraySize] = 0;
	
	if (range == noone) {
		obj[DcArrayType.ArraySize] = 0;
		obj[DcArrayType.ArrayRange] = [0, $ffffffffffffffff];
	}
	else if (range[0] == range[1]) {
		obj[DcArrayType.ArraySize] = range[0];
	}
	else
		obj[DcArrayType.ArraySize] = 0;
	
	if (elementType[DcDistributedType.Size] != 0 && obj[DcArrayType.ArraySize] > 0) {
		obj[DcDistributedType.Type] = DcType.Array;
		obj[DcDistributedType.Size] = obj[DcArrayType.ArraySize] * elementType[DcDistributedType.Size];
	}
	else {
		obj[DcDistributedType.Type] = DcType.VarArray;
		obj[DcDistributedType.Size] = 0;
	}
	
	if (elementType[DcDistributedType.Type] == DcType.Char) {
		obj[DcDistributedType.Type] = obj[DcDistributedType.Type] == DcType.Array
			? DcType.String
			: DcType.VarString;
	}
	else if (elementType[DcDistributedType.Type] == DcType.UInt8) {
		obj[DcDistributedType.Type] = obj[DcDistributedType.Type] == DcType.Array
			? DcType.Blob
			: DcType.VarBlob;
	}
		
return obj;
