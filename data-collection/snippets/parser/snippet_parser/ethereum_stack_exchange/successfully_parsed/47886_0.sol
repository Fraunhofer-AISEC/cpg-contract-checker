pragma solidity ^0.4.0;
contract Ballot {

   function sendRequestToPay( uint256 etheramount1,address receiver) payable{

                  receiver.transfer(etheramount1);
     }
 }
