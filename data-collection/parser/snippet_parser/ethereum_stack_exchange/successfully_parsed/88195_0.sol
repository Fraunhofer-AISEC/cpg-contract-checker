import "./NFT.sol";

    contract ERC20 {
    
     NFT public nft;
    
     constructor (NFT _nftAddress) public {
      nft = _nftAddress;
    }
    function getNFTBalance(address _nftOwner) public view returns (uint256 result){
           nft.balanceOf(_nftOwner);
           return result;
       }
}