function test1() public view returns(uint256 stringLength) {

    string memory myString = "length is 12";

    assembly {
        stringLength := mload(myString)
    }

}
