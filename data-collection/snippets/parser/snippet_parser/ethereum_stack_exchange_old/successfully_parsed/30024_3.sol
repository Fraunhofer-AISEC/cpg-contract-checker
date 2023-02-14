function hashThat(bytes32 theBytes32Value, address theAddressValue, bytes32 anotherValue) public view returns(bytes32 hashedValue){
    return keccak256(abi.encodePacked(theBytes32Value, theAddressValue, anotherValue));
}
