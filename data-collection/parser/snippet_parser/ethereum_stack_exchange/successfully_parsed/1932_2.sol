function value(Data storage self) internal view returns(uint256) {
    return valueMemory(self);
}

function valueMemory(Data memory self) internal view returns(uint256) {
    return uint256(self.origin).mul(
        now.sub(self.time).mul(self.speed).div(365 days).add(1e18)
    ).div(1e18);
}
