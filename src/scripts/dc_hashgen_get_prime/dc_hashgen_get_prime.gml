/// @func dc_hashgen_get_prime(hashGenerator, n);
/// Returns the nth prime number
/// @param hashGenerator DcHashGenerator
/// @param n real
/// @returns real

var hashGenerator = argument0;
var n = argument1;

var primes = hashGenerator[DcHashGenerator.Primes];

var candidate = primes[| ds_list_size(primes) - 1] + 1;
while (ds_list_size(primes) <= n) {
	var maybePrime = true;
	var j = 0;
	
	while (maybePrime && primes[| j] * primes[| j] <= candidate) {
		if (primes[| j] * (candidate / primes[| j]) == candidate)
			maybePrime = false;
		
		++j;
	}
	
	if (maybePrime)
		ds_list_add(primes, candidate);
	
	++candidate;
}

return primes[| n];
