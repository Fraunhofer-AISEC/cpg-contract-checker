function rebase() public {
    for (address wallet in balances) {
        uint256 reward = balances[wallet] * 0.002;
        balances[wallet] += reward;
        totalSupply -= reward;
    }
}
