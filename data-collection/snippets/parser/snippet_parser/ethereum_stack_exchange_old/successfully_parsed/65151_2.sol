contract delegatedcalled {
  uint public numberxxxx;
  address public callerAddress;
  function setNumber(uint _number) {
    numberxxxx = _number;
    callerAddress = msg.sender;
  }
}
