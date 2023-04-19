function WithdrawWinnings() public isWinner {
    address payable winner = payable(msg.sender);
    uint256 reward2Transfer = winnings[winner];
    winnings[winner] = 0;
    IER20(tokenContractAddress).transfer(winner, reward2Transfer);
}
