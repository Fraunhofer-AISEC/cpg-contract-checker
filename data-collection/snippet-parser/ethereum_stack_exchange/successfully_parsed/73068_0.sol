function transfer(address to, uint256 value) public returns (bool) {
require(value <= _balances[msg.sender]);
require(to != address(0));

uint256 tokensToBurn = value.div(100000).mul(7);
uint256 tokensToDividend = value.div(100000).mul(3);
uint256 tokensToTransfer = value.sub(tokensToBurn).sub(tokensToDividend);

_balances[msg.sender] = _balances[msg.sender].sub(tokensToTransfer);
_balances[to] = _balances[to].add(tokensToTransfer);

_totalSupply = _totalSupply.sub(tokensToBurn);
_totalDividend = _totalDividend.add(tokensToDividend);

emit Transfer(msg.sender, to, tokensToTransfer);
emit Transfer(msg.sender, address(0), tokensToBurn);
emit Transfer(msg.sender, address(this), tokensToDividend);

return true;
}