function _attemptBurn(address owner, uint256 tokenId) internal 
{
    woolf.transferFrom(owner, address(0xdead), tokenId);
} 
