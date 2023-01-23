bytes32 index = generateHash( args ...);
require(!exists[index], "Duplicate");
exists[index] = true;


