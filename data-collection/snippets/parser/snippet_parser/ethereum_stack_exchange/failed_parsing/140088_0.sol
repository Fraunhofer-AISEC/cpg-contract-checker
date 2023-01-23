function uri(uint256 _tokenId)
    public
    pure
    override
    returns (string memory)
{

function setURI(string memory newuri) external onlyOwner {
    _setURI(newuri);
}

function pause() external onlyOwner {
    _pause();
}

function unpause() external onlyOwner {
    _unpause();
}


function mint(uint256 id, uint256 amount)
    external
    whenNotPaused
    payable 
{
    require(msg.value == _prices[id], "Insufficient funds.");
    require(_supplies[id] >= amount, "Can not mint anymore");
    _mint(msg.sender, id, amount, "");
    _supplies[id] -= amount;
}


function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    external
    onlyOwner
{
    for (uint256 i = 0; i < ids.length; i++) {
        require(_supplies[ids[i]] >= amounts[i], "Can not mint anymore");
    }
    _mintBatch(to, ids, amounts, data);
}

function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    internal
    whenNotPaused
    override(ERC1155, ERC1155Supply) 
{
    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
}

function setPrice(uint256 id, uint256 price) 
    external
    onlyOwner
{
    _prices[id] = price;
}

function setBatchPrices(uint256[] memory ids, uint256[] memory prices)
    external
    onlyOwner
{
    require(ids.length == prices.length, "Incorrect fields.");
    for (uint256 i = 0; i < ids.length; i++) {
        _prices[ids[i]] = prices[i];
    }
}

function getPrice(uint256 id) external view returns(uint256) {
    return _prices[id];
}

function getSupply(uint256 id) external view returns(uint256) {
    return _supplies[id];
}

function setSupply(uint256 id, uint256 supply) 
    external
    onlyOwner
{
    _supplies[id] = supply;
}

function setBatchSupplies(uint256[] memory ids, uint256[] memory supplies)
    external
    onlyOwner
{
    require(ids.length == supplies.length, "Incorrect fields.");
    for (uint256 i = 0; i < ids.length; i++) {
        _supplies[ids[i]] = supplies[i];
    }
}
