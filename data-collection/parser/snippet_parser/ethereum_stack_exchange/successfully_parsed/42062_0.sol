pragma solidity ^0.4.19;

contract RobustDividendToken {

    string public name = "Robust Dividend Token";
    string public symbol = "DIV";
    uint8 public decimals = 18;

    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);

    mapping(address => uint256) public balanceOf;

    function RobustDividendToken() public {
        
        balanceOf[msg.sender] = totalSupply;
        Transfer(address(0), msg.sender, totalSupply);
    }

    uint256 public scaling = uint256(10) ** 8;

    mapping(address => uint256) public scaledDividendBalanceOf;

    uint256 public scaledDividendPerToken;

    mapping(address => uint256) public scaledDividendCreditedTo;

    function update(address account) internal {
        uint256 owed =
            scaledDividendPerToken - scaledDividendCreditedTo[account];
        scaledDividendBalanceOf[account] += balanceOf[account] * owed;
        scaledDividendCreditedTo[account] = scaledDividendPerToken;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);

        update(msg.sender);
        update(to);

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        update(from);
        update(to);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        Transfer(from, to, value);
        return true;
    }

    uint256 public scaledRemainder = 0;

    function deposit() public payable {
        
        uint256 available = (msg.value * scaling) + scaledRemainder;

        scaledDividendPerToken += available / totalSupply;

        
        scaledRemainder = available % totalSupply;
    }

    function withdraw() public {
        update(msg.sender);
        uint256 amount = scaledDividendBalanceOf[msg.sender] / scaling;
        scaledDividendBalanceOf[msg.sender] %= scaling;  
        msg.sender.transfer(amount);
    }

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        Approval(msg.sender, spender, value);
        return true;
    }

}
