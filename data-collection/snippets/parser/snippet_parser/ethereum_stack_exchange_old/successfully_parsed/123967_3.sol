function createTest2(address address1, address address2) public {

    bytes32 salt = keccak256(abi.encodePacked(address1, address2));

    address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
        bytes1(0xff),
        address(this),
        salt,
        keccak256(abi.encodePacked(
            type(Test2).creationCode,
            uint(uint160(address1)),
            uint(uint160(address2))
        ))
    )))));

    Test2 test2 = new Test2{salt: salt}(address1, address2);
    require(address(test2) == predictedAddress); 
}  
