/// @desc singleton();
/// Enforces that only a single instance is allowed to exist

if (instance_number(object_index) > 1) {
	instance_destroy();
	exit;
}
