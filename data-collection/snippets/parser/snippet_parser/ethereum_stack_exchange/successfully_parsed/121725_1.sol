interface IERC721 {
     function transferFrom(address from, address to, uint256 tokenId) external;
}

contract TransferNFT {
    function transferNFT(address NFTAddress, address _receiver, uint256 _NFTId) external {
        IERC721 NFT = IERC721(NFTAddress); 

        
        
        NFT.transferFrom(address(this), _receiver, _NFTId);
    }
}
