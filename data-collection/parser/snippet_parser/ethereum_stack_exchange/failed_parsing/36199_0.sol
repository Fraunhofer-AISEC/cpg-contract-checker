pragma solidity ^0.4.19; 

import "browser/ERC20.sol";
import "browser/SafeMath.sol";

contract TestCoin {
string public constant symbol = "TES";
string public constant name = "TestCoin";
uint8 public constant decimals = 18;

uint private constant __totalSupply = 100;
mapping (address => uint) private __balanceOf;
mapping (address => mapping (address => uint256)) internal allowed;


event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

function public TestCoin() {
    __balanceOf[msg.sender] = __totalSupply;
}

function totalSupply() public constant returns (uint _totalSupply) {
    _totalSupply = __totalSupply;
}
