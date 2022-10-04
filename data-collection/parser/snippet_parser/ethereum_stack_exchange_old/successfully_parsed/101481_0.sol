
      function () public payable {
        fundTokens();
    }

    function fundTokens() public payable {
        require(msg.value > 0);
        uint256 tokens = msg.value.mul(exchangeRate);
       require(balances[this].sub(tokens) > 0);
        balances[msg.sender] = balances[msg.sender].add(tokens);
        balances[this] = balances[this].sub(tokens);
        Transfer(msg.sender, owner, msg.value);
       forwardFunds();
    }

    function forwardFunds() internal {
        owner.transfer(msg.value);
    }
    

