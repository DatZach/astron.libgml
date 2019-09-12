var ident = argument0;

switch(ident) {
	case "+": return DcfpTokenType.Add;
	case "-": return DcfpTokenType.Subtract;
	case "*": return DcfpTokenType.Multiply;
	case "/": return DcfpTokenType.Divide;
	case "%": return DcfpTokenType.Modulo;
	
	case "(": return DcfpTokenType.LeftParen;
	case ")": return DcfpTokenType.RightParen;
	case "{": return DcfpTokenType.LeftBrace;
	case "}": return DcfpTokenType.RightBrace;
	case "[": return DcfpTokenType.LeftSquare;
	case "]": return DcfpTokenType.RightSquare;
	case ",": return DcfpTokenType.Comma;
	case ";": return DcfpTokenType.Semicolon;
	case "=": return DcfpTokenType.Assign;
	case ":": return DcfpTokenType.Colon;
}

return DcfpTokenType.Invalid;
