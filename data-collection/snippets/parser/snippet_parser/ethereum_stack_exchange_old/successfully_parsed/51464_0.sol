pragma solidity ^0.4.23;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC827/ERC827Token.sol";
import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract GenericToken is ERC827Token, Ownable {


  string public name        = "Generic Token";
  string public symbol      = "GEN";
  uint8  public decimals    = 8;


  uint256 public initialSupply = 1000000000 * 10 ** uint256(decimals); 
  uint256 public totalAirdropTokens = 800000000 * 10 ** uint256(decimals); 
  uint256 public totalBonusTokens   =  100000000 * 10 ** uint256(decimals); 
  uint256 public tokensForTeam   =  50000000 * 10 ** uint256(decimals); 
  uint256 public tokensForPool  =  50000000 * 10 ** uint256(decimals); 

  mapping(address => bool) blacklist;

  enum blacklistToggle { screen, unscreen }
  blacklistToggle public blacklistState = blacklistToggle.screen;

  address public receiver = 0x5087293ecbbDE04da046250C270b02Cf9b6fB657;

  uint256 alreadyAirdroppedTokens;
  uint256 alreadyIssuedBonusTokens;


    
  uint256 public airDropRoundOneTime;
  uint256 public airDropRoundTwoTime;
  uint256 public airDropRoundThreeTime;
  uint256 public airDropEndTime;

  uint256 public bonusPrice1 = 0.006 ether;
  uint256 public bonusPrice2 = 0.01  ether;
  uint256 public bonusPrice3 = 0.016 ether;

  uint256 public bonusAmount1 = 50000;
  uint256 public bonusAmount2 = 30000;
  uint256 public bonusAmount3 = 20000;

  uint256 public dropAmount;


  constructor (uint256 _dropAmount, 
                  uint256 _airDropRoundOneTime, 
                    uint256 _airDropRoundTwoTime, 
                    uint256 _airDropRoundThreeTime,
                    uint256 _airDropEndTime ) public {

    totalSupply_ = initialSupply;
    dropAmount = _dropAmount;

    airDropRoundOneTime   = _airDropRoundOneTime;
    airDropRoundTwoTime   = _airDropRoundTwoTime;
    airDropRoundThreeTime = _airDropRoundThreeTime;
    airDropEndTime        = _airDropEndTime;

    
    
  }


  function setBonusAmounts(uint256 _bonusAmount1, uint256 _bonusAmount2, uint256 _bonusAmount3) public onlyOwner {
    bonusAmount1 = _bonusAmount1;
    bonusAmount2 = _bonusAmount2;
    bonusAmount3 = _bonusAmount3;
  }


  function setRoundTwoTime(uint256 _newRound2Time) public onlyOwner {
    airDropRoundTwoTime = _newRound2Time;
  }


  function setRoundThreeTime(uint256 _newRound3Time) public onlyOwner {
    airDropRoundThreeTime = _newRound3Time;
  }

  function setBlacklistMode(uint intToggle, uint256 _dropAmount) public onlyOwner {
    blacklistToggle _blacklistState;

    if (uint(blacklistToggle.screen) == intToggle) {
      _blacklistState = blacklistToggle.screen;

    } else if (uint(blacklistToggle.unscreen) == intToggle) {
      _blacklistState = blacklistToggle.unscreen;
    }

    blacklistState = _blacklistState;
    dropAmount = _dropAmount;
  } 





  function() external payable {
    claimAirdrop(msg.sender);    
  }


  function claimAirdrop(address _beneficiary) public payable {

    uint256 weiAmount = msg.value;
    uint256 tokens;

    require(validTransaction());

    if (blacklistState == blacklistToggle.unscreen) {
      blacklist[_beneficiary] = false;
    }

    if (weiAmount < bonusPrice1) {
      require(totalAirdropTokens > alreadyAirdroppedTokens);
      require(!blacklist[_beneficiary]);

      tokens = dropAmount;
      transfer(_beneficiary, tokens);

      blacklist[_beneficiary] = true; 

      totalAirdropTokens += dropAmount;

      }
    if ( (weiAmount >= bonusPrice1) && (weiAmount < bonusPrice2) ) {

      require(alreadyIssuedBonusTokens < totalBonusTokens);
      tokens = bonusAmount1;

      transfer(_beneficiary, tokens);

      alreadyIssuedBonusTokens += bonusAmount1;     
      }
    if ((weiAmount >= bonusPrice2) && (weiAmount < bonusPrice3)) {

      tokens = bonusAmount2;

      require(alreadyIssuedBonusTokens < totalBonusTokens);

      transferFrom(owner, _beneficiary, tokens);

      alreadyIssuedBonusTokens += bonusAmount2; 

      } else {
      require(alreadyIssuedBonusTokens < totalBonusTokens);

      tokens = bonusAmount3;

      transfer(_beneficiary, tokens);

      alreadyIssuedBonusTokens += bonusAmount3; 

    }

    _forwardFunds();
  }



  function validTransaction() internal view returns (bool) {
    bool withinPeriod = now >= airDropRoundOneTime && now <= airDropEndTime;
    return withinPeriod;
  }

  function _forwardFunds() internal {
    receiver.transfer(msg.value);
  }





}  
