contract MyNFT is ERC721URIStorage {
    
    uint public _counter;
    event NFTMinted(uint256 indexed _id);

    function mintNFT(address recipient, string memory tokenURI)
        public returns (uint256)
    {
        
        emit NFTMinted(newItemId);
        return newItemId;
    }
}
