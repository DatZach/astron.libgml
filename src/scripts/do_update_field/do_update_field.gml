/// @desc do_update_field(sender, fieldId, datagram);
/// Handles incoming SET_FIELD updates
/// @context DistributedObject
/// @param sender doid DistributedObject ID
/// @param fieldId real DClass Field ID
/// @param datagram Datagram Serialized parameters

var sender = argument0;
var fieldId = argument1;
var datagram = argument2;

assert_ancestor(pDistributedObject);

var method = dc_class_field_find_id(self.dclass, fieldId);
var fields = method[? "fields"];

assert(method[? "type"] == DcType.Method, "Not a method: " + method[? "name"]);

var fieldCount = ds_list_size(fields);
var decodedArguments = array_create(fieldCount + 1);
decodedArguments[0] = sender;
for (var i = 0; i < fieldCount; ++i) {
	var field = fields[| i];
	decodedArguments[i + 1] = dc_field_datagram_read(datagram, field);
}

var scriptName = self.dclass[? "name"] + "_" + method[? "name"];
var scriptIdx = asset_get_index(scriptName);
assert(scriptIdx != -1, "Script '" + scriptName + "' is not defined.");

return script_execute_va(scriptIdx, decodedArguments);
