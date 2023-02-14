 function mintBatch(address to, uint[] memory tokenId , uint256[] memory amounts, string[] memory tokenUris , uint256[] memory _royaltyFee)  public
    {
        require(tokenUris.length == amounts.length , "Ids and TokenUri length mismatch");

       
        for (uint i = 0; i < amounts.length; i++){
            _setURI(tokenId[i], tokenUris[i]);
        }
         _mintBatch(to, tokenId, amounts, "0x00");

         batchMintTokenids[to] = tokenId;
    
        emit mintBatched(tokenId,amounts,to);
             
    }
