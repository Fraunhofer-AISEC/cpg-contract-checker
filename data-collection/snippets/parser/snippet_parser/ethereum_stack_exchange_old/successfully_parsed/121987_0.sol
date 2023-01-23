function depositEther() public payable override onlyOwner {
        require(msg.sender.balance >= msg.value, "Not enough funds");
        require(msg.value > 0, "Not correct value");
        (bool success, ) = address(this).call{value: msg.value}(
            "Sorry, transaction is failed"
        );
        require(success, "Failed to send Ether");

        balancesOfEthers[address(this)] += msg.value;

        emit Deposit(msg.sender, address(this), msg.value);
    }
