uint public totalSupply = 100000;

function addTokenToTotalSupply(uint _value) public {
    require(_value > 0);
    balances[msg.sender] = balances[msg.sender] + _value;
    totalSupply = totalSupply + _value;
}
