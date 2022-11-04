function checkFunds(address _owner) public view returns(uint256) {
    return funds[_owner];
}
