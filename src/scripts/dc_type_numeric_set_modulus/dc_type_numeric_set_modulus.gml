/// @desc dc_type_numeric_set_modulus(type, modulus);
/// Sets the valid modulus of the numeric type
/// @param type DcNumericType
/// @param range real
/// @returns bool

var type = argument0;
var modulus = argument1;

if (modulus <= 0)
	return false;

var floatModulus = modulus * type[DcNumericType.Divisor];
var uintModulus = int64(floor(modulus * type[DcNumericType.Divisor] + 0.5));

switch (type[DcDistributedType.Type]) {
	case DcType.Char:
	case DcType.Int8:
	case DcType.UInt8:
		if (uintModulus < 1 || ($ff + 1) < uintModulus)
			return false;
		type[@ DcNumericType.Modulus] = uintModulus;
		break;
	case DcType.Int16:
	case DcType.UInt16:
		if (uintModulus < 1 || ($ffff + 1) < uintModulus)
			return false;
		type[@ DcNumericType.Modulus] = uintModulus;
		break;
	case DcType.Int32:
	case DcType.UInt32:
		if (uintModulus < 1 || ($ffffffff + 1) < uintModulus)
			return false;
		type[@ DcNumericType.Modulus] = uintModulus;
		break;
	case DcType.Int64:
	case DcType.UInt64:
		if (uintModulus < 1)
			return false;
		type[@ DcNumericType.Modulus] = uintModulus;
		break;
	case DcType.Float32:
	case DcType.Float64:
		type[@ DcNumericType.Modulus] = floatModulus;
		break;
	default:
		return false;
}

type[@ DcNumericType.OrigModulus] = modulus;

return true;
