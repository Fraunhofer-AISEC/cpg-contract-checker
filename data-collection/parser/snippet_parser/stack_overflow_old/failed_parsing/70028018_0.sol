contract RandomGenis usingProvable {
  string public rand;
  
  function sendRandomQuery() payable public returns (memory string) {
    return provable_query("WolframAlpha", "random number between 1 and 2^20");
  }

  function __callback(bytes32 _, string _result) public {
    require(msg.sender == provable_cbAddress());
    rand = _result;
  }
}
