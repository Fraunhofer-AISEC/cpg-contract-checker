pragma solidity ^0.4.23; 

import "./MyContract.sol";  

contract MyFactory {  
   address[] public myContracts;    

   
   event ContractCreated(address _sender, string _stringOne, , string _stringTwo, string _ stringThree);

   function createContract(string stringOne, string stringTwo, string stringThree) public {          
       address sender = msg.sender;     
       address newContract = new MyContract(sender, stringOne, stringTwo, stringThree);            
       myContracts.push(newContract);  

       
       emit ContractCreated(sender, stringOne, stringTwo, stringThree);
   }    

   function getAllContracts() public view returns(address[]) {     
       return myContracts;   
   } 
} 
