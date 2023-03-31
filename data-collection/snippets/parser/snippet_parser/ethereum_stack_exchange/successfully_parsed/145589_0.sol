function mint(address account, uint256 id, uint256 amount, bytes memory data)
    public
    onlyOwner
{
    _mint(account, id, amount, data);
}

function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    public
    onlyOwner
{
    _mintBatch(to, ids, amounts, data);
}
