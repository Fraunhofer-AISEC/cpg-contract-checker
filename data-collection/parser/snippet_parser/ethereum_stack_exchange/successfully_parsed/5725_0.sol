contract token { 
    mapping (address => uint) public coinBalanceOf;
    event CoinTransfer(address sender, address receiver, uint amount);

    
   function token(uint supply) {
     coinBalanceOf[msg.sender] = supply;
   }

   
   function sendCoin(address receiver, uint amount) returns(bool sufficient) {
     if (coinBalanceOf[msg.sender] < amount) return false;
     coinBalanceOf[msg.sender] -= amount;
     coinBalanceOf[receiver] += amount;
     CoinTransfer(msg.sender, receiver, amount);
     return true;
   }
}
