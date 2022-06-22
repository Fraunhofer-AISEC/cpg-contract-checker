function getUnitById(uint256 _id) public view returns (uint256 id, string name, uint256 attack, uint256 defense, uint256 heal, uint256[] questsCompleted) {
    return unitsContract.tokenToUnit(_id);
}
