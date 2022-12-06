pragma solidity >=0.4.24;

contract ERC20Interface {

    string public constant name = "Udacity Token";
    string public constant symbol = "UDC";
    uint8 public constant decimals = 18;  

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function transfer(address to, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);

}

contract MyToken is ERC20Interface  {
    uint _totalSupply;
    mapping (address => uint) private balances;
    mapping (address => mapping (address => uint )) private approvedSpenders;

    constructor(uint amount) public {
        _totalSupply = amount;
        balances[msg.sender] = _totalSupply;
    }

    modifier onlyWithBalance(address from, uint tokens) {
        require(balances[from] >= tokens, "Not enough balance");
        _;
    }

    modifier onlyWithAllowance(address tokenOwner, address spender, uint tokens) {
        require(approvedSpenders[tokenOwner][spender] >= tokens, "Not enough allowance");
        _;
    }

    modifier onlyDifferentAddresses(address from, address to) {
        require(from != to, "Cannot send tokens to the same address");
        _;
    }

    modifier onlyWithValue(uint tokens) {
        require(tokens > 0, "Cannot send 0 tokens");
        _;
    }

    function totalSupply() public view returns (uint) {
        return  _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) 
        onlyDifferentAddresses(msg.sender, to)
        onlyWithValue(tokens)
        onlyWithBalance(msg.sender, tokens)
    public returns (bool) {
        balances[msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(msg.sender, to, tokens);

        return true;
    }

    function transferFrom(address from, address to, uint tokens) 
        onlyDifferentAddresses(from, to)
        onlyWithValue(tokens)
        onlyWithAllowance(from, msg.sender, tokens)
        onlyWithBalance(from, tokens)
    public returns (bool) {
        balances[from] -= tokens;
        approvedSpenders[from][msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(from, to, tokens);

        return true;
    }

    function approve(address spender, uint tokens) public returns (bool) {
        approvedSpenders[msg.sender][spender] = tokens;

        emit Approval(msg.sender, spender, tokens);

        return true;
    }

    function allowance(address tokenOwner, address spender) public view returns (uint) {
        return approvedSpenders[tokenOwner][spender];
    }
}
