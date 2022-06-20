    function pawnTokens(uint256 unitQuantity) public {       
        require(token.transferFrom(msg.sender, address(this), unitQuantity)); 
    }
     function payBack(address borrower, uint256 unitQuantity) public {
      require(token.transfer(borrower, unitQuantity));
    }
