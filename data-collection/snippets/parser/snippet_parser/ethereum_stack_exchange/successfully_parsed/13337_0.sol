pragma solidity ^0.4.10;

contract Simple {
  uint public value1;
  uint public value2;

  function setOne(uint v) {
    require(v > 10);

    value1 = v;
  }

  function setTwo(uint v) {
      if(v <=  10 ) throw;

      value2 = v;
  }  
}
