constructor(uint256 goal) internal {
    require(goal > 0);
    _escrow = new RefundEscrow(wallet());
    _goal = goal;
}
