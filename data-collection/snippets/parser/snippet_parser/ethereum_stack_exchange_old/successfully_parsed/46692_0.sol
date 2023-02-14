function fundIt() public payable returns (bool) {
            require(msg.value > .01 ether);
            address addr = this;
            donors.push(msg.sender);
            amount = addr.balance;

        }
