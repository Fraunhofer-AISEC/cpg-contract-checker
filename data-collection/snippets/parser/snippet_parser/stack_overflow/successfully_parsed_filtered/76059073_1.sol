
pragma solidity ^0.8.17;
import "./realesatate.sol";

contract buying is list{

uint256 public amount;
constructor(){
amount=highestbid;
}
receive() payable external {
require(amount==msg.value,"pay more");   
}
}
