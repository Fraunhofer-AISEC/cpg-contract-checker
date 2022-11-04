contract Contract{
  address minter;
  uint gid;

  

  
  function Contract(){
    minter=msg.sender;
    gid=0;
  }
  function kill(){
    if (msg.sender == minter){
      suicide(minter);
    }
  }

  function createAgreement(string name){
      
      

      gid++;   
  }
}