uint splitValue = uint(msg.value/beneficiaryList.length);
     for (uint index = 0; index < beneficiaryList.length; index++) { 
     beneficiaryList [index].transfer(SplitValue); 

     if(participants[msg.sender] != 0){
     beneficiaryList [index] != (msg.sender); }
