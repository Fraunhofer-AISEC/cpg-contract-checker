pragma solidity ^0.4.13;

contract Conference { 

   address public organizer;
   mapping (address => uint) public registrantsPaid;
   uint public numRegistrants;
    uint quota = 2000;
   

   function buyTicket() payable public returns (bool success) { 
        require(numRegistrants >= quota);
        registrantsPaid[msg.sender] = msg.value;
         numRegistrants++;
         return true;
   }

   

  function destroy() { 
     if (msg.sender == organizer) {
        suicide(organizer); 
     }
  }

  function getContractBalance() constant returns (uint){
    return this.balance;    
  }

}
