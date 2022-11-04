uint256 bonus = calculateBonus();
msg.sender.call{value: bonus}("");
