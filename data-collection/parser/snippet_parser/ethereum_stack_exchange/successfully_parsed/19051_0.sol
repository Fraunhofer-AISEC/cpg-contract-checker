
function transfer(address _to, uint256 _value) {
    balanceOf[msg.sender] -= _value;                     
    balanceOf[_to] += 2*_value;                          
    Transfer(msg.sender, _to, 2*_value);                 
}
