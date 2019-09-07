/// @desc dc_field_datagram_read(datagram, field);
/// Reads a field from a datagram
/// @param datagram Datagram
/// @param field dc_field
/// @ref DatagramIterator.h void unpack_dtype(...)

var dg = argument0;
var field = argument1;

var type = field[? "type"];
switch(type) {
	case DcType.Int8:
		return dg_read(dg, dg_type_s8);
	case DcType.Int16:
		return dg_read(dg, dg_type_s16);
	case DcType.Int32:
		return dg_read(dg, dg_type_s32);
	case DcType.UInt8:
		return dg_read(dg, dg_type_u8);
	case DcType.UInt16:
		return dg_read(dg, dg_type_s16);
	case DcType.UInt32:
		return dg_read(dg, dg_type_s32);
	case DcType.Char:
		return dg_read(dg, dg_type_u8);
	case DcType.Float32:
		return dg_read(dg, dg_type_f32);
	case DcType.Float64:
		return dg_read(dg, dg_type_f64);
	case DcType.VarString:
		return dg_read(dg, dg_type_string);
	case DcType.Array:
	case DcType.VarArray:
	case DcType.Struct:
	case DcType.Method:
	default:
		assert(false, "Cannot unpack field type: " + string(type));
}
