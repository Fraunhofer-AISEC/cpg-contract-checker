function getAll() public view returns (address[] memory){
    address[] memory ret = new address[](addressRegistryCount);
    for (uint i = 0; i < addressRegistryCount; i++) {
        ret[i] = addresses[i];
    }
    return ret;
}
