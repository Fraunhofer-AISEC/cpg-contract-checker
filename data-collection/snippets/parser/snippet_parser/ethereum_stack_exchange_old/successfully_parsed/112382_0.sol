

pragma solidity ^0.8.9;




abstract contract ERC20Interface {
    
    function totalSupply() virtual public view returns (uint);
    function balanceOf(address tokenOwner) virtual public view returns (uint balance); 
    function allowance(address tokenOwner, address spender) virtual public view returns (uint remaining);
    function transfer(address to, uint tokens) virtual public returns (bool success); 
    function approve(address spender, uint tokens) virtual public returns (bool success);
    function transferFrom(address from, address to, uint tokens) virtual public returns (bool success);
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}



contract SafeMath {
    
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); c = a - b; } function safeMul(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); } function safeDiv(uint a, uint b) public pure returns (uint c) { require(b > 0);
        c = a / b;
    }
}

contract Test is ERC20Interface, SafeMath {
    string public name;
    string public symbol;
    uint8 public decimals; 

    uint256 public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() {
        name = "Test"; 
        symbol = "TST"; 
        decimals = 18; 
        _totalSupply = 1000000000000000000000000000; 

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    
    function totalSupply() public override view returns (uint) {
        return _totalSupply - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public override view returns (uint balance) {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public override view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    function approve(address spender, uint tokens) public override returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transfer(address receiver, uint tokens) public override returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[receiver] = safeAdd(balances[receiver], tokens);
        emit Transfer(msg.sender, receiver, tokens);
        return true;
    }

    function transferFrom(address sender, address receiver, uint tokens) public override returns (bool success) {
        balances[sender] = safeSub(balances[sender], tokens);
        allowed[sender][msg.sender] = safeSub(allowed[sender][msg.sender], tokens);
        balances[receiver] = safeAdd(balances[receiver], tokens);
        emit Transfer(sender, receiver, tokens);
        return true;
    }
}



     function burn (uint256 _value) public returns (bool success) {
         require(balanceOf[msg.sender] >= _value);
         balanceOf[msg.sender] -= _value;
         totalSupply -= _value; 
     }
     
     function burnFrom(address _from, uint256 _value) public returns (bool success) {
         require(balanceOf[_from] >= _value);
         require(_value <= allowance[_from][msg.sender]);
         balanceOf[_from] -= _value;
         totalSupply -= _value;
         return true;
     }
     

