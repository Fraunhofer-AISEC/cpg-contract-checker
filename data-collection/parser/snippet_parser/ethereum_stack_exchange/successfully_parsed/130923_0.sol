  function fetchMarketItems () public view returns(MarketItem[] memory) {
        
          uint itemCount = _tokenIds.current();
        
          uint unsoldItemCount = _tokenIds.current - _tokensold.current();
          uint currentIndex = 0; }
