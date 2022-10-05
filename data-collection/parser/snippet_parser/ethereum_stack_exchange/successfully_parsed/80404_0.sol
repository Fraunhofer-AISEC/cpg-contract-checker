pragma solidity ^0.6.0;

import 'IERC20.sol';

contract Kaarya is IERC20 {

   uint public constant _totalSupply = 1000000;

   string public constant symbol = "KRY";
   string public constant name = "Kaarya Token";
   uint8 public constant decimals = 3;


   mapping(address => uint256) balances;
   mapping(address => mapping(address => uint256)) allowed;


   constructor() public{
       balances[msg.sender] = _totalSupply;
   }


   function totalSupply() external view returns (uint256) {
       return _totalSupply;
   }


   function balanceOf(address account) external view returns (uint256) {
    return balances[account];
   }


   function transfer(address recipient, uint256 amount) external returns (bool) {
       require (
        balances[msg.sender] >= amount
        && amount > 0
    );
    balances[msg.sender] -= amount;
    balances[recipient] += amount;
    Transfer(msg.sender, recipient, amount);
    return true;
    }

   function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
       require(
           allowed[sender][msg.sender] >= amount
           && balances[sender] >= value
           && amount > 0
       );
       balances[sender] -= amount;
       balances[recipient] += amount;
       allowed[sender][msg.sender] -= amount;
       return true;
   }

   function allowance(address owner, address spender) external view returns (uint256) {
       return allowed[owner][spender];
   }

   function approve(address spender, uint256 amount) external returns (bool) {
       allowed[msg.sender][spender] = amount;
       Approval(msg.sender, spender, amount);
       return true;
   }

   event Transfer(address indexed from, address indexed to, uint256 value);

   event Approval(address indexed owner, address indexed spender, uint256 value);
}