uint tokenExchangeRate = 0.0001 ether 


 function () payable external {
        require(!isFinalized);
        require(msg.value != 0 && msg.value >= tokenExchangeRate);

        uint256 tokens = msg.value / tokenExchangeRate 
        uint256 checkedSupply = safeAdd(totalSupply, tokens);

        require(tokenCreationCap >= checkedSupply);

        totalSupply = checkedSupply;
        balances[msg.sender] += tokens;
        CreateVCONA(msg.sender, tokens);
    }
