pragma solidity >= 0.8.0 < 0.9.0;
contract StoreData  {
  function OnlyTrueUserCanCall() public view returns(bool){
    if(msg.sender.code.length==0){
      return(true);
      
    }else{
      return(false);
    
    }
  }
}
