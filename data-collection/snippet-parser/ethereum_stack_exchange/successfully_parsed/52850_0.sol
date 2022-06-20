pragma solidity ^0.4.23; 

import "./MyContract.sol";  

contract MyFactory {  
    address[] public myContracts;    

    function createContract(string stringOne, string stringTwo, string stringThree) public {          
        address sender = msg.sender;     
        address newContract = new MyContract(sender, stringOne, stringTwo, stringThree);            
        myContracts.push(newContract);   
    }    

    function getAllContracts() public view returns(address[]) {     
        return myContracts;   
    } 
} 
