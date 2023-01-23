mapping (address => mapping (address => uint256)) private _allowances;

uint256 private _totalSupply;


function totalSupply() public view returns (uint256) {
    return _totalSupply;
}


function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
}
