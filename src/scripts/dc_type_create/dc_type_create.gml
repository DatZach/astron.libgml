/// @func dc_type_create();
/// Creates a new DcType
/// @returns DcType

enum DcDistributedType {
	Type,			// DcType
	Size,			// SIZETAG_T
	Alias,			// string
	
	sizeof
}

enum DcType {
    /* Numeric Types */
    Int8, Int16, Int32, Int64,
    UInt8, UInt16, UInt32, UInt64,
    Char, // equivalent to uint8, except that it should be printed as a string
    Float32, Float64,

    /* Array Types */
    String,      // a human-printable string with fixed length
    VarString,   // a human-printable string with variable length
    Blob,        // any binary data stored as a string, fixed length
    VarBlob,     // any binary data stored as a varstring, variable length
    Array,       // any array with fixed byte-length (fixed array-size and element-length)
    VarArray,    // any array with variable array-size or variable length elements

    /* Complex Types */
    Struct,
    Method,

    // New additions should be added at the end to prevent the file hash from changing.

    Invalid
}

var value = array_create(DcDistributedType.sizeof);
	value[DcDistributedType.Type] = DcType.Invalid;
	value[DcDistributedType.Size] = 0;
	value[DcDistributedType.Alias] = "";
return value;
