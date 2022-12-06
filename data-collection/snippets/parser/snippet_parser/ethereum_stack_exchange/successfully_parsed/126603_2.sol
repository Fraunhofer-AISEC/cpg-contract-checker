function reveal(unit256 color, bytes32 salt) public {
    bytes32 hash = keccak256(abi.encode(color, salt));
    require(commits[msg.sender] == hash, "Invalid hash");

    colorsMapping[colorID].awardedPoints++;  
}
