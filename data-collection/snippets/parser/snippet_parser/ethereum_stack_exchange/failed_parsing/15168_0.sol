pragma solidity ^0.4.8;

contract Bank{       
    address client;
    uint gainedWei;
    function pay() payable {
       client    = msg.sender;
       gainedWei = msg.value;
    }
    function payMeBack() {
     if(<some condition check>)
        
    }
}
