pragma solidity ^0.4.16;

contract Test {

    address public contractOwner;

    function TestContract() public {
        contractOwner = msg.sender;
    }

    function foo() constant returns(address) {
        return msg.sender;
    }

}
