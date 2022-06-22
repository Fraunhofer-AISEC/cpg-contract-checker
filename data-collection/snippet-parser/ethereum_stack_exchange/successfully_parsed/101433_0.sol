pragma solidity ^0.8.4;

contract TTT {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;
    uint256 public totalSupply = 10 * 10 * 10**9;
    string public name = "Test Token";
    string public symbol = "TTT";
    uint256 public decimals = 9;
    
    event Transfer(address indexed  from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint256) {
        return balances[owner];
    }
    
    function transfer(address to, uint256 value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'Wallet balance is too low');
        balances[to] += value;
        balances[msg.sender] -= value;
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
    
