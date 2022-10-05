    address payable winnerAddress = payable(players[index]);
    winnerAddress.transfer(address(this).balance);
