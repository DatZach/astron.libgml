/// @desc Assert that an expression holds true
/// @arg expr The expression to assert
/// @arg message The message to show when the assertion fails
/// @returns False if the assertion passed, true if it failed

if(!argument0) {
	show_error("ASSERTION FAILED: " + string(argument1), false);
	return true;
}

return false;
