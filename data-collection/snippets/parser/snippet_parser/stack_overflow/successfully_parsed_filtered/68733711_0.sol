pragma solidity ^0.8.2;

contract Token {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;

    uint256 public decimals = 18;
    uint256 public totalSupply = 1000000000000 * 10**decimals;
    string public name = "Maxi Pump Token Try 2";
    string public symbol = "$MPT2";
    uint256 public allowedSellTime;
    uint256 public totalTime = 30;

    modifier sellNotAllowed() {
        require(
            block.timestamp > allowedSellTime,
            "You are not allowed to sell yet"
        );
        _;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor() {
        balances[msg.sender] = totalSupply;
        allowedSellTime = block.timestamp + totalTime;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }

    function transfer(address to, uint256 value)
        public
        sellNotAllowed
        returns (bool)
    {
        require(balanceOf(msg.sender) >= value, "balance too low buddy");
        

        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(balanceOf(from) >= value, "balance too low buddy");
        require(allowance[from][msg.sender] >= value, "allowance too low");
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        return true;
    }
}
