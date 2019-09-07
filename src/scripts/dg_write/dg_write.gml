/// @desc dg_write(datagram, type, value)
/// @param datagram Datagram
/// @param type dg_type
/// @param value
/// Writes data to a datagram

#macro dg_type_bool buffer_bool
#macro dg_type_s8 buffer_s8
#macro dg_type_s16 buffer_s16
#macro dg_type_s32 buffer_s32
//#macro dg_type_s64 buffer_u64
#macro dg_type_u8 buffer_u8
#macro dg_type_u16 buffer_u16
#macro dg_type_u32 buffer_u32
#macro dg_type_u64 buffer_u64
#macro dg_type_f32 buffer_f32
#macro dg_type_f64 buffer_f64
#macro dg_type_size 1024
#macro dg_type_channel 1025
#macro dg_type_doid 1026
#macro dg_type_zone 1027
//#macro dg_type_location 1028
#macro dg_type_blob 1029
#macro dg_type_string 1030

var datagram = argument0;
var type = argument1;
var value = argument2;

switch (type) {
	case dg_type_bool:
		return buffer_write(datagram, buffer_u8, value != 0);
	case dg_type_s8:
	case dg_type_s16:
	case dg_type_s32:
	//case dg_type_s64:
	case dg_type_u8:
	case dg_type_u16:
	case dg_type_u32:
	case dg_type_u64:
	case dg_type_f32:
	case dg_type_f64:
		return buffer_write(datagram, type, value);
	case dg_type_size:
		return buffer_write(datagram, DGSIZE_T, value);
	case dg_type_channel:
		return buffer_write(datagram, CHANNEL_T, value);
	case dg_type_doid:
		return buffer_write(datagram, DOID_T, value);
	case dg_type_zone:
		return buffer_write(datagram, ZONE_T, value);
	case dg_type_string: {
		var length = string_byte_length(value);
		dg_write(datagram, dg_type_size, length);
		for (var i = 0; i < length; ++i) {
			var ch = string_byte_at(value, i + 1);
			dg_write(datagram, dg_type_u8, ch);
		}
		
		return length;
	}
	case dg_type_blob: {
		var length = buffer_get_size(value);
		dg_write(datagram, dg_type_size, length);
		return buffer_copy(value, 0, length, datagram, buffer_tell(datagram));
	}

	default:
		show_error("Unhandle datagram type: " + string(type), true);
}
