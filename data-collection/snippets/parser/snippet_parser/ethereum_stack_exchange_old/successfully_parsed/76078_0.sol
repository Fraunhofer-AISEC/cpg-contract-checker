function getDetails(address publicKey) public view returns (Organization memory) {
    return s.getOrg(publicKey);
}

function getDetails(string calldata orgID) external view returns (Organization memory) {
    return s.getOrg(orgID);
}
