function addWhitelists(address[] memory _users) external onlyOwner {
        for (uint256 i = 0; i < _users.length; i++) {
            addWhitelist(_users[i]);
        }
}
