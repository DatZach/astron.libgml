/// @desc send_stateserver_create_object_with_required(dclassId, doId, parentId, zoneId);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param dclass DcClass DcClass
/// @param doId doid DOCUMENT ME
/// @param parentId doid DOCUMENT ME
/// @param zoneId doid DOCUMENT ME

var dclass = argument0;
var doId = argument1;
var parentId = argument2;
var zoneId = argument3;

// aiChannel = sender
var dg = dg_create();
	dg_write_server_header(dg, STATESERVER_CREATE_OBJECT_WITH_REQUIRED, self.aiChannel, self.stateServer);
	dg_write(dg, dg_type_doid, doId);
	dg_write(dg, dg_type_doid, parentId);
	dg_write(dg, dg_type_doid, zoneId);
	dg_write(dg, dg_type_u16, dclass[DcStruct.Id]);
	
	var fields = dclass[DcStruct.Fields];
	for(var i = 0, isize = ds_list_size(fields); i < isize; ++i) {
		var field = fields[| i];
		
		if (!dc_field_has_keyword(field, "required")) {
			if (!field[DcField.HasDefaultValue])
				show_error("Required Field '" + field[DcField.Name] + "' must have a default value", true);
			
			dc_field_datagram_write(dg, field[DcField.Type], field[DcField.DefaultValue]);
		}
	}
return dg_send(dg, self.socket);
