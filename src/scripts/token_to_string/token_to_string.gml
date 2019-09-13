var token = argument0;

switch(token[DcfpToken.Type]) {
	case DcfpTokenType.Identifier:
	case DcfpTokenType.Number:
	case DcfpTokenType.String:
		var value = token[DcfpToken.Value];
		if (string_length(value) > 16)
			value = string_copy(value, 1, 13) + "...";
		
		return token_type_to_string(token[DcfpToken.Type])
			 + "('" + value + "')";
	
	default:
		return token_type_to_string(token[DcfpToken.Type]);
}
