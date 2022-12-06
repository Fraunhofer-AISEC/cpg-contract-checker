pragma solidity 0.4.16; 

contract UseConstant {

    string greeting;

    function UseConstant() public {
        greeting = "Hello";
    }

    function SayHello() public constant returns(string says) {
        return greeting;
    }
}
