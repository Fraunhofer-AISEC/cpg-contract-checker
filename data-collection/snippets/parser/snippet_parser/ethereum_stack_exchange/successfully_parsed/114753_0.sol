constructor() {
        name = "Test Token";
        symbol = "TTKN";
        decimals = 18;
        _totalSupply = 1000000000000000000000000000000;
        

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

function totalSupply() public override view returns (uint256) {
    return _totalSupply  - balances[address(0)];
}
