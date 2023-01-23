pragma solidity ^0.4.23;

contract basic {
    uint num1 = 10;
    
    function getNum1() public view returns(uint) {
        return num1;
    }
    function setNum1(uint _num) public returns(uint) {
         num1 = _num;
    }
}

contract parent {
    uint public num2;
    basic public b;

    constructor() public {
        b = new basic();
        num2 = 20;
    }
        
    function getNum1() public constant returns(uint) {
        return b.getNum1();
    }
    
}