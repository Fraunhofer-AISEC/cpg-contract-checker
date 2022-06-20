function getValueSuccess() external view returns (bool) {
    return parentAddress.call(bytes4(keccak256("getValue()")));
}
