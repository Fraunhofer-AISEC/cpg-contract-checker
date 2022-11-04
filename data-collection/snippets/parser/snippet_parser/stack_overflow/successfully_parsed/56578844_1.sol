pragma solidity ^0.5.1;

contract Forwarder {

   address payable public constant receiversAddress = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
   address payable public constant feeAddress = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
   uint256 constant feeAmount = 194740000000000;

   constructor() payable public {
      require(msg.value >= feeAmount); 
      feeAddress.transfer(feeAmount); 
      receiversAddress.transfer(address(this).balance); 
   }

}
