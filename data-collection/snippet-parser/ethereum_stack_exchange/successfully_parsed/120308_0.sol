contract coin{
    address public minting;
   mapping (address=> uint) public balances;
event sent(address from, address to, uint amount);
   constructor(){
       minting = msg.sender;
   }
   function mint(address receiver, uint amount) public{
       require(msg.sender == minting)
       balances[receiver] = balances[receiver]+amount;
       
   }
   error insufficientbalance(uint req, uint ava);
   function sent(address receiver, uint amount) public {
       if (amount > balances[msg.sender])
       revert insufficientbalance(
           {
               req: amount,
               ava: balances[msg.sender]
           }
       );
       balances[msg.sender]-= amount;
       balances[receiver]+= amount;
     emit sent(msg.sender, receiver, amount);
   }

}
