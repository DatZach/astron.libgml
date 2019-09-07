/// @desc dg_read(datagram, type)
/// @param datagram Datagram
/// @param type dg_type
/// Reads data from a datagram

var datagram = argument0;
var type = argument1;

switch (type) {
	case dg_type_bool:
		return buffer_read(datagram, buffer_u8) != 0;
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
		return buffer_read(datagram, type);
	case dg_type_size:
		return buffer_read(datagram, DGSIZE_T);
	case dg_type_channel:
		return buffer_read(datagram, CHANNEL_T);
	case dg_type_doid:
		return buffer_read(datagram, DOID_T);
	case dg_type_zone:
		return buffer_read(datagram, ZONE_T);
	case dg_type_string: {
		var value = "";
		var length = dg_read(datagram, dg_type_size);
		for (var i = 0; i < length; ++i) {
			// TODO Support reading unicode
			var ch = buffer_read(datagram, buffer_u8);
			value += chr(ch);
		}

		return value;
	}
	case dg_type_blob: {
		var length = dg_read(datagram, dg_type_size);
		var value = buffer_create(length, buffer_fixed, 1);
		buffer_copy(datagram, buffer_tell(datagram), length, value, 0);
		return value;
	}

	default:
		show_error("Unhandle datagram type: " + string(type), true);
}
