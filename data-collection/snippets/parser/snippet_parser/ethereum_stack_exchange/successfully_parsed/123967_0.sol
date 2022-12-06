
pragma solidity ^0.8.0;

contract Factory {

    
    function createTest1(uint number1, uint number2) public {

        bytes32 salt = keccak256(abi.encodePacked(number1, number2));

        
        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                type(Test1).creationCode,
                number1,
                number2
            ))
        )))));

        Test1 test1 = new Test1{salt: salt}(number1, number2);
        require(address(test1) == predictedAddress); 
    }

    
    function createTest2(address address1, address address2) public {

        bytes32 salt = keccak256(abi.encodePacked(address1, address2));

        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                type(Test2).creationCode,
                address1,
                address2
            ))
        )))));

        Test2 test2 = new Test2{salt: salt}(address1, address2);
        require(address(test2) == predictedAddress); 
    }    
}

contract Test1 {

    uint public number1;
    uint public number2;

    constructor(uint _number1, uint _number2) {
        number1 = _number1;
        number2 = _number2;
    }
}

contract Test2 {

    address public address1;
    address public address2;

    constructor(address _address1, address _address2) {
        address1 = _address1;
        address2 = _address2;
    }
}
