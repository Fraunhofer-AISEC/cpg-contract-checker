pragma solidity >=0.4.22 <0.7.0;
contract D {
  uint public n;
  address public sender;

  function callSetN(address _e, uint256 _n) public {
    _e.call(abi.encode(bytes4(keccak256("setN(uint256)")), _n)); 
  }


  function delegatecallSetN(address _e, uint _n) public {
    _e.delegatecall(abi.encode(bytes4(keccak256("setN(uint256)")), _n));
  }
}

contract E {
  uint public n;
  uint public test;
  address public sender;

  function setN(uint256 _n) public {
    n = _n;
  }
}
