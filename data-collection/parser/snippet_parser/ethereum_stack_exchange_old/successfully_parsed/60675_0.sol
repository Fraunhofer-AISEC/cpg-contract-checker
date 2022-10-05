function createDao(string _tokenName) public payable {

  tokenNumberIndex = safeAdd(tokenNumberIndex, 1);

  string memory _tokenSymbol = 
         bytes32ToString(uintToBytes(tokenNumberIndex));

  address _tokenAddress = 
       (new REP).value(msg.value)(_tokenSymbol, _tokenName);

  erc20SymbolAddresses[_tokenSymbol] = _tokenAddress;

  proposalIndex = safeAdd(proposalIndex, 1);

  emit NewProposalCreated(proposalIndex);

  newProposalInternal(
    proposalIndex,
    _tokenSymbol, 
    _tokenName, 
    _tokenName,
    msg.sender,
    msg.value);    
}
