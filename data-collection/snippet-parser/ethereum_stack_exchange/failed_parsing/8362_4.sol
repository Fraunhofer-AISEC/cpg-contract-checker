pragma solidity ^0.4.0;

contract SetGetArray {

  uint[] someNumbers;

  function getArray() public constant returns (uint[]) {
    return someNumbers;
  }

  function setArray(uint[] setNumbers) public  {

    someNumbers = setNumbers;

  }

}


txHash:0x1cc74caab5c64c493a67cf8e3a8de656ba0db1d6f59c634e3c68e27a41afe7bf


