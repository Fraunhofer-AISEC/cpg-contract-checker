pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';
import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import './LeonardianToken.sol';

contract LeonardianCrowdsale is Crowdsale {

    ERC20 _token = new LeonardianToken();

    function LeonardianCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet, MintableToken _token) public 
    Crowdsale(_rate, _wallet, _token)
    
    {

    }
}
