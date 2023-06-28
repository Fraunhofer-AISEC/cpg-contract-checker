   bool isSent = payable(receiver).send(10);
   require (isSent, "Sending funds unsuccessfull");
