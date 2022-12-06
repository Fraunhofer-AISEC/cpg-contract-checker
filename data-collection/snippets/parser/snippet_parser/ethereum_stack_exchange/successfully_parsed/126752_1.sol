constructor() {
    balances[msg.sender] = totalSupply_;
}

function totalSupply() public override view returns (uint256) {
    return totalSupply_;
}

function balanceOf(address [msg.sender]) public override view returns (uint256) {
    return balances[msg.sender];
}
