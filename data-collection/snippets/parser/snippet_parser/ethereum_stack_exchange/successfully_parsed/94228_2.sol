function freeFromUpTo(address from, uint256 value) public returns (uint256) {
    return freeFrom(from, Math.min(Math.min(value, balanceOf(from)), allowance(from, msg.sender)));
}
