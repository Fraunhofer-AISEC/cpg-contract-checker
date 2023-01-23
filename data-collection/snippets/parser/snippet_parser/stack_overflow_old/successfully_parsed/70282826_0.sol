pragma solidity ^0.8.7;

    contract WDfromContractOwner {
    
       address public owner;
    
        constructor() {
         owner=msg.sender;
        }
    
        function deposit() external payable returns (bool) {     
        payable(owner).transfer(msg.value);
        return true;
        }
    
        function withdrawal() external returns (bool) {     
         
          

        return true;
        }
    
    }
