function createCollection(string memory _name, string memory _tokenName) external returns(address NFT)
{
    
    NFT newContract = new NFT(_name, _tokenName);

    return newContract;
}
