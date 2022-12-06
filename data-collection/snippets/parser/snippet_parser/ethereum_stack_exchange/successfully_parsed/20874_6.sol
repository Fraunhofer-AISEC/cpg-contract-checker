contract token {    
  function () payable {
    create(msg.sender);
  }
  function create(address _beneficiary) payable{
    uint256 amount = msg.value;
    
  }
}
