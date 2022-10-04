function offerTokenTribute(address[] _tokenContractAddresses, uint256[] _tokenTributes) public {
  require(_tokenContractAddresses.length == _tokenTributes.length);

  Member storage member = members[msg.sender];
  member.approved = false; 

  for (uint8 i = 0; i < _tokenContractAddresses.length; i++) {
    ERC20 erc20 = ERC20(_tokenContractAddresses[i]);
    erc20.approve(this, _tokenTributes[i]);
    member.tokenTributeAddresses.push(_tokenContractAddresses[i]);
    member.tokenTributeAmounts.push(_tokenTributes[i]);
  }

  TokenTributeOffered(msg.sender, _tokenContractAddresses, _tokenTributes);
}
