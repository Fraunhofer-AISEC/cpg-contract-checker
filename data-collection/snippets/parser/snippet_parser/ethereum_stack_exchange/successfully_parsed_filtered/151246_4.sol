 contract storage_contract{
   
   function _addmoney(address user, uint _money)public returns(uint){
     return balances[user] += _money;
   }
 }
 contract dex1{
   
   function addmoney(uint amount)public returns(uint){
       uint balance = contractaddress._addmoney(msg.sender, amount);
       return balance;

   }
}