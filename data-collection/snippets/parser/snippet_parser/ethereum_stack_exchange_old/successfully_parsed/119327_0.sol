function tokenOfOwner(address owner) public virtual returns (uint256[] memory) 
{
    uint256[] storage _ownerAmount;
    uint256 amount = ERC721.balanceOf(owner);
    for(uint256 i = 0; i< amount ; i++)
    {
        _ownerAmount.push(_ownedTokens[owner][i]);
    }
    return _ownerAmount;
}
