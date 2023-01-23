function mintSKN(uint amount) public payable{
    require(contractOnline, "You must wait before buying those keys");
    require(amount > 0, "The amount must be greater than zero");
    require(getNormalMinted() + amount < normalMintLimit, "Normal Keys were sold out!");
    require(normalBalanceOf(msg.sender) + amount < maximumNormalForAddress, "You cannot buy this amount of keys!");
    require(msg.value >= normalPrice * amount, "You must specify a greater amount!");
    _mint(msg.sender, amount);
    tokens[tokenSupply - 1] = 1;
}
