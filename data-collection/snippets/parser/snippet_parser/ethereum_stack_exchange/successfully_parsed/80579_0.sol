pragma solidity ^0.6.0;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
   }
}

contract Kaarya is IERC20 {

    using SafeMath for uint256;

    
    uint public constant _totalSupply = 1000000;


    string public constant symbol = "KRY";
    string public constant name = "Kaarya Token";
    uint8 public constant decimals = 3;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    constructor() public{
        balances[msg.sender] = _totalSupply;
    }

    
    function totalSupply() override external view returns (uint256) {
        return _totalSupply;
    }

    
    
    function balanceOf(address account) override external view returns (uint256) {
        return balances[account];
    }

    
    
    function transfer(address recipient, uint256 amount) override external returns (bool) {
        require (
            balances[msg.sender] >= amount
            && amount > 0
        );
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[recipient] = balances[recipient].add(amount);
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    
    function transferFrom(address sender, address recipient, uint256 amount) override external returns (bool) {
        require(
            allowed[sender][msg.sender] >= amount
            && balances[sender] >= amount
            && amount > 0
        );
        balances[sender] = balances[sender].sub(amount);
        balances[recipient] = balances[recipient].add(amount);
        allowed[sender][msg.sender] = allowed[sender][msg.sender].sub(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }

    
    
    function allowance(address owner, address spender) override external view returns (uint256) {
        return allowed[owner][spender];
    }

    
    function approve(address spender, uint256 amount) override external returns (bool) {
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(address indexed owner, address indexed spender, uint256 value);

}
