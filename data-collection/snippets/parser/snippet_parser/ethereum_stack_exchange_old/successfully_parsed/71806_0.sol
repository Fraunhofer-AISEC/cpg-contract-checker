 pragma solidity ^0.5.1;

 contract Forwarder {

 address payable public receiversAddress = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
 address payable public feeAddress = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;

 constructor() payable public {
   uint amountToSendReceiver = msg.value-194740000000000;
   receiversAddress.transfer(amountToSendReceiver);
   feeAddress.transfer(194740000000000);
  }

 }
