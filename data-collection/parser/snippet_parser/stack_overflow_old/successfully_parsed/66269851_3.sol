mapping (address => Weapon[]) userOwnedWeapons;

function balanceOf(address owner) external view returns (uint256) {
    return userOwnedWeapons[msg.sender].length;
}
