
pragma solidity ^0.5.0;

contract Case1 {

    struct Test { uint256 value; }

    mapping(address => Test) public myMapping;

    event myEvent(uint256);

    function testCase1() public {

        myMapping[msg.sender] = Test({value: 10});

        
        
        Test storage deletedItem = myMapping[msg.sender];

        
        emit myEvent(deletedItem.value);

        
        
        delete myMapping[msg.sender];

        
        emit myEvent(deletedItem.value);
    }
}
