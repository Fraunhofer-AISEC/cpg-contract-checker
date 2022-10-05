struct A {
 bytes myBytes1;
 bytes myBytes2;
 bytes myBytes3;
}

struct B {
 bytes myBytes1;
 bytes32 myBytes32;
 bytes myBytes3;
}

struct C {
 uint256 myInts1;
 bytes myBytes2;
 bytes myBytes3;
}

myFunction(A calldata a, B calldata b, C calldata c) external {
 
 
 uint256 gasStart = gasleft();
 
 uint256 gasDiff = gasStart - gasleft();

 
 
 
}
