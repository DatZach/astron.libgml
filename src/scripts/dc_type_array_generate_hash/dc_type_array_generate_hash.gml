var this = argument0;
var hashGenerator = argument1;

dc_type_generate_hash(this[DcArrayType.ElementType], hashGenerator);
if (this[DcArrayType.ArrayRange] != noone) {
	var range = this[DcArrayType.ArrayRange];
	dc_hashgen_add_int(hashGenerator, int64(range[0]));
	dc_hashgen_add_int(hashGenerator, int64(range[1]));
}
else
	dc_hashgen_add_int(hashGenerator, this[DcArrayType.ArraySize]);
