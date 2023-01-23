function deposit() payable public {
        require(msg.value > 0, "the depot should be greate than 0");
        balances[msg.sender] += msg.value;
    }
