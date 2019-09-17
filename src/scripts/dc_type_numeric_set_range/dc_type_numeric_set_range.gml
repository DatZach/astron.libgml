/// @desc dc_type_numeric_set_range(type, range);
/// Sets the valid range of the numeric type
/// @param type DcNumericType
/// @param range [real, real]
/// @returns bool

var type = argument0;
var range = argument1;

switch (type[DcDistributedType.Type]) {
	case DcType.Char:
	case DcType.Int8:
	case DcType.Int16:
	case DcType.Int32:
	case DcType.Int64:
	case DcType.UInt8:
	case DcType.UInt16:
	case DcType.UInt32:
	case DcType.UInt64:
		type[@ DcDistributedType.Range] = [
			floor(range[0] * type[DcNumericType.Divisor] + 0.5),
			floor(range[1] * type[DcNumericType.Divisor] + 0.5)
		];
		break;
	case DcType.Float32:
	case DcType.Float64:
		type[@ DcDistributedType.Range] = [
			range[0] * type[DcNumericType.Divisor],
			range[1] * type[DcNumericType.Divisor]
		];
		break;
	default:
		return false;
}

type[@ DcNumericType.OrigRange] = range;

return true;
