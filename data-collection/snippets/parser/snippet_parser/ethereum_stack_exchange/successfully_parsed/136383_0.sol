function getOwnedIds(address holder) internal view returns(uint256[] memory) {
      uint256 amountOwned = _contract.balanceOf(holder);
      require(amountOwned > 0, "Address does not own any Toybirds");
      uint256 total = _contract.totalSupply();
      uint256[] memory ownedIds = new uint256[](amountOwned);
      uint256 idx = 0;

      for(uint256 i = 1; i <= total; i++) {

        if(ownedIds.length >= amountOwned) break;
        
        if(_contract.ownerOf(i) == holder) {
          ownedIds[idx] = i;
          idx++;
        }
      }

      return ownedIds;
    }
