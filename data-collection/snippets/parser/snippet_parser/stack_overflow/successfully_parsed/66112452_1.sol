uint256 bonus = calculateBonus();
payable(msg.sender).transfer(bonus);
