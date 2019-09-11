var ident = argument0;

switch(ident) {
	case "keyword": return DcfpTokenType.Keyword;
	case "struct": return DcfpTokenType.Struct;
	case "dclass": return DcfpTokenType.Class;
	case "import": return DcfpTokenType.Import;
	case "from": return DcfpTokenType.From;
	case "typedef": return DcfpTokenType.Typedef;
	
	case "int8": return DcfpTokenType.TypeInt8;
	case "int16": return DcfpTokenType.TypeInt16;
	case "int32": return DcfpTokenType.TypeInt32;
	case "int64": return DcfpTokenType.TypeInt64;
	case "uint8": return DcfpTokenType.TypeUInt8;
	case "uint16": return DcfpTokenType.TypeUInt16;
	case "uint32": return DcfpTokenType.TypeUInt32;
	case "uint64": return DcfpTokenType.TypeUInt64;
	case "float32": return DcfpTokenType.TypeFloat32;
	case "float64": return DcfpTokenType.TypeFloat64;
	case "string": return DcfpTokenType.TypeString;
	case "blob": return DcfpTokenType.TypeBlob;
	case "char": return DcfpTokenType.TypeChar;
}

return DcfpTokenType.Identifier;