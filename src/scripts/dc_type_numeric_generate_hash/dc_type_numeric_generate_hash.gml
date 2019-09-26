var this = argument0;
var hashGenerator = argument1;

dc_hashgen_add_int(hashGenerator, this[DcNumericType.Divisor]);
if (this[DcNumericType.OrigModulus] != 0)
	dc_hashgen_add_int(hashGenerator, int64(this[DcNumericType.Modulus]));

if (this[DcNumericType.OrigRange] != noone) {
	var range = this[DcDistributedType.Range];
	dc_hashgen_add_int(hashGenerator, int64(range[0]));
	dc_hashgen_add_int(hashGenerator, int64(range[1]));
}