mapping() private _balance;
address public admin;

constructor {
    admin = msg.sender;
}

modifier onlyAdmin {
    require(msg.sender == admin, "Only admin");
    _;
}

function pay(address _account, uint256 _amount) public onlyAdmin {
    _balance[_account] += _amount; 
}

function getBalance(address _account) public view returns(uint256) {
    return _balance[_account];
}
