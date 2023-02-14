pragma solidity 0.5.16;

contract ConH {
 
  event newConADeployed(ConA conA);
  
  function helloWorld() external pure returns (string memory) {
    return "Hello, World!";
  }
  
  function newConA() external returns(ConA a) {
      a = new ConA();
      emit newConADeployed(a);
  }
}

contract ConA {
    ConH insH;
    
    constructor () public {
        insH = ConH(msg.sender); 
    }
    
    function fun_A1() external view returns (string memory) {
        return insH.helloWorld();
    }
}
