pragma solidity ^0.5.0; 

contract fisrtCoin {

    address deployer; 
    mapping(address=>uint) balances;  

    public function fisrtcoin() {
        deployer = msg.sender;  
    }



    public function giveCoin(uint amount, address receiver) {
      if(msg.sender == deployer){
          balances[receiver] += amount;
      }
      else {
          throw; 
      }
    }

    public function viewBalance() returns (uint) {
        return balances[msg.sender];
    }
}
