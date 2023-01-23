contract D {
  uint public n;
  address public sender;

  function delegatecallSetN(address _e, uint _n) {
    _e.delegatecall(bytes4(sha3("setN(uint256)")), _n); 
  }
}

contract E {
  uint public n;
  address public sender;
  function setN(uint _n) {
    n = _n;
    sender = msg.sender;
  }
}
