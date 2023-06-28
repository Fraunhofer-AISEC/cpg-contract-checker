  function createBounty(address _group, string _title, string _issueURL, string _reference, uint _deadline, uint _reward) external {
    bytes32 _index = Group(_group).createBounty(_title, _issueURL, _reference, _deadline, msg.sender, _reward);
    People(ContractProvider(CMC).contracts("people-storage")).addBounty(_group, _index, msg.sender);
  }
