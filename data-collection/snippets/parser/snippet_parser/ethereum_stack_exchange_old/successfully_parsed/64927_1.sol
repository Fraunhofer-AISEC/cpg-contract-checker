function makeContract(uint256 uuid) view public returns (address, uint256) {
    address tokenAddress = new MyToken('Name');
    myMapping[uuid].tokenAddress = tokenAddress;
    return (tokenAddress, uuid);
}
