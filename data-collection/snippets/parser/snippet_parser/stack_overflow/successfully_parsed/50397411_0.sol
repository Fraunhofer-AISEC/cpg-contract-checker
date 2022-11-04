
pragma solidity 0.4.23;

import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";

contract FloatFlowerTokenCrowdsale is Crowdsale{
  constructor(ERC20 _token) public Crowdsale(1000, msg.sender, _token) 
  {

  }
}
