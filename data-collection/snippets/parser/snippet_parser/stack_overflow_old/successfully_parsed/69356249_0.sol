address admin = address(0x123);

function transfer(address _to, uint256 _amount) external returns (bool) {
    uint256 fee = (_amount / 100) * 3; 

    balances[msg.sender] -= _amount; 
    balances[admin] += fee; 
    balances[_to] += (_amount - fee); 
}
