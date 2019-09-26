/// @func dc_hashgen_create();
/// Creates a new DC Hash Generator

enum DcHashGenerator {
	Primes,
	Hash,
	Index,
	
	sizeof
};

var this = array_create(DcHashGenerator.sizeof);
	this[DcHashGenerator.Primes] = ds_list_create();
	this[DcHashGenerator.Hash] = 0;
	this[DcHashGenerator.Index] = 0;
	
	ds_list_add(this[DcHashGenerator.Primes], 2);
return this;