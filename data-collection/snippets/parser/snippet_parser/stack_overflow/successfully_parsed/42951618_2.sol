contract Shareholder {

   uint public shareBalance; 

    
    function getShareBalance() constant returns (uint balance){
      return shareBalance;
    }
}
