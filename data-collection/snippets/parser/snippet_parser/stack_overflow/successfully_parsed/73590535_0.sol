function buyPremiumSpin(uint256 spins) external {
    require(spins > 0, "You can't get 0 premium spins!");
    uint256 cost = premiumSpinPrize * spins;
    require(wblock.balanceOf(msg.sender) >= cost, "Not enough WBLOCKS!");
    wblock.transferFrom(msg.sender, address(teamWallet), cost);
    premiumSpins[msg.sender] += spins;
}
