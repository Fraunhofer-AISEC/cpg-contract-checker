address alice = address(0x101);
address bob = address(0x102);
address chris = address(0x103);

Merkle m = new Merkle();

bytes32[] memory data = new bytes32[](3);

data[0] = keccak256(abi.encodePacked(alice, Strings.toString(1))); 
data[1] = keccak256(abi.encodePacked(bob, Strings.toString(1))); 
data[2] = keccak256(abi.encodePacked(chris, Strings.toString(2))); 

bytes32 root = m.getRoot(data);
