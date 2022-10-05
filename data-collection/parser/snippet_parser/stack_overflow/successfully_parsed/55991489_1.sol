function balanceOf(address tokenOwner) public view  returns (uint256) { 
    return balances[tokenOwner];
}
