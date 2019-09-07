gml_pragma("gmlinline");
assert(
	   self.object_index == argument0
	|| object_is_ancestor(self.object_index, argument0),
	"Self must be " + object_get_name(argument0)
);