/// @func dc_hashgen_add_string(hashGenerator, num);
/// Returns the hashcode
/// @param hashGenerator DcHashGenerator
/// @returns real

var hashGenerator = argument0;

return hashGenerator[DcHashGenerator.Hash] & $ffffffff;