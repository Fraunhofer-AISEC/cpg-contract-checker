function setWalletLimit(address wallet, uint256 amount,uint day) onlyOwner() public{
         
      uint256 date =  block.timestamp;

      uint endDate = date +  (day * 1 days);

      _Limited[_limitedCount] = LimitedAddress(wallet,amount,endDate);
      _addressLimited[wallet].push(_limitedCount);

      emit SetLimit(_limitedCount,_Limited[_limitedCount]);

      _limitedCount++;

    }
