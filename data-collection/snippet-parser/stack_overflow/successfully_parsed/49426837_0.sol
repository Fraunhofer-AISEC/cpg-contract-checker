 contract FarihaToken is ERC20Interface{
    using SafeMath for uint;

    string public symbol;
    string public name;
    uint8 public decimals;
    uint public _totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    
    
    
    function FarihaToken() public{
        symbol = "FTC";
        name = "Fariha Token";
        decimals = 18;
        _totalSupply = totalSupply();
        balances[msg.sender] = _totalSupply;
        Transfer(address(0),msg.sender,_totalSupply);
    }

    function totalSupply() public constant returns (uint){
       return 1000000 * 10**uint(decimals);
    }

    
    
    
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }

    
    
    
    
    
    function transfer(address to, uint tokens) public returns (bool success){
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender,to,tokens);
        return true;
    }

     
    
    
    
    
    
    
    
    function approve(address spender, uint tokens) public returns (bool success){
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender,spender,tokens);
        return true;
    }

    
    
    
    
    
    
    
    
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        balances[from] = balances[from].sub(tokens);
        allowed[from][to] = allowed[from][to].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender,to,tokens);
        return true;
    }

    
    
    
    
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}

contract PurchaseToken is FarihaToken{
    
    function() public payable {
        var amount = msg.value/2 ;
        require(balanceOf(this) >= amount);
        transfer(msg.sender,amount);
    }
} 
