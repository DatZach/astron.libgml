var dcField = argument0;
var hashGenerator = argument1;

var flags = 0;
var keywords = dcField[DcField.Keywords];
var keywordsSize = ds_list_size(keywords);
for (var i = 0; i < keywordsSize; ++i) {
	var keyword = keywords[| i];
	
	switch (keyword) {
		case "required":	flags |= $0001; break;
		case "broadcast":	flags |= $0002; break;
		case "ownrecv":		flags |= $0004; break;
		case "ram":			flags |= $0008; break;
		case "db":			flags |= $0010; break;
		case "clsend":		flags |= $0020; break;
		case "clrecv":		flags |= $0040; break;
		case "ownsend":		flags |= $0080; break;
		case "airecv":		flags |= $0100; break;
		default:			flags = ~0; break;
	}
	
	if (flags == ~0)
		break;
}

if (flags != ~0)
	dc_hashgen_add_int(hashGenerator, flags);
else {
	for (var i = 0; i < keywordsSize; ++i) {
		var keyword = keywords[| i];
		dc_hashgen_add_string(hashGenerator, keyword);
	}
}
