pragma solidity 0.8.6;

import "./MyToken.sol";

contract  MySwap {

string public name = "MySwap Ultimate Exchange";

Saubaan public token;
uint public rate = 100;

event TokenPurchased(
    address  account,
    address token,
    uint amount,
    uint rate
     
);

constructor (Saubaan _token) public {
    token = _token;
}
 function buyTokens() public payable  {
 uint tokenAmount = msg.value*rate;

 
 require(token.balanceOf(address(this)) >= tokenAmount);

 token.transfer(msg.sender, tokenAmount );


emit TokenPurchased(msg.sender, address(token), tokenAmount, rate);

 }
 function sellTokens(uint _amount) public payable {
 

 uint etherAmount = _amount / rate;
 
 token.transferFrom(msg.sender, address(this), _amount);
payable(msg.sender).transfer(etherAmount);

 }

}
