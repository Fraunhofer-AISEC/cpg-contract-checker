**My Current Code:**

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract testTransfer{
using SafeMath for uint256;
mapping(address => uint) balances;
 

address private Commowner = payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2) ;
 uint256 public commission = 1;  

function transferFrom(address from, address to, uint amount, address _tokenAddress )  public payable {

uint fee =  amount  * commission / 10000; 


  
  
  IERC20(_tokenAddress).transferFrom(from, to, amount);

   balances[from] = balances[from].sub(fee);
    balances[Commowner] = balances[Commowner].add(fee); 
 

}}
