/// @desc do_send_update(fieldName, values...);
/// Handles outgoing SET_FIELD updates
/// @context DistributedObject
/// @param fieldName string
/// @param values... var

var fieldName = argument[0];

var field = dc_class_get_field_by_name(self.dclass, fieldName);
var fieldType = field[DcField.Type];
assert(fieldType[DcDistributedType.Type] == DcType.Method, "Not a method: " + fieldName);

var argCount = argument_count - 1;
var arguments = fieldType[DcMethodType.Parameters];
var fieldArgCount = ds_list_size(arguments);
assert(argCount == fieldArgCount, "Unable to update field '" + fieldName + "'.\nArgument count mismatch: " + string(argCount) + " != " + string(fieldArgCount));

var dg = dg_create();
if (object_is_ancestor(self.repo.object_index, pClientRepository))
	dg_write(dg, dg_type_u16, CLIENT_OBJECT_SET_FIELD);
else
	dg_write_server_header(dg, STATESERVER_OBJECT_SET_FIELD, self.doId, self.doId);

dg_write(dg, dg_type_doid, self.doId);
dg_write(dg, dg_type_u16, field[DcField.Id]);

for (var i = 0; i < fieldArgCount; ++i) {
	var arg = arguments[| i];
	var value = argument[i + 1];
	
	dc_field_datagram_write(dg, arg, value);
}

return dg_send(dg, self.repo.socket);
