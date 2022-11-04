
pragma solidity ^0.8.13;


interface simpleToken {
 function destroy(address _addr) external ;
}


contract Recovery {
  
  simpleToken public token;


  constructor() public payable {
    token = simpleToken(0x35CEA6A258535bF93b54cc8aA37177Ba82857697);
  }


  function destroy(address _to) public  {
   
     token.destroy(_to);
  }
}
