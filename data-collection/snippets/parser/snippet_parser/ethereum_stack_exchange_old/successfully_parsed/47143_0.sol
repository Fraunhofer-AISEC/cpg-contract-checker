function transfer(address _to, uint256 ENvalue, uint256 PWvalue) public returns (bool) {
require(_to != address(0));

balances[_to].bEN = balances[_to].bEN + ENvalue;

balances[_to].bPW = balances[_to].bPW + PWvalue;

return true;
}