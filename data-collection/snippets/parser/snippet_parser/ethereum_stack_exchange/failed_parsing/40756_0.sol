browser/ballot.sol:166:17: DeclarationError: Undeclared identifier.
      require(_to != address(0));
              ^-^



function mintToken(address _target, uint256 _mintedAmount) onlyAdmin supplyLock public {
    require(_to != address(0));
    balances[_target] = SafeMath.add(balances[_target], _mintedAmount);
    totalSupply = SafeMath.add(totalSupply, _mintedAmount);
    Transfer(0, this, _mintedAmount);
    Transfer(this, _target, _mintedAmount);
}
