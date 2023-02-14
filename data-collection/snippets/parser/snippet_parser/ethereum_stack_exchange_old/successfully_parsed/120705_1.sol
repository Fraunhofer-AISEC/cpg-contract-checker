function _transfer(address sender, address to, uint256 amount) internal{ 
   if(to != owner() &&
      to != address(0x0) &&
      to != address(this) &&

      to != address(0x10ED43C718714eb63d5aA57B78B54704E256024E) && 

      to != address(0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73) &&
      sender != owner()){
          uint256 wltSize = balanceOf(to);
          require((wltSize + amount)<= _maxWlt, "Sorry, too much. Size Matters.");
      }       
 require(sender != address(0), "ERC20: transfer from the zero address");
 require(to != address(0), "ERC20: transfer to the zero address");   
 require(amount > 0, "Transfer amount must be greater than zero");
     
_balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
 _balances[to] = _balances[to].add(amount);
 emit Transfer(sender, to, amount);
}
