/// @desc dc_field_datagram_write(dg, field, value);
/// Writes a field to a buffer
/// @param field dc_field
/// @param value var

var dg = argument0;
var field = argument1;
var value = argument2;

var fieldType = field[DcField.Type];
var type = fieldType[DcDistributedType.Type];

// TODO Update to use dg_write
switch(type) {
	case DcType.Int8:
		return dg_write(dg, dg_type_u8, value);
	case DcType.Int16:
		return dg_write(dg, dg_type_s16, value);
	case DcType.Int32:
		return dg_write(dg, dg_type_s32, value);
	case DcType.UInt8:
		return dg_write(dg, dg_type_u8, value);
	case DcType.UInt16:
		return dg_write(dg, dg_type_u16, value);
	case DcType.UInt32:
		return dg_write(dg, dg_type_u32, value);
	case DcType.Char:
		return dg_write(dg, dg_type_u8, value);
	case DcType.Float32:
		return dg_write(dg, dg_type_f32, value);
	case DcType.Float64:
		return dg_write(dg, dg_type_f64, value);
	case DcType.String: {
		var fixedSize = field[? "size"];
		var strLen = string_byte_length(value);
			
		for (var i = 0; i < fixedSize; ++i) {
			if (i < strLen) {
				var ch = string_byte_at(value, i);
				buffer_write(dg, dg_type_u8, ch);
			}
			else
				buffer_write(dg, dg_type_u8, 0);
		}
			
		return 0;
	}
	case DcType.VarString:
		return dg_write(dg, dg_type_string, value);
	//case DcType.Blob: {
	//	var fixedSize = field[? "size"];
	//	var srcLen = buffer_tell(value);
		
	//	buffer_copy(value, 0, srcLen, dg, buffer_tell(dg));
	//	for (var i = srcLen; i < fixedSize; ++i)
	//		buffer_write(dg, buffer_u8, 0);
			
	//	return 0;
	//}
	//case DcType.VarBlob: {
	//	var srcLen = buffer_tell(value);
		
	//	buffer_write(dg, buffer_u16, srcLen);
	//	buffer_copy(value, 0, srcLen, dg, buffer_tell(dg));
	//	return 0;
	//}
	case DcType.Array:
	case DcType.VarArray:
	case DcType.Struct:
	case DcType.Method:
	default:
		assert(false, "Cannot pack field type: " + string(type));
}
