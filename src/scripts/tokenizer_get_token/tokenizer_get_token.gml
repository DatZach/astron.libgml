/// @desc tokenizer_get_token(tokenizer);
/// Yields the next token in the specified tokenizer
/// @param tokenizer DcfpTokenizer
/// @returns DcfpToken

var tokenizer = argument0;

if (tokenizer[DcfpTokenizer.Index] >= tokenizer[DcfpTokenizer.Length])
	return token_create(DcfpTokenType.EndOfStream, noone, tokenizer);

while(true) {
	if (tokenizer_ignore_whitespace(tokenizer))
		break;
	
	if (tokenizer_ignore_comments(tokenizer))
		continue;
}
	
var startLine = tokenizer[DcfpTokenizer.CurrentLine];
var startIndex = tokenizer[DcfpTokenizer.Index];
var ch = tokenizer_peek_char(tokenizer);
	
// String
if (ch == "\"") {
	tokenizer_take_char(tokenizer);
		
	while (true) {
		if (tokenizer[DcfpTokenizer.Length] >= tokenizer[DcfpTokenizer.Index]) {
			show_error(
				"Unterminated string.\n" +
				"Line " + string(startLine) + "; Pos " + string(startIndex),
				true
			);
		}
			
		ch = tokenizer_take_char(tokenizer);
		if (ch == "\"")
			break;
	}
		
	var value = string_copy(tokenizer[DcfpTokenizer.Source], startIndex + 1, tokenizer[DcfpTokenizer.Index] - startIndex - 2);
	return token_create(DcfpTokenType.String, value, tokenizer);
}
	
// Keyword/Identifier
if (char_is_letter(ch) || ch == "_") {
	do {
		ch = tokenizer_get_token(tokenizer);
	} until (!char_is_letter(ch));
		
	var value = string_copy(tokenizer[DcfpTokenizer.Source], startIndex, tokenizer[DcfpTokenizer.Index] - startIndex);
	var tokenType = tokenizer_get_ident_token_type(value);
	return token_create(tokenType, value, tokenizer);
}
	
// Number
// TODO Negative numbers?
if (char_is_digit(ch) || (ch == "." && char_is_digit(tokenizer_peek_char(tokenizer, 1)))) {
	var hasHexSpecified = false;
	var hasDecimal = false;
	var justTake = false;
	
	if (ch == "0" && tokenizer_peek_char(tokenizer, 1) == "x") {
		hasHexSpecified = true;
		tokenizer_take_char(tokenizer);
		tokenizer_take_char(tokenizer);
	}
	
	while (true) {
		ch = tokenizer_take_char(tokenizer);
		
		if (justTake) {
			justTake = false;
			continue;
		}
		
		if (!hasHexSpecified) {
			if (ch == "." && !hasDecimal) {
				hasDecimal = true;
				continue;
			}
		}
		
		if (!char_is_digit(ch) && !(hasHexSpecified && char_is_hexdigit(ch)))
			break;
	}
	
	var value = string_copy(tokenizer[DcfpTokenizer.Source], startIndex, tokenizer[DcfpTokenizer.Index] - startIndex);
	// TODO Parse number to decimal
	return token_create(DcfpTokenType.Number, value, tokenizer);
}

// Operator
// TODO Implement

while(char_is_whitespace(tokenizer_take_char(tokenizer))) { /* Ignore */ }
var value = string_copy(tokenizer[DcfpTokenizer.Source], startIndex, tokenizer[DcfpTokenizer.Index] - startIndex);
show_error(
	"Unexpected token '" + value + "'.\n" +
	"Line " + string(startLine) + "; Pos " + string(startIndex),
	true
);

return noone;
