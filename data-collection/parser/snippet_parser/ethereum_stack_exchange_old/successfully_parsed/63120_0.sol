function hashTest() public returns(bytes32,bytes32,bytes32) {
bytes32 _solution = 0xbc756c25d68ea2f260ea5f15e1e1c734c019cbc014270dd386eacca4699f60f6;
bytes32 v = keccak256(abi.encodePacked(_solution));
bytes32 x = sha256(abi.encodePacked(_solution));
bytes32 z = ripemd160(abi.encodePacked(_solution));
Print(v,x,z);
return(v,x,z);
}