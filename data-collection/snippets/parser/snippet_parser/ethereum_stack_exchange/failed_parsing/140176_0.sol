contract CallNfts {
    address private nftAddress= 0x...;
   
    function maxSupply() public returns(uint256) {
        Nfts c = Nfts(nftAddress);
        return c.maxSupply();
    }
     function walletOfOwner(address addr) public returns(uint256) {
        Nfts c = Nfts(nftAddress);
        return c.walletOfOwner(addr);
    }
 
}

abstract contract Nfts{
    function maxSupply()public virtual returns(uint256);
    function walletOfOwner(address addr) public virtual returns(uint256);
}
'''
