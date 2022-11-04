bytes memory a = 0x05;
Error: Type int_const 5 is not implicitly convertible to expected type bytes memory.

bytes memory b = bytes (0x05);
Error: Explicit type conversion not allowed from "int_const 5" to "bytes memory".

bytes1 c = 0x05;
bytes memory d = c;
Error: Type bytes1 is not implicitly convertible to expected type bytes memory.

bytes memory e = bytes (c);
Error: Explicit type conversion not allowed from "bytes1" to "bytes memory".
