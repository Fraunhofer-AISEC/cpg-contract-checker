function approveBUSD(address _spender, uint256 _value) public returns (bool) {
   return tokenB.approve(_spender, _value);
}

function buyTokens(uint256 amount) public payable {

uint256 allowance = tokenB.allowance(address(this), msg.sender);
require(allowance >= amount, "Check the token allowance");


tokenB.transferFrom(msg.sender, address(this),amount);

emit BoughtTokens(msg.sender, amount); 
}