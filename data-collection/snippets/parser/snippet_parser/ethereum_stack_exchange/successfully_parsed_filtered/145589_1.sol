function mintEveyone(address account, uint256 id, uint256 amount, bytes memory data)
    public
{
    _mint(account, id, amount, data);
}
