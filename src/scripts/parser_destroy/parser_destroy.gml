var parser = argument0;

if (ds_exists(parser[DcfpParser.Read], ds_type_list)) {
	ds_list_destroy(parser[DcfpParser.Read]);
	parser[@ DcfpParser.Read] = noone;
}
