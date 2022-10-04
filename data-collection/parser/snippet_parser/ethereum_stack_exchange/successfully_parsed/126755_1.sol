function totalSupply() public override view returns (uint256) {
return totalSupply_;
}

function balanceOf(address [msg.sender]) public override view returns (uint256) {
    return balances[msg.sender];
}

function transfer(address to, uint256 value) public override returns (bool) {
    require(value <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender]-value;
    balances[to] = balances[to]+value;
    emit transfer(msg.sender, to, value);
    return true;
}

function approve(address spender, uint256 value) public override returns (bool) {
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}

function allowance(address owner, address spender) public override view returns (uint) {
    return allowed[owner][spender];
}

function transferFrom(address from, address to, uint256 value) public override returns (bool) {
    require(value <= balances[from]);
    require(value <= allowed[from][msg.sender]);

    balances[from] = balances[from]-value;
    allowed[from][msg.sender] = allowed[from][msg.sender]+value;
    balances[to] = balances[to]+value;
    emit Transfer(from, to, value);
    return true;
}
