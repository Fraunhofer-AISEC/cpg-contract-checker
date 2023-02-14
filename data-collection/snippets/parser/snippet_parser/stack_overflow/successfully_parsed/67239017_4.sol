event Transfer(address from, address to, uint256 amount);

function transfer(address _to, uint256 _amount) public {
    emit Transfer(msg.sender, _to, _amount);
}
