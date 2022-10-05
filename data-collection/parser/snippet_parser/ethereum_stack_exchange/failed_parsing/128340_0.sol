event Transfer(address from, address to, uint amount);
event Approval(address owner, address spender, uint amount);

function transferFrom(address payable to, uint amount) external payable returns (bool success) {
    balances.move(msg.sender, to, amount);
    emit Transfer(msg.sender, to, amount);
    return true;
}

function approve(address spender, uint tokens) external returns (bool success) {
    require(allowed[msg.sender][spender] == 0, "");
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
}

function balanceOf(address tokenOwner) external view returns (uint balance) {
    return balances[tokenOwner];
}

constructor() payable {

}
