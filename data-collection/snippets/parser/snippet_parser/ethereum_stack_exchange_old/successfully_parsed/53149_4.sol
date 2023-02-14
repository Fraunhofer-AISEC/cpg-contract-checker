function createToken(address _owner,uint256 _tokenId) onlyOwner public payable returns(bool){

    MyNFToken instance = MyNFToken(nftaddress);
    instance.mint(msg.sender, _owner,_tokenId);
    return true;
}
