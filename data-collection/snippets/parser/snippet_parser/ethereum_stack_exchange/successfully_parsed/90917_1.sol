
pragma solidity >=0.4.22 <0.7.0;

contract D {
  uint public n;
  address public sender;


  function delegatecallSetN(address _e, uint _n) public {
    _e.delegatecall(abi.encodeWithSignature("setN(uint256)", _n));
  }
  
  
}

contract E {
  uint public n;
  uint public test;
  address public sender;

  function setN(uint256 _n) public {
    n = _n;
    sender = msg.sender;
    test = 20;
  }
}
