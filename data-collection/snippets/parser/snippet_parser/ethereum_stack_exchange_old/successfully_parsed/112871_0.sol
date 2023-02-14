function _transfer(address sender, address recipient, uint256 amount) internal {
     require(sender != address(0), "ERC20: transfer from the zero address");
     require(recipient != address(0), "ERC20: transfer to the zero address");
     
     require(_value%100 == 0);
     uint fee = _value/100; 
     _balance[thirdPartyAddress].add(fee);
     
     _balances[sender] = _balances[sender].sub(amount);
     _balances[recipient] = _balances[recipient].add(amount + fee);
     emit Transfer(sender, recipient, amount);
}
