function test()
    public
    returns (uint256)
{
    uint256 newItemId = 1;
    ParentTokenDetails._tokenType = TokenType.NON_FUNGIBLE;
    ParentTokenDetails._tokenOwner = msg.sender;
    ParentTokenDetails.children = ChildTokenDetails([TokenType.NULL, msg.sender, false]);
    TokenEnums[newItemId] = ParentTokenDetails;

    return newItemId;
}
