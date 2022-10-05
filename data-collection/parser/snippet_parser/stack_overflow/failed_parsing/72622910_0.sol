int256 payableMints = int256(_mintAmount - freeMints);

   if(payableMints < 0){
       payableMints = 0;
   }
   
   if(payableMints > 0){
       require(msg.value >= (cost * uint256(payableMints)));
   }
   else{
       require(msg.value >= (freeMintCost * _mintAmount));
   }
