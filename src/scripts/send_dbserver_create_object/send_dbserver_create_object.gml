/// @desc send_dbserver_create_object(dclassId, context);
/// TODO DOCUMENT ME
/// @context pInternalRepository
/// @param dclassId real DClass ID
/// @param context real Context

var dclassId = argument0;
var context = argument1;

// aiChannel = sender
var dg = dg_create();
	dg_write_server_header(dg, DBSERVER_CREATE_OBJECT, aiChannel, dbss);
	dg_write(dg, dg_type_u32, context);
	dg_write(dg, dg_type_u16, dclassId);
	// TODO This is u16 field_count, [u16 field_id, <value>]*field_count
	//		Reference create_do_db
	dg_write(dg, dg_type_u16, 0);
dg_send(dg);
