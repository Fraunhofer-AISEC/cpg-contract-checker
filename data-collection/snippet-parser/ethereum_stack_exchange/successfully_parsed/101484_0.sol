pragma solidity ^0.8.4;



contract Test_Token {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;
    uint256 public _totalSupply = 10 * 10 * 10**9;
    string public _name = "Test Token";
    string public _symbol = "TTT";
    uint256 public _decimals = 9;
    
    event Transfer(address indexed  from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed from, uint256 value);
    
    constructor() {
        balances[msg.sender] = _totalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint256) {
        return balances[owner];
    }
    
    function transferandBurn(address to, uint256 value) public returns (bool) {
        uint256 burn_token = (value / 100);
        require(balanceOf(msg.sender) >= value + burn_token, 'Wallet balance is too low');
        balances[to] += value - burn_token;
        balances[msg.sender] -= value - burn_token;
        _totalSupply -= burn_token;
        return true;
    }
    
    function transferFrom(address from, address to, uint256 value) public returns(bool) {
        require(balanceOf(from) >= value, 'Wallet Balance is too low');
        require(allowance[from][msg.sender] >= value, 'Allowance is too low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
        
    }
    
    function approve(address spender, uint256 value) public returns(bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }


}
