function wantsAnA(string memory _a) public pure {
    require (keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked("a")), "Not a match");    
}

function weirdCalls() public {
    
    bytes memory encoded_1 = abi.encodeWithSignature("wantsAnA(string)", 32, 1, 0x6100000000000000000000000000000000000000000000000000000000000000);
    bytes memory encoded_2 = abi.encodeWithSignature("wantsAnA(string)", "a");
    
    (bool success1, bytes memory rvalue1) = address(this).call(encoded_1);
    (bool success2, bytes memory rvalue2) = address(this).call(encoded_2);
    
    require(success1 == true, "first call failed");
    require(success2 == true, "second call failed");
}
