function getAllowedTo(address user) external view returns (address[] memory) {
    return users[user].allowedTo;
}
