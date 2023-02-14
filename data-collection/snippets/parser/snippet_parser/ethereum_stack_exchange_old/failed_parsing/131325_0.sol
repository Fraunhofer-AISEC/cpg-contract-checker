function mint(uint256 quantity) external payable callerIsUser {
        
        if(whiteListSale)
        {
            whitelistMint(quantity);  <--(Undeclared identifier. "whitelistMint" is not (or not yet) visible at this point.)
        }
        else if(publicSale)
        {
            publicMint(quantity);  <--(Undeclared identifier. "publicMint" is not (or not yet) visible at this point.)
        }
        else
        {
            
        }
    }
