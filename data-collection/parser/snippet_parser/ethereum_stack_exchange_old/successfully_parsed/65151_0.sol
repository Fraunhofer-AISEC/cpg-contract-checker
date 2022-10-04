contract caller {
  uint public number;
  address public callerAddress;

  function delegatecallSetNumber(address delegatedAddress, uint256 _number) public {
    delegatedAddress.delegatecall(bytes4(keccak256("setNumber(uint256)")), _number);
  }
}

contract delegatedcalled {
  uint public number;
  address public callerAddress;
  function setNumber(uint _number) public {
    number = _number;
    callerAddress = msg.sender;
  }
}
