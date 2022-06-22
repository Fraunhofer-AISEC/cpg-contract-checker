constructor(address[] memory addresses, uint256[] memory balances, bool[] memory flags) public {
    uint256 length = addresses.length;
    require(length == balances.length, "INVALID_INPUT");
    require(length == flags.length, "INVALID_INPUT");
    for (uint256 i = 0; i < length; i++) {
        
    }
}
