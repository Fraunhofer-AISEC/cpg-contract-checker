function test() public pure returns (uint256 returnValue) {
    bytes memory b = new bytes(32);
    
    assembly {
        mstore(add(b, 32), 5)
        returnValue := mload(add(b, 32))
    }
} 
