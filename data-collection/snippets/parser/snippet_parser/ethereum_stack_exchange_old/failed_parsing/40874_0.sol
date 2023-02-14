pragma solidity 0.4.19;

contract MyContract {   
  uint[] public myArr;

  MyContract(uint[] _initArr) public {
    for (uint i=0; i < _initArr.length; i++) {
      myArr.push(_initArr[i]);
    }
  }

  function getMyArr public constant returns (uint[]) {
    return myArr;   
  } 
}
