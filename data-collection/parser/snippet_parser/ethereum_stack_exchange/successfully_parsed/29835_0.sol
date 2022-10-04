pragma solidity ^0.4.13;

import '../node_modules/zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import '../node_modules/zeppelin-solidity/contracts/token/StandardToken.sol';


contract BBTico is Crowdsale  {

    function BBTico(uint256 startTime, uint256 endTime, uint256 _rate, address _wallet) 
    Crowdsale(now, now + 5*60,  5, 0xB1A9B5564071A442909b17f8e9C7288b44aFC014 , 0xefcfbc96dc2adfe35d3fff6b1d9e985066d618ac) 
    {}


}
