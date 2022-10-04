function spreadTheGain() external {
    uint256 totalBalance = address(this).balance;
    for (uint i = 0; i < indexedAddressesCounter; i++) {
        uint256 amount = (totalBalance * balances[ownersAddresses[i]]) / _totalSupply;
        payable(ownersAddresses[i]).transfer(amount);
    }
}
