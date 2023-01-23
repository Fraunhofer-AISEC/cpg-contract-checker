function withdraw() public payable {
        update(msg.sender);
        uint256 amount = dividendBalanceOf[msg.sender];
        dividendBalanceOf[msg.sender] = 0;
        address(msg.sender).transfer(amount);
    }
