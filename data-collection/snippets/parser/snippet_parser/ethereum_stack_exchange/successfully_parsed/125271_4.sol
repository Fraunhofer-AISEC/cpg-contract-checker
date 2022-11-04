function test2() public view returns (uint256) {

    
    assembly {
        mstore(0x40, add(mload(0x40), 0x20))
    }
    
    string memory myString = "This is a string";
    strings.slice memory mySlice = strings.toSlice(myString);

    return mySlice._ptr; 
}
