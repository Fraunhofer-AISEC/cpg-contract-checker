
function mintNFT(address recipient, string memory tokenURI, bytes memory _data)
    public onlyOwner
    returns (uint256)
{
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();

    
    _setTokenURI(newItemId, tokenURI);

    
    
    _safeMint(recipient, newItemId, _data);

    return newItemId;
}
