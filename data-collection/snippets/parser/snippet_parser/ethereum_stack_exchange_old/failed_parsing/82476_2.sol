function callMyFunc(...) public view returns (uint256, uint256) {
    uint256[2] memory ret;
    ...
    64 
    ...
    return (ret[0], ret[1]);
}
