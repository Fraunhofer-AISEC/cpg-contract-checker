pragma solidity ^0.4.24;

library SafeMath{
function add(uint a, uint b) internal pure returns (uint c) {
c = a + b;
require(c >= a);
}
function sub(uint a, uint b) internal pure returns (uint c) {
require(b <= a);
c = a - b;
}
function mul(uint a, uint b) internal pure returns (uint c) {
c = a * b;
require(a == 0 || c / a == b);
}
function div(uint a, uint b) internal pure returns (uint c) {
require(b > 0);
c = a / b;
}
}
contract ERC20Interface {
function totalSupply() public constant returns (uint);
function balanceOf(address tokenOwner) public constant returns (uint balance);
function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
function transfer(address to, uint tokens) public returns (bool success);
function approve(address spender, uint tokens) public returns (bool success);
function transferFrom(address from, address to, uint tokens) public returns (bool success);
event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract Owned {
address public owner;
constructor() public {
owner = msg.sender;
}
modifier onlyOwner {
require(msg.sender == owner);
_;
}
}
contract Presale is Owned{
using SafeMath for uint256;
ERC20Interface public token;
uint256 public rate = 1; 
event TokenPurchase(address indexed purchaser, uint256 value, uint256 amount);
constructor() public {
token = ERC20Interface(0x2f4Ae24fDC6E18945eC2Ba1756B421B8157Ec34A); 
}
function () external payable {
buyTokens();
}
function buyTokens() payable public {
require(msg.sender != 0x0);
uint256 amount = msg.value;
uint256 tokens = getTokenAmount(amount);
deliverTokens(msg.sender, tokens);
emit TokenPurchase(msg.sender, amount, tokens);
}
function deliverTokens(address beneficiary,uint256 tokenAmount) internal{
require(tokenAmount > 0, "Can't buy zero or negative");
require(tokenAmount <= token.balanceOf(address(this)), "Can't buy more than allocated");
require(token.balanceOf(address(this)) > 0, "");
token.transfer(beneficiary, tokenAmount);
}
function getTokenAmount(uint256 amount) public view returns (uint256){
return rate.mul(amount);
}
function tokensHere() public view returns(uint256) {
return token.balanceOf(address(this));
}
function WithdrawBNB() onlyOwner() public {
require(address(this).balance > 0, "Can't withdraw negative or zero");
(msg.sender).transfer(address(this).balance);
}
} 
