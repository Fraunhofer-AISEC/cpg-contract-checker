function toUint(address self) internal pure returns(uint256) {
    return uint256(uint160(self));
}
