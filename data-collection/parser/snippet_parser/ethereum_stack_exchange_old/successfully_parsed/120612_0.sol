pragma solidity ^0.8.0;

contract Immutable {
    
    uint constant number1 = 1;
    uint immutable number2;
    
    constructor() {
        number2 = 2;
    }

    
    function getNumber1() pure external returns(uint) {
        return number1;
    }
    
    
    function getNumber2() pure external returns(uint) {
        return number2;
    }    
}
