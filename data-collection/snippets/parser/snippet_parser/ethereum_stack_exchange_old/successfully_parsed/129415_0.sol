function setMap(address[] calldata addresses, uint8 value) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            _addressMap[addresses[i]] =  value;
        }
}
