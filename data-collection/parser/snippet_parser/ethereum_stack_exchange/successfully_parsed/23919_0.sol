pragma solidity ^0.4.11;

contract GoodAndBad {

  function exec(uint flag) public constant returns (uint) {
    assert(flag == 1);
    return 0;
  }

}
