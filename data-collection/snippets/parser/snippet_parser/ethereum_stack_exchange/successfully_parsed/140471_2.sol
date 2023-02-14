
error NotOwnerOfNFT();

function someFunction(address nftContract, unint256 tokenId) {
    
    if(IERC721(nftContract).ownerOf(tokenId) != msg.sender) revert NotOwnerOfNFT();

    
}
