function getAddresses() public view returns (address[] memory) {
    uint256 length = 0;
    for (address addr in balances) {
        length++;
    }
    address[] memory result = new address[](length);
    uint256 i = 0;
    for (address addr in balances) {
        result[i] = addr;
        i++;
    }
    return result;
}
