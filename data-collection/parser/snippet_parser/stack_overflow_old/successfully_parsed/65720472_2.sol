    function buyToken() public payable {
        balances[msg.sender] += 1;

        wallet.transfer(msg.value);

    }
