contract delegatedcalled {      
  address public callerAddress;
  uint public number;
function setNumber(uint _number) {
    number = _number;
    callerAddress = msg.sender;
  }
}
