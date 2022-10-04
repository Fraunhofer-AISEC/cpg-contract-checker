    pragma solidity ^0.4.4;
    contract ContractONE {    
       uint public i;
       function register(uint _i) payable{
          if(msg.value > 1 ether){
             i = _i;
          } else {revert();}
        }
       ...
    }
