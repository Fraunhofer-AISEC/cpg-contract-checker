contract locker is IERC721
{
    function lockThisToken(address nftAddress, uint tokenID) public
    {
        IERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenID);
        
    }
}
