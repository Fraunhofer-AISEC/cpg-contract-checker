pragma solidity ^0.7.0;

contract PCE_Contract{

constructor(uint256 newStartTime, uint256 PERIOD)
{
_PERIOD     = PERIOD * 1 days  ;
 initiation = newStartTime     ;
}

 function enter() payable public
  { 
    require(( block.timestamp < (initiation + _PERIOD) ),
     "Period for this function has ended." );
    
  }
}
