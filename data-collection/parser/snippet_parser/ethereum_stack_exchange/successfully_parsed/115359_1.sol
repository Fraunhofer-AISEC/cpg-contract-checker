   function getRemaining() public view returns(uint remaining){
       remaining = 2000000000000000000 - balances[msg.sender];
   }
