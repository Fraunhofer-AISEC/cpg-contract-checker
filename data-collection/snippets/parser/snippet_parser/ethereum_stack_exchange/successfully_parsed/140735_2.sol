function genesis(string calldata title, Stream.Member[] calldata members) external returns (address) {
    address payable clone = payable(Clones.clone(implementation));
    Stream s = Stream(clone);
    
    s.initialize(members);
    emit ContractDeployed(msg.sender, clone, title);
    return clone;
  }
