pragma solidity >=0.4.22 <0.6.0;

import "./BaseToken.sol";

contract BaseTokenBet {

BaseToken public baseToken;

address public owner;

constructor() public {
    owner = msg.sender;
    baseToken = BaseToken(owner);
}

function getOwner() public view returns (address)  {
  return owner ;
}

function getBaseToken() public view returns (BaseToken)  {
  return baseToken ;
}


function getTokenBalance() public view returns (uint256){
    return baseToken.balanceOf(owner);
}

 }
