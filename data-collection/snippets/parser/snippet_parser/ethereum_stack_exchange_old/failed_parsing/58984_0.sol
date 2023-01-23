pragma solidity ^0.4.22;

import './NewToken.sol';

import 'zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';  

import 'zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';  
contract TokenCreate is MintedCrowdsale,TimedCrowdsale <br>{ <br>
  constructor()<br> Crowdsale(_rate, _wallet, _token) <br>
    TimedCrowdsale(_openingTime, _closingTime) <br> {<br>
    uint256 _openingTime;<br>
    uint256 _closingTime;<br>
    uint256 _rate;<br>
    address _wallet;<br>
    MintableToken _token;<br>
                 }<br>



}
