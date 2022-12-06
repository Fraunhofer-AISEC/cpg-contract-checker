function createAmp(
    string memory _name,
    uint256 _price,
    uint256 _amount
) public payable virtual  returns (uint256) {

    _setDefaultRoyalty(owner, 800);
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();
    idToAmp[newTokenId].creator = payable(msg.sender);
    idToAmp[newTokenId].name = _name;
    idToAmp[newTokenId].price = _price;
    idToAmp[newTokenId].amount = _amount;
    idToAmp[newTokenId].valid = true;
    
    _mint(msg.sender, newTokenId, _amount, "");

    totalAmp += _amount;

    return newTokenId;       
}
