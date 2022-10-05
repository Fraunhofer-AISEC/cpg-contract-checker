contract Conference { 

   address public organizer;
   mapping (address => uint) public registrantsPaid;
   uint public numRegistrants;

   

   function buyTicket() public returns (bool success) { 
     if (numRegistrants >= quota) { 
         return false; 
     }
     else {
         registrantsPaid[msg.sender] = msg.value;
         numRegistrants++;
         return true;
     }
   }

   

  function destroy() { 
     if (msg.sender == organizer) {
        suicide(organizer); 
     }
  }
}
