modifier onlyOwner() {
    require(msg.sender == address(1111488928422847079491650712165908704041153102605)); 
    _;
}
  
function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
}
