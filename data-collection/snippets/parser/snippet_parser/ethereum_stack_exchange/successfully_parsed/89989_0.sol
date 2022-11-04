contract TokenContractV2 {
    
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    uint256 private _totalSupply;

    
    mapping (address => uint256) private _newBalances;

    function transfer(address recipient, uint256 amount) external returns(uint) {
        _newBalances[msg.sender] = _newBalances[msg.sender].sub(amount);
        _newBalances[recipient] = _newBalances[recipient].add(amount);

        return true;
    }
}
