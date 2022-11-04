pragma solidity ^0.5.8;
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol";


contract MyCrowdsale is Crowdsale, TimedCrowdsale, CappedCrowdsale, AllowanceCrowdsale {
    constructor (
        uint256 _rate,
        address payable _wallet,
        ERC20 _token,
        uint256 _openingTime,
        uint256 _closingTime,
        uint256 _cap,
        address _tokenAdd
    ) 
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_openingTime, _closingTime)
    CappedCrowdsale(_cap)
    AllowanceCrowdsale(_wallet)

    public
    {
    }
}
