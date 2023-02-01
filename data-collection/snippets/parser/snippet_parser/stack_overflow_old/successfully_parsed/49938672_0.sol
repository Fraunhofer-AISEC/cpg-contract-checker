contract ContractA {
  bool public is_approved;
  address public visa_details;
  uint public artifact_count;

  
  function ContractA() public {
    owner = msg.sender;
  }
}
