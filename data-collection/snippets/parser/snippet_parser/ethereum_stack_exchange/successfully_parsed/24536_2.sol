mapping (address => uint) public expirations;

function whitelistAddresses(address[] _addresses, uint[] expirations) onlyOwner {
    require(!whitelistInitialized);
    for (uint256 i = 0; i < _addresses.length; i++) {
        addresses[_addresses[i]] = expirations[i];
    }
}

function whitelistLockdown() onlyOwner {
    whitelistInitialized = true;
}
