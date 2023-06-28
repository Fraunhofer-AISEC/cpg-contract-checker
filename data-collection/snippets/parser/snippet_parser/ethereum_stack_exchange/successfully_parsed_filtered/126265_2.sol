function mintNonFungibleTokenEnum(uint256 tokenID)
    public
    returns (uint256)
{
    uint256 newItemId = 1;
    ParentTokenDetails storage ptd = tokenEnums[tokenID];
    ptd._tokenType = TokenType.NON_FUNGIBLE;
    ptd._tokenOwner = msg.sender;
    ptd.children[tokenID].push(ChildTokenDetails(TokenType.NULL, msg.sender, false));
    ptd.children[tokenID].push(ChildTokenDetails(TokenType.FUNGIBLE, msg.sender, false));
    return newItemId;
}
