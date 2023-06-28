function createToken (string memory _uri, uint256 _amount) public payable returns (uint) {
    require(totalSupply() < maxSupply - (_amount - 1), "Sorry, it just sold out");
    uint256 currentprice = _amount == 1 ? soloPrice : _amount == 4 ? quatroPrice : tenPrice;
    require(msg.value == currentprice, "Price must be equal to listing price");
    payable(owner()).transfer(msg.value);
    uint newItemId = 0;
    for (uint i=0; i<_amount; i++) {
        newItemId = minttoken(_uri); 
    }
    return newItemId;
}
function minttoken (string memory _uri) private returns (uint) {
    uint256 newItemId = totalSupply() + 1;
    _mint(msg.sender, newItemId);
    _uri = "ipfs://<HARDCODEDMYIPFSTOKEN>";
    _uri = string(abi.encodePacked(_uri,"/",Strings.toString(newItemId),".json"));
    _setTokenURI(newItemId, _uri);
    return newItemId;
}
