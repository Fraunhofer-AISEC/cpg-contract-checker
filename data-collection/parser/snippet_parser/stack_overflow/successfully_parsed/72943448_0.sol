function getNftInfo(uint256[] calldata tokenIds) public view returns (uint256[] memory){
     
      uint256 tokenId;
      uint256[] memory tmp = new uint256[](tokenIds.length);
      for (uint i = 0; i < tokenIds.length; i++) {
          tokenId = tokenIds[i];
          Stake storage staked = vault[tokenId];
          tmp[i] = staked;
      }

      return tmp;
  }
