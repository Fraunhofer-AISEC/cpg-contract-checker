function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId
)
    internal
    virtual
    override
{
    super._beforeTokenTransfer(from, to, tokenId);

    
    require(someRequirement(_msgSender()), 'MyERC721: Sender has not met the requirement to proceed')

   
}
