function push(
    History storage self,
    function(uint256, uint256) view returns (uint256) op,
    uint256 delta
) internal returns (uint256, uint256) {
    return push(self, op(latest(self), delta));
}
