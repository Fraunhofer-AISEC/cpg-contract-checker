function withdraw() external nonReentrant {
 5        uint256 amount = balanceOf[msg.sender];
 6        balanceOf[msg.sender] = 0;
 7        (bool success, ) = msg.sender.call.value(amount)("");
 8        require(success, "Transfer failed.");
 9    }
