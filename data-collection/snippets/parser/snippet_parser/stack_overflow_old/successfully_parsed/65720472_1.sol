    function buyToken() public payable {
        balances[msg.sender] += 1;

        wallet.transfer(0.1 ether);

    }
