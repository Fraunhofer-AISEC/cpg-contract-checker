  
    
        function getOwnerNftIndices() public view returns (uint256[] memory nftIndicesArray){
    
    
         
    
    for(uint i = 0; i < numNfts; i++){
        Nft storage n = nftMapping[i];
        address nftOwner = IERC721(n.tokenAddress).ownerOf(n.tokenId);
        if(msg.sender == nftOwner){
            nftIndicesArray.push(n.id);
        }
    }
            
    
          
    
    
        }
