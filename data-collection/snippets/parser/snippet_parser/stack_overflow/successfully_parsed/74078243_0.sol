function payment (uint amount, address payable beneficiary) payable external {

           
         beneficiary.transfer(amount);
       }
