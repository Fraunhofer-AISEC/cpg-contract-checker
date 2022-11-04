pragma solidity ^0.5.8;

import "browser/ERC20.sol";

contract LoanToken {
    
    uint private _totalSupply = 1000;
    string public name = "LoanToken";
    string public symbol = "LT";
    uint8 public decimals = 0;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping (address => uint) public _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    constructor() public {
        _balances[msg.sender] = totalSupply();
        emit Transfer(address(0), msg.sender, totalSupply());
    }

    
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    
    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }

    
    function transfer(address recipient, uint256 amount) public returns (bool)
    {
        if (_balances[msg.sender] >= amount && amount > 0) {

            _balances[recipient] += amount;
            _balances[msg.sender] -= amount;

            emit Transfer(msg.sender, recipient, amount);

            return true;
        } else { return false; }
    }

    
    function allowance(address owner, address spender) public view returns (uint256) 
    {
        return _allowances[owner][spender];
    }

    
    function approve(address spender, uint256 amount) public returns (bool)
    {
        _allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }

    
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool)
     {
        if (_balances[sender] >= amount && _allowances[sender][msg.sender] >= amount && amount > 0) {

            _balances[recipient] += amount;
            _balances[sender] -= amount;
            _allowances[sender][msg.sender] -= amount;

            emit Transfer(sender, recipient, amount);

            return true;
        } else { return false; }
    }
}
