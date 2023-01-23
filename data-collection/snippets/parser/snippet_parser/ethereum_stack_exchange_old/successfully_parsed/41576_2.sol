pragma solidity ^0.4.0;

contract number {
    uint public num = 0; 

    function setNum(uint _num) public {
        num = _num;
        
    }

    function setNumCheck(uint _num) public {
        if (num != _num) {
          num = _num;
        }
        
    }
}