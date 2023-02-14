function tokenOfOwner(address owner) public virtual returns (uint256[] memory) 
{
    uint256 amount = ERC721.balanceOf(owner);
    uint256[] memory _ownerAmount = new uint[](amount);
    for(uint256 i = 0; i< amount ; i++)
    {
        _ownerAmount[i] = _ownedTokens[owner][i];
    }
    return _ownerAmount;
}
