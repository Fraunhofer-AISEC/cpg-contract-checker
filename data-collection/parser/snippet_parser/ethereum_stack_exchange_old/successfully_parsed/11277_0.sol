pragma solidity ^0.4.2;

contract Transfer {

        address public userA;
        address public user;
        mapping (address => uint) balances;
        uint value2;

       

       function Transfer() {
              userA=msg.sender;
              balances[userA]=1000;     
       }

      function sendEther(address user,uint value)returns (bool success){

             if(balances[userA]< value){
                      return false;
             }
             else {
                      balances[userA] -= value;
                      balances[user] += value;
              return true;
             }
   }
   function sendAddressToAddress(address fromuser,address touser)returns      (bool success){
            uint value=balances[fromuser];
            if(value < 0){
                return false;
            }
            else {
                balances[fromuser] -= value;
                balances[touser] += value;
                return true;
            }
  }
  function getBalance(address user) returns (uint _balance){
           return balances[user];
  }
}


 contract SecondTransfer {

 function sendEtherCall(address contractaddr,address user,uint value) returns (bool success) {
      Transfer transfer=Transfer(contractaddr);
      return transfer.sendEther(user,value);
}
function sendAddressToAddressCall(address contractaddr,address fromuser,address touser) returns (bool success) {
      Transfer transfer=Transfer(contractaddr);
      return transfer.sendAddressToAddress(fromuser,touser);
}
function getBalanceCall(address contractaddr,address user) returns (uint _balance) {
      Transfer transfer=Transfer(contractaddr);
      return transfer.getBalance(user);
  }

 }
