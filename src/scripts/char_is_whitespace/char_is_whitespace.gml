gml_pragma("forceinline");

var ch = ord(argument0);
return ch == ord(" ") || ch >= ord("\t") && ch <= ord("\r") || ch == $85;
