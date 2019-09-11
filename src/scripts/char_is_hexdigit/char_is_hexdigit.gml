gml_pragma("forceinline");

var ch = ord(argument0);
if (ch < ord("0") || ch > ord("9"))
	return false;

ch |= $20;
return ch >= ord("a") && ch <= ord("f");
