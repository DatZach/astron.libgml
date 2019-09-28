/// @func dc_hashgen_add_int(hashGenerator, num);
/// Adds an integer to the hash generator
/// @param hashGenerator DcHashGenerator
/// @param num real

var MAX_PRIME_NUMBERS = 10000;

var hashGenerator = argument0;
var num = int64(argument1);

var prime = dc_hashgen_get_prime(hashGenerator, hashGenerator[DcHashGenerator.Index]);
hashGenerator[@ DcHashGenerator.Hash] += prime * num;
hashGenerator[@ DcHashGenerator.Index] = (hashGenerator[@ DcHashGenerator.Index] + 1) mod MAX_PRIME_NUMBERS;
