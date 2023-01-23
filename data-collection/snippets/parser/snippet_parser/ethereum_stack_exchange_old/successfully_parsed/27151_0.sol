 contract Token {
    function mint(address _to, uint256 _amount) onlyOwner canMint returns (bool) {
     totalSupply = totalSupply.add(_amount);
     balances[_to] = balances[_to].add(_amount);
     Mint(_to, _amount);
     return true;
 }
}