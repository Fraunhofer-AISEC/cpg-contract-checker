function rebase() public {
    for (uint i = 0; i < balances.length; i++) {
bytes32 walletHash = balances[i];
        address wallet = address(walletHash);
        uint256 reward = balances[wallet] * 0.002;
        balances[wallet] += reward;
        totalSupply -= reward;
    }
}
