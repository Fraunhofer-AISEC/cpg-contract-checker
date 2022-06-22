  function createBounty(
    BountyInterface.Bounty storage _bounty,
    string _title,
    string _issueURL,
    string _reference,
    uint _deadline,
    address _issuer,
    uint _reward
  ) external returns (bytes32) {
      bytes32 _index = keccak256(abi.encodePacked(_issueURL));
      _bounty.bounties[_index].title = _title;
      _bounty.bounties[_index].issueURL = _issueURL;
      _bounty.bounties[_index].reference = _reference;
      _bounty.bounties[_index].timestamp = block.timestamp;
      _bounty.bounties[_index].deadline = _deadline;
      _bounty.bounties[_index].status = BountyInterface.statusOptions.ACTIVE;
      _bounty.bounties[_index].issuer = _issuer;
      _bounty.bounties[_index].reward = _reward;
      _bounty.bounty_indices.push(_index);
      emit logCreateBounty(_issuer, msg.sender, _title, _reward);
      return _index;
  }
