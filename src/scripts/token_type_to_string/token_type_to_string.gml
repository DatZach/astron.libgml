switch(argument0) {
	case DcfpTokenType.Invalid: return "<Invalid>";
	
	case DcfpTokenType.Identifier: return "Identifier";
	case DcfpTokenType.Number: return "Number Literal";
	case DcfpTokenType.String: return "String Literal";
	
	case DcfpTokenType.Keyword: return "keyword";
	case DcfpTokenType.Struct: return "struct";
	case DcfpTokenType.Class: return "dclass";
	case DcfpTokenType.Import: return "import";
	case DcfpTokenType.From: return "from";
	case DcfpTokenType.Typedef: return "typedef";
	
	case DcfpTokenType.TypeInt8: return "int8";
	case DcfpTokenType.TypeInt16: return "int16";
	case DcfpTokenType.TypeInt32: return "int32";
	case DcfpTokenType.TypeInt64: return "int64";
	case DcfpTokenType.TypeUInt8: return "uint8";
	case DcfpTokenType.TypeUInt16: return "uint16";
	case DcfpTokenType.TypeUInt32: return "uint32";
	case DcfpTokenType.TypeUInt64: return "uint64";
	case DcfpTokenType.TypeFloat32: return "float32";
	case DcfpTokenType.TypeFloat64: return "float64";
	case DcfpTokenType.TypeString: return "string";
	case DcfpTokenType.TypeBlob: return "blob";
	case DcfpTokenType.TypeChar: return "char";
	
	case DcfpTokenType.Add: return "+";
	case DcfpTokenType.Subtract: return "-";
	case DcfpTokenType.Multiply: return "*";
	case DcfpTokenType.Divide: return "/";
	case DcfpTokenType.Modulo: return "%";
	
	case DcfpTokenType.LeftParen: return "(";
	case DcfpTokenType.RightParen: return ")";
	case DcfpTokenType.LeftBrace: return "{";
	case DcfpTokenType.RightBrace: return "}";
	case DcfpTokenType.LeftSquare: return "[";
	case DcfpTokenType.RightSquare: return "]";
	case DcfpTokenType.Comma: return ",";
	case DcfpTokenType.Semicolon: return "";
	case DcfpTokenType.Assign: return "=";
	case DcfpTokenType.Colon: return ":";
	
	case DcfpTokenType.EndOfStream: return "End of Stream";
}

show_error("Enum value " + string(argument0) + " out of range.", true);
return "";
