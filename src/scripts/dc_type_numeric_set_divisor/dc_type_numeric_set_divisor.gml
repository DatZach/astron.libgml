/// @desc dc_type_numeric_set_divisor(type, divisor);
/// Sets the divisor for the numeric type, typically to represent fixed-point
/// @param type DcNumericType
/// @param divisor real
/// @returns bool

var type = argument0;
var divisor = argument1;

if (divisor == 0)
	return false;

type[@ DcNumericType.Divisor] = divisor;

if (type[DcNumericType.OrigRange] != noone)
	dc_type_numeric_set_range(type, type[DcNumericType.OrigRange]);

if (type[DcNumericType.OrigModulus] != noone)
	dc_type_numeric_set_modulus(type, type[DcNumericType.OrigModulus]);
	
return true;
