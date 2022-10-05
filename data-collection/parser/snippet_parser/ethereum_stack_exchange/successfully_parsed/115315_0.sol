
pragma solidity ^0.8.0;
    
contract Token {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalSupply = 1000000000 * 10 ** 18;
    string public name = "alex";
    string public symbol = "ali";
    uint public decimals = 18;
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        totalSupply = (totalSupply*80)/100;
        balances[msg.sender] = (totalSupply*20)/100;
    }


    

    
    function balanceOf(address owner) public returns(uint) {
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'balance too low');
        
        balances[to] += totalSupply;
        balances[msg.sender] -= value;
        balances[msg.sender] += balances[msg.sender];

        
        
       emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        
        
        
        balances[account] += amount;
        emit Transfer(address(0), account, amount);

        
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][msg.sender] >= value, 'allowance too low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;   
    }
    
    function approval(address spender, uint value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;   
    }

    
}
    
