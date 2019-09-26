/// @func dc_hashgen_destroy(hashGenerator);
/// Destroys a DcHashGenerator
/// @param hashGenerator DcHashGenerator

var hashGenerator = argument0;

ds_list_destroy(hashGenerator[DcHashGenerator.Primes]);
