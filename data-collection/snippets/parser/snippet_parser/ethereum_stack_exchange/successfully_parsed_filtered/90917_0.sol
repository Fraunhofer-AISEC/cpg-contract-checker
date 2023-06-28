pragma solidity >=0.4.22 <0.7.0;
contract D {
  uint public n;
  address public sender;

  function delegatecallSetN(address _e, uint _n) public {
    _e.delegatecall(abi.encode(bytes4(keccak256("setN(uint256)")), _n));
  }
}

contract E {
  uint public n;
  address public sender;
  uint test = 10;

  function setN(uint256 _n) public {
    n = _n;
    sender = msg.sender;
  }
}
