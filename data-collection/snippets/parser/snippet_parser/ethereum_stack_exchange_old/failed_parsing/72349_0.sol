bytes16 t1 = ...;
bytes16 t2 = ...;

bytes32 h = keccak256(abi.encodePacked(t1, t2));
