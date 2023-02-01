function hasRole(uint256 tokenId, string memory role) public view returns (bool) {
    string[] memory userRoles = tokenToRoles[tokenId];
    uint256 userRolesLength = userRoles.length;
    unchecked {
        for (uint256 i; i < userRolesLength; ++i) {
            
            
            
            if (userRoles[i] == role) {
                return true;
            }
        }
    }
    return false;
}
