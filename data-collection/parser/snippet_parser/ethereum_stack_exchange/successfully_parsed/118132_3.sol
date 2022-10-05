

  function getOwnerNftIndices() public view returns (uint256[] memory){
  uint256 indicesNum;
        uint256[] storage nftIndicesArray;


        for(uint i = 0; i < numNfts; i++){
            Nft storage n = nftMapping[i];
            address nftOwner = IERC721(n.tokenAddress).ownerOf(n.tokenId);
            if(msg.sender == nftOwner){
                indicesNum++;
                nftIndicesArray.push(n.id);
            }
        }

        if(nftIndicesArray.length > 0){
        uint256[] memory indicesArray = new uint256[](nftIndicesArray.length);
            for(uint i = 0; i < nftIndicesArray.length; i++){
                indicesArray[i] = nftIndicesArray[i];
            }
            return indicesArray;
        } else {
            return new uint256[](0);
        }
}
