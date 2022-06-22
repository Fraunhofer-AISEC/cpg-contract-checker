pragma solidity >= 0.4.0 < 0.6.0;

contract ERC20
{

    
    event Transfer(address from, address to, uint256 value);
    event Approval(address tokenOwner, address spender, uint256 tokens);


    struct Allowance
    {
        uint256 amount;
        bool used;
    }
    mapping (address => uint256) balances;
    mapping (address => mapping(address => Allowance)) allowed;
    uint256 private TotalSupply;
    address internal owner;


    constructor() internal 
    {
        owner == msg.sender;
        TotalSupply = 200;
        balances[owner] = TotalSupply;
        emit Transfer(address(0), owner, TotalSupply);
    }


    function totalSupply() public view returns(uint)
    {
        return TotalSupply;
    }

    function balanceOf(address tokenOwner) public view returns(uint256)
    {
        return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view returns (uint256 remaining)
    {
        return allowed[tokenOwner][spender].amount;
    }

    function approve(address spender, uint256 value) public returns(bool success)
    {
        require(balances[msg.sender] >= value, "Insufficient balance");
        require(value == 0 ||
                ( allowed[msg.sender][spender].amount == 0 &&
                !allowed[msg.sender][spender].used ), "Please set your value to 0 before you allow");
        allowed[msg.sender][spender].used = false;
        allowed[msg.sender][spender].amount = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint256 value) public returns(bool success)
    {
        require(to != address(0));
        require(balances[msg.sender] >= value, "Insufficient balance");

        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function tranferFrom(address from, address to, uint256 value) public returns(bool success)
    {
        require(to != address(0));
        require(value <= allowed[msg.sender][from].amount);

        allowed[from][msg.sender].amount += value;
        balances[from] -= value;
        balances[to] += value;

        if(value > 0){
            allowed[from][msg.sender].used = true;
        }

        emit Transfer(from, to, value);
        return true;
    }
}
