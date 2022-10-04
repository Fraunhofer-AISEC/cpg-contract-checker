function getBalance() external view returns (uint) {
    requireMembership(msg.sender);
    return coins[msg.sender];
}
