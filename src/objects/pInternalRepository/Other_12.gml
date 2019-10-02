/// @desc Datagrams

var dg = async_load[? "buffer"];
var dgLength = dg_read(dg, dg_type_size);
var numRecipients = dg_read(dg, dg_type_u8);
var recipients = array_create(numRecipients);
for (var i = 0; i < numRecipients; ++i)
	recipients[i] = dg_read(dg, dg_type_channel);
var sender = dg_read(dg, dg_type_channel);
var messageType = dg_read(dg, dg_type_u16);

switch(messageType) {
	case STATESERVER_OBJECT_SET_FIELD: {
		var doId = dg_read(dg, dg_type_doid);
		var fieldId = dg_read(dg, dg_type_u16);
		
		trace("STATESERVER_OBJECT_SET_FIELD ", doId, " ", fieldId);
		
		var distObj = distributedObjects[? doId];
		with(distObj)
			do_update_field(sender, fieldId, dg);
		break;
	}
	
	case STATESERVER_OBJECT_CHANGING_LOCATION: { // IR
		var doId = dg_read(dg, dg_type_doid);
		var newParent = dg_read(dg, dg_type_doid);
		var newZone = dg_read(dg, dg_type_zone);
		var oldParent = dg_read(dg, dg_type_doid);
		var oldZone = dg_read(dg, dg_type_zone);
		
		trace("STATESERVER_OBJECT_CHANGING_LOCATION ", doId, " ", newParent, " ", newZone, " ",
			  oldParent, " ", oldZone);
		
		var location = parent_zone_to_location(newParent, newZone);
		if (ds_map_exists(doiLocationToDoid, location)) {
			var interestedDos = doiLocationToDoid[? location];
			for (var i = 0, isize = array_length_1d(interestedDos); i < isize; ++i) {
				with(distributedObjects[? interestedDos[i]])
					do_raise_interest_changing_location_enter(sender, doId, newParent, newZone, oldParent, oldZone);
			}
		}
		
		location = parent_zone_to_location(oldParent, oldZone);
		if (ds_map_exists(doiLocationToDoid, location)) {
			var interestedDos = doiLocationToDoid[? location];
			for (var i = 0, isize = array_length_1d(interestedDos); i < isize; ++i) {
				with(distributedObjects[? interestedDos[i]])
					do_raise_interest_changing_location_leave(sender, doId, newParent, newZone, oldParent, oldZone);
			}
		}
		break;
	}
	
	case STATESERVER_OBJECT_GET_AI: {
		var context = dg_read(dg, dg_type_u32);
		// TODO Implement
		trace("STATESERVER_OBJECT_GET_AI ", sender, " ", recipients, " ", context);
		break;
	}
	
	case STATESERVER_OBJECT_ENTER_LOCATION_WITH_REQUIRED: {
		trace("STATESERVER_OBJECT_ENTER_LOCATION_WITH_REQUIRED");
		var newDo = or_create_do_view_from_datagram(dg, "AE");
		if (newDo != noone) {
			var location = parent_zone_to_location(newDo.parentId, newDo.zoneId);
			if (ds_map_exists(doiLocationToDoid, location)) {
				var interestedDos = doiLocationToDoid[? location];
				for (var i = 0, isize = array_length_1d(interestedDos); i < isize; ++i) {
					with(distributedObjects[? interestedDos[i]])
						do_raise_interest_do_enter(newDo, newDo.doId, newDo.parentId, newDo.zoneId);
				}
			}
		}
		break;
	}
	
	case STATESERVER_OBJECT_ENTER_AI_WITH_REQUIRED: {
		trace("STATESERVER_OBJECT_ENTER_AI_WITH_REQUIRED");
		var newDo = or_create_do_view_from_datagram(dg, "AI");
		if (newDo != noone) {
			var location = parent_zone_to_location(newDo.parentId, newDo.zoneId);
			if (ds_map_exists(doiLocationToDoid, location)) {
				var interestedDos = doiLocationToDoid[? location];
				for (var i = 0, isize = array_length_1d(interestedDos); i < isize; ++i) {
					with(distributedObjects[? interestedDos[i]])
						do_raise_interest_do_ai_enter(newDo, newDo.doId, newDo.parentId, newDo.zoneId);
				}
			}
		}
		break;
	}

	case DBSERVER_CREATE_OBJECT_RESP: {
		var context = dg_read(dg, dg_type_u32);
		var doId = dg_read(dg, dg_type_doid);
		
		trace("DBSERVER_CREATE_OBJECT_RESP ", sender, " ", recipients, " ", context, " ", doId);
		
		var key = [DBSERVER_CREATE_OBJECT_RESP, context];
		var callback = self.callbacks[? key];
		script_execute_va(callback[0], callback[1]);
		ds_map_delete(self.callbacks, key);
		break;
	}
	
	default:
		warn("InternalRepository: Unhandled message type ", messageType);
		break;
}
