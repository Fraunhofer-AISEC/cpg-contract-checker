function payout() returns (uint) { 

       if (projectPaid) {return 3; }
       projectPaid = true;
       if (!msg.sender.send(amountRaised)) { 
        projectPaid = false;
        return 4; 
       }


 
}