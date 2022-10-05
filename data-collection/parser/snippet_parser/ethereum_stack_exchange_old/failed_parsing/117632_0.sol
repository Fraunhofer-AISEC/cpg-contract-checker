pragma solidity ^0.6.0;

contract ReavealMeASecret{
  address payable public whoNeed;
  string secret= "blabla";
  bool payment;

  event Reveal(uint _amount);

  constructor () public {
      whoNeed = msg.sender;
      payment = false;
  }

  modifier OnlyIfWhoNeed (address _whoNeed){
      require (msg.sender == _whoNeed, "Non ti è dato saperlo");
      _;
  }
  modifier Amount(uint _amount){
      require (msg.value >= _amount, "Se il segreto vuoi sapere, il soldo giusto devi avere");
      _;
  }

  receive() external payable OnlyIfWhoNeed Amount(2 Ether){
      owner.transfer (msg.value);
      payment = true;
      emit Reveal(msg.value);
  }
