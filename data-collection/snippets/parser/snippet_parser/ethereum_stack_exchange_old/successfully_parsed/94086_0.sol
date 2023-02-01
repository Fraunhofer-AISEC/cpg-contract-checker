pragma solidity ^0.5.5;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "@openzeppelin/contracts/crowdsale/emission/AllowanceCrowdsale.sol";
import "@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "@openzeppelin/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "@openzeppelin/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract Sale is Crowdsale, AllowanceCrowdsale, TimedCrowdsale, CappedCrowdsale, RefundableCrowdsale {  
    constructor(
    uint256 _rate,
    address payable _wallet,
    ERC20 _token,
    address _tokenWallet,
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _cap,
    uint256 _goal
  )
    AllowanceCrowdsale(_tokenWallet)
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    TimedCrowdsale(_openingTime, _closingTime)
    RefundableCrowdsale(_goal)
    public
    {
    require(_goal <= _cap);  
    }
   
}
