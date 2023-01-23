function mintUniqueTokenTo (
    address _to,
    uint256 _tokenId,               
    string  _tokenURI 
) public
{        
    super.mint(_to, _tokenId);        
    super._setTokenURI(_tokenId, _tokenURI);
}
