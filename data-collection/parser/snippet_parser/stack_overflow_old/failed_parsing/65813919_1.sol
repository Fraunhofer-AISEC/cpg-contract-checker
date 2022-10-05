function withdraw() external nonReentrant {
 5        uint256 amount = balanceOf[msg.sender];
 6        balanceOf[msg.sender] = 0;
 7        
 9    }
