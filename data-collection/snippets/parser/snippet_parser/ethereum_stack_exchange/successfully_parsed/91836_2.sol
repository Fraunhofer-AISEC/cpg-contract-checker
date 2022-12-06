
    function buyTokens(uint256 _tokenAmount) public {
        
        
        require(saleActive == true, "TOK: SALE HAS ENDED.");
        require(_tokenAmount >= 1, "TOK: BUY ATLEAST 1 TOKEN.");
        
        
        uint256 cost = _tokenAmount * price;
        
        
        uint256 tokensToGet = _tokenAmount * 10**18;
        
        
        
        
        
        
        require(IBEP20(busd).transferFrom(_msgSender(), address(this), cost), "TOK: TRANSFER OF BUSD FAILED!");
        
        
        
        require(IBEP20(tok).transfer(_msgSender(), tokensToGet), "TOK: CONTRACT DOES NOT HAVE ENOUGH TOKENS.");
        
        tokensSold += tokensToGet;
        emit Sale(_msgSender(), price, tokensToGet);
    }

