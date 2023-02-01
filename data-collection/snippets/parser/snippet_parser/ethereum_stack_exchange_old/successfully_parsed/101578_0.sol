function approve(address spender, uint value) external returns (bool) {
    _approve(msg.sender, spender, value); 
    return true;
}

function _approve(address owner, address spender, uint value) private {
    allowance[owner][spender] = value;
    emit Approval(owner, spender, value);
}
