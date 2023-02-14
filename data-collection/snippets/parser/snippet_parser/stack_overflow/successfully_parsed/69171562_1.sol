modifier onlyOwner {
    
    
    require(msg.sender == address(0x123), 'Not authorized');
    _;
}

function mintToken(address owner, string memory metadataURI)
    public
    onlyOwner 
    returns (uint256)
{
    
}
