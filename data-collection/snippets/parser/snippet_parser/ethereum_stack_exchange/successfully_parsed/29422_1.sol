pragma solidity ^0.4.4;
import './Betslip.sol';

contract BetslipFactory{
  mapping (address => Betslip) betslipMapping;

  function newBetSlip(uint _stake, address _opponent) {
    Betslip b = new Betslip(_stake, _opponent);
    betslipMapping[address(b)] = b;
  }

  function getBetSlipData(address _betslip) constant returns (address,uint8,address){

    Betslip b = betslipMapping[_betslip];
    return (address(b),b.getStake(),b.getOpponent());
  }

}
