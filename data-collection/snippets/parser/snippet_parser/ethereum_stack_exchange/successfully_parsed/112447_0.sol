function _addBond(bytes32 alp, bytes32 bet) internal returns (uint256 id) {
    id = bonds.length / 2;
    bonds.push(alp);
    bonds.push(bet);
}
