function getWhitelistedUsers() public onlyOwner returns (address[]) {

    address[] memory whitelistedUsers = Roles[ROLE_WHITELISTED].bearer.keys();
    return whitelistedUsers;
}
