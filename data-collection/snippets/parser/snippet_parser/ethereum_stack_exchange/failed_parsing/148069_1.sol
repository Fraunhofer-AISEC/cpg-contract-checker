uint256 stakeRewards;
constructor(string memory _name, string memory _symbol, uint256 _decimals) {
    ...
    stakeRewards = 1000 * (10 ** _decimals);
    balanceOf[msg.sender] += stakeRewards;
    ...
}
