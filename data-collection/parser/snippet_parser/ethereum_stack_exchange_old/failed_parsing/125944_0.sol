    fallback() payable external{            
    require(msg.value > minvalue, "ERROR !");
    uint256 sentByUser = msg.value ;  
    int requiredTokenAmount =  /* some logic /* ; 
    _token.transfer(msg.sender, uint256(requiredTokenAmount));  
   
     }
