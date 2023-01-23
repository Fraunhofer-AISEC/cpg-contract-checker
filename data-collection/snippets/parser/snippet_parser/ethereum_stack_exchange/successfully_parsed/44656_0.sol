    function constructorfunc() public {
        symbol = "TKN";
        name = "token name";
        decimals = 4;
        bonusEnds = now + 1 weeks;
        endDate = now + 7 weeks;

    }



  function () public payable {
        require(now >= startDate && now <= endDate);
        uint tokens;
        if (now <= bonusEnds) {
            tokens = msg.value * 1200;
        } else {
            tokens = msg.value * 1000;
        }
        balances[msg.sender] = safeAdd(balances[msg.sender], tokens);
        _totalSupply = safeAdd(_totalSupply, tokens);
        Transfer(address(0), msg.sender, tokens);
        owner.transfer(msg.value);
    }
