/// @desc dc_mod_load_from_file(path);
/// Loads a DC File as a Module and returns the result
/// @param path string

// TODO Array class

var path = argument0;

var module = dc_mod_create();

var class_PointOfContactUD = dc_class_create("PointOfContactUD");
	class_PointOfContactUD[? "id"] = 1;
	class_PointOfContactUD[? "object-index"] = doPointOfContactUD;
	class_PointOfContactUD[? "object-layer"] = LAYER_INSTANCES;
	
	var field_PointOfContactUD_login = dc_field_create("login", DcType.Method);
		field_PointOfContactUD_login[? "id"] = 0;
		field_PointOfContactUD_login[? "fields"] = ds_list_create();
		
		var field_PointOfContactUD_login_username = dc_field_create("username", DcType.VarString);
			field_PointOfContactUD_login_username[? "id"] = 0;
		ds_list_add(field_PointOfContactUD_login[? "fields"], field_PointOfContactUD_login_username);
		
		var field_PointOfContactUD_login_password = dc_field_create("password", DcType.VarString);
			field_PointOfContactUD_login_password[? "id"] = 0;
		ds_list_add(field_PointOfContactUD_login[? "fields"], field_PointOfContactUD_login_password);
	ds_list_add(class_PointOfContactUD[? "fields"], field_PointOfContactUD_login);
ds_map_add(module[? "classes"], "PointOfContactUD", class_PointOfContactUD);

var class_PointOfContact = dc_class_create("PointOfContact");
	class_PointOfContact[? "id"] = 1;
	class_PointOfContact[? "object-index"] = doPointOfContact;
	class_PointOfContact[? "object-layer"] = LAYER_INSTANCES;
	
	var field_PointOfContact_login = dc_field_create("login", DcType.Method);
		field_PointOfContact_login[? "id"] = 0;
		field_PointOfContact_login[? "fields"] = ds_list_create();
		
		var field_PointOfContact_login_username = dc_field_create("username", DcType.VarString);
			field_PointOfContact_login_username[? "id"] = 0;
		ds_list_add(field_PointOfContact_login[? "fields"], field_PointOfContact_login_username);
		
		var field_PointOfContact_login_password = dc_field_create("password", DcType.VarString);
			field_PointOfContact_login_password[? "id"] = 0;
		ds_list_add(field_PointOfContact_login[? "fields"], field_PointOfContact_login_password);
	ds_list_add(class_PointOfContact[? "fields"], field_PointOfContact_login);
ds_map_add(module[? "classes"], "PointOfContact", class_PointOfContact);

return module;