pragma solidity ^0.4.4;

contract TestObject {

  uint public myValue;

    function TextObject() {
        myValue = 1000;
    }

  function deposit(uint value) returns(uint) {
        myValue += value;
        return myValue;
    }
}
